package com.flurry.android;

import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.Handler;
import android.os.SystemClock;
import android.util.Log;
import android.view.View;
import com.getjar.sdk.utilities.Utility;
import com.google.ads.AdActivity;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;

/* renamed from: com.flurry.android.u */
final class C0323u implements View.OnClickListener {

    /* renamed from: a */
    static String f617a = "FlurryAgent";

    /* renamed from: b */
    static String f618b = "";

    /* renamed from: c */
    private static volatile String f619c = "market://";

    /* renamed from: d */
    private static volatile String f620d = "market://details?id=";

    /* renamed from: e */
    private static volatile String f621e = "https://market.android.com/details?id=";

    /* renamed from: f */
    private static String f622f = "com.flurry.android.ACTION_CATALOG";

    /* renamed from: g */
    private static int f623g = 5000;

    /* renamed from: z */
    private static volatile long f624z = 0;

    /* renamed from: h */
    private String f625h;

    /* renamed from: i */
    private String f626i;

    /* renamed from: j */
    private String f627j;

    /* renamed from: k */
    private long f628k;

    /* renamed from: l */
    private long f629l;

    /* renamed from: m */
    private long f630m;

    /* renamed from: n */
    private C0328z f631n = new C0328z();

    /* renamed from: o */
    private boolean f632o = true;

    /* renamed from: p */
    private volatile boolean f633p;

    /* renamed from: q */
    private String f634q;

    /* renamed from: r */
    private Map f635r = new HashMap();

    /* renamed from: s */
    private Handler f636s;

    /* renamed from: t */
    private boolean f637t;

    /* renamed from: u */
    private transient Map f638u = new HashMap();

    /* renamed from: v */
    private C0298ag f639v;

    /* renamed from: w */
    private List f640w = new ArrayList();

    /* renamed from: x */
    private Map f641x = new HashMap();
    /* access modifiers changed from: private */

    /* renamed from: y */
    public AppCircleCallback f642y;

    /* renamed from: a */
    static /* synthetic */ void m569a(C0323u uVar, Context context, String str) {
        if (str.startsWith(f620d)) {
            String substring = str.substring(f620d.length());
            if (uVar.f632o) {
                try {
                    C0299ah.m532a(f617a, "Launching Android Market for app " + substring);
                    context.startActivity(new Intent("android.intent.action.VIEW").setData(Uri.parse(str)));
                } catch (Exception e) {
                    C0299ah.m541c(f617a, "Cannot launch Marketplace url " + str, e);
                }
            } else {
                C0299ah.m532a(f617a, "Launching Android Market website for app " + substring);
                context.startActivity(new Intent("android.intent.action.VIEW").setData(Uri.parse(f621e + substring)));
            }
        } else {
            C0299ah.m542d(f617a, "Unexpected android market url scheme: " + str);
        }
    }

    static {
        new Random(System.currentTimeMillis());
    }

    /* access modifiers changed from: package-private */
    /* renamed from: a */
    public final synchronized void mo2432a(Context context, C0291a aVar) {
        boolean z = true;
        synchronized (this) {
            if (!this.f633p) {
                this.f625h = aVar.f487e;
                this.f626i = aVar.f488f;
                this.f627j = aVar.f483a;
                this.f628k = aVar.f484b;
                this.f629l = aVar.f485c;
                this.f630m = aVar.f486d;
                this.f636s = aVar.f489g;
                this.f639v = new C0298ag(this.f636s, f623g);
                context.getResources().getDisplayMetrics();
                this.f641x.clear();
                this.f638u.clear();
                this.f631n.mo2471a(context, this, aVar);
                this.f635r.clear();
                PackageManager packageManager = context.getPackageManager();
                Intent intent = new Intent("android.intent.action.VIEW");
                intent.setData(Uri.parse(f620d + context.getPackageName()));
                if (packageManager.queryIntentActivities(intent, 65536).size() <= 0) {
                    z = false;
                }
                this.f632o = z;
                mo2429a();
                this.f633p = true;
            }
        }
    }

