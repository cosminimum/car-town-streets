package com.google.android.gms.internal;

import android.content.Context;
import com.google.android.gms.common.GooglePlayServicesUtil;
import com.google.android.gms.internal.bx;
/* loaded from: classes.dex */
public final class bw {

    /* loaded from: classes.dex */
    public interface a {
        void a(cb cbVar);
    }

    public static cm a(Context context, bz bzVar, a aVar) {
        return bzVar.ej.iM ? b(context, bzVar, aVar) : c(context, bzVar, aVar);
    }

    private static cm b(Context context, bz bzVar, a aVar) {
        ct.r("Fetching ad response from local ad request service.");
        bx.a aVar2 = new bx.a(context, bzVar, aVar);
        aVar2.start();
        return aVar2;
    }

    private static cm c(Context context, bz bzVar, a aVar) {
        ct.r("Fetching ad response from remote ad request service.");
        if (GooglePlayServicesUtil.isGooglePlayServicesAvailable(context) != 0) {
            ct.v("Failed to connect to remote ad request service.");
            return null;
        }
        return new bx.b(context, bzVar, aVar);
    }
}
