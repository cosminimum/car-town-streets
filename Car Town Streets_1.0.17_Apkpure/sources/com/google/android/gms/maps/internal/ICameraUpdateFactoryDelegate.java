package com.google.android.gms.maps.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.gms.dynamic.b;
import com.google.android.gms.maps.model.CameraPosition;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.LatLngBounds;
/* loaded from: classes.dex */
public interface ICameraUpdateFactoryDelegate extends IInterface {

    /* loaded from: classes.dex */
    public static abstract class a extends Binder implements ICameraUpdateFactoryDelegate {

        /* renamed from: com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate$a$a  reason: collision with other inner class name */
        /* loaded from: classes.dex */
        private static class C0059a implements ICameraUpdateFactoryDelegate {
            private IBinder dU;

            C0059a(IBinder iBinder) {
                this.dU = iBinder;
            }

            @Override // android.os.IInterface
            public IBinder asBinder() {
                return this.dU;
            }

            @Override // com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate
            public com.google.android.gms.dynamic.b newCameraPosition(CameraPosition cameraPosition) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
                    if (cameraPosition != null) {
                        obtain.writeInt(1);
                        cameraPosition.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    this.dU.transact(7, obtain, obtain2, 0);
                    obtain2.readException();
                    return b.a.E(obtain2.readStrongBinder());
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate
            public com.google.android.gms.dynamic.b newLatLng(LatLng latLng) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
                    if (latLng != null) {
                        obtain.writeInt(1);
                        latLng.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    this.dU.transact(8, obtain, obtain2, 0);
                    obtain2.readException();
                    return b.a.E(obtain2.readStrongBinder());
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate
            public com.google.android.gms.dynamic.b newLatLngBounds(LatLngBounds bounds, int padding) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
                    if (bounds != null) {
                        obtain.writeInt(1);
                        bounds.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    obtain.writeInt(padding);
                    this.dU.transact(10, obtain, obtain2, 0);
                    obtain2.readException();
                    return b.a.E(obtain2.readStrongBinder());
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate
            public com.google.android.gms.dynamic.b newLatLngBoundsWithSize(LatLngBounds bounds, int width, int height, int padding) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
                    if (bounds != null) {
                        obtain.writeInt(1);
                        bounds.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    obtain.writeInt(width);
                    obtain.writeInt(height);
                    obtain.writeInt(padding);
                    this.dU.transact(11, obtain, obtain2, 0);
                    obtain2.readException();
                    return b.a.E(obtain2.readStrongBinder());
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate
            public com.google.android.gms.dynamic.b newLatLngZoom(LatLng latLng, float zoom) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
                    if (latLng != null) {
                        obtain.writeInt(1);
                        latLng.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    obtain.writeFloat(zoom);
                    this.dU.transact(9, obtain, obtain2, 0);
                    obtain2.readException();
                    return b.a.E(obtain2.readStrongBinder());
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate
            public com.google.android.gms.dynamic.b scrollBy(float xPixel, float yPixel) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
                    obtain.writeFloat(xPixel);
                    obtain.writeFloat(yPixel);
                    this.dU.transact(3, obtain, obtain2, 0);
                    obtain2.readException();
                    return b.a.E(obtain2.readStrongBinder());
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate
            public com.google.android.gms.dynamic.b zoomBy(float amount) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
                    obtain.writeFloat(amount);
                    this.dU.transact(5, obtain, obtain2, 0);
                    obtain2.readException();
                    return b.a.E(obtain2.readStrongBinder());
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate
            public com.google.android.gms.dynamic.b zoomByWithFocus(float amount, int screenFocusX, int screenFocusY) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
                    obtain.writeFloat(amount);
                    obtain.writeInt(screenFocusX);
                    obtain.writeInt(screenFocusY);
                    this.dU.transact(6, obtain, obtain2, 0);
                    obtain2.readException();
                    return b.a.E(obtain2.readStrongBinder());
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate
            public com.google.android.gms.dynamic.b zoomIn() throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
                    this.dU.transact(1, obtain, obtain2, 0);
                    obtain2.readException();
                    return b.a.E(obtain2.readStrongBinder());
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate
            public com.google.android.gms.dynamic.b zoomOut() throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
                    this.dU.transact(2, obtain, obtain2, 0);
                    obtain2.readException();
                    return b.a.E(obtain2.readStrongBinder());
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            @Override // com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate
            public com.google.android.gms.dynamic.b zoomTo(float zoom) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
                    obtain.writeFloat(zoom);
                    this.dU.transact(4, obtain, obtain2, 0);
                    obtain2.readException();
                    return b.a.E(obtain2.readStrongBinder());
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }
        }

        public static ICameraUpdateFactoryDelegate O(IBinder iBinder) {
            if (iBinder == null) {
                return null;
            }
            IInterface queryLocalInterface = iBinder.queryLocalInterface("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
            return (queryLocalInterface == null || !(queryLocalInterface instanceof ICameraUpdateFactoryDelegate)) ? new C0059a(iBinder) : (ICameraUpdateFactoryDelegate) queryLocalInterface;
        }

        @Override // android.os.Binder
        public boolean onTransact(int code, Parcel data, Parcel reply, int flags) throws RemoteException {
            IBinder iBinder = null;
            switch (code) {
                case 1:
                    data.enforceInterface("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
                    com.google.android.gms.dynamic.b zoomIn = zoomIn();
                    reply.writeNoException();
                    if (zoomIn != null) {
                        iBinder = zoomIn.asBinder();
                    }
                    reply.writeStrongBinder(iBinder);
                    return true;
                case 2:
                    data.enforceInterface("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
                    com.google.android.gms.dynamic.b zoomOut = zoomOut();
                    reply.writeNoException();
                    if (zoomOut != null) {
                        iBinder = zoomOut.asBinder();
                    }
                    reply.writeStrongBinder(iBinder);
                    return true;
                case 3:
                    data.enforceInterface("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
                    com.google.android.gms.dynamic.b scrollBy = scrollBy(data.readFloat(), data.readFloat());
                    reply.writeNoException();
                    if (scrollBy != null) {
                        iBinder = scrollBy.asBinder();
                    }
                    reply.writeStrongBinder(iBinder);
                    return true;
                case 4:
                    data.enforceInterface("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
                    com.google.android.gms.dynamic.b zoomTo = zoomTo(data.readFloat());
                    reply.writeNoException();
                    if (zoomTo != null) {
                        iBinder = zoomTo.asBinder();
                    }
                    reply.writeStrongBinder(iBinder);
                    return true;
                case 5:
                    data.enforceInterface("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
                    com.google.android.gms.dynamic.b zoomBy = zoomBy(data.readFloat());
                    reply.writeNoException();
                    if (zoomBy != null) {
                        iBinder = zoomBy.asBinder();
                    }
                    reply.writeStrongBinder(iBinder);
                    return true;
                case 6:
                    data.enforceInterface("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
                    com.google.android.gms.dynamic.b zoomByWithFocus = zoomByWithFocus(data.readFloat(), data.readInt(), data.readInt());
                    reply.writeNoException();
                    if (zoomByWithFocus != null) {
                        iBinder = zoomByWithFocus.asBinder();
                    }
                    reply.writeStrongBinder(iBinder);
                    return true;
                case 7:
                    data.enforceInterface("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
                    com.google.android.gms.dynamic.b newCameraPosition = newCameraPosition(data.readInt() != 0 ? CameraPosition.CREATOR.mo368createFromParcel(data) : null);
                    reply.writeNoException();
                    if (newCameraPosition != null) {
                        iBinder = newCameraPosition.asBinder();
                    }
                    reply.writeStrongBinder(iBinder);
                    return true;
                case 8:
                    data.enforceInterface("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
                    com.google.android.gms.dynamic.b newLatLng = newLatLng(data.readInt() != 0 ? LatLng.CREATOR.mo376createFromParcel(data) : null);
                    reply.writeNoException();
                    if (newLatLng != null) {
                        iBinder = newLatLng.asBinder();
                    }
                    reply.writeStrongBinder(iBinder);
                    return true;
                case 9:
                    data.enforceInterface("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
                    com.google.android.gms.dynamic.b newLatLngZoom = newLatLngZoom(data.readInt() != 0 ? LatLng.CREATOR.mo376createFromParcel(data) : null, data.readFloat());
                    reply.writeNoException();
                    if (newLatLngZoom != null) {
                        iBinder = newLatLngZoom.asBinder();
                    }
                    reply.writeStrongBinder(iBinder);
                    return true;
                case 10:
                    data.enforceInterface("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
                    com.google.android.gms.dynamic.b newLatLngBounds = newLatLngBounds(data.readInt() != 0 ? LatLngBounds.CREATOR.mo374createFromParcel(data) : null, data.readInt());
                    reply.writeNoException();
                    if (newLatLngBounds != null) {
                        iBinder = newLatLngBounds.asBinder();
                    }
                    reply.writeStrongBinder(iBinder);
                    return true;
                case 11:
                    data.enforceInterface("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
                    com.google.android.gms.dynamic.b newLatLngBoundsWithSize = newLatLngBoundsWithSize(data.readInt() != 0 ? LatLngBounds.CREATOR.mo374createFromParcel(data) : null, data.readInt(), data.readInt(), data.readInt());
                    reply.writeNoException();
                    if (newLatLngBoundsWithSize != null) {
                        iBinder = newLatLngBoundsWithSize.asBinder();
                    }
                    reply.writeStrongBinder(iBinder);
                    return true;
                case 1598968902:
                    reply.writeString("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
                    return true;
                default:
                    return super.onTransact(code, data, reply, flags);
            }
        }
    }

    com.google.android.gms.dynamic.b newCameraPosition(CameraPosition cameraPosition) throws RemoteException;

    com.google.android.gms.dynamic.b newLatLng(LatLng latLng) throws RemoteException;

    com.google.android.gms.dynamic.b newLatLngBounds(LatLngBounds latLngBounds, int i) throws RemoteException;

    com.google.android.gms.dynamic.b newLatLngBoundsWithSize(LatLngBounds latLngBounds, int i, int i2, int i3) throws RemoteException;

    com.google.android.gms.dynamic.b newLatLngZoom(LatLng latLng, float f) throws RemoteException;

    com.google.android.gms.dynamic.b scrollBy(float f, float f2) throws RemoteException;

    com.google.android.gms.dynamic.b zoomBy(float f) throws RemoteException;

    com.google.android.gms.dynamic.b zoomByWithFocus(float f, int i, int i2) throws RemoteException;

    com.google.android.gms.dynamic.b zoomIn() throws RemoteException;

    com.google.android.gms.dynamic.b zoomOut() throws RemoteException;

    com.google.android.gms.dynamic.b zoomTo(float f) throws RemoteException;
}
