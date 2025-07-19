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
/* loaded from: classes.dex */
public class AuthorizationServiceProxy extends ServiceProxyBase {
    private static volatile AuthorizationServiceProxy _Instance = null;
    private static final String _CONTRACT_VERSION = "20130716";
    private static final String _URL_TEMPLATE_AUTHORIZE = String.format(Locale.US, "%1$s%2$s", "%1$sapp_auth/app/authorize?application_key=%2$s&provider_filter=%3$s&version=", _CONTRACT_VERSION);
    private static final String _URL_TEMPLATE_USER_ACCESS_ENSURE = String.format(Locale.US, "%1$s%2$s", "%1$suser_auth/user_accesses/ensure?provider_filter=%2$s&version=", _CONTRACT_VERSION);
    private static final String _URL_TEMPLATE_VALIDATE_AUTH = String.format(Locale.US, "%1$s%2$s", "%1$sauth/validate?version=", _CONTRACT_VERSION);
    private static final String _URL_TEMPLATE_VALIDATE_PROXIED_AUTH = String.format(Locale.US, "%1$s%2$s", "%1$sauth/validate?provider_filter=%2$s&version=", _CONTRACT_VERSION);
    private static final String _URL_TEMPLATE_GENERATE_SIGNATURE = String.format(Locale.US, "%1$s%2$s", "%1$sauth/generate_signature?provider_filter=%2$s&version=", _CONTRACT_VERSION);

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

    @Override // com.getjar.sdk.comm.ServiceProxyBase
    protected Request.ServiceName getServiceName() {
        return Request.ServiceName.AUTH;
    }

    public Operation authorize(CommContext commContext, String authFlowId, Map<String, MetadataValue> metadata, String providerFilter) {
        if (commContext == null) {
            throw new IllegalArgumentException("The required parameter 'commContext' was not provided");
        }
        if (StringUtility.isNullOrEmpty(authFlowId)) {
            throw new IllegalArgumentException("The required parameter 'authFlowId' was not provided");
        }
        if (metadata == null) {
            throw new IllegalArgumentException("The required parameter 'providerData' was not provided");
        }
        if (StringUtility.isNullOrEmpty(providerFilter)) {
            throw new IllegalArgumentException("The required parameter 'providerFilter' was not provided");
        }
        Map<String, String> postData = new HashMap<>(2);
        postData.put("scope", "[\"default\"]");
        try {
            postData.put("metadata", Utility.metadataMapToJsonString(metadata));
            try {
                String url = String.format(Locale.US, _URL_TEMPLATE_AUTHORIZE, GetJarConfig.getInstance(commContext, true).getDirectiveValue(GetJarConfig.KEY_AUTH_SERVICE_ENDPOINT), URLEncoder.encode(commContext.getApplicationKey(), "UTF-8"), providerFilter);
                return makeAsyncPOSTRequestForJson("authorize", Operation.Priority.HIGH, commContext, url, postData, null, null, false, true, true, authFlowId);
            } catch (UnsupportedEncodingException e) {
                throw new CommunicationException(e);
            }
        } catch (JSONException e2) {
            throw new CommunicationException(e2);
        }
    }

    public Operation userAccessEnsure(CommContext commContext, String authFlowId, String authToken, Map<String, MetadataValue> metadata, String providerFilter) {
        if (commContext == null) {
            throw new IllegalArgumentException("The required parameter 'commContext' was not provided");
        }
        if (StringUtility.isNullOrEmpty(authFlowId)) {
            throw new IllegalArgumentException("The required parameter 'authFlowId' was not provided");
        }
        if (StringUtility.isNullOrEmpty(authToken)) {
            throw new IllegalArgumentException("The required parameter 'authToken' was not provided");
        }
        if (metadata == null) {
            throw new IllegalArgumentException("The required parameter 'providerData' was not provided");
        }
        if (StringUtility.isNullOrEmpty(providerFilter)) {
            throw new IllegalArgumentException("The required parameter 'providerFilter' was not provided");
        }
        Map<String, String> postData = new HashMap<>(2);
        postData.put("scope", "[\"default\"]");
        try {
            postData.put("metadata", Utility.metadataMapToJsonString(metadata));
            Map<String, String> requestHeaders = new HashMap<>();
            requestHeaders.put(AuthManager.AUTHORIZATION_HEADER, authToken);
            String url = String.format(Locale.US, _URL_TEMPLATE_USER_ACCESS_ENSURE, GetJarConfig.getInstance(commContext, true).getDirectiveValue(GetJarConfig.KEY_AUTH_SERVICE_ENDPOINT), providerFilter);
            return makeAsyncPOSTRequestForJson("userAccessEnsure", Operation.Priority.HIGH, commContext, url, postData, requestHeaders, null, false, true, true, authFlowId);
        } catch (JSONException e) {
            throw new CommunicationException(e);
        }
    }

