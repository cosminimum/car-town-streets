package com.chartboost.sdk;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Handler;
import android.util.Log;
import com.chartboost.sdk.Libraries.CBOrientation;
import com.chartboost.sdk.Libraries.d;
import com.chartboost.sdk.Libraries.e;
import com.chartboost.sdk.a;
import com.chartboost.sdk.impl.a;
import com.chartboost.sdk.impl.j;
import com.chartboost.sdk.impl.k;
import com.chartboost.sdk.impl.l;
import com.chartboost.sdk.impl.m;
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
/* loaded from: classes.dex */
public final class Chartboost {
    private static Chartboost b = null;
    private com.chartboost.sdk.a c;
    private com.chartboost.sdk.impl.a l;
    private String m;
    private String n;
    private ChartboostDelegate o;
    private CBOrientation r;
    private boolean s;
    private Context e = null;
    private Activity f = null;
    private CBImpressionActivity g = null;
    private List<a.C0002a> i = new ArrayList();
    protected Handler a = new Handler();
    private int p = 30000;
    private boolean q = false;
    private boolean t = false;
    private Map<Integer, Boolean> u = new HashMap();
    private Map<Integer, com.chartboost.sdk.a> v = new HashMap();
    private boolean w = false;
    private long x = 0;
    private boolean y = false;
    private Runnable z = new a(this, null);
    private m.a A = new m.a() { // from class: com.chartboost.sdk.Chartboost.1
        @Override // com.chartboost.sdk.impl.m.a
        public void a(String str) {
            com.chartboost.sdk.a e = Chartboost.this.e();
            if (e != null && e.a()) {
                e.a(true);
            }
        }
    };
    private a.AbstractC0004a B = new a.AbstractC0004a() { // from class: com.chartboost.sdk.Chartboost.2
        @Override // com.chartboost.sdk.impl.a.AbstractC0004a
        public void a(com.chartboost.sdk.impl.a aVar) {
            if (aVar.c == a.b.CBImpressionStateWaitingForDisplay) {
                aVar.c = a.b.CBImpressionStateOther;
                if (aVar.d == a.c.CBImpressionTypeInterstitial) {
                    Chartboost.this.b(aVar);
                } else if (aVar.d == a.c.CBImpressionTypeMoreApps) {
                    Chartboost.this.c(aVar);
                }
            } else if (aVar.c == a.b.CBImpressionStateWaitingForCaching) {
                if (aVar.d == a.c.CBImpressionTypeInterstitial && aVar.e != null) {
                    Chartboost.this.j.put(aVar.e, aVar);
                    if (Chartboost.this.getDelegate() != null) {
                        Chartboost.this.getDelegate().didCacheInterstitial(aVar.e);
                    }
                } else if (aVar.d == a.c.CBImpressionTypeMoreApps) {
                    if (Chartboost.this.getDelegate() != null) {
                        Chartboost.this.getDelegate().didCacheMoreApps();
                    }
                    if (Chartboost.this.k != null) {
                        Chartboost.this.k = null;
                    }
                    Chartboost.this.k = aVar;
                }
                aVar.c = a.b.CBImpressionStateCached;
            }
        }

        @Override // com.chartboost.sdk.impl.a.AbstractC0004a
        public void b(com.chartboost.sdk.impl.a aVar) {
            com.chartboost.sdk.a e;
            com.chartboost.sdk.a e2;
            Chartboost.this.l = null;
            if (aVar.d == a.c.CBImpressionTypeInterstitial) {
                if (Chartboost.this.getDelegate() != null) {
                    Chartboost.this.getDelegate().didDismissInterstitial(aVar.e);
                }
                if (Chartboost.this.getDelegate() != null) {
                    Chartboost.this.getDelegate().didCloseInterstitial(aVar.e);
                }
                if (aVar.c == a.b.CBImpressionStateDisplayedByDefaultController && (e2 = Chartboost.this.e()) != null) {
                    e2.a(aVar, true);
                }
            } else if (aVar.d == a.c.CBImpressionTypeMoreApps) {
                if (Chartboost.this.getDelegate() != null) {
                    Chartboost.this.getDelegate().didDismissMoreApps();
                }
                if (Chartboost.this.getDelegate() != null) {
                    Chartboost.this.getDelegate().didCloseMoreApps();
                }
                if (aVar.c == a.b.CBImpressionStateDisplayedByDefaultController && (e = Chartboost.this.e()) != null) {
                    e.a(aVar, true);
                }
            }
        }

        private void a(JSONObject jSONObject, String str, k kVar) {
            if (jSONObject != null) {
                try {
                    if (jSONObject.getString(str) != null) {
                        kVar.a(str, jSONObject.optString(str));
                    }
                } catch (JSONException e) {
                }
            }
        }

        @Override // com.chartboost.sdk.impl.a.AbstractC0004a
        public void a(com.chartboost.sdk.impl.a aVar, final String str, JSONObject jSONObject) {
            com.chartboost.sdk.a e;
            Activity activity;
            com.chartboost.sdk.a e2;
            boolean z = false;
            Chartboost.this.l = null;
            boolean z2 = str != null && !str.equals("") && !str.equals("null");
            if (aVar.d == a.c.CBImpressionTypeInterstitial) {
                if (Chartboost.this.getDelegate() != null) {
                    Chartboost.this.getDelegate().didDismissInterstitial(aVar.e);
                }
                if (Chartboost.this.getDelegate() != null) {
                    Chartboost.this.getDelegate().didClickInterstitial(aVar.e);
                }
                if (aVar.c == a.b.CBImpressionStateDisplayedByDefaultController && (e2 = Chartboost.this.e()) != null) {
                    if (!z2) {
                        z = true;
                    }
                    e2.a(aVar, z);
                }
            } else if (aVar.d == a.c.CBImpressionTypeMoreApps) {
                if (Chartboost.this.getDelegate() != null) {
                    Chartboost.this.getDelegate().didDismissMoreApps();
                }
                if (Chartboost.this.getDelegate() != null) {
                    Chartboost.this.getDelegate().didClickMoreApps();
                }
                if (aVar.c == a.b.CBImpressionStateDisplayedByDefaultController && (e = Chartboost.this.e()) != null) {
                    if (!z2) {
                        z = true;
                    }
                    e.a(aVar, z);
                }
            }
            k kVar = new k("api", "click");
            if (Chartboost.this.f != null) {
                activity = Chartboost.this.f;
            } else {
                activity = Chartboost.this.b();
            }
            kVar.a(activity);
            a(aVar.a, "to", kVar);
            a(aVar.a, "cgn", kVar);
            a(aVar.a, "creative", kVar);
            a(aVar.a, "ad_id", kVar);
            a(jSONObject, "cgn", kVar);
            a(jSONObject, "creative", kVar);
            a(jSONObject, ServerProtocol.DIALOG_PARAM_TYPE, kVar);
            a(jSONObject, "more_type", kVar);
            kVar.c(Chartboost.this.getAppID(), Chartboost.this.getAppSignature());
            if (z2) {
                kVar.h = new k.a() { // from class: com.chartboost.sdk.Chartboost.2.1
                    @Override // com.chartboost.sdk.impl.k.a
                    public void a(JSONObject jSONObject2) {
                        Chartboost.sharedChartboost().a(jSONObject2, str);
                    }
                };
                Chartboost.this.a(new a.C0002a(true, null));
            }
            Chartboost.this.h.a(kVar);
        }

        @Override // com.chartboost.sdk.impl.a.AbstractC0004a
        public void c(com.chartboost.sdk.impl.a aVar) {
            Chartboost.this.a(aVar.d, aVar.d == a.c.CBImpressionTypeInterstitial ? aVar.e : null);
        }
    };
    private j.c C = new j.c() { // from class: com.chartboost.sdk.Chartboost.3
        @Override // com.chartboost.sdk.impl.j.c
        public void a(k kVar) {
            if (kVar.b.equals("get")) {
                Chartboost.this.a(a.c.CBImpressionTypeInterstitial, kVar.e.optString("location", "Default"));
            } else if (kVar.b.equals("more")) {
                Chartboost.this.a(a.c.CBImpressionTypeMoreApps, kVar.e.optString("location", "Default"));
            }
            com.chartboost.sdk.a e = Chartboost.this.e();
            if (e != null && e.a()) {
                e.a(true);
            }
        }

        @Override // com.chartboost.sdk.impl.j.c
        public void a(JSONObject jSONObject, k kVar) {
            if (kVar.h != null) {
                kVar.h.a(jSONObject);
            }
        }
    };
    private j h = new j(null, this.C, null);
    private m d = new m(this.A);
    private Map<String, com.chartboost.sdk.impl.a> j = new HashMap();
    private com.chartboost.sdk.impl.a k = null;

