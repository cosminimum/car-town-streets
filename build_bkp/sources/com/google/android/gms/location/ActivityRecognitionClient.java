package com.google.android.gms.location;

import android.app.PendingIntent;
import android.content.Context;
import com.google.android.gms.common.GooglePlayServicesClient;
import com.google.android.gms.internal.C1312gn;

public class ActivityRecognitionClient implements GooglePlayServicesClient {

    /* renamed from: xl */
    private final C1312gn f3489xl;

    public ActivityRecognitionClient(Context context, GooglePlayServicesClient.ConnectionCallbacks connectedListener, GooglePlayServicesClient.OnConnectionFailedListener connectionFailedListener) {
        this.f3489xl = new C1312gn(context, connectedListener, connectionFailedListener, "activity_recognition");
    }

    public void connect() {
        this.f3489xl.connect();
    }

    public void disconnect() {
        this.f3489xl.disconnect();
    }

    public boolean isConnected() {
        return this.f3489xl.isConnected();
    }

    public boolean isConnecting() {
        return this.f3489xl.isConnecting();
    }

    public boolean isConnectionCallbacksRegistered(GooglePlayServicesClient.ConnectionCallbacks listener) {
        return this.f3489xl.isConnectionCallbacksRegistered(listener);
    }

    public boolean isConnectionFailedListenerRegistered(GooglePlayServicesClient.OnConnectionFailedListener listener) {
        return this.f3489xl.isConnectionFailedListenerRegistered(listener);
    }

    public void registerConnectionCallbacks(GooglePlayServicesClient.ConnectionCallbacks listener) {
        this.f3489xl.registerConnectionCallbacks(listener);
    }

    public void registerConnectionFailedListener(GooglePlayServicesClient.OnConnectionFailedListener listener) {
        this.f3489xl.registerConnectionFailedListener(listener);
    }

    public void removeActivityUpdates(PendingIntent callbackIntent) {
        this.f3489xl.removeActivityUpdates(callbackIntent);
    }

    public void requestActivityUpdates(long detectionIntervalMillis, PendingIntent callbackIntent) {
        this.f3489xl.requestActivityUpdates(detectionIntervalMillis, callbackIntent);
    }

    public void unregisterConnectionCallbacks(GooglePlayServicesClient.ConnectionCallbacks listener) {
        this.f3489xl.unregisterConnectionCallbacks(listener);
    }

    public void unregisterConnectionFailedListener(GooglePlayServicesClient.OnConnectionFailedListener listener) {
        this.f3489xl.unregisterConnectionFailedListener(listener);
    }
}
