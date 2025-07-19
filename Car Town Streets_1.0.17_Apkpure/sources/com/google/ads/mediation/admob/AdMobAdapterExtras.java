package com.google.ads.mediation.admob;

import com.google.ads.mediation.NetworkExtras;
import java.util.HashMap;
import java.util.Map;
/* loaded from: classes.dex */
public class AdMobAdapterExtras implements NetworkExtras {
    private boolean a;
    private boolean b;
    private Map<String, Object> c;

    public AdMobAdapterExtras() {
        this.a = false;
        this.b = false;
        mo56clearExtras();
    }

    public AdMobAdapterExtras(AdMobAdapterExtras original) {
        this();
        if (original != null) {
            this.a = original.a;
            this.b = original.b;
            this.c.putAll(original.c);
        }
    }

    /* renamed from: setPlusOneOptOut */
    public AdMobAdapterExtras mo58setPlusOneOptOut(boolean plusOneOptOut) {
        this.a = plusOneOptOut;
        return this;
    }

    public boolean getPlusOneOptOut() {
        return this.a;
    }

    /* renamed from: setUseExactAdSize */
    public AdMobAdapterExtras mo59setUseExactAdSize(boolean useExactAdSize) {
        this.b = useExactAdSize;
        return this;
    }

    public boolean getUseExactAdSize() {
        return this.b;
    }

    public Map<String, Object> getExtras() {
        return this.c;
    }

    /* renamed from: setExtras */
    public AdMobAdapterExtras mo57setExtras(Map<String, Object> extras) {
        if (extras == null) {
            throw new IllegalArgumentException("Argument 'extras' may not be null");
        }
        this.c = extras;
        return this;
    }

    /* renamed from: clearExtras */
    public AdMobAdapterExtras mo56clearExtras() {
        this.c = new HashMap();
        return this;
    }

    /* renamed from: addExtra */
    public AdMobAdapterExtras mo55addExtra(String key, Object value) {
        this.c.put(key, value);
        return this;
    }
}
