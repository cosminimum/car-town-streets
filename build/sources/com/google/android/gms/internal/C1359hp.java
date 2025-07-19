package com.google.android.gms.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.gms.dynamic.C0772b;

/* renamed from: com.google.android.gms.internal.hp */
public interface C1359hp extends IInterface {

    /* renamed from: com.google.android.gms.internal.hp$a */
    public static abstract class C1360a extends Binder implements C1359hp {

        /* renamed from: com.google.android.gms.internal.hp$a$a */
        private static class C1361a implements C1359hp {

            /* renamed from: dU */
            private IBinder f3200dU;

            C1361a(IBinder iBinder) {
                this.f3200dU = iBinder;
            }

            /* renamed from: a */
            public C0772b mo8258a(C0772b bVar, int i, int i2, String str, int i3) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.plus.internal.IPlusOneButtonCreator");
                    obtain.writeStrongBinder(bVar != null ? bVar.asBinder() : null);
                    obtain.writeInt(i);
                    obtain.writeInt(i2);
                    obtain.writeString(str);
                    obtain.writeInt(i3);
                    this.f3200dU.transact(1, obtain, obtain2, 0);
                    obtain2.readException();
                    return C0772b.C0773a.m1694E(obtain2.readStrongBinder());
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: a */
            public C0772b mo8259a(C0772b bVar, int i, int i2, String str, String str2) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.plus.internal.IPlusOneButtonCreator");
                    obtain.writeStrongBinder(bVar != null ? bVar.asBinder() : null);
                    obtain.writeInt(i);
                    obtain.writeInt(i2);
                    obtain.writeString(str);
                    obtain.writeString(str2);
                    this.f3200dU.transact(2, obtain, obtain2, 0);
                    obtain2.readException();
                    return C0772b.C0773a.m1694E(obtain2.readStrongBinder());
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            public IBinder asBinder() {
                return this.f3200dU;
            }
        }

        /* renamed from: av */
        public static C1359hp m3637av(IBinder iBinder) {
            if (iBinder == null) {
                return null;
            }
            IInterface queryLocalInterface = iBinder.queryLocalInterface("com.google.android.gms.plus.internal.IPlusOneButtonCreator");
            return (queryLocalInterface == null || !(queryLocalInterface instanceof C1359hp)) ? new C1361a(iBinder) : (C1359hp) queryLocalInterface;
        }

        public boolean onTransact(int code, Parcel data, Parcel reply, int flags) throws RemoteException {
            IBinder iBinder = null;
            switch (code) {
                case 1:
                    data.enforceInterface("com.google.android.gms.plus.internal.IPlusOneButtonCreator");
                    C0772b a = mo8258a(C0772b.C0773a.m1694E(data.readStrongBinder()), data.readInt(), data.readInt(), data.readString(), data.readInt());
                    reply.writeNoException();
                    reply.writeStrongBinder(a != null ? a.asBinder() : null);
                    return true;
                case 2:
                    data.enforceInterface("com.google.android.gms.plus.internal.IPlusOneButtonCreator");
                    C0772b a2 = mo8259a(C0772b.C0773a.m1694E(data.readStrongBinder()), data.readInt(), data.readInt(), data.readString(), data.readString());
                    reply.writeNoException();
                    if (a2 != null) {
                        iBinder = a2.asBinder();
                    }
                    reply.writeStrongBinder(iBinder);
                    return true;
                case 1598968902:
                    reply.writeString("com.google.android.gms.plus.internal.IPlusOneButtonCreator");
                    return true;
                default:
                    return super.onTransact(code, data, reply, flags);
            }
        }
    }

    /* renamed from: a */
    C0772b mo8258a(C0772b bVar, int i, int i2, String str, int i3) throws RemoteException;

    /* renamed from: a */
    C0772b mo8259a(C0772b bVar, int i, int i2, String str, String str2) throws RemoteException;
}
