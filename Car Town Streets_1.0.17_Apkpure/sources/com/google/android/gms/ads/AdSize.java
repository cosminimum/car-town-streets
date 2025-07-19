package com.google.android.gms.ads;

import android.content.Context;
import com.getjar.sdk.utilities.Constants;
import com.google.android.gms.internal.cs;
import com.google.android.gms.internal.x;
/* loaded from: classes.dex */
public final class AdSize {
    public static final int AUTO_HEIGHT = -2;
    public static final int FULL_WIDTH = -1;
    private final String dY;
    private final int v;
    private final int w;
    public static final AdSize BANNER = new AdSize(320, 50, "320x50_mb");
    public static final AdSize FULL_BANNER = new AdSize(468, 60, "468x60_as");
    public static final AdSize LEADERBOARD = new AdSize(728, 90, "728x90_as");
    public static final AdSize MEDIUM_RECTANGLE = new AdSize(300, 250, "300x250_as");
    public static final AdSize WIDE_SKYSCRAPER = new AdSize(160, 600, "160x600_as");
    public static final AdSize SMART_BANNER = new AdSize(-1, -2, "smart_banner");

    public AdSize(int width, int height) {
        this(width, height, (width == -1 ? "FULL" : String.valueOf(width)) + Constants.X + (height == -2 ? "AUTO" : String.valueOf(height)) + "_as");
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public AdSize(int width, int height, String formatString) {
        if (width >= 0 || width == -1) {
            if (height < 0 && height != -2) {
                throw new IllegalArgumentException("Invalid height for AdSize: " + height);
            }
            this.w = width;
            this.v = height;
            this.dY = formatString;
            return;
        }
        throw new IllegalArgumentException("Invalid width for AdSize: " + width);
    }

    public boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof AdSize)) {
            return false;
        }
        AdSize adSize = (AdSize) other;
        return this.w == adSize.w && this.v == adSize.v && this.dY.equals(adSize.dY);
    }

    public int getHeight() {
        return this.v;
    }

    public int getHeightInPixels(Context context) {
        return this.v == -2 ? x.b(context.getResources().getDisplayMetrics()) : cs.a(context, this.v);
    }

    public int getWidth() {
        return this.w;
    }

    public int getWidthInPixels(Context context) {
        return this.w == -1 ? x.a(context.getResources().getDisplayMetrics()) : cs.a(context, this.w);
    }

    public int hashCode() {
        return this.dY.hashCode();
    }

    public boolean isAutoHeight() {
        return this.v == -2;
    }

    public boolean isFullWidth() {
        return this.w == -1;
    }

    public String toString() {
        return this.dY;
    }
}
