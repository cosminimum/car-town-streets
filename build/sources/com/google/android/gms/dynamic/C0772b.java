package com.google.android.gms.dynamic;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;

/* renamed from: com.google.android.gms.dynamic.b */
public interface C0772b extends IInterface {

    /* renamed from: com.google.android.gms.dynamic.b$a */
    public static abstract class C0773a extends Binder implements C0772b {

        /* renamed from: com.google.android.gms.dynamic.b$a$a */
        private static class C0774a implements C0772b {

            /* renamed from: dU */
            private IBinder f1629dU;

            C0774a(IBinder iBinder) {
                this.f1629dU = iBinder;
            }

            public IBinder asBinder() {
                return this.f1629dU;
            }
        }

        public C0773a() {
            attachInterface(this, "com.google.android.gms.dynamic.IObjectWrapper");
        }

        /* renamed from: E */
        public static C0772b m1694E(IBinder iBinder) {
            if (iBinder == null) {
                return null;
            }
            IInterface queryLocalInterface = iBinder.queryLocalInterface("com.google.android.gms.dynamic.IObjectWrapper");
            return (queryLocalInterface == null || !(queryLocalInterface instanceof C0772b)) ? new C0774a(iBinder) : (C0772b) queryLocalInterface;
        }

        public IBinder asBinder() {
            return this;
        }

        public boolean onTransact(int code, Parcel data, Parcel reply, int flags) throws RemoteException {
            switch (code) {
                case 1598968902:
                    reply.writeString("com.google.android.gms.dynamic.IObjectWrapper");
                    return true;
                default:
                    return super.onTransact(code, data, reply, flags);
            }
        }
    }
}
