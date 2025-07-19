package com.google.android.gms.internal;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.content.MutableContextWrapper;
import android.net.Uri;
import android.os.Build;
import android.view.MotionEvent;
import android.view.View;
import android.webkit.DownloadListener;
import android.webkit.WebSettings;
import android.webkit.WebView;
import com.getjar.sdk.utilities.Constants;
import com.google.android.gms.drive.DriveFile;
import java.util.HashMap;
import java.util.Map;
import org.json.JSONException;
/* loaded from: classes.dex */
public final class cw extends WebView implements DownloadListener {
    private x fU;
    private final cu fV;
    private final Object fx = new Object();
    private final h he;
    private final cx iN;
    private final a iO;
    private bk iP;
    private boolean iQ;
    private boolean iR;

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public static class a extends MutableContextWrapper {
        private Activity iS;
        private Context iT;

        public a(Context context) {
            super(context);
            setBaseContext(context);
        }

        @Override // android.content.MutableContextWrapper
        public void setBaseContext(Context base) {
            this.iT = base.getApplicationContext();
            this.iS = base instanceof Activity ? (Activity) base : null;
            super.setBaseContext(this.iT);
        }

        @Override // android.content.ContextWrapper, android.content.Context
        public void startActivity(Intent intent) {
            if (this.iS != null) {
                this.iS.startActivity(intent);
                return;
            }
            intent.setFlags(DriveFile.MODE_READ_ONLY);
            this.iT.startActivity(intent);
        }
    }

    private cw(a aVar, x xVar, boolean z, boolean z2, h hVar, cu cuVar) {
        super(aVar);
        this.iO = aVar;
        this.fU = xVar;
        this.iQ = z;
        this.he = hVar;
        this.fV = cuVar;
        setBackgroundColor(0);
        WebSettings settings = getSettings();
        settings.setJavaScriptEnabled(true);
        settings.setSavePassword(false);
        settings.setSupportMultipleWindows(true);
        settings.setJavaScriptCanOpenWindowsAutomatically(true);
        co.a(aVar, cuVar.iJ, settings);
        if (Build.VERSION.SDK_INT >= 17) {
            cq.a(getContext(), settings);
        } else if (Build.VERSION.SDK_INT >= 11) {
            cp.a(getContext(), settings);
        }
        setDownloadListener(this);
        if (Build.VERSION.SDK_INT >= 11) {
            this.iN = new cz(this, z2);
        } else {
            this.iN = new cx(this, z2);
        }
        setWebViewClient(this.iN);
        if (Build.VERSION.SDK_INT >= 14) {
            setWebChromeClient(new da(this));
        } else if (Build.VERSION.SDK_INT >= 11) {
            setWebChromeClient(new cy(this));
        }
        aG();
    }

    public static cw a(Context context, x xVar, boolean z, boolean z2, h hVar, cu cuVar) {
        return new cw(new a(context), xVar, z, z2, hVar, cuVar);
    }

    private void aG() {
        synchronized (this.fx) {
            if (this.iQ || this.fU.eG) {
                if (Build.VERSION.SDK_INT < 14) {
                    ct.r("Disabling hardware acceleration on an overlay.");
                    aH();
                } else {
                    ct.r("Enabling hardware acceleration on an overlay.");
                    aI();
                }
            } else if (Build.VERSION.SDK_INT < 18) {
                ct.r("Disabling hardware acceleration on an AdView.");
                aH();
            } else {
                ct.r("Enabling hardware acceleration on an AdView.");
                aI();
            }
        }
    }

    private void aH() {
        synchronized (this.fx) {
            if (!this.iR && Build.VERSION.SDK_INT >= 11) {
                cp.c(this);
            }
            this.iR = true;
        }
    }

    private void aI() {
        synchronized (this.fx) {
            if (this.iR && Build.VERSION.SDK_INT >= 11) {
                cp.d(this);
            }
            this.iR = false;
        }
    }

    public void a(Context context, x xVar) {
        synchronized (this.fx) {
            this.iO.setBaseContext(context);
            this.iP = null;
            this.fU = xVar;
            this.iQ = false;
            co.b(this);
            loadUrl("about:blank");
            this.iN.reset();
        }
    }

