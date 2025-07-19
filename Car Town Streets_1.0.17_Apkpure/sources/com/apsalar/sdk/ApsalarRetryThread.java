package com.apsalar.sdk;

import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.TimeUnit;
/* JADX INFO: Access modifiers changed from: package-private */
/* compiled from: ApThread.java */
/* loaded from: classes.dex */
public class ApsalarRetryThread extends Thread {
    private static ApsalarRetryThread singleton = null;
    protected ArrayBlockingQueue<ApsalarAPI> events = new ArrayBlockingQueue<>(1);

    /* JADX INFO: Access modifiers changed from: protected */
    public static ApsalarRetryThread getInstance() {
        if (singleton == null) {
            singleton = new ApsalarRetryThread();
        }
        if (!singleton.isAlive()) {
            singleton.start();
        }
        return singleton;
    }

    private ApsalarRetryThread() {
    }

    @Override // java.lang.Thread, java.lang.Runnable
    public void run() {
        int i;
        while (true) {
            try {
                ApsalarAPI poll = this.events.poll(Long.MAX_VALUE, TimeUnit.MILLISECONDS);
                if (poll != null) {
                    i = poll.REST();
                } else {
                    i = -1;
                }
                switch (i) {
                    case 1:
                        ApsalarThread apsalarThread = ApsalarThread.getInstance();
                        if (apsalarThread != null) {
                            apsalarThread.events.offer(poll);
                            break;
                        } else {
                            continue;
                        }
                    default:
                        continue;
                }
            } catch (InterruptedException e) {
            }
        }
    }
}
