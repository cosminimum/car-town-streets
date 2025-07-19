package com.google.tagmanager;

import com.google.tagmanager.Logger;

class NoOpLogger implements Logger {
    NoOpLogger() {
    }

    /* renamed from: e */
    public void mo10125e(String message) {
    }

    /* renamed from: e */
    public void mo10126e(String message, Throwable t) {
    }

    /* renamed from: w */
    public void mo10133w(String message) {
    }

    /* renamed from: w */
    public void mo10134w(String message, Throwable t) {
    }

    /* renamed from: i */
    public void mo10128i(String message) {
    }

    /* renamed from: i */
    public void mo10129i(String message, Throwable t) {
    }

    /* renamed from: d */
    public void mo10123d(String message) {
    }

    /* renamed from: d */
    public void mo10124d(String message, Throwable t) {
    }

    /* renamed from: v */
    public void mo10131v(String message) {
    }

    /* renamed from: v */
    public void mo10132v(String message, Throwable t) {
    }

    public Logger.LogLevel getLogLevel() {
        return Logger.LogLevel.NONE;
    }

    public void setLogLevel(Logger.LogLevel logLevel) {
    }
}
