package com.getjar.sdk.comm.auth;

import android.content.Context;
import com.getjar.sdk.comm.AuthorizationServiceProxy;
import com.getjar.sdk.comm.CommContext;
import com.getjar.sdk.comm.Operation;
import com.getjar.sdk.comm.RequestUtilities;
import com.getjar.sdk.comm.Result;
import com.getjar.sdk.comm.auth.AuthResult;
import com.getjar.sdk.data.MetadataValue;
import com.getjar.sdk.exceptions.ServiceException;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import com.getjar.sdk.utilities.ScreenUtility;
import com.getjar.sdk.utilities.StringUtility;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
/* loaded from: classes.dex */
public class EnforcedAccountUserAuthProvider implements UserAuthProvider {
    public static final String KeyPreviousAccountName = "enforced_android_account.previous_account_name";
    public static final String KeySourceAccountNameHash = "enforced_android_account.account_name_hash";
    public static final String KeySourceAppToken = "enforced_android_account.app_token";
    public static final String KeySourceUserAccessId = "enforced_android_account.user_access_id";
    public static final String KeySourceUserDeviceId = "enforced_android_account.user_device_id";

    public static String getCurrentAccountName(Context context) {
        return new AndroidAccountUserAuthProvider().getCachedAccountName(context);
    }

    @Override // com.getjar.sdk.comm.auth.AuthProvider
    public String getProviderFilter() {
        return "android_account";
    }

    @Override // com.getjar.sdk.comm.auth.UserAuthProvider
    public boolean isUINeeded(CommContext commContext, String authFlowId, ProviderHint providerHint) {
        return false;
    }

    @Override // com.getjar.sdk.comm.auth.UserAuthProvider
    public Map<String, String> getProxiableAuthData(Context context) {
        throw new UnsupportedOperationException("EnforcedAccountUserAuthProvider does not support proxied auth");
    }

    @Override // com.getjar.sdk.comm.auth.UserAuthProvider
    public UserAuthResult ensureUser(String currentAuthToken, CommContext commContext, String authFlowId, AuthUIParentInterface uiParent, ProviderHint providerHint) {
        if (StringUtility.isNullOrEmpty(currentAuthToken)) {
            throw new IllegalArgumentException("'currentAuthToken' cannot be NULL or empty");
        }
        if (commContext == null) {
            throw new IllegalArgumentException("'commContext' cannot be NULL");
        }
        if (StringUtility.isNullOrEmpty(authFlowId)) {
            throw new IllegalArgumentException("'authFlowId' cannot be NULL or empty");
        }
        if (providerHint == null) {
            throw new IllegalArgumentException("'providerHint' cannot be NULL");
        }
        if (providerHint.getData() == null) {
            throw new IllegalArgumentException("'providerHint' must have data");
        }
        String sourceAccountNameHash = providerHint.getData().get(KeySourceAccountNameHash);
        String sourceAppToken = providerHint.getData().get(KeySourceAppToken);
        String sourceUserAccessId = providerHint.getData().get(KeySourceUserAccessId);
        String sourceUserDeviceId = providerHint.getData().get(KeySourceUserDeviceId);
        String previousAccountName = providerHint.getData().get(KeyPreviousAccountName);
        if (StringUtility.isNullOrEmpty(sourceAccountNameHash)) {
            if (StringUtility.isNullOrEmpty(sourceAppToken)) {
                throw new IllegalArgumentException("'providerHint' does not contain a value for 'enforced_android_account.app_token' or 'enforced_android_account.account_name_hash'");
            }
            if (StringUtility.isNullOrEmpty(sourceUserAccessId)) {
                throw new IllegalArgumentException("'providerHint' does not contain a value for 'enforced_android_account.user_access_id' or 'enforced_android_account.account_name_hash'");
            }
            if (StringUtility.isNullOrEmpty(sourceUserDeviceId)) {
                throw new IllegalArgumentException("'providerHint' does not contain a value for 'enforced_android_account.user_device_id' or 'enforced_android_account.account_name_hash'");
            }
        }
        Logger.d(Area.AUTH.value(), "AuthFlow: EnforcedAccountUserAuthProvider: ensureUser() START");
        try {
            try {
                if (!StringUtility.isNullOrEmpty(sourceAccountNameHash)) {
                    return makeWrappedProviderCall(commContext, sourceAccountNameHash, currentAuthToken, authFlowId, uiParent, previousAccountName);
                }
                Operation operation = AuthorizationServiceProxy.getInstance().generateSignature(commContext, authFlowId, currentAuthToken, sourceUserAccessId, sourceUserDeviceId, getProviderData(commContext, uiParent, providerHint), getProviderFilter());
                Result result = operation.mo38get();
                if (result == null) {
                    Logger.e(Area.AUTH.value(), "AuthFlow: EnforcedAccountUserAuthProvider: ensureUser() failed to get results");
                    return new UserAuthResult(getProviderFilter(), AuthResult.State.UNKNOWN_FAILURE);
                } else if (result.isSuccessfulResponse()) {
                    String accountNameHash = null;
                    if (result.getResponseJson() != null && result.getResponseJson().has("return") && result.getResponseJson().getJSONObject("return").has("signature")) {
                        accountNameHash = result.getResponseJson().getJSONObject("return").getString("signature");
                    }
                    return makeWrappedProviderCall(commContext, accountNameHash, currentAuthToken, authFlowId, uiParent, previousAccountName);
                } else {
                    Logger.w(Area.AUTH.value(), "AuthFlow: EnforcedAccountUserAuthProvider: ensureUser() got failure results");
                    ServiceException servicesException = RequestUtilities.getServicesException(result);
                    if (servicesException != null) {
                        commContext.addException(servicesException);
                    }
                    if (!result.checkForBlacklistedOrUnsupported(commContext)) {
                        return new UserAuthResult(getProviderFilter(), AuthResult.State.UNKNOWN_FAILURE);
                    }
                    Logger.d(Area.AUTH.value(), "AuthFlow: EnforcedAccountUserAuthProvider: ensureUser() We are blacklisted or unsupported");
                    return new UserAuthResult(getProviderFilter(), AuthResult.State.UNSUPPORTED);
                }
            } catch (Exception e) {
                Logger.e(Area.AUTH.value(), "AuthFlow: EnforcedAccountUserAuthProvider: ensureUser() failed", e);
                Logger.d(Area.AUTH.value(), "AuthFlow: EnforcedAccountUserAuthProvider: ensureUser() DONE");
                return new UserAuthResult(getProviderFilter(), AuthResult.State.UNKNOWN_FAILURE);
            }
        } finally {
            Logger.d(Area.AUTH.value(), "AuthFlow: EnforcedAccountUserAuthProvider: ensureUser() DONE");
        }
    }

