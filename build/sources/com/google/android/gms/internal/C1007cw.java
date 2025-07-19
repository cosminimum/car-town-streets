package com.google.android.gms.internal;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.content.MutableContextWrapper;
import android.net.Uri;
import android.os.Build;
import android.view.MotionEvent;
import android.webkit.DownloadListener;
import android.webkit.WebSettings;
import android.webkit.WebView;
import com.google.android.gms.drive.DriveFile;
import java.util.HashMap;
import java.util.Map;
import org.json.JSONException;

/* renamed from: com.google.android.gms.internal.cw */
public final class C1007cw extends WebView implements DownloadListener {

    /* renamed from: fU */
    private C1466x f2417fU;

    /* renamed from: fV */
    private final C1005cu f2418fV;

    /* renamed from: fx */
    private final Object f2419fx = new Object();

    /* renamed from: he */
    private final C1332h f2420he;

    /* renamed from: iN */
    private final C1009cx f2421iN;

    /* renamed from: iO */
    private final C1008a f2422iO;

    /* renamed from: iP */
    private C0939bk f2423iP;

    /* renamed from: iQ */
    private boolean f2424iQ;

    /* renamed from: iR */
    private boolean f2425iR;

    /* renamed from: com.google.android.gms.internal.cw$a */
    private static class C1008a extends MutableContextWrapper {

        /* renamed from: iS */
        private Activity f2426iS;

        /* renamed from: iT */
        private Context f2427iT;

        public C1008a(Context context) {
            super(context);
            setBaseContext(context);
        }

        public void setBaseContext(Context base) {
            this.f2427iT = base.getApplicationContext();
            this.f2426iS = base instanceof Activity ? (Activity) base : null;
            super.setBaseContext(this.f2427iT);
        }

        public void startActivity(Intent intent) {
            if (this.f2426iS != null) {
                this.f2426iS.startActivity(intent);
                return;
            }
            intent.setFlags(DriveFile.MODE_READ_ONLY);
            this.f2427iT.startActivity(intent);
        }
    }

    private C1007cw(C1008a aVar, C1466x xVar, boolean z, boolean z2, C1332h hVar, C1005cu cuVar) {
        super(aVar);
        this.f2422iO = aVar;
        this.f2417fU = xVar;
        this.f2424iQ = z;
        this.f2420he = hVar;
        this.f2418fV = cuVar;
        setBackgroundColor(0);
        WebSettings settings = getSettings();
        settings.setJavaScriptEnabled(true);
        settings.setSavePassword(false);
        settings.setSupportMultipleWindows(true);
        settings.setJavaScriptCanOpenWindowsAutomatically(true);
        C0997co.m2172a((Context) aVar, cuVar.f2413iJ, settings);
        if (Build.VERSION.SDK_INT >= 17) {
            C1001cq.m2200a(getContext(), settings);
        } else if (Build.VERSION.SDK_INT >= 11) {
            C1000cp.m2194a(getContext(), settings);
        }
        setDownloadListener(this);
        if (Build.VERSION.SDK_INT >= 11) {
            this.f2421iN = new C1020cz(this, z2);
        } else {
            this.f2421iN = new C1009cx(this, z2);
        }
        setWebViewClient(this.f2421iN);
        if (Build.VERSION.SDK_INT >= 14) {
            setWebChromeClient(new C1022da(this));
        } else if (Build.VERSION.SDK_INT >= 11) {
            setWebChromeClient(new C1012cy(this));
        }
        m2223aG();
    }

    /* renamed from: a */
    public static C1007cw m2222a(Context context, C1466x xVar, boolean z, boolean z2, C1332h hVar, C1005cu cuVar) {
        return new C1007cw(new C1008a(context), xVar, z, z2, hVar, cuVar);
    }

    /* renamed from: aG */
    private void m2223aG() {
        synchronized (this.f2419fx) {
            if (this.f2424iQ || this.f2417fU.f3486eG) {
                if (Build.VERSION.SDK_INT < 14) {
                    C1004ct.m2214r("Disabling hardware acceleration on an overlay.");
                    m2224aH();
                } else {
                    C1004ct.m2214r("Enabling hardware acceleration on an overlay.");
                    m2225aI();
                }
            } else if (Build.VERSION.SDK_INT < 18) {
                C1004ct.m2214r("Disabling hardware acceleration on an AdView.");
                m2224aH();
            } else {
                C1004ct.m2214r("Enabling hardware acceleration on an AdView.");
                m2225aI();
            }
        }
    }

    /* renamed from: aH */
    private void m2224aH() {
        synchronized (this.f2419fx) {
            if (!this.f2425iR && Build.VERSION.SDK_INT >= 11) {
                C1000cp.m2198c(this);
            }
            this.f2425iR = true;
        }
    }

