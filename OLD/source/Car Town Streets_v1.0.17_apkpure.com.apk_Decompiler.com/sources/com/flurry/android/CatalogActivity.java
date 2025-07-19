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
    private static volatile String a = "<html><body><table height='100%' width='100%' border='0'><tr><td style='vertical-align:middle;text-align:center'>No recommendations available<p><button type='input' onClick='activity.finish()'>Back</button></td></tr></table></body></html>";
    private WebView b;
    private w c;
    private List d = new ArrayList();
    /* access modifiers changed from: private */
    public u e;
    /* access modifiers changed from: private */
    public p f;

    /* access modifiers changed from: protected */
    public void onCreate(Bundle bundle) {
        Long valueOf;
        setTheme(16973839);
        super.onCreate(bundle);
        this.e = FlurryAgent.b();
        Intent intent = getIntent();
        if (!(intent.getExtras() == null || (valueOf = Long.valueOf(intent.getExtras().getLong(AdActivity.ORIENTATION_PARAM))) == null)) {
            this.f = this.e.b(valueOf.longValue());
        }
        ab abVar = new ab(this, this);
        abVar.setId(1);
        abVar.setBackgroundColor(-16777216);
        this.b = new WebView(this);
        this.b.setId(2);
        this.b.setScrollBarStyle(0);
        this.b.setBackgroundColor(-1);
        if (this.f != null) {
            this.b.setWebViewClient(new q(this));
        }
        this.b.getSettings().setJavaScriptEnabled(true);
        this.b.addJavascriptInterface(this, "activity");
        this.c = new w(this, this);
        this.c.setId(3);
        RelativeLayout relativeLayout = new RelativeLayout(this);
        relativeLayout.setLayoutParams(new ViewGroup.LayoutParams(-1, -1));
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-1, -2);
        layoutParams.addRule(10, abVar.getId());
        relativeLayout.addView(abVar, layoutParams);
        RelativeLayout.LayoutParams layoutParams2 = new RelativeLayout.LayoutParams(-1, -2);
        layoutParams2.addRule(3, abVar.getId());
        layoutParams2.addRule(2, this.c.getId());
        relativeLayout.addView(this.b, layoutParams2);
        RelativeLayout.LayoutParams layoutParams3 = new RelativeLayout.LayoutParams(-1, -2);
        layoutParams3.addRule(12, abVar.getId());
        relativeLayout.addView(this.c, layoutParams3);
        Bundle extras = getIntent().getExtras();
        String string = extras == null ? null : extras.getString("u");
        if (string == null) {
            this.b.loadDataWithBaseURL((String) null, a, "text/html", "utf-8", (String) null);
        } else {
            this.b.loadUrl(string);
        }
        setContentView(relativeLayout);
    }

    public void finish() {
        super.finish();
    }

    /* access modifiers changed from: protected */
    public void onDestroy() {
        this.e.h();
        super.onDestroy();
    }

    public void onClick(View view) {
        if (view instanceof y) {
            x xVar = new x();
            xVar.a = this.f;
            xVar.b = this.b.getUrl();
            xVar.c = new ArrayList(this.c.b());
            this.d.add(xVar);
            if (this.d.size() > 5) {
                this.d.remove(0);
            }
            x xVar2 = new x();
            y yVar = (y) view;
            String b2 = yVar.b(this.e.j());
            this.f = yVar.a();
            xVar2.a = yVar.a();
            xVar2.a.a(new f((byte) 4, this.e.k()));
            xVar2.b = b2;
            xVar2.c = this.c.a(view.getContext());
            a(xVar2);
        } else if (view.getId() == 10000) {
            finish();
        } else if (view.getId() == 10002) {
            this.c.a();
        } else if (this.d.isEmpty()) {
            finish();
        } else {
            a((x) this.d.remove(this.d.size() - 1));
        }
    }

    private void a(x xVar) {
        try {
            this.b.loadUrl(xVar.b);
            this.c.a(xVar.c);
        } catch (Exception e2) {
            ah.a("FlurryAgent", "Error loading url: " + xVar.b);
        }
    }
}
