package com.google.ads;

import com.getjar.sdk.utilities.Constants;
import com.google.ads.internal.C0481h;
import com.google.ads.util.C0506a;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* renamed from: com.google.ads.c */
public class C0440c {

    /* renamed from: a */
    private static final Map<String, AdSize> f753a = Collections.unmodifiableMap(new HashMap<String, AdSize>() {
        {
            put("banner", AdSize.BANNER);
            put("mrec", AdSize.IAB_MRECT);
            put("fullbanner", AdSize.IAB_BANNER);
            put("leaderboard", AdSize.IAB_LEADERBOARD);
            put("skyscraper", AdSize.IAB_WIDE_SKYSCRAPER);
        }
    });

    /* renamed from: b */
    private final String f754b;

    /* renamed from: c */
    private final String f755c;

    /* renamed from: d */
    private final List<C0424a> f756d;

    /* renamed from: e */
    private final Integer f757e;

    /* renamed from: f */
    private final Integer f758f;

    /* renamed from: g */
    private final List<String> f759g;

    /* renamed from: h */
    private final List<String> f760h;

    /* renamed from: i */
    private final List<String> f761i;

    /* renamed from: a */
    public static C0440c m706a(String str) throws JSONException {
        List<String> list;
        List<String> list2;
        List<String> list3;
        Integer num;
        Integer num2;
        Integer num3 = null;
        JSONObject jSONObject = new JSONObject(str);
        String string = jSONObject.getString("qdata");
        String string2 = jSONObject.has("ad_type") ? jSONObject.getString("ad_type") : null;
        JSONArray jSONArray = jSONObject.getJSONArray("ad_networks");
        ArrayList arrayList = new ArrayList(jSONArray.length());
        for (int i = 0; i < jSONArray.length(); i++) {
            arrayList.add(m705a(jSONArray.getJSONObject(i)));
        }
        JSONObject optJSONObject = jSONObject.optJSONObject("settings");
        if (optJSONObject != null) {
            if (optJSONObject.has("refresh")) {
                num2 = Integer.valueOf(optJSONObject.getInt("refresh"));
            } else {
                num2 = null;
            }
            if (optJSONObject.has("ad_network_timeout_millis")) {
                num3 = Integer.valueOf(optJSONObject.getInt("ad_network_timeout_millis"));
            }
            list2 = m707a(optJSONObject, "imp_urls");
            list3 = m707a(optJSONObject, "click_urls");
            list = m707a(optJSONObject, "nofill_urls");
            num = num3;
        } else {
            list = null;
            list2 = null;
            list3 = null;
            num = null;
            num2 = null;
        }
        return new C0440c(string, string2, arrayList, num2, num, list2, list3, list);
    }

    /* renamed from: a */
    public boolean mo3547a() {
        return this.f758f != null;
    }

    /* renamed from: b */
    public int mo3548b() {
        return this.f758f.intValue();
    }

    /* renamed from: c */
    public String mo3549c() {
        return this.f754b;
    }

    /* renamed from: d */
    public boolean mo3550d() {
        return this.f757e != null;
    }

    /* renamed from: e */
    public int mo3551e() {
        return this.f757e.intValue();
    }

    /* renamed from: f */
    public List<C0424a> mo3552f() {
        return this.f756d;
    }

    /* renamed from: g */
    public List<String> mo3553g() {
        return this.f759g;
    }

    /* renamed from: h */
    public List<String> mo3554h() {
        return this.f760h;
    }

    /* renamed from: i */
    public List<String> mo3555i() {
        return this.f761i;
    }

    /* renamed from: a */
    private static C0424a m705a(JSONObject jSONObject) throws JSONException {
        HashMap hashMap;
        String string = jSONObject.getString(Constants.APP_ID);
        String optString = jSONObject.optString("allocation_id", (String) null);
        JSONArray jSONArray = jSONObject.getJSONArray("adapters");
        ArrayList arrayList = new ArrayList(jSONArray.length());
        for (int i = 0; i < jSONArray.length(); i++) {
            arrayList.add(jSONArray.getString(i));
        }
        List<String> a = m707a(jSONObject, "imp_urls");
        JSONObject optJSONObject = jSONObject.optJSONObject("data");
        HashMap hashMap2 = new HashMap(0);
        if (optJSONObject != null) {
            hashMap = new HashMap(optJSONObject.length());
            Iterator<String> keys = optJSONObject.keys();
            while (keys.hasNext()) {
                String next = keys.next();
                hashMap.put(next, optJSONObject.getString(next));
            }
        } else {
            hashMap = hashMap2;
        }
        return new C0424a(optString, string, arrayList, a, hashMap);
    }

    /* renamed from: j */
    public C0481h mo3556j() {
        if (this.f755c == null) {
            return null;
        }
        if ("interstitial".equals(this.f755c)) {
            return C0481h.f945a;
        }
        AdSize adSize = f753a.get(this.f755c);
        if (adSize != null) {
            return C0481h.m943a(adSize);
        }
        return null;
    }

    /* renamed from: a */
    private static List<String> m707a(JSONObject jSONObject, String str) throws JSONException {
        JSONArray optJSONArray = jSONObject.optJSONArray(str);
        if (optJSONArray == null) {
            return null;
        }
        ArrayList arrayList = new ArrayList(optJSONArray.length());
        for (int i = 0; i < optJSONArray.length(); i++) {
            arrayList.add(optJSONArray.getString(i));
        }
        return arrayList;
    }

    private C0440c(String str, String str2, List<C0424a> list, Integer num, Integer num2, List<String> list2, List<String> list3, List<String> list4) {
        C0506a.m1017a(str);
        this.f754b = str;
        this.f755c = str2;
        this.f756d = list;
        this.f757e = num;
        this.f758f = num2;
        this.f759g = list2;
        this.f760h = list3;
        this.f761i = list4;
    }
}