    /* access modifiers changed from: package-private */
    /* renamed from: a */
    public final synchronized void mo2429a() {
        this.f640w.clear();
    }

    /* access modifiers changed from: package-private */
    /* renamed from: b */
    public final boolean mo2443b() {
        return this.f633p;
    }

    /* access modifiers changed from: package-private */
    /* renamed from: a */
    public final void mo2436a(String str) {
        this.f634q = str;
    }

    /* access modifiers changed from: package-private */
    /* renamed from: c */
    public final synchronized void mo2445c() {
        if (m577q()) {
            this.f631n.mo2478d();
        }
    }

    /* access modifiers changed from: package-private */
    /* renamed from: d */
    public final synchronized void mo2446d() {
        if (m577q()) {
            this.f631n.mo2479e();
        }
    }

    /* access modifiers changed from: package-private */
    /* renamed from: a */
    public final synchronized void mo2439a(Map map, Map map2, Map map3, Map map4, Map map5, Map map6) {
        if (m577q()) {
            this.f631n.mo2472a(map, map2, map3, map4, map5, map6);
            Log.i("FlurryAgent", this.f631n.toString());
        }
    }

    /* access modifiers changed from: package-private */
    /* renamed from: e */
    public final synchronized long mo2447e() {
        long c;
        if (!m577q()) {
            c = 0;
        } else {
            c = this.f631n.mo2477c();
        }
        return c;
    }

    /* access modifiers changed from: package-private */
    /* renamed from: f */
    public final synchronized Set mo2448f() {
        Set a;
        if (!m577q()) {
            a = Collections.emptySet();
        } else {
            a = this.f631n.mo2470a();
        }
        return a;
    }

    /* access modifiers changed from: package-private */
    /* renamed from: a */
    public final synchronized AdImage mo2427a(long j) {
        AdImage b;
        if (!m577q()) {
            b = null;
        } else {
            b = this.f631n.mo2474b(j);
        }
        return b;
    }

    /* renamed from: o */
    private synchronized AdImage m575o() {
        AdImage a;
        if (!m577q()) {
            a = null;
        } else {
            a = this.f631n.mo2468a(1);
        }
        return a;
    }

    /* access modifiers changed from: package-private */
    /* renamed from: g */
    public final synchronized List mo2449g() {
        return this.f640w;
    }

    /* access modifiers changed from: package-private */
    /* renamed from: b */
    public final synchronized C0318p mo2442b(long j) {
        return (C0318p) this.f638u.get(Long.valueOf(j));
    }

    /* access modifiers changed from: package-private */
    /* renamed from: h */
    public final synchronized void mo2450h() {
        this.f638u.clear();
    }

    /* access modifiers changed from: package-private */
    /* renamed from: a */
    public final synchronized void mo2434a(Context context, String str) {
        if (m577q()) {
            try {
                List a = m567a(Arrays.asList(new String[]{str}), (Long) null);
                if (a == null || a.isEmpty()) {
                    Intent intent = new Intent(m576p());
                    intent.addCategory("android.intent.category.DEFAULT");
                    context.startActivity(intent);
                } else {
                    C0318p pVar = new C0318p(str, (byte) 2, SystemClock.elapsedRealtime() - this.f630m);
                    pVar.f610b = (C0324v) a.get(0);
                    m568a(pVar);
                    m571b(context, pVar, this.f625h + m564a(pVar, Long.valueOf(System.currentTimeMillis())));
                }
            } catch (Exception e) {
                C0299ah.m543d(f617a, "Failed to launch promotional canvas for hook: " + str, e);
            }
        }
        return;
    }

    /* access modifiers changed from: package-private */
    /* renamed from: a */
    public final void mo2435a(AppCircleCallback appCircleCallback) {
        this.f642y = appCircleCallback;
    }

    /* access modifiers changed from: package-private */
    /* renamed from: a */
    public final void mo2440a(boolean z) {
        this.f637t = z;
    }

