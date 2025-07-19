package com.google.ads;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.ComponentName;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
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
import com.google.ads.ai;
import com.google.ads.internal.AdVideoView;
import com.google.ads.internal.AdWebView;
import com.google.ads.l;
import com.google.ads.util.AdUtil;
import java.util.HashMap;
/* loaded from: classes.dex */
public class AdActivity extends Activity implements View.OnClickListener {
    public static final String BASE_URL_PARAM = "baseurl";
    public static final String CUSTOM_CLOSE_PARAM = "custom_close";
    public static final String HTML_PARAM = "html";
    public static final String INTENT_ACTION_PARAM = "i";
    public static final String ORIENTATION_PARAM = "o";
    public static final String TYPE_PARAM = "m";
    public static final String URL_PARAM = "u";
    private static final com.google.ads.internal.a a = com.google.ads.internal.a.a.b();
    private static final Object b = new Object();
    private static AdActivity c = null;
    private static com.google.ads.internal.d d = null;
    private static AdActivity e = null;
    private static AdActivity f = null;
    private static final StaticMethodWrapper g = new StaticMethodWrapper();
    private AdWebView h;
    private FrameLayout i;
    private int j;
    private boolean l;
    private long m;
    private RelativeLayout n;
    private boolean p;
    private boolean q;
    private boolean r;
    private boolean s;
    private AdVideoView t;
    private ViewGroup k = null;
    private AdActivity o = null;

    /* loaded from: classes.dex */
    public static class StaticMethodWrapper {
        public boolean isShowing() {
            boolean z;
            synchronized (AdActivity.b) {
                z = AdActivity.e != null;
            }
            return z;
        }

        public void launchAdActivity(com.google.ads.internal.d adManager, com.google.ads.internal.e adOpener) {
            synchronized (AdActivity.b) {
                if (AdActivity.d == null) {
                    com.google.ads.internal.d unused = AdActivity.d = adManager;
                } else if (AdActivity.d != adManager) {
                    com.google.ads.util.b.b("Tried to launch a new AdActivity with a different AdManager.");
                    return;
                }
                Activity a = adManager.h().e.a();
                if (a == null) {
                    com.google.ads.util.b.e("activity was null while launching an AdActivity.");
                    return;
                }
                Intent intent = new Intent(a.getApplicationContext(), AdActivity.class);
                intent.putExtra("com.google.ads.AdOpener", adOpener.a());
                try {
                    com.google.ads.util.b.a("Launching AdActivity.");
                    a.startActivity(intent);
                } catch (ActivityNotFoundException e) {
                    com.google.ads.util.b.b("Activity not found.", e);
                }
            }
        }
    }

    protected View a(int i, boolean z) {
        this.j = (int) TypedValue.applyDimension(1, i, getResources().getDisplayMetrics());
        this.i = new FrameLayout(getApplicationContext());
        this.i.setMinimumWidth(this.j);
        this.i.setMinimumHeight(this.j);
        this.i.setOnClickListener(this);
        setCustomClose(z);
        return this.i;
    }

    private void a(String str) {
        com.google.ads.util.b.b(str);
        finish();
    }

    private void a(String str, Throwable th) {
        com.google.ads.util.b.b(str, th);
        finish();
    }

    public AdVideoView getAdVideoView() {
        return this.t;
    }

    public AdWebView getOpeningAdWebView() {
        AdWebView adWebView = null;
        if (this.o != null) {
            return this.o.h;
        }
        synchronized (b) {
            if (d == null) {
                com.google.ads.util.b.e("currentAdManager was null while trying to get the opening AdWebView.");
            } else {
                AdWebView k = d.k();
                if (k != this.h) {
                    adWebView = k;
                }
            }
        }
        return adWebView;
    }

    public static boolean isShowing() {
        return g.isShowing();
    }

    public static void launchAdActivity(com.google.ads.internal.d adManager, com.google.ads.internal.e adOpener) {
        g.launchAdActivity(adManager, adOpener);
    }

