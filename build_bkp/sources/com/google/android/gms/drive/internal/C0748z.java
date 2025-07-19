package com.google.android.gms.drive.internal;

import android.os.RemoteException;
import com.google.android.gms.common.api.C0655a;
import com.google.android.gms.common.api.Status;

/* renamed from: com.google.android.gms.drive.internal.z */
public class C0748z extends C0684a {

    /* renamed from: jW */
    private final C0655a.C0659c<Status> f1558jW;

    public C0748z(C0655a.C0659c<Status> cVar) {
        this.f1558jW = cVar;
    }

    /* renamed from: m */
    public void mo6162m(Status status) throws RemoteException {
        this.f1558jW.mo5612a(status);
    }

    public void onSuccess() throws RemoteException {
        this.f1558jW.mo5612a(Status.f1350nA);
    }
}
