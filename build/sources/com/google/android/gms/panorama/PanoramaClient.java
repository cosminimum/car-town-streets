package com.google.android.gms.panorama;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.GooglePlayServicesClient;
import com.google.android.gms.common.api.C0655a;
import com.google.android.gms.internal.C1351hm;
import com.google.android.gms.panorama.Panorama;

public class PanoramaClient implements GooglePlayServicesClient {

    /* renamed from: Di */
    private final C1351hm f3709Di;

    public interface OnPanoramaInfoLoadedListener {
        void onPanoramaInfoLoaded(ConnectionResult connectionResult, Intent intent);
    }

    public PanoramaClient(Context context, GooglePlayServicesClient.ConnectionCallbacks connectionCallbacks, GooglePlayServicesClient.OnConnectionFailedListener connectionFailedListener) {
        this.f3709Di = new C1351hm(context, connectionCallbacks, connectionFailedListener);
    }

    public void connect() {
        this.f3709Di.connect();
    }

    public void disconnect() {
        this.f3709Di.disconnect();
    }

    public boolean isConnected() {
        return this.f3709Di.isConnected();
    }

    public boolean isConnecting() {
        return this.f3709Di.isConnecting();
    }

    public boolean isConnectionCallbacksRegistered(GooglePlayServicesClient.ConnectionCallbacks listener) {
        return this.f3709Di.isConnectionCallbacksRegistered(listener);
    }

    public boolean isConnectionFailedListenerRegistered(GooglePlayServicesClient.OnConnectionFailedListener listener) {
        return this.f3709Di.isConnectionFailedListenerRegistered(listener);
    }

    public void loadPanoramaInfo(final OnPanoramaInfoLoadedListener listener, Uri uri) {
        this.f3709Di.mo8240a(new C0655a.C0659c<Panorama.PanoramaResult>() {
            /* renamed from: a */
            public void mo5612a(Panorama.PanoramaResult panoramaResult) {
                listener.onPanoramaInfoLoaded(panoramaResult.getStatus().mo5908bu(), panoramaResult.getViewerIntent());
            }
        }, uri, false);
    }

    public void loadPanoramaInfoAndGrantAccess(final OnPanoramaInfoLoadedListener listener, Uri uri) {
        this.f3709Di.mo8240a(new C0655a.C0659c<Panorama.PanoramaResult>() {
            /* renamed from: a */
            public void mo5612a(Panorama.PanoramaResult panoramaResult) {
                listener.onPanoramaInfoLoaded(panoramaResult.getStatus().mo5908bu(), panoramaResult.getViewerIntent());
            }
        }, uri, true);
    }

    public void registerConnectionCallbacks(GooglePlayServicesClient.ConnectionCallbacks listener) {
        this.f3709Di.registerConnectionCallbacks(listener);
    }

    public void registerConnectionFailedListener(GooglePlayServicesClient.OnConnectionFailedListener listener) {
        this.f3709Di.registerConnectionFailedListener(listener);
    }

    public void unregisterConnectionCallbacks(GooglePlayServicesClient.ConnectionCallbacks listener) {
        this.f3709Di.unregisterConnectionCallbacks(listener);
    }

    public void unregisterConnectionFailedListener(GooglePlayServicesClient.OnConnectionFailedListener listener) {
        this.f3709Di.unregisterConnectionFailedListener(listener);
    }
}
