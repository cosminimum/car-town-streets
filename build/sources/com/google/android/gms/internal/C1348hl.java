package com.google.android.gms.internal;

import android.net.Uri;
import android.os.Binder;
import android.os.Bundle;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.gms.internal.C1345hk;

/* renamed from: com.google.android.gms.internal.hl */
public interface C1348hl extends IInterface {

    /* renamed from: com.google.android.gms.internal.hl$a */
    public static abstract class C1349a extends Binder implements C1348hl {

        /* renamed from: com.google.android.gms.internal.hl$a$a */
        private static class C1350a implements C1348hl {

            /* renamed from: dU */
            private IBinder f3188dU;

            C1350a(IBinder iBinder) {
                this.f3188dU = iBinder;
            }

            /* renamed from: a */
            public void mo8237a(C1345hk hkVar, Uri uri, Bundle bundle, boolean z) throws RemoteException {
                IBinder iBinder = null;
                int i = 1;
                Parcel obtain = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.panorama.internal.IPanoramaService");
                    if (hkVar != null) {
                        iBinder = hkVar.asBinder();
                    }
                    obtain.writeStrongBinder(iBinder);
                    if (uri != null) {
                        obtain.writeInt(1);
                        uri.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    if (bundle != null) {
                        obtain.writeInt(1);
                        bundle.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    if (!z) {
                        i = 0;
                    }
                    obtain.writeInt(i);
                    this.f3188dU.transact(1, obtain, (Parcel) null, 1);
                } finally {
                    obtain.recycle();
                }
            }

            public IBinder asBinder() {
                return this.f3188dU;
            }
        }

        /* renamed from: as */
        public static C1348hl m3591as(IBinder iBinder) {
            if (iBinder == null) {
                return null;
            }
            IInterface queryLocalInterface = iBinder.queryLocalInterface("com.google.android.gms.panorama.internal.IPanoramaService");
            return (queryLocalInterface == null || !(queryLocalInterface instanceof C1348hl)) ? new C1350a(iBinder) : (C1348hl) queryLocalInterface;
        }

        public boolean onTransact(int code, Parcel data, Parcel reply, int flags) throws RemoteException {
            switch (code) {
                case 1:
                    data.enforceInterface("com.google.android.gms.panorama.internal.IPanoramaService");
                    mo8237a(C1345hk.C1346a.m3588ar(data.readStrongBinder()), data.readInt() != 0 ? (Uri) Uri.CREATOR.createFromParcel(data) : null, data.readInt() != 0 ? (Bundle) Bundle.CREATOR.createFromParcel(data) : null, data.readInt() != 0);
                    return true;
                case 1598968902:
                    reply.writeString("com.google.android.gms.panorama.internal.IPanoramaService");
                    return true;
                default:
                    return super.onTransact(code, data, reply, flags);
            }
        }
    }

    /* renamed from: a */
    void mo8237a(C1345hk hkVar, Uri uri, Bundle bundle, boolean z) throws RemoteException;
}
