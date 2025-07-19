package com.google.android.gms.panorama;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.GooglePlayServicesClient;
import com.google.android.gms.common.api.a;
import com.google.android.gms.internal.hm;
import com.google.android.gms.panorama.Panorama;

public class PanoramaClient implements GooglePlayServicesClient {
    private final hm Di;

    public interface OnPanoramaInfoLoadedListener {
        void onPanoramaInfoLoaded(ConnectionResult connectionResult, Intent intent);
    }

    public PanoramaClient(Context context, GooglePlayServicesClient.ConnectionCallbacks connectionCallbacks, GooglePlayServicesClient.OnConnectionFailedListener connectionFailedListener) {
        this.Di = new hm(context, connectionCallbacks, connectionFailedListener);
    }

    public void connect() {
        this.Di.connect();
    }

    public void disconnect() {
        this.Di.disconnect();
    }

    public boolean isConnected() {
        return this.Di.isConnected();
    }

    public boolean isConnecting() {
        return this.Di.isConnecting();
    }

    public boolean isConnectionCallbacksRegistered(GooglePlayServicesClient.ConnectionCallbacks listener) {
        return this.Di.isConnectionCallbacksRegistered(listener);
    }

    public boolean isConnectionFailedListenerRegistered(GooglePlayServicesClient.OnConnectionFailedListener listener) {
        return this.Di.isConnectionFailedListenerRegistered(listener);
    }

    public void loadPanoramaInfo(final OnPanoramaInfoLoadedListener listener, Uri uri) {
        this.Di.a(new a.c<Panorama.PanoramaResult>() {
            public void a(Panorama.PanoramaResult panoramaResult) {
                listener.onPanoramaInfoLoaded(panoramaResult.getStatus().bu(), panoramaResult.getViewerIntent());
            }
        }, uri, false);
    }

    public void loadPanoramaInfoAndGrantAccess(final OnPanoramaInfoLoadedListener listener, Uri uri) {
        this.Di.a(new a.c<Panorama.PanoramaResult>() {
            public void a(Panorama.PanoramaResult panoramaResult) {
                listener.onPanoramaInfoLoaded(panoramaResult.getStatus().bu(), panoramaResult.getViewerIntent());
            }
        }, uri, true);
    }

    public void registerConnectionCallbacks(GooglePlayServicesClient.ConnectionCallbacks listener) {
        this.Di.registerConnectionCallbacks(listener);
    }

    public void registerConnectionFailedListener(GooglePlayServicesClient.OnConnectionFailedListener listener) {
        this.Di.registerConnectionFailedListener(listener);
    }

    public void unregisterConnectionCallbacks(GooglePlayServicesClient.ConnectionCallbacks listener) {
        this.Di.unregisterConnectionCallbacks(listener);
    }

    public void unregisterConnectionFailedListener(GooglePlayServicesClient.OnConnectionFailedListener listener) {
        this.Di.unregisterConnectionFailedListener(listener);
    }
}
