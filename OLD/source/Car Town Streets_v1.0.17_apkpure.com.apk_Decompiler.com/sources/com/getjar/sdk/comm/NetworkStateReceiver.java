package com.getjar.sdk.comm;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Bundle;
import android.os.Handler;
import android.os.ResultReceiver;
import com.getjar.sdk.comm.CommManager;
import com.getjar.sdk.comm.auth.ApplicationKeyDatabase;
import com.getjar.sdk.comm.auth.AuthManager;
import com.getjar.sdk.exceptions.AuthException;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import com.getjar.sdk.utilities.StringUtility;
import java.util.Locale;

public class NetworkStateReceiver extends BroadcastReceiver {
    private static volatile NetworkStateReceiver _Instance = null;
    private volatile boolean _isRegistered = false;
    private volatile Object _registrationLock = new Object();

    private NetworkStateReceiver() {
    }

    protected static synchronized NetworkStateReceiver getInstance() {
        NetworkStateReceiver networkStateReceiver;
        synchronized (NetworkStateReceiver.class) {
            if (_Instance == null) {
                _Instance = new NetworkStateReceiver();
            }
            networkStateReceiver = _Instance;
        }
        return networkStateReceiver;
    }

    public void onReceive(Context context, Intent intent) {
        Logger.d(Area.COMM.value(), "NetworkStateReceiver: onReceive(): START");
        final Context finalContext = context;
        final Intent finalIntent = intent;
        try {
            new Thread(new Runnable() {
                public void run() {
                    try {
                        NetworkStateReceiver.this.doOnReceive(finalContext, finalIntent);
                    } catch (Exception e) {
                        Logger.e(Area.COMM.value(), "NetworkStateReceiver: onReceive() failed", e);
                    }
                }
            }, "NetworkStateReceiver Worker Thread").start();
        } catch (Exception e) {
            Logger.e(Area.COMM.value(), "PackageMonitor: onReceive() failed", e);
        }
    }

    public void doOnReceive(Context context, Intent intent) {
        try {
            String action = intent.getAction();
            if (StringUtility.isNullOrEmpty(action) || !action.equals("android.net.conn.CONNECTIVITY_CHANGE")) {
                return;
            }
            if (intent.getBooleanExtra("noConnectivity", false)) {
                Logger.i(Area.COMM.value() | Area.AUTH.value() | Area.TRANSACTION.value(), "NetworkStateReceiver: onReceive() network connection lost");
                return;
            }
            Logger.i(Area.COMM.value() | Area.AUTH.value() | Area.TRANSACTION.value(), "NetworkStateReceiver: onReceive() network connection restored");
            String applicationKey = ApplicationKeyDatabase.getInstance(context).getApplicationKey();
            if (StringUtility.isNullOrEmpty(applicationKey)) {
                throw new IllegalStateException("Unable to access the application key");
            }
            CommContext commContext = CommManager.createContext(applicationKey, context, (ResultReceiver) new ResultReceiver((Handler) null) {
                /* access modifiers changed from: protected */
                public void onReceiveResult(int resultCode, Bundle resultData) {
                    for (String key : resultData.keySet()) {
                        Logger.d(Area.COMM.value(), String.format(Locale.US, "NetworkStateReceiver: Callback from the GetJar SDK [%1$s]", new Object[]{resultData.get(key).getClass().getName()}));
                    }
                }
            }, CommManager.LaunchWork.NONE);
            AuthManager.initialize(context);
            AuthManager.getInstance().waitOnAuth();
            new TransactionManager(context).recoverOrphanedTransactions(commContext);
        } catch (AuthException e) {
            Logger.w(Area.COMM.value() | Area.AUTH.value() | Area.TRANSACTION.value(), String.format(Locale.US, "NetworkStateReceiver: onReceive() not yet authed [%1$s]", new Object[]{e.getMessage()}));
        } catch (Exception e2) {
            Logger.e(Area.COMM.value() | Area.AUTH.value() | Area.TRANSACTION.value(), "NetworkStateReceiver: onReceive() failed", e2);
        }
    }

    /* access modifiers changed from: protected */
    public void registerReceiver(Context context) {
        synchronized (this._registrationLock) {
            if (!this._isRegistered) {
                context.getApplicationContext().registerReceiver(this, new IntentFilter("android.net.conn.CONNECTIVITY_CHANGE"));
                this._isRegistered = true;
                Logger.v(Area.COMM.value(), "NetworkStateReceiver: registered");
            }
        }
    }

    /* access modifiers changed from: protected */
    public void unregisterReceiver(Context context) {
        synchronized (this._registrationLock) {
            if (this._isRegistered) {
                context.getApplicationContext().unregisterReceiver(this);
                this._isRegistered = false;
                Logger.v(Area.COMM.value(), "NetworkStateReceiver: unregistered");
            }
        }
    }
}
