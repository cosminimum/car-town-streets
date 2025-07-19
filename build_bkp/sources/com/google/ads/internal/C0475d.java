package com.google.ads.internal;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.net.Uri;
import android.os.Handler;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import com.google.ads.AdActivity;
import com.google.ads.AdListener;
import com.google.ads.AdRequest;
import com.google.ads.AdSize;
import com.google.ads.AdView;
import com.google.ads.AppEventListener;
import com.google.ads.C0423Ad;
import com.google.ads.C0427ac;
import com.google.ads.C0428ae;
import com.google.ads.C0430ag;
import com.google.ads.C0439b;
import com.google.ads.C0440c;
import com.google.ads.C0442d;
import com.google.ads.C0443e;
import com.google.ads.C0452f;
import com.google.ads.C0453g;
import com.google.ads.C0455h;
import com.google.ads.C0489l;
import com.google.ads.C0491m;
import com.google.ads.InterstitialAd;
import com.google.ads.util.AdUtil;
import com.google.ads.util.C0506a;
import com.google.ads.util.C0508b;
import com.tapjoy.TapjoyConstants;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Locale;

/* renamed from: com.google.ads.internal.d */
public class C0475d {

    /* renamed from: a */
    private static final Object f894a = new Object();

    /* renamed from: b */
    private final C0491m f895b;

    /* renamed from: c */
    private C0467c f896c;

    /* renamed from: d */
    private AdRequest f897d;

    /* renamed from: e */
    private C0480g f898e;

    /* renamed from: f */
    private AdWebView f899f;

    /* renamed from: g */
    private C0482i f900g;

    /* renamed from: h */
    private Handler f901h;

    /* renamed from: i */
    private long f902i;

    /* renamed from: j */
    private boolean f903j;

    /* renamed from: k */
    private boolean f904k;

    /* renamed from: l */
    private boolean f905l;

    /* renamed from: m */
    private boolean f906m;

    /* renamed from: n */
    private boolean f907n;

    /* renamed from: o */
    private SharedPreferences f908o;

    /* renamed from: p */
    private long f909p;

    /* renamed from: q */
    private C0428ae f910q;

    /* renamed from: r */
    private boolean f911r;

    /* renamed from: s */
    private LinkedList<String> f912s;

    /* renamed from: t */
    private LinkedList<String> f913t;

    /* renamed from: u */
    private int f914u = -1;

    /* renamed from: v */
    private Boolean f915v;

    /* renamed from: w */
    private C0442d f916w;

    /* renamed from: x */
    private C0443e f917x;

    /* renamed from: y */
    private C0452f f918y;

    /* renamed from: z */
    private String f919z = null;

    public C0475d(C0423Ad ad, Activity activity, AdSize adSize, String str, ViewGroup viewGroup, boolean z) {
        AdView adView;
        InterstitialAd interstitialAd;
        C0481h a;
        AdView adView2;
        InterstitialAd interstitialAd2;
        C0481h a2;
        this.f911r = z;
        this.f898e = new C0480g();
        this.f896c = null;
        this.f897d = null;
        this.f904k = false;
        this.f901h = new Handler();
        this.f909p = TapjoyConstants.THROTTLE_GET_TAP_POINTS_INTERVAL;
        this.f905l = false;
        this.f907n = false;
        this.f906m = true;
        if (activity == null) {
            C0489l a3 = C0489l.m955a();
            if (ad instanceof AdView) {
                adView2 = (AdView) ad;
            } else {
                adView2 = null;
            }
            if (ad instanceof InterstitialAd) {
                interstitialAd2 = (InterstitialAd) ad;
            } else {
                interstitialAd2 = null;
            }
            if (adSize == null) {
                a2 = C0481h.f945a;
            } else {
                a2 = C0481h.m943a(adSize);
            }
            this.f895b = new C0491m(a3, ad, adView2, interstitialAd2, str, (Activity) null, (Context) null, viewGroup, a2);
            return;
        }
        synchronized (f894a) {
            this.f908o = activity.getApplicationContext().getSharedPreferences("GoogleAdMobAdsPrefs", 0);
            if (z) {
                long j = this.f908o.getLong("Timeout" + str, -1);
                if (j < 0) {
                    this.f902i = 5000;
                } else {
                    this.f902i = j;
                }
            } else {
                this.f902i = TapjoyConstants.THROTTLE_GET_TAP_POINTS_INTERVAL;
            }
        }
        C0489l a4 = C0489l.m955a();
        if (ad instanceof AdView) {
            adView = (AdView) ad;
        } else {
            adView = null;
        }
        if (ad instanceof InterstitialAd) {
            interstitialAd = (InterstitialAd) ad;
        } else {
            interstitialAd = null;
        }
        Context applicationContext = activity.getApplicationContext();
        if (adSize == null) {
            a = C0481h.f945a;
        } else {
            a = C0481h.m944a(adSize, activity.getApplicationContext());
        }
        this.f895b = new C0491m(a4, ad, adView, interstitialAd, str, activity, applicationContext, viewGroup, a);
        this.f910q = new C0428ae(this);
        this.f912s = new LinkedList<>();
        this.f913t = new LinkedList<>();
        mo3683a();
        AdUtil.m1013h(this.f895b.f985f.mo3874a());
        this.f916w = new C0442d();
        this.f917x = new C0443e(this);
        this.f915v = null;
        this.f918y = null;
    }

