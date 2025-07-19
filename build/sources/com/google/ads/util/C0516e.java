package com.google.ads.util;

import android.annotation.TargetApi;
import android.content.Context;
import android.util.DisplayMetrics;

@TargetApi(4)
/* renamed from: com.google.ads.util.e */
public final class C0516e {
    /* renamed from: a */
    public static int m1048a(Context context, DisplayMetrics displayMetrics) {
        return m1047a(context, displayMetrics.density, displayMetrics.heightPixels);
    }

    /* renamed from: b */
    public static int m1049b(Context context, DisplayMetrics displayMetrics) {
        return m1047a(context, displayMetrics.density, displayMetrics.widthPixels);
    }

    /* renamed from: a */
    private static int m1047a(Context context, float f, int i) {
        if ((context.getApplicationInfo().flags & 8192) != 0) {
            return (int) (((float) i) / f);
        }
        return i;
    }
}
