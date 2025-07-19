package com.chartboost.sdk;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Handler;
import android.util.Log;
import com.chartboost.sdk.C0060a;
import com.chartboost.sdk.Libraries.C0053d;
import com.chartboost.sdk.Libraries.C0054e;
import com.chartboost.sdk.Libraries.CBOrientation;
import com.chartboost.sdk.impl.C0069a;
import com.chartboost.sdk.impl.C0181j;
import com.chartboost.sdk.impl.C0186k;
import com.chartboost.sdk.impl.C0188l;
import com.chartboost.sdk.impl.C0189m;
import com.facebook.internal.ServerProtocol;
import com.getjar.sdk.utilities.Constants;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;
import org.json.JSONException;
import org.json.JSONObject;

/* renamed from: com.chartboost.sdk.Chartboost */
public final class C0038Chartboost {

    /* renamed from: b */
    private static C0038Chartboost f4b = null;

    /* renamed from: A */
    private C0189m.C0191a f5A = new C0189m.C0191a() {
        /* renamed from: a */
        public void mo1160a(String str) {
            C0060a a = C0038Chartboost.this.m31e();
            if (a != null && a.mo1226a()) {
                a.mo1225a(true);
            }
        }
    };

    /* renamed from: B */
    private C0069a.C0074a f6B = new C0069a.C0074a() {
        /* renamed from: a */
        public void mo1161a(C0069a aVar) {
            if (aVar.f104c == C0069a.C0075b.CBImpressionStateWaitingForDisplay) {
                aVar.f104c = C0069a.C0075b.CBImpressionStateOther;
                if (aVar.f105d == C0069a.C0076c.CBImpressionTypeInterstitial) {
                    C0038Chartboost.this.m22b(aVar);
                } else if (aVar.f105d == C0069a.C0076c.CBImpressionTypeMoreApps) {
                    C0038Chartboost.this.m26c(aVar);
                }
            } else if (aVar.f104c == C0069a.C0075b.CBImpressionStateWaitingForCaching) {
                if (aVar.f105d == C0069a.C0076c.CBImpressionTypeInterstitial && aVar.f106e != null) {
                    C0038Chartboost.this.f16j.put(aVar.f106e, aVar);
                    if (C0038Chartboost.this.getDelegate() != null) {
                        C0038Chartboost.this.getDelegate().didCacheInterstitial(aVar.f106e);
                    }
                } else if (aVar.f105d == C0069a.C0076c.CBImpressionTypeMoreApps) {
                    if (C0038Chartboost.this.getDelegate() != null) {
                        C0038Chartboost.this.getDelegate().didCacheMoreApps();
                    }
                    if (C0038Chartboost.this.f17k != null) {
                        C0038Chartboost.this.f17k = null;
                    }
                    C0038Chartboost.this.f17k = aVar;
                }
                aVar.f104c = C0069a.C0075b.CBImpressionStateCached;
            }
        }

        /* renamed from: b */
        public void mo1163b(C0069a aVar) {
            C0060a a;
            C0060a a2;
            C0038Chartboost.this.f18l = null;
            if (aVar.f105d == C0069a.C0076c.CBImpressionTypeInterstitial) {
                if (C0038Chartboost.this.getDelegate() != null) {
                    C0038Chartboost.this.getDelegate().didDismissInterstitial(aVar.f106e);
                }
                if (C0038Chartboost.this.getDelegate() != null) {
                    C0038Chartboost.this.getDelegate().didCloseInterstitial(aVar.f106e);
                }
                if (aVar.f104c == C0069a.C0075b.CBImpressionStateDisplayedByDefaultController && (a2 = C0038Chartboost.this.m31e()) != null) {
                    a2.mo1224a(aVar, true);
                }
            } else if (aVar.f105d == C0069a.C0076c.CBImpressionTypeMoreApps) {
                if (C0038Chartboost.this.getDelegate() != null) {
                    C0038Chartboost.this.getDelegate().didDismissMoreApps();
                }
                if (C0038Chartboost.this.getDelegate() != null) {
                    C0038Chartboost.this.getDelegate().didCloseMoreApps();
                }
                if (aVar.f104c == C0069a.C0075b.CBImpressionStateDisplayedByDefaultController && (a = C0038Chartboost.this.m31e()) != null) {
                    a.mo1224a(aVar, true);
                }
            }
        }

        /* renamed from: a */
        private void m45a(JSONObject jSONObject, String str, C0186k kVar) {
            if (jSONObject != null) {
                try {
                    if (jSONObject.getString(str) != null) {
                        kVar.mo1467a(str, jSONObject.optString(str));
                    }
                } catch (JSONException e) {
                }
            }
        }

        /* renamed from: a */
        public void mo1162a(C0069a aVar, final String str, JSONObject jSONObject) {
            C0060a a;
            C0060a a2;
            boolean z = false;
            C0038Chartboost.this.f18l = null;
            boolean z2 = str != null && !str.equals("") && !str.equals("null");
            if (aVar.f105d == C0069a.C0076c.CBImpressionTypeInterstitial) {
                if (C0038Chartboost.this.getDelegate() != null) {
                    C0038Chartboost.this.getDelegate().didDismissInterstitial(aVar.f106e);
                }
                if (C0038Chartboost.this.getDelegate() != null) {
                    C0038Chartboost.this.getDelegate().didClickInterstitial(aVar.f106e);
                }
                if (aVar.f104c == C0069a.C0075b.CBImpressionStateDisplayedByDefaultController && (a2 = C0038Chartboost.this.m31e()) != null) {
                    if (!z2) {
                        z = true;
                    }
                    a2.mo1224a(aVar, z);
                }
            } else if (aVar.f105d == C0069a.C0076c.CBImpressionTypeMoreApps) {
                if (C0038Chartboost.this.getDelegate() != null) {
                    C0038Chartboost.this.getDelegate().didDismissMoreApps();
                }
                if (C0038Chartboost.this.getDelegate() != null) {
                    C0038Chartboost.this.getDelegate().didClickMoreApps();
                }
                if (aVar.f104c == C0069a.C0075b.CBImpressionStateDisplayedByDefaultController && (a = C0038Chartboost.this.m31e()) != null) {
                    if (!z2) {
                        z = true;
                    }
                    a.mo1224a(aVar, z);
                }
            }
            C0186k kVar = new C0186k("api", "click");
            kVar.mo1466a((Context) C0038Chartboost.this.f12f == null ? C0038Chartboost.this.mo1124b() : C0038Chartboost.this.f12f);
            m45a(aVar.f102a, "to", kVar);
            m45a(aVar.f102a, "cgn", kVar);
            m45a(aVar.f102a, "creative", kVar);
            m45a(aVar.f102a, "ad_id", kVar);
            m45a(jSONObject, "cgn", kVar);
            m45a(jSONObject, "creative", kVar);
            m45a(jSONObject, ServerProtocol.DIALOG_PARAM_TYPE, kVar);
            m45a(jSONObject, "more_type", kVar);
            kVar.mo1471c(C0038Chartboost.this.getAppID(), C0038Chartboost.this.getAppSignature());
            if (z2) {
                kVar.f311h = new C0186k.C0187a() {
                    /* renamed from: a */
                    public void mo1165a(JSONObject jSONObject) {
                        C0038Chartboost.sharedChartboost().m17a(jSONObject, str);
                    }
                };
                C0038Chartboost.this.mo1121a(new C0060a.C0062a(true, (C0069a) null));
            }
            C0038Chartboost.this.f14h.mo1457a(kVar);
        }

        /* renamed from: c */
        public void mo1164c(C0069a aVar) {
            C0038Chartboost.this.m14a(aVar.f105d, aVar.f105d == C0069a.C0076c.CBImpressionTypeInterstitial ? aVar.f106e : null);
        }
    };