    public Operation validateAuth(CommContext commContext, String authFlowId, String authToken) {
        if (commContext == null) {
            throw new IllegalArgumentException("The required parameter 'commContext' was not provided");
        }
        if (StringUtility.isNullOrEmpty(authFlowId)) {
            throw new IllegalArgumentException("The required parameter 'authFlowId' was not provided");
        }
        if (StringUtility.isNullOrEmpty(authToken)) {
            throw new IllegalArgumentException("The required parameter 'authToken' was not provided");
        }
        Map<String, String> requestHeaders = new HashMap<>();
        requestHeaders.put(AuthManager.AUTHORIZATION_HEADER, authToken);
        String url = String.format(Locale.US, _URL_TEMPLATE_VALIDATE_AUTH, GetJarConfig.getInstance(commContext, true).getDirectiveValue(GetJarConfig.KEY_AUTH_SERVICE_ENDPOINT));
        return makeAsyncGETRequestForJson("validateAuth", Operation.Priority.HIGH, commContext, url, requestHeaders, null, false, true, true, authFlowId);
    }

    public Operation validateAuth(CommContext commContext, String authFlowId, String authToken, Map<String, MetadataValue> metadata, String providerFilter) {
        if (commContext == null) {
            throw new IllegalArgumentException("The required parameter 'commContext' was not provided");
        }
        if (StringUtility.isNullOrEmpty(authFlowId)) {
            throw new IllegalArgumentException("The required parameter 'authFlowId' was not provided");
        }
        if (StringUtility.isNullOrEmpty(authToken)) {
            throw new IllegalArgumentException("The required parameter 'authToken' was not provided");
        }
        if (metadata == null) {
            throw new IllegalArgumentException("The required parameter 'providerData' was not provided");
        }
        if (StringUtility.isNullOrEmpty(providerFilter)) {
            throw new IllegalArgumentException("The required parameter 'providerFilter' was not provided");
        }
        Map<String, String> postData = new HashMap<>(1);
        try {
            postData.put("metadata", Utility.metadataMapToJsonString(metadata));
            Map<String, String> requestHeaders = new HashMap<>();
            requestHeaders.put(AuthManager.AUTHORIZATION_HEADER, authToken);
            String url = String.format(Locale.US, _URL_TEMPLATE_VALIDATE_PROXIED_AUTH, GetJarConfig.getInstance(commContext, true).getDirectiveValue(GetJarConfig.KEY_AUTH_SERVICE_ENDPOINT), providerFilter);
            return makeAsyncPOSTRequestForJson("validateProxyAuth", Operation.Priority.HIGH, commContext, url, postData, requestHeaders, null, false, true, true, authFlowId);
        } catch (JSONException e) {
            throw new CommunicationException(e);
        }
    }

    public Operation generateSignature(CommContext commContext, String authFlowId, String authToken, String sourceUserAccessId, String sourceUserDeviceId, Map<String, MetadataValue> metadata, String providerFilter) {
        if (commContext == null) {
            throw new IllegalArgumentException("The required parameter 'commContext' was not provided");
        }
        if (StringUtility.isNullOrEmpty(authFlowId)) {
            throw new IllegalArgumentException("The required parameter 'authFlowId' was not provided");
        }
        if (StringUtility.isNullOrEmpty(authToken)) {
            throw new IllegalArgumentException("The required parameter 'authToken' was not provided");
        }
        if (StringUtility.isNullOrEmpty(sourceUserAccessId)) {
            throw new IllegalArgumentException("The required parameter 'userAccessId' was not provided");
        }
        if (StringUtility.isNullOrEmpty(sourceUserDeviceId)) {
            throw new IllegalArgumentException("The required parameter 'userDeviceId' was not provided");
        }
        if (metadata == null) {
            throw new IllegalArgumentException("The required parameter 'providerData' was not provided");
        }
        if (StringUtility.isNullOrEmpty(providerFilter)) {
            throw new IllegalArgumentException("The required parameter 'providerFilter' was not provided");
        }
        Map<String, String> postData = new HashMap<>(1);
        try {
            postData.put("metadata", Utility.metadataMapToJsonString(metadata));
            postData.put("user_access_id", sourceUserAccessId);
            postData.put("user_device_id", sourceUserDeviceId);
            Map<String, String> requestHeaders = new HashMap<>();
            requestHeaders.put(AuthManager.AUTHORIZATION_HEADER, authToken);
            String url = String.format(Locale.US, _URL_TEMPLATE_GENERATE_SIGNATURE, GetJarConfig.getInstance(commContext, true).getDirectiveValue(GetJarConfig.KEY_AUTH_SERVICE_ENDPOINT), providerFilter);
            return makeAsyncPOSTRequestForJson("validateProxyAuth", Operation.Priority.HIGH, commContext, url, postData, requestHeaders, null, false, true, true, authFlowId);
        } catch (JSONException e) {
            throw new CommunicationException(e);
        }
    }
}
