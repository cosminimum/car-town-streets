package com.google.android.gms.maps.model.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.gms.dynamic.b;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.LatLngBounds;
import com.millennialmedia.android.MMError;
/* loaded from: classes.dex */
public interface c extends IInterface {

    /* loaded from: classes.dex */
    public static abstract class a extends Binder implements c {

        /* JADX INFO: Access modifiers changed from: private */
        /* renamed from: com.google.android.gms.maps.model.internal.c$a$a  reason: collision with other inner class name */
        /* loaded from: classes.dex */
        public static class C0084a implements c {
            private IBinder dU;

            C0084a(IBinder iBinder) {
                this.dU = iBinder;
            }

            @Override // com.google.android.gms.maps.model.internal.c
            public void a(float f, float f2) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.maps.model.internal.IGroundOverlayDelegate");
                    obtain.writeFloat(f);
                    obtain.writeFloat(f2);
                    this.dU.transact(6, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.maps.model.internal.c
            public boolean a(c cVar) throws RemoteException {
                boolean z = false;
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.maps.model.internal.IGroundOverlayDelegate");
                    obtain.writeStrongBinder(cVar != null ? cVar.asBinder() : null);
                    this.dU.transact(19, obtain, obtain2, 0);
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

            @Override // android.os.IInterface
            public IBinder asBinder() {
                return this.dU;
            }

            @Override // com.google.android.gms.maps.model.internal.c
            public float getBearing() throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.maps.model.internal.IGroundOverlayDelegate");
                    this.dU.transact(12, obtain, obtain2, 0);
                    obtain2.readException();
                    return obtain2.readFloat();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.maps.model.internal.c
            public LatLngBounds getBounds() throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.maps.model.internal.IGroundOverlayDelegate");
                    this.dU.transact(10, obtain, obtain2, 0);
                    obtain2.readException();
                    return obtain2.readInt() != 0 ? LatLngBounds.CREATOR.mo374createFromParcel(obtain2) : null;
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.maps.model.internal.c
            public float getHeight() throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.maps.model.internal.IGroundOverlayDelegate");
                    this.dU.transact(8, obtain, obtain2, 0);
                    obtain2.readException();
                    return obtain2.readFloat();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.maps.model.internal.c
            public String getId() throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.maps.model.internal.IGroundOverlayDelegate");
                    this.dU.transact(2, obtain, obtain2, 0);
                    obtain2.readException();
                    return obtain2.readString();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.maps.model.internal.c
            public LatLng getPosition() throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.maps.model.internal.IGroundOverlayDelegate");
                    this.dU.transact(4, obtain, obtain2, 0);
                    obtain2.readException();
                    return obtain2.readInt() != 0 ? LatLng.CREATOR.mo376createFromParcel(obtain2) : null;
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.maps.model.internal.c
            public float getTransparency() throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.maps.model.internal.IGroundOverlayDelegate");
                    this.dU.transact(18, obtain, obtain2, 0);
                    obtain2.readException();
                    return obtain2.readFloat();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.maps.model.internal.c
            public float getWidth() throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.maps.model.internal.IGroundOverlayDelegate");
                    this.dU.transact(7, obtain, obtain2, 0);
                    obtain2.readException();
                    return obtain2.readFloat();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.maps.model.internal.c
            public float getZIndex() throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.maps.model.internal.IGroundOverlayDelegate");
                    this.dU.transact(14, obtain, obtain2, 0);
                    obtain2.readException();
                    return obtain2.readFloat();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.maps.model.internal.c
            public void h(com.google.android.gms.dynamic.b bVar) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.maps.model.internal.IGroundOverlayDelegate");
                    obtain.writeStrongBinder(bVar != null ? bVar.asBinder() : null);
                    this.dU.transact(21, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.maps.model.internal.c
            public int hashCodeRemote() throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.maps.model.internal.IGroundOverlayDelegate");
                    this.dU.transact(20, obtain, obtain2, 0);
                    obtain2.readException();
                    return obtain2.readInt();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.maps.model.internal.c
            public boolean isVisible() throws RemoteException {
                boolean z = false;
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.maps.model.internal.IGroundOverlayDelegate");
                    this.dU.transact(16, obtain, obtain2, 0);
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

            @Override // com.google.android.gms.maps.model.internal.c
            public void remove() throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.maps.model.internal.IGroundOverlayDelegate");
                    this.dU.transact(1, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.maps.model.internal.c
            public void setBearing(float bearing) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.maps.model.internal.IGroundOverlayDelegate");
                    obtain.writeFloat(bearing);
                    this.dU.transact(11, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.maps.model.internal.c
            public void setDimensions(float width) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.maps.model.internal.IGroundOverlayDelegate");
                    obtain.writeFloat(width);
                    this.dU.transact(5, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.maps.model.internal.c
            public void setPosition(LatLng latlng) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.maps.model.internal.IGroundOverlayDelegate");
                    if (latlng != null) {
                        obtain.writeInt(1);
                        latlng.writeToParcel(obtain, 0);
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

            @Override // com.google.android.gms.maps.model.internal.c
            public void setPositionFromBounds(LatLngBounds bounds) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.maps.model.internal.IGroundOverlayDelegate");
                    if (bounds != null) {
                        obtain.writeInt(1);
                        bounds.writeToParcel(obtain, 0);
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

            @Override // com.google.android.gms.maps.model.internal.c
            public void setTransparency(float transparency) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.maps.model.internal.IGroundOverlayDelegate");
                    obtain.writeFloat(transparency);
                    this.dU.transact(17, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.maps.model.internal.c
            public void setVisible(boolean visible) throws RemoteException {
                int i = 0;
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.maps.model.internal.IGroundOverlayDelegate");
                    if (visible) {
                        i = 1;
                    }
                    obtain.writeInt(i);
                    this.dU.transact(15, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.maps.model.internal.c
            public void setZIndex(float zIndex) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.maps.model.internal.IGroundOverlayDelegate");
                    obtain.writeFloat(zIndex);
                    this.dU.transact(13, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }
        }

        public static c al(IBinder iBinder) {
            if (iBinder == null) {
                return null;
            }
            IInterface queryLocalInterface = iBinder.queryLocalInterface("com.google.android.gms.maps.model.internal.IGroundOverlayDelegate");
            return (queryLocalInterface == null || !(queryLocalInterface instanceof c)) ? new C0084a(iBinder) : (c) queryLocalInterface;
        }

        @Override // android.os.Binder
        public boolean onTransact(int code, Parcel data, Parcel reply, int flags) throws RemoteException {
            LatLngBounds latLngBounds = null;
            LatLng latLng = null;
            int i = 0;
            switch (code) {
                case 1:
                    data.enforceInterface("com.google.android.gms.maps.model.internal.IGroundOverlayDelegate");
                    remove();
                    reply.writeNoException();
                    return true;
                case 2:
                    data.enforceInterface("com.google.android.gms.maps.model.internal.IGroundOverlayDelegate");
                    String id = getId();
                    reply.writeNoException();
                    reply.writeString(id);
                    return true;
                case 3:
                    data.enforceInterface("com.google.android.gms.maps.model.internal.IGroundOverlayDelegate");
                    if (data.readInt() != 0) {
                        latLng = LatLng.CREATOR.mo376createFromParcel(data);
                    }
                    setPosition(latLng);
                    reply.writeNoException();
                    return true;
                case 4:
                    data.enforceInterface("com.google.android.gms.maps.model.internal.IGroundOverlayDelegate");
                    LatLng position = getPosition();
                    reply.writeNoException();
                    if (position == null) {
                        reply.writeInt(0);
                        return true;
                    }
                    reply.writeInt(1);
                    position.writeToParcel(reply, 1);
                    return true;
                case 5:
                    data.enforceInterface("com.google.android.gms.maps.model.internal.IGroundOverlayDelegate");
                    setDimensions(data.readFloat());
                    reply.writeNoException();
                    return true;
                case 6:
                    data.enforceInterface("com.google.android.gms.maps.model.internal.IGroundOverlayDelegate");
                    a(data.readFloat(), data.readFloat());
                    reply.writeNoException();
                    return true;
                case 7:
                    data.enforceInterface("com.google.android.gms.maps.model.internal.IGroundOverlayDelegate");
                    float width = getWidth();
                    reply.writeNoException();
                    reply.writeFloat(width);
                    return true;
                case 8:
                    data.enforceInterface("com.google.android.gms.maps.model.internal.IGroundOverlayDelegate");
                    float height = getHeight();
                    reply.writeNoException();
                    reply.writeFloat(height);
                    return true;
                case 9:
                    data.enforceInterface("com.google.android.gms.maps.model.internal.IGroundOverlayDelegate");
                    if (data.readInt() != 0) {
                        latLngBounds = LatLngBounds.CREATOR.mo374createFromParcel(data);
                    }
                    setPositionFromBounds(latLngBounds);
                    reply.writeNoException();
                    return true;
                case 10:
                    data.enforceInterface("com.google.android.gms.maps.model.internal.IGroundOverlayDelegate");
                    LatLngBounds bounds = getBounds();
                    reply.writeNoException();
                    if (bounds == null) {
                        reply.writeInt(0);
                        return true;
                    }
                    reply.writeInt(1);
                    bounds.writeToParcel(reply, 1);
                    return true;
                case 11:
                    data.enforceInterface("com.google.android.gms.maps.model.internal.IGroundOverlayDelegate");
                    setBearing(data.readFloat());
                    reply.writeNoException();
                    return true;
                case 12:
                    data.enforceInterface("com.google.android.gms.maps.model.internal.IGroundOverlayDelegate");
                    float bearing = getBearing();
                    reply.writeNoException();
                    reply.writeFloat(bearing);
                    return true;
                case 13:
                    data.enforceInterface("com.google.android.gms.maps.model.internal.IGroundOverlayDelegate");
                    setZIndex(data.readFloat());
                    reply.writeNoException();
                    return true;
                case 14:
                    data.enforceInterface("com.google.android.gms.maps.model.internal.IGroundOverlayDelegate");
                    float zIndex = getZIndex();
                    reply.writeNoException();
                    reply.writeFloat(zIndex);
                    return true;
                case 15:
                    data.enforceInterface("com.google.android.gms.maps.model.internal.IGroundOverlayDelegate");
                    setVisible(data.readInt() != 0);
                    reply.writeNoException();
                    return true;
                case 16:
                    data.enforceInterface("com.google.android.gms.maps.model.internal.IGroundOverlayDelegate");
                    boolean isVisible = isVisible();
                    reply.writeNoException();
                    if (isVisible) {
                        i = 1;
                    }
                    reply.writeInt(i);
                    return true;
                case 17:
                    data.enforceInterface("com.google.android.gms.maps.model.internal.IGroundOverlayDelegate");
                    setTransparency(data.readFloat());
                    reply.writeNoException();
                    return true;
                case 18:
                    data.enforceInterface("com.google.android.gms.maps.model.internal.IGroundOverlayDelegate");
                    float transparency = getTransparency();
                    reply.writeNoException();
                    reply.writeFloat(transparency);
                    return true;
                case 19:
                    data.enforceInterface("com.google.android.gms.maps.model.internal.IGroundOverlayDelegate");
                    boolean a = a(al(data.readStrongBinder()));
                    reply.writeNoException();
                    if (a) {
                        i = 1;
                    }
                    reply.writeInt(i);
                    return true;
                case MMError.DISPLAY_AD_NOT_READY /* 20 */:
                    data.enforceInterface("com.google.android.gms.maps.model.internal.IGroundOverlayDelegate");
                    int hashCodeRemote = hashCodeRemote();
                    reply.writeNoException();
                    reply.writeInt(hashCodeRemote);
                    return true;
                case MMError.DISPLAY_AD_EXPIRED /* 21 */:
                    data.enforceInterface("com.google.android.gms.maps.model.internal.IGroundOverlayDelegate");
                    h(b.a.E(data.readStrongBinder()));
                    reply.writeNoException();
                    return true;
                case 1598968902:
                    reply.writeString("com.google.android.gms.maps.model.internal.IGroundOverlayDelegate");
                    return true;
                default:
                    return super.onTransact(code, data, reply, flags);
            }
        }
    }

    void a(float f, float f2) throws RemoteException;

    boolean a(c cVar) throws RemoteException;

    float getBearing() throws RemoteException;

    LatLngBounds getBounds() throws RemoteException;

    float getHeight() throws RemoteException;

    String getId() throws RemoteException;

    LatLng getPosition() throws RemoteException;

    float getTransparency() throws RemoteException;

    float getWidth() throws RemoteException;

    float getZIndex() throws RemoteException;

    void h(com.google.android.gms.dynamic.b bVar) throws RemoteException;

    int hashCodeRemote() throws RemoteException;

    boolean isVisible() throws RemoteException;

    void remove() throws RemoteException;

    void setBearing(float f) throws RemoteException;

    void setDimensions(float f) throws RemoteException;

    void setPosition(LatLng latLng) throws RemoteException;

    void setPositionFromBounds(LatLngBounds latLngBounds) throws RemoteException;

    void setTransparency(float f) throws RemoteException;

    void setVisible(boolean z) throws RemoteException;

    void setZIndex(float f) throws RemoteException;
}
