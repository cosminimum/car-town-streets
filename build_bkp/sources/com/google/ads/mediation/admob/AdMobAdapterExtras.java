package com.google.ads.mediation.admob;

import com.google.ads.mediation.NetworkExtras;
import java.util.HashMap;
import java.util.Map;

public class AdMobAdapterExtras implements NetworkExtras {

    /* renamed from: a */
    private boolean f1003a;

    /* renamed from: b */
    private boolean f1004b;

    /* renamed from: c */
    private Map<String, Object> f1005c;

    public AdMobAdapterExtras() {
        this.f1003a = false;
        this.f1004b = false;
        clearExtras();
    }

    public AdMobAdapterExtras(AdMobAdapterExtras original) {
        this();
        if (original != null) {
            this.f1003a = original.f1003a;
            this.f1004b = original.f1004b;
            this.f1005c.putAll(original.f1005c);
        }
    }

    public AdMobAdapterExtras setPlusOneOptOut(boolean plusOneOptOut) {
        this.f1003a = plusOneOptOut;
        return this;
    }

    public boolean getPlusOneOptOut() {
        return this.f1003a;
    }

    public AdMobAdapterExtras setUseExactAdSize(boolean useExactAdSize) {
        this.f1004b = useExactAdSize;
        return this;
    }

    public boolean getUseExactAdSize() {
        return this.f1004b;
    }

    public Map<String, Object> getExtras() {
        return this.f1005c;
    }

    public AdMobAdapterExtras setExtras(Map<String, Object> extras) {
        if (extras == null) {
            throw new IllegalArgumentException("Argument 'extras' may not be null");
        }
        this.f1005c = extras;
        return this;
    }

    public AdMobAdapterExtras clearExtras() {
        this.f1005c = new HashMap();
        return this;
    }

    public AdMobAdapterExtras addExtra(String key, Object value) {
        this.f1005c.put(key, value);
        return this;
    }
}
