package com.google.android.gms.internal;

import com.google.android.gms.ads.doubleclick.AppEventListener;
import com.google.android.gms.internal.ae;

public final class z extends ae.a {
    private final AppEventListener eI;

    public z(AppEventListener appEventListener) {
        this.eI = appEventListener;
    }

    public void onAppEvent(String name, String info) {
        this.eI.onAppEvent(name, info);
    }
}
