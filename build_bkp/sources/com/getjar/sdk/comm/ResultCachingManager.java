package com.getjar.sdk.comm;

import android.content.Context;
import com.getjar.sdk.data.CacheEntry;
import com.getjar.sdk.data.CachingManager;
import com.getjar.sdk.exceptions.CachingException;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import com.getjar.sdk.utilities.Base64;
import com.getjar.sdk.utilities.StringUtility;
import java.io.IOException;
import java.net.URISyntaxException;
import java.util.Iterator;
import java.util.Locale;

public class ResultCachingManager {
    private static final int _LRUCapMaximum = 300;
    private final CachingManager _cachingManager;

    public ResultCachingManager(Context androidContext, String cacheNamespace) {
        if (androidContext == null) {
            throw new IllegalArgumentException("'androidContext' can not be NULL");
        }
        this._cachingManager = new CachingManager(androidContext, cacheNamespace);
    }

    public void addResultToCache(Operation operation) {
        Long ttl;
        if (operation == null) {
            throw new IllegalArgumentException("'operation' can not be NULL");
        } else if (operation.getRequest() == null) {
            throw new IllegalStateException("Operation must have a Request");
        } else if (operation.getResult() == null) {
            throw new IllegalStateException(String.format(Locale.US, "Operation %1$d does not yet have a Result", new Object[]{Integer.valueOf(operation.getId())}));
        } else if (operation.getResult().isSuccessfulResponse() && (ttl = getTtlFromResult(operation)) != null) {
            try {
                this._cachingManager.updateCache(getCacheKey(operation.getRequest()), Base64.encodeObject(operation.getResult()), ttl, getETagFromResult(operation), operation.getRequest().getUriForRequest());
            } catch (IOException e) {
                throw new CachingException((Throwable) e);
            } catch (URISyntaxException e2) {
                throw new CachingException((Throwable) e2);
            }
        }
    }

    public Result getRequestResult(Operation operation) {
        try {
            CacheEntry cacheEntry = getCacheEntry(operation.getRequest());
            if (cacheEntry != null && !cacheEntry.hasTtlExpired()) {
                Logger.m646v(Area.COMM.value() | Area.STORAGE.value(), String.format(Locale.US, "ResultCachingManager: getRequestResult() Found a cached result for Request %1$d", new Object[]{Integer.valueOf(operation.getRequest().getId())}));
                return (Result) Base64.decodeToObject(cacheEntry.getValue());
            }
        } catch (Exception e) {
            Logger.m643e(Area.COMM.value() | Area.STORAGE.value(), "ResultCachingManager: getRequestResult() failed", e);
        }
        return null;
    }

    public String getETagFromCache(Operation operation) {
        try {
            CacheEntry cacheEntry = getCacheEntry(operation.getRequest());
            if (cacheEntry != null) {
                return cacheEntry.getEtag();
            }
        } catch (Exception e) {
            Logger.m643e(Area.COMM.value() | Area.STORAGE.value(), "ResultCachingManager: getETag() failed", e);
        }
        return null;
    }

    public void trimLruEntries() {
        this._cachingManager.trimLruEntries(_LRUCapMaximum);
    }

