package com.google.android.gms.ads.mediation.customevent;

import com.google.ads.mediation.NetworkExtras;
import java.util.HashMap;

public final class CustomEventExtras implements NetworkExtras {

    /* renamed from: ji */
    private final HashMap<String, Object> f1122ji = new HashMap<>();

    public Object getExtra(String label) {
        return this.f1122ji.get(label);
    }

    public void setExtra(String label, Object value) {
        this.f1122ji.put(label, value);
    }
}
