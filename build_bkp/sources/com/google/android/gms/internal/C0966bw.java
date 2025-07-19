package com.google.android.gms.internal;

import android.content.Context;
import com.google.android.gms.common.GooglePlayServicesUtil;
import com.google.android.gms.internal.C0968bx;

/* renamed from: com.google.android.gms.internal.bw */
public final class C0966bw {

    /* renamed from: com.google.android.gms.internal.bw$a */
    public interface C0967a {
        /* renamed from: a */
        void mo7187a(C0976cb cbVar);
    }

    /* renamed from: a */
    public static C0992cm m2098a(Context context, C0972bz bzVar, C0967a aVar) {
        return bzVar.f2305ej.f2416iM ? m2099b(context, bzVar, aVar) : m2100c(context, bzVar, aVar);
    }

    /* renamed from: b */
    private static C0992cm m2099b(Context context, C0972bz bzVar, C0967a aVar) {
        C1004ct.m2214r("Fetching ad response from local ad request service.");
        C0968bx.C0969a aVar2 = new C0968bx.C0969a(context, bzVar, aVar);
        aVar2.start();
        return aVar2;
    }

    /* renamed from: c */
    private static C0992cm m2100c(Context context, C0972bz bzVar, C0967a aVar) {
        C1004ct.m2214r("Fetching ad response from remote ad request service.");
        if (GooglePlayServicesUtil.isGooglePlayServicesAvailable(context) == 0) {
            return new C0968bx.C0970b(context, bzVar, aVar);
        }
        C1004ct.m2218v("Failed to connect to remote ad request service.");
        return null;
    }
}
