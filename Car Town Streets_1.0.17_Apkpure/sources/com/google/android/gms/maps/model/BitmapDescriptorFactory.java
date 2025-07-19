package com.google.android.gms.maps.model;

import android.graphics.Bitmap;
import android.os.RemoteException;
import com.google.android.gms.internal.eg;
/* loaded from: classes.dex */
public final class BitmapDescriptorFactory {
    private static com.google.android.gms.maps.model.internal.a Cl = null;
    public static final float HUE_AZURE = 210.0f;
    public static final float HUE_BLUE = 240.0f;
    public static final float HUE_CYAN = 180.0f;
    public static final float HUE_GREEN = 120.0f;
    public static final float HUE_MAGENTA = 300.0f;
    public static final float HUE_ORANGE = 30.0f;
    public static final float HUE_RED = 0.0f;
    public static final float HUE_ROSE = 330.0f;
    public static final float HUE_VIOLET = 270.0f;
    public static final float HUE_YELLOW = 60.0f;

    private BitmapDescriptorFactory() {
    }

    public static void a(com.google.android.gms.maps.model.internal.a aVar) {
        if (Cl != null) {
            return;
        }
        Cl = (com.google.android.gms.maps.model.internal.a) eg.f(aVar);
    }

    public static BitmapDescriptor defaultMarker() {
        try {
            return new BitmapDescriptor(eE().eJ());
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public static BitmapDescriptor defaultMarker(float hue) {
        try {
            return new BitmapDescriptor(eE().c(hue));
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    private static com.google.android.gms.maps.model.internal.a eE() {
        return (com.google.android.gms.maps.model.internal.a) eg.b(Cl, "IBitmapDescriptorFactory is not initialized");
    }

    public static BitmapDescriptor fromAsset(String assetName) {
        try {
            return new BitmapDescriptor(eE().at(assetName));
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public static BitmapDescriptor fromBitmap(Bitmap image) {
        try {
            return new BitmapDescriptor(eE().a(image));
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public static BitmapDescriptor fromFile(String fileName) {
        try {
            return new BitmapDescriptor(eE().au(fileName));
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public static BitmapDescriptor fromPath(String absolutePath) {
        try {
            return new BitmapDescriptor(eE().av(absolutePath));
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public static BitmapDescriptor fromResource(int resourceId) {
        try {
            return new BitmapDescriptor(eE().bh(resourceId));
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }
}
