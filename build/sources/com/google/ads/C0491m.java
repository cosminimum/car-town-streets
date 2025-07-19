package com.google.ads;

import android.app.Activity;
import android.content.Context;
import android.view.ViewGroup;
import com.google.ads.internal.C0481h;
import com.google.ads.internal.state.AdState;
import com.google.ads.util.C0530i;

/* renamed from: com.google.ads.m */
public class C0491m extends C0530i {

    /* renamed from: a */
    public final C0530i.C0533b<C0489l> f980a;

    /* renamed from: b */
    public final C0530i.C0534c<AdState> f981b = new C0530i.C0534c<>("currentAd", null);

    /* renamed from: c */
    public final C0530i.C0534c<AdState> f982c = new C0530i.C0534c<>("nextAd", null);

    /* renamed from: d */
    public final C0530i.C0533b<String> f983d;

    /* renamed from: e */
    public final C0530i.C0535d<Activity> f984e;

    /* renamed from: f */
    public final C0530i.C0533b<Context> f985f;

    /* renamed from: g */
    public final C0530i.C0533b<ViewGroup> f986g;

    /* renamed from: h */
    public final C0530i.C0533b<C0423Ad> f987h;

    /* renamed from: i */
    public final C0530i.C0533b<AdView> f988i;

    /* renamed from: j */
    public final C0530i.C0533b<InterstitialAd> f989j;

    /* renamed from: k */
    public final C0530i.C0533b<C0481h> f990k;

    /* renamed from: l */
    public final C0530i.C0534c<AdSize[]> f991l;

    /* renamed from: m */
    public final C0530i.C0534c<AdListener> f992m = new C0530i.C0534c<>("adListener");

    /* renamed from: n */
    public final C0530i.C0534c<AppEventListener> f993n = new C0530i.C0534c<>("appEventListener");

    /* renamed from: a */
    public boolean mo3790a() {
        return !mo3791b();
    }

    /* renamed from: b */
    public boolean mo3791b() {
        return this.f990k.mo3874a().mo3767a();
    }

    public C0491m(C0489l lVar, C0423Ad ad, AdView adView, InterstitialAd interstitialAd, String str, Activity activity, Context context, ViewGroup viewGroup, C0481h hVar) {
        this.f980a = new C0530i.C0533b<>("appState", lVar);
        this.f987h = new C0530i.C0533b<>("ad", ad);
        this.f988i = new C0530i.C0533b<>("adView", adView);
        this.f990k = new C0530i.C0533b<>("adType", hVar);
        this.f983d = new C0530i.C0533b<>("adUnitId", str);
        this.f984e = new C0530i.C0535d<>("activity", activity);
        this.f989j = new C0530i.C0533b<>("interstitialAd", interstitialAd);
        this.f986g = new C0530i.C0533b<>("bannerContainer", viewGroup);
        this.f985f = new C0530i.C0533b<>("applicationContext", context);
        this.f991l = new C0530i.C0534c<>("adSizes", null);
    }
}