    /* renamed from: aI */
    private void m2225aI() {
        synchronized (this.f2419fx) {
            if (this.f2425iR && Build.VERSION.SDK_INT >= 11) {
                C1000cp.m2199d(this);
            }
            this.f2425iR = false;
        }
    }

    /* renamed from: a */
    public void mo7234a(Context context, C1466x xVar) {
        synchronized (this.f2419fx) {
            this.f2422iO.setBaseContext(context);
            this.f2423iP = null;
            this.f2417fU = xVar;
            this.f2424iQ = false;
            C0997co.m2185b(this);
            loadUrl("about:blank");
            this.f2421iN.reset();
        }
    }

    /* renamed from: a */
    public void mo7235a(C0939bk bkVar) {
        synchronized (this.f2419fx) {
            this.f2423iP = bkVar;
        }
    }

    /* renamed from: a */
    public void mo7236a(C1466x xVar) {
        synchronized (this.f2419fx) {
            this.f2417fU = xVar;
            requestLayout();
        }
    }

    /* renamed from: a */
    public void mo7237a(String str, Map<String, ?> map) {
        StringBuilder sb = new StringBuilder();
        sb.append("javascript:AFMA_ReceiveMessage('");
        sb.append(str);
        sb.append("'");
        if (map != null) {
            try {
                String jSONObject = C0997co.m2191m(map).toString();
                sb.append(",");
                sb.append(jSONObject);
            } catch (JSONException e) {
                C1004ct.m2218v("Could not convert AFMA event parameters to JSON.");
                return;
            }
        }
        sb.append(");");
        C1004ct.m2217u("Dispatching AFMA event: " + sb);
        loadUrl(sb.toString());
    }

    /* renamed from: aA */
    public void mo7238aA() {
        HashMap hashMap = new HashMap(1);
        hashMap.put("version", this.f2418fV.f2413iJ);
        mo7237a("onshow", (Map<String, ?>) hashMap);
    }

    /* renamed from: aB */
    public C0939bk mo7239aB() {
        C0939bk bkVar;
        synchronized (this.f2419fx) {
            bkVar = this.f2423iP;
        }
        return bkVar;
    }

    /* renamed from: aC */
    public C1009cx mo7240aC() {
        return this.f2421iN;
    }

    /* renamed from: aD */
    public C1332h mo7241aD() {
        return this.f2420he;
    }

    /* renamed from: aE */
    public C1005cu mo7242aE() {
        return this.f2418fV;
    }

    /* renamed from: aF */
    public boolean mo7243aF() {
        boolean z;
        synchronized (this.f2419fx) {
            z = this.f2424iQ;
        }
        return z;
    }

    /* renamed from: az */
    public void mo7244az() {
        HashMap hashMap = new HashMap(1);
        hashMap.put("version", this.f2418fV.f2413iJ);
        mo7237a("onhide", (Map<String, ?>) hashMap);
    }

    /* renamed from: l */
    public void mo7245l(boolean z) {
        synchronized (this.f2419fx) {
            this.f2424iQ = z;
            m2223aG();
        }
    }

    public void onDownloadStart(String url, String userAgent, String contentDisposition, String mimeType, long size) {
        try {
            Intent intent = new Intent("android.intent.action.VIEW");
            intent.setDataAndType(Uri.parse(url), mimeType);
            getContext().startActivity(intent);
        } catch (ActivityNotFoundException e) {
            C1004ct.m2214r("Couldn't find an Activity to view url/mimetype: " + url + " / " + mimeType);
        }
    }

