package com.getjar.sdk.comm;

import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.os.Handler;
import android.os.Process;
import android.os.ResultReceiver;
import com.getjar.sdk.GetJarException;
import com.getjar.sdk.GetJarManager;
import com.getjar.sdk.comm.Operation;
import com.getjar.sdk.comm.Request;
import com.getjar.sdk.comm.auth.ApplicationKeyDatabase;
import com.getjar.sdk.comm.auth.AuthManager;
import com.getjar.sdk.comm.auth.ProviderHint;
import com.getjar.sdk.data.LicenseEngine;
import com.getjar.sdk.data.metadata.PackageMonitor;
import com.getjar.sdk.data.usage.UsageManager;
import com.getjar.sdk.exceptions.AuthException;
import com.getjar.sdk.exceptions.CommunicationException;
import com.getjar.sdk.exceptions.ServiceException;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import com.getjar.sdk.rewards.GetJarActivity;
import com.getjar.sdk.rewards.GetJarReceiver;
import com.getjar.sdk.rewards.GetJarService;
import com.getjar.sdk.rewards.InAppPurchaseManager;
import com.getjar.sdk.utilities.OverridesUtility;
import com.getjar.sdk.utilities.RewardUtility;
import com.getjar.sdk.utilities.StringUtility;
import com.getjar.sdk.utilities.Utility;
import java.net.URI;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.Callable;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.FutureTask;
import org.json.JSONException;

public class CommManager {
    public static final String AuthProviderFilterDataKey = "auth.provider_filter.data";
    public static final String AuthProviderFilterNameKey = "auth.provider_filter.name";
    /* access modifiers changed from: private */
    public static ArrayList<Operation> _ActiveRequests = new ArrayList<>();
    private static final String _CacheNamespace = "commResultCache";
    private static final int _ConnectionTimeout = 30000;
    /* access modifiers changed from: private */
    public static final ExecutorService _ExecutorService = Executors.newFixedThreadPool(2);
    private static final ExecutorService _ExecutorServiceForLaunchWork = Executors.newSingleThreadExecutor();
    /* access modifiers changed from: private */
    public static ConcurrentHashMap<String, CommContext> _IdentifierToCommContextMap = new ConcurrentHashMap<>();
    private static volatile CommManager _Instance = null;
    private static final int _MaxNumberOfSimultaneousRequests = 2;
    /* access modifiers changed from: private */
    public static volatile Object _RequestPipelineLock = new Object();
    /* access modifiers changed from: private */
    public static LinkedList<Operation> _RequestQueue = new LinkedList<>();
    /* access modifiers changed from: private */
    public static ArrayList<Operation> _RetryRequests = new ArrayList<>();
    private static final int _SocketTimeout = 30000;
    private static Thread _WorkerThread = null;
    private static Object _WorkerThreadLock = new Object();
    /* access modifiers changed from: private */
    public static volatile boolean _WorkerThreadStopping = false;
    /* access modifiers changed from: private */
    public final ResultCachingManager _cachingManager;
    /* access modifiers changed from: private */
    public final Context _context;

    public enum LaunchWork {
        NONE,
        DEALS,
        ALL
    }

    private CommManager(Context androidContext) {
        if (androidContext == null) {
            throw new IllegalArgumentException("'androidContext' can not be NULL");
        }
        this._cachingManager = new ResultCachingManager(androidContext, _CacheNamespace);
        this._context = androidContext;
        OverridesUtility.initialize(androidContext);
        startWorker();
    }

    public static synchronized void initialize(Context androidContext) {
        synchronized (CommManager.class) {
            if (_Instance == null) {
                _Instance = new CommManager(androidContext);
            }
        }
    }

    public static CommManager getInstance() {
        if (_Instance != null) {
            return _Instance;
        }
        throw new IllegalStateException("CommManager.initialize() must be called first");
    }

    public Operation enqueueOperation(Request.ServiceName serviceName, String requestType, URI requestUri, Request.HttpMethod httpMethod, Map<String, String> postData, Map<String, String> requestHeaders, Operation.Priority priority, CommContext commContext, boolean suppressInternalCallbacks, boolean doNotCache, boolean isIdempotent, String authFlowId) {
        return enqueueRequest(new Operation(serviceName, requestType, requestUri, httpMethod, postData, requestHeaders, priority, commContext, suppressInternalCallbacks, doNotCache, isIdempotent, authFlowId), false);
    }

    private Operation enqueueOperationForRetry(Operation operation) {
        if (operation == null) {
            throw new IllegalArgumentException("'operation' can not be NULL");
        } else if (operation.getState() == Operation.Status.RETRYING) {
            return enqueueRequest(operation, true);
        } else {
            throw new IllegalStateException("enqueueOperationForRetry() can not be called on an operation that is not in the RETRYING state");
        }
    }

    private Operation enqueueRequest(Operation newOperation, boolean isRetry) {
        Operation returnOperation;
        if (newOperation == null) {
            throw new IllegalArgumentException("'newOperation' can not be NULL");
        } else if (newOperation.getState() == Operation.Status.CREATED || newOperation.getState() == Operation.Status.RETRYING) {
            boolean workPending = false;
            Logger.m646v(Area.COMM.value(), String.format(Locale.US, "%1$s Adding [isRetry:%2$s]", new Object[]{getLoggingPrefix(newOperation), Boolean.valueOf(isRetry)}));
            synchronized (_RequestPipelineLock) {
                Operation existingOperation = null;
                int index = _ActiveRequests.indexOf(newOperation);
                if (index >= 0) {
                    existingOperation = _ActiveRequests.get(index);
                } else {
                    int index2 = _RequestQueue.indexOf(newOperation);
                    if (index2 >= 0) {
                        existingOperation = _RequestQueue.get(index2);
                    }
                }
                if (existingOperation != null) {
                    returnOperation = existingOperation;
                    String logMsg = String.format(Locale.US, "%1$s Returning preexisting enqueued", new Object[]{getLoggingPrefix(existingOperation)});
                    if (isRetry) {
                        Logger.m648w(Area.COMM.value(), logMsg);
                    } else {
                        Logger.m646v(Area.COMM.value(), logMsg);
                    }
                } else {
                    Result requestResult = null;
                    if (!newOperation.isDoNotCache()) {
                        requestResult = this._cachingManager.getRequestResult(newOperation);
                    }
                    if (requestResult != null) {
                        newOperation.setResult(requestResult);
                        newOperation.setState(Operation.Status.COMPLETED);
                        String logMsg2 = String.format(Locale.US, "%1$s Returning cached results", new Object[]{getLoggingPrefix(newOperation)});
                        if (isRetry) {
                            Logger.m648w(Area.COMM.value(), logMsg2);
                        } else {
                            Logger.m646v(Area.COMM.value(), logMsg2);
                        }
                    } else {
                        newOperation.setFuture(new FutureTask<>(new RequestCallable(newOperation)));
                        if (isRetry) {
                            _RetryRequests.add(newOperation);
                            newOperation.setState(Operation.Status.RETRYING);
                            Logger.m646v(Area.COMM.value(), String.format(Locale.US, "%1$s Returning new Request, added to retry pool", new Object[]{getLoggingPrefix(newOperation)}));
                        } else {
                            _RequestQueue.add(newOperation);
                            newOperation.setState(Operation.Status.WAITING);
                            Logger.m646v(Area.COMM.value(), String.format(Locale.US, "%1$s Returning new Request, added to priority queue", new Object[]{getLoggingPrefix(newOperation)}));
                        }
                        workPending = true;
                    }
                    returnOperation = newOperation;
                }
                if (workPending) {
                    Logger.m646v(Area.COMM.value(), String.format(Locale.US, "%1$s kicking worker thread", new Object[]{getLoggingPrefix(returnOperation)}));
                    _RequestPipelineLock.notify();
                }
            }
            return returnOperation;
        } else {
            throw new IllegalStateException("enqueueRequest() can not be called on an operation that is not in the CREATED or RETRYING state");
        }
    }

    /* access modifiers changed from: protected */
    public Result waitOnOperation(Operation operation) {
        Result result;
        if (operation == null) {
            throw new IllegalArgumentException("'operation' can not be NULL");
        } else if (operation.getState() == Operation.Status.COMPLETED || operation.getState() == Operation.Status.CANCELLED) {
            return operation.getResult();
        } else {
            if (operation.getState() == Operation.Status.RETRYING || operation.getState() == Operation.Status.RUNNING || operation.getState() == Operation.Status.WAITING) {
                synchronized (operation.getFuture()) {
                    try {
                        Result result2 = operation.getFuture().get();
                        updateOperationStateFromResult(operation);
                        result = operation.getResult();
                        while (operation.getState() == Operation.Status.RETRYING) {
                            long tryAgainInSeconds = 2;
                            if (result.getHeaders() != null && result.getHeaders().containsKey("Retry-After")) {
                                try {
                                    tryAgainInSeconds = Long.parseLong((String) result.getHeaders().get("Retry-After").get(0));
                                } catch (Exception e) {
                                    Logger.m643e(Area.COMM.value(), "'Retry-After' header found, but failed to parse as long (as delta in seconds)", e);
                                }
                            }
                            Logger.m646v(Area.COMM.value(), String.format(Locale.US, "Request %1$d resulted in a %2$d, retrying in %3$d seconds", new Object[]{Integer.valueOf(operation.getId()), Integer.valueOf(result.getResponseCode()), Long.valueOf(tryAgainInSeconds)}));
                            operation.tickRetryAfterCount();
                            operation.updateRetryAfterTimestamp(1000 * tryAgainInSeconds);
                            enqueueOperationForRetry(operation);
                            result = operation.getFuture().get();
                        }
                    } catch (InterruptedException e1) {
                        throw new CommunicationException((Throwable) e1);
                    } catch (ExecutionException e12) {
                        throw new CommunicationException((Throwable) e12);
                    } catch (InterruptedException e13) {
                        throw new CommunicationException((Throwable) e13);
                    } catch (ExecutionException e14) {
                        throw new CommunicationException((Throwable) e14);
                    }
                }
                return result;
            }
            throw new IllegalStateException(String.format(Locale.US, "waitOnOperation() for an operation in the %1$s state", new Object[]{operation.getState().name()}));
        }
    }

    /* access modifiers changed from: private */
    public void updateOperationStateFromResult(Operation operation) {
        if (operation == null) {
            throw new IllegalArgumentException("'operation' can not be NULL");
        } else if (operation.getResult() != null) {
            if (operation.getRetryAfterCount() < 5 && (operation.getResult().getResponseCode() == 202 || operation.getResult().getResponseCode() == 503)) {
                operation.setState(Operation.Status.RETRYING);
            } else if (operation.getResult().getResponseCode() == 304) {
                if (!operation.isDoNotCache()) {
                    this._cachingManager.refreshCacheEntry(operation);
                }
                operation.setState(Operation.Status.COMPLETED);
            } else if (operation.getResult().isSuccessfulResponse()) {
                operation.setState(Operation.Status.COMPLETED);
            } else {
                try {
                    if (operation.getReauthThenRetryCount() < 2 && operation.getResult().checkForUnauthorizedAndOKToReAuth(operation.getCommContext())) {
                        operation.updateStateForRetryAfterReauth();
                        AuthManager.initialize(operation.getCommContext().getApplicationContext());
                        new Thread(new Runnable() {
                            public void run() {
                                AuthManager.getInstance().reAuth();
                            }
                        }, "Re-Auth Thread").start();
                    }
                } catch (JSONException e) {
                    Logger.m643e(Area.COMM.value(), String.format(Locale.US, "%1$s updateOperationStateFromResult() re-auth retry check failed", new Object[]{getLoggingPrefix(operation)}), e);
                }
            }
        }
    }

    /* access modifiers changed from: protected */
    public boolean cancelRequest(Operation operationToCancel) {
        boolean z;
        synchronized (_RequestPipelineLock) {
            if (operationToCancel.getState() == Operation.Status.RUNNING || operationToCancel.getState() == Operation.Status.COMPLETED) {
                z = false;
            } else {
                _ActiveRequests.remove(operationToCancel);
                _RequestQueue.remove(operationToCancel);
                _RetryRequests.remove(operationToCancel);
                operationToCancel.setState(Operation.Status.CANCELLED);
                z = true;
            }
        }
        return z;
    }

