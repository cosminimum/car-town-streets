package com.getjar.sdk.comm;

import android.accounts.AccountManager;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Process;
import com.getjar.sdk.comm.auth.ApplicationKeyDatabase;
import com.getjar.sdk.comm.auth.AuthManager;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import com.getjar.sdk.utilities.StringUtility;
import com.getjar.sdk.utilities.Utility;
import com.google.analytics.tracking.android.HitTypes;
import com.google.android.gms.auth.GoogleAuthUtil;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpGet;

public class RequestLogger {
    private static volatile Integer _AccountsCount = null;
    private static volatile Object _AccountsCountLock = new Object();
    private static int _ConnectionTimeout = 60000;
    private static final ThreadPoolExecutor _ExecutorService = new ThreadPoolExecutor(1, 1, 0, TimeUnit.MILLISECONDS, new LinkedBlockingQueue());
    private static final int _MaxQueueSize = 100;
    private static String _PrefesFileName = "RequestLoggerPrefs";
    private static String _PrefsKeyInstallationId = "installationId";
    private static volatile Object _PrefsLock = new Object();
    private static int _SocketTimeout = 60000;
    private String _authFlowId;
    private final String _commContextId;
    /* access modifiers changed from: private */
    public final Context _context;
    private String _installationId;
    private final String _loggingEndPoint;
    private final long _requestId;
    private String _sdkUserAgent;
    private final String _serviceEndPoint;
    /* access modifiers changed from: private */
    public Long _timestampBefore;
    private final String _uniqueRequestId;

    public RequestLogger(CommContext commContext, String serviceEndPoint, long requestId, String authFlowId) {
        this(commContext, serviceEndPoint, requestId);
        this._authFlowId = authFlowId;
    }

    public RequestLogger(CommContext commContext, String serviceEndPoint, long requestId) {
        this(commContext.getApplicationContext(), GetJarConfig.getInstance(commContext, true).getDirectiveValue(GetJarConfig.KEY_LOGGING_ENDPOINT), commContext.getCommContextId(), serviceEndPoint, requestId);
    }

    public RequestLogger(Context context, String loggingUrl, String message, long messageId) {
        this(context, loggingUrl, (String) null, message, messageId);
    }

    private RequestLogger(Context context, String loggingUrl, String commContextId, String message, long messageId) {
        this._authFlowId = null;
        this._timestampBefore = null;
        this._installationId = null;
        this._sdkUserAgent = null;
        this._context = context;
        this._serviceEndPoint = message;
        this._requestId = messageId;
        this._uniqueRequestId = UUID.randomUUID().toString();
        this._commContextId = commContextId;
        resolveAccountsCount();
        resolveInstallationID();
        this._loggingEndPoint = loggingUrl;
    }

    private void resolveAccountsCount() {
        if (_AccountsCount == null) {
            synchronized (_AccountsCountLock) {
                if (_AccountsCount == null) {
                    _AccountsCount = Integer.valueOf(getAndroidAccountsCount());
                }
            }
        }
    }

    private void resolveInstallationID() {
        try {
            SharedPreferences prefs = this._context.getSharedPreferences(_PrefesFileName, 0);
            if (!prefs.contains(_PrefsKeyInstallationId)) {
                synchronized (_PrefsLock) {
                    if (!prefs.contains(_PrefsKeyInstallationId)) {
                        this._installationId = UUID.randomUUID().toString();
                        SharedPreferences.Editor edit = prefs.edit();
                        edit.putString(_PrefsKeyInstallationId, this._installationId).commit();
                        edit.commit();
                    }
                }
            }
            if (StringUtility.isNullOrEmpty(this._installationId)) {
                this._installationId = prefs.getString(_PrefsKeyInstallationId, "failedToGetInstallationId");
            }
        } catch (Exception e) {
            Logger.m643e(Area.COMM.value(), "RequestLogger failed", e);
            if (StringUtility.isNullOrEmpty(this._installationId)) {
                this._installationId = "failedToGetInstallationId";
            }
        }
        Logger.m640d(Area.COMM.value(), String.format(Locale.US, "RequestLogger:_installation ID = '%1$s'", new Object[]{this._installationId}));
    }

