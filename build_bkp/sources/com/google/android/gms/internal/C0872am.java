package com.google.android.gms.internal;

import android.content.Intent;
import android.content.pm.PackageManager;
import android.net.Uri;
import com.google.ads.AdActivity;
import java.util.HashMap;
import java.util.Map;

/* renamed from: com.google.android.gms.internal.am */
public final class C0872am {

    /* renamed from: fn */
    public static final C0880an f1955fn = new C0880an() {
        /* renamed from: a */
        public void mo7068a(C1007cw cwVar, Map<String, String> map) {
            String str = map.get("urls");
            if (str == null) {
                C1004ct.m2218v("URLs missing in canOpenURLs GMSG.");
                return;
            }
            String[] split = str.split(",");
            HashMap hashMap = new HashMap();
            PackageManager packageManager = cwVar.getContext().getPackageManager();
            for (String str2 : split) {
                String[] split2 = str2.split(";", 2);
                hashMap.put(str2, Boolean.valueOf(packageManager.resolveActivity(new Intent(split2.length > 1 ? split2[1].trim() : "android.intent.action.VIEW", Uri.parse(split2[0].trim())), 65536) != null));
            }
            cwVar.mo7237a("openableURLs", (Map<String, ?>) hashMap);
        }
    };

    /* renamed from: fo */
    public static final C0880an f1956fo = new C0880an() {
        /* renamed from: a */
        public void mo7068a(C1007cw cwVar, Map<String, String> map) {
            Uri uri;
            String str = map.get("u");
            if (str == null) {
                C1004ct.m2218v("URL missing from click GMSG.");
                return;
            }
            Uri parse = Uri.parse(str);
            try {
                C1332h aD = cwVar.mo7241aD();
                if (aD != null && aD.mo8162a(parse)) {
                    uri = aD.mo8160a(parse, cwVar.getContext());
                    new C1002cr(cwVar.getContext(), cwVar.mo7242aE().f2413iJ, uri.toString()).start();
                }
            } catch (C1393i e) {
                C1004ct.m2218v("Unable to append parameter to URL: " + str);
            }
            uri = parse;
            new C1002cr(cwVar.getContext(), cwVar.mo7242aE().f2413iJ, uri.toString()).start();
        }
    };

    /* renamed from: fp */
    public static final C0880an f1957fp = new C0880an() {
        /* renamed from: a */
        public void mo7068a(C1007cw cwVar, Map<String, String> map) {
            C0939bk aB = cwVar.mo7239aB();
            if (aB == null) {
                C1004ct.m2218v("A GMSG tried to close something that wasn't an overlay.");
            } else {
                aB.close();
            }
        }
    };

    /* renamed from: fq */
    public static final C0880an f1958fq = new C0880an() {
        /* renamed from: a */
        public void mo7068a(C1007cw cwVar, Map<String, String> map) {
            C0939bk aB = cwVar.mo7239aB();
            if (aB == null) {
                C1004ct.m2218v("A GMSG tried to use a custom close button on something that wasn't an overlay.");
            } else {
                aB.mo7137g("1".equals(map.get(AdActivity.CUSTOM_CLOSE_PARAM)));
            }
        }
    };

    /* renamed from: fr */
    public static final C0880an f1959fr = new C0880an() {
        /* renamed from: a */
        public void mo7068a(C1007cw cwVar, Map<String, String> map) {
            String str = map.get("u");
            if (str == null) {
                C1004ct.m2218v("URL missing from httpTrack GMSG.");
            } else {
                new C1002cr(cwVar.getContext(), cwVar.mo7242aE().f2413iJ, str).start();
            }
        }
    };

    /* renamed from: fs */
    public static final C0880an f1960fs = new C0880an() {
        /* renamed from: a */
        public void mo7068a(C1007cw cwVar, Map<String, String> map) {
            C1004ct.m2216t("Received log message: " + map.get("string"));
        }
    };

    /* renamed from: ft */
    public static final C0880an f1961ft = new C0881ao();

    /* renamed from: fu */
    public static final C0880an f1962fu = new C0880an() {
        /* renamed from: a */
        public void mo7068a(C1007cw cwVar, Map<String, String> map) {
            String str = map.get("tx");
            String str2 = map.get("ty");
            String str3 = map.get("td");
            try {
                int parseInt = Integer.parseInt(str);
                int parseInt2 = Integer.parseInt(str2);
                int parseInt3 = Integer.parseInt(str3);
                C1332h aD = cwVar.mo7241aD();
                if (aD != null) {
                    aD.mo8163g().mo7288a(parseInt, parseInt2, parseInt3);
                }
            } catch (NumberFormatException e) {
                C1004ct.m2218v("Could not parse touch parameters from gmsg.");
            }
        }
    };

    /* renamed from: fv */
    public static final C0880an f1963fv = new C0882ap();
}
