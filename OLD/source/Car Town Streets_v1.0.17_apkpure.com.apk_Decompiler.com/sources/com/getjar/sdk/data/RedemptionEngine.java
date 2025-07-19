package com.getjar.sdk.data;

import android.content.Context;
import android.content.Intent;
import com.getjar.sdk.ConsumableProduct;
import com.getjar.sdk.GetJarContext;
import com.getjar.sdk.GetJarManager;
import com.getjar.sdk.comm.CommManager;
import com.getjar.sdk.comm.Result;
import com.getjar.sdk.comm.auth.AndroidAccountUserAuthProvider;
import com.getjar.sdk.comm.auth.AuthManager;
import com.getjar.sdk.comm.auth.EnforcedAccountUserAuthProvider;
import com.getjar.sdk.comm.auth.ProviderHint;
import com.getjar.sdk.comm.auth.ProxyAccountUserAuthProvider;
import com.getjar.sdk.exceptions.AuthException;
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
    /* access modifiers changed from: private */
    public final String _applicationToken;
    /* access modifiers changed from: private */
    public final Context _context;

    public RedemptionEngine(String applicationToken, Context context) {
        if (context == null) {
            throw new IllegalArgumentException("'context' cannot be NULL");
        }
        this._applicationToken = applicationToken;
        this._context = context;
    }

    public static Intent buildShowWalletIntent(Context context) {
        Intent launchIntent = context.getApplicationContext().getPackageManager().getLaunchIntentForPackage(Constants.GREENJAR_PACKAGE);
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
        } else if (StringUtility.isNullOrEmpty(packageName)) {
            throw new IllegalArgumentException("'packageName' cannot be NULL or empty");
        } else if (StringUtility.isNullOrEmpty(voucherToken)) {
            throw new IllegalArgumentException("'voucherToken' cannot be NULL or empty");
        } else {
            UUID.fromString(voucherToken);
            Intent redeemIntent = context.getApplicationContext().getPackageManager().getLaunchIntentForPackage(packageName);
            if (redeemIntent == null) {
                throw new IllegalArgumentException(String.format(Locale.US, "The package name '%1$s' is not installed", new Object[]{packageName}));
            }
            Logger.d(Area.REDEEM.value() | Area.OFFER.value(), String.format(Locale.US, "RedemptionEngine: buildRedeemVoucherIntent() [packageName:%1$s voucherToken:%2$s]", new Object[]{packageName, voucherToken}));
            redeemIntent.putExtra(GetJarManager.GetjarIntentKey, true);
            redeemIntent.putExtra(IntentTypeKey, IntentTypeDealRedemption);
            redeemIntent.putExtra(IntentVoucherTokenKey, voucherToken);
            redeemIntent.putExtra(CommManager.AuthProviderFilterNameKey, "android_account");
            redeemIntent.putExtra(CommManager.AuthProviderFilterDataKey, getProviderFilterJson(context).toString());
            redeemIntent.setFlags(882900992);
            Logger.d(Area.REDEEM.value() | Area.OFFER.value(), "RedemptionEngine: buildRedeemVoucherIntent() FINISH");
            return redeemIntent;
        }
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
        Map<String, String> hashedAuthData = new AndroidAccountUserAuthProvider().getProxiableAuthData(context);
        if (hashedAuthData != null) {
            hashedAccountName = hashedAuthData.get("android_account.username_data_hash");
        }
        if (StringUtility.isNullOrEmpty(hashedAccountName)) {
            throw new AuthException("Failed to get hashed provider data");
        }
        String userDeviceId = AuthManager.getInstance().getUserDeviceId();
        String hashedUserDeviceId = CryptoUtility.getSHA256(userDeviceId.toLowerCase(Locale.US));
        Logger.d(Area.REDEEM.value() | Area.OFFER.value(), String.format(Locale.US, "RedemptionEngine: buildRedeemVoucherIntent() [hashedAccountName:%1$s userDeviceId:%2$s hashedUserDeviceId:%3$s]", new Object[]{hashedAccountName, userDeviceId, hashedUserDeviceId}));
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
        ConsumableProduct dummyProduct = new ConsumableProduct("12312", "lightning Sword", "strike enemy with lightning", 2);
        Intent intent = new Intent(getJarContext.getAndroidContext(), GetJarActivity.class);
        intent.putParcelableArrayListExtra(Constants.PRODUCT_LIST, new ArrayList(Arrays.asList(new ConsumableProduct[]{dummyProduct})));
        intent.putExtra(Constants.GETJAR_CONTEXT_ID_KEY, getJarContext.getGetJarContextId());
        intent.putExtra(Constants.KEY_LANGUAGE, Constants.DEFAULT_LANGUAGE.replace("_", "-"));
        intent.putExtra(Constants.EXTRA_WEBVIEW, true);
        intent.putExtra(IntentTypeKey, IntentTypeShowWallet);
        intent.setFlags(874512384);
        getJarContext.getAndroidContext().startActivity(intent);
        Logger.d(Area.UI.value() | Area.REDEEM.value() | Area.OFFER.value(), "RedemptionEngine: showWalletPage() intent sent");
    }

    public static void showCheckoutPage(final GetJarContext getJarContext, Intent receivedIntent) {
        if (getJarContext == null) {
            throw new IllegalArgumentException("'getJarContext' cannot be NULL");
        } else if (receivedIntent == null) {
            throw new IllegalArgumentException("'receivedIntent' cannot be NULL");
        } else if (!receivedIntent.getBooleanExtra(GetJarManager.GetjarIntentKey, false)) {
            throw new IllegalArgumentException("showCheckoutPage() called with a non-Getjar Intent");
        } else if (!IntentTypeShowCheckout.equalsIgnoreCase(receivedIntent.getStringExtra(IntentTypeKey))) {
            throw new IllegalArgumentException("showCheckoutPage() called with an non-checkout Intent");
        } else {
            final String managedOfferDetails = receivedIntent.getStringExtra(JavaScriptAPI.EXTRA_MANAGED_CHECKOUT_DATA);
            if (StringUtility.isNullOrEmpty(managedOfferDetails)) {
                throw new IllegalArgumentException("showCheckoutPage() called with an Intent that has no checkout data");
            }
            String tempAccountNameHash = null;
            try {
                JSONArray providerDataJson = new JSONArray(receivedIntent.getStringExtra(CommManager.AuthProviderFilterDataKey));
                int i = 0;
                while (true) {
                    if (i >= providerDataJson.length()) {
                        break;
                    }
                    JSONObject currentKeyValueJson = providerDataJson.getJSONObject(i);
                    if ("android_account.username_data_hash".equalsIgnoreCase(currentKeyValueJson.getString("key"))) {
                        tempAccountNameHash = currentKeyValueJson.getString("value");
                        break;
                    }
                    i++;
                }
            } catch (Exception e) {
                Logger.e(Area.UI.value() | Area.PURCHASE.value() | Area.OFFER.value(), "RedemptionEngine: showCheckoutPage() failed", e);
            }
            final String targetAccountNameHash = tempAccountNameHash;
            if (StringUtility.isNullOrEmpty(targetAccountNameHash)) {
                throw new IllegalArgumentException("showCheckoutPage() called with an Intent that has no account name hash");
            }
            _ExecutorService.execute(new Runnable() {
                public void run() {
                    String str;
                    try {
                        Logger.d(Area.UI.value() | Area.PURCHASE.value() | Area.OFFER.value(), "RedemptionEngine: showCheckoutPage() START");
                        AuthManager.initialize(getJarContext.getAndroidContext());
                        String currentAccountName = EnforcedAccountUserAuthProvider.getCurrentAccountName(getJarContext.getAndroidContext());
                        String targetAccountName = AndroidAccountUserAuthProvider.getAccountNameFromHash(getJarContext.getAndroidContext(), targetAccountNameHash);
                        Logger.v(Area.UI.value() | Area.PURCHASE.value() | Area.OFFER.value(), String.format(Locale.US, "RedemptionEngine: showCheckoutPage() [isAuthed:%1$s currentUserAccessId:%2$s currentAccountName:%3$s targetAccountName:%4$s]", new Object[]{Boolean.valueOf(AuthManager.getInstance().isAuthed()), AuthManager.getInstance().getUserAccessId(), currentAccountName, targetAccountName}));
                        if (!AuthManager.getInstance().isAuthed() || StringUtility.isNullOrEmpty(currentAccountName) || !currentAccountName.equalsIgnoreCase(targetAccountName)) {
                            Logger.v(Area.UI.value() | Area.PURCHASE.value() | Area.OFFER.value(), "RedemptionEngine: showCheckoutPage() calling ensureAuthResetCurrent()");
                            HashMap<String, String> providerData = new HashMap<>(3);
                            providerData.put(EnforcedAccountUserAuthProvider.KeySourceAccountNameHash, targetAccountNameHash);
                            providerData.put(EnforcedAccountUserAuthProvider.KeyPreviousAccountName, currentAccountName);
                            AuthManager.getInstance().ensureAuthResetCurrent(new ProviderHint(new EnforcedAccountUserAuthProvider().getProviderFilter(), providerData), true);
                            Logger.v(Area.UI.value() | Area.PURCHASE.value() | Area.OFFER.value(), "RedemptionEngine: showCheckoutPage() called ensureAuthResetCurrent()");
                        }
                        ConsumableProduct dummyProduct = new ConsumableProduct("12312", "lightning Sword", "strike enemy with lightning", 2);
                        Intent intent = new Intent(getJarContext.getAndroidContext(), GetJarActivity.class);
                        intent.putParcelableArrayListExtra(Constants.PRODUCT_LIST, new ArrayList(Arrays.asList(new ConsumableProduct[]{dummyProduct})));
                        intent.putExtra(Constants.GETJAR_CONTEXT_ID_KEY, getJarContext.getGetJarContextId());
                        intent.putExtra(Constants.KEY_LANGUAGE, Constants.DEFAULT_LANGUAGE.replace("_", "-"));
                        intent.putExtra(Constants.EXTRA_WEBVIEW, true);
                        intent.putExtra(RedemptionEngine.IntentTypeKey, RedemptionEngine.IntentTypeShowCheckout);
                        intent.putExtra(JavaScriptAPI.EXTRA_MANAGED_CHECKOUT_DATA, managedOfferDetails);
                        intent.setFlags(882900992);
                        getJarContext.getAndroidContext().startActivity(intent);
                        Logger.d(Area.UI.value() | Area.REDEEM.value() | Area.OFFER.value(), "RedemptionEngine: showCheckoutPage() intent sent");
                    } catch (Exception e) {
                        Logger.e(Area.UI.value() | Area.PURCHASE.value() | Area.OFFER.value(), "RedemptionEngine: showCheckoutPage() failed", e);
                    } finally {
                        str = "RedemptionEngine: showCheckoutPage() FINISH";
                        Logger.d(Area.UI.value() | Area.PURCHASE.value() | Area.OFFER.value(), str);
                    }
                }
            });
        }
    }

    public static void showCheckoutPageFor34(GetJarContext getJarContext, Intent receivedIntent) {
        if (getJarContext == null) {
            throw new IllegalArgumentException("'getJarContext' cannot be NULL");
        } else if (receivedIntent == null) {
            throw new IllegalArgumentException("'receivedIntent' cannot be NULL");
        } else {
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
            final GetJarContext getJarContext2 = getJarContext;
            _ExecutorService.execute(new Runnable() {
                public void run() {
                    String str;
                    try {
                        Logger.d(Area.UI.value() | Area.PURCHASE.value() | Area.OFFER.value(), "RedemptionEngine: showCheckoutPageFor34() START");
                        AuthManager.initialize(getJarContext2.getAndroidContext());
                        Logger.v(Area.UI.value() | Area.PURCHASE.value() | Area.OFFER.value(), String.format(Locale.US, "RedemptionEngine: showCheckoutPageFor34() [isAuthed:%1$s currentUserAccessId:%2$s sourceUserAccessId:%3$s]", new Object[]{Boolean.valueOf(AuthManager.getInstance().isAuthed()), AuthManager.getInstance().getUserAccessId(), sourceUserAccessId}));
                        if (!AuthManager.getInstance().isAuthed() || !AuthManager.getInstance().getUserAccessId().equalsIgnoreCase(sourceUserAccessId)) {
                            Logger.v(Area.UI.value() | Area.PURCHASE.value() | Area.OFFER.value(), "RedemptionEngine: showCheckoutPageFor34() calling ensureAuthResetCurrent()");
                            HashMap<String, String> providerData = new HashMap<>(3);
                            providerData.put(EnforcedAccountUserAuthProvider.KeySourceAppToken, sourceAppToken);
                            providerData.put(EnforcedAccountUserAuthProvider.KeySourceUserAccessId, sourceUserAccessId);
                            providerData.put(EnforcedAccountUserAuthProvider.KeySourceUserDeviceId, sourceUserDeviceId);
                            providerData.put(EnforcedAccountUserAuthProvider.KeyPreviousAccountName, EnforcedAccountUserAuthProvider.getCurrentAccountName(getJarContext2.getAndroidContext()));
                            AuthManager.getInstance().ensureAuthResetCurrent(new ProviderHint(new EnforcedAccountUserAuthProvider().getProviderFilter(), providerData), true);
                            Logger.v(Area.UI.value() | Area.PURCHASE.value() | Area.OFFER.value(), "RedemptionEngine: showCheckoutPageFor34() called ensureAuthResetCurrent()");
                        }
                        ConsumableProduct dummyProduct = new ConsumableProduct("12312", "lightning Sword", "strike enemy with lightning", 2);
                        Intent intent = new Intent(getJarContext2.getAndroidContext(), GetJarActivity.class);
                        intent.putParcelableArrayListExtra(Constants.PRODUCT_LIST, new ArrayList(Arrays.asList(new ConsumableProduct[]{dummyProduct})));
                        intent.putExtra(Constants.GETJAR_CONTEXT_ID_KEY, getJarContext2.getGetJarContextId());
                        intent.putExtra(Constants.KEY_LANGUAGE, Constants.DEFAULT_LANGUAGE.replace("_", "-"));
                        intent.putExtra(Constants.EXTRA_WEBVIEW, true);
                        intent.putExtra(RedemptionEngine.IntentTypeKey, RedemptionEngine.IntentTypeShowCheckout);
                        intent.putExtra(JavaScriptAPI.EXTRA_MANAGED_CHECKOUT_DATA, managedOfferDetails);
                        intent.setFlags(882900992);
                        getJarContext2.getAndroidContext().startActivity(intent);
                        Logger.d(Area.UI.value() | Area.REDEEM.value() | Area.OFFER.value(), "RedemptionEngine: showCheckoutPageFor34() intent sent");
                    } catch (Exception e) {
                        Logger.e(Area.UI.value() | Area.PURCHASE.value() | Area.OFFER.value(), "RedemptionEngine: showCheckoutPageFor34() failed", e);
                    } finally {
                        str = "RedemptionEngine: showCheckoutPageFor34() FINISH";
                        Logger.d(Area.UI.value() | Area.PURCHASE.value() | Area.OFFER.value(), str);
                    }
                }
            });
        }
    }

    public void redeemVoucherFromIntent(String developerPayload, Intent getjarIntent, List<VoucherRedemptionListener> callbacks) {
        if (getjarIntent == null) {
            throw new IllegalArgumentException("'getjarIntent' cannot be NULL");
        } else if (callbacks == null || callbacks.size() <= 0) {
            throw new IllegalArgumentException("'callbacks' cannot be NULL or empty");
        } else {
            final String voucherToken = getjarIntent.getStringExtra(IntentVoucherTokenKey);
            if (StringUtility.isNullOrEmpty(voucherToken)) {
                throw new IllegalArgumentException("'getjarIntent' does not contain a 'voucherToken' extra");
            }
            try {
                UUID.fromString(voucherToken);
                final List<VoucherRedemptionListener> list = callbacks;
                final Intent intent = getjarIntent;
                final String str = developerPayload;
                _ExecutorService.execute(new Runnable() {
                    /* JADX WARNING: Code restructure failed: missing block: B:10:?, code lost:
                        com.getjar.sdk.logging.Logger.e(com.getjar.sdk.logging.Area.REDEEM.value() | com.getjar.sdk.logging.Area.OFFER.value(), java.lang.String.format(java.util.Locale.US, "RedemptionEngine: redeemVoucherFromIntent() callback.redeemStarted() failed [%1$s]", new java.lang.Object[]{r5}), r11);
                     */
                    /* JADX WARNING: Code restructure failed: missing block: B:11:0x007e, code lost:
                        r12 = move-exception;
                     */
                    /* JADX WARNING: Code restructure failed: missing block: B:14:?, code lost:
                        com.getjar.sdk.data.RedemptionEngine.access$500(r17.this$0, r5, com.getjar.sdk.listener.VoucherRedemptionListener.FailureReason.NETWORK, r2);
                        com.getjar.sdk.logging.Logger.e(com.getjar.sdk.logging.Area.REDEEM.value() | com.getjar.sdk.logging.Area.OFFER.value(), java.lang.String.format(java.util.Locale.US, "RedemptionEngine: redeemVoucherFromIntent() failed [%1$s]", new java.lang.Object[]{r5}), r12);
                     */
                    /* JADX WARNING: Code restructure failed: missing block: B:15:0x00aa, code lost:
                        com.getjar.sdk.logging.Logger.d(com.getjar.sdk.logging.Area.REDEEM.value() | com.getjar.sdk.logging.Area.OFFER.value(), java.lang.String.format(java.util.Locale.US, "RedemptionEngine: redeemVoucherFromIntent() FINISH [%1$s]", new java.lang.Object[]{r5}));
                     */
                    /* JADX WARNING: Code restructure failed: missing block: B:30:0x0187, code lost:
                        r12 = move-exception;
                     */
                    /* JADX WARNING: Code restructure failed: missing block: B:33:?, code lost:
                        com.getjar.sdk.data.RedemptionEngine.access$500(r17.this$0, r5, r13, r2);
                        com.getjar.sdk.logging.Logger.e(com.getjar.sdk.logging.Area.REDEEM.value() | com.getjar.sdk.logging.Area.OFFER.value(), java.lang.String.format(java.util.Locale.US, "RedemptionEngine: redeemVoucherFromIntent() failed [%1$s]", new java.lang.Object[]{r5}), r12);
                     */
                    /* JADX WARNING: Code restructure failed: missing block: B:34:0x01b1, code lost:
                        com.getjar.sdk.logging.Logger.d(com.getjar.sdk.logging.Area.REDEEM.value() | com.getjar.sdk.logging.Area.OFFER.value(), java.lang.String.format(java.util.Locale.US, "RedemptionEngine: redeemVoucherFromIntent() FINISH [%1$s]", new java.lang.Object[]{r5}));
                     */
                    /* JADX WARNING: Code restructure failed: missing block: B:65:?, code lost:
                        return;
                     */
                    /* JADX WARNING: Code restructure failed: missing block: B:67:?, code lost:
                        return;
                     */
                    /* JADX WARNING: Code restructure failed: missing block: B:8:0x005e, code lost:
                        r11 = move-exception;
                     */
                    /* JADX WARNING: Failed to process nested try/catch */
                    /* JADX WARNING: Removed duplicated region for block: B:11:0x007e A[ExcHandler: AuthException (r12v1 'e' com.getjar.sdk.exceptions.AuthException A[CUSTOM_DECLARE]), Splitter:B:1:0x000a] */
                    /* Code decompiled incorrectly, please refer to instructions dump. */
                    public void run() {
                        /*
                            r17 = this;
                            java.util.UUID r1 = java.util.UUID.randomUUID()
                            java.lang.String r5 = r1.toString()
                            com.getjar.sdk.listener.VoucherRedemptionListener$FailureReason r13 = com.getjar.sdk.listener.VoucherRedemptionListener.FailureReason.GENERAL
                            com.getjar.sdk.logging.Area r1 = com.getjar.sdk.logging.Area.REDEEM     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            long r3 = r1.value()     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            com.getjar.sdk.logging.Area r1 = com.getjar.sdk.logging.Area.OFFER     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            long r6 = r1.value()     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            long r3 = r3 | r6
                            java.util.Locale r1 = java.util.Locale.US     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            java.lang.String r6 = "RedemptionEngine: redeemVoucherFromIntent() START [%1$s]"
                            r7 = 1
                            java.lang.Object[] r7 = new java.lang.Object[r7]     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            r8 = 0
                            r7[r8] = r5     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            java.lang.String r1 = java.lang.String.format(r1, r6, r7)     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            com.getjar.sdk.logging.Logger.d(r3, r1)     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            r0 = r17
                            java.util.List r1 = r2     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            java.util.Iterator r14 = r1.iterator()     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                        L_0x0030:
                            boolean r1 = r14.hasNext()     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            if (r1 == 0) goto L_0x00c9
                            java.lang.Object r10 = r14.next()     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            com.getjar.sdk.listener.VoucherRedemptionListener r10 = (com.getjar.sdk.listener.VoucherRedemptionListener) r10     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            com.getjar.sdk.logging.Area r1 = com.getjar.sdk.logging.Area.REDEEM     // Catch:{ Exception -> 0x005e, AuthException -> 0x007e }
                            long r3 = r1.value()     // Catch:{ Exception -> 0x005e, AuthException -> 0x007e }
                            com.getjar.sdk.logging.Area r1 = com.getjar.sdk.logging.Area.OFFER     // Catch:{ Exception -> 0x005e, AuthException -> 0x007e }
                            long r6 = r1.value()     // Catch:{ Exception -> 0x005e, AuthException -> 0x007e }
                            long r3 = r3 | r6
                            java.util.Locale r1 = java.util.Locale.US     // Catch:{ Exception -> 0x005e, AuthException -> 0x007e }
                            java.lang.String r6 = "RedemptionEngine: redeemVoucherFromIntent() making callback.redeemStarted() [%1$s]"
                            r7 = 1
                            java.lang.Object[] r7 = new java.lang.Object[r7]     // Catch:{ Exception -> 0x005e, AuthException -> 0x007e }
                            r8 = 0
                            r7[r8] = r5     // Catch:{ Exception -> 0x005e, AuthException -> 0x007e }
                            java.lang.String r1 = java.lang.String.format(r1, r6, r7)     // Catch:{ Exception -> 0x005e, AuthException -> 0x007e }
                            com.getjar.sdk.logging.Logger.v(r3, r1)     // Catch:{ Exception -> 0x005e, AuthException -> 0x007e }
                            r10.redeemStarted(r5)     // Catch:{ Exception -> 0x005e, AuthException -> 0x007e }
                            goto L_0x0030
                        L_0x005e:
                            r11 = move-exception
                            com.getjar.sdk.logging.Area r1 = com.getjar.sdk.logging.Area.REDEEM     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            long r3 = r1.value()     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            com.getjar.sdk.logging.Area r1 = com.getjar.sdk.logging.Area.OFFER     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            long r6 = r1.value()     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            long r3 = r3 | r6
                            java.util.Locale r1 = java.util.Locale.US     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            java.lang.String r6 = "RedemptionEngine: redeemVoucherFromIntent() callback.redeemStarted() failed [%1$s]"
                            r7 = 1
                            java.lang.Object[] r7 = new java.lang.Object[r7]     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            r8 = 0
                            r7[r8] = r5     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            java.lang.String r1 = java.lang.String.format(r1, r6, r7)     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            com.getjar.sdk.logging.Logger.e(r3, r1, r11)     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            goto L_0x0030
                        L_0x007e:
                            r12 = move-exception
                            r0 = r17
                            com.getjar.sdk.data.RedemptionEngine r1 = com.getjar.sdk.data.RedemptionEngine.this     // Catch:{ all -> 0x0227 }
                            com.getjar.sdk.listener.VoucherRedemptionListener$FailureReason r3 = com.getjar.sdk.listener.VoucherRedemptionListener.FailureReason.NETWORK     // Catch:{ all -> 0x0227 }
                            r0 = r17
                            java.util.List r4 = r2     // Catch:{ all -> 0x0227 }
                            r1.makeFailureCallbacks(r5, r3, r4)     // Catch:{ all -> 0x0227 }
                            com.getjar.sdk.logging.Area r1 = com.getjar.sdk.logging.Area.REDEEM     // Catch:{ all -> 0x0227 }
                            long r3 = r1.value()     // Catch:{ all -> 0x0227 }
                            com.getjar.sdk.logging.Area r1 = com.getjar.sdk.logging.Area.OFFER     // Catch:{ all -> 0x0227 }
                            long r6 = r1.value()     // Catch:{ all -> 0x0227 }
                            long r3 = r3 | r6
                            java.util.Locale r1 = java.util.Locale.US     // Catch:{ all -> 0x0227 }
                            java.lang.String r6 = "RedemptionEngine: redeemVoucherFromIntent() failed [%1$s]"
                            r7 = 1
                            java.lang.Object[] r7 = new java.lang.Object[r7]     // Catch:{ all -> 0x0227 }
                            r8 = 0
                            r7[r8] = r5     // Catch:{ all -> 0x0227 }
                            java.lang.String r1 = java.lang.String.format(r1, r6, r7)     // Catch:{ all -> 0x0227 }
                            com.getjar.sdk.logging.Logger.e(r3, r1, r12)     // Catch:{ all -> 0x0227 }
                            com.getjar.sdk.logging.Area r1 = com.getjar.sdk.logging.Area.REDEEM
                            long r3 = r1.value()
                            com.getjar.sdk.logging.Area r1 = com.getjar.sdk.logging.Area.OFFER
                            long r6 = r1.value()
                            long r3 = r3 | r6
                            java.util.Locale r1 = java.util.Locale.US
                            java.lang.String r6 = "RedemptionEngine: redeemVoucherFromIntent() FINISH [%1$s]"
                            r7 = 1
                            java.lang.Object[] r7 = new java.lang.Object[r7]
                            r8 = 0
                            r7[r8] = r5
                            java.lang.String r1 = java.lang.String.format(r1, r6, r7)
                            com.getjar.sdk.logging.Logger.d(r3, r1)
                        L_0x00c8:
                            return
                        L_0x00c9:
                            com.getjar.sdk.logging.Area r1 = com.getjar.sdk.logging.Area.REDEEM     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            long r3 = r1.value()     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            com.getjar.sdk.logging.Area r1 = com.getjar.sdk.logging.Area.OFFER     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            long r6 = r1.value()     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            long r3 = r3 | r6
                            java.util.Locale r1 = java.util.Locale.US     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            java.lang.String r6 = "RedemptionEngine: redeemVoucherFromIntent() creating CommContext for redemption work [%1$s]"
                            r7 = 1
                            java.lang.Object[] r7 = new java.lang.Object[r7]     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            r8 = 0
                            r7[r8] = r5     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            java.lang.String r1 = java.lang.String.format(r1, r6, r7)     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            com.getjar.sdk.logging.Logger.v(r3, r1)     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            r0 = r17
                            com.getjar.sdk.data.RedemptionEngine r1 = com.getjar.sdk.data.RedemptionEngine.this     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            java.lang.String r1 = r1._applicationToken     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            r0 = r17
                            com.getjar.sdk.data.RedemptionEngine r3 = com.getjar.sdk.data.RedemptionEngine.this     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            android.content.Context r3 = r3._context     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            r0 = r17
                            android.content.Intent r4 = r3     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            com.getjar.sdk.comm.CommManager$LaunchWork r6 = com.getjar.sdk.comm.CommManager.LaunchWork.DEALS     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            com.getjar.sdk.comm.CommContext r2 = com.getjar.sdk.comm.CommManager.createContext((java.lang.String) r1, (android.content.Context) r3, (android.content.Intent) r4, (com.getjar.sdk.comm.CommManager.LaunchWork) r6)     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            r0 = r17
                            com.getjar.sdk.data.RedemptionEngine r1 = com.getjar.sdk.data.RedemptionEngine.this     // Catch:{ Exception -> 0x0163, AuthException -> 0x007e }
                            android.content.Context r1 = r1._context     // Catch:{ Exception -> 0x0163, AuthException -> 0x007e }
                            com.getjar.sdk.comm.auth.AuthManager.initialize(r1)     // Catch:{ Exception -> 0x0163, AuthException -> 0x007e }
                            com.getjar.sdk.comm.auth.AuthManager r1 = com.getjar.sdk.comm.auth.AuthManager.getInstance()     // Catch:{ Exception -> 0x0163, AuthException -> 0x007e }
                            r1.waitOnAuth()     // Catch:{ Exception -> 0x0163, AuthException -> 0x007e }
                        L_0x0113:
                            r0 = r17
                            com.getjar.sdk.data.RedemptionEngine r1 = com.getjar.sdk.data.RedemptionEngine.this     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            r0 = r17
                            java.lang.String r3 = r4     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            r0 = r17
                            java.util.List r4 = r2     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            boolean r1 = r1.handleTestVouchers(r5, r3, r4)     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            if (r1 == 0) goto L_0x01d1
                            com.getjar.sdk.logging.Area r1 = com.getjar.sdk.logging.Area.REDEEM     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            long r3 = r1.value()     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            com.getjar.sdk.logging.Area r1 = com.getjar.sdk.logging.Area.OFFER     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            long r6 = r1.value()     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            long r3 = r3 | r6
                            java.util.Locale r1 = java.util.Locale.US     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            java.lang.String r6 = "RedemptionEngine: redeemVoucherFromIntent() handled as test voucher [%1$s]"
                            r7 = 1
                            java.lang.Object[] r7 = new java.lang.Object[r7]     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            r8 = 0
                            r7[r8] = r5     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            java.lang.String r1 = java.lang.String.format(r1, r6, r7)     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            com.getjar.sdk.logging.Logger.v(r3, r1)     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            com.getjar.sdk.logging.Area r1 = com.getjar.sdk.logging.Area.REDEEM
                            long r3 = r1.value()
                            com.getjar.sdk.logging.Area r1 = com.getjar.sdk.logging.Area.OFFER
                            long r6 = r1.value()
                            long r3 = r3 | r6
                            java.util.Locale r1 = java.util.Locale.US
                            java.lang.String r6 = "RedemptionEngine: redeemVoucherFromIntent() FINISH [%1$s]"
                            r7 = 1
                            java.lang.Object[] r7 = new java.lang.Object[r7]
                            r8 = 0
                            r7[r8] = r5
                            java.lang.String r1 = java.lang.String.format(r1, r6, r7)
                            com.getjar.sdk.logging.Logger.d(r3, r1)
                            goto L_0x00c8
                        L_0x0163:
                            r12 = move-exception
                            com.getjar.sdk.logging.Area r1 = com.getjar.sdk.logging.Area.REDEEM     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            long r3 = r1.value()     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            com.getjar.sdk.logging.Area r1 = com.getjar.sdk.logging.Area.OFFER     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            long r6 = r1.value()     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            long r3 = r3 | r6
                            java.util.Locale r1 = java.util.Locale.US     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            java.lang.String r6 = "RedemptionEngine: redeemVoucherFromIntent() A canceled auth flow has failed"
                            r7 = 1
                            java.lang.Object[] r7 = new java.lang.Object[r7]     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            r8 = 0
                            java.lang.String r9 = r12.getMessage()     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            r7[r8] = r9     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            java.lang.String r1 = java.lang.String.format(r1, r6, r7)     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            com.getjar.sdk.logging.Logger.i(r3, r1)     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            goto L_0x0113
                        L_0x0187:
                            r12 = move-exception
                            r0 = r17
                            com.getjar.sdk.data.RedemptionEngine r1 = com.getjar.sdk.data.RedemptionEngine.this     // Catch:{ all -> 0x0227 }
                            r0 = r17
                            java.util.List r3 = r2     // Catch:{ all -> 0x0227 }
                            r1.makeFailureCallbacks(r5, r13, r3)     // Catch:{ all -> 0x0227 }
                            com.getjar.sdk.logging.Area r1 = com.getjar.sdk.logging.Area.REDEEM     // Catch:{ all -> 0x0227 }
                            long r3 = r1.value()     // Catch:{ all -> 0x0227 }
                            com.getjar.sdk.logging.Area r1 = com.getjar.sdk.logging.Area.OFFER     // Catch:{ all -> 0x0227 }
                            long r6 = r1.value()     // Catch:{ all -> 0x0227 }
                            long r3 = r3 | r6
                            java.util.Locale r1 = java.util.Locale.US     // Catch:{ all -> 0x0227 }
                            java.lang.String r6 = "RedemptionEngine: redeemVoucherFromIntent() failed [%1$s]"
                            r7 = 1
                            java.lang.Object[] r7 = new java.lang.Object[r7]     // Catch:{ all -> 0x0227 }
                            r8 = 0
                            r7[r8] = r5     // Catch:{ all -> 0x0227 }
                            java.lang.String r1 = java.lang.String.format(r1, r6, r7)     // Catch:{ all -> 0x0227 }
                            com.getjar.sdk.logging.Logger.e(r3, r1, r12)     // Catch:{ all -> 0x0227 }
                            com.getjar.sdk.logging.Area r1 = com.getjar.sdk.logging.Area.REDEEM
                            long r3 = r1.value()
                            com.getjar.sdk.logging.Area r1 = com.getjar.sdk.logging.Area.OFFER
                            long r6 = r1.value()
                            long r3 = r3 | r6
                            java.util.Locale r1 = java.util.Locale.US
                            java.lang.String r6 = "RedemptionEngine: redeemVoucherFromIntent() FINISH [%1$s]"
                            r7 = 1
                            java.lang.Object[] r7 = new java.lang.Object[r7]
                            r8 = 0
                            r7[r8] = r5
                            java.lang.String r1 = java.lang.String.format(r1, r6, r7)
                            com.getjar.sdk.logging.Logger.d(r3, r1)
                            goto L_0x00c8
                        L_0x01d1:
                            com.getjar.sdk.logging.Area r1 = com.getjar.sdk.logging.Area.REDEEM     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            long r3 = r1.value()     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            com.getjar.sdk.logging.Area r1 = com.getjar.sdk.logging.Area.OFFER     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            long r6 = r1.value()     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            long r3 = r3 | r6
                            java.util.Locale r1 = java.util.Locale.US     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            java.lang.String r6 = "RedemptionEngine: redeemVoucherFromIntent() making redeemVoucher service call [%1$s]"
                            r7 = 1
                            java.lang.Object[] r7 = new java.lang.Object[r7]     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            r8 = 0
                            r7[r8] = r5     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            java.lang.String r1 = java.lang.String.format(r1, r6, r7)     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            com.getjar.sdk.logging.Logger.v(r3, r1)     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            com.getjar.sdk.comm.VoucherServiceProxy r1 = com.getjar.sdk.comm.VoucherServiceProxy.getInstance()     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            r0 = r17
                            java.lang.String r3 = r4     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            r0 = r17
                            java.lang.String r4 = r5     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            r6 = 1
                            com.getjar.sdk.comm.Operation r15 = r1.redeemVoucher(r2, r3, r4, r5, r6)     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            com.getjar.sdk.comm.Result r16 = r15.get()     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            if (r16 != 0) goto L_0x0247
                            com.getjar.sdk.listener.VoucherRedemptionListener$FailureReason r13 = com.getjar.sdk.listener.VoucherRedemptionListener.FailureReason.NETWORK     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            com.getjar.sdk.exceptions.CommunicationException r1 = new com.getjar.sdk.exceptions.CommunicationException     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            java.util.Locale r3 = java.util.Locale.US     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            java.lang.String r4 = "Failed to redeem voucher token '%1$s' [%2$s]"
                            r6 = 2
                            java.lang.Object[] r6 = new java.lang.Object[r6]     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            r7 = 0
                            r0 = r17
                            java.lang.String r8 = r4     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            r6[r7] = r8     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            r7 = 1
                            java.lang.String r8 = r13.name()     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            r6[r7] = r8     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            java.lang.String r3 = java.lang.String.format(r3, r4, r6)     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            r1.<init>((java.lang.String) r3)     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            throw r1     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                        L_0x0227:
                            r1 = move-exception
                            com.getjar.sdk.logging.Area r3 = com.getjar.sdk.logging.Area.REDEEM
                            long r3 = r3.value()
                            com.getjar.sdk.logging.Area r6 = com.getjar.sdk.logging.Area.OFFER
                            long r6 = r6.value()
                            long r3 = r3 | r6
                            java.util.Locale r6 = java.util.Locale.US
                            java.lang.String r7 = "RedemptionEngine: redeemVoucherFromIntent() FINISH [%1$s]"
                            r8 = 1
                            java.lang.Object[] r8 = new java.lang.Object[r8]
                            r9 = 0
                            r8[r9] = r5
                            java.lang.String r6 = java.lang.String.format(r6, r7, r8)
                            com.getjar.sdk.logging.Logger.d(r3, r6)
                            throw r1
                        L_0x0247:
                            boolean r1 = r16.isSuccessfulResponse()     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            if (r1 != 0) goto L_0x02af
                            com.getjar.sdk.listener.VoucherRedemptionListener$FailureReason r13 = com.getjar.sdk.listener.VoucherRedemptionListener.FailureReason.GENERAL     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            java.lang.String r1 = "CALLER_NOT_FOUND"
                            java.lang.String r3 = r16.getErrorResponseCode()     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            boolean r1 = r1.equals(r3)     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            if (r1 != 0) goto L_0x0273
                            java.lang.String r1 = "CALLER_BAD_INPUT"
                            java.lang.String r3 = r16.getErrorResponseCode()     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            boolean r1 = r1.equals(r3)     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            if (r1 == 0) goto L_0x0294
                            java.lang.String r1 = "INVALID_VOUCHER_TOKEN"
                            java.lang.String r3 = r16.getErrorResponseSubcode()     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            boolean r1 = r1.equals(r3)     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            if (r1 == 0) goto L_0x0294
                        L_0x0273:
                            com.getjar.sdk.listener.VoucherRedemptionListener$FailureReason r13 = com.getjar.sdk.listener.VoucherRedemptionListener.FailureReason.INVALID_VOUCHER     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                        L_0x0275:
                            com.getjar.sdk.exceptions.CommunicationException r1 = new com.getjar.sdk.exceptions.CommunicationException     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            java.util.Locale r3 = java.util.Locale.US     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            java.lang.String r4 = "Failed to redeem voucher token '%1$s' [%2$s]"
                            r6 = 2
                            java.lang.Object[] r6 = new java.lang.Object[r6]     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            r7 = 0
                            r0 = r17
                            java.lang.String r8 = r4     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            r6[r7] = r8     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            r7 = 1
                            java.lang.String r8 = r13.name()     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            r6[r7] = r8     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            java.lang.String r3 = java.lang.String.format(r3, r4, r6)     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            r1.<init>((java.lang.String) r3)     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            throw r1     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                        L_0x0294:
                            java.lang.String r1 = "CALLER_BAD_STATE"
                            java.lang.String r3 = r16.getErrorResponseCode()     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            boolean r1 = r1.equals(r3)     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            if (r1 == 0) goto L_0x0275
                            java.lang.String r1 = "ALREADY_REDEEMED"
                            java.lang.String r3 = r16.getErrorResponseSubcode()     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            boolean r1 = r1.equals(r3)     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            if (r1 == 0) goto L_0x0275
                            com.getjar.sdk.listener.VoucherRedemptionListener$FailureReason r13 = com.getjar.sdk.listener.VoucherRedemptionListener.FailureReason.ALREADY_REDEEMED     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            goto L_0x0275
                        L_0x02af:
                            com.getjar.sdk.data.LicenseEngine r1 = new com.getjar.sdk.data.LicenseEngine     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            r1.<init>(r2)     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            r0 = r16
                            r1.updateLicenseState(r0)     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            r0 = r17
                            com.getjar.sdk.data.RedemptionEngine r4 = com.getjar.sdk.data.RedemptionEngine.this     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            r0 = r17
                            com.getjar.sdk.data.RedemptionEngine r1 = com.getjar.sdk.data.RedemptionEngine.this     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            r0 = r16
                            java.lang.String r6 = r1.getDeveloperProductId(r0)     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            java.lang.String r7 = r16.getSignedPayload()     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            java.lang.String r8 = r16.getSignature()     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            r0 = r17
                            java.util.List r9 = r2     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            r4.makeSuccessCallbacks(r5, r6, r7, r8, r9)     // Catch:{ AuthException -> 0x007e, Exception -> 0x0187 }
                            com.getjar.sdk.logging.Area r1 = com.getjar.sdk.logging.Area.REDEEM
                            long r3 = r1.value()
                            com.getjar.sdk.logging.Area r1 = com.getjar.sdk.logging.Area.OFFER
                            long r6 = r1.value()
                            long r3 = r3 | r6
                            java.util.Locale r1 = java.util.Locale.US
                            java.lang.String r6 = "RedemptionEngine: redeemVoucherFromIntent() FINISH [%1$s]"
                            r7 = 1
                            java.lang.Object[] r7 = new java.lang.Object[r7]
                            r8 = 0
                            r7[r8] = r5
                            java.lang.String r1 = java.lang.String.format(r1, r6, r7)
                            com.getjar.sdk.logging.Logger.d(r3, r1)
                            goto L_0x00c8
                        */
                        throw new UnsupportedOperationException("Method not decompiled: com.getjar.sdk.data.RedemptionEngine.AnonymousClass3.run():void");
                    }
                });
            } catch (IllegalArgumentException e) {
                throw new IllegalArgumentException(String.format(Locale.US, "'getjarIntent' 'voucherToken' extra does not contain a valid UUID [%1$s]", new Object[]{voucherToken}));
            }
        }
    }

    /* access modifiers changed from: private */
    public String getDeveloperProductId(Result result) {
        JSONObject signedPayload;
        if (!(result == null || (signedPayload = result.getSignedPayloadObject()) == null || !signedPayload.has("developer_product_id"))) {
            try {
                return signedPayload.getString("developer_product_id");
            } catch (JSONException e) {
                Logger.e(Area.REDEEM.value() | Area.OFFER.value(), "Unable to get a string value for 'developer_product_id'", e);
            }
        }
        return null;
    }

    /* access modifiers changed from: private */
    public void makeSuccessCallbacks(String workId, String productId, String signedPayload, String signature, List<VoucherRedemptionListener> callbacks) {
        for (VoucherRedemptionListener callback : callbacks) {
            try {
                Logger.v(Area.REDEEM.value() | Area.OFFER.value(), String.format(Locale.US, "RedemptionEngine: making callback.redeemSucceeded() [%1$s]", new Object[]{workId}));
                callback.redeemSucceeded(workId, productId, signedPayload, signature);
            } catch (Exception ce) {
                Logger.e(Area.REDEEM.value() | Area.OFFER.value(), String.format(Locale.US, "RedemptionEngine: callback.redeemSucceeded() failed [%1$s]", new Object[]{workId}), ce);
            }
        }
    }

    /* access modifiers changed from: private */
    public void makeFailureCallbacks(String workId, VoucherRedemptionListener.FailureReason reason, List<VoucherRedemptionListener> callbacks) {
        for (VoucherRedemptionListener callback : callbacks) {
            try {
                Logger.v(Area.REDEEM.value() | Area.OFFER.value(), String.format(Locale.US, "RedemptionEngine: making callback.redeemFailed() [%1$s]", new Object[]{workId}));
                callback.redeemFailed(workId, reason);
            } catch (Exception ce) {
                Logger.e(Area.REDEEM.value() | Area.OFFER.value(), String.format(Locale.US, "RedemptionEngine: callback.redeemFailed() failed [%1$s]", new Object[]{workId}), ce);
            }
        }
    }

    /* access modifiers changed from: private */
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
        } else if (!TestVoucherNetworkFailure.equals(voucherToken)) {
            return false;
        } else {
            makeFailureCallbacks(workId, VoucherRedemptionListener.FailureReason.NETWORK, callbacks);
            return true;
        }
    }
}
