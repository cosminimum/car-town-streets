package com.chartboost.sdk;

import android.app.Activity;
import android.content.Context;
import android.os.Bundle;
import android.util.DisplayMetrics;
import android.view.MotionEvent;
import android.view.View;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import com.chartboost.sdk.Libraries.C0049a;
import com.chartboost.sdk.Libraries.C0054e;
import com.chartboost.sdk.impl.C0069a;
import com.chartboost.sdk.impl.C0204s;
import com.google.android.gms.plus.PlusShare;
import org.json.JSONObject;

/* renamed from: com.chartboost.sdk.b */
public abstract class C0064b {

    /* renamed from: a */
    public C0065a f88a = null;

    /* renamed from: b */
    public C0068c f89b = null;

    /* renamed from: c */
    public C0065a f90c = null;

    /* renamed from: d */
    public C0065a f91d = null;

    /* renamed from: e */
    protected int f92e = 0;

    /* renamed from: f */
    protected JSONObject f93f;

    /* renamed from: g */
    protected C0069a f94g;

    /* renamed from: h */
    private int f95h;

    /* renamed from: i */
    private int f96i;

    /* renamed from: j */
    private int f97j;

    /* renamed from: k */
    private C0066b f98k;

    /* renamed from: com.chartboost.sdk.b$a */
    public interface C0065a {
        /* renamed from: a */
        void mo1241a();
    }

    /* renamed from: com.chartboost.sdk.b$c */
    public interface C0068c {
        /* renamed from: a */
        void mo1248a(String str, JSONObject jSONObject);
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public abstract C0066b mo1230a(Context context);

    /* renamed from: com.chartboost.sdk.b$b */
    public abstract class C0066b extends RelativeLayout implements C0204s.C0207a {

        /* renamed from: a */
        protected boolean f99a = false;

        /* access modifiers changed from: protected */
        /* renamed from: a */
        public abstract void mo1243a(int i, int i2);

        public C0066b(Context context) {
            super(context);
            setFocusableInTouchMode(true);
            requestFocus();
            setOnTouchListener(new View.OnTouchListener() {
                public boolean onTouch(View v, MotionEvent event) {
                    return true;
                }
            });
        }

        /* access modifiers changed from: protected */
        public void onSizeChanged(int w, int h, int oldw, int oldh) {
            super.onSizeChanged(w, h, oldw, oldh);
            if (!this.f99a) {
                if (C0038Chartboost.sharedChartboost().getForcedOrientationDifference().isOdd()) {
                    m130b(h, w);
                } else {
                    m130b(w, h);
                }
            }
        }

        /* renamed from: b */
        private boolean m130b(int i, int i2) {
            try {
                mo1243a(i, i2);
                return true;
            } catch (Exception e) {
                return false;
            }
        }

        /* renamed from: a */
        public void mo1242a() {
            mo1244a((Activity) getContext());
        }

        /* renamed from: b */
        public void mo1245b() {
        }

        /* renamed from: a */
        public boolean mo1244a(Activity activity) {
            int i;
            int i2;
            try {
                i2 = getWidth();
                i = getHeight();
                if (i2 == 0 || i == 0) {
                    View findViewById = activity.getWindow().findViewById(16908290);
                    if (findViewById == null) {
                        findViewById = activity.getWindow().getDecorView();
                    }
                    i2 = findViewById.getWidth();
                    i = findViewById.getHeight();
                }
            } catch (Exception e) {
                i = 0;
                i2 = 0;
            }
            if (i2 == 0 || i == 0) {
                DisplayMetrics displayMetrics = new DisplayMetrics();
                activity.getWindowManager().getDefaultDisplay().getMetrics(displayMetrics);
                i2 = displayMetrics.widthPixels;
                i = displayMetrics.heightPixels;
            }
            if (!C0038Chartboost.sharedChartboost().getForcedOrientationDifference().isOdd()) {
                int i3 = i;
                i = i2;
                i2 = i3;
            }
            return m130b(i, i2);
        }
    }

    public C0064b(C0069a aVar) {
        this.f94g = aVar;
        this.f98k = null;
    }

    /* renamed from: a */
    public void mo1234a(JSONObject jSONObject) {
        this.f96i = 0;
        this.f97j = 0;
        this.f95h = 0;
        this.f93f = jSONObject.optJSONObject("assets");
        if (this.f93f == null && this.f91d != null) {
            this.f91d.mo1241a();
        }
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public void mo1232a(String str, C0054e.C0056b bVar) {
        mo1233a(str, bVar, false);
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public void mo1233a(String str, C0054e.C0056b bVar, boolean z) {
        Bundle bundle = new Bundle();
        bundle.putBoolean("paramNoMemoryCache", z);
        mo1235a(this.f93f, str, bVar, bundle);
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public void mo1235a(JSONObject jSONObject, String str, C0054e.C0056b bVar, Bundle bundle) {
        JSONObject optJSONObject = jSONObject.optJSONObject(str);
        if (optJSONObject != null) {
            this.f97j++;
            C0054e.m94a().mo1209a(optJSONObject.optString(PlusShare.KEY_CALL_TO_ACTION_URL), optJSONObject.optString("checksum"), bVar, (ImageView) null, bundle);
            return;
        }
        mo1231a((C0049a.C0050a) null);
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public void mo1231a(C0049a.C0050a aVar) {
        if (aVar != null) {
            this.f95h++;
        }
        this.f96i++;
        if (this.f96i == this.f92e && !mo1236a() && this.f91d != null) {
            this.f91d.mo1241a();
        }
    }

    /* renamed from: a */
    public boolean mo1236a() {
        if (this.f95h != this.f97j) {
            return false;
        }
        if (this.f90c != null) {
            this.f90c.mo1241a();
        }
        return true;
    }

    /* renamed from: b */
    public boolean mo1237b() {
        if (this.f94g.f104c != C0069a.C0075b.CBImpressionStateWaitingForDisplay) {
            return false;
        }
        C0038Chartboost.sharedChartboost().mo1122a(this.f94g);
        Activity b = C0038Chartboost.sharedChartboost().mo1124b();
        if (b == null) {
            this.f98k = null;
            return false;
        }
        this.f98k = mo1230a((Context) b);
        if (this.f98k.mo1244a(b)) {
            return true;
        }
        this.f98k = null;
        return false;
    }

    /* renamed from: c */
    public void mo1238c() {
        mo1240e();
        this.f90c = null;
        this.f91d = null;
        this.f89b = null;
        this.f88a = null;
        this.f93f = null;
    }

    /* renamed from: d */
    public C0066b mo1239d() {
        return this.f98k;
    }

    /* renamed from: e */
    public void mo1240e() {
        if (this.f98k != null) {
            this.f98k.mo1245b();
        }
        this.f98k = null;
    }
}
