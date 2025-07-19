package com.getjar.sdk.utilities;

import java.lang.reflect.Method;
/* loaded from: classes.dex */
public class StringUtility {
    public static boolean isNullOrEmpty(String str) {
        return str == null || str.length() <= 0;
    }

    public static String zor(String value) {
        if (isNullOrEmpty(value)) {
            throw new IllegalArgumentException("'value' must not empty or null.");
        }
        try {
            Class<?> c = Class.forName("getjar.android.sdk.Z");
            Method m = c.getMethod("zor", String.class);
            return (String) m.invoke(null, value);
        } catch (Exception e) {
            return value;
        }
    }
}
