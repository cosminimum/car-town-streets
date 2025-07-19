package com.chartboost.sdk.impl;

import android.content.Context;
import android.view.KeyEvent;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.RelativeLayout;
import com.chartboost.sdk.C0064b;
import com.google.ads.AdActivity;
import org.json.JSONObject;

/* renamed from: com.chartboost.sdk.impl.v */
public class C0211v extends C0064b {

    /* renamed from: h */
    private String f383h = null;

    /* renamed from: com.chartboost.sdk.impl.v$a */
    public class C0212a extends C0064b.C0066b {

        /* renamed from: c */
        public WebView f384c;

        public C0212a(Context context, String str) {
            super(context);
            setFocusable(false);
            this.f384c = new C0213b(context);
            this.f384c.setWebViewClient(new C0214c(C0211v.this));
            addView(this.f384c);
            this.f384c.loadDataWithBaseURL("file:///android_asset/", str, "text/html", "utf-8", (String) null);
        }

        /* access modifiers changed from: protected */
        /* renamed from: a */
        public void mo1243a(int i, int i2) {
        }
    }

    public C0211v(C0069a aVar) {
        super(aVar);
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public C0064b.C0066b mo1230a(Context context) {
        return new C0212a(context, this.f383h);
    }

    /* renamed from: a */
    public void mo1234a(JSONObject jSONObject) {
        String optString = jSONObject.optString(AdActivity.HTML_PARAM);
        if (optString != null) {
            this.f383h = optString;
            mo1236a();
        }
    }

    /* renamed from: com.chartboost.sdk.impl.v$b */
    private class C0213b extends WebView {
        public C0213b(Context context) {
            super(context);
            setLayoutParams(new RelativeLayout.LayoutParams(-1, -1));
            setBackgroundColor(0);
            getSettings().setJavaScriptEnabled(true);
        }

        public boolean onKeyDown(int keyCode, KeyEvent event) {
            if ((keyCode == 4 || keyCode == 3) && C0211v.this.f88a != null) {
                C0211v.this.f88a.mo1241a();
            }
            return super.onKeyDown(keyCode, event);
        }
    }

    /* renamed from: com.chartboost.sdk.impl.v$c */
    private class C0214c extends WebViewClient {

        /* renamed from: b */
        private C0211v f388b;

        public C0214c(C0211v vVar) {
            this.f388b = vVar;
        }

        public void onPageFinished(WebView view, String url) {
            super.onPageFinished(view, url);
            if (this.f388b != null && this.f388b.f90c != null) {
                this.f388b.f90c.mo1241a();
            }
        }

        public void onReceivedError(WebView view, int errorCode, String description, String failingUrl) {
            if (this.f388b.f91d != null) {
                this.f388b.f91d.mo1241a();
            }
        }

        /* JADX WARNING: Removed duplicated region for block: B:36:0x00a3  */
        /* Code decompiled incorrectly, please refer to instructions dump. */
        public boolean shouldOverrideUrlLoading(android.webkit.WebView r8, java.lang.String r9) {
            /*
                r7 = this;
                r2 = 0
                r5 = 3
                r6 = 4
                r0 = 0
                java.lang.String r1 = ""
                java.net.URI r1 = new java.net.URI     // Catch:{ Exception -> 0x0036 }
                r1.<init>(r9)     // Catch:{ Exception -> 0x0036 }
                java.lang.String r1 = r1.getScheme()     // Catch:{ Exception -> 0x0036 }
                java.lang.String r3 = "chartboost"
                boolean r1 = r1.equals(r3)
                if (r1 == 0) goto L_0x005d
                java.lang.String r1 = "/"
                java.lang.String[] r1 = r9.split(r1)
                int r3 = r1.length
                java.lang.Integer r3 = java.lang.Integer.valueOf(r3)
                int r4 = r3.intValue()
                if (r4 >= r5) goto L_0x0045
                com.chartboost.sdk.impl.v r1 = r7.f388b
                com.chartboost.sdk.b$a r1 = r1.f88a
                if (r1 == 0) goto L_0x0035
                com.chartboost.sdk.impl.v r1 = r7.f388b
                com.chartboost.sdk.b$a r1 = r1.f88a
                r1.mo1241a()
            L_0x0035:
                return r0
            L_0x0036:
                r1 = move-exception
                com.chartboost.sdk.impl.v r1 = r7.f388b
                com.chartboost.sdk.b$a r1 = r1.f88a
                if (r1 == 0) goto L_0x0035
                com.chartboost.sdk.impl.v r1 = r7.f388b
                com.chartboost.sdk.b$a r1 = r1.f88a
                r1.mo1241a()
                goto L_0x0035
            L_0x0045:
                r4 = 2
                r4 = r1[r4]
                java.lang.String r5 = "close"
                boolean r5 = r4.equals(r5)
                if (r5 == 0) goto L_0x005f
                com.chartboost.sdk.impl.v r0 = r7.f388b
                com.chartboost.sdk.b$a r0 = r0.f88a
                if (r0 == 0) goto L_0x005d
                com.chartboost.sdk.impl.v r0 = r7.f388b
                com.chartboost.sdk.b$a r0 = r0.f88a
                r0.mo1241a()
            L_0x005d:
                r0 = 1
                goto L_0x0035
            L_0x005f:
                java.lang.String r5 = "link"
                boolean r4 = r4.equals(r5)
                if (r4 == 0) goto L_0x005d
                int r4 = r3.intValue()
                if (r4 >= r6) goto L_0x007b
                com.chartboost.sdk.impl.v r1 = r7.f388b
                com.chartboost.sdk.b$a r1 = r1.f88a
                if (r1 == 0) goto L_0x0035
                com.chartboost.sdk.impl.v r1 = r7.f388b
                com.chartboost.sdk.b$a r1 = r1.f88a
                r1.mo1241a()
                goto L_0x0035
            L_0x007b:
                r0 = 3
                r0 = r1[r0]     // Catch:{ Exception -> 0x00ab }
                java.lang.String r4 = "UTF-8"
                java.lang.String r0 = java.net.URLDecoder.decode(r0, r4)     // Catch:{ Exception -> 0x00ab }
                int r3 = r3.intValue()     // Catch:{ Exception -> 0x00b3 }
                if (r3 >= r6) goto L_0x00b1
                org.json.JSONTokener r3 = new org.json.JSONTokener     // Catch:{ Exception -> 0x00b3 }
                r4 = 4
                r1 = r1[r4]     // Catch:{ Exception -> 0x00b3 }
                java.lang.String r4 = "UTF-8"
                java.lang.String r1 = java.net.URLDecoder.decode(r1, r4)     // Catch:{ Exception -> 0x00b3 }
                r3.<init>(r1)     // Catch:{ Exception -> 0x00b3 }
                org.json.JSONObject r1 = new org.json.JSONObject     // Catch:{ Exception -> 0x00b3 }
                r1.<init>(r3)     // Catch:{ Exception -> 0x00b3 }
            L_0x009d:
                com.chartboost.sdk.impl.v r2 = r7.f388b
                com.chartboost.sdk.b$c r2 = r2.f89b
                if (r2 == 0) goto L_0x005d
                com.chartboost.sdk.impl.v r2 = r7.f388b
                com.chartboost.sdk.b$c r2 = r2.f89b
                r2.mo1248a(r0, r1)
                goto L_0x005d
            L_0x00ab:
                r0 = move-exception
                r1 = r0
                r0 = r2
            L_0x00ae:
                r1.printStackTrace()
            L_0x00b1:
                r1 = r2
                goto L_0x009d
            L_0x00b3:
                r1 = move-exception
                goto L_0x00ae
            */
            throw new UnsupportedOperationException("Method not decompiled: com.chartboost.sdk.impl.C0211v.C0214c.shouldOverrideUrlLoading(android.webkit.WebView, java.lang.String):boolean");
        }
    }
}
