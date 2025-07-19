package com.google.android.gms.internal;

import android.app.PendingIntent;
import android.content.ContentProviderClient;
import android.content.Context;
import android.location.Location;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.os.RemoteException;
import android.util.Log;
import com.google.android.gms.location.C1471c;
import com.google.android.gms.location.LocationListener;
import com.google.android.gms.location.LocationRequest;
import java.util.HashMap;

/* renamed from: com.google.android.gms.internal.gm */
public class C1309gm {
    private final Context mContext;

    /* renamed from: xP */
    private final C1320gq<C1306gl> f2971xP;

    /* renamed from: xQ */
    private ContentProviderClient f2972xQ = null;

    /* renamed from: xR */
    private boolean f2973xR = false;

    /* renamed from: xS */
    private HashMap<LocationListener, C1311b> f2974xS = new HashMap<>();

    /* renamed from: com.google.android.gms.internal.gm$a */
    private static class C1310a extends Handler {

        /* renamed from: xT */
        private final LocationListener f2975xT;

        public C1310a(LocationListener locationListener) {
            this.f2975xT = locationListener;
        }

        public C1310a(LocationListener locationListener, Looper looper) {
            super(looper);
            this.f2975xT = locationListener;
        }

        public void handleMessage(Message msg) {
            switch (msg.what) {
                case 1:
                    this.f2975xT.onLocationChanged(new Location((Location) msg.obj));
                    return;
                default:
                    Log.e("LocationClientHelper", "unknown message in LocationHandler.handleMessage");
                    return;
            }
        }
    }

    /* renamed from: com.google.android.gms.internal.gm$b */
    private static class C1311b extends C1471c.C1472a {

        /* renamed from: xU */
        private Handler f2976xU;

        C1311b(LocationListener locationListener, Looper looper) {
            this.f2976xU = looper == null ? new C1310a(locationListener) : new C1310a(locationListener, looper);
        }

        public void onLocationChanged(Location location) {
            if (this.f2976xU == null) {
                Log.e("LocationClientHelper", "Received a location in client after calling removeLocationUpdates.");
                return;
            }
            Message obtain = Message.obtain();
            obtain.what = 1;
            obtain.obj = location;
            this.f2976xU.sendMessage(obtain);
        }

        public void release() {
            this.f2976xU = null;
        }
    }

    public C1309gm(Context context, C1320gq<C1306gl> gqVar) {
        this.mContext = context;
        this.f2971xP = gqVar;
    }

    /* renamed from: dI */
    public void mo8073dI() {
        if (this.f2973xR) {
            setMockMode(false);
        }
    }

    public Location getLastLocation() {
        this.f2971xP.mo8100bP();
        try {
            return this.f2971xP.mo8101bQ().mo8063an(this.mContext.getPackageName());
        } catch (RemoteException e) {
            throw new IllegalStateException(e);
        }
    }

    public void removeAllListeners() {
        try {
            synchronized (this.f2974xS) {
                for (C1311b next : this.f2974xS.values()) {
                    if (next != null) {
                        this.f2971xP.mo8101bQ().mo8050a((C1471c) next);
                    }
                }
                this.f2974xS.clear();
            }
        } catch (RemoteException e) {
            throw new IllegalStateException(e);
        }
    }

    public void removeLocationUpdates(PendingIntent callbackIntent) {
        this.f2971xP.mo8100bP();
        try {
            this.f2971xP.mo8101bQ().mo8040a(callbackIntent);
        } catch (RemoteException e) {
            throw new IllegalStateException(e);
        }
    }

    public void removeLocationUpdates(LocationListener listener) {
        this.f2971xP.mo8100bP();
        C1102eg.m2614b(listener, (Object) "Invalid null listener");
        synchronized (this.f2974xS) {
            C1311b remove = this.f2974xS.remove(listener);
            if (this.f2972xQ != null && this.f2974xS.isEmpty()) {
                this.f2972xQ.release();
                this.f2972xQ = null;
            }
            if (remove != null) {
                remove.release();
                try {
                    this.f2971xP.mo8101bQ().mo8050a((C1471c) remove);
                } catch (RemoteException e) {
                    throw new IllegalStateException(e);
                }
            }
        }
    }

    public void requestLocationUpdates(LocationRequest request, PendingIntent callbackIntent) {
        this.f2971xP.mo8100bP();
        try {
            this.f2971xP.mo8101bQ().mo8047a(request, callbackIntent);
        } catch (RemoteException e) {
            throw new IllegalStateException(e);
        }
    }

    public void requestLocationUpdates(LocationRequest request, LocationListener listener, Looper looper) {
        this.f2971xP.mo8100bP();
        if (looper == null) {
            C1102eg.m2614b(Looper.myLooper(), (Object) "Can't create handler inside thread that has not called Looper.prepare()");
        }
        synchronized (this.f2974xS) {
            C1311b bVar = this.f2974xS.get(listener);
            C1311b bVar2 = bVar == null ? new C1311b(listener, looper) : bVar;
            this.f2974xS.put(listener, bVar2);
            try {
                this.f2971xP.mo8101bQ().mo8049a(request, (C1471c) bVar2, this.mContext.getPackageName());
            } catch (RemoteException e) {
                throw new IllegalStateException(e);
            }
        }
    }

    public void setMockLocation(Location mockLocation) {
        this.f2971xP.mo8100bP();
        try {
            this.f2971xP.mo8101bQ().setMockLocation(mockLocation);
        } catch (RemoteException e) {
            throw new IllegalStateException(e);
        }
    }

    public void setMockMode(boolean isMockMode) {
        this.f2971xP.mo8100bP();
        try {
            this.f2971xP.mo8101bQ().setMockMode(isMockMode);
            this.f2973xR = isMockMode;
        } catch (RemoteException e) {
            throw new IllegalStateException(e);
        }
    }
}
