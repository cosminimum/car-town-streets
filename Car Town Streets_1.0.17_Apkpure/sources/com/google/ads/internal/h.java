package com.google.ads.internal;

import android.content.Context;
import com.google.ads.AdSize;
/* loaded from: classes.dex */
public class h {
    public static final h a = new h(null, true);
    private AdSize b;
    private final boolean c;

    private h(AdSize adSize, boolean z) {
        this.b = adSize;
        this.c = z;
    }

    public static h a(AdSize adSize, Context context) {
        return new h(AdSize.createAdSize(adSize, context), false);
    }

    public static h a(AdSize adSize) {
        return a(adSize, null);
    }

    public boolean a() {
        return this.c;
    }

    public AdSize b() {
        return this.b;
    }

    public void b(AdSize adSize) {
        if (!this.c) {
            this.b = adSize;
        }
    }
}
