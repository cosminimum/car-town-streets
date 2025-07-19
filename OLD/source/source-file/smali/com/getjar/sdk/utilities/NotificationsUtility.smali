.class public Lcom/getjar/sdk/utilities/NotificationsUtility;
.super Ljava/lang/Object;
.source "NotificationsUtility.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/getjar/sdk/utilities/NotificationsUtility$NotificationType;
    }
.end annotation


# static fields
.field private static final _MarketURLFormat:Ljava/lang/String; = "market://details?id=%1$s"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    return-void
.end method

.method public static clearInstallNotification(Landroid/content/Context;Ljava/lang/String;)V
    .locals 8
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "packageName"    # Ljava/lang/String;

    .prologue
    .line 238
    if-nez p0, :cond_0

    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "\'context\' cannot be NULL"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 239
    :cond_0
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "\'packageName\' cannot be NULL or empty"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 241
    :cond_1
    sget-object v2, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    sget-object v4, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "NotificationsUtility: clearInstallNotification() \'%1$s\'"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object p1, v6, v7

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 243
    sget-object v2, Lcom/getjar/sdk/utilities/NotificationsUtility$NotificationType;->INSTALL_REMINDER:Lcom/getjar/sdk/utilities/NotificationsUtility$NotificationType;

    invoke-static {p1, v2}, Lcom/getjar/sdk/utilities/NotificationsUtility;->getNotificationId(Ljava/lang/String;Lcom/getjar/sdk/utilities/NotificationsUtility$NotificationType;)I

    move-result v0

    .line 244
    .local v0, "NOTIFICATION_ID":I
    const-string v2, "notification"

    invoke-virtual {p0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/NotificationManager;

    .line 245
    .local v1, "notifManager":Landroid/app/NotificationManager;
    invoke-virtual {v1, v0}, Landroid/app/NotificationManager;->cancel(I)V

    .line 246
    return-void
.end method

.method public static clearOpenNotification(Landroid/content/Context;Ljava/lang/String;)V
    .locals 8
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "packageName"    # Ljava/lang/String;

    .prologue
    .line 250
    if-nez p0, :cond_0

    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "\'context\' cannot be NULL"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 251
    :cond_0
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "\'packageName\' cannot be NULL or empty"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 253
    :cond_1
    sget-object v2, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    sget-object v4, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "NotificationsUtility: clearOpenNotification() \'%1$s\'"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object p1, v6, v7

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 255
    sget-object v2, Lcom/getjar/sdk/utilities/NotificationsUtility$NotificationType;->OPEN_REMINDER:Lcom/getjar/sdk/utilities/NotificationsUtility$NotificationType;

    invoke-static {p1, v2}, Lcom/getjar/sdk/utilities/NotificationsUtility;->getNotificationId(Ljava/lang/String;Lcom/getjar/sdk/utilities/NotificationsUtility$NotificationType;)I

    move-result v0

    .line 256
    .local v0, "NOTIFICATION_ID":I
    const-string v2, "notification"

    invoke-virtual {p0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/NotificationManager;

    .line 257
    .local v1, "notifManager":Landroid/app/NotificationManager;
    invoke-virtual {v1, v0}, Landroid/app/NotificationManager;->cancel(I)V

    .line 258
    return-void
.end method

.method private static getNotificationId(Ljava/lang/String;Lcom/getjar/sdk/utilities/NotificationsUtility$NotificationType;)I
    .locals 5
    .param p0, "packageName"    # Ljava/lang/String;
    .param p1, "type"    # Lcom/getjar/sdk/utilities/NotificationsUtility$NotificationType;

    .prologue
    .line 30
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "%1$s.%2$s"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p0, v2, v3

    const/4 v3, 0x1

    invoke-virtual {p1}, Lcom/getjar/sdk/utilities/NotificationsUtility$NotificationType;->name()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0
.end method

.method public static pushFailNotification(Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;)V
    .locals 16
    .param p0, "context"    # Lcom/getjar/sdk/comm/CommContext;
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 268
    :try_start_0
    sget-object v12, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v12}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v12

    sget-object v14, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v14}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v14

    or-long/2addr v12, v14

    sget-object v14, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v14}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v14

    or-long/2addr v12, v14

    const-string v14, "Send Fail Notification"

    invoke-static {v12, v13, v14}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 271
    invoke-virtual/range {p0 .. p0}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v12

    invoke-virtual {v12}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v10

    .line 272
    .local v10, "packageManager":Landroid/content/pm/PackageManager;
    invoke-virtual/range {p0 .. p0}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v12

    invoke-virtual {v12}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v12

    const/16 v13, 0x80

    invoke-virtual {v10, v12, v13}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v9

    .line 273
    .local v9, "packageInfo":Landroid/content/pm/PackageInfo;
    iget-object v12, v9, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    invoke-virtual {v12, v10}, Landroid/content/pm/ApplicationInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 276
    .local v5, "hostApplicationName":Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v12

    const-string v13, "notification"

    invoke-virtual {v12, v13}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/app/NotificationManager;

    .line 277
    .local v8, "notificationMng":Landroid/app/NotificationManager;
    sget-object v12, Ljava/util/Locale;->US:Ljava/util/Locale;

    const/4 v13, 0x1

    new-array v13, v13, [Ljava/lang/Object;

    const/4 v14, 0x0

    aput-object v5, v13, v14

    move-object/from16 v0, p1

    invoke-static {v12, v0, v13}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    .line 280
    .local v11, "textMsg":Ljava/lang/String;
    new-instance v6, Landroid/app/Notification;

    const v12, 0x108000c

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v13

    invoke-direct {v6, v12, v11, v13, v14}, Landroid/app/Notification;-><init>(ILjava/lang/CharSequence;J)V

    .line 281
    .local v6, "notification":Landroid/app/Notification;
    iget v12, v6, Landroid/app/Notification;->flags:I

    or-int/lit8 v12, v12, 0x10

    iput v12, v6, Landroid/app/Notification;->flags:I

    .line 282
    move-object v3, v11

    .line 283
    .local v3, "contentTitle":Ljava/lang/CharSequence;
    new-instance v12, Ljava/lang/StringBuilder;

    const-string v13, "Return to "

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {p0 .. p0}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v13

    invoke-virtual {v13}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v13

    const/16 v14, 0x80

    invoke-virtual {v10, v13, v14}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v13

    iget-object v13, v13, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    invoke-virtual {v13, v10}, Landroid/content/pm/ApplicationInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 286
    .local v2, "contentText":Ljava/lang/CharSequence;
    new-instance v7, Landroid/content/Intent;

    const-string v12, "android.intent.action.MAIN"

    invoke-direct {v7, v12}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 287
    .local v7, "notificationIntent":Landroid/content/Intent;
    invoke-virtual/range {p0 .. p0}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v12

    invoke-virtual {v12}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v10, v12}, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v7

    .line 288
    const-string v12, "android.intent.category.LAUNCHER"

    invoke-virtual {v7, v12}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 289
    const/high16 v12, 0x10200000

    invoke-virtual {v7, v12}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 290
    const-string v12, "com.getjar.sdk.rewards.GetJarWebViewSubActivity"

    const/4 v13, 0x1

    invoke-virtual {v7, v12, v13}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 291
    const-string v12, "GETJAR_NOTIFICATION"

    const/4 v13, 0x1

    invoke-virtual {v7, v12, v13}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 293
    invoke-virtual/range {p0 .. p0}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v12

    const/4 v13, 0x0

    const/4 v14, 0x0

    invoke-static {v12, v13, v7, v14}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v1

    .line 294
    .local v1, "contentIntent":Landroid/app/PendingIntent;
    invoke-virtual/range {p0 .. p0}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v12

    invoke-virtual {v6, v12, v3, v2, v1}, Landroid/app/Notification;->setLatestEventInfo(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Landroid/app/PendingIntent;)V

    .line 297
    const/4 v12, 0x0

    invoke-virtual {v8, v12, v6}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 304
    .end local v1    # "contentIntent":Landroid/app/PendingIntent;
    .end local v2    # "contentText":Ljava/lang/CharSequence;
    .end local v3    # "contentTitle":Ljava/lang/CharSequence;
    .end local v5    # "hostApplicationName":Ljava/lang/String;
    .end local v6    # "notification":Landroid/app/Notification;
    .end local v7    # "notificationIntent":Landroid/content/Intent;
    .end local v8    # "notificationMng":Landroid/app/NotificationManager;
    .end local v9    # "packageInfo":Landroid/content/pm/PackageInfo;
    .end local v10    # "packageManager":Landroid/content/pm/PackageManager;
    .end local v11    # "textMsg":Ljava/lang/String;
    :goto_0
    return-void

    .line 299
    :catch_0
    move-exception v4

    .line 302
    .local v4, "e":Ljava/lang/Exception;
    sget-object v12, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v12}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v12

    sget-object v14, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v14}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v14

    or-long/2addr v12, v14

    sget-object v14, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v14}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v14

    or-long/2addr v12, v14

    const-string v14, "pushFailNotification() failed"

    invoke-static {v12, v13, v14, v4}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public static pushSuccessNotification(Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;)V
    .locals 24
    .param p0, "context"    # Lcom/getjar/sdk/comm/CommContext;
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 315
    :try_start_0
    sget-object v20, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v20 .. v20}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v20

    sget-object v22, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v22 .. v22}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v22

    or-long v20, v20, v22

    sget-object v22, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v22 .. v22}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v22

    or-long v20, v20, v22

    const-string v22, "Send Success Notification"

    invoke-static/range {v20 .. v22}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 318
    invoke-virtual/range {p0 .. p0}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v19

    .line 319
    .local v19, "packageManager":Landroid/content/pm/PackageManager;
    invoke-virtual/range {p0 .. p0}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v20

    const/16 v21, 0x80

    invoke-virtual/range {v19 .. v21}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v18

    .line 320
    .local v18, "packageInfo":Landroid/content/pm/PackageInfo;
    move-object/from16 v0, v18

    iget-object v0, v0, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Landroid/content/pm/ApplicationInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    .line 323
    .local v11, "hostApplicationName":Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v20

    const-string v21, "notification"

    invoke-virtual/range {v20 .. v21}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Landroid/app/NotificationManager;

    .line 326
    .local v17, "notificationMng":Landroid/app/NotificationManager;
    new-instance v15, Landroid/app/Notification;

    const v20, 0x108000c

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v21

    move/from16 v0, v20

    move-object/from16 v1, p1

    move-wide/from16 v2, v21

    invoke-direct {v15, v0, v1, v2, v3}, Landroid/app/Notification;-><init>(ILjava/lang/CharSequence;J)V

    .line 327
    .local v15, "notification":Landroid/app/Notification;
    iget v0, v15, Landroid/app/Notification;->flags:I

    move/from16 v20, v0

    or-int/lit8 v20, v20, 0x10

    move/from16 v0, v20

    iput v0, v15, Landroid/app/Notification;->flags:I

    .line 328
    move-object/from16 v9, p1

    .line 329
    .local v9, "contentTitle":Ljava/lang/CharSequence;
    new-instance v20, Ljava/lang/StringBuilder;

    const-string v21, "Return to "

    invoke-direct/range {v20 .. v21}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v20

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 332
    .local v8, "contentText":Ljava/lang/CharSequence;
    const-string v14, ""

    .line 333
    .local v14, "launchActivity":Ljava/lang/String;
    new-instance v12, Landroid/content/Intent;

    const-string v20, "android.intent.action.MAIN"

    move-object/from16 v0, v20

    invoke-direct {v12, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 334
    .local v12, "i":Landroid/content/Intent;
    const-string v20, "android.intent.category.LAUNCHER"

    move-object/from16 v0, v20

    invoke-virtual {v12, v0}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 335
    const/16 v20, 0x0

    move-object/from16 v0, v19

    move/from16 v1, v20

    invoke-virtual {v0, v12, v1}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v5

    .line 336
    .local v5, "appList":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v13

    .local v13, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v20

    if-eqz v20, :cond_1

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/content/pm/ResolveInfo;

    .line 337
    .local v4, "app":Landroid/content/pm/ResolveInfo;
    iget-object v0, v4, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget-object v0, v0, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    move-object/from16 v20, v0

    invoke-virtual/range {p0 .. p0}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v20

    if-eqz v20, :cond_0

    .line 338
    iget-object v0, v4, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget-object v14, v0, Landroid/content/pm/ActivityInfo;->name:Ljava/lang/String;

    .line 339
    iget-object v0, v4, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Landroid/content/pm/ActivityInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object v11

    .end local v11    # "hostApplicationName":Ljava/lang/String;
    check-cast v11, Ljava/lang/String;

    .line 343
    .end local v4    # "app":Landroid/content/pm/ResolveInfo;
    .restart local v11    # "hostApplicationName":Ljava/lang/String;
    :cond_1
    new-instance v16, Landroid/content/Intent;

    const-string v20, "android.intent.action.MAIN"

    const/16 v21, 0x0

    move-object/from16 v0, v16

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 344
    .local v16, "notificationIntent":Landroid/content/Intent;
    const-string v20, "android.intent.category.LAUNCHER"

    move-object/from16 v0, v16

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 345
    new-instance v6, Landroid/content/ComponentName;

    invoke-virtual/range {p0 .. p0}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-direct {v6, v0, v14}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 346
    .local v6, "cn":Landroid/content/ComponentName;
    move-object/from16 v0, v16

    invoke-virtual {v0, v6}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 347
    const/high16 v20, 0x14000000

    move-object/from16 v0, v16

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 348
    const-string v20, "com.getjar.sdk.rewards.GetJarWebViewSubActivity"

    const/16 v21, 0x1

    move-object/from16 v0, v16

    move-object/from16 v1, v20

    move/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 349
    const-string v20, "GETJAR_NOTIFICATION"

    const/16 v21, 0x1

    move-object/from16 v0, v16

    move-object/from16 v1, v20

    move/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 351
    invoke-virtual/range {p0 .. p0}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v20

    const/16 v21, 0x0

    const/16 v22, 0x0

    move-object/from16 v0, v20

    move/from16 v1, v21

    move-object/from16 v2, v16

    move/from16 v3, v22

    invoke-static {v0, v1, v2, v3}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v7

    .line 352
    .local v7, "contentIntent":Landroid/app/PendingIntent;
    invoke-virtual/range {p0 .. p0}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v15, v0, v9, v8, v7}, Landroid/app/Notification;->setLatestEventInfo(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Landroid/app/PendingIntent;)V

    .line 355
    const/16 v20, 0x0

    move-object/from16 v0, v17

    move/from16 v1, v20

    invoke-virtual {v0, v1, v15}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 362
    .end local v5    # "appList":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    .end local v6    # "cn":Landroid/content/ComponentName;
    .end local v7    # "contentIntent":Landroid/app/PendingIntent;
    .end local v8    # "contentText":Ljava/lang/CharSequence;
    .end local v9    # "contentTitle":Ljava/lang/CharSequence;
    .end local v11    # "hostApplicationName":Ljava/lang/String;
    .end local v12    # "i":Landroid/content/Intent;
    .end local v13    # "i$":Ljava/util/Iterator;
    .end local v14    # "launchActivity":Ljava/lang/String;
    .end local v15    # "notification":Landroid/app/Notification;
    .end local v16    # "notificationIntent":Landroid/content/Intent;
    .end local v17    # "notificationMng":Landroid/app/NotificationManager;
    .end local v18    # "packageInfo":Landroid/content/pm/PackageInfo;
    .end local v19    # "packageManager":Landroid/content/pm/PackageManager;
    :goto_0
    return-void

    .line 357
    :catch_0
    move-exception v10

    .line 360
    .local v10, "e":Ljava/lang/Exception;
    sget-object v20, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v20 .. v20}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v20

    sget-object v22, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v22 .. v22}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v22

    or-long v20, v20, v22

    sget-object v22, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v22 .. v22}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v22

    or-long v20, v20, v22

    const-string v22, "pushSuccessNotification() failed"

    move-wide/from16 v0, v20

    move-object/from16 v2, v22

    invoke-static {v0, v1, v2, v10}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public static showEarnedFromPurchaseNotification(Landroid/content/Context;Ljava/lang/String;J)V
    .locals 18
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "targetPackageName"    # Ljava/lang/String;
    .param p2, "amount"    # J

    .prologue
    .line 44
    if-nez p0, :cond_0

    new-instance v12, Ljava/lang/IllegalArgumentException;

    const-string v13, "\'context\' cannot be NULL"

    invoke-direct {v12, v13}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v12

    .line 45
    :cond_0
    const-wide/16 v12, 0x0

    cmp-long v12, p2, v12

    if-gtz v12, :cond_1

    new-instance v12, Ljava/lang/IllegalArgumentException;

    const-string v13, "\'amount\' cannot be less than zero"

    invoke-direct {v12, v13}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v12

    .line 47
    :cond_1
    sget-object v12, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v12}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v12

    sget-object v14, Lcom/getjar/sdk/logging/Area;->REDEEM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v14}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v14

    or-long/2addr v12, v14

    sget-object v14, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v14}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v14

    or-long/2addr v12, v14

    const-string v14, "NotificationsUtility: showRedeemReminderNotification() START [targetPackageName:%1$s amount:%2$d]"

    const/4 v15, 0x2

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    aput-object p1, v15, v16

    const/16 v16, 0x1

    invoke-static/range {p2 .. p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v17

    aput-object v17, v15, v16

    invoke-static {v14, v15}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    invoke-static {v12, v13, v14}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 53
    const/4 v2, 0x0

    .line 54
    .local v2, "launchIntent":Landroid/content/Intent;
    const/4 v10, 0x0

    .line 55
    .local v10, "targetApplicationName":Ljava/lang/String;
    invoke-static/range {p1 .. p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v12

    if-nez v12, :cond_3

    .line 58
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v12

    invoke-virtual {v12}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v8

    .line 60
    .local v8, "packageManager":Landroid/content/pm/PackageManager;
    const/16 v12, 0x80

    :try_start_0
    move-object/from16 v0, p1

    invoke-virtual {v8, v0, v12}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v7

    .line 61
    .local v7, "packageInfo":Landroid/content/pm/PackageInfo;
    iget-object v12, v7, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    invoke-virtual {v12, v8}, Landroid/content/pm/ApplicationInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object v12

    move-object v0, v12

    check-cast v0, Ljava/lang/String;

    move-object v10, v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 67
    .end local v7    # "packageInfo":Landroid/content/pm/PackageInfo;
    :goto_0
    move-object/from16 v0, p1

    invoke-virtual {v8, v0}, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v2

    .line 68
    if-nez v2, :cond_2

    .line 115
    .end local v8    # "packageManager":Landroid/content/pm/PackageManager;
    :goto_1
    return-void

    .line 62
    .restart local v8    # "packageManager":Landroid/content/pm/PackageManager;
    :catch_0
    move-exception v1

    .line 63
    .local v1, "e":Ljava/lang/Exception;
    sget-object v12, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v12}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v12

    sget-object v14, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v14}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v14

    or-long/2addr v12, v14

    const-string v14, "NotificationsUtility: showRedeemReminderNotification() Failed to get the name of the target app"

    invoke-static {v12, v13, v14, v1}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 69
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_2
    const-string v12, "GETJAR_NOTIFICATION"

    const/4 v13, 0x1

    invoke-virtual {v2, v12, v13}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 70
    const-string v12, "android.intent.category.LAUNCHER"

    invoke-virtual {v2, v12}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 71
    const/high16 v12, 0x34200000

    invoke-virtual {v2, v12}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 78
    .end local v8    # "packageManager":Landroid/content/pm/PackageManager;
    :cond_3
    invoke-static/range {p1 .. p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v12

    if-nez v12, :cond_4

    invoke-static {v10}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_5

    .line 79
    :cond_4
    const-string v12, "%1$d Gold earned for purchase!"

    const/4 v13, 0x1

    new-array v13, v13, [Ljava/lang/Object;

    const/4 v14, 0x0

    invoke-static/range {p2 .. p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v15

    aput-object v15, v13, v14

    invoke-static {v12, v13}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 80
    .local v3, "message":Ljava/lang/String;
    const-string v11, "Open the Getjar Wallet to view"

    .line 81
    .local v11, "title":Ljava/lang/String;
    const-string v12, "showEarnedFromPurchaseNotification_%1$d"

    const/4 v13, 0x1

    new-array v13, v13, [Ljava/lang/Object;

    const/4 v14, 0x0

    invoke-static/range {p2 .. p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v15

    aput-object v15, v13, v14

    invoke-static {v12, v13}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/String;->hashCode()I

    move-result v5

    .line 89
    .local v5, "notificationId":I
    :goto_2
    const/4 v9, 0x0

    .line 90
    .local v9, "pendingIntent":Landroid/app/PendingIntent;
    if-eqz v2, :cond_6

    .line 93
    const/4 v12, 0x0

    const/high16 v13, 0x8000000

    move-object/from16 v0, p0

    invoke-static {v0, v12, v2, v13}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v9

    .line 110
    :goto_3
    const-string v12, "notification"

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/app/NotificationManager;

    .line 111
    .local v6, "notificationManager":Landroid/app/NotificationManager;
    new-instance v4, Landroid/app/Notification;

    const v12, 0x108000c

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v13

    invoke-direct {v4, v12, v3, v13, v14}, Landroid/app/Notification;-><init>(ILjava/lang/CharSequence;J)V

    .line 112
    .local v4, "notification":Landroid/app/Notification;
    iget v12, v4, Landroid/app/Notification;->flags:I

    or-int/lit8 v12, v12, 0x10

    iput v12, v4, Landroid/app/Notification;->flags:I

    .line 113
    move-object/from16 v0, p0

    invoke-virtual {v4, v0, v11, v3, v9}, Landroid/app/Notification;->setLatestEventInfo(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Landroid/app/PendingIntent;)V

    .line 114
    invoke-virtual {v6, v5, v4}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    goto/16 :goto_1

    .line 83
    .end local v3    # "message":Ljava/lang/String;
    .end local v4    # "notification":Landroid/app/Notification;
    .end local v5    # "notificationId":I
    .end local v6    # "notificationManager":Landroid/app/NotificationManager;
    .end local v9    # "pendingIntent":Landroid/app/PendingIntent;
    .end local v11    # "title":Ljava/lang/String;
    :cond_5
    const-string v12, "%1$d Gold earned via %2$s!"

    const/4 v13, 0x2

    new-array v13, v13, [Ljava/lang/Object;

    const/4 v14, 0x0

    invoke-static/range {p2 .. p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v15

    aput-object v15, v13, v14

    const/4 v14, 0x1

    aput-object v10, v13, v14

    invoke-static {v12, v13}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 84
    .restart local v3    # "message":Ljava/lang/String;
    const-string v12, "Return to %1$s"

    const/4 v13, 0x1

    new-array v13, v13, [Ljava/lang/Object;

    const/4 v14, 0x0

    aput-object v10, v13, v14

    invoke-static {v12, v13}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    .line 85
    .restart local v11    # "title":Ljava/lang/String;
    const-string v12, "showEarnedFromPurchaseNotification_%1$s"

    const/4 v13, 0x1

    new-array v13, v13, [Ljava/lang/Object;

    const/4 v14, 0x0

    aput-object p1, v13, v14

    invoke-static {v12, v13}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/String;->hashCode()I

    move-result v5

    .restart local v5    # "notificationId":I
    goto :goto_2

    .line 96
    .restart local v9    # "pendingIntent":Landroid/app/PendingIntent;
    :cond_6
    invoke-static/range {p0 .. p0}, Lcom/getjar/sdk/data/RedemptionEngine;->buildShowWalletIntent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v2

    .line 97
    if-eqz v2, :cond_7

    .line 100
    const/4 v12, 0x0

    const/high16 v13, 0x8000000

    move-object/from16 v0, p0

    invoke-static {v0, v12, v2, v13}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v9

    goto :goto_3

    .line 105
    :cond_7
    const/4 v12, 0x0

    new-instance v13, Landroid/content/Intent;

    invoke-direct {v13}, Landroid/content/Intent;-><init>()V

    const/high16 v14, 0x8000000

    move-object/from16 v0, p0

    invoke-static {v0, v12, v13, v14}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v9

    goto :goto_3
.end method

.method public static showInstallNotification(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 13
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "appName"    # Ljava/lang/String;

    .prologue
    .line 206
    if-nez p0, :cond_0

    new-instance v7, Ljava/lang/IllegalArgumentException;

    const-string v8, "\'context\' cannot be NULL"

    invoke-direct {v7, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 207
    :cond_0
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1

    new-instance v7, Ljava/lang/IllegalArgumentException;

    const-string v8, "\'packageName\' cannot be NULL or empty"

    invoke-direct {v7, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 208
    :cond_1
    invoke-static {p2}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_2

    new-instance v7, Ljava/lang/IllegalArgumentException;

    const-string v8, "\'appName\' cannot be NULL or empty"

    invoke-direct {v7, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 210
    :cond_2
    sget-object v7, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    sget-object v9, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v9}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v9

    or-long/2addr v7, v9

    sget-object v9, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v9}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v9

    or-long/2addr v7, v9

    sget-object v9, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v10, "NotificationsUtility: showInstallNotification() \'%1$s\'"

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    aput-object p1, v11, v12

    invoke-static {v9, v10, v11}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v7, v8, v9}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 212
    const-string v7, "com.getjar.rewards"

    invoke-virtual {p1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 234
    :goto_0
    return-void

    .line 217
    :cond_3
    sget-object v7, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v8, "market://details?id=%1$s"

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    aput-object p1, v9, v10

    invoke-static {v7, v8, v9}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    .line 218
    .local v6, "url":Ljava/lang/String;
    new-instance v1, Landroid/content/Intent;

    const-string v7, "android.intent.action.VIEW"

    invoke-static {v6}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v8

    invoke-direct {v1, v7, v8}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 219
    .local v1, "googPlayIntent":Landroid/content/Intent;
    const/high16 v7, 0x10000000

    invoke-virtual {v1, v7}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 220
    const/high16 v7, 0x8000000

    invoke-virtual {v1, v7}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 221
    const/high16 v7, 0x40000000    # 2.0f

    invoke-virtual {v1, v7}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 224
    sget-object v7, Lcom/getjar/sdk/utilities/NotificationsUtility$NotificationType;->INSTALL_REMINDER:Lcom/getjar/sdk/utilities/NotificationsUtility$NotificationType;

    invoke-static {p1, v7}, Lcom/getjar/sdk/utilities/NotificationsUtility;->getNotificationId(Ljava/lang/String;Lcom/getjar/sdk/utilities/NotificationsUtility$NotificationType;)I

    move-result v0

    .line 225
    .local v0, "NOTIFICATION_ID":I
    sget-object v7, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v8, "Install and open %s to earn Getjar gold"

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    aput-object p2, v9, v10

    invoke-static {v7, v8, v9}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 226
    .local v3, "message":Ljava/lang/String;
    const-string v7, "notification"

    invoke-virtual {p0, v7}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/app/NotificationManager;

    .line 227
    .local v4, "notifManager":Landroid/app/NotificationManager;
    new-instance v5, Landroid/app/Notification;

    const v7, 0x108000c

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    invoke-direct {v5, v7, v3, v8, v9}, Landroid/app/Notification;-><init>(ILjava/lang/CharSequence;J)V

    .line 228
    .local v5, "notification":Landroid/app/Notification;
    iget v7, v5, Landroid/app/Notification;->flags:I

    or-int/lit8 v7, v7, 0x10

    iput v7, v5, Landroid/app/Notification;->flags:I

    .line 231
    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-static {p0, v7, v1, v8}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v2

    .line 232
    .local v2, "intent":Landroid/app/PendingIntent;
    const-string v7, "Install and open this app to get Getjar Gold"

    invoke-virtual {v5, p0, p2, v7, v2}, Landroid/app/Notification;->setLatestEventInfo(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Landroid/app/PendingIntent;)V

    .line 233
    invoke-virtual {v4, v0, v5}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    goto :goto_0
.end method

.method public static showOpenNotification(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 13
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "appName"    # Ljava/lang/String;

    .prologue
    .line 158
    if-nez p0, :cond_0

    new-instance v7, Ljava/lang/IllegalArgumentException;

    const-string v8, "\'context\' cannot be NULL"

    invoke-direct {v7, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 159
    :cond_0
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1

    new-instance v7, Ljava/lang/IllegalArgumentException;

    const-string v8, "\'packageName\' cannot be NULL or empty"

    invoke-direct {v7, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 160
    :cond_1
    invoke-static {p2}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_2

    new-instance v7, Ljava/lang/IllegalArgumentException;

    const-string v8, "\'appName\' cannot be NULL or empty"

    invoke-direct {v7, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 162
    :cond_2
    sget-object v7, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    sget-object v9, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v9}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v9

    or-long/2addr v7, v9

    sget-object v9, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v9}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v9

    or-long/2addr v7, v9

    sget-object v9, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v10, "NotificationsUtility: showOpenNotification() \'%1$s\'"

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    aput-object p1, v11, v12

    invoke-static {v9, v10, v11}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v7, v8, v9}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 164
    const-string v7, "com.getjar.rewards"

    invoke-virtual {p1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 165
    const/4 v7, 0x0

    .line 193
    :goto_0
    return v7

    .line 169
    :cond_3
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v7

    invoke-virtual {v7}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v6

    .line 170
    .local v6, "packageManager":Landroid/content/pm/PackageManager;
    invoke-virtual {v6, p1}, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v2

    .line 171
    .local v2, "launchIntent":Landroid/content/Intent;
    if-nez v2, :cond_4

    .line 175
    sget-object v7, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    sget-object v9, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v9}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v9

    or-long/2addr v7, v9

    sget-object v9, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v9}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v9

    or-long/2addr v7, v9

    sget-object v9, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v10, "NotificationsUtility showOpenNotification() \'%1$s\' has been uninstalled, skipping OPEN notification"

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    aput-object p1, v11, v12

    invoke-static {v9, v10, v11}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v7, v8, v9}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;)V

    .line 176
    const/4 v7, 0x0

    goto :goto_0

    .line 178
    :cond_4
    const-string v7, "android.intent.category.LAUNCHER"

    invoke-virtual {v2, v7}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 179
    const/high16 v7, 0x10200000

    invoke-virtual {v2, v7}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 180
    const-string v7, "com.getjar.sdk.rewards.GetJarWebViewSubActivity"

    const/4 v8, 0x1

    invoke-virtual {v2, v7, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 183
    sget-object v7, Lcom/getjar/sdk/utilities/NotificationsUtility$NotificationType;->OPEN_REMINDER:Lcom/getjar/sdk/utilities/NotificationsUtility$NotificationType;

    invoke-static {p1, v7}, Lcom/getjar/sdk/utilities/NotificationsUtility;->getNotificationId(Ljava/lang/String;Lcom/getjar/sdk/utilities/NotificationsUtility$NotificationType;)I

    move-result v0

    .line 184
    .local v0, "NOTIFICATION_ID":I
    sget-object v7, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v8, "Open %s to earn Getjar gold"

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    aput-object p2, v9, v10

    invoke-static {v7, v8, v9}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 185
    .local v3, "message":Ljava/lang/String;
    const-string v7, "notification"

    invoke-virtual {p0, v7}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/app/NotificationManager;

    .line 186
    .local v4, "notifManager":Landroid/app/NotificationManager;
    new-instance v5, Landroid/app/Notification;

    const v7, 0x108000c

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    invoke-direct {v5, v7, v3, v8, v9}, Landroid/app/Notification;-><init>(ILjava/lang/CharSequence;J)V

    .line 187
    .local v5, "notification":Landroid/app/Notification;
    iget v7, v5, Landroid/app/Notification;->flags:I

    or-int/lit8 v7, v7, 0x10

    iput v7, v5, Landroid/app/Notification;->flags:I

    .line 190
    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-static {p0, v7, v2, v8}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v1

    .line 191
    .local v1, "intent":Landroid/app/PendingIntent;
    const-string v7, "Open this app to get Getjar Gold"

    invoke-virtual {v5, p0, p2, v7, v1}, Landroid/app/Notification;->setLatestEventInfo(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Landroid/app/PendingIntent;)V

    .line 192
    invoke-virtual {v4, v0, v5}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 193
    const/4 v7, 0x1

    goto/16 :goto_0
.end method

.method public static showRedeemReminderNotification(Landroid/content/Context;)V
    .locals 12
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v11, 0x0

    .line 123
    if-nez p0, :cond_0

    new-instance v6, Ljava/lang/IllegalArgumentException;

    const-string v7, "\'context\' cannot be NULL"

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 124
    :cond_0
    sget-object v6, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    sget-object v8, Lcom/getjar/sdk/logging/Area;->REDEEM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v8}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v8

    or-long/2addr v6, v8

    sget-object v8, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v8}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v8

    or-long/2addr v6, v8

    const-string v8, "NotificationsUtility: showRedeemReminderNotification() START"

    invoke-static {v6, v7, v8}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 127
    const-string v5, "Redeem your deal"

    .line 128
    .local v5, "title":Ljava/lang/String;
    const/4 v1, 0x0

    .line 129
    .local v1, "message":Ljava/lang/String;
    invoke-static {p0}, Lcom/getjar/sdk/data/RedemptionEngine;->buildShowWalletIntent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v0

    .line 130
    .local v0, "launchIntent":Landroid/content/Intent;
    if-nez v0, :cond_1

    .line 133
    sget-object v6, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    sget-object v8, Lcom/getjar/sdk/logging/Area;->REDEEM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v8}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v8

    or-long/2addr v6, v8

    sget-object v8, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v8}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v8

    or-long/2addr v6, v8

    const-string v8, "NotificationsUtility: showRedeemReminderNotification() Rewards not installed, sending install reminder"

    invoke-static {v6, v7, v8}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 134
    new-instance v0, Landroid/content/Intent;

    .end local v0    # "launchIntent":Landroid/content/Intent;
    const-string v6, "android.intent.action.VIEW"

    sget-object v7, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v8, "market://details?id=%1$s"

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const-string v10, "com.getjar.rewards"

    aput-object v10, v9, v11

    invoke-static {v7, v8, v9}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v7

    invoke-direct {v0, v6, v7}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 135
    .restart local v0    # "launchIntent":Landroid/content/Intent;
    const-string v1, "Please install Getjar Rewards to claim your unredeemed deal."

    .line 144
    :goto_0
    const-string v6, "notification"

    invoke-virtual {p0, v6}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/app/NotificationManager;

    .line 145
    .local v3, "notificationManager":Landroid/app/NotificationManager;
    new-instance v2, Landroid/app/Notification;

    const v6, 0x108000c

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    invoke-direct {v2, v6, v1, v7, v8}, Landroid/app/Notification;-><init>(ILjava/lang/CharSequence;J)V

    .line 146
    .local v2, "notification":Landroid/app/Notification;
    iget v6, v2, Landroid/app/Notification;->flags:I

    or-int/lit8 v6, v6, 0x10

    iput v6, v2, Landroid/app/Notification;->flags:I

    .line 147
    const/high16 v6, 0x8000000

    invoke-static {p0, v11, v0, v6}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v4

    .line 148
    .local v4, "pendingIntent":Landroid/app/PendingIntent;
    invoke-virtual {v2, p0, v5, v1, v4}, Landroid/app/Notification;->setLatestEventInfo(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Landroid/app/PendingIntent;)V

    .line 149
    const/16 v6, 0x2711

    invoke-virtual {v3, v6, v2}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 150
    return-void

    .line 139
    .end local v2    # "notification":Landroid/app/Notification;
    .end local v3    # "notificationManager":Landroid/app/NotificationManager;
    .end local v4    # "pendingIntent":Landroid/app/PendingIntent;
    :cond_1
    sget-object v6, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    sget-object v8, Lcom/getjar/sdk/logging/Area;->REDEEM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v8}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v8

    or-long/2addr v6, v8

    sget-object v8, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v8}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v8

    or-long/2addr v6, v8

    const-string v8, "NotificationsUtility: showRedeemReminderNotification() Rewards installed, sending open reminder"

    invoke-static {v6, v7, v8}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 140
    const-string v1, "Open your Getjar Wallet to redeem"

    goto :goto_0
.end method
