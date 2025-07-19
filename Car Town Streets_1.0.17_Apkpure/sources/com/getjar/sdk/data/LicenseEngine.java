package com.getjar.sdk.data;

import android.content.SharedPreferences;
import com.facebook.internal.ServerProtocol;
import com.getjar.sdk.GetJarException;
import com.getjar.sdk.License;
import com.getjar.sdk.comm.CommContext;
import com.getjar.sdk.comm.GetJarConfig;
import com.getjar.sdk.comm.LicenseCachingManager;
import com.getjar.sdk.comm.LicenseServiceProxy;
import com.getjar.sdk.comm.Operation;
import com.getjar.sdk.comm.Result;
import com.getjar.sdk.comm.ResultCachingManager;
import com.getjar.sdk.comm.auth.AuthManager;
import com.getjar.sdk.comm.auth.ClaimsManager;
import com.getjar.sdk.data.LicenseInternal;
import com.getjar.sdk.exceptions.CommunicationException;
import com.getjar.sdk.exceptions.SigningException;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import com.getjar.sdk.utilities.Constants;
import com.getjar.sdk.utilities.Security;
import com.getjar.sdk.utilities.StringUtility;
import com.getjar.sdk.utilities.Utility;
import com.tapjoy.TapjoyConstants;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.ExecutionException;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes.dex */
public class LicenseEngine {
    public static final String PREFS_LICENSE_CHECK_TIMESTAMP = "licenseCheckTimestamp";
    private static volatile Object retrieveLock = new Object();
    private CommContext _commContext;
    private LicenseCachingManager _licenseCachingManager = null;
    private ClaimsManager claimsManager;

    public LicenseEngine(CommContext commContext) {
        if (commContext == null) {
            throw new IllegalArgumentException("'commContext' can not be NULL");
        }
        this._commContext = commContext;
        this.claimsManager = AuthManager.getInstance().getClaimsManager(this._commContext.getApplicationContext());
    }

    private LicenseCachingManager getLicenseCachingManager() {
        if (this._licenseCachingManager == null) {
            this._licenseCachingManager = new LicenseCachingManager(this._commContext);
        }
        return this._licenseCachingManager;
    }

    public LicenseInternal acquireUnmanagedProductLicense(String itemId, License.LicenseScope licenseScope) {
        if (StringUtility.isNullOrEmpty(itemId)) {
            throw new IllegalArgumentException("itemId cannot be null or empty");
        }
        if (licenseScope == null) {
            throw new IllegalArgumentException("licenseScope cannot be null");
        }
        Logger.i(Area.LICENSING.value(), String.format(Locale.US, "LicenseEngine -- acquireUnmanagedProductLicense started for %s", itemId));
        if (this.claimsManager.canModifyUnmanagedLicenses()) {
            LicenseInternal license = getLicenseCachingManager().getCachedLicense(itemId, licenseScope);
            if (license == null || !license.getLicenseState().equals(LicenseInternal.ExternalLicenseState.ACQUIRED) || license.isStale() || !license.getInternalLicenseState().equals(LicenseInternal.InternalLicenseState.SYNCED)) {
                if (license == null) {
                    license = updateLicenseState(itemId, licenseScope, LicenseInternal.InternalLicenseState.UNSYNCED, null);
                }
                Operation operation = LicenseServiceProxy.getInstance().acquireUnmanagedProductLicense(this._commContext, itemId, licenseScope, new HashMap<>());
                try {
                    Result result = operation.mo38get();
                    return updateLicenseState(itemId, licenseScope, LicenseInternal.InternalLicenseState.SYNCED, result);
                } catch (InterruptedException e) {
                    Logger.e(Area.LICENSING.value(), "LicenseEngine acquireUnmanagedProductLicense -- Error", e);
                    return license;
                } catch (ExecutionException e2) {
                    Logger.e(Area.LICENSING.value(), "LicenseEngine acquireUnmanagedProductLicense -- Error", e2);
                    return license;
                }
            }
            return license;
        }
        Logger.e(Area.LICENSING.value(), "LicenseEngine acquireUnmanagedProductLicense Not having required claims!!");
        return null;
    }