    private UserAuthResult makeWrappedProviderCall(CommContext commContext, String accountNameHash, String currentAuthToken, String authFlowId, AuthUIParentInterface uiParent, String previousAccountName) {
        Logger.v(Area.AUTH.value(), String.format(Locale.US, "AuthFlow: EnforcedAccountUserAuthProvider: makeWrappedProviderCall() for '%1$s'", accountNameHash));
        String localAccountName = AndroidAccountUserAuthProvider.getAccountNameFromHash(commContext.getApplicationContext(), accountNameHash);
        if (StringUtility.isNullOrEmpty(localAccountName)) {
            return new UserAuthResult(getProviderFilter(), AuthResult.State.UNKNOWN_FAILURE);
        }
        AndroidAccountUserAuthProvider wrappedProvider = new AndroidAccountUserAuthProvider();
        HashMap<String, String> wrappedProviderData = new HashMap<>(1);
        wrappedProviderData.put(AndroidAccountUserAuthProvider.KeySkipCacheFlag, "true");
        wrappedProviderData.put("android_account.username_data_hash", accountNameHash);
        ProviderHint providerHintForWrappedProvider = new ProviderHint(wrappedProvider.getProviderFilter(), wrappedProviderData);
        UserAuthResult userAuthResult = wrappedProvider.ensureUser(currentAuthToken, commContext, authFlowId, uiParent, providerHintForWrappedProvider);
        try {
            if (AuthResult.State.SUCCEEDED.equals(userAuthResult.getState()) && !StringUtility.isNullOrEmpty(previousAccountName) && !localAccountName.equalsIgnoreCase(previousAccountName)) {
                AccountHistoryManager.getInstance().addEvent(userAuthResult.getUserAccessId(), AccountEventType.USER_SWITCHED);
                return userAuthResult;
            }
            return userAuthResult;
        } catch (Exception e) {
            Logger.e(Area.AUTH.value(), "AccountHistoryManager work failed", e);
            return userAuthResult;
        }
    }

    private Map<String, MetadataValue> getProviderData(CommContext commContext, AuthUIParentInterface uiParent, ProviderHint providerHint) {
        if (commContext == null) {
            throw new IllegalArgumentException("'commContext' cannot be NULL");
        }
        if (providerHint == null) {
            throw new IllegalArgumentException("'providerHint' cannot be NULL");
        }
        if (providerHint.getData() == null) {
            throw new IllegalArgumentException("'providerHint' must have data");
        }
        String sourceAppToken = providerHint.getData().get(KeySourceAppToken);
        if (StringUtility.isNullOrEmpty(sourceAppToken)) {
            throw new IllegalArgumentException("'providerHint' does not contain a value for 'enforced_android_account.app_token'");
        }
        Map<? extends String, ? extends MetadataValue> deviceMetadata = commContext.getDeviceMetadata().getMetadataWithReliability();
        if (deviceMetadata == null || deviceMetadata.size() <= 0) {
            Logger.w(Area.AUTH.value(), "AuthFlow: EnforcedAccountUserAuthProvider: getProviderData() failed to get device metadata");
            return null;
        }
        Map<String, MetadataValue> providerData = new HashMap<>();
        providerData.putAll(deviceMetadata);
        providerData.putAll(ScreenUtility.getDisplayDetails(commContext.getApplicationContext()));
        AuthMetadataUtility.addSDKMetadataValues(providerData);
        providerData.put(KeySourceAppToken, new MetadataValue(sourceAppToken, MetadataValue.MetadataReliability.AVAILABLE));
        return providerData;
    }
}
