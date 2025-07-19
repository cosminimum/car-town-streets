package com.google.android.gms.internal;

import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.text.TextUtils;

/* renamed from: com.google.android.gms.internal.bh */
public final class C0936bh {
    /* renamed from: a */
    public static boolean m2031a(Context context, C0938bj bjVar, C0950bq bqVar) {
        if (bjVar == null) {
            C1004ct.m2218v("No intent data for launcher overlay.");
            return false;
        }
        Intent intent = new Intent();
        if (TextUtils.isEmpty(bjVar.f2235go)) {
            C1004ct.m2218v("Open GMSG did not contain a URL.");
            return false;
        }
        if (!TextUtils.isEmpty(bjVar.mimeType)) {
            intent.setDataAndType(Uri.parse(bjVar.f2235go), bjVar.mimeType);
        } else {
            intent.setData(Uri.parse(bjVar.f2235go));
        }
        intent.setAction("android.intent.action.VIEW");
        if (!TextUtils.isEmpty(bjVar.packageName)) {
            intent.setPackage(bjVar.packageName);
        }
        if (!TextUtils.isEmpty(bjVar.f2236gp)) {
            String[] split = bjVar.f2236gp.split("/", 2);
            if (split.length < 2) {
                C1004ct.m2218v("Could not parse component name from open GMSG: " + bjVar.f2236gp);
                return false;
            }
            intent.setClassName(split[0], split[1]);
        }
        try {
            C1004ct.m2217u("Launching an intent: " + intent);
            context.startActivity(intent);
            bqVar.mo7178z();
            return true;
        } catch (ActivityNotFoundException e) {
            C1004ct.m2218v(e.getMessage());
            return false;
        }
    }
}
