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
import java.util.concurrent.ExecutionException;
/* loaded from: classes.dex */
public class ProxyAccountUserAuthProvider implements UserAuthProvider {
    public static final String _KeyProviderHintUserDeviceHash = "android_account.user_device_hash";
    public static final String _KeyProviderHintUsernameDataHash = "android_account.username_data_hash";

    @Override // com.getjar.sdk.comm.auth.AuthProvider
    public String getProviderFilter() {
        return "proxy_account";
    }

    @Override // com.getjar.sdk.comm.auth.UserAuthProvider
    public Map<String, String> getProxiableAuthData(Context context) {
        throw new UnsupportedOperationException("'ProxyAccountUserAuthProvider' does not support getHashedAuthData()");
    }

    @Override // com.getjar.sdk.comm.auth.UserAuthProvider
    public boolean isUINeeded(CommContext commContext, String authFlowId, ProviderHint providerHint) {
        return false;
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
        validateProviderHint(providerHint);
        Logger.d(Area.AUTH.value(), "AuthFlow: ProxyAccountUserAuthProvider: ensureUser() START");
        try {
            try {
                Logger.d(Area.AUTH.value(), "AuthFlow: ProxyAccountUserAuthProvider: ensureUser() Calling validateAuth()");
                Operation operation = AuthorizationServiceProxy.getInstance().validateAuth(commContext, authFlowId, currentAuthToken, getProviderData(commContext, providerHint), getProviderFilter());
                try {
                    Result result = operation.mo38get();
                    if (result == null) {
                        Logger.e(Area.AUTH.value(), "AuthFlow: ProxyAccountUserAuthProvider: ensureUser() failed to get results");
                        return new UserAuthResult(getProviderFilter(), AuthResult.State.UNKNOWN_FAILURE);
                    } else if (!result.isSuccessfulResponse()) {
                        Logger.w(Area.AUTH.value(), "AuthFlow: ProxyAccountUserAuthProvider: ensureUser() got failure results");
                        ServiceException servicesException = RequestUtilities.getServicesException(result);
                        if (servicesException != null) {
                            commContext.addException(servicesException);
                        }
                        if (!result.checkForBlacklistedOrUnsupported(commContext)) {
                            return new UserAuthResult(getProviderFilter(), AuthResult.State.UNKNOWN_FAILURE);
                        }
                        Logger.d(Area.AUTH.value(), "AuthFlow: ProxyAccountUserAuthProvider: ensureUser() We are blacklisted or unsupported");
                        return new UserAuthResult(getProviderFilter(), AuthResult.State.UNSUPPORTED);
                    } else {
                        Logger.d(Area.AUTH.value(), "AuthFlow: ProxyAccountUserAuthProvider: ensureUser() got successful results");
                        Map<String, String> claims = AuthUtilities.getClaimsFromResult(result);
                        Map<String, SettingsValue> settings = AuthUtilities.getSettingsFromResult(result);
                        String newAuthToken = AuthUtilities.getAuthTokenFromHeaders(result);
                        long ttl = AuthUtilities.getTTLFromClaims(claims, 172800000L);
                        String userAccessId = null;
                        String userDeviceId = null;
                        if (claims != null) {
                            String userAccessId2 = claims.get(ClaimsManager.KeyClaimsUserAccessID);
                            userAccessId = userAccessId2;
                            String userDeviceId2 = claims.get(ClaimsManager.KeyClaimsUserDeviceID);
                            userDeviceId = userDeviceId2;
                        }
                        UserAuthResult authResult = new UserAuthResult(getProviderFilter(), userAccessId, userDeviceId, result.isSuccessfulCreationResponse(), newAuthToken, claims, settings, ttl);
                        Logger.d(Area.AUTH.value(), String.format(Locale.US, "AuthFlow: ProxyAccountUserAuthProvider: ensureUser() DONE [userAccessId:%1$s, userDeviceId%2$s, authToken:%3$s, claimsCount:%4$d, ttl:%5$d]", authResult.getUserAccessId(), authResult.getUserDeviceId(), authResult.getAuthToken(), Integer.valueOf(authResult.getClaims().size()), Long.valueOf(authResult.getTTL())));
                        return authResult;
                    }
                } catch (InterruptedException e) {
                    Logger.e(Area.AUTH.value(), "AuthFlow: ProxyAccountUserAuthProvider: ensureUser() operation.get() failed", e);
                    return new UserAuthResult(getProviderFilter(), AuthResult.State.UNKNOWN_FAILURE);
                } catch (ExecutionException e2) {
                    Logger.e(Area.AUTH.value(), "AuthFlow: ProxyAccountUserAuthProvider: ensureUser() operation.get() failed", e2);
                    return new UserAuthResult(getProviderFilter(), AuthResult.State.UNKNOWN_FAILURE);
                }
            } catch (Exception e3) {
                Logger.e(Area.AUTH.value(), "AuthFlow: ProxyAccountUserAuthProvider: ensureUser() failed", e3);
                Logger.d(Area.AUTH.value(), "AuthFlow: ProxyAccountUserAuthProvider: ensureUser() DONE");
                return new UserAuthResult(getProviderFilter(), AuthResult.State.UNKNOWN_FAILURE);
            }
        } finally {
            Logger.d(Area.AUTH.value(), "AuthFlow: ProxyAccountUserAuthProvider: ensureUser() DONE");
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
            Logger.w(Area.AUTH.value(), "AuthFlow: ProxyAccountUserAuthProvider: getProviderData() failed to get device metadata");
            return null;
        }
        providerData.putAll(deviceMetadata);
        providerData.putAll(ScreenUtility.getDisplayDetails(commContext.getApplicationContext()));
        AuthMetadataUtility.addSDKMetadataValues(providerData);
        return providerData;
    }

    private void validateProviderHint(ProviderHint providerHint) {
        if (isProviderHintForMe(providerHint)) {
            if (!providerHint.getData().containsKey("android_account.username_data_hash") || StringUtility.isNullOrEmpty(providerHint.getData().get("android_account.username_data_hash")) || !providerHint.getData().containsKey(_KeyProviderHintUserDeviceHash) || StringUtility.isNullOrEmpty(providerHint.getData().get(_KeyProviderHintUserDeviceHash))) {
                throw new IllegalArgumentException("'providerHint' does not contain required data");
            }
        }
    }

    private boolean isProviderHintForMe(ProviderHint providerHint) {
        return providerHint != null && providerHint.getFilter().equals(getProviderFilter());
    }
}
