package com.getjar.sdk.comm;

import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
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
import com.getjar.sdk.exceptions.ConfigurationException;
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
import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.InetAddress;
import java.net.URI;
import java.net.URISyntaxException;
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
import java.util.zip.GZIPInputStream;
import java.util.zip.GZIPOutputStream;
import org.apache.http.Header;
import org.apache.http.HttpEntity;
import org.apache.http.HttpHost;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.conn.routing.HttpRoute;
import org.apache.http.entity.ByteArrayEntity;
import org.apache.http.entity.StringEntity;
import org.apache.http.protocol.HttpContext;
import org.json.JSONException;
/* loaded from: classes.dex */
public class CommManager {
    public static final String AuthProviderFilterDataKey = "auth.provider_filter.data";
    public static final String AuthProviderFilterNameKey = "auth.provider_filter.name";
    private static final String _CacheNamespace = "commResultCache";
    private static final int _ConnectionTimeout = 30000;
    private static final int _MaxNumberOfSimultaneousRequests = 2;
    private static final int _SocketTimeout = 30000;
    private final ResultCachingManager _cachingManager;
    private final Context _context;
    private static volatile CommManager _Instance = null;
    private static ConcurrentHashMap<String, CommContext> _IdentifierToCommContextMap = new ConcurrentHashMap<>();
    private static Thread _WorkerThread = null;
    private static Object _WorkerThreadLock = new Object();
    private static volatile boolean _WorkerThreadStopping = false;
    private static final ExecutorService _ExecutorService = Executors.newFixedThreadPool(2);
    private static final ExecutorService _ExecutorServiceForLaunchWork = Executors.newSingleThreadExecutor();
    private static LinkedList<Operation> _RequestQueue = new LinkedList<>();
    private static ArrayList<Operation> _ActiveRequests = new ArrayList<>();
    private static ArrayList<Operation> _RetryRequests = new ArrayList<>();
    private static volatile Object _RequestPipelineLock = new Object();

