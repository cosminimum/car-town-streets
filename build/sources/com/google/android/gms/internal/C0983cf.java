package com.google.android.gms.internal;

import android.content.Context;
import android.graphics.Color;
import android.location.Location;
import android.text.TextUtils;
import com.getjar.sdk.utilities.Constants;
import com.millennialmedia.android.MMAdView;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Locale;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* renamed from: com.google.android.gms.internal.cf */
public final class C0983cf {

    /* renamed from: hJ */
    private static final SimpleDateFormat f2338hJ = new SimpleDateFormat("yyyyMMdd");

    /* renamed from: a */
    public static C0976cb m2130a(Context context, C0972bz bzVar, String str) {
        C0976cb cbVar;
        List<String> list;
        List<String> list2;
        List<String> list3;
        try {
            JSONObject jSONObject = new JSONObject(str);
            String optString = jSONObject.optString("ad_base_url", (String) null);
            String optString2 = jSONObject.optString("ad_url", (String) null);
            String optString3 = jSONObject.optString("ad_size", (String) null);
            String optString4 = jSONObject.optString("ad_html", (String) null);
            long j = jSONObject.has("interstitial_timeout") ? (long) (jSONObject.getDouble("interstitial_timeout") * 1000.0d) : -1;
            String optString5 = jSONObject.optString(MMAdView.KEY_ORIENTATION, (String) null);
            int i = -1;
            if (Constants.PORTRAIT.equals(optString5)) {
                i = C0997co.m2182av();
            } else if (Constants.LANDSCAPE.equals(optString5)) {
                i = C0997co.m2181au();
            }
            if (!TextUtils.isEmpty(optString4)) {
                if (TextUtils.isEmpty(optString)) {
                    C1004ct.m2218v("Could not parse the mediation config: Missing required ad_base_url field");
                    return new C0976cb(0);
                }
                cbVar = null;
            } else if (!TextUtils.isEmpty(optString2)) {
                C0976cb a = C0981ce.m2126a(context, bzVar.f2305ej.f2413iJ, optString2);
                optString = a.f2323gL;
                optString4 = a.f2326hw;
                cbVar = a;
            } else {
                C1004ct.m2218v("Could not parse the mediation config: Missing required ad_html or ad_url field.");
                return new C0976cb(0);
            }
            JSONArray optJSONArray = jSONObject.optJSONArray("click_urls");
            List<String> list4 = cbVar == null ? null : cbVar.f2320fK;
            if (optJSONArray != null) {
                if (list4 == null) {
                    list4 = new LinkedList<>();
                }
                for (int i2 = 0; i2 < optJSONArray.length(); i2++) {
                    list4.add(optJSONArray.getString(i2));
                }
                list = list4;
            } else {
                list = list4;
            }
            JSONArray optJSONArray2 = jSONObject.optJSONArray("impression_urls");
            List<String> list5 = cbVar == null ? null : cbVar.f2321fL;
            if (optJSONArray2 != null) {
                if (list5 == null) {
                    list5 = new LinkedList<>();
                }
                for (int i3 = 0; i3 < optJSONArray2.length(); i3++) {
                    list5.add(optJSONArray2.getString(i3));
                }
                list2 = list5;
            } else {
                list2 = list5;
            }
            JSONArray optJSONArray3 = jSONObject.optJSONArray("manual_impression_urls");
            List<String> list6 = cbVar == null ? null : cbVar.f2324hA;
            if (optJSONArray3 != null) {
                if (list6 == null) {
                    list6 = new LinkedList<>();
                }
                for (int i4 = 0; i4 < optJSONArray3.length(); i4++) {
                    list6.add(optJSONArray3.getString(i4));
                }
                list3 = list6;
            } else {
                list3 = list6;
            }
            if (cbVar != null) {
                if (cbVar.orientation != -1) {
                    i = cbVar.orientation;
                }
                if (cbVar.f2327hx > 0) {
                    j = cbVar.f2327hx;
                }
            }
            return new C0976cb(optString, optString4, list, list2, j, false, -1, list3, -1, i, optString3);
        } catch (JSONException e) {
            C1004ct.m2218v("Could not parse the mediation config: " + e.getMessage());
            return new C0976cb(0);
        }
    }