    public ArrayList<LicenseInternal> getUnmanagedProductLicenses(String[] itemIds) throws InterruptedException {
        Logger.i(Area.LICENSING.value(), "LicenseEngine -- getUnmanagedProductLicenses started");
        if (this.claimsManager.canUseUnmanagedLicenses()) {
            ArrayList<LicenseInternal> licenses = getUnmanagedProductLicensesInternal(itemIds);
            if (licenses.isEmpty()) {
                retrieveServerProductLicenses(true);
                return getUnmanagedProductLicensesInternal(itemIds);
            }
            return licenses;
        }
        Logger.e(Area.LICENSING.value(), "LicenseEngine getUnmanagedProductLicenses Not having required claims!!");
        return null;
    }

    private ArrayList<LicenseInternal> getUnmanagedProductLicensesInternal(String[] itemIds) {
        if (itemIds == null || itemIds.length <= 0) {
            throw new IllegalArgumentException("itemIds cannot be null or empty");
        }
        Logger.i(Area.LICENSING.value(), "LicenseEngine -- getUnmanagedProductLicensesInternal started");
        ArrayList<LicenseInternal> licenses = new ArrayList<>();
        for (String itemId : itemIds) {
            License.LicenseScope[] arr$ = License.LicenseScope.values();
            for (License.LicenseScope scope : arr$) {
                LicenseInternal license = getLicenseCachingManager().getValidCachedLicense(itemId, scope);
                if (license != null) {
                    licenses.add(license);
                }
            }
        }
        return licenses;
    }

    public LicenseInternal updateLicenseState(Result result) {
        LicenseInternal license = null;
        if (result != null && result.getResponseJson() != null && this.claimsManager.canModifyUnmanagedLicenses()) {
            String eTag = ResultCachingManager.getETagFromResult(result);
            Long ttl = ResultCachingManager.getTtlFromResult(result);
            try {
                if (result.getResponseJson().has("return")) {
                    JSONObject returnObj = result.getResponseJson().getJSONObject("return");
                    if (returnObj.has("license")) {
                        license = getLicenseFromJson(returnObj.getJSONObject("license"));
                    } else if (returnObj.has("signed_data") && returnObj.getJSONObject("signed_data").has("license")) {
                        license = getLicenseFromJson(returnObj.getJSONObject("signed_data").getJSONObject("license"));
                    }
                }
            } catch (JSONException e) {
                Logger.v(Area.LICENSING.value(), "LicenseEngine: updateLicenseState() Result did not contain a license");
            }
            if (license != null) {
                license.setInternalLicenseState(LicenseInternal.InternalLicenseState.SYNCED);
                getLicenseCachingManager().addLicenseToCache(license, ttl, eTag);
            }
        }
        return license;
    }

    public LicenseInternal updateLicenseState(String itemId, License.LicenseScope licenseScope, LicenseInternal.InternalLicenseState internalLicenseState, Result result) {
        LicenseInternal license;
        if (StringUtility.isNullOrEmpty(itemId)) {
            throw new IllegalArgumentException("itemId cannot be null");
        }
        if (licenseScope == null) {
            throw new IllegalArgumentException("transaction cannot be null");
        }
        if (internalLicenseState == null) {
            throw new IllegalArgumentException("internalLicenseState cannot be null");
        }
        if (this._commContext.getAppEncryptionPublicKey() == null) {
            throw new IllegalStateException("Unable to use licensing. encryptionKey not provided through GetJarContext");
        }
        Logger.i(Area.LICENSING.value(), String.format(Locale.US, "LicenseEngine -- updateLicenseState -- started for %s", itemId));
        if (this.claimsManager.canModifyUnmanagedLicenses()) {
            String eTag = ResultCachingManager.getETagFromResult(result);
            Long ttl = ResultCachingManager.getTtlFromResult(result);
            if (internalLicenseState.equals(LicenseInternal.InternalLicenseState.UNSYNCED)) {
                license = new LicenseInternal(Constants.LICENSE_RESERVE_ID, "android", licenseScope, itemId, LicenseInternal.ExternalLicenseState.ACQUIRED, LicenseInternal.LicenseType.UNMANAGED, new Date(), new Date(), new Date());
                license.setInternalLicenseState(internalLicenseState);
            } else if (result == null) {
                throw new IllegalArgumentException("result cannot be null");
            } else {
                getLicenseCachingManager().getCachedLicense(itemId, licenseScope);
                String hashKey = itemId + licenseScope.name();
                try {
                    try {
                        String signature = result.getResponseJson().getJSONObject("return").getString("signature");
                        AuthManager.initialize(this._commContext.getApplicationContext());
                        String data = LicenseServiceProxy.generateSignDataForAcquire(AuthManager.getInstance().getUserDeviceId(), itemId, licenseScope, this._commContext.removeNonce(hashKey), this._commContext.removeSignature(hashKey));
                        if (!Security.verifySignature(this._commContext.getAppEncryptionPublicKey(), data, signature)) {
                            throw new SigningException("Failed to validate the signature. Licensing failed");
                        }
                        license = getLicenseFromJson(result.getResponseJson().getJSONObject("return").getJSONObject("license"));
                        license.setInternalLicenseState(internalLicenseState);
                        license.setLastServerSyncTimeInternal();
                    } catch (JSONException e) {
                        throw new SigningException("Invalid server response. Licensing failed.");
                    }
                } catch (JSONException e2) {
                    throw new GetJarException(e2);
                }
            }
            getLicenseCachingManager().addLicenseToCache(license, ttl, eTag);
            return license;
        }
        Logger.e(Area.LICENSING.value(), "LicenseEngine updateLicenseState Not having required claims!!");
        return null;
    }

