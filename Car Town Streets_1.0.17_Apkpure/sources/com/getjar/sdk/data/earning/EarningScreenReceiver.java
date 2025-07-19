package com.getjar.sdk.data.earning;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
/* loaded from: classes.dex */
public class EarningScreenReceiver extends BroadcastReceiver {
    private static volatile EarningScreenReceiver _Instance = null;
    private boolean _isRegistered = false;

    private EarningScreenReceiver() {
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public static synchronized EarningScreenReceiver getInstance() {
        EarningScreenReceiver earningScreenReceiver;
        synchronized (EarningScreenReceiver.class) {
            if (_Instance == null) {
                _Instance = new EarningScreenReceiver();
            }
            earningScreenReceiver = _Instance;
        }
        return earningScreenReceiver;
    }

    @Override // android.content.BroadcastReceiver
    public void onReceive(final Context context, final Intent intent) {
        try {
            new Thread(new Runnable() { // from class: com.getjar.sdk.data.earning.EarningScreenReceiver.1
                @Override // java.lang.Runnable
                public void run() {
                    try {
                        EarningScreenReceiver.this.doOnReceive(context, intent);
                    } catch (Exception e) {
                        Logger.e(Area.EARN.value() | Area.TRANSACTION.value(), "EarningScreenReceiver: onReceive() failed", e);
                    }
                }
            }, "EarningScreenReceiver Worker Thread").start();
        } catch (Exception e) {
            Logger.e(Area.EARN.value() | Area.TRANSACTION.value(), "EarningScreenReceiver: onReceive() failed", e);
        }
    }

    public void doOnReceive(Context context, Intent intent) {
        try {
            if (intent.getAction().equals("android.intent.action.SCREEN_OFF")) {
                Logger.i(Area.EARN.value() | Area.TRANSACTION.value(), "Earning: EarningScreenReceiver: screen off");
                EarningMonitor.getInstance(context).stopMonitoring();
            } else if (intent.getAction().equals("android.intent.action.SCREEN_ON")) {
                Logger.i(Area.EARN.value() | Area.TRANSACTION.value(), "Earning: EarningScreenReceiver: screen on");
                EarningMonitor.getInstance(context).startMonitoring();
            }
        } catch (Exception e) {
            Logger.e(Area.EARN.value() | Area.TRANSACTION.value(), "EarningScreenReceiver: doOnReceive() failed", e);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public synchronized void registerReceiver(Context context) {
        if (!this._isRegistered) {
            IntentFilter filter = new IntentFilter("android.intent.action.SCREEN_ON");
            filter.addAction("android.intent.action.SCREEN_OFF");
            context.getApplicationContext().registerReceiver(this, filter);
            this._isRegistered = true;
            Logger.v(Area.EARN.value() | Area.TRANSACTION.value(), "Earning: EarningScreenReceiver: screen monitor registered");
        }
    }

    protected synchronized void unregisterReceiver(Context context) {
        if (this._isRegistered) {
            context.getApplicationContext().unregisterReceiver(this);
            this._isRegistered = false;
            Logger.v(Area.EARN.value() | Area.TRANSACTION.value(), "Earning: EarningScreenReceiver: screen monitor unregistered");
        }
    }
}
