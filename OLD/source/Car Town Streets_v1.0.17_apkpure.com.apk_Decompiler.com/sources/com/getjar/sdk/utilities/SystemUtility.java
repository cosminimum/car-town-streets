package com.getjar.sdk.utilities;

import android.app.ActivityManager;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import com.getjar.sdk.data.usage.UsageManager;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import com.google.android.gms.drive.DriveFile;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

public final class SystemUtility {
    private SystemUtility() {
    }

    public static List<String> getRecentlyRunAppsFromOS(Context context) throws PackageManager.NameNotFoundException, IllegalArgumentException, IllegalAccessException {
        if (!RewardUtility.checkPermission(context, "android.permission.GET_TASKS")) {
            return new ArrayList<>();
        }
        PackageManager packageManager = context.getPackageManager();
        List<ActivityManager.RecentTaskInfo> recentTasks = ((ActivityManager) context.getSystemService("activity")).getRecentTasks(100, 1);
        HashSet<String> packages = new HashSet<>();
        for (int i = 0; i < recentTasks.size(); i++) {
            try {
                ActivityManager.RecentTaskInfo taskInfo = recentTasks.get(i);
                Intent intent = new Intent(taskInfo.baseIntent);
                if (taskInfo.origActivity != null) {
                    intent.setComponent(taskInfo.origActivity);
                }
                intent.setFlags((intent.getFlags() & -2097153) | DriveFile.MODE_READ_ONLY);
                ResolveInfo resolveInfo = packageManager.resolveActivity(intent, 0);
                if (resolveInfo != null) {
                    String packageName = resolveInfo.activityInfo.packageName;
                    if (!StringUtility.isNullOrEmpty(packageName) && !packageName.equalsIgnoreCase(context.getPackageName()) && !UsageManager.getInstance(context).shouldFilterFromUsage(packageName)) {
                        packages.add(packageName);
                    }
                }
            } catch (Exception e) {
                Logger.e(Area.USAGE.value(), "_getRecentlyRunAppsFromOS() failed", e);
            }
        }
        return new ArrayList<>(packages);
    }
}