    /* renamed from: C */
    private C0181j.C0185c f7C = new C0181j.C0185c() {
        /* renamed from: a */
        public void mo1166a(C0186k kVar) {
            if (kVar.f305b.equals("get")) {
                C0038Chartboost.this.m14a(C0069a.C0076c.CBImpressionTypeInterstitial, kVar.f308e.optString("location", "Default"));
            } else if (kVar.f305b.equals("more")) {
                C0038Chartboost.this.m14a(C0069a.C0076c.CBImpressionTypeMoreApps, kVar.f308e.optString("location", "Default"));
            }
            C0060a a = C0038Chartboost.this.m31e();
            if (a != null && a.mo1226a()) {
                a.mo1225a(true);
            }
        }

        /* renamed from: a */
        public void mo1167a(JSONObject jSONObject, C0186k kVar) {
            if (kVar.f311h != null) {
                kVar.f311h.mo1165a(jSONObject);
            }
        }
    };

    /* renamed from: a */
    protected Handler f8a = new Handler();

    /* renamed from: c */
    private C0060a f9c;

    /* renamed from: d */
    private C0189m f10d = new C0189m(this.f5A);

    /* renamed from: e */
    private Context f11e = null;
    /* access modifiers changed from: private */

    /* renamed from: f */
    public Activity f12f = null;
    /* access modifiers changed from: private */