    public Boolean isUnmanagedProductLicensed(String itemId) throws InterruptedException {
        if (StringUtility.isNullOrEmpty(itemId)) {
            throw new IllegalArgumentException("itemId cannot be empty or null");
        }
        Logger.i(Area.LICENSING.value(), String.format(Locale.US, "LicenseEngine -- isUnmanagedProductLicensed started for %s", itemId));
        if (this.claimsManager.canUseUnmanagedLicenses()) {
            Boolean isLicensed = isUnmanagedProductLicensedInternal(itemId);
            if (!isLicensed.booleanValue()) {
                retrieveServerProductLicenses(true);
                return isUnmanagedProductLicensedInternal(itemId);
            }
            Logger.d(Area.LICENSING.value(), "License found for " + itemId);
            return isLicensed;
        }
        Logger.e(Area.LICENSING.value(), "LicenseEngine isUnmanagedProductLicensed Not having required claims!!");
        return false;
    }

    private Boolean isUnmanagedProductLicensedInternal(String itemId) {
        if (StringUtility.isNullOrEmpty(itemId)) {
            throw new IllegalArgumentException("itemId cannot be empty or null");
        }
        Logger.i(Area.LICENSING.value() | Area.STORAGE.value(), String.format(Locale.US, "LicenseEngine -- isUnmanagedProductLicensedInternal started for %s", itemId));
        License.LicenseScope[] arr$ = License.LicenseScope.values();
        for (License.LicenseScope licenseScope : arr$) {
            LicenseInternal license = getLicenseCachingManager().getCachedLicense(itemId, licenseScope);
            if (license != null && license.getLicenseState().equals(LicenseInternal.ExternalLicenseState.ACQUIRED)) {
                return true;
            }
        }
        return false;
    }

