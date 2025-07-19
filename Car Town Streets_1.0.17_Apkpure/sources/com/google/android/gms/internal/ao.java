package com.google.android.gms.internal;

import com.google.ads.AdActivity;
import java.util.Map;
/* loaded from: classes.dex */
public final class ao implements an {
    private static boolean a(Map<String, String> map) {
        return "1".equals(map.get(AdActivity.CUSTOM_CLOSE_PARAM));
    }

    private static int b(Map<String, String> map) {
        String str = map.get(AdActivity.ORIENTATION_PARAM);
        if (str != null) {
            if ("p".equalsIgnoreCase(str)) {
                return co.av();
            }
            if ("l".equalsIgnoreCase(str)) {
                return co.au();
            }
        }
        return -1;
    }

    @Override // com.google.android.gms.internal.an
    public void a(cw cwVar, Map<String, String> map) {
        String str = map.get("a");
        if (str == null) {
            ct.v("Action missing from an open GMSG.");
            return;
        }
        cx aC = cwVar.aC();
        if ("expand".equalsIgnoreCase(str)) {
            if (cwVar.aF()) {
                ct.v("Cannot expand WebView that is already expanded.");
            } else {
                aC.a(a(map), b(map));
            }
        } else if (!"webapp".equalsIgnoreCase(str)) {
            aC.a(new bj(map.get(AdActivity.INTENT_ACTION_PARAM), map.get("u"), map.get(AdActivity.TYPE_PARAM), map.get("p"), map.get("c"), map.get("f"), map.get("e")));
        } else {
            String str2 = map.get("u");
            if (str2 != null) {
                aC.a(a(map), b(map), str2);
            } else {
                aC.a(a(map), b(map), map.get(AdActivity.HTML_PARAM), map.get(AdActivity.BASE_URL_PARAM));
            }
        }
    }
}
