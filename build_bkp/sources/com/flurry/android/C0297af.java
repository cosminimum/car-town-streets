package com.flurry.android;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Set;

/* renamed from: com.flurry.android.af */
final class C0297af {

    /* renamed from: a */
    private LinkedHashMap f502a = new C0310h(this, ((int) Math.ceil((double) (((float) 50) / 0.75f))) + 1, 0.75f);
    /* access modifiers changed from: private */

    /* renamed from: b */
    public int f503b = 50;

    C0297af(int i) {
    }

    /* access modifiers changed from: package-private */
    /* renamed from: a */
    public final synchronized Object mo2391a(Object obj) {
        return this.f502a.get(obj);
    }

    /* access modifiers changed from: package-private */
    /* renamed from: a */
    public final synchronized void mo2392a(Object obj, Object obj2) {
        this.f502a.put(obj, obj2);
    }

    /* access modifiers changed from: package-private */
    /* renamed from: a */
    public final synchronized int mo2390a() {
        return this.f502a.size();
    }

    /* access modifiers changed from: package-private */
    /* renamed from: b */
    public final synchronized List mo2393b() {
        return new ArrayList(this.f502a.entrySet());
    }

    /* access modifiers changed from: package-private */
    /* renamed from: c */
    public final synchronized Set mo2394c() {
        return this.f502a.keySet();
    }
}
