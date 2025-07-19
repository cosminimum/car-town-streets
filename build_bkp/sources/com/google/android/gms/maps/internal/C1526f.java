package com.google.android.gms.maps.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.gms.maps.model.internal.C1581d;

/* renamed from: com.google.android.gms.maps.internal.f */
public interface C1526f extends IInterface {

    /* renamed from: com.google.android.gms.maps.internal.f$a */
    public static abstract class C1527a extends Binder implements C1526f {

        /* renamed from: com.google.android.gms.maps.internal.f$a$a */
        private static class C1528a implements C1526f {

            /* renamed from: dU */
            private IBinder f3601dU;

            C1528a(IBinder iBinder) {
                this.f3601dU = iBinder;
            }

            public IBinder asBinder() {
                return this.f3601dU;
            }

            /* renamed from: e */
            public void mo8985e(C1581d dVar) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.maps.internal.IOnInfoWindowClickListener");
                    obtain.writeStrongBinder(dVar != null ? dVar.asBinder() : null);
                    this.f3601dU.transact(1, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }
        }

        public C1527a() {
            attachInterface(this, "com.google.android.gms.maps.internal.IOnInfoWindowClickListener");
        }

        /* renamed from: X */
        public static C1526f m4172X(IBinder iBinder) {
            if (iBinder == null) {
                return null;
            }
            IInterface queryLocalInterface = iBinder.queryLocalInterface("com.google.android.gms.maps.internal.IOnInfoWindowClickListener");
            return (queryLocalInterface == null || !(queryLocalInterface instanceof C1526f)) ? new C1528a(iBinder) : (C1526f) queryLocalInterface;
        }

        public IBinder asBinder() {
            return this;
        }

        public boolean onTransact(int code, Parcel data, Parcel reply, int flags) throws RemoteException {
            switch (code) {
                case 1:
                    data.enforceInterface("com.google.android.gms.maps.internal.IOnInfoWindowClickListener");
                    mo8985e(C1581d.C1582a.m4272am(data.readStrongBinder()));
                    reply.writeNoException();
                    return true;
                case 1598968902:
                    reply.writeString("com.google.android.gms.maps.internal.IOnInfoWindowClickListener");
                    return true;
                default:
                    return super.onTransact(code, data, reply, flags);
            }
        }
    }

    /* renamed from: e */
    void mo8985e(C1581d dVar) throws RemoteException;
}
