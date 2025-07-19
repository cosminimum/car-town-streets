package com.google.android.gms.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.gms.dynamic.C0772b;

/* renamed from: com.google.android.gms.internal.bt */
public interface C0956bt extends IInterface {

    /* renamed from: com.google.android.gms.internal.bt$a */
    public static abstract class C0957a extends Binder implements C0956bt {

        /* renamed from: com.google.android.gms.internal.bt$a$a */
        private static class C0958a implements C0956bt {

            /* renamed from: dU */
            private IBinder f2280dU;

            C0958a(IBinder iBinder) {
                this.f2280dU = iBinder;
            }

            /* renamed from: a */
            public IBinder mo7183a(C0772b bVar) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.ads.internal.overlay.client.IAdOverlayCreator");
                    obtain.writeStrongBinder(bVar != null ? bVar.asBinder() : null);
                    this.f2280dU.transact(1, obtain, obtain2, 0);
                    obtain2.readException();
                    return obtain2.readStrongBinder();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            public IBinder asBinder() {
                return this.f2280dU;
            }
        }

        /* renamed from: n */
        public static C0956bt m2080n(IBinder iBinder) {
            if (iBinder == null) {
                return null;
            }
            IInterface queryLocalInterface = iBinder.queryLocalInterface("com.google.android.gms.ads.internal.overlay.client.IAdOverlayCreator");
            return (queryLocalInterface == null || !(queryLocalInterface instanceof C0956bt)) ? new C0958a(iBinder) : (C0956bt) queryLocalInterface;
        }

        public boolean onTransact(int code, Parcel data, Parcel reply, int flags) throws RemoteException {
            switch (code) {
                case 1:
                    data.enforceInterface("com.google.android.gms.ads.internal.overlay.client.IAdOverlayCreator");
                    IBinder a = mo7183a(C0772b.C0773a.m1694E(data.readStrongBinder()));
                    reply.writeNoException();
                    reply.writeStrongBinder(a);
                    return true;
                case 1598968902:
                    reply.writeString("com.google.android.gms.ads.internal.overlay.client.IAdOverlayCreator");
                    return true;
                default:
                    return super.onTransact(code, data, reply, flags);
            }
        }
    }

    /* renamed from: a */
    IBinder mo7183a(C0772b bVar) throws RemoteException;
}
