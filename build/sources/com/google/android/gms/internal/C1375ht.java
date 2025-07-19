package com.google.android.gms.internal;

import android.content.Context;
import android.os.IBinder;
import android.view.View;
import com.google.android.gms.common.GooglePlayServicesUtil;
import com.google.android.gms.dynamic.C0775c;
import com.google.android.gms.internal.C1359hp;
import com.google.android.gms.plus.PlusOneDummyView;

/* renamed from: com.google.android.gms.internal.ht */
public final class C1375ht {

    /* renamed from: Ci */
    private static Context f3222Ci;

    /* renamed from: DQ */
    private static C1359hp f3223DQ;

    /* renamed from: com.google.android.gms.internal.ht$a */
    public static class C1376a extends Exception {
        public C1376a(String str) {
            super(str);
        }
    }

    /* renamed from: a */
    public static View m3699a(Context context, int i, int i2, String str, int i3) {
        if (str != null) {
            return (View) C0775c.m1695b(m3701x(context).mo8258a(C0775c.m1696h(context), i, i2, str, i3));
        }
        try {
            throw new NullPointerException();
        } catch (Exception e) {
            return new PlusOneDummyView(context, i);
        }
    }

    /* renamed from: a */
    public static View m3700a(Context context, int i, int i2, String str, String str2) {
        if (str != null) {
            return (View) C0775c.m1695b(m3701x(context).mo8259a(C0775c.m1696h(context), i, i2, str, str2));
        }
        try {
            throw new NullPointerException();
        } catch (Exception e) {
            return new PlusOneDummyView(context, i);
        }
    }

    /* renamed from: x */
    private static C1359hp m3701x(Context context) throws C1376a {
        C1102eg.m2616f(context);
        if (f3223DQ == null) {
            if (f3222Ci == null) {
                f3222Ci = GooglePlayServicesUtil.getRemoteContext(context);
                if (f3222Ci == null) {
                    throw new C1376a("Could not get remote context.");
                }
            }
            try {
                f3223DQ = C1359hp.C1360a.m3637av((IBinder) f3222Ci.getClassLoader().loadClass("com.google.android.gms.plus.plusone.PlusOneButtonCreatorImpl").newInstance());
            } catch (ClassNotFoundException e) {
                throw new C1376a("Could not load creator class.");
            } catch (InstantiationException e2) {
                throw new C1376a("Could not instantiate creator.");
            } catch (IllegalAccessException e3) {
                throw new C1376a("Could not access creator.");
            }
        }
        return f3223DQ;
    }
}
