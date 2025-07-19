package com.google.android.gms.common;

import android.content.ComponentName;
import android.content.ServiceConnection;
import android.os.IBinder;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;
/* loaded from: classes.dex */
public class a implements ServiceConnection {
    boolean mz = false;
    private final BlockingQueue<IBinder> mA = new LinkedBlockingQueue();

    public IBinder bg() throws InterruptedException {
        if (this.mz) {
            throw new IllegalStateException();
        }
        this.mz = true;
        return this.mA.take();
    }

    @Override // android.content.ServiceConnection
    public void onServiceConnected(ComponentName name, IBinder service) {
        try {
            this.mA.put(service);
        } catch (InterruptedException e) {
        }
    }

    @Override // android.content.ServiceConnection
    public void onServiceDisconnected(ComponentName name) {
    }
}
