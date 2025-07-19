package com.getjar.sdk.comm.auth;

import com.getjar.sdk.comm.AuthorizationServiceProxy;
import com.getjar.sdk.comm.CommContext;
import com.getjar.sdk.comm.Operation;
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
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public class AppAuthProvider implements AuthProvider {
    /* JADX INFO: Access modifiers changed from: protected */
    public AuthResult authorizeApplication(CommContext commContext, String authFlowId) {
        AuthResult authResult;
        Logger.d(Area.AUTH.value(), "AuthFlow: authorizeApplication() START");
        try {
            try {
                Operation opBaseAuth = AuthorizationServiceProxy.getInstance().authorize(commContext, authFlowId, getProviderData(commContext), getProviderFilter());
                try {
                    Result result = opBaseAuth.mo38get();
                    if (result == null) {
                        Logger.d(Area.AUTH.value(), "AuthFlow: authorizeApplication() Failed to get results, returning NULL");
                        authResult = new AuthResult(getProviderFilter(), AuthResult.State.UNKNOWN_FAILURE);
                        Logger.d(Area.AUTH.value(), "AuthFlow: authorizeApplication() DONE");
                    } else if (result.isSuccessfulResponse()) {
                        Map<String, String> claims = AuthUtilities.getClaimsFromResult(result);
                        Map<String, SettingsValue> settings = AuthUtilities.getSettingsFromResult(result);
                        String authToken = AuthUtilities.getAuthTokenFromHeaders(result);
                        long ttl = AuthUtilities.getTTLFromClaims(claims, 172800000L);
                        authResult = new AuthResult(getProviderFilter(), authToken, claims, settings, ttl);
                        Logger.d(Area.AUTH.value(), String.format(Locale.US, "AuthFlow: authorizeApplication() DONE [authToken:%1$s, claimsCount:%2$d, ttl:%3$d]", authResult.getAuthToken(), Integer.valueOf(authResult.getClaims().size()), Long.valueOf(authResult.getTTL())));
                        Logger.d(Area.AUTH.value(), "AuthFlow: authorizeApplication() DONE");
                    } else {
                        try {
                            boolean isBlacklistedOrUnsupported = result.checkForBlacklistedOrUnsupported(commContext);
                            if (isBlacklistedOrUnsupported) {
                                Logger.d(Area.AUTH.value(), "AuthFlow: authorizeApplication() We are blacklisted or unsupported");
                                authResult = new AuthResult(getProviderFilter(), AuthResult.State.UNSUPPORTED);
                                Logger.d(Area.AUTH.value(), "AuthFlow: authorizeApplication() DONE");
                            } else {
                                authResult = new AuthResult(getProviderFilter(), AuthResult.State.UNKNOWN_FAILURE);
                                Logger.d(Area.AUTH.value(), "AuthFlow: authorizeApplication() DONE");
                            }
                        } catch (JSONException e) {
                            Logger.e(Area.AUTH.value(), "AuthFlow: authorizeApplication() result.checkForBlacklistedOrUnsupported() failed", e);
                            authResult = new AuthResult(getProviderFilter(), AuthResult.State.UNKNOWN_FAILURE);
                            Logger.d(Area.AUTH.value(), "AuthFlow: authorizeApplication() DONE");
                        }
                    }
                } catch (InterruptedException e2) {
                    Logger.e(Area.AUTH.value(), "AuthFlow: authorizeApplication() opBaseAuth.get() failed", e2);
                    authResult = new AuthResult(getProviderFilter(), AuthResult.State.UNKNOWN_FAILURE);
                    Logger.d(Area.AUTH.value(), "AuthFlow: authorizeApplication() DONE");
                } catch (ExecutionException e3) {
                    Logger.e(Area.AUTH.value(), "AuthFlow: authorizeApplication() opBaseAuth.get() failed", e3);
                    authResult = new AuthResult(getProviderFilter(), AuthResult.State.UNKNOWN_FAILURE);
                    Logger.d(Area.AUTH.value(), "AuthFlow: authorizeApplication() DONE");
                }
                return authResult;
            } catch (Exception e4) {
                Logger.e(Area.AUTH.value(), "AuthFlow: authorizeApplication() failed", e4);
                Logger.d(Area.AUTH.value(), "AuthFlow: authorizeApplication() DONE");
                return new AuthResult(getProviderFilter(), AuthResult.State.UNKNOWN_FAILURE);
            }
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

    @Override // com.getjar.sdk.comm.auth.AuthProvider
    public String getProviderFilter() {
        return GCMConstants.EXTRA_APPLICATION_PENDING_INTENT;
    }
}
