package com.google.android.gms.internal;

import android.content.Context;
import android.os.Bundle;
import android.os.IBinder;
import android.os.RemoteException;
import com.google.android.gms.common.GooglePlayServicesClient;
import com.google.android.gms.internal.cd;
import com.google.android.gms.internal.dw;
/* loaded from: classes.dex */
public class by extends dw<cd> {
    private final int hp;

    public by(Context context, GooglePlayServicesClient.ConnectionCallbacks connectionCallbacks, GooglePlayServicesClient.OnConnectionFailedListener onConnectionFailedListener, int i) {
        super(context, connectionCallbacks, onConnectionFailedListener, new String[0]);
        this.hp = i;
    }

    @Override // com.google.android.gms.internal.dw
    protected void a(ec ecVar, dw.e eVar) throws RemoteException {
        ecVar.g(eVar, this.hp, getContext().getPackageName(), new Bundle());
    }

    @Override // com.google.android.gms.internal.dw
    protected String am() {
        return "com.google.android.gms.ads.service.START";
    }

    @Override // com.google.android.gms.internal.dw
    protected String an() {
        return "com.google.android.gms.ads.internal.request.IAdRequestService";
    }

    public cd ao() {
        return (cd) super.bQ();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.google.android.gms.internal.dw
    /* renamed from: o */
    public cd p(IBinder iBinder) {
        return cd.a.q(iBinder);
    }
}
