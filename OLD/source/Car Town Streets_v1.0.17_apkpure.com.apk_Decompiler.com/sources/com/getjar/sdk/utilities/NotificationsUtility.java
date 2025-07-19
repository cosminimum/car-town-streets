package com.getjar.sdk.utilities;

import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
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
import java.util.Locale;

public class NotificationsUtility {
    private static final String _MarketURLFormat = "market://details?id=%1$s";

    public enum NotificationType {
        INSTALL_REMINDER,
        OPEN_REMINDER
    }

    private static int getNotificationId(String packageName, NotificationType type) {
        return String.format(Locale.US, "%1$s.%2$s", new Object[]{packageName, type.name()}).hashCode();
    }

    /* JADX WARNING: type inference failed for: r12v32, types: [java.lang.CharSequence] */
    /* JADX WARNING: Multi-variable type inference failed */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static void showEarnedFromPurchaseNotification(android.content.Context r18, java.lang.String r19, long r20) {
        /*
            if (r18 != 0) goto L_0x000a
            java.lang.IllegalArgumentException r12 = new java.lang.IllegalArgumentException
            java.lang.String r13 = "'context' cannot be NULL"
            r12.<init>(r13)
            throw r12
        L_0x000a:
            r12 = 0
            int r12 = (r20 > r12 ? 1 : (r20 == r12 ? 0 : -1))
            if (r12 > 0) goto L_0x0018
            java.lang.IllegalArgumentException r12 = new java.lang.IllegalArgumentException
            java.lang.String r13 = "'amount' cannot be less than zero"
            r12.<init>(r13)
            throw r12
        L_0x0018:
            com.getjar.sdk.logging.Area r12 = com.getjar.sdk.logging.Area.UI
            long r12 = r12.value()
            com.getjar.sdk.logging.Area r14 = com.getjar.sdk.logging.Area.REDEEM
            long r14 = r14.value()
            long r12 = r12 | r14
            com.getjar.sdk.logging.Area r14 = com.getjar.sdk.logging.Area.OFFER
            long r14 = r14.value()
            long r12 = r12 | r14
            java.lang.String r14 = "NotificationsUtility: showRedeemReminderNotification() START [targetPackageName:%1$s amount:%2$d]"
            r15 = 2
            java.lang.Object[] r15 = new java.lang.Object[r15]
            r16 = 0
            r15[r16] = r19
            r16 = 1
            java.lang.Long r17 = java.lang.Long.valueOf(r20)
            r15[r16] = r17
            java.lang.String r14 = java.lang.String.format(r14, r15)
            com.getjar.sdk.logging.Logger.d(r12, r14)
            r2 = 0
            r10 = 0
            boolean r12 = com.getjar.sdk.utilities.StringUtility.isNullOrEmpty(r19)
            if (r12 != 0) goto L_0x0093
            android.content.Context r12 = r18.getApplicationContext()
            android.content.pm.PackageManager r8 = r12.getPackageManager()
            r12 = 128(0x80, float:1.794E-43)
            r0 = r19
            android.content.pm.PackageInfo r7 = r8.getPackageInfo(r0, r12)     // Catch:{ Exception -> 0x006f }
            android.content.pm.ApplicationInfo r12 = r7.applicationInfo     // Catch:{ Exception -> 0x006f }
            java.lang.CharSequence r12 = r12.loadLabel(r8)     // Catch:{ Exception -> 0x006f }
            r0 = r12
            java.lang.String r0 = (java.lang.String) r0     // Catch:{ Exception -> 0x006f }
            r10 = r0
        L_0x0066:
            r0 = r19
            android.content.Intent r2 = r8.getLaunchIntentForPackage(r0)
            if (r2 != 0) goto L_0x0083
        L_0x006e:
            return
        L_0x006f:
            r1 = move-exception
            com.getjar.sdk.logging.Area r12 = com.getjar.sdk.logging.Area.TRANSACTION
            long r12 = r12.value()
            com.getjar.sdk.logging.Area r14 = com.getjar.sdk.logging.Area.EARN
            long r14 = r14.value()
            long r12 = r12 | r14
            java.lang.String r14 = "NotificationsUtility: showRedeemReminderNotification() Failed to get the name of the target app"
            com.getjar.sdk.logging.Logger.e(r12, r14, r1)
            goto L_0x0066
        L_0x0083:
            java.lang.String r12 = "GETJAR_NOTIFICATION"
            r13 = 1
            r2.putExtra(r12, r13)
            java.lang.String r12 = "android.intent.category.LAUNCHER"
            r2.addCategory(r12)
            r12 = 874512384(0x34200000, float:1.4901161E-7)
            r2.setFlags(r12)
        L_0x0093:
            boolean r12 = com.getjar.sdk.utilities.StringUtility.isNullOrEmpty(r19)
            if (r12 != 0) goto L_0x009f
            boolean r12 = com.getjar.sdk.utilities.StringUtility.isNullOrEmpty(r10)
            if (r12 == 0) goto L_0x00f7
        L_0x009f:
            java.lang.String r12 = "%1$d Gold earned for purchase!"
            r13 = 1
            java.lang.Object[] r13 = new java.lang.Object[r13]
            r14 = 0
            java.lang.Long r15 = java.lang.Long.valueOf(r20)
            r13[r14] = r15
            java.lang.String r3 = java.lang.String.format(r12, r13)
            java.lang.String r11 = "Open the Getjar Wallet to view"
            java.lang.String r12 = "showEarnedFromPurchaseNotification_%1$d"
            r13 = 1
            java.lang.Object[] r13 = new java.lang.Object[r13]
            r14 = 0
            java.lang.Long r15 = java.lang.Long.valueOf(r20)
            r13[r14] = r15
            java.lang.String r12 = java.lang.String.format(r12, r13)
            int r5 = r12.hashCode()
        L_0x00c5:
            r9 = 0
            if (r2 == 0) goto L_0x0127
            r12 = 0
            r13 = 134217728(0x8000000, float:3.85186E-34)
            r0 = r18
            android.app.PendingIntent r9 = android.app.PendingIntent.getActivity(r0, r12, r2, r13)
        L_0x00d1:
            java.lang.String r12 = "notification"
            r0 = r18
            java.lang.Object r6 = r0.getSystemService(r12)
            android.app.NotificationManager r6 = (android.app.NotificationManager) r6
            android.app.Notification r4 = new android.app.Notification
            r12 = 17301516(0x108000c, float:2.4979289E-38)
            long r13 = java.lang.System.currentTimeMillis()
            r4.<init>(r12, r3, r13)
            int r12 = r4.flags
            r12 = r12 | 16
            r4.flags = r12
            r0 = r18
            r4.setLatestEventInfo(r0, r11, r3, r9)
            r6.notify(r5, r4)
            goto L_0x006e
        L_0x00f7:
            java.lang.String r12 = "%1$d Gold earned via %2$s!"
            r13 = 2
            java.lang.Object[] r13 = new java.lang.Object[r13]
            r14 = 0
            java.lang.Long r15 = java.lang.Long.valueOf(r20)
            r13[r14] = r15
            r14 = 1
            r13[r14] = r10
            java.lang.String r3 = java.lang.String.format(r12, r13)
            java.lang.String r12 = "Return to %1$s"
            r13 = 1
            java.lang.Object[] r13 = new java.lang.Object[r13]
            r14 = 0
            r13[r14] = r10
            java.lang.String r11 = java.lang.String.format(r12, r13)
            java.lang.String r12 = "showEarnedFromPurchaseNotification_%1$s"
            r13 = 1
            java.lang.Object[] r13 = new java.lang.Object[r13]
            r14 = 0
            r13[r14] = r19
            java.lang.String r12 = java.lang.String.format(r12, r13)
            int r5 = r12.hashCode()
            goto L_0x00c5
        L_0x0127:
            android.content.Intent r2 = com.getjar.sdk.data.RedemptionEngine.buildShowWalletIntent(r18)
            if (r2 == 0) goto L_0x0137
            r12 = 0
            r13 = 134217728(0x8000000, float:3.85186E-34)
            r0 = r18
            android.app.PendingIntent r9 = android.app.PendingIntent.getActivity(r0, r12, r2, r13)
            goto L_0x00d1
        L_0x0137:
            r12 = 0
            android.content.Intent r13 = new android.content.Intent
            r13.<init>()
            r14 = 134217728(0x8000000, float:3.85186E-34)
            r0 = r18
            android.app.PendingIntent r9 = android.app.PendingIntent.getActivity(r0, r12, r13, r14)
            goto L_0x00d1
        */
        throw new UnsupportedOperationException("Method not decompiled: com.getjar.sdk.utilities.NotificationsUtility.showEarnedFromPurchaseNotification(android.content.Context, java.lang.String, long):void");
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
            launchIntent = new Intent("android.intent.action.VIEW", Uri.parse(String.format(Locale.US, _MarketURLFormat, new Object[]{Constants.GREENJAR_PACKAGE})));
            message = "Please install Getjar Rewards to claim your unredeemed deal.";
        } else {
            Logger.d(Area.UI.value() | Area.REDEEM.value() | Area.OFFER.value(), "NotificationsUtility: showRedeemReminderNotification() Rewards installed, sending open reminder");
            message = "Open your Getjar Wallet to redeem";
        }
        Notification notification = new Notification(17301516, message, System.currentTimeMillis());
        notification.flags |= 16;
        notification.setLatestEventInfo(context, "Redeem your deal", message, PendingIntent.getActivity(context, 0, launchIntent, 134217728));
        ((NotificationManager) context.getSystemService("notification")).notify(GamesActivityResultCodes.RESULT_RECONNECT_REQUIRED, notification);
    }

    public static boolean showOpenNotification(Context context, String packageName, String appName) {
        if (context == null) {
            throw new IllegalArgumentException("'context' cannot be NULL");
        } else if (StringUtility.isNullOrEmpty(packageName)) {
            throw new IllegalArgumentException("'packageName' cannot be NULL or empty");
        } else if (StringUtility.isNullOrEmpty(appName)) {
            throw new IllegalArgumentException("'appName' cannot be NULL or empty");
        } else {
            Logger.d(Area.EARN.value() | Area.TRANSACTION.value() | Area.UI.value(), String.format(Locale.US, "NotificationsUtility: showOpenNotification() '%1$s'", new Object[]{packageName}));
            if (packageName.equals(Constants.GREENJAR_PACKAGE)) {
                return false;
            }
            Intent launchIntent = context.getApplicationContext().getPackageManager().getLaunchIntentForPackage(packageName);
            if (launchIntent == null) {
                Logger.w(Area.EARN.value() | Area.TRANSACTION.value() | Area.UI.value(), String.format(Locale.US, "NotificationsUtility showOpenNotification() '%1$s' has been uninstalled, skipping OPEN notification", new Object[]{packageName}));
                return false;
            }
            launchIntent.addCategory("android.intent.category.LAUNCHER");
            launchIntent.setFlags(270532608);
            launchIntent.putExtra(Constants.EXTRA_WEBVIEW, true);
            int NOTIFICATION_ID = getNotificationId(packageName, NotificationType.OPEN_REMINDER);
            Notification notification = new Notification(17301516, String.format(Locale.US, "Open %s to earn Getjar gold", new Object[]{appName}), System.currentTimeMillis());
            notification.flags |= 16;
            notification.setLatestEventInfo(context, appName, "Open this app to get Getjar Gold", PendingIntent.getActivity(context, 0, launchIntent, 0));
            ((NotificationManager) context.getSystemService("notification")).notify(NOTIFICATION_ID, notification);
            return true;
        }
    }

    public static void showInstallNotification(Context context, String packageName, String appName) {
        if (context == null) {
            throw new IllegalArgumentException("'context' cannot be NULL");
        } else if (StringUtility.isNullOrEmpty(packageName)) {
            throw new IllegalArgumentException("'packageName' cannot be NULL or empty");
        } else if (StringUtility.isNullOrEmpty(appName)) {
            throw new IllegalArgumentException("'appName' cannot be NULL or empty");
        } else {
            Logger.d(Area.EARN.value() | Area.TRANSACTION.value() | Area.UI.value(), String.format(Locale.US, "NotificationsUtility: showInstallNotification() '%1$s'", new Object[]{packageName}));
            if (!packageName.equals(Constants.GREENJAR_PACKAGE)) {
                Intent googPlayIntent = new Intent("android.intent.action.VIEW", Uri.parse(String.format(Locale.US, _MarketURLFormat, new Object[]{packageName})));
                googPlayIntent.addFlags(DriveFile.MODE_READ_ONLY);
                googPlayIntent.addFlags(134217728);
                googPlayIntent.addFlags(1073741824);
                int NOTIFICATION_ID = getNotificationId(packageName, NotificationType.INSTALL_REMINDER);
                Notification notification = new Notification(17301516, String.format(Locale.US, "Install and open %s to earn Getjar gold", new Object[]{appName}), System.currentTimeMillis());
                notification.flags |= 16;
                notification.setLatestEventInfo(context, appName, "Install and open this app to get Getjar Gold", PendingIntent.getActivity(context, 0, googPlayIntent, 0));
                ((NotificationManager) context.getSystemService("notification")).notify(NOTIFICATION_ID, notification);
            }
        }
    }

    public static void clearInstallNotification(Context context, String packageName) {
        if (context == null) {
            throw new IllegalArgumentException("'context' cannot be NULL");
        } else if (StringUtility.isNullOrEmpty(packageName)) {
            throw new IllegalArgumentException("'packageName' cannot be NULL or empty");
        } else {
            Logger.d(Area.EARN.value() | Area.TRANSACTION.value() | Area.UI.value(), String.format(Locale.US, "NotificationsUtility: clearInstallNotification() '%1$s'", new Object[]{packageName}));
            ((NotificationManager) context.getSystemService("notification")).cancel(getNotificationId(packageName, NotificationType.INSTALL_REMINDER));
        }
    }

    public static void clearOpenNotification(Context context, String packageName) {
        if (context == null) {
            throw new IllegalArgumentException("'context' cannot be NULL");
        } else if (StringUtility.isNullOrEmpty(packageName)) {
            throw new IllegalArgumentException("'packageName' cannot be NULL or empty");
        } else {
            Logger.d(Area.EARN.value() | Area.TRANSACTION.value() | Area.UI.value(), String.format(Locale.US, "NotificationsUtility: clearOpenNotification() '%1$s'", new Object[]{packageName}));
            ((NotificationManager) context.getSystemService("notification")).cancel(getNotificationId(packageName, NotificationType.OPEN_REMINDER));
        }
    }

    public static void pushFailNotification(CommContext context, String message) {
        try {
            Logger.d(Area.EARN.value() | Area.TRANSACTION.value() | Area.UI.value(), "Send Fail Notification");
            PackageManager packageManager = context.getApplicationContext().getPackageManager();
            CharSequence textMsg = String.format(Locale.US, message, new Object[]{(String) packageManager.getPackageInfo(context.getApplicationContext().getPackageName(), 128).applicationInfo.loadLabel(packageManager)});
            Notification notification = new Notification(17301516, textMsg, System.currentTimeMillis());
            notification.flags |= 16;
            new Intent("android.intent.action.MAIN");
            Intent notificationIntent = packageManager.getLaunchIntentForPackage(context.getApplicationContext().getPackageName());
            notificationIntent.addCategory("android.intent.category.LAUNCHER");
            notificationIntent.setFlags(270532608);
            notificationIntent.putExtra(Constants.EXTRA_WEBVIEW, true);
            notificationIntent.putExtra(Constants.EXTRA_GETJAR_NOTIFICATION, true);
            notification.setLatestEventInfo(context.getApplicationContext(), textMsg, "Return to " + packageManager.getPackageInfo(context.getApplicationContext().getPackageName(), 128).applicationInfo.loadLabel(packageManager), PendingIntent.getActivity(context.getApplicationContext(), 0, notificationIntent, 0));
            ((NotificationManager) context.getApplicationContext().getSystemService("notification")).notify(0, notification);
        } catch (Exception e) {
            Logger.e(Area.EARN.value() | Area.TRANSACTION.value() | Area.UI.value(), "pushFailNotification() failed", e);
        }
    }

    public static void pushSuccessNotification(CommContext context, String message) {
        try {
            Logger.d(Area.EARN.value() | Area.TRANSACTION.value() | Area.UI.value(), "Send Success Notification");
            PackageManager packageManager = context.getApplicationContext().getPackageManager();
            NotificationManager notificationMng = (NotificationManager) context.getApplicationContext().getSystemService("notification");
            Notification notification = new Notification(17301516, message, System.currentTimeMillis());
            notification.flags |= 16;
            CharSequence contentTitle = message;
            CharSequence contentText = "Return to " + ((String) packageManager.getPackageInfo(context.getApplicationContext().getPackageName(), 128).applicationInfo.loadLabel(packageManager));
            String launchActivity = "";
            Intent i = new Intent("android.intent.action.MAIN");
            i.addCategory("android.intent.category.LAUNCHER");
            Iterator i$ = packageManager.queryIntentActivities(i, 0).iterator();
            while (true) {
                if (!i$.hasNext()) {
                    break;
                }
                ResolveInfo app = i$.next();
                if (app.activityInfo.packageName.equals(context.getApplicationContext().getPackageName())) {
                    launchActivity = app.activityInfo.name;
                    String hostApplicationName = (String) app.activityInfo.loadLabel(packageManager);
                    break;
                }
            }
            Intent intent = new Intent("android.intent.action.MAIN", (Uri) null);
            intent.addCategory("android.intent.category.LAUNCHER");
            intent.setComponent(new ComponentName(context.getApplicationContext().getPackageName(), launchActivity));
            intent.setFlags(335544320);
            intent.putExtra(Constants.EXTRA_WEBVIEW, true);
            intent.putExtra(Constants.EXTRA_GETJAR_NOTIFICATION, true);
            notification.setLatestEventInfo(context.getApplicationContext(), contentTitle, contentText, PendingIntent.getActivity(context.getApplicationContext(), 0, intent, 0));
            notificationMng.notify(0, notification);
        } catch (Exception e) {
            Logger.e(Area.EARN.value() | Area.TRANSACTION.value() | Area.UI.value(), "pushSuccessNotification() failed", e);
        }
    }
}
