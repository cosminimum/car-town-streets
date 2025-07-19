package com.flurry.android;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Set;
/* loaded from: classes.dex */
final class af {
    private int b = 50;
    private LinkedHashMap a = new h(this, ((int) Math.ceil(50 / 0.75f)) + 1, 0.75f);

    /* JADX INFO: Access modifiers changed from: package-private */
    public af(int i) {
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final synchronized Object a(Object obj) {
        return this.a.get(obj);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final synchronized void a(Object obj, Object obj2) {
        this.a.put(obj, obj2);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final synchronized int a() {
        return this.a.size();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final synchronized List b() {
        return new ArrayList(this.a.entrySet());
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final synchronized Set c() {
        return this.a.keySet();
    }
}
