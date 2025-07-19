package com.google.android.gms.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;

/* renamed from: com.google.android.gms.internal.ae */
public interface C0861ae extends IInterface {

    /* renamed from: com.google.android.gms.internal.ae$a */
    public static abstract class C0862a extends Binder implements C0861ae {

        /* renamed from: com.google.android.gms.internal.ae$a$a */
        private static class C0863a implements C0861ae {

            /* renamed from: dU */
            private IBinder f1909dU;

            C0863a(IBinder iBinder) {
                this.f1909dU = iBinder;
            }

            public IBinder asBinder() {
                return this.f1909dU;
            }

            public void onAppEvent(String name, String info) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.ads.internal.client.IAppEventListener");
                    obtain.writeString(name);
                    obtain.writeString(info);
                    this.f1909dU.transact(1, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }
        }

        public C0862a() {
            attachInterface(this, "com.google.android.gms.ads.internal.client.IAppEventListener");
        }

        /* renamed from: h */
        public static C0861ae m1915h(IBinder iBinder) {
            if (iBinder == null) {
                return null;
            }
            IInterface queryLocalInterface = iBinder.queryLocalInterface("com.google.android.gms.ads.internal.client.IAppEventListener");
            return (queryLocalInterface == null || !(queryLocalInterface instanceof C0861ae)) ? new C0863a(iBinder) : (C0861ae) queryLocalInterface;
        }

        public IBinder asBinder() {
            return this;
        }

        public boolean onTransact(int code, Parcel data, Parcel reply, int flags) throws RemoteException {
            switch (code) {
                case 1:
                    data.enforceInterface("com.google.android.gms.ads.internal.client.IAppEventListener");
                    onAppEvent(data.readString(), data.readString());
                    reply.writeNoException();
                    return true;
                case 1598968902:
                    reply.writeString("com.google.android.gms.ads.internal.client.IAppEventListener");
                    return true;
                default:
                    return super.onTransact(code, data, reply, flags);
            }
        }
    }

    void onAppEvent(String str, String str2) throws RemoteException;
}
