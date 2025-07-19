package com.google.android.gms.maps.internal;

import android.content.Context;
import android.os.Build;
import android.os.IBinder;
import android.os.RemoteException;
import android.util.Log;
import com.google.android.gms.common.GooglePlayServicesNotAvailableException;
import com.google.android.gms.common.GooglePlayServicesUtil;
import com.google.android.gms.dynamic.C0775c;
import com.google.android.gms.internal.C1102eg;
import com.google.android.gms.maps.internal.C1517c;
import com.google.android.gms.maps.model.RuntimeRemoteException;

/* renamed from: com.google.android.gms.maps.internal.q */
public class C1557q {

    /* renamed from: Ci */
    private static Context f3611Ci;

    /* renamed from: Cj */
    private static C1517c f3612Cj;

    /* renamed from: a */
    private static <T> T m4198a(ClassLoader classLoader, String str) {
        try {
            return m4199c(((ClassLoader) C1102eg.m2616f(classLoader)).loadClass(str));
        } catch (ClassNotFoundException e) {
            throw new IllegalStateException("Unable to find dynamic class " + str);
        }
    }

    /* renamed from: c */
    private static <T> T m4199c(Class<?> cls) {
        try {
            return cls.newInstance();
        } catch (InstantiationException e) {
            throw new IllegalStateException("Unable to instantiate the dynamic class " + cls.getName());
        } catch (IllegalAccessException e2) {
            throw new IllegalStateException("Unable to call the default constructor of " + cls.getName());
        }
    }

    /* renamed from: eB */
    private static boolean m4200eB() {
        return false;
    }

    /* renamed from: eC */
    private static Class<?> m4201eC() {
        try {
            return Build.VERSION.SDK_INT < 15 ? Class.forName("com.google.android.gms.maps.internal.CreatorImplGmm6") : Class.forName("com.google.android.gms.maps.internal.CreatorImpl");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    private static Context getRemoteContext(Context context) {
        if (f3611Ci == null) {
            if (m4200eB()) {
                f3611Ci = context;
            } else {
                f3611Ci = GooglePlayServicesUtil.getRemoteContext(context);
            }
        }
        return f3611Ci;
    }

    /* renamed from: u */
    public static C1517c m4202u(Context context) throws GooglePlayServicesNotAvailableException {
        C1102eg.m2616f(context);
        if (f3612Cj != null) {
            return f3612Cj;
        }
        m4203v(context);
        f3612Cj = m4204w(context);
        try {
            f3612Cj.mo9209a(C0775c.m1696h(getRemoteContext(context).getResources()), (int) GooglePlayServicesUtil.GOOGLE_PLAY_SERVICES_VERSION_CODE);
            return f3612Cj;
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    /* renamed from: v */
    private static void m4203v(Context context) throws GooglePlayServicesNotAvailableException {
        int isGooglePlayServicesAvailable = GooglePlayServicesUtil.isGooglePlayServicesAvailable(context);
        switch (isGooglePlayServicesAvailable) {
            case 0:
                return;
            default:
                throw new GooglePlayServicesNotAvailableException(isGooglePlayServicesAvailable);
        }
    }

    /* renamed from: w */
    private static C1517c m4204w(Context context) {
        if (!m4200eB()) {
            return C1517c.C1518a.m4158Q((IBinder) m4198a(getRemoteContext(context).getClassLoader(), "com.google.android.gms.maps.internal.CreatorImpl"));
        }
        Log.i(C1557q.class.getSimpleName(), "Making Creator statically");
        return (C1517c) m4199c(m4201eC());
    }
}
