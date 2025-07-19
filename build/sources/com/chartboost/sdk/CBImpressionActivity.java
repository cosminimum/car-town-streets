package com.chartboost.sdk;

import android.app.Activity;
import android.os.Bundle;
import android.widget.RelativeLayout;

public final class CBImpressionActivity extends Activity {
    public static final String PARAM_FULLSCREEN = "paramFullscreen";

    /* renamed from: a */
    protected C0038Chartboost f3a;

    /* access modifiers changed from: protected */
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        requestWindowFeature(1);
        if (getIntent().getBooleanExtra(PARAM_FULLSCREEN, false)) {
            getWindow().addFlags(1024);
        }
        getWindow().setWindowAnimations(0);
        setContentView(new RelativeLayout(this));
        this.f3a = C0038Chartboost.sharedChartboost();
        this.f3a.mo1120a(this);
    }

    /* access modifiers changed from: protected */
    public void onStart() {
        super.onStart();
        this.f3a.mo1119a((Activity) this);
    }

    /* access modifiers changed from: protected */
    public void onStop() {
        super.onStop();
        this.f3a.mo1125b((Activity) this);
    }

    /* access modifiers changed from: protected */
    public void onDestroy() {
        super.onDestroy();
    }

    public void onBackPressed() {
        if (!this.f3a.mo1123a()) {
            super.onBackPressed();
        }
    }
}
