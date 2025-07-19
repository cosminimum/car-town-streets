package com.google.android.gms.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.gms.dynamic.C0772b;

/* renamed from: com.google.android.gms.internal.bc */
public interface C0915bc extends IInterface {

    /* renamed from: com.google.android.gms.internal.bc$a */
    public static abstract class C0916a extends Binder implements C0915bc {

        /* renamed from: com.google.android.gms.internal.bc$a$a */
        private static class C0917a implements C0915bc {

            /* renamed from: dU */
            private IBinder f2214dU;

            C0917a(IBinder iBinder) {
                this.f2214dU = iBinder;
            }

            /* renamed from: a */
            public void mo7099a(C0772b bVar, C1464v vVar, String str, C0918bd bdVar) throws RemoteException {
                IBinder iBinder = null;
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.ads.internal.mediation.client.IMediationAdapter");
                    obtain.writeStrongBinder(bVar != null ? bVar.asBinder() : null);
                    if (vVar != null) {
                        obtain.writeInt(1);
                        vVar.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    obtain.writeString(str);
                    if (bdVar != null) {
                        iBinder = bdVar.asBinder();
                    }
                    obtain.writeStrongBinder(iBinder);
                    this.f2214dU.transact(3, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: a */
            public void mo7100a(C0772b bVar, C1464v vVar, String str, String str2, C0918bd bdVar) throws RemoteException {
                IBinder iBinder = null;
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.ads.internal.mediation.client.IMediationAdapter");
                    obtain.writeStrongBinder(bVar != null ? bVar.asBinder() : null);
                    if (vVar != null) {
                        obtain.writeInt(1);
                        vVar.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    obtain.writeString(str);
                    obtain.writeString(str2);
                    if (bdVar != null) {
                        iBinder = bdVar.asBinder();
                    }
                    obtain.writeStrongBinder(iBinder);
                    this.f2214dU.transact(7, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: a */
            public void mo7101a(C0772b bVar, C1466x xVar, C1464v vVar, String str, C0918bd bdVar) throws RemoteException {
                IBinder iBinder = null;
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.ads.internal.mediation.client.IMediationAdapter");
                    obtain.writeStrongBinder(bVar != null ? bVar.asBinder() : null);
                    if (xVar != null) {
                        obtain.writeInt(1);
                        xVar.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    if (vVar != null) {
                        obtain.writeInt(1);
                        vVar.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    obtain.writeString(str);
                    if (bdVar != null) {
                        iBinder = bdVar.asBinder();
                    }
                    obtain.writeStrongBinder(iBinder);
                    this.f2214dU.transact(1, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: a */
            public void mo7102a(C0772b bVar, C1466x xVar, C1464v vVar, String str, String str2, C0918bd bdVar) throws RemoteException {
                IBinder iBinder = null;
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.ads.internal.mediation.client.IMediationAdapter");
                    obtain.writeStrongBinder(bVar != null ? bVar.asBinder() : null);
                    if (xVar != null) {
                        obtain.writeInt(1);
                        xVar.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    if (vVar != null) {
                        obtain.writeInt(1);
                        vVar.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    obtain.writeString(str);
                    obtain.writeString(str2);
                    if (bdVar != null) {
                        iBinder = bdVar.asBinder();
                    }
                    obtain.writeStrongBinder(iBinder);
                    this.f2214dU.transact(6, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            public IBinder asBinder() {
                return this.f2214dU;
            }

            public void destroy() throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.ads.internal.mediation.client.IMediationAdapter");
                    this.f2214dU.transact(5, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            public C0772b getView() throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.ads.internal.mediation.client.IMediationAdapter");
                    this.f2214dU.transact(2, obtain, obtain2, 0);
                    obtain2.readException();
                    return C0772b.C0773a.m1694E(obtain2.readStrongBinder());
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            public void showInterstitial() throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.ads.internal.mediation.client.IMediationAdapter");
                    this.f2214dU.transact(4, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }
        }

        public C0916a() {
            attachInterface(this, "com.google.android.gms.ads.internal.mediation.client.IMediationAdapter");
        }

        /* renamed from: j */
        public static C0915bc m2011j(IBinder iBinder) {
            if (iBinder == null) {
                return null;
            }
            IInterface queryLocalInterface = iBinder.queryLocalInterface("com.google.android.gms.ads.internal.mediation.client.IMediationAdapter");
            return (queryLocalInterface == null || !(queryLocalInterface instanceof C0915bc)) ? new C0917a(iBinder) : (C0915bc) queryLocalInterface;
        }

        public IBinder asBinder() {
            return this;
        }

        /* JADX DEBUG: Multi-variable search result rejected for TypeSearchVarInfo{r0v13, resolved type: com.google.android.gms.internal.v} */
        /* JADX WARNING: type inference failed for: r0v0 */
        /* JADX WARNING: type inference failed for: r0v17, types: [android.os.IBinder] */
        /* JADX WARNING: type inference failed for: r0v27 */
        /* JADX WARNING: type inference failed for: r0v28 */
        /* JADX WARNING: Multi-variable type inference failed */
        /* Code decompiled incorrectly, please refer to instructions dump. */
        public boolean onTransact(int r9, android.os.Parcel r10, android.os.Parcel r11, int r12) throws android.os.RemoteException {
            /*
                r8 = this;
                r0 = 0
                r7 = 1
                switch(r9) {
                    case 1: goto L_0x0011;
                    case 2: goto L_0x004f;
                    case 3: goto L_0x0066;
                    case 4: goto L_0x0094;
                    case 5: goto L_0x00a2;
                    case 6: goto L_0x00b0;
                    case 7: goto L_0x00f3;
                    case 1598968902: goto L_0x000a;
                    default: goto L_0x0005;
                }
            L_0x0005:
                boolean r0 = super.onTransact(r9, r10, r11, r12)
            L_0x0009:
                return r0
            L_0x000a:
                java.lang.String r0 = "com.google.android.gms.ads.internal.mediation.client.IMediationAdapter"
                r11.writeString(r0)
                r0 = r7
                goto L_0x0009
            L_0x0011:
                java.lang.String r1 = "com.google.android.gms.ads.internal.mediation.client.IMediationAdapter"
                r10.enforceInterface(r1)
                android.os.IBinder r1 = r10.readStrongBinder()
                com.google.android.gms.dynamic.b r1 = com.google.android.gms.dynamic.C0772b.C0773a.m1694E(r1)
                int r2 = r10.readInt()
                if (r2 == 0) goto L_0x004b
                com.google.android.gms.internal.y r2 = com.google.android.gms.internal.C1466x.CREATOR
                com.google.android.gms.internal.x r2 = r2.createFromParcel(r10)
            L_0x002a:
                int r3 = r10.readInt()
                if (r3 == 0) goto L_0x004d
                com.google.android.gms.internal.w r0 = com.google.android.gms.internal.C1464v.CREATOR
                com.google.android.gms.internal.v r3 = r0.createFromParcel(r10)
            L_0x0036:
                java.lang.String r4 = r10.readString()
                android.os.IBinder r0 = r10.readStrongBinder()
                com.google.android.gms.internal.bd r5 = com.google.android.gms.internal.C0918bd.C0919a.m2017k(r0)
                r0 = r8
                r0.mo7101a((com.google.android.gms.dynamic.C0772b) r1, (com.google.android.gms.internal.C1466x) r2, (com.google.android.gms.internal.C1464v) r3, (java.lang.String) r4, (com.google.android.gms.internal.C0918bd) r5)
                r11.writeNoException()
                r0 = r7
                goto L_0x0009
            L_0x004b:
                r2 = r0
                goto L_0x002a
            L_0x004d:
                r3 = r0
                goto L_0x0036
            L_0x004f:
                java.lang.String r1 = "com.google.android.gms.ads.internal.mediation.client.IMediationAdapter"
                r10.enforceInterface(r1)
                com.google.android.gms.dynamic.b r1 = r8.getView()
                r11.writeNoException()
                if (r1 == 0) goto L_0x0061
                android.os.IBinder r0 = r1.asBinder()
            L_0x0061:
                r11.writeStrongBinder(r0)
                r0 = r7
                goto L_0x0009
            L_0x0066:
                java.lang.String r1 = "com.google.android.gms.ads.internal.mediation.client.IMediationAdapter"
                r10.enforceInterface(r1)
                android.os.IBinder r1 = r10.readStrongBinder()
                com.google.android.gms.dynamic.b r1 = com.google.android.gms.dynamic.C0772b.C0773a.m1694E(r1)
                int r2 = r10.readInt()
                if (r2 == 0) goto L_0x007f
                com.google.android.gms.internal.w r0 = com.google.android.gms.internal.C1464v.CREATOR
                com.google.android.gms.internal.v r0 = r0.createFromParcel(r10)
            L_0x007f:
                java.lang.String r2 = r10.readString()
                android.os.IBinder r3 = r10.readStrongBinder()
                com.google.android.gms.internal.bd r3 = com.google.android.gms.internal.C0918bd.C0919a.m2017k(r3)
                r8.mo7099a(r1, r0, r2, r3)
                r11.writeNoException()
                r0 = r7
                goto L_0x0009
            L_0x0094:
                java.lang.String r0 = "com.google.android.gms.ads.internal.mediation.client.IMediationAdapter"
                r10.enforceInterface(r0)
                r8.showInterstitial()
                r11.writeNoException()
                r0 = r7
                goto L_0x0009
            L_0x00a2:
                java.lang.String r0 = "com.google.android.gms.ads.internal.mediation.client.IMediationAdapter"
                r10.enforceInterface(r0)
                r8.destroy()
                r11.writeNoException()
                r0 = r7
                goto L_0x0009
            L_0x00b0:
                java.lang.String r1 = "com.google.android.gms.ads.internal.mediation.client.IMediationAdapter"
                r10.enforceInterface(r1)
                android.os.IBinder r1 = r10.readStrongBinder()
                com.google.android.gms.dynamic.b r1 = com.google.android.gms.dynamic.C0772b.C0773a.m1694E(r1)
                int r2 = r10.readInt()
                if (r2 == 0) goto L_0x00ef
                com.google.android.gms.internal.y r2 = com.google.android.gms.internal.C1466x.CREATOR
                com.google.android.gms.internal.x r2 = r2.createFromParcel(r10)
            L_0x00c9:
                int r3 = r10.readInt()
                if (r3 == 0) goto L_0x00f1
                com.google.android.gms.internal.w r0 = com.google.android.gms.internal.C1464v.CREATOR
                com.google.android.gms.internal.v r3 = r0.createFromParcel(r10)
            L_0x00d5:
                java.lang.String r4 = r10.readString()
                java.lang.String r5 = r10.readString()
                android.os.IBinder r0 = r10.readStrongBinder()
                com.google.android.gms.internal.bd r6 = com.google.android.gms.internal.C0918bd.C0919a.m2017k(r0)
                r0 = r8
                r0.mo7102a(r1, r2, r3, r4, r5, r6)
                r11.writeNoException()
                r0 = r7
                goto L_0x0009
            L_0x00ef:
                r2 = r0
                goto L_0x00c9
            L_0x00f1:
                r3 = r0
                goto L_0x00d5
            L_0x00f3:
                java.lang.String r1 = "com.google.android.gms.ads.internal.mediation.client.IMediationAdapter"
                r10.enforceInterface(r1)
                android.os.IBinder r1 = r10.readStrongBinder()
                com.google.android.gms.dynamic.b r1 = com.google.android.gms.dynamic.C0772b.C0773a.m1694E(r1)
                int r2 = r10.readInt()
                if (r2 == 0) goto L_0x0126
                com.google.android.gms.internal.w r0 = com.google.android.gms.internal.C1464v.CREATOR
                com.google.android.gms.internal.v r2 = r0.createFromParcel(r10)
            L_0x010c:
                java.lang.String r3 = r10.readString()
                java.lang.String r4 = r10.readString()
                android.os.IBinder r0 = r10.readStrongBinder()
                com.google.android.gms.internal.bd r5 = com.google.android.gms.internal.C0918bd.C0919a.m2017k(r0)
                r0 = r8
                r0.mo7100a((com.google.android.gms.dynamic.C0772b) r1, (com.google.android.gms.internal.C1464v) r2, (java.lang.String) r3, (java.lang.String) r4, (com.google.android.gms.internal.C0918bd) r5)
                r11.writeNoException()
                r0 = r7
                goto L_0x0009
            L_0x0126:
                r2 = r0
                goto L_0x010c
            */
            throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.internal.C0915bc.C0916a.onTransact(int, android.os.Parcel, android.os.Parcel, int):boolean");
        }
    }

    /* renamed from: a */
    void mo7099a(C0772b bVar, C1464v vVar, String str, C0918bd bdVar) throws RemoteException;

    /* renamed from: a */
    void mo7100a(C0772b bVar, C1464v vVar, String str, String str2, C0918bd bdVar) throws RemoteException;

    /* renamed from: a */
    void mo7101a(C0772b bVar, C1466x xVar, C1464v vVar, String str, C0918bd bdVar) throws RemoteException;

    /* renamed from: a */
    void mo7102a(C0772b bVar, C1466x xVar, C1464v vVar, String str, String str2, C0918bd bdVar) throws RemoteException;

    void destroy() throws RemoteException;

    C0772b getView() throws RemoteException;

    void showInterstitial() throws RemoteException;
}
