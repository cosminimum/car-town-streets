package com.google.android.gms.internal;

import android.os.Build;

public final class fg {
    private static boolean X(int i) {
        return Build.VERSION.SDK_INT >= i;
    }

    public static boolean cD() {
        return X(11);
    }

    public static boolean cE() {
        return X(12);
    }

    public static boolean cF() {
        return X(13);
    }

    public static boolean cG() {
        return X(14);
    }

    public static boolean cH() {
        return X(16);
    }

    public static boolean cI() {
        return X(17);
    }
}
