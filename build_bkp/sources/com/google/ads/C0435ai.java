package com.google.ads;

import android.app.AlertDialog;
import android.content.ComponentName;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.net.Uri;
import android.text.TextUtils;
import android.webkit.WebView;
import com.google.ads.internal.C0475d;
import com.google.ads.internal.C0476e;
import com.google.android.gcm.GCMConstants;
import java.util.HashMap;

/* renamed from: com.google.ads.ai */
public class C0435ai implements C0497n {

    /* renamed from: com.google.ads.ai$b */
    public enum C0437b {
        AD("ad"),
        APP(GCMConstants.EXTRA_APPLICATION_PENDING_INTENT);
        

        /* renamed from: c */
        public String f748c;

        private C0437b(String str) {
            this.f748c = str;
        }
    }

    /* renamed from: com.google.ads.ai$c */
    private static class C0438c implements DialogInterface.OnClickListener {

        /* renamed from: a */
        private C0475d f749a;

        public C0438c(C0475d dVar) {
            this.f749a = dVar;
        }

        public void onClick(DialogInterface dialog, int which) {
            HashMap hashMap = new HashMap();
            hashMap.put("u", "market://details?id=com.google.android.apps.plus");
            AdActivity.launchAdActivity(this.f749a, new C0476e("intent", hashMap));
        }
    }

    /* renamed from: com.google.ads.ai$a */
    private static class C0436a implements DialogInterface.OnClickListener {
        public void onClick(DialogInterface dialog, int which) {
        }
    }

    /* renamed from: a */
    public void mo3535a(C0475d dVar, HashMap<String, String> hashMap, WebView webView) {
        Context a = dVar.mo3708h().f985f.mo3874a();
        String str = hashMap.get("a");
        if (str != null) {
            if (str.equals("resize")) {
                C0430ag.m692a(webView, hashMap.get("u"));
                return;
            } else if (str.equals("state")) {
                C0430ag.m691a(dVar.mo3708h().f984e.mo3877a(), webView, hashMap.get("u"));
                return;
            }
        }
        Intent intent = new Intent();
        intent.setComponent(new ComponentName("com.google.android.apps.plus", "com.google.android.apps.circles.platform.PlusOneActivity"));
        if (C0434ah.m698a(intent, a)) {
            AdActivity.launchAdActivity(dVar, new C0476e("plusone", hashMap));
        } else if (!C0434ah.m698a(new Intent("android.intent.action.VIEW", Uri.parse("market://details?id=com.google.android.apps.plus")), a)) {
        } else {
            if (TextUtils.isEmpty(hashMap.get("d")) || TextUtils.isEmpty(hashMap.get(AdActivity.ORIENTATION_PARAM)) || TextUtils.isEmpty(hashMap.get("c"))) {
                HashMap hashMap2 = new HashMap();
                hashMap2.put("u", "market://details?id=com.google.android.apps.plus");
                AdActivity.launchAdActivity(dVar, new C0476e("intent", hashMap2));
                return;
            }
            AlertDialog.Builder builder = new AlertDialog.Builder(a);
            builder.setMessage(hashMap.get("d")).setPositiveButton(hashMap.get(AdActivity.ORIENTATION_PARAM), new C0438c(dVar)).setNegativeButton(hashMap.get("c"), new C0436a());
            builder.create().show();
        }
    }
}
