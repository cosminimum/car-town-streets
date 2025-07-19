package com.google.android.gms.gcm;

import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.os.Messenger;
import com.google.android.gcm.GCMConstants;
import com.google.android.gms.common.GooglePlayServicesUtil;
import java.io.IOException;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.TimeUnit;

public class GoogleCloudMessaging {
    public static final String ERROR_MAIN_THREAD = "MAIN_THREAD";
    public static final String ERROR_SERVICE_NOT_AVAILABLE = "SERVICE_NOT_AVAILABLE";
    public static final String MESSAGE_TYPE_DELETED = "deleted_messages";
    public static final String MESSAGE_TYPE_MESSAGE = "gcm";
    public static final String MESSAGE_TYPE_SEND_ERROR = "send_error";

    /* renamed from: xf */
    static GoogleCloudMessaging f1897xf;

    /* renamed from: eh */
    private Context f1898eh;

    /* renamed from: xg */
    private PendingIntent f1899xg;

    /* renamed from: xh */
    final BlockingQueue<Intent> f1900xh = new LinkedBlockingQueue();

    /* renamed from: xi */
    private Handler f1901xi = new Handler(Looper.getMainLooper()) {
        public void handleMessage(Message msg) {
            GoogleCloudMessaging.this.f1900xh.add((Intent) msg.obj);
        }
    };

    /* renamed from: xj */
    private Messenger f1902xj = new Messenger(this.f1901xi);

    /* renamed from: b */
    private void m1887b(String... strArr) {
        String c = mo6973c(strArr);
        Intent intent = new Intent(GCMConstants.INTENT_TO_GCM_REGISTRATION);
        intent.setPackage(GooglePlayServicesUtil.GOOGLE_PLAY_SERVICES_PACKAGE);
        intent.putExtra("google.messenger", this.f1902xj);
        mo6974c(intent);
        intent.putExtra(GCMConstants.EXTRA_SENDER, c);
        this.f1898eh.startService(intent);
    }

    /* renamed from: dz */
    private void m1888dz() {
        Intent intent = new Intent(GCMConstants.INTENT_TO_GCM_UNREGISTRATION);
        intent.setPackage(GooglePlayServicesUtil.GOOGLE_PLAY_SERVICES_PACKAGE);
        this.f1900xh.clear();
        intent.putExtra("google.messenger", this.f1902xj);
        mo6974c(intent);
        this.f1898eh.startService(intent);
    }

    public static synchronized GoogleCloudMessaging getInstance(Context context) {
        GoogleCloudMessaging googleCloudMessaging;
        synchronized (GoogleCloudMessaging.class) {
            if (f1897xf == null) {
                f1897xf = new GoogleCloudMessaging();
                f1897xf.f1898eh = context;
            }
            googleCloudMessaging = f1897xf;
        }
        return googleCloudMessaging;
    }

    /* access modifiers changed from: package-private */
    /* renamed from: c */
    public String mo6973c(String... strArr) {
        if (strArr == null || strArr.length == 0) {
            throw new IllegalArgumentException("No senderIds");
        }
        StringBuilder sb = new StringBuilder(strArr[0]);
        for (int i = 1; i < strArr.length; i++) {
            sb.append(',').append(strArr[i]);
        }
        return sb.toString();
    }

    /* access modifiers changed from: package-private */
    /* renamed from: c */
    public synchronized void mo6974c(Intent intent) {
        if (this.f1899xg == null) {
            this.f1899xg = PendingIntent.getBroadcast(this.f1898eh, 0, new Intent(), 0);
        }
        intent.putExtra(GCMConstants.EXTRA_APPLICATION_PENDING_INTENT, this.f1899xg);
    }

    public void close() {
        mo6976dA();
    }

    /* access modifiers changed from: package-private */
    /* renamed from: dA */
    public synchronized void mo6976dA() {
        if (this.f1899xg != null) {
            this.f1899xg.cancel();
            this.f1899xg = null;
        }
    }

    public String getMessageType(Intent intent) {
        if (!GCMConstants.INTENT_FROM_GCM_MESSAGE.equals(intent.getAction())) {
            return null;
        }
        String stringExtra = intent.getStringExtra(GCMConstants.EXTRA_SPECIAL_MESSAGE);
        return stringExtra == null ? MESSAGE_TYPE_MESSAGE : stringExtra;
    }

    public String register(String... senderIds) throws IOException {
        if (Looper.getMainLooper() == Looper.myLooper()) {
            throw new IOException(ERROR_MAIN_THREAD);
        }
        this.f1900xh.clear();
        m1887b(senderIds);
        try {
            Intent poll = this.f1900xh.poll(5000, TimeUnit.MILLISECONDS);
            if (poll == null) {
                throw new IOException("SERVICE_NOT_AVAILABLE");
            }
            String stringExtra = poll.getStringExtra(GCMConstants.EXTRA_REGISTRATION_ID);
            if (stringExtra != null) {
                return stringExtra;
            }
            poll.getStringExtra(GCMConstants.EXTRA_ERROR);
            String stringExtra2 = poll.getStringExtra(GCMConstants.EXTRA_ERROR);
            if (stringExtra2 != null) {
                throw new IOException(stringExtra2);
            }
            throw new IOException("SERVICE_NOT_AVAILABLE");
        } catch (InterruptedException e) {
            throw new IOException(e.getMessage());
        }
    }

    public void send(String to, String msgId, long timeToLive, Bundle data) throws IOException {
        if (Looper.getMainLooper() == Looper.myLooper()) {
            throw new IOException(ERROR_MAIN_THREAD);
        } else if (to == null) {
            throw new IllegalArgumentException("Missing 'to'");
        } else {
            Intent intent = new Intent("com.google.android.gcm.intent.SEND");
            intent.putExtras(data);
            mo6974c(intent);
            intent.putExtra("google.to", to);
            intent.putExtra("google.message_id", msgId);
            intent.putExtra("google.ttl", Long.toString(timeToLive));
            this.f1898eh.sendOrderedBroadcast(intent, (String) null);
        }
    }

    public void send(String to, String msgId, Bundle data) throws IOException {
        send(to, msgId, -1, data);
    }

    public void unregister() throws IOException {
        if (Looper.getMainLooper() == Looper.myLooper()) {
            throw new IOException(ERROR_MAIN_THREAD);
        }
        m1888dz();
        try {
            Intent poll = this.f1900xh.poll(5000, TimeUnit.MILLISECONDS);
            if (poll == null) {
                throw new IOException("SERVICE_NOT_AVAILABLE");
            } else if (poll.getStringExtra(GCMConstants.EXTRA_UNREGISTERED) == null) {
                String stringExtra = poll.getStringExtra(GCMConstants.EXTRA_ERROR);
                if (stringExtra != null) {
                    throw new IOException(stringExtra);
                }
                throw new IOException("SERVICE_NOT_AVAILABLE");
            }
        } catch (InterruptedException e) {
            throw new IOException(e.getMessage());
        }
    }
}
