package com.getjar.sdk.comm;

import com.getjar.sdk.comm.Request;
import com.getjar.sdk.exceptions.ServiceException;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import com.getjar.sdk.utilities.StringUtility;
import com.tapjoy.TapjoyConstants;
import java.net.URI;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;
import java.util.concurrent.FutureTask;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import org.json.JSONException;

public class Operation implements Future<Result> {
    private static long _PriorityPromotionIntervalInMilliseconds = TapjoyConstants.THROTTLE_GET_TAP_POINTS_INTERVAL;
    private final String _authFlowId;
    private final CommContext _commContext;
    private final long _createdTimestamp;
    private final boolean _doNotCache;
    private Exception _exception = null;
    private volatile FutureTask<Result> _future = null;
    private final boolean _isIdempotent;
    private long _lastPriorityPromotionTimestamp;
    private int _priority;
    private int _reauthThenRetryCount = 0;
    private final Request _request;
    private Result _result = null;
    private int _retryAfterCount = 0;
    private long _retryAfterTimestamp;
    private final Priority _startingPriority;
    private Status _state = Status.CREATED;
    private final boolean _suppressInternalCallbacks;

    public enum Status {
        CREATED,
        WAITING,
        RUNNING,
        RETRYING,
        CANCELLED,
        COMPLETED
    }

    public enum Priority {
        LOW(10),
        MEDIUM(7),
        HIGH(3);
        
        private int _value;

        private Priority(int value) {
            this._value = value;
        }

        public int getValue() {
            return this._value;
        }
    }

    protected Operation(Request.ServiceName serviceName, String requestType, URI requestUri, Request.HttpMethod httpMethod, Map<String, String> postData, Map<String, String> requestHeaders, Priority priority, CommContext commContext, boolean suppressInternalCallbacks, boolean doNotCache, boolean isIdempotent, String authFlowId) {
        if (serviceName == null) {
            throw new IllegalArgumentException("'serviceName' can not be NULL");
        } else if (StringUtility.isNullOrEmpty(requestType)) {
            throw new IllegalArgumentException("'requestType' can not be NULL or empty");
        } else if (priority == null) {
            throw new IllegalArgumentException("'priority' can not be NULL");
        } else if (requestUri == null) {
            throw new IllegalArgumentException("'requestUri' can not be NULL");
        } else if (httpMethod == null) {
            throw new IllegalArgumentException("'httpMethod' can not be NULL");
        } else if (commContext == null) {
            throw new IllegalArgumentException("'commContext' can not be NULL");
        } else if (postData == null || Request.HttpMethod.POST.equals(httpMethod)) {
            this._startingPriority = priority;
            this._commContext = commContext;
            this._suppressInternalCallbacks = suppressInternalCallbacks;
            this._doNotCache = doNotCache;
            this._isIdempotent = isIdempotent;
            this._authFlowId = authFlowId;
            this._priority = priority.getValue();
            this._createdTimestamp = System.currentTimeMillis();
            this._lastPriorityPromotionTimestamp = this._createdTimestamp;
            this._exception = null;
            this._state = Status.CREATED;
            this._request = new Request(serviceName, requestType, requestUri, httpMethod, postData, requestHeaders);
        } else {
            throw new IllegalArgumentException("'postData' can only be provided for requests of method type \"POST\"");
        }
    }

    public int getReauthThenRetryCount() {
        return this._reauthThenRetryCount;
    }

    public void updateStateForRetryAfterReauth() {
        this._reauthThenRetryCount++;
        setState(Status.RETRYING);
        if (this._priority <= Priority.HIGH.getValue()) {
            this._priority = Priority.MEDIUM.getValue();
        }
    }

    public boolean isIdempotent() {
        return this._isIdempotent;
    }

    public Status getState() {
        return this._state;
    }

    /* access modifiers changed from: protected */
    public void setState(Status state) {
        if (state == null) {
            throw new IllegalArgumentException("'state' can not be NULL");
        }
        this._state = state;
    }

    public Priority getStartingPriority() {
        return this._startingPriority;
    }

    public int getPriority() {
        return this._priority;
    }

    public long getCreatedTimestamp() {
        return this._createdTimestamp;
    }

    public long getLastPriorityPromotionTimestamp() {
        return this._lastPriorityPromotionTimestamp;
    }

    /* access modifiers changed from: protected */
    public long getRetryAfterTimestamp() {
        return this._retryAfterTimestamp;
    }

    /* access modifiers changed from: protected */
    public void updateRetryAfterTimestamp(long retryAfterDeltaInMilliseconds) {
        this._retryAfterTimestamp = System.currentTimeMillis() + retryAfterDeltaInMilliseconds;
    }

    /* access modifiers changed from: protected */
    public int getRetryAfterCount() {
        return this._retryAfterCount;
    }

    /* access modifiers changed from: protected */
    public void tickRetryAfterCount() {
        this._retryAfterCount++;
    }

    public CommContext getCommContext() {
        return this._commContext;
    }