    public void logRewardsWallShow() {
        if (_ExecutorService.getActiveCount() > 100) {
            Logger.m648w(Area.COMM.value(), String.format(Locale.US, "RequestLogger: queue of length %1$d exteeds max of %2$d", new Object[]{Integer.valueOf(_ExecutorService.getActiveCount()), 100}));
            return;
        }
        final long timestamp = System.currentTimeMillis();
        final long tid = Thread.currentThread().getId();
        _ExecutorService.execute(new Runnable() {
            public void run() {
                try {
                    HashMap<String, String> args = new HashMap<>();
                    args.put("op", "pre");
                    args.put("timestamp", Long.toString(timestamp));
                    args.put("tid", Long.toString(tid));
                    RequestLogger.this.addCommonArgs(args);
                    AuthManager.initialize(RequestLogger.this._context);
                    String authToken = AuthManager.getInstance().getAuthToken();
                    if (!StringUtility.isNullOrEmpty(authToken)) {
                        args.put("authToken", authToken);
                    }
                    RequestLogger.this.pushLogMessage(args);
                } catch (Exception e) {
                    Logger.m643e(Area.COMM.value(), "RequestLogger: logRequestBefore() failed", e);
                }
            }
        });
    }

    public void logRequestBefore(Operation operation) {
        logRequestBefore(operation, (String) null, (String) null);
    }

    public void logRequestBefore() {
        logRequestBefore((Operation) null, Logger.getShortStack(), (String) null);
    }

    public void logAuthStateBefore(String authState) {
        logRequestBefore((Operation) null, (String) null, authState);
    }

    public void logAuthStateBeforeWithStack(String authState) {
        logRequestBefore((Operation) null, Logger.getShortStack(), authState);
    }

    private void logRequestBefore(Operation operation, String stackTrace, String authState) {
        if (_ExecutorService.getActiveCount() > 100) {
            Logger.m648w(Area.COMM.value(), String.format(Locale.US, "RequestLogger: queue of length %1$d exteeds max of %2$d", new Object[]{Integer.valueOf(_ExecutorService.getActiveCount()), 100}));
            return;
        }
        this._timestampBefore = Long.valueOf(System.currentTimeMillis());
        final long tid = Thread.currentThread().getId();
        final Operation operation2 = operation;
        final String str = stackTrace;
        final String str2 = authState;
        _ExecutorService.execute(new Runnable() {
            public void run() {
                try {
                    HashMap<String, String> args = new HashMap<>();
                    args.put("op", "pre");
                    args.put("timestamp", Long.toString(RequestLogger.this._timestampBefore.longValue()));
                    args.put("tid", Long.toString(tid));
                    RequestLogger.this.addCommonArgs(args);
                    Integer requestSize = null;
                    if (operation2 != null) {
                        try {
                            requestSize = Integer.valueOf(operation2.getRequest().getEstimatedRequestSizeInBytes());
                        } catch (Exception e) {
                            Logger.m648w(Area.COMM.value(), "RequestLogger: logRequestBefore() operation.getRequest().getEstimatedRequestSizeInBytes() failed");
                        }
                    }
                    if (requestSize != null) {
                        args.put("requestSize", Integer.toString(requestSize.intValue()));
                    }
                    AuthManager.initialize(RequestLogger.this._context);
                    String authToken = AuthManager.getInstance().getAuthToken();
                    if (!StringUtility.isNullOrEmpty(authToken)) {
                        args.put("authToken", authToken);
                    }
                    if (!StringUtility.isNullOrEmpty(str)) {
                        args.put("stackTrace", str);
                    }
                    if (!StringUtility.isNullOrEmpty(str2)) {
                        args.put("authState", str2);
                    }
                    RequestLogger.this.pushLogMessage(args);
                } catch (Exception e2) {
                    Logger.m643e(Area.COMM.value(), "RequestLogger: logRequestBefore() failed", e2);
                }
            }
        });
    }