    public void retrieveServerProductLicenses(boolean forced) throws InterruptedException {
        long licenseRefreshInterval;
        long licenseIgnoreRefreshInterval;
        Logger.d(Area.LICENSING.value(), "LicenseEngine -- retrieveServerProductLicenses started");
        if (this.claimsManager.canUseUnmanagedLicenses()) {
            if (this._commContext.getAppEncryptionPublicKey() == null) {
                Logger.d(Area.LICENSING.value(), "LicenseEngine: Unable to use licensing features as appEncryptionPublicKey not provided through GetJarContext");
                return;
            }
            synchronized (retrieveLock) {
                SharedPreferences prefs = this._commContext.getApplicationContext().getSharedPreferences("GetJarClientPrefs", 0);
                long timeStamp = prefs.getLong(PREFS_LICENSE_CHECK_TIMESTAMP, 0L);
                long currentTimeInSeconds = System.currentTimeMillis() / 1000;
                try {
                    licenseRefreshInterval = Long.valueOf(GetJarConfig.getInstance(this._commContext, false).getDirectiveValue(GetJarConfig.KEY_LICENSE_REFRESH_INTERVAL)).longValue();
                } catch (NumberFormatException ex) {
                    Logger.e(Area.LICENSING.value(), "LicenseEngine retrieveServerProductLicenses licenseRefreshInterval", ex);
                    licenseRefreshInterval = Constants.LICENSE_REFRESH_INTERVAL;
                }
                try {
                    licenseIgnoreRefreshInterval = Long.valueOf(GetJarConfig.getInstance(this._commContext, false).getDirectiveValue(GetJarConfig.KEY_LICENSE_IGNORE_REQUEST_INTERVAL)).longValue();
                } catch (NumberFormatException ex2) {
                    Logger.e(Area.LICENSING.value(), "LicenseEngine retrieveServerProductLicenses licenseRefreshInterval", ex2);
                    licenseIgnoreRefreshInterval = 300;
                }
                if (getLicenseCachingManager().hasExpiredEntry() || currentTimeInSeconds - timeStamp > licenseRefreshInterval || (forced && currentTimeInSeconds - timeStamp > licenseIgnoreRefreshInterval)) {
                    LicenseCachingManager.LicensesWithETag licenseWithETag = getLicenseCachingManager().getAllLicenses();
                    ArrayList<LicenseInternal> licenses = new ArrayList<>();
                    String continuationToken = null;
                    Long ttl = null;
                    String eTag = null;
                    String signature = null;
                    acquireUnsyncedLicenses(licenseWithETag.licenses);
                    do {
                        Operation operation = LicenseServiceProxy.getInstance().getUnmanagedProductLicenses(this._commContext, null, null, continuationToken, 50, licenseWithETag.eTag);
                        continuationToken = null;
                        try {
                            Result result = operation.mo38get();
                            if (ttl == null) {
                                ttl = ResultCachingManager.getTtlFromResult(operation);
                            }
                            if (StringUtility.isNullOrEmpty(eTag)) {
                                eTag = ResultCachingManager.getETagFromResult(operation);
                            }
                            if (result != null) {
                                if (result.isSuccessfulResponse()) {
                                    ArrayList<LicenseInternal> internalLicenses = getUnmanagedProductLicensesFromJson(result.getResponseJson());
                                    try {
                                        continuationToken = result.getResponseJson().getJSONObject("return").getString("ct");
                                    } catch (JSONException e) {
                                        continuationToken = null;
                                        Logger.d(Area.LICENSING.value(), "LicenseEngine retrieveServerProductLicenses -- ct not found", e);
                                    }
                                    if (signature == null) {
                                        try {
                                            signature = result.getResponseJson().getJSONObject("return").getString("signature");
                                            String nonce = result.getResponseJson().getJSONObject("return").getString("nonce");
                                            String requestSignature = this._commContext.removeSignature(nonce);
                                            AuthManager.initialize(this._commContext.getApplicationContext());
                                            String data = LicenseServiceProxy.generateSignDataForGet(AuthManager.getInstance().getUserDeviceId(), nonce, requestSignature);
                                            if (!Security.verifySignature(this._commContext.getAppEncryptionPublicKey(), data, signature)) {
                                                throw new SigningException("Failed to validate the signature. Licensing failed");
                                            }
                                            Logger.d(Area.LICENSING.value(), "LicenseEngine retrieve signature verified");
                                        } catch (JSONException e2) {
                                            throw new SigningException("signature not found in response. Licensing failed.");
                                        }
                                    }
                                    if (licenses.isEmpty()) {
                                        licenses = internalLicenses;
                                    } else {
                                        licenses.addAll(internalLicenses);
                                    }
                                } else if (result.getResponseCode() == 304) {
                                    licenses = (ArrayList) licenseWithETag.licenses;
                                } else {
                                    Logger.e(Area.LICENSING.value(), "Licensing Error. Please check your application token and encryption key are correct and are intended to work together.");
                                }
                            } else {
                                Logger.d(Area.LICENSING.value(), "LicenseEngine -- retrieveServerProductLicenses NULL result received");
                            }
                            if (StringUtility.isNullOrEmpty(continuationToken)) {
                                break;
                            }
                        } catch (ExecutionException e1) {
                            throw new CommunicationException(e1);
                        }
                    } while (!continuationToken.equals("null"));
                    if (licenses != null && !licenses.isEmpty()) {
                        Logger.d(Area.LICENSING.value(), "LicenseEngine Adding Licenses to cache: " + licenses.size());
                        HashSet<String> licenseKeys = new HashSet<>();
                        Iterator i$ = licenses.iterator();
                        while (i$.hasNext()) {
                            LicenseInternal license = i$.next();
                            licenseKeys.add(license.getLicenseId());
                            license.setInternalLicenseState(LicenseInternal.InternalLicenseState.SYNCED);
                            getLicenseCachingManager().addLicenseToCache(license, ttl, eTag);
                        }
                        for (LicenseInternal license2 : getLicenseCachingManager().getAllLicenses().licenses) {
                            if (!licenseKeys.contains(license2.getLicenseId()) && license2.getInternalLicenseState().equals(LicenseInternal.InternalLicenseState.SYNCED)) {
                                getLicenseCachingManager().removeCachedLicense(license2);
                            }
                        }
                    } else {
                        Logger.d(Area.LICENSING.value(), "LicenseEngine -- retrieveServerProductLicenses no licenses to cache");
                    }
                    SharedPreferences.Editor editor = prefs.edit();
                    editor.putLong(PREFS_LICENSE_CHECK_TIMESTAMP, currentTimeInSeconds);
                    editor.commit();
                }
            }
        } else {
            Logger.e(Area.LICENSING.value(), "LicenseEngine retrieveServerProductLicenses Not having required claims!!");
        }
        Logger.d(Area.LICENSING.value(), "LicenseEngine -- retrieveServerProductLicenses Done!");
    }