    /* renamed from: a */
    public static String m2131a(C0972bz bzVar, C0988ci ciVar, Location location) {
        try {
            HashMap hashMap = new HashMap();
            if (bzVar.f2307hq != null) {
                hashMap.put("ad_pos", bzVar.f2307hq);
            }
            m2135a((HashMap<String, Object>) hashMap, bzVar.f2308hr);
            hashMap.put("format", bzVar.f2306em.f3485eF);
            if (bzVar.f2306em.width == -1) {
                hashMap.put("smart_w", "full");
            }
            if (bzVar.f2306em.height == -2) {
                hashMap.put("smart_h", "auto");
            }
            if (bzVar.f2306em.f3487eH != null) {
                StringBuilder sb = new StringBuilder();
                for (C1466x xVar : bzVar.f2306em.f3487eH) {
                    if (sb.length() != 0) {
                        sb.append("|");
                    }
                    sb.append(xVar.width == -1 ? (int) (((float) xVar.widthPixels) / ciVar.f2374ip) : xVar.width);
                    sb.append(Constants.f677X);
                    sb.append(xVar.height == -2 ? (int) (((float) xVar.heightPixels) / ciVar.f2374ip) : xVar.height);
                }
                hashMap.put("sz", sb);
            }
            hashMap.put("slotname", bzVar.adUnitId);
            hashMap.put("pn", bzVar.applicationInfo.packageName);
            if (bzVar.f2309hs != null) {
                hashMap.put("vc", Integer.valueOf(bzVar.f2309hs.versionCode));
            }
            hashMap.put("ms", bzVar.f2310ht);
            hashMap.put("seq_num", bzVar.f2311hu);
            hashMap.put("session_id", bzVar.f2312hv);
            hashMap.put("js", bzVar.f2305ej.f2413iJ);
            m2134a((HashMap<String, Object>) hashMap, ciVar);
            if (bzVar.f2308hr.versionCode >= 2 && bzVar.f2308hr.f3481eE != null) {
                m2132a((HashMap<String, Object>) hashMap, bzVar.f2308hr.f3481eE);
            }
            if (C1004ct.m2213n(2)) {
                C1004ct.m2217u("Ad Request JSON: " + C0997co.m2191m(hashMap).toString(2));
            }
            return C0997co.m2191m(hashMap).toString();
        } catch (JSONException e) {
            C1004ct.m2218v("Problem serializing ad request to JSON: " + e.getMessage());
            return null;
        }
    }

    /* renamed from: a */
    private static void m2132a(HashMap<String, Object> hashMap, Location location) {
        HashMap hashMap2 = new HashMap();
        Float valueOf = Float.valueOf(location.getAccuracy() * 1000.0f);
        Long valueOf2 = Long.valueOf(location.getTime() * 1000);
        Long valueOf3 = Long.valueOf((long) (location.getLatitude() * 1.0E7d));
        Long valueOf4 = Long.valueOf((long) (location.getLongitude() * 1.0E7d));
        hashMap2.put("radius", valueOf);
        hashMap2.put("lat", valueOf3);
        hashMap2.put("long", valueOf4);
        hashMap2.put("time", valueOf2);
        hashMap.put("uule", hashMap2);
    }

    /* renamed from: a */
    private static void m2133a(HashMap<String, Object> hashMap, C0868ai aiVar) {
        String str;
        String str2 = null;
        if (Color.alpha(aiVar.f1941eZ) != 0) {
            hashMap.put("acolor", m2137m(aiVar.f1941eZ));
        }
        if (Color.alpha(aiVar.backgroundColor) != 0) {
            hashMap.put("bgcolor", m2137m(aiVar.backgroundColor));
        }
        if (!(Color.alpha(aiVar.f1942fa) == 0 || Color.alpha(aiVar.f1943fb) == 0)) {
            hashMap.put("gradientto", m2137m(aiVar.f1942fa));
            hashMap.put("gradientfrom", m2137m(aiVar.f1943fb));
        }
        if (Color.alpha(aiVar.f1944fc) != 0) {
            hashMap.put("bcolor", m2137m(aiVar.f1944fc));
        }
        hashMap.put("bthick", Integer.toString(aiVar.f1945fd));
        switch (aiVar.f1946fe) {
            case 0:
                str = "none";
                break;
            case 1:
                str = "dashed";
                break;
            case 2:
                str = "dotted";
                break;
            case 3:
                str = "solid";
                break;
            default:
                str = null;
                break;
        }
        if (str != null) {
            hashMap.put("btype", str);
        }
        switch (aiVar.f1947ff) {
            case 0:
                str2 = "light";
                break;
            case 1:
                str2 = "medium";
                break;
            case 2:
                str2 = "dark";
                break;
        }
        if (str2 != null) {
            hashMap.put("callbuttoncolor", str2);
        }
        if (aiVar.f1948fg != null) {
            hashMap.put("channel", aiVar.f1948fg);
        }
        if (Color.alpha(aiVar.f1949fh) != 0) {
            hashMap.put("dcolor", m2137m(aiVar.f1949fh));
        }
        if (aiVar.f1950fi != null) {
            hashMap.put("font", aiVar.f1950fi);
        }
        if (Color.alpha(aiVar.f1951fj) != 0) {
            hashMap.put("hcolor", m2137m(aiVar.f1951fj));
        }
        hashMap.put("headersize", Integer.toString(aiVar.f1952fk));
        if (aiVar.f1953fl != null) {
            hashMap.put("q", aiVar.f1953fl);
        }
    }

