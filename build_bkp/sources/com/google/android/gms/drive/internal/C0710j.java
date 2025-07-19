package com.google.android.gms.drive.internal;

import android.content.Context;
import android.os.Bundle;
import android.os.IBinder;
import android.os.RemoteException;
import com.google.android.gms.common.GooglePlayServicesUtil;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.drive.DriveId;
import com.google.android.gms.drive.internal.C0733o;
import com.google.android.gms.internal.C1067dt;
import com.google.android.gms.internal.C1071dw;
import com.google.android.gms.internal.C1092ec;
import com.google.android.gms.internal.C1102eg;

/* renamed from: com.google.android.gms.drive.internal.j */
public class C0710j extends C1071dw<C0733o> {

    /* renamed from: jG */
    private final String f1519jG;

    /* renamed from: rg */
    private DriveId f1520rg;

    public C0710j(Context context, C1067dt dtVar, GoogleApiClient.ConnectionCallbacks connectionCallbacks, GoogleApiClient.OnConnectionFailedListener onConnectionFailedListener, String[] strArr) {
        super(context, connectionCallbacks, onConnectionFailedListener, strArr);
        this.f1519jG = (String) C1102eg.m2614b(dtVar.mo7433bF(), (Object) "Must call Api.ClientBuilder.setAccountName()");
    }

    /* access modifiers changed from: protected */
    /* renamed from: B */
    public C0733o mo6207p(IBinder iBinder) {
        return C0733o.C0734a.m1546C(iBinder);
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public void mo6201a(int i, IBinder iBinder, Bundle bundle) {
        if (bundle != null) {
            bundle.setClassLoader(getClass().getClassLoader());
            this.f1520rg = (DriveId) bundle.getParcelable("com.google.android.gms.drive.root_id");
        }
        super.mo6201a(i, iBinder, bundle);
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public void mo6202a(C1092ec ecVar, C1071dw.C1076e eVar) throws RemoteException {
        String packageName = getContext().getPackageName();
        C1102eg.m2616f(eVar);
        C1102eg.m2616f(packageName);
        C1102eg.m2616f(mo7452bO());
        ecVar.mo7516a(eVar, GooglePlayServicesUtil.GOOGLE_PLAY_SERVICES_VERSION_CODE, packageName, mo7452bO(), this.f1519jG, new Bundle());
    }

    /* access modifiers changed from: protected */
    /* renamed from: am */
    public String mo6203am() {
        return "com.google.android.gms.drive.ApiService.START";
    }

    /* access modifiers changed from: protected */
    /* renamed from: an */
    public String mo6204an() {
        return "com.google.android.gms.drive.internal.IDriveService";
    }

    /* renamed from: cN */
    public C0733o mo6205cN() {
        return (C0733o) mo7454bQ();
    }

    /* renamed from: cO */
    public DriveId mo6206cO() {
        return this.f1520rg;
    }
}
