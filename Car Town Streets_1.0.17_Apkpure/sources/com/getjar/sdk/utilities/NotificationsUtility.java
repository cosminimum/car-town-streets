package com.getjar.sdk.utilities;

import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.net.Uri;
import com.getjar.sdk.comm.CommContext;
import com.getjar.sdk.data.RedemptionEngine;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import com.google.android.gms.drive.DriveFile;
import com.google.android.gms.games.GamesActivityResultCodes;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
/* loaded from: classes.dex */
public class NotificationsUtility {
    private static final String _MarketURLFormat = "market://details?id=%1$s";

    /* loaded from: classes.dex */
    public enum NotificationType {
        INSTALL_REMINDER,
        OPEN_REMINDER
    }

    private static int getNotificationId(String packageName, NotificationType type) {
        return String.format(Locale.US, "%1$s.%2$s", packageName, type.name()).hashCode();
    }

    public static void showEarnedFromPurchaseNotification(Context context, String targetPackageName, long amount) {
        String message;
        String title;
        int notificationId;
        PendingIntent pendingIntent;
        if (context == null) {
            throw new IllegalArgumentException("'context' cannot be NULL");
        }
        if (amount <= 0) {
            throw new IllegalArgumentException("'amount' cannot be less than zero");
        }
        Logger.d(Area.UI.value() | Area.REDEEM.value() | Area.OFFER.value(), String.format("NotificationsUtility: showRedeemReminderNotification() START [targetPackageName:%1$s amount:%2$d]", targetPackageName, Long.valueOf(amount)));
        Intent launchIntent = null;
        String targetApplicationName = null;
        if (!StringUtility.isNullOrEmpty(targetPackageName)) {
            PackageManager packageManager = context.getApplicationContext().getPackageManager();
            try {
                PackageInfo packageInfo = packageManager.getPackageInfo(targetPackageName, 128);
                targetApplicationName = (String) packageInfo.applicationInfo.loadLabel(packageManager);
            } catch (Exception e) {
                Logger.e(Area.TRANSACTION.value() | Area.EARN.value(), "NotificationsUtility: showRedeemReminderNotification() Failed to get the name of the target app", e);
            }
            launchIntent = packageManager.getLaunchIntentForPackage(targetPackageName);
            if (launchIntent != null) {
                launchIntent.putExtra(Constants.EXTRA_GETJAR_NOTIFICATION, true);
                launchIntent.addCategory("android.intent.category.LAUNCHER");
                launchIntent.setFlags(874512384);
            } else {
                return;
            }
        }
        if (StringUtility.isNullOrEmpty(targetPackageName) || StringUtility.isNullOrEmpty(targetApplicationName)) {
            message = String.format("%1$d Gold earned for purchase!", Long.valueOf(amount));
            title = "Open the Getjar Wallet to view";
            notificationId = String.format("showEarnedFromPurchaseNotification_%1$d", Long.valueOf(amount)).hashCode();
        } else {
            message = String.format(Constants.NOTIFICATION_PASS_WITH_APP_NAME, Long.valueOf(amount), targetApplicationName);
            title = String.format("Return to %1$s", targetApplicationName);
            notificationId = String.format("showEarnedFromPurchaseNotification_%1$s", targetPackageName).hashCode();
        }
        if (launchIntent != null) {
            pendingIntent = PendingIntent.getActivity(context, 0, launchIntent, 134217728);
        } else {
            Intent launchIntent2 = RedemptionEngine.buildShowWalletIntent(context);
            if (launchIntent2 != null) {
                pendingIntent = PendingIntent.getActivity(context, 0, launchIntent2, 134217728);
            } else {
                pendingIntent = PendingIntent.getActivity(context, 0, new Intent(), 134217728);
            }
        }
        NotificationManager notificationManager = (NotificationManager) context.getSystemService("notification");
        Notification notification = new Notification(17301516, message, System.currentTimeMillis());
        notification.flags |= 16;
        notification.setLatestEventInfo(context, title, message, pendingIntent);
        notificationManager.notify(notificationId, notification);
    }

    public static void showRedeemReminderNotification(Context context) {
        String message;
        if (context == null) {
            throw new IllegalArgumentException("'context' cannot be NULL");
        }
        Logger.d(Area.UI.value() | Area.REDEEM.value() | Area.OFFER.value(), "NotificationsUtility: showRedeemReminderNotification() START");
        Intent launchIntent = RedemptionEngine.buildShowWalletIntent(context);
        if (launchIntent == null) {
            Logger.d(Area.UI.value() | Area.REDEEM.value() | Area.OFFER.value(), "NotificationsUtility: showRedeemReminderNotification() Rewards not installed, sending install reminder");
            launchIntent = new Intent("android.intent.action.VIEW", Uri.parse(String.format(Locale.US, _MarketURLFormat, Constants.GREENJAR_PACKAGE)));
            message = "Please install Getjar Rewards to claim your unredeemed deal.";
        } else {
            Logger.d(Area.UI.value() | Area.REDEEM.value() | Area.OFFER.value(), "NotificationsUtility: showRedeemReminderNotification() Rewards installed, sending open reminder");
            message = "Open your Getjar Wallet to redeem";
        }
        NotificationManager notificationManager = (NotificationManager) context.getSystemService("notification");
        Notification notification = new Notification(17301516, message, System.currentTimeMillis());
        notification.flags |= 16;
        PendingIntent pendingIntent = PendingIntent.getActivity(context, 0, launchIntent, 134217728);
        notification.setLatestEventInfo(context, "Redeem your deal", message, pendingIntent);
        notificationManager.notify(GamesActivityResultCodes.RESULT_RECONNECT_REQUIRED, notification);
    }

