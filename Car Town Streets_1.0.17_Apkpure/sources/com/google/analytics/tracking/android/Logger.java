package com.google.analytics.tracking.android;
/* loaded from: classes.dex */
public interface Logger {

    /* loaded from: classes.dex */
    public enum LogLevel {
        VERBOSE,
        INFO,
        WARNING,
        ERROR
    }

    void error(Exception exc);

    void error(String str);

    LogLevel getLogLevel();

    void info(String str);

    void setLogLevel(LogLevel logLevel);

    void verbose(String str);

    void warn(String str);
}
