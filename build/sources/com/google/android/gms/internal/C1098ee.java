package com.google.android.gms.internal;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/* renamed from: com.google.android.gms.internal.ee */
public final class C1098ee {

    /* renamed from: com.google.android.gms.internal.ee$a */
    public static final class C1100a {

        /* renamed from: pN */
        private final List<String> f2624pN;

        /* renamed from: pO */
        private final Object f2625pO;

        private C1100a(Object obj) {
            this.f2625pO = C1102eg.m2616f(obj);
            this.f2624pN = new ArrayList();
        }

        /* renamed from: a */
        public C1100a mo7535a(String str, Object obj) {
            this.f2624pN.add(((String) C1102eg.m2616f(str)) + "=" + String.valueOf(obj));
            return this;
        }

        public String toString() {
            StringBuilder append = new StringBuilder(100).append(this.f2625pO.getClass().getSimpleName()).append('{');
            int size = this.f2624pN.size();
            for (int i = 0; i < size; i++) {
                append.append(this.f2624pN.get(i));
                if (i < size - 1) {
                    append.append(", ");
                }
            }
            return append.append('}').toString();
        }
    }

    /* renamed from: e */
    public static C1100a m2604e(Object obj) {
        return new C1100a(obj);
    }

    public static boolean equal(Object a, Object b) {
        return a == b || (a != null && a.equals(b));
    }

    public static int hashCode(Object... objects) {
        return Arrays.hashCode(objects);
    }
}
