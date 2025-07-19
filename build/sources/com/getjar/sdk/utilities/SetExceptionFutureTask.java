package com.getjar.sdk.utilities;

import java.util.concurrent.Callable;
import java.util.concurrent.FutureTask;

public class SetExceptionFutureTask<V> extends FutureTask<V> {
    public SetExceptionFutureTask(Callable<V> callable) {
        super(callable);
    }

    public void run() {
        try {
            super.run();
        } catch (Throwable t) {
            setException(t);
        }
    }
}
