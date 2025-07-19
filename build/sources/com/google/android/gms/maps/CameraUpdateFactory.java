package com.google.android.gms.maps;

import android.graphics.Point;
import android.os.RemoteException;
import com.google.android.gms.internal.C1102eg;
import com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate;
import com.google.android.gms.maps.model.CameraPosition;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.LatLngBounds;
import com.google.android.gms.maps.model.RuntimeRemoteException;

public final class CameraUpdateFactory {

    /* renamed from: Bq */
    private static ICameraUpdateFactoryDelegate f3525Bq;

    private CameraUpdateFactory() {
    }

    /* renamed from: a */
    static void m4107a(ICameraUpdateFactoryDelegate iCameraUpdateFactoryDelegate) {
        if (f3525Bq == null) {
            f3525Bq = (ICameraUpdateFactoryDelegate) C1102eg.m2616f(iCameraUpdateFactoryDelegate);
        }
    }

    /* renamed from: em */
    private static ICameraUpdateFactoryDelegate m4108em() {
        return (ICameraUpdateFactoryDelegate) C1102eg.m2614b(f3525Bq, (Object) "CameraUpdateFactory is not initialized");
    }

    public static CameraUpdate newCameraPosition(CameraPosition cameraPosition) {
        try {
            return new CameraUpdate(m4108em().newCameraPosition(cameraPosition));
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public static CameraUpdate newLatLng(LatLng latLng) {
        try {
            return new CameraUpdate(m4108em().newLatLng(latLng));
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public static CameraUpdate newLatLngBounds(LatLngBounds bounds, int padding) {
        try {
            return new CameraUpdate(m4108em().newLatLngBounds(bounds, padding));
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public static CameraUpdate newLatLngBounds(LatLngBounds bounds, int width, int height, int padding) {
        try {
            return new CameraUpdate(m4108em().newLatLngBoundsWithSize(bounds, width, height, padding));
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public static CameraUpdate newLatLngZoom(LatLng latLng, float zoom) {
        try {
            return new CameraUpdate(m4108em().newLatLngZoom(latLng, zoom));
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public static CameraUpdate scrollBy(float xPixel, float yPixel) {
        try {
            return new CameraUpdate(m4108em().scrollBy(xPixel, yPixel));
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public static CameraUpdate zoomBy(float amount) {
        try {
            return new CameraUpdate(m4108em().zoomBy(amount));
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public static CameraUpdate zoomBy(float amount, Point focus) {
        try {
            return new CameraUpdate(m4108em().zoomByWithFocus(amount, focus.x, focus.y));
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public static CameraUpdate zoomIn() {
        try {
            return new CameraUpdate(m4108em().zoomIn());
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public static CameraUpdate zoomOut() {
        try {
            return new CameraUpdate(m4108em().zoomOut());
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public static CameraUpdate zoomTo(float zoom) {
        try {
            return new CameraUpdate(m4108em().zoomTo(zoom));
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }
}
