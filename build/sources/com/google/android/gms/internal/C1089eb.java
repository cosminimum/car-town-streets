package com.google.android.gms.internal;

import android.os.Binder;
import android.os.Bundle;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;

/* renamed from: com.google.android.gms.internal.eb */
public interface C1089eb extends IInterface {

    /* renamed from: com.google.android.gms.internal.eb$a */
    public static abstract class C1090a extends Binder implements C1089eb {

        /* renamed from: com.google.android.gms.internal.eb$a$a */
        private static class C1091a implements C1089eb {

            /* renamed from: dU */
            private IBinder f2621dU;

            C1091a(IBinder iBinder) {
                this.f2621dU = iBinder;
            }

            public IBinder asBinder() {
                return this.f2621dU;
            }

            /* renamed from: b */
            public void mo7464b(int i, IBinder iBinder, Bundle bundle) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.common.internal.IGmsCallbacks");
                    obtain.writeInt(i);
                    obtain.writeStrongBinder(iBinder);
                    if (bundle != null) {
                        obtain.writeInt(1);
                        bundle.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    this.f2621dU.transact(1, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }
        }

        public C1090a() {
            attachInterface(this, "com.google.android.gms.common.internal.IGmsCallbacks");
        }

        /* renamed from: x */
        public static C1089eb m2556x(IBinder iBinder) {
            if (iBinder == null) {
                return null;
            }
            IInterface queryLocalInterface = iBinder.queryLocalInterface("com.google.android.gms.common.internal.IGmsCallbacks");
            return (queryLocalInterface == null || !(queryLocalInterface instanceof C1089eb)) ? new C1091a(iBinder) : (C1089eb) queryLocalInterface;
        }

        public IBinder asBinder() {
            return this;
        }

        public boolean onTransact(int code, Parcel data, Parcel reply, int flags) throws RemoteException {
            switch (code) {
                case 1:
                    data.enforceInterface("com.google.android.gms.common.internal.IGmsCallbacks");
                    mo7464b(data.readInt(), data.readStrongBinder(), data.readInt() != 0 ? (Bundle) Bundle.CREATOR.createFromParcel(data) : null);
                    reply.writeNoException();
                    return true;
                case 1598968902:
                    reply.writeString("com.google.android.gms.common.internal.IGmsCallbacks");
                    return true;
                default:
                    return super.onTransact(code, data, reply, flags);
            }
        }
    }

    /* renamed from: b */
    void mo7464b(int i, IBinder iBinder, Bundle bundle) throws RemoteException;
}
