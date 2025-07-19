package com.google.android.gms.internal;

import android.os.Process;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.SynchronousQueue;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;

/* renamed from: com.google.android.gms.internal.cn */
public final class C0994cn {

    /* renamed from: iA */
    private static final ThreadPoolExecutor f2401iA = new ThreadPoolExecutor(0, 10, 65, TimeUnit.SECONDS, new SynchronousQueue(true), f2402iz);

    /* renamed from: iz */
    private static final ThreadFactory f2402iz = new ThreadFactory() {

        /* renamed from: iC */
        private final AtomicInteger f2404iC = new AtomicInteger(1);

        public Thread newThread(Runnable runnable) {
            return new Thread(runnable, "AdWorker #" + this.f2404iC.getAndIncrement());
        }
    };

    public static void execute(final Runnable task) {
        try {
            f2401iA.execute(new Runnable() {
                public void run() {
                    Process.setThreadPriority(10);
                    task.run();
                }
            });
        } catch (RejectedExecutionException e) {
            C1004ct.m2212b("Too many background threads already running. Aborting task.", e);
        }
    }
}