    protected void a(HashMap<String, String> hashMap, com.google.ads.internal.d dVar) {
        Intent intent = new Intent();
        intent.setComponent(new ComponentName("com.google.android.apps.plus", "com.google.android.apps.circles.platform.PlusOneActivity"));
        intent.addCategory("android.intent.category.LAUNCHER");
        intent.putExtras(getIntent().getExtras());
        intent.putExtra("com.google.circles.platform.intent.extra.ENTITY", hashMap.get("u"));
        intent.putExtra("com.google.circles.platform.intent.extra.ENTITY_TYPE", ai.b.AD.c);
        intent.putExtra("com.google.circles.platform.intent.extra.ACTION", hashMap.get("a"));
        a(dVar);
        try {
            com.google.ads.util.b.a("Launching Google+ intent from AdActivity.");
            startActivityForResult(intent, 0);
        } catch (ActivityNotFoundException e2) {
            a(e2.getMessage(), e2);
        }
    }

    protected void b(HashMap<String, String> hashMap, com.google.ads.internal.d dVar) {
        if (hashMap == null) {
            a("Could not get the paramMap in launchIntent()");
            return;
        }
        String str = hashMap.get("u");
        if (str == null) {
            a("Could not get the URL parameter in launchIntent().");
            return;
        }
        String str2 = hashMap.get(INTENT_ACTION_PARAM);
        String str3 = hashMap.get(TYPE_PARAM);
        Uri parse = Uri.parse(str);
        Intent intent = str2 == null ? new Intent("android.intent.action.VIEW", parse) : new Intent(str2, parse);
        if (str3 != null) {
            intent.setDataAndType(parse, str3);
        }
        a(dVar);
        try {
            com.google.ads.util.b.a("Launching an intent from AdActivity: " + intent.getAction() + " - " + parse);
            startActivity(intent);
        } catch (ActivityNotFoundException e2) {
            a(e2.getMessage(), e2);
        }
    }

    protected void a(com.google.ads.internal.d dVar) {
        this.h = null;
        this.m = SystemClock.elapsedRealtime();
        this.p = true;
        synchronized (b) {
            if (c == null) {
                c = this;
                dVar.v();
            }
        }
    }

    protected AdVideoView a(Activity activity) {
        return new AdVideoView(activity, this.h);
    }

    public void moveAdVideoView(int x, int y, int width, int height) {
        if (this.t != null) {
            this.t.setLayoutParams(a(x, y, width, height));
            this.t.requestLayout();
        }
    }

    public void newAdVideoView(int x, int y, int width, int height) {
        if (this.t == null) {
            this.t = a(this);
            this.n.addView(this.t, 0, a(x, y, width, height));
            synchronized (b) {
                if (d == null) {
                    com.google.ads.util.b.e("currentAdManager was null while trying to get the opening AdWebView.");
                } else {
                    d.l().b(false);
                }
            }
        }
    }

    private RelativeLayout.LayoutParams a(int i, int i2, int i3, int i4) {
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(i3, i4);
        layoutParams.setMargins(i, i2, 0, 0);
        layoutParams.addRule(10);
        layoutParams.addRule(9);
        return layoutParams;
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View v) {
        finish();
    }

