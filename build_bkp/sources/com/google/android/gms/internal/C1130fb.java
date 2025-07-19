package com.google.android.gms.internal;

import android.util.Base64;

/* renamed from: com.google.android.gms.internal.fb */
public final class C1130fb {
    /* renamed from: b */
    public static String m2757b(byte[] bArr) {
        if (bArr == null) {
            return null;
        }
        return Base64.encodeToString(bArr, 0);
    }

    /* renamed from: c */
    public static String m2758c(byte[] bArr) {
        if (bArr == null) {
            return null;
        }
        return Base64.encodeToString(bArr, 10);
    }
}
