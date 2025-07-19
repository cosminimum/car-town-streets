package com.chartboost.sdk.impl;

import java.util.regex.Pattern;

/* renamed from: com.chartboost.sdk.impl.ae */
public class C0100ae {

    /* renamed from: a */
    private static Pattern f134a = Pattern.compile("\\s+", 40);

    /* renamed from: com.chartboost.sdk.impl.ae$a */
    public static class C0101a extends RuntimeException {

        /* renamed from: a */
        final String f135a;

        C0101a(String str) {
            super(str);
            this.f135a = str;
        }

        public String toString() {
            return this.f135a;
        }
    }

    /* renamed from: a */
    public static void m171a(int i, int i2) {
        if (i != i2) {
            throw new C0101a("" + i + " != " + i2);
        }
    }
}
