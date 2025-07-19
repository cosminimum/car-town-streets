package com.getjar.sdk.data;

import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import com.getjar.sdk.ConsumableProduct;
import com.getjar.sdk.GetJarContext;
import com.getjar.sdk.GetJarManager;
import com.getjar.sdk.comm.CommContext;
import com.getjar.sdk.comm.CommManager;
import com.getjar.sdk.comm.Operation;
import com.getjar.sdk.comm.Result;
import com.getjar.sdk.comm.VoucherServiceProxy;
import com.getjar.sdk.comm.auth.AndroidAccountUserAuthProvider;
import com.getjar.sdk.comm.auth.AuthManager;
import com.getjar.sdk.comm.auth.EnforcedAccountUserAuthProvider;
import com.getjar.sdk.comm.auth.ProviderHint;
import com.getjar.sdk.comm.auth.ProxyAccountUserAuthProvider;
import com.getjar.sdk.exceptions.AuthException;
import com.getjar.sdk.exceptions.CommunicationException;
import com.getjar.sdk.listener.VoucherRedemptionListener;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import com.getjar.sdk.rewards.GetJarActivity;
import com.getjar.sdk.rewards.JavaScriptAPI;
import com.getjar.sdk.utilities.Constants;
import com.getjar.sdk.utilities.CryptoUtility;
import com.getjar.sdk.utilities.StringUtility;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes.dex */
public class RedemptionEngine {
    public static final String IntentTypeDealRedemption = "redeemDeal";
    public static final String IntentTypeKey = "getjarIntentType";
    public static final String IntentTypeShowCheckout = "showCheckout";
    public static final String IntentTypeShowWallet = "showWallet";
    public static final String IntentVoucherTokenKey = "voucherToken";
    public static final String TestVoucherConsumableSuccess = "00000000-0000-0000-0000-000000000001";
    public static final String TestVoucherGeneralFailure = "00000000-0000-0000-0000-000000000003";
    public static final String TestVoucherInvalidVoucherFailure = "00000000-0000-0000-0000-000000000004";
    public static final String TestVoucherLicensableSuccess = "00000000-0000-0000-0000-000000000002";
    public static final String TestVoucherNetworkFailure = "00000000-0000-0000-0000-000000000005";
    private static final ExecutorService _ExecutorService = Executors.newCachedThreadPool();
    private final String _applicationToken;
    private final Context _context;

    public RedemptionEngine(String applicationToken, Context context) {
        if (context == null) {
            throw new IllegalArgumentException("'context' cannot be NULL");
        }
        this._applicationToken = applicationToken;
        this._context = context;
    }

    public static Intent buildShowWalletIntent(Context context) {
        PackageManager packageManager = context.getApplicationContext().getPackageManager();
        Intent launchIntent = packageManager.getLaunchIntentForPackage(Constants.GREENJAR_PACKAGE);
        if (launchIntent == null) {
            return null;
        }
        launchIntent.putExtra(GetJarManager.GetjarIntentKey, true);
        launchIntent.putExtra(IntentTypeKey, IntentTypeShowWallet);
        launchIntent.addCategory("android.intent.category.LAUNCHER");
        launchIntent.setFlags(874512384);
        return launchIntent;
    }

