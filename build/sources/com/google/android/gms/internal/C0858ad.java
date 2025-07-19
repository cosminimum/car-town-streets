package com.google.android.gms.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.gms.dynamic.C0772b;
import com.google.android.gms.internal.C0912bb;

/* renamed from: com.google.android.gms.internal.ad */
public interface C0858ad extends IInterface {

    /* renamed from: com.google.android.gms.internal.ad$a */
    public static abstract class C0859a extends Binder implements C0858ad {

        /* renamed from: com.google.android.gms.internal.ad$a$a */
        private static class C0860a implements C0858ad {

            /* renamed from: dU */
            private IBinder f1908dU;

            C0860a(IBinder iBinder) {
                this.f1908dU = iBinder;
            }

            /* renamed from: a */
            public IBinder mo7011a(C0772b bVar, C1466x xVar, String str, C0912bb bbVar, int i) throws RemoteException {
                IBinder iBinder = null;
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.ads.internal.client.IAdManagerCreator");
                    obtain.writeStrongBinder(bVar != null ? bVar.asBinder() : null);
                    if (xVar != null) {
                        obtain.writeInt(1);
                        xVar.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    obtain.writeString(str);
                    if (bbVar != null) {
                        iBinder = bbVar.asBinder();
                    }
                    obtain.writeStrongBinder(iBinder);
                    obtain.writeInt(i);
                    this.f1908dU.transact(1, obtain, obtain2, 0);
                    obtain2.readException();
                    return obtain2.readStrongBinder();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            public IBinder asBinder() {
                return this.f1908dU;
            }
        }

        /* renamed from: g */
        public static C0858ad m1913g(IBinder iBinder) {
            if (iBinder == null) {
                return null;
            }
            IInterface queryLocalInterface = iBinder.queryLocalInterface("com.google.android.gms.ads.internal.client.IAdManagerCreator");
            return (queryLocalInterface == null || !(queryLocalInterface instanceof C0858ad)) ? new C0860a(iBinder) : (C0858ad) queryLocalInterface;
        }

        public boolean onTransact(int code, Parcel data, Parcel reply, int flags) throws RemoteException {
            switch (code) {
                case 1:
                    data.enforceInterface("com.google.android.gms.ads.internal.client.IAdManagerCreator");
                    IBinder a = mo7011a(C0772b.C0773a.m1694E(data.readStrongBinder()), data.readInt() != 0 ? C1466x.CREATOR.createFromParcel(data) : null, data.readString(), C0912bb.C0913a.m2005i(data.readStrongBinder()), data.readInt());
                    reply.writeNoException();
                    reply.writeStrongBinder(a);
                    return true;
                case 1598968902:
                    reply.writeString("com.google.android.gms.ads.internal.client.IAdManagerCreator");
                    return true;
                default:
                    return super.onTransact(code, data, reply, flags);
            }
        }
    }

    /* renamed from: a */
    IBinder mo7011a(C0772b bVar, C1466x xVar, String str, C0912bb bbVar, int i) throws RemoteException;
}
