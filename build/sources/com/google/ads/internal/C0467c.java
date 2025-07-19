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
import com.google.ads.C0439b;
import com.google.ads.C0440c;
import com.google.ads.C0442d;
import com.google.ads.searchads.SearchAdRequest;
import com.google.ads.util.AdUtil;
import com.google.ads.util.C0508b;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.Locale;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.json.JSONException;

/* renamed from: com.google.ads.internal.c */
public class C0467c implements Runnable {

    /* renamed from: a */
    boolean f846a;

    /* renamed from: b */
    private String f847b;

    /* renamed from: c */
    private String f848c;

    /* renamed from: d */
    private String f849d;

    /* renamed from: e */
    private String f850e;

    /* renamed from: f */
    private boolean f851f;

    /* renamed from: g */
    private C0477f f852g;
    /* access modifiers changed from: private */

    /* renamed from: h */
    public C0475d f853h;

    /* renamed from: i */
    private AdRequest f854i;
    /* access modifiers changed from: private */

    /* renamed from: j */
    public WebView f855j;

    /* renamed from: k */
    private String f856k;

    /* renamed from: l */
    private LinkedList<String> f857l;
    /* access modifiers changed from: private */

    /* renamed from: m */
    public String f858m;
    /* access modifiers changed from: private */

    /* renamed from: n */
    public AdSize f859n;

    /* renamed from: o */
    private volatile boolean f860o;

    /* renamed from: p */
    private boolean f861p;

    /* renamed from: q */
    private AdRequest.ErrorCode f862q;

    /* renamed from: r */
    private boolean f863r;

    /* renamed from: s */
    private int f864s;

    /* renamed from: t */
    private Thread f865t;

    /* renamed from: u */
    private boolean f866u;

    /* renamed from: v */
    private C0473d f867v = C0473d.ONLINE_SERVER_REQUEST;

    /* renamed from: com.google.ads.internal.c$b */
    private class C0471b extends Exception {
        public C0471b(String str) {
            super(str);
        }
    }

    /* renamed from: com.google.ads.internal.c$a */
    private static class C0470a implements Runnable {

        /* renamed from: a */
        private final C0475d f871a;

        /* renamed from: b */
        private final WebView f872b;

        /* renamed from: c */
        private final C0477f f873c;

        /* renamed from: d */
        private final AdRequest.ErrorCode f874d;

        /* renamed from: e */
        private final boolean f875e;

        public C0470a(C0475d dVar, WebView webView, C0477f fVar, AdRequest.ErrorCode errorCode, boolean z) {
            this.f871a = dVar;
            this.f872b = webView;
            this.f873c = fVar;
            this.f874d = errorCode;
            this.f875e = z;
        }

        public void run() {
            if (this.f872b != null) {
                this.f872b.stopLoading();
                this.f872b.destroy();
            }
            if (this.f873c != null) {
                this.f873c.mo3730a();
            }
            if (this.f875e) {
                AdWebView k = this.f871a.mo3711k();
                k.stopLoading();
                k.setVisibility(8);
            }
            this.f871a.mo3689a(this.f874d);
        }
    }

    /* renamed from: com.google.ads.internal.c$c */
    private class C0472c implements Runnable {

        /* renamed from: b */
        private final String f878b;

        /* renamed from: c */
        private final String f879c;

        /* renamed from: d */
        private final WebView f880d;

        public C0472c(WebView webView, String str, String str2) {
            this.f880d = webView;
            this.f878b = str;
            this.f879c = str2;
        }

        public void run() {
            if (this.f879c != null) {
                this.f880d.loadDataWithBaseURL(this.f878b, this.f879c, "text/html", "utf-8", (String) null);
            } else {
                this.f880d.loadUrl(this.f878b);
            }
        }
    }

    /* renamed from: com.google.ads.internal.c$e */
    private static class C0474e implements Runnable {

        /* renamed from: a */
        private final C0475d f887a;

        /* renamed from: b */
        private final WebView f888b;

        /* renamed from: c */
        private final LinkedList<String> f889c;

        /* renamed from: d */
        private final int f890d;

        /* renamed from: e */
        private final boolean f891e;

        /* renamed from: f */
        private final String f892f;

        /* renamed from: g */
        private final AdSize f893g;

        public C0474e(C0475d dVar, WebView webView, LinkedList<String> linkedList, int i, boolean z, String str, AdSize adSize) {
            this.f887a = dVar;
            this.f888b = webView;
            this.f889c = linkedList;
            this.f890d = i;
            this.f891e = z;
            this.f892f = str;
            this.f893g = adSize;
        }

        public void run() {
            if (this.f888b != null) {
                this.f888b.stopLoading();
                this.f888b.destroy();
            }
            this.f887a.mo3696a(this.f889c);
            this.f887a.mo3685a(this.f890d);
            this.f887a.mo3697a(this.f891e);
            this.f887a.mo3694a(this.f892f);
            if (this.f893g != null) {
                this.f887a.mo3708h().f990k.mo3874a().mo3769b(this.f893g);
                this.f887a.mo3711k().setAdSize(this.f893g);
            }
            this.f887a.mo3682C();
        }
    }

    /* renamed from: com.google.ads.internal.c$d */
    public enum C0473d {
        ONLINE_USING_BUFFERED_ADS("online_buffered"),
        ONLINE_SERVER_REQUEST("online_request"),
        OFFLINE_USING_BUFFERED_ADS("offline_buffered"),
        OFFLINE_EMPTY("offline_empty");
        

        /* renamed from: e */
        public String f886e;

        private C0473d(String str) {
            this.f886e = str;
        }
    }

    protected C0467c() {
    }

