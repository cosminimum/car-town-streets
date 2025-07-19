package com.google.android.gms.internal;

import android.content.Context;
import android.text.TextUtils;
import java.math.BigInteger;
import java.util.Locale;

/* renamed from: com.google.android.gms.internal.cl */
public final class C0991cl {

    /* renamed from: hC */
    private static final Object f2396hC = new Object();

    /* renamed from: iw */
    private static String f2397iw;

    /* renamed from: as */
    public static String m2163as() {
        String str;
        synchronized (f2396hC) {
            str = f2397iw;
        }
        return str;
    }

    /* renamed from: b */
    public static String m2164b(Context context, String str, String str2) {
        String str3;
        synchronized (f2396hC) {
            if (f2397iw == null && !TextUtils.isEmpty(str)) {
                m2165c(context, str, str2);
            }
            str3 = f2397iw;
        }
        return str3;
    }

    /* renamed from: c */
    private static void m2165c(Context context, String str, String str2) {
        try {
            ClassLoader classLoader = context.createPackageContext(str2, 3).getClassLoader();
            Class<?> cls = Class.forName("com.google.ads.mediation.MediationAdapter", false, classLoader);
            BigInteger bigInteger = new BigInteger(new byte[1]);
            String[] split = str.split(",");
            BigInteger bigInteger2 = bigInteger;
            for (int i = 0; i < split.length; i++) {
                if (C0997co.m2179a(classLoader, cls, split[i])) {
                    bigInteger2 = bigInteger2.setBit(i);
                }
            }
            f2397iw = String.format(Locale.US, "%X", new Object[]{bigInteger2});
        } catch (Throwable th) {
            f2397iw = "err";
        }
    }
}
