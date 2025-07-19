package com.google.android.gms.maps.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.gms.dynamic.C0772b;

/* renamed from: com.google.android.gms.maps.internal.n */
public interface C1550n extends IInterface {

    /* renamed from: com.google.android.gms.maps.internal.n$a */
    public static abstract class C1551a extends Binder implements C1550n {

        /* renamed from: com.google.android.gms.maps.internal.n$a$a */
        private static class C1552a implements C1550n {

            /* renamed from: dU */
            private IBinder f3609dU;

            C1552a(IBinder iBinder) {
                this.f3609dU = iBinder;
            }

            public IBinder asBinder() {
                return this.f3609dU;
            }

            /* renamed from: d */
            public void mo8988d(C0772b bVar) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.maps.internal.IOnMyLocationChangeListener");
                    obtain.writeStrongBinder(bVar != null ? bVar.asBinder() : null);
                    this.f3609dU.transact(1, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }
        }

        public C1551a() {
            attachInterface(this, "com.google.android.gms.maps.internal.IOnMyLocationChangeListener");
        }

        /* renamed from: af */
        public static C1550n m4192af(IBinder iBinder) {
            if (iBinder == null) {
                return null;
            }
            IInterface queryLocalInterface = iBinder.queryLocalInterface("com.google.android.gms.maps.internal.IOnMyLocationChangeListener");
            return (queryLocalInterface == null || !(queryLocalInterface instanceof C1550n)) ? new C1552a(iBinder) : (C1550n) queryLocalInterface;
        }

        public IBinder asBinder() {
            return this;
        }

        public boolean onTransact(int code, Parcel data, Parcel reply, int flags) throws RemoteException {
            switch (code) {
                case 1:
                    data.enforceInterface("com.google.android.gms.maps.internal.IOnMyLocationChangeListener");
                    mo8988d(C0772b.C0773a.m1694E(data.readStrongBinder()));
                    reply.writeNoException();
                    return true;
                case 1598968902:
                    reply.writeString("com.google.android.gms.maps.internal.IOnMyLocationChangeListener");
                    return true;
                default:
                    return super.onTransact(code, data, reply, flags);
            }
        }
    }

    /* renamed from: d */
    void mo8988d(C0772b bVar) throws RemoteException;
}
