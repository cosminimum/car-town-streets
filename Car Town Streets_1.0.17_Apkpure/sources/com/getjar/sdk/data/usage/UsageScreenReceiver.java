package com.getjar.sdk.data.usage;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.PowerManager;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
/* loaded from: classes.dex */
public class UsageScreenReceiver extends BroadcastReceiver {
    private static volatile UsageScreenReceiver _Instance = null;
    private boolean _isRegistered = false;

    private UsageScreenReceiver() {
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public static synchronized UsageScreenReceiver getInstance() {
        UsageScreenReceiver usageScreenReceiver;
        synchronized (UsageScreenReceiver.class) {
            if (_Instance == null) {
                _Instance = new UsageScreenReceiver();
            }
            usageScreenReceiver = _Instance;
        }
        return usageScreenReceiver;
    }

    @Override // android.content.BroadcastReceiver
    public void onReceive(final Context context, final Intent intent) {
        try {
            Logger.d(Area.OS_ENTRY_POINT.value(), "UsageScreenReceiver onReceive start()");
            new Thread(new Runnable() { // from class: com.getjar.sdk.data.usage.UsageScreenReceiver.1
                @Override // java.lang.Runnable
                public void run() {
                    try {
                        UsageScreenReceiver.this.doOnReceive(context, intent);
                    } catch (Exception e) {
                        Logger.e(Area.USAGE.value() | Area.OS_ENTRY_POINT.value(), "UsageScreenReceiver: onReceive() failed", e);
                    }
                }
            }, "UsageScreenReceiver Worker Thread").start();
        } catch (Exception e) {
            Logger.e(Area.USAGE.value() | Area.OS_ENTRY_POINT.value(), "UsageScreenReceiver: onReceive() failed", e);
        }
    }

    public void doOnReceive(Context context, Intent intent) {
        if (intent.getAction().equals("android.intent.action.SCREEN_OFF")) {
            Logger.i(Area.USAGE.value(), "Usage: UsageScreenReceiver: screen off");
            UsageManager.getInstance(context).stopPhoneSession();
        } else if (intent.getAction().equals("android.intent.action.SCREEN_ON")) {
            Logger.i(Area.USAGE.value(), "Usage: UsageScreenReceiver: screen on");
            UsageManager.getInstance(context).startPhoneSession();
        }
    }

    public boolean isScreenOn(Context context) {
        try {
            return ((PowerManager) context.getSystemService("power")).isScreenOn();
        } catch (NoSuchMethodError e) {
            Logger.e(Area.USAGE.value(), "Usage: UsageScreenReceiver: isScreenOn() failed", e);
            return true;
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public synchronized void registerReceiver(Context context) {
        if (!this._isRegistered) {
            IntentFilter filter = new IntentFilter("android.intent.action.SCREEN_ON");
            filter.addAction("android.intent.action.SCREEN_OFF");
            context.getApplicationContext().registerReceiver(this, filter);
            this._isRegistered = true;
            Logger.v(Area.USAGE.value(), "Usage: UsageScreenReceiver: screen monitor registered");
        }
    }

    protected synchronized void unregisterReceiver(Context context) {
        if (this._isRegistered) {
            context.getApplicationContext().unregisterReceiver(this);
            this._isRegistered = false;
            Logger.v(Area.USAGE.value(), "Usage: UsageScreenReceiver: screen monitor unregistered");
        }
    }
}