    /* access modifiers changed from: protected */
    /* JADX WARNING: Code restructure failed: missing block: B:36:?, code lost:
        return;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void onMeasure(int r10, int r11) {
        /*
            r9 = this;
            r0 = 2147483647(0x7fffffff, float:NaN)
            r8 = 1073741824(0x40000000, float:2.0)
            r7 = 8
            r6 = -2147483648(0xffffffff80000000, float:-0.0)
            java.lang.Object r4 = r9.f2419fx
            monitor-enter(r4)
            boolean r1 = r9.isInEditMode()     // Catch:{ all -> 0x0094 }
            if (r1 != 0) goto L_0x0016
            boolean r1 = r9.f2424iQ     // Catch:{ all -> 0x0094 }
            if (r1 == 0) goto L_0x001b
        L_0x0016:
            super.onMeasure(r10, r11)     // Catch:{ all -> 0x0094 }
            monitor-exit(r4)     // Catch:{ all -> 0x0094 }
        L_0x001a:
            return
        L_0x001b:
            int r2 = android.view.View.MeasureSpec.getMode(r10)     // Catch:{ all -> 0x0094 }
            int r3 = android.view.View.MeasureSpec.getSize(r10)     // Catch:{ all -> 0x0094 }
            int r5 = android.view.View.MeasureSpec.getMode(r11)     // Catch:{ all -> 0x0094 }
            int r1 = android.view.View.MeasureSpec.getSize(r11)     // Catch:{ all -> 0x0094 }
            if (r2 == r6) goto L_0x002f
            if (r2 != r8) goto L_0x00ad
        L_0x002f:
            r2 = r3
        L_0x0030:
            if (r5 == r6) goto L_0x0034
            if (r5 != r8) goto L_0x0035
        L_0x0034:
            r0 = r1
        L_0x0035:
            com.google.android.gms.internal.x r5 = r9.f2417fU     // Catch:{ all -> 0x0094 }
            int r5 = r5.widthPixels     // Catch:{ all -> 0x0094 }
            if (r5 > r2) goto L_0x0041
            com.google.android.gms.internal.x r2 = r9.f2417fU     // Catch:{ all -> 0x0094 }
            int r2 = r2.heightPixels     // Catch:{ all -> 0x0094 }
            if (r2 <= r0) goto L_0x0097
        L_0x0041:
            java.lang.StringBuilder r0 = new java.lang.StringBuilder     // Catch:{ all -> 0x0094 }
            r0.<init>()     // Catch:{ all -> 0x0094 }
            java.lang.String r2 = "Not enough space to show ad. Needs "
            java.lang.StringBuilder r0 = r0.append(r2)     // Catch:{ all -> 0x0094 }
            com.google.android.gms.internal.x r2 = r9.f2417fU     // Catch:{ all -> 0x0094 }
            int r2 = r2.widthPixels     // Catch:{ all -> 0x0094 }
            java.lang.StringBuilder r0 = r0.append(r2)     // Catch:{ all -> 0x0094 }
            java.lang.String r2 = "x"
            java.lang.StringBuilder r0 = r0.append(r2)     // Catch:{ all -> 0x0094 }
            com.google.android.gms.internal.x r2 = r9.f2417fU     // Catch:{ all -> 0x0094 }
            int r2 = r2.heightPixels     // Catch:{ all -> 0x0094 }
            java.lang.StringBuilder r0 = r0.append(r2)     // Catch:{ all -> 0x0094 }
            java.lang.String r2 = " pixels, but only has "
            java.lang.StringBuilder r0 = r0.append(r2)     // Catch:{ all -> 0x0094 }
            java.lang.StringBuilder r0 = r0.append(r3)     // Catch:{ all -> 0x0094 }
            java.lang.String r2 = "x"
            java.lang.StringBuilder r0 = r0.append(r2)     // Catch:{ all -> 0x0094 }
            java.lang.StringBuilder r0 = r0.append(r1)     // Catch:{ all -> 0x0094 }
            java.lang.String r1 = " pixels."
            java.lang.StringBuilder r0 = r0.append(r1)     // Catch:{ all -> 0x0094 }
            java.lang.String r0 = r0.toString()     // Catch:{ all -> 0x0094 }
            com.google.android.gms.internal.C1004ct.m2218v(r0)     // Catch:{ all -> 0x0094 }
            int r0 = r9.getVisibility()     // Catch:{ all -> 0x0094 }
            if (r0 == r7) goto L_0x008d
            r0 = 4
            r9.setVisibility(r0)     // Catch:{ all -> 0x0094 }
        L_0x008d:
            r0 = 0
            r1 = 0
            r9.setMeasuredDimension(r0, r1)     // Catch:{ all -> 0x0094 }
        L_0x0092:
            monitor-exit(r4)     // Catch:{ all -> 0x0094 }
            goto L_0x001a
        L_0x0094:
            r0 = move-exception
            monitor-exit(r4)     // Catch:{ all -> 0x0094 }
            throw r0
        L_0x0097:
            int r0 = r9.getVisibility()     // Catch:{ all -> 0x0094 }
            if (r0 == r7) goto L_0x00a1
            r0 = 0
            r9.setVisibility(r0)     // Catch:{ all -> 0x0094 }
        L_0x00a1:
            com.google.android.gms.internal.x r0 = r9.f2417fU     // Catch:{ all -> 0x0094 }
            int r0 = r0.widthPixels     // Catch:{ all -> 0x0094 }
            com.google.android.gms.internal.x r1 = r9.f2417fU     // Catch:{ all -> 0x0094 }
            int r1 = r1.heightPixels     // Catch:{ all -> 0x0094 }
            r9.setMeasuredDimension(r0, r1)     // Catch:{ all -> 0x0094 }
            goto L_0x0092
        L_0x00ad:
            r2 = r0
            goto L_0x0030
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.internal.C1007cw.onMeasure(int, int):void");
    }

    public boolean onTouchEvent(MotionEvent event) {
        if (this.f2420he != null) {
            this.f2420he.mo8161a(event);
        }
        return super.onTouchEvent(event);
    }

    public void setContext(Context context) {
        this.f2422iO.setBaseContext(context);
    }

    /* renamed from: y */
    public C1466x mo7250y() {
        C1466x xVar;
        synchronized (this.f2419fx) {
            xVar = this.f2417fU;
        }
        return xVar;
    }
}
