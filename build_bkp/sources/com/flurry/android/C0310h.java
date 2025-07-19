package com.flurry.android;

import java.util.LinkedHashMap;
import java.util.Map;

/* renamed from: com.flurry.android.h */
final class C0310h extends LinkedHashMap {

    /* renamed from: a */
    private /* synthetic */ C0297af f591a;

    /* JADX INFO: super call moved to the top of the method (can break code semantics) */
    C0310h(C0297af afVar, int i, float f) {
        super(i, f, true);
        this.f591a = afVar;
    }

    /* access modifiers changed from: protected */
    public final boolean removeEldestEntry(Map.Entry entry) {
        return size() > this.f591a.f503b;
    }
}