    /* renamed from: a */
    public synchronized void mo3683a() {
        this.f899f = new AdWebView(this.f895b, this.f895b.f990k.mo3874a().mo3768b());
        this.f899f.setVisibility(8);
        this.f900g = C0482i.m948a(this, C0462a.f843c, true, this.f895b.mo3791b());
        this.f899f.setWebViewClient(this.f900g);
        if (AdUtil.f1033a < this.f895b.f980a.mo3874a().f967a.mo3874a().f968a.mo3875a().intValue() && !this.f895b.f990k.mo3874a().mo3767a()) {
            C0508b.m1026a("Disabling hardware acceleration for a banner.");
            this.f899f.mo3625b();
        }
    }

    /* renamed from: b */
    public synchronized void mo3698b() {
        if (this.f917x != null) {
            this.f917x.mo3572b();
        }
        this.f895b.f992m.mo3876a(null);
        this.f895b.f993n.mo3876a(null);
        mo3680A();
        if (this.f899f != null) {
            this.f899f.destroy();
        }
    }

    /* renamed from: a */
    public void mo3694a(String str) {
        Uri build = new Uri.Builder().encodedQuery(str).build();
        StringBuilder sb = new StringBuilder();
        HashMap<String, String> b = AdUtil.m1002b(build);
        for (String next : b.keySet()) {
            sb.append(next).append(" = ").append(b.get(next)).append("\n");
        }
        this.f919z = sb.toString().trim();
        if (TextUtils.isEmpty(this.f919z)) {
            this.f919z = null;
        }
    }

    /* renamed from: c */
    public String mo3703c() {
        return this.f919z;
    }

    /* renamed from: d */
    public synchronized void mo3704d() {
        this.f906m = false;
        C0508b.m1026a("Refreshing is no longer allowed on this AdView.");
    }

    /* renamed from: e */
    public synchronized void mo3705e() {
        if (this.f905l) {
            C0508b.m1026a("Disabling refreshing.");
            this.f901h.removeCallbacks(this.f910q);
            this.f905l = false;
        } else {
            C0508b.m1026a("Refreshing is already disabled.");
        }
    }

    /* renamed from: f */
    public synchronized void mo3706f() {
        this.f907n = false;
        if (!this.f895b.mo3790a()) {
            C0508b.m1026a("Tried to enable refreshing on something other than an AdView.");
        } else if (!this.f906m) {
            C0508b.m1026a("Refreshing disabled on this AdView");
        } else if (!this.f905l) {
            C0508b.m1026a("Enabling refreshing every " + this.f909p + " milliseconds.");
            this.f901h.postDelayed(this.f910q, this.f909p);
            this.f905l = true;
        } else {
            C0508b.m1026a("Refreshing is already enabled.");
        }
    }

    /* renamed from: g */
    public void mo3707g() {
        mo3706f();
        this.f907n = true;
    }

    /* renamed from: h */
    public C0491m mo3708h() {
        return this.f895b;
    }

    /* renamed from: i */
    public synchronized C0442d mo3709i() {
        return this.f916w;
    }

    /* renamed from: j */
    public synchronized C0467c mo3710j() {
        return this.f896c;
    }

    /* renamed from: k */
    public synchronized AdWebView mo3711k() {
        return this.f899f;
    }

    /* renamed from: l */
    public synchronized C0482i mo3712l() {
        return this.f900g;
    }

    /* renamed from: m */
    public C0480g mo3713m() {
        return this.f898e;
    }

    /* renamed from: a */
    public synchronized void mo3685a(int i) {
        this.f914u = i;
    }

