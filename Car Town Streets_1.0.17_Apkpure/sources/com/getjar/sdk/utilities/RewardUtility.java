package com.getjar.sdk.utilities;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.pm.PackageInfo;
import android.os.Build;
import com.getjar.sdk.data.ReportUsageData;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import java.util.Locale;
import java.util.Map;
/* loaded from: classes.dex */
public class RewardUtility {
    public static final String DEVELOPER_REFERENCES = "GetJarDeveloperReferences";
    public static final int INSTALL_APP_CAP = 500;
    public static final String REWARD_URL = "http://rewards.getjar.com/";
    public static final String _PreferencesWebSettingName = "GetJarSDKWebSettingPrefs";

    public static boolean checkPermission(Context context, String permission) {
        if (context == null) {
            throw new IllegalArgumentException("'context' can not be null");
        }
        if (StringUtility.isNullOrEmpty(permission)) {
            throw new IllegalArgumentException("'permission' can not be null or empty");
        }
        int res = context.checkCallingOrSelfPermission(permission);
        return res == 0;
    }

    public static void saveGetJarTimestamp(Context context) {
        if (context == null) {
            throw new IllegalArgumentException("Must have a valid context.");
        }
        SharedPreferences prefs = context.getSharedPreferences(DEVELOPER_REFERENCES, 0);
        prefs.edit().putLong("timestamp", System.currentTimeMillis()).commit();
    }

    public static void saveWebUrlData(Context context, String url) {
        if (context == null) {
            throw new IllegalArgumentException("Must have a valid context.");
        }
        if (StringUtility.isNullOrEmpty(url)) {
            throw new IllegalArgumentException("Must provide a non-null, non-empty url.");
        }
        SharedPreferences prefs = context.getSharedPreferences(_PreferencesWebSettingName, 0);
        SharedPreferences.Editor edit = prefs.edit();
        edit.putLong(Constants.WEB_TIMESTAMP, System.currentTimeMillis()).commit();
        edit.putString(Constants.WEB_LAST_KNOWN, url).commit();
        edit.commit();
        Logger.v(Area.STORAGE.value(), String.format(Locale.US, "Last known URL updated to '%1$s'", url));
    }

    public static Map<String, ?> getWebSharedPrefsMap(Context context) {
        SharedPreferences prefs = context.getSharedPreferences(_PreferencesWebSettingName, 0);
        return prefs.getAll();
    }

    public static int prepAppDataForReportUsage(String packageName, ReportUsageData.UsageType type, Context context, Map<String, String> appMetadata) {
        if (StringUtility.isNullOrEmpty(packageName)) {
            throw new IllegalArgumentException("'packageName' cannot be NULL or empty");
        }
        if (context == null) {
            throw new IllegalArgumentException("'context' cannot be NULL");
        }
        if (appMetadata == null) {
            throw new IllegalArgumentException("'appMetadata' cannot be NULL");
        }
        appMetadata.put(Constants.META_PACKAGE_NAME, packageName);
        appMetadata.put(Constants.META_DEVICE_PLATFORM, "android");
        appMetadata.put(Constants.META_DEVICE_PLATFORM_VERSION, Build.VERSION.RELEASE);
        if (ReportUsageData.UsageType.UNINSTALLED.equals(type) || ReportUsageData.UsageType.FOUND_UNINSTALLED.equals(type)) {
            return 0;
        }
        try {
            PackageInfo packageInfo = context.getPackageManager().getPackageInfo(packageName, 128);
            appMetadata.put(Constants.META_PACKAGE_VERSION_CODE, Integer.toString(packageInfo.versionCode));
            appMetadata.put(Constants.META_PACKAGE_VERSION_NAME, packageInfo.versionName);
            int appFlags = packageInfo.applicationInfo.flags;
            return appFlags;
        } catch (Exception e) {
            Logger.w(Area.CONFIG.value(), String.format(Locale.US, "Failed to get versionCode, versionName, and app flags [packageName:'%1$s' error:'%2$s']", packageName, e.getClass().getName()));
            return 0;
        }
    }
}
