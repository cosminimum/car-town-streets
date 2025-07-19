package com.google.android.gms.maps.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.gms.dynamic.C0772b;

/* renamed from: com.google.android.gms.maps.internal.g */
public interface C1529g extends IInterface {

    /* renamed from: com.google.android.gms.maps.internal.g$a */
    public static abstract class C1530a extends Binder implements C1529g {

        /* renamed from: com.google.android.gms.maps.internal.g$a$a */
        private static class C1531a implements C1529g {

            /* renamed from: dU */
            private IBinder f3602dU;

            C1531a(IBinder iBinder) {
                this.f3602dU = iBinder;
            }

            public IBinder asBinder() {
                return this.f3602dU;
            }

            /* renamed from: g */
            public void mo9225g(C0772b bVar) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.maps.internal.IOnLocationChangeListener");
                    obtain.writeStrongBinder(bVar != null ? bVar.asBinder() : null);
                    this.f3602dU.transact(1, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }
        }

        /* renamed from: Y */
        public static C1529g m4175Y(IBinder iBinder) {
            if (iBinder == null) {
                return null;
            }
            IInterface queryLocalInterface = iBinder.queryLocalInterface("com.google.android.gms.maps.internal.IOnLocationChangeListener");
            return (queryLocalInterface == null || !(queryLocalInterface instanceof C1529g)) ? new C1531a(iBinder) : (C1529g) queryLocalInterface;
        }

        public boolean onTransact(int code, Parcel data, Parcel reply, int flags) throws RemoteException {
            switch (code) {
                case 1:
                    data.enforceInterface("com.google.android.gms.maps.internal.IOnLocationChangeListener");
                    mo9225g(C0772b.C0773a.m1694E(data.readStrongBinder()));
                    reply.writeNoException();
                    return true;
                case 1598968902:
                    reply.writeString("com.google.android.gms.maps.internal.IOnLocationChangeListener");
                    return true;
                default:
                    return super.onTransact(code, data, reply, flags);
            }
        }
    }

    /* renamed from: g */
    void mo9225g(C0772b bVar) throws RemoteException;
}