    public static synchronized Chartboost sharedChartboost() {
        Chartboost chartboost;
        synchronized (Chartboost.class) {
            if (b == null) {
                b = new Chartboost();
            }
            chartboost = b;
        }
        return chartboost;
    }

    private Chartboost() {
    }

    public void startSession() {
        if (this.f == null) {
            throw new IllegalStateException("The context must be set through the Chartboost method onCreate() before calling startSession().");
        }
        if (((long) (System.nanoTime() / 1000000.0d)) - this.x >= 10000) {
            SharedPreferences a2 = d.a();
            SharedPreferences.Editor edit = a2.edit();
            edit.putInt("cbPrefSessionCount", a2.getInt("cbPrefSessionCount", 0) + 1);
            edit.commit();
            k kVar = new k("api", "install");
            kVar.a(this.f);
            kVar.c(getAppID(), getAppSignature());
            kVar.h = new k.a() { // from class: com.chartboost.sdk.Chartboost.4
                @Override // com.chartboost.sdk.impl.k.a
                public void a(JSONObject jSONObject) {
                    String optString;
                    if (d.a(Chartboost.this.getContext()) && (optString = jSONObject.optString("latest-sdk-version")) != null && !optString.equals("") && !optString.equals("3.1.5")) {
                        Log.w("Chartboost", String.format("WARNING: you have an outdated version of the SDK (Current: %s, Latest: %s). Get the latest version at chartboost.com/support/sdk#android", optString, "3.1.5"));
                    }
                }
            };
            this.h.a(kVar);
        }
    }

