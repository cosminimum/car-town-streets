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
/* loaded from: classes.dex */
public final class cs {
    public static final Handler iI = new Handler(Looper.getMainLooper());

    public static int a(Context context, int i) {
        return a(context.getResources().getDisplayMetrics(), i);
    }

    public static int a(DisplayMetrics displayMetrics, int i) {
        return (int) TypedValue.applyDimension(1, i, displayMetrics);
    }

    public static void a(ViewGroup viewGroup, x xVar, String str) {
        a(viewGroup, xVar, str, -16777216, -1);
    }

    private static void a(ViewGroup viewGroup, x xVar, String str, int i, int i2) {
        if (viewGroup.getChildCount() != 0) {
            return;
        }
        Context context = viewGroup.getContext();
        TextView textView = new TextView(context);
        textView.setGravity(17);
        textView.setText(str);
        textView.setTextColor(i);
        textView.setBackgroundColor(i2);
        FrameLayout frameLayout = new FrameLayout(context);
        frameLayout.setBackgroundColor(i);
        int a = a(context, 3);
        frameLayout.addView(textView, new FrameLayout.LayoutParams(xVar.widthPixels - a, xVar.heightPixels - a, 17));
        viewGroup.addView(frameLayout, xVar.widthPixels, xVar.heightPixels);
    }

    public static void a(ViewGroup viewGroup, x xVar, String str, String str2) {
        ct.v(str2);
        a(viewGroup, xVar, str, -65536, -16777216);
    }

    public static boolean ax() {
        return Build.DEVICE.startsWith("generic");
    }

    public static boolean ay() {
        return Looper.myLooper() == Looper.getMainLooper();
    }

    public static String l(Context context) {
        String string = Settings.Secure.getString(context.getContentResolver(), TapjoyConstants.TJC_ANDROID_ID);
        if (string == null || ax()) {
            string = "emulator";
        }
        return q(string);
    }

    public static String q(String str) {
        for (int i = 0; i < 2; i++) {
            try {
                MessageDigest messageDigest = MessageDigest.getInstance("MD5");
                messageDigest.update(str.getBytes());
                return String.format(Locale.US, "%032X", new BigInteger(1, messageDigest.digest()));
            } catch (NoSuchAlgorithmException e) {
            }
        }
        return null;
    }
}
