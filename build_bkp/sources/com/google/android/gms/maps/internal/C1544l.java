package com.google.android.gms.maps.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.gms.maps.model.internal.C1581d;

/* renamed from: com.google.android.gms.maps.internal.l */
public interface C1544l extends IInterface {

    /* renamed from: com.google.android.gms.maps.internal.l$a */
    public static abstract class C1545a extends Binder implements C1544l {

        /* renamed from: com.google.android.gms.maps.internal.l$a$a */
        private static class C1546a implements C1544l {

            /* renamed from: dU */
            private IBinder f3607dU;

            C1546a(IBinder iBinder) {
                this.f3607dU = iBinder;
            }

            public IBinder asBinder() {
                return this.f3607dU;
            }

            /* renamed from: b */
            public void mo8997b(C1581d dVar) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.maps.internal.IOnMarkerDragListener");
                    obtain.writeStrongBinder(dVar != null ? dVar.asBinder() : null);
                    this.f3607dU.transact(1, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: c */
            public void mo8998c(C1581d dVar) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.maps.internal.IOnMarkerDragListener");
                    obtain.writeStrongBinder(dVar != null ? dVar.asBinder() : null);
                    this.f3607dU.transact(3, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: d */
            public void mo8999d(C1581d dVar) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.maps.internal.IOnMarkerDragListener");
                    obtain.writeStrongBinder(dVar != null ? dVar.asBinder() : null);
                    this.f3607dU.transact(2, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }
        }

        public C1545a() {
            attachInterface(this, "com.google.android.gms.maps.internal.IOnMarkerDragListener");
        }

        /* renamed from: ad */
        public static C1544l m4186ad(IBinder iBinder) {
            if (iBinder == null) {
                return null;
            }
            IInterface queryLocalInterface = iBinder.queryLocalInterface("com.google.android.gms.maps.internal.IOnMarkerDragListener");
            return (queryLocalInterface == null || !(queryLocalInterface instanceof C1544l)) ? new C1546a(iBinder) : (C1544l) queryLocalInterface;
        }

        public IBinder asBinder() {
            return this;
        }

        public boolean onTransact(int code, Parcel data, Parcel reply, int flags) throws RemoteException {
            switch (code) {
                case 1:
                    data.enforceInterface("com.google.android.gms.maps.internal.IOnMarkerDragListener");
                    mo8997b(C1581d.C1582a.m4272am(data.readStrongBinder()));
                    reply.writeNoException();
                    return true;
                case 2:
                    data.enforceInterface("com.google.android.gms.maps.internal.IOnMarkerDragListener");
                    mo8999d(C1581d.C1582a.m4272am(data.readStrongBinder()));
                    reply.writeNoException();
                    return true;
                case 3:
                    data.enforceInterface("com.google.android.gms.maps.internal.IOnMarkerDragListener");
                    mo8998c(C1581d.C1582a.m4272am(data.readStrongBinder()));
                    reply.writeNoException();
                    return true;
                case 1598968902:
                    reply.writeString("com.google.android.gms.maps.internal.IOnMarkerDragListener");
                    return true;
                default:
                    return super.onTransact(code, data, reply, flags);
            }
        }
    }

    /* renamed from: b */
    void mo8997b(C1581d dVar) throws RemoteException;

    /* renamed from: c */
    void mo8998c(C1581d dVar) throws RemoteException;

    /* renamed from: d */
    void mo8999d(C1581d dVar) throws RemoteException;
}