    public static boolean showOpenNotification(Context context, String packageName, String appName) {
        if (context == null) {
            throw new IllegalArgumentException("'context' cannot be NULL");
        }
        if (StringUtility.isNullOrEmpty(packageName)) {
            throw new IllegalArgumentException("'packageName' cannot be NULL or empty");
        }
        if (StringUtility.isNullOrEmpty(appName)) {
            throw new IllegalArgumentException("'appName' cannot be NULL or empty");
        }
        Logger.d(Area.EARN.value() | Area.TRANSACTION.value() | Area.UI.value(), String.format(Locale.US, "NotificationsUtility: showOpenNotification() '%1$s'", packageName));
        if (packageName.equals(Constants.GREENJAR_PACKAGE)) {
            return false;
        }
        PackageManager packageManager = context.getApplicationContext().getPackageManager();
        Intent launchIntent = packageManager.getLaunchIntentForPackage(packageName);
        if (launchIntent == null) {
            Logger.w(Area.EARN.value() | Area.TRANSACTION.value() | Area.UI.value(), String.format(Locale.US, "NotificationsUtility showOpenNotification() '%1$s' has been uninstalled, skipping OPEN notification", packageName));
            return false;
        }
        launchIntent.addCategory("android.intent.category.LAUNCHER");
        launchIntent.setFlags(270532608);
        launchIntent.putExtra(Constants.EXTRA_WEBVIEW, true);
        int NOTIFICATION_ID = getNotificationId(packageName, NotificationType.OPEN_REMINDER);
        String message = String.format(Locale.US, "Open %s to earn Getjar gold", appName);
        NotificationManager notifManager = (NotificationManager) context.getSystemService("notification");
        Notification notification = new Notification(17301516, message, System.currentTimeMillis());
        notification.flags |= 16;
        PendingIntent intent = PendingIntent.getActivity(context, 0, launchIntent, 0);
        notification.setLatestEventInfo(context, appName, "Open this app to get Getjar Gold", intent);
        notifManager.notify(NOTIFICATION_ID, notification);
        return true;
    }

    public static void showInstallNotification(Context context, String packageName, String appName) {
        if (context == null) {
            throw new IllegalArgumentException("'context' cannot be NULL");
        }
        if (StringUtility.isNullOrEmpty(packageName)) {
            throw new IllegalArgumentException("'packageName' cannot be NULL or empty");
        }
        if (StringUtility.isNullOrEmpty(appName)) {
            throw new IllegalArgumentException("'appName' cannot be NULL or empty");
        }
        Logger.d(Area.EARN.value() | Area.TRANSACTION.value() | Area.UI.value(), String.format(Locale.US, "NotificationsUtility: showInstallNotification() '%1$s'", packageName));
        if (!packageName.equals(Constants.GREENJAR_PACKAGE)) {
            String url = String.format(Locale.US, _MarketURLFormat, packageName);
            Intent googPlayIntent = new Intent("android.intent.action.VIEW", Uri.parse(url));
            googPlayIntent.addFlags(DriveFile.MODE_READ_ONLY);
            googPlayIntent.addFlags(134217728);
            googPlayIntent.addFlags(1073741824);
            int NOTIFICATION_ID = getNotificationId(packageName, NotificationType.INSTALL_REMINDER);
            String message = String.format(Locale.US, "Install and open %s to earn Getjar gold", appName);
            NotificationManager notifManager = (NotificationManager) context.getSystemService("notification");
            Notification notification = new Notification(17301516, message, System.currentTimeMillis());
            notification.flags |= 16;
            PendingIntent intent = PendingIntent.getActivity(context, 0, googPlayIntent, 0);
            notification.setLatestEventInfo(context, appName, "Install and open this app to get Getjar Gold", intent);
            notifManager.notify(NOTIFICATION_ID, notification);
        }
    }

    public static void clearInstallNotification(Context context, String packageName) {
        if (context == null) {
            throw new IllegalArgumentException("'context' cannot be NULL");
        }
        if (StringUtility.isNullOrEmpty(packageName)) {
            throw new IllegalArgumentException("'packageName' cannot be NULL or empty");
        }
        Logger.d(Area.EARN.value() | Area.TRANSACTION.value() | Area.UI.value(), String.format(Locale.US, "NotificationsUtility: clearInstallNotification() '%1$s'", packageName));
        int NOTIFICATION_ID = getNotificationId(packageName, NotificationType.INSTALL_REMINDER);
        NotificationManager notifManager = (NotificationManager) context.getSystemService("notification");
        notifManager.cancel(NOTIFICATION_ID);
    }

