package com.chartboost.sdk.impl;

import android.content.Context;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.LinearLayout;
import com.chartboost.sdk.impl.h;
import com.google.ads.AdActivity;
import org.json.JSONObject;
/* loaded from: classes.dex */
public class i extends c implements h.b {
    private WebView b;

    public i(Context context) {
        super(context);
        this.b = new WebView(context);
        addView(this.b, new LinearLayout.LayoutParams(-1, -1));
        this.b.setBackgroundColor(0);
        this.b.setWebViewClient(new WebViewClient() { // from class: com.chartboost.sdk.impl.i.1
            @Override // android.webkit.WebViewClient
            public boolean shouldOverrideUrlLoading(WebView view, String url) {
                if (url == null) {
                    return false;
                }
                if (url.contains("chartboost") && url.contains("click") && i.this.a != null) {
                    i.this.a.onClick(i.this);
                }
                return true;
            }
        });
    }

    @Override // com.chartboost.sdk.impl.h.b
    public void a(JSONObject jSONObject, int i) {
        String optString = jSONObject.optString(AdActivity.HTML_PARAM);
        if (optString != null) {
            try {
                this.b.loadDataWithBaseURL("file:///android_res/", optString, "text/html", "UTF-8", null);
            } catch (Exception e) {
            }
        }
    }

    @Override // com.chartboost.sdk.impl.h.b
    public int a() {
        return com.chartboost.sdk.Libraries.d.a(100, getContext());
    }
}
