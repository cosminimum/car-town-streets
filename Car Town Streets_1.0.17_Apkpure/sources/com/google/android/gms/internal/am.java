package com.google.android.gms.internal;

import android.content.Intent;
import android.content.pm.PackageManager;
import android.net.Uri;
import com.google.ads.AdActivity;
import java.util.HashMap;
import java.util.Map;
/* loaded from: classes.dex */
public final class am {
    public static final an fn = new an() { // from class: com.google.android.gms.internal.am.1
        @Override // com.google.android.gms.internal.an
        public void a(cw cwVar, Map<String, String> map) {
            String str = map.get("urls");
            if (str == null) {
                ct.v("URLs missing in canOpenURLs GMSG.");
                return;
            }
            String[] split = str.split(",");
            HashMap hashMap = new HashMap();
            PackageManager packageManager = cwVar.getContext().getPackageManager();
            for (String str2 : split) {
                String[] split2 = str2.split(";", 2);
                hashMap.put(str2, Boolean.valueOf(packageManager.resolveActivity(new Intent(split2.length > 1 ? split2[1].trim() : "android.intent.action.VIEW", Uri.parse(split2[0].trim())), 65536) != null));
            }
            cwVar.a("openableURLs", hashMap);
        }
    };
    public static final an fo = new an() { // from class: com.google.android.gms.internal.am.2
        @Override // com.google.android.gms.internal.an
        public void a(cw cwVar, Map<String, String> map) {
            Uri uri;
            h aD;
            String str = map.get("u");
            if (str == null) {
                ct.v("URL missing from click GMSG.");
                return;
            }
            Uri parse = Uri.parse(str);
            try {
                aD = cwVar.aD();
            } catch (i e) {
                ct.v("Unable to append parameter to URL: " + str);
            }
            if (aD != null && aD.a(parse)) {
                uri = aD.a(parse, cwVar.getContext());
                new cr(cwVar.getContext(), cwVar.aE().iJ, uri.toString()).start();
            }
            uri = parse;
            new cr(cwVar.getContext(), cwVar.aE().iJ, uri.toString()).start();
        }
    };
    public static final an fp = new an() { // from class: com.google.android.gms.internal.am.3
        @Override // com.google.android.gms.internal.an
        public void a(cw cwVar, Map<String, String> map) {
            bk aB = cwVar.aB();
            if (aB == null) {
                ct.v("A GMSG tried to close something that wasn't an overlay.");
            } else {
                aB.close();
            }
        }
    };
    public static final an fq = new an() { // from class: com.google.android.gms.internal.am.4
        @Override // com.google.android.gms.internal.an
        public void a(cw cwVar, Map<String, String> map) {
            bk aB = cwVar.aB();
            if (aB == null) {
                ct.v("A GMSG tried to use a custom close button on something that wasn't an overlay.");
            } else {
                aB.g("1".equals(map.get(AdActivity.CUSTOM_CLOSE_PARAM)));
            }
        }
    };
    public static final an fr = new an() { // from class: com.google.android.gms.internal.am.5
        @Override // com.google.android.gms.internal.an
        public void a(cw cwVar, Map<String, String> map) {
            String str = map.get("u");
            if (str == null) {
                ct.v("URL missing from httpTrack GMSG.");
            } else {
                new cr(cwVar.getContext(), cwVar.aE().iJ, str).start();
            }
        }
    };
    public static final an fs = new an() { // from class: com.google.android.gms.internal.am.6
        @Override // com.google.android.gms.internal.an
        public void a(cw cwVar, Map<String, String> map) {
            ct.t("Received log message: " + map.get("string"));
        }
    };
    public static final an ft = new ao();
    public static final an fu = new an() { // from class: com.google.android.gms.internal.am.7
        @Override // com.google.android.gms.internal.an
        public void a(cw cwVar, Map<String, String> map) {
            String str = map.get("tx");
            String str2 = map.get("ty");
            String str3 = map.get("td");
            try {
                int parseInt = Integer.parseInt(str);
                int parseInt2 = Integer.parseInt(str2);
                int parseInt3 = Integer.parseInt(str3);
                h aD = cwVar.aD();
                if (aD == null) {
                    return;
                }
                aD.g().a(parseInt, parseInt2, parseInt3);
            } catch (NumberFormatException e) {
                ct.v("Could not parse touch parameters from gmsg.");
            }
        }
    };
    public static final an fv = new ap();
}
