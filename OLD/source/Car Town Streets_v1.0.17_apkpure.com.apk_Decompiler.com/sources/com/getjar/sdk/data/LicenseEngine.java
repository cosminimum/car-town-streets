package com.getjar.sdk.data;

import com.facebook.internal.ServerProtocol;
import com.getjar.sdk.GetJarException;
import com.getjar.sdk.License;
import com.getjar.sdk.comm.CommContext;
import com.getjar.sdk.comm.LicenseCachingManager;
import com.getjar.sdk.comm.LicenseServiceProxy;
import com.getjar.sdk.comm.Result;
import com.getjar.sdk.comm.ResultCachingManager;
import com.getjar.sdk.comm.auth.AuthManager;
import com.getjar.sdk.comm.auth.ClaimsManager;
import com.getjar.sdk.data.LicenseInternal;
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
import java.util.List;
import java.util.Locale;
import java.util.concurrent.ExecutionException;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

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
        } else if (licenseScope == null) {
            throw new IllegalArgumentException("licenseScope cannot be null");
        } else {
            Logger.i(Area.LICENSING.value(), String.format(Locale.US, "LicenseEngine -- acquireUnmanagedProductLicense started for %s", new Object[]{itemId}));
            if (this.claimsManager.canModifyUnmanagedLicenses()) {
                LicenseInternal license = getLicenseCachingManager().getCachedLicense(itemId, licenseScope);
                if (license != null && license.getLicenseState().equals(LicenseInternal.ExternalLicenseState.ACQUIRED) && !license.isStale() && license.getInternalLicenseState().equals(LicenseInternal.InternalLicenseState.SYNCED)) {
                    return license;
                }
                if (license == null) {
                    license = updateLicenseState(itemId, licenseScope, LicenseInternal.InternalLicenseState.UNSYNCED, (Result) null);
                }
                try {
                    return updateLicenseState(itemId, licenseScope, LicenseInternal.InternalLicenseState.SYNCED, LicenseServiceProxy.getInstance().acquireUnmanagedProductLicense(this._commContext, itemId, licenseScope, new HashMap()).get());
                } catch (ExecutionException e) {
                    Logger.e(Area.LICENSING.value(), "LicenseEngine acquireUnmanagedProductLicense -- Error", e);
                    return license;
                } catch (InterruptedException e2) {
                    Logger.e(Area.LICENSING.value(), "LicenseEngine acquireUnmanagedProductLicense -- Error", e2);
                    return license;
                }
            } else {
                Logger.e(Area.LICENSING.value(), "LicenseEngine acquireUnmanagedProductLicense Not having required claims!!");
                return null;
            }
        }
    }

    public ArrayList<LicenseInternal> getUnmanagedProductLicenses(String[] itemIds) throws InterruptedException {
        Logger.i(Area.LICENSING.value(), "LicenseEngine -- getUnmanagedProductLicenses started");
        if (this.claimsManager.canUseUnmanagedLicenses()) {
            ArrayList<LicenseInternal> licenses = getUnmanagedProductLicensesInternal(itemIds);
            if (!licenses.isEmpty()) {
                return licenses;
            }
            retrieveServerProductLicenses(true);
            return getUnmanagedProductLicensesInternal(itemIds);
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
            for (License.LicenseScope scope : License.LicenseScope.values()) {
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
        if (!(result == null || result.getResponseJson() == null || !this.claimsManager.canModifyUnmanagedLicenses())) {
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
        } else if (licenseScope == null) {
            throw new IllegalArgumentException("transaction cannot be null");
        } else if (internalLicenseState == null) {
            throw new IllegalArgumentException("internalLicenseState cannot be null");
        } else if (this._commContext.getAppEncryptionPublicKey() == null) {
            throw new IllegalStateException("Unable to use licensing. encryptionKey not provided through GetJarContext");
        } else {
            Logger.i(Area.LICENSING.value(), String.format(Locale.US, "LicenseEngine -- updateLicenseState -- started for %s", new Object[]{itemId}));
            if (this.claimsManager.canModifyUnmanagedLicenses()) {
                String eTag = ResultCachingManager.getETagFromResult(result);
                Long ttl = ResultCachingManager.getTtlFromResult(result);
                if (internalLicenseState.equals(LicenseInternal.InternalLicenseState.UNSYNCED)) {
                    license = new LicenseInternal(Constants.LICENSE_RESERVE_ID, "android", licenseScope, itemId, LicenseInternal.ExternalLicenseState.ACQUIRED, LicenseInternal.LicenseType.UNMANAGED, new Date(), new Date(), new Date());
                    license.setInternalLicenseState(internalLicenseState);
                } else if (result == null) {
                    throw new IllegalArgumentException("result cannot be null");
                } else {
                    LicenseInternal license2 = getLicenseCachingManager().getCachedLicense(itemId, licenseScope);
                    String hashKey = itemId + licenseScope.name();
                    try {
                        String signature = result.getResponseJson().getJSONObject("return").getString("signature");
                        AuthManager.initialize(this._commContext.getApplicationContext());
                        if (!Security.verifySignature(this._commContext.getAppEncryptionPublicKey(), LicenseServiceProxy.generateSignDataForAcquire(AuthManager.getInstance().getUserDeviceId(), itemId, licenseScope, this._commContext.removeNonce(hashKey), this._commContext.removeSignature(hashKey)), signature)) {
                            throw new SigningException("Failed to validate the signature. Licensing failed");
                        }
                        license = getLicenseFromJson(result.getResponseJson().getJSONObject("return").getJSONObject("license"));
                        license.setInternalLicenseState(internalLicenseState);
                        license.setLastServerSyncTimeInternal();
                    } catch (JSONException e) {
                        throw new SigningException("Invalid server response. Licensing failed.");
                    } catch (JSONException e2) {
                        throw new GetJarException((Throwable) e2);
                    }
                }
                getLicenseCachingManager().addLicenseToCache(license, ttl, eTag);
                return license;
            }
            Logger.e(Area.LICENSING.value(), "LicenseEngine updateLicenseState Not having required claims!!");
            return null;
        }
    }

    public Boolean isUnmanagedProductLicensed(String itemId) throws InterruptedException {
        if (StringUtility.isNullOrEmpty(itemId)) {
            throw new IllegalArgumentException("itemId cannot be empty or null");
        }
        Logger.i(Area.LICENSING.value(), String.format(Locale.US, "LicenseEngine -- isUnmanagedProductLicensed started for %s", new Object[]{itemId}));
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
        Logger.i(Area.LICENSING.value() | Area.STORAGE.value(), String.format(Locale.US, "LicenseEngine -- isUnmanagedProductLicensedInternal started for %s", new Object[]{itemId}));
        for (License.LicenseScope licenseScope : License.LicenseScope.values()) {
            LicenseInternal license = getLicenseCachingManager().getCachedLicense(itemId, licenseScope);
            if (license != null && license.getLicenseState().equals(LicenseInternal.ExternalLicenseState.ACQUIRED)) {
                return true;
            }
        }
        return false;
    }

    /* JADX WARNING: type inference failed for: r0v19, types: [java.util.List<com.getjar.sdk.data.LicenseInternal>] */
    /* JADX WARNING: Multi-variable type inference failed */
    /* JADX WARNING: Removed duplicated region for block: B:30:0x00cc A[SYNTHETIC, Splitter:B:30:0x00cc] */
    /* JADX WARNING: Removed duplicated region for block: B:34:0x00d6 A[Catch:{ ExecutionException -> 0x018e, JSONException -> 0x015b }] */
    /* JADX WARNING: Removed duplicated region for block: B:36:0x00dc A[Catch:{ ExecutionException -> 0x018e, JSONException -> 0x015b }] */
    /* JADX WARNING: Removed duplicated region for block: B:78:0x01cd A[Catch:{ ExecutionException -> 0x018e, JSONException -> 0x015b }] */
    /* JADX WARNING: Removed duplicated region for block: B:87:0x0244 A[Catch:{ ExecutionException -> 0x018e, JSONException -> 0x015b }] */
    /* JADX WARNING: Removed duplicated region for block: B:96:0x028f A[Catch:{ ExecutionException -> 0x018e, JSONException -> 0x015b }] */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void retrieveServerProductLicenses(boolean r38) throws java.lang.InterruptedException {
        /*
            r37 = this;
            com.getjar.sdk.logging.Area r2 = com.getjar.sdk.logging.Area.LICENSING
            long r2 = r2.value()
            java.lang.String r4 = "LicenseEngine -- retrieveServerProductLicenses started"
            com.getjar.sdk.logging.Logger.d(r2, r4)
            r0 = r37
            com.getjar.sdk.comm.auth.ClaimsManager r2 = r0.claimsManager
            boolean r2 = r2.canUseUnmanagedLicenses()
            if (r2 == 0) goto L_0x02b4
            r0 = r37
            com.getjar.sdk.comm.CommContext r2 = r0._commContext
            java.security.PublicKey r2 = r2.getAppEncryptionPublicKey()
            if (r2 != 0) goto L_0x002b
            com.getjar.sdk.logging.Area r2 = com.getjar.sdk.logging.Area.LICENSING
            long r2 = r2.value()
            java.lang.String r4 = "LicenseEngine: Unable to use licensing features as appEncryptionPublicKey not provided through GetJarContext"
            com.getjar.sdk.logging.Logger.d(r2, r4)
        L_0x002a:
            return
        L_0x002b:
            java.lang.Object r36 = retrieveLock
            monitor-enter(r36)
            r0 = r37
            com.getjar.sdk.comm.CommContext r2 = r0._commContext     // Catch:{ all -> 0x0166 }
            android.content.Context r2 = r2.getApplicationContext()     // Catch:{ all -> 0x0166 }
            java.lang.String r3 = "GetJarClientPrefs"
            r4 = 0
            android.content.SharedPreferences r29 = r2.getSharedPreferences(r3, r4)     // Catch:{ all -> 0x0166 }
            java.lang.String r2 = "licenseCheckTimestamp"
            r3 = 0
            r0 = r29
            long r33 = r0.getLong(r2, r3)     // Catch:{ all -> 0x0166 }
            long r2 = java.lang.System.currentTimeMillis()     // Catch:{ all -> 0x0166 }
            r4 = 1000(0x3e8, double:4.94E-321)
            long r9 = r2 / r4
            r0 = r37
            com.getjar.sdk.comm.CommContext r2 = r0._commContext     // Catch:{ NumberFormatException -> 0x0169 }
            r3 = 0
            com.getjar.sdk.comm.GetJarConfig r2 = com.getjar.sdk.comm.GetJarConfig.getInstance(r2, r3)     // Catch:{ NumberFormatException -> 0x0169 }
            java.lang.String r3 = "license.refresh.interval"
            java.lang.String r2 = r2.getDirectiveValue(r3)     // Catch:{ NumberFormatException -> 0x0169 }
            java.lang.Long r2 = java.lang.Long.valueOf(r2)     // Catch:{ NumberFormatException -> 0x0169 }
            long r23 = r2.longValue()     // Catch:{ NumberFormatException -> 0x0169 }
        L_0x0066:
            r0 = r37
            com.getjar.sdk.comm.CommContext r2 = r0._commContext     // Catch:{ NumberFormatException -> 0x017c }
            r3 = 0
            com.getjar.sdk.comm.GetJarConfig r2 = com.getjar.sdk.comm.GetJarConfig.getInstance(r2, r3)     // Catch:{ NumberFormatException -> 0x017c }
            java.lang.String r3 = "license.ignore.request.interval"
            java.lang.String r2 = r2.getDirectiveValue(r3)     // Catch:{ NumberFormatException -> 0x017c }
            java.lang.Long r2 = java.lang.Long.valueOf(r2)     // Catch:{ NumberFormatException -> 0x017c }
            long r20 = r2.longValue()     // Catch:{ NumberFormatException -> 0x017c }
        L_0x007d:
            com.getjar.sdk.comm.LicenseCachingManager r2 = r37.getLicenseCachingManager()     // Catch:{ all -> 0x0166 }
            boolean r2 = r2.hasExpiredEntry()     // Catch:{ all -> 0x0166 }
            if (r2 != 0) goto L_0x0095
            long r2 = r9 - r33
            int r2 = (r2 > r23 ? 1 : (r2 == r23 ? 0 : -1))
            if (r2 > 0) goto L_0x0095
            if (r38 == 0) goto L_0x02a6
            long r2 = r9 - r33
            int r2 = (r2 > r20 ? 1 : (r2 == r20 ? 0 : -1))
            if (r2 <= 0) goto L_0x02a6
        L_0x0095:
            com.getjar.sdk.comm.LicenseCachingManager r2 = r37.getLicenseCachingManager()     // Catch:{ all -> 0x0166 }
            com.getjar.sdk.comm.LicenseCachingManager$LicensesWithETag r25 = r2.getAllLicenses()     // Catch:{ all -> 0x0166 }
            java.util.ArrayList r26 = new java.util.ArrayList     // Catch:{ all -> 0x0166 }
            r26.<init>()     // Catch:{ all -> 0x0166 }
            r6 = 0
            r35 = 0
            r14 = 0
            r32 = 0
            r0 = r25
            java.util.List<com.getjar.sdk.data.LicenseInternal> r2 = r0.licenses     // Catch:{ all -> 0x0166 }
            r0 = r37
            r0.acquireUnsyncedLicenses(r2)     // Catch:{ all -> 0x0166 }
        L_0x00b1:
            com.getjar.sdk.comm.LicenseServiceProxy r2 = com.getjar.sdk.comm.LicenseServiceProxy.getInstance()     // Catch:{ all -> 0x0166 }
            r0 = r37
            com.getjar.sdk.comm.CommContext r3 = r0._commContext     // Catch:{ all -> 0x0166 }
            r4 = 0
            r5 = 0
            r7 = 50
            r0 = r25
            java.lang.String r8 = r0.eTag     // Catch:{ all -> 0x0166 }
            com.getjar.sdk.comm.Operation r28 = r2.getUnmanagedProductLicenses(r3, r4, r5, r6, r7, r8)     // Catch:{ all -> 0x0166 }
            r6 = 0
            com.getjar.sdk.comm.Result r31 = r28.get()     // Catch:{ ExecutionException -> 0x018e }
            if (r35 != 0) goto L_0x00d0
            java.lang.Long r35 = com.getjar.sdk.comm.ResultCachingManager.getTtlFromResult((com.getjar.sdk.comm.Operation) r28)     // Catch:{ all -> 0x0166 }
        L_0x00d0:
            boolean r2 = com.getjar.sdk.utilities.StringUtility.isNullOrEmpty(r14)     // Catch:{ all -> 0x0166 }
            if (r2 == 0) goto L_0x00da
            java.lang.String r14 = com.getjar.sdk.comm.ResultCachingManager.getETagFromResult((com.getjar.sdk.comm.Operation) r28)     // Catch:{ all -> 0x0166 }
        L_0x00da:
            if (r31 == 0) goto L_0x0244
            boolean r2 = r31.isSuccessfulResponse()     // Catch:{ all -> 0x0166 }
            if (r2 == 0) goto L_0x0226
            org.json.JSONObject r2 = r31.getResponseJson()     // Catch:{ all -> 0x0166 }
            r0 = r37
            java.util.ArrayList r18 = r0.getUnmanagedProductLicensesFromJson(r2)     // Catch:{ all -> 0x0166 }
            org.json.JSONObject r2 = r31.getResponseJson()     // Catch:{ JSONException -> 0x0195 }
            java.lang.String r3 = "return"
            org.json.JSONObject r2 = r2.getJSONObject(r3)     // Catch:{ JSONException -> 0x0195 }
            java.lang.String r3 = "ct"
            java.lang.String r6 = r2.getString(r3)     // Catch:{ JSONException -> 0x0195 }
        L_0x00fc:
            if (r32 != 0) goto L_0x01af
            org.json.JSONObject r2 = r31.getResponseJson()     // Catch:{ JSONException -> 0x015b }
            java.lang.String r3 = "return"
            org.json.JSONObject r2 = r2.getJSONObject(r3)     // Catch:{ JSONException -> 0x015b }
            java.lang.String r3 = "signature"
            java.lang.String r32 = r2.getString(r3)     // Catch:{ JSONException -> 0x015b }
            org.json.JSONObject r2 = r31.getResponseJson()     // Catch:{ JSONException -> 0x015b }
            java.lang.String r3 = "return"
            org.json.JSONObject r2 = r2.getJSONObject(r3)     // Catch:{ JSONException -> 0x015b }
            java.lang.String r3 = "nonce"
            java.lang.String r27 = r2.getString(r3)     // Catch:{ JSONException -> 0x015b }
            r0 = r37
            com.getjar.sdk.comm.CommContext r2 = r0._commContext     // Catch:{ JSONException -> 0x015b }
            r0 = r27
            java.lang.String r30 = r2.removeSignature(r0)     // Catch:{ JSONException -> 0x015b }
            r0 = r37
            com.getjar.sdk.comm.CommContext r2 = r0._commContext     // Catch:{ JSONException -> 0x015b }
            android.content.Context r2 = r2.getApplicationContext()     // Catch:{ JSONException -> 0x015b }
            com.getjar.sdk.comm.auth.AuthManager.initialize(r2)     // Catch:{ JSONException -> 0x015b }
            com.getjar.sdk.comm.auth.AuthManager r2 = com.getjar.sdk.comm.auth.AuthManager.getInstance()     // Catch:{ JSONException -> 0x015b }
            java.lang.String r2 = r2.getUserDeviceId()     // Catch:{ JSONException -> 0x015b }
            r0 = r27
            r1 = r30
            java.lang.String r11 = com.getjar.sdk.comm.LicenseServiceProxy.generateSignDataForGet(r2, r0, r1)     // Catch:{ JSONException -> 0x015b }
            r0 = r37
            com.getjar.sdk.comm.CommContext r2 = r0._commContext     // Catch:{ JSONException -> 0x015b }
            java.security.PublicKey r2 = r2.getAppEncryptionPublicKey()     // Catch:{ JSONException -> 0x015b }
            r0 = r32
            boolean r2 = com.getjar.sdk.utilities.Security.verifySignature(r2, r11, r0)     // Catch:{ JSONException -> 0x015b }
            if (r2 != 0) goto L_0x01a4
            com.getjar.sdk.exceptions.SigningException r2 = new com.getjar.sdk.exceptions.SigningException     // Catch:{ JSONException -> 0x015b }
            java.lang.String r3 = "Failed to validate the signature. Licensing failed"
            r2.<init>((java.lang.String) r3)     // Catch:{ JSONException -> 0x015b }
            throw r2     // Catch:{ JSONException -> 0x015b }
        L_0x015b:
            r12 = move-exception
            r32 = 0
            com.getjar.sdk.exceptions.SigningException r2 = new com.getjar.sdk.exceptions.SigningException     // Catch:{ all -> 0x0166 }
            java.lang.String r3 = "signature not found in response. Licensing failed."
            r2.<init>((java.lang.String) r3)     // Catch:{ all -> 0x0166 }
            throw r2     // Catch:{ all -> 0x0166 }
        L_0x0166:
            r2 = move-exception
            monitor-exit(r36)     // Catch:{ all -> 0x0166 }
            throw r2
        L_0x0169:
            r16 = move-exception
            com.getjar.sdk.logging.Area r2 = com.getjar.sdk.logging.Area.LICENSING     // Catch:{ all -> 0x0166 }
            long r2 = r2.value()     // Catch:{ all -> 0x0166 }
            java.lang.String r4 = "LicenseEngine retrieveServerProductLicenses licenseRefreshInterval"
            r0 = r16
            com.getjar.sdk.logging.Logger.e(r2, r4, r0)     // Catch:{ all -> 0x0166 }
            r23 = 86400(0x15180, double:4.26873E-319)
            goto L_0x0066
        L_0x017c:
            r16 = move-exception
            com.getjar.sdk.logging.Area r2 = com.getjar.sdk.logging.Area.LICENSING     // Catch:{ all -> 0x0166 }
            long r2 = r2.value()     // Catch:{ all -> 0x0166 }
            java.lang.String r4 = "LicenseEngine retrieveServerProductLicenses licenseRefreshInterval"
            r0 = r16
            com.getjar.sdk.logging.Logger.e(r2, r4, r0)     // Catch:{ all -> 0x0166 }
            r20 = 300(0x12c, double:1.48E-321)
            goto L_0x007d
        L_0x018e:
            r13 = move-exception
            com.getjar.sdk.exceptions.CommunicationException r2 = new com.getjar.sdk.exceptions.CommunicationException     // Catch:{ all -> 0x0166 }
            r2.<init>((java.lang.Throwable) r13)     // Catch:{ all -> 0x0166 }
            throw r2     // Catch:{ all -> 0x0166 }
        L_0x0195:
            r12 = move-exception
            r6 = 0
            com.getjar.sdk.logging.Area r2 = com.getjar.sdk.logging.Area.LICENSING     // Catch:{ all -> 0x0166 }
            long r2 = r2.value()     // Catch:{ all -> 0x0166 }
            java.lang.String r4 = "LicenseEngine retrieveServerProductLicenses -- ct not found"
            com.getjar.sdk.logging.Logger.d(r2, r4, r12)     // Catch:{ all -> 0x0166 }
            goto L_0x00fc
        L_0x01a4:
            com.getjar.sdk.logging.Area r2 = com.getjar.sdk.logging.Area.LICENSING     // Catch:{ JSONException -> 0x015b }
            long r2 = r2.value()     // Catch:{ JSONException -> 0x015b }
            java.lang.String r4 = "LicenseEngine retrieve signature verified"
            com.getjar.sdk.logging.Logger.d(r2, r4)     // Catch:{ JSONException -> 0x015b }
        L_0x01af:
            boolean r2 = r26.isEmpty()     // Catch:{ all -> 0x0166 }
            if (r2 == 0) goto L_0x021e
            r26 = r18
        L_0x01b7:
            boolean r2 = com.getjar.sdk.utilities.StringUtility.isNullOrEmpty(r6)     // Catch:{ all -> 0x0166 }
            if (r2 != 0) goto L_0x01c5
            java.lang.String r2 = "null"
            boolean r2 = r6.equals(r2)     // Catch:{ all -> 0x0166 }
            if (r2 == 0) goto L_0x00b1
        L_0x01c5:
            if (r26 == 0) goto L_0x028f
            boolean r2 = r26.isEmpty()     // Catch:{ all -> 0x0166 }
            if (r2 != 0) goto L_0x028f
            com.getjar.sdk.logging.Area r2 = com.getjar.sdk.logging.Area.LICENSING     // Catch:{ all -> 0x0166 }
            long r2 = r2.value()     // Catch:{ all -> 0x0166 }
            java.lang.StringBuilder r4 = new java.lang.StringBuilder     // Catch:{ all -> 0x0166 }
            r4.<init>()     // Catch:{ all -> 0x0166 }
            java.lang.String r5 = "LicenseEngine Adding Licenses to cache: "
            java.lang.StringBuilder r4 = r4.append(r5)     // Catch:{ all -> 0x0166 }
            int r5 = r26.size()     // Catch:{ all -> 0x0166 }
            java.lang.StringBuilder r4 = r4.append(r5)     // Catch:{ all -> 0x0166 }
            java.lang.String r4 = r4.toString()     // Catch:{ all -> 0x0166 }
            com.getjar.sdk.logging.Logger.d(r2, r4)     // Catch:{ all -> 0x0166 }
            java.util.HashSet r22 = new java.util.HashSet     // Catch:{ all -> 0x0166 }
            r22.<init>()     // Catch:{ all -> 0x0166 }
            java.util.Iterator r17 = r26.iterator()     // Catch:{ all -> 0x0166 }
        L_0x01f6:
            boolean r2 = r17.hasNext()     // Catch:{ all -> 0x0166 }
            if (r2 == 0) goto L_0x0251
            java.lang.Object r19 = r17.next()     // Catch:{ all -> 0x0166 }
            com.getjar.sdk.data.LicenseInternal r19 = (com.getjar.sdk.data.LicenseInternal) r19     // Catch:{ all -> 0x0166 }
            java.lang.String r2 = r19.getLicenseId()     // Catch:{ all -> 0x0166 }
            r0 = r22
            r0.add(r2)     // Catch:{ all -> 0x0166 }
            com.getjar.sdk.data.LicenseInternal$InternalLicenseState r2 = com.getjar.sdk.data.LicenseInternal.InternalLicenseState.SYNCED     // Catch:{ all -> 0x0166 }
            r0 = r19
            r0.setInternalLicenseState(r2)     // Catch:{ all -> 0x0166 }
            com.getjar.sdk.comm.LicenseCachingManager r2 = r37.getLicenseCachingManager()     // Catch:{ all -> 0x0166 }
            r0 = r19
            r1 = r35
            r2.addLicenseToCache(r0, r1, r14)     // Catch:{ all -> 0x0166 }
            goto L_0x01f6
        L_0x021e:
            r0 = r26
            r1 = r18
            r0.addAll(r1)     // Catch:{ all -> 0x0166 }
            goto L_0x01b7
        L_0x0226:
            int r2 = r31.getResponseCode()     // Catch:{ all -> 0x0166 }
            r3 = 304(0x130, float:4.26E-43)
            if (r2 != r3) goto L_0x0237
            r0 = r25
            java.util.List<com.getjar.sdk.data.LicenseInternal> r0 = r0.licenses     // Catch:{ all -> 0x0166 }
            r26 = r0
            java.util.ArrayList r26 = (java.util.ArrayList) r26     // Catch:{ all -> 0x0166 }
            goto L_0x01b7
        L_0x0237:
            com.getjar.sdk.logging.Area r2 = com.getjar.sdk.logging.Area.LICENSING     // Catch:{ all -> 0x0166 }
            long r2 = r2.value()     // Catch:{ all -> 0x0166 }
            java.lang.String r4 = "Licensing Error. Please check your application token and encryption key are correct and are intended to work together."
            com.getjar.sdk.logging.Logger.e(r2, r4)     // Catch:{ all -> 0x0166 }
            goto L_0x01b7
        L_0x0244:
            com.getjar.sdk.logging.Area r2 = com.getjar.sdk.logging.Area.LICENSING     // Catch:{ all -> 0x0166 }
            long r2 = r2.value()     // Catch:{ all -> 0x0166 }
            java.lang.String r4 = "LicenseEngine -- retrieveServerProductLicenses NULL result received"
            com.getjar.sdk.logging.Logger.d(r2, r4)     // Catch:{ all -> 0x0166 }
            goto L_0x01b7
        L_0x0251:
            com.getjar.sdk.comm.LicenseCachingManager r2 = r37.getLicenseCachingManager()     // Catch:{ all -> 0x0166 }
            com.getjar.sdk.comm.LicenseCachingManager$LicensesWithETag r25 = r2.getAllLicenses()     // Catch:{ all -> 0x0166 }
            r0 = r25
            java.util.List<com.getjar.sdk.data.LicenseInternal> r2 = r0.licenses     // Catch:{ all -> 0x0166 }
            java.util.Iterator r17 = r2.iterator()     // Catch:{ all -> 0x0166 }
        L_0x0261:
            boolean r2 = r17.hasNext()     // Catch:{ all -> 0x0166 }
            if (r2 == 0) goto L_0x029a
            java.lang.Object r19 = r17.next()     // Catch:{ all -> 0x0166 }
            com.getjar.sdk.data.LicenseInternal r19 = (com.getjar.sdk.data.LicenseInternal) r19     // Catch:{ all -> 0x0166 }
            java.lang.String r2 = r19.getLicenseId()     // Catch:{ all -> 0x0166 }
            r0 = r22
            boolean r2 = r0.contains(r2)     // Catch:{ all -> 0x0166 }
            if (r2 != 0) goto L_0x0261
            com.getjar.sdk.data.LicenseInternal$InternalLicenseState r2 = r19.getInternalLicenseState()     // Catch:{ all -> 0x0166 }
            com.getjar.sdk.data.LicenseInternal$InternalLicenseState r3 = com.getjar.sdk.data.LicenseInternal.InternalLicenseState.SYNCED     // Catch:{ all -> 0x0166 }
            boolean r2 = r2.equals(r3)     // Catch:{ all -> 0x0166 }
            if (r2 == 0) goto L_0x0261
            com.getjar.sdk.comm.LicenseCachingManager r2 = r37.getLicenseCachingManager()     // Catch:{ all -> 0x0166 }
            r0 = r19
            r2.removeCachedLicense(r0)     // Catch:{ all -> 0x0166 }
            goto L_0x0261
        L_0x028f:
            com.getjar.sdk.logging.Area r2 = com.getjar.sdk.logging.Area.LICENSING     // Catch:{ all -> 0x0166 }
            long r2 = r2.value()     // Catch:{ all -> 0x0166 }
            java.lang.String r4 = "LicenseEngine -- retrieveServerProductLicenses no licenses to cache"
            com.getjar.sdk.logging.Logger.d(r2, r4)     // Catch:{ all -> 0x0166 }
        L_0x029a:
            android.content.SharedPreferences$Editor r15 = r29.edit()     // Catch:{ all -> 0x0166 }
            java.lang.String r2 = "licenseCheckTimestamp"
            r15.putLong(r2, r9)     // Catch:{ all -> 0x0166 }
            r15.commit()     // Catch:{ all -> 0x0166 }
        L_0x02a6:
            monitor-exit(r36)     // Catch:{ all -> 0x0166 }
        L_0x02a7:
            com.getjar.sdk.logging.Area r2 = com.getjar.sdk.logging.Area.LICENSING
            long r2 = r2.value()
            java.lang.String r4 = "LicenseEngine -- retrieveServerProductLicenses Done!"
            com.getjar.sdk.logging.Logger.d(r2, r4)
            goto L_0x002a
        L_0x02b4:
            com.getjar.sdk.logging.Area r2 = com.getjar.sdk.logging.Area.LICENSING
            long r2 = r2.value()
            java.lang.String r4 = "LicenseEngine retrieveServerProductLicenses Not having required claims!!"
            com.getjar.sdk.logging.Logger.e(r2, r4)
            goto L_0x02a7
        */
        throw new UnsupportedOperationException("Method not decompiled: com.getjar.sdk.data.LicenseEngine.retrieveServerProductLicenses(boolean):void");
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
            throw new GetJarException((Throwable) e);
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
            return new LicenseInternal(licenseId, platform, licenseScope, licenseJson.getString("item_id"), licenseState, LicenseInternal.LicenseType.valueOf(licenseJson.getString(ServerProtocol.DIALOG_PARAM_TYPE)), Utility.adjustUTCDate(dateFormatter.parse(licenseJson.getString("creation_timestamp"))), Utility.adjustUTCDate(dateFormatter.parse(licenseJson.getString("modification_timestamp"))), new Date());
        } catch (JSONException ex) {
            throw new GetJarException((Throwable) ex);
        } catch (ParseException e) {
            throw new GetJarException((Throwable) e);
        }
    }
}
