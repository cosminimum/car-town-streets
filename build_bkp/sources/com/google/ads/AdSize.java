package com.google.ads;

import android.content.Context;
import android.util.DisplayMetrics;
import android.util.TypedValue;
import com.getjar.sdk.utilities.Constants;

public class AdSize {
    public static final int AUTO_HEIGHT = -2;
    public static final AdSize BANNER = new AdSize(320, 50, "mb");
    public static final int FULL_WIDTH = -1;
    public static final AdSize IAB_BANNER = new AdSize(468, 60, "as");
    public static final AdSize IAB_LEADERBOARD = new AdSize(728, 90, "as");
    public static final AdSize IAB_MRECT = new AdSize(300, 250, "as");
    public static final AdSize IAB_WIDE_SKYSCRAPER = new AdSize(160, 600, "as");
    public static final int LANDSCAPE_AD_HEIGHT = 32;
    public static final int LARGE_AD_HEIGHT = 90;
    public static final int PORTRAIT_AD_HEIGHT = 50;
    public static final AdSize SMART_BANNER = new AdSize(-1, -2, "mb");

    /* renamed from: a */
    private final int f716a;

    /* renamed from: b */
    private final int f717b;

    /* renamed from: c */
    private boolean f718c;

    /* renamed from: d */
    private boolean f719d;

    /* renamed from: e */
    private boolean f720e;

    /* renamed from: f */
    private String f721f;

    public AdSize(int width, int height) {
        this(width, height, (String) null);
        if (m666a()) {
            this.f720e = false;
            this.f721f = "mb";
            return;
        }
        this.f720e = true;
    }

    private AdSize(int width, int height, String type) {
        boolean z;
        boolean z2 = true;
        this.f716a = width;
        this.f717b = height;
        this.f721f = type;
        if (width == -1) {
            z = true;
        } else {
            z = false;
        }
        this.f718c = z;
        this.f719d = height != -2 ? false : z2;
        this.f720e = false;
    }

    public static AdSize createAdSize(AdSize adSize, Context context) {
        if (context == null || !adSize.m666a()) {
            return adSize.m666a() ? BANNER : adSize;
        }
        AdSize adSize2 = new AdSize(adSize.f718c ? m665a(context) : adSize.getWidth(), adSize.f719d ? m667b(context) : adSize.getHeight(), adSize.f721f);
        adSize2.f719d = adSize.f719d;
        adSize2.f718c = adSize.f718c;
        adSize2.f720e = adSize.f720e;
        return adSize2;
    }

    public boolean equals(Object other) {
        if (!(other instanceof AdSize)) {
            return false;
        }
        AdSize adSize = (AdSize) other;
        if (this.f716a == adSize.f716a && this.f717b == adSize.f717b) {
            return true;
        }
        return false;
    }

    public int hashCode() {
        return (Integer.valueOf(this.f716a).hashCode() << 16) | (Integer.valueOf(this.f717b).hashCode() & 65535);
    }

    public int getWidth() {
        if (this.f716a >= 0) {
            return this.f716a;
        }
        throw new UnsupportedOperationException("Ad size was not set before getWidth() was called.");
    }

    public int getHeight() {
        if (this.f717b >= 0) {
            return this.f717b;
        }
        throw new UnsupportedOperationException("Ad size was not set before getHeight() was called.");
    }

    /* renamed from: a */
    private boolean m666a() {
        return this.f716a < 0 || this.f717b < 0;
    }

    public boolean isFullWidth() {
        return this.f718c;
    }

    public boolean isAutoHeight() {
        return this.f719d;
    }

    public boolean isCustomAdSize() {
        return this.f720e;
    }

    public String toString() {
        return getWidth() + Constants.f677X + getHeight() + (this.f721f == null ? "" : "_" + this.f721f);
    }

    public int getWidthInPixels(Context context) {
        return (int) TypedValue.applyDimension(1, (float) this.f716a, context.getResources().getDisplayMetrics());
    }

    public int getHeightInPixels(Context context) {
        return (int) TypedValue.applyDimension(1, (float) this.f717b, context.getResources().getDisplayMetrics());
    }

    public boolean isSizeAppropriate(int width, int height) {
        return ((double) width) <= ((double) this.f716a) * 1.25d && ((double) width) >= ((double) this.f716a) * 0.8d && ((double) height) <= ((double) this.f717b) * 1.25d && ((double) height) >= ((double) this.f717b) * 0.8d;
    }

    public AdSize findBestSize(AdSize... options) {
        double d;
        AdSize adSize;
        AdSize adSize2 = null;
        double d2 = 0.0d;
        if (options != null) {
            int length = options.length;
            int i = 0;
            while (i < length) {
                AdSize adSize3 = options[i];
                if (isSizeAppropriate(adSize3.f716a, adSize3.f717b)) {
                    d = (((double) adSize3.f716a) * ((double) adSize3.f717b)) / (((double) this.f716a) * ((double) this.f717b));
                    if (d > 1.0d) {
                        d = 1.0d / d;
                    }
                    if (d > d2) {
                        adSize = adSize3;
                        i++;
                        adSize2 = adSize;
                        d2 = d;
                    }
                }
                d = d2;
                adSize = adSize2;
                i++;
                adSize2 = adSize;
                d2 = d;
            }
        }
        return adSize2;
    }

    /* renamed from: a */
    private static int m665a(Context context) {
        DisplayMetrics displayMetrics = context.getResources().getDisplayMetrics();
        return (int) (((float) displayMetrics.widthPixels) / displayMetrics.density);
    }

    /* renamed from: b */
    private static int m667b(Context context) {
        DisplayMetrics displayMetrics = context.getResources().getDisplayMetrics();
        int i = (int) (((float) displayMetrics.heightPixels) / displayMetrics.density);
        if (i <= 400) {
            return 32;
        }
        if (i <= 720) {
            return 50;
        }
        return 90;
    }
}
