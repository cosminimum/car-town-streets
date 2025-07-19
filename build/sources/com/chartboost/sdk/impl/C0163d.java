package com.chartboost.sdk.impl;

import android.content.Context;
import android.os.Bundle;
import android.widget.LinearLayout;
import com.chartboost.sdk.C0038Chartboost;
import com.chartboost.sdk.Libraries.C0053d;
import com.chartboost.sdk.Libraries.C0054e;
import com.chartboost.sdk.impl.C0168h;
import com.getjar.sdk.utilities.Constants;
import com.google.android.gms.plus.PlusShare;
import org.json.JSONObject;

/* renamed from: com.chartboost.sdk.impl.d */
public class C0163d extends C0162c implements C0168h.C0178b {

    /* renamed from: b */
    private static int f238b = 100;

    /* renamed from: c */
    private static int f239c = 5;

    /* renamed from: d */
    private C0167g f240d;

    public C0163d(Context context) {
        super(context);
        this.f240d = new C0167g(context);
        addView(this.f240d, new LinearLayout.LayoutParams(-1, -1));
    }

    /* renamed from: a */
    public void mo1439a(JSONObject jSONObject, int i) {
        boolean isPortrait = C0038Chartboost.sharedChartboost().orientation().isPortrait();
        JSONObject optJSONObject = jSONObject.optJSONObject("assets");
        if (optJSONObject != null) {
            JSONObject optJSONObject2 = optJSONObject.optJSONObject(isPortrait ? Constants.PORTRAIT : Constants.LANDSCAPE);
            if (optJSONObject2 != null) {
                Bundle bundle = new Bundle();
                bundle.putInt("index", i);
                C0054e.m94a().mo1209a(optJSONObject2.optString(PlusShare.KEY_CALL_TO_ACTION_URL), optJSONObject2.optString("checksum"), (C0054e.C0056b) null, this.f240d, bundle);
            }
        }
    }

    /* renamed from: a */
    public int mo1438a() {
        return C0053d.m78a(f238b + (f239c * 2), getContext());
    }
}