    /* renamed from: n */
    public synchronized int mo3714n() {
        return this.f914u;
    }

    /* renamed from: o */
    public long mo3715o() {
        return this.f902i;
    }

    /* renamed from: p */
    public synchronized boolean mo3716p() {
        return this.f896c != null;
    }

    /* renamed from: q */
    public synchronized boolean mo3717q() {
        return this.f903j;
    }

    /* renamed from: r */
    public synchronized boolean mo3718r() {
        return this.f904k;
    }

    /* renamed from: s */
    public synchronized boolean mo3719s() {
        return this.f905l;
    }

    /* renamed from: a */
    public synchronized void mo3690a(AdRequest adRequest) {
        if (mo3716p()) {
            C0508b.m1036e("loadAd called while the ad is already loading, so aborting.");
        } else if (AdActivity.isShowing()) {
            C0508b.m1036e("loadAd called while an interstitial or landing page is displayed, so aborting");
        } else if (AdUtil.m1007c(this.f895b.f985f.mo3874a()) && AdUtil.m1004b(this.f895b.f985f.mo3874a())) {
            if (C0430ag.m694a(this.f895b.f985f.mo3874a(), this.f908o.getLong("GoogleAdMobDoritosLife", TapjoyConstants.THROTTLE_GET_TAP_POINTS_INTERVAL))) {
                C0430ag.m690a(this.f895b.f984e.mo3877a());
            }
            this.f904k = false;
            this.f912s.clear();
            this.f897d = adRequest;
            if (this.f916w.mo3558a()) {
                this.f917x.mo3567a(this.f916w.mo3559b(), adRequest);
            } else {
                this.f896c = new C0467c(this);
                this.f896c.mo3660a(adRequest);
            }
        }
    }

    /* renamed from: a */
    public synchronized void mo3689a(AdRequest.ErrorCode errorCode) {
        this.f896c = null;
        if (errorCode == AdRequest.ErrorCode.NETWORK_ERROR) {
            mo3684a(60.0f);
            if (!mo3719s()) {
                mo3707g();
            }
        }
        if (this.f895b.mo3791b()) {
            if (errorCode == AdRequest.ErrorCode.NO_FILL) {
                this.f898e.mo3736B();
            } else if (errorCode == AdRequest.ErrorCode.NETWORK_ERROR) {
                this.f898e.mo3766z();
            }
        }
        C0508b.m1032c("onFailedToReceiveAd(" + errorCode + ")");
        AdListener a = this.f895b.f992m.mo3875a();
        if (a != null) {
            a.onFailedToReceiveAd(this.f895b.f987h.mo3874a(), errorCode);
        }
    }

    /* renamed from: a */
    public synchronized void mo3691a(C0440c cVar) {
        this.f896c = null;
        if (cVar.mo3550d()) {
            mo3684a((float) cVar.mo3551e());
            if (!this.f905l) {
                mo3706f();
            }
        } else if (this.f905l) {
            mo3705e();
        }
        this.f917x.mo3567a(cVar, this.f897d);
    }

    /* renamed from: a */
    public synchronized void mo3688a(View view, C0455h hVar, C0452f fVar, boolean z) {
        C0508b.m1026a("AdManager.onReceiveGWhirlAd() called.");
        this.f904k = true;
        this.f918y = fVar;
        if (this.f895b.mo3790a()) {
            mo3687a(view);
            m835a(fVar, Boolean.valueOf(z));
        }
        this.f917x.mo3576d(hVar);
        AdListener a = this.f895b.f992m.mo3875a();
        if (a != null) {
            a.onReceiveAd(this.f895b.f987h.mo3874a());
        }
    }

    /* renamed from: a */
    public synchronized void mo3692a(C0452f fVar, boolean z) {
        C0508b.m1026a(String.format(Locale.US, "AdManager.onGWhirlAdClicked(%b) called.", new Object[]{Boolean.valueOf(z)}));
        m838b(fVar, Boolean.valueOf(z));
    }

    /* renamed from: b */
    public synchronized void mo3700b(C0440c cVar) {
        C0508b.m1026a("AdManager.onGWhirlNoFill() called.");
        m836a(cVar.mo3555i(), cVar.mo3549c());
        AdListener a = this.f895b.f992m.mo3875a();
        if (a != null) {
            a.onFailedToReceiveAd(this.f895b.f987h.mo3874a(), AdRequest.ErrorCode.NO_FILL);
        }
    }

