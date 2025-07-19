package com.google.tagmanager;
/* loaded from: classes.dex */
interface RateLimiter {
    public static final int DEFAULT_MAX_TOKEN_COUNT = 60;
    public static final long DEFAULT_MILLISECONDS_PER_TOKEN = 2000;

    boolean tokenAvailable();
}
