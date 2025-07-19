package com.google.android.gms.internal;

import android.app.PendingIntent;
import android.content.Context;
import android.location.Location;
import android.os.Bundle;
import android.os.IBinder;
import android.os.Looper;
import android.os.RemoteException;
import android.util.Log;
import com.google.android.gms.common.GooglePlayServicesClient;
import com.google.android.gms.common.GooglePlayServicesUtil;
import com.google.android.gms.internal.dw;
import com.google.android.gms.internal.gk;
import com.google.android.gms.internal.gl;
import com.google.android.gms.location.LocationClient;
import com.google.android.gms.location.LocationListener;
import com.google.android.gms.location.LocationRequest;
import com.google.android.gms.location.LocationStatusCodes;
import java.util.HashMap;
import java.util.List;
/* loaded from: classes.dex */
public class gn extends dw<gl> {
    private final gm xV;
    private final String xX;
    private final gq<gl> xP = new c();
    private final HashMap xW = new HashMap();
    private final String jG = null;

    /* loaded from: classes.dex */
    private final class a extends dw<gl>.b<LocationClient.OnAddGeofencesResultListener> {
        private final int mC;
        private final String[] xY;

        public a(LocationClient.OnAddGeofencesResultListener onAddGeofencesResultListener, int i, String[] strArr) {
            super(onAddGeofencesResultListener);
            this.mC = LocationStatusCodes.aR(i);
            this.xY = strArr;
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.android.gms.internal.dw.b
        /* renamed from: a */
        public void b(LocationClient.OnAddGeofencesResultListener onAddGeofencesResultListener) {
            if (onAddGeofencesResultListener != null) {
                onAddGeofencesResultListener.onAddGeofencesResult(this.mC, this.xY);
            }
        }

        @Override // com.google.android.gms.internal.dw.b
        protected void aL() {
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public static final class b extends gk.a {
        private LocationClient.OnAddGeofencesResultListener ya;
        private LocationClient.OnRemoveGeofencesResultListener yb;
        private gn yc;

        public b(LocationClient.OnAddGeofencesResultListener onAddGeofencesResultListener, gn gnVar) {
            this.ya = onAddGeofencesResultListener;
            this.yb = null;
            this.yc = gnVar;
        }

        public b(LocationClient.OnRemoveGeofencesResultListener onRemoveGeofencesResultListener, gn gnVar) {
            this.yb = onRemoveGeofencesResultListener;
            this.ya = null;
            this.yc = gnVar;
        }

        @Override // com.google.android.gms.internal.gk
        public void onAddGeofencesResult(int statusCode, String[] geofenceRequestIds) throws RemoteException {
            if (this.yc == null) {
                Log.wtf("LocationClientImpl", "onAddGeofenceResult called multiple times");
                return;
            }
            gn gnVar = this.yc;
            gn gnVar2 = this.yc;
            gnVar2.getClass();
            gnVar.a(new a(this.ya, statusCode, geofenceRequestIds));
            this.yc = null;
            this.ya = null;
            this.yb = null;
        }

        @Override // com.google.android.gms.internal.gk
        public void onRemoveGeofencesByPendingIntentResult(int statusCode, PendingIntent pendingIntent) {
            if (this.yc == null) {
                Log.wtf("LocationClientImpl", "onRemoveGeofencesByPendingIntentResult called multiple times");
                return;
            }
            gn gnVar = this.yc;
            gn gnVar2 = this.yc;
            gnVar2.getClass();
            gnVar.a(new d(gnVar2, 1, this.yb, statusCode, pendingIntent));
            this.yc = null;
            this.ya = null;
            this.yb = null;
        }

        @Override // com.google.android.gms.internal.gk
        public void onRemoveGeofencesByRequestIdsResult(int statusCode, String[] geofenceRequestIds) {
            if (this.yc == null) {
                Log.wtf("LocationClientImpl", "onRemoveGeofencesByRequestIdsResult called multiple times");
                return;
            }
            gn gnVar = this.yc;
            gn gnVar2 = this.yc;
            gnVar2.getClass();
            gnVar.a(new d(2, this.yb, statusCode, geofenceRequestIds));
            this.yc = null;
            this.ya = null;
            this.yb = null;
        }
    }

    /* loaded from: classes.dex */
    private final class c implements gq<gl> {
        private c() {
        }

        @Override // com.google.android.gms.internal.gq
        public void bP() {
            gn.this.bP();
        }

        @Override // com.google.android.gms.internal.gq
        /* renamed from: dJ */
        public gl bQ() {
            return (gl) gn.this.bQ();
        }
    }

    /* loaded from: classes.dex */
    private final class d extends dw<gl>.b<LocationClient.OnRemoveGeofencesResultListener> {
        private final int mC;
        private final PendingIntent mPendingIntent;
        private final String[] xY;
        private final int yd;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public d(gn gnVar, int i, LocationClient.OnRemoveGeofencesResultListener onRemoveGeofencesResultListener, int i2, PendingIntent pendingIntent) {
            super(onRemoveGeofencesResultListener);
            boolean z = true;
            gn.this = gnVar;
            ds.p(i != 1 ? false : z);
            this.yd = i;
            this.mC = LocationStatusCodes.aR(i2);
            this.mPendingIntent = pendingIntent;
            this.xY = null;
        }

        public d(int i, LocationClient.OnRemoveGeofencesResultListener onRemoveGeofencesResultListener, int i2, String[] strArr) {
            super(onRemoveGeofencesResultListener);
            ds.p(i == 2);
            this.yd = i;
            this.mC = LocationStatusCodes.aR(i2);
            this.xY = strArr;
            this.mPendingIntent = null;
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.android.gms.internal.dw.b
        /* renamed from: a */
        public void b(LocationClient.OnRemoveGeofencesResultListener onRemoveGeofencesResultListener) {
            if (onRemoveGeofencesResultListener != null) {
                switch (this.yd) {
                    case 1:
                        onRemoveGeofencesResultListener.onRemoveGeofencesByPendingIntentResult(this.mC, this.mPendingIntent);
                        return;
                    case 2:
                        onRemoveGeofencesResultListener.onRemoveGeofencesByRequestIdsResult(this.mC, this.xY);
                        return;
                    default:
                        Log.wtf("LocationClientImpl", "Unsupported action: " + this.yd);
                        return;
                }
            }
        }

        @Override // com.google.android.gms.internal.dw.b
        protected void aL() {
        }
    }

    public gn(Context context, GooglePlayServicesClient.ConnectionCallbacks connectionCallbacks, GooglePlayServicesClient.OnConnectionFailedListener onConnectionFailedListener, String str) {
        super(context, connectionCallbacks, onConnectionFailedListener, new String[0]);
        this.xV = new gm(context, this.xP);
        this.xX = str;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.google.android.gms.internal.dw
    /* renamed from: M */
    public gl p(IBinder iBinder) {
        return gl.a.L(iBinder);
    }

    @Override // com.google.android.gms.internal.dw
    protected void a(ec ecVar, dw.e eVar) throws RemoteException {
        Bundle bundle = new Bundle();
        bundle.putString("client_name", this.xX);
        ecVar.e(eVar, GooglePlayServicesUtil.GOOGLE_PLAY_SERVICES_VERSION_CODE, getContext().getPackageName(), bundle);
    }

    public void addGeofences(List<go> geofences, PendingIntent pendingIntent, LocationClient.OnAddGeofencesResultListener listener) {
        b bVar;
        bP();
        eg.b(geofences != null && geofences.size() > 0, "At least one geofence must be specified.");
        eg.b(pendingIntent, "PendingIntent must be specified.");
        eg.b(listener, "OnAddGeofencesResultListener not provided.");
        if (listener == null) {
            bVar = null;
        } else {
            try {
                bVar = new b(listener, this);
            } catch (RemoteException e) {
                throw new IllegalStateException(e);
            }
        }
        bQ().a(geofences, pendingIntent, bVar, getContext().getPackageName());
    }

    @Override // com.google.android.gms.internal.dw
    protected String am() {
        return "com.google.android.location.internal.GoogleLocationManagerService.START";
    }

    @Override // com.google.android.gms.internal.dw
    protected String an() {
        return "com.google.android.gms.location.internal.IGoogleLocationManagerService";
    }

    @Override // com.google.android.gms.internal.dw, com.google.android.gms.common.GooglePlayServicesClient
    public void disconnect() {
        synchronized (this.xV) {
            if (isConnected()) {
                this.xV.removeAllListeners();
                this.xV.dI();
            }
            super.disconnect();
        }
    }

    public Location getLastLocation() {
        return this.xV.getLastLocation();
    }

    public void removeActivityUpdates(PendingIntent callbackIntent) {
        bP();
        eg.f(callbackIntent);
        try {
            bQ().removeActivityUpdates(callbackIntent);
        } catch (RemoteException e) {
            throw new IllegalStateException(e);
        }
    }

    public void removeGeofences(PendingIntent pendingIntent, LocationClient.OnRemoveGeofencesResultListener listener) {
        b bVar;
        bP();
        eg.b(pendingIntent, "PendingIntent must be specified.");
        eg.b(listener, "OnRemoveGeofencesResultListener not provided.");
        if (listener == null) {
            bVar = null;
        } else {
            try {
                bVar = new b(listener, this);
            } catch (RemoteException e) {
                throw new IllegalStateException(e);
            }
        }
        bQ().a(pendingIntent, bVar, getContext().getPackageName());
    }

    public void removeGeofences(List<String> geofenceRequestIds, LocationClient.OnRemoveGeofencesResultListener listener) {
        b bVar;
        bP();
        eg.b(geofenceRequestIds != null && geofenceRequestIds.size() > 0, "geofenceRequestIds can't be null nor empty.");
        eg.b(listener, "OnRemoveGeofencesResultListener not provided.");
        String[] strArr = (String[]) geofenceRequestIds.toArray(new String[0]);
        if (listener == null) {
            bVar = null;
        } else {
            try {
                bVar = new b(listener, this);
            } catch (RemoteException e) {
                throw new IllegalStateException(e);
            }
        }
        bQ().a(strArr, bVar, getContext().getPackageName());
    }

    public void removeLocationUpdates(PendingIntent callbackIntent) {
        this.xV.removeLocationUpdates(callbackIntent);
    }

    public void removeLocationUpdates(LocationListener listener) {
        this.xV.removeLocationUpdates(listener);
    }

    public void requestActivityUpdates(long detectionIntervalMillis, PendingIntent callbackIntent) {
        boolean z = true;
        bP();
        eg.f(callbackIntent);
        if (detectionIntervalMillis < 0) {
            z = false;
        }
        eg.b(z, "detectionIntervalMillis must be >= 0");
        try {
            bQ().a(detectionIntervalMillis, true, callbackIntent);
        } catch (RemoteException e) {
            throw new IllegalStateException(e);
        }
    }

    public void requestLocationUpdates(LocationRequest request, PendingIntent callbackIntent) {
        this.xV.requestLocationUpdates(request, callbackIntent);
    }

    public void requestLocationUpdates(LocationRequest request, LocationListener listener) {
        requestLocationUpdates(request, listener, null);
    }

    public void requestLocationUpdates(LocationRequest request, LocationListener listener, Looper looper) {
        synchronized (this.xV) {
            this.xV.requestLocationUpdates(request, listener, looper);
        }
    }

    public void setMockLocation(Location mockLocation) {
        this.xV.setMockLocation(mockLocation);
    }

    public void setMockMode(boolean isMockMode) {
        this.xV.setMockMode(isMockMode);
    }
}
