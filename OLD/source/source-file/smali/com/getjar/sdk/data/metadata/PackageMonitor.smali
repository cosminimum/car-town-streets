.class public Lcom/getjar/sdk/data/metadata/PackageMonitor;
.super Landroid/content/BroadcastReceiver;
.source "PackageMonitor.java"


# static fields
.field public static final MAX_EARN_RETRIES:I = 0x3

.field public static final OPERATION_KEY_USAGE_TRACKING:Ljava/lang/String; = "usageAndEventTracking"

.field public static final OPERATION_KEY_VOUCHER_REDEMPTION_CHECK:Ljava/lang/String; = "voucherRedemptionCheck"

.field public static mEarnRetries:I


# instance fields
.field private _googlePlayLaunchCache:Lcom/getjar/sdk/rewards/GooglePlayLaunchCachingManager;

.field private mContext:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 70
    const/4 v0, 0x0

    sput v0, Lcom/getjar/sdk/data/metadata/PackageMonitor;->mEarnRetries:I

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 65
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 73
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/getjar/sdk/data/metadata/PackageMonitor;->_googlePlayLaunchCache:Lcom/getjar/sdk/rewards/GooglePlayLaunchCachingManager;

    return-void
.end method

.method static synthetic access$000(Lcom/getjar/sdk/data/metadata/PackageMonitor;Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0
    .param p0, "x0"    # Lcom/getjar/sdk/data/metadata/PackageMonitor;
    .param p1, "x1"    # Landroid/content/Context;
    .param p2, "x2"    # Landroid/content/Intent;

    .prologue
    .line 65
    invoke-direct {p0, p1, p2}, Lcom/getjar/sdk/data/metadata/PackageMonitor;->doOnReceive(Landroid/content/Context;Landroid/content/Intent;)V

    return-void
.end method

.method private checkForAndHandleManagedInstalls(Landroid/content/Context;Ljava/lang/String;)V
    .locals 10
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "packageName"    # Ljava/lang/String;

    .prologue
    .line 292
    if-nez p1, :cond_0

    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "\'context\' cannot be NULL"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 293
    :cond_0
    invoke-static {p2}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "\'packageName\' cannot be NULL or empty"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 295
    :cond_1
    sget-object v3, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    const-string v5, "PackageMonitor: checkForAndHandleManagedInstalls() START"

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 299
    :try_start_0
    invoke-static {p1}, Lcom/getjar/sdk/data/earning/EarnStateDatabase;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/earning/EarnStateDatabase;

    move-result-object v3

    invoke-virtual {v3, p2}, Lcom/getjar/sdk/data/earning/EarnStateDatabase;->getAppState(Ljava/lang/String;)Lcom/getjar/sdk/data/earning/EarnStateRecord;

    move-result-object v0

    .line 300
    .local v0, "appState":Lcom/getjar/sdk/data/earning/EarnStateRecord;
    if-eqz v0, :cond_2

    .line 302
    sget-object v3, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "PackageMonitor: checkForAndHandleManagedInstalls() Host app %1$s is managing an EARN related event for %2$s"

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v7, v8

    const/4 v8, 0x1

    aput-object p2, v7, v8

    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 308
    invoke-static {p1}, Lcom/getjar/sdk/data/earning/EarnStateDatabase;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/earning/EarnStateDatabase;

    move-result-object v3

    sget-object v4, Lcom/getjar/sdk/data/earning/EarnStateDatabase$Status;->INSTALLED:Lcom/getjar/sdk/data/earning/EarnStateDatabase$Status;

    invoke-virtual {v3, p2, v4}, Lcom/getjar/sdk/data/earning/EarnStateDatabase;->updateStatus(Ljava/lang/String;Lcom/getjar/sdk/data/earning/EarnStateDatabase$Status;)V

    .line 311
    invoke-static {p1}, Lcom/getjar/sdk/data/earning/EarningMonitor;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/earning/EarningMonitor;

    move-result-object v3

    invoke-virtual {v3}, Lcom/getjar/sdk/data/earning/EarningMonitor;->startMonitoring()V

    .line 314
    invoke-static {p1}, Lcom/getjar/sdk/data/earning/EarningMonitor;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/earning/EarningMonitor;

    move-result-object v3

    invoke-virtual {v3, v0}, Lcom/getjar/sdk/data/earning/EarningMonitor;->ensureAppMetadataOnEarnStateRecord(Lcom/getjar/sdk/data/earning/EarnStateRecord;)Lcom/getjar/sdk/data/earning/EarnStateRecord;

    move-result-object v0

    .line 318
    :cond_2
    iget-object v3, p0, Lcom/getjar/sdk/data/metadata/PackageMonitor;->_googlePlayLaunchCache:Lcom/getjar/sdk/rewards/GooglePlayLaunchCachingManager;

    invoke-virtual {v3, p2}, Lcom/getjar/sdk/rewards/GooglePlayLaunchCachingManager;->get(Ljava/lang/String;)Lcom/getjar/sdk/rewards/GooglePlayLaunchReason;

    move-result-object v2

    .line 319
    .local v2, "installReason":Lcom/getjar/sdk/rewards/GooglePlayLaunchReason;
    if-eqz v2, :cond_3

    sget-object v3, Lcom/getjar/sdk/rewards/GooglePlayLaunchReason;->REDEEM:Lcom/getjar/sdk/rewards/GooglePlayLaunchReason;

    invoke-virtual {v3, v2}, Lcom/getjar/sdk/rewards/GooglePlayLaunchReason;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 321
    sget-object v3, Lcom/getjar/sdk/logging/Area;->REDEEM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "PackageMonitor: checkForAndHandleManagedInstalls() Host app %1$s is managing a REDEEM related event for %2$s"

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v7, v8

    const/4 v8, 0x1

    aput-object p2, v7, v8

    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 327
    invoke-static {p1}, Lcom/getjar/sdk/utilities/NotificationsUtility;->showRedeemReminderNotification(Landroid/content/Context;)V

    .line 330
    iget-object v3, p0, Lcom/getjar/sdk/data/metadata/PackageMonitor;->_googlePlayLaunchCache:Lcom/getjar/sdk/rewards/GooglePlayLaunchCachingManager;

    invoke-virtual {v3, p2}, Lcom/getjar/sdk/rewards/GooglePlayLaunchCachingManager;->remove(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 336
    :cond_3
    sget-object v3, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    const-string v5, "PackageMonitor: checkForAndHandleManagedInstalls() DONE"

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 338
    .end local v0    # "appState":Lcom/getjar/sdk/data/earning/EarnStateRecord;
    .end local v2    # "installReason":Lcom/getjar/sdk/rewards/GooglePlayLaunchReason;
    :goto_0
    return-void

    .line 333
    :catch_0
    move-exception v1

    .line 334
    .local v1, "e":Ljava/lang/Exception;
    :try_start_1
    sget-object v3, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    const-string v5, "PackageMonitor: checkForAndHandleManagedInstalls() failed"

    invoke-static {v3, v4, v5, v1}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 336
    sget-object v3, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    const-string v5, "PackageMonitor: checkForAndHandleManagedInstalls() DONE"

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    goto :goto_0

    .end local v1    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v3

    sget-object v4, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    const-string v6, "PackageMonitor: checkForAndHandleManagedInstalls() DONE"

    invoke-static {v4, v5, v6}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    throw v3
.end method

.method private doOnReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 21
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 119
    :try_start_0
    sget-object v14, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v14}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v14

    const-string v16, "PackageMonitor: doOnReceive(): START"

    invoke-static/range {v14 .. v16}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 120
    if-nez p1, :cond_0

    new-instance v14, Ljava/lang/IllegalArgumentException;

    const-string v15, "\'context\' cannot be null"

    invoke-direct {v14, v15}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v14
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 277
    :catch_0
    move-exception v7

    .line 278
    .local v7, "e":Ljava/lang/Exception;
    :try_start_1
    sget-object v14, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v14}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v14

    sget-object v16, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v16 .. v16}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v16

    or-long v14, v14, v16

    sget-object v16, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v16 .. v16}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v16

    or-long v14, v14, v16

    const-string v16, "PackageMonitor: doOnReceive(): failed"

    move-object/from16 v0, v16

    invoke-static {v14, v15, v0, v7}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 280
    sget-object v14, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v14}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v14

    sget-object v16, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v16 .. v16}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v16

    or-long v14, v14, v16

    sget-object v16, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v16 .. v16}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v16

    or-long v14, v14, v16

    const-string v16, "PackageMonitor: doOnReceive(): FINISHED"

    invoke-static/range {v14 .. v16}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 282
    .end local v7    # "e":Ljava/lang/Exception;
    :goto_0
    return-void

    .line 121
    :cond_0
    if-nez p2, :cond_1

    :try_start_2
    new-instance v14, Ljava/lang/IllegalArgumentException;

    const-string v15, "\'intent\' cannot be null"

    invoke-direct {v14, v15}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v14
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 280
    :catchall_0
    move-exception v14

    sget-object v15, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v15}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v15

    sget-object v17, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v17 .. v17}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v17

    or-long v15, v15, v17

    sget-object v17, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v17 .. v17}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v17

    or-long v15, v15, v17

    const-string v17, "PackageMonitor: doOnReceive(): FINISHED"

    invoke-static/range {v15 .. v17}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    throw v14

    .line 123
    :cond_1
    :try_start_3
    move-object/from16 v0, p1

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/getjar/sdk/data/metadata/PackageMonitor;->mContext:Landroid/content/Context;

    .line 124
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/getjar/sdk/data/metadata/PackageMonitor;->_googlePlayLaunchCache:Lcom/getjar/sdk/rewards/GooglePlayLaunchCachingManager;

    if-nez v14, :cond_2

    .line 125
    new-instance v14, Lcom/getjar/sdk/rewards/GooglePlayLaunchCachingManager;

    move-object/from16 v0, p1

    invoke-direct {v14, v0}, Lcom/getjar/sdk/rewards/GooglePlayLaunchCachingManager;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, p0

    iput-object v14, v0, Lcom/getjar/sdk/data/metadata/PackageMonitor;->_googlePlayLaunchCache:Lcom/getjar/sdk/rewards/GooglePlayLaunchCachingManager;

    .line 127
    :cond_2
    invoke-static/range {p1 .. p1}, Lcom/getjar/sdk/utilities/Utility;->previousVersionCleanUp(Landroid/content/Context;)V

    .line 129
    invoke-static/range {p1 .. p1}, Lcom/getjar/sdk/comm/auth/ApplicationKeyDatabase;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/comm/auth/ApplicationKeyDatabase;

    move-result-object v14

    invoke-virtual {v14}, Lcom/getjar/sdk/comm/auth/ApplicationKeyDatabase;->getApplicationKey()Ljava/lang/String;

    move-result-object v3

    .line 130
    .local v3, "applicationKey":Ljava/lang/String;
    invoke-static {v3}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_3

    .line 131
    sget-object v14, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v14}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v14

    sget-object v16, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v16 .. v16}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v16

    or-long v14, v14, v16

    sget-object v16, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v16 .. v16}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v16

    or-long v14, v14, v16

    const-string v16, "PackageMonitor: doOnReceive(): Unable to access the application key"

    invoke-static/range {v14 .. v16}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 280
    sget-object v14, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v14}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v14

    sget-object v16, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v16 .. v16}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v16

    or-long v14, v14, v16

    sget-object v16, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v16 .. v16}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v16

    or-long v14, v14, v16

    const-string v16, "PackageMonitor: doOnReceive(): FINISHED"

    invoke-static/range {v14 .. v16}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    goto/16 :goto_0

    .line 144
    :cond_3
    :try_start_4
    new-instance v14, Lcom/getjar/sdk/data/metadata/PackageMonitor$2;

    const/4 v15, 0x0

    move-object/from16 v0, p0

    invoke-direct {v14, v0, v15}, Lcom/getjar/sdk/data/metadata/PackageMonitor$2;-><init>(Lcom/getjar/sdk/data/metadata/PackageMonitor;Landroid/os/Handler;)V

    sget-object v15, Lcom/getjar/sdk/comm/CommManager$LaunchWork;->NONE:Lcom/getjar/sdk/comm/CommManager$LaunchWork;

    move-object/from16 v0, p1

    invoke-static {v3, v0, v14, v15}, Lcom/getjar/sdk/comm/CommManager;->createContext(Ljava/lang/String;Landroid/content/Context;Landroid/os/ResultReceiver;Lcom/getjar/sdk/comm/CommManager$LaunchWork;)Lcom/getjar/sdk/comm/CommContext;
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    move-result-object v6

    .line 160
    .local v6, "commContext":Lcom/getjar/sdk/comm/CommContext;
    :try_start_5
    invoke-static/range {p1 .. p1}, Lcom/getjar/sdk/comm/auth/AuthManager;->initialize(Landroid/content/Context;)V

    .line 161
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v14

    invoke-virtual {v14}, Lcom/getjar/sdk/comm/auth/AuthManager;->waitOnAuth()V
    :try_end_5
    .catch Lcom/getjar/sdk/exceptions/AuthException; {:try_start_5 .. :try_end_5} :catch_1
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 169
    :try_start_6
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v5

    .line 170
    .local v5, "bundle":Landroid/os/Bundle;
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v14

    invoke-virtual {v14}, Lcom/getjar/sdk/comm/auth/AuthManager;->getAuthToken()Ljava/lang/String;

    move-result-object v4

    .line 171
    .local v4, "authToken":Ljava/lang/String;
    if-eqz v6, :cond_4

    invoke-static {v4}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v14

    if-nez v14, :cond_4

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v6}, Lcom/getjar/sdk/data/metadata/PackageMonitor;->shouldRetryTransactions(Landroid/content/Context;Lcom/getjar/sdk/comm/CommContext;)Z

    move-result v14

    if-eqz v14, :cond_4

    .line 175
    move-object/from16 v0, p0

    invoke-direct {v0, v6}, Lcom/getjar/sdk/data/metadata/PackageMonitor;->runPendingEarnTransactionsAndCleanup(Lcom/getjar/sdk/comm/CommContext;)V

    .line 178
    :cond_4
    if-eqz v5, :cond_8

    const-string v14, "voucherRedemptionCheck"

    invoke-virtual {v5, v14}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-static {v14}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v14

    if-nez v14, :cond_8

    .line 180
    const-string v14, "voucherToken"

    invoke-virtual {v5, v14}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 181
    .local v13, "voucherToken":Ljava/lang/String;
    sget-object v14, Lcom/getjar/sdk/logging/Area;->REDEEM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v14}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v14

    sget-object v16, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v16 .. v16}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v16

    or-long v14, v14, v16

    sget-object v16, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v17, "PackageMonitor: doOnReceive(): voucher redemption [token:\'%1$s\']"

    const/16 v18, 0x1

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    aput-object v13, v18, v19

    invoke-static/range {v16 .. v18}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v14 .. v16}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 182
    invoke-static {v13}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    move-result v14

    if-nez v14, :cond_6

    .line 185
    const/4 v8, 0x0

    .line 189
    .local v8, "isRedeemed":Z
    :try_start_7
    invoke-static {}, Lcom/getjar/sdk/comm/VoucherServiceProxy;->getInstance()Lcom/getjar/sdk/comm/VoucherServiceProxy;

    move-result-object v14

    const/4 v15, 0x1

    invoke-virtual {v14, v6, v13, v15}, Lcom/getjar/sdk/comm/VoucherServiceProxy;->getVoucher(Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Z)Lcom/getjar/sdk/comm/Operation;

    move-result-object v9

    .line 190
    .local v9, "operation":Lcom/getjar/sdk/comm/Operation;
    invoke-virtual {v9}, Lcom/getjar/sdk/comm/Operation;->get()Lcom/getjar/sdk/comm/Result;

    move-result-object v12

    .line 193
    .local v12, "result":Lcom/getjar/sdk/comm/Result;
    if-eqz v12, :cond_5

    invoke-virtual {v12}, Lcom/getjar/sdk/comm/Result;->isSuccessfulResponse()Z

    move-result v14

    if-eqz v14, :cond_5

    invoke-virtual {v12}, Lcom/getjar/sdk/comm/Result;->getResponseJson()Lorg/json/JSONObject;

    move-result-object v14

    if-eqz v14, :cond_5

    .line 194
    invoke-virtual {v12}, Lcom/getjar/sdk/comm/Result;->getResponseJson()Lorg/json/JSONObject;

    move-result-object v14

    const-string v15, "return"

    invoke-virtual {v14, v15}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_5

    invoke-virtual {v12}, Lcom/getjar/sdk/comm/Result;->getResponseJson()Lorg/json/JSONObject;

    move-result-object v14

    const-string v15, "return"

    invoke-virtual {v14, v15}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v14

    const-string v15, "state"

    invoke-virtual {v14, v15}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_5

    .line 195
    const-string v14, "REDEEMED"

    invoke-virtual {v12}, Lcom/getjar/sdk/comm/Result;->getResponseJson()Lorg/json/JSONObject;

    move-result-object v15

    const-string v16, "return"

    invoke-virtual/range {v15 .. v16}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v15

    const-string v16, "state"

    invoke-virtual/range {v15 .. v16}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_2
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    move-result v14

    if-eqz v14, :cond_5

    .line 196
    const/4 v8, 0x1

    .line 208
    .end local v9    # "operation":Lcom/getjar/sdk/comm/Operation;
    .end local v12    # "result":Lcom/getjar/sdk/comm/Result;
    :cond_5
    :goto_1
    if-nez v8, :cond_7

    .line 209
    :try_start_8
    invoke-static/range {p1 .. p1}, Lcom/getjar/sdk/utilities/NotificationsUtility;->showRedeemReminderNotification(Landroid/content/Context;)V

    .line 210
    sget-object v14, Lcom/getjar/sdk/logging/Area;->REDEEM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v14}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v14

    sget-object v16, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v16 .. v16}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v16

    or-long v14, v14, v16

    sget-object v16, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v17, "PackageMonitor: doOnReceive(): voucher not redeemed, notification sent [token:\'%1$s\']"

    const/16 v18, 0x1

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    aput-object v13, v18, v19

    invoke-static/range {v16 .. v18}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v14 .. v16}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    .line 273
    .end local v8    # "isRedeemed":Z
    .end local v13    # "voucherToken":Ljava/lang/String;
    :cond_6
    :goto_2
    :try_start_9
    invoke-static/range {p1 .. p1}, Lcom/getjar/sdk/data/earning/EarningMonitor;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/earning/EarningMonitor;

    move-result-object v14

    invoke-virtual {v14}, Lcom/getjar/sdk/data/earning/EarningMonitor;->startMonitoring()V

    .line 274
    invoke-static/range {p1 .. p1}, Lcom/getjar/sdk/data/usage/UsageMonitor;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/usage/UsageMonitor;

    move-result-object v14

    invoke-virtual {v14}, Lcom/getjar/sdk/data/usage/UsageMonitor;->startMonitoring()V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_0
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    .line 280
    sget-object v14, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v14}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v14

    sget-object v16, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v16 .. v16}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v16

    or-long v14, v14, v16

    sget-object v16, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v16 .. v16}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v16

    or-long v14, v14, v16

    const-string v16, "PackageMonitor: doOnReceive(): FINISHED"

    invoke-static/range {v14 .. v16}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    goto/16 :goto_0

    .line 162
    .end local v4    # "authToken":Ljava/lang/String;
    .end local v5    # "bundle":Landroid/os/Bundle;
    :catch_1
    move-exception v7

    .line 163
    .local v7, "e":Lcom/getjar/sdk/exceptions/AuthException;
    :try_start_a
    sget-object v14, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v14}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v14

    sget-object v16, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v17, "PackageMonitor: doOnReceive() %1$s"

    const/16 v18, 0x1

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    invoke-virtual {v7}, Lcom/getjar/sdk/exceptions/AuthException;->getMessage()Ljava/lang/String;

    move-result-object v20

    aput-object v20, v18, v19

    invoke-static/range {v16 .. v18}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v14 .. v16}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;)V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_0
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    .line 280
    sget-object v14, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v14}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v14

    sget-object v16, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v16 .. v16}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v16

    or-long v14, v14, v16

    sget-object v16, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v16 .. v16}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v16

    or-long v14, v14, v16

    const-string v16, "PackageMonitor: doOnReceive(): FINISHED"

    invoke-static/range {v14 .. v16}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    goto/16 :goto_0

    .line 201
    .end local v7    # "e":Lcom/getjar/sdk/exceptions/AuthException;
    .restart local v4    # "authToken":Ljava/lang/String;
    .restart local v5    # "bundle":Landroid/os/Bundle;
    .restart local v8    # "isRedeemed":Z
    .restart local v13    # "voucherToken":Ljava/lang/String;
    :catch_2
    move-exception v7

    .line 204
    .local v7, "e":Ljava/lang/Exception;
    :try_start_b
    sget-object v14, Lcom/getjar/sdk/logging/Area;->REDEEM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v14}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v14

    sget-object v16, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v16 .. v16}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v16

    or-long v14, v14, v16

    const-string v16, "PackageMonitor: doOnReceive(): VoucherServiceProxy.getVoucher() failed"

    move-object/from16 v0, v16

    invoke-static {v14, v15, v0, v7}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_1

    goto/16 :goto_1

    .line 273
    .end local v4    # "authToken":Ljava/lang/String;
    .end local v5    # "bundle":Landroid/os/Bundle;
    .end local v7    # "e":Ljava/lang/Exception;
    .end local v8    # "isRedeemed":Z
    .end local v13    # "voucherToken":Ljava/lang/String;
    :catchall_1
    move-exception v14

    :try_start_c
    invoke-static/range {p1 .. p1}, Lcom/getjar/sdk/data/earning/EarningMonitor;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/earning/EarningMonitor;

    move-result-object v15

    invoke-virtual {v15}, Lcom/getjar/sdk/data/earning/EarningMonitor;->startMonitoring()V

    .line 274
    invoke-static/range {p1 .. p1}, Lcom/getjar/sdk/data/usage/UsageMonitor;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/usage/UsageMonitor;

    move-result-object v15

    invoke-virtual {v15}, Lcom/getjar/sdk/data/usage/UsageMonitor;->startMonitoring()V

    throw v14
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_0
    .catchall {:try_start_c .. :try_end_c} :catchall_0

    .line 212
    .restart local v4    # "authToken":Ljava/lang/String;
    .restart local v5    # "bundle":Landroid/os/Bundle;
    .restart local v8    # "isRedeemed":Z
    .restart local v13    # "voucherToken":Ljava/lang/String;
    :cond_7
    :try_start_d
    sget-object v14, Lcom/getjar/sdk/logging/Area;->REDEEM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v14}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v14

    sget-object v16, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v16 .. v16}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v16

    or-long v14, v14, v16

    sget-object v16, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v17, "PackageMonitor: doOnReceive(): voucher in redeemed state, no work to do [token:\'%1$s\']"

    const/16 v18, 0x1

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    aput-object v13, v18, v19

    invoke-static/range {v16 .. v18}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v14 .. v16}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    goto/16 :goto_2

    .line 215
    .end local v8    # "isRedeemed":Z
    .end local v13    # "voucherToken":Ljava/lang/String;
    :cond_8
    if-eqz v5, :cond_9

    const-string v14, "usageAndEventTracking"

    invoke-virtual {v5, v14}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-static {v14}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v14

    if-nez v14, :cond_9

    .line 216
    invoke-static/range {p1 .. p1}, Lcom/getjar/sdk/data/usage/UsageManager;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/usage/UsageManager;

    move-result-object v14

    invoke-virtual {v14}, Lcom/getjar/sdk/data/usage/UsageManager;->isBackgroundSendEnabled()Z

    move-result v14

    if-eqz v14, :cond_6

    .line 219
    invoke-static/range {p1 .. p1}, Lcom/getjar/sdk/utilities/AlarmsUtility;->updateLastRunTimestampUsageReporting(Landroid/content/Context;)V

    .line 224
    invoke-static {v6}, Lcom/getjar/sdk/data/usage/UsageReporter;->getInstance(Lcom/getjar/sdk/comm/CommContext;)Lcom/getjar/sdk/data/usage/UsageReporter;

    move-result-object v14

    invoke-virtual {v14}, Lcom/getjar/sdk/data/usage/UsageReporter;->sendUnsyncedData()V

    .line 227
    invoke-static/range {p1 .. p1}, Lcom/getjar/sdk/data/package_events/PackageEventManager;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/package_events/PackageEventManager;

    move-result-object v14

    invoke-virtual {v14, v6}, Lcom/getjar/sdk/data/package_events/PackageEventManager;->sendUnsyncedEvents(Lcom/getjar/sdk/comm/CommContext;)V

    .line 230
    invoke-static/range {p1 .. p1}, Lcom/getjar/sdk/data/install_state/InstallStateManager;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/install_state/InstallStateManager;

    move-result-object v14

    invoke-virtual {v14}, Lcom/getjar/sdk/data/install_state/InstallStateManager;->updateCurrentState()V

    .line 231
    invoke-static/range {p1 .. p1}, Lcom/getjar/sdk/data/install_state/InstallStateManager;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/install_state/InstallStateManager;

    move-result-object v14

    invoke-virtual {v14, v6}, Lcom/getjar/sdk/data/install_state/InstallStateManager;->sendCurrentStateDeltas(Lcom/getjar/sdk/comm/CommContext;)V

    .line 233
    sget-object v14, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v14}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v14

    const-string v16, "PackageMonitor: doOnReceive(): *** SENT USAGE AND STATE DATA ***"

    invoke-static/range {v14 .. v16}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    goto/16 :goto_2

    .line 238
    :cond_9
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    .line 239
    .local v2, "action":Ljava/lang/String;
    const-string v14, "android.intent.extra.REPLACING"

    const/4 v15, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v14, v15}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v11

    .line 240
    .local v11, "replacing":Z
    if-nez v11, :cond_6

    if-eqz v2, :cond_6

    const-string v14, "android.intent.action.PACKAGE_ADDED"

    invoke-virtual {v14, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-nez v14, :cond_a

    const-string v14, "android.intent.action.PACKAGE_REMOVED"

    invoke-virtual {v14, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_6

    .line 245
    :cond_a
    invoke-static/range {p2 .. p2}, Lcom/getjar/sdk/utilities/Utility;->getPackageNameFromBroadcastIntent(Landroid/content/Intent;)Ljava/lang/String;

    move-result-object v10

    .line 246
    .local v10, "packageName":Ljava/lang/String;
    sget-object v14, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v14}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v14

    sget-object v16, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v17, "PackageMonitor: doOnReceive(): [packageName:%1$s action:%2$s]"

    const/16 v18, 0x2

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    aput-object v10, v18, v19

    const/16 v19, 0x1

    aput-object v2, v18, v19

    invoke-static/range {v16 .. v18}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v14 .. v16}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 248
    const-string v14, "android.intent.action.PACKAGE_ADDED"

    invoke-virtual {v14, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_b

    .line 249
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v10}, Lcom/getjar/sdk/data/metadata/PackageMonitor;->checkForAndHandleManagedInstalls(Landroid/content/Context;Ljava/lang/String;)V

    .line 251
    invoke-static/range {p1 .. p1}, Lcom/getjar/sdk/data/usage/UsageManager;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/usage/UsageManager;

    move-result-object v14

    invoke-virtual {v14}, Lcom/getjar/sdk/data/usage/UsageManager;->isBackgroundSendEnabled()Z

    move-result v14

    if-eqz v14, :cond_6

    .line 252
    invoke-static/range {p1 .. p1}, Lcom/getjar/sdk/data/package_events/PackageEventManager;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/package_events/PackageEventManager;

    move-result-object v14

    sget-object v15, Lcom/getjar/sdk/data/package_events/PackageEventManager$EventType;->INSTALLED:Lcom/getjar/sdk/data/package_events/PackageEventManager$EventType;

    invoke-virtual {v14, v10, v15}, Lcom/getjar/sdk/data/package_events/PackageEventManager;->logEvent(Ljava/lang/String;Lcom/getjar/sdk/data/package_events/PackageEventManager$EventType;)V

    .line 253
    invoke-static/range {p1 .. p1}, Lcom/getjar/sdk/data/package_events/PackageEventManager;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/package_events/PackageEventManager;

    move-result-object v14

    invoke-virtual {v14, v6}, Lcom/getjar/sdk/data/package_events/PackageEventManager;->sendUnsyncedEvents(Lcom/getjar/sdk/comm/CommContext;)V

    .line 254
    sget-object v14, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v14}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v14

    const-string v16, "PackageMonitor: doOnReceive(): *** SENT APP EVENT DATA (INSTALLED) ***"

    invoke-static/range {v14 .. v16}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    goto/16 :goto_2

    .line 256
    :cond_b
    const-string v14, "android.intent.action.PACKAGE_REMOVED"

    invoke-virtual {v14, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_6

    .line 258
    invoke-static/range {p1 .. p1}, Lcom/getjar/sdk/data/usage/UsageManager;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/usage/UsageManager;

    move-result-object v14

    invoke-virtual {v14}, Lcom/getjar/sdk/data/usage/UsageManager;->isBackgroundSendEnabled()Z

    move-result v14

    if-eqz v14, :cond_6

    .line 259
    invoke-static/range {p1 .. p1}, Lcom/getjar/sdk/data/package_events/PackageEventManager;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/package_events/PackageEventManager;

    move-result-object v14

    sget-object v15, Lcom/getjar/sdk/data/package_events/PackageEventManager$EventType;->UNINSTALLED:Lcom/getjar/sdk/data/package_events/PackageEventManager$EventType;

    invoke-virtual {v14, v10, v15}, Lcom/getjar/sdk/data/package_events/PackageEventManager;->logEvent(Ljava/lang/String;Lcom/getjar/sdk/data/package_events/PackageEventManager$EventType;)V

    .line 260
    invoke-static/range {p1 .. p1}, Lcom/getjar/sdk/data/package_events/PackageEventManager;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/package_events/PackageEventManager;

    move-result-object v14

    invoke-virtual {v14, v6}, Lcom/getjar/sdk/data/package_events/PackageEventManager;->sendUnsyncedEvents(Lcom/getjar/sdk/comm/CommContext;)V

    .line 261
    sget-object v14, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v14}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v14

    const-string v16, "PackageMonitor: doOnReceive(): *** SENT APP EVENT DATA (UNINSTALLED) ***"

    invoke-static/range {v14 .. v16}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_1

    goto/16 :goto_2
