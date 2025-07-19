package com.flurry.android;

import java.util.List;

/* renamed from: com.flurry.android.j */
final class C0312j implements Runnable {

    /* renamed from: a */
    private /* synthetic */ List f598a;

    C0312j(List list) {
        this.f598a = list;
    }

    public final void run() {
        for (C0317o a : this.f598a) {
            a.mo2417a();
        }
    }
}
