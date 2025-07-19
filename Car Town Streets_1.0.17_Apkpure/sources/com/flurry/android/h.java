package com.flurry.android;

import java.util.LinkedHashMap;
import java.util.Map;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final class h extends LinkedHashMap {
    private /* synthetic */ af a;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public h(af afVar, int i, float f) {
        super(i, f, true);
        this.a = afVar;
    }

    @Override // java.util.LinkedHashMap
    protected final boolean removeEldestEntry(Map.Entry entry) {
        int i;
        int size = size();
        i = this.a.b;
        return size > i;
    }
}