    /* renamed from: g */
    public CBImpressionActivity f13g = null;
    /* access modifiers changed from: private */

    /* renamed from: h */
    public C0181j f14h = new C0181j((String) null, this.f7C, (String) null);

    /* renamed from: i */
    private List<C0060a.C0062a> f15i = new ArrayList();
    /* access modifiers changed from: private */

    /* renamed from: j */
    public Map<String, C0069a> f16j = new HashMap();
    /* access modifiers changed from: private */

    /* renamed from: k */
    public C0069a f17k = null;
    /* access modifiers changed from: private */

    /* renamed from: l */
    public C0069a f18l;

    /* renamed from: m */
    private String f19m;

    /* renamed from: n */
    private String f20n;
    /* access modifiers changed from: private */

    /* renamed from: o */
    public ChartboostDelegate f21o;

    /* renamed from: p */
    private int f22p = 30000;

    /* renamed from: q */
    private boolean f23q = false;

    /* renamed from: r */
    private CBOrientation f24r;

    /* renamed from: s */
    private boolean f25s;

    /* renamed from: t */
    private boolean f26t = false;

    /* renamed from: u */
    private Map<Integer, Boolean> f27u = new HashMap();

    /* renamed from: v */
    private Map<Integer, C0060a> f28v = new HashMap();

    /* renamed from: w */
    private boolean f29w = false;

    /* renamed from: x */
    private long f30x = 0;

    /* renamed from: y */
    private boolean f31y = false;

    /* renamed from: z */
    private Runnable f32z = new C0046a(this, (C0046a) null);

    public static synchronized C0038Chartboost sharedChartboost() {
        C0038Chartboost chartboost;
        synchronized (C0038Chartboost.class) {
            if (f4b == null) {
                f4b = new C0038Chartboost();
            }
            chartboost = f4b;
        }
        return chartboost;
    }

    private C0038Chartboost() {
    }

    public void startSession() {
        if (this.f12f == null) {
            throw new IllegalStateException("The context must be set through the Chartboost method onCreate() before calling startSession().");
        } else if (((long) (((double) System.nanoTime()) / 1000000.0d)) - this.f30x >= 10000) {
            SharedPreferences a = C0053d.m79a();
            SharedPreferences.Editor edit = a.edit();
            edit.putInt("cbPrefSessionCount", a.getInt("cbPrefSessionCount", 0) + 1);
            edit.commit();
            C0186k kVar = new C0186k("api", "install");
            kVar.mo1466a((Context) this.f12f);
            kVar.mo1471c(getAppID(), getAppSignature());
            kVar.f311h = new C0186k.C0187a() {
                /* renamed from: a */
                public void mo1165a(JSONObject jSONObject) {
                    String optString;
                    if (C0053d.m84a(C0038Chartboost.this.getContext()) && (optString = jSONObject.optString("latest-sdk-version")) != null && !optString.equals("") && !optString.equals("3.1.5")) {
                        Log.w("Chartboost", String.format("WARNING: you have an outdated version of the SDK (Current: %s, Latest: %s). Get the latest version at chartboost.com/support/sdk#android", new Object[]{optString, "3.1.5"}));
                    }
                }
            };
            this.f14h.mo1457a(kVar);
        }
    }

    public Context getContext() {
        return this.f11e;
    }

