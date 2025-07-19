package com.google.ads;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.ComponentName;
import android.content.Intent;
import android.net.Uri;
import android.os.SystemClock;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.Window;
import android.webkit.WebView;
import android.widget.FrameLayout;
import android.widget.ImageButton;
import android.widget.RelativeLayout;
import com.google.ads.C0435ai;
import com.google.ads.internal.AdVideoView;
import com.google.ads.internal.AdWebView;
import com.google.ads.internal.C0462a;
import com.google.ads.internal.C0475d;
import com.google.ads.internal.C0476e;
import com.google.ads.util.AdUtil;
import com.google.ads.util.C0508b;
import com.google.ads.util.C0518g;
import java.util.HashMap;

public class AdActivity extends Activity implements View.OnClickListener {
    public static final String BASE_URL_PARAM = "baseurl";
    public static final String CUSTOM_CLOSE_PARAM = "custom_close";
    public static final String HTML_PARAM = "html";
    public static final String INTENT_ACTION_PARAM = "i";
    public static final String ORIENTATION_PARAM = "o";
    public static final String TYPE_PARAM = "m";
    public static final String URL_PARAM = "u";

    /* renamed from: a */
    private static final C0462a f681a = C0462a.f841a.mo3651b();
    /* access modifiers changed from: private */

    /* renamed from: b */
    public static final Object f682b = new Object();

    /* renamed from: c */
    private static AdActivity f683c = null;
    /* access modifiers changed from: private */

    /* renamed from: d */
    public static C0475d f684d = null;
    /* access modifiers changed from: private */

    /* renamed from: e */
    public static AdActivity f685e = null;

    /* renamed from: f */
    private static AdActivity f686f = null;

    /* renamed from: g */
    private static final StaticMethodWrapper f687g = new StaticMethodWrapper();

    /* renamed from: h */
    private AdWebView f688h;

    /* renamed from: i */
    private FrameLayout f689i;

    /* renamed from: j */
    private int f690j;

    /* renamed from: k */
    private ViewGroup f691k = null;

    /* renamed from: l */
    private boolean f692l;

    /* renamed from: m */
    private long f693m;

    /* renamed from: n */
    private RelativeLayout f694n;

    /* renamed from: o */
    private AdActivity f695o = null;

    /* renamed from: p */
    private boolean f696p;

    /* renamed from: q */
    private boolean f697q;

    /* renamed from: r */
    private boolean f698r;

    /* renamed from: s */
    private boolean f699s;

    /* renamed from: t */
    private AdVideoView f700t;

    public static class StaticMethodWrapper {
        public boolean isShowing() {
            boolean z;
            synchronized (AdActivity.f682b) {
                z = AdActivity.f685e != null;
            }
            return z;
        }