    public void logRequestAfter(Operation operation, Integer responseCode, Integer executionTime, Exception exception, int reauthCount, int exceptionCount) {
        logRequestAfter(operation, responseCode, executionTime, exception, reauthCount, exceptionCount, (String) null);
    }

    public void logRequestAfter(Operation operation, Integer responseCode, Integer executionTime, Exception exception, int reauthCount, int exceptionCount, String authState) {
        if (_ExecutorService.getActiveCount() > 100) {
            Logger.m648w(Area.COMM.value(), String.format(Locale.US, "RequestLogger: queue of length %1$d exceeds max of %2$d", new Object[]{Integer.valueOf(_ExecutorService.getActiveCount()), 100}));
            return;
        }
        final long timestamp = System.currentTimeMillis();
        final long delta = timestamp - this._timestampBefore.longValue();
        final long tid = Thread.currentThread().getId();
        final int i = reauthCount;
        final int i2 = exceptionCount;
        final Operation operation2 = operation;
        final Integer num = responseCode;
        final Integer num2 = executionTime;
        final Exception exc = exception;
        final String str = authState;
        _ExecutorService.execute(new Runnable() {
            public void run() {
                try {
                    HashMap<String, String> args = new HashMap<>();
                    args.put("op", "post");
                    args.put("timestamp", Long.toString(timestamp));
                    args.put("reauthCount", Integer.toString(i));
                    args.put("exceptionCount", Integer.toString(i2));
                    args.put("tid", Long.toString(tid));
                    RequestLogger.this.addCommonArgs(args);
                    Integer responseSize = null;
                    if (operation2 != null) {
                        try {
                            responseSize = Integer.valueOf(operation2.getResult().getEstimatedResponseSizeInBytes());
                        } catch (Exception e) {
                            Logger.m648w(Area.COMM.value(), "RequestLogger: logRequestAfter() operation.getResult().getEstimatedResponseSizeInBytes() failed");
                        }
                    }
                    if (responseSize != null) {
                        args.put("responseSize", Integer.toString(responseSize.intValue()));
                    }
                    args.put("timeDelta", Long.toString(delta));
                    if (num != null) {
                        args.put("responseCode", Integer.toString(num.intValue()));
                    }
                    if (num2 != null) {
                        args.put("executionTime", Integer.toString(num2.intValue()));
                    }
                    if (exc != null) {
                        args.put(HitTypes.EXCEPTION, exc.getClass().getName());
                        args.put("stackTrace", Logger.getShortStack(exc.getStackTrace()));
                    }
                    if (!StringUtility.isNullOrEmpty(str)) {
                        args.put("authState", str);
                    }
                    RequestLogger.this.pushLogMessage(args);
                } catch (Exception e2) {
                    Logger.m643e(Area.COMM.value(), "RequestLogger: logRequestAfter() failed", e2);
                }
            }
        });
    }

    /* access modifiers changed from: private */
    public void addCommonArgs(Map<String, String> logValues) {
        logValues.put("pid", Integer.toString(Process.myPid()));
        logValues.put("uniqueRequestId", this._uniqueRequestId);
        logValues.put("installationId", this._installationId);
        logValues.put("requestId", Long.toString(this._requestId));
        logValues.put("packageName", this._context.getPackageName());
        if (!StringUtility.isNullOrEmpty(this._commContextId)) {
            logValues.put("contextId", this._commContextId);
        }
        AuthManager.initialize(this._context);
        if (!StringUtility.isNullOrEmpty(AuthManager.getInstance().getUserAccessId())) {
            logValues.put("userAccessId", AuthManager.getInstance().getUserAccessId());
        }
        if (!StringUtility.isNullOrEmpty(AuthManager.getInstance().getUserDeviceId())) {
            logValues.put("userDeviceId", AuthManager.getInstance().getUserDeviceId());
        }
        logValues.put("endPoint", this._serviceEndPoint);
        if (!StringUtility.isNullOrEmpty(this._authFlowId)) {
            logValues.put("authFlowId", this._authFlowId);
            logValues.put("accountsCount", Integer.toString(_AccountsCount.intValue()));
        }
    }

