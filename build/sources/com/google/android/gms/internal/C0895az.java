package com.google.android.gms.internal;

import android.content.Context;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* renamed from: com.google.android.gms.internal.az */
public final class C0895az {
    /* renamed from: a */
    public static List<String> m1985a(JSONObject jSONObject, String str) throws JSONException {
        JSONArray optJSONArray = jSONObject.optJSONArray(str);
        if (optJSONArray == null) {
            return null;
        }
        ArrayList arrayList = new ArrayList(optJSONArray.length());
        for (int i = 0; i < optJSONArray.length(); i++) {
            arrayList.add(optJSONArray.getString(i));
        }
        return Collections.unmodifiableList(arrayList);
    }

    /* renamed from: a */
    public static void m1986a(Context context, String str, C0989cj cjVar, String str2, boolean z, List<String> list) {
        String str3 = z ? "1" : "0";
        for (String replaceAll : list) {
            String replaceAll2 = replaceAll.replaceAll("@gw_adlocid@", str2).replaceAll("@gw_adnetrefresh@", str3).replaceAll("@gw_qdata@", cjVar.f2391is.f1982fN).replaceAll("@gw_sdkver@", str).replaceAll("@gw_sessid@", C0990ck.f2394iu).replaceAll("@gw_seqnum@", cjVar.f2387hu);
            if (cjVar.f2381gb != null) {
                replaceAll2 = replaceAll2.replaceAll("@gw_adnetid@", cjVar.f2381gb.f1972fD).replaceAll("@gw_allocid@", cjVar.f2381gb.f1974fF);
            }
            new C1002cr(context, str, replaceAll2).start();
        }
    }
}
