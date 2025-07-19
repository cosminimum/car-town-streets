package com.getjar.sdk.data;

import android.content.Context;
import com.getjar.sdk.comm.CommContext;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import com.getjar.sdk.utilities.StringUtility;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.Locale;
/* loaded from: classes.dex */
public class CachingManager {
    private final DBCache _dbCache;

    public CachingManager(Context androidContext, String namespace) {
        if (androidContext == null) {
            throw new IllegalArgumentException("'androidContext' cannot be NULL");
        }
        if (StringUtility.isNullOrEmpty(namespace)) {
            throw new IllegalArgumentException("'namespace' cannot be NULL or empty");
        }
        this._dbCache = DBCache.getInstanceAllUsers(androidContext, namespace);
    }

    public CachingManager(CommContext commContext, String namespace) {
        if (commContext == null) {
            throw new IllegalArgumentException("'commContext' cannot be NULL");
        }
        if (StringUtility.isNullOrEmpty(namespace)) {
            throw new IllegalArgumentException("'namespace' cannot be NULL or empty");
        }
        this._dbCache = DBCache.getInstanceUserSpecific(commContext.getApplicationContext(), namespace);
    }

    public void updateCache(String name, String value, Long ttl, String eTag, URI uri) {
        if (StringUtility.isNullOrEmpty(name)) {
            throw new IllegalArgumentException("'name' cannot be NULL or empty");
        }
        if (ttl == null) {
            throw new IllegalArgumentException("'ttl' cannot be NULL");
        }
        CacheEntry cacheEntry = new CacheEntry(name, value, ttl, eTag, uri);
        if (!this._dbCache.upsertCacheEntry(cacheEntry)) {
            Logger.e(Area.STORAGE.value(), String.format(Locale.US, "CachingManager: updateCache() Cache entry update failed: %1$s.%2$s", this._dbCache.getDatabaseName(), name));
        } else {
            Logger.d(Area.STORAGE.value(), String.format(Locale.US, "CachingManager: updateCache() Cache entry updated: %1$s.%2$s", this._dbCache.getDatabaseName(), name));
        }
    }

    public CacheEntry getUnexpiredCacheEntry(String name) {
        if (StringUtility.isNullOrEmpty(name)) {
            throw new IllegalArgumentException("'name' cannot be NULL or empty");
        }
        CacheEntry cacheEntry = getCacheEntryInternal(name);
        if (cacheEntry == null || cacheEntry.hasTtlExpired()) {
            return null;
        }
        Logger.v(Area.STORAGE.value(), String.format(Locale.US, "CachingManager: getCurrentCacheEntry() Found a cache entry for %1$s.%2$s", this._dbCache.getDatabaseName(), name));
        return cacheEntry;
    }

    public CacheEntry getCacheEntry(String name) {
        if (StringUtility.isNullOrEmpty(name)) {
            throw new IllegalArgumentException("'name' cannot be NULL or empty");
        }
        CacheEntry cacheEntry = getCacheEntryInternal(name);
        if (cacheEntry == null) {
            return null;
        }
        Logger.v(Area.STORAGE.value(), String.format(Locale.US, "CachingManager: getCacheEntry() Found a cache entry for %1$s.%2$s", this._dbCache.getDatabaseName(), name));
        return cacheEntry;
    }

    public void trimLruEntries(int maxRecordsCap) {
        if (maxRecordsCap < 0) {
            throw new IllegalArgumentException("'maxRecordsCap' cannot be negative");
        }
        this._dbCache.trimLruEntries(maxRecordsCap);
    }

    private CacheEntry getCacheEntryInternal(String name) {
        if (StringUtility.isNullOrEmpty(name)) {
            throw new IllegalArgumentException("'name' cannot be NULL or empty");
        }
        try {
            CacheEntry cacheEntry = this._dbCache.loadCacheEntry(name);
            return cacheEntry;
        } catch (URISyntaxException e) {
            this._dbCache.deleteCacheEntry(name);
            return null;
        }
    }

    public void removeCacheEntry(String name) {
        if (StringUtility.isNullOrEmpty(name)) {
            throw new IllegalArgumentException("name cannot be empty or null");
        }
        this._dbCache.deleteCacheEntry(name);
        Logger.v(Area.STORAGE.value(), String.format(Locale.US, "CachingManager: removeCacheEntry() CacheEntry \"%1$s\" removed", name));
    }

    public void removeCacheEntries() {
        int deleteCount = this._dbCache.deleteCacheEntries();
        Logger.v(Area.STORAGE.value(), String.format(Locale.US, "CachingManager: removeCacheEntries() deleted %1$d entries", Integer.valueOf(deleteCount)));
    }

    public ArrayList<CacheEntry> getAllCacheEntries() throws URISyntaxException {
        ArrayList<CacheEntry> entries = this._dbCache.loadAllCacheEntries();
        if (entries == null) {
            return new ArrayList<>();
        }
        return entries;
    }
}