    public void a(bk bkVar) {
        synchronized (this.fx) {
            this.iP = bkVar;
        }
    }

    public void a(x xVar) {
        synchronized (this.fx) {
            this.fU = xVar;
            requestLayout();
        }
    }

    public void a(String str, Map<String, ?> map) {
        StringBuilder sb = new StringBuilder();
        sb.append("javascript:AFMA_ReceiveMessage('");
        sb.append(str);
        sb.append("'");
        if (map != null) {
            try {
                String jSONObject = co.m(map).toString();
                sb.append(",");
                sb.append(jSONObject);
            } catch (JSONException e) {
                ct.v("Could not convert AFMA event parameters to JSON.");
                return;
            }
        }
        sb.append(");");
        ct.u("Dispatching AFMA event: " + ((Object) sb));
        loadUrl(sb.toString());
    }

    public void aA() {
        HashMap hashMap = new HashMap(1);
        hashMap.put("version", this.fV.iJ);
        a("onshow", hashMap);
    }

    public bk aB() {
        bk bkVar;
        synchronized (this.fx) {
            bkVar = this.iP;
        }
        return bkVar;
    }

    public cx aC() {
        return this.iN;
    }

    public h aD() {
        return this.he;
    }

    public cu aE() {
        return this.fV;
    }

    public boolean aF() {
        boolean z;
        synchronized (this.fx) {
            z = this.iQ;
        }
        return z;
    }

    public void az() {
        HashMap hashMap = new HashMap(1);
        hashMap.put("version", this.fV.iJ);
        a("onhide", hashMap);
    }

    public void l(boolean z) {
        synchronized (this.fx) {
            this.iQ = z;
            aG();
        }
    }

    @Override // android.webkit.DownloadListener
    public void onDownloadStart(String url, String userAgent, String contentDisposition, String mimeType, long size) {
        try {
            Intent intent = new Intent("android.intent.action.VIEW");
            intent.setDataAndType(Uri.parse(url), mimeType);
            getContext().startActivity(intent);
        } catch (ActivityNotFoundException e) {
            ct.r("Couldn't find an Activity to view url/mimetype: " + url + " / " + mimeType);
        }
    }

    @Override // android.webkit.WebView, android.widget.AbsoluteLayout, android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        int i = Integer.MAX_VALUE;
        synchronized (this.fx) {
            if (isInEditMode() || this.iQ) {
                super.onMeasure(widthMeasureSpec, heightMeasureSpec);
                return;
            }
            int mode = View.MeasureSpec.getMode(widthMeasureSpec);
            int size = View.MeasureSpec.getSize(widthMeasureSpec);
            int mode2 = View.MeasureSpec.getMode(heightMeasureSpec);
            int size2 = View.MeasureSpec.getSize(heightMeasureSpec);
            int i2 = (mode == Integer.MIN_VALUE || mode == 1073741824) ? size : Integer.MAX_VALUE;
            if (mode2 == Integer.MIN_VALUE || mode2 == 1073741824) {
                i = size2;
            }
            if (this.fU.widthPixels > i2 || this.fU.heightPixels > i) {
                ct.v("Not enough space to show ad. Needs " + this.fU.widthPixels + Constants.X + this.fU.heightPixels + " pixels, but only has " + size + Constants.X + size2 + " pixels.");
                if (getVisibility() != 8) {
                    setVisibility(4);
                }
                setMeasuredDimension(0, 0);
            } else {
                if (getVisibility() != 8) {
                    setVisibility(0);
                }
                setMeasuredDimension(this.fU.widthPixels, this.fU.heightPixels);
            }
        }
    }

    @Override // android.webkit.WebView, android.view.View
    public boolean onTouchEvent(MotionEvent event) {
        if (this.he != null) {
            this.he.a(event);
        }
        return super.onTouchEvent(event);
    }

    public void setContext(Context context) {
        this.iO.setBaseContext(context);
    }

    public x y() {
        x xVar;
        synchronized (this.fx) {
            xVar = this.fU;
        }
        return xVar;
    }
}
