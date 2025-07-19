package com.google.tagmanager;

import com.google.android.gms.common.util.VisibleForTesting;
import com.google.tagmanager.Logger;

final class Log {
    @VisibleForTesting
    static Logger sLogger = new DefaultLogger();

    Log() {
    }

    public static void setLogger(Logger logger) {
        if (logger == null) {
            sLogger = new NoOpLogger();
        } else {
            sLogger = logger;
        }
    }

    public static Logger getLogger() {
        if (sLogger.getClass() == NoOpLogger.class) {
            return null;
        }
        return sLogger;
    }

    /* renamed from: e */
    public static void m4388e(String message) {
        sLogger.mo10125e(message);
    }

    /* renamed from: e */
    public static void m4389e(String message, Throwable t) {
        sLogger.mo10126e(message, t);
    }

    /* renamed from: w */
    public static void m4394w(String message) {
        sLogger.mo10133w(message);
    }

    /* renamed from: w */
    public static void m4395w(String message, Throwable t) {
        sLogger.mo10134w(message, t);
    }

    /* renamed from: i */
    public static void m4390i(String message) {
        sLogger.mo10128i(message);
    }

    /* renamed from: i */
    public static void m4391i(String message, Throwable t) {
        sLogger.mo10129i(message, t);
    }

    /* renamed from: d */
    public static void m4386d(String message) {
        sLogger.mo10123d(message);
    }

    /* renamed from: d */
    public static void m4387d(String message, Throwable t) {
        sLogger.mo10124d(message, t);
    }

    /* renamed from: v */
    public static void m4392v(String message) {
        sLogger.mo10131v(message);
    }

    /* renamed from: v */
    public static void m4393v(String message, Throwable t) {
        sLogger.mo10132v(message, t);
    }

    public static Logger.LogLevel getLogLevel() {
        return sLogger.getLogLevel();
    }
}
