package com.google.tagmanager;

import android.content.Context;
import android.content.SharedPreferences;
import android.net.Uri;
import com.google.android.gms.common.util.VisibleForTesting;
import java.util.HashMap;
import java.util.Map;
/* loaded from: classes.dex */
class InstallReferrerUtil {
    static final String INTENT_EXTRA_REFERRER = "referrer";
    static final String PREF_KEY_REFERRER = "referrer";
    static final String PREF_NAME_CLICK_REFERRERS = "gtm_click_referrers";
    static final String PREF_NAME_INSTALL_REFERRER = "gtm_install_referrer";
    @VisibleForTesting
    static Map<String, String> clickReferrers = new HashMap();
    private static String installReferrer;

    InstallReferrerUtil() {
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void cacheInstallReferrer(String referrer) {
        synchronized (InstallReferrerUtil.class) {
            installReferrer = referrer;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void saveInstallReferrer(Context context, String referrer) {
        SharedPreferencesUtil.saveAsync(context, PREF_NAME_INSTALL_REFERRER, "referrer", referrer);
        addClickReferrer(context, referrer);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static String getInstallReferrer(Context context, String component) {
        if (installReferrer == null) {
            synchronized (InstallReferrerUtil.class) {
                if (installReferrer == null) {
                    SharedPreferences settings = context.getSharedPreferences(PREF_NAME_INSTALL_REFERRER, 0);
                    if (settings != null) {
                        installReferrer = settings.getString("referrer", "");
                    } else {
                        installReferrer = "";
                    }
                }
            }
        }
        return extractComponent(installReferrer, component);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void addClickReferrer(Context context, String referrer) {
        String conversionId = extractComponent(referrer, "conv");
        if (conversionId != null && conversionId.length() > 0) {
            clickReferrers.put(conversionId, referrer);
            SharedPreferencesUtil.saveAsync(context, PREF_NAME_CLICK_REFERRERS, conversionId, referrer);
        }
    }

    static String extractComponent(String referrer, String component) {
        if (component == null) {
            if (referrer.length() <= 0) {
                return null;
            }
            return referrer;
        }
        Uri uri = Uri.parse("http://hostname/?" + referrer);
        return uri.getQueryParameter(component);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static String getClickReferrer(Context context, String conversionId, String component) {
        String referrer = clickReferrers.get(conversionId);
        if (referrer == null) {
            SharedPreferences settings = context.getSharedPreferences(PREF_NAME_CLICK_REFERRERS, 0);
            if (settings != null) {
                referrer = settings.getString(conversionId, "");
            } else {
                referrer = "";
            }
            clickReferrers.put(conversionId, referrer);
        }
        return extractComponent(referrer, component);
    }
}
