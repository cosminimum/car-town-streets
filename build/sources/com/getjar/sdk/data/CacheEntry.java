package com.getjar.sdk.data;

import android.database.Cursor;
import com.getjar.sdk.utilities.StringUtility;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.Locale;

public class CacheEntry {
    private final Long _createTimestamp;
    private final String _etag;
    private int _id;
    private final Long _lastUpdated;
    private final String _name;
    private final Long _ttl;
    private final URI _uri;
    private final String _value;

    /* access modifiers changed from: protected */
    public int getId() {
        return this._id;
    }

    public String getName() {
        return this._name;
    }

    public String getValue() {
        return this._value;
    }

    public Long getTtl() {
        return this._ttl;
    }

    public URI getUri() {
        return this._uri;
    }

    public String getEtag() {
        return this._etag;
    }

    public Long getCreateTimestamp() {
        return this._createTimestamp;
    }

    public Long getLastUpdated() {
        return this._lastUpdated;
    }

    protected CacheEntry(String name, String value, Long ttl, String eTag, URI uri) {
        if (StringUtility.isNullOrEmpty(name)) {
            throw new IllegalArgumentException("'name' can not be NULL or empty");
        } else if (ttl == null) {
            throw new IllegalArgumentException("'ttl' can not be NULL");
        } else {
            this._name = name;
            this._value = value;
            this._createTimestamp = Long.valueOf(System.currentTimeMillis());
            this._lastUpdated = this._createTimestamp;
            this._ttl = ttl;
            this._uri = uri;
            this._etag = eTag;
        }
    }

    protected CacheEntry(Cursor dbCursor) throws URISyntaxException {
        if (dbCursor == null) {
            throw new IllegalArgumentException("'dbCursor' can not be NULL");
        } else if (dbCursor.isBeforeFirst() || dbCursor.isAfterLast()) {
            throw new IllegalArgumentException("'dbCursor' must already be pointing to a valid record");
        } else {
            this._id = dbCursor.getInt(0);
            this._name = dbCursor.getString(1);
            if (!dbCursor.isNull(2)) {
                this._value = dbCursor.getString(2);
            } else {
                this._value = null;
            }
            this._createTimestamp = Long.valueOf(dbCursor.getLong(3));
            this._lastUpdated = Long.valueOf(dbCursor.getLong(4));
            this._ttl = Long.valueOf(dbCursor.getLong(5));
            if (!dbCursor.isNull(6)) {
                String uriStr = dbCursor.getString(6);
                if (!StringUtility.isNullOrEmpty(uriStr)) {
                    this._uri = new URI(uriStr);
                } else {
                    this._uri = null;
                }
            } else {
                this._uri = null;
            }
            if (!dbCursor.isNull(7)) {
                this._etag = dbCursor.getString(7);
            } else {
                this._etag = null;
            }
        }
    }

    public boolean hasTtlExpired() {
        return getLastUpdated().longValue() + getTtl().longValue() < System.currentTimeMillis();
    }

    public String toString() {
        return String.format(Locale.US, "%1$s = %2$s [lastUpdated:%3$d ttl:%4$d etag:%5$s uri:%6$s]", new Object[]{this._name, this._value, this._lastUpdated, this._ttl, this._etag, this._uri});
    }
}