    @Override // android.app.Activity
    public void onCreate(Bundle savedInstanceState) {
        boolean e2;
        int i;
        boolean z = false;
        super.onCreate(savedInstanceState);
        this.l = false;
        synchronized (b) {
            if (d != null) {
                com.google.ads.internal.d dVar = d;
                if (e == null) {
                    e = this;
                    dVar.u();
                }
                if (this.o == null && f != null) {
                    this.o = f;
                }
                f = this;
                if ((dVar.h().a() && e == this) || (dVar.h().b() && this.o == e)) {
                    dVar.w();
                }
                boolean q = dVar.q();
                l.a a2 = dVar.h().a.a().a.a();
                this.s = AdUtil.a >= a2.a.a().intValue();
                this.r = AdUtil.a >= a2.b.a().intValue();
                this.n = null;
                this.p = false;
                this.q = true;
                this.t = null;
                Bundle bundleExtra = getIntent().getBundleExtra("com.google.ads.AdOpener");
                if (bundleExtra == null) {
                    a("Could not get the Bundle used to create AdActivity.");
                    return;
                }
                com.google.ads.internal.e eVar = new com.google.ads.internal.e(bundleExtra);
                String b2 = eVar.b();
                HashMap<String, String> c2 = eVar.c();
                if (b2.equals("plusone")) {
                    a(c2, dVar);
                    return;
                } else if (b2.equals("intent")) {
                    b(c2, dVar);
                    return;
                } else {
                    this.n = new RelativeLayout(getApplicationContext());
                    if (b2.equals("webapp")) {
                        this.h = new AdWebView(dVar.h(), null);
                        com.google.ads.internal.i a3 = com.google.ads.internal.i.a(dVar, com.google.ads.internal.a.c, true, !q);
                        a3.d(true);
                        if (q) {
                            a3.a(true);
                        }
                        this.h.setWebViewClient(a3);
                        String str = c2.get("u");
                        String str2 = c2.get(BASE_URL_PARAM);
                        String str3 = c2.get(HTML_PARAM);
                        if (str != null) {
                            this.h.loadUrl(str);
                        } else if (str3 != null) {
                            this.h.loadDataWithBaseURL(str2, str3, "text/html", "utf-8", null);
                        } else {
                            a("Could not get the URL or HTML parameter to show a web app.");
                            return;
                        }
                        String str4 = c2.get(ORIENTATION_PARAM);
                        if ("p".equals(str4)) {
                            i = AdUtil.b();
                        } else if ("l".equals(str4)) {
                            i = AdUtil.a();
                        } else if (this == e) {
                            i = dVar.n();
                        } else {
                            i = -1;
                        }
                        a(this.h, false, i, q, c2 != null && "1".equals(c2.get(CUSTOM_CLOSE_PARAM)));
                        return;
                    } else if (b2.equals("interstitial") || b2.equals("expand")) {
                        this.h = dVar.k();
                        int n = dVar.n();
                        if (b2.equals("expand")) {
                            this.h.setIsExpandedMraid(true);
                            this.q = false;
                            if (c2 != null && "1".equals(c2.get(CUSTOM_CLOSE_PARAM))) {
                                z = true;
                            }
                            if (!this.r || this.s) {
                                e2 = z;
                            } else {
                                com.google.ads.util.b.a("Re-enabling hardware acceleration on expanding MRAID WebView.");
                                this.h.c();
                                e2 = z;
                            }
                        } else {
                            e2 = this.h.e();
                        }
                        a(this.h, true, n, q, e2);
                        return;
                    } else {
                        a("Unknown AdOpener, <action: " + b2 + ">");
                        return;
                    }
                }
            }
            a("Could not get currentAdManager.");
        }
    }

