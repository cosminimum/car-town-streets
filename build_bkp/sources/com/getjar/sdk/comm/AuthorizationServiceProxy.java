package com.getjar.sdk.comm;

import com.getjar.sdk.comm.Operation;
import com.getjar.sdk.comm.Request;
import com.getjar.sdk.comm.auth.AuthManager;
import com.getjar.sdk.data.MetadataValue;
import com.getjar.sdk.exceptions.CommunicationException;
import com.getjar.sdk.utilities.StringUtility;
import com.getjar.sdk.utilities.Utility;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import org.json.JSONException;

public class AuthorizationServiceProxy extends ServiceProxyBase {
    private static final String _CONTRACT_VERSION = "20130716";
    private static volatile AuthorizationServiceProxy _Instance = null;
    private static final String _URL_TEMPLATE_AUTHORIZE = String.format(Locale.US, "%1$s%2$s", new Object[]{"%1$sapp_auth/app/authorize?application_key=%2$s&provider_filter=%3$s&version=", _CONTRACT_VERSION});
    private static final String _URL_TEMPLATE_GENERATE_SIGNATURE = String.format(Locale.US, "%1$s%2$s", new Object[]{"%1$sauth/generate_signature?provider_filter=%2$s&version=", _CONTRACT_VERSION});
    private static final String _URL_TEMPLATE_USER_ACCESS_ENSURE = String.format(Locale.US, "%1$s%2$s", new Object[]{"%1$suser_auth/user_accesses/ensure?provider_filter=%2$s&version=", _CONTRACT_VERSION});
    private static final String _URL_TEMPLATE_VALIDATE_AUTH = String.format(Locale.US, "%1$s%2$s", new Object[]{"%1$sauth/validate?version=", _CONTRACT_VERSION});
    private static final String _URL_TEMPLATE_VALIDATE_PROXIED_AUTH = String.format(Locale.US, "%1$s%2$s", new Object[]{"%1$sauth/validate?provider_filter=%2$s&version=", _CONTRACT_VERSION});

    private AuthorizationServiceProxy() {
    }

    private static synchronized void makeTheInstance() {
        synchronized (AuthorizationServiceProxy.class) {
            if (_Instance == null) {
                _Instance = new AuthorizationServiceProxy();
            }
        }
    }

    public static AuthorizationServiceProxy getInstance() {
        if (_Instance == null) {
            makeTheInstance();
        }
        return _Instance;
    }

    /* access modifiers changed from: protected */
    public Request.ServiceName getServiceName() {
        return Request.ServiceName.AUTH;
    }

    public Operation authorize(CommContext commContext, String authFlowId, Map<String, MetadataValue> metadata, String providerFilter) {
        if (commContext == null) {
            throw new IllegalArgumentException("The required parameter 'commContext' was not provided");
        } else if (StringUtility.isNullOrEmpty(authFlowId)) {
            throw new IllegalArgumentException("The required parameter 'authFlowId' was not provided");
        } else if (metadata == null) {
            throw new IllegalArgumentException("The required parameter 'providerData' was not provided");
        } else if (StringUtility.isNullOrEmpty(providerFilter)) {
            throw new IllegalArgumentException("The required parameter 'providerFilter' was not provided");
        } else {
            Map<String, String> postData = new HashMap<>(2);
            postData.put("scope", "[\"default\"]");
            try {
                postData.put("metadata", Utility.metadataMapToJsonString(metadata));
                try {
                    return makeAsyncPOSTRequestForJson("authorize", Operation.Priority.HIGH, commContext, String.format(Locale.US, _URL_TEMPLATE_AUTHORIZE, new Object[]{GetJarConfig.getInstance(commContext, true).getDirectiveValue(GetJarConfig.KEY_AUTH_SERVICE_ENDPOINT), URLEncoder.encode(commContext.getApplicationKey(), "UTF-8"), providerFilter}), postData, (Map<String, String>) null, (CallbackInterface) null, false, true, true, authFlowId);
                } catch (UnsupportedEncodingException e) {
                    throw new CommunicationException((Throwable) e);
                }
            } catch (JSONException e2) {
                throw new CommunicationException((Throwable) e2);
            }
        }
    }

    public Operation userAccessEnsure(CommContext commContext, String authFlowId, String authToken, Map<String, MetadataValue> metadata, String providerFilter) {
        if (commContext == null) {
            throw new IllegalArgumentException("The required parameter 'commContext' was not provided");
        } else if (StringUtility.isNullOrEmpty(authFlowId)) {
            throw new IllegalArgumentException("The required parameter 'authFlowId' was not provided");
        } else if (StringUtility.isNullOrEmpty(authToken)) {
            throw new IllegalArgumentException("The required parameter 'authToken' was not provided");
        } else if (metadata == null) {
            throw new IllegalArgumentException("The required parameter 'providerData' was not provided");
        } else if (StringUtility.isNullOrEmpty(providerFilter)) {
            throw new IllegalArgumentException("The required parameter 'providerFilter' was not provided");
        } else {
            Map<String, String> postData = new HashMap<>(2);
            postData.put("scope", "[\"default\"]");
            try {
                postData.put("metadata", Utility.metadataMapToJsonString(metadata));
                Map<String, String> requestHeaders = new HashMap<>();
                requestHeaders.put(AuthManager.AUTHORIZATION_HEADER, authToken);
                return makeAsyncPOSTRequestForJson("userAccessEnsure", Operation.Priority.HIGH, commContext, String.format(Locale.US, _URL_TEMPLATE_USER_ACCESS_ENSURE, new Object[]{GetJarConfig.getInstance(commContext, true).getDirectiveValue(GetJarConfig.KEY_AUTH_SERVICE_ENDPOINT), providerFilter}), postData, requestHeaders, (CallbackInterface) null, false, true, true, authFlowId);
            } catch (JSONException e) {
                throw new CommunicationException((Throwable) e);
            }
        }
    }

