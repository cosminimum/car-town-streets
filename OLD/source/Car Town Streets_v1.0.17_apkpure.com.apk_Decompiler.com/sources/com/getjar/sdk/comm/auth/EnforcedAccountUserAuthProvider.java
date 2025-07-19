package com.getjar.sdk.comm.auth;

import android.content.Context;
import com.getjar.sdk.comm.AuthorizationServiceProxy;
import com.getjar.sdk.comm.CommContext;
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

public class EnforcedAccountUserAuthProvider implements UserAuthProvider {
    public static final String KeyPreviousAccountName = "enforced_android_account.previous_account_name";
    public static final String KeySourceAccountNameHash = "enforced_android_account.account_name_hash";
    public static final String KeySourceAppToken = "enforced_android_account.app_token";
    public static final String KeySourceUserAccessId = "enforced_android_account.user_access_id";
    public static final String KeySourceUserDeviceId = "enforced_android_account.user_device_id";

    public static String getCurrentAccountName(Context context) {
        return new AndroidAccountUserAuthProvider().getCachedAccountName(context);
    }

    public String getProviderFilter() {
        return "android_account";
    }

    public boolean isUINeeded(CommContext commContext, String authFlowId, ProviderHint providerHint) {
        return false;
    }

    public Map<String, String> getProxiableAuthData(Context context) {
        throw new UnsupportedOperationException("EnforcedAccountUserAuthProvider does not support proxied auth");
    }

    /* JADX INFO: finally extract failed */
    public UserAuthResult ensureUser(String currentAuthToken, CommContext commContext, String authFlowId, AuthUIParentInterface uiParent, ProviderHint providerHint) {
        if (StringUtility.isNullOrEmpty(currentAuthToken)) {
            throw new IllegalArgumentException("'currentAuthToken' cannot be NULL or empty");
        } else if (commContext == null) {
            throw new IllegalArgumentException("'commContext' cannot be NULL");
        } else if (StringUtility.isNullOrEmpty(authFlowId)) {
            throw new IllegalArgumentException("'authFlowId' cannot be NULL or empty");
        } else if (providerHint == null) {
            throw new IllegalArgumentException("'providerHint' cannot be NULL");
        } else if (providerHint.getData() == null) {
            throw new IllegalArgumentException("'providerHint' must have data");
        } else {
            String sourceAccountNameHash = providerHint.getData().get(KeySourceAccountNameHash);
            String sourceAppToken = providerHint.getData().get(KeySourceAppToken);
            String sourceUserAccessId = providerHint.getData().get(KeySourceUserAccessId);
            String sourceUserDeviceId = providerHint.getData().get(KeySourceUserDeviceId);
            String previousAccountName = providerHint.getData().get(KeyPreviousAccountName);
            if (StringUtility.isNullOrEmpty(sourceAccountNameHash)) {
                if (StringUtility.isNullOrEmpty(sourceAppToken)) {
                    throw new IllegalArgumentException("'providerHint' does not contain a value for 'enforced_android_account.app_token' or 'enforced_android_account.account_name_hash'");
                } else if (StringUtility.isNullOrEmpty(sourceUserAccessId)) {
                    throw new IllegalArgumentException("'providerHint' does not contain a value for 'enforced_android_account.user_access_id' or 'enforced_android_account.account_name_hash'");
                } else if (StringUtility.isNullOrEmpty(sourceUserDeviceId)) {
                    throw new IllegalArgumentException("'providerHint' does not contain a value for 'enforced_android_account.user_device_id' or 'enforced_android_account.account_name_hash'");
                }
            }
            Logger.d(Area.AUTH.value(), "AuthFlow: EnforcedAccountUserAuthProvider: ensureUser() START");
            try {
                if (!StringUtility.isNullOrEmpty(sourceAccountNameHash)) {
                    UserAuthResult makeWrappedProviderCall = makeWrappedProviderCall(commContext, sourceAccountNameHash, currentAuthToken, authFlowId, uiParent, previousAccountName);
                    Logger.d(Area.AUTH.value(), "AuthFlow: EnforcedAccountUserAuthProvider: ensureUser() DONE");
                    return makeWrappedProviderCall;
                }
                Result result = AuthorizationServiceProxy.getInstance().generateSignature(commContext, authFlowId, currentAuthToken, sourceUserAccessId, sourceUserDeviceId, getProviderData(commContext, uiParent, providerHint), getProviderFilter()).get();
                if (result == null) {
                    Logger.e(Area.AUTH.value(), "AuthFlow: EnforcedAccountUserAuthProvider: ensureUser() failed to get results");
                    UserAuthResult userAuthResult = new UserAuthResult(getProviderFilter(), AuthResult.State.UNKNOWN_FAILURE);
                    Logger.d(Area.AUTH.value(), "AuthFlow: EnforcedAccountUserAuthProvider: ensureUser() DONE");
                    return userAuthResult;
                } else if (!result.isSuccessfulResponse()) {
                    Logger.w(Area.AUTH.value(), "AuthFlow: EnforcedAccountUserAuthProvider: ensureUser() got failure results");
                    ServiceException servicesException = RequestUtilities.getServicesException(result);
                    if (servicesException != null) {
                        commContext.addException(servicesException);
                    }
                    if (result.checkForBlacklistedOrUnsupported(commContext)) {
                        Logger.d(Area.AUTH.value(), "AuthFlow: EnforcedAccountUserAuthProvider: ensureUser() We are blacklisted or unsupported");
                        UserAuthResult userAuthResult2 = new UserAuthResult(getProviderFilter(), AuthResult.State.UNSUPPORTED);
                        Logger.d(Area.AUTH.value(), "AuthFlow: EnforcedAccountUserAuthProvider: ensureUser() DONE");
                        return userAuthResult2;
                    }
                    UserAuthResult userAuthResult3 = new UserAuthResult(getProviderFilter(), AuthResult.State.UNKNOWN_FAILURE);
                    Logger.d(Area.AUTH.value(), "AuthFlow: EnforcedAccountUserAuthProvider: ensureUser() DONE");
                    return userAuthResult3;
                } else {
                    String accountNameHash = null;
                    if (result.getResponseJson() != null && result.getResponseJson().has("return") && result.getResponseJson().getJSONObject("return").has("signature")) {
                        accountNameHash = result.getResponseJson().getJSONObject("return").getString("signature");
                    }
                    UserAuthResult makeWrappedProviderCall2 = makeWrappedProviderCall(commContext, accountNameHash, currentAuthToken, authFlowId, uiParent, previousAccountName);
                    Logger.d(Area.AUTH.value(), "AuthFlow: EnforcedAccountUserAuthProvider: ensureUser() DONE");
                    return makeWrappedProviderCall2;
                }
            } catch (Exception e) {
                Logger.e(Area.AUTH.value(), "AuthFlow: EnforcedAccountUserAuthProvider: ensureUser() failed", e);
                Logger.d(Area.AUTH.value(), "AuthFlow: EnforcedAccountUserAuthProvider: ensureUser() DONE");
                return new UserAuthResult(getProviderFilter(), AuthResult.State.UNKNOWN_FAILURE);
            } catch (Throwable th) {
                Logger.d(Area.AUTH.value(), "AuthFlow: EnforcedAccountUserAuthProvider: ensureUser() DONE");
                throw th;
            }
        }
    }

