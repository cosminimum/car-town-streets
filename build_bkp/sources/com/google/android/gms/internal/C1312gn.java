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
import com.google.android.gms.internal.C1071dw;
import com.google.android.gms.internal.C1303gk;
import com.google.android.gms.internal.C1306gl;
import com.google.android.gms.location.LocationClient;
import com.google.android.gms.location.LocationListener;
import com.google.android.gms.location.LocationRequest;
import com.google.android.gms.location.LocationStatusCodes;
import java.util.HashMap;
import java.util.List;

/* renamed from: com.google.android.gms.internal.gn */
public class C1312gn extends C1071dw<C1306gl> {

    /* renamed from: jG */
    private final String f2977jG;

    /* renamed from: xP */
    private final C1320gq<C1306gl> f2978xP = new C1316c();

    /* renamed from: xV */
    private final C1309gm f2979xV;

    /* renamed from: xW */
    private final HashMap f2980xW = new HashMap();

    /* renamed from: xX */
    private final String f2981xX;

    /* renamed from: com.google.android.gms.internal.gn$a */
    private final class C1314a extends C1071dw<C1306gl>.b<LocationClient.OnAddGeofencesResultListener> {

        /* renamed from: mC */
        private final int f2982mC;

        /* renamed from: xY */
        private final String[] f2983xY;

        public C1314a(LocationClient.OnAddGeofencesResultListener onAddGeofencesResultListener, int i, String[] strArr) {
            super(onAddGeofencesResultListener);
            this.f2982mC = LocationStatusCodes.m4091aR(i);
            this.f2983xY = strArr;
        }

        /* access modifiers changed from: protected */
        /* renamed from: a */
        public void mo7307b(LocationClient.OnAddGeofencesResultListener onAddGeofencesResultListener) {
            if (onAddGeofencesResultListener != null) {
                onAddGeofencesResultListener.onAddGeofencesResult(this.f2982mC, this.f2983xY);
            }
        }

        /* access modifiers changed from: protected */
        /* renamed from: aL */
        public void mo7306aL() {
        }
    }

    /* renamed from: com.google.android.gms.internal.gn$b */
    private static final class C1315b extends C1303gk.C1304a {

        /* renamed from: ya */
        private LocationClient.OnAddGeofencesResultListener f2985ya;

        /* renamed from: yb */
        private LocationClient.OnRemoveGeofencesResultListener f2986yb;

        /* renamed from: yc */
        private C1312gn f2987yc;

        public C1315b(LocationClient.OnAddGeofencesResultListener onAddGeofencesResultListener, C1312gn gnVar) {
            this.f2985ya = onAddGeofencesResultListener;
            this.f2986yb = null;
            this.f2987yc = gnVar;
        }

        public C1315b(LocationClient.OnRemoveGeofencesResultListener onRemoveGeofencesResultListener, C1312gn gnVar) {
            this.f2986yb = onRemoveGeofencesResultListener;
            this.f2985ya = null;
            this.f2987yc = gnVar;
        }

        public void onAddGeofencesResult(int statusCode, String[] geofenceRequestIds) throws RemoteException {
            if (this.f2987yc == null) {
                Log.wtf("LocationClientImpl", "onAddGeofenceResult called multiple times");
                return;
            }
            C1312gn gnVar = this.f2987yc;
            C1312gn gnVar2 = this.f2987yc;
            gnVar2.getClass();
            gnVar.mo7451a((C1071dw<T>.b<?>) new C1314a(this.f2985ya, statusCode, geofenceRequestIds));
            this.f2987yc = null;
            this.f2985ya = null;
            this.f2986yb = null;
        }

        public void onRemoveGeofencesByPendingIntentResult(int statusCode, PendingIntent pendingIntent) {
            if (this.f2987yc == null) {
                Log.wtf("LocationClientImpl", "onRemoveGeofencesByPendingIntentResult called multiple times");
                return;
            }
            C1312gn gnVar = this.f2987yc;
            C1312gn gnVar2 = this.f2987yc;
            gnVar2.getClass();
            gnVar.mo7451a((C1071dw<T>.b<?>) new C1317d(gnVar2, 1, this.f2986yb, statusCode, pendingIntent));
            this.f2987yc = null;
            this.f2985ya = null;
            this.f2986yb = null;
        }

