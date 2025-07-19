package com.google.android.gms.internal;

import com.getjar.sdk.utilities.Constants;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* renamed from: com.google.android.gms.internal.at */
public final class C0887at {
    public final String adJson;

    /* renamed from: fD */
    public final String f1972fD;

    /* renamed from: fE */
    public final List<String> f1973fE;

    /* renamed from: fF */
    public final String f1974fF;

    /* renamed from: fG */
    public final List<String> f1975fG;

    /* renamed from: fH */
    public final String f1976fH;

    public C0887at(JSONObject jSONObject) throws JSONException {
        String str = null;
        this.f1972fD = jSONObject.getString(Constants.APP_ID);
        JSONArray jSONArray = jSONObject.getJSONArray("adapters");
        ArrayList arrayList = new ArrayList(jSONArray.length());
        for (int i = 0; i < jSONArray.length(); i++) {
            arrayList.add(jSONArray.getString(i));
        }
        this.f1973fE = Collections.unmodifiableList(arrayList);
        this.f1974fF = jSONObject.optString("allocation_id", (String) null);
        this.f1975fG = C0895az.m1985a(jSONObject, "imp_urls");
        JSONObject optJSONObject = jSONObject.optJSONObject("ad");
        this.adJson = optJSONObject != null ? optJSONObject.toString() : null;
        JSONObject optJSONObject2 = jSONObject.optJSONObject("data");
        this.f1976fH = optJSONObject2 != null ? optJSONObject2.toString() : str;
    }
}
