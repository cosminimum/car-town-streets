package com.google.android.gms.maps;

import android.content.Context;
import android.os.RemoteException;
import com.google.android.gms.common.GooglePlayServicesNotAvailableException;
import com.google.android.gms.internal.C1102eg;
import com.google.android.gms.maps.internal.C1517c;
import com.google.android.gms.maps.internal.C1557q;
import com.google.android.gms.maps.model.BitmapDescriptorFactory;
import com.google.android.gms.maps.model.RuntimeRemoteException;

public final class MapsInitializer {
    private MapsInitializer() {
    }

    public static int initialize(Context context) {
        C1102eg.m2616f(context);
        try {
            C1517c u = C1557q.m4202u(context);
            try {
                CameraUpdateFactory.m4107a(u.mo9212ez());
                BitmapDescriptorFactory.m4207a(u.mo9211eA());
                return 0;
            } catch (RemoteException e) {
                throw new RuntimeRemoteException(e);
            }
        } catch (GooglePlayServicesNotAvailableException e2) {
            return e2.errorCode;
        }
    }
}