    protected void a(AdWebView adWebView, boolean z, int i, boolean z2, boolean z3) {
        requestWindowFeature(1);
        Window window = getWindow();
        window.setFlags(1024, 1024);
        if (AdUtil.a >= 11) {
            if (this.r) {
                com.google.ads.util.b.a("Enabling hardware acceleration on the AdActivity window.");
                com.google.ads.util.g.a(window);
            } else {
                com.google.ads.util.b.a("Disabling hardware acceleration on the AdActivity WebView.");
                adWebView.b();
            }
        }
        ViewParent parent = adWebView.getParent();
        if (parent != null) {
            if (z2) {
                if (parent instanceof ViewGroup) {
                    this.k = (ViewGroup) parent;
                    this.k.removeView(adWebView);
                } else {
                    a("MRAID banner was not a child of a ViewGroup.");
                    return;
                }
            } else {
                a("Interstitial created with an AdWebView that has a parent.");
                return;
            }
        }
        if (adWebView.d() != null) {
            a("Interstitial created with an AdWebView that is already in use by another AdActivity.");
            return;
        }
        setRequestedOrientation(i);
        adWebView.setAdActivity(this);
        View a2 = a(z2 ? 50 : 32, z3);
        this.n.addView(adWebView, -1, -1);
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-2, -2);
        if (z2) {
            layoutParams.addRule(10);
            layoutParams.addRule(11);
        } else {
            layoutParams.addRule(10);
            layoutParams.addRule(9);
        }
        this.n.addView(a2, layoutParams);
        this.n.setKeepScreenOn(true);
        setContentView(this.n);
        this.n.getRootView().setBackgroundColor(-16777216);
        if (z) {
            a.a(adWebView);
        }
    }

    @Override // android.app.Activity
    public void onDestroy() {
        if (this.n != null) {
            this.n.removeAllViews();
        }
        if (isFinishing()) {
            d();
            if (this.q && this.h != null) {
                this.h.stopLoading();
                this.h.destroy();
                this.h = null;
            }
        }
        super.onDestroy();
    }

    @Override // android.app.Activity
    public void onPause() {
        if (isFinishing()) {
            d();
        }
        super.onPause();
    }

    private void d() {
        if (!this.l) {
            if (this.h != null) {
                a.b(this.h);
                this.h.setAdActivity(null);
                this.h.setIsExpandedMraid(false);
                if (!this.q && this.n != null && this.k != null) {
                    if (this.r && !this.s) {
                        com.google.ads.util.b.a("Disabling hardware acceleration on collapsing MRAID WebView.");
                        this.h.b();
                    } else if (!this.r && this.s) {
                        com.google.ads.util.b.a("Re-enabling hardware acceleration on collapsing MRAID WebView.");
                        this.h.c();
                    }
                    this.n.removeView(this.h);
                    this.k.addView(this.h);
                }
            }
            if (this.t != null) {
                this.t.e();
                this.t = null;
            }
            if (this == c) {
                c = null;
            }
            f = this.o;
            synchronized (b) {
                if (d != null && this.q && this.h != null) {
                    if (this.h == d.k()) {
                        d.a();
                    }
                    this.h.stopLoading();
                }
                if (this == e) {
                    e = null;
                    if (d != null) {
                        d.t();
                        d = null;
                    } else {
                        com.google.ads.util.b.e("currentAdManager is null while trying to destroy AdActivity.");
                    }
                }
            }
            this.l = true;
            com.google.ads.util.b.a("AdActivity is closing.");
        }
    }

    @Override // android.app.Activity, android.view.Window.Callback
    public void onWindowFocusChanged(boolean hasFocus) {
        if (this.p && hasFocus && SystemClock.elapsedRealtime() - this.m > 250) {
            com.google.ads.util.b.d("Launcher AdActivity got focus and is closing.");
            finish();
        }
        super.onWindowFocusChanged(hasFocus);
    }

    @Override // android.app.Activity
    public void onActivityResult(int reqCode, int resCode, Intent data) {
        super.onActivityResult(reqCode, resCode, data);
        if (getOpeningAdWebView() != null && data != null && data.getExtras() != null && data.getExtras().getString("com.google.circles.platform.result.extra.CONFIRMATION") != null && data.getExtras().getString("com.google.circles.platform.result.extra.ACTION") != null) {
            String string = data.getExtras().getString("com.google.circles.platform.result.extra.CONFIRMATION");
            String string2 = data.getExtras().getString("com.google.circles.platform.result.extra.ACTION");
            if (string.equals("yes")) {
                if (string2.equals("insert")) {
                    ag.a((WebView) getOpeningAdWebView(), true);
                } else if (string2.equals("delete")) {
                    ag.a((WebView) getOpeningAdWebView(), false);
                }
            }
        }
        finish();
    }

    public void setCustomClose(boolean useCustomClose) {
        if (this.i != null) {
            this.i.removeAllViews();
            if (!useCustomClose) {
                ImageButton imageButton = new ImageButton(this);
                imageButton.setImageResource(17301527);
                imageButton.setBackgroundColor(0);
                imageButton.setOnClickListener(this);
                imageButton.setPadding(0, 0, 0, 0);
                this.i.addView(imageButton, new FrameLayout.LayoutParams(this.j, this.j, 17));
            }
        }
    }
}