    /* access modifiers changed from: package-private */
    /* renamed from: i */
    public final boolean mo2451i() {
        return this.f637t;
    }

    /* access modifiers changed from: package-private */
    /* renamed from: j */
    public final String mo2452j() {
        return this.f625h;
    }

    /* access modifiers changed from: package-private */
    /* renamed from: a */
    public final synchronized void mo2433a(Context context, C0318p pVar, String str) {
        if (m577q()) {
            this.f636s.post(new C0302ak(this, str, context, pVar));
        }
    }

    /* access modifiers changed from: private */
    /* renamed from: d */
    public String m573d(String str) {
        try {
            if (str.startsWith(f619c)) {
                return str;
            }
            HttpResponse execute = new DefaultHttpClient().execute(new HttpGet(str));
            int statusCode = execute.getStatusLine().getStatusCode();
            if (statusCode == 200) {
                String entityUtils = EntityUtils.toString(execute.getEntity());
                if (!entityUtils.startsWith(f619c)) {
                    return m573d(entityUtils);
                }
                return entityUtils;
            }
            C0299ah.m540c(f617a, "Cannot process with responseCode " + statusCode);
            m574e("Error when fetching application's android market ID, responseCode " + statusCode);
            return str;
        } catch (UnknownHostException e) {
            C0299ah.m540c(f617a, "Unknown host: " + e.getMessage());
            if (this.f642y != null) {
                m574e("Unknown host: " + e.getMessage());
            }
            return null;
        } catch (Exception e2) {
            C0299ah.m541c(f617a, "Failed on url: " + str, e2);
            return null;
        }
    }

    /* access modifiers changed from: private */
    /* renamed from: e */
    public void m574e(String str) {
        m570a((Runnable) new C0296ae(this, str));
    }

    /* access modifiers changed from: package-private */
    /* renamed from: b */
    public final synchronized Offer mo2441b(String str) {
        Offer offer = null;
        synchronized (this) {
            if (m577q()) {
                List a = m567a(Arrays.asList(new String[]{str}), (Long) null);
                if (a != null && !a.isEmpty()) {
                    offer = m563a(str, (C0324v) a.get(0));
                    C0299ah.m532a(f617a, "Impression for offer with ID " + offer.getId());
                }
            }
        }
        return offer;
    }

    /* access modifiers changed from: package-private */
    /* renamed from: a */
    public final synchronized void mo2431a(Context context, long j) {
        if (m577q()) {
            OfferInSdk offerInSdk = (OfferInSdk) this.f641x.get(Long.valueOf(j));
            if (offerInSdk == null) {
                C0299ah.m537b(f617a, "Cannot find offer " + j);
            } else {
                C0318p pVar = offerInSdk.f478b;
                pVar.mo2419a(new C0308f((byte) 4, mo2453k()));
                C0299ah.m532a(f617a, "Offer " + offerInSdk.f477a + " accepted. Sent with cookies: " + this.f635r);
                mo2433a(context, pVar, FlurryAgent.m496c() + m564a(pVar, Long.valueOf(pVar.mo2418a())));
            }
        }
    }

    /* access modifiers changed from: package-private */
    /* renamed from: c */
    public final synchronized List mo2444c(String str) {
        List arrayList;
        if (!m577q()) {
            arrayList = Collections.emptyList();
        } else if (!this.f631n.mo2476b()) {
            arrayList = Collections.emptyList();
        } else {
            C0324v[] a = this.f631n.mo2473a(str);
            arrayList = new ArrayList();
            if (a != null && a.length > 0) {
                for (C0324v a2 : a) {
                    arrayList.add(m563a(str, a2));
                }
            }
            C0299ah.m532a(f617a, "Impressions for " + arrayList.size() + " offers.");
        }
        return arrayList;
    }

    /* access modifiers changed from: package-private */
    /* renamed from: a */
    public final synchronized void mo2438a(List list) {
        if (m577q()) {
            Iterator it = list.iterator();
            while (it.hasNext()) {
                this.f641x.remove((Long) it.next());
            }
        }
    }

