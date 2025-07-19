package com.google.android.gms.internal;

import android.content.Intent;
import android.net.Uri;
import com.getjar.sdk.utilities.Constants;
import com.google.android.gms.common.GooglePlayServicesUtil;

/* renamed from: com.google.android.gms.internal.dz */
public class C1086dz {

    /* renamed from: pK */
    private static final Uri f2614pK = Uri.parse("http://plus.google.com/");

    /* renamed from: pL */
    private static final Uri f2615pL = f2614pK.buildUpon().appendPath("circles").appendPath("find").build();

    /* renamed from: Q */
    public static Intent m2533Q(String str) {
        Uri fromParts = Uri.fromParts("package", str, (String) null);
        Intent intent = new Intent("android.settings.APPLICATION_DETAILS_SETTINGS");
        intent.setData(fromParts);
        return intent;
    }

    /* renamed from: R */
    private static Uri m2534R(String str) {
        return Uri.parse("market://details").buildUpon().appendQueryParameter(Constants.APP_ID, str).build();
    }

    /* renamed from: S */
    public static Intent m2535S(String str) {
        Intent intent = new Intent("android.intent.action.VIEW");
        intent.setData(m2534R(str));
        intent.setPackage(GooglePlayServicesUtil.GOOGLE_PLAY_STORE_PACKAGE);
        intent.addFlags(524288);
        return intent;
    }

    /* renamed from: T */
    public static Intent m2536T(String str) {
        Uri parse = Uri.parse("bazaar://search?q=pname:" + str);
        Intent intent = new Intent("android.intent.action.VIEW");
        intent.setData(parse);
        intent.setFlags(524288);
        return intent;
    }

    /* renamed from: bX */
    public static Intent m2537bX() {
        return new Intent("android.settings.DATE_SETTINGS");
    }
}
