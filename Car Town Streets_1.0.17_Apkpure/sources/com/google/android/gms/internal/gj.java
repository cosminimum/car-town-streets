package com.google.android.gms.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.gms.common.api.Status;
/* loaded from: classes.dex */
public interface gj extends IInterface {

    /* loaded from: classes.dex */
    public static abstract class a extends Binder implements gj {

        /* renamed from: com.google.android.gms.internal.gj$a$a  reason: collision with other inner class name */
        /* loaded from: classes.dex */
        private static class C0041a implements gj {
            private IBinder dU;

            C0041a(IBinder iBinder) {
                this.dU = iBinder;
            }

            @Override // com.google.android.gms.internal.gj
            public void I(Status status) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.location.internal.ICopresenceCallbacks");
                    if (status != null) {
                        obtain.writeInt(1);
                        status.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    this.dU.transact(3, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.internal.gj
            public void a(int i, gh ghVar) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.location.internal.ICopresenceCallbacks");
                    obtain.writeInt(i);
                    if (ghVar != null) {
                        obtain.writeInt(1);
                        ghVar.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    this.dU.transact(4, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.internal.gj
            public void a(int i, boolean z) throws RemoteException {
                int i2 = 0;
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.location.internal.ICopresenceCallbacks");
                    obtain.writeInt(i);
                    if (z) {
                        i2 = 1;
                    }
                    obtain.writeInt(i2);
                    this.dU.transact(6, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // android.os.IInterface
            public IBinder asBinder() {
                return this.dU;
            }

            @Override // com.google.android.gms.internal.gj
            public void b(int i, gh ghVar) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.location.internal.ICopresenceCallbacks");
                    obtain.writeInt(i);
                    if (ghVar != null) {
                        obtain.writeInt(1);
                        ghVar.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    this.dU.transact(5, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }
        }

        public static gj J(IBinder iBinder) {
            if (iBinder == null) {
                return null;
            }
            IInterface queryLocalInterface = iBinder.queryLocalInterface("com.google.android.gms.location.internal.ICopresenceCallbacks");
            return (queryLocalInterface == null || !(queryLocalInterface instanceof gj)) ? new C0041a(iBinder) : (gj) queryLocalInterface;
        }

        @Override // android.os.IInterface
        public IBinder asBinder() {
            return this;
        }

        @Override // android.os.Binder
        public boolean onTransact(int code, Parcel data, Parcel reply, int flags) throws RemoteException {
            gh ghVar = null;
            Status status = null;
            gh ghVar2 = null;
            switch (code) {
                case 3:
                    data.enforceInterface("com.google.android.gms.location.internal.ICopresenceCallbacks");
                    if (data.readInt() != 0) {
                        status = Status.CREATOR.mo333createFromParcel(data);
                    }
                    I(status);
                    reply.writeNoException();
                    return true;
                case 4:
                    data.enforceInterface("com.google.android.gms.location.internal.ICopresenceCallbacks");
                    int readInt = data.readInt();
                    if (data.readInt() != 0) {
                        ghVar2 = gh.CREATOR.createFromParcel(data);
                    }
                    a(readInt, ghVar2);
                    reply.writeNoException();
                    return true;
                case 5:
                    data.enforceInterface("com.google.android.gms.location.internal.ICopresenceCallbacks");
                    int readInt2 = data.readInt();
                    if (data.readInt() != 0) {
                        ghVar = gh.CREATOR.createFromParcel(data);
                    }
                    b(readInt2, ghVar);
                    reply.writeNoException();
                    return true;
                case 6:
                    data.enforceInterface("com.google.android.gms.location.internal.ICopresenceCallbacks");
                    a(data.readInt(), data.readInt() != 0);
                    reply.writeNoException();
                    return true;
                case 1598968902:
                    reply.writeString("com.google.android.gms.location.internal.ICopresenceCallbacks");
                    return true;
                default:
                    return super.onTransact(code, data, reply, flags);
            }
        }
    }

    void I(Status status) throws RemoteException;

    void a(int i, gh ghVar) throws RemoteException;

    void a(int i, boolean z) throws RemoteException;

    void b(int i, gh ghVar) throws RemoteException;
}