.end method

.method private runPendingEarnTransactionsAndCleanup(Lcom/getjar/sdk/comm/CommContext;)V
    .locals 7
    .param p1, "commContext"    # Lcom/getjar/sdk/comm/CommContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 347
    sget-object v3, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    const-string v5, "PackageMonitor: runPendingEarnTransactionsAndCleanup()"

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 350
    new-instance v2, Lcom/getjar/sdk/comm/TransactionManager;

    iget-object v3, p0, Lcom/getjar/sdk/data/metadata/PackageMonitor;->mContext:Landroid/content/Context;

    invoke-direct {v2, v3}, Lcom/getjar/sdk/comm/TransactionManager;-><init>(Landroid/content/Context;)V

    .line 351
    .local v2, "transactionManager":Lcom/getjar/sdk/comm/TransactionManager;
    invoke-virtual {v2, p1}, Lcom/getjar/sdk/comm/TransactionManager;->runEarnAndManagedOfferTransactions(Lcom/getjar/sdk/comm/CommContext;)Ljava/util/List;

    .line 354
    const/4 v3, 0x1

    invoke-static {p1, v3}, Lcom/getjar/sdk/comm/GetJarConfig;->getInstance(Lcom/getjar/sdk/comm/CommContext;Z)Lcom/getjar/sdk/comm/GetJarConfig;

    move-result-object v3

    const-string v4, "download.match.ttl"

    invoke-virtual {v3, v4}, Lcom/getjar/sdk/comm/GetJarConfig;->getDirectiveValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v3

    invoke-static {v3, v4}, Lcom/getjar/sdk/utilities/Utility;->convertMillSec(J)J

    move-result-wide v0

    .line 355
    .local v0, "timeoutInterval":J
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/getjar/sdk/data/earning/EarnStateDatabase;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/earning/EarnStateDatabase;

    move-result-object v3

    invoke-virtual {v3, v0, v1}, Lcom/getjar/sdk/data/earning/EarnStateDatabase;->deleteOldRecords(J)V

    .line 356
    return-void
