package com.flurry.android;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.view.ViewGroup;
import android.webkit.WebView;
import android.widget.RelativeLayout;
import com.google.ads.AdActivity;
import java.util.ArrayList;
import java.util.List;

public class CatalogActivity extends Activity implements View.OnClickListener {

    /* renamed from: a */
    private static volatile String f412a = "<html><body><table height='100%' width='100%' border='0'><tr><td style='vertical-align:middle;text-align:center'>No recommendations available<p><button type='input' onClick='activity.finish()'>Back</button></td></tr></table></body></html>";

    /* renamed from: b */
    private WebView f413b;

    /* renamed from: c */
    private C0325w f414c;

    /* renamed from: d */
    private List f415d = new ArrayList();
    /* access modifiers changed from: private */

    /* renamed from: e */
    public C0323u f416e;
    /* access modifiers changed from: private */

    /* renamed from: f */
    public C0318p f417f;

    /* access modifiers changed from: protected */
    public void onCreate(Bundle bundle) {
        Long valueOf;
        setTheme(16973839);
        super.onCreate(bundle);
        this.f416e = FlurryAgent.m488b();
        Intent intent = getIntent();
        if (!(intent.getExtras() == null || (valueOf = Long.valueOf(intent.getExtras().getLong(AdActivity.ORIENTATION_PARAM))) == null)) {
            this.f417f = this.f416e.mo2442b(valueOf.longValue());
        }
        C0293ab abVar = new C0293ab(this, this);
        abVar.setId(1);
        abVar.setBackgroundColor(-16777216);
        this.f413b = new WebView(this);
        this.f413b.setId(2);
        this.f413b.setScrollBarStyle(0);
        this.f413b.setBackgroundColor(-1);
        if (this.f417f != null) {
            this.f413b.setWebViewClient(new C0319q(this));
        }
        this.f413b.getSettings().setJavaScriptEnabled(true);
        this.f413b.addJavascriptInterface(this, "activity");
        this.f414c = new C0325w(this, this);
        this.f414c.setId(3);
        RelativeLayout relativeLayout = new RelativeLayout(this);
        relativeLayout.setLayoutParams(new ViewGroup.LayoutParams(-1, -1));
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-1, -2);
        layoutParams.addRule(10, abVar.getId());
        relativeLayout.addView(abVar, layoutParams);
        RelativeLayout.LayoutParams layoutParams2 = new RelativeLayout.LayoutParams(-1, -2);
        layoutParams2.addRule(3, abVar.getId());
        layoutParams2.addRule(2, this.f414c.getId());
        relativeLayout.addView(this.f413b, layoutParams2);
        RelativeLayout.LayoutParams layoutParams3 = new RelativeLayout.LayoutParams(-1, -2);
        layoutParams3.addRule(12, abVar.getId());
        relativeLayout.addView(this.f414c, layoutParams3);
        Bundle extras = getIntent().getExtras();
        String string = extras == null ? null : extras.getString("u");
        if (string == null) {
            this.f413b.loadDataWithBaseURL((String) null, f412a, "text/html", "utf-8", (String) null);
        } else {
            this.f413b.loadUrl(string);
        }
        setContentView(relativeLayout);
    }

    public void finish() {
        super.finish();
    }

    /* access modifiers changed from: protected */
    public void onDestroy() {
        this.f416e.mo2450h();
        super.onDestroy();
    }

    public void onClick(View view) {
        if (view instanceof C0327y) {
            C0326x xVar = new C0326x();
            xVar.f655a = this.f417f;
            xVar.f656b = this.f413b.getUrl();
            xVar.f657c = new ArrayList(this.f414c.mo2464b());
            this.f415d.add(xVar);
            if (this.f415d.size() > 5) {
                this.f415d.remove(0);
            }
            C0326x xVar2 = new C0326x();
            C0327y yVar = (C0327y) view;
            String b = yVar.mo2467b(this.f416e.mo2452j());
            this.f417f = yVar.mo2465a();
            xVar2.f655a = yVar.mo2465a();
            xVar2.f655a.mo2419a(new C0308f((byte) 4, this.f416e.mo2453k()));
            xVar2.f656b = b;
            xVar2.f657c = this.f414c.mo2461a(view.getContext());
            m463a(xVar2);
        } else if (view.getId() == 10000) {
            finish();
        } else if (view.getId() == 10002) {
            this.f414c.mo2462a();
        } else if (this.f415d.isEmpty()) {
            finish();
        } else {
            m463a((C0326x) this.f415d.remove(this.f415d.size() - 1));
        }
    }

    /* renamed from: a */
    private void m463a(C0326x xVar) {
        try {
            this.f413b.loadUrl(xVar.f656b);
            this.f414c.mo2463a(xVar.f657c);
        } catch (Exception e) {
            C0299ah.m532a("FlurryAgent", "Error loading url: " + xVar.f656b);
        }
    }
}
