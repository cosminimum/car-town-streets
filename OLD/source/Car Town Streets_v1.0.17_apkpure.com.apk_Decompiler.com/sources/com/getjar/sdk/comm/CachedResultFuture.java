package com.getjar.sdk.comm;

import java.util.concurrent.Callable;
import java.util.concurrent.FutureTask;
import java.util.concurrent.TimeUnit;

class CachedResultFuture extends FutureTask<Result> {
    private static Callable<Result> _ReturnCachedResultCallable = new Callable<Result>() {
        public Result call() throws Exception {
            return null;
        }
    };
    private Result _cachedResult = null;

    protected CachedResultFuture(Result cachedResult) {
        super(_ReturnCachedResultCallable);
        if (cachedResult == null) {
            throw new IllegalArgumentException("'cachedResult' can not be NULL");
        }
        this._cachedResult = cachedResult;
    }

    public Result get() {
        return this._cachedResult;
    }

    public Result get(long timeout, TimeUnit unit) {
        return this._cachedResult;
    }

    public boolean isCancelled() {
        return false;
    }

    public boolean isDone() {
        return true;
    }

    public void run() {
    }
}