        public void onRemoveGeofencesByRequestIdsResult(int statusCode, String[] geofenceRequestIds) {
            if (this.f2987yc == null) {
                Log.wtf("LocationClientImpl", "onRemoveGeofencesByRequestIdsResult called multiple times");
                return;
            }
            C1312gn gnVar = this.f2987yc;
            C1312gn gnVar2 = this.f2987yc;
            gnVar2.getClass();
            gnVar.mo7451a((C1071dw<T>.b<?>) new C1317d(2, this.f2986yb, statusCode, geofenceRequestIds));
            this.f2987yc = null;
            this.f2985ya = null;
            this.f2986yb = null;
        }
    }

    /* renamed from: com.google.android.gms.internal.gn$c */
    private final class C1316c implements C1320gq<C1306gl> {
        private C1316c() {
        }

        /* renamed from: bP */
        public void mo8100bP() {
            C1312gn.this.mo7453bP();
        }

        /* renamed from: dJ */
        public C1306gl mo8101bQ() {
            return (C1306gl) C1312gn.this.mo7454bQ();
        }
    }

    /* renamed from: com.google.android.gms.internal.gn$d */
    private final class C1317d extends C1071dw<C1306gl>.b<LocationClient.OnRemoveGeofencesResultListener> {

        /* renamed from: mC */
        private final int f2989mC;
        private final PendingIntent mPendingIntent;

        /* renamed from: xY */
        private final String[] f2990xY;

        /* renamed from: yd */
        private final int f2992yd;

        /* JADX INFO: super call moved to the top of the method (can break code semantics) */
        public C1317d(C1312gn gnVar, int i, LocationClient.OnRemoveGeofencesResultListener onRemoveGeofencesResultListener, int i2, PendingIntent pendingIntent) {
            super(onRemoveGeofencesResultListener);
            boolean z = true;
            C1312gn.this = gnVar;
            C1066ds.m2459p(i != 1 ? false : z);
            this.f2992yd = i;
            this.f2989mC = LocationStatusCodes.m4091aR(i2);
            this.mPendingIntent = pendingIntent;
            this.f2990xY = null;
        }

        public C1317d(int i, LocationClient.OnRemoveGeofencesResultListener onRemoveGeofencesResultListener, int i2, String[] strArr) {
            super(onRemoveGeofencesResultListener);
            C1066ds.m2459p(i == 2);
            this.f2992yd = i;
            this.f2989mC = LocationStatusCodes.m4091aR(i2);
            this.f2990xY = strArr;
            this.mPendingIntent = null;
        }

        /* access modifiers changed from: protected */
        /* renamed from: a */
        public void mo7307b(LocationClient.OnRemoveGeofencesResultListener onRemoveGeofencesResultListener) {
            if (onRemoveGeofencesResultListener != null) {
                switch (this.f2992yd) {
                    case 1:
                        onRemoveGeofencesResultListener.onRemoveGeofencesByPendingIntentResult(this.f2989mC, this.mPendingIntent);
                        return;
                    case 2:
                        onRemoveGeofencesResultListener.onRemoveGeofencesByRequestIdsResult(this.f2989mC, this.f2990xY);
                        return;
                    default:
                        Log.wtf("LocationClientImpl", "Unsupported action: " + this.f2992yd);
                        return;
                }
            }
        }

        /* access modifiers changed from: protected */
        /* renamed from: aL */
        public void mo7306aL() {
        }
    }

    public C1312gn(Context context, GooglePlayServicesClient.ConnectionCallbacks connectionCallbacks, GooglePlayServicesClient.OnConnectionFailedListener onConnectionFailedListener, String str) {
        super(context, connectionCallbacks, onConnectionFailedListener, new String[0]);
        this.f2979xV = new C1309gm(context, this.f2978xP);
        this.f2981xX = str;
        this.f2977jG = null;
    }

