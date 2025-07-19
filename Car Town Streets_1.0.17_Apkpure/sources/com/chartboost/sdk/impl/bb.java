package com.chartboost.sdk.impl;
/* loaded from: classes.dex */
public class bb {
    public static <T> T a(String str, T t) throws IllegalArgumentException {
        if (t == null) {
            throw new a(str);
        }
        return t;
    }

    /* loaded from: classes.dex */
    static class a extends IllegalArgumentException {
        a(String str) {
            super(str + " should not be null!");
        }
    }
}
