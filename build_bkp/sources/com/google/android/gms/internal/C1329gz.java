package com.google.android.gms.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;

/* renamed from: com.google.android.gms.internal.gz */
public interface C1329gz extends IInterface {

    /* renamed from: com.google.android.gms.internal.gz$a */
    public static abstract class C1330a extends Binder implements C1329gz {

        /* renamed from: com.google.android.gms.internal.gz$a$a */
        private static class C1331a implements C1329gz {

            /* renamed from: dU */
            private IBinder f3140dU;

            C1331a(IBinder iBinder) {
                this.f3140dU = iBinder;
            }

            /* renamed from: a */
            public void mo8156a(int i, C1334hb hbVar) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.location.places.internal.IPlacesCallbacks");
                    obtain.writeInt(i);
                    if (hbVar != null) {
                        obtain.writeInt(1);
                        hbVar.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    this.f3140dU.transact(1, obtain, (Parcel) null, 1);
                } finally {
                    obtain.recycle();
                }
            }

            public IBinder asBinder() {
                return this.f3140dU;
            }
        }

        /* renamed from: N */
        public static C1329gz m3543N(IBinder iBinder) {
            if (iBinder == null) {
                return null;
            }
            IInterface queryLocalInterface = iBinder.queryLocalInterface("com.google.android.gms.location.places.internal.IPlacesCallbacks");
            return (queryLocalInterface == null || !(queryLocalInterface instanceof C1329gz)) ? new C1331a(iBinder) : (C1329gz) queryLocalInterface;
        }

        public IBinder asBinder() {
            return this;
        }

        public boolean onTransact(int code, Parcel data, Parcel reply, int flags) throws RemoteException {
            switch (code) {
                case 1:
                    data.enforceInterface("com.google.android.gms.location.places.internal.IPlacesCallbacks");
                    mo8156a(data.readInt(), data.readInt() != 0 ? C1334hb.CREATOR.createFromParcel(data) : null);
                    return true;
                case 1598968902:
                    reply.writeString("com.google.android.gms.location.places.internal.IPlacesCallbacks");
                    return true;
                default:
                    return super.onTransact(code, data, reply, flags);
            }
        }
    }

    /* renamed from: a */
    void mo8156a(int i, C1334hb hbVar) throws RemoteException;
}
