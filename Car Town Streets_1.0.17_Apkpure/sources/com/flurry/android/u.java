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
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final class u implements View.OnClickListener {
    private String h;
    private String i;
    private String j;
    private long k;
    private long l;
    private long m;
    private volatile boolean p;
    private String q;
    private Handler s;
    private boolean t;
    private ag v;
    private AppCircleCallback y;
    private static volatile String c = "market://";
    private static volatile String d = "market://details?id=";
    private static volatile String e = "https://market.android.com/details?id=";
    private static String f = "com.flurry.android.ACTION_CATALOG";
    static String a = "FlurryAgent";
    private static int g = 5000;
    static String b = "";
    private static volatile long z = 0;
    private boolean o = true;
    private Map r = new HashMap();
    private transient Map u = new HashMap();
    private List w = new ArrayList();
    private Map x = new HashMap();
    private z n = new z();

    /* JADX INFO: Access modifiers changed from: package-private */
    public static /* synthetic */ void a(u uVar, Context context, String str) {
        if (!str.startsWith(d)) {
            ah.d(a, "Unexpected android market url scheme: " + str);
            return;
        }
        String substring = str.substring(d.length());
        if (!uVar.o) {
            ah.a(a, "Launching Android Market website for app " + substring);
            context.startActivity(new Intent("android.intent.action.VIEW").setData(Uri.parse(e + substring)));
            return;
        }
        try {
            ah.a(a, "Launching Android Market for app " + substring);
            context.startActivity(new Intent("android.intent.action.VIEW").setData(Uri.parse(str)));
        } catch (Exception e2) {
            ah.c(a, "Cannot launch Marketplace url " + str, e2);
        }
    }

    static {
        new Random(System.currentTimeMillis());
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final synchronized void a(Context context, a aVar) {
        boolean z2 = true;
        synchronized (this) {
            if (!this.p) {
                this.h = aVar.e;
                this.i = aVar.f;
                this.j = aVar.a;
                this.k = aVar.b;
                this.l = aVar.c;
                this.m = aVar.d;
                this.s = aVar.g;
                this.v = new ag(this.s, g);
                context.getResources().getDisplayMetrics();
                this.x.clear();
                this.u.clear();
                this.n.a(context, this, aVar);
                this.r.clear();
                PackageManager packageManager = context.getPackageManager();
                Intent intent = new Intent("android.intent.action.VIEW");
                intent.setData(Uri.parse(d + context.getPackageName()));
                if (packageManager.queryIntentActivities(intent, 65536).size() <= 0) {
                    z2 = false;
                }
                this.o = z2;
                a();
                this.p = true;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final synchronized void a() {
        this.w.clear();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final boolean b() {
        return this.p;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final void a(String str) {
        this.q = str;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final synchronized void c() {
        if (q()) {
            this.n.d();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final synchronized void d() {
        if (q()) {
            this.n.e();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final synchronized void a(Map map, Map map2, Map map3, Map map4, Map map5, Map map6) {
        if (q()) {
            this.n.a(map, map2, map3, map4, map5, map6);
            Log.i("FlurryAgent", this.n.toString());
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final synchronized long e() {
        return !q() ? 0L : this.n.c();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final synchronized Set f() {
        return !q() ? Collections.emptySet() : this.n.a();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final synchronized AdImage a(long j) {
        return !q() ? null : this.n.b(j);
    }

    private synchronized AdImage o() {
        return !q() ? null : this.n.a((short) 1);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final synchronized List g() {
        return this.w;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final synchronized p b(long j) {
        return (p) this.u.get(Long.valueOf(j));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final synchronized void h() {
        this.u.clear();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final synchronized void a(Context context, String str) {
        if (q()) {
            try {
                List a2 = a(Arrays.asList(str), (Long) null);
                if (a2 != null && !a2.isEmpty()) {
                    p pVar = new p(str, (byte) 2, SystemClock.elapsedRealtime() - this.m);
                    pVar.b = (v) a2.get(0);
                    a(pVar);
                    b(context, pVar, this.h + a(pVar, Long.valueOf(System.currentTimeMillis())));
                } else {
                    Intent intent = new Intent(p());
                    intent.addCategory("android.intent.category.DEFAULT");
                    context.startActivity(intent);
                }
            } catch (Exception e2) {
                ah.d(a, "Failed to launch promotional canvas for hook: " + str, e2);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final void a(AppCircleCallback appCircleCallback) {
        this.y = appCircleCallback;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final void a(boolean z2) {
        this.t = z2;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final boolean i() {
        return this.t;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final String j() {
        return this.h;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final synchronized void a(Context context, p pVar, String str) {
        if (q()) {
            this.s.post(new ak(this, str, context, pVar));
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public String d(String str) {
        try {
            if (!str.startsWith(c)) {
                HttpResponse execute = new DefaultHttpClient().execute(new HttpGet(str));
                int statusCode = execute.getStatusLine().getStatusCode();
                if (statusCode == 200) {
                    str = EntityUtils.toString(execute.getEntity());
                    if (!str.startsWith(c)) {
                        str = d(str);
                    }
                } else {
                    ah.c(a, "Cannot process with responseCode " + statusCode);
                    e("Error when fetching application's android market ID, responseCode " + statusCode);
                }
            }
            return str;
        } catch (UnknownHostException e2) {
            ah.c(a, "Unknown host: " + e2.getMessage());
            if (this.y != null) {
                e("Unknown host: " + e2.getMessage());
            }
            return null;
        } catch (Exception e3) {
            ah.c(a, "Failed on url: " + str, e3);
            return null;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void e(String str) {
        a(new ae(this, str));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final synchronized Offer b(String str) {
        List a2;
        Offer offer = null;
        synchronized (this) {
            if (q() && (a2 = a(Arrays.asList(str), (Long) null)) != null && !a2.isEmpty()) {
                offer = a(str, (v) a2.get(0));
                ah.a(a, "Impression for offer with ID " + offer.getId());
            }
        }
        return offer;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final synchronized void a(Context context, long j) {
        if (q()) {
            OfferInSdk offerInSdk = (OfferInSdk) this.x.get(Long.valueOf(j));
            if (offerInSdk == null) {
                ah.b(a, "Cannot find offer " + j);
            } else {
                p pVar = offerInSdk.b;
                pVar.a(new f((byte) 4, k()));
                ah.a(a, "Offer " + offerInSdk.a + " accepted. Sent with cookies: " + this.r);
                a(context, pVar, FlurryAgent.c() + a(pVar, Long.valueOf(pVar.a())));
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final synchronized List c(String str) {
        List arrayList;
        if (!q()) {
            arrayList = Collections.emptyList();
        } else if (!this.n.b()) {
            arrayList = Collections.emptyList();
        } else {
            v[] a2 = this.n.a(str);
            arrayList = new ArrayList();
            if (a2 != null && a2.length > 0) {
                for (v vVar : a2) {
                    arrayList.add(a(str, vVar));
                }
            }
            ah.a(a, "Impressions for " + arrayList.size() + " offers.");
        }
        return arrayList;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final synchronized void a(List list) {
        if (q()) {
            Iterator it = list.iterator();
            while (it.hasNext()) {
                this.x.remove((Long) it.next());
            }
        }
    }

    private Offer a(String str, v vVar) {
        p pVar = new p(str, (byte) 3, k());
        a(pVar);
        pVar.a(new f((byte) 2, k()));
        pVar.b = vVar;
        al a2 = this.n.a(vVar.a);
        String str2 = a2 == null ? "" : a2.a;
        int i = a2 == null ? 0 : a2.c;
        long j = z + 1;
        z = j;
        OfferInSdk offerInSdk = new OfferInSdk(j, pVar, vVar.h, vVar.d, str2, i);
        this.x.put(Long.valueOf(offerInSdk.a), offerInSdk);
        return new Offer(offerInSdk.a, offerInSdk.f, offerInSdk.c, offerInSdk.d, offerInSdk.e);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final synchronized List a(Context context, List list, Long l, int i, boolean z2) {
        List emptyList;
        if (!q()) {
            emptyList = Collections.emptyList();
        } else if (this.n.b() && list != null) {
            List a2 = a(list, l);
            int min = Math.min(list.size(), a2.size());
            ArrayList arrayList = new ArrayList();
            for (int i2 = 0; i2 < min; i2++) {
                String str = (String) list.get(i2);
                e b2 = this.n.b(str);
                if (b2 != null) {
                    p pVar = new p((String) list.get(i2), (byte) 1, k());
                    a(pVar);
                    if (i2 < a2.size()) {
                        pVar.b = (v) a2.get(i2);
                        pVar.a(new f((byte) 2, k()));
                        y yVar = new y(context, this, pVar, b2, i, z2);
                        yVar.a(a(pVar, (Long) null));
                        arrayList.add(yVar);
                    }
                } else {
                    ah.d(a, "Cannot find hook: " + str);
                }
            }
            emptyList = arrayList;
        } else {
            emptyList = Collections.emptyList();
        }
        return emptyList;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final synchronized View a(Context context, String str, int i) {
        o oVar;
        if (!q()) {
            oVar = null;
        } else {
            oVar = new o(this, context, str, i);
            this.v.a(oVar);
        }
        return oVar;
    }

    private void a(p pVar) {
        if (this.w.size() < 32767) {
            this.w.add(pVar);
            this.u.put(Long.valueOf(pVar.a()), pVar);
        }
    }

    private List a(List list, Long l) {
        if (list == null || list.isEmpty() || !this.n.b()) {
            return Collections.emptyList();
        }
        v[] a2 = this.n.a((String) list.get(0));
        if (a2 != null && a2.length > 0) {
            ArrayList arrayList = new ArrayList(Arrays.asList(a2));
            Collections.shuffle(arrayList);
            if (l != null) {
                Iterator it = arrayList.iterator();
                while (true) {
                    if (it.hasNext()) {
                        if (((v) it.next()).a == l.longValue()) {
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
        return Collections.emptyList();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final long k() {
        return SystemClock.elapsedRealtime() - this.m;
    }

    @Override // android.view.View.OnClickListener
    public final synchronized void onClick(View view) {
        y yVar = (y) view;
        p a2 = yVar.a();
        a2.a(new f((byte) 4, k()));
        if (this.t) {
            b(view.getContext(), a2, yVar.b(this.h));
        } else {
            a(view.getContext(), a2, yVar.b(this.i));
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final synchronized void a(String str, String str2) {
        this.r.put(str, str2);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final synchronized void l() {
        this.r.clear();
    }

    private void b(Context context, p pVar, String str) {
        Intent intent = new Intent(p());
        intent.addCategory("android.intent.category.DEFAULT");
        intent.putExtra("u", str);
        if (pVar != null) {
            intent.putExtra(AdActivity.ORIENTATION_PARAM, pVar.a());
        }
        context.startActivity(intent);
    }

    private static String p() {
        return FlurryAgent.a != null ? FlurryAgent.a : f;
    }

    private String a(p pVar, Long l) {
        v vVar = pVar.b;
        StringBuilder append = new StringBuilder().append("?apik=").append(this.j).append("&cid=").append(vVar.e).append("&adid=").append(vVar.a).append("&pid=").append(this.q).append("&iid=").append(this.k).append("&sid=").append(this.l).append("&its=").append(pVar.a()).append("&hid=").append(r.a(pVar.a)).append("&ac=").append(a(vVar.g));
        if (this.r != null && !this.r.isEmpty()) {
            for (Map.Entry entry : this.r.entrySet()) {
                String str = "c_" + r.a((String) entry.getKey());
                append.append(Utility.QUERY_APPENDIX).append(str).append("=").append(r.a((String) entry.getValue()));
            }
        }
        append.append("&ats=");
        if (l != null) {
            append.append(l);
        }
        return append.toString();
    }

    private static String a(byte[] bArr) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < bArr.length; i++) {
            int i2 = (bArr[i] >> 4) & 15;
            if (i2 < 10) {
                sb.append((char) (i2 + 48));
            } else {
                sb.append((char) ((i2 + 65) - 10));
            }
            int i3 = bArr[i] & 15;
            if (i3 < 10) {
                sb.append((char) (i3 + 48));
            } else {
                sb.append((char) ((i3 + 65) - 10));
            }
        }
        return sb.toString();
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("[adLogs=").append(this.w).append("]");
        return sb.toString();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final synchronized AdImage m() {
        return !q() ? null : o();
    }

    private static void a(Runnable runnable) {
        new Handler().post(runnable);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final synchronized void a(int i) {
        if (this.y != null) {
            a(new ad(this, i));
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final synchronized boolean n() {
        return !q() ? false : this.n.b();
    }

    private boolean q() {
        if (!this.p) {
            ah.d(a, "AppCircle is not initialized");
        }
        if (this.q == null) {
            ah.d(a, "Cannot identify UDID.");
        }
        return this.p;
    }
}
