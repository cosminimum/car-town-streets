package com.flurry.android;

import android.content.Context;
import android.widget.ImageView;
import java.io.Closeable;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
/* loaded from: classes.dex */
final class r {
    r() {
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static String a(String str, int i) {
        if (str == null) {
            return "";
        }
        return str.length() > i ? str.substring(0, i) : str;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static String a(String str) {
        try {
            return URLEncoder.encode(str, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            ah.d("FlurryAgent", "Cannot encode '" + str + "'");
            return "";
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void a(Closeable closeable) {
        if (closeable != null) {
            try {
                closeable.close();
            } catch (Throwable th) {
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void a(Context context, ImageView imageView, int i, int i2) {
        imageView.setAdjustViewBounds(true);
        imageView.setMinimumWidth(a(context, i));
        imageView.setMinimumHeight(a(context, i2));
        imageView.setMaxWidth(a(context, i));
        imageView.setMaxHeight(a(context, i2));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static int a(Context context, int i) {
        return (int) ((context.getResources().getDisplayMetrics().density * i) + 0.5f);
    }
}
