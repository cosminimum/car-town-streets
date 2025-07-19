package com.google.android.gms.ads;

import android.content.Context;
import com.getjar.sdk.utilities.Constants;
import com.google.android.gms.internal.C1003cs;
import com.google.android.gms.internal.C1466x;

public final class AdSize {
    public static final int AUTO_HEIGHT = -2;
    public static final AdSize BANNER = new AdSize(320, 50, "320x50_mb");
    public static final AdSize FULL_BANNER = new AdSize(468, 60, "468x60_as");
    public static final int FULL_WIDTH = -1;
    public static final AdSize LEADERBOARD = new AdSize(728, 90, "728x90_as");
    public static final AdSize MEDIUM_RECTANGLE = new AdSize(300, 250, "300x250_as");
    public static final AdSize SMART_BANNER = new AdSize(-1, -2, "smart_banner");
    public static final AdSize WIDE_SKYSCRAPER = new AdSize(160, 600, "160x600_as");

    /* renamed from: dY */
    private final String f1110dY;

    /* renamed from: v */
    private final int f1111v;

    /* renamed from: w */
    private final int f1112w;

    /* JADX INFO: this call moved to the top of the method (can break code semantics) */
    public AdSize(int width, int height) {
        this(width, height, (width == -1 ? "FULL" : String.valueOf(width)) + Constants.f677X + (height == -2 ? "AUTO" : String.valueOf(height)) + "_as");
    }

    AdSize(int width, int height, String formatString) {
        if (width < 0 && width != -1) {
            throw new IllegalArgumentException("Invalid width for AdSize: " + width);
        } else if (height >= 0 || height == -2) {
            this.f1112w = width;
            this.f1111v = height;
            this.f1110dY = formatString;
        } else {
            throw new IllegalArgumentException("Invalid height for AdSize: " + height);
        }
    }

    public boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof AdSize)) {
            return false;
        }
        AdSize adSize = (AdSize) other;
        return this.f1112w == adSize.f1112w && this.f1111v == adSize.f1111v && this.f1110dY.equals(adSize.f1110dY);
    }

    public int getHeight() {
        return this.f1111v;
    }

    public int getHeightInPixels(Context context) {
        return this.f1111v == -2 ? C1466x.m4077b(context.getResources().getDisplayMetrics()) : C1003cs.m2202a(context, this.f1111v);
    }

    public int getWidth() {
        return this.f1112w;
    }

    public int getWidthInPixels(Context context) {
        return this.f1112w == -1 ? C1466x.m4076a(context.getResources().getDisplayMetrics()) : C1003cs.m2202a(context, this.f1112w);
    }

    public int hashCode() {
        return this.f1110dY.hashCode();
    }

    public boolean isAutoHeight() {
        return this.f1111v == -2;
    }

    public boolean isFullWidth() {
        return this.f1112w == -1;
    }

    public String toString() {
        return this.f1110dY;
    }
}
