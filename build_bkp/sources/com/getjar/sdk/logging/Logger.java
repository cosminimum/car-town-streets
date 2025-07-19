package com.getjar.sdk.logging;

import android.content.Context;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Locale;

public class Logger {
    private static Logger _Instance = null;
    private static Object _InstanceLock = new Object();
    private final List<AppenderInterface> _appenders = Collections.unmodifiableList(Arrays.asList(new AppenderInterface[]{LogCatAppender.getInstance(), BufferingAppender.getInstance(), RemoteAppender.getInstance()}));

    private Logger() {
    }

    public static Logger getInstance() {
        if (_Instance == null) {
            synchronized (_InstanceLock) {
                if (_Instance == null) {
                    _Instance = new Logger();
                }
            }
        }
        return _Instance;
    }

    public void configureAppenders(Context context) {
        for (AppenderInterface logger : this._appenders) {
            logger.configureAppender(context);
        }
    }

    public boolean isLevelActive(int logLevel) {
        if (logLevel == 7 || logLevel == 3 || logLevel == 6 || logLevel == 4 || logLevel == 2 || logLevel == 5) {
            for (AppenderInterface logger : this._appenders) {
                if (logger.isLevelActive(logLevel)) {
                    return true;
                }
            }
            return false;
        }
        throw new IllegalArgumentException(String.format(Locale.US, "Unsupported log level: %1$d", new Object[]{Integer.valueOf(logLevel)}));
    }

    public boolean isAreaActive(long areas) {
        for (AppenderInterface logger : this._appenders) {
            if (logger.isAreaActive(areas)) {
                return true;
            }
        }
        return false;
    }

    public void log(int level, long areas, String msg, Throwable tr) {
        if (areas <= 0) {
            throw new IllegalArgumentException("'area' cannot be less than or equal to 0");
        } else if (msg == null) {
            throw new IllegalArgumentException("'msg' cannot be NULL");
        } else if (isLevelActive(level) && isAreaActive(areas)) {
            LogMessage logMessage = new LogMessage(level, areas, msg, tr);
            for (AppenderInterface appender : this._appenders) {
                if (appender.isLevelActive(level) && appender.isAreaActive(areas)) {
                    appender.log(logMessage);
                }
            }
        }
    }

    /* renamed from: v */
    public static void m646v(long areas, String msg) {
        m647v(areas, msg, (Throwable) null);
    }

    /* renamed from: v */
    public static void m647v(long areas, String msg, Throwable tr) {
        getInstance().log(2, areas, msg, tr);
    }

    /* renamed from: d */
    public static void m640d(long areas, String msg) {
        m641d(areas, msg, (Throwable) null);
    }

    /* renamed from: d */
    public static void m641d(long areas, String msg, Throwable tr) {
        getInstance().log(3, areas, msg, tr);
    }

    /* renamed from: i */
    public static void m644i(long areas, String msg) {
        m645i(areas, msg, (Throwable) null);
    }

    /* renamed from: i */
    public static void m645i(long areas, String msg, Throwable tr) {
        getInstance().log(4, areas, msg, tr);
    }

    /* renamed from: w */
    public static void m648w(long areas, String msg) {
        m649w(areas, msg, (Throwable) null);
    }

    /* renamed from: w */
    public static void m649w(long areas, String msg, Throwable tr) {
        getInstance().log(5, areas, msg, tr);
    }

    /* renamed from: e */
    public static void m642e(long areas, String msg) {
        m643e(areas, msg, (Throwable) null);
    }

    /* renamed from: e */
    public static void m643e(long areas, String msg, Throwable tr) {
        getInstance().log(6, areas, msg, tr);
    }

    public static String getThrowableDump(Throwable tr) {
        return String.format(Locale.US, "%s | %s | %s", new Object[]{tr.getClass().getName(), tr.getMessage(), getStackTrace(tr.getStackTrace())});
    }

    public static String getShortStack() {
        return getShortStack(Thread.currentThread().getStackTrace());
    }

    public static String getShortStack(StackTraceElement[] stack) {
        StringBuilder callPath = new StringBuilder("");
        for (StackTraceElement frame : stack) {
            callPath.append(':');
            callPath.append(frame.getFileName());
            callPath.append('.');
            callPath.append(frame.getLineNumber());
        }
        return callPath.toString();
    }

    public static String getStackTrace() {
        StringBuffer buffer = new StringBuffer();
        StackTraceElement[] stacks = Thread.currentThread().getStackTrace();
        for (int i = 3; i < stacks.length; i++) {
            buffer.append(String.format(Locale.US, "%1$s : %2$s : %3$s [%4$d]\n", new Object[]{stacks[i].getFileName(), stacks[i].getClassName(), stacks[i].getMethodName(), Integer.valueOf(stacks[i].getLineNumber())}));
        }
        return buffer.toString();
    }

    public static String getStackTrace(StackTraceElement[] stacks) {
        StringBuffer buffer = new StringBuffer();
        for (int i = 0; i < stacks.length; i++) {
            buffer.append(String.format(Locale.US, "%1$s : %2$s : %3$s [%4$d]\n", new Object[]{stacks[i].getFileName(), stacks[i].getClassName(), stacks[i].getMethodName(), Integer.valueOf(stacks[i].getLineNumber())}));
        }
        return buffer.toString();
    }

    public static String levelToName(int level) {
        switch (level) {
            case 2:
                return "V";
            case 3:
                return "D";
            case 4:
                return "I";
            case 5:
                return "W";
            case 6:
                return "E";
            default:
                throw new IllegalArgumentException(String.format(Locale.US, "Unsupported log level [level:%1$d]", new Object[]{Integer.valueOf(level)}));
        }
    }
}