    private boolean acquireUnsyncedLicenses(List<LicenseInternal> licenses) {
        boolean existsUnsyncedLicense = false;
        for (LicenseInternal license : licenses) {
            if (license.getInternalLicenseState().equals(LicenseInternal.InternalLicenseState.UNSYNCED)) {
                acquireUnmanagedProductLicense(license.getItemId(), license.getLicenseScope());
                existsUnsyncedLicense = true;
            }
        }
        return existsUnsyncedLicense;
    }

    private ArrayList<LicenseInternal> getUnmanagedProductLicensesFromJson(JSONObject licenseJson) {
        if (licenseJson == null) {
            throw new IllegalArgumentException("licenseJson cannot be null");
        }
        ArrayList<LicenseInternal> licenses = new ArrayList<>();
        try {
            JSONArray licenseArray = licenseJson.getJSONObject("return").getJSONArray("licenses");
            for (int i = 0; i < licenseArray.length(); i++) {
                licenses.add(getLicenseFromJson(licenseArray.getJSONObject(i)));
            }
            return licenses;
        } catch (JSONException e) {
            throw new GetJarException(e);
        }
    }

    private static LicenseInternal getLicenseFromJson(JSONObject licenseJson) {
        String licenseId;
        if (licenseJson == null) {
            throw new IllegalArgumentException("'licenseJson' cannot be null");
        }
        SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'", Locale.US);
        try {
            if (licenseJson.has(Constants.APP_ID)) {
                licenseId = licenseJson.getString(Constants.APP_ID);
            } else {
                licenseId = licenseJson.getString("token");
            }
            String platform = licenseJson.getString(TapjoyConstants.TJC_PLATFORM);
            License.LicenseScope licenseScope = License.LicenseScope.valueOf(licenseJson.getString("scope"));
            LicenseInternal.ExternalLicenseState licenseState = LicenseInternal.ExternalLicenseState.valueOf(licenseJson.getString("state"));
            String itemId = licenseJson.getString("item_id");
            String creationTime = licenseJson.getString("creation_timestamp");
            String modificationTime = licenseJson.getString("modification_timestamp");
            LicenseInternal.LicenseType licenseType = LicenseInternal.LicenseType.valueOf(licenseJson.getString(ServerProtocol.DIALOG_PARAM_TYPE));
            LicenseInternal license = new LicenseInternal(licenseId, platform, licenseScope, itemId, licenseState, licenseType, Utility.adjustUTCDate(dateFormatter.parse(creationTime)), Utility.adjustUTCDate(dateFormatter.parse(modificationTime)), new Date());
            return license;
        } catch (ParseException e) {
            throw new GetJarException(e);
        } catch (JSONException ex) {
            throw new GetJarException(ex);
        }
    }
}