    /* renamed from: a */
    private Offer m563a(String str, C0324v vVar) {
        C0318p pVar = new C0318p(str, (byte) 3, mo2453k());
        m568a(pVar);
        pVar.mo2419a(new C0308f((byte) 2, mo2453k()));
        pVar.f610b = vVar;
        C0303al a = this.f631n.mo2469a(vVar.f643a);
        String str2 = a == null ? "" : a.f516a;
        int i = a == null ? 0 : a.f518c;
        long j = f624z + 1;
        f624z = j;
        OfferInSdk offerInSdk = new OfferInSdk(j, pVar, vVar.f650h, vVar.f646d, str2, i);
        this.f641x.put(Long.valueOf(offerInSdk.f477a), offerInSdk);
        return new Offer(offerInSdk.f477a, offerInSdk.f482f, offerInSdk.f479c, offerInSdk.f480d, offerInSdk.f481e);
    }

    /* access modifiers changed from: package-private */
    /* renamed from: a */
    public final synchronized List mo2428a(Context context, List list, Long l, int i, boolean z) {
        List emptyList;
        if (!m577q()) {
            emptyList = Collections.emptyList();
        } else if (!this.f631n.mo2476b() || list == null) {
            emptyList = Collections.emptyList();
        } else {
            List a = m567a(list, l);
            int min = Math.min(list.size(), a.size());
            ArrayList arrayList = new ArrayList();
            for (int i2 = 0; i2 < min; i2++) {
                String str = (String) list.get(i2);
                C0307e b = this.f631n.mo2475b(str);
                if (b != null) {
                    C0318p pVar = new C0318p((String) list.get(i2), (byte) 1, mo2453k());
                    m568a(pVar);
                    if (i2 < a.size()) {
                        pVar.f610b = (C0324v) a.get(i2);
                        pVar.mo2419a(new C0308f((byte) 2, mo2453k()));
                        C0327y yVar = new C0327y(context, this, pVar, b, i, z);
                        yVar.mo2466a(m564a(pVar, (Long) null));
                        arrayList.add(yVar);
                    }
                } else {
                    C0299ah.m542d(f617a, "Cannot find hook: " + str);
                }
            }
            emptyList = arrayList;
        }
        return emptyList;
    }

    /* access modifiers changed from: package-private */
    /* renamed from: a */
    public final synchronized View mo2426a(Context context, String str, int i) {
        C0317o oVar;
        if (!m577q()) {
            oVar = null;
        } else {
            oVar = new C0317o(this, context, str, i);
            this.f639v.mo2395a(oVar);
        }
        return oVar;
    }

    /* renamed from: a */
    private void m568a(C0318p pVar) {
        if (this.f640w.size() < 32767) {
            this.f640w.add(pVar);
            this.f638u.put(Long.valueOf(pVar.mo2418a()), pVar);
        }
    }

    /* renamed from: a */
    private List m567a(List list, Long l) {
        if (list == null || list.isEmpty() || !this.f631n.mo2476b()) {
            return Collections.emptyList();
        }
        C0324v[] a = this.f631n.mo2473a((String) list.get(0));
        if (a == null || a.length <= 0) {
            return Collections.emptyList();
        }
        ArrayList arrayList = new ArrayList(Arrays.asList(a));
        Collections.shuffle(arrayList);
        if (l != null) {
            Iterator it = arrayList.iterator();
            while (true) {
                if (it.hasNext()) {
                    if (((C0324v) it.next()).f643a == l.longValue()) {
                        it.remove();
                        break;
                    }
                } else {
                    break;
                }
            }
        }
        return arrayList.subList(0, Math.min(arrayList.size(), list.size()));
    }

    /* access modifiers changed from: package-private */
    /* renamed from: k */
    public final long mo2453k() {
        return SystemClock.elapsedRealtime() - this.f630m;
    }

