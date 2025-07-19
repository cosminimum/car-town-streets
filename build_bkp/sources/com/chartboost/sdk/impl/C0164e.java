package com.chartboost.sdk.impl;

import android.content.Context;
import android.graphics.Typeface;
import android.os.Bundle;
import android.text.TextUtils;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.chartboost.sdk.Libraries.C0053d;
import com.chartboost.sdk.Libraries.C0054e;
import com.chartboost.sdk.impl.C0168h;
import com.google.android.gms.plus.PlusShare;
import org.json.JSONObject;

/* renamed from: com.chartboost.sdk.impl.e */
public class C0164e extends C0162c implements C0168h.C0178b {

    /* renamed from: c */
    private static int f241c = 50;

    /* renamed from: d */
    private static int f242d = 10;

    /* renamed from: b */
    public C0165f f243b;

    /* renamed from: e */
    private C0167g f244e;

    /* renamed from: f */
    private TextView f245f;

    public C0164e(Context context) {
        super(context);
        this.f244e = new C0167g(context);
        this.f243b = new C0165f(context);
        this.f245f = new TextView(context);
        this.f245f.setTypeface((Typeface) null, 1);
        this.f245f.setTextSize(2, 16.0f);
        this.f245f.setShadowLayer(1.0f, 1.0f, 1.0f, -1);
        this.f245f.setBackgroundColor(0);
        this.f245f.setTextColor(-16777216);
        this.f245f.setEllipsize(TextUtils.TruncateAt.END);
        setBackgroundColor(-3355444);
        setFocusable(false);
        addView(this.f244e);
        addView(this.f245f);
        addView(this.f243b);
    }

    /* renamed from: a */
    public void mo1439a(JSONObject jSONObject, int i) {
        JSONObject optJSONObject;
        this.f245f.setText(jSONObject.optString("name", "Unknown App"));
        String optString = jSONObject.optString("deep-text");
        if (optString == null || optString.equals("")) {
            this.f243b.setText(jSONObject.optString("text", "VIEW"));
        } else {
            this.f243b.setText(optString);
        }
        JSONObject optJSONObject2 = jSONObject.optJSONObject("assets");
        if (!(optJSONObject2 == null || (optJSONObject = optJSONObject2.optJSONObject("icon")) == null)) {
            Bundle bundle = new Bundle();
            bundle.putInt("index", i);
            C0054e.m94a().mo1209a(optJSONObject.optString(PlusShare.KEY_CALL_TO_ACTION_URL), optJSONObject.optString("checksum"), (C0054e.C0056b) null, this.f244e, bundle);
        }
        mo1440b();
    }

    /* access modifiers changed from: protected */
    /* renamed from: b */
    public void mo1440b() {
        int a = C0053d.m78a(f241c, getContext());
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(a, a);
        LinearLayout.LayoutParams layoutParams2 = new LinearLayout.LayoutParams(-2, -1);
        LinearLayout.LayoutParams layoutParams3 = new LinearLayout.LayoutParams(-2, -2);
        int a2 = C0053d.m78a(f242d, getContext());
        layoutParams.setMargins(a2, a2, a2, a2);
        layoutParams2.setMargins(a2, a2, a2, a2);
        layoutParams3.setMargins(a2, a2, a2, a2);
        layoutParams2.weight = 1.0f;
        this.f245f.setGravity(16);
        layoutParams3.gravity = 16;
        this.f244e.setLayoutParams(layoutParams);
        this.f244e.setScaleType(ImageView.ScaleType.FIT_CENTER);
        this.f245f.setLayoutParams(layoutParams2);
        this.f243b.setLayoutParams(layoutParams3);
    }

    /* renamed from: a */
    public int mo1438a() {
        return C0053d.m78a(f241c + (f242d * 2), getContext());
    }
}
