package com.google.ads;

import android.app.AlertDialog;
import android.content.ComponentName;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.net.Uri;
import android.text.TextUtils;
import android.webkit.WebView;
import com.google.android.gcm.GCMConstants;
import java.util.HashMap;
/* loaded from: classes.dex */
public class ai implements n {

    /* loaded from: classes.dex */
    public enum b {
        AD("ad"),
        APP(GCMConstants.EXTRA_APPLICATION_PENDING_INTENT);
        
        public String c;

        b(String str) {
            this.c = str;
        }
    }

    /* loaded from: classes.dex */
    private static class c implements DialogInterface.OnClickListener {
        private com.google.ads.internal.d a;

        public c(com.google.ads.internal.d dVar) {
            this.a = dVar;
        }

        @Override // android.content.DialogInterface.OnClickListener
        public void onClick(DialogInterface dialog, int which) {
            HashMap hashMap = new HashMap();
            hashMap.put("u", "market://details?id=com.google.android.apps.plus");
            AdActivity.launchAdActivity(this.a, new com.google.ads.internal.e("intent", hashMap));
        }
    }

    /* loaded from: classes.dex */
    private static class a implements DialogInterface.OnClickListener {
        @Override // android.content.DialogInterface.OnClickListener
        public void onClick(DialogInterface dialog, int which) {
        }
    }

    @Override // com.google.ads.n
    public void a(com.google.ads.internal.d dVar, HashMap<String, String> hashMap, WebView webView) {
        Context a2 = dVar.h().f.a();
        String str = hashMap.get("a");
        if (str != null) {
            if (str.equals("resize")) {
                ag.a(webView, hashMap.get("u"));
                return;
            } else if (str.equals("state")) {
                ag.a(dVar.h().e.a(), webView, hashMap.get("u"));
                return;
            }
        }
        Intent intent = new Intent();
        intent.setComponent(new ComponentName("com.google.android.apps.plus", "com.google.android.apps.circles.platform.PlusOneActivity"));
        if (!ah.a(intent, a2)) {
            if (ah.a(new Intent("android.intent.action.VIEW", Uri.parse("market://details?id=com.google.android.apps.plus")), a2)) {
                if (!TextUtils.isEmpty(hashMap.get("d")) && !TextUtils.isEmpty(hashMap.get(AdActivity.ORIENTATION_PARAM)) && !TextUtils.isEmpty(hashMap.get("c"))) {
                    AlertDialog.Builder builder = new AlertDialog.Builder(a2);
                    builder.setMessage(hashMap.get("d")).setPositiveButton(hashMap.get(AdActivity.ORIENTATION_PARAM), new c(dVar)).setNegativeButton(hashMap.get("c"), new a());
                    builder.create().show();
                    return;
                }
                HashMap hashMap2 = new HashMap();
                hashMap2.put("u", "market://details?id=com.google.android.apps.plus");
                AdActivity.launchAdActivity(dVar, new com.google.ads.internal.e("intent", hashMap2));
                return;
            }
            return;
        }
        AdActivity.launchAdActivity(dVar, new com.google.ads.internal.e("plusone", hashMap));
    }
}
