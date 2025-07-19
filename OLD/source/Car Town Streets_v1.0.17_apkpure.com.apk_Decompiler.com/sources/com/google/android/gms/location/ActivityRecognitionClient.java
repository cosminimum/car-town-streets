package com.google.android.gms.location;

import android.app.PendingIntent;
import android.content.Context;
import com.google.android.gms.common.GooglePlayServicesClient;
import com.google.android.gms.internal.gn;

public class ActivityRecognitionClient implements GooglePlayServicesClient {
    private final gn xl;

    public ActivityRecognitionClient(Context context, GooglePlayServicesClient.ConnectionCallbacks connectedListener, GooglePlayServicesClient.OnConnectionFailedListener connectionFailedListener) {
        this.xl = new gn(context, connectedListener, connectionFailedListener, "activity_recognition");
    }

    public void connect() {
        this.xl.connect();
    }

    public void disconnect() {
        this.xl.disconnect();
    }

    public boolean isConnected() {
        return this.xl.isConnected();
    }

    public boolean isConnecting() {
        return this.xl.isConnecting();
    }

    public boolean isConnectionCallbacksRegistered(GooglePlayServicesClient.ConnectionCallbacks listener) {
        return this.xl.isConnectionCallbacksRegistered(listener);
    }

    public boolean isConnectionFailedListenerRegistered(GooglePlayServicesClient.OnConnectionFailedListener listener) {
        return this.xl.isConnectionFailedListenerRegistered(listener);
    }

    public void registerConnectionCallbacks(GooglePlayServicesClient.ConnectionCallbacks listener) {
        this.xl.registerConnectionCallbacks(listener);
    }

    public void registerConnectionFailedListener(GooglePlayServicesClient.OnConnectionFailedListener listener) {
        this.xl.registerConnectionFailedListener(listener);
    }

    public void removeActivityUpdates(PendingIntent callbackIntent) {
        this.xl.removeActivityUpdates(callbackIntent);
    }

    public void requestActivityUpdates(long detectionIntervalMillis, PendingIntent callbackIntent) {
        this.xl.requestActivityUpdates(detectionIntervalMillis, callbackIntent);
    }

    public void unregisterConnectionCallbacks(GooglePlayServicesClient.ConnectionCallbacks listener) {
        this.xl.unregisterConnectionCallbacks(listener);
    }

    public void unregisterConnectionFailedListener(GooglePlayServicesClient.OnConnectionFailedListener listener) {
        this.xl.unregisterConnectionFailedListener(listener);
    }
}