        /* JADX WARNING: Code restructure failed: missing block: B:19:0x0033, code lost:
            r1 = new android.content.Intent(r0.getApplicationContext(), com.google.ads.AdActivity.class);
            r1.putExtra("com.google.ads.AdOpener", r6.mo3727a());
         */
        /* JADX WARNING: Code restructure failed: missing block: B:21:?, code lost:
            com.google.ads.util.C0508b.m1026a("Launching AdActivity.");
            r0.startActivity(r1);
         */
        /* JADX WARNING: Code restructure failed: missing block: B:22:0x0050, code lost:
            r0 = move-exception;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:23:0x0051, code lost:
            com.google.ads.util.C0508b.m1031b("Activity not found.", r0);
         */
        /* JADX WARNING: Code restructure failed: missing block: B:24:?, code lost:
            return;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:26:?, code lost:
            return;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:27:?, code lost:
            return;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:7:0x000f, code lost:
            r0 = r5.mo3708h().f984e.mo3877a();
         */
        /* JADX WARNING: Code restructure failed: missing block: B:8:0x001b, code lost:
            if (r0 != null) goto L_0x0033;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:9:0x001d, code lost:
            com.google.ads.util.C0508b.m1036e("activity was null while launching an AdActivity.");
         */
        /* Code decompiled incorrectly, please refer to instructions dump. */
        public void launchAdActivity(com.google.ads.internal.C0475d r5, com.google.ads.internal.C0476e r6) {
            /*
                r4 = this;
                java.lang.Object r1 = com.google.ads.AdActivity.f682b
                monitor-enter(r1)
                com.google.ads.internal.d r0 = com.google.ads.AdActivity.f684d     // Catch:{ all -> 0x0030 }
                if (r0 != 0) goto L_0x0023
                com.google.ads.internal.C0475d unused = com.google.ads.AdActivity.f684d = r5     // Catch:{ all -> 0x0030 }
            L_0x000e:
                monitor-exit(r1)     // Catch:{ all -> 0x0030 }
                com.google.ads.m r0 = r5.mo3708h()
                com.google.ads.util.i$d<android.app.Activity> r0 = r0.f984e
                java.lang.Object r0 = r0.mo3877a()
                android.app.Activity r0 = (android.app.Activity) r0
                if (r0 != 0) goto L_0x0033
                java.lang.String r0 = "activity was null while launching an AdActivity."
                com.google.ads.util.C0508b.m1036e(r0)
            L_0x0022:
                return
            L_0x0023:
                com.google.ads.internal.d r0 = com.google.ads.AdActivity.f684d     // Catch:{ all -> 0x0030 }
                if (r0 == r5) goto L_0x000e
                java.lang.String r0 = "Tried to launch a new AdActivity with a different AdManager."
                com.google.ads.util.C0508b.m1030b(r0)     // Catch:{ all -> 0x0030 }
                monitor-exit(r1)     // Catch:{ all -> 0x0030 }
                goto L_0x0022
            L_0x0030:
                r0 = move-exception
                monitor-exit(r1)     // Catch:{ all -> 0x0030 }
                throw r0
            L_0x0033:
                android.content.Intent r1 = new android.content.Intent
                android.content.Context r2 = r0.getApplicationContext()
                java.lang.Class<com.google.ads.AdActivity> r3 = com.google.ads.AdActivity.class
                r1.<init>(r2, r3)
                java.lang.String r2 = "com.google.ads.AdOpener"
                android.os.Bundle r3 = r6.mo3727a()
                r1.putExtra(r2, r3)
                java.lang.String r2 = "Launching AdActivity."
                com.google.ads.util.C0508b.m1026a((java.lang.String) r2)     // Catch:{ ActivityNotFoundException -> 0x0050 }
                r0.startActivity(r1)     // Catch:{ ActivityNotFoundException -> 0x0050 }
                goto L_0x0022
            L_0x0050:
                r0 = move-exception
                java.lang.String r1 = "Activity not found."
                com.google.ads.util.C0508b.m1031b(r1, r0)
                goto L_0x0022
            */
            throw new UnsupportedOperationException("Method not decompiled: com.google.ads.AdActivity.StaticMethodWrapper.launchAdActivity(com.google.ads.internal.d, com.google.ads.internal.e):void");
        }
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public View mo3456a(int i, boolean z) {
        this.f690j = (int) TypedValue.applyDimension(1, (float) i, getResources().getDisplayMetrics());
        this.f689i = new FrameLayout(getApplicationContext());
        this.f689i.setMinimumWidth(this.f690j);
        this.f689i.setMinimumHeight(this.f690j);
        this.f689i.setOnClickListener(this);
        setCustomClose(z);
        return this.f689i;
    }

    /* renamed from: a */
    private void m652a(String str) {
        C0508b.m1030b(str);
        finish();
    }

    /* renamed from: a */
    private void m653a(String str, Throwable th) {
        C0508b.m1031b(str, th);
        finish();
    }

    public AdVideoView getAdVideoView() {
        return this.f700t;
    }

    public AdWebView getOpeningAdWebView() {
        if (this.f695o != null) {
            return this.f695o.f688h;
        }
        synchronized (f682b) {
            if (f684d == null) {
                C0508b.m1036e("currentAdManager was null while trying to get the opening AdWebView.");
                return null;
            }
            AdWebView k = f684d.mo3711k();
            if (k != this.f688h) {
                return k;
            }
            return null;
        }
    }

    public static boolean isShowing() {
        return f687g.isShowing();
    }