.end method

.method private shouldRetryTransactions(Landroid/content/Context;Lcom/getjar/sdk/comm/CommContext;)Z
    .locals 18
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "commContext"    # Lcom/getjar/sdk/comm/CommContext;

    .prologue
    .line 365
    sget-object v11, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v11}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v11

    sget-object v13, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v13}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v13

    or-long/2addr v11, v13

    const-string v13, "PackageMonitor: shouldRetryTransactions()"

    invoke-static {v11, v12, v13}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 369
    if-nez p2, :cond_0

    const/4 v11, 0x0

    .line 388
    :goto_0
    return v11

    .line 370
    :cond_0
    :try_start_0
    const-string v11, "timestamp"

    const/4 v12, 0x0

    move-object/from16 v0, p1

    invoke-virtual {v0, v11, v12}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v10

    .line 371
    .local v10, "prefs":Landroid/content/SharedPreferences;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    .line 372
    .local v1, "currentTime":J
    const-string v11, "transactiontimestamp"

    const-wide/16 v12, 0x0

    invoke-interface {v10, v11, v12, v13}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v6

    .line 373
    .local v6, "lastRetryTime":J
    sub-long v3, v1, v6

    .line 374
    .local v3, "delta":J
    const/4 v11, 0x1

    move-object/from16 v0, p2

    invoke-static {v0, v11}, Lcom/getjar/sdk/comm/GetJarConfig;->getInstance(Lcom/getjar/sdk/comm/CommContext;Z)Lcom/getjar/sdk/comm/GetJarConfig;

    move-result-object v11

    const-string v12, "transaction.fail.retry.time"

    invoke-virtual {v11, v12}, Lcom/getjar/sdk/comm/GetJarConfig;->getDirectiveValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v11

    invoke-static {v11, v12}, Lcom/getjar/sdk/utilities/Utility;->convertMillSec(J)J

    move-result-wide v8

    .line 376
    .local v8, "minimumDelta":J
    sget-object v11, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v11}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v11

    sget-object v13, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v13}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v13

    or-long/2addr v11, v13

    sget-object v13, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v14, "PackageMonitor: shouldRetryTransactions: [lastRetryTime: %1$d] [currentTime: %2$d] [delta: %3$d] [minimumDelta: %4$d]"

    const/4 v15, 0x4

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v17

    aput-object v17, v15, v16

    const/16 v16, 0x1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v17

    aput-object v17, v15, v16

    const/16 v16, 0x2

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v17

    aput-object v17, v15, v16

    const/16 v16, 0x3

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v17

    aput-object v17, v15, v16

    invoke-static {v13, v14, v15}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    invoke-static {v11, v12, v13}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 379
    cmp-long v11, v3, v8

    if-ltz v11, :cond_1

    .line 380
    invoke-interface {v10}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v11

    const-string v12, "transactiontimestamp"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v13

    invoke-interface {v11, v12, v13, v14}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v11

    invoke-interface {v11}, Landroid/content/SharedPreferences$Editor;->commit()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 381
    const/4 v11, 0x1

    goto :goto_0

    .line 383
    :cond_1
    const/4 v11, 0x0

    goto :goto_0

    .line 386
    .end local v1    # "currentTime":J
    .end local v3    # "delta":J
    .end local v6    # "lastRetryTime":J
    .end local v8    # "minimumDelta":J
    .end local v10    # "prefs":Landroid/content/SharedPreferences;
    :catch_0
    move-exception v5

    .line 387
    .local v5, "e":Ljava/lang/Exception;
    sget-object v11, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v11}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v11

    sget-object v13, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v13}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v13

    or-long/2addr v11, v13

    const-string v13, "PackageMonitor: shouldRetryTransactions() failed"

    invoke-static {v11, v12, v13, v5}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 388
    const/4 v11, 0x0

    goto/16 :goto_0
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 83
    sget-object v3, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    const-string v5, "PackageMonitor: onReceive(): START"

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 87
    move-object v1, p1

    .line 88
    .local v1, "finalContext":Landroid/content/Context;
    move-object v2, p2

    .line 89
    .local v2, "finalIntent":Landroid/content/Intent;
    :try_start_0
    new-instance v3, Ljava/lang/Thread;

    new-instance v4, Lcom/getjar/sdk/data/metadata/PackageMonitor$1;

    invoke-direct {v4, p0, v1, v2}, Lcom/getjar/sdk/data/metadata/PackageMonitor$1;-><init>(Lcom/getjar/sdk/data/metadata/PackageMonitor;Landroid/content/Context;Landroid/content/Intent;)V

    const-string v5, "PackageMonitor Worker Thread"

    invoke-direct {v3, v4, v5}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/lang/Thread;->start()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 110
    :goto_0
    return-void

    .line 105
    :catch_0
    move-exception v0

    .line 108
    .local v0, "e":Ljava/lang/Exception;
    sget-object v3, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    const-string v5, "PackageMonitor: onReceive() failed"

    invoke-static {v3, v4, v5, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
