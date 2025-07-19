package com.chartboost.sdk.impl;

import android.content.Context;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.LinearLayout;
import com.chartboost.sdk.Libraries.C0053d;
import com.chartboost.sdk.impl.C0168h;
import com.google.ads.AdActivity;
import org.json.JSONObject;

/* renamed from: com.chartboost.sdk.impl.i */
public class C0179i extends C0162c implements C0168h.C0178b {

    /* renamed from: b */
    private WebView f288b;

    public C0179i(Context context) {
        super(context);
        this.f288b = new WebView(context);
        addView(this.f288b, new LinearLayout.LayoutParams(-1, -1));
        this.f288b.setBackgroundColor(0);
        this.f288b.setWebViewClient(new WebViewClient() {
            public boolean shouldOverrideUrlLoading(WebView view, String url) {
                if (url == null) {
                    return false;
                }
                if (url.contains("chartboost") && url.contains("click") && C0179i.this.f233a != null) {
                    C0179i.this.f233a.onClick(C0179i.this);
                }
                return true;
            }
        });
    }

    /* renamed from: a */
    public void mo1439a(JSONObject jSONObject, int i) {
        String optString = jSONObject.optString(AdActivity.HTML_PARAM);
        if (optString != null) {
            try {
                this.f288b.loadDataWithBaseURL("file:///android_res/", optString, "text/html", "UTF-8", (String) null);
            } catch (Exception e) {
            }
        }
    }

    /* renamed from: a */
    public int mo1438a() {
        return C0053d.m78a(100, getContext());
    }
}
