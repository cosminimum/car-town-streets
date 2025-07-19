package com.google.android.gms.internal;

import android.content.Context;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.provider.Settings;
import android.util.DisplayMetrics;
import android.util.TypedValue;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.TextView;
import com.tapjoy.TapjoyConstants;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Locale;

/* renamed from: com.google.android.gms.internal.cs */
public final class C1003cs {

    /* renamed from: iI */
    public static final Handler f2412iI = new Handler(Looper.getMainLooper());

    /* renamed from: a */
    public static int m2202a(Context context, int i) {
        return m2203a(context.getResources().getDisplayMetrics(), i);
    }

    /* renamed from: a */
    public static int m2203a(DisplayMetrics displayMetrics, int i) {
        return (int) TypedValue.applyDimension(1, (float) i, displayMetrics);
    }

    /* renamed from: a */
    public static void m2204a(ViewGroup viewGroup, C1466x xVar, String str) {
        m2205a(viewGroup, xVar, str, -16777216, -1);
    }

    /* renamed from: a */
    private static void m2205a(ViewGroup viewGroup, C1466x xVar, String str, int i, int i2) {
        if (viewGroup.getChildCount() == 0) {
            Context context = viewGroup.getContext();
            TextView textView = new TextView(context);
            textView.setGravity(17);
            textView.setText(str);
            textView.setTextColor(i);
            textView.setBackgroundColor(i2);
            FrameLayout frameLayout = new FrameLayout(context);
            frameLayout.setBackgroundColor(i);
            int a = m2202a(context, 3);
            frameLayout.addView(textView, new FrameLayout.LayoutParams(xVar.widthPixels - a, xVar.heightPixels - a, 17));
            viewGroup.addView(frameLayout, xVar.widthPixels, xVar.heightPixels);
        }
    }

    /* renamed from: a */
    public static void m2206a(ViewGroup viewGroup, C1466x xVar, String str, String str2) {
        C1004ct.m2218v(str2);
        m2205a(viewGroup, xVar, str, -65536, -16777216);
    }

    /* renamed from: ax */
    public static boolean m2207ax() {
        return Build.DEVICE.startsWith("generic");
    }

    /* renamed from: ay */
    public static boolean m2208ay() {
        return Looper.myLooper() == Looper.getMainLooper();
    }

    /* renamed from: l */
    public static String m2209l(Context context) {
        String string = Settings.Secure.getString(context.getContentResolver(), TapjoyConstants.TJC_ANDROID_ID);
        if (string == null || m2207ax()) {
            string = "emulator";
        }
        return m2210q(string);
    }

    /* renamed from: q */
    public static String m2210q(String str) {
        int i = 0;
        while (i < 2) {
            try {
                MessageDigest instance = MessageDigest.getInstance("MD5");
                instance.update(str.getBytes());
                return String.format(Locale.US, "%032X", new Object[]{new BigInteger(1, instance.digest())});
            } catch (NoSuchAlgorithmException e) {
                i++;
            }
        }
        return null;
    }
}