    public Context getContext() {
        return this.e;
    }

    public void onCreate(Activity activity, String appId, String appSignature, ChartboostDelegate chartBoostDelegate) {
        if (!d.d()) {
            throw new IllegalStateException("It is illegal to call this method from any thread other than the UI thread. Please call it from the onCreate() method of your host activity.");
        }
        if (this.f != null && d() && this.f != activity) {
            onStop(this.f);
            a(this.f, false);
        }
        this.a.removeCallbacks(this.z);
        c(activity);
        setAppID(appId);
        setAppSignature(appSignature);
        setDelegate(chartBoostDelegate);
    }

    private void c(Activity activity) {
        this.f = activity;
        this.e = activity.getApplicationContext();
    }

    private boolean d() {
        return d(this.f);
    }

    private boolean d(Activity activity) {
        if (activity == null) {
            return false;
        }
        Boolean bool = this.u.get(Integer.valueOf(activity.hashCode()));
        return bool != null ? bool.booleanValue() : false;
    }

    private void a(Activity activity, boolean z) {
        if (activity != null) {
            this.u.put(Integer.valueOf(activity.hashCode()), Boolean.valueOf(z));
        }
    }

    private void b(Activity activity, boolean z) {
        com.chartboost.sdk.a aVar;
        int hashCode = activity.hashCode();
        com.chartboost.sdk.a aVar2 = this.v.get(Integer.valueOf(hashCode));
        if (aVar2 == null && z) {
            if (this.c != null) {
                aVar = this.c;
                this.c = null;
                aVar.a(activity);
            } else {
                aVar = new com.chartboost.sdk.a(this, activity);
            }
            this.v.put(Integer.valueOf(hashCode), aVar);
        } else if (aVar2 != null && !z) {
            this.c = this.v.remove(Integer.valueOf(hashCode));
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public com.chartboost.sdk.a e() {
        if (b() == null) {
            return null;
        }
        return this.v.get(Integer.valueOf(b().hashCode()));
    }

    public void onStart(Activity activity) {
        if (!d.d()) {
            throw new IllegalStateException("It is illegal to call this method from any thread other than the UI thread. Please call it from the onStart() method of your host activity.");
        }
        this.a.removeCallbacks(this.z);
        a(activity, true);
        c(activity);
        if (!this.q) {
            a(activity);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void a(Activity activity) {
        boolean z;
        this.e = activity.getApplicationContext();
        if (!(activity instanceof CBImpressionActivity)) {
            this.f = activity;
            a(this.f, true);
        } else {
            this.g = (CBImpressionActivity) activity;
        }
        this.a.removeCallbacks(this.z);
        if (activity != null && activity == b()) {
            b(activity, true);
            if (activity instanceof CBImpressionActivity) {
                com.chartboost.sdk.a e = e();
                if (e != null) {
                    for (int i = 0; i < this.i.size(); i++) {
                        e.a(this.i.get(i));
                    }
                    this.i.clear();
                }
                this.y = false;
            }
            if (this.w) {
                this.w = false;
                z = true;
            } else {
                z = false;
            }
            if (this.l != null && this.l.c == a.b.CBImpressionStateWaitingForDisplay && this.l.a()) {
                z = false;
            }
            if (z) {
                a(new a.C0002a(true, null));
            }
        }
    }

    public void onStop(Activity activity) {
        if (!d.d()) {
            throw new IllegalStateException("It is illegal to call this method from any thread other than the UI thread. Please call it from the onStop() method of your host activity.");
        }
        if (!this.q) {
            b(activity);
        }
        if (!(activity instanceof CBImpressionActivity)) {
            a(activity, false);
        }
        this.x = (long) (System.nanoTime() / 1000000.0d);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void b(Activity activity) {
        com.chartboost.sdk.a e = e();
        if (activity == b() && e != null) {
            b(activity, false);
            this.w = false;
            if (e.a()) {
                e.a(false);
                this.w = true;
            }
            if (this.l != null) {
                e.a(this.l);
            }
        }
        if (!(activity instanceof CBImpressionActivity)) {
            a(this.f, false);
        }
    }

    public boolean onBackPressed() {
        if (!d.d()) {
            throw new IllegalStateException("It is illegal to call this method from any thread other than the UI thread. Please call it from the onBackPressed() method of your host activity.");
        }
        if (this.f == null) {
            throw new IllegalStateException("The Chartboost methods onCreate(), onStart(), onStop(), and onDestroy() must be called in the corresponding methods of your activity in order for Chartboost to function properly.");
        }
        if (!this.q) {
            return a();
        }
        if (!this.y) {
            return false;
        }
        this.y = false;
        a();
        return true;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public boolean a() {
        if (this.l != null && this.l.c == a.b.CBImpressionStateDisplayedByDefaultController) {
            f();
            return true;
        }
        com.chartboost.sdk.a e = e();
        if (e != null && e.a()) {
            e.a(true);
            return true;
        }
        return false;
    }

    public void onDestroy(Activity activity) {
        this.a.postDelayed(this.z, 10000L);
    }

    /* loaded from: classes.dex */
    private class a implements Runnable {
        final /* synthetic */ Chartboost a;
        private int b;
        private int c;
        private int d;

        private a(Chartboost chartboost) {
            int i = -1;
            this.a = chartboost;
            this.b = chartboost.g == null ? -1 : chartboost.g.hashCode();
            this.c = chartboost.f == null ? -1 : chartboost.f.hashCode();
            this.d = chartboost.o != null ? chartboost.o.hashCode() : i;
        }

        /* synthetic */ a(Chartboost chartboost, a aVar) {
            this(chartboost);
        }

        @Override // java.lang.Runnable
        public void run() {
            if (this.a.f != null && this.a.f.hashCode() == this.c) {
                this.a.f = null;
            }
            if (this.a.g != null && this.a.g.hashCode() == this.b) {
                this.a.g = null;
            }
            if (this.a.o != null && this.a.o.hashCode() == this.d) {
                this.a.o = null;
            }
            this.a.clearImageCache();
        }
    }

    public void clearImageCache() {
        e.a().b();
    }

    public void clearCache() {
        this.j = new HashMap();
    }

    public void cacheInterstitial() {
        cacheInterstitial("Default");
    }

    public void cacheInterstitial(String location) {
        if (this.f == null) {
            throw new IllegalStateException("The context must be set through the Chartboost method onCreate() before calling cacheInterstitial().");
        }
        if (getDelegate() == null || getDelegate().shouldRequestInterstitialsInFirstSession() || d.a().getInt("cbPrefSessionCount", 0) > 1) {
            a(location, true);
        }
    }

    public void showInterstitial() {
        showInterstitial("Default");
    }

    public void showInterstitial(String location) {
        if (this.f == null) {
            throw new IllegalStateException("The context must be set through the Chartboost method onCreate() before calling showInterstitial().");
        }
        if (getDelegate() == null || getDelegate().shouldRequestInterstitialsInFirstSession() || d.a().getInt("cbPrefSessionCount", 0) != 1) {
            this.a.post(new b(location));
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public class b implements Runnable {
        private String b;

        public b(String str) {
            this.b = str;
        }

        @Override // java.lang.Runnable
        public void run() {
            if (!Chartboost.this.hasCachedInterstitial(this.b)) {
                Chartboost.this.a(this.b, false);
            } else {
                Chartboost.this.b((com.chartboost.sdk.impl.a) Chartboost.this.j.get(this.b));
            }
        }
    }

    public boolean hasCachedInterstitial() {
        return hasCachedInterstitial("Default");
    }

    public boolean hasCachedMoreApps() {
        return this.k != null;
    }

    public boolean hasCachedInterstitial(String location) {
        com.chartboost.sdk.impl.a aVar = this.j.get(location);
        if (aVar == null) {
            return false;
        }
        return TimeUnit.MILLISECONDS.toSeconds(new Date().getTime() - aVar.b.getTime()) < Constants.LICENSE_REFRESH_INTERVAL;
    }

    public void cacheMoreApps() {
        if (this.f == null) {
            throw new IllegalStateException("The context must be set through the Chartboost method onCreate() before calling cacheMoreApps().");
        }
        a(true);
    }

    public void showMoreApps() {
        if (this.f == null) {
            throw new IllegalStateException("The context must be set through the Chartboost method onCreate() before calling showMoreApps().");
        }
        this.a.post(new c(this, null));
    }

    /* loaded from: classes.dex */
    private class c implements Runnable {
        private c() {
        }

        /* synthetic */ c(Chartboost chartboost, c cVar) {
            this();
        }

        @Override // java.lang.Runnable
        public void run() {
            if (Chartboost.this.k == null) {
                Chartboost.this.a(false);
            } else {
                Chartboost.this.c(Chartboost.this.k);
            }
        }
    }

    public int getTimeout() {
        return this.p;
    }

    public void setTimeout(int timeout) {
        this.p = timeout;
    }

    public String getAppID() {
        return this.m;
    }

    public void setAppID(String appId) {
        this.m = appId;
    }

    public String getAppSignature() {
        return this.n;
    }

    public void setAppSignature(String appSignature) {
        this.n = appSignature;
    }

    public ChartboostDelegate getDelegate() {
        return this.o;
    }

    public void setDelegate(ChartboostDelegate delegate) {
        this.o = delegate;
    }

    public boolean getImpressionsUseActivities() {
        return this.q;
    }

    public void setImpressionsUseActivities(boolean impressionsUseActivities) {
        this.q = impressionsUseActivities;
    }

    public void setIdentityTrackingDisabledOnThisDevice(boolean disabled) {
        SharedPreferences.Editor edit = d.a().edit();
        edit.putBoolean("cbIdentityTrackingDisabled", disabled);
        edit.commit();
    }

    public boolean isIdentityTrackingDisabledOnThisDevice() {
        return d.c();
    }

    public void setOrientation(CBOrientation _orientation) {
        this.s = _orientation != CBOrientation.UNSPECIFIED;
        this.r = _orientation;
    }

    public CBOrientation orientation() {
        if (getContext() == null) {
            throw new IllegalStateException("The context must be set through the Chartboost method onCreate() before calling orientation().");
        }
        return (!this.s || this.r == CBOrientation.UNSPECIFIED) ? d.c(getContext()) : this.r;
    }

    public CBOrientation.Difference getForcedOrientationDifference() {
        if (!this.s) {
            return CBOrientation.Difference.ANGLE_0;
        }
        CBOrientation c2 = d.c(getContext());
        CBOrientation orientation = orientation();
        if (orientation == CBOrientation.UNSPECIFIED || orientation == c2) {
            return CBOrientation.Difference.ANGLE_0;
        }
        if (orientation == c2.rotate90()) {
            return CBOrientation.Difference.ANGLE_90;
        }
        if (orientation == c2.rotate180()) {
            return CBOrientation.Difference.ANGLE_180;
        }
        return CBOrientation.Difference.ANGLE_270;
    }

    private void f() {
        if (this.l != null) {
            this.B.b(this.l);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public Activity b() {
        return this.q ? this.g : this.f;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void a(CBImpressionActivity cBImpressionActivity) {
        if (!this.t) {
            this.e = cBImpressionActivity.getApplicationContext();
            this.g = cBImpressionActivity;
            this.t = true;
        }
        this.a.removeCallbacks(this.z);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void c() {
        if (this.t) {
            this.e = this.f.getApplicationContext();
            this.g = null;
            this.t = false;
        }
    }

    protected void a(a.C0002a c0002a) {
        boolean z = true;
        if (getImpressionsUseActivities()) {
            com.chartboost.sdk.a e = e();
            if (b() != null && this.t && e != null) {
                e.a(c0002a);
                return;
            } else if (d()) {
                this.i.add(c0002a);
                Intent intent = new Intent(this.f, CBImpressionActivity.class);
                boolean z2 = (this.f.getWindow().getAttributes().flags & 1024) != 0;
                boolean z3 = (this.f.getWindow().getAttributes().flags & 2048) != 0;
                if (!z2 || z3) {
                    z = false;
                }
                intent.putExtra(CBImpressionActivity.PARAM_FULLSCREEN, z);
                try {
                    this.f.startActivity(intent);
                    this.y = true;
                    return;
                } catch (ActivityNotFoundException e2) {
                    throw new RuntimeException("Chartboost impression activity not declared in manifest. Please add the following inside your manifest's <application> tag: \n<activity android:name=\"com.chartboost.sdk.CBImpressionActivity\" android:theme=\"@android:style/Theme.Translucent.NoTitleBar\" android:excludeFromRecents=\"true\" />");
                }
            } else {
                return;
            }
        }
        com.chartboost.sdk.a e3 = e();
        if (e3 != null) {
            e3.a(c0002a);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void a(com.chartboost.sdk.impl.a aVar) {
        this.l = aVar;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void a(a.c cVar, String str) {
        com.chartboost.sdk.a e = e();
        if (cVar == a.c.CBImpressionTypeMoreApps && e != null && e.a()) {
            e.a(true);
        }
        if (cVar == a.c.CBImpressionTypeInterstitial && getDelegate() != null) {
            getDelegate().didFailToLoadInterstitial(str);
        }
        if (cVar == a.c.CBImpressionTypeMoreApps && getDelegate() != null) {
            getDelegate().didFailToLoadMoreApps();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void a(final String str, final boolean z) {
        if (getDelegate() == null || getDelegate().shouldRequestInterstitial(str)) {
            if (!l.a()) {
                if (getDelegate() != null) {
                    getDelegate().didFailToLoadInterstitial(str);
                    return;
                }
                return;
            }
            k kVar = new k("api", "get");
            kVar.a(this.f);
            kVar.a("location", str);
            if (z) {
                kVar.a("cache", "1");
            }
            kVar.c(getAppID(), getAppSignature());
            kVar.h = new k.a() { // from class: com.chartboost.sdk.Chartboost.5
                @Override // com.chartboost.sdk.impl.k.a
                public void a(JSONObject jSONObject) {
                    Chartboost.sharedChartboost().a(jSONObject, a.c.CBImpressionTypeInterstitial, z, str);
                }
            };
            this.h.a(kVar);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void a(final boolean z) {
        if (!l.a()) {
            if (getDelegate() != null) {
                getDelegate().didFailToLoadMoreApps();
                return;
            }
            return;
        }
        if (!z && (getDelegate() == null || getDelegate().shouldDisplayLoadingViewForMoreApps())) {
            a(new a.C0002a(true, null));
        }
        k kVar = new k("api", "more");
        kVar.a(this.f);
        if (z) {
            kVar.a("cache", "1");
        }
        kVar.c(getAppID(), getAppSignature());
        kVar.h = new k.a() { // from class: com.chartboost.sdk.Chartboost.6
            @Override // com.chartboost.sdk.impl.k.a
            public void a(JSONObject jSONObject) {
                Chartboost.this.a(jSONObject, a.c.CBImpressionTypeMoreApps, z, null);
            }
        };
        this.h.a(kVar);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void a(JSONObject jSONObject, a.c cVar, boolean z, String str) {
        a.b bVar;
        boolean z2 = false;
        if (!jSONObject.optString("status", "").equals("200")) {
            a(cVar, str);
            return;
        }
        boolean z3 = getDelegate() == null || getDelegate().shouldDisplayLoadingViewForMoreApps();
        if (e() != null && e().a()) {
            z2 = true;
        }
        if (cVar != a.c.CBImpressionTypeMoreApps || z || !z3 || z2) {
            if (z) {
                bVar = a.b.CBImpressionStateWaitingForCaching;
            } else {
                bVar = a.b.CBImpressionStateWaitingForDisplay;
            }
            new com.chartboost.sdk.impl.a(jSONObject, cVar, this.B, bVar, str);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void a(JSONObject jSONObject, String str) {
        this.d.a(str, this.f);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void b(com.chartboost.sdk.impl.a aVar) {
        if (aVar.k || getDelegate() == null || getDelegate().shouldDisplayInterstitial(aVar.e)) {
            if (aVar.c == a.b.CBImpressionStateCached && this.j.get(aVar.e) == aVar) {
                this.j.remove(aVar.e);
                k kVar = new k("api", "show");
                kVar.a(this.f);
                String optString = aVar.a.optString("ad_id");
                if (optString != null) {
                    kVar.a("ad_id", optString);
                }
                kVar.c(getAppID(), getAppSignature());
                this.h.a(kVar);
            }
            aVar.c = a.b.CBImpressionStateWaitingForDisplay;
            a(new a.C0002a(aVar));
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void c(com.chartboost.sdk.impl.a aVar) {
        boolean z = true;
        if (aVar.k || getDelegate() == null || getDelegate().shouldDisplayMoreApps()) {
            if (aVar == this.k) {
                this.k = null;
            }
            boolean z2 = aVar.c == a.b.CBImpressionStateCached;
            aVar.c = a.b.CBImpressionStateOther;
            if (getDelegate() != null && !getDelegate().shouldDisplayLoadingViewForMoreApps()) {
                z = false;
            }
            com.chartboost.sdk.a e = e();
            if (e != null) {
                if (e.a() || !z) {
                    if (z) {
                        e.a(false);
                    }
                } else if (!z2 && !aVar.j) {
                    return;
                }
            }
            aVar.c = a.b.CBImpressionStateWaitingForDisplay;
            a(new a.C0002a(aVar));
        }
    }
}
