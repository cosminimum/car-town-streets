package com.google.ads;

import com.google.ads.internal.C0475d;
import com.google.ads.util.C0508b;
import java.lang.ref.WeakReference;

/* renamed from: com.google.ads.ae */
public class C0428ae implements Runnable {

    /* renamed from: a */
    private WeakReference<C0475d> f732a;

    public C0428ae(C0475d dVar) {
        this.f732a = new WeakReference<>(dVar);
    }

    public void run() {
        C0475d dVar = (C0475d) this.f732a.get();
        if (dVar == null) {
            C0508b.m1026a("The ad must be gone, so cancelling the refresh timer.");
        } else {
            dVar.mo3725y();
        }
    }
}
