package com.getjar.sdk.data.usage;

import android.database.Cursor;
import com.getjar.sdk.utilities.StringUtility;

public class AggregateSession {
    private final long _id;
    private final String _packageName;
    private final long _timestampLastStart;
    private final long _timestampLastStop;
    private final long _timestampStart;
    private final long _timestampStop;
    private final int _totalSessionsCount;
    private final int _totalUseDuration;
    private final long _windowId;

    protected AggregateSession(long id, long windowId, String packageName, long timestampStart, long timestampStop, int totalUseDuration, int totalSessionsCount, long timestampLastStart, long timestampLastStop) {
        if (id < 0) {
            throw new IllegalArgumentException("'id' cannot be negative");
        } else if (windowId < 0) {
            throw new IllegalArgumentException("'windowId' cannot be negative");
        } else if (StringUtility.isNullOrEmpty(packageName)) {
            throw new IllegalArgumentException("'packageName' cannot be NULL or empty");
        } else if (timestampStart < 0) {
            throw new IllegalArgumentException("'timestampStart' cannot be negative");
        } else if (timestampStop < 0) {
            throw new IllegalArgumentException("'timestampStop' cannot be negative");
        } else if (totalUseDuration < 0) {
            throw new IllegalArgumentException("'totalUseDuration' cannot be negative");
        } else if (totalSessionsCount < 0) {
            throw new IllegalArgumentException("'totalSessionsCount' cannot be negative");
        } else if (timestampLastStart < 0) {
            throw new IllegalArgumentException("'timestampLastStart' cannot be negative");
        } else if (timestampLastStop < 0) {
            throw new IllegalArgumentException("'timestampLastStop' cannot be negative");
        } else {
            this._id = id;
            this._windowId = windowId;
            this._packageName = packageName;
            this._timestampStart = timestampStart;
            this._timestampStop = timestampStop;
            this._totalUseDuration = totalUseDuration;
            this._totalSessionsCount = totalSessionsCount;
            this._timestampLastStart = timestampLastStart;
            this._timestampLastStop = timestampLastStop;
        }
    }

    protected AggregateSession(Cursor cursor) {
        this(cursor.getLong(0), cursor.getLong(1), cursor.getString(2), cursor.getLong(3), cursor.getLong(4), cursor.getInt(5), cursor.getInt(6), cursor.getLong(7), cursor.getLong(8));
    }

    public long getId() {
        return this._id;
    }

    public long getWindowId() {
        return this._windowId;
    }

    public String getPackageName() {
        return this._packageName;
    }

    public long getTimestampStart() {
        return this._timestampStart;
    }

    public long getTimestampStop() {
        return this._timestampStop;
    }

    public int getTotalUseDuration() {
        return this._totalUseDuration;
    }

    public int getTotalSessionsCount() {
        return this._totalSessionsCount;
    }

    public long getTimestampLastStart() {
        return this._timestampLastStart;
    }

    public long getTimestampLastStop() {
        return this._timestampLastStop;
    }
}