    /* renamed from: t */
    public synchronized void mo3720t() {
        this.f898e.mo3737C();
        C0508b.m1032c("onDismissScreen()");
        AdListener a = this.f895b.f992m.mo3875a();
        if (a != null) {
            a.onDismissScreen(this.f895b.f987h.mo3874a());
        }
    }

    /* renamed from: u */
    public synchronized void mo3721u() {
        C0508b.m1032c("onPresentScreen()");
        AdListener a = this.f895b.f992m.mo3875a();
        if (a != null) {
            a.onPresentScreen(this.f895b.f987h.mo3874a());
        }
    }

    /* renamed from: v */
    public synchronized void mo3722v() {
        C0508b.m1032c("onLeaveApplication()");
        AdListener a = this.f895b.f992m.mo3875a();
        if (a != null) {
            a.onLeaveApplication(this.f895b.f987h.mo3874a());
        }
    }

    /* renamed from: a */
    public synchronized void mo3695a(String str, String str2) {
        AppEventListener a = this.f895b.f993n.mo3875a();
        if (a != null) {
            a.onAppEvent(this.f895b.f987h.mo3874a(), str, str2);
        }
    }

    /* renamed from: w */
    public void mo3723w() {
        this.f898e.mo3746f();
        mo3681B();
    }

    /* renamed from: a */
    private void m835a(C0452f fVar, Boolean bool) {
        List d = fVar.mo3588d();
        if (d == null) {
            d = new ArrayList();
            d.add("http://e.admob.com/imp?ad_loc=@gw_adlocid@&qdata=@gw_qdata@&ad_network_id=@gw_adnetid@&js=@gw_sdkver@&session_id=@gw_sessid@&seq_num=@gw_seqnum@&nr=@gw_adnetrefresh@&adt=@gw_adt@&aec=@gw_aec@");
        }
        String b = fVar.mo3586b();
        m837a(d, fVar.mo3585a(), b, fVar.mo3587c(), bool, this.f898e.mo3744d(), this.f898e.mo3745e());
    }

    /* renamed from: b */
    private void m838b(C0452f fVar, Boolean bool) {
        List e = fVar.mo3589e();
        if (e == null) {
            e = new ArrayList();
            e.add("http://e.admob.com/clk?ad_loc=@gw_adlocid@&qdata=@gw_qdata@&ad_network_id=@gw_adnetid@&js=@gw_sdkver@&session_id=@gw_sessid@&seq_num=@gw_seqnum@&nr=@gw_adnetrefresh@");
        }
        m837a(e, fVar.mo3585a(), fVar.mo3586b(), fVar.mo3587c(), bool, (String) null, (String) null);
    }

    /* renamed from: a */
    private void m836a(List<String> list, String str) {
        List<String> list2;
        if (list == null) {
            list2 = new ArrayList<>();
            list2.add("http://e.admob.com/nofill?ad_loc=@gw_adlocid@&qdata=@gw_qdata@&js=@gw_sdkver@&session_id=@gw_sessid@&seq_num=@gw_seqnum@&adt=@gw_adt@&aec=@gw_aec@");
        } else {
            list2 = list;
        }
        m837a(list2, (String) null, (String) null, str, (Boolean) null, this.f898e.mo3744d(), this.f898e.mo3745e());
    }

    /* renamed from: a */
    private void m837a(List<String> list, String str, String str2, String str3, Boolean bool, String str4, String str5) {
        String a = AdUtil.m986a(this.f895b.f985f.mo3874a());
        C0439b a2 = C0439b.m700a();
        String bigInteger = a2.mo3545b().toString();
        String bigInteger2 = a2.mo3546c().toString();
        for (String a3 : list) {
            new Thread(new C0427ac(C0453g.m750a(a3, this.f895b.f983d.mo3874a(), bool, a, str, str2, str3, bigInteger, bigInteger2, str4, str5), this.f895b.f985f.mo3874a())).start();
        }
        this.f898e.mo3742b();
    }

    /* renamed from: x */
    public synchronized void mo3724x() {
        Activity a = this.f895b.f984e.mo3877a();
        if (a == null) {
            C0508b.m1036e("activity was null while trying to ping tracking URLs.");
        } else {
            Iterator it = this.f912s.iterator();
            while (it.hasNext()) {
                new Thread(new C0427ac((String) it.next(), a.getApplicationContext())).start();
            }
        }
    }

    /* renamed from: a */
    public void mo3693a(Runnable runnable) {
        this.f901h.post(runnable);
    }