    public static void launchAdActivity(C0475d adManager, C0476e adOpener) {
        f687g.launchAdActivity(adManager, adOpener);
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public void mo3460a(HashMap<String, String> hashMap, C0475d dVar) {
        Intent intent = new Intent();
        intent.setComponent(new ComponentName("com.google.android.apps.plus", "com.google.android.apps.circles.platform.PlusOneActivity"));
        intent.addCategory("android.intent.category.LAUNCHER");
        intent.putExtras(getIntent().getExtras());
        intent.putExtra("com.google.circles.platform.intent.extra.ENTITY", hashMap.get("u"));
        intent.putExtra("com.google.circles.platform.intent.extra.ENTITY_TYPE", C0435ai.C0437b.AD.f748c);
        intent.putExtra("com.google.circles.platform.intent.extra.ACTION", hashMap.get("a"));
        mo3459a(dVar);
        try {
            C0508b.m1026a("Launching Google+ intent from AdActivity.");
            startActivityForResult(intent, 0);
        } catch (ActivityNotFoundException e) {
            m653a(e.getMessage(), (Throwable) e);
        }
    }

    /* access modifiers changed from: protected */
    /* renamed from: b */
    public void mo3461b(HashMap<String, String> hashMap, C0475d dVar) {
        if (hashMap == null) {
            m652a("Could not get the paramMap in launchIntent()");
            return;
        }
        String str = hashMap.get("u");
        if (str == null) {
            m652a("Could not get the URL parameter in launchIntent().");
            return;
        }
        String str2 = hashMap.get(INTENT_ACTION_PARAM);
        String str3 = hashMap.get(TYPE_PARAM);
        Uri parse = Uri.parse(str);
        Intent intent = str2 == null ? new Intent("android.intent.action.VIEW", parse) : new Intent(str2, parse);
        if (str3 != null) {
            intent.setDataAndType(parse, str3);
        }
        mo3459a(dVar);
        try {
            C0508b.m1026a("Launching an intent from AdActivity: " + intent.getAction() + " - " + parse);
            startActivity(intent);
        } catch (ActivityNotFoundException e) {
            m653a(e.getMessage(), (Throwable) e);
        }
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public void mo3459a(C0475d dVar) {
        this.f688h = null;
        this.f693m = SystemClock.elapsedRealtime();
        this.f696p = true;
        synchronized (f682b) {
            if (f683c == null) {
                f683c = this;
                dVar.mo3722v();
            }
        }
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public AdVideoView mo3457a(Activity activity) {
        return new AdVideoView(activity, this.f688h);
    }

    public void moveAdVideoView(int x, int y, int width, int height) {
        if (this.f700t != null) {
            this.f700t.setLayoutParams(m650a(x, y, width, height));
            this.f700t.requestLayout();
        }
    }

    public void newAdVideoView(int x, int y, int width, int height) {
        if (this.f700t == null) {
            this.f700t = mo3457a((Activity) this);
            this.f694n.addView(this.f700t, 0, m650a(x, y, width, height));
            synchronized (f682b) {
                if (f684d == null) {
                    C0508b.m1036e("currentAdManager was null while trying to get the opening AdWebView.");
                } else {
                    f684d.mo3712l().mo3771b(false);
                }
            }
        }
    }

    /* renamed from: a */
    private RelativeLayout.LayoutParams m650a(int i, int i2, int i3, int i4) {
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(i3, i4);
        layoutParams.setMargins(i, i2, 0, 0);
        layoutParams.addRule(10);
        layoutParams.addRule(9);
        return layoutParams;
    }

    public void onClick(View v) {
        finish();
    }

    /* JADX WARNING: Code restructure failed: missing block: B:100:0x0203, code lost:
        r5 = r7;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:101:?, code lost:
        return;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:103:?, code lost:
        return;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:104:?, code lost:
        return;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:105:?, code lost:
        return;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:106:?, code lost:
        return;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:107:?, code lost:
        return;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:108:?, code lost:
        return;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:30:0x0088, code lost:
        r11.f694n = null;
        r11.f696p = false;
        r11.f697q = true;
        r11.f700t = null;
        r0 = getIntent().getBundleExtra("com.google.ads.AdOpener");
     */
    /* JADX WARNING: Code restructure failed: missing block: B:31:0x009a, code lost:
        if (r0 != null) goto L_0x00b0;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:32:0x009c, code lost:
        m652a("Could not get the Bundle used to create AdActivity.");
     */
    /* JADX WARNING: Code restructure failed: missing block: B:43:0x00b0, code lost:
        r1 = new com.google.ads.internal.C0476e(r0);
        r0 = r1.mo3728b();
        r10 = r1.mo3729c();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:44:0x00c3, code lost:
        if (r0.equals("plusone") == false) goto L_0x00c9;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:45:0x00c5, code lost:
        mo3460a(r10, r8);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:47:0x00cf, code lost:
        if (r0.equals("intent") == false) goto L_0x00d5;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:48:0x00d1, code lost:
        mo3461b(r10, r8);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:49:0x00d5, code lost:
        r11.f694n = new android.widget.RelativeLayout(getApplicationContext());
     */
    /* JADX WARNING: Code restructure failed: missing block: B:50:0x00e6, code lost:
        if (r0.equals("webapp") == false) goto L_0x0186;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:51:0x00e8, code lost:
        r11.f688h = new com.google.ads.internal.AdWebView(r8.mo3708h(), (com.google.ads.AdSize) null);
        r1 = com.google.ads.internal.C0462a.f843c;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:52:0x00f5, code lost:
        if (r9 != false) goto L_0x0157;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:53:0x00f7, code lost:
        r0 = true;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:54:0x00f8, code lost:
        r0 = com.google.ads.internal.C0482i.m948a(r8, r1, true, r0);
        r0.mo3773d(true);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:55:0x00ff, code lost:
        if (r9 == false) goto L_0x0104;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:56:0x0101, code lost:
        r0.mo3770a(true);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:57:0x0104, code lost:
        r11.f688h.setWebViewClient(r0);
        r0 = r10.get("u");
        r1 = r10.get(BASE_URL_PARAM);
        r2 = r10.get(HTML_PARAM);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:58:0x0121, code lost:
        if (r0 == null) goto L_0x0159;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:59:0x0123, code lost:
        r11.f688h.loadUrl(r0);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:60:0x0128, code lost:
        r0 = r10.get(ORIENTATION_PARAM);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:61:0x0136, code lost:
        if ("p".equals(r0) == false) goto L_0x016c;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:62:0x0138, code lost:
        r3 = com.google.ads.util.AdUtil.m998b();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:63:0x013c, code lost:
        r1 = r11.f688h;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:64:0x013e, code lost:
        if (r10 == null) goto L_0x0184;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:66:0x014c, code lost:
        if ("1".equals(r10.get(CUSTOM_CLOSE_PARAM)) == false) goto L_0x0184;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:67:0x014e, code lost:
        r5 = true;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:68:0x014f, code lost:
        mo3458a(r1, false, r3, r9, r5);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:69:0x0157, code lost:
        r0 = false;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:70:0x0159, code lost:
        if (r2 == null) goto L_0x0165;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:71:0x015b, code lost:
        r11.f688h.loadDataWithBaseURL(r1, r2, "text/html", "utf-8", (java.lang.String) null);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:72:0x0165, code lost:
        m652a("Could not get the URL or HTML parameter to show a web app.");
     */
    /* JADX WARNING: Code restructure failed: missing block: B:74:0x0172, code lost:
        if ("l".equals(r0) == false) goto L_0x0179;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:75:0x0174, code lost:
        r3 = com.google.ads.util.AdUtil.m982a();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:77:0x017b, code lost:
        if (r11 != f685e) goto L_0x0182;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:78:0x017d, code lost:
        r3 = r8.mo3714n();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:79:0x0182, code lost:
        r3 = -1;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:80:0x0184, code lost:
        r5 = false;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:82:0x018c, code lost:
        if (r0.equals("interstitial") != false) goto L_0x0196;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:84:0x0194, code lost:
        if (r0.equals("expand") == false) goto L_0x01e5;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:85:0x0196, code lost:
        r11.f688h = r8.mo3711k();
        r3 = r8.mo3714n();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:86:0x01a6, code lost:
        if (r0.equals("expand") == false) goto L_0x01dd;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:87:0x01a8, code lost:
        r11.f688h.setIsExpandedMraid(true);
        r11.f697q = false;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:88:0x01af, code lost:
        if (r10 == null) goto L_0x01c0;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:90:0x01bd, code lost:
        if ("1".equals(r10.get(CUSTOM_CLOSE_PARAM)) == false) goto L_0x01c0;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:91:0x01bf, code lost:
        r7 = true;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:93:0x01c2, code lost:
        if (r11.f698r == false) goto L_0x0203;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:95:0x01c6, code lost:
        if (r11.f699s != false) goto L_0x0203;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:96:0x01c8, code lost:
        com.google.ads.util.C0508b.m1026a("Re-enabling hardware acceleration on expanding MRAID WebView.");
        r11.f688h.mo3626c();
        r5 = r7;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:97:0x01d3, code lost:
        mo3458a(r11.f688h, true, r3, r9, r5);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:98:0x01dd, code lost:
        r5 = r11.f688h.mo3629e();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:99:0x01e5, code lost:
        m652a("Unknown AdOpener, <action: " + r0 + ">");
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void onCreate(android.os.Bundle r12) {
        /*
            r11 = this;
            r5 = 0
            r7 = 0
            r6 = 1
            super.onCreate(r12)
            r11.f692l = r7
            java.lang.Object r2 = f682b
            monitor-enter(r2)
            com.google.ads.internal.d r0 = f684d     // Catch:{ all -> 0x00a9 }
            if (r0 == 0) goto L_0x00a2
            com.google.ads.internal.d r8 = f684d     // Catch:{ all -> 0x00a9 }
            com.google.ads.AdActivity r0 = f685e     // Catch:{ all -> 0x00a9 }
            if (r0 != 0) goto L_0x001a
            f685e = r11     // Catch:{ all -> 0x00a9 }
            r8.mo3721u()     // Catch:{ all -> 0x00a9 }
        L_0x001a:
            com.google.ads.AdActivity r0 = r11.f695o     // Catch:{ all -> 0x00a9 }
            if (r0 != 0) goto L_0x0026
            com.google.ads.AdActivity r0 = f686f     // Catch:{ all -> 0x00a9 }
            if (r0 == 0) goto L_0x0026
            com.google.ads.AdActivity r0 = f686f     // Catch:{ all -> 0x00a9 }
            r11.f695o = r0     // Catch:{ all -> 0x00a9 }
        L_0x0026:
            f686f = r11     // Catch:{ all -> 0x00a9 }
            com.google.ads.m r0 = r8.mo3708h()     // Catch:{ all -> 0x00a9 }
            boolean r0 = r0.mo3790a()     // Catch:{ all -> 0x00a9 }
            if (r0 == 0) goto L_0x0036
            com.google.ads.AdActivity r0 = f685e     // Catch:{ all -> 0x00a9 }
            if (r0 == r11) goto L_0x0046
        L_0x0036:
            com.google.ads.m r0 = r8.mo3708h()     // Catch:{ all -> 0x00a9 }
            boolean r0 = r0.mo3791b()     // Catch:{ all -> 0x00a9 }
            if (r0 == 0) goto L_0x0049
            com.google.ads.AdActivity r0 = r11.f695o     // Catch:{ all -> 0x00a9 }
            com.google.ads.AdActivity r1 = f685e     // Catch:{ all -> 0x00a9 }
            if (r0 != r1) goto L_0x0049
        L_0x0046:
            r8.mo3723w()     // Catch:{ all -> 0x00a9 }
        L_0x0049:
            boolean r9 = r8.mo3717q()     // Catch:{ all -> 0x00a9 }
            com.google.ads.m r0 = r8.mo3708h()     // Catch:{ all -> 0x00a9 }
            com.google.ads.util.i$b<com.google.ads.l> r0 = r0.f980a     // Catch:{ all -> 0x00a9 }
            java.lang.Object r0 = r0.mo3874a()     // Catch:{ all -> 0x00a9 }
            com.google.ads.l r0 = (com.google.ads.C0489l) r0     // Catch:{ all -> 0x00a9 }
            com.google.ads.util.i$b<com.google.ads.l$a> r0 = r0.f967a     // Catch:{ all -> 0x00a9 }
            java.lang.Object r0 = r0.mo3874a()     // Catch:{ all -> 0x00a9 }
            com.google.ads.l$a r0 = (com.google.ads.C0489l.C0490a) r0     // Catch:{ all -> 0x00a9 }
            int r3 = com.google.ads.util.AdUtil.f1033a     // Catch:{ all -> 0x00a9 }
            com.google.ads.util.i$c<java.lang.Integer> r1 = r0.f968a     // Catch:{ all -> 0x00a9 }
            java.lang.Object r1 = r1.mo3875a()     // Catch:{ all -> 0x00a9 }
            java.lang.Integer r1 = (java.lang.Integer) r1     // Catch:{ all -> 0x00a9 }
            int r1 = r1.intValue()     // Catch:{ all -> 0x00a9 }
            if (r3 < r1) goto L_0x00ac
            r1 = r6
        L_0x0072:
            r11.f699s = r1     // Catch:{ all -> 0x00a9 }
            int r1 = com.google.ads.util.AdUtil.f1033a     // Catch:{ all -> 0x00a9 }
            com.google.ads.util.i$c<java.lang.Integer> r0 = r0.f969b     // Catch:{ all -> 0x00a9 }
            java.lang.Object r0 = r0.mo3875a()     // Catch:{ all -> 0x00a9 }
            java.lang.Integer r0 = (java.lang.Integer) r0     // Catch:{ all -> 0x00a9 }
            int r0 = r0.intValue()     // Catch:{ all -> 0x00a9 }
            if (r1 < r0) goto L_0x00ae
            r0 = r6
        L_0x0085:
            r11.f698r = r0     // Catch:{ all -> 0x00a9 }
            monitor-exit(r2)     // Catch:{ all -> 0x00a9 }
            r11.f694n = r5
            r11.f696p = r7
            r11.f697q = r6
            r11.f700t = r5
            android.content.Intent r0 = r11.getIntent()
            java.lang.String r1 = "com.google.ads.AdOpener"
            android.os.Bundle r0 = r0.getBundleExtra(r1)
            if (r0 != 0) goto L_0x00b0
            java.lang.String r0 = "Could not get the Bundle used to create AdActivity."
            r11.m652a((java.lang.String) r0)
        L_0x00a1:
            return
        L_0x00a2:
            java.lang.String r0 = "Could not get currentAdManager."
            r11.m652a((java.lang.String) r0)     // Catch:{ all -> 0x00a9 }
            monitor-exit(r2)     // Catch:{ all -> 0x00a9 }
            goto L_0x00a1
        L_0x00a9:
            r0 = move-exception
            monitor-exit(r2)     // Catch:{ all -> 0x00a9 }
            throw r0
        L_0x00ac:
            r1 = r7
            goto L_0x0072
        L_0x00ae:
            r0 = r7
            goto L_0x0085
        L_0x00b0:
            com.google.ads.internal.e r1 = new com.google.ads.internal.e
            r1.<init>((android.os.Bundle) r0)
            java.lang.String r0 = r1.mo3728b()
            java.util.HashMap r10 = r1.mo3729c()
            java.lang.String r1 = "plusone"
            boolean r1 = r0.equals(r1)
            if (r1 == 0) goto L_0x00c9
            r11.mo3460a((java.util.HashMap<java.lang.String, java.lang.String>) r10, (com.google.ads.internal.C0475d) r8)
            goto L_0x00a1
        L_0x00c9:
            java.lang.String r1 = "intent"
            boolean r1 = r0.equals(r1)
            if (r1 == 0) goto L_0x00d5
            r11.mo3461b(r10, r8)
            goto L_0x00a1
        L_0x00d5:
            android.widget.RelativeLayout r1 = new android.widget.RelativeLayout
            android.content.Context r2 = r11.getApplicationContext()
            r1.<init>(r2)
            r11.f694n = r1
            java.lang.String r1 = "webapp"
            boolean r1 = r0.equals(r1)
            if (r1 == 0) goto L_0x0186
            com.google.ads.internal.AdWebView r0 = new com.google.ads.internal.AdWebView
            com.google.ads.m r1 = r8.mo3708h()
            r0.<init>(r1, r5)
            r11.f688h = r0
            java.util.Map<java.lang.String, com.google.ads.n> r1 = com.google.ads.internal.C0462a.f843c
            if (r9 != 0) goto L_0x0157
            r0 = r6
        L_0x00f8:
            com.google.ads.internal.i r0 = com.google.ads.internal.C0482i.m948a(r8, r1, r6, r0)
            r0.mo3773d(r6)
            if (r9 == 0) goto L_0x0104
            r0.mo3770a(r6)
        L_0x0104:
            com.google.ads.internal.AdWebView r1 = r11.f688h
            r1.setWebViewClient(r0)
            java.lang.String r0 = "u"
            java.lang.Object r0 = r10.get(r0)
            java.lang.String r0 = (java.lang.String) r0
            java.lang.String r1 = "baseurl"
            java.lang.Object r1 = r10.get(r1)
            java.lang.String r1 = (java.lang.String) r1
            java.lang.String r2 = "html"
            java.lang.Object r2 = r10.get(r2)
            java.lang.String r2 = (java.lang.String) r2
            if (r0 == 0) goto L_0x0159
            com.google.ads.internal.AdWebView r1 = r11.f688h
            r1.loadUrl(r0)
        L_0x0128:
            java.lang.String r0 = "o"
            java.lang.Object r0 = r10.get(r0)
            java.lang.String r0 = (java.lang.String) r0
            java.lang.String r1 = "p"
            boolean r1 = r1.equals(r0)
            if (r1 == 0) goto L_0x016c
            int r3 = com.google.ads.util.AdUtil.m998b()
        L_0x013c:
            com.google.ads.internal.AdWebView r1 = r11.f688h
            if (r10 == 0) goto L_0x0184
            java.lang.String r0 = "1"
            java.lang.String r2 = "custom_close"
            java.lang.Object r2 = r10.get(r2)
            boolean r0 = r0.equals(r2)
            if (r0 == 0) goto L_0x0184
            r5 = r6
        L_0x014f:
            r0 = r11
            r2 = r7
            r4 = r9
            r0.mo3458a(r1, r2, r3, r4, r5)
            goto L_0x00a1
        L_0x0157:
            r0 = r7
            goto L_0x00f8
        L_0x0159:
            if (r2 == 0) goto L_0x0165
            com.google.ads.internal.AdWebView r0 = r11.f688h
            java.lang.String r3 = "text/html"
            java.lang.String r4 = "utf-8"
            r0.loadDataWithBaseURL(r1, r2, r3, r4, r5)
            goto L_0x0128
        L_0x0165:
            java.lang.String r0 = "Could not get the URL or HTML parameter to show a web app."
            r11.m652a((java.lang.String) r0)
            goto L_0x00a1
        L_0x016c:
            java.lang.String r1 = "l"
            boolean r0 = r1.equals(r0)
            if (r0 == 0) goto L_0x0179
            int r3 = com.google.ads.util.AdUtil.m982a()
            goto L_0x013c
        L_0x0179:
            com.google.ads.AdActivity r0 = f685e
            if (r11 != r0) goto L_0x0182
            int r3 = r8.mo3714n()
            goto L_0x013c
        L_0x0182:
            r3 = -1
            goto L_0x013c
        L_0x0184:
            r5 = r7
            goto L_0x014f
        L_0x0186:
            java.lang.String r1 = "interstitial"
            boolean r1 = r0.equals(r1)
            if (r1 != 0) goto L_0x0196
            java.lang.String r1 = "expand"
            boolean r1 = r0.equals(r1)
            if (r1 == 0) goto L_0x01e5
        L_0x0196:
            com.google.ads.internal.AdWebView r1 = r8.mo3711k()
            r11.f688h = r1
            int r3 = r8.mo3714n()
            java.lang.String r1 = "expand"
            boolean r0 = r0.equals(r1)
            if (r0 == 0) goto L_0x01dd
            com.google.ads.internal.AdWebView r0 = r11.f688h
            r0.setIsExpandedMraid(r6)
            r11.f697q = r7
            if (r10 == 0) goto L_0x01c0
            java.lang.String r0 = "1"
            java.lang.String r1 = "custom_close"
            java.lang.Object r1 = r10.get(r1)
            boolean r0 = r0.equals(r1)
            if (r0 == 0) goto L_0x01c0
            r7 = r6
        L_0x01c0:
            boolean r0 = r11.f698r
            if (r0 == 0) goto L_0x0203
            boolean r0 = r11.f699s
            if (r0 != 0) goto L_0x0203
            java.lang.String r0 = "Re-enabling hardware acceleration on expanding MRAID WebView."
            com.google.ads.util.C0508b.m1026a((java.lang.String) r0)
            com.google.ads.internal.AdWebView r0 = r11.f688h
            r0.mo3626c()
            r5 = r7
        L_0x01d3:
            com.google.ads.internal.AdWebView r1 = r11.f688h
            r0 = r11
            r2 = r6
            r4 = r9
            r0.mo3458a(r1, r2, r3, r4, r5)
            goto L_0x00a1
        L_0x01dd:
            com.google.ads.internal.AdWebView r0 = r11.f688h
            boolean r7 = r0.mo3629e()
            r5 = r7
            goto L_0x01d3
        L_0x01e5:
            java.lang.StringBuilder r1 = new java.lang.StringBuilder
            r1.<init>()
            java.lang.String r2 = "Unknown AdOpener, <action: "
            java.lang.StringBuilder r1 = r1.append(r2)
            java.lang.StringBuilder r0 = r1.append(r0)
            java.lang.String r1 = ">"
            java.lang.StringBuilder r0 = r0.append(r1)
            java.lang.String r0 = r0.toString()
            r11.m652a((java.lang.String) r0)
            goto L_0x00a1
        L_0x0203:
            r5 = r7
            goto L_0x01d3
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.ads.AdActivity.onCreate(android.os.Bundle):void");
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public void mo3458a(AdWebView adWebView, boolean z, int i, boolean z2, boolean z3) {
        requestWindowFeature(1);
        Window window = getWindow();
        window.setFlags(1024, 1024);
        if (AdUtil.f1033a >= 11) {
            if (this.f698r) {
                C0508b.m1026a("Enabling hardware acceleration on the AdActivity window.");
                C0518g.m1052a(window);
            } else {
                C0508b.m1026a("Disabling hardware acceleration on the AdActivity WebView.");
                adWebView.mo3625b();
            }
        }
        ViewParent parent = adWebView.getParent();
        if (parent != null) {
            if (!z2) {
                m652a("Interstitial created with an AdWebView that has a parent.");
                return;
            } else if (parent instanceof ViewGroup) {
                this.f691k = (ViewGroup) parent;
                this.f691k.removeView(adWebView);
            } else {
                m652a("MRAID banner was not a child of a ViewGroup.");
                return;
            }
        }
        if (adWebView.mo3627d() != null) {
            m652a("Interstitial created with an AdWebView that is already in use by another AdActivity.");
            return;
        }
        setRequestedOrientation(i);
        adWebView.setAdActivity(this);
        View a = mo3456a(z2 ? 50 : 32, z3);
        this.f694n.addView(adWebView, -1, -1);
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-2, -2);
        if (z2) {
            layoutParams.addRule(10);
            layoutParams.addRule(11);
        } else {
            layoutParams.addRule(10);
            layoutParams.addRule(9);
        }
        this.f694n.addView(a, layoutParams);
        this.f694n.setKeepScreenOn(true);
        setContentView(this.f694n);
        this.f694n.getRootView().setBackgroundColor(-16777216);
        if (z) {
            f681a.mo3641a((WebView) adWebView);
        }
    }

    public void onDestroy() {
        if (this.f694n != null) {
            this.f694n.removeAllViews();
        }
        if (isFinishing()) {
            m657d();
            if (this.f697q && this.f688h != null) {
                this.f688h.stopLoading();
                this.f688h.destroy();
                this.f688h = null;
            }
        }
        super.onDestroy();
    }

    public void onPause() {
        if (isFinishing()) {
            m657d();
        }
        super.onPause();
    }

    /* renamed from: d */
    private void m657d() {
        if (!this.f692l) {
            if (this.f688h != null) {
                f681a.mo3647b((WebView) this.f688h);
                this.f688h.setAdActivity((AdActivity) null);
                this.f688h.setIsExpandedMraid(false);
                if (!(this.f697q || this.f694n == null || this.f691k == null)) {
                    if (this.f698r && !this.f699s) {
                        C0508b.m1026a("Disabling hardware acceleration on collapsing MRAID WebView.");
                        this.f688h.mo3625b();
                    } else if (!this.f698r && this.f699s) {
                        C0508b.m1026a("Re-enabling hardware acceleration on collapsing MRAID WebView.");
                        this.f688h.mo3626c();
                    }
                    this.f694n.removeView(this.f688h);
                    this.f691k.addView(this.f688h);
                }
            }
            if (this.f700t != null) {
                this.f700t.mo3615e();
                this.f700t = null;
            }
            if (this == f683c) {
                f683c = null;
            }
            f686f = this.f695o;
            synchronized (f682b) {
                if (!(f684d == null || !this.f697q || this.f688h == null)) {
                    if (this.f688h == f684d.mo3711k()) {
                        f684d.mo3683a();
                    }
                    this.f688h.stopLoading();
                }
                if (this == f685e) {
                    f685e = null;
                    if (f684d != null) {
                        f684d.mo3720t();
                        f684d = null;
                    } else {
                        C0508b.m1036e("currentAdManager is null while trying to destroy AdActivity.");
                    }
                }
            }
            this.f692l = true;
            C0508b.m1026a("AdActivity is closing.");
        }
    }

    public void onWindowFocusChanged(boolean hasFocus) {
        if (this.f696p && hasFocus && SystemClock.elapsedRealtime() - this.f693m > 250) {
            C0508b.m1034d("Launcher AdActivity got focus and is closing.");
            finish();
        }
        super.onWindowFocusChanged(hasFocus);
    }

    public void onActivityResult(int reqCode, int resCode, Intent data) {
        super.onActivityResult(reqCode, resCode, data);
        if (!(getOpeningAdWebView() == null || data == null || data.getExtras() == null || data.getExtras().getString("com.google.circles.platform.result.extra.CONFIRMATION") == null || data.getExtras().getString("com.google.circles.platform.result.extra.ACTION") == null)) {
            String string = data.getExtras().getString("com.google.circles.platform.result.extra.CONFIRMATION");
            String string2 = data.getExtras().getString("com.google.circles.platform.result.extra.ACTION");
            if (string.equals("yes")) {
                if (string2.equals("insert")) {
                    C0430ag.m693a((WebView) getOpeningAdWebView(), true);
                } else if (string2.equals("delete")) {
                    C0430ag.m693a((WebView) getOpeningAdWebView(), false);
                }
            }
        }
        finish();
    }

    public void setCustomClose(boolean useCustomClose) {
        if (this.f689i != null) {
            this.f689i.removeAllViews();
            if (!useCustomClose) {
                ImageButton imageButton = new ImageButton(this);
                imageButton.setImageResource(17301527);
                imageButton.setBackgroundColor(0);
                imageButton.setOnClickListener(this);
                imageButton.setPadding(0, 0, 0, 0);
                this.f689i.addView(imageButton, new FrameLayout.LayoutParams(this.f690j, this.f690j, 17));
            }
        }
    }
}
