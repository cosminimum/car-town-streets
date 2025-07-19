package com.getjar.sdk.logging;

import android.content.Context;
import android.util.Log;
import com.getjar.sdk.comm.GetJarConfig;
import com.getjar.sdk.comm.GetJarHttpClient;
import com.getjar.sdk.comm.UserAgentValuesManager;
import com.getjar.sdk.comm.auth.ApplicationKeyDatabase;
import com.getjar.sdk.utilities.StringUtility;
import com.google.analytics.tracking.android.HitTypes;
import com.tapjoy.TapjoyConstants;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.NoSuchElementException;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.json.JSONArray;
import org.json.JSONObject;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public class RemoteAppender extends AppenderBase {
    private static final int _MaxExecutorServiceQueueSize = 100;
    private static RemoteAppender _Instance = null;
    private static Object _InstanceLock = new Object();
    private static final ThreadPoolExecutor _ExecutorService = new ThreadPoolExecutor(1, 1, 0, TimeUnit.MILLISECONDS, new LinkedBlockingQueue());
    private static int _ConnectionTimeout = 60000;
    private static int _SocketTimeout = 60000;
    private static Object _ConfigurationLock = new Object();
    private final Object _waitMonitor = new Object();
    private final Object _startStopLock = new Object();
    private volatile boolean _requestThreadExit = false;
    private volatile ThreadState _threadState = ThreadState.STOPPED;
    private volatile RemoteLoggingThread _remoteLoggingThread = null;
    private ConcurrentLinkedQueue<LogMessage> _logBuffer = new ConcurrentLinkedQueue<>();
    private volatile int _approximateBufferSize = 0;
    private int _maxBatchCount = 100;
    private long _maxWaitIntervalInMilliseconds = TapjoyConstants.THROTTLE_GET_TAP_POINTS_INTERVAL;
    private Context _context = null;
    private String _sdkUserAgent = null;
    private String _loggingEndPoint = null;

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public enum ThreadState {
        STARTING,
        STARTED,
        STOPPING,
        STOPPED
    }

    static /* synthetic */ int access$310(RemoteAppender x0) {
        int i = x0._approximateBufferSize;
        x0._approximateBufferSize = i - 1;
        return i;
    }

    private RemoteAppender() {
        super(false, 6, Area.ALL.value());
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public static RemoteAppender getInstance() {
        if (_Instance == null) {
            synchronized (_InstanceLock) {
                if (_Instance == null) {
                    _Instance = new RemoteAppender();
                }
            }
        }
        return _Instance;
    }

    @Override // com.getjar.sdk.logging.AppenderBase, com.getjar.sdk.logging.AppenderInterface
    public boolean isEnabled() {
        return super.isEnabled() && !StringUtility.isNullOrEmpty(this._loggingEndPoint);
    }

    @Override // com.getjar.sdk.logging.AppenderInterface
    public void configureAppender(Context context) {
        if (context == null) {
            throw new IllegalArgumentException("'context' cannot be NULL or empty");
        }
        logInternal(2, String.format(Locale.US, "RemoteAppender: configureAppender() START [state:%1$s] [thread:%2$d]", this._threadState.name(), Long.valueOf(Thread.currentThread().getId())));
        synchronized (_ConfigurationLock) {
            this._context = context;
            this._loggingEndPoint = GetJarConfig.getInstance(this._context).getDirectiveValue(GetJarConfig.KEY_LOGGING_ENDPOINT);
            GetJarConfig getJarConfig = GetJarConfig.getInstance(this._context.getApplicationContext());
            boolean enabled = getJarConfig.getBooleanValue(GetJarConfig.KEY_LOGGING_REMOTE_ENABLED, false).booleanValue();
            String levelStr = getJarConfig.getDirectiveValue(GetJarConfig.KEY_LOGGING_REMOTE_LEVEL, "ERROR");
            String areasStr = getJarConfig.getDirectiveValue(GetJarConfig.KEY_LOGGING_REMOTE_AREAS, Area.ALL.name());
            super.configureAppender(enabled, levelStr, areasStr);
            this._maxBatchCount = getJarConfig.getIntegerValue(GetJarConfig.KEY_LOGGING_REMOTE_MAX_BATCH_COUNT, 100).intValue();
            this._maxWaitIntervalInMilliseconds = getJarConfig.getIntegerValue(GetJarConfig.KEY_LOGGING_REMOTE_MAX_WAIT_INTERVAL, 60).intValue() * 1000;
            if (isEnabled()) {
                startLogging();
            }
            logInternal(2, String.format(Locale.US, "RemoteAppender: configureAppender() FINISHED [state:%1$s] [thread:%2$d]", this._threadState.name(), Long.valueOf(Thread.currentThread().getId())));
        }
    }

    @Override // com.getjar.sdk.logging.AppenderInterface
    public void log(LogMessage logMessage) {
        if (logMessage == null) {
            throw new IllegalArgumentException("'logMessage' cannot be NULL");
        }
        if (isLevelActive(logMessage.getLevel()) && isAreaActive(logMessage.getAreas()) && isEnabled()) {
            this._logBuffer.add(logMessage);
            this._approximateBufferSize++;
            if (this._approximateBufferSize >= this._maxBatchCount) {
                synchronized (this._waitMonitor) {
                    this._waitMonitor.notify();
                }
            }
        }
    }

    public void startLogging() {
        synchronized (this._startStopLock) {
            logInternal(2, String.format(Locale.US, "RemoteAppender: Attempting to start remote logging [state:%1$s] [thread:%2$d]", this._threadState.name(), Long.valueOf(Thread.currentThread().getId())));
            if (this._threadState == ThreadState.STOPPED) {
                this._threadState = ThreadState.STARTING;
                this._requestThreadExit = false;
                this._remoteLoggingThread = new RemoteLoggingThread();
                this._remoteLoggingThread.start();
                logInternal(2, String.format(Locale.US, "RemoteAppender: Remote logging started [thread:%1$d] [logging_thread:%2$d]", Long.valueOf(Thread.currentThread().getId()), Long.valueOf(this._remoteLoggingThread.getId())));
            } else {
                logInternal(2, String.format(Locale.US, "RemoteAppender: Remote logging found already running [thread:%1$d]", Long.valueOf(Thread.currentThread().getId())));
            }
        }
    }

    public void stopLogging() {
        synchronized (this._startStopLock) {
            logInternal(2, String.format(Locale.US, "RemoteAppender: Attempting to stop remote logging [state:%1$s] [thread:%2$d]", this._threadState.name(), Long.valueOf(Thread.currentThread().getId())));
            if (this._threadState == ThreadState.STARTED) {
                this._threadState = ThreadState.STOPPING;
                this._requestThreadExit = true;
                synchronized (this._waitMonitor) {
                    this._waitMonitor.notify();
                }
                long loggingThreadId = this._remoteLoggingThread.getId();
                try {
                    this._remoteLoggingThread.join(2000L);
                    this._remoteLoggingThread.interrupt();
                    this._remoteLoggingThread.join(2000L);
                } catch (Exception e) {
                    Log.e(_TAG, String.format(Locale.US, "%1$s: RemoteAppender: join()/interrupt()/join() failed [thread:%2$d]", Area.LOGGING.name(), Long.valueOf(Thread.currentThread().getId())), e);
                }
                this._remoteLoggingThread = null;
                logInternal(2, String.format(Locale.US, "RemoteAppender: Remote logging stopped [thread:%1$d] [logging_thread:%2$d]", Long.valueOf(Thread.currentThread().getId()), Long.valueOf(loggingThreadId)));
            } else {
                logInternal(2, String.format(Locale.US, "RemoteAppender: Remote logging found already stopped [thread:%1$d]", Long.valueOf(Thread.currentThread().getId())));
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public class RemoteLoggingThread extends Thread {
        private RemoteLoggingThread() {
        }

        @Override // java.lang.Thread, java.lang.Runnable
        public void run() {
            try {
                try {
                    RemoteAppender.this._threadState = ThreadState.STARTED;
                    RemoteAppender.this.logInternal(3, String.format(Locale.US, "RemoteAppender: consumer starting [thread:%1$d]", Long.valueOf(Thread.currentThread().getId())));
                    while (!RemoteAppender.this._requestThreadExit) {
                        if (RemoteAppender.this._approximateBufferSize > 0) {
                            final ArrayList arrayList = new ArrayList();
                            while (!RemoteAppender.this._logBuffer.isEmpty()) {
                                try {
                                    arrayList.add(RemoteAppender.this._logBuffer.remove());
                                    RemoteAppender.access$310(RemoteAppender.this);
                                } catch (NoSuchElementException e) {
                                }
                            }
                            RemoteAppender.this._approximateBufferSize = RemoteAppender.this._logBuffer.size();
                            if (arrayList.size() > 0) {
                                if (RemoteAppender._ExecutorService.getActiveCount() <= 100) {
                                    RemoteAppender._ExecutorService.execute(new Runnable() { // from class: com.getjar.sdk.logging.RemoteAppender.RemoteLoggingThread.1
                                        @Override // java.lang.Runnable
                                        public void run() {
                                            RemoteAppender.this.pushLogMessage(arrayList);
                                        }
                                    });
                                } else {
                                    RemoteAppender.this.logInternal(5, String.format(Locale.US, "RemoteAppender: queue of length %1$d exteeds max of %2$d, dropping messages [thread:%3$d]", Integer.valueOf(RemoteAppender._ExecutorService.getActiveCount()), 100, Long.valueOf(Thread.currentThread().getId())));
                                }
                            }
                        }
                        synchronized (RemoteAppender.this._waitMonitor) {
                            RemoteAppender.this._waitMonitor.wait(RemoteAppender.this._maxWaitIntervalInMilliseconds);
                        }
                    }
                    RemoteAppender.this._threadState = ThreadState.STOPPED;
                    RemoteAppender.this.logInternal(3, String.format(Locale.US, "RemoteAppender: consumer exiting [thread:%1$d]", Long.valueOf(Thread.currentThread().getId())));
                } catch (Exception e2) {
                    RemoteAppender.this.logInternal(6, String.format(Locale.US, "RemoteAppender: consumer failed [thread:%1$d]", Long.valueOf(Thread.currentThread().getId())), e2);
                    RemoteAppender.this._threadState = ThreadState.STOPPED;
                    RemoteAppender.this.logInternal(3, String.format(Locale.US, "RemoteAppender: consumer exiting [thread:%1$d]", Long.valueOf(Thread.currentThread().getId())));
                }
            } catch (Throwable th) {
                RemoteAppender.this._threadState = ThreadState.STOPPED;
                RemoteAppender.this.logInternal(3, String.format(Locale.US, "RemoteAppender: consumer exiting [thread:%1$d]", Long.valueOf(Thread.currentThread().getId())));
                throw th;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void pushLogMessage(List<LogMessage> messagesToSend) {
        long tid = Thread.currentThread().getId();
        try {
            try {
                logInternal(3, String.format(Locale.US, "RemoteAppender: pushLogMessage() starting [thread:%1$d]", Long.valueOf(tid)));
                if (messagesToSend == null || messagesToSend.size() <= 0) {
                    throw new IllegalArgumentException("'messagesToSend' cannot be NULL or empty");
                }
                if (!isEnabled()) {
                    logInternal(3, String.format(Locale.US, "RemoteAppender: pushLogMessage() finished [thread:%1$d]", Long.valueOf(tid)));
                    return;
                }
                JSONObject jsonRoot = new JSONObject();
                JSONArray jsonMessages = new JSONArray();
                jsonRoot.put("message_count", messagesToSend.size());
                for (LogMessage msg : messagesToSend) {
                    JSONObject jsonMessage = new JSONObject();
                    jsonMessage.put("level", msg.getLevel());
                    jsonMessage.put("areas", msg.getAreas());
                    jsonMessage.put("time", msg.getTimestamp());
                    jsonMessage.put("text", msg.getMessage());
                    if (msg.getThrowable() != null) {
                        jsonMessage.put(HitTypes.EXCEPTION, Logger.getThrowableDump(msg.getThrowable()));
                    }
                    jsonMessages.put(jsonMessage);
                }
                jsonRoot.put("messages", jsonMessages);
                String postDataBlob = jsonRoot.toString();
                GetJarHttpClient httpClient = GetJarHttpClient.newInstance(resolveUserAgent(), _ConnectionTimeout, _SocketTimeout);
                HttpPost httpRequest = new HttpPost(this._loggingEndPoint);
                httpRequest.setHeader("Content-Language", "en-US");
                httpRequest.setHeader("Content-Type", "application/x-www-form-urlencoded");
                httpRequest.setHeader("Cache-Control", "no-transform");
                httpRequest.setEntity(new StringEntity(postDataBlob));
                logInternal(2, String.format(Locale.US, "RemoteAppender: pushLogMessage() sending messages [URL:%1$s] [thread:%2$d] [message_count:%2$d]", this._loggingEndPoint, Long.valueOf(tid), Integer.valueOf(messagesToSend.size())));
                HttpResponse httpResponse = httpClient.execute(httpRequest);
                if (httpResponse == null) {
                    logInternal(5, String.format(Locale.US, "RemoteAppender: pushLogMessage() failed [URL:%1$s] [thread:%2$d]", this._loggingEndPoint, Long.valueOf(tid)));
                    logInternal(3, String.format(Locale.US, "RemoteAppender: pushLogMessage() finished [thread:%1$d]", Long.valueOf(tid)));
                    return;
                }
                logInternal(2, String.format(Locale.US, "RemoteAppender: pushLogMessage() logged [URL:%1$s] [thread:%2$d]", this._loggingEndPoint, Long.valueOf(tid)));
                Integer responseCode = null;
                if (httpResponse.getStatusLine() != null) {
                    responseCode = Integer.valueOf(httpResponse.getStatusLine().getStatusCode());
                }
                if (responseCode != null) {
                    logInternal(2, String.format(Locale.US, "RemoteAppender: pushLogMessage() result code: %1$d [thread:%2$d]", responseCode, Long.valueOf(tid)));
                } else {
                    logInternal(5, String.format(Locale.US, "RemoteAppender: pushLogMessage() failed to get result code [thread:%1$d]", Long.valueOf(tid)));
                }
                logInternal(3, String.format(Locale.US, "RemoteAppender: pushLogMessage() finished [thread:%1$d]", Long.valueOf(tid)));
            } catch (Exception e) {
                logInternal(6, String.format(Locale.US, "RemoteAppender: pushLogMessage() failed [thread:%1$d]", Long.valueOf(tid)), e);
                logInternal(3, String.format(Locale.US, "RemoteAppender: pushLogMessage() finished [thread:%1$d]", Long.valueOf(tid)));
            }
        } catch (Throwable th) {
            logInternal(3, String.format(Locale.US, "RemoteAppender: pushLogMessage() finished [thread:%1$d]", Long.valueOf(tid)));
            throw th;
        }
    }

    private String resolveUserAgent() {
        try {
        } catch (Exception e) {
            logInternal(5, String.format(Locale.US, "RemoteAppender: resolveUserAgent() failed [thread:%1$d]", Long.valueOf(Thread.currentThread().getId())), e);
        }
        if (!StringUtility.isNullOrEmpty(this._sdkUserAgent)) {
            return this._sdkUserAgent;
        }
        if (this._context != null) {
            String applicationKey = ApplicationKeyDatabase.getInstance(this._context).getApplicationKey();
            if (!StringUtility.isNullOrEmpty(applicationKey)) {
                this._sdkUserAgent = UserAgentValuesManager.getInstance().getSdkUserAgent(this._context, applicationKey);
            }
        }
        if (!StringUtility.isNullOrEmpty(this._sdkUserAgent)) {
            return this._sdkUserAgent;
        }
        return "UNRESOLVED";
    }
}
