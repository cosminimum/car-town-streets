package com.getjar.sdk.comm;

import com.getjar.sdk.comm.Operation;
import com.getjar.sdk.comm.Request;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import com.getjar.sdk.utilities.StringUtility;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.Map;
/* loaded from: classes.dex */
public abstract class ServiceProxyBase {
    public static final String USER_AGENT_HEADER = "User-Agent";

    protected abstract Request.ServiceName getServiceName();

    /* JADX INFO: Access modifiers changed from: protected */
    public Operation makeAsyncGETRequestForJson(String requestType, Operation.Priority priority, CommContext commContext, String urlStr, Map<String, String> requestHeaders, CallbackInterface callbacks, boolean suppressInternalCallbacks, boolean doNotCache, boolean isIdempotent) {
        return makeAsyncGETRequestForJson(requestType, priority, commContext, urlStr, requestHeaders, callbacks, suppressInternalCallbacks, doNotCache, isIdempotent, null);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public Operation makeAsyncGETRequestForJson(String requestType, Operation.Priority priority, CommContext commContext, String urlStr, Map<String, String> requestHeaders, CallbackInterface callbacks, boolean suppressInternalCallbacks, boolean doNotCache, boolean isIdempotent, String authFlowId) {
        if (priority == null) {
            throw new IllegalArgumentException("'priority' can not be NULL");
        }
        if (commContext == null) {
            throw new IllegalArgumentException("'commContext' can not be NULL");
        }
        if (StringUtility.isNullOrEmpty(urlStr)) {
            throw new IllegalArgumentException("'urlStr' can not be NULL or empty");
        }
        try {
            URI uri = new URI(urlStr);
            CommManager.initialize(commContext.getApplicationContext());
            Operation operation = CommManager.getInstance().enqueueOperation(getServiceName(), requestType, uri, Request.HttpMethod.GET, null, requestHeaders, priority, commContext, false, doNotCache, isIdempotent, authFlowId);
            StatisticsTracker.logRequest(operation);
            if (callbacks != null) {
                mapWaitToCallbacks(operation, callbacks);
            }
            return operation;
        } catch (URISyntaxException e) {
            throw new RuntimeException(e);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public Operation makeAsyncPOSTRequestForJson(String requestType, Operation.Priority priority, CommContext commContext, String urlStr, Map<String, String> postData, Map<String, String> requestHeaders, CallbackInterface callbacks, boolean suppressInternalCallbacks, boolean doNotCache, boolean isIdempotent) {
        return makeAsyncPOSTRequestForJson(requestType, priority, commContext, urlStr, postData, requestHeaders, callbacks, suppressInternalCallbacks, doNotCache, isIdempotent, null);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public Operation makeAsyncPOSTRequestForJson(String requestType, Operation.Priority priority, CommContext commContext, String urlStr, Map<String, String> postData, Map<String, String> requestHeaders, CallbackInterface callbacks, boolean suppressInternalCallbacks, boolean doNotCache, boolean isIdempotent, String authFlowId) {
        if (priority == null) {
            throw new IllegalArgumentException("'priority' can not be NULL");
        }
        if (commContext == null) {
            throw new IllegalArgumentException("'commContext' can not be NULL");
        }
        if (StringUtility.isNullOrEmpty(urlStr)) {
            throw new IllegalArgumentException("'urlStr' can not be NULL or empty");
        }
        try {
            URI uri = new URI(urlStr);
            CommManager.initialize(commContext.getApplicationContext());
            Operation operation = CommManager.getInstance().enqueueOperation(getServiceName(), requestType, uri, Request.HttpMethod.POST, postData, requestHeaders, priority, commContext, false, doNotCache, isIdempotent, authFlowId);
            StatisticsTracker.logRequest(operation);
            if (callbacks != null) {
                mapWaitToCallbacks(operation, callbacks);
            }
            return operation;
        } catch (URISyntaxException e) {
            throw new RuntimeException(e);
        }
    }

    private void mapWaitToCallbacks(final Operation operation, final CallbackInterface callbacks) {
        new Thread(new Runnable() { // from class: com.getjar.sdk.comm.ServiceProxyBase.1
            @Override // java.lang.Runnable
            public void run() {
                try {
                    operation.mapResultToCallbacks(callbacks);
                } catch (Exception e) {
                    Logger.e(Area.COMM.value(), "Legacy Callback Mapping Thread failed", e);
                }
            }
        }, "Legacy Callback Mapping Thread").start();
    }
}
