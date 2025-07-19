package com.getjar.sdk.comm;

import com.getjar.sdk.data.CacheEntry;
import com.getjar.sdk.data.CachingManager;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import com.getjar.sdk.utilities.StringUtility;
import java.net.URI;
import java.util.Locale;

public class LocalizationCachingManager {
    private static final int _LRUCapMaximum = 500;
    private final CachingManager _cachingManager;
    private String cacheNamespace = "commLocalizationCache";

    public LocalizationCachingManager(CommContext commContext) {
        if (commContext == null) {
            throw new IllegalArgumentException("'androidContext' can not be NULL");
        }
        this._cachingManager = new CachingManager(commContext.getApplicationContext(), this.cacheNamespace);
    }

    public void addPricingToCache(String theLookup, int recommendedPrice, Long ttl, String eTag) {
        if (StringUtility.isNullOrEmpty(theLookup)) {
            throw new IllegalArgumentException("theLookup cannot be null or empty");
        } else if (recommendedPrice < 0) {
            throw new IllegalArgumentException("recommendedPrice cannot be less than 0");
        } else {
            addPricingToCache(theLookup, Integer.toString(recommendedPrice), ttl, eTag);
        }
    }

    public void addPricingToCache(String theLookup, String price, Long ttl, String eTag) {
        if (StringUtility.isNullOrEmpty(theLookup)) {
            throw new IllegalArgumentException("theLookup cannot be null or empty");
        } else if (StringUtility.isNullOrEmpty(price)) {
            throw new IllegalArgumentException("recommendedPrice cannot be null or empty");
        } else {
            Logger.d(Area.LOCALIZATION.value() | Area.STORAGE.value(), "LocalizationCachingManager -- addPricingToCache -- started ");
            if (ttl == null) {
                Logger.e(Area.LOCALIZATION.value() | Area.STORAGE.value(), "LocalizationCachingManager -- addLicenseToCache ttl cannot be null");
                ttl = 86400000L;
            }
            this._cachingManager.updateCache(theLookup, price, ttl, eTag, (URI) null);
        }
    }

    public Integer getCachedPrice(String theLookup) {
        if (StringUtility.isNullOrEmpty(theLookup)) {
            throw new IllegalArgumentException("'theLookup' cannot be null or empty");
        }
        String price = getCachedPriceInternal(theLookup, false);
        if (price != null) {
            return Integer.valueOf(Integer.parseInt(price));
        }
        return null;
    }

    public Integer getValidCachedPrice(String theLookup) {
        if (StringUtility.isNullOrEmpty(theLookup)) {
            throw new IllegalArgumentException("'theLookup' cannot be null or empty");
        }
        String price = getCachedPriceInternal(theLookup, true);
        if (price != null) {
            return Integer.valueOf(Integer.parseInt(price));
        }
        return null;
    }

    public String getCachedPriceInternal(String theLookup, boolean onlyValid) {
        if (StringUtility.isNullOrEmpty(theLookup)) {
            throw new IllegalArgumentException("'theLookup' cannot be null or empty");
        }
        CacheEntry cacheEntry = null;
        try {
            CacheEntry cacheEntry2 = this._cachingManager.getCacheEntry(theLookup);
            if (cacheEntry2 != null && (!onlyValid || (onlyValid && !cacheEntry2.hasTtlExpired()))) {
                return cacheEntry2.getValue();
            }
        } catch (Exception e) {
            String cacheValue = null;
            if (cacheEntry != null) {
                cacheValue = cacheEntry.getValue();
            }
            Logger.w(Area.LOCALIZATION.value() | Area.STORAGE.value(), String.format(Locale.US, "LocalizationCachingManager: getCachedPrice() failed for key[=%s] value[=%s]. Returning default value[null]", new Object[]{theLookup, cacheValue}), e);
        }
        return null;
    }

    public void removeCachedPricing(String pricing) {
        if (pricing == null) {
            throw new IllegalArgumentException("pricing cannot be null");
        }
        this._cachingManager.removeCacheEntry(pricing);
    }

    public void trimLruEntries() {
        this._cachingManager.trimLruEntries(500);
    }
}