    private UserAuthResult makeWrappedProviderCall(CommContext commContext, String accountNameHash, String currentAuthToken, String authFlowId, AuthUIParentInterface uiParent, String previousAccountName) {
        Logger.v(Area.AUTH.value(), String.format(Locale.US, "AuthFlow: EnforcedAccountUserAuthProvider: makeWrappedProviderCall() for '%1$s'", new Object[]{accountNameHash}));
        String localAccountName = AndroidAccountUserAuthProvider.getAccountNameFromHash(commContext.getApplicationContext(), accountNameHash);
        if (StringUtility.isNullOrEmpty(localAccountName)) {
            return new UserAuthResult(getProviderFilter(), AuthResult.State.UNKNOWN_FAILURE);
        }
        AndroidAccountUserAuthProvider wrappedProvider = new AndroidAccountUserAuthProvider();
        HashMap<String, String> wrappedProviderData = new HashMap<>(1);
        wrappedProviderData.put(AndroidAccountUserAuthProvider.KeySkipCacheFlag, "true");
        wrappedProviderData.put("android_account.username_data_hash", accountNameHash);
        UserAuthResult userAuthResult = wrappedProvider.ensureUser(currentAuthToken, commContext, authFlowId, uiParent, new ProviderHint(wrappedProvider.getProviderFilter(), wrappedProviderData));
        try {
            if (!AuthResult.State.SUCCEEDED.equals(userAuthResult.getState()) || StringUtility.isNullOrEmpty(previousAccountName) || localAccountName.equalsIgnoreCase(previousAccountName)) {
                return userAuthResult;
            }
            AccountHistoryManager.getInstance().addEvent(userAuthResult.getUserAccessId(), AccountEventType.USER_SWITCHED);
            return userAuthResult;
        } catch (Exception e) {
            Logger.e(Area.AUTH.value(), "AccountHistoryManager work failed", e);
            return userAuthResult;
        }
    }

    private Map<String, MetadataValue> getProviderData(CommContext commContext, AuthUIParentInterface uiParent, ProviderHint providerHint) {
        if (commContext == null) {
            throw new IllegalArgumentException("'commContext' cannot be NULL");
        } else if (providerHint == null) {
            throw new IllegalArgumentException("'providerHint' cannot be NULL");
        } else if (providerHint.getData() == null) {
            throw new IllegalArgumentException("'providerHint' must have data");
        } else {
            String sourceAppToken = providerHint.getData().get(KeySourceAppToken);
            if (StringUtility.isNullOrEmpty(sourceAppToken)) {
                throw new IllegalArgumentException("'providerHint' does not contain a value for 'enforced_android_account.app_token'");
            }
            Map<String, MetadataValue> deviceMetadata = commContext.getDeviceMetadata().getMetadataWithReliability();
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
}
