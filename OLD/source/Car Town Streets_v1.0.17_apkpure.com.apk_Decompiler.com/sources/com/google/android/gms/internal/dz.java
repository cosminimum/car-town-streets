package com.google.android.gms.internal;

import android.content.Intent;
import android.net.Uri;
import com.getjar.sdk.utilities.Constants;
import com.google.android.gms.common.GooglePlayServicesUtil;

public class dz {
    private static final Uri pK = Uri.parse("http://plus.google.com/");
    private static final Uri pL = pK.buildUpon().appendPath("circles").appendPath("find").build();

    public static Intent Q(String str) {
        Uri fromParts = Uri.fromParts("package", str, (String) null);
        Intent intent = new Intent("android.settings.APPLICATION_DETAILS_SETTINGS");
        intent.setData(fromParts);
        return intent;
    }

    private static Uri R(String str) {
        return Uri.parse("market://details").buildUpon().appendQueryParameter(Constants.APP_ID, str).build();
    }

    public static Intent S(String str) {
        Intent intent = new Intent("android.intent.action.VIEW");
        intent.setData(R(str));
        intent.setPackage(GooglePlayServicesUtil.GOOGLE_PLAY_STORE_PACKAGE);
        intent.addFlags(524288);
        return intent;
    }

    public static Intent T(String str) {
        Uri parse = Uri.parse("bazaar://search?q=pname:" + str);
        Intent intent = new Intent("android.intent.action.VIEW");
        intent.setData(parse);
        intent.setFlags(524288);
        return intent;
    }

    public static Intent bX() {
        return new Intent("android.settings.DATE_SETTINGS");
    }
}
