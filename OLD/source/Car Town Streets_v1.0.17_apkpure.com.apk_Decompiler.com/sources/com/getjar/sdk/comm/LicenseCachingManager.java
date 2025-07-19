package com.getjar.sdk.comm;

import com.getjar.sdk.License;
import com.getjar.sdk.data.CacheEntry;
import com.getjar.sdk.data.CachingManager;
import com.getjar.sdk.data.LicenseInternal;
import com.getjar.sdk.exceptions.CachingException;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import com.getjar.sdk.utilities.Base64;
import com.getjar.sdk.utilities.StringUtility;
import java.io.IOException;
import java.net.URI;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Locale;

public class LicenseCachingManager {
    private static final int _LRUCapMaximum = 200;
    private final CachingManager _cachingManager;
    private String cacheNamespace = "commLicenseCache";

    public LicenseCachingManager(CommContext commContext) {
        if (commContext == null) {
            throw new IllegalArgumentException("'androidContext' can not be NULL");
        }
        this._cachingManager = new CachingManager(commContext, this.cacheNamespace);
    }

    private static String getCacheKey(String itemId, License.LicenseScope licenseScope) {
        if (StringUtility.isNullOrEmpty(itemId)) {
            throw new IllegalArgumentException("'itemId' cannot be null or empty");
        } else if (licenseScope == null) {
            throw new IllegalArgumentException("licenseScope cannot be null");
        } else {
            return String.format(Locale.US, "%s%s", new Object[]{itemId, licenseScope.toString()});
        }
    }

    private static String getCacheKey(LicenseInternal license) {
        if (license != null) {
            return getCacheKey(license.getItemId(), license.getLicenseScope());
        }
        throw new IllegalArgumentException("internalLicense cannot be null");
    }

    public void addLicenseToCache(LicenseInternal license, Long ttl, String eTag) {
        if (license == null) {
            throw new IllegalArgumentException("license cannot be null");
        }
        Logger.d(Area.LICENSING.value() | Area.STORAGE.value(), "LicenseCachingManager -- addLicenseToCache -- started " + license.getLicenseId());
        LicenseInternal internalLicense = getCachedLicense(license.getItemId(), license.getLicenseScope());
        if (internalLicense == null || !internalLicense.getModificationTime().after(license.getModificationTime())) {
            if (ttl == null) {
                Logger.w(Area.LICENSING.value() | Area.STORAGE.value(), "LicenseCachingManager -- addLicenseToCache ttl is null, using default");
                ttl = 86400000L;
            }
            Logger.d(Area.LICENSING.value() | Area.STORAGE.value(), " LicenseCachingManager -- addLicenseToCache TTL" + ttl);
            try {
                this._cachingManager.updateCache(getCacheKey(license), Base64.encodeObject(license), ttl, eTag, (URI) null);
            } catch (IOException e) {
                Logger.e(Area.LICENSING.value() | Area.STORAGE.value(), "LicenseCachingManager -- addLicenseToCache -- Error", e);
                throw new CachingException((Throwable) e);
            }
        } else {
            Logger.d(Area.LICENSING.value() | Area.STORAGE.value(), "LicenseCachingManager -- addLicenseToCache New license already in cache");
        }
    }

    public LicenseInternal getCachedLicense(String itemId, License.LicenseScope licenseScope) {
        try {
            CacheEntry cacheEntry = this._cachingManager.getCacheEntry(getCacheKey(itemId, licenseScope));
            if (cacheEntry != null) {
                LicenseInternal license = (LicenseInternal) Base64.decodeToObject(cacheEntry.getValue());
                license.setLicenseStale(cacheEntry.hasTtlExpired());
                return license;
            }
        } catch (Exception e) {
            Logger.e(Area.LICENSING.value() | Area.STORAGE.value(), "LicenseCachingManager: getCachedLicense() failed", e);
        }
        return null;
    }

    public LicenseInternal getValidCachedLicense(String itemId, License.LicenseScope licenseScope) {
        Logger.d(Area.LICENSING.value() | Area.STORAGE.value(), "LicenseCachingManager -- getCachedLicense started for " + itemId);
        try {
            CacheEntry cacheEntry = this._cachingManager.getCacheEntry(getCacheKey(itemId, licenseScope));
            if (cacheEntry != null && !cacheEntry.hasTtlExpired()) {
                Logger.v(Area.LICENSING.value() | Area.STORAGE.value(), String.format(Locale.US, "LicenseCachingManager: getValidCachedLicense() Found a cached result for itemId %1$s", new Object[]{itemId}));
                LicenseInternal license = (LicenseInternal) Base64.decodeToObject(cacheEntry.getValue());
                license.setLicenseStale(false);
                return license;
            }
        } catch (Exception e) {
            Logger.e(Area.LICENSING.value() | Area.STORAGE.value(), "LicenseCachingManager: getCachedLicense() failed", e);
        }
        return null;
    }

    public LicensesWithETag getAllLicenses() {
        String eTag = null;
        ArrayList<LicenseInternal> licenses = new ArrayList<>();
        try {
            ArrayList<CacheEntry> cacheEntries = this._cachingManager.getAllCacheEntries();
            if (cacheEntries != null) {
                for (int i = 0; i < cacheEntries.size(); i++) {
                    CacheEntry cacheEntry = cacheEntries.get(i);
                    if (StringUtility.isNullOrEmpty(eTag)) {
                        eTag = cacheEntry.getEtag();
                    }
                    if (cacheEntry != null) {
                        LicenseInternal license = (LicenseInternal) Base64.decodeToObject(cacheEntry.getValue());
                        license.setLicenseStale(false);
                        licenses.add(license);
                    }
                }
            }
            return new LicensesWithETag(licenses, eTag);
        } catch (Exception e) {
            throw new CachingException((Throwable) e);
        }
    }

    public boolean hasExpiredEntry() {
        try {
            ArrayList<CacheEntry> cacheEntries = this._cachingManager.getAllCacheEntries();
            if (cacheEntries != null) {
                for (int i = 0; i < cacheEntries.size(); i++) {
                    if (cacheEntries.get(i).hasTtlExpired()) {
                        return true;
                    }
                }
            }
            return false;
        } catch (Exception e) {
            throw new CachingException((Throwable) e);
        }
    }

    public class LicensesWithETag {
        public final String eTag;
        public final List<LicenseInternal> licenses;

        public LicensesWithETag(List<LicenseInternal> licenses2, String eTag2) {
            this.licenses = Collections.unmodifiableList(licenses2);
            this.eTag = eTag2;
        }
    }

    public void removeCachedLicense(LicenseInternal license) {
        if (license == null) {
            throw new IllegalArgumentException("license cannot be null");
        }
        this._cachingManager.removeCacheEntry(getCacheKey(license));
    }

    public void trimLruEntries() {
        this._cachingManager.trimLruEntries(_LRUCapMaximum);
    }
}
