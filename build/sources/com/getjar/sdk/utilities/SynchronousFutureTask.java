package com.getjar.sdk.utilities;

import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.FutureTask;

public class SynchronousFutureTask<V> extends FutureTask<V> {
    private static final ExecutorService _ExecutorService = Executors.newFixedThreadPool(1);

    public SynchronousFutureTask(Callable<V> callable) {
        super(callable);
    }

    public V get() throws InterruptedException, ExecutionException {
        _ExecutorService.execute(this);
        return super.get();
    }
}
