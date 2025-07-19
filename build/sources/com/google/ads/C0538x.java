package com.google.ads;

import android.text.TextUtils;
import android.webkit.WebView;
import com.google.ads.C0489l;
import com.google.ads.internal.AdWebView;
import com.google.ads.internal.C0475d;
import com.google.ads.util.AdUtil;
import com.google.ads.util.C0508b;
import com.google.ads.util.C0518g;
import com.google.ads.util.C0530i;
import java.util.HashMap;

/* renamed from: com.google.ads.x */
public class C0538x implements C0497n {
    /* renamed from: a */
    public void mo3535a(C0475d dVar, HashMap<String, String> hashMap, WebView webView) {
        C0491m h = dVar.mo3708h();
        C0489l.C0490a a = h.f980a.mo3874a().f967a.mo3874a();
        m1067a(hashMap, "min_hwa_banner", a.f968a);
        m1067a(hashMap, "min_hwa_overlay", a.f969b);
        m1069c(hashMap, "mraid_banner_path", a.f970c);
        m1069c(hashMap, "mraid_expanded_banner_path", a.f971d);
        m1069c(hashMap, "mraid_interstitial_path", a.f972e);
        m1068b(hashMap, "ac_max_size", a.f973f);
        m1068b(hashMap, "ac_padding", a.f974g);
        m1068b(hashMap, "ac_total_quota", a.f975h);
        m1068b(hashMap, "db_total_quota", a.f976i);
        m1068b(hashMap, "db_quota_per_origin", a.f977j);
        m1068b(hashMap, "db_quota_step_size", a.f978k);
        AdWebView k = dVar.mo3711k();
        if (AdUtil.f1033a >= 11) {
            C0518g.m1053a(k.getSettings(), h);
            C0518g.m1053a(webView.getSettings(), h);
        }
        if (!h.f990k.mo3874a().mo3767a()) {
            boolean f = k.mo3630f();
            boolean z = AdUtil.f1033a < a.f968a.mo3875a().intValue();
            if (!z && f) {
                C0508b.m1026a("Re-enabling hardware acceleration for a banner after reading constants.");
                k.mo3626c();
            } else if (z && !f) {
                C0508b.m1026a("Disabling hardware acceleration for a banner after reading constants.");
                k.mo3625b();
            }
        }
        a.f979l.mo3876a(true);
    }

    /* renamed from: a */
    private void m1067a(HashMap<String, String> hashMap, String str, C0530i.C0534c<Integer> cVar) {
        try {
            String str2 = hashMap.get(str);
            if (!TextUtils.isEmpty(str2)) {
                cVar.mo3876a(Integer.valueOf(str2));
            }
        } catch (NumberFormatException e) {
            C0508b.m1026a("Could not parse \"" + str + "\" constant.");
        }
    }

    /* renamed from: b */
    private void m1068b(HashMap<String, String> hashMap, String str, C0530i.C0534c<Long> cVar) {
        try {
            String str2 = hashMap.get(str);
            if (!TextUtils.isEmpty(str2)) {
                cVar.mo3876a(new Long(str2));
            }
        } catch (NumberFormatException e) {
            C0508b.m1026a("Could not parse \"" + str + "\" constant.");
        }
    }

    /* renamed from: c */
    private void m1069c(HashMap<String, String> hashMap, String str, C0530i.C0534c<String> cVar) {
        String str2 = hashMap.get(str);
        if (!TextUtils.isEmpty(str2)) {
            cVar.mo3876a(str2);
        }
    }
}