    public static void clearOpenNotification(Context context, String packageName) {
        if (context == null) {
            throw new IllegalArgumentException("'context' cannot be NULL");
        }
        if (StringUtility.isNullOrEmpty(packageName)) {
            throw new IllegalArgumentException("'packageName' cannot be NULL or empty");
        }
        Logger.d(Area.EARN.value() | Area.TRANSACTION.value() | Area.UI.value(), String.format(Locale.US, "NotificationsUtility: clearOpenNotification() '%1$s'", packageName));
        int NOTIFICATION_ID = getNotificationId(packageName, NotificationType.OPEN_REMINDER);
        NotificationManager notifManager = (NotificationManager) context.getSystemService("notification");
        notifManager.cancel(NOTIFICATION_ID);
    }

    public static void pushFailNotification(CommContext context, String message) {
        try {
            Logger.d(Area.EARN.value() | Area.TRANSACTION.value() | Area.UI.value(), "Send Fail Notification");
            PackageManager packageManager = context.getApplicationContext().getPackageManager();
            PackageInfo packageInfo = packageManager.getPackageInfo(context.getApplicationContext().getPackageName(), 128);
            String hostApplicationName = (String) packageInfo.applicationInfo.loadLabel(packageManager);
            NotificationManager notificationMng = (NotificationManager) context.getApplicationContext().getSystemService("notification");
            String textMsg = String.format(Locale.US, message, hostApplicationName);
            Notification notification = new Notification(17301516, textMsg, System.currentTimeMillis());
            notification.flags |= 16;
            CharSequence contentText = "Return to " + packageManager.getPackageInfo(context.getApplicationContext().getPackageName(), 128).applicationInfo.loadLabel(packageManager);
            new Intent("android.intent.action.MAIN");
            Intent notificationIntent = packageManager.getLaunchIntentForPackage(context.getApplicationContext().getPackageName());
            notificationIntent.addCategory("android.intent.category.LAUNCHER");
            notificationIntent.setFlags(270532608);
            notificationIntent.putExtra(Constants.EXTRA_WEBVIEW, true);
            notificationIntent.putExtra(Constants.EXTRA_GETJAR_NOTIFICATION, true);
            PendingIntent contentIntent = PendingIntent.getActivity(context.getApplicationContext(), 0, notificationIntent, 0);
            notification.setLatestEventInfo(context.getApplicationContext(), textMsg, contentText, contentIntent);
            notificationMng.notify(0, notification);
        } catch (Exception e) {
            Logger.e(Area.EARN.value() | Area.TRANSACTION.value() | Area.UI.value(), "pushFailNotification() failed", e);
        }
    }

    public static void pushSuccessNotification(CommContext context, String message) {
        try {
            Logger.d(Area.EARN.value() | Area.TRANSACTION.value() | Area.UI.value(), "Send Success Notification");
            PackageManager packageManager = context.getApplicationContext().getPackageManager();
            PackageInfo packageInfo = packageManager.getPackageInfo(context.getApplicationContext().getPackageName(), 128);
            String hostApplicationName = (String) packageInfo.applicationInfo.loadLabel(packageManager);
            NotificationManager notificationMng = (NotificationManager) context.getApplicationContext().getSystemService("notification");
            Notification notification = new Notification(17301516, message, System.currentTimeMillis());
            notification.flags |= 16;
            CharSequence contentText = "Return to " + hostApplicationName;
            String launchActivity = "";
            Intent i = new Intent("android.intent.action.MAIN");
            i.addCategory("android.intent.category.LAUNCHER");
            List<ResolveInfo> appList = packageManager.queryIntentActivities(i, 0);
            Iterator i$ = appList.iterator();
            while (true) {
                if (!i$.hasNext()) {
                    break;
                }
                ResolveInfo app = i$.next();
                if (app.activityInfo.packageName.equals(context.getApplicationContext().getPackageName())) {
                    launchActivity = app.activityInfo.name;
                    String str = (String) app.activityInfo.loadLabel(packageManager);
                    break;
                }
            }
            Intent notificationIntent = new Intent("android.intent.action.MAIN", (Uri) null);
            notificationIntent.addCategory("android.intent.category.LAUNCHER");
            ComponentName cn = new ComponentName(context.getApplicationContext().getPackageName(), launchActivity);
            notificationIntent.setComponent(cn);
            notificationIntent.setFlags(335544320);
            notificationIntent.putExtra(Constants.EXTRA_WEBVIEW, true);
            notificationIntent.putExtra(Constants.EXTRA_GETJAR_NOTIFICATION, true);
            PendingIntent contentIntent = PendingIntent.getActivity(context.getApplicationContext(), 0, notificationIntent, 0);
            notification.setLatestEventInfo(context.getApplicationContext(), message, contentText, contentIntent);
            notificationMng.notify(0, notification);
        } catch (Exception e) {
            Logger.e(Area.EARN.value() | Area.TRANSACTION.value() | Area.UI.value(), "pushSuccessNotification() failed", e);
        }
    }
}
