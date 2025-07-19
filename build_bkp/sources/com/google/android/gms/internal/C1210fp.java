package com.google.android.gms.internal;

import android.content.Intent;
import android.net.Uri;
import android.os.Binder;
import android.os.Bundle;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.ParcelFileDescriptor;
import android.os.RemoteException;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.games.multiplayer.ParticipantEntity;
import com.google.android.gms.games.multiplayer.ParticipantResult;
import com.google.android.gms.games.multiplayer.realtime.RoomEntity;

/* renamed from: com.google.android.gms.internal.fp */
public interface C1210fp extends IInterface {

    /* renamed from: com.google.android.gms.internal.fp$a */
    public static abstract class C1211a extends Binder implements C1210fp {

        /* renamed from: com.google.android.gms.internal.fp$a$a */
        private static class C1212a implements C1210fp {

            /* renamed from: dU */
            private IBinder f2826dU;

            C1212a(IBinder iBinder) {
                this.f2826dU = iBinder;
            }

            /* renamed from: a */
            public int mo7818a(C1207fo foVar, byte[] bArr, String str, String str2) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeStrongBinder(foVar != null ? foVar.asBinder() : null);
                    obtain.writeByteArray(bArr);
                    obtain.writeString(str);
                    obtain.writeString(str2);
                    this.f2826dU.transact(5033, obtain, obtain2, 0);
                    obtain2.readException();
                    return obtain2.readInt();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: a */
            public Intent mo7819a(RoomEntity roomEntity, int i) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    if (roomEntity != null) {
                        obtain.writeInt(1);
                        roomEntity.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    obtain.writeInt(i);
                    this.f2826dU.transact(9011, obtain, obtain2, 0);
                    obtain2.readException();
                    return obtain2.readInt() != 0 ? (Intent) Intent.CREATOR.createFromParcel(obtain2) : null;
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: a */
            public Intent mo7820a(ParticipantEntity[] participantEntityArr, String str, String str2, Uri uri, Uri uri2) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeTypedArray(participantEntityArr, 0);
                    obtain.writeString(str);
                    obtain.writeString(str2);
                    if (uri != null) {
                        obtain.writeInt(1);
                        uri.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    if (uri2 != null) {
                        obtain.writeInt(1);
                        uri2.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    this.f2826dU.transact(9031, obtain, obtain2, 0);
                    obtain2.readException();
                    return obtain2.readInt() != 0 ? (Intent) Intent.CREATOR.createFromParcel(obtain2) : null;
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: a */
            public void mo7821a(long j, String str) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeLong(j);
                    obtain.writeString(str);
                    this.f2826dU.transact(8019, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: a */
            public void mo7822a(IBinder iBinder, Bundle bundle) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeStrongBinder(iBinder);
                    if (bundle != null) {
                        obtain.writeInt(1);
                        bundle.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    this.f2826dU.transact(5005, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: a */
            public void mo7823a(C1207fo foVar) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeStrongBinder(foVar != null ? foVar.asBinder() : null);
                    this.f2826dU.transact(5002, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: a */
            public void mo7824a(C1207fo foVar, int i, int i2, boolean z, boolean z2) throws RemoteException {
                int i3 = 1;
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeStrongBinder(foVar != null ? foVar.asBinder() : null);
                    obtain.writeInt(i);
                    obtain.writeInt(i2);
                    obtain.writeInt(z ? 1 : 0);
                    if (!z2) {
                        i3 = 0;
                    }
                    obtain.writeInt(i3);
                    this.f2826dU.transact(5044, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: a */
            public void mo7825a(C1207fo foVar, int i, int i2, String[] strArr, Bundle bundle) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeStrongBinder(foVar != null ? foVar.asBinder() : null);
                    obtain.writeInt(i);
                    obtain.writeInt(i2);
                    obtain.writeStringArray(strArr);
                    if (bundle != null) {
                        obtain.writeInt(1);
                        bundle.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    this.f2826dU.transact(8004, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: a */
            public void mo7826a(C1207fo foVar, int i, boolean z, boolean z2) throws RemoteException {
                int i2 = 1;
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeStrongBinder(foVar != null ? foVar.asBinder() : null);
                    obtain.writeInt(i);
                    obtain.writeInt(z ? 1 : 0);
                    if (!z2) {
                        i2 = 0;
                    }
                    obtain.writeInt(i2);
                    this.f2826dU.transact(5015, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: a */
            public void mo7827a(C1207fo foVar, long j) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeStrongBinder(foVar != null ? foVar.asBinder() : null);
                    obtain.writeLong(j);
                    this.f2826dU.transact(5058, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: a */
            public void mo7828a(C1207fo foVar, long j, String str) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeStrongBinder(foVar != null ? foVar.asBinder() : null);
                    obtain.writeLong(j);
                    obtain.writeString(str);
                    this.f2826dU.transact(8018, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: a */
            public void mo7829a(C1207fo foVar, Bundle bundle, int i, int i2) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeStrongBinder(foVar != null ? foVar.asBinder() : null);
                    if (bundle != null) {
                        obtain.writeInt(1);
                        bundle.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    obtain.writeInt(i);
                    obtain.writeInt(i2);
                    this.f2826dU.transact(5021, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: a */
            public void mo7830a(C1207fo foVar, IBinder iBinder, int i, String[] strArr, Bundle bundle, boolean z, long j) throws RemoteException {
                int i2 = 1;
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeStrongBinder(foVar != null ? foVar.asBinder() : null);
                    obtain.writeStrongBinder(iBinder);
                    obtain.writeInt(i);
                    obtain.writeStringArray(strArr);
                    if (bundle != null) {
                        obtain.writeInt(1);
                        bundle.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    if (!z) {
                        i2 = 0;
                    }
                    obtain.writeInt(i2);
                    obtain.writeLong(j);
                    this.f2826dU.transact(5030, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: a */
            public void mo7831a(C1207fo foVar, IBinder iBinder, String str, boolean z, long j) throws RemoteException {
                int i = 0;
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeStrongBinder(foVar != null ? foVar.asBinder() : null);
                    obtain.writeStrongBinder(iBinder);
                    obtain.writeString(str);
                    if (z) {
                        i = 1;
                    }
                    obtain.writeInt(i);
                    obtain.writeLong(j);
                    this.f2826dU.transact(5031, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: a */
            public void mo7832a(C1207fo foVar, String str) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeStrongBinder(foVar != null ? foVar.asBinder() : null);
                    obtain.writeString(str);
                    this.f2826dU.transact(5008, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: a */
            public void mo7833a(C1207fo foVar, String str, int i, int i2, int i3, boolean z) throws RemoteException {
                int i4 = 0;
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeStrongBinder(foVar != null ? foVar.asBinder() : null);
                    obtain.writeString(str);
                    obtain.writeInt(i);
                    obtain.writeInt(i2);
                    obtain.writeInt(i3);
                    if (z) {
                        i4 = 1;
                    }
                    obtain.writeInt(i4);
                    this.f2826dU.transact(5019, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: a */
            public void mo7834a(C1207fo foVar, String str, int i, IBinder iBinder, Bundle bundle) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeStrongBinder(foVar != null ? foVar.asBinder() : null);
                    obtain.writeString(str);
                    obtain.writeInt(i);
                    obtain.writeStrongBinder(iBinder);
                    if (bundle != null) {
                        obtain.writeInt(1);
                        bundle.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    this.f2826dU.transact(5025, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: a */
            public void mo7835a(C1207fo foVar, String str, int i, boolean z) throws RemoteException {
                int i2 = 0;
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeStrongBinder(foVar != null ? foVar.asBinder() : null);
                    obtain.writeString(str);
                    obtain.writeInt(i);
                    if (z) {
                        i2 = 1;
                    }
                    obtain.writeInt(i2);
                    this.f2826dU.transact(8023, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: a */
            public void mo7836a(C1207fo foVar, String str, int i, boolean z, boolean z2) throws RemoteException {
                int i2 = 1;
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeStrongBinder(foVar != null ? foVar.asBinder() : null);
                    obtain.writeString(str);
                    obtain.writeInt(i);
                    obtain.writeInt(z ? 1 : 0);
                    if (!z2) {
                        i2 = 0;
                    }
                    obtain.writeInt(i2);
                    this.f2826dU.transact(5045, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: a */
            public void mo7837a(C1207fo foVar, String str, int i, boolean z, boolean z2, boolean z3, boolean z4) throws RemoteException {
                int i2 = 1;
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeStrongBinder(foVar != null ? foVar.asBinder() : null);
                    obtain.writeString(str);
                    obtain.writeInt(i);
                    obtain.writeInt(z ? 1 : 0);
                    obtain.writeInt(z2 ? 1 : 0);
                    obtain.writeInt(z3 ? 1 : 0);
                    if (!z4) {
                        i2 = 0;
                    }
                    obtain.writeInt(i2);
                    this.f2826dU.transact(6501, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: a */
            public void mo7838a(C1207fo foVar, String str, long j) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeStrongBinder(foVar != null ? foVar.asBinder() : null);
                    obtain.writeString(str);
                    obtain.writeLong(j);
                    this.f2826dU.transact(5016, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: a */
            public void mo7839a(C1207fo foVar, String str, long j, String str2) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeStrongBinder(foVar != null ? foVar.asBinder() : null);
                    obtain.writeString(str);
                    obtain.writeLong(j);
                    obtain.writeString(str2);
                    this.f2826dU.transact(7002, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: a */
            public void mo7840a(C1207fo foVar, String str, IBinder iBinder, Bundle bundle) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeStrongBinder(foVar != null ? foVar.asBinder() : null);
                    obtain.writeString(str);
                    obtain.writeStrongBinder(iBinder);
                    if (bundle != null) {
                        obtain.writeInt(1);
                        bundle.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    this.f2826dU.transact(5023, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: a */
            public void mo7841a(C1207fo foVar, String str, String str2) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeStrongBinder(foVar != null ? foVar.asBinder() : null);
                    obtain.writeString(str);
                    obtain.writeString(str2);
                    this.f2826dU.transact(5009, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: a */
            public void mo7842a(C1207fo foVar, String str, String str2, int i, int i2) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeStrongBinder(foVar != null ? foVar.asBinder() : null);
                    obtain.writeString(str);
                    obtain.writeString(str2);
                    obtain.writeInt(i);
                    obtain.writeInt(i2);
                    this.f2826dU.transact(8001, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: a */
            public void mo7843a(C1207fo foVar, String str, String str2, int i, int i2, int i3, boolean z) throws RemoteException {
                int i4 = 0;
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeStrongBinder(foVar != null ? foVar.asBinder() : null);
                    obtain.writeString(str);
                    obtain.writeString(str2);
                    obtain.writeInt(i);
                    obtain.writeInt(i2);
                    obtain.writeInt(i3);
                    if (z) {
                        i4 = 1;
                    }
                    obtain.writeInt(i4);
                    this.f2826dU.transact(5039, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: a */
            public void mo7844a(C1207fo foVar, String str, String str2, int i, boolean z, boolean z2) throws RemoteException {
                int i2 = 1;
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeStrongBinder(foVar != null ? foVar.asBinder() : null);
                    obtain.writeString(str);
                    obtain.writeString(str2);
                    obtain.writeInt(i);
                    obtain.writeInt(z ? 1 : 0);
                    if (!z2) {
                        i2 = 0;
                    }
                    obtain.writeInt(i2);
                    this.f2826dU.transact(9028, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: a */
            public void mo7845a(C1207fo foVar, String str, String str2, boolean z) throws RemoteException {
                int i = 0;
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeStrongBinder(foVar != null ? foVar.asBinder() : null);
                    obtain.writeString(str);
                    obtain.writeString(str2);
                    if (z) {
                        i = 1;
                    }
                    obtain.writeInt(i);
                    this.f2826dU.transact(6002, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: a */
            public void mo7846a(C1207fo foVar, String str, boolean z) throws RemoteException {
                int i = 0;
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeStrongBinder(foVar != null ? foVar.asBinder() : null);
                    obtain.writeString(str);
                    if (z) {
                        i = 1;
                    }
                    obtain.writeInt(i);
                    this.f2826dU.transact(5054, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: a */
            public void mo7847a(C1207fo foVar, String str, boolean z, long[] jArr) throws RemoteException {
                int i = 0;
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeStrongBinder(foVar != null ? foVar.asBinder() : null);
                    obtain.writeString(str);
                    if (z) {
                        i = 1;
                    }
                    obtain.writeInt(i);
                    obtain.writeLongArray(jArr);
                    this.f2826dU.transact(5011, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: a */
            public void mo7848a(C1207fo foVar, String str, byte[] bArr, String str2, ParticipantResult[] participantResultArr) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeStrongBinder(foVar != null ? foVar.asBinder() : null);
                    obtain.writeString(str);
                    obtain.writeByteArray(bArr);
                    obtain.writeString(str2);
                    obtain.writeTypedArray(participantResultArr, 0);
                    this.f2826dU.transact(8007, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: a */
            public void mo7849a(C1207fo foVar, String str, byte[] bArr, ParticipantResult[] participantResultArr) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeStrongBinder(foVar != null ? foVar.asBinder() : null);
                    obtain.writeString(str);
                    obtain.writeByteArray(bArr);
                    obtain.writeTypedArray(participantResultArr, 0);
                    this.f2826dU.transact(8008, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: a */
            public void mo7850a(C1207fo foVar, String str, int[] iArr) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeStrongBinder(foVar != null ? foVar.asBinder() : null);
                    obtain.writeString(str);
                    obtain.writeIntArray(iArr);
                    this.f2826dU.transact(8017, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: a */
            public void mo7851a(C1207fo foVar, boolean z) throws RemoteException {
                int i = 0;
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeStrongBinder(foVar != null ? foVar.asBinder() : null);
                    if (z) {
                        i = 1;
                    }
                    obtain.writeInt(i);
                    this.f2826dU.transact(6001, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: a */
            public void mo7852a(C1207fo foVar, boolean z, Bundle bundle) throws RemoteException {
                int i = 1;
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeStrongBinder(foVar != null ? foVar.asBinder() : null);
                    if (!z) {
                        i = 0;
                    }
                    obtain.writeInt(i);
                    if (bundle != null) {
                        obtain.writeInt(1);
                        bundle.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    this.f2826dU.transact(5063, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: a */
            public void mo7853a(C1207fo foVar, int[] iArr) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeStrongBinder(foVar != null ? foVar.asBinder() : null);
                    obtain.writeIntArray(iArr);
                    this.f2826dU.transact(8003, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: aU */
            public Bundle mo7854aU() throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    this.f2826dU.transact(5004, obtain, obtain2, 0);
                    obtain2.readException();
                    return obtain2.readInt() != 0 ? (Bundle) Bundle.CREATOR.createFromParcel(obtain2) : null;
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: af */
            public String mo7855af(String str) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeString(str);
                    this.f2826dU.transact(5064, obtain, obtain2, 0);
                    obtain2.readException();
                    return obtain2.readString();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: ag */
            public String mo7856ag(String str) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeString(str);
                    this.f2826dU.transact(5035, obtain, obtain2, 0);
                    obtain2.readException();
                    return obtain2.readString();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: ah */
            public void mo7857ah(String str) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeString(str);
                    this.f2826dU.transact(5050, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: ai */
            public int mo7858ai(String str) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeString(str);
                    this.f2826dU.transact(5060, obtain, obtain2, 0);
                    obtain2.readException();
                    return obtain2.readInt();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: aj */
            public Uri mo7859aj(String str) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeString(str);
                    this.f2826dU.transact(5066, obtain, obtain2, 0);
                    obtain2.readException();
                    return obtain2.readInt() != 0 ? (Uri) Uri.CREATOR.createFromParcel(obtain2) : null;
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: ak */
            public void mo7860ak(String str) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeString(str);
                    this.f2826dU.transact(8002, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: al */
            public ParcelFileDescriptor mo7861al(String str) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeString(str);
                    this.f2826dU.transact(9030, obtain, obtain2, 0);
                    obtain2.readException();
                    return obtain2.readInt() != 0 ? (ParcelFileDescriptor) ParcelFileDescriptor.CREATOR.createFromParcel(obtain2) : null;
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            public IBinder asBinder() {
                return this.f2826dU;
            }

            /* renamed from: b */
            public int mo7862b(byte[] bArr, String str, String[] strArr) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeByteArray(bArr);
                    obtain.writeString(str);
                    obtain.writeStringArray(strArr);
                    this.f2826dU.transact(5034, obtain, obtain2, 0);
                    obtain2.readException();
                    return obtain2.readInt();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: b */
            public void mo7863b(long j, String str) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeLong(j);
                    obtain.writeString(str);
                    this.f2826dU.transact(8021, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: b */
            public void mo7864b(C1207fo foVar) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeStrongBinder(foVar != null ? foVar.asBinder() : null);
                    this.f2826dU.transact(5017, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: b */
            public void mo7865b(C1207fo foVar, int i, boolean z, boolean z2) throws RemoteException {
                int i2 = 1;
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeStrongBinder(foVar != null ? foVar.asBinder() : null);
                    obtain.writeInt(i);
                    obtain.writeInt(z ? 1 : 0);
                    if (!z2) {
                        i2 = 0;
                    }
                    obtain.writeInt(i2);
                    this.f2826dU.transact(5046, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: b */
            public void mo7866b(C1207fo foVar, long j) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeStrongBinder(foVar != null ? foVar.asBinder() : null);
                    obtain.writeLong(j);
                    this.f2826dU.transact(8012, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: b */
            public void mo7867b(C1207fo foVar, long j, String str) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeStrongBinder(foVar != null ? foVar.asBinder() : null);
                    obtain.writeLong(j);
                    obtain.writeString(str);
                    this.f2826dU.transact(8020, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: b */
            public void mo7868b(C1207fo foVar, String str) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeStrongBinder(foVar != null ? foVar.asBinder() : null);
                    obtain.writeString(str);
                    this.f2826dU.transact(5010, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: b */
            public void mo7869b(C1207fo foVar, String str, int i, int i2, int i3, boolean z) throws RemoteException {
                int i4 = 0;
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeStrongBinder(foVar != null ? foVar.asBinder() : null);
                    obtain.writeString(str);
                    obtain.writeInt(i);
                    obtain.writeInt(i2);
                    obtain.writeInt(i3);
                    if (z) {
                        i4 = 1;
                    }
                    obtain.writeInt(i4);
                    this.f2826dU.transact(5020, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: b */
            public void mo7870b(C1207fo foVar, String str, int i, IBinder iBinder, Bundle bundle) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeStrongBinder(foVar != null ? foVar.asBinder() : null);
                    obtain.writeString(str);
                    obtain.writeInt(i);
                    obtain.writeStrongBinder(iBinder);
                    if (bundle != null) {
                        obtain.writeInt(1);
                        bundle.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    this.f2826dU.transact(7003, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: b */
            public void mo7871b(C1207fo foVar, String str, int i, boolean z, boolean z2) throws RemoteException {
                int i2 = 1;
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeStrongBinder(foVar != null ? foVar.asBinder() : null);
                    obtain.writeString(str);
                    obtain.writeInt(i);
                    obtain.writeInt(z ? 1 : 0);
                    if (!z2) {
                        i2 = 0;
                    }
                    obtain.writeInt(i2);
                    this.f2826dU.transact(5501, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: b */
            public void mo7872b(C1207fo foVar, String str, IBinder iBinder, Bundle bundle) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeStrongBinder(foVar != null ? foVar.asBinder() : null);
                    obtain.writeString(str);
                    obtain.writeStrongBinder(iBinder);
                    if (bundle != null) {
                        obtain.writeInt(1);
                        bundle.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    this.f2826dU.transact(5024, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: b */
            public void mo7873b(C1207fo foVar, String str, String str2) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeStrongBinder(foVar != null ? foVar.asBinder() : null);
                    obtain.writeString(str);
                    obtain.writeString(str2);
                    this.f2826dU.transact(5038, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: b */
            public void mo7874b(C1207fo foVar, String str, String str2, int i, int i2, int i3, boolean z) throws RemoteException {
                int i4 = 0;
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeStrongBinder(foVar != null ? foVar.asBinder() : null);
                    obtain.writeString(str);
                    obtain.writeString(str2);
                    obtain.writeInt(i);
                    obtain.writeInt(i2);
                    obtain.writeInt(i3);
                    if (z) {
                        i4 = 1;
                    }
                    obtain.writeInt(i4);
                    this.f2826dU.transact(5040, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: b */
            public void mo7875b(C1207fo foVar, String str, String str2, boolean z) throws RemoteException {
                int i = 0;
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeStrongBinder(foVar != null ? foVar.asBinder() : null);
                    obtain.writeString(str);
                    obtain.writeString(str2);
                    if (z) {
                        i = 1;
                    }
                    obtain.writeInt(i);
                    this.f2826dU.transact(6506, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: b */
            public void mo7876b(C1207fo foVar, String str, boolean z) throws RemoteException {
                int i = 0;
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeStrongBinder(foVar != null ? foVar.asBinder() : null);
                    obtain.writeString(str);
                    if (z) {
                        i = 1;
                    }
                    obtain.writeInt(i);
                    this.f2826dU.transact(6502, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: b */
            public void mo7877b(C1207fo foVar, boolean z) throws RemoteException {
                int i = 0;
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeStrongBinder(foVar != null ? foVar.asBinder() : null);
                    if (z) {
                        i = 1;
                    }
                    obtain.writeInt(i);
                    this.f2826dU.transact(6503, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: b */
            public void mo7878b(String str, String str2, int i) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeString(str);
                    obtain.writeString(str2);
                    obtain.writeInt(i);
                    this.f2826dU.transact(5051, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: c */
            public void mo7879c(C1207fo foVar) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeStrongBinder(foVar != null ? foVar.asBinder() : null);
                    this.f2826dU.transact(5022, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: c */
            public void mo7880c(C1207fo foVar, int i, boolean z, boolean z2) throws RemoteException {
                int i2 = 1;
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeStrongBinder(foVar != null ? foVar.asBinder() : null);
                    obtain.writeInt(i);
                    obtain.writeInt(z ? 1 : 0);
                    if (!z2) {
                        i2 = 0;
                    }
                    obtain.writeInt(i2);
                    this.f2826dU.transact(5048, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: c */
            public void mo7881c(C1207fo foVar, String str) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeStrongBinder(foVar != null ? foVar.asBinder() : null);
                    obtain.writeString(str);
                    this.f2826dU.transact(5014, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: c */
            public void mo7882c(C1207fo foVar, String str, int i, boolean z, boolean z2) throws RemoteException {
                int i2 = 1;
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeStrongBinder(foVar != null ? foVar.asBinder() : null);
                    obtain.writeString(str);
                    obtain.writeInt(i);
                    obtain.writeInt(z ? 1 : 0);
                    if (!z2) {
                        i2 = 0;
                    }
                    obtain.writeInt(i2);
                    this.f2826dU.transact(9001, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: c */
            public void mo7883c(C1207fo foVar, String str, String str2) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeStrongBinder(foVar != null ? foVar.asBinder() : null);
                    obtain.writeString(str);
                    obtain.writeString(str2);
                    this.f2826dU.transact(5041, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: c */
            public void mo7884c(C1207fo foVar, String str, boolean z) throws RemoteException {
                int i = 0;
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeStrongBinder(foVar != null ? foVar.asBinder() : null);
                    obtain.writeString(str);
                    if (z) {
                        i = 1;
                    }
                    obtain.writeInt(i);
                    this.f2826dU.transact(6504, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: c */
            public void mo7885c(C1207fo foVar, boolean z) throws RemoteException {
                int i = 0;
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeStrongBinder(foVar != null ? foVar.asBinder() : null);
                    if (z) {
                        i = 1;
                    }
                    obtain.writeInt(i);
                    this.f2826dU.transact(8027, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: c */
            public void mo7886c(String str, String str2, int i) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeString(str);
                    obtain.writeString(str2);
                    obtain.writeInt(i);
                    this.f2826dU.transact(8026, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            public void clearNotifications(int notificationTypes) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeInt(notificationTypes);
                    this.f2826dU.transact(5036, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: d */
            public void mo7888d(C1207fo foVar) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeStrongBinder(foVar != null ? foVar.asBinder() : null);
                    this.f2826dU.transact(5026, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: d */
            public void mo7889d(C1207fo foVar, int i, boolean z, boolean z2) throws RemoteException {
                int i2 = 1;
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeStrongBinder(foVar != null ? foVar.asBinder() : null);
                    obtain.writeInt(i);
                    obtain.writeInt(z ? 1 : 0);
                    if (!z2) {
                        i2 = 0;
                    }
                    obtain.writeInt(i2);
                    this.f2826dU.transact(6003, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: d */
            public void mo7890d(C1207fo foVar, String str) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeStrongBinder(foVar != null ? foVar.asBinder() : null);
                    obtain.writeString(str);
                    this.f2826dU.transact(5018, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: d */
            public void mo7891d(C1207fo foVar, String str, int i, boolean z, boolean z2) throws RemoteException {
                int i2 = 1;
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeStrongBinder(foVar != null ? foVar.asBinder() : null);
                    obtain.writeString(str);
                    obtain.writeInt(i);
                    obtain.writeInt(z ? 1 : 0);
                    if (!z2) {
                        i2 = 0;
                    }
                    obtain.writeInt(i2);
                    this.f2826dU.transact(9020, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: d */
            public void mo7892d(C1207fo foVar, String str, String str2) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeStrongBinder(foVar != null ? foVar.asBinder() : null);
                    obtain.writeString(str);
                    obtain.writeString(str2);
                    this.f2826dU.transact(8011, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: d */
            public void mo7893d(C1207fo foVar, String str, boolean z) throws RemoteException {
                int i = 0;
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeStrongBinder(foVar != null ? foVar.asBinder() : null);
                    obtain.writeString(str);
                    if (z) {
                        i = 1;
                    }
                    obtain.writeInt(i);
                    this.f2826dU.transact(6505, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: dd */
            public int mo7894dd() throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    this.f2826dU.transact(9019, obtain, obtain2, 0);
                    obtain2.readException();
                    return obtain2.readInt();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: df */
            public void mo7895df() throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    this.f2826dU.transact(5006, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: dg */
            public DataHolder mo7896dg() throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    this.f2826dU.transact(5013, obtain, obtain2, 0);
                    obtain2.readException();
                    return obtain2.readInt() != 0 ? DataHolder.CREATOR.createFromParcel(obtain2) : null;
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: dh */
            public boolean mo7897dh() throws RemoteException {
                boolean z = false;
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    this.f2826dU.transact(5067, obtain, obtain2, 0);
                    obtain2.readException();
                    if (obtain2.readInt() != 0) {
                        z = true;
                    }
                    return z;
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: di */
            public DataHolder mo7898di() throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    this.f2826dU.transact(5502, obtain, obtain2, 0);
                    obtain2.readException();
                    return obtain2.readInt() != 0 ? DataHolder.CREATOR.createFromParcel(obtain2) : null;
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: dj */
            public void mo7899dj() throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    this.f2826dU.transact(8022, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: dk */
            public Intent mo7900dk() throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    this.f2826dU.transact(9013, obtain, obtain2, 0);
                    obtain2.readException();
                    return obtain2.readInt() != 0 ? (Intent) Intent.CREATOR.createFromParcel(obtain2) : null;
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: e */
            public ParcelFileDescriptor mo7901e(Uri uri) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    if (uri != null) {
                        obtain.writeInt(1);
                        uri.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    this.f2826dU.transact(6507, obtain, obtain2, 0);
                    obtain2.readException();
                    return obtain2.readInt() != 0 ? (ParcelFileDescriptor) ParcelFileDescriptor.CREATOR.createFromParcel(obtain2) : null;
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: e */
            public void mo7902e(C1207fo foVar) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeStrongBinder(foVar != null ? foVar.asBinder() : null);
                    this.f2826dU.transact(5027, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: e */
            public void mo7903e(C1207fo foVar, int i, boolean z, boolean z2) throws RemoteException {
                int i2 = 1;
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeStrongBinder(foVar != null ? foVar.asBinder() : null);
                    obtain.writeInt(i);
                    obtain.writeInt(z ? 1 : 0);
                    if (!z2) {
                        i2 = 0;
                    }
                    obtain.writeInt(i2);
                    this.f2826dU.transact(6004, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: e */
            public void mo7904e(C1207fo foVar, String str) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeStrongBinder(foVar != null ? foVar.asBinder() : null);
                    obtain.writeString(str);
                    this.f2826dU.transact(5032, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: e */
            public void mo7905e(C1207fo foVar, String str, String str2) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeStrongBinder(foVar != null ? foVar.asBinder() : null);
                    obtain.writeString(str);
                    obtain.writeString(str2);
                    this.f2826dU.transact(8015, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: e */
            public void mo7906e(String str, String str2) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeString(str);
                    obtain.writeString(str2);
                    this.f2826dU.transact(5065, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: f */
            public void mo7907f(C1207fo foVar) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeStrongBinder(foVar != null ? foVar.asBinder() : null);
                    this.f2826dU.transact(5047, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: f */
            public void mo7908f(C1207fo foVar, String str) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeStrongBinder(foVar != null ? foVar.asBinder() : null);
                    obtain.writeString(str);
                    this.f2826dU.transact(5037, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: f */
            public void mo7909f(C1207fo foVar, String str, String str2) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeStrongBinder(foVar != null ? foVar.asBinder() : null);
                    obtain.writeString(str);
                    obtain.writeString(str2);
                    this.f2826dU.transact(8016, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: f */
            public void mo7910f(String str, String str2) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeString(str);
                    obtain.writeString(str2);
                    this.f2826dU.transact(8025, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: g */
            public void mo7911g(C1207fo foVar) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeStrongBinder(foVar != null ? foVar.asBinder() : null);
                    this.f2826dU.transact(5049, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: g */
            public void mo7912g(C1207fo foVar, String str) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeStrongBinder(foVar != null ? foVar.asBinder() : null);
                    obtain.writeString(str);
                    this.f2826dU.transact(5042, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            public Intent getAchievementsIntent() throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    this.f2826dU.transact(9005, obtain, obtain2, 0);
                    obtain2.readException();
                    return obtain2.readInt() != 0 ? (Intent) Intent.CREATOR.createFromParcel(obtain2) : null;
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            public Intent getAllLeaderboardsIntent() throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    this.f2826dU.transact(9003, obtain, obtain2, 0);
                    obtain2.readException();
                    return obtain2.readInt() != 0 ? (Intent) Intent.CREATOR.createFromParcel(obtain2) : null;
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            public String getAppId() throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    this.f2826dU.transact(5003, obtain, obtain2, 0);
                    obtain2.readException();
                    return obtain2.readString();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            public String getCurrentAccountName() throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    this.f2826dU.transact(5007, obtain, obtain2, 0);
                    obtain2.readException();
                    return obtain2.readString();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            public String getCurrentPlayerId() throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    this.f2826dU.transact(5012, obtain, obtain2, 0);
                    obtain2.readException();
                    return obtain2.readString();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            public Intent getInvitationInboxIntent() throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    this.f2826dU.transact(9007, obtain, obtain2, 0);
                    obtain2.readException();
                    return obtain2.readInt() != 0 ? (Intent) Intent.CREATOR.createFromParcel(obtain2) : null;
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            public Intent getLeaderboardIntent(String leaderboardId) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeString(leaderboardId);
                    this.f2826dU.transact(9004, obtain, obtain2, 0);
                    obtain2.readException();
                    return obtain2.readInt() != 0 ? (Intent) Intent.CREATOR.createFromParcel(obtain2) : null;
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            public Intent getMatchInboxIntent() throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    this.f2826dU.transact(9006, obtain, obtain2, 0);
                    obtain2.readException();
                    return obtain2.readInt() != 0 ? (Intent) Intent.CREATOR.createFromParcel(obtain2) : null;
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            public int getMaxTurnBasedMatchDataSize() throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    this.f2826dU.transact(8024, obtain, obtain2, 0);
                    obtain2.readException();
                    return obtain2.readInt();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            public Intent getPlayerSearchIntent() throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    this.f2826dU.transact(9010, obtain, obtain2, 0);
                    obtain2.readException();
                    return obtain2.readInt() != 0 ? (Intent) Intent.CREATOR.createFromParcel(obtain2) : null;
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            public Intent getRealTimeSelectOpponentsIntent(int minPlayers, int maxPlayers, boolean allowAutomatch) throws RemoteException {
                int i = 0;
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeInt(minPlayers);
                    obtain.writeInt(maxPlayers);
                    if (allowAutomatch) {
                        i = 1;
                    }
                    obtain.writeInt(i);
                    this.f2826dU.transact(9009, obtain, obtain2, 0);
                    obtain2.readException();
                    return obtain2.readInt() != 0 ? (Intent) Intent.CREATOR.createFromParcel(obtain2) : null;
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            public Intent getSettingsIntent() throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    this.f2826dU.transact(9012, obtain, obtain2, 0);
                    obtain2.readException();
                    return obtain2.readInt() != 0 ? (Intent) Intent.CREATOR.createFromParcel(obtain2) : null;
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            public Intent getTurnBasedSelectOpponentsIntent(int minPlayers, int maxPlayers, boolean allowAutomatch) throws RemoteException {
                int i = 0;
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeInt(minPlayers);
                    obtain.writeInt(maxPlayers);
                    if (allowAutomatch) {
                        i = 1;
                    }
                    obtain.writeInt(i);
                    this.f2826dU.transact(9008, obtain, obtain2, 0);
                    obtain2.readException();
                    return obtain2.readInt() != 0 ? (Intent) Intent.CREATOR.createFromParcel(obtain2) : null;
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: h */
            public void mo7926h(C1207fo foVar) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeStrongBinder(foVar != null ? foVar.asBinder() : null);
                    this.f2826dU.transact(5056, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: h */
            public void mo7927h(C1207fo foVar, String str) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeStrongBinder(foVar != null ? foVar.asBinder() : null);
                    obtain.writeString(str);
                    this.f2826dU.transact(5043, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: i */
            public void mo7928i(C1207fo foVar) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeStrongBinder(foVar != null ? foVar.asBinder() : null);
                    this.f2826dU.transact(5062, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: i */
            public void mo7929i(C1207fo foVar, String str) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeStrongBinder(foVar != null ? foVar.asBinder() : null);
                    obtain.writeString(str);
                    this.f2826dU.transact(5052, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: i */
            public void mo7930i(String str, int i) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeString(str);
                    obtain.writeInt(i);
                    this.f2826dU.transact(5029, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: j */
            public DataHolder mo7931j(C1207fo foVar, String str) throws RemoteException {
                DataHolder dataHolder = null;
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeStrongBinder(foVar != null ? foVar.asBinder() : null);
                    obtain.writeString(str);
                    this.f2826dU.transact(5053, obtain, obtain2, 0);
                    obtain2.readException();
                    if (obtain2.readInt() != 0) {
                        dataHolder = DataHolder.CREATOR.createFromParcel(obtain2);
                    }
                    return dataHolder;
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: j */
            public void mo7932j(long j) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeLong(j);
                    this.f2826dU.transact(5001, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: j */
            public void mo7933j(String str, int i) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeString(str);
                    obtain.writeInt(i);
                    this.f2826dU.transact(5028, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: k */
            public void mo7934k(long j) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeLong(j);
                    this.f2826dU.transact(5059, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: k */
            public void mo7935k(C1207fo foVar, String str) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeStrongBinder(foVar != null ? foVar.asBinder() : null);
                    obtain.writeString(str);
                    this.f2826dU.transact(5061, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: k */
            public void mo7936k(String str, int i) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeString(str);
                    obtain.writeInt(i);
                    this.f2826dU.transact(5055, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: l */
            public void mo7937l(long j) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeLong(j);
                    this.f2826dU.transact(8013, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: l */
            public void mo7938l(C1207fo foVar, String str) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeStrongBinder(foVar != null ? foVar.asBinder() : null);
                    obtain.writeString(str);
                    this.f2826dU.transact(5057, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: m */
            public void mo7939m(C1207fo foVar, String str) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeStrongBinder(foVar != null ? foVar.asBinder() : null);
                    obtain.writeString(str);
                    this.f2826dU.transact(7001, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: n */
            public void mo7940n(C1207fo foVar, String str) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeStrongBinder(foVar != null ? foVar.asBinder() : null);
                    obtain.writeString(str);
                    this.f2826dU.transact(8005, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: o */
            public void mo7941o(C1207fo foVar, String str) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeStrongBinder(foVar != null ? foVar.asBinder() : null);
                    obtain.writeString(str);
                    this.f2826dU.transact(8006, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: p */
            public void mo7942p(C1207fo foVar, String str) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeStrongBinder(foVar != null ? foVar.asBinder() : null);
                    obtain.writeString(str);
                    this.f2826dU.transact(8009, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: q */
            public void mo7943q(C1207fo foVar, String str) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeStrongBinder(foVar != null ? foVar.asBinder() : null);
                    obtain.writeString(str);
                    this.f2826dU.transact(8010, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: r */
            public void mo7944r(C1207fo foVar, String str) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeStrongBinder(foVar != null ? foVar.asBinder() : null);
                    obtain.writeString(str);
                    this.f2826dU.transact(8014, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: s */
            public void mo7945s(C1207fo foVar, String str) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    obtain.writeStrongBinder(foVar != null ? foVar.asBinder() : null);
                    obtain.writeString(str);
                    this.f2826dU.transact(9002, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            /* renamed from: s */
            public void mo7946s(boolean z) throws RemoteException {
                int i = 0;
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
                    if (z) {
                        i = 1;
                    }
                    obtain.writeInt(i);
                    this.f2826dU.transact(5068, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }
        }

        /* renamed from: H */
        public static C1210fp m3187H(IBinder iBinder) {
            if (iBinder == null) {
                return null;
            }
            IInterface queryLocalInterface = iBinder.queryLocalInterface("com.google.android.gms.games.internal.IGamesService");
            return (queryLocalInterface == null || !(queryLocalInterface instanceof C1210fp)) ? new C1212a(iBinder) : (C1210fp) queryLocalInterface;
        }

        /* JADX DEBUG: Multi-variable search result rejected for TypeSearchVarInfo{r5v7, resolved type: android.net.Uri} */
        /* JADX DEBUG: Multi-variable search result rejected for TypeSearchVarInfo{r5v14, resolved type: android.os.Bundle} */
        /* JADX DEBUG: Multi-variable search result rejected for TypeSearchVarInfo{r5v17, resolved type: android.os.Bundle} */
        /* JADX DEBUG: Multi-variable search result rejected for TypeSearchVarInfo{r5v35, resolved type: android.os.Bundle} */
        /* JADX DEBUG: Multi-variable search result rejected for TypeSearchVarInfo{r5v37, resolved type: android.os.Bundle} */
        /* JADX WARNING: type inference failed for: r5v0 */
        /* JADX WARNING: type inference failed for: r5v8 */
        /* JADX WARNING: type inference failed for: r5v15 */
        /* JADX WARNING: type inference failed for: r5v18 */
        /* JADX WARNING: type inference failed for: r5v36 */
        /* JADX WARNING: type inference failed for: r5v38 */
        /* JADX WARNING: Multi-variable type inference failed */
        /* Code decompiled incorrectly, please refer to instructions dump. */
        public boolean onTransact(int r11, android.os.Parcel r12, android.os.Parcel r13, int r14) throws android.os.RemoteException {
            /*
                r10 = this;
                r5 = 0
                r7 = 0
                r9 = 1
                switch(r11) {
                    case 5001: goto L_0x0011;
                    case 5002: goto L_0x0021;
                    case 5003: goto L_0x0035;
                    case 5004: goto L_0x0045;
                    case 5005: goto L_0x005e;
                    case 5006: goto L_0x007e;
                    case 5007: goto L_0x008a;
                    case 5008: goto L_0x00c5;
                    case 5009: goto L_0x00de;
                    case 5010: goto L_0x00fb;
                    case 5011: goto L_0x0114;
                    case 5012: goto L_0x013a;
                    case 5013: goto L_0x014b;
                    case 5014: goto L_0x0166;
                    case 5015: goto L_0x017f;
                    case 5016: goto L_0x01a8;
                    case 5017: goto L_0x01c5;
                    case 5018: goto L_0x01da;
                    case 5019: goto L_0x01f3;
                    case 5020: goto L_0x0222;
                    case 5021: goto L_0x0251;
                    case 5022: goto L_0x027e;
                    case 5023: goto L_0x0293;
                    case 5024: goto L_0x02c0;
                    case 5025: goto L_0x02ed;
                    case 5026: goto L_0x031e;
                    case 5027: goto L_0x0333;
                    case 5028: goto L_0x0348;
                    case 5029: goto L_0x035d;
                    case 5030: goto L_0x039c;
                    case 5031: goto L_0x03da;
                    case 5032: goto L_0x0405;
                    case 5033: goto L_0x041e;
                    case 5034: goto L_0x0443;
                    case 5035: goto L_0x0460;
                    case 5036: goto L_0x0475;
                    case 5037: goto L_0x0486;
                    case 5038: goto L_0x049f;
                    case 5039: goto L_0x04bc;
                    case 5040: goto L_0x04ed;
                    case 5041: goto L_0x051e;
                    case 5042: goto L_0x053b;
                    case 5043: goto L_0x0554;
                    case 5044: goto L_0x056d;
                    case 5045: goto L_0x059d;
                    case 5046: goto L_0x05cd;
                    case 5047: goto L_0x05f6;
                    case 5048: goto L_0x060b;
                    case 5049: goto L_0x0634;
                    case 5050: goto L_0x0649;
                    case 5051: goto L_0x065a;
                    case 5052: goto L_0x0673;
                    case 5053: goto L_0x068c;
                    case 5054: goto L_0x06c8;
                    case 5055: goto L_0x0701;
                    case 5056: goto L_0x073e;
                    case 5057: goto L_0x0753;
                    case 5058: goto L_0x0372;
                    case 5059: goto L_0x038b;
                    case 5060: goto L_0x06b3;
                    case 5061: goto L_0x06e8;
                    case 5062: goto L_0x076c;
                    case 5063: goto L_0x0781;
                    case 5064: goto L_0x009b;
                    case 5065: goto L_0x00b0;
                    case 5066: goto L_0x07ad;
                    case 5067: goto L_0x0716;
                    case 5068: goto L_0x072a;
                    case 5501: goto L_0x07cc;
                    case 5502: goto L_0x07fc;
                    case 6001: goto L_0x0817;
                    case 6002: goto L_0x0833;
                    case 6003: goto L_0x0857;
                    case 6004: goto L_0x0880;
                    case 6501: goto L_0x08a9;
                    case 6502: goto L_0x08e9;
                    case 6503: goto L_0x0909;
                    case 6504: goto L_0x0925;
                    case 6505: goto L_0x0945;
                    case 6506: goto L_0x0965;
                    case 6507: goto L_0x0989;
                    case 7001: goto L_0x09b4;
                    case 7002: goto L_0x09cd;
                    case 7003: goto L_0x09ef;
                    case 8001: goto L_0x0a20;
                    case 8002: goto L_0x0a46;
                    case 8003: goto L_0x0a57;
                    case 8004: goto L_0x0a70;
                    case 8005: goto L_0x0aa1;
                    case 8006: goto L_0x0aba;
                    case 8007: goto L_0x0ad3;
                    case 8008: goto L_0x0afd;
                    case 8009: goto L_0x0b22;
                    case 8010: goto L_0x0b3b;
                    case 8011: goto L_0x0b54;
                    case 8012: goto L_0x0b71;
                    case 8013: goto L_0x0b8a;
                    case 8014: goto L_0x0b9b;
                    case 8015: goto L_0x0bda;
                    case 8016: goto L_0x0bf7;
                    case 8017: goto L_0x0c14;
                    case 8018: goto L_0x0c4a;
                    case 8019: goto L_0x0c67;
                    case 8020: goto L_0x0c7c;
                    case 8021: goto L_0x0c99;
                    case 8022: goto L_0x0cae;
                    case 8023: goto L_0x0cbb;
                    case 8024: goto L_0x0bb4;
                    case 8025: goto L_0x0bc5;
                    case 8026: goto L_0x0c31;
                    case 8027: goto L_0x0cdf;
                    case 9001: goto L_0x0cfb;
                    case 9002: goto L_0x0d2b;
                    case 9003: goto L_0x0d44;
                    case 9004: goto L_0x0d5f;
                    case 9005: goto L_0x0d7e;
                    case 9006: goto L_0x0d99;
                    case 9007: goto L_0x0db4;
                    case 9008: goto L_0x0dcf;
                    case 9009: goto L_0x0dfb;
                    case 9010: goto L_0x0e27;
                    case 9011: goto L_0x0e42;
                    case 9012: goto L_0x0e71;
                    case 9013: goto L_0x0e8c;
                    case 9019: goto L_0x0ef3;
                    case 9020: goto L_0x0f04;
                    case 9028: goto L_0x0f34;
                    case 9030: goto L_0x0f68;
                    case 9031: goto L_0x0ea7;
                    case 1598968902: goto L_0x000b;
                    default: goto L_0x0006;
                }
            L_0x0006:
                boolean r9 = super.onTransact(r11, r12, r13, r14)
            L_0x000a:
                return r9
            L_0x000b:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r13.writeString(r0)
                goto L_0x000a
            L_0x0011:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                long r0 = r12.readLong()
                r10.mo7932j(r0)
                r13.writeNoException()
                goto L_0x000a
            L_0x0021:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.os.IBinder r0 = r12.readStrongBinder()
                com.google.android.gms.internal.fo r0 = com.google.android.gms.internal.C1207fo.C1208a.m3027G(r0)
                r10.mo7823a(r0)
                r13.writeNoException()
                goto L_0x000a
            L_0x0035:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                java.lang.String r0 = r10.getAppId()
                r13.writeNoException()
                r13.writeString(r0)
                goto L_0x000a
            L_0x0045:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.os.Bundle r0 = r10.mo7854aU()
                r13.writeNoException()
                if (r0 == 0) goto L_0x005a
                r13.writeInt(r9)
                r0.writeToParcel(r13, r9)
                goto L_0x000a
            L_0x005a:
                r13.writeInt(r7)
                goto L_0x000a
            L_0x005e:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.os.IBinder r1 = r12.readStrongBinder()
                int r0 = r12.readInt()
                if (r0 == 0) goto L_0x007c
                android.os.Parcelable$Creator r0 = android.os.Bundle.CREATOR
                java.lang.Object r0 = r0.createFromParcel(r12)
                android.os.Bundle r0 = (android.os.Bundle) r0
            L_0x0075:
                r10.mo7822a((android.os.IBinder) r1, (android.os.Bundle) r0)
                r13.writeNoException()
                goto L_0x000a
            L_0x007c:
                r0 = r5
                goto L_0x0075
            L_0x007e:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                r10.mo7895df()
                r13.writeNoException()
                goto L_0x000a
            L_0x008a:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                java.lang.String r0 = r10.getCurrentAccountName()
                r13.writeNoException()
                r13.writeString(r0)
                goto L_0x000a
            L_0x009b:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                java.lang.String r0 = r12.readString()
                java.lang.String r0 = r10.mo7855af(r0)
                r13.writeNoException()
                r13.writeString(r0)
                goto L_0x000a
            L_0x00b0:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                java.lang.String r0 = r12.readString()
                java.lang.String r1 = r12.readString()
                r10.mo7906e((java.lang.String) r0, (java.lang.String) r1)
                r13.writeNoException()
                goto L_0x000a
            L_0x00c5:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.os.IBinder r0 = r12.readStrongBinder()
                com.google.android.gms.internal.fo r0 = com.google.android.gms.internal.C1207fo.C1208a.m3027G(r0)
                java.lang.String r1 = r12.readString()
                r10.mo7832a((com.google.android.gms.internal.C1207fo) r0, (java.lang.String) r1)
                r13.writeNoException()
                goto L_0x000a
            L_0x00de:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.os.IBinder r0 = r12.readStrongBinder()
                com.google.android.gms.internal.fo r0 = com.google.android.gms.internal.C1207fo.C1208a.m3027G(r0)
                java.lang.String r1 = r12.readString()
                java.lang.String r2 = r12.readString()
                r10.mo7841a((com.google.android.gms.internal.C1207fo) r0, (java.lang.String) r1, (java.lang.String) r2)
                r13.writeNoException()
                goto L_0x000a
            L_0x00fb:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.os.IBinder r0 = r12.readStrongBinder()
                com.google.android.gms.internal.fo r0 = com.google.android.gms.internal.C1207fo.C1208a.m3027G(r0)
                java.lang.String r1 = r12.readString()
                r10.mo7868b((com.google.android.gms.internal.C1207fo) r0, (java.lang.String) r1)
                r13.writeNoException()
                goto L_0x000a
            L_0x0114:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.os.IBinder r0 = r12.readStrongBinder()
                com.google.android.gms.internal.fo r1 = com.google.android.gms.internal.C1207fo.C1208a.m3027G(r0)
                java.lang.String r2 = r12.readString()
                int r0 = r12.readInt()
                if (r0 == 0) goto L_0x0138
                r0 = r9
            L_0x012c:
                long[] r3 = r12.createLongArray()
                r10.mo7847a((com.google.android.gms.internal.C1207fo) r1, (java.lang.String) r2, (boolean) r0, (long[]) r3)
                r13.writeNoException()
                goto L_0x000a
            L_0x0138:
                r0 = r7
                goto L_0x012c
            L_0x013a:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                java.lang.String r0 = r10.getCurrentPlayerId()
                r13.writeNoException()
                r13.writeString(r0)
                goto L_0x000a
            L_0x014b:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                com.google.android.gms.common.data.DataHolder r0 = r10.mo7896dg()
                r13.writeNoException()
                if (r0 == 0) goto L_0x0161
                r13.writeInt(r9)
                r0.writeToParcel(r13, r9)
                goto L_0x000a
            L_0x0161:
                r13.writeInt(r7)
                goto L_0x000a
            L_0x0166:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.os.IBinder r0 = r12.readStrongBinder()
                com.google.android.gms.internal.fo r0 = com.google.android.gms.internal.C1207fo.C1208a.m3027G(r0)
                java.lang.String r1 = r12.readString()
                r10.mo7881c((com.google.android.gms.internal.C1207fo) r0, (java.lang.String) r1)
                r13.writeNoException()
                goto L_0x000a
            L_0x017f:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.os.IBinder r0 = r12.readStrongBinder()
                com.google.android.gms.internal.fo r1 = com.google.android.gms.internal.C1207fo.C1208a.m3027G(r0)
                int r2 = r12.readInt()
                int r0 = r12.readInt()
                if (r0 == 0) goto L_0x01a6
                r0 = r9
            L_0x0197:
                int r3 = r12.readInt()
                if (r3 == 0) goto L_0x019e
                r7 = r9
            L_0x019e:
                r10.mo7826a((com.google.android.gms.internal.C1207fo) r1, (int) r2, (boolean) r0, (boolean) r7)
                r13.writeNoException()
                goto L_0x000a
            L_0x01a6:
                r0 = r7
                goto L_0x0197
            L_0x01a8:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.os.IBinder r0 = r12.readStrongBinder()
                com.google.android.gms.internal.fo r0 = com.google.android.gms.internal.C1207fo.C1208a.m3027G(r0)
                java.lang.String r1 = r12.readString()
                long r2 = r12.readLong()
                r10.mo7838a((com.google.android.gms.internal.C1207fo) r0, (java.lang.String) r1, (long) r2)
                r13.writeNoException()
                goto L_0x000a
            L_0x01c5:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.os.IBinder r0 = r12.readStrongBinder()
                com.google.android.gms.internal.fo r0 = com.google.android.gms.internal.C1207fo.C1208a.m3027G(r0)
                r10.mo7864b(r0)
                r13.writeNoException()
                goto L_0x000a
            L_0x01da:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.os.IBinder r0 = r12.readStrongBinder()
                com.google.android.gms.internal.fo r0 = com.google.android.gms.internal.C1207fo.C1208a.m3027G(r0)
                java.lang.String r1 = r12.readString()
                r10.mo7890d(r0, r1)
                r13.writeNoException()
                goto L_0x000a
            L_0x01f3:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.os.IBinder r0 = r12.readStrongBinder()
                com.google.android.gms.internal.fo r1 = com.google.android.gms.internal.C1207fo.C1208a.m3027G(r0)
                java.lang.String r2 = r12.readString()
                int r3 = r12.readInt()
                int r4 = r12.readInt()
                int r5 = r12.readInt()
                int r0 = r12.readInt()
                if (r0 == 0) goto L_0x0220
                r6 = r9
            L_0x0217:
                r0 = r10
                r0.mo7833a((com.google.android.gms.internal.C1207fo) r1, (java.lang.String) r2, (int) r3, (int) r4, (int) r5, (boolean) r6)
                r13.writeNoException()
                goto L_0x000a
            L_0x0220:
                r6 = r7
                goto L_0x0217
            L_0x0222:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.os.IBinder r0 = r12.readStrongBinder()
                com.google.android.gms.internal.fo r1 = com.google.android.gms.internal.C1207fo.C1208a.m3027G(r0)
                java.lang.String r2 = r12.readString()
                int r3 = r12.readInt()
                int r4 = r12.readInt()
                int r5 = r12.readInt()
                int r0 = r12.readInt()
                if (r0 == 0) goto L_0x024f
                r6 = r9
            L_0x0246:
                r0 = r10
                r0.mo7869b(r1, r2, r3, r4, r5, r6)
                r13.writeNoException()
                goto L_0x000a
            L_0x024f:
                r6 = r7
                goto L_0x0246
            L_0x0251:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.os.IBinder r0 = r12.readStrongBinder()
                com.google.android.gms.internal.fo r1 = com.google.android.gms.internal.C1207fo.C1208a.m3027G(r0)
                int r0 = r12.readInt()
                if (r0 == 0) goto L_0x027c
                android.os.Parcelable$Creator r0 = android.os.Bundle.CREATOR
                java.lang.Object r0 = r0.createFromParcel(r12)
                android.os.Bundle r0 = (android.os.Bundle) r0
            L_0x026c:
                int r2 = r12.readInt()
                int r3 = r12.readInt()
                r10.mo7829a((com.google.android.gms.internal.C1207fo) r1, (android.os.Bundle) r0, (int) r2, (int) r3)
                r13.writeNoException()
                goto L_0x000a
            L_0x027c:
                r0 = r5
                goto L_0x026c
            L_0x027e:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.os.IBinder r0 = r12.readStrongBinder()
                com.google.android.gms.internal.fo r0 = com.google.android.gms.internal.C1207fo.C1208a.m3027G(r0)
                r10.mo7879c(r0)
                r13.writeNoException()
                goto L_0x000a
            L_0x0293:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.os.IBinder r0 = r12.readStrongBinder()
                com.google.android.gms.internal.fo r1 = com.google.android.gms.internal.C1207fo.C1208a.m3027G(r0)
                java.lang.String r2 = r12.readString()
                android.os.IBinder r3 = r12.readStrongBinder()
                int r0 = r12.readInt()
                if (r0 == 0) goto L_0x02be
                android.os.Parcelable$Creator r0 = android.os.Bundle.CREATOR
                java.lang.Object r0 = r0.createFromParcel(r12)
                android.os.Bundle r0 = (android.os.Bundle) r0
            L_0x02b6:
                r10.mo7840a((com.google.android.gms.internal.C1207fo) r1, (java.lang.String) r2, (android.os.IBinder) r3, (android.os.Bundle) r0)
                r13.writeNoException()
                goto L_0x000a
            L_0x02be:
                r0 = r5
                goto L_0x02b6
            L_0x02c0:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.os.IBinder r0 = r12.readStrongBinder()
                com.google.android.gms.internal.fo r1 = com.google.android.gms.internal.C1207fo.C1208a.m3027G(r0)
                java.lang.String r2 = r12.readString()
                android.os.IBinder r3 = r12.readStrongBinder()
                int r0 = r12.readInt()
                if (r0 == 0) goto L_0x02eb
                android.os.Parcelable$Creator r0 = android.os.Bundle.CREATOR
                java.lang.Object r0 = r0.createFromParcel(r12)
                android.os.Bundle r0 = (android.os.Bundle) r0
            L_0x02e3:
                r10.mo7872b((com.google.android.gms.internal.C1207fo) r1, (java.lang.String) r2, (android.os.IBinder) r3, (android.os.Bundle) r0)
                r13.writeNoException()
                goto L_0x000a
            L_0x02eb:
                r0 = r5
                goto L_0x02e3
            L_0x02ed:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.os.IBinder r0 = r12.readStrongBinder()
                com.google.android.gms.internal.fo r1 = com.google.android.gms.internal.C1207fo.C1208a.m3027G(r0)
                java.lang.String r2 = r12.readString()
                int r3 = r12.readInt()
                android.os.IBinder r4 = r12.readStrongBinder()
                int r0 = r12.readInt()
                if (r0 == 0) goto L_0x0315
                android.os.Parcelable$Creator r0 = android.os.Bundle.CREATOR
                java.lang.Object r0 = r0.createFromParcel(r12)
                android.os.Bundle r0 = (android.os.Bundle) r0
                r5 = r0
            L_0x0315:
                r0 = r10
                r0.mo7834a((com.google.android.gms.internal.C1207fo) r1, (java.lang.String) r2, (int) r3, (android.os.IBinder) r4, (android.os.Bundle) r5)
                r13.writeNoException()
                goto L_0x000a
            L_0x031e:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.os.IBinder r0 = r12.readStrongBinder()
                com.google.android.gms.internal.fo r0 = com.google.android.gms.internal.C1207fo.C1208a.m3027G(r0)
                r10.mo7888d(r0)
                r13.writeNoException()
                goto L_0x000a
            L_0x0333:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.os.IBinder r0 = r12.readStrongBinder()
                com.google.android.gms.internal.fo r0 = com.google.android.gms.internal.C1207fo.C1208a.m3027G(r0)
                r10.mo7902e((com.google.android.gms.internal.C1207fo) r0)
                r13.writeNoException()
                goto L_0x000a
            L_0x0348:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                java.lang.String r0 = r12.readString()
                int r1 = r12.readInt()
                r10.mo7933j((java.lang.String) r0, (int) r1)
                r13.writeNoException()
                goto L_0x000a
            L_0x035d:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                java.lang.String r0 = r12.readString()
                int r1 = r12.readInt()
                r10.mo7930i((java.lang.String) r0, (int) r1)
                r13.writeNoException()
                goto L_0x000a
            L_0x0372:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.os.IBinder r0 = r12.readStrongBinder()
                com.google.android.gms.internal.fo r0 = com.google.android.gms.internal.C1207fo.C1208a.m3027G(r0)
                long r1 = r12.readLong()
                r10.mo7827a((com.google.android.gms.internal.C1207fo) r0, (long) r1)
                r13.writeNoException()
                goto L_0x000a
            L_0x038b:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                long r0 = r12.readLong()
                r10.mo7934k(r0)
                r13.writeNoException()
                goto L_0x000a
            L_0x039c:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.os.IBinder r0 = r12.readStrongBinder()
                com.google.android.gms.internal.fo r1 = com.google.android.gms.internal.C1207fo.C1208a.m3027G(r0)
                android.os.IBinder r2 = r12.readStrongBinder()
                int r3 = r12.readInt()
                java.lang.String[] r4 = r12.createStringArray()
                int r0 = r12.readInt()
                if (r0 == 0) goto L_0x03c4
                android.os.Parcelable$Creator r0 = android.os.Bundle.CREATOR
                java.lang.Object r0 = r0.createFromParcel(r12)
                android.os.Bundle r0 = (android.os.Bundle) r0
                r5 = r0
            L_0x03c4:
                int r0 = r12.readInt()
                if (r0 == 0) goto L_0x03d8
                r6 = r9
            L_0x03cb:
                long r7 = r12.readLong()
                r0 = r10
                r0.mo7830a((com.google.android.gms.internal.C1207fo) r1, (android.os.IBinder) r2, (int) r3, (java.lang.String[]) r4, (android.os.Bundle) r5, (boolean) r6, (long) r7)
                r13.writeNoException()
                goto L_0x000a
            L_0x03d8:
                r6 = r7
                goto L_0x03cb
            L_0x03da:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.os.IBinder r0 = r12.readStrongBinder()
                com.google.android.gms.internal.fo r1 = com.google.android.gms.internal.C1207fo.C1208a.m3027G(r0)
                android.os.IBinder r2 = r12.readStrongBinder()
                java.lang.String r3 = r12.readString()
                int r0 = r12.readInt()
                if (r0 == 0) goto L_0x0403
                r4 = r9
            L_0x03f6:
                long r5 = r12.readLong()
                r0 = r10
                r0.mo7831a((com.google.android.gms.internal.C1207fo) r1, (android.os.IBinder) r2, (java.lang.String) r3, (boolean) r4, (long) r5)
                r13.writeNoException()
                goto L_0x000a
            L_0x0403:
                r4 = r7
                goto L_0x03f6
            L_0x0405:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.os.IBinder r0 = r12.readStrongBinder()
                com.google.android.gms.internal.fo r0 = com.google.android.gms.internal.C1207fo.C1208a.m3027G(r0)
                java.lang.String r1 = r12.readString()
                r10.mo7904e((com.google.android.gms.internal.C1207fo) r0, (java.lang.String) r1)
                r13.writeNoException()
                goto L_0x000a
            L_0x041e:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.os.IBinder r0 = r12.readStrongBinder()
                com.google.android.gms.internal.fo r0 = com.google.android.gms.internal.C1207fo.C1208a.m3027G(r0)
                byte[] r1 = r12.createByteArray()
                java.lang.String r2 = r12.readString()
                java.lang.String r3 = r12.readString()
                int r0 = r10.mo7818a((com.google.android.gms.internal.C1207fo) r0, (byte[]) r1, (java.lang.String) r2, (java.lang.String) r3)
                r13.writeNoException()
                r13.writeInt(r0)
                goto L_0x000a
            L_0x0443:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                byte[] r0 = r12.createByteArray()
                java.lang.String r1 = r12.readString()
                java.lang.String[] r2 = r12.createStringArray()
                int r0 = r10.mo7862b((byte[]) r0, (java.lang.String) r1, (java.lang.String[]) r2)
                r13.writeNoException()
                r13.writeInt(r0)
                goto L_0x000a
            L_0x0460:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                java.lang.String r0 = r12.readString()
                java.lang.String r0 = r10.mo7856ag(r0)
                r13.writeNoException()
                r13.writeString(r0)
                goto L_0x000a
            L_0x0475:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                int r0 = r12.readInt()
                r10.clearNotifications(r0)
                r13.writeNoException()
                goto L_0x000a
            L_0x0486:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.os.IBinder r0 = r12.readStrongBinder()
                com.google.android.gms.internal.fo r0 = com.google.android.gms.internal.C1207fo.C1208a.m3027G(r0)
                java.lang.String r1 = r12.readString()
                r10.mo7908f((com.google.android.gms.internal.C1207fo) r0, (java.lang.String) r1)
                r13.writeNoException()
                goto L_0x000a
            L_0x049f:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.os.IBinder r0 = r12.readStrongBinder()
                com.google.android.gms.internal.fo r0 = com.google.android.gms.internal.C1207fo.C1208a.m3027G(r0)
                java.lang.String r1 = r12.readString()
                java.lang.String r2 = r12.readString()
                r10.mo7873b((com.google.android.gms.internal.C1207fo) r0, (java.lang.String) r1, (java.lang.String) r2)
                r13.writeNoException()
                goto L_0x000a
            L_0x04bc:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.os.IBinder r0 = r12.readStrongBinder()
                com.google.android.gms.internal.fo r1 = com.google.android.gms.internal.C1207fo.C1208a.m3027G(r0)
                java.lang.String r2 = r12.readString()
                java.lang.String r3 = r12.readString()
                int r4 = r12.readInt()
                int r5 = r12.readInt()
                int r6 = r12.readInt()
                int r0 = r12.readInt()
                if (r0 == 0) goto L_0x04e4
                r7 = r9
            L_0x04e4:
                r0 = r10
                r0.mo7843a((com.google.android.gms.internal.C1207fo) r1, (java.lang.String) r2, (java.lang.String) r3, (int) r4, (int) r5, (int) r6, (boolean) r7)
                r13.writeNoException()
                goto L_0x000a
            L_0x04ed:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.os.IBinder r0 = r12.readStrongBinder()
                com.google.android.gms.internal.fo r1 = com.google.android.gms.internal.C1207fo.C1208a.m3027G(r0)
                java.lang.String r2 = r12.readString()
                java.lang.String r3 = r12.readString()
                int r4 = r12.readInt()
                int r5 = r12.readInt()
                int r6 = r12.readInt()
                int r0 = r12.readInt()
                if (r0 == 0) goto L_0x0515
                r7 = r9
            L_0x0515:
                r0 = r10
                r0.mo7874b(r1, r2, r3, r4, r5, r6, r7)
                r13.writeNoException()
                goto L_0x000a
            L_0x051e:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.os.IBinder r0 = r12.readStrongBinder()
                com.google.android.gms.internal.fo r0 = com.google.android.gms.internal.C1207fo.C1208a.m3027G(r0)
                java.lang.String r1 = r12.readString()
                java.lang.String r2 = r12.readString()
                r10.mo7883c((com.google.android.gms.internal.C1207fo) r0, (java.lang.String) r1, (java.lang.String) r2)
                r13.writeNoException()
                goto L_0x000a
            L_0x053b:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.os.IBinder r0 = r12.readStrongBinder()
                com.google.android.gms.internal.fo r0 = com.google.android.gms.internal.C1207fo.C1208a.m3027G(r0)
                java.lang.String r1 = r12.readString()
                r10.mo7912g(r0, r1)
                r13.writeNoException()
                goto L_0x000a
            L_0x0554:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.os.IBinder r0 = r12.readStrongBinder()
                com.google.android.gms.internal.fo r0 = com.google.android.gms.internal.C1207fo.C1208a.m3027G(r0)
                java.lang.String r1 = r12.readString()
                r10.mo7927h(r0, r1)
                r13.writeNoException()
                goto L_0x000a
            L_0x056d:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.os.IBinder r0 = r12.readStrongBinder()
                com.google.android.gms.internal.fo r1 = com.google.android.gms.internal.C1207fo.C1208a.m3027G(r0)
                int r2 = r12.readInt()
                int r3 = r12.readInt()
                int r0 = r12.readInt()
                if (r0 == 0) goto L_0x0599
                r4 = r9
            L_0x0589:
                int r0 = r12.readInt()
                if (r0 == 0) goto L_0x059b
                r5 = r9
            L_0x0590:
                r0 = r10
                r0.mo7824a((com.google.android.gms.internal.C1207fo) r1, (int) r2, (int) r3, (boolean) r4, (boolean) r5)
                r13.writeNoException()
                goto L_0x000a
            L_0x0599:
                r4 = r7
                goto L_0x0589
            L_0x059b:
                r5 = r7
                goto L_0x0590
            L_0x059d:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.os.IBinder r0 = r12.readStrongBinder()
                com.google.android.gms.internal.fo r1 = com.google.android.gms.internal.C1207fo.C1208a.m3027G(r0)
                java.lang.String r2 = r12.readString()
                int r3 = r12.readInt()
                int r0 = r12.readInt()
                if (r0 == 0) goto L_0x05c9
                r4 = r9
            L_0x05b9:
                int r0 = r12.readInt()
                if (r0 == 0) goto L_0x05cb
                r5 = r9
            L_0x05c0:
                r0 = r10
                r0.mo7836a((com.google.android.gms.internal.C1207fo) r1, (java.lang.String) r2, (int) r3, (boolean) r4, (boolean) r5)
                r13.writeNoException()
                goto L_0x000a
            L_0x05c9:
                r4 = r7
                goto L_0x05b9
            L_0x05cb:
                r5 = r7
                goto L_0x05c0
            L_0x05cd:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.os.IBinder r0 = r12.readStrongBinder()
                com.google.android.gms.internal.fo r1 = com.google.android.gms.internal.C1207fo.C1208a.m3027G(r0)
                int r2 = r12.readInt()
                int r0 = r12.readInt()
                if (r0 == 0) goto L_0x05f4
                r0 = r9
            L_0x05e5:
                int r3 = r12.readInt()
                if (r3 == 0) goto L_0x05ec
                r7 = r9
            L_0x05ec:
                r10.mo7865b((com.google.android.gms.internal.C1207fo) r1, (int) r2, (boolean) r0, (boolean) r7)
                r13.writeNoException()
                goto L_0x000a
            L_0x05f4:
                r0 = r7
                goto L_0x05e5
            L_0x05f6:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.os.IBinder r0 = r12.readStrongBinder()
                com.google.android.gms.internal.fo r0 = com.google.android.gms.internal.C1207fo.C1208a.m3027G(r0)
                r10.mo7907f(r0)
                r13.writeNoException()
                goto L_0x000a
            L_0x060b:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.os.IBinder r0 = r12.readStrongBinder()
                com.google.android.gms.internal.fo r1 = com.google.android.gms.internal.C1207fo.C1208a.m3027G(r0)
                int r2 = r12.readInt()
                int r0 = r12.readInt()
                if (r0 == 0) goto L_0x0632
                r0 = r9
            L_0x0623:
                int r3 = r12.readInt()
                if (r3 == 0) goto L_0x062a
                r7 = r9
            L_0x062a:
                r10.mo7880c(r1, r2, r0, r7)
                r13.writeNoException()
                goto L_0x000a
            L_0x0632:
                r0 = r7
                goto L_0x0623
            L_0x0634:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.os.IBinder r0 = r12.readStrongBinder()
                com.google.android.gms.internal.fo r0 = com.google.android.gms.internal.C1207fo.C1208a.m3027G(r0)
                r10.mo7911g(r0)
                r13.writeNoException()
                goto L_0x000a
            L_0x0649:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                java.lang.String r0 = r12.readString()
                r10.mo7857ah(r0)
                r13.writeNoException()
                goto L_0x000a
            L_0x065a:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                java.lang.String r0 = r12.readString()
                java.lang.String r1 = r12.readString()
                int r2 = r12.readInt()
                r10.mo7878b((java.lang.String) r0, (java.lang.String) r1, (int) r2)
                r13.writeNoException()
                goto L_0x000a
            L_0x0673:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.os.IBinder r0 = r12.readStrongBinder()
                com.google.android.gms.internal.fo r0 = com.google.android.gms.internal.C1207fo.C1208a.m3027G(r0)
                java.lang.String r1 = r12.readString()
                r10.mo7929i((com.google.android.gms.internal.C1207fo) r0, (java.lang.String) r1)
                r13.writeNoException()
                goto L_0x000a
            L_0x068c:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.os.IBinder r0 = r12.readStrongBinder()
                com.google.android.gms.internal.fo r0 = com.google.android.gms.internal.C1207fo.C1208a.m3027G(r0)
                java.lang.String r1 = r12.readString()
                com.google.android.gms.common.data.DataHolder r0 = r10.mo7931j((com.google.android.gms.internal.C1207fo) r0, (java.lang.String) r1)
                r13.writeNoException()
                if (r0 == 0) goto L_0x06ae
                r13.writeInt(r9)
                r0.writeToParcel(r13, r9)
                goto L_0x000a
            L_0x06ae:
                r13.writeInt(r7)
                goto L_0x000a
            L_0x06b3:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                java.lang.String r0 = r12.readString()
                int r0 = r10.mo7858ai(r0)
                r13.writeNoException()
                r13.writeInt(r0)
                goto L_0x000a
            L_0x06c8:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.os.IBinder r0 = r12.readStrongBinder()
                com.google.android.gms.internal.fo r0 = com.google.android.gms.internal.C1207fo.C1208a.m3027G(r0)
                java.lang.String r1 = r12.readString()
                int r2 = r12.readInt()
                if (r2 == 0) goto L_0x06e0
                r7 = r9
            L_0x06e0:
                r10.mo7846a((com.google.android.gms.internal.C1207fo) r0, (java.lang.String) r1, (boolean) r7)
                r13.writeNoException()
                goto L_0x000a
            L_0x06e8:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.os.IBinder r0 = r12.readStrongBinder()
                com.google.android.gms.internal.fo r0 = com.google.android.gms.internal.C1207fo.C1208a.m3027G(r0)
                java.lang.String r1 = r12.readString()
                r10.mo7935k((com.google.android.gms.internal.C1207fo) r0, (java.lang.String) r1)
                r13.writeNoException()
                goto L_0x000a
            L_0x0701:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                java.lang.String r0 = r12.readString()
                int r1 = r12.readInt()
                r10.mo7936k((java.lang.String) r0, (int) r1)
                r13.writeNoException()
                goto L_0x000a
            L_0x0716:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                boolean r0 = r10.mo7897dh()
                r13.writeNoException()
                if (r0 == 0) goto L_0x0725
                r7 = r9
            L_0x0725:
                r13.writeInt(r7)
                goto L_0x000a
            L_0x072a:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                int r0 = r12.readInt()
                if (r0 == 0) goto L_0x0736
                r7 = r9
            L_0x0736:
                r10.mo7946s(r7)
                r13.writeNoException()
                goto L_0x000a
            L_0x073e:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.os.IBinder r0 = r12.readStrongBinder()
                com.google.android.gms.internal.fo r0 = com.google.android.gms.internal.C1207fo.C1208a.m3027G(r0)
                r10.mo7926h(r0)
                r13.writeNoException()
                goto L_0x000a
            L_0x0753:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.os.IBinder r0 = r12.readStrongBinder()
                com.google.android.gms.internal.fo r0 = com.google.android.gms.internal.C1207fo.C1208a.m3027G(r0)
                java.lang.String r1 = r12.readString()
                r10.mo7938l(r0, r1)
                r13.writeNoException()
                goto L_0x000a
            L_0x076c:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.os.IBinder r0 = r12.readStrongBinder()
                com.google.android.gms.internal.fo r0 = com.google.android.gms.internal.C1207fo.C1208a.m3027G(r0)
                r10.mo7928i(r0)
                r13.writeNoException()
                goto L_0x000a
            L_0x0781:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.os.IBinder r0 = r12.readStrongBinder()
                com.google.android.gms.internal.fo r1 = com.google.android.gms.internal.C1207fo.C1208a.m3027G(r0)
                int r0 = r12.readInt()
                if (r0 == 0) goto L_0x0795
                r7 = r9
            L_0x0795:
                int r0 = r12.readInt()
                if (r0 == 0) goto L_0x07ab
                android.os.Parcelable$Creator r0 = android.os.Bundle.CREATOR
                java.lang.Object r0 = r0.createFromParcel(r12)
                android.os.Bundle r0 = (android.os.Bundle) r0
            L_0x07a3:
                r10.mo7852a((com.google.android.gms.internal.C1207fo) r1, (boolean) r7, (android.os.Bundle) r0)
                r13.writeNoException()
                goto L_0x000a
            L_0x07ab:
                r0 = r5
                goto L_0x07a3
            L_0x07ad:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                java.lang.String r0 = r12.readString()
                android.net.Uri r0 = r10.mo7859aj(r0)
                r13.writeNoException()
                if (r0 == 0) goto L_0x07c7
                r13.writeInt(r9)
                r0.writeToParcel(r13, r9)
                goto L_0x000a
            L_0x07c7:
                r13.writeInt(r7)
                goto L_0x000a
            L_0x07cc:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.os.IBinder r0 = r12.readStrongBinder()
                com.google.android.gms.internal.fo r1 = com.google.android.gms.internal.C1207fo.C1208a.m3027G(r0)
                java.lang.String r2 = r12.readString()
                int r3 = r12.readInt()
                int r0 = r12.readInt()
                if (r0 == 0) goto L_0x07f8
                r4 = r9
            L_0x07e8:
                int r0 = r12.readInt()
                if (r0 == 0) goto L_0x07fa
                r5 = r9
            L_0x07ef:
                r0 = r10
                r0.mo7871b((com.google.android.gms.internal.C1207fo) r1, (java.lang.String) r2, (int) r3, (boolean) r4, (boolean) r5)
                r13.writeNoException()
                goto L_0x000a
            L_0x07f8:
                r4 = r7
                goto L_0x07e8
            L_0x07fa:
                r5 = r7
                goto L_0x07ef
            L_0x07fc:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                com.google.android.gms.common.data.DataHolder r0 = r10.mo7898di()
                r13.writeNoException()
                if (r0 == 0) goto L_0x0812
                r13.writeInt(r9)
                r0.writeToParcel(r13, r9)
                goto L_0x000a
            L_0x0812:
                r13.writeInt(r7)
                goto L_0x000a
            L_0x0817:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.os.IBinder r0 = r12.readStrongBinder()
                com.google.android.gms.internal.fo r0 = com.google.android.gms.internal.C1207fo.C1208a.m3027G(r0)
                int r1 = r12.readInt()
                if (r1 == 0) goto L_0x082b
                r7 = r9
            L_0x082b:
                r10.mo7851a((com.google.android.gms.internal.C1207fo) r0, (boolean) r7)
                r13.writeNoException()
                goto L_0x000a
            L_0x0833:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.os.IBinder r0 = r12.readStrongBinder()
                com.google.android.gms.internal.fo r0 = com.google.android.gms.internal.C1207fo.C1208a.m3027G(r0)
                java.lang.String r1 = r12.readString()
                java.lang.String r2 = r12.readString()
                int r3 = r12.readInt()
                if (r3 == 0) goto L_0x084f
                r7 = r9
            L_0x084f:
                r10.mo7845a((com.google.android.gms.internal.C1207fo) r0, (java.lang.String) r1, (java.lang.String) r2, (boolean) r7)
                r13.writeNoException()
                goto L_0x000a
            L_0x0857:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.os.IBinder r0 = r12.readStrongBinder()
                com.google.android.gms.internal.fo r1 = com.google.android.gms.internal.C1207fo.C1208a.m3027G(r0)
                int r2 = r12.readInt()
                int r0 = r12.readInt()
                if (r0 == 0) goto L_0x087e
                r0 = r9
            L_0x086f:
                int r3 = r12.readInt()
                if (r3 == 0) goto L_0x0876
                r7 = r9
            L_0x0876:
                r10.mo7889d(r1, r2, r0, r7)
                r13.writeNoException()
                goto L_0x000a
            L_0x087e:
                r0 = r7
                goto L_0x086f
            L_0x0880:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.os.IBinder r0 = r12.readStrongBinder()
                com.google.android.gms.internal.fo r1 = com.google.android.gms.internal.C1207fo.C1208a.m3027G(r0)
                int r2 = r12.readInt()
                int r0 = r12.readInt()
                if (r0 == 0) goto L_0x08a7
                r0 = r9
            L_0x0898:
                int r3 = r12.readInt()
                if (r3 == 0) goto L_0x089f
                r7 = r9
            L_0x089f:
                r10.mo7903e(r1, r2, r0, r7)
                r13.writeNoException()
                goto L_0x000a
            L_0x08a7:
                r0 = r7
                goto L_0x0898
            L_0x08a9:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.os.IBinder r0 = r12.readStrongBinder()
                com.google.android.gms.internal.fo r1 = com.google.android.gms.internal.C1207fo.C1208a.m3027G(r0)
                java.lang.String r2 = r12.readString()
                int r3 = r12.readInt()
                int r0 = r12.readInt()
                if (r0 == 0) goto L_0x08e3
                r4 = r9
            L_0x08c5:
                int r0 = r12.readInt()
                if (r0 == 0) goto L_0x08e5
                r5 = r9
            L_0x08cc:
                int r0 = r12.readInt()
                if (r0 == 0) goto L_0x08e7
                r6 = r9
            L_0x08d3:
                int r0 = r12.readInt()
                if (r0 == 0) goto L_0x08da
                r7 = r9
            L_0x08da:
                r0 = r10
                r0.mo7837a((com.google.android.gms.internal.C1207fo) r1, (java.lang.String) r2, (int) r3, (boolean) r4, (boolean) r5, (boolean) r6, (boolean) r7)
                r13.writeNoException()
                goto L_0x000a
            L_0x08e3:
                r4 = r7
                goto L_0x08c5
            L_0x08e5:
                r5 = r7
                goto L_0x08cc
            L_0x08e7:
                r6 = r7
                goto L_0x08d3
            L_0x08e9:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.os.IBinder r0 = r12.readStrongBinder()
                com.google.android.gms.internal.fo r0 = com.google.android.gms.internal.C1207fo.C1208a.m3027G(r0)
                java.lang.String r1 = r12.readString()
                int r2 = r12.readInt()
                if (r2 == 0) goto L_0x0901
                r7 = r9
            L_0x0901:
                r10.mo7876b((com.google.android.gms.internal.C1207fo) r0, (java.lang.String) r1, (boolean) r7)
                r13.writeNoException()
                goto L_0x000a
            L_0x0909:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.os.IBinder r0 = r12.readStrongBinder()
                com.google.android.gms.internal.fo r0 = com.google.android.gms.internal.C1207fo.C1208a.m3027G(r0)
                int r1 = r12.readInt()
                if (r1 == 0) goto L_0x091d
                r7 = r9
            L_0x091d:
                r10.mo7877b((com.google.android.gms.internal.C1207fo) r0, (boolean) r7)
                r13.writeNoException()
                goto L_0x000a
            L_0x0925:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.os.IBinder r0 = r12.readStrongBinder()
                com.google.android.gms.internal.fo r0 = com.google.android.gms.internal.C1207fo.C1208a.m3027G(r0)
                java.lang.String r1 = r12.readString()
                int r2 = r12.readInt()
                if (r2 == 0) goto L_0x093d
                r7 = r9
            L_0x093d:
                r10.mo7884c((com.google.android.gms.internal.C1207fo) r0, (java.lang.String) r1, (boolean) r7)
                r13.writeNoException()
                goto L_0x000a
            L_0x0945:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.os.IBinder r0 = r12.readStrongBinder()
                com.google.android.gms.internal.fo r0 = com.google.android.gms.internal.C1207fo.C1208a.m3027G(r0)
                java.lang.String r1 = r12.readString()
                int r2 = r12.readInt()
                if (r2 == 0) goto L_0x095d
                r7 = r9
            L_0x095d:
                r10.mo7893d((com.google.android.gms.internal.C1207fo) r0, (java.lang.String) r1, (boolean) r7)
                r13.writeNoException()
                goto L_0x000a
            L_0x0965:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.os.IBinder r0 = r12.readStrongBinder()
                com.google.android.gms.internal.fo r0 = com.google.android.gms.internal.C1207fo.C1208a.m3027G(r0)
                java.lang.String r1 = r12.readString()
                java.lang.String r2 = r12.readString()
                int r3 = r12.readInt()
                if (r3 == 0) goto L_0x0981
                r7 = r9
            L_0x0981:
                r10.mo7875b((com.google.android.gms.internal.C1207fo) r0, (java.lang.String) r1, (java.lang.String) r2, (boolean) r7)
                r13.writeNoException()
                goto L_0x000a
            L_0x0989:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                int r0 = r12.readInt()
                if (r0 == 0) goto L_0x09ad
                android.os.Parcelable$Creator r0 = android.net.Uri.CREATOR
                java.lang.Object r0 = r0.createFromParcel(r12)
                android.net.Uri r0 = (android.net.Uri) r0
            L_0x099c:
                android.os.ParcelFileDescriptor r0 = r10.mo7901e((android.net.Uri) r0)
                r13.writeNoException()
                if (r0 == 0) goto L_0x09af
                r13.writeInt(r9)
                r0.writeToParcel(r13, r9)
                goto L_0x000a
            L_0x09ad:
                r0 = r5
                goto L_0x099c
            L_0x09af:
                r13.writeInt(r7)
                goto L_0x000a
            L_0x09b4:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.os.IBinder r0 = r12.readStrongBinder()
                com.google.android.gms.internal.fo r0 = com.google.android.gms.internal.C1207fo.C1208a.m3027G(r0)
                java.lang.String r1 = r12.readString()
                r10.mo7939m(r0, r1)
                r13.writeNoException()
                goto L_0x000a
            L_0x09cd:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.os.IBinder r0 = r12.readStrongBinder()
                com.google.android.gms.internal.fo r1 = com.google.android.gms.internal.C1207fo.C1208a.m3027G(r0)
                java.lang.String r2 = r12.readString()
                long r3 = r12.readLong()
                java.lang.String r5 = r12.readString()
                r0 = r10
                r0.mo7839a((com.google.android.gms.internal.C1207fo) r1, (java.lang.String) r2, (long) r3, (java.lang.String) r5)
                r13.writeNoException()
                goto L_0x000a
            L_0x09ef:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.os.IBinder r0 = r12.readStrongBinder()
                com.google.android.gms.internal.fo r1 = com.google.android.gms.internal.C1207fo.C1208a.m3027G(r0)
                java.lang.String r2 = r12.readString()
                int r3 = r12.readInt()
                android.os.IBinder r4 = r12.readStrongBinder()
                int r0 = r12.readInt()
                if (r0 == 0) goto L_0x0a17
                android.os.Parcelable$Creator r0 = android.os.Bundle.CREATOR
                java.lang.Object r0 = r0.createFromParcel(r12)
                android.os.Bundle r0 = (android.os.Bundle) r0
                r5 = r0
            L_0x0a17:
                r0 = r10
                r0.mo7870b((com.google.android.gms.internal.C1207fo) r1, (java.lang.String) r2, (int) r3, (android.os.IBinder) r4, (android.os.Bundle) r5)
                r13.writeNoException()
                goto L_0x000a
            L_0x0a20:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.os.IBinder r0 = r12.readStrongBinder()
                com.google.android.gms.internal.fo r1 = com.google.android.gms.internal.C1207fo.C1208a.m3027G(r0)
                java.lang.String r2 = r12.readString()
                java.lang.String r3 = r12.readString()
                int r4 = r12.readInt()
                int r5 = r12.readInt()
                r0 = r10
                r0.mo7842a((com.google.android.gms.internal.C1207fo) r1, (java.lang.String) r2, (java.lang.String) r3, (int) r4, (int) r5)
                r13.writeNoException()
                goto L_0x000a
            L_0x0a46:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                java.lang.String r0 = r12.readString()
                r10.mo7860ak(r0)
                r13.writeNoException()
                goto L_0x000a
            L_0x0a57:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.os.IBinder r0 = r12.readStrongBinder()
                com.google.android.gms.internal.fo r0 = com.google.android.gms.internal.C1207fo.C1208a.m3027G(r0)
                int[] r1 = r12.createIntArray()
                r10.mo7853a((com.google.android.gms.internal.C1207fo) r0, (int[]) r1)
                r13.writeNoException()
                goto L_0x000a
            L_0x0a70:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.os.IBinder r0 = r12.readStrongBinder()
                com.google.android.gms.internal.fo r1 = com.google.android.gms.internal.C1207fo.C1208a.m3027G(r0)
                int r2 = r12.readInt()
                int r3 = r12.readInt()
                java.lang.String[] r4 = r12.createStringArray()
                int r0 = r12.readInt()
                if (r0 == 0) goto L_0x0a98
                android.os.Parcelable$Creator r0 = android.os.Bundle.CREATOR
                java.lang.Object r0 = r0.createFromParcel(r12)
                android.os.Bundle r0 = (android.os.Bundle) r0
                r5 = r0
            L_0x0a98:
                r0 = r10
                r0.mo7825a((com.google.android.gms.internal.C1207fo) r1, (int) r2, (int) r3, (java.lang.String[]) r4, (android.os.Bundle) r5)
                r13.writeNoException()
                goto L_0x000a
            L_0x0aa1:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.os.IBinder r0 = r12.readStrongBinder()
                com.google.android.gms.internal.fo r0 = com.google.android.gms.internal.C1207fo.C1208a.m3027G(r0)
                java.lang.String r1 = r12.readString()
                r10.mo7940n(r0, r1)
                r13.writeNoException()
                goto L_0x000a
            L_0x0aba:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.os.IBinder r0 = r12.readStrongBinder()
                com.google.android.gms.internal.fo r0 = com.google.android.gms.internal.C1207fo.C1208a.m3027G(r0)
                java.lang.String r1 = r12.readString()
                r10.mo7941o(r0, r1)
                r13.writeNoException()
                goto L_0x000a
            L_0x0ad3:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.os.IBinder r0 = r12.readStrongBinder()
                com.google.android.gms.internal.fo r1 = com.google.android.gms.internal.C1207fo.C1208a.m3027G(r0)
                java.lang.String r2 = r12.readString()
                byte[] r3 = r12.createByteArray()
                java.lang.String r4 = r12.readString()
                com.google.android.gms.games.multiplayer.ParticipantResultCreator r0 = com.google.android.gms.games.multiplayer.ParticipantResult.CREATOR
                java.lang.Object[] r5 = r12.createTypedArray(r0)
                com.google.android.gms.games.multiplayer.ParticipantResult[] r5 = (com.google.android.gms.games.multiplayer.ParticipantResult[]) r5
                r0 = r10
                r0.mo7848a((com.google.android.gms.internal.C1207fo) r1, (java.lang.String) r2, (byte[]) r3, (java.lang.String) r4, (com.google.android.gms.games.multiplayer.ParticipantResult[]) r5)
                r13.writeNoException()
                goto L_0x000a
            L_0x0afd:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.os.IBinder r0 = r12.readStrongBinder()
                com.google.android.gms.internal.fo r1 = com.google.android.gms.internal.C1207fo.C1208a.m3027G(r0)
                java.lang.String r2 = r12.readString()
                byte[] r3 = r12.createByteArray()
                com.google.android.gms.games.multiplayer.ParticipantResultCreator r0 = com.google.android.gms.games.multiplayer.ParticipantResult.CREATOR
                java.lang.Object[] r0 = r12.createTypedArray(r0)
                com.google.android.gms.games.multiplayer.ParticipantResult[] r0 = (com.google.android.gms.games.multiplayer.ParticipantResult[]) r0
                r10.mo7849a((com.google.android.gms.internal.C1207fo) r1, (java.lang.String) r2, (byte[]) r3, (com.google.android.gms.games.multiplayer.ParticipantResult[]) r0)
                r13.writeNoException()
                goto L_0x000a
            L_0x0b22:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.os.IBinder r0 = r12.readStrongBinder()
                com.google.android.gms.internal.fo r0 = com.google.android.gms.internal.C1207fo.C1208a.m3027G(r0)
                java.lang.String r1 = r12.readString()
                r10.mo7942p(r0, r1)
                r13.writeNoException()
                goto L_0x000a
            L_0x0b3b:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.os.IBinder r0 = r12.readStrongBinder()
                com.google.android.gms.internal.fo r0 = com.google.android.gms.internal.C1207fo.C1208a.m3027G(r0)
                java.lang.String r1 = r12.readString()
                r10.mo7943q(r0, r1)
                r13.writeNoException()
                goto L_0x000a
            L_0x0b54:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.os.IBinder r0 = r12.readStrongBinder()
                com.google.android.gms.internal.fo r0 = com.google.android.gms.internal.C1207fo.C1208a.m3027G(r0)
                java.lang.String r1 = r12.readString()
                java.lang.String r2 = r12.readString()
                r10.mo7892d((com.google.android.gms.internal.C1207fo) r0, (java.lang.String) r1, (java.lang.String) r2)
                r13.writeNoException()
                goto L_0x000a
            L_0x0b71:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.os.IBinder r0 = r12.readStrongBinder()
                com.google.android.gms.internal.fo r0 = com.google.android.gms.internal.C1207fo.C1208a.m3027G(r0)
                long r1 = r12.readLong()
                r10.mo7866b((com.google.android.gms.internal.C1207fo) r0, (long) r1)
                r13.writeNoException()
                goto L_0x000a
            L_0x0b8a:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                long r0 = r12.readLong()
                r10.mo7937l(r0)
                r13.writeNoException()
                goto L_0x000a
            L_0x0b9b:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.os.IBinder r0 = r12.readStrongBinder()
                com.google.android.gms.internal.fo r0 = com.google.android.gms.internal.C1207fo.C1208a.m3027G(r0)
                java.lang.String r1 = r12.readString()
                r10.mo7944r(r0, r1)
                r13.writeNoException()
                goto L_0x000a
            L_0x0bb4:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                int r0 = r10.getMaxTurnBasedMatchDataSize()
                r13.writeNoException()
                r13.writeInt(r0)
                goto L_0x000a
            L_0x0bc5:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                java.lang.String r0 = r12.readString()
                java.lang.String r1 = r12.readString()
                r10.mo7910f((java.lang.String) r0, (java.lang.String) r1)
                r13.writeNoException()
                goto L_0x000a
            L_0x0bda:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.os.IBinder r0 = r12.readStrongBinder()
                com.google.android.gms.internal.fo r0 = com.google.android.gms.internal.C1207fo.C1208a.m3027G(r0)
                java.lang.String r1 = r12.readString()
                java.lang.String r2 = r12.readString()
                r10.mo7905e(r0, r1, r2)
                r13.writeNoException()
                goto L_0x000a
            L_0x0bf7:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.os.IBinder r0 = r12.readStrongBinder()
                com.google.android.gms.internal.fo r0 = com.google.android.gms.internal.C1207fo.C1208a.m3027G(r0)
                java.lang.String r1 = r12.readString()
                java.lang.String r2 = r12.readString()
                r10.mo7909f(r0, r1, r2)
                r13.writeNoException()
                goto L_0x000a
            L_0x0c14:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.os.IBinder r0 = r12.readStrongBinder()
                com.google.android.gms.internal.fo r0 = com.google.android.gms.internal.C1207fo.C1208a.m3027G(r0)
                java.lang.String r1 = r12.readString()
                int[] r2 = r12.createIntArray()
                r10.mo7850a((com.google.android.gms.internal.C1207fo) r0, (java.lang.String) r1, (int[]) r2)
                r13.writeNoException()
                goto L_0x000a
            L_0x0c31:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                java.lang.String r0 = r12.readString()
                java.lang.String r1 = r12.readString()
                int r2 = r12.readInt()
                r10.mo7886c((java.lang.String) r0, (java.lang.String) r1, (int) r2)
                r13.writeNoException()
                goto L_0x000a
            L_0x0c4a:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.os.IBinder r0 = r12.readStrongBinder()
                com.google.android.gms.internal.fo r0 = com.google.android.gms.internal.C1207fo.C1208a.m3027G(r0)
                long r1 = r12.readLong()
                java.lang.String r3 = r12.readString()
                r10.mo7828a((com.google.android.gms.internal.C1207fo) r0, (long) r1, (java.lang.String) r3)
                r13.writeNoException()
                goto L_0x000a
            L_0x0c67:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                long r0 = r12.readLong()
                java.lang.String r2 = r12.readString()
                r10.mo7821a((long) r0, (java.lang.String) r2)
                r13.writeNoException()
                goto L_0x000a
            L_0x0c7c:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.os.IBinder r0 = r12.readStrongBinder()
                com.google.android.gms.internal.fo r0 = com.google.android.gms.internal.C1207fo.C1208a.m3027G(r0)
                long r1 = r12.readLong()
                java.lang.String r3 = r12.readString()
                r10.mo7867b((com.google.android.gms.internal.C1207fo) r0, (long) r1, (java.lang.String) r3)
                r13.writeNoException()
                goto L_0x000a
            L_0x0c99:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                long r0 = r12.readLong()
                java.lang.String r2 = r12.readString()
                r10.mo7863b((long) r0, (java.lang.String) r2)
                r13.writeNoException()
                goto L_0x000a
            L_0x0cae:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                r10.mo7899dj()
                r13.writeNoException()
                goto L_0x000a
            L_0x0cbb:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.os.IBinder r0 = r12.readStrongBinder()
                com.google.android.gms.internal.fo r0 = com.google.android.gms.internal.C1207fo.C1208a.m3027G(r0)
                java.lang.String r1 = r12.readString()
                int r2 = r12.readInt()
                int r3 = r12.readInt()
                if (r3 == 0) goto L_0x0cd7
                r7 = r9
            L_0x0cd7:
                r10.mo7835a((com.google.android.gms.internal.C1207fo) r0, (java.lang.String) r1, (int) r2, (boolean) r7)
                r13.writeNoException()
                goto L_0x000a
            L_0x0cdf:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.os.IBinder r0 = r12.readStrongBinder()
                com.google.android.gms.internal.fo r0 = com.google.android.gms.internal.C1207fo.C1208a.m3027G(r0)
                int r1 = r12.readInt()
                if (r1 == 0) goto L_0x0cf3
                r7 = r9
            L_0x0cf3:
                r10.mo7885c((com.google.android.gms.internal.C1207fo) r0, (boolean) r7)
                r13.writeNoException()
                goto L_0x000a
            L_0x0cfb:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.os.IBinder r0 = r12.readStrongBinder()
                com.google.android.gms.internal.fo r1 = com.google.android.gms.internal.C1207fo.C1208a.m3027G(r0)
                java.lang.String r2 = r12.readString()
                int r3 = r12.readInt()
                int r0 = r12.readInt()
                if (r0 == 0) goto L_0x0d27
                r4 = r9
            L_0x0d17:
                int r0 = r12.readInt()
                if (r0 == 0) goto L_0x0d29
                r5 = r9
            L_0x0d1e:
                r0 = r10
                r0.mo7882c(r1, r2, r3, r4, r5)
                r13.writeNoException()
                goto L_0x000a
            L_0x0d27:
                r4 = r7
                goto L_0x0d17
            L_0x0d29:
                r5 = r7
                goto L_0x0d1e
            L_0x0d2b:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.os.IBinder r0 = r12.readStrongBinder()
                com.google.android.gms.internal.fo r0 = com.google.android.gms.internal.C1207fo.C1208a.m3027G(r0)
                java.lang.String r1 = r12.readString()
                r10.mo7945s(r0, r1)
                r13.writeNoException()
                goto L_0x000a
            L_0x0d44:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.content.Intent r0 = r10.getAllLeaderboardsIntent()
                r13.writeNoException()
                if (r0 == 0) goto L_0x0d5a
                r13.writeInt(r9)
                r0.writeToParcel(r13, r9)
                goto L_0x000a
            L_0x0d5a:
                r13.writeInt(r7)
                goto L_0x000a
            L_0x0d5f:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                java.lang.String r0 = r12.readString()
                android.content.Intent r0 = r10.getLeaderboardIntent(r0)
                r13.writeNoException()
                if (r0 == 0) goto L_0x0d79
                r13.writeInt(r9)
                r0.writeToParcel(r13, r9)
                goto L_0x000a
            L_0x0d79:
                r13.writeInt(r7)
                goto L_0x000a
            L_0x0d7e:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.content.Intent r0 = r10.getAchievementsIntent()
                r13.writeNoException()
                if (r0 == 0) goto L_0x0d94
                r13.writeInt(r9)
                r0.writeToParcel(r13, r9)
                goto L_0x000a
            L_0x0d94:
                r13.writeInt(r7)
                goto L_0x000a
            L_0x0d99:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.content.Intent r0 = r10.getMatchInboxIntent()
                r13.writeNoException()
                if (r0 == 0) goto L_0x0daf
                r13.writeInt(r9)
                r0.writeToParcel(r13, r9)
                goto L_0x000a
            L_0x0daf:
                r13.writeInt(r7)
                goto L_0x000a
            L_0x0db4:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.content.Intent r0 = r10.getInvitationInboxIntent()
                r13.writeNoException()
                if (r0 == 0) goto L_0x0dca
                r13.writeInt(r9)
                r0.writeToParcel(r13, r9)
                goto L_0x000a
            L_0x0dca:
                r13.writeInt(r7)
                goto L_0x000a
            L_0x0dcf:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                int r1 = r12.readInt()
                int r2 = r12.readInt()
                int r0 = r12.readInt()
                if (r0 == 0) goto L_0x0df4
                r0 = r9
            L_0x0de3:
                android.content.Intent r0 = r10.getTurnBasedSelectOpponentsIntent(r1, r2, r0)
                r13.writeNoException()
                if (r0 == 0) goto L_0x0df6
                r13.writeInt(r9)
                r0.writeToParcel(r13, r9)
                goto L_0x000a
            L_0x0df4:
                r0 = r7
                goto L_0x0de3
            L_0x0df6:
                r13.writeInt(r7)
                goto L_0x000a
            L_0x0dfb:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                int r1 = r12.readInt()
                int r2 = r12.readInt()
                int r0 = r12.readInt()
                if (r0 == 0) goto L_0x0e20
                r0 = r9
            L_0x0e0f:
                android.content.Intent r0 = r10.getRealTimeSelectOpponentsIntent(r1, r2, r0)
                r13.writeNoException()
                if (r0 == 0) goto L_0x0e22
                r13.writeInt(r9)
                r0.writeToParcel(r13, r9)
                goto L_0x000a
            L_0x0e20:
                r0 = r7
                goto L_0x0e0f
            L_0x0e22:
                r13.writeInt(r7)
                goto L_0x000a
            L_0x0e27:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.content.Intent r0 = r10.getPlayerSearchIntent()
                r13.writeNoException()
                if (r0 == 0) goto L_0x0e3d
                r13.writeInt(r9)
                r0.writeToParcel(r13, r9)
                goto L_0x000a
            L_0x0e3d:
                r13.writeInt(r7)
                goto L_0x000a
            L_0x0e42:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                int r0 = r12.readInt()
                if (r0 == 0) goto L_0x0e6a
                android.os.Parcelable$Creator<com.google.android.gms.games.multiplayer.realtime.RoomEntity> r0 = com.google.android.gms.games.multiplayer.realtime.RoomEntity.CREATOR
                java.lang.Object r0 = r0.createFromParcel(r12)
                com.google.android.gms.games.multiplayer.realtime.RoomEntity r0 = (com.google.android.gms.games.multiplayer.realtime.RoomEntity) r0
            L_0x0e55:
                int r1 = r12.readInt()
                android.content.Intent r0 = r10.mo7819a((com.google.android.gms.games.multiplayer.realtime.RoomEntity) r0, (int) r1)
                r13.writeNoException()
                if (r0 == 0) goto L_0x0e6c
                r13.writeInt(r9)
                r0.writeToParcel(r13, r9)
                goto L_0x000a
            L_0x0e6a:
                r0 = r5
                goto L_0x0e55
            L_0x0e6c:
                r13.writeInt(r7)
                goto L_0x000a
            L_0x0e71:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.content.Intent r0 = r10.getSettingsIntent()
                r13.writeNoException()
                if (r0 == 0) goto L_0x0e87
                r13.writeInt(r9)
                r0.writeToParcel(r13, r9)
                goto L_0x000a
            L_0x0e87:
                r13.writeInt(r7)
                goto L_0x000a
            L_0x0e8c:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.content.Intent r0 = r10.mo7900dk()
                r13.writeNoException()
                if (r0 == 0) goto L_0x0ea2
                r13.writeInt(r9)
                r0.writeToParcel(r13, r9)
                goto L_0x000a
            L_0x0ea2:
                r13.writeInt(r7)
                goto L_0x000a
            L_0x0ea7:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.os.Parcelable$Creator<com.google.android.gms.games.multiplayer.ParticipantEntity> r0 = com.google.android.gms.games.multiplayer.ParticipantEntity.CREATOR
                java.lang.Object[] r1 = r12.createTypedArray(r0)
                com.google.android.gms.games.multiplayer.ParticipantEntity[] r1 = (com.google.android.gms.games.multiplayer.ParticipantEntity[]) r1
                java.lang.String r2 = r12.readString()
                java.lang.String r3 = r12.readString()
                int r0 = r12.readInt()
                if (r0 == 0) goto L_0x0eec
                android.os.Parcelable$Creator r0 = android.net.Uri.CREATOR
                java.lang.Object r0 = r0.createFromParcel(r12)
                android.net.Uri r0 = (android.net.Uri) r0
                r4 = r0
            L_0x0ecb:
                int r0 = r12.readInt()
                if (r0 == 0) goto L_0x0eda
                android.os.Parcelable$Creator r0 = android.net.Uri.CREATOR
                java.lang.Object r0 = r0.createFromParcel(r12)
                android.net.Uri r0 = (android.net.Uri) r0
                r5 = r0
            L_0x0eda:
                r0 = r10
                android.content.Intent r0 = r0.mo7820a((com.google.android.gms.games.multiplayer.ParticipantEntity[]) r1, (java.lang.String) r2, (java.lang.String) r3, (android.net.Uri) r4, (android.net.Uri) r5)
                r13.writeNoException()
                if (r0 == 0) goto L_0x0eee
                r13.writeInt(r9)
                r0.writeToParcel(r13, r9)
                goto L_0x000a
            L_0x0eec:
                r4 = r5
                goto L_0x0ecb
            L_0x0eee:
                r13.writeInt(r7)
                goto L_0x000a
            L_0x0ef3:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                int r0 = r10.mo7894dd()
                r13.writeNoException()
                r13.writeInt(r0)
                goto L_0x000a
            L_0x0f04:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.os.IBinder r0 = r12.readStrongBinder()
                com.google.android.gms.internal.fo r1 = com.google.android.gms.internal.C1207fo.C1208a.m3027G(r0)
                java.lang.String r2 = r12.readString()
                int r3 = r12.readInt()
                int r0 = r12.readInt()
                if (r0 == 0) goto L_0x0f30
                r4 = r9
            L_0x0f20:
                int r0 = r12.readInt()
                if (r0 == 0) goto L_0x0f32
                r5 = r9
            L_0x0f27:
                r0 = r10
                r0.mo7891d(r1, r2, r3, r4, r5)
                r13.writeNoException()
                goto L_0x000a
            L_0x0f30:
                r4 = r7
                goto L_0x0f20
            L_0x0f32:
                r5 = r7
                goto L_0x0f27
            L_0x0f34:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                android.os.IBinder r0 = r12.readStrongBinder()
                com.google.android.gms.internal.fo r1 = com.google.android.gms.internal.C1207fo.C1208a.m3027G(r0)
                java.lang.String r2 = r12.readString()
                java.lang.String r3 = r12.readString()
                int r4 = r12.readInt()
                int r0 = r12.readInt()
                if (r0 == 0) goto L_0x0f64
                r5 = r9
            L_0x0f54:
                int r0 = r12.readInt()
                if (r0 == 0) goto L_0x0f66
                r6 = r9
            L_0x0f5b:
                r0 = r10
                r0.mo7844a((com.google.android.gms.internal.C1207fo) r1, (java.lang.String) r2, (java.lang.String) r3, (int) r4, (boolean) r5, (boolean) r6)
                r13.writeNoException()
                goto L_0x000a
            L_0x0f64:
                r5 = r7
                goto L_0x0f54
            L_0x0f66:
                r6 = r7
                goto L_0x0f5b
            L_0x0f68:
                java.lang.String r0 = "com.google.android.gms.games.internal.IGamesService"
                r12.enforceInterface(r0)
                java.lang.String r0 = r12.readString()
                android.os.ParcelFileDescriptor r0 = r10.mo7861al(r0)
                r13.writeNoException()
                if (r0 == 0) goto L_0x0f82
                r13.writeInt(r9)
                r0.writeToParcel(r13, r9)
                goto L_0x000a
            L_0x0f82:
                r13.writeInt(r7)
                goto L_0x000a
            */
            throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.internal.C1210fp.C1211a.onTransact(int, android.os.Parcel, android.os.Parcel, int):boolean");
        }
    }

    /* renamed from: a */
    int mo7818a(C1207fo foVar, byte[] bArr, String str, String str2) throws RemoteException;

    /* renamed from: a */
    Intent mo7819a(RoomEntity roomEntity, int i) throws RemoteException;

    /* renamed from: a */
    Intent mo7820a(ParticipantEntity[] participantEntityArr, String str, String str2, Uri uri, Uri uri2) throws RemoteException;

    /* renamed from: a */
    void mo7821a(long j, String str) throws RemoteException;

    /* renamed from: a */
    void mo7822a(IBinder iBinder, Bundle bundle) throws RemoteException;

    /* renamed from: a */
    void mo7823a(C1207fo foVar) throws RemoteException;

    /* renamed from: a */
    void mo7824a(C1207fo foVar, int i, int i2, boolean z, boolean z2) throws RemoteException;

    /* renamed from: a */
    void mo7825a(C1207fo foVar, int i, int i2, String[] strArr, Bundle bundle) throws RemoteException;

    /* renamed from: a */
    void mo7826a(C1207fo foVar, int i, boolean z, boolean z2) throws RemoteException;

    /* renamed from: a */
    void mo7827a(C1207fo foVar, long j) throws RemoteException;

    /* renamed from: a */
    void mo7828a(C1207fo foVar, long j, String str) throws RemoteException;

    /* renamed from: a */
    void mo7829a(C1207fo foVar, Bundle bundle, int i, int i2) throws RemoteException;

    /* renamed from: a */
    void mo7830a(C1207fo foVar, IBinder iBinder, int i, String[] strArr, Bundle bundle, boolean z, long j) throws RemoteException;

    /* renamed from: a */
    void mo7831a(C1207fo foVar, IBinder iBinder, String str, boolean z, long j) throws RemoteException;

    /* renamed from: a */
    void mo7832a(C1207fo foVar, String str) throws RemoteException;

    /* renamed from: a */
    void mo7833a(C1207fo foVar, String str, int i, int i2, int i3, boolean z) throws RemoteException;

    /* renamed from: a */
    void mo7834a(C1207fo foVar, String str, int i, IBinder iBinder, Bundle bundle) throws RemoteException;

    /* renamed from: a */
    void mo7835a(C1207fo foVar, String str, int i, boolean z) throws RemoteException;

    /* renamed from: a */
    void mo7836a(C1207fo foVar, String str, int i, boolean z, boolean z2) throws RemoteException;

    /* renamed from: a */
    void mo7837a(C1207fo foVar, String str, int i, boolean z, boolean z2, boolean z3, boolean z4) throws RemoteException;

    /* renamed from: a */
    void mo7838a(C1207fo foVar, String str, long j) throws RemoteException;

    /* renamed from: a */
    void mo7839a(C1207fo foVar, String str, long j, String str2) throws RemoteException;

    /* renamed from: a */
    void mo7840a(C1207fo foVar, String str, IBinder iBinder, Bundle bundle) throws RemoteException;

    /* renamed from: a */
    void mo7841a(C1207fo foVar, String str, String str2) throws RemoteException;

    /* renamed from: a */
    void mo7842a(C1207fo foVar, String str, String str2, int i, int i2) throws RemoteException;

    /* renamed from: a */
    void mo7843a(C1207fo foVar, String str, String str2, int i, int i2, int i3, boolean z) throws RemoteException;

    /* renamed from: a */
    void mo7844a(C1207fo foVar, String str, String str2, int i, boolean z, boolean z2) throws RemoteException;

    /* renamed from: a */
    void mo7845a(C1207fo foVar, String str, String str2, boolean z) throws RemoteException;

    /* renamed from: a */
    void mo7846a(C1207fo foVar, String str, boolean z) throws RemoteException;

    /* renamed from: a */
    void mo7847a(C1207fo foVar, String str, boolean z, long[] jArr) throws RemoteException;

    /* renamed from: a */
    void mo7848a(C1207fo foVar, String str, byte[] bArr, String str2, ParticipantResult[] participantResultArr) throws RemoteException;

    /* renamed from: a */
    void mo7849a(C1207fo foVar, String str, byte[] bArr, ParticipantResult[] participantResultArr) throws RemoteException;

    /* renamed from: a */
    void mo7850a(C1207fo foVar, String str, int[] iArr) throws RemoteException;

    /* renamed from: a */
    void mo7851a(C1207fo foVar, boolean z) throws RemoteException;

    /* renamed from: a */
    void mo7852a(C1207fo foVar, boolean z, Bundle bundle) throws RemoteException;

    /* renamed from: a */
    void mo7853a(C1207fo foVar, int[] iArr) throws RemoteException;

    /* renamed from: aU */
    Bundle mo7854aU() throws RemoteException;

    /* renamed from: af */
    String mo7855af(String str) throws RemoteException;

    /* renamed from: ag */
    String mo7856ag(String str) throws RemoteException;

    /* renamed from: ah */
    void mo7857ah(String str) throws RemoteException;

    /* renamed from: ai */
    int mo7858ai(String str) throws RemoteException;

    /* renamed from: aj */
    Uri mo7859aj(String str) throws RemoteException;

    /* renamed from: ak */
    void mo7860ak(String str) throws RemoteException;

    /* renamed from: al */
    ParcelFileDescriptor mo7861al(String str) throws RemoteException;

    /* renamed from: b */
    int mo7862b(byte[] bArr, String str, String[] strArr) throws RemoteException;

    /* renamed from: b */
    void mo7863b(long j, String str) throws RemoteException;

    /* renamed from: b */
    void mo7864b(C1207fo foVar) throws RemoteException;

    /* renamed from: b */
    void mo7865b(C1207fo foVar, int i, boolean z, boolean z2) throws RemoteException;

    /* renamed from: b */
    void mo7866b(C1207fo foVar, long j) throws RemoteException;

    /* renamed from: b */
    void mo7867b(C1207fo foVar, long j, String str) throws RemoteException;

    /* renamed from: b */
    void mo7868b(C1207fo foVar, String str) throws RemoteException;

    /* renamed from: b */
    void mo7869b(C1207fo foVar, String str, int i, int i2, int i3, boolean z) throws RemoteException;

    /* renamed from: b */
    void mo7870b(C1207fo foVar, String str, int i, IBinder iBinder, Bundle bundle) throws RemoteException;

    /* renamed from: b */
    void mo7871b(C1207fo foVar, String str, int i, boolean z, boolean z2) throws RemoteException;

    /* renamed from: b */
    void mo7872b(C1207fo foVar, String str, IBinder iBinder, Bundle bundle) throws RemoteException;

    /* renamed from: b */
    void mo7873b(C1207fo foVar, String str, String str2) throws RemoteException;

    /* renamed from: b */
    void mo7874b(C1207fo foVar, String str, String str2, int i, int i2, int i3, boolean z) throws RemoteException;

    /* renamed from: b */
    void mo7875b(C1207fo foVar, String str, String str2, boolean z) throws RemoteException;

    /* renamed from: b */
    void mo7876b(C1207fo foVar, String str, boolean z) throws RemoteException;

    /* renamed from: b */
    void mo7877b(C1207fo foVar, boolean z) throws RemoteException;

    /* renamed from: b */
    void mo7878b(String str, String str2, int i) throws RemoteException;

    /* renamed from: c */
    void mo7879c(C1207fo foVar) throws RemoteException;

    /* renamed from: c */
    void mo7880c(C1207fo foVar, int i, boolean z, boolean z2) throws RemoteException;

    /* renamed from: c */
    void mo7881c(C1207fo foVar, String str) throws RemoteException;

    /* renamed from: c */
    void mo7882c(C1207fo foVar, String str, int i, boolean z, boolean z2) throws RemoteException;

    /* renamed from: c */
    void mo7883c(C1207fo foVar, String str, String str2) throws RemoteException;

    /* renamed from: c */
    void mo7884c(C1207fo foVar, String str, boolean z) throws RemoteException;

    /* renamed from: c */
    void mo7885c(C1207fo foVar, boolean z) throws RemoteException;

    /* renamed from: c */
    void mo7886c(String str, String str2, int i) throws RemoteException;

    void clearNotifications(int i) throws RemoteException;

    /* renamed from: d */
    void mo7888d(C1207fo foVar) throws RemoteException;

    /* renamed from: d */
    void mo7889d(C1207fo foVar, int i, boolean z, boolean z2) throws RemoteException;

    /* renamed from: d */
    void mo7890d(C1207fo foVar, String str) throws RemoteException;

    /* renamed from: d */
    void mo7891d(C1207fo foVar, String str, int i, boolean z, boolean z2) throws RemoteException;

    /* renamed from: d */
    void mo7892d(C1207fo foVar, String str, String str2) throws RemoteException;

    /* renamed from: d */
    void mo7893d(C1207fo foVar, String str, boolean z) throws RemoteException;

    /* renamed from: dd */
    int mo7894dd() throws RemoteException;

    /* renamed from: df */
    void mo7895df() throws RemoteException;

    /* renamed from: dg */
    DataHolder mo7896dg() throws RemoteException;

    /* renamed from: dh */
    boolean mo7897dh() throws RemoteException;

    /* renamed from: di */
    DataHolder mo7898di() throws RemoteException;

    /* renamed from: dj */
    void mo7899dj() throws RemoteException;

    /* renamed from: dk */
    Intent mo7900dk() throws RemoteException;

    /* renamed from: e */
    ParcelFileDescriptor mo7901e(Uri uri) throws RemoteException;

    /* renamed from: e */
    void mo7902e(C1207fo foVar) throws RemoteException;

    /* renamed from: e */
    void mo7903e(C1207fo foVar, int i, boolean z, boolean z2) throws RemoteException;

    /* renamed from: e */
    void mo7904e(C1207fo foVar, String str) throws RemoteException;

    /* renamed from: e */
    void mo7905e(C1207fo foVar, String str, String str2) throws RemoteException;

    /* renamed from: e */
    void mo7906e(String str, String str2) throws RemoteException;

    /* renamed from: f */
    void mo7907f(C1207fo foVar) throws RemoteException;

    /* renamed from: f */
    void mo7908f(C1207fo foVar, String str) throws RemoteException;

    /* renamed from: f */
    void mo7909f(C1207fo foVar, String str, String str2) throws RemoteException;

    /* renamed from: f */
    void mo7910f(String str, String str2) throws RemoteException;

    /* renamed from: g */
    void mo7911g(C1207fo foVar) throws RemoteException;

    /* renamed from: g */
    void mo7912g(C1207fo foVar, String str) throws RemoteException;

    Intent getAchievementsIntent() throws RemoteException;

    Intent getAllLeaderboardsIntent() throws RemoteException;

    String getAppId() throws RemoteException;

    String getCurrentAccountName() throws RemoteException;

    String getCurrentPlayerId() throws RemoteException;

    Intent getInvitationInboxIntent() throws RemoteException;

    Intent getLeaderboardIntent(String str) throws RemoteException;

    Intent getMatchInboxIntent() throws RemoteException;

    int getMaxTurnBasedMatchDataSize() throws RemoteException;

    Intent getPlayerSearchIntent() throws RemoteException;

    Intent getRealTimeSelectOpponentsIntent(int i, int i2, boolean z) throws RemoteException;

    Intent getSettingsIntent() throws RemoteException;

    Intent getTurnBasedSelectOpponentsIntent(int i, int i2, boolean z) throws RemoteException;

    /* renamed from: h */
    void mo7926h(C1207fo foVar) throws RemoteException;

    /* renamed from: h */
    void mo7927h(C1207fo foVar, String str) throws RemoteException;

    /* renamed from: i */
    void mo7928i(C1207fo foVar) throws RemoteException;

    /* renamed from: i */
    void mo7929i(C1207fo foVar, String str) throws RemoteException;

    /* renamed from: i */
    void mo7930i(String str, int i) throws RemoteException;

    /* renamed from: j */
    DataHolder mo7931j(C1207fo foVar, String str) throws RemoteException;

    /* renamed from: j */
    void mo7932j(long j) throws RemoteException;

    /* renamed from: j */
    void mo7933j(String str, int i) throws RemoteException;

    /* renamed from: k */
    void mo7934k(long j) throws RemoteException;

    /* renamed from: k */
    void mo7935k(C1207fo foVar, String str) throws RemoteException;

    /* renamed from: k */
    void mo7936k(String str, int i) throws RemoteException;

    /* renamed from: l */
    void mo7937l(long j) throws RemoteException;

    /* renamed from: l */
    void mo7938l(C1207fo foVar, String str) throws RemoteException;

    /* renamed from: m */
    void mo7939m(C1207fo foVar, String str) throws RemoteException;

    /* renamed from: n */
    void mo7940n(C1207fo foVar, String str) throws RemoteException;

    /* renamed from: o */
    void mo7941o(C1207fo foVar, String str) throws RemoteException;

    /* renamed from: p */
    void mo7942p(C1207fo foVar, String str) throws RemoteException;

    /* renamed from: q */
    void mo7943q(C1207fo foVar, String str) throws RemoteException;

    /* renamed from: r */
    void mo7944r(C1207fo foVar, String str) throws RemoteException;

    /* renamed from: s */
    void mo7945s(C1207fo foVar, String str) throws RemoteException;

    /* renamed from: s */
    void mo7946s(boolean z) throws RemoteException;
}
