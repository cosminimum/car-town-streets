package com.google.android.gms.internal;

import android.app.PendingIntent;
import android.location.Location;
import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.gms.internal.gj;
import com.google.android.gms.internal.gk;
import com.google.android.gms.internal.gz;
import com.google.android.gms.internal.hd;
import com.google.android.gms.location.LocationRequest;
import com.google.android.gms.location.c;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.LatLngBounds;
import com.millennialmedia.android.MMError;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes.dex */
public interface gl extends IInterface {

    /* loaded from: classes.dex */
    public static abstract class a extends Binder implements gl {

        /* renamed from: com.google.android.gms.internal.gl$a$a  reason: collision with other inner class name */
        /* loaded from: classes.dex */
        private static class C0043a implements gl {
            private IBinder dU;

            C0043a(IBinder iBinder) {
                this.dU = iBinder;
            }

            @Override // com.google.android.gms.internal.gl
            public void a(long j, boolean z, PendingIntent pendingIntent) throws RemoteException {
                int i = 1;
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.location.internal.IGoogleLocationManagerService");
                    obtain.writeLong(j);
                    if (!z) {
                        i = 0;
                    }
                    obtain.writeInt(i);
                    if (pendingIntent != null) {
                        obtain.writeInt(1);
                        pendingIntent.writeToParcel(obtain, 0);
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

            @Override // com.google.android.gms.internal.gl
            public void a(PendingIntent pendingIntent) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.location.internal.IGoogleLocationManagerService");
                    if (pendingIntent != null) {
                        obtain.writeInt(1);
                        pendingIntent.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    this.dU.transact(11, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.internal.gl
            public void a(PendingIntent pendingIntent, gk gkVar, String str) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.location.internal.IGoogleLocationManagerService");
                    if (pendingIntent != null) {
                        obtain.writeInt(1);
                        pendingIntent.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    obtain.writeStrongBinder(gkVar != null ? gkVar.asBinder() : null);
                    obtain.writeString(str);
                    this.dU.transact(2, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.internal.gl
            public void a(Location location, int i) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.location.internal.IGoogleLocationManagerService");
                    if (location != null) {
                        obtain.writeInt(1);
                        location.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    obtain.writeInt(i);
                    this.dU.transact(26, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.internal.gl
            public void a(gk gkVar, String str) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.location.internal.IGoogleLocationManagerService");
                    obtain.writeStrongBinder(gkVar != null ? gkVar.asBinder() : null);
                    obtain.writeString(str);
                    this.dU.transact(4, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.internal.gl
            public void a(gt gtVar, hi hiVar, gz gzVar) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.location.internal.IGoogleLocationManagerService");
                    if (gtVar != null) {
                        obtain.writeInt(1);
                        gtVar.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    if (hiVar != null) {
                        obtain.writeInt(1);
                        hiVar.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    obtain.writeStrongBinder(gzVar != null ? gzVar.asBinder() : null);
                    this.dU.transact(17, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.internal.gl
            public void a(gv gvVar, hi hiVar, PendingIntent pendingIntent) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.location.internal.IGoogleLocationManagerService");
                    if (gvVar != null) {
                        obtain.writeInt(1);
                        gvVar.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    if (hiVar != null) {
                        obtain.writeInt(1);
                        hiVar.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    if (pendingIntent != null) {
                        obtain.writeInt(1);
                        pendingIntent.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    this.dU.transact(18, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.internal.gl
            public void a(hi hiVar, PendingIntent pendingIntent) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.location.internal.IGoogleLocationManagerService");
                    if (hiVar != null) {
                        obtain.writeInt(1);
                        hiVar.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    if (pendingIntent != null) {
                        obtain.writeInt(1);
                        pendingIntent.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    this.dU.transact(19, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.internal.gl
            public void a(LocationRequest locationRequest, PendingIntent pendingIntent) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.location.internal.IGoogleLocationManagerService");
                    if (locationRequest != null) {
                        obtain.writeInt(1);
                        locationRequest.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    if (pendingIntent != null) {
                        obtain.writeInt(1);
                        pendingIntent.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    this.dU.transact(9, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.internal.gl
            public void a(LocationRequest locationRequest, com.google.android.gms.location.c cVar) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.location.internal.IGoogleLocationManagerService");
                    if (locationRequest != null) {
                        obtain.writeInt(1);
                        locationRequest.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    obtain.writeStrongBinder(cVar != null ? cVar.asBinder() : null);
                    this.dU.transact(8, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.internal.gl
            public void a(LocationRequest locationRequest, com.google.android.gms.location.c cVar, String str) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.location.internal.IGoogleLocationManagerService");
                    if (locationRequest != null) {
                        obtain.writeInt(1);
                        locationRequest.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    obtain.writeStrongBinder(cVar != null ? cVar.asBinder() : null);
                    obtain.writeString(str);
                    this.dU.transact(20, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.internal.gl
            public void a(com.google.android.gms.location.c cVar) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.location.internal.IGoogleLocationManagerService");
                    obtain.writeStrongBinder(cVar != null ? cVar.asBinder() : null);
                    this.dU.transact(10, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.internal.gl
            public void a(LatLng latLng, gt gtVar, hi hiVar, gz gzVar) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.location.internal.IGoogleLocationManagerService");
                    if (latLng != null) {
                        obtain.writeInt(1);
                        latLng.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    if (gtVar != null) {
                        obtain.writeInt(1);
                        gtVar.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    if (hiVar != null) {
                        obtain.writeInt(1);
                        hiVar.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    obtain.writeStrongBinder(gzVar != null ? gzVar.asBinder() : null);
                    this.dU.transact(16, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.internal.gl
            public void a(LatLngBounds latLngBounds, int i, gt gtVar, hi hiVar, gz gzVar) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.location.internal.IGoogleLocationManagerService");
                    if (latLngBounds != null) {
                        obtain.writeInt(1);
                        latLngBounds.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    obtain.writeInt(i);
                    if (gtVar != null) {
                        obtain.writeInt(1);
                        gtVar.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    if (hiVar != null) {
                        obtain.writeInt(1);
                        hiVar.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    obtain.writeStrongBinder(gzVar != null ? gzVar.asBinder() : null);
                    this.dU.transact(14, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.internal.gl
            public void a(String str, gh ghVar, gj gjVar) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.location.internal.IGoogleLocationManagerService");
                    obtain.writeString(str);
                    if (ghVar != null) {
                        obtain.writeInt(1);
                        ghVar.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    obtain.writeStrongBinder(gjVar != null ? gjVar.asBinder() : null);
                    this.dU.transact(28, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.internal.gl
            public void a(String str, gj gjVar) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.location.internal.IGoogleLocationManagerService");
                    obtain.writeString(str);
                    obtain.writeStrongBinder(gjVar != null ? gjVar.asBinder() : null);
                    this.dU.transact(29, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.internal.gl
            public void a(String str, hi hiVar, gz gzVar) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.location.internal.IGoogleLocationManagerService");
                    obtain.writeString(str);
                    if (hiVar != null) {
                        obtain.writeInt(1);
                        hiVar.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    obtain.writeStrongBinder(gzVar != null ? gzVar.asBinder() : null);
                    this.dU.transact(15, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.internal.gl
            public void a(String str, com.google.android.gms.location.a aVar, gj gjVar) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.location.internal.IGoogleLocationManagerService");
                    obtain.writeString(str);
                    if (aVar != null) {
                        obtain.writeInt(1);
                        aVar.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    obtain.writeStrongBinder(gjVar != null ? gjVar.asBinder() : null);
                    this.dU.transact(27, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.internal.gl
            public void a(String str, com.google.android.gms.location.f fVar, gj gjVar) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.location.internal.IGoogleLocationManagerService");
                    obtain.writeString(str);
                    if (fVar != null) {
                        obtain.writeInt(1);
                        fVar.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    obtain.writeStrongBinder(gjVar != null ? gjVar.asBinder() : null);
                    this.dU.transact(30, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.internal.gl
            public void a(String str, String str2, hi hiVar) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.location.internal.IGoogleLocationManagerService");
                    obtain.writeString(str);
                    obtain.writeString(str2);
                    if (hiVar != null) {
                        obtain.writeInt(1);
                        hiVar.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    this.dU.transact(25, obtain, null, 1);
                } finally {
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.internal.gl
            public void a(String str, boolean z, gj gjVar) throws RemoteException {
                int i = 0;
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.location.internal.IGoogleLocationManagerService");
                    obtain.writeString(str);
                    if (z) {
                        i = 1;
                    }
                    obtain.writeInt(i);
                    obtain.writeStrongBinder(gjVar != null ? gjVar.asBinder() : null);
                    this.dU.transact(32, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.internal.gl
            public void a(List<hd.a> list) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.location.internal.IGoogleLocationManagerService");
                    obtain.writeTypedList(list);
                    this.dU.transact(24, obtain, null, 1);
                } finally {
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.internal.gl
            public void a(List<go> list, PendingIntent pendingIntent, gk gkVar, String str) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.location.internal.IGoogleLocationManagerService");
                    obtain.writeTypedList(list);
                    if (pendingIntent != null) {
                        obtain.writeInt(1);
                        pendingIntent.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    obtain.writeStrongBinder(gkVar != null ? gkVar.asBinder() : null);
                    obtain.writeString(str);
                    this.dU.transact(1, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.internal.gl
            public void a(String[] strArr, gk gkVar, String str) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.location.internal.IGoogleLocationManagerService");
                    obtain.writeStringArray(strArr);
                    obtain.writeStrongBinder(gkVar != null ? gkVar.asBinder() : null);
                    obtain.writeString(str);
                    this.dU.transact(3, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.internal.gl
            public Location an(String str) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.location.internal.IGoogleLocationManagerService");
                    obtain.writeString(str);
                    this.dU.transact(21, obtain, obtain2, 0);
                    obtain2.readException();
                    return obtain2.readInt() != 0 ? (Location) Location.CREATOR.createFromParcel(obtain2) : null;
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.internal.gl
            public com.google.android.gms.location.d ao(String str) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.location.internal.IGoogleLocationManagerService");
                    obtain.writeString(str);
                    this.dU.transact(34, obtain, obtain2, 0);
                    obtain2.readException();
                    return obtain2.readInt() != 0 ? com.google.android.gms.location.d.CREATOR.createFromParcel(obtain2) : null;
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // android.os.IInterface
            public IBinder asBinder() {
                return this.dU;
            }

            @Override // com.google.android.gms.internal.gl
            public void b(String str, gj gjVar) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.location.internal.IGoogleLocationManagerService");
                    obtain.writeString(str);
                    obtain.writeStrongBinder(gjVar != null ? gjVar.asBinder() : null);
                    this.dU.transact(33, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.internal.gl
            public void b(String str, com.google.android.gms.location.f fVar, gj gjVar) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.location.internal.IGoogleLocationManagerService");
                    obtain.writeString(str);
                    if (fVar != null) {
                        obtain.writeInt(1);
                        fVar.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    obtain.writeStrongBinder(gjVar != null ? gjVar.asBinder() : null);
                    this.dU.transact(31, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.internal.gl
            public Location dH() throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.location.internal.IGoogleLocationManagerService");
                    this.dU.transact(7, obtain, obtain2, 0);
                    obtain2.readException();
                    return obtain2.readInt() != 0 ? (Location) Location.CREATOR.createFromParcel(obtain2) : null;
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.internal.gl
            public void removeActivityUpdates(PendingIntent callbackIntent) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.location.internal.IGoogleLocationManagerService");
                    if (callbackIntent != null) {
                        obtain.writeInt(1);
                        callbackIntent.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    this.dU.transact(6, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.internal.gl
            public void setMockLocation(Location location) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.location.internal.IGoogleLocationManagerService");
                    if (location != null) {
                        obtain.writeInt(1);
                        location.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    this.dU.transact(13, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.internal.gl
            public void setMockMode(boolean isMockMode) throws RemoteException {
                int i = 0;
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.location.internal.IGoogleLocationManagerService");
                    if (isMockMode) {
                        i = 1;
                    }
                    obtain.writeInt(i);
                    this.dU.transact(12, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }
        }

        public static gl L(IBinder iBinder) {
            if (iBinder == null) {
                return null;
            }
            IInterface queryLocalInterface = iBinder.queryLocalInterface("com.google.android.gms.location.internal.IGoogleLocationManagerService");
            return (queryLocalInterface == null || !(queryLocalInterface instanceof gl)) ? new C0043a(iBinder) : (gl) queryLocalInterface;
        }

        @Override // android.os.Binder
        public boolean onTransact(int code, Parcel data, Parcel reply, int flags) throws RemoteException {
            boolean z = false;
            com.google.android.gms.location.f fVar = null;
            PendingIntent pendingIntent = null;
            PendingIntent pendingIntent2 = null;
            PendingIntent pendingIntent3 = null;
            PendingIntent pendingIntent4 = null;
            LocationRequest locationRequest = null;
            PendingIntent pendingIntent5 = null;
            PendingIntent pendingIntent6 = null;
            Location location = null;
            hi hiVar = null;
            hi hiVar2 = null;
            hi hiVar3 = null;
            PendingIntent pendingIntent7 = null;
            PendingIntent pendingIntent8 = null;
            LocationRequest locationRequest2 = null;
            hi hiVar4 = null;
            Location location2 = null;
            com.google.android.gms.location.a aVar = null;
            gh ghVar = null;
            com.google.android.gms.location.f fVar2 = null;
            switch (code) {
                case 1:
                    data.enforceInterface("com.google.android.gms.location.internal.IGoogleLocationManagerService");
                    ArrayList createTypedArrayList = data.createTypedArrayList(go.CREATOR);
                    if (data.readInt() != 0) {
                        pendingIntent = (PendingIntent) PendingIntent.CREATOR.createFromParcel(data);
                    }
                    a(createTypedArrayList, pendingIntent, gk.a.K(data.readStrongBinder()), data.readString());
                    reply.writeNoException();
                    return true;
                case 2:
                    data.enforceInterface("com.google.android.gms.location.internal.IGoogleLocationManagerService");
                    if (data.readInt() != 0) {
                        pendingIntent2 = (PendingIntent) PendingIntent.CREATOR.createFromParcel(data);
                    }
                    a(pendingIntent2, gk.a.K(data.readStrongBinder()), data.readString());
                    reply.writeNoException();
                    return true;
                case 3:
                    data.enforceInterface("com.google.android.gms.location.internal.IGoogleLocationManagerService");
                    a(data.createStringArray(), gk.a.K(data.readStrongBinder()), data.readString());
                    reply.writeNoException();
                    return true;
                case 4:
                    data.enforceInterface("com.google.android.gms.location.internal.IGoogleLocationManagerService");
                    a(gk.a.K(data.readStrongBinder()), data.readString());
                    reply.writeNoException();
                    return true;
                case 5:
                    data.enforceInterface("com.google.android.gms.location.internal.IGoogleLocationManagerService");
                    long readLong = data.readLong();
                    if (data.readInt() != 0) {
                        z = true;
                    }
                    if (data.readInt() != 0) {
                        pendingIntent3 = (PendingIntent) PendingIntent.CREATOR.createFromParcel(data);
                    }
                    a(readLong, z, pendingIntent3);
                    reply.writeNoException();
                    return true;
                case 6:
                    data.enforceInterface("com.google.android.gms.location.internal.IGoogleLocationManagerService");
                    if (data.readInt() != 0) {
                        pendingIntent4 = (PendingIntent) PendingIntent.CREATOR.createFromParcel(data);
                    }
                    removeActivityUpdates(pendingIntent4);
                    reply.writeNoException();
                    return true;
                case 7:
                    data.enforceInterface("com.google.android.gms.location.internal.IGoogleLocationManagerService");
                    Location dH = dH();
                    reply.writeNoException();
                    if (dH == null) {
                        reply.writeInt(0);
                        return true;
                    }
                    reply.writeInt(1);
                    dH.writeToParcel(reply, 1);
                    return true;
                case 8:
                    data.enforceInterface("com.google.android.gms.location.internal.IGoogleLocationManagerService");
                    if (data.readInt() != 0) {
                        locationRequest = LocationRequest.CREATOR.mo364createFromParcel(data);
                    }
                    a(locationRequest, c.a.I(data.readStrongBinder()));
                    reply.writeNoException();
                    return true;
                case 9:
                    data.enforceInterface("com.google.android.gms.location.internal.IGoogleLocationManagerService");
                    LocationRequest mo364createFromParcel = data.readInt() != 0 ? LocationRequest.CREATOR.mo364createFromParcel(data) : null;
                    if (data.readInt() != 0) {
                        pendingIntent5 = (PendingIntent) PendingIntent.CREATOR.createFromParcel(data);
                    }
                    a(mo364createFromParcel, pendingIntent5);
                    reply.writeNoException();
                    return true;
                case 10:
                    data.enforceInterface("com.google.android.gms.location.internal.IGoogleLocationManagerService");
                    a(c.a.I(data.readStrongBinder()));
                    reply.writeNoException();
                    return true;
                case 11:
                    data.enforceInterface("com.google.android.gms.location.internal.IGoogleLocationManagerService");
                    if (data.readInt() != 0) {
                        pendingIntent6 = (PendingIntent) PendingIntent.CREATOR.createFromParcel(data);
                    }
                    a(pendingIntent6);
                    reply.writeNoException();
                    return true;
                case 12:
                    data.enforceInterface("com.google.android.gms.location.internal.IGoogleLocationManagerService");
                    if (data.readInt() != 0) {
                        z = true;
                    }
                    setMockMode(z);
                    reply.writeNoException();
                    return true;
                case 13:
                    data.enforceInterface("com.google.android.gms.location.internal.IGoogleLocationManagerService");
                    if (data.readInt() != 0) {
                        location = (Location) Location.CREATOR.createFromParcel(data);
                    }
                    setMockLocation(location);
                    reply.writeNoException();
                    return true;
                case 14:
                    data.enforceInterface("com.google.android.gms.location.internal.IGoogleLocationManagerService");
                    a(data.readInt() != 0 ? LatLngBounds.CREATOR.mo374createFromParcel(data) : null, data.readInt(), data.readInt() != 0 ? gt.CREATOR.createFromParcel(data) : null, data.readInt() != 0 ? hi.CREATOR.createFromParcel(data) : null, gz.a.N(data.readStrongBinder()));
                    reply.writeNoException();
                    return true;
                case 15:
                    data.enforceInterface("com.google.android.gms.location.internal.IGoogleLocationManagerService");
                    String readString = data.readString();
                    if (data.readInt() != 0) {
                        hiVar = hi.CREATOR.createFromParcel(data);
                    }
                    a(readString, hiVar, gz.a.N(data.readStrongBinder()));
                    reply.writeNoException();
                    return true;
                case 16:
                    data.enforceInterface("com.google.android.gms.location.internal.IGoogleLocationManagerService");
                    LatLng mo376createFromParcel = data.readInt() != 0 ? LatLng.CREATOR.mo376createFromParcel(data) : null;
                    gt createFromParcel = data.readInt() != 0 ? gt.CREATOR.createFromParcel(data) : null;
                    if (data.readInt() != 0) {
                        hiVar2 = hi.CREATOR.createFromParcel(data);
                    }
                    a(mo376createFromParcel, createFromParcel, hiVar2, gz.a.N(data.readStrongBinder()));
                    reply.writeNoException();
                    return true;
                case 17:
                    data.enforceInterface("com.google.android.gms.location.internal.IGoogleLocationManagerService");
                    gt createFromParcel2 = data.readInt() != 0 ? gt.CREATOR.createFromParcel(data) : null;
                    if (data.readInt() != 0) {
                        hiVar3 = hi.CREATOR.createFromParcel(data);
                    }
                    a(createFromParcel2, hiVar3, gz.a.N(data.readStrongBinder()));
                    reply.writeNoException();
                    return true;
                case 18:
                    data.enforceInterface("com.google.android.gms.location.internal.IGoogleLocationManagerService");
                    gv createFromParcel3 = data.readInt() != 0 ? gv.CREATOR.createFromParcel(data) : null;
                    hi createFromParcel4 = data.readInt() != 0 ? hi.CREATOR.createFromParcel(data) : null;
                    if (data.readInt() != 0) {
                        pendingIntent7 = (PendingIntent) PendingIntent.CREATOR.createFromParcel(data);
                    }
                    a(createFromParcel3, createFromParcel4, pendingIntent7);
                    reply.writeNoException();
                    return true;
                case 19:
                    data.enforceInterface("com.google.android.gms.location.internal.IGoogleLocationManagerService");
                    hi createFromParcel5 = data.readInt() != 0 ? hi.CREATOR.createFromParcel(data) : null;
                    if (data.readInt() != 0) {
                        pendingIntent8 = (PendingIntent) PendingIntent.CREATOR.createFromParcel(data);
                    }
                    a(createFromParcel5, pendingIntent8);
                    reply.writeNoException();
                    return true;
                case MMError.DISPLAY_AD_NOT_READY /* 20 */:
                    data.enforceInterface("com.google.android.gms.location.internal.IGoogleLocationManagerService");
                    if (data.readInt() != 0) {
                        locationRequest2 = LocationRequest.CREATOR.mo364createFromParcel(data);
                    }
                    a(locationRequest2, c.a.I(data.readStrongBinder()), data.readString());
                    reply.writeNoException();
                    return true;
                case MMError.DISPLAY_AD_EXPIRED /* 21 */:
                    data.enforceInterface("com.google.android.gms.location.internal.IGoogleLocationManagerService");
                    Location an = an(data.readString());
                    reply.writeNoException();
                    if (an == null) {
                        reply.writeInt(0);
                        return true;
                    }
                    reply.writeInt(1);
                    an.writeToParcel(reply, 1);
                    return true;
                case MMError.DISPLAY_AD_NOT_PERMITTED /* 24 */:
                    data.enforceInterface("com.google.android.gms.location.internal.IGoogleLocationManagerService");
                    a(data.createTypedArrayList(hd.a.CREATOR));
                    return true;
                case 25:
                    data.enforceInterface("com.google.android.gms.location.internal.IGoogleLocationManagerService");
                    String readString2 = data.readString();
                    String readString3 = data.readString();
                    if (data.readInt() != 0) {
                        hiVar4 = hi.CREATOR.createFromParcel(data);
                    }
                    a(readString2, readString3, hiVar4);
                    return true;
                case 26:
                    data.enforceInterface("com.google.android.gms.location.internal.IGoogleLocationManagerService");
                    if (data.readInt() != 0) {
                        location2 = (Location) Location.CREATOR.createFromParcel(data);
                    }
                    a(location2, data.readInt());
                    reply.writeNoException();
                    return true;
                case 27:
                    data.enforceInterface("com.google.android.gms.location.internal.IGoogleLocationManagerService");
                    String readString4 = data.readString();
                    if (data.readInt() != 0) {
                        aVar = com.google.android.gms.location.a.CREATOR.createFromParcel(data);
                    }
                    a(readString4, aVar, gj.a.J(data.readStrongBinder()));
                    reply.writeNoException();
                    return true;
                case 28:
                    data.enforceInterface("com.google.android.gms.location.internal.IGoogleLocationManagerService");
                    String readString5 = data.readString();
                    if (data.readInt() != 0) {
                        ghVar = gh.CREATOR.createFromParcel(data);
                    }
                    a(readString5, ghVar, gj.a.J(data.readStrongBinder()));
                    reply.writeNoException();
                    return true;
                case 29:
                    data.enforceInterface("com.google.android.gms.location.internal.IGoogleLocationManagerService");
                    a(data.readString(), gj.a.J(data.readStrongBinder()));
                    reply.writeNoException();
                    return true;
                case 30:
                    data.enforceInterface("com.google.android.gms.location.internal.IGoogleLocationManagerService");
                    String readString6 = data.readString();
                    if (data.readInt() != 0) {
                        fVar2 = com.google.android.gms.location.f.CREATOR.createFromParcel(data);
                    }
                    a(readString6, fVar2, gj.a.J(data.readStrongBinder()));
                    reply.writeNoException();
                    return true;
                case 31:
                    data.enforceInterface("com.google.android.gms.location.internal.IGoogleLocationManagerService");
                    String readString7 = data.readString();
                    if (data.readInt() != 0) {
                        fVar = com.google.android.gms.location.f.CREATOR.createFromParcel(data);
                    }
                    b(readString7, fVar, gj.a.J(data.readStrongBinder()));
                    reply.writeNoException();
                    return true;
                case 32:
                    data.enforceInterface("com.google.android.gms.location.internal.IGoogleLocationManagerService");
                    String readString8 = data.readString();
                    if (data.readInt() != 0) {
                        z = true;
                    }
                    a(readString8, z, gj.a.J(data.readStrongBinder()));
                    reply.writeNoException();
                    return true;
                case 33:
                    data.enforceInterface("com.google.android.gms.location.internal.IGoogleLocationManagerService");
                    b(data.readString(), gj.a.J(data.readStrongBinder()));
                    reply.writeNoException();
                    return true;
                case 34:
                    data.enforceInterface("com.google.android.gms.location.internal.IGoogleLocationManagerService");
                    com.google.android.gms.location.d ao = ao(data.readString());
                    reply.writeNoException();
                    if (ao == null) {
                        reply.writeInt(0);
                        return true;
                    }
                    reply.writeInt(1);
                    ao.writeToParcel(reply, 1);
                    return true;
                case 1598968902:
                    reply.writeString("com.google.android.gms.location.internal.IGoogleLocationManagerService");
                    return true;
                default:
                    return super.onTransact(code, data, reply, flags);
            }
        }
    }

    void a(long j, boolean z, PendingIntent pendingIntent) throws RemoteException;

    void a(PendingIntent pendingIntent) throws RemoteException;

    void a(PendingIntent pendingIntent, gk gkVar, String str) throws RemoteException;

    void a(Location location, int i) throws RemoteException;

    void a(gk gkVar, String str) throws RemoteException;

    void a(gt gtVar, hi hiVar, gz gzVar) throws RemoteException;

    void a(gv gvVar, hi hiVar, PendingIntent pendingIntent) throws RemoteException;

    void a(hi hiVar, PendingIntent pendingIntent) throws RemoteException;

    void a(LocationRequest locationRequest, PendingIntent pendingIntent) throws RemoteException;

    void a(LocationRequest locationRequest, com.google.android.gms.location.c cVar) throws RemoteException;

    void a(LocationRequest locationRequest, com.google.android.gms.location.c cVar, String str) throws RemoteException;

    void a(com.google.android.gms.location.c cVar) throws RemoteException;

    void a(LatLng latLng, gt gtVar, hi hiVar, gz gzVar) throws RemoteException;

    void a(LatLngBounds latLngBounds, int i, gt gtVar, hi hiVar, gz gzVar) throws RemoteException;

    void a(String str, gh ghVar, gj gjVar) throws RemoteException;

    void a(String str, gj gjVar) throws RemoteException;

    void a(String str, hi hiVar, gz gzVar) throws RemoteException;

    void a(String str, com.google.android.gms.location.a aVar, gj gjVar) throws RemoteException;

    void a(String str, com.google.android.gms.location.f fVar, gj gjVar) throws RemoteException;

    void a(String str, String str2, hi hiVar) throws RemoteException;

    void a(String str, boolean z, gj gjVar) throws RemoteException;

    void a(List<hd.a> list) throws RemoteException;

    void a(List<go> list, PendingIntent pendingIntent, gk gkVar, String str) throws RemoteException;

    void a(String[] strArr, gk gkVar, String str) throws RemoteException;

    Location an(String str) throws RemoteException;

    com.google.android.gms.location.d ao(String str) throws RemoteException;

    void b(String str, gj gjVar) throws RemoteException;

    void b(String str, com.google.android.gms.location.f fVar, gj gjVar) throws RemoteException;

    Location dH() throws RemoteException;

    void removeActivityUpdates(PendingIntent pendingIntent) throws RemoteException;

    void setMockLocation(Location location) throws RemoteException;

    void setMockMode(boolean z) throws RemoteException;
}
