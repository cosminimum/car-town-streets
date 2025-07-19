package com.getjar.sdk.utilities;
/* loaded from: classes.dex */
public class ManualResetEvent {
    private final Object monitor = new Object();
    private volatile boolean open;

    public ManualResetEvent(boolean open) {
        this.open = false;
        this.open = open;
    }

    public void waitForOpen() throws InterruptedException {
        synchronized (this.monitor) {
            while (!this.open) {
                this.monitor.wait();
            }
        }
    }

    public void waitForOpen(long maxWaitInMilliseconds) throws InterruptedException {
        synchronized (this.monitor) {
            this.monitor.wait(maxWaitInMilliseconds);
        }
    }

    public void open() {
        synchronized (this.monitor) {
            this.open = true;
            this.monitor.notifyAll();
        }
    }

    public void close() {
        this.open = false;
    }
}
