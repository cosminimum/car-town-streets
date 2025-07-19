package com.google.android.gms.internal;

import com.getjar.sdk.utilities.Constants;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
/* loaded from: classes.dex */
public final class ch {
    private String hP;
    private String hQ;
    private String hR;
    private List<String> hS;
    private List<String> hT;
    private List<String> hX;
    private long hU = -1;
    private boolean hV = false;
    private final long hW = -1;
    private long hY = -1;
    private int mOrientation = -1;

    private static long a(Map<String, List<String>> map, String str) {
        List<String> list = map.get(str);
        if (list != null && !list.isEmpty()) {
            String str2 = list.get(0);
            try {
                return Float.parseFloat(str2) * 1000.0f;
            } catch (NumberFormatException e) {
                ct.v("Could not parse float from " + str + " header: " + str2);
            }
        }
        return -1L;
    }

    private static List<String> b(Map<String, List<String>> map, String str) {
        String str2;
        List<String> list = map.get(str);
        if (list == null || list.isEmpty() || (str2 = list.get(0)) == null) {
            return null;
        }
        return Arrays.asList(str2.trim().split("\\s+"));
    }

    private void e(Map<String, List<String>> map) {
        List<String> list = map.get("X-Afma-Ad-Size");
        if (list == null || list.isEmpty()) {
            return;
        }
        this.hP = list.get(0);
    }

    private void f(Map<String, List<String>> map) {
        List<String> b = b(map, "X-Afma-Click-Tracking-Urls");
        if (b != null) {
            this.hS = b;
        }
    }

    private void g(Map<String, List<String>> map) {
        List<String> b = b(map, "X-Afma-Tracking-Urls");
        if (b != null) {
            this.hT = b;
        }
    }

    private void h(Map<String, List<String>> map) {
        long a = a(map, "X-Afma-Interstitial-Timeout");
        if (a != -1) {
            this.hU = a;
        }
    }

    private void i(Map<String, List<String>> map) {
        List<String> list = map.get("X-Afma-Mediation");
        if (list == null || list.isEmpty()) {
            return;
        }
        this.hV = Boolean.valueOf(list.get(0)).booleanValue();
    }

    private void j(Map<String, List<String>> map) {
        List<String> b = b(map, "X-Afma-Manual-Tracking-Urls");
        if (b != null) {
            this.hX = b;
        }
    }

    private void k(Map<String, List<String>> map) {
        long a = a(map, "X-Afma-Refresh-Rate");
        if (a != -1) {
            this.hY = a;
        }
    }

    private void l(Map<String, List<String>> map) {
        List<String> list = map.get("X-Afma-Orientation");
        if (list == null || list.isEmpty()) {
            return;
        }
        String str = list.get(0);
        if (Constants.PORTRAIT.equalsIgnoreCase(str)) {
            this.mOrientation = co.av();
        } else if (!Constants.LANDSCAPE.equalsIgnoreCase(str)) {
        } else {
            this.mOrientation = co.au();
        }
    }

    public void a(String str, Map<String, List<String>> map, String str2) {
        this.hQ = str;
        this.hR = str2;
        d(map);
    }

    public cb aq() {
        return new cb(this.hQ, this.hR, this.hS, this.hT, this.hU, this.hV, -1L, this.hX, this.hY, this.mOrientation, this.hP);
    }

    public void d(Map<String, List<String>> map) {
        e(map);
        f(map);
        g(map);
        h(map);
        i(map);
        j(map);
        k(map);
        l(map);
    }
}
