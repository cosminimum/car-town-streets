package com.getjar.sdk.utilities;

public class StringUtility {
    public static boolean isNullOrEmpty(String str) {
        return str == null || str.length() <= 0;
    }

    public static String zor(String value) {
        if (isNullOrEmpty(value)) {
            throw new IllegalArgumentException("'value' must not empty or null.");
        }
        try {
            return (String) Class.forName("getjar.android.sdk.Z").getMethod("zor", new Class[]{String.class}).invoke((Object) null, new Object[]{value});
        } catch (Exception e) {
            return value;
        }
    }
}
