package com.google.android.gms.location;

import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.location.Location;
import android.os.Looper;
import com.google.android.gms.common.GooglePlayServicesClient;
import com.google.android.gms.internal.eg;
import com.google.android.gms.internal.gn;
import com.google.android.gms.internal.go;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class LocationClient implements GooglePlayServicesClient {
    public static final String KEY_LOCATION_CHANGED = "com.google.android.location.LOCATION";
    public static final String KEY_MOCK_LOCATION = "mockLocation";
    private final gn xl;

    public interface OnAddGeofencesResultListener {
        void onAddGeofencesResult(int i, String[] strArr);
    }

    public interface OnRemoveGeofencesResultListener {
        void onRemoveGeofencesByPendingIntentResult(int i, PendingIntent pendingIntent);

        void onRemoveGeofencesByRequestIdsResult(int i, String[] strArr);
    }

    public LocationClient(Context context, GooglePlayServicesClient.ConnectionCallbacks connectionCallbacks, GooglePlayServicesClient.OnConnectionFailedListener connectionFailedListener) {
        this.xl = new gn(context, connectionCallbacks, connectionFailedListener, "location");
    }

    public static int getErrorCode(Intent intent) {
        return intent.getIntExtra("gms_error_code", -1);
    }

    public static int getGeofenceTransition(Intent intent) {
        int intExtra = intent.getIntExtra("com.google.android.location.intent.extra.transition", -1);
        if (intExtra == -1) {
            return -1;
        }
        if (intExtra == 1 || intExtra == 2 || intExtra == 4) {
            return intExtra;
        }
        return -1;
    }

    public static List<Geofence> getTriggeringGeofences(Intent intent) {
        ArrayList arrayList = (ArrayList) intent.getSerializableExtra("com.google.android.location.intent.extra.geofence_list");
        if (arrayList == null) {
            return null;
        }
        ArrayList arrayList2 = new ArrayList(arrayList.size());
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            arrayList2.add(go.f((byte[]) it.next()));
        }
        return arrayList2;
    }

    public static boolean hasError(Intent intent) {
        return intent.hasExtra("gms_error_code");
    }

    public void addGeofences(List<Geofence> geofences, PendingIntent pendingIntent, OnAddGeofencesResultListener listener) {
        ArrayList arrayList = null;
        if (geofences != null) {
            ArrayList arrayList2 = new ArrayList();
            for (Geofence next : geofences) {
                eg.b(next instanceof go, (Object) "Geofence must be created using Geofence.Builder.");
                arrayList2.add((go) next);
            }
            arrayList = arrayList2;
        }
        this.xl.addGeofences(arrayList, pendingIntent, listener);
    }

    public void connect() {
        this.xl.connect();
    }

    public void disconnect() {
        this.xl.disconnect();
    }

    public Location getLastLocation() {
        return this.xl.getLastLocation();
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

    public void removeGeofences(PendingIntent pendingIntent, OnRemoveGeofencesResultListener listener) {
        this.xl.removeGeofences(pendingIntent, listener);
    }

    public void removeGeofences(List<String> geofenceRequestIds, OnRemoveGeofencesResultListener listener) {
        this.xl.removeGeofences(geofenceRequestIds, listener);
    }

    public void removeLocationUpdates(PendingIntent callbackIntent) {
        this.xl.removeLocationUpdates(callbackIntent);
    }

    public void removeLocationUpdates(LocationListener listener) {
        this.xl.removeLocationUpdates(listener);
    }

    public void requestLocationUpdates(LocationRequest request, PendingIntent callbackIntent) {
        this.xl.requestLocationUpdates(request, callbackIntent);
    }

    public void requestLocationUpdates(LocationRequest request, LocationListener listener) {
        this.xl.requestLocationUpdates(request, listener);
    }

    public void requestLocationUpdates(LocationRequest request, LocationListener listener, Looper looper) {
        this.xl.requestLocationUpdates(request, listener, looper);
    }

    public void setMockLocation(Location mockLocation) {
        this.xl.setMockLocation(mockLocation);
    }

    public void setMockMode(boolean isMockMode) {
        this.xl.setMockMode(isMockMode);
    }

    public void unregisterConnectionCallbacks(GooglePlayServicesClient.ConnectionCallbacks listener) {
        this.xl.unregisterConnectionCallbacks(listener);
    }

    public void unregisterConnectionFailedListener(GooglePlayServicesClient.OnConnectionFailedListener listener) {
        this.xl.unregisterConnectionFailedListener(listener);
    }
}
