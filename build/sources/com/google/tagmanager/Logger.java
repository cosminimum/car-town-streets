package com.google.tagmanager;

public interface Logger {

    public enum LogLevel {
        VERBOSE,
        DEBUG,
        INFO,
        WARNING,
        ERROR,
        NONE
    }

    /* renamed from: d */
    void mo10123d(String str);

    /* renamed from: d */
    void mo10124d(String str, Throwable th);

    /* renamed from: e */
    void mo10125e(String str);

    /* renamed from: e */
    void mo10126e(String str, Throwable th);

    LogLevel getLogLevel();

    /* renamed from: i */
    void mo10128i(String str);

    /* renamed from: i */
    void mo10129i(String str, Throwable th);

    void setLogLevel(LogLevel logLevel);

    /* renamed from: v */
    void mo10131v(String str);

    /* renamed from: v */
    void mo10132v(String str, Throwable th);

    /* renamed from: w */
    void mo10133w(String str);

    /* renamed from: w */
    void mo10134w(String str, Throwable th);
}
