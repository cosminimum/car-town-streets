package com.google.android.gms.panorama;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.GooglePlayServicesClient;
import com.google.android.gms.common.api.a;
import com.google.android.gms.internal.hm;
import com.google.android.gms.panorama.Panorama;
/* loaded from: classes.dex */
public class PanoramaClient implements GooglePlayServicesClient {
    private final hm Di;

    /* loaded from: classes.dex */
    public interface OnPanoramaInfoLoadedListener {
        void onPanoramaInfoLoaded(ConnectionResult connectionResult, Intent intent);
    }

    public PanoramaClient(Context context, GooglePlayServicesClient.ConnectionCallbacks connectionCallbacks, GooglePlayServicesClient.OnConnectionFailedListener connectionFailedListener) {
        this.Di = new hm(context, connectionCallbacks, connectionFailedListener);
    }

    @Override // com.google.android.gms.common.GooglePlayServicesClient
    public void connect() {
        this.Di.connect();
    }

    @Override // com.google.android.gms.common.GooglePlayServicesClient
    public void disconnect() {
        this.Di.disconnect();
    }

    @Override // com.google.android.gms.common.GooglePlayServicesClient
    public boolean isConnected() {
        return this.Di.isConnected();
    }

    @Override // com.google.android.gms.common.GooglePlayServicesClient
    public boolean isConnecting() {
        return this.Di.isConnecting();
    }

    @Override // com.google.android.gms.common.GooglePlayServicesClient
    public boolean isConnectionCallbacksRegistered(GooglePlayServicesClient.ConnectionCallbacks listener) {
        return this.Di.isConnectionCallbacksRegistered(listener);
    }

    @Override // com.google.android.gms.common.GooglePlayServicesClient
    public boolean isConnectionFailedListenerRegistered(GooglePlayServicesClient.OnConnectionFailedListener listener) {
        return this.Di.isConnectionFailedListenerRegistered(listener);
    }

    public void loadPanoramaInfo(final OnPanoramaInfoLoadedListener listener, Uri uri) {
        this.Di.a(new a.c<Panorama.PanoramaResult>() { // from class: com.google.android.gms.panorama.PanoramaClient.1
            @Override // com.google.android.gms.common.api.a.c
            public void a(Panorama.PanoramaResult panoramaResult) {
                listener.onPanoramaInfoLoaded(panoramaResult.getStatus().bu(), panoramaResult.getViewerIntent());
            }
        }, uri, false);
    }

    public void loadPanoramaInfoAndGrantAccess(final OnPanoramaInfoLoadedListener listener, Uri uri) {
        this.Di.a(new a.c<Panorama.PanoramaResult>() { // from class: com.google.android.gms.panorama.PanoramaClient.2
            @Override // com.google.android.gms.common.api.a.c
            public void a(Panorama.PanoramaResult panoramaResult) {
                listener.onPanoramaInfoLoaded(panoramaResult.getStatus().bu(), panoramaResult.getViewerIntent());
            }
        }, uri, true);
    }

    @Override // com.google.android.gms.common.GooglePlayServicesClient
    public void registerConnectionCallbacks(GooglePlayServicesClient.ConnectionCallbacks listener) {
        this.Di.registerConnectionCallbacks(listener);
    }

    @Override // com.google.android.gms.common.GooglePlayServicesClient
    public void registerConnectionFailedListener(GooglePlayServicesClient.OnConnectionFailedListener listener) {
        this.Di.registerConnectionFailedListener(listener);
    }

    @Override // com.google.android.gms.common.GooglePlayServicesClient
    public void unregisterConnectionCallbacks(GooglePlayServicesClient.ConnectionCallbacks listener) {
        this.Di.unregisterConnectionCallbacks(listener);
    }

    @Override // com.google.android.gms.common.GooglePlayServicesClient
    public void unregisterConnectionFailedListener(GooglePlayServicesClient.OnConnectionFailedListener listener) {
        this.Di.unregisterConnectionFailedListener(listener);
    }
}