    /* access modifiers changed from: private */
    public void pushLogMessage(Map<String, String> logValues) {
        try {
            StringBuilder url = new StringBuilder(this._loggingEndPoint);
            if (!this._loggingEndPoint.endsWith(Utility.QUERY_START) && !this._loggingEndPoint.endsWith(Utility.QUERY_APPENDIX)) {
                if (this._loggingEndPoint.contains(Utility.QUERY_START)) {
                    url.append(Utility.QUERY_APPENDIX);
                } else {
                    url.append(Utility.QUERY_START);
                }
            }
            int argCount = logValues.size();
            for (String key : logValues.keySet()) {
                argCount--;
                String value = logValues.get(key);
                if (!StringUtility.isNullOrEmpty(key) && !StringUtility.isNullOrEmpty(value)) {
                    url.append(key);
                    url.append("=");
                    url.append(URLEncoder.encode(value, "UTF-8"));
                    if (argCount > 0) {
                        url.append(Utility.QUERY_APPENDIX);
                    }
                }
            }
            String uriToUse = url.toString();
            GetJarHttpClient httpClient = GetJarHttpClient.newInstance(resolveUserAgent(), _ConnectionTimeout, _SocketTimeout);
            HttpGet httpRequest = new HttpGet(uriToUse);
            RequestUtilities.debugDumpRequestProperties(httpRequest);
            HttpResponse httpResponse = httpClient.execute(httpRequest);
            if (httpResponse == null) {
                Logger.m648w(Area.COMM.value(), String.format(Locale.US, "RequestLogger: failed [URL:%1$s]", new Object[]{uriToUse}));
                return;
            }
            Logger.m646v(Area.COMM.value(), String.format(Locale.US, "RequestLogger: logged [URL:%1$s]", new Object[]{uriToUse}));
            Integer responseCode = null;
            if (httpResponse.getStatusLine() != null) {
                responseCode = Integer.valueOf(httpResponse.getStatusLine().getStatusCode());
            }
            if (responseCode != null) {
                Logger.m640d(Area.COMM.value(), String.format(Locale.US, "RequestLogger: result code: %1$d", new Object[]{responseCode}));
                return;
            }
            Logger.m648w(Area.COMM.value(), "RequestLogger: failed to get result code");
        } catch (Exception e) {
            Logger.m643e(Area.COMM.value(), "RequestLogger: failed", e);
        }
    }

    private String resolveUserAgent() {
        try {
            if (!StringUtility.isNullOrEmpty(this._sdkUserAgent)) {
                return this._sdkUserAgent;
            }
            String applicationKey = ApplicationKeyDatabase.getInstance(this._context).getApplicationKey();
            if (!StringUtility.isNullOrEmpty(applicationKey)) {
                this._sdkUserAgent = UserAgentValuesManager.getInstance().getSdkUserAgent(this._context, applicationKey);
            }
            if (!StringUtility.isNullOrEmpty(this._sdkUserAgent)) {
                return this._sdkUserAgent;
            }
            return "UNRESOLVED";
        } catch (Exception e) {
            Logger.m649w(Area.COMM.value(), "RequestLogger: resolveUserAgent() failed", e);
        }
    }

    private int getAndroidAccountsCount() {
        try {
            return AccountManager.get(this._context).getAccountsByType(GoogleAuthUtil.GOOGLE_ACCOUNT_TYPE).length;
        } catch (Exception e) {
            Logger.m643e(Area.COMM.value(), "RequestLogger: getAndroidAccounts() failed", e);
            return 0;
        }
    }
}
