package com.google.android.gms.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.gms.internal.bc;

public interface bb extends IInterface {

    public static abstract class a extends Binder implements bb {

        /* renamed from: com.google.android.gms.internal.bb$a$a  reason: collision with other inner class name */
        private static class C0024a implements bb {
            private IBinder dU;

            C0024a(IBinder iBinder) {
                this.dU = iBinder;
            }

            public IBinder asBinder() {
                return this.dU;
            }

            public bc l(String str) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.ads.internal.mediation.client.IAdapterCreator");
                    obtain.writeString(str);
                    this.dU.transact(1, obtain, obtain2, 0);
                    obtain2.readException();
                    return bc.a.j(obtain2.readStrongBinder());
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }
        }

        public a() {
            attachInterface(this, "com.google.android.gms.ads.internal.mediation.client.IAdapterCreator");
        }

        public static bb i(IBinder iBinder) {
            if (iBinder == null) {
                return null;
            }
            IInterface queryLocalInterface = iBinder.queryLocalInterface("com.google.android.gms.ads.internal.mediation.client.IAdapterCreator");
            return (queryLocalInterface == null || !(queryLocalInterface instanceof bb)) ? new C0024a(iBinder) : (bb) queryLocalInterface;
        }

        public IBinder asBinder() {
            return this;
        }

        public boolean onTransact(int code, Parcel data, Parcel reply, int flags) throws RemoteException {
            switch (code) {
                case 1:
                    data.enforceInterface("com.google.android.gms.ads.internal.mediation.client.IAdapterCreator");
                    bc l = l(data.readString());
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

    bc l(String str) throws RemoteException;
}
