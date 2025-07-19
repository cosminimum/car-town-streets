package com.getjar.sdk.logging;

import android.content.Context;
import android.util.Log;
import com.getjar.sdk.comm.GetJarConfig;
import java.util.Locale;
/* loaded from: classes.dex */
public class LogCatAppender extends AppenderBase {
    private static LogCatAppender _Instance = null;
    private static Object _InstanceLock = new Object();
    private static String _PACKAGE_NAME = null;
    private static Object _ConfigurationLock = new Object();

    @Override // com.getjar.sdk.logging.AppenderBase, com.getjar.sdk.logging.AppenderInterface
    public /* bridge */ /* synthetic */ long getAreas() {
        return super.getAreas();
    }

    @Override // com.getjar.sdk.logging.AppenderBase, com.getjar.sdk.logging.AppenderInterface
    public /* bridge */ /* synthetic */ int getLevel() {
        return super.getLevel();
    }

    @Override // com.getjar.sdk.logging.AppenderBase, com.getjar.sdk.logging.AppenderInterface
    public /* bridge */ /* synthetic */ boolean isAreaActive(long x0) {
        return super.isAreaActive(x0);
    }

    @Override // com.getjar.sdk.logging.AppenderBase, com.getjar.sdk.logging.AppenderInterface
    public /* bridge */ /* synthetic */ boolean isEnabled() {
        return super.isEnabled();
    }

    @Override // com.getjar.sdk.logging.AppenderBase, com.getjar.sdk.logging.AppenderInterface
    public /* bridge */ /* synthetic */ boolean isLevelActive(int x0) {
        return super.isLevelActive(x0);
    }

    private LogCatAppender() {
        super(true, 2, Area.ALL.value());
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public static LogCatAppender getInstance() {
        if (_Instance == null) {
            synchronized (_InstanceLock) {
                if (_Instance == null) {
                    _Instance = new LogCatAppender();
                }
            }
        }
        return _Instance;
    }

    @Override // com.getjar.sdk.logging.AppenderInterface
    public void configureAppender(Context context) {
        if (context == null) {
            throw new IllegalArgumentException("'context' cannot be NULL or empty");
        }
        logInternal(2, "LogCatAppender: configureAppender() START");
        synchronized (_ConfigurationLock) {
            try {
                if (_PACKAGE_NAME == null) {
                    _PACKAGE_NAME = context.getPackageName();
                    _TAG = String.format(Locale.US, "%1$s [%2$s]", _TAG, _PACKAGE_NAME);
                }
            } catch (Exception e) {
                logInternal(6, "configureAppender() failed to update the logging TAG with the package name", e);
            }
            logInternal(2, "LogCatAppender: configureAppender() GetJarConfig.getInstance() start");
            GetJarConfig getJarConfig = GetJarConfig.getInstance(context.getApplicationContext());
            logInternal(2, "LogCatAppender: configureAppender() GetJarConfig.getInstance() finished");
            boolean enabled = getJarConfig.getBooleanValue(GetJarConfig.KEY_LOGGING_LOGCAT_ENABLED, true).booleanValue();
            logInternal(2, String.format(Locale.US, "LogCatAppender: configureAppender() got enabled = %1$s", Boolean.valueOf(enabled)));
            String levelStr = getJarConfig.getDirectiveValue(GetJarConfig.KEY_LOGGING_LOGCAT_LEVEL, "VERBOSE");
            logInternal(2, String.format(Locale.US, "LogCatAppender: configureAppender() got levelStr = %1$s", levelStr));
            String areasStr = getJarConfig.getDirectiveValue(GetJarConfig.KEY_LOGGING_LOGCAT_AREAS, Area.ALL.name());
            logInternal(2, String.format(Locale.US, "LogCatAppender: configureAppender() got areasStr = %1$s", areasStr));
            logInternal(2, "LogCatAppender: configureAppender() calling AppenderBase.configureAppender()");
            super.configureAppender(enabled, levelStr, areasStr);
            logInternal(2, "LogCatAppender: configureAppender() FINISHED");
        }
    }

    @Override // com.getjar.sdk.logging.AppenderInterface
    public void log(LogMessage logMessage) {
        if (logMessage == null) {
            throw new IllegalArgumentException("'logMessage' cannot be NULL");
        }
        if (isLevelActive(logMessage.getLevel()) && isAreaActive(logMessage.getAreas())) {
            String logCatMsg = String.format(Locale.US, "%1$s: %2$s", Area.toString(logMessage.getAreas()), logMessage.getMessage());
            switch (logMessage.getLevel()) {
                case 2:
                    if (logMessage.getThrowable() != null) {
                        Log.v(_TAG, logCatMsg, logMessage.getThrowable());
                        return;
                    } else {
                        Log.v(_TAG, logCatMsg);
                        return;
                    }
                case 3:
                    if (logMessage.getThrowable() == null) {
                        Log.d(_TAG, logCatMsg);
                        return;
                    } else {
                        Log.d(_TAG, logCatMsg, logMessage.getThrowable());
                        return;
                    }
                case 4:
                    if (logMessage.getThrowable() == null) {
                        Log.i(_TAG, logCatMsg);
                        return;
                    } else {
                        Log.i(_TAG, logCatMsg, logMessage.getThrowable());
                        return;
                    }
                case 5:
                    if (logMessage.getThrowable() == null) {
                        Log.w(_TAG, logCatMsg);
                        return;
                    } else {
                        Log.w(_TAG, logCatMsg, logMessage.getThrowable());
                        return;
                    }
                case 6:
                    if (logMessage.getThrowable() == null) {
                        Log.e(_TAG, logCatMsg);
                        return;
                    } else {
                        Log.e(_TAG, logCatMsg, logMessage.getThrowable());
                        return;
                    }
                default:
                    throw new IllegalArgumentException(String.format(Locale.US, "Unsupported log level [level:%1$d]", Integer.valueOf(logMessage.getLevel())));
            }
        }
    }
}
