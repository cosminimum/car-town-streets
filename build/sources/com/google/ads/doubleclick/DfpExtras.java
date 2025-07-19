package com.google.ads.doubleclick;

import com.google.ads.mediation.admob.AdMobAdapterExtras;
import java.util.Map;

public class DfpExtras extends AdMobAdapterExtras {

    /* renamed from: a */
    private String f764a;

    public DfpExtras() {
    }

    public DfpExtras(DfpExtras original) {
        super(original);
        if (original != null) {
            this.f764a = original.f764a;
        }
    }

    public String getPublisherProvidedId() {
        return this.f764a;
    }

    public DfpExtras setPublisherProvidedId(String publisherProvidedId) {
        this.f764a = publisherProvidedId;
        return this;
    }

    public DfpExtras setPlusOneOptOut(boolean plusOneOptOut) {
        super.setPlusOneOptOut(plusOneOptOut);
        return this;
    }

    public DfpExtras setUseExactAdSize(boolean useExactAdSize) {
        super.setUseExactAdSize(useExactAdSize);
        return this;
    }

    public DfpExtras setExtras(Map<String, Object> extras) {
        super.setExtras(extras);
        return this;
    }

    public DfpExtras clearExtras() {
        super.clearExtras();
        return this;
    }

    public DfpExtras addExtra(String key, Object value) {
        super.addExtra(key, value);
        return this;
    }
}
