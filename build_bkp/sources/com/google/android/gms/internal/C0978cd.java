package com.google.android.gms.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;

/* renamed from: com.google.android.gms.internal.cd */
public interface C0978cd extends IInterface {

    /* renamed from: com.google.android.gms.internal.cd$a */
    public static abstract class C0979a extends Binder implements C0978cd {

        /* renamed from: com.google.android.gms.internal.cd$a$a */
        private static class C0980a implements C0978cd {

            /* renamed from: dU */
            private IBinder f2330dU;

            C0980a(IBinder iBinder) {
                this.f2330dU = iBinder;
            }

            public IBinder asBinder() {
                return this.f2330dU;
            }

            /* renamed from: b */
            public C0976cb mo7210b(C0972bz bzVar) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.ads.internal.request.IAdRequestService");
                    if (bzVar != null) {
                        obtain.writeInt(1);
                        bzVar.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    this.f2330dU.transact(1, obtain, obtain2, 0);
                    obtain2.readException();
                    return obtain2.readInt() != 0 ? C0976cb.CREATOR.mo7207g(obtain2) : null;
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }
        }

        public C0979a() {
            attachInterface(this, "com.google.android.gms.ads.internal.request.IAdRequestService");
        }

        /* renamed from: q */
        public static C0978cd m2123q(IBinder iBinder) {
            if (iBinder == null) {
                return null;
            }
            IInterface queryLocalInterface = iBinder.queryLocalInterface("com.google.android.gms.ads.internal.request.IAdRequestService");
            return (queryLocalInterface == null || !(queryLocalInterface instanceof C0978cd)) ? new C0980a(iBinder) : (C0978cd) queryLocalInterface;
        }

        public IBinder asBinder() {
            return this;
        }

        public boolean onTransact(int code, Parcel data, Parcel reply, int flags) throws RemoteException {
            switch (code) {
                case 1:
                    data.enforceInterface("com.google.android.gms.ads.internal.request.IAdRequestService");
                    C0976cb b = mo7210b(data.readInt() != 0 ? C0972bz.CREATOR.createFromParcel(data) : null);
                    reply.writeNoException();
                    if (b != null) {
                        reply.writeInt(1);
                        b.writeToParcel(reply, 1);
                    } else {
                        reply.writeInt(0);
                    }
                    return true;
                case 1598968902:
                    reply.writeString("com.google.android.gms.ads.internal.request.IAdRequestService");
                    return true;
                default:
                    return super.onTransact(code, data, reply, flags);
            }
        }
    }

    /* renamed from: b */
    C0976cb mo7210b(C0972bz bzVar) throws RemoteException;
}
