package com.google.android.gms.internal;

import com.getjar.sdk.utilities.Constants;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

/* renamed from: com.google.android.gms.internal.ch */
public final class C0987ch {

    /* renamed from: hP */
    private String f2348hP;

    /* renamed from: hQ */
    private String f2349hQ;

    /* renamed from: hR */
    private String f2350hR;

    /* renamed from: hS */
    private List<String> f2351hS;

    /* renamed from: hT */
    private List<String> f2352hT;

    /* renamed from: hU */
    private long f2353hU = -1;

    /* renamed from: hV */
    private boolean f2354hV = false;

    /* renamed from: hW */
    private final long f2355hW = -1;

    /* renamed from: hX */
    private List<String> f2356hX;

    /* renamed from: hY */
    private long f2357hY = -1;
    private int mOrientation = -1;

    /* renamed from: a */
    private static long m2146a(Map<String, List<String>> map, String str) {
        List list = map.get(str);
        if (list != null && !list.isEmpty()) {
            String str2 = (String) list.get(0);
            try {
                return (long) (Float.parseFloat(str2) * 1000.0f);
            } catch (NumberFormatException e) {
                C1004ct.m2218v("Could not parse float from " + str + " header: " + str2);
            }
        }
        return -1;
    }

    /* renamed from: b */
    private static List<String> m2147b(Map<String, List<String>> map, String str) {
        String str2;
        List list = map.get(str);
        if (list == null || list.isEmpty() || (str2 = (String) list.get(0)) == null) {
            return null;
        }
        return Arrays.asList(str2.trim().split("\\s+"));
    }

    /* renamed from: e */
    private void m2148e(Map<String, List<String>> map) {
        List list = map.get("X-Afma-Ad-Size");
        if (list != null && !list.isEmpty()) {
            this.f2348hP = (String) list.get(0);
        }
    }

    /* renamed from: f */
    private void m2149f(Map<String, List<String>> map) {
        List<String> b = m2147b(map, "X-Afma-Click-Tracking-Urls");
        if (b != null) {
            this.f2351hS = b;
        }
    }

    /* renamed from: g */
    private void m2150g(Map<String, List<String>> map) {
        List<String> b = m2147b(map, "X-Afma-Tracking-Urls");
        if (b != null) {
            this.f2352hT = b;
        }
    }

    /* renamed from: h */
    private void m2151h(Map<String, List<String>> map) {
        long a = m2146a(map, "X-Afma-Interstitial-Timeout");
        if (a != -1) {
            this.f2353hU = a;
        }
    }

    /* renamed from: i */
    private void m2152i(Map<String, List<String>> map) {
        List list = map.get("X-Afma-Mediation");
        if (list != null && !list.isEmpty()) {
            this.f2354hV = Boolean.valueOf((String) list.get(0)).booleanValue();
        }
    }

    /* renamed from: j */
    private void m2153j(Map<String, List<String>> map) {
        List<String> b = m2147b(map, "X-Afma-Manual-Tracking-Urls");
        if (b != null) {
            this.f2356hX = b;
        }
    }

    /* renamed from: k */
    private void m2154k(Map<String, List<String>> map) {
        long a = m2146a(map, "X-Afma-Refresh-Rate");
        if (a != -1) {
            this.f2357hY = a;
        }
    }

    /* renamed from: l */
    private void m2155l(Map<String, List<String>> map) {
        List list = map.get("X-Afma-Orientation");
        if (list != null && !list.isEmpty()) {
            String str = (String) list.get(0);
            if (Constants.PORTRAIT.equalsIgnoreCase(str)) {
                this.mOrientation = C0997co.m2182av();
            } else if (Constants.LANDSCAPE.equalsIgnoreCase(str)) {
                this.mOrientation = C0997co.m2181au();
            }
        }
    }

    /* renamed from: a */
    public void mo7218a(String str, Map<String, List<String>> map, String str2) {
        this.f2349hQ = str;
        this.f2350hR = str2;
        mo7220d(map);
    }

    /* renamed from: aq */
    public C0976cb mo7219aq() {
        return new C0976cb(this.f2349hQ, this.f2350hR, this.f2351hS, this.f2352hT, this.f2353hU, this.f2354hV, -1, this.f2356hX, this.f2357hY, this.mOrientation, this.f2348hP);
    }

    /* renamed from: d */
    public void mo7220d(Map<String, List<String>> map) {
        m2148e(map);
        m2149f(map);
        m2150g(map);
        m2151h(map);
        m2152i(map);
        m2153j(map);
        m2154k(map);
        m2155l(map);
    }
}
