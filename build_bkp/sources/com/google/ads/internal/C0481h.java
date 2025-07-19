package com.google.ads.internal;

import android.content.Context;
import com.google.ads.AdSize;

/* renamed from: com.google.ads.internal.h */
public class C0481h {

    /* renamed from: a */
    public static final C0481h f945a = new C0481h((AdSize) null, true);

    /* renamed from: b */
    private AdSize f946b;

    /* renamed from: c */
    private final boolean f947c;

    private C0481h(AdSize adSize, boolean z) {
        this.f946b = adSize;
        this.f947c = z;
    }

    /* renamed from: a */
    public static C0481h m944a(AdSize adSize, Context context) {
        return new C0481h(AdSize.createAdSize(adSize, context), false);
    }

    /* renamed from: a */
    public static C0481h m943a(AdSize adSize) {
        return m944a(adSize, (Context) null);
    }

    /* renamed from: a */
    public boolean mo3767a() {
        return this.f947c;
    }

    /* renamed from: b */
    public AdSize mo3768b() {
        return this.f946b;
    }

    /* renamed from: b */
    public void mo3769b(AdSize adSize) {
        if (!this.f947c) {
            this.f946b = adSize;
        }
    }
}