    /* loaded from: classes.dex */
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
        if (_Instance == null) {
            throw new IllegalStateException("CommManager.initialize() must be called first");
        }
        return _Instance;
    }

    public Operation enqueueOperation(Request.ServiceName serviceName, String requestType, URI requestUri, Request.HttpMethod httpMethod, Map<String, String> postData, Map<String, String> requestHeaders, Operation.Priority priority, CommContext commContext, boolean suppressInternalCallbacks, boolean doNotCache, boolean isIdempotent, String authFlowId) {
        Operation newOperation = new Operation(serviceName, requestType, requestUri, httpMethod, postData, requestHeaders, priority, commContext, suppressInternalCallbacks, doNotCache, isIdempotent, authFlowId);
        return enqueueRequest(newOperation, false);
    }

    private Operation enqueueOperationForRetry(Operation operation) {
        if (operation == null) {
            throw new IllegalArgumentException("'operation' can not be NULL");
        }
        if (operation.getState() == Operation.Status.RETRYING) {
            return enqueueRequest(operation, true);
        }
        throw new IllegalStateException("enqueueOperationForRetry() can not be called on an operation that is not in the RETRYING state");
    }

    private Operation enqueueRequest(Operation newOperation, boolean isRetry) {
        Operation returnOperation;
        if (newOperation == null) {
            throw new IllegalArgumentException("'newOperation' can not be NULL");
        }
        if (newOperation.getState() != Operation.Status.CREATED && newOperation.getState() != Operation.Status.RETRYING) {
            throw new IllegalStateException("enqueueRequest() can not be called on an operation that is not in the CREATED or RETRYING state");
        }
        boolean workPending = false;
        Logger.v(Area.COMM.value(), String.format(Locale.US, "%1$s Adding [isRetry:%2$s]", getLoggingPrefix(newOperation), Boolean.valueOf(isRetry)));
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
                String logMsg = String.format(Locale.US, "%1$s Returning preexisting enqueued", getLoggingPrefix(existingOperation));
                if (isRetry) {
                    Logger.w(Area.COMM.value(), logMsg);
                } else {
                    Logger.v(Area.COMM.value(), logMsg);
                }
            } else {
                Result requestResult = null;
                if (!newOperation.isDoNotCache()) {
                    requestResult = this._cachingManager.getRequestResult(newOperation);
                }
                if (requestResult != null) {
                    newOperation.setResult(requestResult);
                    newOperation.setState(Operation.Status.COMPLETED);
                    String logMsg2 = String.format(Locale.US, "%1$s Returning cached results", getLoggingPrefix(newOperation));
                    if (isRetry) {
                        Logger.w(Area.COMM.value(), logMsg2);
                    } else {
                        Logger.v(Area.COMM.value(), logMsg2);
                    }
                } else {
                    FutureTask<Result> requestFuture = new FutureTask<>(new RequestCallable(newOperation));
                    newOperation.setFuture(requestFuture);
                    if (isRetry) {
                        _RetryRequests.add(newOperation);
                        newOperation.setState(Operation.Status.RETRYING);
                        Logger.v(Area.COMM.value(), String.format(Locale.US, "%1$s Returning new Request, added to retry pool", getLoggingPrefix(newOperation)));
                    } else {
                        _RequestQueue.add(newOperation);
                        newOperation.setState(Operation.Status.WAITING);
                        Logger.v(Area.COMM.value(), String.format(Locale.US, "%1$s Returning new Request, added to priority queue", getLoggingPrefix(newOperation)));
                    }
                    workPending = true;
                }
                returnOperation = newOperation;
            }
            if (workPending) {
                Logger.v(Area.COMM.value(), String.format(Locale.US, "%1$s kicking worker thread", getLoggingPrefix(returnOperation)));
                _RequestPipelineLock.notify();
            }
        }
        return returnOperation;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public Result waitOnOperation(Operation operation) {
        Result result;
        if (operation == null) {
            throw new IllegalArgumentException("'operation' can not be NULL");
        }
        if (operation.getState() == Operation.Status.COMPLETED || operation.getState() == Operation.Status.CANCELLED) {
            return operation.getResult();
        }
        if (operation.getState() != Operation.Status.RETRYING && operation.getState() != Operation.Status.RUNNING && operation.getState() != Operation.Status.WAITING) {
            throw new IllegalStateException(String.format(Locale.US, "waitOnOperation() for an operation in the %1$s state", operation.getState().name()));
        }
        synchronized (operation.getFuture()) {
            try {
                operation.getFuture().get();
                updateOperationStateFromResult(operation);
                result = operation.getResult();
                while (operation.getState() == Operation.Status.RETRYING) {
                    long tryAgainInSeconds = 2;
                    if (result.getHeaders() != null && result.getHeaders().containsKey("Retry-After")) {
                        try {
                            String retryAfterStr = result.getHeaders().get("Retry-After").get(0);
                            tryAgainInSeconds = Long.parseLong(retryAfterStr);
                        } catch (Exception e) {
                            Logger.e(Area.COMM.value(), "'Retry-After' header found, but failed to parse as long (as delta in seconds)", e);
                        }
                    }
                    Logger.v(Area.COMM.value(), String.format(Locale.US, "Request %1$d resulted in a %2$d, retrying in %3$d seconds", Integer.valueOf(operation.getId()), Integer.valueOf(result.getResponseCode()), Long.valueOf(tryAgainInSeconds)));
                    operation.tickRetryAfterCount();
                    operation.updateRetryAfterTimestamp(1000 * tryAgainInSeconds);
                    enqueueOperationForRetry(operation);
                    try {
                        try {
                            result = operation.getFuture().get();
                        } catch (ExecutionException e1) {
                            throw new CommunicationException(e1);
                        }
                    } catch (InterruptedException e12) {
                        throw new CommunicationException(e12);
                    }
                }
            } catch (InterruptedException e13) {
                throw new CommunicationException(e13);
            } catch (ExecutionException e14) {
                throw new CommunicationException(e14);
            }
        }
        return result;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void updateOperationStateFromResult(Operation operation) {
        if (operation == null) {
            throw new IllegalArgumentException("'operation' can not be NULL");
        }
        if (operation.getResult() != null) {
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
                        new Thread(new Runnable() { // from class: com.getjar.sdk.comm.CommManager.1
                            @Override // java.lang.Runnable
                            public void run() {
                                AuthManager.getInstance().reAuth();
                            }
                        }, "Re-Auth Thread").start();
                    }
                } catch (JSONException e) {
                    Logger.e(Area.COMM.value(), String.format(Locale.US, "%1$s updateOperationStateFromResult() re-auth retry check failed", getLoggingPrefix(operation)), e);
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
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

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Code restructure failed: missing block: B:35:0x0249, code lost:
        if (r8 == false) goto L40;
     */
    /* JADX WARN: Code restructure failed: missing block: B:37:0x024f, code lost:
        if (r22.getSuppressInternalCallbacks() != false) goto L40;
     */
    /* JADX WARN: Code restructure failed: missing block: B:38:0x0251, code lost:
        r22.getCommContext().makeNetworkFailureCallbacks();
     */
    /* JADX WARN: Code restructure failed: missing block: B:39:?, code lost:
        return r11;
     */
    /* JADX WARN: Code restructure failed: missing block: B:40:0x025a, code lost:
        if (r9 == false) goto L46;
     */
    /* JADX WARN: Code restructure failed: missing block: B:42:0x0260, code lost:
        if (r22.getSuppressInternalCallbacks() != false) goto L45;
     */
    /* JADX WARN: Code restructure failed: missing block: B:43:0x0262, code lost:
        r22.getCommContext().makeServiceFailureCallbacks(r11);
     */
    /* JADX WARN: Code restructure failed: missing block: B:44:?, code lost:
        return r11;
     */
    /* JADX WARN: Code restructure failed: missing block: B:45:?, code lost:
        return r11;
     */
    /* JADX WARN: Code restructure failed: missing block: B:46:?, code lost:
        return r11;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public com.getjar.sdk.comm.Result processesRequestWithRetries(com.getjar.sdk.comm.Operation r22) {
        /*
            Method dump skipped, instructions count: 626
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.getjar.sdk.comm.CommManager.processesRequestWithRetries(com.getjar.sdk.comm.Operation):com.getjar.sdk.comm.Result");
    }

    private Result processesRequest(Operation operation, int failureRetryCount) throws Exception {
        HttpPost httpGet;
        if (operation == null) {
            throw new IllegalArgumentException("'operation' can not be NULL");
        }
        Result result = null;
        long start = System.currentTimeMillis();
        try {
            URI uriToUse = operation.getRequest().getUriForRequest();
            if (operation.getState() == Operation.Status.CANCELLED) {
                Logger.w(Area.COMM.value(), String.format(Locale.US, "%1$s Operation was cancelled, returning last result", getLoggingPrefix(operation)));
                Result result2 = operation.getResult();
                return result2;
            } else if (operation.getState() != Operation.Status.RUNNING) {
                throw new IllegalStateException(String.format(Locale.US, "processesRequestWithRetries() for an operation in the %1$s state", operation.getState().name()));
            } else {
                Logger.i(Area.COMM.value(), String.format(Locale.US, "%1$s Starting Request %2$d", getLoggingPrefix(operation), Integer.valueOf(operation.getId())));
                int responseCode = 418;
                try {
                } catch (Throwable th) {
                    th = th;
                }
                try {
                    try {
                        Logger.d(Area.COMM.value(), String.format(Locale.US, "%1$s Making a request to: '%2$s'", getLoggingPrefix(operation), uriToUse));
                        GetJarHttpClient httpClient = GetJarHttpClient.newInstance(operation.getCommContext().getSdkUserAgent(), 30000, 30000);
                        try {
                            try {
                                if (Request.HttpMethod.POST.equals(operation.getRequest().getHttpMethod())) {
                                    HttpPost httpPost = new HttpPost(uriToUse);
                                    try {
                                        if (operation.getRequest().getPostData() == null || operation.getRequest().getPostData().size() <= 0) {
                                            httpGet = httpPost;
                                        } else {
                                            String postDataBlob = RequestUtilities.getPostDataBlob(operation.getRequest().getPostData());
                                            if (!StringUtility.isNullOrEmpty(postDataBlob)) {
                                                byte[] postDataBytes = postDataBlob.getBytes("UTF-8");
                                                httpPost.setHeader("Content-Language", "en-US");
                                                httpPost.setHeader("Content-Type", "application/x-www-form-urlencoded");
                                                boolean serviceRequestCompress = false;
                                                try {
                                                    serviceRequestCompress = Boolean.parseBoolean(GetJarConfig.getInstance(operation.getCommContext(), false).getDirectiveValue(GetJarConfig.KEY_SERVICE_REQUEST_COMPRESS));
                                                } catch (ConfigurationException e) {
                                                    Logger.w(Area.COMM.value(), "CommManager processesRequest using default value for serviceRequestCompress");
                                                }
                                                int serviceRequestUncompressedLimit = 256;
                                                try {
                                                    try {
                                                        serviceRequestUncompressedLimit = Integer.parseInt(GetJarConfig.getInstance(operation.getCommContext(), false).getDirectiveValue(GetJarConfig.KEY_SERVICE_REQUEST_UNCOMPRESSED_LIMIT));
                                                    } catch (NumberFormatException e2) {
                                                        Logger.w(Area.COMM.value(), "CommManager processesRequest using default value for serviceRequestUncompressedLimit");
                                                    }
                                                } catch (ConfigurationException e3) {
                                                    Logger.w(Area.COMM.value(), "CommManager processesRequest using default value for serviceRequestUncompressedLimit");
                                                }
                                                if (!serviceRequestCompress || postDataBytes.length <= serviceRequestUncompressedLimit) {
                                                    Logger.d(Area.COMM.value(), String.format(Locale.US, "%1$s NOT Gzipping POST data [length: %2$d]:\r\n%3$s", getLoggingPrefix(operation), Integer.valueOf(postDataBytes.length), postDataBlob));
                                                    httpPost.setEntity(new StringEntity(postDataBlob));
                                                } else {
                                                    httpPost.setHeader("Content-Encoding", "gzip");
                                                    ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
                                                    GZIPOutputStream gzipOutputStream = null;
                                                    try {
                                                        GZIPOutputStream gzipOutputStream2 = new GZIPOutputStream(byteArrayOutputStream);
                                                        try {
                                                            gzipOutputStream2.write(postDataBytes);
                                                            if (gzipOutputStream2 != null) {
                                                                try {
                                                                    gzipOutputStream2.close();
                                                                } catch (IOException e4) {
                                                                }
                                                            }
                                                            byte[] gzippedPostData = byteArrayOutputStream.toByteArray();
                                                            Logger.d(Area.COMM.value(), String.format(Locale.US, "%1$s Gzipping POST data [Original length: %2$d: Gzipped Length: %3$d]:\r\n%4$s", getLoggingPrefix(operation), Integer.valueOf(postDataBytes.length), Integer.valueOf(gzippedPostData.length), postDataBlob));
                                                            httpPost.setEntity(new ByteArrayEntity(gzippedPostData));
                                                        } catch (Throwable th2) {
                                                            th = th2;
                                                            gzipOutputStream = gzipOutputStream2;
                                                            if (gzipOutputStream != null) {
                                                                try {
                                                                    gzipOutputStream.close();
                                                                } catch (IOException e5) {
                                                                }
                                                            }
                                                            throw th;
                                                        }
                                                    } catch (Throwable th3) {
                                                        th = th3;
                                                    }
                                                }
                                            }
                                            httpGet = httpPost;
                                        }
                                    } catch (Throwable th4) {
                                        th = th4;
                                        httpClient.getConnectionManager().shutdown();
                                        throw th;
                                    }
                                } else {
                                    httpGet = new HttpGet(uriToUse);
                                }
                                httpGet.setHeader("Accept-Encoding", "gzip");
                                httpGet.setHeader("Cache-Control", "no-transform");
                                httpGet.setHeader(ServiceProxyBase.USER_AGENT_HEADER, operation.getCommContext().getSdkUserAgent());
                                AuthManager.initialize(operation.getCommContext().getApplicationContext());
                                String authToken = AuthManager.getInstance().getAuthToken();
                                if (!StringUtility.isNullOrEmpty(authToken)) {
                                    httpGet.setHeader(AuthManager.AUTHORIZATION_HEADER, authToken);
                                }
                                if (operation.getRequest().getRequestHeaders() != null) {
                                    for (String name : operation.getRequest().getRequestHeaders().keySet()) {
                                        String value = operation.getRequest().getRequestHeaders().get(name);
                                        if (!StringUtility.isNullOrEmpty(name) && !StringUtility.isNullOrEmpty(value)) {
                                            Logger.v(Area.COMM.value(), String.format(Locale.US, "%1$s Adding header [%2$s = %3$s]", getLoggingPrefix(operation), name, value));
                                            httpGet.setHeader(name, value);
                                        }
                                    }
                                }
                                if (!operation.isDoNotCache()) {
                                    String eTag = this._cachingManager.getETagFromCache(operation);
                                    if (!StringUtility.isNullOrEmpty(eTag)) {
                                        Logger.v(Area.COMM.value(), String.format(Locale.US, "%1$s Adding the 'If-None-Match' header [ETag = %2$s]", getLoggingPrefix(operation), eTag));
                                        httpGet.setHeader("If-None-Match", eTag);
                                    }
                                }
                                try {
                                    HttpHost host = new HttpHost(httpGet.getURI().getHost(), httpGet.getURI().getPort(), httpGet.getURI().getScheme());
                                    HttpRoute route = httpClient.getRoutePlanner().determineRoute(host, httpGet, (HttpContext) null);
                                    Logger.v(Area.COMM.value(), String.format(Locale.US, "%1$s ROUTE [ResolvedIP: %2$s  ProxyHost: %3$s  TargetHoust: %4$s  Secured: %5$s  Tunnelled: %6$s]", getLoggingPrefix(operation), InetAddress.getByName(httpGet.getURI().getHost()).getHostAddress(), route.getProxyHost(), route.getTargetHost(), Boolean.valueOf(route.isSecure()), Boolean.valueOf(route.isTunnelled())));
                                } catch (Exception e6) {
                                    Logger.e(Area.COMM.value(), String.format(Locale.US, "%1$s Failed to resolve and log the request route for '%2$s'", getLoggingPrefix(operation), uriToUse), e6);
                                }
                                RequestUtilities.debugDumpRequestProperties(httpGet);
                                HttpResponse httpResponse = httpClient.execute(httpGet);
                                if (httpResponse == null) {
                                    throw new IllegalStateException(String.format(Locale.US, "Failed to get a response from a service call [URL:%1$s]", uriToUse));
                                }
                                if (httpResponse.getStatusLine() != null) {
                                    responseCode = httpResponse.getStatusLine().getStatusCode();
                                }
                                Logger.d(Area.COMM.value(), String.format(Locale.US, "%1$s Result code: %2$d", getLoggingPrefix(operation), Integer.valueOf(responseCode)));
                                String resultText = null;
                                HttpEntity entity = httpResponse.getEntity();
                                if (entity != null) {
                                    InputStream instream = entity.getContent();
                                    Header contentEncoding = httpResponse.getFirstHeader("Content-Encoding");
                                    if (contentEncoding == null || StringUtility.isNullOrEmpty(contentEncoding.getValue()) || !contentEncoding.getValue().equalsIgnoreCase("gzip")) {
                                        Logger.i(Area.COMM.value(), "CommManager processesRequest received data not gzipped ");
                                    } else {
                                        Logger.i(Area.COMM.value(), "CommManager processesRequest gzipped data received");
                                        instream = new GZIPInputStream(instream);
                                    }
                                    try {
                                        StringBuilder buffer = new StringBuilder("");
                                        BufferedReader reader = new BufferedReader(new InputStreamReader(instream));
                                        for (String line = reader.readLine(); line != null; line = reader.readLine()) {
                                            buffer.append(line);
                                        }
                                        resultText = buffer.toString();
                                        instream.close();
                                    } catch (RuntimeException ex) {
                                        httpGet.abort();
                                        throw ex;
                                    }
                                }
                                Map<String, List<String>> headerMap = new HashMap<>();
                                Header[] arr$ = httpResponse.getAllHeaders();
                                for (Header curHeader : arr$) {
                                    if (!headerMap.containsKey(curHeader.getName())) {
                                        headerMap.put(curHeader.getName(), new ArrayList<>(1));
                                    }
                                    headerMap.get(curHeader.getName()).add(curHeader.getValue());
                                }
                                Result result3 = new Result(resultText, headerMap, responseCode, Integer.toString(operation.getId()), operation.getSuppressInternalCallbacks());
                                try {
                                    operation.setResult(result3);
                                    if (result3.isSuccessfulResponse() && result3.getResponseJson() == null) {
                                        Logger.w(Area.COMM.value(), String.format(Locale.US, "%1$s Received a bad response from a service call [URL:%2$s] [RESPONSE_CODE: %3$d] [RESPONSE:%4$s]", getLoggingPrefix(operation), uriToUse, Integer.valueOf(responseCode), resultText));
                                    }
                                    httpClient.getConnectionManager().shutdown();
                                    if (!operation.isDoNotCache()) {
                                        this._cachingManager.addResultToCache(operation);
                                    }
                                    Logger.i(Area.COMM.value(), String.format(Locale.US, "%1$s Finished Request", getLoggingPrefix(operation)));
                                    int timeDelta = (int) (System.currentTimeMillis() - start);
                                    if (result3 != null) {
                                        result3.setResponseTime(timeDelta);
                                    }
                                    Locale locale = Locale.US;
                                    Object[] objArr = new Object[3];
                                    objArr[0] = getLoggingPrefix(operation);
                                    objArr[1] = Integer.valueOf(timeDelta);
                                    objArr[2] = uriToUse != null ? uriToUse : "";
                                    String timingLogMessage = String.format(locale, "%1$s REQUEST TIMING: %2$d [TO: %3$s]", objArr);
                                    if (timeDelta > 1000) {
                                        Logger.w(Area.COMM.value(), timingLogMessage);
                                    } else {
                                        Logger.d(Area.COMM.value(), timingLogMessage);
                                    }
                                    return result3;
                                } catch (Throwable th5) {
                                    th = th5;
                                    httpClient.getConnectionManager().shutdown();
                                    throw th;
                                }
                            } catch (UnsupportedEncodingException e7) {
                                e = e7;
                                throw new CommunicationException(e);
                            }
                        } catch (Throwable th6) {
                            th = th6;
                            httpClient.getConnectionManager().shutdown();
                            throw th;
                        }
                    } catch (URISyntaxException e8) {
                        e = e8;
                        throw new CommunicationException(e);
                    }
                } catch (UnsupportedEncodingException e9) {
                    e = e9;
                } catch (Throwable th7) {
                    th = th7;
                    Logger.i(Area.COMM.value(), String.format(Locale.US, "%1$s Finished Request", getLoggingPrefix(operation)));
                    int timeDelta2 = (int) (System.currentTimeMillis() - start);
                    if (0 != 0) {
                        result.setResponseTime(timeDelta2);
                    }
                    Locale locale2 = Locale.US;
                    Object[] objArr2 = new Object[3];
                    objArr2[0] = getLoggingPrefix(operation);
                    objArr2[1] = Integer.valueOf(timeDelta2);
                    objArr2[2] = uriToUse != null ? uriToUse : "";
                    String timingLogMessage2 = String.format(locale2, "%1$s REQUEST TIMING: %2$d [TO: %3$s]", objArr2);
                    if (timeDelta2 > 1000) {
                        Logger.w(Area.COMM.value(), timingLogMessage2);
                    } else {
                        Logger.d(Area.COMM.value(), timingLogMessage2);
                    }
                    throw th;
                }
            }
        } catch (URISyntaxException e10) {
            e = e10;
        }
    }

    private void startWorker() {
        Logger.i(Area.COMM.value(), String.format(Locale.US, "%1$s startWorker()", getLoggingPrefix()));
        synchronized (_WorkerThreadLock) {
            _WorkerThreadStopping = false;
            if (_WorkerThread == null) {
                _WorkerThread = new Thread(new RequestPipelineManagementRunnable(), "CommManager Worker Thread");
            }
            if (!_WorkerThread.isAlive()) {
                _WorkerThread.start();
                Logger.i(Area.COMM.value(), String.format(Locale.US, "%1$s Thread started", getLoggingPrefix()));
            } else {
                Logger.v(Area.COMM.value(), String.format(Locale.US, "%1$s Thread already running", getLoggingPrefix()));
            }
        }
    }

    private void stopWorker() {
        Logger.i(Area.COMM.value(), String.format(Locale.US, "%1$s stopWorker()", getLoggingPrefix()));
        synchronized (_WorkerThreadLock) {
            if (_WorkerThread == null) {
                Logger.v(Area.COMM.value(), String.format(Locale.US, "%1$s Thread already stopped", getLoggingPrefix()));
                return;
            }
            _WorkerThreadStopping = true;
            Logger.v(Area.COMM.value(), String.format(Locale.US, "%1$s kicking worker thread", getLoggingPrefix()));
            synchronized (_RequestPipelineLock) {
                _RequestPipelineLock.notify();
            }
            try {
                try {
                    _WorkerThread.join(2000L);
                    _WorkerThread.interrupt();
                    _WorkerThread.join();
                    _WorkerThread = null;
                    Logger.i(Area.COMM.value(), String.format(Locale.US, "%1$s Thread stopped", getLoggingPrefix()));
                } catch (Exception e) {
                    Logger.e(Area.COMM.value(), String.format(Locale.US, String.format(Locale.US, "%1$s failed", getLoggingPrefix()), new Object[0]), e);
                    _WorkerThread = null;
                    Logger.i(Area.COMM.value(), String.format(Locale.US, "%1$s Thread stopped", getLoggingPrefix()));
                }
            } catch (InterruptedException e2) {
                Logger.e(Area.COMM.value(), String.format(Locale.US, String.format(Locale.US, "%1$s Thread '%2$s' received an interrupt", getLoggingPrefix(), Thread.currentThread().getName()), new Object[0]), e2);
                _WorkerThread = null;
                Logger.i(Area.COMM.value(), String.format(Locale.US, "%1$s Thread stopped", getLoggingPrefix()));
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public long getSleepTime() {
        long sleepTime = Long.MAX_VALUE;
        long now = System.currentTimeMillis();
        Iterator i$ = _RetryRequests.iterator();
        while (i$.hasNext()) {
            Operation retryOperation = i$.next();
            long delta = retryOperation.getRetryAfterTimestamp() - now;
            if (delta < sleepTime) {
                sleepTime = delta;
            }
        }
        if (sleepTime < 10) {
            sleepTime = 10;
        }
        if (sleepTime == Long.MAX_VALUE) {
            Logger.v(Area.COMM.value(), String.format(Locale.US, "%1$s returning a sleep time of MAX_VALUE", getLoggingPrefix()));
        } else {
            Logger.v(Area.COMM.value(), String.format(Locale.US, "%1$s returning a sleep time of %2$d milliseconds", getLoggingPrefix(), Long.valueOf(sleepTime)));
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
        CommContext newContext = new CommContext(applicationKey, androidContext, new ResultReceiver(null));
        _IdentifierToCommContextMap.put(newContext.getCommContextId(), newContext);
        Logger.d(Area.COMM.value(), String.format(Locale.US, "%1$s Created a NEW CommContext for Auth from %2$s.%3$s() [PID:%4$d] [AppKey:%5$s] [CommContext.Id:%6$s]", getLoggingPrefix(), Thread.currentThread().getStackTrace()[3].getClassName(), Thread.currentThread().getStackTrace()[3].getMethodName(), Integer.valueOf(Process.myPid()), applicationKey, newContext.getCommContextId()));
        return newContext;
    }

    public static CommContext createContext(String applicationToken, Context androidContext, ResultReceiver resultReceiver, LaunchWork launchWork) {
        if (StringUtility.isNullOrEmpty(applicationToken)) {
            throw new IllegalArgumentException("'applicationKey' cannot be NULL or empty");
        }
        if (androidContext == null) {
            throw new IllegalArgumentException("'androidContext' cannot be NULL");
        }
        CommContext newContext = createContextInternal(applicationToken, null, androidContext, resultReceiver, null, launchWork);
        return newContext;
    }

    public static CommContext createContext(String applicationToken, String encryptionKey, Context androidContext, ResultReceiver resultReceiver, LaunchWork launchWork) {
        if (StringUtility.isNullOrEmpty(applicationToken)) {
            throw new IllegalArgumentException("'applicationKey' cannot be NULL or empty");
        }
        if (StringUtility.isNullOrEmpty(encryptionKey)) {
            throw new IllegalArgumentException("'appEncryptionPublicKey' cannot be null");
        }
        if (androidContext == null) {
            throw new IllegalArgumentException("'androidContext' cannot be NULL");
        }
        CommContext newContext = createContextInternal(applicationToken, encryptionKey, androidContext, resultReceiver, null, launchWork);
        return newContext;
    }

    public static CommContext createContext(String applicationToken, Context androidContext, Intent getjarIntent, LaunchWork launchWork) {
        if (StringUtility.isNullOrEmpty(applicationToken)) {
            throw new IllegalArgumentException("'applicationKey' cannot be NULL or empty");
        }
        if (androidContext == null) {
            throw new IllegalArgumentException("'androidContext' cannot be NULL");
        }
        if (getjarIntent == null) {
            throw new IllegalArgumentException("'getjarIntent' cannot be NULL");
        }
        if (!getjarIntent.getBooleanExtra(GetJarManager.GetjarIntentKey, false)) {
            throw new IllegalArgumentException("'getjarIntent' does not apear to be a Getjar Intent (must contain GetJarManager.GetjarIntentKey with a value of TRUE)");
        }
        String providerFilter = getjarIntent.getStringExtra(AuthProviderFilterNameKey);
        if (StringUtility.isNullOrEmpty(providerFilter)) {
            throw new IllegalArgumentException(String.format(Locale.US, "'getjarIntent' does not contain a valid provider filter [%1$s]", providerFilter));
        }
        String providerFilterData = getjarIntent.getStringExtra(AuthProviderFilterDataKey);
        if (StringUtility.isNullOrEmpty(providerFilterData)) {
            throw new IllegalArgumentException("'getjarIntent' does not contain provider filter data");
        }
        HashMap<String, String> providerFilterDataMap = ProviderHint.parseData(providerFilterData);
        if (providerFilterDataMap == null || providerFilterDataMap.size() <= 0) {
            throw new IllegalArgumentException(String.format(Locale.US, "'getjarIntent' does not contain provider filter data that can be parsed [%1$s]", providerFilterData));
        }
        ProviderHint providerHint = new ProviderHint(providerFilter, providerFilterDataMap);
        CommContext newContext = createContextInternal(applicationToken, null, androidContext, null, providerHint, launchWork);
        return newContext;
    }

    private static CommContext createContextInternal(String applicationToken, String encryptionKey, Context androidContext, ResultReceiver resultReceiver, ProviderHint providerHint, LaunchWork launchWork) {
        CommContext newContext;
        boolean authStartedSuccessfully;
        UUID.fromString(applicationToken);
        ApplicationKeyDatabase.getInstance(androidContext).setApplicationKey(applicationToken);
        Logger.v(Area.COMM.value(), String.format(Locale.US, "%1$s Calling configureAppenders()", getLoggingPrefix()));
        try {
            Logger.getInstance().configureAppenders(androidContext);
        } catch (Exception e) {
            Logger.e(Area.COMM.value() | Area.CONFIG.value(), "configureAppenders() failed", e);
        }
        Logger.v(Area.COMM.value(), String.format(Locale.US, "%1$s Creating CommContext instance", getLoggingPrefix()));
        if (StringUtility.isNullOrEmpty(encryptionKey)) {
            newContext = new CommContext(applicationToken, androidContext, resultReceiver);
        } else {
            newContext = new CommContext(applicationToken, encryptionKey, androidContext, resultReceiver);
        }
        _IdentifierToCommContextMap.put(newContext.getCommContextId(), newContext);
        Logger.i(Area.COMM.value(), String.format(Locale.US, "%1$s Created a NEW CommContext from %2$s.%3$s() [PID:%4$d] [AppToken:%5$s] [CommContext.Id:%6$s]", getLoggingPrefix(), Thread.currentThread().getStackTrace()[3].getClassName(), Thread.currentThread().getStackTrace()[3].getMethodName(), Integer.valueOf(Process.myPid()), applicationToken, newContext.getCommContextId()));
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
            throw new AuthException(e3);
        }
    }

    public static CommContext retrieveContext(String contextId) {
        return _IdentifierToCommContextMap.get(contextId);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public static class DoLaunchWork implements Runnable {
        private final Context _androidContext;
        private final String _applicationToken;
        private final String _encryptionKey;
        private final LaunchWork _launchWork;

        public DoLaunchWork(String applicationToken, String encryptionKey, Context androidContext, LaunchWork launchWork) {
            if (StringUtility.isNullOrEmpty(applicationToken)) {
                throw new IllegalArgumentException("'applicationToken' cannot be NULL or empty");
            }
            if (androidContext == null) {
                throw new IllegalArgumentException("'androidContext' cannot be NULL");
            }
            if (launchWork == null) {
                throw new IllegalArgumentException("'launchWork' cannot be NULL");
            }
            if (LaunchWork.NONE.equals(launchWork)) {
                throw new IllegalArgumentException("'launchWork' cannot be NONE");
            }
            this._applicationToken = applicationToken;
            this._encryptionKey = encryptionKey;
            this._androidContext = androidContext;
            this._launchWork = launchWork;
        }

        @Override // java.lang.Runnable
        public void run() {
            CommContext launchWorkContext;
            try {
                if (LaunchWork.NONE.equals(this._launchWork)) {
                    Logger.e(Area.OFFER.value(), "DoLaunchWork thread started with a LaunchWork value of NONE");
                    return;
                }
                if (StringUtility.isNullOrEmpty(this._encryptionKey)) {
                    launchWorkContext = new CommContext(this._applicationToken, this._androidContext, null);
                } else {
                    launchWorkContext = new CommContext(this._applicationToken, this._encryptionKey, this._androidContext, null);
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
                            LicenseEngine licenseEngine = new LicenseEngine(launchWorkContext);
                            licenseEngine.retrieveServerProductLicenses(false);
                            Logger.i(Area.LICENSING.value(), String.format(Locale.US, "%1$s Updating License cache success", CommManager.getLoggingPrefix()));
                        } catch (Exception e) {
                            Logger.e(Area.LICENSING.value(), String.format(Locale.US, "%1$s Updating License cache failed", CommManager.getLoggingPrefix()), e);
                        }
                        doTransactionRelatedLaunchWork(launchWorkContext);
                    }
                    if (AuthManager.getInstance().getClaimsManager(launchWorkContext.getApplicationContext()).canBuy()) {
                        try {
                            InAppPurchaseManager.getInstance(launchWorkContext.getApplicationContext()).getGoldOffers();
                        } catch (Exception e2) {
                            Logger.e(Area.TRANSACTION.value(), String.format(Locale.US, "%1$s getGoldOffers() failed", CommManager.getLoggingPrefix()), e2);
                        }
                    }
                } else {
                    throw new IllegalStateException(String.format(Locale.US, "Unsupported LaunchWork value [%1$s]", this._launchWork.name()));
                }
            } catch (Exception e3) {
                Logger.e(Area.COMM.value(), String.format(Locale.US, "%1$s DoLaunchWork.run() failed", CommManager.getLoggingPrefix()), e3);
            }
        }

        private void doTransactionRelatedLaunchWork(CommContext launchWorkContext) {
            try {
                TransactionManager transactionManager = new TransactionManager(launchWorkContext.getApplicationContext());
                transactionManager.recoverOrphanedTransactions(launchWorkContext);
            } catch (Exception e) {
                Logger.e(Area.TRANSACTION.value(), String.format(Locale.US, "%1$s Recovering orphaned transactions failed", CommManager.getLoggingPrefix()), e);
            }
            if (AuthManager.getInstance().getClaimsManager(launchWorkContext.getApplicationContext()).canPurchaseManagedProducts()) {
                try {
                    InAppPurchaseManager.getInstance(launchWorkContext.getApplicationContext()).cancelOrphanedManagedOffers();
                    Logger.i(Area.OFFER.value() | Area.TRANSACTION.value(), String.format(Locale.US, "%1$s cancelOrphanedManagedOffers() success", CommManager.getLoggingPrefix()));
                } catch (Exception e2) {
                    Logger.e(Area.OFFER.value() | Area.TRANSACTION.value(), String.format(Locale.US, "%1$s cancelOrphanedManagedOffers() failed", CommManager.getLoggingPrefix()), e2);
                }
                try {
                    InAppPurchaseManager.getInstance(launchWorkContext.getApplicationContext()).processOutstandingPurchases(false);
                    Logger.i(Area.OFFER.value() | Area.TRANSACTION.value(), String.format(Locale.US, "%1$s processOutstandingPurchases() success", CommManager.getLoggingPrefix()));
                } catch (Exception e3) {
                    Logger.e(Area.OFFER.value() | Area.TRANSACTION.value(), String.format(Locale.US, "%1$s processOutstandingPurchases() failed", CommManager.getLoggingPrefix()), e3);
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final String getLoggingPrefix() {
        String methodName = "";
        StackTraceElement[] stackTrace = Thread.currentThread().getStackTrace();
        if (stackTrace != null && stackTrace.length >= 3) {
            methodName = stackTrace[3].getMethodName();
        }
        return String.format(Locale.US, "CommManager: %1$s() [thread:%2$d]", methodName, Long.valueOf(Thread.currentThread().getId()));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final String getLoggingPrefix(Operation operation) {
        String methodName = "";
        StackTraceElement[] stackTrace = Thread.currentThread().getStackTrace();
        if (stackTrace != null && stackTrace.length >= 3) {
            methodName = stackTrace[3].getMethodName();
        }
        String requestId = "";
        if (operation != null) {
            requestId = String.format(Locale.US, " [request:%1$d]", Integer.valueOf(operation.getId()));
        }
        return String.format(Locale.US, "CommManager: %1$s() [thread:%2$d]%3$s", methodName, Long.valueOf(Thread.currentThread().getId()), requestId);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public class RequestCallable implements Callable<Result> {
        private Operation _operation;

        private RequestCallable(Operation operation) {
            this._operation = null;
            if (operation == null) {
                throw new IllegalArgumentException("'operation' can not be NULL");
            }
            this._operation = operation;
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // java.util.concurrent.Callable
        /* renamed from: call */
        public Result mo37call() throws Exception {
            Result requestResult = CommManager.this.processesRequestWithRetries(this._operation);
            if (requestResult == null) {
                Logger.e(Area.COMM.value(), String.format(Locale.US, "%1$s Received a NULL result", CommManager.getLoggingPrefix(this._operation)));
            } else {
                Logger.d(Area.COMM.value(), String.format(Locale.US, "%1$s Received response code: %2$d", CommManager.getLoggingPrefix(this._operation), Integer.valueOf(requestResult.getResponseCode())));
                if (requestResult.getResponseJson() != null) {
                    Logger.d(Area.COMM.value(), String.format(Locale.US, "%1$s Received response body:\r\n%2$s", CommManager.getLoggingPrefix(this._operation), requestResult.getResponseJson().toString(4)));
                } else if (!StringUtility.isNullOrEmpty(requestResult.getResponseBody())) {
                    Logger.d(Area.COMM.value(), String.format(Locale.US, "%1$s Received response body:\r\n%2$s", CommManager.getLoggingPrefix(this._operation), requestResult.getResponseBody()));
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
                    Logger.d(Area.COMM.value(), logMsg.toString());
                }
            }
            cleanup();
            return requestResult;
        }

        private void cleanup() {
            synchronized (CommManager._RequestPipelineLock) {
                Logger.d(Area.COMM.value(), String.format(Locale.US, "%1$s RequestFutureTask has completed work, doing cleanup work [state:%2$s]", CommManager.getLoggingPrefix(this._operation), this._operation.getState()));
                try {
                    CommManager.this.updateOperationStateFromResult(this._operation);
                } catch (Exception e) {
                    Logger.e(Area.COMM.value(), String.format(Locale.US, "%1$s updateOperationStateFromResult() failed", CommManager.getLoggingPrefix(this._operation)), e);
                }
                if (CommManager._ActiveRequests.remove(this._operation)) {
                    Logger.i(Area.COMM.value(), String.format(Locale.US, "%1$s Completed Request has been removed from _ActiveRequests", CommManager.getLoggingPrefix(this._operation)));
                } else {
                    Logger.i(Area.COMM.value(), String.format(Locale.US, "%1$s Completed Request was not found in _ActiveRequests", CommManager.getLoggingPrefix(this._operation)));
                }
                if (!Operation.Status.RETRYING.equals(this._operation.getState())) {
                    if (CommManager._RequestQueue.remove(this._operation)) {
                        Logger.e(Area.COMM.value(), String.format(Locale.US, "%1$s Found completed Request in _RequestQueue", CommManager.getLoggingPrefix(this._operation)));
                    }
                    if (CommManager._RetryRequests.remove(this._operation)) {
                        Logger.e(Area.COMM.value(), String.format(Locale.US, "%1$s Found completed Request in _RetryRequests", CommManager.getLoggingPrefix(this._operation)));
                    }
                }
                Logger.v(Area.COMM.value(), String.format(Locale.US, "%1$s kicking worker thread", CommManager.getLoggingPrefix(this._operation)));
                CommManager._RequestPipelineLock.notify();
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public class RequestPipelineManagementRunnable implements Runnable {
        private RequestPipelineManagementRunnable() {
        }

        @Override // java.lang.Runnable
        public void run() {
            AuthManager.initialize(CommManager.this._context);
            while (!CommManager._WorkerThreadStopping) {
                try {
                } catch (Exception e) {
                    Logger.e(Area.COMM.value(), String.format(Locale.US, "%1$s failure", CommManager.getLoggingPrefix()), e);
                    try {
                        Thread.sleep(5000L);
                    } catch (Exception e2) {
                    }
                }
                if (CommManager._WorkerThreadStopping) {
                    break;
                }
                synchronized (CommManager._RequestPipelineLock) {
                    Logger.v(Area.COMM.value(), String.format(Locale.US, "%1$s queued:%2$d active:%3$d retry:%4$d", CommManager.getLoggingPrefix(), Integer.valueOf(CommManager._RequestQueue.size()), Integer.valueOf(CommManager._ActiveRequests.size()), Integer.valueOf(CommManager._RetryRequests.size())));
                    long now = System.currentTimeMillis();
                    List<Operation> requestsToMove = new ArrayList<>();
                    Iterator i$ = CommManager._RetryRequests.iterator();
                    while (i$.hasNext()) {
                        Operation retryOperation = (Operation) i$.next();
                        if (retryOperation.getRetryAfterTimestamp() <= now) {
                            if (AuthManager.getInstance().isAuthed() || retryOperation.isAuthRelated()) {
                                requestsToMove.add(retryOperation);
                            } else {
                                retryOperation.updateRetryAfterTimestamp(2000L);
                            }
                        }
                    }
                    for (Operation retryOperation2 : requestsToMove) {
                        CommManager._RetryRequests.remove(retryOperation2);
                        CommManager._RequestQueue.add(retryOperation2);
                        retryOperation2.setState(Operation.Status.WAITING);
                        Logger.v(Area.COMM.value(), String.format(Locale.US, "%1$s moved request from retry to queue", CommManager.getLoggingPrefix(retryOperation2)));
                    }
                    while (CommManager._ActiveRequests.size() < 2 && CommManager._RequestQueue.size() > 0) {
                        Iterator i$2 = CommManager._RequestQueue.iterator();
                        while (i$2.hasNext()) {
                            Operation operation = (Operation) i$2.next();
                            operation.promotePriority();
                        }
                        Collections.sort(CommManager._RequestQueue, OperationPriorityComparator.getInstance());
                        Operation requestToStart = (Operation) CommManager._RequestQueue.remove();
                        CommManager._ActiveRequests.add(requestToStart);
                        requestToStart.setState(Operation.Status.RUNNING);
                        CommManager._ExecutorService.execute(requestToStart.getFuture());
                    }
                    CommManager.this._cachingManager.trimLruEntries();
                    long sleepTime = CommManager.this.getSleepTime();
                    Logger.v(Area.COMM.value(), String.format(Locale.US, "%1$s Worker Thread is waiting to be notified", CommManager.getLoggingPrefix()));
                    CommManager._RequestPipelineLock.wait(sleepTime);
                    Logger.v(Area.COMM.value(), String.format(Locale.US, "%1$s Worker Thread is awake", CommManager.getLoggingPrefix()));
                }
                if (CommManager._WorkerThreadStopping) {
                    break;
                }
            }
            Logger.i(Area.COMM.value(), String.format(Locale.US, "%1$s Worker Thread exited", CommManager.getLoggingPrefix()));
        }
    }

    public static void validateManifestFile(Context context, boolean enforceRequired) {
        if (context == null) {
            throw new IllegalArgumentException("'context' cannot be null");
        }
        Logger.i(Area.COMM.value(), "CommManager checkManifestFile started");
        PackageManager packageManager = context.getPackageManager();
        if (!RewardUtility.checkPermission(context, "android.permission.INTERNET")) {
            Logger.e(Area.COMM.value(), "Your application MUST have the 'android.permission.INTERNET' permission to use the GetJar Rewards SDK");
            throw new GetJarException("Your application MUST have the 'android.permission.INTERNET' permission to use the GetJar Rewards SDK");
        }
        if (!RewardUtility.checkPermission(context, "android.permission.GET_ACCOUNTS")) {
            if (enforceRequired) {
                Logger.e(Area.COMM.value(), "Your application MUST have the 'android.permission.GET_ACCOUNTS' permission to use the GetJar Rewards SDK");
                throw new GetJarException("Your application MUST have the 'android.permission.GET_ACCOUNTS' permission to use the GetJar Rewards SDK");
            }
            Logger.w(Area.COMM.value(), "[OPTIONAL] The 'android.permission.GET_ACCOUNTS' permission not found in AndroidManifest.xml");
        }
        if (!RewardUtility.checkPermission(context, "android.permission.GET_TASKS")) {
            if (enforceRequired) {
                Logger.e(Area.COMM.value(), "Your application MUST have the 'android.permission.GET_TASKS' permission to use the GetJar Rewards SDK");
                throw new GetJarException("Your application MUST have the 'android.permission.GET_TASKS' permission to use the GetJar Rewards SDK");
            }
            Logger.w(Area.COMM.value(), "[OPTIONAL] The 'android.permission.GET_TASKS' permission not found in AndroidManifest.xml");
        }
        if (packageManager.queryBroadcastReceivers(new Intent(context, PackageMonitor.class), 65536).isEmpty()) {
            Logger.e(Area.COMM.value(), "Could not find the com.getjar.sdk.data.metadata.PackageMonitor defined inside AndroidManifest.xml");
            throw new GetJarException("Could not find the com.getjar.sdk.data.metadata.PackageMonitor defined inside AndroidManifest.xml");
        } else if (packageManager.queryIntentActivities(new Intent(context, GetJarActivity.class), 65536).isEmpty()) {
            Logger.e(Area.COMM.value(), "Could not find the com.getjar.sdk.rewards.GetJarActivity defined inside AndroidManifest.xml");
            throw new GetJarException("Could not find the com.getjar.sdk.rewards.GetJarActivity defined inside AndroidManifest.xml");
        } else {
            if (packageManager.queryIntentServices(new Intent(context, GetJarService.class), 65536).isEmpty()) {
                if (enforceRequired) {
                    Logger.e(Area.COMM.value(), "Could not find the com.getjar.sdk.rewards.GetJarService defined inside AndroidManifest.xml");
                    throw new GetJarException("Could not find the com.getjar.sdk.rewards.GetJarService defined inside AndroidManifest.xml");
                }
                Logger.w(Area.COMM.value(), "[OPTIONAL] Could not find the com.getjar.sdk.rewards.GetJarService defined inside AndroidManifest.xml");
            }
            if (!RewardUtility.checkPermission(context, "com.android.vending.BILLING")) {
                Logger.w(Area.COMM.value(), "[OPTIONAL] Your application MUST have the 'com.android.vending.BILLING' permission in order to use the Buy Gold feature in GetJar Rewards SDK");
            }
            if (!RewardUtility.checkPermission(context, Utility.READ_PHONE_STATE_PERMISSION)) {
                Logger.w(Area.COMM.value(), "[OPTIONAL] The READ_PHONE_STATE permission not found in AndroidManifest.xml. It helps Getjar SDK detect unique devices that the app is running on.");
            }
            if (!RewardUtility.checkPermission(context, "android.permission.ACCESS_NETWORK_STATE")) {
                Logger.w(Area.COMM.value(), "[OPTIONAL] The ACCESS_NETWORK_STATE permission not found in AndroidManifest.xml. It helps the Getjar SDK run efficiently by detecting whether the device is connected to the internet.");
            }
            if (packageManager.queryBroadcastReceivers(new Intent(context, GetJarReceiver.class), 65536).isEmpty()) {
                Logger.w(Area.COMM.value(), "[OPTIONAL] Could not find the com.getjar.sdk.rewards.GetJarReceiver defined inside AndroidManifest.xml. It is required if there is no other implementation of Google Play billing.");
            }
        }
    }
}