    public Operation validateAuth(CommContext commContext, String authFlowId, String authToken) {
        if (commContext == null) {
            throw new IllegalArgumentException("The required parameter 'commContext' was not provided");
        } else if (StringUtility.isNullOrEmpty(authFlowId)) {
            throw new IllegalArgumentException("The required parameter 'authFlowId' was not provided");
        } else if (StringUtility.isNullOrEmpty(authToken)) {
            throw new IllegalArgumentException("The required parameter 'authToken' was not provided");
        } else {
            Map<String, String> requestHeaders = new HashMap<>();
            requestHeaders.put(AuthManager.AUTHORIZATION_HEADER, authToken);
            return makeAsyncGETRequestForJson("validateAuth", Operation.Priority.HIGH, commContext, String.format(Locale.US, _URL_TEMPLATE_VALIDATE_AUTH, new Object[]{GetJarConfig.getInstance(commContext, true).getDirectiveValue(GetJarConfig.KEY_AUTH_SERVICE_ENDPOINT)}), requestHeaders, (CallbackInterface) null, false, true, true, authFlowId);
        }
    }

    public Operation validateAuth(CommContext commContext, String authFlowId, String authToken, Map<String, MetadataValue> metadata, String providerFilter) {
        if (commContext == null) {
            throw new IllegalArgumentException("The required parameter 'commContext' was not provided");
        } else if (StringUtility.isNullOrEmpty(authFlowId)) {
            throw new IllegalArgumentException("The required parameter 'authFlowId' was not provided");
        } else if (StringUtility.isNullOrEmpty(authToken)) {
            throw new IllegalArgumentException("The required parameter 'authToken' was not provided");
        } else if (metadata == null) {
            throw new IllegalArgumentException("The required parameter 'providerData' was not provided");
        } else if (StringUtility.isNullOrEmpty(providerFilter)) {
            throw new IllegalArgumentException("The required parameter 'providerFilter' was not provided");
        } else {
            Map<String, String> postData = new HashMap<>(1);
            try {
                postData.put("metadata", Utility.metadataMapToJsonString(metadata));
                Map<String, String> requestHeaders = new HashMap<>();
                requestHeaders.put(AuthManager.AUTHORIZATION_HEADER, authToken);
                return makeAsyncPOSTRequestForJson("validateProxyAuth", Operation.Priority.HIGH, commContext, String.format(Locale.US, _URL_TEMPLATE_VALIDATE_PROXIED_AUTH, new Object[]{GetJarConfig.getInstance(commContext, true).getDirectiveValue(GetJarConfig.KEY_AUTH_SERVICE_ENDPOINT), providerFilter}), postData, requestHeaders, (CallbackInterface) null, false, true, true, authFlowId);
            } catch (JSONException e) {
                throw new CommunicationException((Throwable) e);
            }
        }
    }

    public Operation generateSignature(CommContext commContext, String authFlowId, String authToken, String sourceUserAccessId, String sourceUserDeviceId, Map<String, MetadataValue> metadata, String providerFilter) {
        if (commContext == null) {
            throw new IllegalArgumentException("The required parameter 'commContext' was not provided");
        } else if (StringUtility.isNullOrEmpty(authFlowId)) {
            throw new IllegalArgumentException("The required parameter 'authFlowId' was not provided");
        } else if (StringUtility.isNullOrEmpty(authToken)) {
            throw new IllegalArgumentException("The required parameter 'authToken' was not provided");
        } else if (StringUtility.isNullOrEmpty(sourceUserAccessId)) {
            throw new IllegalArgumentException("The required parameter 'userAccessId' was not provided");
        } else if (StringUtility.isNullOrEmpty(sourceUserDeviceId)) {
            throw new IllegalArgumentException("The required parameter 'userDeviceId' was not provided");
        } else if (metadata == null) {
            throw new IllegalArgumentException("The required parameter 'providerData' was not provided");
        } else if (StringUtility.isNullOrEmpty(providerFilter)) {
            throw new IllegalArgumentException("The required parameter 'providerFilter' was not provided");
        } else {
            Map<String, String> postData = new HashMap<>(1);
            try {
                postData.put("metadata", Utility.metadataMapToJsonString(metadata));
                postData.put("user_access_id", sourceUserAccessId);
                postData.put("user_device_id", sourceUserDeviceId);
                Map<String, String> requestHeaders = new HashMap<>();
                requestHeaders.put(AuthManager.AUTHORIZATION_HEADER, authToken);
                return makeAsyncPOSTRequestForJson("validateProxyAuth", Operation.Priority.HIGH, commContext, String.format(Locale.US, _URL_TEMPLATE_GENERATE_SIGNATURE, new Object[]{GetJarConfig.getInstance(commContext, true).getDirectiveValue(GetJarConfig.KEY_AUTH_SERVICE_ENDPOINT), providerFilter}), postData, requestHeaders, (CallbackInterface) null, false, true, true, authFlowId);
            } catch (JSONException e) {
                throw new CommunicationException((Throwable) e);
            }
        }
    }
}
