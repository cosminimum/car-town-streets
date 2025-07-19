package com.google.ads.internal;

import android.app.Activity;
import android.content.Context;
import android.content.pm.PackageManager;
import android.telephony.TelephonyManager;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import android.webkit.WebView;
import com.getjar.sdk.utilities.Constants;
import com.google.ads.AdRequest;
import com.google.ads.AdSize;
import com.google.ads.AdView;
import com.google.ads.searchads.SearchAdRequest;
import com.google.ads.util.AdUtil;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.Locale;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.json.JSONException;

public class c implements Runnable {
    boolean a;
    private String b;
    private String c;
    private String d;
    private String e;
    private boolean f;
    private f g;
    /* access modifiers changed from: private */
    public d h;
    private AdRequest i;
    /* access modifiers changed from: private */
    public WebView j;
    private String k;
    private LinkedList<String> l;
    /* access modifiers changed from: private */
    public String m;
    /* access modifiers changed from: private */
    public AdSize n;
    private volatile boolean o;
    private boolean p;
    private AdRequest.ErrorCode q;
    private boolean r;
    private int s;
    private Thread t;
    private boolean u;
    private d v = d.ONLINE_SERVER_REQUEST;

    private class b extends Exception {
        public b(String str) {
            super(str);
        }
    }

    private static class a implements Runnable {
        private final d a;
        private final WebView b;
        private final f c;
        private final AdRequest.ErrorCode d;
        private final boolean e;

        public a(d dVar, WebView webView, f fVar, AdRequest.ErrorCode errorCode, boolean z) {
            this.a = dVar;
            this.b = webView;
            this.c = fVar;
            this.d = errorCode;
            this.e = z;
        }

        public void run() {
            if (this.b != null) {
                this.b.stopLoading();
                this.b.destroy();
            }
            if (this.c != null) {
                this.c.a();
            }
            if (this.e) {
                AdWebView k = this.a.k();
                k.stopLoading();
                k.setVisibility(8);
            }
            this.a.a(this.d);
        }
    }

    /* renamed from: com.google.ads.internal.c$c  reason: collision with other inner class name */
    private class C0006c implements Runnable {
        private final String b;
        private final String c;
        private final WebView d;

        public C0006c(WebView webView, String str, String str2) {
            this.d = webView;
            this.b = str;
            this.c = str2;
        }

        public void run() {
            if (this.c != null) {
                this.d.loadDataWithBaseURL(this.b, this.c, "text/html", "utf-8", (String) null);
            } else {
                this.d.loadUrl(this.b);
            }
        }
    }

    private static class e implements Runnable {
        private final d a;
        private final WebView b;
        private final LinkedList<String> c;
        private final int d;
        private final boolean e;
        private final String f;
        private final AdSize g;

        public e(d dVar, WebView webView, LinkedList<String> linkedList, int i, boolean z, String str, AdSize adSize) {
            this.a = dVar;
            this.b = webView;
            this.c = linkedList;
            this.d = i;
            this.e = z;
            this.f = str;
            this.g = adSize;
        }

        public void run() {
            if (this.b != null) {
                this.b.stopLoading();
                this.b.destroy();
            }
            this.a.a(this.c);
            this.a.a(this.d);
            this.a.a(this.e);
            this.a.a(this.f);
            if (this.g != null) {
                this.a.h().k.a().b(this.g);
                this.a.k().setAdSize(this.g);
            }
            this.a.C();
        }
    }

    public enum d {
        ONLINE_USING_BUFFERED_ADS("online_buffered"),
        ONLINE_SERVER_REQUEST("online_request"),
        OFFLINE_USING_BUFFERED_ADS("offline_buffered"),
        OFFLINE_EMPTY("offline_empty");
        
        public String e;

        private d(String str) {
            this.e = str;
        }
    }

    protected c() {
    }

    public c(d dVar) {
        this.h = dVar;
        this.k = null;
        this.b = null;
        this.c = null;
        this.d = null;
        this.l = new LinkedList<>();
        this.q = null;
        this.r = false;
        this.s = -1;
        this.f = false;
        this.p = false;
        this.m = null;
        this.n = null;
        if (dVar.h().e.a() != null) {
            this.j = new AdWebView(dVar.h(), (AdSize) null);
            this.j.setWebViewClient(i.a(dVar, a.b, false, false));
            this.j.setVisibility(8);
            this.j.setWillNotDraw(true);
            this.g = new f(this, dVar);
            return;
        }
        this.j = null;
        this.g = null;
        com.google.ads.util.b.e("activity was null while trying to create an AdLoader.");
    }

    /* access modifiers changed from: protected */
    public synchronized void a(String str) {
        this.l.add(str);
    }

    /* access modifiers changed from: protected */
    public void a() {
        com.google.ads.util.b.a("AdLoader cancelled.");
        if (this.j != null) {
            this.j.stopLoading();
            this.j.destroy();
        }
        if (this.t != null) {
            this.t.interrupt();
            this.t = null;
        }
        if (this.g != null) {
            this.g.a();
        }
        this.o = true;
    }

    /* access modifiers changed from: protected */
    public void a(AdRequest adRequest) {
        this.i = adRequest;
        this.o = false;
        this.t = new Thread(this);
        this.t.start();
    }

