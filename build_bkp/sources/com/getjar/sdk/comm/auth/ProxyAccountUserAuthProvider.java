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
import java.util.concurrent.ExecutionException;

public class ProxyAccountUserAuthProvider implements UserAuthProvider {
    public static final String _KeyProviderHintUserDeviceHash = "android_account.user_device_hash";
    public static final String _KeyProviderHintUsernameDataHash = "android_account.username_data_hash";

    public String getProviderFilter() {
        return "proxy_account";
    }

    public Map<String, String> getProxiableAuthData(Context context) {
        throw new UnsupportedOperationException("'ProxyAccountUserAuthProvider' does not support getHashedAuthData()");
    }

    public boolean isUINeeded(CommContext commContext, String authFlowId, ProviderHint providerHint) {
        return false;
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
        } else {
            validateProviderHint(providerHint);
            Logger.m640d(Area.AUTH.value(), "AuthFlow: ProxyAccountUserAuthProvider: ensureUser() START");
            try {
                Logger.m640d(Area.AUTH.value(), "AuthFlow: ProxyAccountUserAuthProvider: ensureUser() Calling validateAuth()");
                try {
                    Result result = AuthorizationServiceProxy.getInstance().validateAuth(commContext, authFlowId, currentAuthToken, getProviderData(commContext, providerHint), getProviderFilter()).get();
                    if (result == null) {
                        Logger.m642e(Area.AUTH.value(), "AuthFlow: ProxyAccountUserAuthProvider: ensureUser() failed to get results");
                        UserAuthResult userAuthResult = new UserAuthResult(getProviderFilter(), AuthResult.State.UNKNOWN_FAILURE);
                        Logger.m640d(Area.AUTH.value(), "AuthFlow: ProxyAccountUserAuthProvider: ensureUser() DONE");
                        return userAuthResult;
                    } else if (result.isSuccessfulResponse()) {
                        Logger.m640d(Area.AUTH.value(), "AuthFlow: ProxyAccountUserAuthProvider: ensureUser() got successful results");
                        Map<String, String> claims = AuthUtilities.getClaimsFromResult(result);
                        Map<String, SettingsValue> settings = AuthUtilities.getSettingsFromResult(result);
                        String newAuthToken = AuthUtilities.getAuthTokenFromHeaders(result);
                        long ttl = AuthUtilities.getTTLFromClaims(claims, 172800000);
                        String userAccessId = null;
                        String userDeviceId = null;
                        if (claims != null) {
                            userAccessId = claims.get(ClaimsManager.KeyClaimsUserAccessID);
                            userDeviceId = claims.get(ClaimsManager.KeyClaimsUserDeviceID);
                        }
                        UserAuthResult authResult = new UserAuthResult(getProviderFilter(), userAccessId, userDeviceId, result.isSuccessfulCreationResponse(), newAuthToken, claims, settings, ttl);
                        Logger.m640d(Area.AUTH.value(), String.format(Locale.US, "AuthFlow: ProxyAccountUserAuthProvider: ensureUser() DONE [userAccessId:%1$s, userDeviceId%2$s, authToken:%3$s, claimsCount:%4$d, ttl:%5$d]", new Object[]{authResult.getUserAccessId(), authResult.getUserDeviceId(), authResult.getAuthToken(), Integer.valueOf(authResult.getClaims().size()), Long.valueOf(authResult.getTTL())}));
                        Logger.m640d(Area.AUTH.value(), "AuthFlow: ProxyAccountUserAuthProvider: ensureUser() DONE");
                        return authResult;
                    } else {
                        Logger.m648w(Area.AUTH.value(), "AuthFlow: ProxyAccountUserAuthProvider: ensureUser() got failure results");
                        ServiceException servicesException = RequestUtilities.getServicesException(result);
                        if (servicesException != null) {
                            commContext.addException(servicesException);
                        }
                        if (result.checkForBlacklistedOrUnsupported(commContext)) {
                            Logger.m640d(Area.AUTH.value(), "AuthFlow: ProxyAccountUserAuthProvider: ensureUser() We are blacklisted or unsupported");
                            UserAuthResult userAuthResult2 = new UserAuthResult(getProviderFilter(), AuthResult.State.UNSUPPORTED);
                            Logger.m640d(Area.AUTH.value(), "AuthFlow: ProxyAccountUserAuthProvider: ensureUser() DONE");
                            return userAuthResult2;
                        }
                        UserAuthResult userAuthResult3 = new UserAuthResult(getProviderFilter(), AuthResult.State.UNKNOWN_FAILURE);
                        Logger.m640d(Area.AUTH.value(), "AuthFlow: ProxyAccountUserAuthProvider: ensureUser() DONE");
                        return userAuthResult3;
                    }
                } catch (InterruptedException e) {
                    Logger.m643e(Area.AUTH.value(), "AuthFlow: ProxyAccountUserAuthProvider: ensureUser() operation.get() failed", e);
                    UserAuthResult userAuthResult4 = new UserAuthResult(getProviderFilter(), AuthResult.State.UNKNOWN_FAILURE);
                    Logger.m640d(Area.AUTH.value(), "AuthFlow: ProxyAccountUserAuthProvider: ensureUser() DONE");
                    return userAuthResult4;
                } catch (ExecutionException e2) {
                    Logger.m643e(Area.AUTH.value(), "AuthFlow: ProxyAccountUserAuthProvider: ensureUser() operation.get() failed", e2);
                    UserAuthResult userAuthResult5 = new UserAuthResult(getProviderFilter(), AuthResult.State.UNKNOWN_FAILURE);
                    Logger.m640d(Area.AUTH.value(), "AuthFlow: ProxyAccountUserAuthProvider: ensureUser() DONE");
                    return userAuthResult5;
                }
            } catch (Exception e3) {
                Logger.m643e(Area.AUTH.value(), "AuthFlow: ProxyAccountUserAuthProvider: ensureUser() failed", e3);
                Logger.m640d(Area.AUTH.value(), "AuthFlow: ProxyAccountUserAuthProvider: ensureUser() DONE");
                return new UserAuthResult(getProviderFilter(), AuthResult.State.UNKNOWN_FAILURE);
            } catch (Throwable th) {
                Logger.m640d(Area.AUTH.value(), "AuthFlow: ProxyAccountUserAuthProvider: ensureUser() DONE");
                throw th;
            }
        }
    }

    private Map<String, MetadataValue> getProviderData(CommContext commContext, ProviderHint providerHint) {
        if (commContext == null) {
            throw new IllegalArgumentException("'commContext' cannot be NULL");
        }
        validateProviderHint(providerHint);
        Map<String, MetadataValue> providerData = new HashMap<>();
        providerData.put("source.provider_filter", new MetadataValue(providerHint.getFilter(), MetadataValue.MetadataReliability.AVAILABLE));
        providerData.put("android_account.username_data_hash", new MetadataValue(providerHint.getData().get("android_account.username_data_hash"), MetadataValue.MetadataReliability.AVAILABLE));
        providerData.put(_KeyProviderHintUserDeviceHash, new MetadataValue(providerHint.getData().get(_KeyProviderHintUserDeviceHash), MetadataValue.MetadataReliability.AVAILABLE));
        Map<String, MetadataValue> deviceMetadata = commContext.getDeviceMetadata().getMetadataWithReliability();
        if (deviceMetadata == null || deviceMetadata.size() <= 0) {
            Logger.m648w(Area.AUTH.value(), "AuthFlow: ProxyAccountUserAuthProvider: getProviderData() failed to get device metadata");
            return null;
        }
        providerData.putAll(deviceMetadata);
        providerData.putAll(ScreenUtility.getDisplayDetails(commContext.getApplicationContext()));
        AuthMetadataUtility.addSDKMetadataValues(providerData);
        return providerData;
    }

    private void validateProviderHint(ProviderHint providerHint) {
        if (!isProviderHintForMe(providerHint)) {
            return;
        }
        if (!providerHint.getData().containsKey("android_account.username_data_hash") || StringUtility.isNullOrEmpty(providerHint.getData().get("android_account.username_data_hash")) || !providerHint.getData().containsKey(_KeyProviderHintUserDeviceHash) || StringUtility.isNullOrEmpty(providerHint.getData().get(_KeyProviderHintUserDeviceHash))) {
            throw new IllegalArgumentException("'providerHint' does not contain required data");
        }
    }

    private boolean isProviderHintForMe(ProviderHint providerHint) {
        return providerHint != null && providerHint.getFilter().equals(getProviderFilter());
    }
}
