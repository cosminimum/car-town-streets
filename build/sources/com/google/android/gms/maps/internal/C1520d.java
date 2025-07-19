package com.google.android.gms.maps.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.gms.dynamic.C0772b;
import com.google.android.gms.maps.model.internal.C1581d;

/* renamed from: com.google.android.gms.maps.internal.d */
public interface C1520d extends IInterface {

    /* renamed from: com.google.android.gms.maps.internal.d$a */
    public static abstract class C1521a extends Binder implements C1520d {

        /* renamed from: com.google.android.gms.maps.internal.d$a$a */
        private static class C1522a implements C1520d {

            /* renamed from: dU */
            private IBinder f3599dU;

            C1522a(IBinder iBinder) {
                this.f3599dU = iBinder;
            }

            public IBinder asBinder() {
                return this.f3599dU;
            }

            /* renamed from: f */
            public C0772b mo8986f(C1581d dVar) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.maps.internal.IInfoWindowAdapter");
                    obtain.writeStrongBinder(dVar != null ? dVar.asBinder() : null);
                    this.f3599dU.transact(1, obtain, obtain2, 0);
                    obtain2.readException();
                    return C0772b.C0773a.m1694E(obtain2.readStrongBinder());
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: g */
            public C0772b mo8987g(C1581d dVar) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.maps.internal.IInfoWindowAdapter");
                    obtain.writeStrongBinder(dVar != null ? dVar.asBinder() : null);
                    this.f3599dU.transact(2, obtain, obtain2, 0);
                    obtain2.readException();
                    return C0772b.C0773a.m1694E(obtain2.readStrongBinder());
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }
        }

        public C1521a() {
            attachInterface(this, "com.google.android.gms.maps.internal.IInfoWindowAdapter");
        }

        /* renamed from: S */
        public static C1520d m4167S(IBinder iBinder) {
            if (iBinder == null) {
                return null;
            }
            IInterface queryLocalInterface = iBinder.queryLocalInterface("com.google.android.gms.maps.internal.IInfoWindowAdapter");
            return (queryLocalInterface == null || !(queryLocalInterface instanceof C1520d)) ? new C1522a(iBinder) : (C1520d) queryLocalInterface;
        }

        public IBinder asBinder() {
            return this;
        }

        public boolean onTransact(int code, Parcel data, Parcel reply, int flags) throws RemoteException {
            IBinder iBinder = null;
            switch (code) {
                case 1:
                    data.enforceInterface("com.google.android.gms.maps.internal.IInfoWindowAdapter");
                    C0772b f = mo8986f(C1581d.C1582a.m4272am(data.readStrongBinder()));
                    reply.writeNoException();
                    if (f != null) {
                        iBinder = f.asBinder();
                    }
                    reply.writeStrongBinder(iBinder);
                    return true;
                case 2:
                    data.enforceInterface("com.google.android.gms.maps.internal.IInfoWindowAdapter");
                    C0772b g = mo8987g(C1581d.C1582a.m4272am(data.readStrongBinder()));
                    reply.writeNoException();
                    if (g != null) {
                        iBinder = g.asBinder();
                    }
                    reply.writeStrongBinder(iBinder);
                    return true;
                case 1598968902:
                    reply.writeString("com.google.android.gms.maps.internal.IInfoWindowAdapter");
                    return true;
                default:
                    return super.onTransact(code, data, reply, flags);
            }
        }
    }

    /* renamed from: f */
    C0772b mo8986f(C1581d dVar) throws RemoteException;

    /* renamed from: g */
    C0772b mo8987g(C1581d dVar) throws RemoteException;
}
