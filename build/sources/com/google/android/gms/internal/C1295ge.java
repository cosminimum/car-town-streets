package com.google.android.gms.internal;

/* renamed from: com.google.android.gms.internal.ge */
public final class C1295ge {
    /* renamed from: aG */
    public static String m3416aG(int i) {
        switch (i) {
            case 0:
                return "DAILY";
            case 1:
                return "WEEKLY";
            case 2:
                return "ALL_TIME";
            default:
                throw new IllegalArgumentException("Unknown time span " + i);
        }
    }
}
