package com.google.android.gms.ads.identifier;

import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.os.RemoteException;
import android.util.Log;
import com.google.android.gms.common.C0645a;
import com.google.android.gms.common.GooglePlayServicesNotAvailableException;
import com.google.android.gms.common.GooglePlayServicesRepairableException;
import com.google.android.gms.common.GooglePlayServicesUtil;
import com.google.android.gms.internal.C1102eg;
import com.google.android.gms.internal.C1454p;
import java.io.IOException;

public final class AdvertisingIdClient {

    public static final class Info {

        /* renamed from: eb */
        private final String f1119eb;

        /* renamed from: ec */
        private final boolean f1120ec;

        Info(String advertisingId, boolean limitAdTrackingEnabled) {
            this.f1119eb = advertisingId;
            this.f1120ec = limitAdTrackingEnabled;
        }

        public String getId() {
            return this.f1119eb;
        }

        public boolean isLimitAdTrackingEnabled() {
            return this.f1120ec;
        }
    }

    /* renamed from: g */
    private static C0645a m1083g(Context context) throws IOException, GooglePlayServicesNotAvailableException, GooglePlayServicesRepairableException {
        try {
            context.getPackageManager().getPackageInfo(GooglePlayServicesUtil.GOOGLE_PLAY_STORE_PACKAGE, 0);
            try {
                GooglePlayServicesUtil.m1236m(context);
                C0645a aVar = new C0645a();
                Intent intent = new Intent("com.google.android.gms.ads.identifier.service.START");
                intent.setPackage(GooglePlayServicesUtil.GOOGLE_PLAY_SERVICES_PACKAGE);
                if (context.bindService(intent, aVar, 1)) {
                    return aVar;
                }
                throw new IOException("Connection failure");
            } catch (GooglePlayServicesNotAvailableException e) {
                throw new IOException(e);
            }
        } catch (PackageManager.NameNotFoundException e2) {
            throw new GooglePlayServicesNotAvailableException(9);
        }
    }

    public static Info getAdvertisingIdInfo(Context context) throws IOException, IllegalStateException, GooglePlayServicesNotAvailableException, GooglePlayServicesRepairableException {
        C1102eg.m2610O("Calling this from your main thread can lead to deadlock");
        C0645a g = m1083g(context);
        try {
            C1454p b = C1454p.C1455a.m4030b(g.mo5858bg());
            Info info = new Info(b.getId(), b.mo8816a(true));
            context.unbindService(g);
            return info;
        } catch (RemoteException e) {
            Log.i("AdvertisingIdClient", "GMS remote exception ", e);
            throw new IOException("Remote exception");
        } catch (InterruptedException e2) {
            throw new IOException("Interrupted exception");
        } catch (Throwable th) {
            context.unbindService(g);
            throw th;
        }
    }
}
