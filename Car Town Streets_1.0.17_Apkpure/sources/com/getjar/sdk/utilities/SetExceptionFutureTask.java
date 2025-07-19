package com.getjar.sdk.utilities;

import java.util.concurrent.Callable;
import java.util.concurrent.FutureTask;
/* loaded from: classes.dex */
public class SetExceptionFutureTask<V> extends FutureTask<V> {
    public SetExceptionFutureTask(Callable<V> callable) {
        super(callable);
    }

    @Override // java.util.concurrent.FutureTask, java.util.concurrent.RunnableFuture, java.lang.Runnable
    public void run() {
        try {
            super.run();
        } catch (Throwable t) {
            setException(t);
        }
    }
}
