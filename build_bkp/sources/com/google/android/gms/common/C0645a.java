package com.google.android.gms.common;

import android.content.ComponentName;
import android.content.ServiceConnection;
import android.os.IBinder;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;

/* renamed from: com.google.android.gms.common.a */
public class C0645a implements ServiceConnection {

    /* renamed from: mA */
    private final BlockingQueue<IBinder> f1318mA = new LinkedBlockingQueue();

    /* renamed from: mz */
    boolean f1319mz = false;

    /* renamed from: bg */
    public IBinder mo5858bg() throws InterruptedException {
        if (this.f1319mz) {
            throw new IllegalStateException();
        }
        this.f1319mz = true;
        return this.f1318mA.take();
    }

    public void onServiceConnected(ComponentName name, IBinder service) {
        try {
            this.f1318mA.put(service);
        } catch (InterruptedException e) {
        }
    }

    public void onServiceDisconnected(ComponentName name) {
    }
}
