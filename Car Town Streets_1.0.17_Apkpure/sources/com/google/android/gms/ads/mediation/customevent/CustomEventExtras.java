package com.google.android.gms.ads.mediation.customevent;

import com.google.ads.mediation.NetworkExtras;
import java.util.HashMap;
/* loaded from: classes.dex */
public final class CustomEventExtras implements NetworkExtras {
    private final HashMap<String, Object> ji = new HashMap<>();

    public Object getExtra(String label) {
        return this.ji.get(label);
    }

    public void setExtra(String label, Object value) {
        this.ji.put(label, value);
    }
}
