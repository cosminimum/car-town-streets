package com.google.android.gms.internal;

import android.content.Context;
import android.os.Bundle;
import android.os.IBinder;
import android.os.RemoteException;
import com.google.android.gms.common.GooglePlayServicesClient;
import com.google.android.gms.internal.C0978cd;
import com.google.android.gms.internal.C1071dw;

/* renamed from: com.google.android.gms.internal.by */
public class C0971by extends C1071dw<C0978cd> {

    /* renamed from: hp */
    private final int f2304hp;

    public C0971by(Context context, GooglePlayServicesClient.ConnectionCallbacks connectionCallbacks, GooglePlayServicesClient.OnConnectionFailedListener onConnectionFailedListener, int i) {
        super(context, connectionCallbacks, onConnectionFailedListener, new String[0]);
        this.f2304hp = i;
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public void mo6202a(C1092ec ecVar, C1071dw.C1076e eVar) throws RemoteException {
        ecVar.mo7523g(eVar, this.f2304hp, getContext().getPackageName(), new Bundle());
    }

    /* access modifiers changed from: protected */
    /* renamed from: am */
    public String mo6203am() {
        return "com.google.android.gms.ads.service.START";
    }

    /* access modifiers changed from: protected */
    /* renamed from: an */
    public String mo6204an() {
        return "com.google.android.gms.ads.internal.request.IAdRequestService";
    }

    /* renamed from: ao */
    public C0978cd mo7196ao() {
        return (C0978cd) super.mo7454bQ();
    }

    /* access modifiers changed from: protected */
    /* renamed from: o */
    public C0978cd mo6207p(IBinder iBinder) {
        return C0978cd.C0979a.m2123q(iBinder);
    }
}
