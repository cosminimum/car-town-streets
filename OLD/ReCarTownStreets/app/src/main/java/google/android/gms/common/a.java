package google.android.gms.common;

import android.content.ComponentName;
import android.content.ServiceConnection;
import android.os.IBinder;

import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;

public class a implements ServiceConnection {
    private final BlockingQueue<IBinder> mA = new LinkedBlockingQueue();
    boolean mz = false;

    public IBinder bg() throws InterruptedException {
        if (this.mz) {
            throw new IllegalStateException();
        }
        this.mz = true;
        return this.mA.take();
    }

    public void onServiceConnected(ComponentName name, IBinder service) {
        try {
            this.mA.put(service);
        } catch (InterruptedException e) {
        }
    }

    public void onServiceDisconnected(ComponentName name) {
    }
}
