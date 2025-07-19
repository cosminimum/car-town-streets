package com.facebook;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.Bundle;
import android.os.Handler;
import android.os.IBinder;
import android.os.Message;
import android.os.Messenger;
import android.os.RemoteException;
/* loaded from: classes.dex */
final class GetTokenClient implements ServiceConnection {
    final String applicationId;
    final Context context;
    final Handler handler;
    CompletedListener listener;
    boolean running;
    Messenger sender;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public interface CompletedListener {
        void completed(Bundle bundle);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public GetTokenClient(Context context, String applicationId) {
        Context applicationContext = context.getApplicationContext();
        this.context = applicationContext == null ? context : applicationContext;
        this.applicationId = applicationId;
        this.handler = new Handler() { // from class: com.facebook.GetTokenClient.1
            @Override // android.os.Handler
            public void handleMessage(Message message) {
                GetTokenClient.this.handleMessage(message);
            }
        };
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setCompletedListener(CompletedListener listener) {
        this.listener = listener;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean start() {
        Intent intent = new Intent("com.facebook.platform.PLATFORM_SERVICE");
        intent.addCategory("android.intent.category.DEFAULT");
        Intent intent2 = NativeProtocol.validateKatanaServiceIntent(this.context, intent);
        if (intent2 == null) {
            callback(null);
            return false;
        }
        this.running = true;
        this.context.bindService(intent2, this, 1);
        return true;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void cancel() {
        this.running = false;
    }

    @Override // android.content.ServiceConnection
    public void onServiceConnected(ComponentName name, IBinder service) {
        this.sender = new Messenger(service);
        getToken();
    }

    @Override // android.content.ServiceConnection
    public void onServiceDisconnected(ComponentName name) {
        this.sender = null;
        this.context.unbindService(this);
        callback(null);
    }

    private void getToken() {
        Bundle data = new Bundle();
        data.putString("com.facebook.platform.extra.APPLICATION_ID", this.applicationId);
        Message request = Message.obtain((Handler) null, 65536);
        request.arg1 = 20121101;
        request.setData(data);
        request.replyTo = new Messenger(this.handler);
        try {
            this.sender.send(request);
        } catch (RemoteException e) {
            callback(null);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void handleMessage(Message message) {
        if (message.what == 65537) {
            Bundle extras = message.getData();
            String errorType = extras.getString("com.facebook.platform.status.ERROR_TYPE");
            if (errorType != null) {
                callback(null);
            } else {
                callback(extras);
            }
            this.context.unbindService(this);
        }
    }

    private void callback(Bundle result) {
        if (this.running) {
            this.running = false;
            CompletedListener callback = this.listener;
            if (callback != null) {
                callback.completed(result);
            }
        }
    }
}
