package com.chartboost.sdk.impl;

/* renamed from: com.chartboost.sdk.impl.bb */
public class C0150bb {
    /* renamed from: a */
    public static <T> T m306a(String str, T t) throws IllegalArgumentException {
        if (t != null) {
            return t;
        }
        throw new C0151a(str);
    }

    /* renamed from: com.chartboost.sdk.impl.bb$a */
    static class C0151a extends IllegalArgumentException {
        C0151a(String str) {
            super(str + " should not be null!");
        }
    }
}
