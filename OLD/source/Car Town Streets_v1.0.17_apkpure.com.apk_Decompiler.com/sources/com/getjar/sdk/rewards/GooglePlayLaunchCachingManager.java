package com.getjar.sdk.rewards;

import android.content.Context;
import com.getjar.sdk.data.CacheEntry;
import com.getjar.sdk.data.CachingManager;
import java.net.URI;

public class GooglePlayLaunchCachingManager {
    private static final int _CacheLRUCap = 10;
    private static final String _CacheNamespace = "google.play.launch.cache";
    private static final long _CacheTTL = 1209600000;
    private final CachingManager _cachingManager;

    public GooglePlayLaunchCachingManager(Context androidContext) {
        this._cachingManager = new CachingManager(androidContext, _CacheNamespace);
    }

    public void update(String packageName, GooglePlayLaunchReason reason) {
        this._cachingManager.updateCache(packageName, reason.name(), Long.valueOf(_CacheTTL), (String) null, (URI) null);
        this._cachingManager.trimLruEntries(10);
    }

    public GooglePlayLaunchReason get(String packageName) {
        CacheEntry cacheEntry = this._cachingManager.getCacheEntry(packageName);
        if (cacheEntry != null) {
            return GooglePlayLaunchReason.valueOf(cacheEntry.getValue());
        }
        return null;
    }

    public void remove(String packageName) {
        this._cachingManager.removeCacheEntry(packageName);
    }
}
