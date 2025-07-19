package com.google.android.gms.internal;

import com.google.ads.AdActivity;
import java.util.Map;

/* renamed from: com.google.android.gms.internal.ao */
public final class C0881ao implements C0880an {
    /* renamed from: a */
    private static boolean m1956a(Map<String, String> map) {
        return "1".equals(map.get(AdActivity.CUSTOM_CLOSE_PARAM));
    }

    /* renamed from: b */
    private static int m1957b(Map<String, String> map) {
        String str = map.get(AdActivity.ORIENTATION_PARAM);
        if (str != null) {
            if ("p".equalsIgnoreCase(str)) {
                return C0997co.m2182av();
            }
            if ("l".equalsIgnoreCase(str)) {
                return C0997co.m2181au();
            }
        }
        return -1;
    }

    /* renamed from: a */
    public void mo7068a(C1007cw cwVar, Map<String, String> map) {
        String str = map.get("a");
        if (str == null) {
            C1004ct.m2218v("Action missing from an open GMSG.");
            return;
        }
        C1009cx aC = cwVar.mo7240aC();
        if ("expand".equalsIgnoreCase(str)) {
            if (cwVar.mo7243aF()) {
                C1004ct.m2218v("Cannot expand WebView that is already expanded.");
            } else {
                aC.mo7258a(m1956a(map), m1957b(map));
            }
        } else if ("webapp".equalsIgnoreCase(str)) {
            String str2 = map.get("u");
            if (str2 != null) {
                aC.mo7259a(m1956a(map), m1957b(map), str2);
            } else {
                aC.mo7260a(m1956a(map), m1957b(map), map.get(AdActivity.HTML_PARAM), map.get(AdActivity.BASE_URL_PARAM));
            }
        } else {
            aC.mo7254a(new C0938bj(map.get(AdActivity.INTENT_ACTION_PARAM), map.get("u"), map.get(AdActivity.TYPE_PARAM), map.get("p"), map.get("c"), map.get("f"), map.get("e")));
        }
    }
}
