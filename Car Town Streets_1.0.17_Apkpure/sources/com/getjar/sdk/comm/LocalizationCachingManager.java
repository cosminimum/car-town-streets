package com.getjar.sdk.comm;

import com.getjar.sdk.data.CacheEntry;
import com.getjar.sdk.data.CachingManager;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import com.getjar.sdk.utilities.StringUtility;
import java.util.Locale;
/* loaded from: classes.dex */
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
        }
        if (recommendedPrice < 0) {
            throw new IllegalArgumentException("recommendedPrice cannot be less than 0");
        }
        addPricingToCache(theLookup, Integer.toString(recommendedPrice), ttl, eTag);
    }

    public void addPricingToCache(String theLookup, String price, Long ttl, String eTag) {
        if (StringUtility.isNullOrEmpty(theLookup)) {
            throw new IllegalArgumentException("theLookup cannot be null or empty");
        }
        if (StringUtility.isNullOrEmpty(price)) {
            throw new IllegalArgumentException("recommendedPrice cannot be null or empty");
        }
        Logger.d(Area.LOCALIZATION.value() | Area.STORAGE.value(), "LocalizationCachingManager -- addPricingToCache -- started ");
        if (ttl == null) {
            Logger.e(Area.LOCALIZATION.value() | Area.STORAGE.value(), "LocalizationCachingManager -- addLicenseToCache ttl cannot be null");
            ttl = 86400000L;
        }
        this._cachingManager.updateCache(theLookup, price, ttl, eTag, null);
    }

    public Integer getCachedPrice(String theLookup) {
        if (StringUtility.isNullOrEmpty(theLookup)) {
            throw new IllegalArgumentException("'theLookup' cannot be null or empty");
        }
        String price = getCachedPriceInternal(theLookup, false);
        if (price == null) {
            return null;
        }
        return Integer.valueOf(Integer.parseInt(price));
    }

    public Integer getValidCachedPrice(String theLookup) {
        if (StringUtility.isNullOrEmpty(theLookup)) {
            throw new IllegalArgumentException("'theLookup' cannot be null or empty");
        }
        String price = getCachedPriceInternal(theLookup, true);
        if (price == null) {
            return null;
        }
        return Integer.valueOf(Integer.parseInt(price));
    }

    public String getCachedPriceInternal(String theLookup, boolean onlyValid) {
        if (StringUtility.isNullOrEmpty(theLookup)) {
            throw new IllegalArgumentException("'theLookup' cannot be null or empty");
        }
        CacheEntry cacheEntry = null;
        try {
            cacheEntry = this._cachingManager.getCacheEntry(theLookup);
            if (cacheEntry != null && (!onlyValid || (onlyValid && !cacheEntry.hasTtlExpired()))) {
                return cacheEntry.getValue();
            }
        } catch (Exception e) {
            String cacheValue = null;
            if (cacheEntry != null) {
                cacheValue = cacheEntry.getValue();
            }
            Logger.w(Area.LOCALIZATION.value() | Area.STORAGE.value(), String.format(Locale.US, "LocalizationCachingManager: getCachedPrice() failed for key[=%s] value[=%s]. Returning default value[null]", theLookup, cacheValue), e);
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
