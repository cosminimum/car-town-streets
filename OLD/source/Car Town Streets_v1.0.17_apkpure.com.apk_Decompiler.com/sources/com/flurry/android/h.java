package com.flurry.android;

import java.util.LinkedHashMap;
import java.util.Map;

final class h extends LinkedHashMap {
    private /* synthetic */ af a;

    /* JADX INFO: super call moved to the top of the method (can break code semantics) */
    h(af afVar, int i, float f) {
        super(i, f, true);
        this.a = afVar;
    }

    /* access modifiers changed from: protected */
    public final boolean removeEldestEntry(Map.Entry entry) {
        return size() > this.a.b;
    }
}
