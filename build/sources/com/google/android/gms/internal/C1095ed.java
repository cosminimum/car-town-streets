package com.google.android.gms.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.gms.dynamic.C0772b;

/* renamed from: com.google.android.gms.internal.ed */
public interface C1095ed extends IInterface {

    /* renamed from: com.google.android.gms.internal.ed$a */
    public static abstract class C1096a extends Binder implements C1095ed {

        /* renamed from: com.google.android.gms.internal.ed$a$a */
        private static class C1097a implements C1095ed {

            /* renamed from: dU */
            private IBinder f2623dU;

            C1097a(IBinder iBinder) {
                this.f2623dU = iBinder;
            }

            /* renamed from: a */
            public C0772b mo7532a(C0772b bVar, int i, int i2) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.common.internal.ISignInButtonCreator");
                    obtain.writeStrongBinder(bVar != null ? bVar.asBinder() : null);
                    obtain.writeInt(i);
                    obtain.writeInt(i2);
                    this.f2623dU.transact(1, obtain, obtain2, 0);
                    obtain2.readException();
                    return C0772b.C0773a.m1694E(obtain2.readStrongBinder());
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            public IBinder asBinder() {
                return this.f2623dU;
            }
        }

        /* renamed from: z */
        public static C1095ed m2602z(IBinder iBinder) {
            if (iBinder == null) {
                return null;
            }
            IInterface queryLocalInterface = iBinder.queryLocalInterface("com.google.android.gms.common.internal.ISignInButtonCreator");
            return (queryLocalInterface == null || !(queryLocalInterface instanceof C1095ed)) ? new C1097a(iBinder) : (C1095ed) queryLocalInterface;
        }

        public boolean onTransact(int code, Parcel data, Parcel reply, int flags) throws RemoteException {
            switch (code) {
                case 1:
                    data.enforceInterface("com.google.android.gms.common.internal.ISignInButtonCreator");
                    C0772b a = mo7532a(C0772b.C0773a.m1694E(data.readStrongBinder()), data.readInt(), data.readInt());
                    reply.writeNoException();
                    reply.writeStrongBinder(a != null ? a.asBinder() : null);
                    return true;
                case 1598968902:
                    reply.writeString("com.google.android.gms.common.internal.ISignInButtonCreator");
                    return true;
                default:
                    return super.onTransact(code, data, reply, flags);
            }
        }
    }

    /* renamed from: a */
    C0772b mo7532a(C0772b bVar, int i, int i2) throws RemoteException;
}
