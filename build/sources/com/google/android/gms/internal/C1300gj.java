package com.google.android.gms.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.gms.common.api.Status;

/* renamed from: com.google.android.gms.internal.gj */
public interface C1300gj extends IInterface {

    /* renamed from: com.google.android.gms.internal.gj$a */
    public static abstract class C1301a extends Binder implements C1300gj {

        /* renamed from: com.google.android.gms.internal.gj$a$a */
        private static class C1302a implements C1300gj {

            /* renamed from: dU */
            private IBinder f2968dU;

            C1302a(IBinder iBinder) {
                this.f2968dU = iBinder;
            }

            /* renamed from: I */
            public void mo8026I(Status status) throws RemoteException {
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
                    this.f2968dU.transact(3, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: a */
            public void mo8027a(int i, C1298gh ghVar) throws RemoteException {
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
                    this.f2968dU.transact(4, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: a */
            public void mo8028a(int i, boolean z) throws RemoteException {
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
                    this.f2968dU.transact(6, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            public IBinder asBinder() {
                return this.f2968dU;
            }

            /* renamed from: b */
            public void mo8029b(int i, C1298gh ghVar) throws RemoteException {
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
                    this.f2968dU.transact(5, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }
        }

        /* renamed from: J */
        public static C1300gj m3429J(IBinder iBinder) {
            if (iBinder == null) {
                return null;
            }
            IInterface queryLocalInterface = iBinder.queryLocalInterface("com.google.android.gms.location.internal.ICopresenceCallbacks");
            return (queryLocalInterface == null || !(queryLocalInterface instanceof C1300gj)) ? new C1302a(iBinder) : (C1300gj) queryLocalInterface;
        }

        public IBinder asBinder() {
            return this;
        }

        /* JADX DEBUG: Multi-variable search result rejected for TypeSearchVarInfo{r0v6, resolved type: com.google.android.gms.internal.gh} */
        /* JADX DEBUG: Multi-variable search result rejected for TypeSearchVarInfo{r0v9, resolved type: com.google.android.gms.internal.gh} */
        /* JADX DEBUG: Multi-variable search result rejected for TypeSearchVarInfo{r0v12, resolved type: com.google.android.gms.common.api.Status} */
        /* JADX WARNING: type inference failed for: r0v0 */
        /* JADX WARNING: type inference failed for: r0v16 */
        /* JADX WARNING: type inference failed for: r0v17 */
        /* JADX WARNING: type inference failed for: r0v18 */
        /* JADX WARNING: Multi-variable type inference failed */
        /* Code decompiled incorrectly, please refer to instructions dump. */
        public boolean onTransact(int r5, android.os.Parcel r6, android.os.Parcel r7, int r8) throws android.os.RemoteException {
            /*
                r4 = this;
                r0 = 0
                r1 = 1
                switch(r5) {
                    case 3: goto L_0x0010;
                    case 4: goto L_0x0028;
                    case 5: goto L_0x0044;
                    case 6: goto L_0x0060;
                    case 1598968902: goto L_0x000a;
                    default: goto L_0x0005;
                }
            L_0x0005:
                boolean r1 = super.onTransact(r5, r6, r7, r8)
            L_0x0009:
                return r1
            L_0x000a:
                java.lang.String r0 = "com.google.android.gms.location.internal.ICopresenceCallbacks"
                r7.writeString(r0)
                goto L_0x0009
            L_0x0010:
                java.lang.String r2 = "com.google.android.gms.location.internal.ICopresenceCallbacks"
                r6.enforceInterface(r2)
                int r2 = r6.readInt()
                if (r2 == 0) goto L_0x0021
                com.google.android.gms.common.api.StatusCreator r0 = com.google.android.gms.common.api.Status.CREATOR
                com.google.android.gms.common.api.Status r0 = r0.createFromParcel((android.os.Parcel) r6)
            L_0x0021:
                r4.mo8026I(r0)
                r7.writeNoException()
                goto L_0x0009
            L_0x0028:
                java.lang.String r2 = "com.google.android.gms.location.internal.ICopresenceCallbacks"
                r6.enforceInterface(r2)
                int r2 = r6.readInt()
                int r3 = r6.readInt()
                if (r3 == 0) goto L_0x003d
                com.google.android.gms.internal.gi r0 = com.google.android.gms.internal.C1298gh.CREATOR
                com.google.android.gms.internal.gh r0 = r0.createFromParcel(r6)
            L_0x003d:
                r4.mo8027a((int) r2, (com.google.android.gms.internal.C1298gh) r0)
                r7.writeNoException()
                goto L_0x0009
            L_0x0044:
                java.lang.String r2 = "com.google.android.gms.location.internal.ICopresenceCallbacks"
                r6.enforceInterface(r2)
                int r2 = r6.readInt()
                int r3 = r6.readInt()
                if (r3 == 0) goto L_0x0059
                com.google.android.gms.internal.gi r0 = com.google.android.gms.internal.C1298gh.CREATOR
                com.google.android.gms.internal.gh r0 = r0.createFromParcel(r6)
            L_0x0059:
                r4.mo8029b(r2, r0)
                r7.writeNoException()
                goto L_0x0009
            L_0x0060:
                java.lang.String r0 = "com.google.android.gms.location.internal.ICopresenceCallbacks"
                r6.enforceInterface(r0)
                int r2 = r6.readInt()
                int r0 = r6.readInt()
                if (r0 == 0) goto L_0x0077
                r0 = r1
            L_0x0070:
                r4.mo8028a((int) r2, (boolean) r0)
                r7.writeNoException()
                goto L_0x0009
            L_0x0077:
                r0 = 0
                goto L_0x0070
            */
            throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.internal.C1300gj.C1301a.onTransact(int, android.os.Parcel, android.os.Parcel, int):boolean");
        }
    }

    /* renamed from: I */
    void mo8026I(Status status) throws RemoteException;

    /* renamed from: a */
    void mo8027a(int i, C1298gh ghVar) throws RemoteException;

    /* renamed from: a */
    void mo8028a(int i, boolean z) throws RemoteException;

    /* renamed from: b */
    void mo8029b(int i, C1298gh ghVar) throws RemoteException;
}
