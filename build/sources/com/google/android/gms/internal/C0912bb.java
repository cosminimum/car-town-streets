package com.google.android.gms.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.gms.internal.C0915bc;

/* renamed from: com.google.android.gms.internal.bb */
public interface C0912bb extends IInterface {

    /* renamed from: com.google.android.gms.internal.bb$a */
    public static abstract class C0913a extends Binder implements C0912bb {

        /* renamed from: com.google.android.gms.internal.bb$a$a */
        private static class C0914a implements C0912bb {

            /* renamed from: dU */
            private IBinder f2213dU;

            C0914a(IBinder iBinder) {
                this.f2213dU = iBinder;
            }

            public IBinder asBinder() {
                return this.f2213dU;
            }

            /* renamed from: l */
            public C0915bc mo7095l(String str) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.ads.internal.mediation.client.IAdapterCreator");
                    obtain.writeString(str);
                    this.f2213dU.transact(1, obtain, obtain2, 0);
                    obtain2.readException();
                    return C0915bc.C0916a.m2011j(obtain2.readStrongBinder());
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }
        }

        public C0913a() {
            attachInterface(this, "com.google.android.gms.ads.internal.mediation.client.IAdapterCreator");
        }

        /* renamed from: i */
        public static C0912bb m2005i(IBinder iBinder) {
            if (iBinder == null) {
                return null;
            }
            IInterface queryLocalInterface = iBinder.queryLocalInterface("com.google.android.gms.ads.internal.mediation.client.IAdapterCreator");
            return (queryLocalInterface == null || !(queryLocalInterface instanceof C0912bb)) ? new C0914a(iBinder) : (C0912bb) queryLocalInterface;
        }

        public IBinder asBinder() {
            return this;
        }

        public boolean onTransact(int code, Parcel data, Parcel reply, int flags) throws RemoteException {
            switch (code) {
                case 1:
                    data.enforceInterface("com.google.android.gms.ads.internal.mediation.client.IAdapterCreator");
                    C0915bc l = mo7095l(data.readString());
                    reply.writeNoException();
                    reply.writeStrongBinder(l != null ? l.asBinder() : null);
                    return true;
                case 1598968902:
                    reply.writeString("com.google.android.gms.ads.internal.mediation.client.IAdapterCreator");
                    return true;
                default:
                    return super.onTransact(code, data, reply, flags);
            }
        }
    }

    /* renamed from: l */
    C0915bc mo7095l(String str) throws RemoteException;
}
