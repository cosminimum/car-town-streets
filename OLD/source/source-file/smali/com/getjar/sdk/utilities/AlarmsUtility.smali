.class public final Lcom/getjar/sdk/utilities/AlarmsUtility;
.super Ljava/lang/Object;
.source "AlarmsUtility.java"


# static fields
.field private static final _KeyLastRunTimestampUsageReporting:Ljava/lang/String; = "UsageReportingLastRunTimestamp"

.field private static final _VoucherRedemptionCheckInterval:J = 0x1d4c0L


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static checkLastRun(Landroid/content/Context;Ljava/lang/String;J)Z
    .locals 9
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "sharedPrefsKey"    # Ljava/lang/String;
    .param p2, "interval"    # J

    .prologue
    const-wide/16 v6, 0x0

    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 121
    const-string v5, "GetJarClientPrefs"

    invoke-virtual {p0, v5, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 122
    .local v2, "sharedPrefs":Landroid/content/SharedPreferences;
    invoke-interface {v2, p1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_1

    .line 138
    :cond_0
    :goto_0
    return v3

    .line 125
    :cond_1
    invoke-interface {v2, p1, v6, v7}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    .line 127
    .local v0, "lastRun":J
    cmp-long v5, v0, v6

    if-eqz v5, :cond_0

    .line 132
    add-long v5, v0, p2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    cmp-long v5, v5, v7

    if-ltz v5, :cond_0

    move v3, v4

    .line 138
    goto :goto_0
.end method

.method private static declared-synchronized ensureUsageReportingAlarm(Landroid/content/Context;J)V
    .locals 8
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "usageReportingInterval"    # J

    .prologue
    .line 100
    const-class v7, Lcom/getjar/sdk/utilities/AlarmsUtility;

    monitor-enter v7

    :try_start_0
    sget-object v0, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "Alarms: ensureUsageReportingAlarm() -- START: usageReportingInterval=%1$d"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 103
    if-nez p0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'context\' can not be NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 100
    :catchall_0
    move-exception v0

    monitor-exit v7

    throw v0

    .line 105
    :cond_0
    :try_start_1
    const-string v0, "UsageReportingLastRunTimestamp"

    invoke-static {p0, v0, p1, p2}, Lcom/getjar/sdk/utilities/AlarmsUtility;->checkLastRun(Landroid/content/Context;Ljava/lang/String;J)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 106
    const-string v1, "usageAndEventTracking"

    const-wide/16 v2, 0x4e20

    const/4 v6, 0x1

    move-object v0, p0

    move-wide v4, p1

    invoke-static/range {v0 .. v6}, Lcom/getjar/sdk/utilities/AlarmsUtility;->scheduleAlarm(Landroid/content/Context;Ljava/lang/String;JJI)V

    .line 111
    :goto_0
    sget-object v0, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    const-string v2, "Alarms: ensureUsageReportingAlarm() -- END"

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 112
    monitor-exit v7

    return-void

    .line 108
    :cond_1
    :try_start_2
    sget-object v0, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    const-string v2, "Alarms: ensureUsageReportingAlarm() -- Alarm does not need to be scheduled or run at this time"

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0
.end method

.method private static scheduleAlarm(Landroid/content/Context;Ljava/lang/String;JJI)V
    .locals 11
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "operation"    # Ljava/lang/String;
    .param p2, "start"    # J
    .param p4, "interval"    # J
    .param p6, "requestCode"    # I

    .prologue
    .line 161
    if-nez p0, :cond_0

    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "\'context\' can not be NULL"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 162
    :cond_0
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "\'operation\' can not be NULL or empty"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 163
    :cond_1
    const-string v2, "usageAndEventTracking"

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 164
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "\'operation\' must be a supported constant like PackageMonitor.OPERATION_KEY_USAGE_TRACKING"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 167
    :cond_2
    sget-object v2, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "Alarms: scheduleAlarm() [operation:%1$s start:%2$d, interval:%3$d, requestCode:%4$d]"

    const/4 v6, 0x4

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v9, 0x0

    aput-object p1, v6, v9

    const/4 v9, 0x1

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    aput-object v10, v6, v9

    const/4 v9, 0x2

    invoke-static/range {p4 .. p5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    aput-object v10, v6, v9

    const/4 v9, 0x3

    invoke-static/range {p6 .. p6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v6, v9

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 170
    new-instance v8, Landroid/content/Intent;

    invoke-direct {v8}, Landroid/content/Intent;-><init>()V

    .line 171
    .local v8, "intent":Landroid/content/Intent;
    const-class v2, Lcom/getjar/sdk/data/metadata/PackageMonitor;

    invoke-virtual {v8, p0, v2}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 172
    invoke-virtual {v8, p1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 175
    const/high16 v2, 0x8000000

    move/from16 v0, p6

    invoke-static {p0, v0, v8, v2}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v7

    .line 176
    .local v7, "newPendingIntent":Landroid/app/PendingIntent;
    const-string v2, "alarm"

    invoke-virtual {p0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/AlarmManager;

    .line 177
    .local v1, "alarmManager":Landroid/app/AlarmManager;
    const/4 v2, 0x0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    add-long/2addr v3, p2

    move-wide v5, p4

    invoke-virtual/range {v1 .. v7}, Landroid/app/AlarmManager;->setRepeating(IJJLandroid/app/PendingIntent;)V

    .line 178
    return-void
.end method

.method public static declared-synchronized scheduleVoucherRedemptionCheck(Landroid/content/Context;Ljava/lang/String;)V
    .locals 10
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "voucherToken"    # Ljava/lang/String;

    .prologue
    .line 74
    const-class v4, Lcom/getjar/sdk/utilities/AlarmsUtility;

    monitor-enter v4

    if-nez p0, :cond_0

    :try_start_0
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v5, "\'context\' cannot be NULL"

    invoke-direct {v3, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    move-exception v3

    monitor-exit v4

    throw v3

    .line 75
    :cond_0
    :try_start_1
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v5, "\'voucherToken\' cannot be NULL or empty"

    invoke-direct {v3, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 77
    :cond_1
    sget-object v3, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    sget-object v3, Lcom/getjar/sdk/logging/Area;->REDEEM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    or-long/2addr v5, v7

    sget-object v3, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    or-long/2addr v5, v7

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v7, "Alarms: scheduleVoucherRedemptionCheck() [voucherToken:%1$s]"

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    aput-object p1, v8, v9

    invoke-static {v3, v7, v8}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v5, v6, v3}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 82
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 83
    .local v1, "intent":Landroid/content/Intent;
    const-class v3, Lcom/getjar/sdk/data/metadata/PackageMonitor;

    invoke-virtual {v1, p0, v3}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 84
    const-string v3, "voucherRedemptionCheck"

    const-string v5, "voucherRedemptionCheck"

    invoke-virtual {v1, v3, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 85
    const-string v3, "voucherToken"

    invoke-virtual {v1, v3, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 88
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v3

    const/high16 v5, 0x8000000

    invoke-static {p0, v3, v1, v5}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v2

    .line 89
    .local v2, "newPendingIntent":Landroid/app/PendingIntent;
    const-string v3, "alarm"

    invoke-virtual {p0, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    .line 90
    .local v0, "alarmManager":Landroid/app/AlarmManager;
    const/4 v3, 0x0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    const-wide/32 v7, 0x1d4c0

    add-long/2addr v5, v7

    invoke-virtual {v0, v3, v5, v6, v2}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 91
    monitor-exit v4

    return-void
.end method

.method public static declared-synchronized startBackgroundReporting(Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/comm/GetJarConfig;)V
    .locals 9
    .param p0, "commContext"    # Lcom/getjar/sdk/comm/CommContext;
    .param p1, "getJarConfig"    # Lcom/getjar/sdk/comm/GetJarConfig;

    .prologue
    .line 46
    const-class v4, Lcom/getjar/sdk/utilities/AlarmsUtility;

    monitor-enter v4

    :try_start_0
    sget-object v3, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    const-string v3, "Alarms: startBackgroundReporting() -- START"

    invoke-static {v5, v6, v3}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 49
    if-nez p0, :cond_0

    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v5, "\'commContext\' can not be NULL"

    invoke-direct {v3, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 46
    :catchall_0
    move-exception v3

    monitor-exit v4

    throw v3

    .line 50
    :cond_0
    if-nez p1, :cond_1

    :try_start_1
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v5, "\'getJarConfig\' can not be NULL"

    invoke-direct {v3, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 51
    :cond_1
    invoke-virtual {p0}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v0

    .line 55
    .local v0, "context":Landroid/content/Context;
    :try_start_2
    const-string v3, "usage.background.send.interval"

    invoke-virtual {p1, v3}, Lcom/getjar/sdk/comm/GetJarConfig;->getDirectiveValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v5

    invoke-static {v5, v6}, Lcom/getjar/sdk/utilities/Utility;->convertMillSec(J)J

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    .line 56
    .local v2, "usageReportingInterval":Ljava/lang/Long;
    if-eqz v2, :cond_2

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    const-wide/16 v7, 0x0

    cmp-long v3, v5, v7

    if-lez v3, :cond_2

    .line 57
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    invoke-static {v0, v5, v6}, Lcom/getjar/sdk/utilities/AlarmsUtility;->ensureUsageReportingAlarm(Landroid/content/Context;J)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 63
    .end local v2    # "usageReportingInterval":Ljava/lang/Long;
    :cond_2
    :goto_0
    :try_start_3
    sget-object v3, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    const-string v3, "Alarms: startBackgroundReporting() -- END"

    invoke-static {v5, v6, v3}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 64
    monitor-exit v4

    return-void

    .line 59
    :catch_0
    move-exception v1

    .line 60
    .local v1, "e":Ljava/lang/Exception;
    :try_start_4
    sget-object v3, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    const-string v3, "Alarms: ERROR: unable to start background USAGE reporting"

    invoke-static {v5, v6, v3, v1}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_0
.end method

.method private static updateLastRunTimestamp(Landroid/content/Context;Ljava/lang/String;)V
    .locals 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "sharedPrefsKey"    # Ljava/lang/String;

    .prologue
    .line 143
    const-string v2, "GetJarClientPrefs"

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 144
    .local v1, "sharedPrefs":Landroid/content/SharedPreferences;
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 145
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-interface {v0, p1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 146
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 147
    return-void
.end method

.method public static updateLastRunTimestampUsageReporting(Landroid/content/Context;)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 32
    if-nez p0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'context\' can not be NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 33
    :cond_0
    const-string v0, "UsageReportingLastRunTimestamp"

    invoke-static {p0, v0}, Lcom/getjar/sdk/utilities/AlarmsUtility;->updateLastRunTimestamp(Landroid/content/Context;Ljava/lang/String;)V

    .line 34
    return-void
.end method
