package com.google.ads.internal;

import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.view.View;
import android.webkit.DownloadListener;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import com.google.ads.AdActivity;
import com.google.ads.AdSize;
import com.google.ads.C0491m;
import com.google.ads.util.AdUtil;
import com.google.ads.util.C0508b;
import com.google.ads.util.C0518g;
import com.google.ads.util.C0528h;
import java.lang.ref.WeakReference;

public class AdWebView extends WebView {

    /* renamed from: a */
    private WeakReference<AdActivity> f835a = null;

    /* renamed from: b */
    private AdSize f836b;

    /* renamed from: c */
    private boolean f837c = false;

    /* renamed from: d */
    private boolean f838d = false;

    /* renamed from: e */
    private boolean f839e = false;

    public AdWebView(C0491m slotState, AdSize adSize) {
        super(slotState.f985f.mo3874a());
        this.f836b = adSize;
        setBackgroundColor(0);
        AdUtil.m991a((WebView) this);
        WebSettings settings = getSettings();
        settings.setSupportMultipleWindows(false);
        settings.setJavaScriptEnabled(true);
        settings.setSavePassword(false);
        setDownloadListener(new DownloadListener() {
            public void onDownloadStart(String url, String userAgent, String contentDisposition, String mimeType, long size) {
                try {
                    Intent intent = new Intent("android.intent.action.VIEW");
                    intent.setDataAndType(Uri.parse(url), mimeType);
                    AdActivity d = AdWebView.this.mo3627d();
                    if (d != null && AdUtil.m995a(intent, (Context) d)) {
                        d.startActivity(intent);
                    }
                } catch (ActivityNotFoundException e) {
                    C0508b.m1026a("Couldn't find an Activity to view url/mimetype: " + url + " / " + mimeType);
                } catch (Throwable th) {
                    C0508b.m1031b("Unknown error trying to start activity to view URL: " + url, th);
                }
            }
        });
        if (AdUtil.f1033a >= 11) {
            C0518g.m1053a(settings, slotState);
        }
        setScrollBarStyle(33554432);
        if (AdUtil.f1033a >= 14) {
            setWebChromeClient(new C0528h.C0529a(slotState));
        } else if (AdUtil.f1033a >= 11) {
            setWebChromeClient(new C0518g.C0520a(slotState));
        }
    }

    /* renamed from: a */
    public void mo3624a() {
        AdActivity d = mo3627d();
        if (d != null) {
            d.finish();
        }
    }

    /* renamed from: b */
    public void mo3625b() {
        if (AdUtil.f1033a >= 11) {
            C0518g.m1051a((View) this);
        }
        this.f838d = true;
    }

    /* renamed from: c */
    public void mo3626c() {
        if (this.f838d && AdUtil.f1033a >= 11) {
            C0518g.m1054b(this);
        }
        this.f838d = false;
    }

    /* renamed from: d */
    public AdActivity mo3627d() {
        if (this.f835a != null) {
            return (AdActivity) this.f835a.get();
        }
        return null;
    }

    /* renamed from: e */
    public boolean mo3629e() {
        return this.f839e;
    }

    /* renamed from: f */
    public boolean mo3630f() {
        return this.f838d;
    }

    public void setAdActivity(AdActivity adActivity) {
        this.f835a = new WeakReference<>(adActivity);
    }

    public void loadDataWithBaseURL(String baseUrl, String data, String mimeType, String encoding, String historyUrl) {
        try {
            super.loadDataWithBaseURL(baseUrl, data, mimeType, encoding, historyUrl);
        } catch (Throwable th) {
            C0508b.m1031b("An error occurred while loading data in AdWebView:", th);
        }
    }

    public void loadUrl(String url) {
        try {
            super.loadUrl(url);
        } catch (Throwable th) {
            C0508b.m1031b("An error occurred while loading a URL in AdWebView:", th);
        }
    }

    public void stopLoading() {
        try {
            super.stopLoading();
        } catch (Throwable th) {
            C0508b.m1035d("An error occurred while stopping loading in AdWebView:", th);
        }
    }

    public void destroy() {
        try {
            super.destroy();
            setWebViewClient(new WebViewClient());
        } catch (Throwable th) {
            C0508b.m1031b("An error occurred while destroying an AdWebView:", th);
        }
    }

    public synchronized void setAdSize(AdSize adSize) {
        this.f836b = adSize;
        requestLayout();
    }

    /* access modifiers changed from: protected */
    public synchronized void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        int i;
        int i2 = Integer.MAX_VALUE;
        synchronized (this) {
            if (isInEditMode()) {
                super.onMeasure(widthMeasureSpec, heightMeasureSpec);
            } else if (this.f836b == null || this.f837c) {
                super.onMeasure(widthMeasureSpec, heightMeasureSpec);
            } else {
                int mode = View.MeasureSpec.getMode(widthMeasureSpec);
                int size = View.MeasureSpec.getSize(widthMeasureSpec);
                int mode2 = View.MeasureSpec.getMode(heightMeasureSpec);
                int size2 = View.MeasureSpec.getSize(heightMeasureSpec);
                float f = getContext().getResources().getDisplayMetrics().density;
                int width = (int) (((float) this.f836b.getWidth()) * f);
                int height = (int) (((float) this.f836b.getHeight()) * f);
                if (mode == Integer.MIN_VALUE || mode == 1073741824) {
                    i = size;
                } else {
                    i = Integer.MAX_VALUE;
                }
                if (mode2 == Integer.MIN_VALUE || mode2 == 1073741824) {
                    i2 = size2;
                }
                if (((float) width) - (f * 6.0f) > ((float) i) || height > i2) {
                    C0508b.m1036e("Not enough space to show ad! Wants: <" + width + ", " + height + ">, Has: <" + size + ", " + size2 + ">");
                    setVisibility(8);
                    setMeasuredDimension(size, size2);
                } else {
                    setMeasuredDimension(width, height);
                }
            }
        }
    }

    public void setCustomClose(boolean useCustomClose) {
        AdActivity adActivity;
        this.f839e = useCustomClose;
        if (this.f835a != null && (adActivity = (AdActivity) this.f835a.get()) != null) {
            adActivity.setCustomClose(useCustomClose);
        }
    }

    public void setIsExpandedMraid(boolean isCurrentlyExpandedMraid) {
        this.f837c = isCurrentlyExpandedMraid;
    }
}