    public boolean getSuppressInternalCallbacks() {
        return this._suppressInternalCallbacks;
    }

    public boolean isDoNotCache() {
        return this._doNotCache;
    }

    public String getAuthFlowId() {
        return this._authFlowId;
    }

    public boolean isAuthRelated() {
        return !StringUtility.isNullOrEmpty(this._authFlowId);
    }

    public Exception getException() {
        return this._exception;
    }

    public void setException(Exception e) {
        this._exception = e;
    }

    public Request getRequest() {
        return this._request;
    }

    public Result getResult() {
        return this._result;
    }

    public void setResult(Result result) {
        if (result == null) {
            throw new IllegalArgumentException("'result' can not be NULL");
        }
        this._result = result;
    }

    /* access modifiers changed from: protected */
    public FutureTask<Result> getFuture() {
        return this._future;
    }

    /* access modifiers changed from: protected */
    public void setFuture(FutureTask<Result> future) {
        if (future == null) {
            throw new IllegalArgumentException("'future' can not be NULL");
        }
        this._future = future;
    }

    /* access modifiers changed from: protected */
    public void promotePriority() {
        boolean promote;
        if (this._priority > 1) {
            if (System.currentTimeMillis() - this._lastPriorityPromotionTimestamp >= _PriorityPromotionIntervalInMilliseconds) {
                promote = true;
            } else {
                promote = false;
            }
            if (promote) {
                Logger.v(Area.COMM.value(), String.format(Locale.US, "Operation: promotePriority() BEFORE Promoting request %1$d [priority:%2$d lastPriorityPromotionTimestamp:%3$d]", new Object[]{Integer.valueOf(getId()), Integer.valueOf(this._priority), Long.valueOf(this._lastPriorityPromotionTimestamp)}));
                this._lastPriorityPromotionTimestamp = System.currentTimeMillis();
                this._priority--;
                Logger.v(Area.COMM.value(), String.format(Locale.US, "Operation: promotePriority() AFTER Promoted request %1$d [priority:%2$d lastPriorityPromotionTimestamp:%3$d]", new Object[]{Integer.valueOf(getId()), Integer.valueOf(this._priority), Long.valueOf(this._lastPriorityPromotionTimestamp)}));
            }
        }
    }

    public void mapResultToCallbacks(CallbackInterface legacyCallbacks) throws ServiceException, JSONException {
        Exception getExc = null;
        Result result = null;
        try {
            result = get();
        } catch (Exception e) {
            getExc = e;
        }
        if (result != null) {
            StatisticsTracker.logResponse(this);
            if (isCancelled()) {
                String requestId = Integer.toString(getId());
                CommContext commContext = getCommContext();
                legacyCallbacks.serviceRequestFailed(result, new RequestCancelledException(String.format(Locale.US, "Request %1$s on CommContext %2$s was canceled", new Object[]{requestId, commContext})), requestId, commContext);
                return;
            }
            ServiceException servicesException = RequestUtilities.getServicesException(result);
            if (servicesException != null) {
                legacyCallbacks.serviceRequestFailed(result, servicesException, Integer.toString(getId()), getCommContext());
            } else if (!result.isSuccessfulResponse()) {
                Locale locale = Locale.US;
                Object[] objArr = new Object[2];
                objArr[0] = Integer.valueOf(result.getResponseCode());
                objArr[1] = result.getResponseBody() != null ? result.getResponseBody() : "";
                legacyCallbacks.serviceRequestFailed(result, new RuntimeException(String.format(locale, "Non-200 response from request [response code: %1$d] [response body: %2$s]", objArr)), Integer.toString(getId()), getCommContext());
            } else {
                legacyCallbacks.serviceRequestSucceeded(result, Integer.toString(getId()), getCommContext());
            }
        } else if (getException() != null) {
            legacyCallbacks.serviceRequestFailed(result, getException(), Integer.toString(getId()), getCommContext());
        } else {
            legacyCallbacks.serviceRequestFailed(result, getExc, Integer.toString(getId()), getCommContext());
        }
    }

    public int getId() {
        return this._request.getId();
    }

    public boolean equals(Object object) {
        if (object == null) {
            throw new IllegalArgumentException("'object' can not be NULL");
        } else if (!(object instanceof Operation)) {
            return false;
        } else {
            return this._request.equals(((Operation) object)._request);
        }
    }

    public int hashCode() {
        return this._request.hashCode();
    }

    public boolean cancel(boolean mayInterruptIfRunning) {
        return CommManager.getInstance().cancelRequest(this);
    }

    public Result get() throws InterruptedException, ExecutionException {
        return CommManager.getInstance().waitOnOperation(this);
    }

    @Deprecated
    public Result get(long timeout, TimeUnit unit) throws InterruptedException, ExecutionException, TimeoutException {
        throw new UnsupportedOperationException("Not supported. Use get() instead.");
    }

    public boolean isDone() {
        return this._state == Status.CANCELLED || this._state == Status.COMPLETED;
    }

    public boolean isCancelled() {
        return this._state == Status.CANCELLED;
    }
}
