package com.getjar.sdk.utilities;

import android.app.AlarmManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import com.getjar.sdk.comm.CommContext;
import com.getjar.sdk.comm.GetJarConfig;
import com.getjar.sdk.data.RedemptionEngine;
import com.getjar.sdk.data.metadata.PackageMonitor;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import java.util.Locale;
/* loaded from: classes.dex */
public final class AlarmsUtility {
    private static final String _KeyLastRunTimestampUsageReporting = "UsageReportingLastRunTimestamp";
    private static final long _VoucherRedemptionCheckInterval = 120000;

    public static void updateLastRunTimestampUsageReporting(Context context) {
        if (context == null) {
            throw new IllegalArgumentException("'context' can not be NULL");
        }
        updateLastRunTimestamp(context, _KeyLastRunTimestampUsageReporting);
    }

    public static synchronized void startBackgroundReporting(CommContext commContext, GetJarConfig getJarConfig) {
        synchronized (AlarmsUtility.class) {
            Logger.d(Area.USAGE.value(), "Alarms: startBackgroundReporting() -- START");
            if (commContext == null) {
                throw new IllegalArgumentException("'commContext' can not be NULL");
            }
            if (getJarConfig == null) {
                throw new IllegalArgumentException("'getJarConfig' can not be NULL");
            }
            Context context = commContext.getApplicationContext();
            try {
                Long usageReportingInterval = Long.valueOf(Utility.convertMillSec(Long.parseLong(getJarConfig.getDirectiveValue(GetJarConfig.KEY_USAGE_BACKGROUND_SEND_INTERVAL))));
                if (usageReportingInterval != null && usageReportingInterval.longValue() > 0) {
                    ensureUsageReportingAlarm(context, usageReportingInterval.longValue());
                }
            } catch (Exception e) {
                Logger.e(Area.USAGE.value(), "Alarms: ERROR: unable to start background USAGE reporting", e);
            }
            Logger.d(Area.USAGE.value(), "Alarms: startBackgroundReporting() -- END");
        }
    }

    public static synchronized void scheduleVoucherRedemptionCheck(Context context, String voucherToken) {
        synchronized (AlarmsUtility.class) {
            if (context == null) {
                throw new IllegalArgumentException("'context' cannot be NULL");
            }
            if (StringUtility.isNullOrEmpty(voucherToken)) {
                throw new IllegalArgumentException("'voucherToken' cannot be NULL or empty");
            }
            Logger.d(Area.UI.value() | Area.REDEEM.value() | Area.OFFER.value(), String.format(Locale.US, "Alarms: scheduleVoucherRedemptionCheck() [voucherToken:%1$s]", voucherToken));
            Intent intent = new Intent();
            intent.setClass(context, PackageMonitor.class);
            intent.putExtra(PackageMonitor.OPERATION_KEY_VOUCHER_REDEMPTION_CHECK, PackageMonitor.OPERATION_KEY_VOUCHER_REDEMPTION_CHECK);
            intent.putExtra(RedemptionEngine.IntentVoucherTokenKey, voucherToken);
            PendingIntent newPendingIntent = PendingIntent.getBroadcast(context, voucherToken.hashCode(), intent, 134217728);
            AlarmManager alarmManager = (AlarmManager) context.getSystemService("alarm");
            alarmManager.set(0, System.currentTimeMillis() + _VoucherRedemptionCheckInterval, newPendingIntent);
        }
    }

    private static synchronized void ensureUsageReportingAlarm(Context context, long usageReportingInterval) {
        synchronized (AlarmsUtility.class) {
            Logger.d(Area.USAGE.value(), String.format(Locale.US, "Alarms: ensureUsageReportingAlarm() -- START: usageReportingInterval=%1$d", Long.valueOf(usageReportingInterval)));
            if (context == null) {
                throw new IllegalArgumentException("'context' can not be NULL");
            }
            if (checkLastRun(context, _KeyLastRunTimestampUsageReporting, usageReportingInterval)) {
                scheduleAlarm(context, PackageMonitor.OPERATION_KEY_USAGE_TRACKING, 20000L, usageReportingInterval, 1);
            } else {
                Logger.v(Area.USAGE.value(), "Alarms: ensureUsageReportingAlarm() -- Alarm does not need to be scheduled or run at this time");
            }
            Logger.d(Area.USAGE.value(), "Alarms: ensureUsageReportingAlarm() -- END");
        }
    }

    private static boolean checkLastRun(Context context, String sharedPrefsKey, long interval) {
        SharedPreferences sharedPrefs = context.getSharedPreferences("GetJarClientPrefs", 0);
        if (!sharedPrefs.contains(sharedPrefsKey)) {
            return true;
        }
        long lastRun = sharedPrefs.getLong(sharedPrefsKey, 0L);
        return lastRun == 0 || lastRun + interval < System.currentTimeMillis();
    }

    private static void updateLastRunTimestamp(Context context, String sharedPrefsKey) {
        SharedPreferences sharedPrefs = context.getSharedPreferences("GetJarClientPrefs", 0);
        SharedPreferences.Editor editor = sharedPrefs.edit();
        editor.putLong(sharedPrefsKey, System.currentTimeMillis()).commit();
        editor.commit();
    }

    private static void scheduleAlarm(Context context, String operation, long start, long interval, int requestCode) {
        if (context == null) {
            throw new IllegalArgumentException("'context' can not be NULL");
        }
        if (StringUtility.isNullOrEmpty(operation)) {
            throw new IllegalArgumentException("'operation' can not be NULL or empty");
        }
        if (!PackageMonitor.OPERATION_KEY_USAGE_TRACKING.equals(operation)) {
            throw new IllegalArgumentException("'operation' must be a supported constant like PackageMonitor.OPERATION_KEY_USAGE_TRACKING");
        }
        Logger.d(Area.USAGE.value(), String.format(Locale.US, "Alarms: scheduleAlarm() [operation:%1$s start:%2$d, interval:%3$d, requestCode:%4$d]", operation, Long.valueOf(start), Long.valueOf(interval), Integer.valueOf(requestCode)));
        Intent intent = new Intent();
        intent.setClass(context, PackageMonitor.class);
        intent.putExtra(operation, operation);
        PendingIntent newPendingIntent = PendingIntent.getBroadcast(context, requestCode, intent, 134217728);
        AlarmManager alarmManager = (AlarmManager) context.getSystemService("alarm");
        alarmManager.setRepeating(0, System.currentTimeMillis() + start, interval, newPendingIntent);
    }
}
