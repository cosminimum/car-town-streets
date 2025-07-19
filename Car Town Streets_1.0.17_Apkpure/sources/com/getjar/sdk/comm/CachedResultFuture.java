package com.getjar.sdk.comm;

import java.util.concurrent.Callable;
import java.util.concurrent.FutureTask;
import java.util.concurrent.TimeUnit;
/* loaded from: classes.dex */
class CachedResultFuture extends FutureTask<Result> {
    private static Callable<Result> _ReturnCachedResultCallable = new Callable<Result>() { // from class: com.getjar.sdk.comm.CachedResultFuture.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // java.util.concurrent.Callable
        /* renamed from: call */
        public Result mo36call() throws Exception {
            return null;
        }
    };
    private Result _cachedResult;

    protected CachedResultFuture(Result cachedResult) {
        super(_ReturnCachedResultCallable);
        this._cachedResult = null;
        if (cachedResult == null) {
            throw new IllegalArgumentException("'cachedResult' can not be NULL");
        }
        this._cachedResult = cachedResult;
    }

    @Override // java.util.concurrent.FutureTask, java.util.concurrent.Future
    /* renamed from: get */
    public Result mo34get() {
        return this._cachedResult;
    }

    @Override // java.util.concurrent.FutureTask, java.util.concurrent.Future
    /* renamed from: get */
    public Result mo35get(long timeout, TimeUnit unit) {
        return this._cachedResult;
    }

    @Override // java.util.concurrent.FutureTask, java.util.concurrent.Future
    public boolean isCancelled() {
        return false;
    }

    @Override // java.util.concurrent.FutureTask, java.util.concurrent.Future
    public boolean isDone() {
        return true;
    }

    @Override // java.util.concurrent.FutureTask, java.util.concurrent.RunnableFuture, java.lang.Runnable
    public void run() {
    }
}
