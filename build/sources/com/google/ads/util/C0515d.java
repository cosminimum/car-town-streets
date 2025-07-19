package com.google.ads.util;

import android.os.Build;

/* renamed from: com.google.ads.util.d */
class C0515d {

    /* renamed from: d */
    static final C0515d f1077d = new C0515d();

    /* renamed from: e */
    static final C0515d f1078e = new C0515d("unknown", "generic", "generic");

    /* renamed from: a */
    public final String f1079a;

    /* renamed from: b */
    public final String f1080b;

    /* renamed from: c */
    public final String f1081c;

    C0515d() {
        this.f1079a = Build.BOARD;
        this.f1080b = Build.DEVICE;
        this.f1081c = Build.BRAND;
    }

    C0515d(String str, String str2, String str3) {
        this.f1079a = str;
        this.f1080b = str2;
        this.f1081c = str3;
    }

    public boolean equals(Object o) {
        if (!(o instanceof C0515d)) {
            return false;
        }
        C0515d dVar = (C0515d) o;
        if (!m1046a(this.f1079a, dVar.f1079a) || !m1046a(this.f1080b, dVar.f1080b) || !m1046a(this.f1081c, dVar.f1081c)) {
            return false;
        }
        return true;
    }

    /* renamed from: a */
    private static boolean m1046a(String str, String str2) {
        if (str != null) {
            return str.equals(str2);
        }
        return str == str2;
    }

    public int hashCode() {
        int i = 0;
        if (this.f1079a != null) {
            i = 0 + this.f1079a.hashCode();
        }
        if (this.f1080b != null) {
            i += this.f1080b.hashCode();
        }
        if (this.f1081c != null) {
            return i + this.f1081c.hashCode();
        }
        return i;
    }
}
