package com.google.android.gms.maps.model;

import android.graphics.Bitmap;
import android.os.RemoteException;
import com.google.android.gms.internal.C1102eg;
import com.google.android.gms.maps.model.internal.C1572a;

public final class BitmapDescriptorFactory {

    /* renamed from: Cl */
    private static C1572a f3615Cl = null;
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

    /* renamed from: a */
    public static void m4207a(C1572a aVar) {
        if (f3615Cl == null) {
            f3615Cl = (C1572a) C1102eg.m2616f(aVar);
        }
    }

    public static BitmapDescriptor defaultMarker() {
        try {
            return new BitmapDescriptor(m4208eE().mo9571eJ());
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public static BitmapDescriptor defaultMarker(float hue) {
        try {
            return new BitmapDescriptor(m4208eE().mo9570c(hue));
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    /* renamed from: eE */
    private static C1572a m4208eE() {
        return (C1572a) C1102eg.m2614b(f3615Cl, (Object) "IBitmapDescriptorFactory is not initialized");
    }

    public static BitmapDescriptor fromAsset(String assetName) {
        try {
            return new BitmapDescriptor(m4208eE().mo9566at(assetName));
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public static BitmapDescriptor fromBitmap(Bitmap image) {
        try {
            return new BitmapDescriptor(m4208eE().mo9565a(image));
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public static BitmapDescriptor fromFile(String fileName) {
        try {
            return new BitmapDescriptor(m4208eE().mo9567au(fileName));
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public static BitmapDescriptor fromPath(String absolutePath) {
        try {
            return new BitmapDescriptor(m4208eE().mo9568av(absolutePath));
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public static BitmapDescriptor fromResource(int resourceId) {
        try {
            return new BitmapDescriptor(m4208eE().mo9569bh(resourceId));
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }
}