    /* access modifiers changed from: private */
    public Result processesRequestWithRetries(Operation operation) {
        boolean reportNetworkFailure;
        boolean reportServiceFailure;
        if (operation == null) {
            throw new IllegalArgumentException("'operation' can not be NULL");
        } else if (operation.getState() == Operation.Status.CANCELLED) {
            Logger.m648w(Area.COMM.value(), String.format(Locale.US, "%1$s Operation was cancelled, returning last result", new Object[]{getLoggingPrefix(operation)}));
            return operation.getResult();
        } else if (operation.getState() != Operation.Status.RUNNING) {
            throw new IllegalStateException(String.format(Locale.US, "processesRequestWithRetries() for an operation in the %1$s state", new Object[]{operation.getState().name()}));
        } else {
            Result requestResult = null;
            int failureRetryCount = 0;
            while (true) {
                boolean retry = false;
                reportNetworkFailure = false;
                reportServiceFailure = false;
                try {
                    String requestId = Integer.toString(operation.getId());
                    if (!operation.isCancelled()) {
                        String msg = String.format(Locale.US, "%1$s Starting request %2$s for CommContext %3$s [Attempt %4$d]", new Object[]{getLoggingPrefix(operation), requestId, operation.getCommContext().getCommContextId(), Integer.valueOf(failureRetryCount + 1)});
                        if (failureRetryCount > 0) {
                            Logger.m648w(Area.COMM.value(), msg);
                        } else {
                            Logger.m640d(Area.COMM.value(), msg);
                        }
                        if (!operation.isCancelled()) {
                            requestResult = processesRequest(operation, failureRetryCount);
                            if (requestResult == null) {
                                Logger.m648w(Area.COMM.value(), String.format(Locale.US, "%1$s processesRequest() returned NULL", new Object[]{getLoggingPrefix(operation)}));
                                if (operation.getException() != null) {
                                    throw operation.getException();
                                }
                            } else {
                                ServiceException exc = RequestUtilities.getServicesException(requestResult);
                                if (exc != null) {
                                    boolean blacklisted = false;
                                    boolean unsupported = false;
                                    try {
                                        blacklisted = exc.getRequestResult().checkForBlacklisted();
                                    } catch (JSONException e) {
                                    }
                                    try {
                                        unsupported = exc.getRequestResult().checkForUnsupported();
                                    } catch (JSONException e2) {
                                    }
                                    if (exc.getRequestResult() == null || (!blacklisted && !unsupported)) {
                                        reportNetworkFailure = false;
                                        reportServiceFailure = true;
                                    } else {
                                        reportNetworkFailure = false;
                                        reportServiceFailure = false;
                                    }
                                }
                            }
                            if (!operation.isCancelled()) {
                                if (!retry) {
                                    break;
                                }
                                int failureRetryCount2 = failureRetryCount + 1;
                                if (failureRetryCount >= 5) {
                                    int i = failureRetryCount2;
                                    break;
                                }
                                failureRetryCount = failureRetryCount2;
                            } else {
                                Logger.m648w(Area.COMM.value(), String.format(Locale.US, "%1$s Operation was cancelled, returning NULL", new Object[]{getLoggingPrefix(operation)}));
                                return null;
                            }
                        } else {
                            Logger.m648w(Area.COMM.value(), String.format(Locale.US, "%1$s Operation was cancelled, returning NULL", new Object[]{getLoggingPrefix(operation)}));
                            return null;
                        }
                    } else {
                        Logger.m648w(Area.COMM.value(), String.format(Locale.US, "%1$s Operation was cancelled, returning NULL", new Object[]{getLoggingPrefix(operation)}));
                        return null;
                    }
                } catch (Exception exc2) {
                    Logger.m642e(Area.COMM.value(), String.format(Locale.US, "%1$s Operation failed [failureRetryCount:%2$d details:'%3$s - %4$s']", new Object[]{getLoggingPrefix(operation), Integer.valueOf(failureRetryCount), exc2.getClass().getName(), exc2.getMessage()}));
                    reportNetworkFailure = true;
                    reportServiceFailure = false;
                    retry = RequestUtilities.checkForRetryOnException(exc2, operation.isIdempotent());
                    if (!retry || failureRetryCount >= 5) {
                        Logger.m642e(Area.COMM.value(), String.format(Locale.US, "%1$s Operation failed, not retrying, returning NULL", new Object[]{getLoggingPrefix(operation)}));
                        requestResult = null;
                        operation.setException(exc2);
                    } else if (operation.isCancelled()) {
                        Logger.m648w(Area.COMM.value(), String.format(Locale.US, "%1$s Operation was cancelled, returning NULL", new Object[]{getLoggingPrefix(operation)}));
                        return null;
                    } else {
                        try {
                            Thread.sleep(2000);
                        } catch (InterruptedException e3) {
                            e3.printStackTrace();
                        }
                    }
                }
            }
            if (reportNetworkFailure && !operation.getSuppressInternalCallbacks()) {
                operation.getCommContext().makeNetworkFailureCallbacks();
                return requestResult;
            } else if (!reportServiceFailure || operation.getSuppressInternalCallbacks()) {
                return requestResult;
            } else {
                operation.getCommContext().makeServiceFailureCallbacks(requestResult);
                return requestResult;
            }
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:106:0x0380 A[SYNTHETIC, Splitter:B:106:0x0380] */
    /* JADX WARNING: Removed duplicated region for block: B:191:0x06e5 A[Catch:{ URISyntaxException -> 0x0343 }] */
    /* JADX WARNING: Removed duplicated region for block: B:192:0x06e9 A[Catch:{ URISyntaxException -> 0x0343 }] */
    /* JADX WARNING: Removed duplicated region for block: B:86:0x0307 A[Catch:{ URISyntaxException -> 0x0343 }] */
    /* JADX WARNING: Removed duplicated region for block: B:89:0x0327 A[Catch:{ URISyntaxException -> 0x0343 }] */
    /* JADX WARNING: Removed duplicated region for block: B:92:0x0335 A[Catch:{ URISyntaxException -> 0x0343 }] */
    /* JADX WARNING: Unknown top exception splitter block from list: {B:174:0x0652=Splitter:B:174:0x0652, B:75:0x02c3=Splitter:B:75:0x02c3} */
    /* JADX WARNING: Unknown top exception splitter block from list: {B:55:0x01b2=Splitter:B:55:0x01b2, B:108:0x0383=Splitter:B:108:0x0383} */
    /* JADX WARNING: Unknown top exception splitter block from list: {B:83:0x02d3=Splitter:B:83:0x02d3, B:178:0x0668=Splitter:B:178:0x0668} */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private com.getjar.sdk.comm.Result processesRequest(com.getjar.sdk.comm.Operation r53, int r54) throws java.lang.Exception {
        /*
            r52 = this;
            if (r53 != 0) goto L_0x000a
            java.lang.IllegalArgumentException r7 = new java.lang.IllegalArgumentException
            java.lang.String r8 = "'operation' can not be NULL"
            r7.<init>(r8)
            throw r7
        L_0x000a:
            r44 = 0
            r36 = 0
            long r40 = java.lang.System.currentTimeMillis()
            com.getjar.sdk.comm.Request r7 = r53.getRequest()     // Catch:{ URISyntaxException -> 0x007b }
            java.net.URI r44 = r7.getUriForRequest()     // Catch:{ URISyntaxException -> 0x007b }
            com.getjar.sdk.comm.Operation$Status r7 = r53.getState()     // Catch:{ URISyntaxException -> 0x007b }
            com.getjar.sdk.comm.Operation$Status r8 = com.getjar.sdk.comm.Operation.Status.CANCELLED     // Catch:{ URISyntaxException -> 0x007b }
            if (r7 != r8) goto L_0x004d
            com.getjar.sdk.logging.Area r7 = com.getjar.sdk.logging.Area.COMM     // Catch:{ URISyntaxException -> 0x007b }
            long r7 = r7.value()     // Catch:{ URISyntaxException -> 0x007b }
            java.util.Locale r46 = java.util.Locale.US     // Catch:{ URISyntaxException -> 0x007b }
            java.lang.String r47 = "%1$s Operation was cancelled, returning last result"
            r48 = 1
            r0 = r48
            java.lang.Object[] r0 = new java.lang.Object[r0]     // Catch:{ URISyntaxException -> 0x007b }
            r48 = r0
            r49 = 0
            java.lang.String r50 = getLoggingPrefix(r53)     // Catch:{ URISyntaxException -> 0x007b }
            r48[r49] = r50     // Catch:{ URISyntaxException -> 0x007b }
            java.lang.String r46 = java.lang.String.format(r46, r47, r48)     // Catch:{ URISyntaxException -> 0x007b }
            r0 = r46
            com.getjar.sdk.logging.Logger.m648w(r7, r0)     // Catch:{ URISyntaxException -> 0x007b }
            com.getjar.sdk.comm.Result r3 = r53.getResult()     // Catch:{ URISyntaxException -> 0x007b }
            r7 = r3
            r3 = r36
        L_0x004c:
            return r7
        L_0x004d:
            com.getjar.sdk.comm.Operation$Status r7 = r53.getState()     // Catch:{ URISyntaxException -> 0x007b }
            com.getjar.sdk.comm.Operation$Status r8 = com.getjar.sdk.comm.Operation.Status.RUNNING     // Catch:{ URISyntaxException -> 0x007b }
            if (r7 == r8) goto L_0x0084
            java.lang.IllegalStateException r7 = new java.lang.IllegalStateException     // Catch:{ URISyntaxException -> 0x007b }
            java.util.Locale r8 = java.util.Locale.US     // Catch:{ URISyntaxException -> 0x007b }
            java.lang.String r46 = "processesRequestWithRetries() for an operation in the %1$s state"
            r47 = 1
            r0 = r47
            java.lang.Object[] r0 = new java.lang.Object[r0]     // Catch:{ URISyntaxException -> 0x007b }
            r47 = r0
            r48 = 0
            com.getjar.sdk.comm.Operation$Status r49 = r53.getState()     // Catch:{ URISyntaxException -> 0x007b }
            java.lang.String r49 = r49.name()     // Catch:{ URISyntaxException -> 0x007b }
            r47[r48] = r49     // Catch:{ URISyntaxException -> 0x007b }
            r0 = r46
            r1 = r47
            java.lang.String r8 = java.lang.String.format(r8, r0, r1)     // Catch:{ URISyntaxException -> 0x007b }
            r7.<init>(r8)     // Catch:{ URISyntaxException -> 0x007b }
            throw r7     // Catch:{ URISyntaxException -> 0x007b }
        L_0x007b:
            r15 = move-exception
            r3 = r36
        L_0x007e:
            com.getjar.sdk.exceptions.CommunicationException r7 = new com.getjar.sdk.exceptions.CommunicationException
            r7.<init>((java.lang.Throwable) r15)
            throw r7
        L_0x0084:
            com.getjar.sdk.logging.Area r7 = com.getjar.sdk.logging.Area.COMM     // Catch:{ URISyntaxException -> 0x007b }
            long r7 = r7.value()     // Catch:{ URISyntaxException -> 0x007b }
            java.util.Locale r46 = java.util.Locale.US     // Catch:{ URISyntaxException -> 0x007b }
            java.lang.String r47 = "%1$s Starting Request %2$d"
            r48 = 2
            r0 = r48
            java.lang.Object[] r0 = new java.lang.Object[r0]     // Catch:{ URISyntaxException -> 0x007b }
            r48 = r0
            r49 = 0
            java.lang.String r50 = getLoggingPrefix(r53)     // Catch:{ URISyntaxException -> 0x007b }
            r48[r49] = r50     // Catch:{ URISyntaxException -> 0x007b }
            r49 = 1
            int r50 = r53.getId()     // Catch:{ URISyntaxException -> 0x007b }
            java.lang.Integer r50 = java.lang.Integer.valueOf(r50)     // Catch:{ URISyntaxException -> 0x007b }
            r48[r49] = r50     // Catch:{ URISyntaxException -> 0x007b }
            java.lang.String r46 = java.lang.String.format(r46, r47, r48)     // Catch:{ URISyntaxException -> 0x007b }
            r0 = r46
            com.getjar.sdk.logging.Logger.m644i(r7, r0)     // Catch:{ URISyntaxException -> 0x007b }
            r6 = 418(0x1a2, float:5.86E-43)
            com.getjar.sdk.logging.Area r7 = com.getjar.sdk.logging.Area.COMM     // Catch:{ UnsupportedEncodingException -> 0x0703, all -> 0x06fe }
            long r7 = r7.value()     // Catch:{ UnsupportedEncodingException -> 0x0703, all -> 0x06fe }
            java.util.Locale r46 = java.util.Locale.US     // Catch:{ UnsupportedEncodingException -> 0x0703, all -> 0x06fe }
            java.lang.String r47 = "%1$s Making a request to: '%2$s'"
            r48 = 2
            r0 = r48
            java.lang.Object[] r0 = new java.lang.Object[r0]     // Catch:{ UnsupportedEncodingException -> 0x0703, all -> 0x06fe }
            r48 = r0
            r49 = 0
            java.lang.String r50 = getLoggingPrefix(r53)     // Catch:{ UnsupportedEncodingException -> 0x0703, all -> 0x06fe }
            r48[r49] = r50     // Catch:{ UnsupportedEncodingException -> 0x0703, all -> 0x06fe }
            r49 = 1
            r48[r49] = r44     // Catch:{ UnsupportedEncodingException -> 0x0703, all -> 0x06fe }
            java.lang.String r46 = java.lang.String.format(r46, r47, r48)     // Catch:{ UnsupportedEncodingException -> 0x0703, all -> 0x06fe }
            r0 = r46
            com.getjar.sdk.logging.Logger.m640d(r7, r0)     // Catch:{ UnsupportedEncodingException -> 0x0703, all -> 0x06fe }
            com.getjar.sdk.comm.CommContext r7 = r53.getCommContext()     // Catch:{ UnsupportedEncodingException -> 0x0703, all -> 0x06fe }
            java.lang.String r7 = r7.getSdkUserAgent()     // Catch:{ UnsupportedEncodingException -> 0x0703, all -> 0x06fe }
            r8 = 30000(0x7530, float:4.2039E-41)
            r46 = 30000(0x7530, float:4.2039E-41)
            r0 = r46
            com.getjar.sdk.comm.GetJarHttpClient r23 = com.getjar.sdk.comm.GetJarHttpClient.newInstance(r7, r8, r0)     // Catch:{ UnsupportedEncodingException -> 0x0703, all -> 0x06fe }
            r24 = 0
            com.getjar.sdk.comm.Request$HttpMethod r7 = com.getjar.sdk.comm.Request.HttpMethod.POST     // Catch:{ all -> 0x02c0 }
            com.getjar.sdk.comm.Request r8 = r53.getRequest()     // Catch:{ all -> 0x02c0 }
            com.getjar.sdk.comm.Request$HttpMethod r8 = r8.getHttpMethod()     // Catch:{ all -> 0x02c0 }
            boolean r7 = r7.equals(r8)     // Catch:{ all -> 0x02c0 }
            if (r7 == 0) goto L_0x03c9
            org.apache.http.client.methods.HttpPost r25 = new org.apache.http.client.methods.HttpPost     // Catch:{ all -> 0x02c0 }
            r0 = r25
            r1 = r44
            r0.<init>(r1)     // Catch:{ all -> 0x02c0 }
            com.getjar.sdk.comm.Request r7 = r53.getRequest()     // Catch:{ all -> 0x0356 }
            java.util.Map r7 = r7.getPostData()     // Catch:{ all -> 0x0356 }
            if (r7 == 0) goto L_0x0710
            com.getjar.sdk.comm.Request r7 = r53.getRequest()     // Catch:{ all -> 0x0356 }
            java.util.Map r7 = r7.getPostData()     // Catch:{ all -> 0x0356 }
            int r7 = r7.size()     // Catch:{ all -> 0x0356 }
            if (r7 <= 0) goto L_0x0710
            com.getjar.sdk.comm.Request r7 = r53.getRequest()     // Catch:{ all -> 0x0356 }
            java.util.Map r7 = r7.getPostData()     // Catch:{ all -> 0x0356 }
            java.lang.String r33 = com.getjar.sdk.comm.RequestUtilities.getPostDataBlob(r7)     // Catch:{ all -> 0x0356 }
            boolean r7 = com.getjar.sdk.utilities.StringUtility.isNullOrEmpty(r33)     // Catch:{ all -> 0x0356 }
            if (r7 != 0) goto L_0x0206
            java.lang.String r7 = "UTF-8"
            r0 = r33
            byte[] r34 = r0.getBytes(r7)     // Catch:{ all -> 0x0356 }
            r0 = r25
            org.apache.http.client.methods.HttpPost r0 = (org.apache.http.client.methods.HttpPost) r0     // Catch:{ all -> 0x0356 }
            r7 = r0
            java.lang.String r8 = "Content-Language"
            java.lang.String r46 = "en-US"
            r0 = r46
            r7.setHeader(r8, r0)     // Catch:{ all -> 0x0356 }
            r0 = r25
            org.apache.http.client.methods.HttpPost r0 = (org.apache.http.client.methods.HttpPost) r0     // Catch:{ all -> 0x0356 }
            r7 = r0
            java.lang.String r8 = "Content-Type"
            java.lang.String r46 = "application/x-www-form-urlencoded"
            r0 = r46
            r7.setHeader(r8, r0)     // Catch:{ all -> 0x0356 }
            r38 = 0
            com.getjar.sdk.comm.CommContext r7 = r53.getCommContext()     // Catch:{ ConfigurationException -> 0x0346 }
            r8 = 0
            com.getjar.sdk.comm.GetJarConfig r7 = com.getjar.sdk.comm.GetJarConfig.getInstance(r7, r8)     // Catch:{ ConfigurationException -> 0x0346 }
            java.lang.String r8 = "service.request.compress"
            java.lang.String r7 = r7.getDirectiveValue(r8)     // Catch:{ ConfigurationException -> 0x0346 }
            boolean r38 = java.lang.Boolean.parseBoolean(r7)     // Catch:{ ConfigurationException -> 0x0346 }
        L_0x016c:
            r39 = 256(0x100, float:3.59E-43)
            com.getjar.sdk.comm.CommContext r7 = r53.getCommContext()     // Catch:{ ConfigurationException -> 0x035d, NumberFormatException -> 0x036d }
            r8 = 0
            com.getjar.sdk.comm.GetJarConfig r7 = com.getjar.sdk.comm.GetJarConfig.getInstance(r7, r8)     // Catch:{ ConfigurationException -> 0x035d, NumberFormatException -> 0x036d }
            java.lang.String r8 = "service.request.uncompressed_limit"
            java.lang.String r7 = r7.getDirectiveValue(r8)     // Catch:{ ConfigurationException -> 0x035d, NumberFormatException -> 0x036d }
            int r39 = java.lang.Integer.parseInt(r7)     // Catch:{ ConfigurationException -> 0x035d, NumberFormatException -> 0x036d }
        L_0x0181:
            if (r38 == 0) goto L_0x0384
            r0 = r34
            int r7 = r0.length     // Catch:{ all -> 0x0356 }
            r0 = r39
            if (r7 <= r0) goto L_0x0384
            r0 = r25
            org.apache.http.client.methods.HttpPost r0 = (org.apache.http.client.methods.HttpPost) r0     // Catch:{ all -> 0x0356 }
            r7 = r0
            java.lang.String r8 = "Content-Encoding"
            java.lang.String r46 = "gzip"
            r0 = r46
            r7.setHeader(r8, r0)     // Catch:{ all -> 0x0356 }
            java.io.ByteArrayOutputStream r12 = new java.io.ByteArrayOutputStream     // Catch:{ all -> 0x0356 }
            r12.<init>()     // Catch:{ all -> 0x0356 }
            r19 = 0
            java.util.zip.GZIPOutputStream r20 = new java.util.zip.GZIPOutputStream     // Catch:{ all -> 0x037d }
            r0 = r20
            r0.<init>(r12)     // Catch:{ all -> 0x037d }
            r0 = r20
            r1 = r34
            r0.write(r1)     // Catch:{ all -> 0x070b }
            if (r20 == 0) goto L_0x01b2
            r20.close()     // Catch:{ IOException -> 0x06f8 }
        L_0x01b2:
            byte[] r21 = r12.toByteArray()     // Catch:{ all -> 0x0356 }
            com.getjar.sdk.logging.Area r7 = com.getjar.sdk.logging.Area.COMM     // Catch:{ all -> 0x0356 }
            long r7 = r7.value()     // Catch:{ all -> 0x0356 }
            java.util.Locale r46 = java.util.Locale.US     // Catch:{ all -> 0x0356 }
            java.lang.String r47 = "%1$s Gzipping POST data [Original length: %2$d: Gzipped Length: %3$d]:\r\n%4$s"
            r48 = 4
            r0 = r48
            java.lang.Object[] r0 = new java.lang.Object[r0]     // Catch:{ all -> 0x0356 }
            r48 = r0
            r49 = 0
            java.lang.String r50 = getLoggingPrefix(r53)     // Catch:{ all -> 0x0356 }
            r48[r49] = r50     // Catch:{ all -> 0x0356 }
            r49 = 1
            r0 = r34
            int r0 = r0.length     // Catch:{ all -> 0x0356 }
            r50 = r0
            java.lang.Integer r50 = java.lang.Integer.valueOf(r50)     // Catch:{ all -> 0x0356 }
            r48[r49] = r50     // Catch:{ all -> 0x0356 }
            r49 = 2
            r0 = r21
            int r0 = r0.length     // Catch:{ all -> 0x0356 }
            r50 = r0
            java.lang.Integer r50 = java.lang.Integer.valueOf(r50)     // Catch:{ all -> 0x0356 }
            r48[r49] = r50     // Catch:{ all -> 0x0356 }
            r49 = 3
            r48[r49] = r33     // Catch:{ all -> 0x0356 }
            java.lang.String r46 = java.lang.String.format(r46, r47, r48)     // Catch:{ all -> 0x0356 }
            r0 = r46
            com.getjar.sdk.logging.Logger.m640d(r7, r0)     // Catch:{ all -> 0x0356 }
            r0 = r25
            org.apache.http.client.methods.HttpPost r0 = (org.apache.http.client.methods.HttpPost) r0     // Catch:{ all -> 0x0356 }
            r7 = r0
            org.apache.http.entity.ByteArrayEntity r8 = new org.apache.http.entity.ByteArrayEntity     // Catch:{ all -> 0x0356 }
            r0 = r21
            r8.<init>(r0)     // Catch:{ all -> 0x0356 }
            r7.setEntity(r8)     // Catch:{ all -> 0x0356 }
        L_0x0206:
            r24 = r25
        L_0x0208:
            java.lang.String r7 = "Accept-Encoding"
            java.lang.String r8 = "gzip"
            r0 = r24
            r0.setHeader(r7, r8)     // Catch:{ all -> 0x02c0 }
            java.lang.String r7 = "Cache-Control"
            java.lang.String r8 = "no-transform"
            r0 = r24
            r0.setHeader(r7, r8)     // Catch:{ all -> 0x02c0 }
            java.lang.String r7 = "User-Agent"
            com.getjar.sdk.comm.CommContext r8 = r53.getCommContext()     // Catch:{ all -> 0x02c0 }
            java.lang.String r8 = r8.getSdkUserAgent()     // Catch:{ all -> 0x02c0 }
            r0 = r24
            r0.setHeader(r7, r8)     // Catch:{ all -> 0x02c0 }
            com.getjar.sdk.comm.CommContext r7 = r53.getCommContext()     // Catch:{ all -> 0x02c0 }
            android.content.Context r7 = r7.getApplicationContext()     // Catch:{ all -> 0x02c0 }
            com.getjar.sdk.comm.auth.AuthManager.initialize(r7)     // Catch:{ all -> 0x02c0 }
            com.getjar.sdk.comm.auth.AuthManager r7 = com.getjar.sdk.comm.auth.AuthManager.getInstance()     // Catch:{ all -> 0x02c0 }
            java.lang.String r10 = r7.getAuthToken()     // Catch:{ all -> 0x02c0 }
            boolean r7 = com.getjar.sdk.utilities.StringUtility.isNullOrEmpty(r10)     // Catch:{ all -> 0x02c0 }
            if (r7 != 0) goto L_0x0249
            java.lang.String r7 = "Authorization"
            r0 = r24
            r0.setHeader(r7, r10)     // Catch:{ all -> 0x02c0 }
        L_0x0249:
            com.getjar.sdk.comm.Request r7 = r53.getRequest()     // Catch:{ all -> 0x02c0 }
            java.util.Map r7 = r7.getRequestHeaders()     // Catch:{ all -> 0x02c0 }
            if (r7 == 0) goto L_0x03d6
            com.getjar.sdk.comm.Request r7 = r53.getRequest()     // Catch:{ all -> 0x02c0 }
            java.util.Map r7 = r7.getRequestHeaders()     // Catch:{ all -> 0x02c0 }
            java.util.Set r7 = r7.keySet()     // Catch:{ all -> 0x02c0 }
            java.util.Iterator r27 = r7.iterator()     // Catch:{ all -> 0x02c0 }
        L_0x0263:
            boolean r7 = r27.hasNext()     // Catch:{ all -> 0x02c0 }
            if (r7 == 0) goto L_0x03d6
            java.lang.Object r32 = r27.next()     // Catch:{ all -> 0x02c0 }
            java.lang.String r32 = (java.lang.String) r32     // Catch:{ all -> 0x02c0 }
            com.getjar.sdk.comm.Request r7 = r53.getRequest()     // Catch:{ all -> 0x02c0 }
            java.util.Map r7 = r7.getRequestHeaders()     // Catch:{ all -> 0x02c0 }
            r0 = r32
            java.lang.Object r45 = r7.get(r0)     // Catch:{ all -> 0x02c0 }
            java.lang.String r45 = (java.lang.String) r45     // Catch:{ all -> 0x02c0 }
            boolean r7 = com.getjar.sdk.utilities.StringUtility.isNullOrEmpty(r32)     // Catch:{ all -> 0x02c0 }
            if (r7 != 0) goto L_0x0263
            boolean r7 = com.getjar.sdk.utilities.StringUtility.isNullOrEmpty(r45)     // Catch:{ all -> 0x02c0 }
            if (r7 != 0) goto L_0x0263
            com.getjar.sdk.logging.Area r7 = com.getjar.sdk.logging.Area.COMM     // Catch:{ all -> 0x02c0 }
            long r7 = r7.value()     // Catch:{ all -> 0x02c0 }
            java.util.Locale r46 = java.util.Locale.US     // Catch:{ all -> 0x02c0 }
            java.lang.String r47 = "%1$s Adding header [%2$s = %3$s]"
            r48 = 3
            r0 = r48
            java.lang.Object[] r0 = new java.lang.Object[r0]     // Catch:{ all -> 0x02c0 }
            r48 = r0
            r49 = 0
            java.lang.String r50 = getLoggingPrefix(r53)     // Catch:{ all -> 0x02c0 }
            r48[r49] = r50     // Catch:{ all -> 0x02c0 }
            r49 = 1
            r48[r49] = r32     // Catch:{ all -> 0x02c0 }
            r49 = 2
            r48[r49] = r45     // Catch:{ all -> 0x02c0 }
            java.lang.String r46 = java.lang.String.format(r46, r47, r48)     // Catch:{ all -> 0x02c0 }
            r0 = r46
            com.getjar.sdk.logging.Logger.m646v(r7, r0)     // Catch:{ all -> 0x02c0 }
            r0 = r24
            r1 = r32
            r2 = r45
            r0.setHeader(r1, r2)     // Catch:{ all -> 0x02c0 }
            goto L_0x0263
        L_0x02c0:
            r7 = move-exception
            r3 = r36
        L_0x02c3:
            org.apache.http.conn.ClientConnectionManager r8 = r23.getConnectionManager()     // Catch:{ UnsupportedEncodingException -> 0x02cb }
            r8.shutdown()     // Catch:{ UnsupportedEncodingException -> 0x02cb }
            throw r7     // Catch:{ UnsupportedEncodingException -> 0x02cb }
        L_0x02cb:
            r15 = move-exception
        L_0x02cc:
            com.getjar.sdk.exceptions.CommunicationException r7 = new com.getjar.sdk.exceptions.CommunicationException     // Catch:{ all -> 0x02d2 }
            r7.<init>((java.lang.Throwable) r15)     // Catch:{ all -> 0x02d2 }
            throw r7     // Catch:{ all -> 0x02d2 }
        L_0x02d2:
            r7 = move-exception
        L_0x02d3:
            com.getjar.sdk.logging.Area r8 = com.getjar.sdk.logging.Area.COMM     // Catch:{ URISyntaxException -> 0x0343 }
            long r46 = r8.value()     // Catch:{ URISyntaxException -> 0x0343 }
            java.util.Locale r8 = java.util.Locale.US     // Catch:{ URISyntaxException -> 0x0343 }
            java.lang.String r48 = "%1$s Finished Request"
            r49 = 1
            r0 = r49
            java.lang.Object[] r0 = new java.lang.Object[r0]     // Catch:{ URISyntaxException -> 0x0343 }
            r49 = r0
            r50 = 0
            java.lang.String r51 = getLoggingPrefix(r53)     // Catch:{ URISyntaxException -> 0x0343 }
            r49[r50] = r51     // Catch:{ URISyntaxException -> 0x0343 }
            r0 = r48
            r1 = r49
            java.lang.String r8 = java.lang.String.format(r8, r0, r1)     // Catch:{ URISyntaxException -> 0x0343 }
            r0 = r46
            com.getjar.sdk.logging.Logger.m644i(r0, r8)     // Catch:{ URISyntaxException -> 0x0343 }
            long r46 = java.lang.System.currentTimeMillis()     // Catch:{ URISyntaxException -> 0x0343 }
            long r46 = r46 - r40
            r0 = r46
            int r0 = (int) r0     // Catch:{ URISyntaxException -> 0x0343 }
            r42 = r0
            if (r3 == 0) goto L_0x030c
            r0 = r42
            r3.setResponseTime(r0)     // Catch:{ URISyntaxException -> 0x0343 }
        L_0x030c:
            java.util.Locale r46 = java.util.Locale.US     // Catch:{ URISyntaxException -> 0x0343 }
            java.lang.String r47 = "%1$s REQUEST TIMING: %2$d [TO: %3$s]"
            r8 = 3
            java.lang.Object[] r0 = new java.lang.Object[r8]     // Catch:{ URISyntaxException -> 0x0343 }
            r48 = r0
            r8 = 0
            java.lang.String r49 = getLoggingPrefix(r53)     // Catch:{ URISyntaxException -> 0x0343 }
            r48[r8] = r49     // Catch:{ URISyntaxException -> 0x0343 }
            r8 = 1
            java.lang.Integer r49 = java.lang.Integer.valueOf(r42)     // Catch:{ URISyntaxException -> 0x0343 }
            r48[r8] = r49     // Catch:{ URISyntaxException -> 0x0343 }
            r49 = 2
            if (r44 == 0) goto L_0x06e5
            r8 = r44
        L_0x0329:
            r48[r49] = r8     // Catch:{ URISyntaxException -> 0x0343 }
            java.lang.String r43 = java.lang.String.format(r46, r47, r48)     // Catch:{ URISyntaxException -> 0x0343 }
            r8 = 1000(0x3e8, float:1.401E-42)
            r0 = r42
            if (r0 <= r8) goto L_0x06e9
            com.getjar.sdk.logging.Area r8 = com.getjar.sdk.logging.Area.COMM     // Catch:{ URISyntaxException -> 0x0343 }
            long r46 = r8.value()     // Catch:{ URISyntaxException -> 0x0343 }
            r0 = r46
            r2 = r43
            com.getjar.sdk.logging.Logger.m648w(r0, r2)     // Catch:{ URISyntaxException -> 0x0343 }
        L_0x0342:
            throw r7     // Catch:{ URISyntaxException -> 0x0343 }
        L_0x0343:
            r15 = move-exception
            goto L_0x007e
        L_0x0346:
            r15 = move-exception
            com.getjar.sdk.logging.Area r7 = com.getjar.sdk.logging.Area.COMM     // Catch:{ all -> 0x0356 }
            long r7 = r7.value()     // Catch:{ all -> 0x0356 }
            java.lang.String r46 = "CommManager processesRequest using default value for serviceRequestCompress"
            r0 = r46
            com.getjar.sdk.logging.Logger.m648w(r7, r0)     // Catch:{ all -> 0x0356 }
            goto L_0x016c
        L_0x0356:
            r7 = move-exception
            r24 = r25
            r3 = r36
            goto L_0x02c3
        L_0x035d:
            r15 = move-exception
            com.getjar.sdk.logging.Area r7 = com.getjar.sdk.logging.Area.COMM     // Catch:{ all -> 0x0356 }
            long r7 = r7.value()     // Catch:{ all -> 0x0356 }
            java.lang.String r46 = "CommManager processesRequest using default value for serviceRequestUncompressedLimit"
            r0 = r46
            com.getjar.sdk.logging.Logger.m648w(r7, r0)     // Catch:{ all -> 0x0356 }
            goto L_0x0181
        L_0x036d:
            r15 = move-exception
            com.getjar.sdk.logging.Area r7 = com.getjar.sdk.logging.Area.COMM     // Catch:{ all -> 0x0356 }
            long r7 = r7.value()     // Catch:{ all -> 0x0356 }
            java.lang.String r46 = "CommManager processesRequest using default value for serviceRequestUncompressedLimit"
            r0 = r46
            com.getjar.sdk.logging.Logger.m648w(r7, r0)     // Catch:{ all -> 0x0356 }
            goto L_0x0181
        L_0x037d:
            r7 = move-exception
        L_0x037e:
            if (r19 == 0) goto L_0x0383
            r19.close()     // Catch:{ IOException -> 0x06fb }
        L_0x0383:
            throw r7     // Catch:{ all -> 0x0356 }
        L_0x0384:
            com.getjar.sdk.logging.Area r7 = com.getjar.sdk.logging.Area.COMM     // Catch:{ all -> 0x0356 }
            long r7 = r7.value()     // Catch:{ all -> 0x0356 }
            java.util.Locale r46 = java.util.Locale.US     // Catch:{ all -> 0x0356 }
            java.lang.String r47 = "%1$s NOT Gzipping POST data [length: %2$d]:\r\n%3$s"
            r48 = 3
            r0 = r48
            java.lang.Object[] r0 = new java.lang.Object[r0]     // Catch:{ all -> 0x0356 }
            r48 = r0
            r49 = 0
            java.lang.String r50 = getLoggingPrefix(r53)     // Catch:{ all -> 0x0356 }
            r48[r49] = r50     // Catch:{ all -> 0x0356 }
            r49 = 1
            r0 = r34
            int r0 = r0.length     // Catch:{ all -> 0x0356 }
            r50 = r0
            java.lang.Integer r50 = java.lang.Integer.valueOf(r50)     // Catch:{ all -> 0x0356 }
            r48[r49] = r50     // Catch:{ all -> 0x0356 }
            r49 = 2
            r48[r49] = r33     // Catch:{ all -> 0x0356 }
            java.lang.String r46 = java.lang.String.format(r46, r47, r48)     // Catch:{ all -> 0x0356 }
            r0 = r46
            com.getjar.sdk.logging.Logger.m640d(r7, r0)     // Catch:{ all -> 0x0356 }
            r0 = r25
            org.apache.http.client.methods.HttpPost r0 = (org.apache.http.client.methods.HttpPost) r0     // Catch:{ all -> 0x0356 }
            r7 = r0
            org.apache.http.entity.StringEntity r8 = new org.apache.http.entity.StringEntity     // Catch:{ all -> 0x0356 }
            r0 = r33
            r8.<init>(r0)     // Catch:{ all -> 0x0356 }
            r7.setEntity(r8)     // Catch:{ all -> 0x0356 }
            goto L_0x0206
        L_0x03c9:
            org.apache.http.client.methods.HttpGet r25 = new org.apache.http.client.methods.HttpGet     // Catch:{ all -> 0x02c0 }
            r0 = r25
            r1 = r44
            r0.<init>(r1)     // Catch:{ all -> 0x02c0 }
            r24 = r25
            goto L_0x0208
        L_0x03d6:
            boolean r7 = r53.isDoNotCache()     // Catch:{ all -> 0x02c0 }
            if (r7 != 0) goto L_0x041c
            r0 = r52
            com.getjar.sdk.comm.ResultCachingManager r7 = r0._cachingManager     // Catch:{ all -> 0x02c0 }
            r0 = r53
            java.lang.String r16 = r7.getETagFromCache(r0)     // Catch:{ all -> 0x02c0 }
            boolean r7 = com.getjar.sdk.utilities.StringUtility.isNullOrEmpty(r16)     // Catch:{ all -> 0x02c0 }
            if (r7 != 0) goto L_0x041c
            com.getjar.sdk.logging.Area r7 = com.getjar.sdk.logging.Area.COMM     // Catch:{ all -> 0x02c0 }
            long r7 = r7.value()     // Catch:{ all -> 0x02c0 }
            java.util.Locale r46 = java.util.Locale.US     // Catch:{ all -> 0x02c0 }
            java.lang.String r47 = "%1$s Adding the 'If-None-Match' header [ETag = %2$s]"
            r48 = 2
            r0 = r48
            java.lang.Object[] r0 = new java.lang.Object[r0]     // Catch:{ all -> 0x02c0 }
            r48 = r0
            r49 = 0
            java.lang.String r50 = getLoggingPrefix(r53)     // Catch:{ all -> 0x02c0 }
            r48[r49] = r50     // Catch:{ all -> 0x02c0 }
            r49 = 1
            r48[r49] = r16     // Catch:{ all -> 0x02c0 }
            java.lang.String r46 = java.lang.String.format(r46, r47, r48)     // Catch:{ all -> 0x02c0 }
            r0 = r46
            com.getjar.sdk.logging.Logger.m646v(r7, r0)     // Catch:{ all -> 0x02c0 }
            java.lang.String r7 = "If-None-Match"
            r0 = r24
            r1 = r16
            r0.setHeader(r7, r1)     // Catch:{ all -> 0x02c0 }
        L_0x041c:
            org.apache.http.HttpHost r22 = new org.apache.http.HttpHost     // Catch:{ Exception -> 0x04d0 }
            java.net.URI r7 = r24.getURI()     // Catch:{ Exception -> 0x04d0 }
            java.lang.String r7 = r7.getHost()     // Catch:{ Exception -> 0x04d0 }
            java.net.URI r8 = r24.getURI()     // Catch:{ Exception -> 0x04d0 }
            int r8 = r8.getPort()     // Catch:{ Exception -> 0x04d0 }
            java.net.URI r46 = r24.getURI()     // Catch:{ Exception -> 0x04d0 }
            java.lang.String r46 = r46.getScheme()     // Catch:{ Exception -> 0x04d0 }
            r0 = r22
            r1 = r46
            r0.<init>(r7, r8, r1)     // Catch:{ Exception -> 0x04d0 }
            org.apache.http.conn.routing.HttpRoutePlanner r7 = r23.getRoutePlanner()     // Catch:{ Exception -> 0x04d0 }
            r8 = 0
            r0 = r22
            r1 = r24
            org.apache.http.conn.routing.HttpRoute r37 = r7.determineRoute(r0, r1, r8)     // Catch:{ Exception -> 0x04d0 }
            com.getjar.sdk.logging.Area r7 = com.getjar.sdk.logging.Area.COMM     // Catch:{ Exception -> 0x04d0 }
            long r7 = r7.value()     // Catch:{ Exception -> 0x04d0 }
            java.util.Locale r46 = java.util.Locale.US     // Catch:{ Exception -> 0x04d0 }
            java.lang.String r47 = "%1$s ROUTE [ResolvedIP: %2$s  ProxyHost: %3$s  TargetHoust: %4$s  Secured: %5$s  Tunnelled: %6$s]"
            r48 = 6
            r0 = r48
            java.lang.Object[] r0 = new java.lang.Object[r0]     // Catch:{ Exception -> 0x04d0 }
            r48 = r0
            r49 = 0
            java.lang.String r50 = getLoggingPrefix(r53)     // Catch:{ Exception -> 0x04d0 }
            r48[r49] = r50     // Catch:{ Exception -> 0x04d0 }
            r49 = 1
            java.net.URI r50 = r24.getURI()     // Catch:{ Exception -> 0x04d0 }
            java.lang.String r50 = r50.getHost()     // Catch:{ Exception -> 0x04d0 }
            java.net.InetAddress r50 = java.net.InetAddress.getByName(r50)     // Catch:{ Exception -> 0x04d0 }
            java.lang.String r50 = r50.getHostAddress()     // Catch:{ Exception -> 0x04d0 }
            r48[r49] = r50     // Catch:{ Exception -> 0x04d0 }
            r49 = 2
            org.apache.http.HttpHost r50 = r37.getProxyHost()     // Catch:{ Exception -> 0x04d0 }
            r48[r49] = r50     // Catch:{ Exception -> 0x04d0 }
            r49 = 3
            org.apache.http.HttpHost r50 = r37.getTargetHost()     // Catch:{ Exception -> 0x04d0 }
            r48[r49] = r50     // Catch:{ Exception -> 0x04d0 }
            r49 = 4
            boolean r50 = r37.isSecure()     // Catch:{ Exception -> 0x04d0 }
            java.lang.Boolean r50 = java.lang.Boolean.valueOf(r50)     // Catch:{ Exception -> 0x04d0 }
            r48[r49] = r50     // Catch:{ Exception -> 0x04d0 }
            r49 = 5
            boolean r50 = r37.isTunnelled()     // Catch:{ Exception -> 0x04d0 }
            java.lang.Boolean r50 = java.lang.Boolean.valueOf(r50)     // Catch:{ Exception -> 0x04d0 }
            r48[r49] = r50     // Catch:{ Exception -> 0x04d0 }
            java.lang.String r46 = java.lang.String.format(r46, r47, r48)     // Catch:{ Exception -> 0x04d0 }
            r0 = r46
            com.getjar.sdk.logging.Logger.m646v(r7, r0)     // Catch:{ Exception -> 0x04d0 }
        L_0x04a9:
            com.getjar.sdk.comm.RequestUtilities.debugDumpRequestProperties(r24)     // Catch:{ all -> 0x02c0 }
            org.apache.http.HttpResponse r26 = r23.execute(r24)     // Catch:{ all -> 0x02c0 }
            if (r26 != 0) goto L_0x04f9
            java.lang.IllegalStateException r7 = new java.lang.IllegalStateException     // Catch:{ all -> 0x02c0 }
            java.util.Locale r8 = java.util.Locale.US     // Catch:{ all -> 0x02c0 }
            java.lang.String r46 = "Failed to get a response from a service call [URL:%1$s]"
            r47 = 1
            r0 = r47
            java.lang.Object[] r0 = new java.lang.Object[r0]     // Catch:{ all -> 0x02c0 }
            r47 = r0
            r48 = 0
            r47[r48] = r44     // Catch:{ all -> 0x02c0 }
            r0 = r46
            r1 = r47
            java.lang.String r8 = java.lang.String.format(r8, r0, r1)     // Catch:{ all -> 0x02c0 }
            r7.<init>(r8)     // Catch:{ all -> 0x02c0 }
            throw r7     // Catch:{ all -> 0x02c0 }
        L_0x04d0:
            r15 = move-exception
            com.getjar.sdk.logging.Area r7 = com.getjar.sdk.logging.Area.COMM     // Catch:{ all -> 0x02c0 }
            long r7 = r7.value()     // Catch:{ all -> 0x02c0 }
            java.util.Locale r46 = java.util.Locale.US     // Catch:{ all -> 0x02c0 }
            java.lang.String r47 = "%1$s Failed to resolve and log the request route for '%2$s'"
            r48 = 2
            r0 = r48
            java.lang.Object[] r0 = new java.lang.Object[r0]     // Catch:{ all -> 0x02c0 }
            r48 = r0
            r49 = 0
            java.lang.String r50 = getLoggingPrefix(r53)     // Catch:{ all -> 0x02c0 }
            r48[r49] = r50     // Catch:{ all -> 0x02c0 }
            r49 = 1
            r48[r49] = r44     // Catch:{ all -> 0x02c0 }
            java.lang.String r46 = java.lang.String.format(r46, r47, r48)     // Catch:{ all -> 0x02c0 }
            r0 = r46
            com.getjar.sdk.logging.Logger.m643e(r7, r0, r15)     // Catch:{ all -> 0x02c0 }
            goto L_0x04a9
        L_0x04f9:
            org.apache.http.StatusLine r7 = r26.getStatusLine()     // Catch:{ all -> 0x02c0 }
            if (r7 == 0) goto L_0x0507
            org.apache.http.StatusLine r7 = r26.getStatusLine()     // Catch:{ all -> 0x02c0 }
            int r6 = r7.getStatusCode()     // Catch:{ all -> 0x02c0 }
        L_0x0507:
            com.getjar.sdk.logging.Area r7 = com.getjar.sdk.logging.Area.COMM     // Catch:{ all -> 0x02c0 }
            long r7 = r7.value()     // Catch:{ all -> 0x02c0 }
            java.util.Locale r46 = java.util.Locale.US     // Catch:{ all -> 0x02c0 }
            java.lang.String r47 = "%1$s Result code: %2$d"
            r48 = 2
            r0 = r48
            java.lang.Object[] r0 = new java.lang.Object[r0]     // Catch:{ all -> 0x02c0 }
            r48 = r0
            r49 = 0
            java.lang.String r50 = getLoggingPrefix(r53)     // Catch:{ all -> 0x02c0 }
            r48[r49] = r50     // Catch:{ all -> 0x02c0 }
            r49 = 1
            java.lang.Integer r50 = java.lang.Integer.valueOf(r6)     // Catch:{ all -> 0x02c0 }
            r48[r49] = r50     // Catch:{ all -> 0x02c0 }
            java.lang.String r46 = java.lang.String.format(r46, r47, r48)     // Catch:{ all -> 0x02c0 }
            r0 = r46
            com.getjar.sdk.logging.Logger.m640d(r7, r0)     // Catch:{ all -> 0x02c0 }
            r4 = 0
            org.apache.http.HttpEntity r17 = r26.getEntity()     // Catch:{ all -> 0x02c0 }
            if (r17 == 0) goto L_0x05af
            java.io.InputStream r28 = r17.getContent()     // Catch:{ all -> 0x02c0 }
            java.lang.String r7 = "Content-Encoding"
            r0 = r26
            org.apache.http.Header r13 = r0.getFirstHeader(r7)     // Catch:{ all -> 0x02c0 }
            if (r13 == 0) goto L_0x059a
            java.lang.String r7 = r13.getValue()     // Catch:{ all -> 0x02c0 }
            boolean r7 = com.getjar.sdk.utilities.StringUtility.isNullOrEmpty(r7)     // Catch:{ all -> 0x02c0 }
            if (r7 != 0) goto L_0x059a
            java.lang.String r7 = r13.getValue()     // Catch:{ all -> 0x02c0 }
            java.lang.String r8 = "gzip"
            boolean r7 = r7.equalsIgnoreCase(r8)     // Catch:{ all -> 0x02c0 }
            if (r7 == 0) goto L_0x059a
            com.getjar.sdk.logging.Area r7 = com.getjar.sdk.logging.Area.COMM     // Catch:{ all -> 0x02c0 }
            long r7 = r7.value()     // Catch:{ all -> 0x02c0 }
            java.lang.String r46 = "CommManager processesRequest gzipped data received"
            r0 = r46
            com.getjar.sdk.logging.Logger.m644i(r7, r0)     // Catch:{ all -> 0x02c0 }
            java.util.zip.GZIPInputStream r29 = new java.util.zip.GZIPInputStream     // Catch:{ all -> 0x02c0 }
            r0 = r29
            r1 = r28
            r0.<init>(r1)     // Catch:{ all -> 0x02c0 }
            r28 = r29
        L_0x0575:
            java.lang.StringBuilder r11 = new java.lang.StringBuilder     // Catch:{ RuntimeException -> 0x05f3 }
            java.lang.String r7 = ""
            r11.<init>(r7)     // Catch:{ RuntimeException -> 0x05f3 }
            java.io.BufferedReader r35 = new java.io.BufferedReader     // Catch:{ RuntimeException -> 0x05f3 }
            java.io.InputStreamReader r7 = new java.io.InputStreamReader     // Catch:{ RuntimeException -> 0x05f3 }
            r0 = r28
            r7.<init>(r0)     // Catch:{ RuntimeException -> 0x05f3 }
            r0 = r35
            r0.<init>(r7)     // Catch:{ RuntimeException -> 0x05f3 }
            java.lang.String r31 = r35.readLine()     // Catch:{ RuntimeException -> 0x05f3 }
        L_0x058e:
            if (r31 == 0) goto L_0x05a8
            r0 = r31
            r11.append(r0)     // Catch:{ RuntimeException -> 0x05f3 }
            java.lang.String r31 = r35.readLine()     // Catch:{ RuntimeException -> 0x05f3 }
            goto L_0x058e
        L_0x059a:
            com.getjar.sdk.logging.Area r7 = com.getjar.sdk.logging.Area.COMM     // Catch:{ all -> 0x02c0 }
            long r7 = r7.value()     // Catch:{ all -> 0x02c0 }
            java.lang.String r46 = "CommManager processesRequest received data not gzipped "
            r0 = r46
            com.getjar.sdk.logging.Logger.m644i(r7, r0)     // Catch:{ all -> 0x02c0 }
            goto L_0x0575
        L_0x05a8:
            java.lang.String r4 = r11.toString()     // Catch:{ RuntimeException -> 0x05f3 }
            r28.close()     // Catch:{ all -> 0x02c0 }
        L_0x05af:
            java.util.HashMap r5 = new java.util.HashMap     // Catch:{ all -> 0x02c0 }
            r5.<init>()     // Catch:{ all -> 0x02c0 }
            org.apache.http.Header[] r9 = r26.getAllHeaders()     // Catch:{ all -> 0x02c0 }
            int r0 = r9.length     // Catch:{ all -> 0x02c0 }
            r30 = r0
            r27 = 0
        L_0x05bd:
            r0 = r27
            r1 = r30
            if (r0 >= r1) goto L_0x05fd
            r14 = r9[r27]     // Catch:{ all -> 0x02c0 }
            java.lang.String r7 = r14.getName()     // Catch:{ all -> 0x02c0 }
            boolean r7 = r5.containsKey(r7)     // Catch:{ all -> 0x02c0 }
            if (r7 != 0) goto L_0x05df
            java.lang.String r7 = r14.getName()     // Catch:{ all -> 0x02c0 }
            java.util.ArrayList r8 = new java.util.ArrayList     // Catch:{ all -> 0x02c0 }
            r46 = 1
            r0 = r46
            r8.<init>(r0)     // Catch:{ all -> 0x02c0 }
            r5.put(r7, r8)     // Catch:{ all -> 0x02c0 }
        L_0x05df:
            java.lang.String r7 = r14.getName()     // Catch:{ all -> 0x02c0 }
            java.lang.Object r7 = r5.get(r7)     // Catch:{ all -> 0x02c0 }
            java.util.List r7 = (java.util.List) r7     // Catch:{ all -> 0x02c0 }
            java.lang.String r8 = r14.getValue()     // Catch:{ all -> 0x02c0 }
            r7.add(r8)     // Catch:{ all -> 0x02c0 }
            int r27 = r27 + 1
            goto L_0x05bd
        L_0x05f3:
            r18 = move-exception
            r24.abort()     // Catch:{ all -> 0x05f8 }
            throw r18     // Catch:{ all -> 0x05f8 }
        L_0x05f8:
            r7 = move-exception
            r28.close()     // Catch:{ all -> 0x02c0 }
            throw r7     // Catch:{ all -> 0x02c0 }
        L_0x05fd:
            com.getjar.sdk.comm.Result r3 = new com.getjar.sdk.comm.Result     // Catch:{ all -> 0x02c0 }
            int r7 = r53.getId()     // Catch:{ all -> 0x02c0 }
            java.lang.String r7 = java.lang.Integer.toString(r7)     // Catch:{ all -> 0x02c0 }
            boolean r8 = r53.getSuppressInternalCallbacks()     // Catch:{ all -> 0x02c0 }
            r3.<init>(r4, r5, r6, r7, r8)     // Catch:{ all -> 0x02c0 }
            r0 = r53
            r0.setResult(r3)     // Catch:{ all -> 0x0708 }
            boolean r7 = r3.isSuccessfulResponse()     // Catch:{ all -> 0x0708 }
            if (r7 == 0) goto L_0x0652
            org.json.JSONObject r7 = r3.getResponseJson()     // Catch:{ all -> 0x0708 }
            if (r7 != 0) goto L_0x0652
            com.getjar.sdk.logging.Area r7 = com.getjar.sdk.logging.Area.COMM     // Catch:{ all -> 0x0708 }
            long r7 = r7.value()     // Catch:{ all -> 0x0708 }
            java.util.Locale r46 = java.util.Locale.US     // Catch:{ all -> 0x0708 }
            java.lang.String r47 = "%1$s Received a bad response from a service call [URL:%2$s] [RESPONSE_CODE: %3$d] [RESPONSE:%4$s]"
            r48 = 4
            r0 = r48
            java.lang.Object[] r0 = new java.lang.Object[r0]     // Catch:{ all -> 0x0708 }
            r48 = r0
            r49 = 0
            java.lang.String r50 = getLoggingPrefix(r53)     // Catch:{ all -> 0x0708 }
            r48[r49] = r50     // Catch:{ all -> 0x0708 }
            r49 = 1
            r48[r49] = r44     // Catch:{ all -> 0x0708 }
            r49 = 2
            java.lang.Integer r50 = java.lang.Integer.valueOf(r6)     // Catch:{ all -> 0x0708 }
            r48[r49] = r50     // Catch:{ all -> 0x0708 }
            r49 = 3
            r48[r49] = r4     // Catch:{ all -> 0x0708 }
            java.lang.String r46 = java.lang.String.format(r46, r47, r48)     // Catch:{ all -> 0x0708 }
            r0 = r46
            com.getjar.sdk.logging.Logger.m648w(r7, r0)     // Catch:{ all -> 0x0708 }
        L_0x0652:
            org.apache.http.conn.ClientConnectionManager r7 = r23.getConnectionManager()     // Catch:{ UnsupportedEncodingException -> 0x02cb }
            r7.shutdown()     // Catch:{ UnsupportedEncodingException -> 0x02cb }
            boolean r7 = r53.isDoNotCache()     // Catch:{ UnsupportedEncodingException -> 0x02cb }
            if (r7 != 0) goto L_0x0668
            r0 = r52
            com.getjar.sdk.comm.ResultCachingManager r7 = r0._cachingManager     // Catch:{ UnsupportedEncodingException -> 0x02cb }
            r0 = r53
            r7.addResultToCache(r0)     // Catch:{ UnsupportedEncodingException -> 0x02cb }
        L_0x0668:
            com.getjar.sdk.logging.Area r7 = com.getjar.sdk.logging.Area.COMM     // Catch:{ URISyntaxException -> 0x0343 }
            long r7 = r7.value()     // Catch:{ URISyntaxException -> 0x0343 }
            java.util.Locale r46 = java.util.Locale.US     // Catch:{ URISyntaxException -> 0x0343 }
            java.lang.String r47 = "%1$s Finished Request"
            r48 = 1
            r0 = r48
            java.lang.Object[] r0 = new java.lang.Object[r0]     // Catch:{ URISyntaxException -> 0x0343 }
            r48 = r0
            r49 = 0
            java.lang.String r50 = getLoggingPrefix(r53)     // Catch:{ URISyntaxException -> 0x0343 }
            r48[r49] = r50     // Catch:{ URISyntaxException -> 0x0343 }
            java.lang.String r46 = java.lang.String.format(r46, r47, r48)     // Catch:{ URISyntaxException -> 0x0343 }
            r0 = r46
            com.getjar.sdk.logging.Logger.m644i(r7, r0)     // Catch:{ URISyntaxException -> 0x0343 }
            long r7 = java.lang.System.currentTimeMillis()     // Catch:{ URISyntaxException -> 0x0343 }
            long r7 = r7 - r40
            int r0 = (int) r7     // Catch:{ URISyntaxException -> 0x0343 }
            r42 = r0
            if (r3 == 0) goto L_0x069b
            r0 = r42
            r3.setResponseTime(r0)     // Catch:{ URISyntaxException -> 0x0343 }
        L_0x069b:
            java.util.Locale r8 = java.util.Locale.US     // Catch:{ URISyntaxException -> 0x0343 }
            java.lang.String r46 = "%1$s REQUEST TIMING: %2$d [TO: %3$s]"
            r7 = 3
            java.lang.Object[] r0 = new java.lang.Object[r7]     // Catch:{ URISyntaxException -> 0x0343 }
            r47 = r0
            r7 = 0
            java.lang.String r48 = getLoggingPrefix(r53)     // Catch:{ URISyntaxException -> 0x0343 }
            r47[r7] = r48     // Catch:{ URISyntaxException -> 0x0343 }
            r7 = 1
            java.lang.Integer r48 = java.lang.Integer.valueOf(r42)     // Catch:{ URISyntaxException -> 0x0343 }
            r47[r7] = r48     // Catch:{ URISyntaxException -> 0x0343 }
            r48 = 2
            if (r44 == 0) goto L_0x06d6
            r7 = r44
        L_0x06b8:
            r47[r48] = r7     // Catch:{ URISyntaxException -> 0x0343 }
            r0 = r46
            r1 = r47
            java.lang.String r43 = java.lang.String.format(r8, r0, r1)     // Catch:{ URISyntaxException -> 0x0343 }
            r7 = 1000(0x3e8, float:1.401E-42)
            r0 = r42
            if (r0 <= r7) goto L_0x06d9
            com.getjar.sdk.logging.Area r7 = com.getjar.sdk.logging.Area.COMM     // Catch:{ URISyntaxException -> 0x0343 }
            long r7 = r7.value()     // Catch:{ URISyntaxException -> 0x0343 }
            r0 = r43
            com.getjar.sdk.logging.Logger.m648w(r7, r0)     // Catch:{ URISyntaxException -> 0x0343 }
        L_0x06d3:
            r7 = r3
            goto L_0x004c
        L_0x06d6:
            java.lang.String r7 = ""
            goto L_0x06b8
        L_0x06d9:
            com.getjar.sdk.logging.Area r7 = com.getjar.sdk.logging.Area.COMM     // Catch:{ URISyntaxException -> 0x0343 }
            long r7 = r7.value()     // Catch:{ URISyntaxException -> 0x0343 }
            r0 = r43
            com.getjar.sdk.logging.Logger.m640d(r7, r0)     // Catch:{ URISyntaxException -> 0x0343 }
            goto L_0x06d3
        L_0x06e5:
            java.lang.String r8 = ""
            goto L_0x0329
        L_0x06e9:
            com.getjar.sdk.logging.Area r8 = com.getjar.sdk.logging.Area.COMM     // Catch:{ URISyntaxException -> 0x0343 }
            long r46 = r8.value()     // Catch:{ URISyntaxException -> 0x0343 }
            r0 = r46
            r2 = r43
            com.getjar.sdk.logging.Logger.m640d(r0, r2)     // Catch:{ URISyntaxException -> 0x0343 }
            goto L_0x0342
        L_0x06f8:
            r7 = move-exception
            goto L_0x01b2
        L_0x06fb:
            r8 = move-exception
            goto L_0x0383
        L_0x06fe:
            r7 = move-exception
            r3 = r36
            goto L_0x02d3
        L_0x0703:
            r15 = move-exception
            r3 = r36
            goto L_0x02cc
        L_0x0708:
            r7 = move-exception
            goto L_0x02c3
        L_0x070b:
            r7 = move-exception
            r19 = r20
            goto L_0x037e
        L_0x0710:
            r24 = r25
            goto L_0x0208
        */
        throw new UnsupportedOperationException("Method not decompiled: com.getjar.sdk.comm.CommManager.processesRequest(com.getjar.sdk.comm.Operation, int):com.getjar.sdk.comm.Result");
    }

    private void startWorker() {
        Logger.m644i(Area.COMM.value(), String.format(Locale.US, "%1$s startWorker()", new Object[]{getLoggingPrefix()}));
        synchronized (_WorkerThreadLock) {
            _WorkerThreadStopping = false;
            if (_WorkerThread == null) {
                _WorkerThread = new Thread(new RequestPipelineManagementRunnable(), "CommManager Worker Thread");
            }
            if (!_WorkerThread.isAlive()) {
                _WorkerThread.start();
                Logger.m644i(Area.COMM.value(), String.format(Locale.US, "%1$s Thread started", new Object[]{getLoggingPrefix()}));
            } else {
                Logger.m646v(Area.COMM.value(), String.format(Locale.US, "%1$s Thread already running", new Object[]{getLoggingPrefix()}));
            }
        }
    }

    /* JADX WARNING: No exception handlers in catch block: Catch:{  } */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private void stopWorker() {
        /*
            r10 = this;
            r5 = 1
            r7 = 0
            com.getjar.sdk.logging.Area r1 = com.getjar.sdk.logging.Area.COMM
            long r1 = r1.value()
            java.util.Locale r3 = java.util.Locale.US
            java.lang.String r4 = "%1$s stopWorker()"
            java.lang.Object[] r5 = new java.lang.Object[r5]
            java.lang.String r6 = getLoggingPrefix()
            r5[r7] = r6
            java.lang.String r3 = java.lang.String.format(r3, r4, r5)
            com.getjar.sdk.logging.Logger.m644i(r1, r3)
            java.lang.Object r2 = _WorkerThreadLock
            monitor-enter(r2)
            java.lang.Thread r1 = _WorkerThread     // Catch:{ all -> 0x0097 }
            if (r1 != 0) goto L_0x003f
            com.getjar.sdk.logging.Area r1 = com.getjar.sdk.logging.Area.COMM     // Catch:{ all -> 0x0097 }
            long r3 = r1.value()     // Catch:{ all -> 0x0097 }
            java.util.Locale r1 = java.util.Locale.US     // Catch:{ all -> 0x0097 }
            java.lang.String r5 = "%1$s Thread already stopped"
            r6 = 1
            java.lang.Object[] r6 = new java.lang.Object[r6]     // Catch:{ all -> 0x0097 }
            r7 = 0
            java.lang.String r8 = getLoggingPrefix()     // Catch:{ all -> 0x0097 }
            r6[r7] = r8     // Catch:{ all -> 0x0097 }
            java.lang.String r1 = java.lang.String.format(r1, r5, r6)     // Catch:{ all -> 0x0097 }
            com.getjar.sdk.logging.Logger.m646v(r3, r1)     // Catch:{ all -> 0x0097 }
            monitor-exit(r2)     // Catch:{ all -> 0x0097 }
        L_0x003e:
            return
        L_0x003f:
            r1 = 1
            _WorkerThreadStopping = r1     // Catch:{ all -> 0x0097 }
            com.getjar.sdk.logging.Area r1 = com.getjar.sdk.logging.Area.COMM     // Catch:{ all -> 0x0097 }
            long r3 = r1.value()     // Catch:{ all -> 0x0097 }
            java.util.Locale r1 = java.util.Locale.US     // Catch:{ all -> 0x0097 }
            java.lang.String r5 = "%1$s kicking worker thread"
            r6 = 1
            java.lang.Object[] r6 = new java.lang.Object[r6]     // Catch:{ all -> 0x0097 }
            r7 = 0
            java.lang.String r8 = getLoggingPrefix()     // Catch:{ all -> 0x0097 }
            r6[r7] = r8     // Catch:{ all -> 0x0097 }
            java.lang.String r1 = java.lang.String.format(r1, r5, r6)     // Catch:{ all -> 0x0097 }
            com.getjar.sdk.logging.Logger.m646v(r3, r1)     // Catch:{ all -> 0x0097 }
            java.lang.Object r3 = _RequestPipelineLock     // Catch:{ all -> 0x0097 }
            monitor-enter(r3)     // Catch:{ all -> 0x0097 }
            java.lang.Object r1 = _RequestPipelineLock     // Catch:{ all -> 0x009a }
            r1.notify()     // Catch:{ all -> 0x009a }
            monitor-exit(r3)     // Catch:{ all -> 0x009a }
            java.lang.Thread r1 = _WorkerThread     // Catch:{ InterruptedException -> 0x009d, Exception -> 0x00ec }
            r3 = 2000(0x7d0, double:9.88E-321)
            r1.join(r3)     // Catch:{ InterruptedException -> 0x009d, Exception -> 0x00ec }
            java.lang.Thread r1 = _WorkerThread     // Catch:{ InterruptedException -> 0x009d, Exception -> 0x00ec }
            r1.interrupt()     // Catch:{ InterruptedException -> 0x009d, Exception -> 0x00ec }
            java.lang.Thread r1 = _WorkerThread     // Catch:{ InterruptedException -> 0x009d, Exception -> 0x00ec }
            r1.join()     // Catch:{ InterruptedException -> 0x009d, Exception -> 0x00ec }
            r1 = 0
            _WorkerThread = r1     // Catch:{ all -> 0x0097 }
            com.getjar.sdk.logging.Area r1 = com.getjar.sdk.logging.Area.COMM     // Catch:{ all -> 0x0097 }
            long r3 = r1.value()     // Catch:{ all -> 0x0097 }
            java.util.Locale r1 = java.util.Locale.US     // Catch:{ all -> 0x0097 }
            java.lang.String r5 = "%1$s Thread stopped"
            r6 = 1
            java.lang.Object[] r6 = new java.lang.Object[r6]     // Catch:{ all -> 0x0097 }
            r7 = 0
            java.lang.String r8 = getLoggingPrefix()     // Catch:{ all -> 0x0097 }
            r6[r7] = r8     // Catch:{ all -> 0x0097 }
            java.lang.String r1 = java.lang.String.format(r1, r5, r6)     // Catch:{ all -> 0x0097 }
            com.getjar.sdk.logging.Logger.m644i(r3, r1)     // Catch:{ all -> 0x0097 }
        L_0x0095:
            monitor-exit(r2)     // Catch:{ all -> 0x0097 }
            goto L_0x003e
        L_0x0097:
            r1 = move-exception
            monitor-exit(r2)     // Catch:{ all -> 0x0097 }
            throw r1
        L_0x009a:
            r1 = move-exception
            monitor-exit(r3)     // Catch:{ all -> 0x009a }
            throw r1     // Catch:{ all -> 0x0097 }
        L_0x009d:
            r0 = move-exception
            com.getjar.sdk.logging.Area r1 = com.getjar.sdk.logging.Area.COMM     // Catch:{ all -> 0x0131 }
            long r3 = r1.value()     // Catch:{ all -> 0x0131 }
            java.util.Locale r1 = java.util.Locale.US     // Catch:{ all -> 0x0131 }
            java.util.Locale r5 = java.util.Locale.US     // Catch:{ all -> 0x0131 }
            java.lang.String r6 = "%1$s Thread '%2$s' received an interrupt"
            r7 = 2
            java.lang.Object[] r7 = new java.lang.Object[r7]     // Catch:{ all -> 0x0131 }
            r8 = 0
            java.lang.String r9 = getLoggingPrefix()     // Catch:{ all -> 0x0131 }
            r7[r8] = r9     // Catch:{ all -> 0x0131 }
            r8 = 1
            java.lang.Thread r9 = java.lang.Thread.currentThread()     // Catch:{ all -> 0x0131 }
            java.lang.String r9 = r9.getName()     // Catch:{ all -> 0x0131 }
            r7[r8] = r9     // Catch:{ all -> 0x0131 }
            java.lang.String r5 = java.lang.String.format(r5, r6, r7)     // Catch:{ all -> 0x0131 }
            r6 = 0
            java.lang.Object[] r6 = new java.lang.Object[r6]     // Catch:{ all -> 0x0131 }
            java.lang.String r1 = java.lang.String.format(r1, r5, r6)     // Catch:{ all -> 0x0131 }
            com.getjar.sdk.logging.Logger.m643e(r3, r1, r0)     // Catch:{ all -> 0x0131 }
            r1 = 0
            _WorkerThread = r1     // Catch:{ all -> 0x0097 }
            com.getjar.sdk.logging.Area r1 = com.getjar.sdk.logging.Area.COMM     // Catch:{ all -> 0x0097 }
            long r3 = r1.value()     // Catch:{ all -> 0x0097 }
            java.util.Locale r1 = java.util.Locale.US     // Catch:{ all -> 0x0097 }
            java.lang.String r5 = "%1$s Thread stopped"
            r6 = 1
            java.lang.Object[] r6 = new java.lang.Object[r6]     // Catch:{ all -> 0x0097 }
            r7 = 0
            java.lang.String r8 = getLoggingPrefix()     // Catch:{ all -> 0x0097 }
            r6[r7] = r8     // Catch:{ all -> 0x0097 }
            java.lang.String r1 = java.lang.String.format(r1, r5, r6)     // Catch:{ all -> 0x0097 }
            com.getjar.sdk.logging.Logger.m644i(r3, r1)     // Catch:{ all -> 0x0097 }
            goto L_0x0095
        L_0x00ec:
            r0 = move-exception
            com.getjar.sdk.logging.Area r1 = com.getjar.sdk.logging.Area.COMM     // Catch:{ all -> 0x0131 }
            long r3 = r1.value()     // Catch:{ all -> 0x0131 }
            java.util.Locale r1 = java.util.Locale.US     // Catch:{ all -> 0x0131 }
            java.util.Locale r5 = java.util.Locale.US     // Catch:{ all -> 0x0131 }
            java.lang.String r6 = "%1$s failed"
            r7 = 1
            java.lang.Object[] r7 = new java.lang.Object[r7]     // Catch:{ all -> 0x0131 }
            r8 = 0
            java.lang.String r9 = getLoggingPrefix()     // Catch:{ all -> 0x0131 }
            r7[r8] = r9     // Catch:{ all -> 0x0131 }
            java.lang.String r5 = java.lang.String.format(r5, r6, r7)     // Catch:{ all -> 0x0131 }
            r6 = 0
            java.lang.Object[] r6 = new java.lang.Object[r6]     // Catch:{ all -> 0x0131 }
            java.lang.String r1 = java.lang.String.format(r1, r5, r6)     // Catch:{ all -> 0x0131 }
            com.getjar.sdk.logging.Logger.m643e(r3, r1, r0)     // Catch:{ all -> 0x0131 }
            r1 = 0
            _WorkerThread = r1     // Catch:{ all -> 0x0097 }
            com.getjar.sdk.logging.Area r1 = com.getjar.sdk.logging.Area.COMM     // Catch:{ all -> 0x0097 }
            long r3 = r1.value()     // Catch:{ all -> 0x0097 }
            java.util.Locale r1 = java.util.Locale.US     // Catch:{ all -> 0x0097 }
            java.lang.String r5 = "%1$s Thread stopped"
            r6 = 1
            java.lang.Object[] r6 = new java.lang.Object[r6]     // Catch:{ all -> 0x0097 }
            r7 = 0
            java.lang.String r8 = getLoggingPrefix()     // Catch:{ all -> 0x0097 }
            r6[r7] = r8     // Catch:{ all -> 0x0097 }
            java.lang.String r1 = java.lang.String.format(r1, r5, r6)     // Catch:{ all -> 0x0097 }
            com.getjar.sdk.logging.Logger.m644i(r3, r1)     // Catch:{ all -> 0x0097 }
            goto L_0x0095
        L_0x0131:
            r1 = move-exception
            r3 = 0
            _WorkerThread = r3     // Catch:{ all -> 0x0097 }
            com.getjar.sdk.logging.Area r3 = com.getjar.sdk.logging.Area.COMM     // Catch:{ all -> 0x0097 }
            long r3 = r3.value()     // Catch:{ all -> 0x0097 }
            java.util.Locale r5 = java.util.Locale.US     // Catch:{ all -> 0x0097 }
            java.lang.String r6 = "%1$s Thread stopped"
            r7 = 1
            java.lang.Object[] r7 = new java.lang.Object[r7]     // Catch:{ all -> 0x0097 }
            r8 = 0
            java.lang.String r9 = getLoggingPrefix()     // Catch:{ all -> 0x0097 }
            r7[r8] = r9     // Catch:{ all -> 0x0097 }
            java.lang.String r5 = java.lang.String.format(r5, r6, r7)     // Catch:{ all -> 0x0097 }
            com.getjar.sdk.logging.Logger.m644i(r3, r5)     // Catch:{ all -> 0x0097 }
            throw r1     // Catch:{ all -> 0x0097 }
        */
        throw new UnsupportedOperationException("Method not decompiled: com.getjar.sdk.comm.CommManager.stopWorker():void");
    }

    /* access modifiers changed from: private */
    public long getSleepTime() {
        long sleepTime = Long.MAX_VALUE;
        long now = System.currentTimeMillis();
        Iterator i$ = _RetryRequests.iterator();
        while (i$.hasNext()) {
            long delta = i$.next().getRetryAfterTimestamp() - now;
            if (delta < sleepTime) {
                sleepTime = delta;
            }
        }
        if (sleepTime < 10) {
            sleepTime = 10;
        }
        if (sleepTime == Long.MAX_VALUE) {
            Logger.m646v(Area.COMM.value(), String.format(Locale.US, "%1$s returning a sleep time of MAX_VALUE", new Object[]{getLoggingPrefix()}));
        } else {
            Logger.m646v(Area.COMM.value(), String.format(Locale.US, "%1$s returning a sleep time of %2$d milliseconds", new Object[]{getLoggingPrefix(), Long.valueOf(sleepTime)}));
        }
        return sleepTime;
    }

    public static CommContext createContextForAuth(Context androidContext) {
        if (androidContext == null) {
            throw new IllegalArgumentException("'androidContext' can not be NULL");
        }
        String applicationKey = ApplicationKeyDatabase.getInstance(androidContext).getApplicationKey();
        if (StringUtility.isNullOrEmpty(applicationKey)) {
            throw new IllegalStateException("'applicationKey' can not be NULL or empty");
        }
        CommContext newContext = new CommContext(applicationKey, androidContext, new ResultReceiver((Handler) null));
        _IdentifierToCommContextMap.put(newContext.getCommContextId(), newContext);
        Logger.m640d(Area.COMM.value(), String.format(Locale.US, "%1$s Created a NEW CommContext for Auth from %2$s.%3$s() [PID:%4$d] [AppKey:%5$s] [CommContext.Id:%6$s]", new Object[]{getLoggingPrefix(), Thread.currentThread().getStackTrace()[3].getClassName(), Thread.currentThread().getStackTrace()[3].getMethodName(), Integer.valueOf(Process.myPid()), applicationKey, newContext.getCommContextId()}));
        return newContext;
    }

    public static CommContext createContext(String applicationToken, Context androidContext, ResultReceiver resultReceiver, LaunchWork launchWork) {
        if (StringUtility.isNullOrEmpty(applicationToken)) {
            throw new IllegalArgumentException("'applicationKey' cannot be NULL or empty");
        } else if (androidContext != null) {
            return createContextInternal(applicationToken, (String) null, androidContext, resultReceiver, (ProviderHint) null, launchWork);
        } else {
            throw new IllegalArgumentException("'androidContext' cannot be NULL");
        }
    }

    public static CommContext createContext(String applicationToken, String encryptionKey, Context androidContext, ResultReceiver resultReceiver, LaunchWork launchWork) {
        if (StringUtility.isNullOrEmpty(applicationToken)) {
            throw new IllegalArgumentException("'applicationKey' cannot be NULL or empty");
        } else if (StringUtility.isNullOrEmpty(encryptionKey)) {
            throw new IllegalArgumentException("'appEncryptionPublicKey' cannot be null");
        } else if (androidContext != null) {
            return createContextInternal(applicationToken, encryptionKey, androidContext, resultReceiver, (ProviderHint) null, launchWork);
        } else {
            throw new IllegalArgumentException("'androidContext' cannot be NULL");
        }
    }

    public static CommContext createContext(String applicationToken, Context androidContext, Intent getjarIntent, LaunchWork launchWork) {
        if (StringUtility.isNullOrEmpty(applicationToken)) {
            throw new IllegalArgumentException("'applicationKey' cannot be NULL or empty");
        } else if (androidContext == null) {
            throw new IllegalArgumentException("'androidContext' cannot be NULL");
        } else if (getjarIntent == null) {
            throw new IllegalArgumentException("'getjarIntent' cannot be NULL");
        } else if (!getjarIntent.getBooleanExtra(GetJarManager.GetjarIntentKey, false)) {
            throw new IllegalArgumentException("'getjarIntent' does not apear to be a Getjar Intent (must contain GetJarManager.GetjarIntentKey with a value of TRUE)");
        } else {
            String providerFilter = getjarIntent.getStringExtra(AuthProviderFilterNameKey);
            if (StringUtility.isNullOrEmpty(providerFilter)) {
                throw new IllegalArgumentException(String.format(Locale.US, "'getjarIntent' does not contain a valid provider filter [%1$s]", new Object[]{providerFilter}));
            }
            String providerFilterData = getjarIntent.getStringExtra(AuthProviderFilterDataKey);
            if (StringUtility.isNullOrEmpty(providerFilterData)) {
                throw new IllegalArgumentException("'getjarIntent' does not contain provider filter data");
            }
            HashMap<String, String> providerFilterDataMap = ProviderHint.parseData(providerFilterData);
            if (providerFilterDataMap == null || providerFilterDataMap.size() <= 0) {
                throw new IllegalArgumentException(String.format(Locale.US, "'getjarIntent' does not contain provider filter data that can be parsed [%1$s]", new Object[]{providerFilterData}));
            }
            return createContextInternal(applicationToken, (String) null, androidContext, (ResultReceiver) null, new ProviderHint(providerFilter, providerFilterDataMap), launchWork);
        }
    }

    private static CommContext createContextInternal(String applicationToken, String encryptionKey, Context androidContext, ResultReceiver resultReceiver, ProviderHint providerHint, LaunchWork launchWork) {
        CommContext newContext;
        boolean authStartedSuccessfully;
        UUID.fromString(applicationToken);
        ApplicationKeyDatabase.getInstance(androidContext).setApplicationKey(applicationToken);
        Logger.m646v(Area.COMM.value(), String.format(Locale.US, "%1$s Calling configureAppenders()", new Object[]{getLoggingPrefix()}));
        try {
            Logger.getInstance().configureAppenders(androidContext);
        } catch (Exception e) {
            Logger.m643e(Area.COMM.value() | Area.CONFIG.value(), "configureAppenders() failed", e);
        }
        Logger.m646v(Area.COMM.value(), String.format(Locale.US, "%1$s Creating CommContext instance", new Object[]{getLoggingPrefix()}));
        if (StringUtility.isNullOrEmpty(encryptionKey)) {
            newContext = new CommContext(applicationToken, androidContext, resultReceiver);
        } else {
            newContext = new CommContext(applicationToken, encryptionKey, androidContext, resultReceiver);
        }
        _IdentifierToCommContextMap.put(newContext.getCommContextId(), newContext);
        Logger.m644i(Area.COMM.value(), String.format(Locale.US, "%1$s Created a NEW CommContext from %2$s.%3$s() [PID:%4$d] [AppToken:%5$s] [CommContext.Id:%6$s]", new Object[]{getLoggingPrefix(), Thread.currentThread().getStackTrace()[3].getClassName(), Thread.currentThread().getStackTrace()[3].getMethodName(), Integer.valueOf(Process.myPid()), applicationToken, newContext.getCommContextId()}));
        try {
            AuthManager.initialize(androidContext);
            if (providerHint == null) {
                authStartedSuccessfully = AuthManager.getInstance().ensureAuth();
            } else {
                authStartedSuccessfully = AuthManager.getInstance().ensureAuthResetCurrent(providerHint, false);
            }
            if (authStartedSuccessfully && !LaunchWork.NONE.equals(launchWork)) {
                _ExecutorServiceForLaunchWork.execute(new DoLaunchWork(applicationToken, encryptionKey, androidContext, launchWork));
            }
            if (!LaunchWork.NONE.equals(launchWork) && !LaunchWork.DEALS.equals(launchWork) && RewardUtility.checkPermission(androidContext, "android.permission.ACCESS_NETWORK_STATE")) {
                NetworkStateReceiver.getInstance().registerReceiver(androidContext);
            }
            return newContext;
        } catch (RuntimeException e2) {
            throw e2;
        } catch (Exception e3) {
            throw new AuthException((Throwable) e3);
        }
    }

    public static CommContext retrieveContext(String contextId) {
        return _IdentifierToCommContextMap.get(contextId);
    }

    private static class DoLaunchWork implements Runnable {
        private final Context _androidContext;
        private final String _applicationToken;
        private final String _encryptionKey;
        private final LaunchWork _launchWork;

        public DoLaunchWork(String applicationToken, String encryptionKey, Context androidContext, LaunchWork launchWork) {
            if (StringUtility.isNullOrEmpty(applicationToken)) {
                throw new IllegalArgumentException("'applicationToken' cannot be NULL or empty");
            } else if (androidContext == null) {
                throw new IllegalArgumentException("'androidContext' cannot be NULL");
            } else if (launchWork == null) {
                throw new IllegalArgumentException("'launchWork' cannot be NULL");
            } else if (LaunchWork.NONE.equals(launchWork)) {
                throw new IllegalArgumentException("'launchWork' cannot be NONE");
            } else {
                this._applicationToken = applicationToken;
                this._encryptionKey = encryptionKey;
                this._androidContext = androidContext;
                this._launchWork = launchWork;
            }
        }

        public void run() {
            CommContext launchWorkContext;
            try {
                if (LaunchWork.NONE.equals(this._launchWork)) {
                    Logger.m642e(Area.OFFER.value(), "DoLaunchWork thread started with a LaunchWork value of NONE");
                    return;
                }
                if (StringUtility.isNullOrEmpty(this._encryptionKey)) {
                    launchWorkContext = new CommContext(this._applicationToken, this._androidContext, (ResultReceiver) null);
                } else {
                    launchWorkContext = new CommContext(this._applicationToken, this._encryptionKey, this._androidContext, (ResultReceiver) null);
                }
                CommManager._IdentifierToCommContextMap.put(launchWorkContext.getCommContextId(), launchWorkContext);
                if (LaunchWork.DEALS.equals(this._launchWork)) {
                    if (!AuthManager.getInstance().isNewUser()) {
                        doTransactionRelatedLaunchWork(launchWorkContext);
                    }
                } else if (LaunchWork.ALL.equals(this._launchWork)) {
                    UsageManager.getInstance(launchWorkContext.getApplicationContext()).startPhoneSession();
                    if (!AuthManager.getInstance().isNewUser()) {
                        try {
                            new LicenseEngine(launchWorkContext).retrieveServerProductLicenses(false);
                            Logger.m644i(Area.LICENSING.value(), String.format(Locale.US, "%1$s Updating License cache success", new Object[]{CommManager.getLoggingPrefix()}));
                        } catch (Exception e) {
                            Logger.m643e(Area.LICENSING.value(), String.format(Locale.US, "%1$s Updating License cache failed", new Object[]{CommManager.getLoggingPrefix()}), e);
                        }
                        doTransactionRelatedLaunchWork(launchWorkContext);
                    }
                    if (AuthManager.getInstance().getClaimsManager(launchWorkContext.getApplicationContext()).canBuy()) {
                        try {
                            InAppPurchaseManager.getInstance(launchWorkContext.getApplicationContext()).getGoldOffers();
                        } catch (Exception e2) {
                            Logger.m643e(Area.TRANSACTION.value(), String.format(Locale.US, "%1$s getGoldOffers() failed", new Object[]{CommManager.getLoggingPrefix()}), e2);
                        }
                    }
                } else {
                    throw new IllegalStateException(String.format(Locale.US, "Unsupported LaunchWork value [%1$s]", new Object[]{this._launchWork.name()}));
                }
            } catch (Exception e3) {
                Logger.m643e(Area.COMM.value(), String.format(Locale.US, "%1$s DoLaunchWork.run() failed", new Object[]{CommManager.getLoggingPrefix()}), e3);
            }
        }

        private void doTransactionRelatedLaunchWork(CommContext launchWorkContext) {
            try {
                new TransactionManager(launchWorkContext.getApplicationContext()).recoverOrphanedTransactions(launchWorkContext);
            } catch (Exception e) {
                Logger.m643e(Area.TRANSACTION.value(), String.format(Locale.US, "%1$s Recovering orphaned transactions failed", new Object[]{CommManager.getLoggingPrefix()}), e);
            }
            if (AuthManager.getInstance().getClaimsManager(launchWorkContext.getApplicationContext()).canPurchaseManagedProducts()) {
                try {
                    InAppPurchaseManager.getInstance(launchWorkContext.getApplicationContext()).cancelOrphanedManagedOffers();
                    Logger.m644i(Area.OFFER.value() | Area.TRANSACTION.value(), String.format(Locale.US, "%1$s cancelOrphanedManagedOffers() success", new Object[]{CommManager.getLoggingPrefix()}));
                } catch (Exception e2) {
                    Logger.m643e(Area.OFFER.value() | Area.TRANSACTION.value(), String.format(Locale.US, "%1$s cancelOrphanedManagedOffers() failed", new Object[]{CommManager.getLoggingPrefix()}), e2);
                }
                try {
                    InAppPurchaseManager.getInstance(launchWorkContext.getApplicationContext()).processOutstandingPurchases(false);
                    Logger.m644i(Area.OFFER.value() | Area.TRANSACTION.value(), String.format(Locale.US, "%1$s processOutstandingPurchases() success", new Object[]{CommManager.getLoggingPrefix()}));
                } catch (Exception e3) {
                    Logger.m643e(Area.OFFER.value() | Area.TRANSACTION.value(), String.format(Locale.US, "%1$s processOutstandingPurchases() failed", new Object[]{CommManager.getLoggingPrefix()}), e3);
                }
            }
        }
    }

    /* access modifiers changed from: private */
    public static final String getLoggingPrefix() {
        String methodName = "";
        StackTraceElement[] stackTrace = Thread.currentThread().getStackTrace();
        if (stackTrace != null && stackTrace.length >= 3) {
            methodName = stackTrace[3].getMethodName();
        }
        return String.format(Locale.US, "CommManager: %1$s() [thread:%2$d]", new Object[]{methodName, Long.valueOf(Thread.currentThread().getId())});
    }

    /* access modifiers changed from: private */
    public static final String getLoggingPrefix(Operation operation) {
        String methodName = "";
        StackTraceElement[] stackTrace = Thread.currentThread().getStackTrace();
        if (stackTrace != null && stackTrace.length >= 3) {
            methodName = stackTrace[3].getMethodName();
        }
        String requestId = "";
        if (operation != null) {
            requestId = String.format(Locale.US, " [request:%1$d]", new Object[]{Integer.valueOf(operation.getId())});
        }
        return String.format(Locale.US, "CommManager: %1$s() [thread:%2$d]%3$s", new Object[]{methodName, Long.valueOf(Thread.currentThread().getId()), requestId});
    }

    private class RequestCallable implements Callable<Result> {
        private Operation _operation;

        private RequestCallable(Operation operation) {
            this._operation = null;
            if (operation == null) {
                throw new IllegalArgumentException("'operation' can not be NULL");
            }
            this._operation = operation;
        }

        public Result call() throws Exception {
            Result requestResult = CommManager.this.processesRequestWithRetries(this._operation);
            if (requestResult == null) {
                Logger.m642e(Area.COMM.value(), String.format(Locale.US, "%1$s Received a NULL result", new Object[]{CommManager.getLoggingPrefix(this._operation)}));
            } else {
                Logger.m640d(Area.COMM.value(), String.format(Locale.US, "%1$s Received response code: %2$d", new Object[]{CommManager.getLoggingPrefix(this._operation), Integer.valueOf(requestResult.getResponseCode())}));
                if (requestResult.getResponseJson() != null) {
                    Logger.m640d(Area.COMM.value(), String.format(Locale.US, "%1$s Received response body:\r\n%2$s", new Object[]{CommManager.getLoggingPrefix(this._operation), requestResult.getResponseJson().toString(4)}));
                } else if (!StringUtility.isNullOrEmpty(requestResult.getResponseBody())) {
                    Logger.m640d(Area.COMM.value(), String.format(Locale.US, "%1$s Received response body:\r\n%2$s", new Object[]{CommManager.getLoggingPrefix(this._operation), requestResult.getResponseBody()}));
                }
                if (requestResult.getHeaders() != null && requestResult.getHeaders().size() > 0) {
                    StringBuilder logMsg = new StringBuilder(CommManager.getLoggingPrefix(this._operation));
                    logMsg.append(" Received response headers:\r\n");
                    for (String name : requestResult.getHeaders().keySet()) {
                        for (String value : requestResult.getHeaders().get(name)) {
                            logMsg.append("    ");
                            logMsg.append(name);
                            logMsg.append(" = ");
                            logMsg.append(value);
                            logMsg.append("\r\n");
                        }
                    }
                    Logger.m640d(Area.COMM.value(), logMsg.toString());
                }
            }
            cleanup();
            return requestResult;
        }

        private void cleanup() {
            synchronized (CommManager._RequestPipelineLock) {
                Logger.m640d(Area.COMM.value(), String.format(Locale.US, "%1$s RequestFutureTask has completed work, doing cleanup work [state:%2$s]", new Object[]{CommManager.getLoggingPrefix(this._operation), this._operation.getState()}));
                try {
                    CommManager.this.updateOperationStateFromResult(this._operation);
                } catch (Exception e) {
                    Logger.m643e(Area.COMM.value(), String.format(Locale.US, "%1$s updateOperationStateFromResult() failed", new Object[]{CommManager.getLoggingPrefix(this._operation)}), e);
                }
                if (CommManager._ActiveRequests.remove(this._operation)) {
                    Logger.m644i(Area.COMM.value(), String.format(Locale.US, "%1$s Completed Request has been removed from _ActiveRequests", new Object[]{CommManager.getLoggingPrefix(this._operation)}));
                } else {
                    Logger.m644i(Area.COMM.value(), String.format(Locale.US, "%1$s Completed Request was not found in _ActiveRequests", new Object[]{CommManager.getLoggingPrefix(this._operation)}));
                }
                if (!Operation.Status.RETRYING.equals(this._operation.getState())) {
                    if (CommManager._RequestQueue.remove(this._operation)) {
                        Logger.m642e(Area.COMM.value(), String.format(Locale.US, "%1$s Found completed Request in _RequestQueue", new Object[]{CommManager.getLoggingPrefix(this._operation)}));
                    }
                    if (CommManager._RetryRequests.remove(this._operation)) {
                        Logger.m642e(Area.COMM.value(), String.format(Locale.US, "%1$s Found completed Request in _RetryRequests", new Object[]{CommManager.getLoggingPrefix(this._operation)}));
                    }
                }
                Logger.m646v(Area.COMM.value(), String.format(Locale.US, "%1$s kicking worker thread", new Object[]{CommManager.getLoggingPrefix(this._operation)}));
                CommManager._RequestPipelineLock.notify();
            }
        }
    }

    private class RequestPipelineManagementRunnable implements Runnable {
        private RequestPipelineManagementRunnable() {
        }

        public void run() {
            AuthManager.initialize(CommManager.this._context);
            while (!CommManager._WorkerThreadStopping) {
                try {
                    if (CommManager._WorkerThreadStopping) {
                        break;
                    }
                    synchronized (CommManager._RequestPipelineLock) {
                        Logger.m646v(Area.COMM.value(), String.format(Locale.US, "%1$s queued:%2$d active:%3$d retry:%4$d", new Object[]{CommManager.getLoggingPrefix(), Integer.valueOf(CommManager._RequestQueue.size()), Integer.valueOf(CommManager._ActiveRequests.size()), Integer.valueOf(CommManager._RetryRequests.size())}));
                        long now = System.currentTimeMillis();
                        List<Operation> requestsToMove = new ArrayList<>();
                        Iterator i$ = CommManager._RetryRequests.iterator();
                        while (i$.hasNext()) {
                            Operation retryOperation = (Operation) i$.next();
                            if (retryOperation.getRetryAfterTimestamp() <= now) {
                                if (AuthManager.getInstance().isAuthed() || retryOperation.isAuthRelated()) {
                                    requestsToMove.add(retryOperation);
                                } else {
                                    retryOperation.updateRetryAfterTimestamp(2000);
                                }
                            }
                        }
                        for (Operation retryOperation2 : requestsToMove) {
                            CommManager._RetryRequests.remove(retryOperation2);
                            CommManager._RequestQueue.add(retryOperation2);
                            retryOperation2.setState(Operation.Status.WAITING);
                            Logger.m646v(Area.COMM.value(), String.format(Locale.US, "%1$s moved request from retry to queue", new Object[]{CommManager.getLoggingPrefix(retryOperation2)}));
                        }
                        while (CommManager._ActiveRequests.size() < 2 && CommManager._RequestQueue.size() > 0) {
                            Iterator i$2 = CommManager._RequestQueue.iterator();
                            while (i$2.hasNext()) {
                                ((Operation) i$2.next()).promotePriority();
                            }
                            Collections.sort(CommManager._RequestQueue, OperationPriorityComparator.getInstance());
                            Operation requestToStart = (Operation) CommManager._RequestQueue.remove();
                            CommManager._ActiveRequests.add(requestToStart);
                            requestToStart.setState(Operation.Status.RUNNING);
                            CommManager._ExecutorService.execute(requestToStart.getFuture());
                        }
                        CommManager.this._cachingManager.trimLruEntries();
                        long sleepTime = CommManager.this.getSleepTime();
                        Logger.m646v(Area.COMM.value(), String.format(Locale.US, "%1$s Worker Thread is waiting to be notified", new Object[]{CommManager.getLoggingPrefix()}));
                        CommManager._RequestPipelineLock.wait(sleepTime);
                        Logger.m646v(Area.COMM.value(), String.format(Locale.US, "%1$s Worker Thread is awake", new Object[]{CommManager.getLoggingPrefix()}));
                    }
                    if (CommManager._WorkerThreadStopping) {
                        break;
                    }
                } catch (Exception e) {
                    Logger.m643e(Area.COMM.value(), String.format(Locale.US, "%1$s failure", new Object[]{CommManager.getLoggingPrefix()}), e);
                    try {
                        Thread.sleep(5000);
                    } catch (Exception e2) {
                    }
                }
            }
            Logger.m644i(Area.COMM.value(), String.format(Locale.US, "%1$s Worker Thread exited", new Object[]{CommManager.getLoggingPrefix()}));
        }
    }

    public static void validateManifestFile(Context context, boolean enforceRequired) {
        if (context == null) {
            throw new IllegalArgumentException("'context' cannot be null");
        }
        Logger.m644i(Area.COMM.value(), "CommManager checkManifestFile started");
        PackageManager packageManager = context.getPackageManager();
        if (!RewardUtility.checkPermission(context, "android.permission.INTERNET")) {
            Logger.m642e(Area.COMM.value(), "Your application MUST have the 'android.permission.INTERNET' permission to use the GetJar Rewards SDK");
            throw new GetJarException("Your application MUST have the 'android.permission.INTERNET' permission to use the GetJar Rewards SDK");
        }
        if (!RewardUtility.checkPermission(context, "android.permission.GET_ACCOUNTS")) {
            if (enforceRequired) {
                Logger.m642e(Area.COMM.value(), "Your application MUST have the 'android.permission.GET_ACCOUNTS' permission to use the GetJar Rewards SDK");
                throw new GetJarException("Your application MUST have the 'android.permission.GET_ACCOUNTS' permission to use the GetJar Rewards SDK");
            }
            Logger.m648w(Area.COMM.value(), "[OPTIONAL] The 'android.permission.GET_ACCOUNTS' permission not found in AndroidManifest.xml");
        }
        if (!RewardUtility.checkPermission(context, "android.permission.GET_TASKS")) {
            if (enforceRequired) {
                Logger.m642e(Area.COMM.value(), "Your application MUST have the 'android.permission.GET_TASKS' permission to use the GetJar Rewards SDK");
                throw new GetJarException("Your application MUST have the 'android.permission.GET_TASKS' permission to use the GetJar Rewards SDK");
            }
            Logger.m648w(Area.COMM.value(), "[OPTIONAL] The 'android.permission.GET_TASKS' permission not found in AndroidManifest.xml");
        }
        if (packageManager.queryBroadcastReceivers(new Intent(context, PackageMonitor.class), 65536).isEmpty()) {
            Logger.m642e(Area.COMM.value(), "Could not find the com.getjar.sdk.data.metadata.PackageMonitor defined inside AndroidManifest.xml");
            throw new GetJarException("Could not find the com.getjar.sdk.data.metadata.PackageMonitor defined inside AndroidManifest.xml");
        } else if (packageManager.queryIntentActivities(new Intent(context, GetJarActivity.class), 65536).isEmpty()) {
            Logger.m642e(Area.COMM.value(), "Could not find the com.getjar.sdk.rewards.GetJarActivity defined inside AndroidManifest.xml");
            throw new GetJarException("Could not find the com.getjar.sdk.rewards.GetJarActivity defined inside AndroidManifest.xml");
        } else {
            if (packageManager.queryIntentServices(new Intent(context, GetJarService.class), 65536).isEmpty()) {
                if (enforceRequired) {
                    Logger.m642e(Area.COMM.value(), "Could not find the com.getjar.sdk.rewards.GetJarService defined inside AndroidManifest.xml");
                    throw new GetJarException("Could not find the com.getjar.sdk.rewards.GetJarService defined inside AndroidManifest.xml");
                }
                Logger.m648w(Area.COMM.value(), "[OPTIONAL] Could not find the com.getjar.sdk.rewards.GetJarService defined inside AndroidManifest.xml");
            }
            if (!RewardUtility.checkPermission(context, "com.android.vending.BILLING")) {
                Logger.m648w(Area.COMM.value(), "[OPTIONAL] Your application MUST have the 'com.android.vending.BILLING' permission in order to use the Buy Gold feature in GetJar Rewards SDK");
            }
            if (!RewardUtility.checkPermission(context, Utility.READ_PHONE_STATE_PERMISSION)) {
                Logger.m648w(Area.COMM.value(), "[OPTIONAL] The READ_PHONE_STATE permission not found in AndroidManifest.xml. It helps Getjar SDK detect unique devices that the app is running on.");
            }
            if (!RewardUtility.checkPermission(context, "android.permission.ACCESS_NETWORK_STATE")) {
                Logger.m648w(Area.COMM.value(), "[OPTIONAL] The ACCESS_NETWORK_STATE permission not found in AndroidManifest.xml. It helps the Getjar SDK run efficiently by detecting whether the device is connected to the internet.");
            }
            if (packageManager.queryBroadcastReceivers(new Intent(context, GetJarReceiver.class), 65536).isEmpty()) {
                Logger.m648w(Area.COMM.value(), "[OPTIONAL] Could not find the com.getjar.sdk.rewards.GetJarReceiver defined inside AndroidManifest.xml. It is required if there is no other implementation of Google Play billing.");
            }
        }
    }
}