    public C0467c(C0475d dVar) {
        this.f853h = dVar;
        this.f856k = null;
        this.f847b = null;
        this.f848c = null;
        this.f849d = null;
        this.f857l = new LinkedList<>();
        this.f862q = null;
        this.f863r = false;
        this.f864s = -1;
        this.f851f = false;
        this.f861p = false;
        this.f858m = null;
        this.f859n = null;
        if (dVar.mo3708h().f984e.mo3877a() != null) {
            this.f855j = new AdWebView(dVar.mo3708h(), (AdSize) null);
            this.f855j.setWebViewClient(C0482i.m948a(dVar, C0462a.f842b, false, false));
            this.f855j.setVisibility(8);
            this.f855j.setWillNotDraw(true);
            this.f852g = new C0477f(this, dVar);
            return;
        }
        this.f855j = null;
        this.f852g = null;
        C0508b.m1036e("activity was null while trying to create an AdLoader.");
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public synchronized void mo3663a(String str) {
        this.f857l.add(str);
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public void mo3656a() {
        C0508b.m1026a("AdLoader cancelled.");
        if (this.f855j != null) {
            this.f855j.stopLoading();
            this.f855j.destroy();
        }
        if (this.f865t != null) {
            this.f865t.interrupt();
            this.f865t = null;
        }
        if (this.f852g != null) {
            this.f852g.mo3730a();
        }
        this.f860o = true;
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public void mo3660a(AdRequest adRequest) {
        this.f854i = adRequest;
        this.f860o = false;
        this.f865t = new Thread(this);
        this.f865t.start();
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
            android.webkit.WebView r0 = r11.f855j     // Catch:{ Throwable -> 0x00de }
            if (r0 == 0) goto L_0x000b
            com.google.ads.internal.f r0 = r11.f852g     // Catch:{ Throwable -> 0x00de }
            if (r0 != 0) goto L_0x0018
        L_0x000b:
            java.lang.String r0 = "adRequestWebView was null while trying to load an ad."
            com.google.ads.util.C0508b.m1036e(r0)     // Catch:{ Throwable -> 0x00de }
            com.google.ads.AdRequest$ErrorCode r0 = com.google.ads.AdRequest.ErrorCode.INTERNAL_ERROR     // Catch:{ Throwable -> 0x00de }
            r1 = 0
            r11.mo3659a((com.google.ads.AdRequest.ErrorCode) r0, (boolean) r1)     // Catch:{ Throwable -> 0x00de }
            monitor-exit(r11)     // Catch:{ all -> 0x0035 }
        L_0x0017:
            return
        L_0x0018:
            com.google.ads.internal.d r0 = r11.f853h     // Catch:{ Throwable -> 0x00de }
            com.google.ads.m r0 = r0.mo3708h()     // Catch:{ Throwable -> 0x00de }
            com.google.ads.util.i$d<android.app.Activity> r0 = r0.f984e     // Catch:{ Throwable -> 0x00de }
            java.lang.Object r0 = r0.mo3877a()     // Catch:{ Throwable -> 0x00de }
            android.app.Activity r0 = (android.app.Activity) r0     // Catch:{ Throwable -> 0x00de }
            if (r0 != 0) goto L_0x0038
            java.lang.String r0 = "activity was null while forming an ad request."
            com.google.ads.util.C0508b.m1036e(r0)     // Catch:{ Throwable -> 0x00de }
            com.google.ads.AdRequest$ErrorCode r0 = com.google.ads.AdRequest.ErrorCode.INTERNAL_ERROR     // Catch:{ Throwable -> 0x00de }
            r1 = 0
            r11.mo3659a((com.google.ads.AdRequest.ErrorCode) r0, (boolean) r1)     // Catch:{ Throwable -> 0x00de }
            monitor-exit(r11)     // Catch:{ all -> 0x0035 }
            goto L_0x0017
        L_0x0035:
            r0 = move-exception
            monitor-exit(r11)     // Catch:{ all -> 0x0035 }
            throw r0
        L_0x0038:
            com.google.ads.internal.d r1 = r11.f853h     // Catch:{ Throwable -> 0x00de }
            long r3 = r1.mo3715o()     // Catch:{ Throwable -> 0x00de }
            long r5 = android.os.SystemClock.elapsedRealtime()     // Catch:{ Throwable -> 0x00de }
            com.google.ads.AdRequest r2 = r11.f854i     // Catch:{ Throwable -> 0x00de }
            com.google.ads.internal.d r1 = r11.f853h     // Catch:{ Throwable -> 0x00de }
            com.google.ads.m r1 = r1.mo3708h()     // Catch:{ Throwable -> 0x00de }
            com.google.ads.util.i$b<android.content.Context> r1 = r1.f985f     // Catch:{ Throwable -> 0x00de }
            java.lang.Object r1 = r1.mo3874a()     // Catch:{ Throwable -> 0x00de }
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
            r11.f847b = r2     // Catch:{ Throwable -> 0x00de }
        L_0x0070:
            java.lang.String r2 = "_requestUrl"
            java.lang.Object r2 = r1.get(r2)     // Catch:{ Throwable -> 0x00de }
            boolean r8 = r2 instanceof java.lang.String     // Catch:{ Throwable -> 0x00de }
            if (r8 == 0) goto L_0x007e
            java.lang.String r2 = (java.lang.String) r2     // Catch:{ Throwable -> 0x00de }
            r11.f856k = r2     // Catch:{ Throwable -> 0x00de }
        L_0x007e:
            java.lang.String r2 = "_orientation"
            java.lang.Object r2 = r1.get(r2)     // Catch:{ Throwable -> 0x00de }
            boolean r8 = r2 instanceof java.lang.String     // Catch:{ Throwable -> 0x00de }
            if (r8 == 0) goto L_0x0093
            java.lang.String r8 = "p"
            boolean r8 = r2.equals(r8)     // Catch:{ Throwable -> 0x00de }
            if (r8 == 0) goto L_0x00d2
            r2 = 1
            r11.f864s = r2     // Catch:{ Throwable -> 0x00de }
        L_0x0093:
            java.lang.String r2 = "_norefresh"
            java.lang.Object r1 = r1.get(r2)     // Catch:{ Throwable -> 0x00de }
            boolean r2 = r1 instanceof java.lang.String     // Catch:{ Throwable -> 0x00de }
            if (r2 == 0) goto L_0x00aa
            java.lang.String r2 = "t"
            boolean r1 = r1.equals(r2)     // Catch:{ Throwable -> 0x00de }
            if (r1 == 0) goto L_0x00aa
            com.google.ads.internal.d r1 = r11.f853h     // Catch:{ Throwable -> 0x00de }
            r1.mo3704d()     // Catch:{ Throwable -> 0x00de }
        L_0x00aa:
            java.lang.String r1 = r11.f847b     // Catch:{ Throwable -> 0x00de }
            if (r1 != 0) goto L_0x0242
            java.lang.String r1 = r11.f856k     // Catch:{ Throwable -> 0x00de }
            if (r1 != 0) goto L_0x015d
            java.lang.String r0 = r11.mo3655a((java.util.Map<java.lang.String, java.lang.Object>) r7, (android.app.Activity) r0)     // Catch:{ b -> 0x00ed }
            java.lang.String r1 = r11.m810f()     // Catch:{ Throwable -> 0x00de }
            r11.m805b(r0, r1)     // Catch:{ Throwable -> 0x00de }
            long r0 = android.os.SystemClock.elapsedRealtime()     // Catch:{ Throwable -> 0x00de }
            long r0 = r0 - r5
            long r0 = r3 - r0
            int r2 = (r0 > r9 ? 1 : (r0 == r9 ? 0 : -1))
            if (r2 <= 0) goto L_0x00cb
            r11.wait(r0)     // Catch:{ InterruptedException -> 0x010d }
        L_0x00cb:
            boolean r0 = r11.f860o     // Catch:{ Throwable -> 0x00de }
            if (r0 == 0) goto L_0x0127
            monitor-exit(r11)     // Catch:{ all -> 0x0035 }
            goto L_0x0017
        L_0x00d2:
            java.lang.String r8 = "l"
            boolean r2 = r2.equals(r8)     // Catch:{ Throwable -> 0x00de }
            if (r2 == 0) goto L_0x0093
            r2 = 0
            r11.f864s = r2     // Catch:{ Throwable -> 0x00de }
            goto L_0x0093
        L_0x00de:
            r0 = move-exception
            java.lang.String r1 = "An unknown error occurred in AdLoader."
            com.google.ads.util.C0508b.m1031b(r1, r0)     // Catch:{ all -> 0x0035 }
            com.google.ads.AdRequest$ErrorCode r0 = com.google.ads.AdRequest.ErrorCode.INTERNAL_ERROR     // Catch:{ all -> 0x0035 }
            r1 = 1
            r11.mo3659a((com.google.ads.AdRequest.ErrorCode) r0, (boolean) r1)     // Catch:{ all -> 0x0035 }
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
            com.google.ads.util.C0508b.m1032c(r0)     // Catch:{ Throwable -> 0x00de }
            com.google.ads.AdRequest$ErrorCode r0 = com.google.ads.AdRequest.ErrorCode.INTERNAL_ERROR     // Catch:{ Throwable -> 0x00de }
            r1 = 0
            r11.mo3659a((com.google.ads.AdRequest.ErrorCode) r0, (boolean) r1)     // Catch:{ Throwable -> 0x00de }
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
            com.google.ads.util.C0508b.m1026a((java.lang.String) r0)     // Catch:{ Throwable -> 0x00de }
            monitor-exit(r11)     // Catch:{ all -> 0x0035 }
            goto L_0x0017
        L_0x0127:
            com.google.ads.AdRequest$ErrorCode r0 = r11.f862q     // Catch:{ Throwable -> 0x00de }
            if (r0 == 0) goto L_0x0134
            com.google.ads.AdRequest$ErrorCode r0 = r11.f862q     // Catch:{ Throwable -> 0x00de }
            r1 = 0
            r11.mo3659a((com.google.ads.AdRequest.ErrorCode) r0, (boolean) r1)     // Catch:{ Throwable -> 0x00de }
            monitor-exit(r11)     // Catch:{ all -> 0x0035 }
            goto L_0x0017
        L_0x0134:
            java.lang.String r0 = r11.f856k     // Catch:{ Throwable -> 0x00de }
            if (r0 != 0) goto L_0x015d
            java.lang.StringBuilder r0 = new java.lang.StringBuilder     // Catch:{ Throwable -> 0x00de }
            r0.<init>()     // Catch:{ Throwable -> 0x00de }
            java.lang.String r1 = "AdLoader timed out after "
            java.lang.StringBuilder r0 = r0.append(r1)     // Catch:{ Throwable -> 0x00de }
            java.lang.StringBuilder r0 = r0.append(r3)     // Catch:{ Throwable -> 0x00de }
            java.lang.String r1 = "ms while getting the URL."
            java.lang.StringBuilder r0 = r0.append(r1)     // Catch:{ Throwable -> 0x00de }
            java.lang.String r0 = r0.toString()     // Catch:{ Throwable -> 0x00de }
            com.google.ads.util.C0508b.m1032c(r0)     // Catch:{ Throwable -> 0x00de }
            com.google.ads.AdRequest$ErrorCode r0 = com.google.ads.AdRequest.ErrorCode.NETWORK_ERROR     // Catch:{ Throwable -> 0x00de }
            r1 = 0
            r11.mo3659a((com.google.ads.AdRequest.ErrorCode) r0, (boolean) r1)     // Catch:{ Throwable -> 0x00de }
            monitor-exit(r11)     // Catch:{ all -> 0x0035 }
            goto L_0x0017
        L_0x015d:
            com.google.ads.internal.d r0 = r11.f853h     // Catch:{ Throwable -> 0x00de }
            com.google.ads.internal.g r0 = r0.mo3713m()     // Catch:{ Throwable -> 0x00de }
            int[] r1 = com.google.ads.internal.C0467c.C04692.f870a     // Catch:{ Throwable -> 0x00de }
            com.google.ads.internal.c$d r2 = r11.f867v     // Catch:{ Throwable -> 0x00de }
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
            boolean r0 = r11.f846a     // Catch:{ Throwable -> 0x00de }
            if (r0 != 0) goto L_0x0226
            java.lang.String r0 = "Not using loadUrl()."
            com.google.ads.util.C0508b.m1026a((java.lang.String) r0)     // Catch:{ Throwable -> 0x00de }
            com.google.ads.internal.f r0 = r11.f852g     // Catch:{ Throwable -> 0x00de }
            boolean r1 = r11.f866u     // Catch:{ Throwable -> 0x00de }
            r0.mo3732a((boolean) r1)     // Catch:{ Throwable -> 0x00de }
            com.google.ads.internal.f r0 = r11.f852g     // Catch:{ Throwable -> 0x00de }
            java.lang.String r1 = r11.f856k     // Catch:{ Throwable -> 0x00de }
            r0.mo3731a((java.lang.String) r1)     // Catch:{ Throwable -> 0x00de }
            long r0 = android.os.SystemClock.elapsedRealtime()     // Catch:{ Throwable -> 0x00de }
            long r0 = r0 - r5
            long r0 = r3 - r0
            int r2 = (r0 > r9 ? 1 : (r0 == r9 ? 0 : -1))
            if (r2 <= 0) goto L_0x0195
            r11.wait(r0)     // Catch:{ InterruptedException -> 0x01d6 }
        L_0x0195:
            boolean r0 = r11.f860o     // Catch:{ Throwable -> 0x00de }
            if (r0 == 0) goto L_0x01f0
            monitor-exit(r11)     // Catch:{ all -> 0x0035 }
            goto L_0x0017
        L_0x019c:
            r0.mo3758r()     // Catch:{ Throwable -> 0x00de }
            r0.mo3761u()     // Catch:{ Throwable -> 0x00de }
            r0.mo3764x()     // Catch:{ Throwable -> 0x00de }
            java.lang.String r0 = "Request scenario: Online server request."
            com.google.ads.util.C0508b.m1032c(r0)     // Catch:{ Throwable -> 0x00de }
            goto L_0x0170
        L_0x01ab:
            r0.mo3760t()     // Catch:{ Throwable -> 0x00de }
            java.lang.String r0 = "Request scenario: Online using buffered ads."
            com.google.ads.util.C0508b.m1032c(r0)     // Catch:{ Throwable -> 0x00de }
            goto L_0x0170
        L_0x01b4:
            r0.mo3763w()     // Catch:{ Throwable -> 0x00de }
            r0.mo3757q()     // Catch:{ Throwable -> 0x00de }
            java.lang.String r0 = "Request scenario: Offline using buffered ads."
            com.google.ads.util.C0508b.m1032c(r0)     // Catch:{ Throwable -> 0x00de }
            goto L_0x0170
        L_0x01c0:
            r0.mo3757q()     // Catch:{ Throwable -> 0x00de }
            java.lang.String r0 = "Request scenario: Offline with no buffered ads."
            com.google.ads.util.C0508b.m1032c(r0)     // Catch:{ Throwable -> 0x00de }
            java.lang.String r0 = "Network is unavailable.  Aborting ad request."
            com.google.ads.util.C0508b.m1032c(r0)     // Catch:{ Throwable -> 0x00de }
            com.google.ads.AdRequest$ErrorCode r0 = com.google.ads.AdRequest.ErrorCode.NETWORK_ERROR     // Catch:{ Throwable -> 0x00de }
            r1 = 0
            r11.mo3659a((com.google.ads.AdRequest.ErrorCode) r0, (boolean) r1)     // Catch:{ Throwable -> 0x00de }
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
            com.google.ads.util.C0508b.m1026a((java.lang.String) r0)     // Catch:{ Throwable -> 0x00de }
            monitor-exit(r11)     // Catch:{ all -> 0x0035 }
            goto L_0x0017
        L_0x01f0:
            com.google.ads.AdRequest$ErrorCode r0 = r11.f862q     // Catch:{ Throwable -> 0x00de }
            if (r0 == 0) goto L_0x01fd
            com.google.ads.AdRequest$ErrorCode r0 = r11.f862q     // Catch:{ Throwable -> 0x00de }
            r1 = 0
            r11.mo3659a((com.google.ads.AdRequest.ErrorCode) r0, (boolean) r1)     // Catch:{ Throwable -> 0x00de }
            monitor-exit(r11)     // Catch:{ all -> 0x0035 }
            goto L_0x0017
        L_0x01fd:
            java.lang.String r0 = r11.f848c     // Catch:{ Throwable -> 0x00de }
            if (r0 != 0) goto L_0x0242
            java.lang.StringBuilder r0 = new java.lang.StringBuilder     // Catch:{ Throwable -> 0x00de }
            r0.<init>()     // Catch:{ Throwable -> 0x00de }
            java.lang.String r1 = "AdLoader timed out after "
            java.lang.StringBuilder r0 = r0.append(r1)     // Catch:{ Throwable -> 0x00de }
            java.lang.StringBuilder r0 = r0.append(r3)     // Catch:{ Throwable -> 0x00de }
            java.lang.String r1 = "ms while waiting for the ad server's response."
            java.lang.StringBuilder r0 = r0.append(r1)     // Catch:{ Throwable -> 0x00de }
            java.lang.String r0 = r0.toString()     // Catch:{ Throwable -> 0x00de }
            com.google.ads.util.C0508b.m1032c(r0)     // Catch:{ Throwable -> 0x00de }
            com.google.ads.AdRequest$ErrorCode r0 = com.google.ads.AdRequest.ErrorCode.NETWORK_ERROR     // Catch:{ Throwable -> 0x00de }
            r1 = 0
            r11.mo3659a((com.google.ads.AdRequest.ErrorCode) r0, (boolean) r1)     // Catch:{ Throwable -> 0x00de }
            monitor-exit(r11)     // Catch:{ all -> 0x0035 }
            goto L_0x0017
        L_0x0226:
            java.lang.String r0 = r11.f856k     // Catch:{ Throwable -> 0x00de }
            r11.f847b = r0     // Catch:{ Throwable -> 0x00de }
            java.lang.StringBuilder r0 = new java.lang.StringBuilder     // Catch:{ Throwable -> 0x00de }
            r0.<init>()     // Catch:{ Throwable -> 0x00de }
            java.lang.String r1 = "Using loadUrl.  adBaseUrl: "
            java.lang.StringBuilder r0 = r0.append(r1)     // Catch:{ Throwable -> 0x00de }
            java.lang.String r1 = r11.f847b     // Catch:{ Throwable -> 0x00de }
            java.lang.StringBuilder r0 = r0.append(r1)     // Catch:{ Throwable -> 0x00de }
            java.lang.String r0 = r0.toString()     // Catch:{ Throwable -> 0x00de }
            com.google.ads.util.C0508b.m1026a((java.lang.String) r0)     // Catch:{ Throwable -> 0x00de }
        L_0x0242:
            boolean r0 = r11.f846a     // Catch:{ Throwable -> 0x00de }
            if (r0 != 0) goto L_0x02fc
            boolean r0 = r11.f851f     // Catch:{ Throwable -> 0x00de }
            if (r0 == 0) goto L_0x0256
            com.google.ads.internal.d r0 = r11.f853h     // Catch:{ Throwable -> 0x00de }
            r1 = 1
            r0.mo3702b((boolean) r1)     // Catch:{ Throwable -> 0x00de }
            r11.mo3666b()     // Catch:{ Throwable -> 0x00de }
            monitor-exit(r11)     // Catch:{ all -> 0x0035 }
            goto L_0x0017
        L_0x0256:
            java.lang.String r0 = r11.f850e     // Catch:{ Throwable -> 0x00de }
            if (r0 == 0) goto L_0x0295
            java.lang.String r0 = r11.f850e     // Catch:{ Throwable -> 0x00de }
            java.lang.String r1 = "application/json"
            boolean r0 = r0.startsWith(r1)     // Catch:{ Throwable -> 0x00de }
            if (r0 != 0) goto L_0x026e
            java.lang.String r0 = r11.f850e     // Catch:{ Throwable -> 0x00de }
            java.lang.String r1 = "text/javascript"
            boolean r0 = r0.startsWith(r1)     // Catch:{ Throwable -> 0x00de }
            if (r0 == 0) goto L_0x0295
        L_0x026e:
            java.lang.StringBuilder r0 = new java.lang.StringBuilder     // Catch:{ Throwable -> 0x00de }
            r0.<init>()     // Catch:{ Throwable -> 0x00de }
            java.lang.String r1 = "Expected HTML but received "
            java.lang.StringBuilder r0 = r0.append(r1)     // Catch:{ Throwable -> 0x00de }
            java.lang.String r1 = r11.f850e     // Catch:{ Throwable -> 0x00de }
            java.lang.StringBuilder r0 = r0.append(r1)     // Catch:{ Throwable -> 0x00de }
            java.lang.String r1 = "."
            java.lang.StringBuilder r0 = r0.append(r1)     // Catch:{ Throwable -> 0x00de }
            java.lang.String r0 = r0.toString()     // Catch:{ Throwable -> 0x00de }
            com.google.ads.util.C0508b.m1030b(r0)     // Catch:{ Throwable -> 0x00de }
            com.google.ads.AdRequest$ErrorCode r0 = com.google.ads.AdRequest.ErrorCode.INTERNAL_ERROR     // Catch:{ Throwable -> 0x00de }
            r1 = 0
            r11.mo3659a((com.google.ads.AdRequest.ErrorCode) r0, (boolean) r1)     // Catch:{ Throwable -> 0x00de }
            monitor-exit(r11)     // Catch:{ all -> 0x0035 }
            goto L_0x0017
        L_0x0295:
            com.google.ads.internal.d r0 = r11.f853h     // Catch:{ Throwable -> 0x00de }
            com.google.ads.m r0 = r0.mo3708h()     // Catch:{ Throwable -> 0x00de }
            com.google.ads.util.i$c<com.google.ads.AdSize[]> r0 = r0.f991l     // Catch:{ Throwable -> 0x00de }
            java.lang.Object r0 = r0.mo3875a()     // Catch:{ Throwable -> 0x00de }
            if (r0 == 0) goto L_0x02f0
            com.google.ads.AdSize r0 = r11.f859n     // Catch:{ Throwable -> 0x00de }
            if (r0 != 0) goto L_0x02b5
            java.lang.String r0 = "Multiple supported ad sizes were specified, but the server did not respond with a size."
            com.google.ads.util.C0508b.m1030b(r0)     // Catch:{ Throwable -> 0x00de }
            com.google.ads.AdRequest$ErrorCode r0 = com.google.ads.AdRequest.ErrorCode.INTERNAL_ERROR     // Catch:{ Throwable -> 0x00de }
            r1 = 0
            r11.mo3659a((com.google.ads.AdRequest.ErrorCode) r0, (boolean) r1)     // Catch:{ Throwable -> 0x00de }
            monitor-exit(r11)     // Catch:{ all -> 0x0035 }
            goto L_0x0017
        L_0x02b5:
            com.google.ads.internal.d r0 = r11.f853h     // Catch:{ Throwable -> 0x00de }
            com.google.ads.m r0 = r0.mo3708h()     // Catch:{ Throwable -> 0x00de }
            com.google.ads.util.i$c<com.google.ads.AdSize[]> r0 = r0.f991l     // Catch:{ Throwable -> 0x00de }
            java.lang.Object r0 = r0.mo3875a()     // Catch:{ Throwable -> 0x00de }
            java.lang.Object[] r0 = (java.lang.Object[]) r0     // Catch:{ Throwable -> 0x00de }
            java.util.List r0 = java.util.Arrays.asList(r0)     // Catch:{ Throwable -> 0x00de }
            com.google.ads.AdSize r1 = r11.f859n     // Catch:{ Throwable -> 0x00de }
            boolean r0 = r0.contains(r1)     // Catch:{ Throwable -> 0x00de }
            if (r0 != 0) goto L_0x02fc
            java.lang.StringBuilder r0 = new java.lang.StringBuilder     // Catch:{ Throwable -> 0x00de }
            r0.<init>()     // Catch:{ Throwable -> 0x00de }
            java.lang.String r1 = "The ad server did not respond with a supported AdSize: "
            java.lang.StringBuilder r0 = r0.append(r1)     // Catch:{ Throwable -> 0x00de }
            com.google.ads.AdSize r1 = r11.f859n     // Catch:{ Throwable -> 0x00de }
            java.lang.StringBuilder r0 = r0.append(r1)     // Catch:{ Throwable -> 0x00de }
            java.lang.String r0 = r0.toString()     // Catch:{ Throwable -> 0x00de }
            com.google.ads.util.C0508b.m1030b(r0)     // Catch:{ Throwable -> 0x00de }
            com.google.ads.AdRequest$ErrorCode r0 = com.google.ads.AdRequest.ErrorCode.INTERNAL_ERROR     // Catch:{ Throwable -> 0x00de }
            r1 = 0
            r11.mo3659a((com.google.ads.AdRequest.ErrorCode) r0, (boolean) r1)     // Catch:{ Throwable -> 0x00de }
            monitor-exit(r11)     // Catch:{ all -> 0x0035 }
            goto L_0x0017
        L_0x02f0:
            com.google.ads.AdSize r0 = r11.f859n     // Catch:{ Throwable -> 0x00de }
            if (r0 == 0) goto L_0x02fc
            java.lang.String r0 = "adSize was expected to be null in AdLoader."
            com.google.ads.util.C0508b.m1036e(r0)     // Catch:{ Throwable -> 0x00de }
            r0 = 0
            r11.f859n = r0     // Catch:{ Throwable -> 0x00de }
        L_0x02fc:
            com.google.ads.internal.d r0 = r11.f853h     // Catch:{ Throwable -> 0x00de }
            r1 = 0
            r0.mo3702b((boolean) r1)     // Catch:{ Throwable -> 0x00de }
            r11.m813i()     // Catch:{ Throwable -> 0x00de }
            long r0 = android.os.SystemClock.elapsedRealtime()     // Catch:{ Throwable -> 0x00de }
            long r0 = r0 - r5
            long r0 = r3 - r0
            int r2 = (r0 > r9 ? 1 : (r0 == r9 ? 0 : -1))
            if (r2 <= 0) goto L_0x0313
            r11.wait(r0)     // Catch:{ InterruptedException -> 0x031c }
        L_0x0313:
            boolean r0 = r11.f863r     // Catch:{ Throwable -> 0x00de }
            if (r0 == 0) goto L_0x0336
            r11.m814j()     // Catch:{ Throwable -> 0x00de }
            goto L_0x00ea
        L_0x031c:
            r0 = move-exception
            java.lang.StringBuilder r1 = new java.lang.StringBuilder     // Catch:{ Throwable -> 0x00de }
            r1.<init>()     // Catch:{ Throwable -> 0x00de }
            java.lang.String r2 = "AdLoader InterruptedException while loading the HTML: "
            java.lang.StringBuilder r1 = r1.append(r2)     // Catch:{ Throwable -> 0x00de }
            java.lang.StringBuilder r0 = r1.append(r0)     // Catch:{ Throwable -> 0x00de }
            java.lang.String r0 = r0.toString()     // Catch:{ Throwable -> 0x00de }
            com.google.ads.util.C0508b.m1026a((java.lang.String) r0)     // Catch:{ Throwable -> 0x00de }
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
            com.google.ads.util.C0508b.m1032c(r0)     // Catch:{ Throwable -> 0x00de }
            com.google.ads.AdRequest$ErrorCode r0 = com.google.ads.AdRequest.ErrorCode.NETWORK_ERROR     // Catch:{ Throwable -> 0x00de }
            r1 = 1
            r11.mo3659a((com.google.ads.AdRequest.ErrorCode) r0, (boolean) r1)     // Catch:{ Throwable -> 0x00de }
            goto L_0x00ea
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.ads.internal.C0467c.run():void");
    }

    /* access modifiers changed from: protected */
    /* renamed from: b */
    public void mo3666b() {
        try {
            if (TextUtils.isEmpty(this.f850e)) {
                C0508b.m1030b("Got a mediation response with no content type. Aborting mediation.");
                mo3659a(AdRequest.ErrorCode.INTERNAL_ERROR, false);
            } else if (!this.f850e.startsWith("application/json")) {
                C0508b.m1030b("Got a mediation response with a content type: '" + this.f850e + "'. Expected something starting with 'application/json'. Aborting mediation.");
                mo3659a(AdRequest.ErrorCode.INTERNAL_ERROR, false);
            } else {
                final C0440c a = C0440c.m706a(this.f848c);
                m803a(this.f849d, a, this.f853h.mo3709i());
                this.f853h.mo3693a((Runnable) new Runnable() {
                    public void run() {
                        if (C0467c.this.f855j != null) {
                            C0467c.this.f855j.stopLoading();
                            C0467c.this.f855j.destroy();
                        }
                        C0467c.this.f853h.mo3694a(C0467c.this.f858m);
                        if (C0467c.this.f859n != null) {
                            C0467c.this.f853h.mo3708h().f990k.mo3874a().mo3769b(C0467c.this.f859n);
                        }
                        C0467c.this.f853h.mo3691a(a);
                    }
                });
            }
        } catch (JSONException e) {
            C0508b.m1031b("AdLoader can't parse gWhirl server configuration.", e);
            mo3659a(AdRequest.ErrorCode.INTERNAL_ERROR, false);
        }
    }

    /* renamed from: a */
    static void m803a(String str, C0440c cVar, C0442d dVar) {
        if (str != null && !str.contains("no-store") && !str.contains("no-cache")) {
            Matcher matcher = Pattern.compile("max-age\\s*=\\s*(\\d+)").matcher(str);
            if (matcher.find()) {
                try {
                    int parseInt = Integer.parseInt(matcher.group(1));
                    dVar.mo3557a(cVar, parseInt);
                    C0508b.m1032c(String.format(Locale.US, "Caching gWhirl configuration for: %d seconds", new Object[]{Integer.valueOf(parseInt)}));
                } catch (NumberFormatException e) {
                    C0508b.m1031b("Caught exception trying to parse cache control directive. Overflow?", e);
                }
            } else {
                C0508b.m1032c("Unrecognized cacheControlDirective: '" + str + "'. Not caching configuration.");
            }
        }
    }

    /* renamed from: a */
    public String mo3655a(Map<String, Object> map, Activity activity) throws C0471b {
        int i;
        Context applicationContext = activity.getApplicationContext();
        C0480g m = this.f853h.mo3713m();
        long m2 = m.mo3753m();
        if (m2 > 0) {
            map.put("prl", Long.valueOf(m2));
        }
        long n = m.mo3754n();
        if (n > 0) {
            map.put("prnl", Long.valueOf(n));
        }
        String l = m.mo3752l();
        if (l != null) {
            map.put("ppcl", l);
        }
        String k = m.mo3751k();
        if (k != null) {
            map.put("pcl", k);
        }
        long j = m.mo3750j();
        if (j > 0) {
            map.put("pcc", Long.valueOf(j));
        }
        map.put("preqs", Long.valueOf(m.mo3755o()));
        map.put("oar", Long.valueOf(m.mo3756p()));
        map.put("bas_on", Long.valueOf(m.mo3759s()));
        map.put("bas_off", Long.valueOf(m.mo3762v()));
        if (m.mo3765y()) {
            map.put("aoi_timeout", "true");
        }
        if (m.mo3735A()) {
            map.put("aoi_nofill", "true");
        }
        String D = m.mo3738D();
        if (D != null) {
            map.put("pit", D);
        }
        map.put("ptime", Long.valueOf(C0480g.m910E()));
        m.mo3739a();
        m.mo3749i();
        if (this.f853h.mo3708h().mo3791b()) {
            map.put("format", "interstitial_mb");
        } else {
            AdSize b = this.f853h.mo3708h().f990k.mo3874a().mo3768b();
            if (b.isFullWidth()) {
                map.put("smart_w", "full");
            }
            if (b.isAutoHeight()) {
                map.put("smart_h", "auto");
            }
            if (!b.isCustomAdSize()) {
                map.put("format", b.toString());
            } else {
                HashMap hashMap = new HashMap();
                hashMap.put("w", Integer.valueOf(b.getWidth()));
                hashMap.put("h", Integer.valueOf(b.getHeight()));
                map.put("ad_frame", hashMap);
            }
        }
        map.put("slotname", this.f853h.mo3708h().f983d.mo3874a());
        map.put("js", "afma-sdk-a-v6.2.0");
        try {
            int i2 = applicationContext.getPackageManager().getPackageInfo(applicationContext.getPackageName(), 0).versionCode;
            String f = AdUtil.m1011f(applicationContext);
            if (!TextUtils.isEmpty(f)) {
                map.put("mv", f);
            }
            map.put("msid", applicationContext.getPackageName());
            map.put("app_name", i2 + ".android." + applicationContext.getPackageName());
            map.put("isu", AdUtil.m986a(applicationContext));
            String d = AdUtil.m1008d(applicationContext);
            if (d == null) {
                d = "null";
            }
            map.put("net", d);
            String e = AdUtil.m1010e(applicationContext);
            if (!(e == null || e.length() == 0)) {
                map.put("cap", e);
            }
            map.put("u_audio", Integer.valueOf(AdUtil.m1012g(applicationContext).ordinal()));
            DisplayMetrics a = AdUtil.m985a(activity);
            map.put("u_sd", Float.valueOf(a.density));
            map.put("u_h", Integer.valueOf(AdUtil.m983a(applicationContext, a)));
            map.put("u_w", Integer.valueOf(AdUtil.m999b(applicationContext, a)));
            map.put("hl", Locale.getDefault().getLanguage());
            if (!(this.f853h.mo3708h().f988i == null || this.f853h.mo3708h().f988i.mo3874a() == null)) {
                AdView a2 = this.f853h.mo3708h().f988i.mo3874a();
                if (a2.getParent() != null) {
                    int[] iArr = new int[2];
                    a2.getLocationOnScreen(iArr);
                    int i3 = iArr[0];
                    int i4 = iArr[1];
                    DisplayMetrics displayMetrics = this.f853h.mo3708h().f985f.mo3874a().getResources().getDisplayMetrics();
                    int i5 = displayMetrics.widthPixels;
                    int i6 = displayMetrics.heightPixels;
                    if (!a2.isShown() || a2.getWidth() + i3 <= 0 || a2.getHeight() + i4 <= 0 || i3 > i5 || i4 > i6) {
                        i = 0;
                    } else {
                        i = 1;
                    }
                    HashMap hashMap2 = new HashMap();
                    hashMap2.put(Constants.f677X, Integer.valueOf(i3));
                    hashMap2.put(Constants.f678Y, Integer.valueOf(i4));
                    hashMap2.put("width", Integer.valueOf(a2.getWidth()));
                    hashMap2.put("height", Integer.valueOf(a2.getHeight()));
                    hashMap2.put("visible", Integer.valueOf(i));
                    map.put("ad_pos", hashMap2);
                }
            }
            StringBuilder sb = new StringBuilder();
            AdSize[] a3 = this.f853h.mo3708h().f991l.mo3875a();
            if (a3 != null) {
                for (AdSize adSize : a3) {
                    if (sb.length() != 0) {
                        sb.append("|");
                    }
                    sb.append(adSize.getWidth() + Constants.f677X + adSize.getHeight());
                }
                map.put("sz", sb.toString());
            }
            TelephonyManager telephonyManager = (TelephonyManager) applicationContext.getSystemService("phone");
            map.put("carrier", telephonyManager.getNetworkOperator());
            map.put("gnt", Integer.valueOf(telephonyManager.getNetworkType()));
            if (AdUtil.m1006c()) {
                map.put("simulator", 1);
            }
            map.put("session_id", C0439b.m700a().mo3545b().toString());
            map.put("seq_num", C0439b.m700a().mo3546c().toString());
            String a4 = AdUtil.m989a(map);
            String str = this.f853h.mo3708h().f980a.mo3874a().f967a.mo3874a().f979l.mo3875a().booleanValue() ? m811g() + m808d() + "(" + a4 + ");" + m812h() : m811g() + m809e() + m808d() + "(" + a4 + ");" + m812h();
            C0508b.m1032c("adRequestUrlHtml: " + str);
            return str;
        } catch (PackageManager.NameNotFoundException e2) {
            throw new C0471b("NameNotFoundException");
        }
    }

    /* renamed from: d */
    private String m808d() {
        if (this.f854i instanceof SearchAdRequest) {
            return "AFMA_buildAdURL";
        }
        return "AFMA_buildAdURL";
    }

    /* renamed from: e */
    private String m809e() {
        if (this.f854i instanceof SearchAdRequest) {
            return "AFMA_getSdkConstants();";
        }
        return "AFMA_getSdkConstants();";
    }

    /* renamed from: f */
    private String m810f() {
        if (this.f854i instanceof SearchAdRequest) {
            return "http://www.gstatic.com/safa/";
        }
        return "http://media.admob.com/";
    }

    /* renamed from: g */
    private String m811g() {
        if (this.f854i instanceof SearchAdRequest) {
            return "<html><head><script src=\"http://www.gstatic.com/safa/sdk-core-v40.js\"></script><script>";
        }
        return "<html><head><script src=\"http://media.admob.com/sdk-core-v40.js\"></script><script>";
    }

    /* renamed from: h */
    private String m812h() {
        if (this.f854i instanceof SearchAdRequest) {
            return "</script></head><body></body></html>";
        }
        return "</script></head><body></body></html>";
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public void mo3659a(AdRequest.ErrorCode errorCode, boolean z) {
        this.f853h.mo3693a((Runnable) new C0470a(this.f853h, this.f855j, this.f852g, errorCode, z));
    }

    /* renamed from: b */
    private void m805b(String str, String str2) {
        this.f853h.mo3693a((Runnable) new C0472c(this.f855j, str2, str));
    }

    /* renamed from: i */
    private void m813i() {
        AdWebView k = this.f853h.mo3711k();
        this.f853h.mo3712l().mo3772c(true);
        this.f853h.mo3713m().mo3748h();
        this.f853h.mo3693a((Runnable) new C0472c(k, this.f847b, this.f848c));
    }

    /* renamed from: j */
    private void m814j() {
        this.f853h.mo3693a((Runnable) new C0474e(this.f853h, this.f855j, this.f857l, this.f864s, this.f861p, this.f858m, this.f859n));
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public synchronized void mo3665a(boolean z) {
        this.f851f = z;
    }

    /* access modifiers changed from: protected */
    /* renamed from: b */
    public synchronized void mo3667b(String str) {
        this.f850e = str;
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public synchronized void mo3664a(String str, String str2) {
        this.f847b = str2;
        this.f848c = str;
        notify();
    }

    /* access modifiers changed from: protected */
    /* renamed from: c */
    public synchronized void mo3670c(String str) {
        this.f849d = str;
    }

    /* renamed from: d */
    public synchronized void mo3672d(String str) {
        this.f856k = str;
        notify();
    }

    /* renamed from: e */
    public synchronized void mo3674e(String str) {
        this.f858m = str;
    }

    /* renamed from: a */
    public synchronized void mo3661a(AdSize adSize) {
        this.f859n = adSize;
    }

    /* renamed from: a */
    public synchronized void mo3658a(AdRequest.ErrorCode errorCode) {
        this.f862q = errorCode;
        notify();
    }

    /* access modifiers changed from: protected */
    /* renamed from: c */
    public synchronized void mo3669c() {
        this.f863r = true;
        notify();
    }

    /* renamed from: b */
    public synchronized void mo3668b(boolean z) {
        this.f861p = z;
    }

    /* renamed from: a */
    public synchronized void mo3657a(int i) {
        this.f864s = i;
    }

    /* renamed from: c */
    public synchronized void mo3671c(boolean z) {
        this.f866u = z;
    }

    /* renamed from: a */
    public synchronized void mo3662a(C0473d dVar) {
        this.f867v = dVar;
    }

    /* renamed from: d */
    public synchronized void mo3673d(boolean z) {
        this.f846a = z;
    }
}
