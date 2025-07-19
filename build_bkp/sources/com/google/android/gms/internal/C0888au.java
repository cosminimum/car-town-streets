package com.google.android.gms.internal;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* renamed from: com.google.android.gms.internal.au */
public final class C0888au {

    /* renamed from: fI */
    public final List<C0887at> f1977fI;

    /* renamed from: fJ */
    public final long f1978fJ;

    /* renamed from: fK */
    public final List<String> f1979fK;

    /* renamed from: fL */
    public final List<String> f1980fL;

    /* renamed from: fM */
    public final List<String> f1981fM;

    /* renamed from: fN */
    public final String f1982fN;

    /* renamed from: fO */
    public final long f1983fO;

    public C0888au(String str) throws JSONException {
        JSONObject jSONObject = new JSONObject(str);
        if (C1004ct.m2213n(2)) {
            C1004ct.m2217u("Mediation Response JSON: " + jSONObject.toString(2));
        }
        JSONArray jSONArray = jSONObject.getJSONArray("ad_networks");
        ArrayList arrayList = new ArrayList(jSONArray.length());
        for (int i = 0; i < jSONArray.length(); i++) {
            arrayList.add(new C0887at(jSONArray.getJSONObject(i)));
        }
        this.f1977fI = Collections.unmodifiableList(arrayList);
        this.f1982fN = jSONObject.getString("qdata");
        JSONObject optJSONObject = jSONObject.optJSONObject("settings");
        if (optJSONObject != null) {
            this.f1978fJ = optJSONObject.optLong("ad_network_timeout_millis", -1);
            this.f1979fK = C0895az.m1985a(optJSONObject, "click_urls");
            this.f1980fL = C0895az.m1985a(optJSONObject, "imp_urls");
            this.f1981fM = C0895az.m1985a(optJSONObject, "nofill_urls");
            long optLong = optJSONObject.optLong("refresh", -1);
            this.f1983fO = optLong > 0 ? 1000 * optLong : -1;
            return;
        }
        this.f1978fJ = -1;
        this.f1979fK = null;
        this.f1980fL = null;
        this.f1981fM = null;
        this.f1983fO = -1;
    }
}
