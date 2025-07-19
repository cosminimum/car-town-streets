package com.google.android.gms.internal;

import com.google.android.gms.ads.doubleclick.AppEventListener;
import com.google.android.gms.internal.C0861ae;

/* renamed from: com.google.android.gms.internal.z */
public final class C1468z extends C0861ae.C0862a {

    /* renamed from: eI */
    private final AppEventListener f3488eI;

    public C1468z(AppEventListener appEventListener) {
        this.f3488eI = appEventListener;
    }

    public void onAppEvent(String name, String info) {
        this.f3488eI.onAppEvent(name, info);
    }
}
