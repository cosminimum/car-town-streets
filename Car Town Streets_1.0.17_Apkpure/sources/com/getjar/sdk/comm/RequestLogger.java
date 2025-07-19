package com.getjar.sdk.comm;

import android.accounts.Account;
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
/* loaded from: classes.dex */
public class RequestLogger {
    private static final int _MaxQueueSize = 100;
    private String _authFlowId;
    private final String _commContextId;
    private final Context _context;
    private String _installationId;
    private final String _loggingEndPoint;
    private final long _requestId;
    private String _sdkUserAgent;
    private final String _serviceEndPoint;
    private Long _timestampBefore;
    private final String _uniqueRequestId;
    private static final ThreadPoolExecutor _ExecutorService = new ThreadPoolExecutor(1, 1, 0, TimeUnit.MILLISECONDS, new LinkedBlockingQueue());
    private static volatile Integer _AccountsCount = null;
    private static volatile Object _AccountsCountLock = new Object();
    private static String _PrefesFileName = "RequestLoggerPrefs";
    private static String _PrefsKeyInstallationId = "installationId";
    private static volatile Object _PrefsLock = new Object();
    private static int _ConnectionTimeout = 60000;
    private static int _SocketTimeout = 60000;

    public RequestLogger(CommContext commContext, String serviceEndPoint, long requestId, String authFlowId) {
        this(commContext, serviceEndPoint, requestId);
        this._authFlowId = authFlowId;
    }

    public RequestLogger(CommContext commContext, String serviceEndPoint, long requestId) {
        this(commContext.getApplicationContext(), GetJarConfig.getInstance(commContext, true).getDirectiveValue(GetJarConfig.KEY_LOGGING_ENDPOINT), commContext.getCommContextId(), serviceEndPoint, requestId);
    }