    public static Intent buildRedeemVoucherIntent(String packageName, String voucherToken, Context context) throws JSONException, NoSuchAlgorithmException, UnsupportedEncodingException {
        Logger.d(Area.REDEEM.value() | Area.OFFER.value(), "RedemptionEngine: buildRedeemVoucherIntent() START");
        if (context == null) {
            throw new IllegalArgumentException("'context' cannot be NULL");
        }
        if (StringUtility.isNullOrEmpty(packageName)) {
            throw new IllegalArgumentException("'packageName' cannot be NULL or empty");
        }
        if (StringUtility.isNullOrEmpty(voucherToken)) {
            throw new IllegalArgumentException("'voucherToken' cannot be NULL or empty");
        }
        UUID.fromString(voucherToken);
        PackageManager packageManager = context.getApplicationContext().getPackageManager();
        Intent redeemIntent = packageManager.getLaunchIntentForPackage(packageName);
        if (redeemIntent == null) {
            throw new IllegalArgumentException(String.format(Locale.US, "The package name '%1$s' is not installed", packageName));
        }
        Logger.d(Area.REDEEM.value() | Area.OFFER.value(), String.format(Locale.US, "RedemptionEngine: buildRedeemVoucherIntent() [packageName:%1$s voucherToken:%2$s]", packageName, voucherToken));
        redeemIntent.putExtra(GetJarManager.GetjarIntentKey, true);
        redeemIntent.putExtra(IntentTypeKey, IntentTypeDealRedemption);
        redeemIntent.putExtra(IntentVoucherTokenKey, voucherToken);
        redeemIntent.putExtra(CommManager.AuthProviderFilterNameKey, "android_account");
        redeemIntent.putExtra(CommManager.AuthProviderFilterDataKey, getProviderFilterJson(context).toString());
        redeemIntent.setFlags(882900992);
        Logger.d(Area.REDEEM.value() | Area.OFFER.value(), "RedemptionEngine: buildRedeemVoucherIntent() FINISH");
        return redeemIntent;
    }

    public static JSONArray getProviderFilterJson(Context context) throws JSONException, NoSuchAlgorithmException, UnsupportedEncodingException {
        AuthManager.initialize(context);
        if (!AuthManager.getInstance().isAuthed()) {
            throw new AuthException("Must already be authed to call 'buildRedeemVoucherIntent()'");
        }
        String userAuthProviderFilter = AuthManager.getInstance().getUserAuthProviderFilter();
        if (!"android_account".equals(userAuthProviderFilter)) {
            if (!StringUtility.isNullOrEmpty(userAuthProviderFilter)) {
                throw new AuthException("Can only call 'buildRedeemVoucherIntent()' when authed via the 'android_account' user auth provider");
            }
            AuthManager.getInstance().fixUpgradedMissingUserAuthProviderFilter("android_account");
        }
        String hashedAccountName = null;
        AndroidAccountUserAuthProvider userAuthProvider = new AndroidAccountUserAuthProvider();
        Map<String, String> hashedAuthData = userAuthProvider.getProxiableAuthData(context);
        if (hashedAuthData != null) {
            String hashedAccountName2 = hashedAuthData.get("android_account.username_data_hash");
            hashedAccountName = hashedAccountName2;
        }
        if (StringUtility.isNullOrEmpty(hashedAccountName)) {
            throw new AuthException("Failed to get hashed provider data");
        }
        String userDeviceId = AuthManager.getInstance().getUserDeviceId();
        String hashedUserDeviceId = CryptoUtility.getSHA256(userDeviceId.toLowerCase(Locale.US));
        Logger.d(Area.REDEEM.value() | Area.OFFER.value(), String.format(Locale.US, "RedemptionEngine: buildRedeemVoucherIntent() [hashedAccountName:%1$s userDeviceId:%2$s hashedUserDeviceId:%3$s]", hashedAccountName, userDeviceId, hashedUserDeviceId));
        JSONArray providerFilterDataJson = new JSONArray();
        JSONObject keyValuePairJson = new JSONObject();
        keyValuePairJson.put("key", "android_account.username_data_hash");
        keyValuePairJson.put("value", hashedAccountName);
        providerFilterDataJson.put(keyValuePairJson);
        JSONObject keyValuePairJson2 = new JSONObject();
        keyValuePairJson2.put("key", ProxyAccountUserAuthProvider._KeyProviderHintUserDeviceHash);
        keyValuePairJson2.put("value", hashedUserDeviceId);
        providerFilterDataJson.put(keyValuePairJson2);
        return providerFilterDataJson;
    }

    public static void showWalletPage(GetJarContext getJarContext) {
        ConsumableProduct dummyProduct = new ConsumableProduct("12312", "lightning Sword", "strike enemy with lightning", 2L);
        Intent intent = new Intent(getJarContext.getAndroidContext(), GetJarActivity.class);
        intent.putParcelableArrayListExtra(Constants.PRODUCT_LIST, new ArrayList<>(Arrays.asList(dummyProduct)));
        intent.putExtra(Constants.GETJAR_CONTEXT_ID_KEY, getJarContext.getGetJarContextId());
        intent.putExtra(Constants.KEY_LANGUAGE, Constants.DEFAULT_LANGUAGE.replace("_", "-"));
        intent.putExtra(Constants.EXTRA_WEBVIEW, true);
        intent.putExtra(IntentTypeKey, IntentTypeShowWallet);
        intent.setFlags(874512384);
        getJarContext.getAndroidContext().startActivity(intent);
        Logger.d(Area.UI.value() | Area.REDEEM.value() | Area.OFFER.value(), "RedemptionEngine: showWalletPage() intent sent");
    }

