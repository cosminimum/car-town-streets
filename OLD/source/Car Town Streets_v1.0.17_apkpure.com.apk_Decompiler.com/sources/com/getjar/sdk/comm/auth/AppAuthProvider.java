package com.getjar.sdk.comm.auth;

import com.getjar.sdk.comm.AuthorizationServiceProxy;
import com.getjar.sdk.comm.CommContext;
import com.getjar.sdk.comm.Result;
import com.getjar.sdk.comm.auth.AuthResult;
import com.getjar.sdk.data.MetadataValue;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import com.getjar.sdk.utilities.ScreenUtility;
import com.google.android.gcm.GCMConstants;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.ExecutionException;
import org.json.JSONException;

class AppAuthProvider implements AuthProvider {
    AppAuthProvider() {
    }

    /* JADX INFO: finally extract failed */
    /* access modifiers changed from: protected */
    public AuthResult authorizeApplication(CommContext commContext, String authFlowId) {
        Logger.d(Area.AUTH.value(), "AuthFlow: authorizeApplication() START");
        try {
            try {
                Result result = AuthorizationServiceProxy.getInstance().authorize(commContext, authFlowId, getProviderData(commContext), getProviderFilter()).get();
                if (result == null) {
                    Logger.d(Area.AUTH.value(), "AuthFlow: authorizeApplication() Failed to get results, returning NULL");
                    AuthResult authResult = new AuthResult(getProviderFilter(), AuthResult.State.UNKNOWN_FAILURE);
                    Logger.d(Area.AUTH.value(), "AuthFlow: authorizeApplication() DONE");
                    return authResult;
                } else if (result.isSuccessfulResponse()) {
                    Map<String, String> claims = AuthUtilities.getClaimsFromResult(result);
                    Map<String, SettingsValue> settings = AuthUtilities.getSettingsFromResult(result);
                    AuthResult authResult2 = new AuthResult(getProviderFilter(), AuthUtilities.getAuthTokenFromHeaders(result), claims, settings, AuthUtilities.getTTLFromClaims(claims, 172800000));
                    Logger.d(Area.AUTH.value(), String.format(Locale.US, "AuthFlow: authorizeApplication() DONE [authToken:%1$s, claimsCount:%2$d, ttl:%3$d]", new Object[]{authResult2.getAuthToken(), Integer.valueOf(authResult2.getClaims().size()), Long.valueOf(authResult2.getTTL())}));
                    Logger.d(Area.AUTH.value(), "AuthFlow: authorizeApplication() DONE");
                    return authResult2;
                } else {
                    try {
                        if (result.checkForBlacklistedOrUnsupported(commContext)) {
                            Logger.d(Area.AUTH.value(), "AuthFlow: authorizeApplication() We are blacklisted or unsupported");
                            AuthResult authResult3 = new AuthResult(getProviderFilter(), AuthResult.State.UNSUPPORTED);
                            Logger.d(Area.AUTH.value(), "AuthFlow: authorizeApplication() DONE");
                            return authResult3;
                        }
                        AuthResult authResult4 = new AuthResult(getProviderFilter(), AuthResult.State.UNKNOWN_FAILURE);
                        Logger.d(Area.AUTH.value(), "AuthFlow: authorizeApplication() DONE");
                        return authResult4;
                    } catch (JSONException e) {
                        Logger.e(Area.AUTH.value(), "AuthFlow: authorizeApplication() result.checkForBlacklistedOrUnsupported() failed", e);
                        AuthResult authResult5 = new AuthResult(getProviderFilter(), AuthResult.State.UNKNOWN_FAILURE);
                        Logger.d(Area.AUTH.value(), "AuthFlow: authorizeApplication() DONE");
                        return authResult5;
                    }
                }
            } catch (InterruptedException e2) {
                Logger.e(Area.AUTH.value(), "AuthFlow: authorizeApplication() opBaseAuth.get() failed", e2);
                AuthResult authResult6 = new AuthResult(getProviderFilter(), AuthResult.State.UNKNOWN_FAILURE);
                Logger.d(Area.AUTH.value(), "AuthFlow: authorizeApplication() DONE");
                return authResult6;
            } catch (ExecutionException e3) {
                Logger.e(Area.AUTH.value(), "AuthFlow: authorizeApplication() opBaseAuth.get() failed", e3);
                AuthResult authResult7 = new AuthResult(getProviderFilter(), AuthResult.State.UNKNOWN_FAILURE);
                Logger.d(Area.AUTH.value(), "AuthFlow: authorizeApplication() DONE");
                return authResult7;
            }
        } catch (Exception e4) {
            Logger.e(Area.AUTH.value(), "AuthFlow: authorizeApplication() failed", e4);
            Logger.d(Area.AUTH.value(), "AuthFlow: authorizeApplication() DONE");
            return new AuthResult(getProviderFilter(), AuthResult.State.UNKNOWN_FAILURE);
        } catch (Throwable th) {
            Logger.d(Area.AUTH.value(), "AuthFlow: authorizeApplication() DONE");
            throw th;
        }
    }

    private Map<String, MetadataValue> getProviderData(CommContext commContext) {
        Map<String, MetadataValue> providerData = new HashMap<>();
        providerData.putAll(commContext.getDeviceMetadata().getMetadataWithReliability());
        providerData.putAll(ScreenUtility.getDisplayDetails(commContext.getApplicationContext()));
        AuthMetadataUtility.addSDKMetadataValues(providerData);
        return providerData;
    }

    public String getProviderFilter() {
        return GCMConstants.EXTRA_APPLICATION_PENDING_INTENT;
    }
}
