package com.flurry.android;

public final class CallbackEvent {
    public static final int ADS_LOADED_FROM_CACHE = 201;
    public static final int ADS_UPDATED = 202;
    public static final int ERROR_MARKET_LAUNCH = 101;

    /* renamed from: a */
    private int f409a;

    /* renamed from: b */
    private long f410b = System.currentTimeMillis();

    /* renamed from: c */
    private String f411c;

    CallbackEvent(int i) {
        this.f409a = i;
    }

    public final int getType() {
        return this.f409a;
    }

    public final String getMessage() {
        return this.f411c;
    }

    public final void setMessage(String str) {
        this.f411c = str;
    }

    public final long getTimestamp() {
        return this.f410b;
    }

    public final void setTimestamp(long j) {
        this.f410b = j;
    }
}
