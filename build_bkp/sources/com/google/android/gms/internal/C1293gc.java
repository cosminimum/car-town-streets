package com.google.android.gms.internal;

/* renamed from: com.google.android.gms.internal.gc */
public final class C1293gc {
    /* renamed from: aG */
    public static String m3415aG(int i) {
        switch (i) {
            case 0:
                return "PUBLIC";
            case 1:
                return "SOCIAL";
            default:
                throw new IllegalArgumentException("Unknown leaderboard collection: " + i);
        }
    }
}