    /* renamed from: a */
    private static void m2134a(HashMap<String, Object> hashMap, C0988ci ciVar) {
        hashMap.put("am", Integer.valueOf(ciVar.f2358hZ));
        hashMap.put("cog", m2136j(ciVar.f2359ia));
        hashMap.put("coh", m2136j(ciVar.f2360ib));
        if (!TextUtils.isEmpty(ciVar.f2361ic)) {
            hashMap.put("carrier", ciVar.f2361ic);
        }
        hashMap.put("gl", ciVar.f2362id);
        if (ciVar.f2363ie) {
            hashMap.put("simulator", 1);
        }
        hashMap.put("ma", m2136j(ciVar.f2364if));
        hashMap.put("sp", m2136j(ciVar.f2365ig));
        hashMap.put("hl", ciVar.f2366ih);
        if (!TextUtils.isEmpty(ciVar.f2367ii)) {
            hashMap.put("mv", ciVar.f2367ii);
        }
        hashMap.put("muv", Integer.valueOf(ciVar.f2368ij));
        if (ciVar.f2369ik != -2) {
            hashMap.put("cnt", Integer.valueOf(ciVar.f2369ik));
        }
        hashMap.put("gnt", Integer.valueOf(ciVar.f2370il));
        hashMap.put("pt", Integer.valueOf(ciVar.f2371im));
        hashMap.put("rm", Integer.valueOf(ciVar.f2372in));
        hashMap.put("riv", Integer.valueOf(ciVar.f2373io));
        hashMap.put("u_sd", Float.valueOf(ciVar.f2374ip));
        hashMap.put("sh", Integer.valueOf(ciVar.f2376ir));
        hashMap.put("sw", Integer.valueOf(ciVar.f2375iq));
    }

    /* renamed from: a */
    private static void m2135a(HashMap<String, Object> hashMap, C1464v vVar) {
        String as = C0991cl.m2163as();
        if (as != null) {
            hashMap.put("abf", as);
        }
        if (vVar.f3482ex != -1) {
            hashMap.put("cust_age", f2338hJ.format(new Date(vVar.f3482ex)));
        }
        if (vVar.extras != null) {
            hashMap.put("extras", vVar.extras);
        }
        if (vVar.f3483ey != -1) {
            hashMap.put("cust_gender", Integer.valueOf(vVar.f3483ey));
        }
        if (vVar.f3484ez != null) {
            hashMap.put("kw", vVar.f3484ez);
        }
        if (vVar.tagForChildDirectedTreatment != -1) {
            hashMap.put("tag_for_child_directed_treatment", Integer.valueOf(vVar.tagForChildDirectedTreatment));
        }
        if (vVar.f3477eA) {
            hashMap.put("adtest", "on");
        }
        if (vVar.versionCode >= 2) {
            if (vVar.f3478eB) {
                hashMap.put("d_imp_hdr", 1);
            }
            if (!TextUtils.isEmpty(vVar.f3479eC)) {
                hashMap.put("ppid", vVar.f3479eC);
            }
            if (vVar.f3480eD != null) {
                m2133a(hashMap, vVar.f3480eD);
            }
        }
    }

    /* renamed from: j */
    private static Integer m2136j(boolean z) {
        return Integer.valueOf(z ? 1 : 0);
    }

    /* renamed from: m */
    private static String m2137m(int i) {
        return String.format(Locale.US, "#%06x", new Object[]{Integer.valueOf(16777215 & i)});
    }
}