    public final synchronized void onClick(View view) {
        C0327y yVar = (C0327y) view;
        C0318p a = yVar.mo2465a();
        a.mo2419a(new C0308f((byte) 4, mo2453k()));
        if (this.f637t) {
            m571b(view.getContext(), a, yVar.mo2467b(this.f625h));
        } else {
            mo2433a(view.getContext(), a, yVar.mo2467b(this.f626i));
        }
    }

    /* access modifiers changed from: package-private */
    /* renamed from: a */
    public final synchronized void mo2437a(String str, String str2) {
        this.f635r.put(str, str2);
    }

    /* access modifiers changed from: package-private */
    /* renamed from: l */
    public final synchronized void mo2454l() {
        this.f635r.clear();
    }

    /* renamed from: b */
    private void m571b(Context context, C0318p pVar, String str) {
        Intent intent = new Intent(m576p());
        intent.addCategory("android.intent.category.DEFAULT");
        intent.putExtra("u", str);
        if (pVar != null) {
            intent.putExtra(AdActivity.ORIENTATION_PARAM, pVar.mo2418a());
        }
        context.startActivity(intent);
    }

    /* renamed from: p */
    private static String m576p() {
        return FlurryAgent.f418a != null ? FlurryAgent.f418a : f622f;
    }

    /* renamed from: a */
    private String m564a(C0318p pVar, Long l) {
        C0324v vVar = pVar.f610b;
        StringBuilder append = new StringBuilder().append("?apik=").append(this.f627j).append("&cid=").append(vVar.f647e).append("&adid=").append(vVar.f643a).append("&pid=").append(this.f634q).append("&iid=").append(this.f628k).append("&sid=").append(this.f629l).append("&its=").append(pVar.mo2418a()).append("&hid=").append(C0320r.m558a(pVar.f609a)).append("&ac=").append(m566a(vVar.f649g));
        if (this.f635r != null && !this.f635r.isEmpty()) {
            for (Map.Entry entry : this.f635r.entrySet()) {
                append.append(Utility.QUERY_APPENDIX).append("c_" + C0320r.m558a((String) entry.getKey())).append("=").append(C0320r.m558a((String) entry.getValue()));
            }
        }
        append.append("&ats=");
        if (l != null) {
            append.append(l);
        }
        return append.toString();
    }

    /* renamed from: a */
    private static String m566a(byte[] bArr) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < bArr.length; i++) {
            int i2 = (bArr[i] >> 4) & 15;
            if (i2 < 10) {
                sb.append((char) (i2 + 48));
            } else {
                sb.append((char) ((i2 + 65) - 10));
            }
            byte b = bArr[i] & 15;
            if (b < 10) {
                sb.append((char) (b + 48));
            } else {
                sb.append((char) ((b + 65) - 10));
            }
        }
        return sb.toString();
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("[adLogs=").append(this.f640w).append("]");
        return sb.toString();
    }

    /* access modifiers changed from: package-private */
    /* renamed from: m */
    public final synchronized AdImage mo2455m() {
        AdImage o;
        if (!m577q()) {
            o = null;
        } else {
            o = m575o();
        }
        return o;
    }

    /* renamed from: a */
    private static void m570a(Runnable runnable) {
        new Handler().post(runnable);
    }

    /* access modifiers changed from: package-private */
    /* renamed from: a */
    public final synchronized void mo2430a(int i) {
        if (this.f642y != null) {
            m570a((Runnable) new C0295ad(this, i));
        }
    }

    /* access modifiers changed from: package-private */
    /* renamed from: n */
    public final synchronized boolean mo2456n() {
        boolean b;
        if (!m577q()) {
            b = false;
        } else {
            b = this.f631n.mo2476b();
        }
        return b;
    }

    /* renamed from: q */
    private boolean m577q() {
        if (!this.f633p) {
            C0299ah.m542d(f617a, "AppCircle is not initialized");
        }
        if (this.f634q == null) {
            C0299ah.m542d(f617a, "Cannot identify UDID.");
        }
        return this.f633p;
    }
}
