package com.google.android.gms.maps.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.gms.maps.model.CameraPosition;

/* renamed from: com.google.android.gms.maps.internal.e */
public interface C1523e extends IInterface {

    /* renamed from: com.google.android.gms.maps.internal.e$a */
    public static abstract class C1524a extends Binder implements C1523e {

        /* renamed from: com.google.android.gms.maps.internal.e$a$a */
        private static class C1525a implements C1523e {

            /* renamed from: dU */
            private IBinder f3600dU;

            C1525a(IBinder iBinder) {
                this.f3600dU = iBinder;
            }

            public IBinder asBinder() {
                return this.f3600dU;
            }

            public void onCameraChange(CameraPosition position) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.google.android.gms.maps.internal.IOnCameraChangeListener");
                    if (position != null) {
                        obtain.writeInt(1);
                        position.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    this.f3600dU.transact(1, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }
        }

        public C1524a() {
            attachInterface(this, "com.google.android.gms.maps.internal.IOnCameraChangeListener");
        }

        /* renamed from: W */
        public static C1523e m4170W(IBinder iBinder) {
            if (iBinder == null) {
                return null;
            }
            IInterface queryLocalInterface = iBinder.queryLocalInterface("com.google.android.gms.maps.internal.IOnCameraChangeListener");
            return (queryLocalInterface == null || !(queryLocalInterface instanceof C1523e)) ? new C1525a(iBinder) : (C1523e) queryLocalInterface;
        }

        public IBinder asBinder() {
            return this;
        }

        public boolean onTransact(int code, Parcel data, Parcel reply, int flags) throws RemoteException {
            switch (code) {
                case 1:
                    data.enforceInterface("com.google.android.gms.maps.internal.IOnCameraChangeListener");
                    onCameraChange(data.readInt() != 0 ? CameraPosition.CREATOR.createFromParcel(data) : null);
                    reply.writeNoException();
                    return true;
                case 1598968902:
                    reply.writeString("com.google.android.gms.maps.internal.IOnCameraChangeListener");
                    return true;
                default:
                    return super.onTransact(code, data, reply, flags);
            }
        }
    }

    void onCameraChange(CameraPosition cameraPosition) throws RemoteException;
}