    /* access modifiers changed from: protected */
    public void refreshCacheEntry(Operation operation) {
        if (operation == null) {
            throw new IllegalArgumentException("'operation' can not be NULL");
        } else if (operation.getRequest() == null) {
            throw new IllegalStateException("Operation must have a Request");
        } else if (operation.getResult() == null) {
            throw new IllegalStateException("refreshCacheEntry() can only be called for operations with a result");
        } else if (operation.getResult().getResponseCode() != 304) {
            throw new IllegalStateException("refreshCacheEntry() can only be called for operations with a 304 result");
        } else {
            CacheEntry cacheEntry = getCacheEntry(operation.getRequest());
            if (cacheEntry == null) {
                throw new IllegalStateException(String.format(Locale.US, "Request %1$d received a 304, but no stale cache entry was found", new Object[]{Integer.valueOf(hashCode())}));
            }
            try {
                this._cachingManager.updateCache(cacheEntry.getName(), cacheEntry.getValue(), getTtlFromResult(operation), cacheEntry.getEtag(), cacheEntry.getUri());
                Logger.m644i(Area.COMM.value() | Area.STORAGE.value(), String.format(Locale.US, "ResultCachingManager: refreshCacheEntry() Cache entry updated: %1$s", new Object[]{cacheEntry.toString()}));
            } catch (Exception e) {
                Logger.m643e(Area.COMM.value() | Area.STORAGE.value(), "ResultCachingManager: refreshCacheEntry() Updating the cache entry TTL failed", e);
            }
            try {
                operation.setResult((Result) Base64.decodeToObject(cacheEntry.getValue()));
                if (operation.getResult() == null) {
                    throw new IllegalStateException(String.format(Locale.US, "Found a NULL result in cache for operation %1$d", new Object[]{Integer.valueOf(operation.getId())}));
                }
                Logger.m646v(Area.COMM.value() | Area.STORAGE.value(), String.format(Locale.US, "Operation %1$d received a 304 and has been updated to a cached result with %2$d", new Object[]{Integer.valueOf(operation.getId()), Integer.valueOf(operation.getResult().getResponseCode())}));
            } catch (IOException e2) {
                throw new CachingException((Throwable) e2);
            } catch (ClassNotFoundException e3) {
                throw new CachingException((Throwable) e3);
            }
        }
    }

    public static Long getTtlFromResult(Result result) {
        Long ttl = null;
        if (!(result == null || result.getHeaders() == null || !result.getHeaders().containsKey("Cache-Control") || result.getHeaders().get("Cache-Control") == null || result.getHeaders().get("Cache-Control").size() <= 0)) {
            String cacheControlStr = null;
            Iterator i$ = result.getHeaders().get("Cache-Control").iterator();
            if (i$.hasNext()) {
                cacheControlStr = (String) i$.next();
            }
            if (!StringUtility.isNullOrEmpty(cacheControlStr)) {
                for (String cacheRequestDirective : cacheControlStr.split(",")) {
                    if (cacheRequestDirective != null) {
                        String cacheRequestDirective2 = cacheRequestDirective.trim();
                        if ("no-cache".equalsIgnoreCase(cacheRequestDirective2)) {
                            return null;
                        }
                        String[] nameValue = cacheRequestDirective2.split("=");
                        if (nameValue.length > 1 && nameValue[0] != null && nameValue[1] != null && "max-age".equalsIgnoreCase(nameValue[0].trim())) {
                            try {
                                long ttlInSeconds = Long.parseLong(nameValue[1].trim());
                                if (ttlInSeconds >= 0) {
                                    ttl = Long.valueOf(1000 * ttlInSeconds);
                                }
                            } catch (NumberFormatException e) {
                                Logger.m643e(Area.COMM.value() | Area.STORAGE.value(), "ResultCachingManager: getTtl() Parsing max-age failed", e);
                            }
                        }
                    }
                }
            }
        }
        return ttl;
    }

    public static Long getTtlFromResult(Operation operation) {
        if (operation != null) {
            return getTtlFromResult(operation.getResult());
        }
        throw new IllegalArgumentException("'operation' can not be NULL");
    }

    public static String getETagFromResult(Operation operation) {
        if (operation != null) {
            return getETagFromResult(operation.getResult());
        }
        throw new IllegalArgumentException("'operation' can not be NULL");
    }

    public static String getETagFromResult(Result result) {
        if (result == null || result.getHeaders() == null || !result.getHeaders().containsKey("ETag") || result.getHeaders().get("ETag") == null || result.getHeaders().get("ETag").size() <= 0) {
            return null;
        }
        return (String) result.getHeaders().get("ETag").get(0);
    }

    private CacheEntry getCacheEntry(Request request) {
        return this._cachingManager.getCacheEntry(getCacheKey(request));
    }

    private String getCacheKey(Request request) {
        return String.format(Locale.US, "%1$d", new Object[]{Integer.valueOf(request.getId())});
    }
}