    /* access modifiers changed from: protected */
    /* renamed from: M */
    public C1306gl mo6207p(IBinder iBinder) {
        return C1306gl.C1307a.m3464L(iBinder);
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public void mo6202a(C1092ec ecVar, C1071dw.C1076e eVar) throws RemoteException {
        Bundle bundle = new Bundle();
        bundle.putString("client_name", this.f2981xX);
        ecVar.mo7521e(eVar, GooglePlayServicesUtil.GOOGLE_PLAY_SERVICES_VERSION_CODE, getContext().getPackageName(), bundle);
    }

    public void addGeofences(List<C1318go> geofences, PendingIntent pendingIntent, LocationClient.OnAddGeofencesResultListener listener) {
        mo7453bP();
        C1102eg.m2615b(geofences != null && geofences.size() > 0, (Object) "At least one geofence must be specified.");
        C1102eg.m2614b(pendingIntent, (Object) "PendingIntent must be specified.");
        C1102eg.m2614b(listener, (Object) "OnAddGeofencesResultListener not provided.");
        try {
            ((C1306gl) mo7454bQ()).mo8061a(geofences, pendingIntent, (C1303gk) listener == null ? null : new C1315b(listener, this), getContext().getPackageName());
        } catch (RemoteException e) {
            throw new IllegalStateException(e);
        }
    }

    /* access modifiers changed from: protected */
    /* renamed from: am */
    public String mo6203am() {
        return "com.google.android.location.internal.GoogleLocationManagerService.START";
    }

    /* access modifiers changed from: protected */
    /* renamed from: an */
    public String mo6204an() {
        return "com.google.android.gms.location.internal.IGoogleLocationManagerService";
    }

    public void disconnect() {
        synchronized (this.f2979xV) {
            if (isConnected()) {
                this.f2979xV.removeAllListeners();
                this.f2979xV.mo8073dI();
            }
            super.disconnect();
        }
    }

    public Location getLastLocation() {
        return this.f2979xV.getLastLocation();
    }

    public void removeActivityUpdates(PendingIntent callbackIntent) {
        mo7453bP();
        C1102eg.m2616f(callbackIntent);
        try {
            ((C1306gl) mo7454bQ()).removeActivityUpdates(callbackIntent);
        } catch (RemoteException e) {
            throw new IllegalStateException(e);
        }
    }

    public void removeGeofences(PendingIntent pendingIntent, LocationClient.OnRemoveGeofencesResultListener listener) {
        mo7453bP();
        C1102eg.m2614b(pendingIntent, (Object) "PendingIntent must be specified.");
        C1102eg.m2614b(listener, (Object) "OnRemoveGeofencesResultListener not provided.");
        try {
            ((C1306gl) mo7454bQ()).mo8041a(pendingIntent, (C1303gk) listener == null ? null : new C1315b(listener, this), getContext().getPackageName());
        } catch (RemoteException e) {
            throw new IllegalStateException(e);
        }
    }

    public void removeGeofences(List<String> geofenceRequestIds, LocationClient.OnRemoveGeofencesResultListener listener) {
        mo7453bP();
        C1102eg.m2615b(geofenceRequestIds != null && geofenceRequestIds.size() > 0, (Object) "geofenceRequestIds can't be null nor empty.");
        C1102eg.m2614b(listener, (Object) "OnRemoveGeofencesResultListener not provided.");
        try {
            ((C1306gl) mo7454bQ()).mo8062a((String[]) geofenceRequestIds.toArray(new String[0]), (C1303gk) listener == null ? null : new C1315b(listener, this), getContext().getPackageName());
        } catch (RemoteException e) {
            throw new IllegalStateException(e);
        }
    }

    public void removeLocationUpdates(PendingIntent callbackIntent) {
        this.f2979xV.removeLocationUpdates(callbackIntent);
    }

    public void removeLocationUpdates(LocationListener listener) {
        this.f2979xV.removeLocationUpdates(listener);
    }

    public void requestActivityUpdates(long detectionIntervalMillis, PendingIntent callbackIntent) {
        boolean z = true;
        mo7453bP();
        C1102eg.m2616f(callbackIntent);
        if (detectionIntervalMillis < 0) {
            z = false;
        }
        C1102eg.m2615b(z, (Object) "detectionIntervalMillis must be >= 0");
        try {
            ((C1306gl) mo7454bQ()).mo8039a(detectionIntervalMillis, true, callbackIntent);
        } catch (RemoteException e) {
            throw new IllegalStateException(e);
        }
    }

    public void requestLocationUpdates(LocationRequest request, PendingIntent callbackIntent) {
        this.f2979xV.requestLocationUpdates(request, callbackIntent);
    }

    public void requestLocationUpdates(LocationRequest request, LocationListener listener) {
        requestLocationUpdates(request, listener, (Looper) null);
    }

    public void requestLocationUpdates(LocationRequest request, LocationListener listener, Looper looper) {
        synchronized (this.f2979xV) {
            this.f2979xV.requestLocationUpdates(request, listener, looper);
        }
    }

    public void setMockLocation(Location mockLocation) {
        this.f2979xV.setMockLocation(mockLocation);
    }

    public void setMockMode(boolean isMockMode) {
        this.f2979xV.setMockMode(isMockMode);
    }
}
