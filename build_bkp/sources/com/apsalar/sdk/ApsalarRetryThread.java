package com.apsalar.sdk;

import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.TimeUnit;

/* compiled from: ApThread */
class ApsalarRetryThread extends Thread {
    private static ApsalarRetryThread singleton = null;
    protected ArrayBlockingQueue<ApsalarAPI> events = new ArrayBlockingQueue<>(1);

    protected static ApsalarRetryThread getInstance() {
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
                        ApsalarThread instance = ApsalarThread.getInstance();
                        if (instance == null) {
                            break;
                        } else {
                            instance.events.offer(poll);
                            break;
                        }
                }
            } catch (InterruptedException e) {
            }
        }
    }
}