    /* JADX WARNING: Can't fix incorrect switch cases order */
    /* JADX WARNING: Removed duplicated region for block: B:127:0x0226 A[SYNTHETIC, Splitter:B:127:0x0226] */
    /* JADX WARNING: Removed duplicated region for block: B:93:0x0174 A[Catch:{ Throwable -> 0x00de }] */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void run() {
        /*
            r11 = this;
            r9 = 0
            monitor-enter(r11)
            android.webkit.WebView r0 = r11.j     // Catch:{ Throwable -> 0x00de }
            if (r0 == 0) goto L_0x000b
            com.google.ads.internal.f r0 = r11.g     // Catch:{ Throwable -> 0x00de }
            if (r0 != 0) goto L_0x0018
        L_0x000b:
            java.lang.String r0 = "adRequestWebView was null while trying to load an ad."
            com.google.ads.util.b.e(r0)     // Catch:{ Throwable -> 0x00de }
            com.google.ads.AdRequest$ErrorCode r0 = com.google.ads.AdRequest.ErrorCode.INTERNAL_ERROR     // Catch:{ Throwable -> 0x00de }
            r1 = 0
            r11.a((com.google.ads.AdRequest.ErrorCode) r0, (boolean) r1)     // Catch:{ Throwable -> 0x00de }
            monitor-exit(r11)     // Catch:{ all -> 0x0035 }
        L_0x0017:
            return
        L_0x0018:
            com.google.ads.internal.d r0 = r11.h     // Catch:{ Throwable -> 0x00de }
            com.google.ads.m r0 = r0.h()     // Catch:{ Throwable -> 0x00de }
            com.google.ads.util.i$d<android.app.Activity> r0 = r0.e     // Catch:{ Throwable -> 0x00de }
            java.lang.Object r0 = r0.a()     // Catch:{ Throwable -> 0x00de }
            android.app.Activity r0 = (android.app.Activity) r0     // Catch:{ Throwable -> 0x00de }
            if (r0 != 0) goto L_0x0038
            java.lang.String r0 = "activity was null while forming an ad request."
            com.google.ads.util.b.e(r0)     // Catch:{ Throwable -> 0x00de }
            com.google.ads.AdRequest$ErrorCode r0 = com.google.ads.AdRequest.ErrorCode.INTERNAL_ERROR     // Catch:{ Throwable -> 0x00de }
            r1 = 0
            r11.a((com.google.ads.AdRequest.ErrorCode) r0, (boolean) r1)     // Catch:{ Throwable -> 0x00de }
            monitor-exit(r11)     // Catch:{ all -> 0x0035 }
            goto L_0x0017
        L_0x0035:
            r0 = move-exception
            monitor-exit(r11)     // Catch:{ all -> 0x0035 }
            throw r0
        L_0x0038:
            com.google.ads.internal.d r1 = r11.h     // Catch:{ Throwable -> 0x00de }
            long r3 = r1.o()     // Catch:{ Throwable -> 0x00de }
            long r5 = android.os.SystemClock.elapsedRealtime()     // Catch:{ Throwable -> 0x00de }
            com.google.ads.AdRequest r2 = r11.i     // Catch:{ Throwable -> 0x00de }
            com.google.ads.internal.d r1 = r11.h     // Catch:{ Throwable -> 0x00de }
            com.google.ads.m r1 = r1.h()     // Catch:{ Throwable -> 0x00de }
            com.google.ads.util.i$b<android.content.Context> r1 = r1.f     // Catch:{ Throwable -> 0x00de }
            java.lang.Object r1 = r1.a()     // Catch:{ Throwable -> 0x00de }
            android.content.Context r1 = (android.content.Context) r1     // Catch:{ Throwable -> 0x00de }
            java.util.Map r7 = r2.getRequestMap(r1)     // Catch:{ Throwable -> 0x00de }
            java.lang.String r1 = "extras"
            java.lang.Object r1 = r7.get(r1)     // Catch:{ Throwable -> 0x00de }
            boolean r2 = r1 instanceof java.util.Map     // Catch:{ Throwable -> 0x00de }
            if (r2 == 0) goto L_0x00aa
            java.util.Map r1 = (java.util.Map) r1     // Catch:{ Throwable -> 0x00de }
            java.lang.String r2 = "_adUrl"
            java.lang.Object r2 = r1.get(r2)     // Catch:{ Throwable -> 0x00de }
            boolean r8 = r2 instanceof java.lang.String     // Catch:{ Throwable -> 0x00de }
            if (r8 == 0) goto L_0x0070
            java.lang.String r2 = (java.lang.String) r2     // Catch:{ Throwable -> 0x00de }
            r11.b = r2     // Catch:{ Throwable -> 0x00de }
        L_0x0070:
            java.lang.String r2 = "_requestUrl"
            java.lang.Object r2 = r1.get(r2)     // Catch:{ Throwable -> 0x00de }
            boolean r8 = r2 instanceof java.lang.String     // Catch:{ Throwable -> 0x00de }
            if (r8 == 0) goto L_0x007e
            java.lang.String r2 = (java.lang.String) r2     // Catch:{ Throwable -> 0x00de }
            r11.k = r2     // Catch:{ Throwable -> 0x00de }
        L_0x007e:
            java.lang.String r2 = "_orientation"
            java.lang.Object r2 = r1.get(r2)     // Catch:{ Throwable -> 0x00de }
            boolean r8 = r2 instanceof java.lang.String     // Catch:{ Throwable -> 0x00de }
            if (r8 == 0) goto L_0x0093
            java.lang.String r8 = "p"
            boolean r8 = r2.equals(r8)     // Catch:{ Throwable -> 0x00de }
            if (r8 == 0) goto L_0x00d2
            r2 = 1
            r11.s = r2     // Catch:{ Throwable -> 0x00de }
        L_0x0093:
            java.lang.String r2 = "_norefresh"
            java.lang.Object r1 = r1.get(r2)     // Catch:{ Throwable -> 0x00de }
            boolean r2 = r1 instanceof java.lang.String     // Catch:{ Throwable -> 0x00de }
            if (r2 == 0) goto L_0x00aa
            java.lang.String r2 = "t"
            boolean r1 = r1.equals(r2)     // Catch:{ Throwable -> 0x00de }
            if (r1 == 0) goto L_0x00aa
            com.google.ads.internal.d r1 = r11.h     // Catch:{ Throwable -> 0x00de }
            r1.d()     // Catch:{ Throwable -> 0x00de }
        L_0x00aa:
            java.lang.String r1 = r11.b     // Catch:{ Throwable -> 0x00de }
            if (r1 != 0) goto L_0x0242
            java.lang.String r1 = r11.k     // Catch:{ Throwable -> 0x00de }
            if (r1 != 0) goto L_0x015d
            java.lang.String r0 = r11.a((java.util.Map<java.lang.String, java.lang.Object>) r7, (android.app.Activity) r0)     // Catch:{ b -> 0x00ed }
            java.lang.String r1 = r11.f()     // Catch:{ Throwable -> 0x00de }
            r11.b(r0, r1)     // Catch:{ Throwable -> 0x00de }
            long r0 = android.os.SystemClock.elapsedRealtime()     // Catch:{ Throwable -> 0x00de }
            long r0 = r0 - r5
            long r0 = r3 - r0
            int r2 = (r0 > r9 ? 1 : (r0 == r9 ? 0 : -1))
            if (r2 <= 0) goto L_0x00cb
            r11.wait(r0)     // Catch:{ InterruptedException -> 0x010d }
        L_0x00cb:
            boolean r0 = r11.o     // Catch:{ Throwable -> 0x00de }
            if (r0 == 0) goto L_0x0127
            monitor-exit(r11)     // Catch:{ all -> 0x0035 }
            goto L_0x0017
        L_0x00d2:
            java.lang.String r8 = "l"
            boolean r2 = r2.equals(r8)     // Catch:{ Throwable -> 0x00de }
            if (r2 == 0) goto L_0x0093
            r2 = 0
            r11.s = r2     // Catch:{ Throwable -> 0x00de }
            goto L_0x0093
        L_0x00de:
            r0 = move-exception
            java.lang.String r1 = "An unknown error occurred in AdLoader."
            com.google.ads.util.b.b(r1, r0)     // Catch:{ all -> 0x0035 }
            com.google.ads.AdRequest$ErrorCode r0 = com.google.ads.AdRequest.ErrorCode.INTERNAL_ERROR     // Catch:{ all -> 0x0035 }
            r1 = 1
            r11.a((com.google.ads.AdRequest.ErrorCode) r0, (boolean) r1)     // Catch:{ all -> 0x0035 }
        L_0x00ea:
            monitor-exit(r11)     // Catch:{ all -> 0x0035 }
            goto L_0x0017
        L_0x00ed:
            r0 = move-exception
            java.lang.StringBuilder r1 = new java.lang.StringBuilder     // Catch:{ Throwable -> 0x00de }
            r1.<init>()     // Catch:{ Throwable -> 0x00de }
            java.lang.String r2 = "Caught internal exception: "
            java.lang.StringBuilder r1 = r1.append(r2)     // Catch:{ Throwable -> 0x00de }
            java.lang.StringBuilder r0 = r1.append(r0)     // Catch:{ Throwable -> 0x00de }
            java.lang.String r0 = r0.toString()     // Catch:{ Throwable -> 0x00de }
            com.google.ads.util.b.c(r0)     // Catch:{ Throwable -> 0x00de }
            com.google.ads.AdRequest$ErrorCode r0 = com.google.ads.AdRequest.ErrorCode.INTERNAL_ERROR     // Catch:{ Throwable -> 0x00de }
            r1 = 0
            r11.a((com.google.ads.AdRequest.ErrorCode) r0, (boolean) r1)     // Catch:{ Throwable -> 0x00de }
            monitor-exit(r11)     // Catch:{ all -> 0x0035 }
            goto L_0x0017
        L_0x010d:
            r0 = move-exception
            java.lang.StringBuilder r1 = new java.lang.StringBuilder     // Catch:{ Throwable -> 0x00de }
            r1.<init>()     // Catch:{ Throwable -> 0x00de }
            java.lang.String r2 = "AdLoader InterruptedException while getting the URL: "
            java.lang.StringBuilder r1 = r1.append(r2)     // Catch:{ Throwable -> 0x00de }
            java.lang.StringBuilder r0 = r1.append(r0)     // Catch:{ Throwable -> 0x00de }
            java.lang.String r0 = r0.toString()     // Catch:{ Throwable -> 0x00de }
            com.google.ads.util.b.a((java.lang.String) r0)     // Catch:{ Throwable -> 0x00de }
            monitor-exit(r11)     // Catch:{ all -> 0x0035 }
            goto L_0x0017
        L_0x0127:
            com.google.ads.AdRequest$ErrorCode r0 = r11.q     // Catch:{ Throwable -> 0x00de }
            if (r0 == 0) goto L_0x0134
            com.google.ads.AdRequest$ErrorCode r0 = r11.q     // Catch:{ Throwable -> 0x00de }
            r1 = 0
            r11.a((com.google.ads.AdRequest.ErrorCode) r0, (boolean) r1)     // Catch:{ Throwable -> 0x00de }
            monitor-exit(r11)     // Catch:{ all -> 0x0035 }
            goto L_0x0017
        L_0x0134:
            java.lang.String r0 = r11.k     // Catch:{ Throwable -> 0x00de }
            if (r0 != 0) goto L_0x015d
            java.lang.StringBuilder r0 = new java.lang.StringBuilder     // Catch:{ Throwable -> 0x00de }
            r0.<init>()     // Catch:{ Throwable -> 0x00de }
            java.lang.String r1 = "AdLoader timed out after "
            java.lang.StringBuilder r0 = r0.append(r1)     // Catch:{ Throwable -> 0x00de }
            java.lang.StringBuilder r0 = r0.append(r3)     // Catch:{ Throwable -> 0x00de }
            java.lang.String r1 = "ms while getting the URL."
            java.lang.StringBuilder r0 = r0.append(r1)     // Catch:{ Throwable -> 0x00de }
            java.lang.String r0 = r0.toString()     // Catch:{ Throwable -> 0x00de }
            com.google.ads.util.b.c(r0)     // Catch:{ Throwable -> 0x00de }
            com.google.ads.AdRequest$ErrorCode r0 = com.google.ads.AdRequest.ErrorCode.NETWORK_ERROR     // Catch:{ Throwable -> 0x00de }
            r1 = 0
            r11.a((com.google.ads.AdRequest.ErrorCode) r0, (boolean) r1)     // Catch:{ Throwable -> 0x00de }
            monitor-exit(r11)     // Catch:{ all -> 0x0035 }
            goto L_0x0017
        L_0x015d:
            com.google.ads.internal.d r0 = r11.h     // Catch:{ Throwable -> 0x00de }
            com.google.ads.internal.g r0 = r0.m()     // Catch:{ Throwable -> 0x00de }
            int[] r1 = com.google.ads.internal.c.AnonymousClass2.a     // Catch:{ Throwable -> 0x00de }
            com.google.ads.internal.c$d r2 = r11.v     // Catch:{ Throwable -> 0x00de }
            int r2 = r2.ordinal()     // Catch:{ Throwable -> 0x00de }
            r1 = r1[r2]     // Catch:{ Throwable -> 0x00de }
            switch(r1) {
                case 1: goto L_0x019c;
                case 2: goto L_0x01ab;
                case 3: goto L_0x01b4;
                case 4: goto L_0x01c0;
                default: goto L_0x0170;
            }     // Catch:{ Throwable -> 0x00de }
        L_0x0170:
            boolean r0 = r11.a     // Catch:{ Throwable -> 0x00de }
            if (r0 != 0) goto L_0x0226
            java.lang.String r0 = "Not using loadUrl()."
            com.google.ads.util.b.a((java.lang.String) r0)     // Catch:{ Throwable -> 0x00de }
            com.google.ads.internal.f r0 = r11.g     // Catch:{ Throwable -> 0x00de }
            boolean r1 = r11.u     // Catch:{ Throwable -> 0x00de }
            r0.a((boolean) r1)     // Catch:{ Throwable -> 0x00de }
            com.google.ads.internal.f r0 = r11.g     // Catch:{ Throwable -> 0x00de }
            java.lang.String r1 = r11.k     // Catch:{ Throwable -> 0x00de }
            r0.a((java.lang.String) r1)     // Catch:{ Throwable -> 0x00de }
            long r0 = android.os.SystemClock.elapsedRealtime()     // Catch:{ Throwable -> 0x00de }
            long r0 = r0 - r5
            long r0 = r3 - r0
            int r2 = (r0 > r9 ? 1 : (r0 == r9 ? 0 : -1))
            if (r2 <= 0) goto L_0x0195
            r11.wait(r0)     // Catch:{ InterruptedException -> 0x01d6 }
        L_0x0195:
            boolean r0 = r11.o     // Catch:{ Throwable -> 0x00de }
            if (r0 == 0) goto L_0x01f0
            monitor-exit(r11)     // Catch:{ all -> 0x0035 }
            goto L_0x0017
        L_0x019c:
            r0.r()     // Catch:{ Throwable -> 0x00de }
            r0.u()     // Catch:{ Throwable -> 0x00de }
            r0.x()     // Catch:{ Throwable -> 0x00de }
            java.lang.String r0 = "Request scenario: Online server request."
            com.google.ads.util.b.c(r0)     // Catch:{ Throwable -> 0x00de }
            goto L_0x0170
        L_0x01ab:
            r0.t()     // Catch:{ Throwable -> 0x00de }
            java.lang.String r0 = "Request scenario: Online using buffered ads."
            com.google.ads.util.b.c(r0)     // Catch:{ Throwable -> 0x00de }
            goto L_0x0170
        L_0x01b4:
            r0.w()     // Catch:{ Throwable -> 0x00de }
            r0.q()     // Catch:{ Throwable -> 0x00de }
            java.lang.String r0 = "Request scenario: Offline using buffered ads."
            com.google.ads.util.b.c(r0)     // Catch:{ Throwable -> 0x00de }
            goto L_0x0170
        L_0x01c0:
            r0.q()     // Catch:{ Throwable -> 0x00de }
            java.lang.String r0 = "Request scenario: Offline with no buffered ads."
            com.google.ads.util.b.c(r0)     // Catch:{ Throwable -> 0x00de }
            java.lang.String r0 = "Network is unavailable.  Aborting ad request."
            com.google.ads.util.b.c(r0)     // Catch:{ Throwable -> 0x00de }
            com.google.ads.AdRequest$ErrorCode r0 = com.google.ads.AdRequest.ErrorCode.NETWORK_ERROR     // Catch:{ Throwable -> 0x00de }
            r1 = 0
            r11.a((com.google.ads.AdRequest.ErrorCode) r0, (boolean) r1)     // Catch:{ Throwable -> 0x00de }
            monitor-exit(r11)     // Catch:{ all -> 0x0035 }
            goto L_0x0017
        L_0x01d6:
            r0 = move-exception
            java.lang.StringBuilder r1 = new java.lang.StringBuilder     // Catch:{ Throwable -> 0x00de }
            r1.<init>()     // Catch:{ Throwable -> 0x00de }
            java.lang.String r2 = "AdLoader InterruptedException while getting the ad server's response: "
            java.lang.StringBuilder r1 = r1.append(r2)     // Catch:{ Throwable -> 0x00de }
            java.lang.StringBuilder r0 = r1.append(r0)     // Catch:{ Throwable -> 0x00de }
            java.lang.String r0 = r0.toString()     // Catch:{ Throwable -> 0x00de }
            com.google.ads.util.b.a((java.lang.String) r0)     // Catch:{ Throwable -> 0x00de }
            monitor-exit(r11)     // Catch:{ all -> 0x0035 }
            goto L_0x0017
        L_0x01f0:
            com.google.ads.AdRequest$ErrorCode r0 = r11.q     // Catch:{ Throwable -> 0x00de }
            if (r0 == 0) goto L_0x01fd
            com.google.ads.AdRequest$ErrorCode r0 = r11.q     // Catch:{ Throwable -> 0x00de }
            r1 = 0
            r11.a((com.google.ads.AdRequest.ErrorCode) r0, (boolean) r1)     // Catch:{ Throwable -> 0x00de }
            monitor-exit(r11)     // Catch:{ all -> 0x0035 }
            goto L_0x0017
        L_0x01fd:
            java.lang.String r0 = r11.c     // Catch:{ Throwable -> 0x00de }
            if (r0 != 0) goto L_0x0242
            java.lang.StringBuilder r0 = new java.lang.StringBuilder     // Catch:{ Throwable -> 0x00de }
            r0.<init>()     // Catch:{ Throwable -> 0x00de }
            java.lang.String r1 = "AdLoader timed out after "
            java.lang.StringBuilder r0 = r0.append(r1)     // Catch:{ Throwable -> 0x00de }
            java.lang.StringBuilder r0 = r0.append(r3)     // Catch:{ Throwable -> 0x00de }
            java.lang.String r1 = "ms while waiting for the ad server's response."
            java.lang.StringBuilder r0 = r0.append(r1)     // Catch:{ Throwable -> 0x00de }
            java.lang.String r0 = r0.toString()     // Catch:{ Throwable -> 0x00de }
            com.google.ads.util.b.c(r0)     // Catch:{ Throwable -> 0x00de }
            com.google.ads.AdRequest$ErrorCode r0 = com.google.ads.AdRequest.ErrorCode.NETWORK_ERROR     // Catch:{ Throwable -> 0x00de }
            r1 = 0
            r11.a((com.google.ads.AdRequest.ErrorCode) r0, (boolean) r1)     // Catch:{ Throwable -> 0x00de }
            monitor-exit(r11)     // Catch:{ all -> 0x0035 }
            goto L_0x0017
        L_0x0226:
            java.lang.String r0 = r11.k     // Catch:{ Throwable -> 0x00de }
            r11.b = r0     // Catch:{ Throwable -> 0x00de }
            java.lang.StringBuilder r0 = new java.lang.StringBuilder     // Catch:{ Throwable -> 0x00de }
            r0.<init>()     // Catch:{ Throwable -> 0x00de }
            java.lang.String r1 = "Using loadUrl.  adBaseUrl: "
            java.lang.StringBuilder r0 = r0.append(r1)     // Catch:{ Throwable -> 0x00de }
            java.lang.String r1 = r11.b     // Catch:{ Throwable -> 0x00de }
            java.lang.StringBuilder r0 = r0.append(r1)     // Catch:{ Throwable -> 0x00de }
            java.lang.String r0 = r0.toString()     // Catch:{ Throwable -> 0x00de }
            com.google.ads.util.b.a((java.lang.String) r0)     // Catch:{ Throwable -> 0x00de }
        L_0x0242:
            boolean r0 = r11.a     // Catch:{ Throwable -> 0x00de }
            if (r0 != 0) goto L_0x02fc
            boolean r0 = r11.f     // Catch:{ Throwable -> 0x00de }
            if (r0 == 0) goto L_0x0256
            com.google.ads.internal.d r0 = r11.h     // Catch:{ Throwable -> 0x00de }
            r1 = 1
            r0.b((boolean) r1)     // Catch:{ Throwable -> 0x00de }
            r11.b()     // Catch:{ Throwable -> 0x00de }
            monitor-exit(r11)     // Catch:{ all -> 0x0035 }
            goto L_0x0017
        L_0x0256:
            java.lang.String r0 = r11.e     // Catch:{ Throwable -> 0x00de }
            if (r0 == 0) goto L_0x0295
            java.lang.String r0 = r11.e     // Catch:{ Throwable -> 0x00de }
            java.lang.String r1 = "application/json"
            boolean r0 = r0.startsWith(r1)     // Catch:{ Throwable -> 0x00de }
            if (r0 != 0) goto L_0x026e
            java.lang.String r0 = r11.e     // Catch:{ Throwable -> 0x00de }
            java.lang.String r1 = "text/javascript"
            boolean r0 = r0.startsWith(r1)     // Catch:{ Throwable -> 0x00de }
            if (r0 == 0) goto L_0x0295
        L_0x026e:
            java.lang.StringBuilder r0 = new java.lang.StringBuilder     // Catch:{ Throwable -> 0x00de }
            r0.<init>()     // Catch:{ Throwable -> 0x00de }
            java.lang.String r1 = "Expected HTML but received "
            java.lang.StringBuilder r0 = r0.append(r1)     // Catch:{ Throwable -> 0x00de }
            java.lang.String r1 = r11.e     // Catch:{ Throwable -> 0x00de }
            java.lang.StringBuilder r0 = r0.append(r1)     // Catch:{ Throwable -> 0x00de }
            java.lang.String r1 = "."
            java.lang.StringBuilder r0 = r0.append(r1)     // Catch:{ Throwable -> 0x00de }
            java.lang.String r0 = r0.toString()     // Catch:{ Throwable -> 0x00de }
            com.google.ads.util.b.b(r0)     // Catch:{ Throwable -> 0x00de }
            com.google.ads.AdRequest$ErrorCode r0 = com.google.ads.AdRequest.ErrorCode.INTERNAL_ERROR     // Catch:{ Throwable -> 0x00de }
            r1 = 0
            r11.a((com.google.ads.AdRequest.ErrorCode) r0, (boolean) r1)     // Catch:{ Throwable -> 0x00de }
            monitor-exit(r11)     // Catch:{ all -> 0x0035 }
            goto L_0x0017
        L_0x0295:
            com.google.ads.internal.d r0 = r11.h     // Catch:{ Throwable -> 0x00de }
            com.google.ads.m r0 = r0.h()     // Catch:{ Throwable -> 0x00de }
            com.google.ads.util.i$c<com.google.ads.AdSize[]> r0 = r0.l     // Catch:{ Throwable -> 0x00de }
            java.lang.Object r0 = r0.a()     // Catch:{ Throwable -> 0x00de }
            if (r0 == 0) goto L_0x02f0
            com.google.ads.AdSize r0 = r11.n     // Catch:{ Throwable -> 0x00de }
            if (r0 != 0) goto L_0x02b5
            java.lang.String r0 = "Multiple supported ad sizes were specified, but the server did not respond with a size."
            com.google.ads.util.b.b(r0)     // Catch:{ Throwable -> 0x00de }
            com.google.ads.AdRequest$ErrorCode r0 = com.google.ads.AdRequest.ErrorCode.INTERNAL_ERROR     // Catch:{ Throwable -> 0x00de }
            r1 = 0
            r11.a((com.google.ads.AdRequest.ErrorCode) r0, (boolean) r1)     // Catch:{ Throwable -> 0x00de }
            monitor-exit(r11)     // Catch:{ all -> 0x0035 }
            goto L_0x0017
        L_0x02b5:
            com.google.ads.internal.d r0 = r11.h     // Catch:{ Throwable -> 0x00de }
            com.google.ads.m r0 = r0.h()     // Catch:{ Throwable -> 0x00de }
            com.google.ads.util.i$c<com.google.ads.AdSize[]> r0 = r0.l     // Catch:{ Throwable -> 0x00de }
            java.lang.Object r0 = r0.a()     // Catch:{ Throwable -> 0x00de }
            java.lang.Object[] r0 = (java.lang.Object[]) r0     // Catch:{ Throwable -> 0x00de }
            java.util.List r0 = java.util.Arrays.asList(r0)     // Catch:{ Throwable -> 0x00de }
            com.google.ads.AdSize r1 = r11.n     // Catch:{ Throwable -> 0x00de }
            boolean r0 = r0.contains(r1)     // Catch:{ Throwable -> 0x00de }
            if (r0 != 0) goto L_0x02fc
            java.lang.StringBuilder r0 = new java.lang.StringBuilder     // Catch:{ Throwable -> 0x00de }
            r0.<init>()     // Catch:{ Throwable -> 0x00de }
            java.lang.String r1 = "The ad server did not respond with a supported AdSize: "
            java.lang.StringBuilder r0 = r0.append(r1)     // Catch:{ Throwable -> 0x00de }
            com.google.ads.AdSize r1 = r11.n     // Catch:{ Throwable -> 0x00de }
            java.lang.StringBuilder r0 = r0.append(r1)     // Catch:{ Throwable -> 0x00de }
            java.lang.String r0 = r0.toString()     // Catch:{ Throwable -> 0x00de }
            com.google.ads.util.b.b(r0)     // Catch:{ Throwable -> 0x00de }
            com.google.ads.AdRequest$ErrorCode r0 = com.google.ads.AdRequest.ErrorCode.INTERNAL_ERROR     // Catch:{ Throwable -> 0x00de }
            r1 = 0
            r11.a((com.google.ads.AdRequest.ErrorCode) r0, (boolean) r1)     // Catch:{ Throwable -> 0x00de }
            monitor-exit(r11)     // Catch:{ all -> 0x0035 }
            goto L_0x0017
        L_0x02f0:
            com.google.ads.AdSize r0 = r11.n     // Catch:{ Throwable -> 0x00de }
            if (r0 == 0) goto L_0x02fc
            java.lang.String r0 = "adSize was expected to be null in AdLoader."
            com.google.ads.util.b.e(r0)     // Catch:{ Throwable -> 0x00de }
            r0 = 0
            r11.n = r0     // Catch:{ Throwable -> 0x00de }
        L_0x02fc:
            com.google.ads.internal.d r0 = r11.h     // Catch:{ Throwable -> 0x00de }
            r1 = 0
            r0.b((boolean) r1)     // Catch:{ Throwable -> 0x00de }
            r11.i()     // Catch:{ Throwable -> 0x00de }
            long r0 = android.os.SystemClock.elapsedRealtime()     // Catch:{ Throwable -> 0x00de }
            long r0 = r0 - r5
            long r0 = r3 - r0
            int r2 = (r0 > r9 ? 1 : (r0 == r9 ? 0 : -1))
            if (r2 <= 0) goto L_0x0313
            r11.wait(r0)     // Catch:{ InterruptedException -> 0x031c }
        L_0x0313:
            boolean r0 = r11.r     // Catch:{ Throwable -> 0x00de }
            if (r0 == 0) goto L_0x0336
            r11.j()     // Catch:{ Throwable -> 0x00de }
            goto L_0x00ea
        L_0x031c:
            r0 = move-exception
            java.lang.StringBuilder r1 = new java.lang.StringBuilder     // Catch:{ Throwable -> 0x00de }
            r1.<init>()     // Catch:{ Throwable -> 0x00de }
            java.lang.String r2 = "AdLoader InterruptedException while loading the HTML: "
            java.lang.StringBuilder r1 = r1.append(r2)     // Catch:{ Throwable -> 0x00de }
            java.lang.StringBuilder r0 = r1.append(r0)     // Catch:{ Throwable -> 0x00de }
            java.lang.String r0 = r0.toString()     // Catch:{ Throwable -> 0x00de }
            com.google.ads.util.b.a((java.lang.String) r0)     // Catch:{ Throwable -> 0x00de }
            monitor-exit(r11)     // Catch:{ all -> 0x0035 }
            goto L_0x0017
        L_0x0336:
            java.lang.StringBuilder r0 = new java.lang.StringBuilder     // Catch:{ Throwable -> 0x00de }
            r0.<init>()     // Catch:{ Throwable -> 0x00de }
            java.lang.String r1 = "AdLoader timed out after "
            java.lang.StringBuilder r0 = r0.append(r1)     // Catch:{ Throwable -> 0x00de }
            java.lang.StringBuilder r0 = r0.append(r3)     // Catch:{ Throwable -> 0x00de }
            java.lang.String r1 = "ms while loading the HTML."
            java.lang.StringBuilder r0 = r0.append(r1)     // Catch:{ Throwable -> 0x00de }
            java.lang.String r0 = r0.toString()     // Catch:{ Throwable -> 0x00de }
            com.google.ads.util.b.c(r0)     // Catch:{ Throwable -> 0x00de }
            com.google.ads.AdRequest$ErrorCode r0 = com.google.ads.AdRequest.ErrorCode.NETWORK_ERROR     // Catch:{ Throwable -> 0x00de }
            r1 = 1
            r11.a((com.google.ads.AdRequest.ErrorCode) r0, (boolean) r1)     // Catch:{ Throwable -> 0x00de }
            goto L_0x00ea
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.ads.internal.c.run():void");
    }

    /* access modifiers changed from: protected */
    public void b() {
        try {
            if (TextUtils.isEmpty(this.e)) {
                com.google.ads.util.b.b("Got a mediation response with no content type. Aborting mediation.");
                a(AdRequest.ErrorCode.INTERNAL_ERROR, false);
            } else if (!this.e.startsWith("application/json")) {
                com.google.ads.util.b.b("Got a mediation response with a content type: '" + this.e + "'. Expected something starting with 'application/json'. Aborting mediation.");
                a(AdRequest.ErrorCode.INTERNAL_ERROR, false);
            } else {
                final com.google.ads.c a2 = com.google.ads.c.a(this.c);
                a(this.d, a2, this.h.i());
                this.h.a((Runnable) new Runnable() {
                    public void run() {
                        if (c.this.j != null) {
                            c.this.j.stopLoading();
                            c.this.j.destroy();
                        }
                        c.this.h.a(c.this.m);
                        if (c.this.n != null) {
                            c.this.h.h().k.a().b(c.this.n);
                        }
                        c.this.h.a(a2);
                    }
                });
            }
        } catch (JSONException e2) {
            com.google.ads.util.b.b("AdLoader can't parse gWhirl server configuration.", e2);
            a(AdRequest.ErrorCode.INTERNAL_ERROR, false);
        }
    }

    static void a(String str, com.google.ads.c cVar, com.google.ads.d dVar) {
        if (str != null && !str.contains("no-store") && !str.contains("no-cache")) {
            Matcher matcher = Pattern.compile("max-age\\s*=\\s*(\\d+)").matcher(str);
            if (matcher.find()) {
                try {
                    int parseInt = Integer.parseInt(matcher.group(1));
                    dVar.a(cVar, parseInt);
                    com.google.ads.util.b.c(String.format(Locale.US, "Caching gWhirl configuration for: %d seconds", new Object[]{Integer.valueOf(parseInt)}));
                } catch (NumberFormatException e2) {
                    com.google.ads.util.b.b("Caught exception trying to parse cache control directive. Overflow?", e2);
                }
            } else {
                com.google.ads.util.b.c("Unrecognized cacheControlDirective: '" + str + "'. Not caching configuration.");
            }
        }
    }

    public String a(Map<String, Object> map, Activity activity) throws b {
        int i2;
        Context applicationContext = activity.getApplicationContext();
        g m2 = this.h.m();
        long m3 = m2.m();
        if (m3 > 0) {
            map.put("prl", Long.valueOf(m3));
        }
        long n2 = m2.n();
        if (n2 > 0) {
            map.put("prnl", Long.valueOf(n2));
        }
        String l2 = m2.l();
        if (l2 != null) {
            map.put("ppcl", l2);
        }
        String k2 = m2.k();
        if (k2 != null) {
            map.put("pcl", k2);
        }
        long j2 = m2.j();
        if (j2 > 0) {
            map.put("pcc", Long.valueOf(j2));
        }
        map.put("preqs", Long.valueOf(m2.o()));
        map.put("oar", Long.valueOf(m2.p()));
        map.put("bas_on", Long.valueOf(m2.s()));
        map.put("bas_off", Long.valueOf(m2.v()));
        if (m2.y()) {
            map.put("aoi_timeout", "true");
        }
        if (m2.A()) {
            map.put("aoi_nofill", "true");
        }
        String D = m2.D();
        if (D != null) {
            map.put("pit", D);
        }
        map.put("ptime", Long.valueOf(g.E()));
        m2.a();
        m2.i();
        if (this.h.h().b()) {
            map.put("format", "interstitial_mb");
        } else {
            AdSize b2 = this.h.h().k.a().b();
            if (b2.isFullWidth()) {
                map.put("smart_w", "full");
            }
            if (b2.isAutoHeight()) {
                map.put("smart_h", "auto");
            }
            if (!b2.isCustomAdSize()) {
                map.put("format", b2.toString());
            } else {
                HashMap hashMap = new HashMap();
                hashMap.put("w", Integer.valueOf(b2.getWidth()));
                hashMap.put("h", Integer.valueOf(b2.getHeight()));
                map.put("ad_frame", hashMap);
            }
        }
        map.put("slotname", this.h.h().d.a());
        map.put("js", "afma-sdk-a-v6.2.0");
        try {
            int i3 = applicationContext.getPackageManager().getPackageInfo(applicationContext.getPackageName(), 0).versionCode;
            String f2 = AdUtil.f(applicationContext);
            if (!TextUtils.isEmpty(f2)) {
                map.put("mv", f2);
            }
            map.put("msid", applicationContext.getPackageName());
            map.put("app_name", i3 + ".android." + applicationContext.getPackageName());
            map.put("isu", AdUtil.a(applicationContext));
            String d2 = AdUtil.d(applicationContext);
            if (d2 == null) {
                d2 = "null";
            }
            map.put("net", d2);
            String e2 = AdUtil.e(applicationContext);
            if (!(e2 == null || e2.length() == 0)) {
                map.put("cap", e2);
            }
            map.put("u_audio", Integer.valueOf(AdUtil.g(applicationContext).ordinal()));
            DisplayMetrics a2 = AdUtil.a(activity);
            map.put("u_sd", Float.valueOf(a2.density));
            map.put("u_h", Integer.valueOf(AdUtil.a(applicationContext, a2)));
            map.put("u_w", Integer.valueOf(AdUtil.b(applicationContext, a2)));
            map.put("hl", Locale.getDefault().getLanguage());
            if (!(this.h.h().i == null || this.h.h().i.a() == null)) {
                AdView a3 = this.h.h().i.a();
                if (a3.getParent() != null) {
                    int[] iArr = new int[2];
                    a3.getLocationOnScreen(iArr);
                    int i4 = iArr[0];
                    int i5 = iArr[1];
                    DisplayMetrics displayMetrics = this.h.h().f.a().getResources().getDisplayMetrics();
                    int i6 = displayMetrics.widthPixels;
                    int i7 = displayMetrics.heightPixels;
                    if (!a3.isShown() || a3.getWidth() + i4 <= 0 || a3.getHeight() + i5 <= 0 || i4 > i6 || i5 > i7) {
                        i2 = 0;
                    } else {
                        i2 = 1;
                    }
                    HashMap hashMap2 = new HashMap();
                    hashMap2.put(Constants.X, Integer.valueOf(i4));
                    hashMap2.put(Constants.Y, Integer.valueOf(i5));
                    hashMap2.put("width", Integer.valueOf(a3.getWidth()));
                    hashMap2.put("height", Integer.valueOf(a3.getHeight()));
                    hashMap2.put("visible", Integer.valueOf(i2));
                    map.put("ad_pos", hashMap2);
                }
            }
            StringBuilder sb = new StringBuilder();
            AdSize[] a4 = this.h.h().l.a();
            if (a4 != null) {
                for (AdSize adSize : a4) {
                    if (sb.length() != 0) {
                        sb.append("|");
                    }
                    sb.append(adSize.getWidth() + Constants.X + adSize.getHeight());
                }
                map.put("sz", sb.toString());
            }
            TelephonyManager telephonyManager = (TelephonyManager) applicationContext.getSystemService("phone");
            map.put("carrier", telephonyManager.getNetworkOperator());
            map.put("gnt", Integer.valueOf(telephonyManager.getNetworkType()));
            if (AdUtil.c()) {
                map.put("simulator", 1);
            }
            map.put("session_id", com.google.ads.b.a().b().toString());
            map.put("seq_num", com.google.ads.b.a().c().toString());
            String a5 = AdUtil.a(map);
            String str = this.h.h().a.a().a.a().l.a().booleanValue() ? g() + d() + "(" + a5 + ");" + h() : g() + e() + d() + "(" + a5 + ");" + h();
            com.google.ads.util.b.c("adRequestUrlHtml: " + str);
            return str;
        } catch (PackageManager.NameNotFoundException e3) {
            throw new b("NameNotFoundException");
        }
    }

    private String d() {
        if (this.i instanceof SearchAdRequest) {
            return "AFMA_buildAdURL";
        }
        return "AFMA_buildAdURL";
    }

    private String e() {
        if (this.i instanceof SearchAdRequest) {
            return "AFMA_getSdkConstants();";
        }
        return "AFMA_getSdkConstants();";
    }

    private String f() {
        if (this.i instanceof SearchAdRequest) {
            return "http://www.gstatic.com/safa/";
        }
        return "http://media.admob.com/";
    }

    private String g() {
        if (this.i instanceof SearchAdRequest) {
            return "<html><head><script src=\"http://www.gstatic.com/safa/sdk-core-v40.js\"></script><script>";
        }
        return "<html><head><script src=\"http://media.admob.com/sdk-core-v40.js\"></script><script>";
    }

    private String h() {
        if (this.i instanceof SearchAdRequest) {
            return "</script></head><body></body></html>";
        }
        return "</script></head><body></body></html>";
    }

    /* access modifiers changed from: protected */
    public void a(AdRequest.ErrorCode errorCode, boolean z) {
        this.h.a((Runnable) new a(this.h, this.j, this.g, errorCode, z));
    }

    private void b(String str, String str2) {
        this.h.a((Runnable) new C0006c(this.j, str2, str));
    }

    private void i() {
        AdWebView k2 = this.h.k();
        this.h.l().c(true);
        this.h.m().h();
        this.h.a((Runnable) new C0006c(k2, this.b, this.c));
    }

    private void j() {
        this.h.a((Runnable) new e(this.h, this.j, this.l, this.s, this.p, this.m, this.n));
    }

    /* access modifiers changed from: protected */
    public synchronized void a(boolean z) {
        this.f = z;
    }

    /* access modifiers changed from: protected */
    public synchronized void b(String str) {
        this.e = str;
    }

    /* access modifiers changed from: protected */
    public synchronized void a(String str, String str2) {
        this.b = str2;
        this.c = str;
        notify();
    }

    /* access modifiers changed from: protected */
    public synchronized void c(String str) {
        this.d = str;
    }

    public synchronized void d(String str) {
        this.k = str;
        notify();
    }

    public synchronized void e(String str) {
        this.m = str;
    }

    public synchronized void a(AdSize adSize) {
        this.n = adSize;
    }

    public synchronized void a(AdRequest.ErrorCode errorCode) {
        this.q = errorCode;
        notify();
    }

    /* access modifiers changed from: protected */
    public synchronized void c() {
        this.r = true;
        notify();
    }

    public synchronized void b(boolean z) {
        this.p = z;
    }

    public synchronized void a(int i2) {
        this.s = i2;
    }

    public synchronized void c(boolean z) {
        this.u = z;
    }

    public synchronized void a(d dVar) {
        this.v = dVar;
    }

    public synchronized void d(boolean z) {
        this.a = z;
    }
}