    /* JADX WARN: Code restructure failed: missing block: B:29:0x0074, code lost:
        r7 = r0.getString("value");
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static void showCheckoutPage(final com.getjar.sdk.GetJarContext r12, android.content.Intent r13) {
        /*
            if (r12 != 0) goto La
            java.lang.IllegalArgumentException r8 = new java.lang.IllegalArgumentException
            java.lang.String r9 = "'getJarContext' cannot be NULL"
            r8.<init>(r9)
            throw r8
        La:
            if (r13 != 0) goto L14
            java.lang.IllegalArgumentException r8 = new java.lang.IllegalArgumentException
            java.lang.String r9 = "'receivedIntent' cannot be NULL"
            r8.<init>(r9)
            throw r8
        L14:
            java.lang.String r8 = "getjar"
            r9 = 0
            boolean r8 = r13.getBooleanExtra(r8, r9)
            if (r8 != 0) goto L25
            java.lang.IllegalArgumentException r8 = new java.lang.IllegalArgumentException
            java.lang.String r9 = "showCheckoutPage() called with a non-Getjar Intent"
            r8.<init>(r9)
            throw r8
        L25:
            java.lang.String r8 = "showCheckout"
            java.lang.String r9 = "getjarIntentType"
            java.lang.String r9 = r13.getStringExtra(r9)
            boolean r8 = r8.equalsIgnoreCase(r9)
            if (r8 != 0) goto L3b
            java.lang.IllegalArgumentException r8 = new java.lang.IllegalArgumentException
            java.lang.String r9 = "showCheckoutPage() called with an non-checkout Intent"
            r8.<init>(r9)
            throw r8
        L3b:
            java.lang.String r8 = "EXTRA_MANAGED_CHECKOUT_DATA"
            java.lang.String r3 = r13.getStringExtra(r8)
            boolean r8 = com.getjar.sdk.utilities.StringUtility.isNullOrEmpty(r3)
            if (r8 == 0) goto L4f
            java.lang.IllegalArgumentException r8 = new java.lang.IllegalArgumentException
            java.lang.String r9 = "showCheckoutPage() called with an Intent that has no checkout data"
            r8.<init>(r9)
            throw r8
        L4f:
            r7 = 0
            java.lang.String r8 = "auth.provider_filter.data"
            java.lang.String r5 = r13.getStringExtra(r8)     // Catch: java.lang.Exception -> L8c
            org.json.JSONArray r4 = new org.json.JSONArray     // Catch: java.lang.Exception -> L8c
            r4.<init>(r5)     // Catch: java.lang.Exception -> L8c
            r2 = 0
        L5c:
            int r8 = r4.length()     // Catch: java.lang.Exception -> L8c
            if (r2 >= r8) goto L7a
            org.json.JSONObject r0 = r4.getJSONObject(r2)     // Catch: java.lang.Exception -> L8c
            java.lang.String r8 = "android_account.username_data_hash"
            java.lang.String r9 = "key"
            java.lang.String r9 = r0.getString(r9)     // Catch: java.lang.Exception -> L8c
            boolean r8 = r8.equalsIgnoreCase(r9)     // Catch: java.lang.Exception -> L8c
            if (r8 == 0) goto L89
            java.lang.String r8 = "value"
            java.lang.String r7 = r0.getString(r8)     // Catch: java.lang.Exception -> L8c
        L7a:
            r6 = r7
            boolean r8 = com.getjar.sdk.utilities.StringUtility.isNullOrEmpty(r6)
            if (r8 == 0) goto La7
            java.lang.IllegalArgumentException r8 = new java.lang.IllegalArgumentException
            java.lang.String r9 = "showCheckoutPage() called with an Intent that has no account name hash"
            r8.<init>(r9)
            throw r8
        L89:
            int r2 = r2 + 1
            goto L5c
        L8c:
            r1 = move-exception
            com.getjar.sdk.logging.Area r8 = com.getjar.sdk.logging.Area.UI
            long r8 = r8.value()
            com.getjar.sdk.logging.Area r10 = com.getjar.sdk.logging.Area.PURCHASE
            long r10 = r10.value()
            long r8 = r8 | r10
            com.getjar.sdk.logging.Area r10 = com.getjar.sdk.logging.Area.OFFER
            long r10 = r10.value()
            long r8 = r8 | r10
            java.lang.String r10 = "RedemptionEngine: showCheckoutPage() failed"
            com.getjar.sdk.logging.Logger.e(r8, r10, r1)
            goto L7a
        La7:
            java.util.concurrent.ExecutorService r8 = com.getjar.sdk.data.RedemptionEngine._ExecutorService
            com.getjar.sdk.data.RedemptionEngine$1 r9 = new com.getjar.sdk.data.RedemptionEngine$1
            r9.<init>()
            r8.execute(r9)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.getjar.sdk.data.RedemptionEngine.showCheckoutPage(com.getjar.sdk.GetJarContext, android.content.Intent):void");
    }

    public static void showCheckoutPageFor34(final GetJarContext getJarContext, Intent receivedIntent) {
        if (getJarContext == null) {
            throw new IllegalArgumentException("'getJarContext' cannot be NULL");
        }
        if (receivedIntent == null) {
            throw new IllegalArgumentException("'receivedIntent' cannot be NULL");
        }
        final String sourceAppToken = receivedIntent.getData().getQueryParameter("sourceAppToken");
        if (StringUtility.isNullOrEmpty(sourceAppToken)) {
            throw new IllegalArgumentException("showCheckoutPageFor34() called with an Intent that has no 'sourceAppToken'");
        }
        final String sourceUserAccessId = receivedIntent.getData().getQueryParameter("sourceUserAccessId");
        if (StringUtility.isNullOrEmpty(sourceUserAccessId)) {
            throw new IllegalArgumentException("showCheckoutPageFor34() called with an Intent that has no 'sourceUserAccessId'");
        }
        final String sourceUserDeviceId = receivedIntent.getData().getQueryParameter("sourceUserDeviceId");
        if (StringUtility.isNullOrEmpty(sourceUserDeviceId)) {
            throw new IllegalArgumentException("showCheckoutPageFor34() called with an Intent that has no 'sourceUserDeviceId'");
        }
        final String managedOfferDetails = receivedIntent.getData().getQueryParameter("managedOfferDetails");
        if (StringUtility.isNullOrEmpty(managedOfferDetails)) {
            throw new IllegalArgumentException("showCheckoutPageFor34() called with an Intent that has no 'managedOfferDetails'");
        }
        _ExecutorService.execute(new Runnable() { // from class: com.getjar.sdk.data.RedemptionEngine.2
            @Override // java.lang.Runnable
            public void run() {
                try {
                    Logger.d(Area.UI.value() | Area.PURCHASE.value() | Area.OFFER.value(), "RedemptionEngine: showCheckoutPageFor34() START");
                    AuthManager.initialize(GetJarContext.this.getAndroidContext());
                    Logger.v(Area.UI.value() | Area.PURCHASE.value() | Area.OFFER.value(), String.format(Locale.US, "RedemptionEngine: showCheckoutPageFor34() [isAuthed:%1$s currentUserAccessId:%2$s sourceUserAccessId:%3$s]", Boolean.valueOf(AuthManager.getInstance().isAuthed()), AuthManager.getInstance().getUserAccessId(), sourceUserAccessId));
                    if (!AuthManager.getInstance().isAuthed() || !AuthManager.getInstance().getUserAccessId().equalsIgnoreCase(sourceUserAccessId)) {
                        Logger.v(Area.UI.value() | Area.PURCHASE.value() | Area.OFFER.value(), "RedemptionEngine: showCheckoutPageFor34() calling ensureAuthResetCurrent()");
                        HashMap<String, String> providerData = new HashMap<>(3);
                        providerData.put(EnforcedAccountUserAuthProvider.KeySourceAppToken, sourceAppToken);
                        providerData.put(EnforcedAccountUserAuthProvider.KeySourceUserAccessId, sourceUserAccessId);
                        providerData.put(EnforcedAccountUserAuthProvider.KeySourceUserDeviceId, sourceUserDeviceId);
                        providerData.put(EnforcedAccountUserAuthProvider.KeyPreviousAccountName, EnforcedAccountUserAuthProvider.getCurrentAccountName(GetJarContext.this.getAndroidContext()));
                        ProviderHint providerHint = new ProviderHint(new EnforcedAccountUserAuthProvider().getProviderFilter(), providerData);
                        AuthManager.getInstance().ensureAuthResetCurrent(providerHint, true);
                        Logger.v(Area.UI.value() | Area.PURCHASE.value() | Area.OFFER.value(), "RedemptionEngine: showCheckoutPageFor34() called ensureAuthResetCurrent()");
                    }
                    ConsumableProduct dummyProduct = new ConsumableProduct("12312", "lightning Sword", "strike enemy with lightning", 2L);
                    Intent intent = new Intent(GetJarContext.this.getAndroidContext(), GetJarActivity.class);
                    intent.putParcelableArrayListExtra(Constants.PRODUCT_LIST, new ArrayList<>(Arrays.asList(dummyProduct)));
                    intent.putExtra(Constants.GETJAR_CONTEXT_ID_KEY, GetJarContext.this.getGetJarContextId());
                    intent.putExtra(Constants.KEY_LANGUAGE, Constants.DEFAULT_LANGUAGE.replace("_", "-"));
                    intent.putExtra(Constants.EXTRA_WEBVIEW, true);
                    intent.putExtra(RedemptionEngine.IntentTypeKey, RedemptionEngine.IntentTypeShowCheckout);
                    intent.putExtra(JavaScriptAPI.EXTRA_MANAGED_CHECKOUT_DATA, managedOfferDetails);
                    intent.setFlags(882900992);
                    GetJarContext.this.getAndroidContext().startActivity(intent);
                    Logger.d(Area.UI.value() | Area.REDEEM.value() | Area.OFFER.value(), "RedemptionEngine: showCheckoutPageFor34() intent sent");
                } catch (Exception e) {
                    Logger.e(Area.UI.value() | Area.PURCHASE.value() | Area.OFFER.value(), "RedemptionEngine: showCheckoutPageFor34() failed", e);
                } finally {
                    Logger.d(Area.UI.value() | Area.PURCHASE.value() | Area.OFFER.value(), "RedemptionEngine: showCheckoutPageFor34() FINISH");
                }
            }
        });
    }

    public void redeemVoucherFromIntent(final String developerPayload, final Intent getjarIntent, final List<VoucherRedemptionListener> callbacks) {
        if (getjarIntent == null) {
            throw new IllegalArgumentException("'getjarIntent' cannot be NULL");
        }
        if (callbacks == null || callbacks.size() <= 0) {
            throw new IllegalArgumentException("'callbacks' cannot be NULL or empty");
        }
        final String voucherToken = getjarIntent.getStringExtra(IntentVoucherTokenKey);
        if (StringUtility.isNullOrEmpty(voucherToken)) {
            throw new IllegalArgumentException("'getjarIntent' does not contain a 'voucherToken' extra");
        }
        try {
            UUID.fromString(voucherToken);
            _ExecutorService.execute(new Runnable() { // from class: com.getjar.sdk.data.RedemptionEngine.3
                @Override // java.lang.Runnable
                public void run() {
                    String workId = UUID.randomUUID().toString();
                    VoucherRedemptionListener.FailureReason failureReason = VoucherRedemptionListener.FailureReason.GENERAL;
                    try {
                        try {
                            Logger.d(Area.REDEEM.value() | Area.OFFER.value(), String.format(Locale.US, "RedemptionEngine: redeemVoucherFromIntent() START [%1$s]", workId));
                            for (VoucherRedemptionListener callback : callbacks) {
                                try {
                                    Logger.v(Area.REDEEM.value() | Area.OFFER.value(), String.format(Locale.US, "RedemptionEngine: redeemVoucherFromIntent() making callback.redeemStarted() [%1$s]", workId));
                                    callback.redeemStarted(workId);
                                } catch (Exception ce) {
                                    Logger.e(Area.REDEEM.value() | Area.OFFER.value(), String.format(Locale.US, "RedemptionEngine: redeemVoucherFromIntent() callback.redeemStarted() failed [%1$s]", workId), ce);
                                }
                            }
                            Logger.v(Area.REDEEM.value() | Area.OFFER.value(), String.format(Locale.US, "RedemptionEngine: redeemVoucherFromIntent() creating CommContext for redemption work [%1$s]", workId));
                            CommContext commContext = CommManager.createContext(RedemptionEngine.this._applicationToken, RedemptionEngine.this._context, getjarIntent, CommManager.LaunchWork.DEALS);
                            try {
                                AuthManager.initialize(RedemptionEngine.this._context);
                                AuthManager.getInstance().waitOnAuth();
                            } catch (Exception e) {
                                Logger.i(Area.REDEEM.value() | Area.OFFER.value(), String.format(Locale.US, "RedemptionEngine: redeemVoucherFromIntent() A canceled auth flow has failed", e.getMessage()));
                            }
                            if (RedemptionEngine.this.handleTestVouchers(workId, voucherToken, callbacks)) {
                                Logger.v(Area.REDEEM.value() | Area.OFFER.value(), String.format(Locale.US, "RedemptionEngine: redeemVoucherFromIntent() handled as test voucher [%1$s]", workId));
                                Logger.d(Area.REDEEM.value() | Area.OFFER.value(), String.format(Locale.US, "RedemptionEngine: redeemVoucherFromIntent() FINISH [%1$s]", workId));
                                return;
                            }
                            Logger.v(Area.REDEEM.value() | Area.OFFER.value(), String.format(Locale.US, "RedemptionEngine: redeemVoucherFromIntent() making redeemVoucher service call [%1$s]", workId));
                            Operation operation = VoucherServiceProxy.getInstance().redeemVoucher(commContext, voucherToken, developerPayload, workId, true);
                            Result result = operation.mo38get();
                            if (result == null) {
                                VoucherRedemptionListener.FailureReason failureReason2 = VoucherRedemptionListener.FailureReason.NETWORK;
                                throw new CommunicationException(String.format(Locale.US, "Failed to redeem voucher token '%1$s' [%2$s]", voucherToken, failureReason2.name()));
                            } else if (!result.isSuccessfulResponse()) {
                                VoucherRedemptionListener.FailureReason failureReason3 = VoucherRedemptionListener.FailureReason.GENERAL;
                                if ("CALLER_NOT_FOUND".equals(result.getErrorResponseCode()) || ("CALLER_BAD_INPUT".equals(result.getErrorResponseCode()) && "INVALID_VOUCHER_TOKEN".equals(result.getErrorResponseSubcode()))) {
                                    failureReason3 = VoucherRedemptionListener.FailureReason.INVALID_VOUCHER;
                                } else if ("CALLER_BAD_STATE".equals(result.getErrorResponseCode()) && "ALREADY_REDEEMED".equals(result.getErrorResponseSubcode())) {
                                    failureReason3 = VoucherRedemptionListener.FailureReason.ALREADY_REDEEMED;
                                }
                                throw new CommunicationException(String.format(Locale.US, "Failed to redeem voucher token '%1$s' [%2$s]", voucherToken, failureReason3.name()));
                            } else {
                                new LicenseEngine(commContext).updateLicenseState(result);
                                RedemptionEngine.this.makeSuccessCallbacks(workId, RedemptionEngine.this.getDeveloperProductId(result), result.getSignedPayload(), result.getSignature(), callbacks);
                                Logger.d(Area.REDEEM.value() | Area.OFFER.value(), String.format(Locale.US, "RedemptionEngine: redeemVoucherFromIntent() FINISH [%1$s]", workId));
                            }
                        } catch (Throwable th) {
                            Logger.d(Area.REDEEM.value() | Area.OFFER.value(), String.format(Locale.US, "RedemptionEngine: redeemVoucherFromIntent() FINISH [%1$s]", workId));
                            throw th;
                        }
                    } catch (AuthException e2) {
                        RedemptionEngine.this.makeFailureCallbacks(workId, VoucherRedemptionListener.FailureReason.NETWORK, callbacks);
                        Logger.e(Area.REDEEM.value() | Area.OFFER.value(), String.format(Locale.US, "RedemptionEngine: redeemVoucherFromIntent() failed [%1$s]", workId), e2);
                        Logger.d(Area.REDEEM.value() | Area.OFFER.value(), String.format(Locale.US, "RedemptionEngine: redeemVoucherFromIntent() FINISH [%1$s]", workId));
                    } catch (Exception e3) {
                        RedemptionEngine.this.makeFailureCallbacks(workId, failureReason, callbacks);
                        Logger.e(Area.REDEEM.value() | Area.OFFER.value(), String.format(Locale.US, "RedemptionEngine: redeemVoucherFromIntent() failed [%1$s]", workId), e3);
                        Logger.d(Area.REDEEM.value() | Area.OFFER.value(), String.format(Locale.US, "RedemptionEngine: redeemVoucherFromIntent() FINISH [%1$s]", workId));
                    }
                }
            });
        } catch (IllegalArgumentException e) {
            throw new IllegalArgumentException(String.format(Locale.US, "'getjarIntent' 'voucherToken' extra does not contain a valid UUID [%1$s]", voucherToken));
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public String getDeveloperProductId(Result result) {
        JSONObject signedPayload;
        if (result != null && (signedPayload = result.getSignedPayloadObject()) != null && signedPayload.has("developer_product_id")) {
            try {
                return signedPayload.getString("developer_product_id");
            } catch (JSONException e) {
                Logger.e(Area.REDEEM.value() | Area.OFFER.value(), "Unable to get a string value for 'developer_product_id'", e);
            }
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void makeSuccessCallbacks(String workId, String productId, String signedPayload, String signature, List<VoucherRedemptionListener> callbacks) {
        for (VoucherRedemptionListener callback : callbacks) {
            try {
                Logger.v(Area.REDEEM.value() | Area.OFFER.value(), String.format(Locale.US, "RedemptionEngine: making callback.redeemSucceeded() [%1$s]", workId));
                callback.redeemSucceeded(workId, productId, signedPayload, signature);
            } catch (Exception ce) {
                Logger.e(Area.REDEEM.value() | Area.OFFER.value(), String.format(Locale.US, "RedemptionEngine: callback.redeemSucceeded() failed [%1$s]", workId), ce);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void makeFailureCallbacks(String workId, VoucherRedemptionListener.FailureReason reason, List<VoucherRedemptionListener> callbacks) {
        for (VoucherRedemptionListener callback : callbacks) {
            try {
                Logger.v(Area.REDEEM.value() | Area.OFFER.value(), String.format(Locale.US, "RedemptionEngine: making callback.redeemFailed() [%1$s]", workId));
                callback.redeemFailed(workId, reason);
            } catch (Exception ce) {
                Logger.e(Area.REDEEM.value() | Area.OFFER.value(), String.format(Locale.US, "RedemptionEngine: callback.redeemFailed() failed [%1$s]", workId), ce);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean handleTestVouchers(String workId, String voucherToken, List<VoucherRedemptionListener> callbacks) {
        if (TestVoucherConsumableSuccess.equals(voucherToken)) {
            makeSuccessCallbacks(workId, "getjar.test.consumable", "signedPayload", "signature", callbacks);
            return true;
        } else if (TestVoucherLicensableSuccess.equals(voucherToken)) {
            makeSuccessCallbacks(workId, "getjar.test.licensable", "signedPayload", "signature", callbacks);
            return true;
        } else if (TestVoucherGeneralFailure.equals(voucherToken)) {
            makeFailureCallbacks(workId, VoucherRedemptionListener.FailureReason.GENERAL, callbacks);
            return true;
        } else if (TestVoucherInvalidVoucherFailure.equals(voucherToken)) {
            makeFailureCallbacks(workId, VoucherRedemptionListener.FailureReason.INVALID_VOUCHER, callbacks);
            return true;
        } else if (TestVoucherNetworkFailure.equals(voucherToken)) {
            makeFailureCallbacks(workId, VoucherRedemptionListener.FailureReason.NETWORK, callbacks);
            return true;
        } else {
            return false;
        }
    }
}
