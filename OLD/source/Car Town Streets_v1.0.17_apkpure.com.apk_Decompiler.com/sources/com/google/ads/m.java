package com.google.ads;

import android.app.Activity;
import android.content.Context;
import android.view.ViewGroup;
import com.google.ads.internal.h;
import com.google.ads.internal.state.AdState;
import com.google.ads.util.i;

public class m extends i {
    public final i.b<l> a;
    public final i.c<AdState> b = new i.c<>("currentAd", null);
    public final i.c<AdState> c = new i.c<>("nextAd", null);
    public final i.b<String> d;
    public final i.d<Activity> e;
    public final i.b<Context> f;
    public final i.b<ViewGroup> g;
    public final i.b<Ad> h;
    public final i.b<AdView> i;
    public final i.b<InterstitialAd> j;
    public final i.b<h> k;
    public final i.c<AdSize[]> l;
    public final i.c<AdListener> m = new i.c<>("adListener");
    public final i.c<AppEventListener> n = new i.c<>("appEventListener");

    public boolean a() {
        return !b();
    }

    public boolean b() {
        return this.k.a().a();
    }

    public m(l lVar, Ad ad, AdView adView, InterstitialAd interstitialAd, String str, Activity activity, Context context, ViewGroup viewGroup, h hVar) {
        this.a = new i.b<>("appState", lVar);
        this.h = new i.b<>("ad", ad);
        this.i = new i.b<>("adView", adView);
        this.k = new i.b<>("adType", hVar);
        this.d = new i.b<>("adUnitId", str);
        this.e = new i.d<>("activity", activity);
        this.j = new i.b<>("interstitialAd", interstitialAd);
        this.g = new i.b<>("bannerContainer", viewGroup);
        this.f = new i.b<>("applicationContext", context);
        this.l = new i.c<>("adSizes", null);
    }
}
