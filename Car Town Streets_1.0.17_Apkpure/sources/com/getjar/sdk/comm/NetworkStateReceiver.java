package com.getjar.sdk.comm;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Bundle;
import android.os.ResultReceiver;
import com.getjar.sdk.comm.CommManager;
import com.getjar.sdk.comm.auth.ApplicationKeyDatabase;
import com.getjar.sdk.comm.auth.AuthManager;
import com.getjar.sdk.exceptions.AuthException;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import com.getjar.sdk.utilities.StringUtility;
import java.util.Locale;
/* loaded from: classes.dex */
public class NetworkStateReceiver extends BroadcastReceiver {
    private static volatile NetworkStateReceiver _Instance = null;
    private volatile Object _registrationLock = new Object();
    private volatile boolean _isRegistered = false;

    private NetworkStateReceiver() {
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public static synchronized NetworkStateReceiver getInstance() {
        NetworkStateReceiver networkStateReceiver;
        synchronized (NetworkStateReceiver.class) {
            if (_Instance == null) {
                _Instance = new NetworkStateReceiver();
            }
            networkStateReceiver = _Instance;
        }
        return networkStateReceiver;
    }

    @Override // android.content.BroadcastReceiver
    public void onReceive(final Context context, final Intent intent) {
        Logger.d(Area.COMM.value(), "NetworkStateReceiver: onReceive(): START");
        try {
            new Thread(new Runnable() { // from class: com.getjar.sdk.comm.NetworkStateReceiver.1
                @Override // java.lang.Runnable
                public void run() {
                    try {
                        NetworkStateReceiver.this.doOnReceive(context, intent);
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
            if (!StringUtility.isNullOrEmpty(action) && action.equals("android.net.conn.CONNECTIVITY_CHANGE")) {
                boolean noConnectivity = intent.getBooleanExtra("noConnectivity", false);
                if (noConnectivity) {
                    Logger.i(Area.COMM.value() | Area.AUTH.value() | Area.TRANSACTION.value(), "NetworkStateReceiver: onReceive() network connection lost");
                    return;
                }
                Logger.i(Area.COMM.value() | Area.AUTH.value() | Area.TRANSACTION.value(), "NetworkStateReceiver: onReceive() network connection restored");
                String applicationKey = ApplicationKeyDatabase.getInstance(context).getApplicationKey();
                if (StringUtility.isNullOrEmpty(applicationKey)) {
                    throw new IllegalStateException("Unable to access the application key");
                }
                CommContext commContext = CommManager.createContext(applicationKey, context, new ResultReceiver(null) { // from class: com.getjar.sdk.comm.NetworkStateReceiver.2
                    @Override // android.os.ResultReceiver
                    protected void onReceiveResult(int resultCode, Bundle resultData) {
                        for (String key : resultData.keySet()) {
                            Logger.d(Area.COMM.value(), String.format(Locale.US, "NetworkStateReceiver: Callback from the GetJar SDK [%1$s]", resultData.get(key).getClass().getName()));
                        }
                    }
                }, CommManager.LaunchWork.NONE);
                AuthManager.initialize(context);
                AuthManager.getInstance().waitOnAuth();
                TransactionManager transactionManager = new TransactionManager(context);
                transactionManager.recoverOrphanedTransactions(commContext);
            }
        } catch (AuthException e) {
            Logger.w(Area.COMM.value() | Area.AUTH.value() | Area.TRANSACTION.value(), String.format(Locale.US, "NetworkStateReceiver: onReceive() not yet authed [%1$s]", e.getMessage()));
        } catch (Exception e2) {
            Logger.e(Area.COMM.value() | Area.AUTH.value() | Area.TRANSACTION.value(), "NetworkStateReceiver: onReceive() failed", e2);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void registerReceiver(Context context) {
        synchronized (this._registrationLock) {
            if (!this._isRegistered) {
                IntentFilter filter = new IntentFilter("android.net.conn.CONNECTIVITY_CHANGE");
                context.getApplicationContext().registerReceiver(this, filter);
                this._isRegistered = true;
                Logger.v(Area.COMM.value(), "NetworkStateReceiver: registered");
            }
        }
    }

    protected void unregisterReceiver(Context context) {
        synchronized (this._registrationLock) {
            if (this._isRegistered) {
                context.getApplicationContext().unregisterReceiver(this);
                this._isRegistered = false;
                Logger.v(Area.COMM.value(), "NetworkStateReceiver: unregistered");
            }
        }
    }
}