    public void onCreate(Activity activity, String appId, String appSignature, ChartboostDelegate chartBoostDelegate) {
        if (!C0053d.m91d()) {
            throw new IllegalStateException("It is illegal to call this method from any thread other than the UI thread. Please call it from the onCreate() method of your host activity.");
        }
        if (!(this.f12f == null || !m29d() || this.f12f == activity)) {
            onStop(this.f12f);
            m4a(this.f12f, false);
        }
        this.f8a.removeCallbacks(this.f32z);
        m24c(activity);
        setAppID(appId);
        setAppSignature(appSignature);
        setDelegate(chartBoostDelegate);
    }

    /* renamed from: c */
    private void m24c(Activity activity) {
        this.f12f = activity;
        this.f11e = activity.getApplicationContext();
    }

    /* renamed from: d */
    private boolean m29d() {
        return m30d(this.f12f);
    }

    /* renamed from: d */
    private boolean m30d(Activity activity) {
        if (activity == null) {
            return false;
        }
        Boolean bool = this.f27u.get(Integer.valueOf(activity.hashCode()));
        return bool != null ? bool.booleanValue() : false;
    }

    /* renamed from: a */
    private void m4a(Activity activity, boolean z) {
        if (activity != null) {
            this.f27u.put(Integer.valueOf(activity.hashCode()), Boolean.valueOf(z));
        }
    }

    /* renamed from: b */
    private void m20b(Activity activity, boolean z) {
        C0060a aVar;
        int hashCode = activity.hashCode();
        C0060a aVar2 = this.f28v.get(Integer.valueOf(hashCode));
        if (aVar2 == null && z) {
            if (this.f9c != null) {
                aVar = this.f9c;
                this.f9c = null;
                aVar.mo1221a(activity);
            } else {
                aVar = new C0060a(this, activity);
            }
            this.f28v.put(Integer.valueOf(hashCode), aVar);
        } else if (aVar2 != null && !z) {
            this.f9c = this.f28v.remove(Integer.valueOf(hashCode));
        }
    }

    /* access modifiers changed from: private */
    /* renamed from: e */
    public C0060a m31e() {
        if (mo1124b() == null) {
            return null;
        }
        return this.f28v.get(Integer.valueOf(mo1124b().hashCode()));
    }

