package com.google.android.gms.internal;

import java.util.Map;

/* renamed from: com.google.android.gms.internal.ak */
public final class C0870ak implements C0880an {

    /* renamed from: fm */
    private final C0871al f1954fm;

    public C0870ak(C0871al alVar) {
        this.f1954fm = alVar;
    }

    /* renamed from: a */
    public void mo7068a(C1007cw cwVar, Map<String, String> map) {
        String str = map.get("name");
        if (str == null) {
            C1004ct.m2218v("App event with no name parameter.");
        } else {
            this.f1954fm.onAppEvent(str, map.get("info"));
        }
    }
}
