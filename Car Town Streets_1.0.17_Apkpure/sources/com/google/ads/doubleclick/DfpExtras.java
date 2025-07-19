package com.google.ads.doubleclick;

import com.google.ads.mediation.admob.AdMobAdapterExtras;
import java.util.Map;
/* loaded from: classes.dex */
public class DfpExtras extends AdMobAdapterExtras {
    private String a;

    @Override // com.google.ads.mediation.admob.AdMobAdapterExtras
    /* renamed from: setExtras  reason: collision with other method in class */
    public /* bridge */ /* synthetic */ AdMobAdapterExtras mo57setExtras(Map x0) {
        return mo57setExtras((Map<String, Object>) x0);
    }

    public DfpExtras() {
    }

    public DfpExtras(DfpExtras original) {
        super(original);
        if (original != null) {
            this.a = original.a;
        }
    }

    public String getPublisherProvidedId() {
        return this.a;
    }

    public DfpExtras setPublisherProvidedId(String publisherProvidedId) {
        this.a = publisherProvidedId;
        return this;
    }

    @Override // com.google.ads.mediation.admob.AdMobAdapterExtras
    /* renamed from: setPlusOneOptOut */
    public DfpExtras mo58setPlusOneOptOut(boolean plusOneOptOut) {
        super.mo58setPlusOneOptOut(plusOneOptOut);
        return this;
    }

    @Override // com.google.ads.mediation.admob.AdMobAdapterExtras
    /* renamed from: setUseExactAdSize */
    public DfpExtras mo59setUseExactAdSize(boolean useExactAdSize) {
        super.mo59setUseExactAdSize(useExactAdSize);
        return this;
    }

    @Override // com.google.ads.mediation.admob.AdMobAdapterExtras
    /* renamed from: setExtras */
    public DfpExtras mo57setExtras(Map<String, Object> extras) {
        super.mo57setExtras(extras);
        return this;
    }

    @Override // com.google.ads.mediation.admob.AdMobAdapterExtras
    /* renamed from: clearExtras */
    public DfpExtras mo56clearExtras() {
        super.mo56clearExtras();
        return this;
    }

    @Override // com.google.ads.mediation.admob.AdMobAdapterExtras
    /* renamed from: addExtra */
    public DfpExtras mo55addExtra(String key, Object value) {
        super.mo55addExtra(key, value);
        return this;
    }
}