    public void onStart(Activity activity) {
        if (!C0053d.m91d()) {
            throw new IllegalStateException("It is illegal to call this method from any thread other than the UI thread. Please call it from the onStart() method of your host activity.");
        }
        this.f8a.removeCallbacks(this.f32z);
        m4a(activity, true);
        m24c(activity);
        if (!this.f23q) {
            mo1119a(activity);
        }
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public void mo1119a(Activity activity) {
        boolean z;
        this.f11e = activity.getApplicationContext();
        if (!(activity instanceof CBImpressionActivity)) {
            this.f12f = activity;
            m4a(this.f12f, true);
        } else {
            this.f13g = (CBImpressionActivity) activity;
        }
        this.f8a.removeCallbacks(this.f32z);
        if (activity != null && activity == mo1124b()) {
            m20b(activity, true);
            if (activity instanceof CBImpressionActivity) {
                C0060a e = m31e();
                if (e != null) {
                    for (int i = 0; i < this.f15i.size(); i++) {
                        e.mo1222a(this.f15i.get(i));
                    }
                    this.f15i.clear();
                }
                this.f31y = false;
            }
            if (this.f29w) {
                this.f29w = false;
                z = true;
            } else {
                z = false;
            }
            if (this.f18l != null && this.f18l.f104c == C0069a.C0075b.CBImpressionStateWaitingForDisplay && this.f18l.mo1249a()) {
                z = false;
            }
            if (z) {
                mo1121a(new C0060a.C0062a(true, (C0069a) null));
            }
        }
    }

    public void onStop(Activity activity) {
        if (!C0053d.m91d()) {
            throw new IllegalStateException("It is illegal to call this method from any thread other than the UI thread. Please call it from the onStop() method of your host activity.");
        }
        if (!this.f23q) {
            mo1125b(activity);
        }
        if (!(activity instanceof CBImpressionActivity)) {
            m4a(activity, false);
        }
        this.f30x = (long) (((double) System.nanoTime()) / 1000000.0d);
    }

    /* access modifiers changed from: protected */
    /* renamed from: b */
    public void mo1125b(Activity activity) {
        C0060a e = m31e();
        if (activity == mo1124b() && e != null) {
            m20b(activity, false);
            this.f29w = false;
            if (e.mo1226a()) {
                e.mo1225a(false);
                this.f29w = true;
            }
            if (this.f18l != null) {
                e.mo1223a(this.f18l);
            }
        }
        if (!(activity instanceof CBImpressionActivity)) {
            m4a(this.f12f, false);
        }
    }

    public boolean onBackPressed() {
        if (!C0053d.m91d()) {
            throw new IllegalStateException("It is illegal to call this method from any thread other than the UI thread. Please call it from the onBackPressed() method of your host activity.");
        } else if (this.f12f == null) {
            throw new IllegalStateException("The Chartboost methods onCreate(), onStart(), onStop(), and onDestroy() must be called in the corresponding methods of your activity in order for Chartboost to function properly.");
        } else if (!this.f23q) {
            return mo1123a();
        } else {
            if (!this.f31y) {
                return false;
            }
            this.f31y = false;
            mo1123a();
            return true;
        }
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public boolean mo1123a() {
        if (this.f18l == null || this.f18l.f104c != C0069a.C0075b.CBImpressionStateDisplayedByDefaultController) {
            C0060a e = m31e();
            if (e == null || !e.mo1226a()) {
                return false;
            }
            e.mo1225a(true);
            return true;
        }
        m34f();
        return true;
    }

    public void onDestroy(Activity activity) {
        this.f8a.postDelayed(this.f32z, 10000);
    }

    /* renamed from: com.chartboost.sdk.Chartboost$a */
    private class C0046a implements Runnable {

        /* renamed from: a */
        final /* synthetic */ C0038Chartboost f44a;

        /* renamed from: b */
        private int f45b;

        /* renamed from: c */
        private int f46c;

        /* renamed from: d */
        private int f47d;

        private C0046a(C0038Chartboost chartboost) {
            int i = -1;
            this.f44a = chartboost;
            this.f45b = chartboost.f13g == null ? -1 : chartboost.f13g.hashCode();
            this.f46c = chartboost.f12f == null ? -1 : chartboost.f12f.hashCode();
            this.f47d = chartboost.f21o != null ? chartboost.f21o.hashCode() : i;
        }

        /* synthetic */ C0046a(C0038Chartboost chartboost, C0046a aVar) {
            this(chartboost);
        }

        public void run() {
            if (this.f44a.f12f != null && this.f44a.f12f.hashCode() == this.f46c) {
                this.f44a.f12f = null;
            }
            if (this.f44a.f13g != null && this.f44a.f13g.hashCode() == this.f45b) {
                this.f44a.f13g = null;
            }
            if (this.f44a.f21o != null && this.f44a.f21o.hashCode() == this.f47d) {
                this.f44a.f21o = null;
            }
            this.f44a.clearImageCache();
        }
    }

    public void clearImageCache() {
        C0054e.m94a().mo1211b();
    }

    public void clearCache() {
        this.f16j = new HashMap();
    }

    public void cacheInterstitial() {
        cacheInterstitial("Default");
    }

    public void cacheInterstitial(String location) {
        if (this.f12f == null) {
            throw new IllegalStateException("The context must be set through the Chartboost method onCreate() before calling cacheInterstitial().");
        } else if (getDelegate() == null || getDelegate().shouldRequestInterstitialsInFirstSession() || C0053d.m79a().getInt("cbPrefSessionCount", 0) > 1) {
            m15a(location, true);
        }
    }

    public void showInterstitial() {
        showInterstitial("Default");
    }

    public void showInterstitial(String location) {
        if (this.f12f == null) {
            throw new IllegalStateException("The context must be set through the Chartboost method onCreate() before calling showInterstitial().");
        } else if (getDelegate() == null || getDelegate().shouldRequestInterstitialsInFirstSession() || C0053d.m79a().getInt("cbPrefSessionCount", 0) != 1) {
            this.f8a.post(new C0047b(location));
        }
    }

    /* renamed from: com.chartboost.sdk.Chartboost$b */
    private class C0047b implements Runnable {

        /* renamed from: b */
        private String f49b;

        public C0047b(String str) {
            this.f49b = str;
        }

        public void run() {
            if (C0038Chartboost.this.hasCachedInterstitial(this.f49b)) {
                C0038Chartboost.this.m22b((C0069a) C0038Chartboost.this.f16j.get(this.f49b));
            } else {
                C0038Chartboost.this.m15a(this.f49b, false);
            }
        }
    }

    public boolean hasCachedInterstitial() {
        return hasCachedInterstitial("Default");
    }

    public boolean hasCachedMoreApps() {
        return this.f17k != null;
    }

    public boolean hasCachedInterstitial(String location) {
        C0069a aVar = this.f16j.get(location);
        if (aVar == null) {
            return false;
        }
        return TimeUnit.MILLISECONDS.toSeconds(new Date().getTime() - aVar.f103b.getTime()) < Constants.LICENSE_REFRESH_INTERVAL;
    }

    public void cacheMoreApps() {
        if (this.f12f == null) {
            throw new IllegalStateException("The context must be set through the Chartboost method onCreate() before calling cacheMoreApps().");
        }
        m18a(true);
    }

    public void showMoreApps() {
        if (this.f12f == null) {
            throw new IllegalStateException("The context must be set through the Chartboost method onCreate() before calling showMoreApps().");
        }
        this.f8a.post(new C0048c(this, (C0048c) null));
    }

    /* renamed from: com.chartboost.sdk.Chartboost$c */
    private class C0048c implements Runnable {
        private C0048c() {
        }

        /* synthetic */ C0048c(C0038Chartboost chartboost, C0048c cVar) {
            this();
        }

        public void run() {
            if (C0038Chartboost.this.f17k != null) {
                C0038Chartboost.this.m26c(C0038Chartboost.this.f17k);
            } else {
                C0038Chartboost.this.m18a(false);
            }
        }
    }

    public int getTimeout() {
        return this.f22p;
    }

    public void setTimeout(int timeout) {
        this.f22p = timeout;
    }

    public String getAppID() {
        return this.f19m;
    }

    public void setAppID(String appId) {
        this.f19m = appId;
    }

    public String getAppSignature() {
        return this.f20n;
    }

    public void setAppSignature(String appSignature) {
        this.f20n = appSignature;
    }

    public ChartboostDelegate getDelegate() {
        return this.f21o;
    }

    public void setDelegate(ChartboostDelegate delegate) {
        this.f21o = delegate;
    }

    public boolean getImpressionsUseActivities() {
        return this.f23q;
    }

    public void setImpressionsUseActivities(boolean impressionsUseActivities) {
        this.f23q = impressionsUseActivities;
    }

    public void setIdentityTrackingDisabledOnThisDevice(boolean disabled) {
        SharedPreferences.Editor edit = C0053d.m79a().edit();
        edit.putBoolean("cbIdentityTrackingDisabled", disabled);
        edit.commit();
    }

    public boolean isIdentityTrackingDisabledOnThisDevice() {
        return C0053d.m90c();
    }

    public void setOrientation(CBOrientation _orientation) {
        this.f25s = _orientation != CBOrientation.UNSPECIFIED;
        this.f24r = _orientation;
    }

    public CBOrientation orientation() {
        if (getContext() == null) {
            throw new IllegalStateException("The context must be set through the Chartboost method onCreate() before calling orientation().");
        } else if (!this.f25s || this.f24r == CBOrientation.UNSPECIFIED) {
            return C0053d.m89c(getContext());
        } else {
            return this.f24r;
        }
    }

    public CBOrientation.Difference getForcedOrientationDifference() {
        if (!this.f25s) {
            return CBOrientation.Difference.ANGLE_0;
        }
        CBOrientation c = C0053d.m89c(getContext());
        CBOrientation orientation = orientation();
        if (orientation == CBOrientation.UNSPECIFIED || orientation == c) {
            return CBOrientation.Difference.ANGLE_0;
        }
        if (orientation == c.rotate90()) {
            return CBOrientation.Difference.ANGLE_90;
        }
        if (orientation == c.rotate180()) {
            return CBOrientation.Difference.ANGLE_180;
        }
        return CBOrientation.Difference.ANGLE_270;
    }

    /* renamed from: f */
    private void m34f() {
        if (this.f18l != null) {
            this.f6B.mo1163b(this.f18l);
        }
    }

    /* access modifiers changed from: protected */
    /* renamed from: b */
    public Activity mo1124b() {
        if (this.f23q) {
            return this.f13g;
        }
        return this.f12f;
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public void mo1120a(CBImpressionActivity cBImpressionActivity) {
        if (!this.f26t) {
            this.f11e = cBImpressionActivity.getApplicationContext();
            this.f13g = cBImpressionActivity;
            this.f26t = true;
        }
        this.f8a.removeCallbacks(this.f32z);
    }

    /* access modifiers changed from: protected */
    /* renamed from: c */
    public void mo1126c() {
        if (this.f26t) {
            this.f11e = this.f12f.getApplicationContext();
            this.f13g = null;
            this.f26t = false;
        }
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public void mo1121a(C0060a.C0062a aVar) {
        boolean z;
        boolean z2 = true;
        if (getImpressionsUseActivities()) {
            C0060a e = m31e();
            if (mo1124b() != null && this.f26t && e != null) {
                e.mo1222a(aVar);
            } else if (m29d()) {
                this.f15i.add(aVar);
                Intent intent = new Intent(this.f12f, CBImpressionActivity.class);
                boolean z3 = (this.f12f.getWindow().getAttributes().flags & 1024) != 0;
                if ((this.f12f.getWindow().getAttributes().flags & 2048) != 0) {
                    z = true;
                } else {
                    z = false;
                }
                if (!z3 || z) {
                    z2 = false;
                }
                intent.putExtra(CBImpressionActivity.PARAM_FULLSCREEN, z2);
                try {
                    this.f12f.startActivity(intent);
                    this.f31y = true;
                } catch (ActivityNotFoundException e2) {
                    throw new RuntimeException("Chartboost impression activity not declared in manifest. Please add the following inside your manifest's <application> tag: \n<activity android:name=\"com.chartboost.sdk.CBImpressionActivity\" android:theme=\"@android:style/Theme.Translucent.NoTitleBar\" android:excludeFromRecents=\"true\" />");
                }
            }
        } else {
            C0060a e3 = m31e();
            if (e3 != null) {
                e3.mo1222a(aVar);
            }
        }
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public void mo1122a(C0069a aVar) {
        this.f18l = aVar;
    }

    /* access modifiers changed from: private */
    /* renamed from: a */
    public void m14a(C0069a.C0076c cVar, String str) {
        C0060a e = m31e();
        if (cVar == C0069a.C0076c.CBImpressionTypeMoreApps && e != null && e.mo1226a()) {
            e.mo1225a(true);
        }
        if (cVar == C0069a.C0076c.CBImpressionTypeInterstitial && getDelegate() != null) {
            getDelegate().didFailToLoadInterstitial(str);
        }
        if (cVar == C0069a.C0076c.CBImpressionTypeMoreApps && getDelegate() != null) {
            getDelegate().didFailToLoadMoreApps();
        }
    }

    /* access modifiers changed from: private */
    /* renamed from: a */
    public void m15a(final String str, final boolean z) {
        if (getDelegate() != null && !getDelegate().shouldRequestInterstitial(str)) {
            return;
        }
        if (C0188l.m405a()) {
            C0186k kVar = new C0186k("api", "get");
            kVar.mo1466a((Context) this.f12f);
            kVar.mo1467a("location", str);
            if (z) {
                kVar.mo1467a("cache", "1");
            }
            kVar.mo1471c(getAppID(), getAppSignature());
            kVar.f311h = new C0186k.C0187a() {
                /* renamed from: a */
                public void mo1165a(JSONObject jSONObject) {
                    C0038Chartboost.sharedChartboost().m16a(jSONObject, C0069a.C0076c.CBImpressionTypeInterstitial, z, str);
                }
            };
            this.f14h.mo1457a(kVar);
        } else if (getDelegate() != null) {
            getDelegate().didFailToLoadInterstitial(str);
        }
    }

    /* access modifiers changed from: private */
    /* renamed from: a */
    public void m18a(final boolean z) {
        if (C0188l.m405a()) {
            if (!z && (getDelegate() == null || getDelegate().shouldDisplayLoadingViewForMoreApps())) {
                mo1121a(new C0060a.C0062a(true, (C0069a) null));
            }
            C0186k kVar = new C0186k("api", "more");
            kVar.mo1466a((Context) this.f12f);
            if (z) {
                kVar.mo1467a("cache", "1");
            }
            kVar.mo1471c(getAppID(), getAppSignature());
            kVar.f311h = new C0186k.C0187a() {
                /* renamed from: a */
                public void mo1165a(JSONObject jSONObject) {
                    C0038Chartboost.this.m16a(jSONObject, C0069a.C0076c.CBImpressionTypeMoreApps, z, (String) null);
                }
            };
            this.f14h.mo1457a(kVar);
        } else if (getDelegate() != null) {
            getDelegate().didFailToLoadMoreApps();
        }
    }

    /* access modifiers changed from: private */
    /* renamed from: a */
    public void m16a(JSONObject jSONObject, C0069a.C0076c cVar, boolean z, String str) {
        C0069a.C0075b bVar;
        boolean z2 = false;
        if (!jSONObject.optString("status", "").equals("200")) {
            m14a(cVar, str);
            return;
        }
        boolean z3 = getDelegate() == null || getDelegate().shouldDisplayLoadingViewForMoreApps();
        if (m31e() != null && m31e().mo1226a()) {
            z2 = true;
        }
        if (cVar != C0069a.C0076c.CBImpressionTypeMoreApps || z || !z3 || z2) {
            if (z) {
                bVar = C0069a.C0075b.CBImpressionStateWaitingForCaching;
            } else {
                bVar = C0069a.C0075b.CBImpressionStateWaitingForDisplay;
            }
            new C0069a(jSONObject, cVar, this.f6B, bVar, str);
        }
    }

    /* access modifiers changed from: private */
    /* renamed from: a */
    public void m17a(JSONObject jSONObject, String str) {
        this.f10d.mo1473a(str, this.f12f);
    }

    /* access modifiers changed from: private */
    /* renamed from: b */
    public void m22b(C0069a aVar) {
        if (aVar.f112k || getDelegate() == null || getDelegate().shouldDisplayInterstitial(aVar.f106e)) {
            if (aVar.f104c == C0069a.C0075b.CBImpressionStateCached && this.f16j.get(aVar.f106e) == aVar) {
                this.f16j.remove(aVar.f106e);
                C0186k kVar = new C0186k("api", "show");
                kVar.mo1466a((Context) this.f12f);
                String optString = aVar.f102a.optString("ad_id");
                if (optString != null) {
                    kVar.mo1467a("ad_id", optString);
                }
                kVar.mo1471c(getAppID(), getAppSignature());
                this.f14h.mo1457a(kVar);
            }
            aVar.f104c = C0069a.C0075b.CBImpressionStateWaitingForDisplay;
            mo1121a(new C0060a.C0062a(aVar));
        }
    }

    /* access modifiers changed from: private */
    /* renamed from: c */
    public void m26c(C0069a aVar) {
        boolean z = true;
        if (aVar.f112k || getDelegate() == null || getDelegate().shouldDisplayMoreApps()) {
            if (aVar == this.f17k) {
                this.f17k = null;
            }
            boolean z2 = aVar.f104c == C0069a.C0075b.CBImpressionStateCached;
            aVar.f104c = C0069a.C0075b.CBImpressionStateOther;
            if (getDelegate() != null && !getDelegate().shouldDisplayLoadingViewForMoreApps()) {
                z = false;
            }
            C0060a e = m31e();
            if (e != null) {
                if (e.mo1226a() || !z) {
                    if (z) {
                        e.mo1225a(false);
                    }
                } else if (!z2 && !aVar.f111j) {
                    return;
                }
            }
            aVar.f104c = C0069a.C0075b.CBImpressionStateWaitingForDisplay;
            mo1121a(new C0060a.C0062a(aVar));
        }
    }
}
