package com.getjar.sdk.utilities;

public class ManualResetEvent {
    private final Object monitor = new Object();
    private volatile boolean open = false;

    public ManualResetEvent(boolean open2) {
        this.open = open2;
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