    /* renamed from: y */
    public synchronized void mo3725y() {
        if (this.f897d == null) {
            C0508b.m1026a("Tried to refresh before calling loadAd().");
        } else if (this.f895b.mo3790a()) {
            if (!this.f895b.f988i.mo3874a().isShown() || !AdUtil.m1009d()) {
                C0508b.m1026a("Not refreshing because the ad is not visible.");
            } else {
                C0508b.m1032c("Refreshing ad.");
                mo3690a(this.f897d);
            }
            if (this.f907n) {
                mo3705e();
            } else {
                this.f901h.postDelayed(this.f910q, this.f909p);
            }
        } else {
            C0508b.m1026a("Tried to refresh an ad that wasn't an AdView.");
        }
    }

    /* renamed from: a */
    public void mo3686a(long j) {
        synchronized (f894a) {
            SharedPreferences.Editor edit = this.f908o.edit();
            edit.putLong("Timeout" + this.f895b.f983d, j);
            edit.commit();
            if (this.f911r) {
                this.f902i = j;
            }
        }
    }

    /* renamed from: a */
    public synchronized void mo3697a(boolean z) {
        this.f903j = z;
    }

    /* renamed from: a */
    public void mo3687a(View view) {
        this.f895b.f986g.mo3874a().removeAllViews();
        this.f895b.f986g.mo3874a().addView(view);
    }

    /* renamed from: a */
    public synchronized void mo3684a(float f) {
        long j = this.f909p;
        this.f909p = (long) (1000.0f * f);
        if (mo3719s() && this.f909p != j) {
            mo3705e();
            mo3706f();
        }
    }

    /* renamed from: b */
    public synchronized void mo3699b(long j) {
        if (j > 0) {
            this.f908o.edit().putLong("GoogleAdMobDoritosLife", j).commit();
        }
    }

    /* renamed from: z */
    public synchronized void mo3726z() {
        C0506a.m1018a(this.f895b.mo3791b());
        if (this.f904k) {
            this.f904k = false;
            if (this.f915v == null) {
                C0508b.m1030b("isMediationFlag is null in show() with isReady() true. we should have an ad and know whether this is a mediation request or not. ");
            } else if (!this.f915v.booleanValue()) {
                AdActivity.launchAdActivity(this, new C0476e("interstitial"));
                mo3724x();
            } else if (this.f917x.mo3575c()) {
                m835a(this.f918y, (Boolean) false);
            }
        } else {
            C0508b.m1032c("Cannot show interstitial because it is not loaded and ready.");
        }
    }

    /* renamed from: A */
    public synchronized void mo3680A() {
        if (this.f896c != null) {
            this.f896c.mo3656a();
            this.f896c = null;
        }
        if (this.f899f != null) {
            this.f899f.stopLoading();
        }
    }

    /* access modifiers changed from: protected */
    /* renamed from: B */
    public synchronized void mo3681B() {
        Activity a = this.f895b.f984e.mo3877a();
        if (a == null) {
            C0508b.m1036e("activity was null while trying to ping click tracking URLs.");
        } else {
            Iterator it = this.f913t.iterator();
            while (it.hasNext()) {
                new Thread(new C0427ac((String) it.next(), a.getApplicationContext())).start();
            }
        }
    }

    /* access modifiers changed from: protected */
    /* renamed from: C */
    public synchronized void mo3682C() {
        this.f896c = null;
        this.f904k = true;
        this.f899f.setVisibility(0);
        if (this.f895b.mo3790a()) {
            mo3687a((View) this.f899f);
        }
        this.f898e.mo3747g();
        if (this.f895b.mo3790a()) {
            mo3724x();
        }
        C0508b.m1032c("onReceiveAd()");
        AdListener a = this.f895b.f992m.mo3875a();
        if (a != null) {
            a.onReceiveAd(this.f895b.f987h.mo3874a());
        }
    }

    /* access modifiers changed from: protected */
    /* renamed from: b */
    public synchronized void mo3701b(String str) {
        C0508b.m1026a("Adding a tracking URL: " + str);
        this.f912s.add(str);
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public synchronized void mo3696a(LinkedList<String> linkedList) {
        Iterator it = linkedList.iterator();
        while (it.hasNext()) {
            C0508b.m1026a("Adding a click tracking URL: " + ((String) it.next()));
        }
        this.f913t = linkedList;
    }

    /* renamed from: b */
    public void mo3702b(boolean z) {
        this.f915v = Boolean.valueOf(z);
    }
}