    public RequestLogger(Context context, String loggingUrl, String message, long messageId) {
        this(context, loggingUrl, null, message, messageId);
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
            Logger.e(Area.COMM.value(), "RequestLogger failed", e);
            if (StringUtility.isNullOrEmpty(this._installationId)) {
                this._installationId = "failedToGetInstallationId";
            }
        }
        Logger.d(Area.COMM.value(), String.format(Locale.US, "RequestLogger:_installation ID = '%1$s'", this._installationId));
    }

    public void logRewardsWallShow() {
        if (_ExecutorService.getActiveCount() > 100) {
            Logger.w(Area.COMM.value(), String.format(Locale.US, "RequestLogger: queue of length %1$d exteeds max of %2$d", Integer.valueOf(_ExecutorService.getActiveCount()), 100));
            return;
        }
        final long timestamp = System.currentTimeMillis();
        final long tid = Thread.currentThread().getId();
        _ExecutorService.execute(new Runnable() { // from class: com.getjar.sdk.comm.RequestLogger.1
            @Override // java.lang.Runnable
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
                    Logger.e(Area.COMM.value(), "RequestLogger: logRequestBefore() failed", e);
                }
            }
        });
    }

    public void logRequestBefore(Operation operation) {
        logRequestBefore(operation, null, null);
    }

    public void logRequestBefore() {
        logRequestBefore(null, Logger.getShortStack(), null);
    }

    public void logAuthStateBefore(String authState) {
        logRequestBefore(null, null, authState);
    }

    public void logAuthStateBeforeWithStack(String authState) {
        logRequestBefore(null, Logger.getShortStack(), authState);
    }

    private void logRequestBefore(final Operation operation, final String stackTrace, final String authState) {
        if (_ExecutorService.getActiveCount() > 100) {
            Logger.w(Area.COMM.value(), String.format(Locale.US, "RequestLogger: queue of length %1$d exteeds max of %2$d", Integer.valueOf(_ExecutorService.getActiveCount()), 100));
            return;
        }
        this._timestampBefore = Long.valueOf(System.currentTimeMillis());
        final long tid = Thread.currentThread().getId();
        _ExecutorService.execute(new Runnable() { // from class: com.getjar.sdk.comm.RequestLogger.2
            @Override // java.lang.Runnable
            public void run() {
                try {
                    HashMap<String, String> args = new HashMap<>();
                    args.put("op", "pre");
                    args.put("timestamp", Long.toString(RequestLogger.this._timestampBefore.longValue()));
                    args.put("tid", Long.toString(tid));
                    RequestLogger.this.addCommonArgs(args);
                    Integer requestSize = null;
                    if (operation != null) {
                        try {
                            requestSize = Integer.valueOf(operation.getRequest().getEstimatedRequestSizeInBytes());
                        } catch (Exception e) {
                            Logger.w(Area.COMM.value(), "RequestLogger: logRequestBefore() operation.getRequest().getEstimatedRequestSizeInBytes() failed");
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
                    if (!StringUtility.isNullOrEmpty(stackTrace)) {
                        args.put("stackTrace", stackTrace);
                    }
                    if (!StringUtility.isNullOrEmpty(authState)) {
                        args.put("authState", authState);
                    }
                    RequestLogger.this.pushLogMessage(args);
                } catch (Exception e2) {
                    Logger.e(Area.COMM.value(), "RequestLogger: logRequestBefore() failed", e2);
                }
            }
        });
    }

    public void logRequestAfter(Operation operation, Integer responseCode, Integer executionTime, Exception exception, int reauthCount, int exceptionCount) {
        logRequestAfter(operation, responseCode, executionTime, exception, reauthCount, exceptionCount, null);
    }

    public void logRequestAfter(final Operation operation, final Integer responseCode, final Integer executionTime, final Exception exception, final int reauthCount, final int exceptionCount, final String authState) {
        if (_ExecutorService.getActiveCount() > 100) {
            Logger.w(Area.COMM.value(), String.format(Locale.US, "RequestLogger: queue of length %1$d exceeds max of %2$d", Integer.valueOf(_ExecutorService.getActiveCount()), 100));
            return;
        }
        final long timestamp = System.currentTimeMillis();
        final long delta = timestamp - this._timestampBefore.longValue();
        final long tid = Thread.currentThread().getId();
        _ExecutorService.execute(new Runnable() { // from class: com.getjar.sdk.comm.RequestLogger.3
            @Override // java.lang.Runnable
            public void run() {
                try {
                    HashMap<String, String> args = new HashMap<>();
                    args.put("op", "post");
                    args.put("timestamp", Long.toString(timestamp));
                    args.put("reauthCount", Integer.toString(reauthCount));
                    args.put("exceptionCount", Integer.toString(exceptionCount));
                    args.put("tid", Long.toString(tid));
                    RequestLogger.this.addCommonArgs(args);
                    Integer responseSize = null;
                    if (operation != null) {
                        try {
                            responseSize = Integer.valueOf(operation.getResult().getEstimatedResponseSizeInBytes());
                        } catch (Exception e) {
                            Logger.w(Area.COMM.value(), "RequestLogger: logRequestAfter() operation.getResult().getEstimatedResponseSizeInBytes() failed");
                        }
                    }
                    if (responseSize != null) {
                        args.put("responseSize", Integer.toString(responseSize.intValue()));
                    }
                    args.put("timeDelta", Long.toString(delta));
                    if (responseCode != null) {
                        args.put("responseCode", Integer.toString(responseCode.intValue()));
                    }
                    if (executionTime != null) {
                        args.put("executionTime", Integer.toString(executionTime.intValue()));
                    }
                    if (exception != null) {
                        args.put(HitTypes.EXCEPTION, exception.getClass().getName());
                        args.put("stackTrace", Logger.getShortStack(exception.getStackTrace()));
                    }
                    if (!StringUtility.isNullOrEmpty(authState)) {
                        args.put("authState", authState);
                    }
                    RequestLogger.this.pushLogMessage(args);
                } catch (Exception e2) {
                    Logger.e(Area.COMM.value(), "RequestLogger: logRequestAfter() failed", e2);
                }
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
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

    /* JADX INFO: Access modifiers changed from: private */
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
            String userAgentToUse = resolveUserAgent();
            GetJarHttpClient httpClient = GetJarHttpClient.newInstance(userAgentToUse, _ConnectionTimeout, _SocketTimeout);
            HttpGet httpRequest = new HttpGet(uriToUse);
            RequestUtilities.debugDumpRequestProperties(httpRequest);
            HttpResponse httpResponse = httpClient.execute(httpRequest);
            if (httpResponse == null) {
                Logger.w(Area.COMM.value(), String.format(Locale.US, "RequestLogger: failed [URL:%1$s]", uriToUse));
                return;
            }
            Logger.v(Area.COMM.value(), String.format(Locale.US, "RequestLogger: logged [URL:%1$s]", uriToUse));
            Integer responseCode = null;
            if (httpResponse.getStatusLine() != null) {
                responseCode = Integer.valueOf(httpResponse.getStatusLine().getStatusCode());
            }
            if (responseCode != null) {
                Logger.d(Area.COMM.value(), String.format(Locale.US, "RequestLogger: result code: %1$d", responseCode));
            } else {
                Logger.w(Area.COMM.value(), "RequestLogger: failed to get result code");
            }
        } catch (Exception e) {
            Logger.e(Area.COMM.value(), "RequestLogger: failed", e);
        }
    }

    private String resolveUserAgent() {
        try {
        } catch (Exception e) {
            Logger.w(Area.COMM.value(), "RequestLogger: resolveUserAgent() failed", e);
        }
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
    }

    private int getAndroidAccountsCount() {
        try {
            AccountManager accountManager = AccountManager.get(this._context);
            Account[] accounts = accountManager.getAccountsByType(GoogleAuthUtil.GOOGLE_ACCOUNT_TYPE);
            return accounts.length;
        } catch (Exception e) {
            Logger.e(Area.COMM.value(), "RequestLogger: getAndroidAccounts() failed", e);
            return 0;
        }
    }
}
