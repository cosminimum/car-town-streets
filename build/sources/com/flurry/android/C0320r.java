package com.flurry.android;

import android.content.Context;
import android.widget.ImageView;
import java.io.Closeable;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

/* renamed from: com.flurry.android.r */
final class C0320r {
    C0320r() {
    }

    /* renamed from: a */
    static String m559a(String str, int i) {
        if (str == null) {
            return "";
        }
        return str.length() > i ? str.substring(0, i) : str;
    }

    /* renamed from: a */
    static String m558a(String str) {
        try {
            return URLEncoder.encode(str, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            C0299ah.m542d("FlurryAgent", "Cannot encode '" + str + "'");
            return "";
        }
    }

    /* renamed from: a */
    static void m561a(Closeable closeable) {
        if (closeable != null) {
            try {
                closeable.close();
            } catch (Throwable th) {
            }
        }
    }

    /* renamed from: a */
    static void m560a(Context context, ImageView imageView, int i, int i2) {
        imageView.setAdjustViewBounds(true);
        imageView.setMinimumWidth(m557a(context, i));
        imageView.setMinimumHeight(m557a(context, i2));
        imageView.setMaxWidth(m557a(context, i));
        imageView.setMaxHeight(m557a(context, i2));
    }

    /* renamed from: a */
    static int m557a(Context context, int i) {
        return (int) ((context.getResources().getDisplayMetrics().density * ((float) i)) + 0.5f);
    }
}
