.class Lcom/getjar/sdk/data/usage/UsageMonitor$UsageMonitoringThread;
.super Ljava/lang/Thread;
.source "UsageMonitor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getjar/sdk/data/usage/UsageMonitor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "UsageMonitoringThread"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/getjar/sdk/data/usage/UsageMonitor;


# direct methods
.method private constructor <init>(Lcom/getjar/sdk/data/usage/UsageMonitor;)V
    .locals 0

    .prologue
    .line 233
    iput-object p1, p0, Lcom/getjar/sdk/data/usage/UsageMonitor$UsageMonitoringThread;->this$0:Lcom/getjar/sdk/data/usage/UsageMonitor;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/getjar/sdk/data/usage/UsageMonitor;Lcom/getjar/sdk/data/usage/UsageMonitor$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/getjar/sdk/data/usage/UsageMonitor;
    .param p2, "x1"    # Lcom/getjar/sdk/data/usage/UsageMonitor$1;

    .prologue
    .line 233
    invoke-direct {p0, p1}, Lcom/getjar/sdk/data/usage/UsageMonitor$UsageMonitoringThread;-><init>(Lcom/getjar/sdk/data/usage/UsageMonitor;)V

    return-void
.end method

.method private updateLastChecked()V
    .locals 5

    .prologue
    .line 421
    :try_start_0
    iget-object v2, p0, Lcom/getjar/sdk/data/usage/UsageMonitor$UsageMonitoringThread;->this$0:Lcom/getjar/sdk/data/usage/UsageMonitor;

    invoke-static {v2}, Lcom/getjar/sdk/data/usage/UsageMonitor;->access$200(Lcom/getjar/sdk/data/usage/UsageMonitor;)Landroid/content/Context;

    move-result-object v2

    const-string v3, "lastUsageCheckFile"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 422
    .local v1, "editor":Landroid/content/SharedPreferences$Editor;
    const-string v2, "lastUsageCheckTime"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-interface {v1, v2, v3, v4}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 423
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 425
    sget-object v2, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    const-string v4, "UsageMonitor: UsageMonitoringThread: updateLastChecked() updated"

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 432
    .end local v1    # "editor":Landroid/content/SharedPreferences$Editor;
    :goto_0
    return-void

    .line 427
    :catch_0
    move-exception v0

    .line 430
    .local v0, "e":Ljava/lang/Exception;
    sget-object v2, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    const-string v4, "UsageMonitor: UsageMonitoringThread: updateLastChecked() failed"

    invoke-static {v2, v3, v4, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method


# virtual methods
.method public run()V
    .locals 34

    .prologue
    .line 238
    :try_start_0
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/getjar/sdk/data/usage/UsageMonitor$UsageMonitoringThread;->this$0:Lcom/getjar/sdk/data/usage/UsageMonitor;

    sget-object v5, Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;->STARTED:Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;

    invoke-static {v4, v5}, Lcom/getjar/sdk/data/usage/UsageMonitor;->access$102(Lcom/getjar/sdk/data/usage/UsageMonitor;Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;)Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;

    .line 240
    sget-object v4, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    sget-object v11, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v12, "UsageMonitor: UsageMonitoringThread: started [thread:%1$d]"

    const/4 v13, 0x1

    new-array v13, v13, [Ljava/lang/Object;

    const/16 v30, 0x0

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v31

    invoke-virtual/range {v31 .. v31}, Ljava/lang/Thread;->getId()J

    move-result-wide v31

    invoke-static/range {v31 .. v32}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v31

    aput-object v31, v13, v30

    invoke-static {v11, v12, v13}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-static {v4, v5, v11}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 245
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/getjar/sdk/data/usage/UsageMonitor$UsageMonitoringThread;->this$0:Lcom/getjar/sdk/data/usage/UsageMonitor;

    invoke-static {v4}, Lcom/getjar/sdk/data/usage/UsageMonitor;->access$200(Lcom/getjar/sdk/data/usage/UsageMonitor;)Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Lcom/getjar/sdk/data/usage/UsageManager;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/usage/UsageManager;

    move-result-object v2

    .line 246
    .local v2, "usageManager":Lcom/getjar/sdk/data/usage/UsageManager;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/getjar/sdk/data/usage/UsageMonitor$UsageMonitoringThread;->this$0:Lcom/getjar/sdk/data/usage/UsageMonitor;

    invoke-static {v4}, Lcom/getjar/sdk/data/usage/UsageMonitor;->access$200(Lcom/getjar/sdk/data/usage/UsageMonitor;)Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Lcom/getjar/sdk/data/usage/UsageDatabase;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/usage/UsageDatabase;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    move-result-object v8

    .line 253
    .local v8, "usageDB":Lcom/getjar/sdk/data/usage/UsageDatabase;
    const-wide/16 v20, 0x0

    .line 255
    .local v20, "lastCheckTime":J
    :try_start_1
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/getjar/sdk/data/usage/UsageMonitor$UsageMonitoringThread;->this$0:Lcom/getjar/sdk/data/usage/UsageMonitor;

    invoke-static {v4}, Lcom/getjar/sdk/data/usage/UsageMonitor;->access$200(Lcom/getjar/sdk/data/usage/UsageMonitor;)Landroid/content/Context;

    move-result-object v4

    const-string v5, "lastUsageCheckFile"

    const/4 v11, 0x0

    invoke-virtual {v4, v5, v11}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v26

    .line 256
    .local v26, "prefs":Landroid/content/SharedPreferences;
    const-string v4, "lastUsageCheckTime"

    const-wide/16 v11, 0x0

    move-object/from16 v0, v26

    invoke-interface {v0, v4, v11, v12}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_3
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-result-wide v20

    .line 264
    .end local v26    # "prefs":Landroid/content/SharedPreferences;
    :goto_0
    :try_start_2
    sget-object v4, Lcom/getjar/sdk/data/usage/SessionEvent$Reason;->THREAD_START:Lcom/getjar/sdk/data/usage/SessionEvent$Reason;

    const/4 v5, 0x0

    move-wide/from16 v0, v20

    invoke-virtual {v2, v4, v5, v0, v1}, Lcom/getjar/sdk/data/usage/UsageManager;->closeAllOpenAppSessions(Lcom/getjar/sdk/data/usage/SessionEvent$Reason;Ljava/lang/String;J)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_4
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 271
    :goto_1
    :try_start_3
    sget-object v4, Lcom/getjar/sdk/data/usage/SessionEvent$Reason;->THREAD_START:Lcom/getjar/sdk/data/usage/SessionEvent$Reason;

    const/4 v5, 0x0

    move-wide/from16 v0, v20

    invoke-virtual {v8, v4, v5, v0, v1}, Lcom/getjar/sdk/data/usage/UsageDatabase;->phoneSessionStop(Lcom/getjar/sdk/data/usage/SessionEvent$Reason;Ljava/lang/String;J)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_5
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 277
    :goto_2
    :try_start_4
    invoke-direct/range {p0 .. p0}, Lcom/getjar/sdk/data/usage/UsageMonitor$UsageMonitoringThread;->updateLastChecked()V

    .line 280
    invoke-virtual {v8}, Lcom/getjar/sdk/data/usage/UsageDatabase;->getNewPhoneSessionID()Ljava/lang/String;

    move-result-object v6

    .line 281
    .local v6, "phoneSessionId":Ljava/lang/String;
    sget-object v4, Lcom/getjar/sdk/data/usage/SessionEvent$Reason;->THREAD_START:Lcom/getjar/sdk/data/usage/SessionEvent$Reason;

    const/4 v5, 0x0

    invoke-virtual {v8, v4, v5, v6}, Lcom/getjar/sdk/data/usage/UsageDatabase;->phoneSessionStart(Lcom/getjar/sdk/data/usage/SessionEvent$Reason;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 283
    const-wide/16 v28, 0x0

    .line 284
    .local v28, "trackingTimeBuffer":J
    const/16 v16, 0x0

    .line 285
    .local v16, "exitingDueToException":Z
    const/16 v17, 0x0

    .line 287
    .local v17, "exitingException":Ljava/lang/Exception;
    :cond_0
    :goto_3
    :try_start_5
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/getjar/sdk/data/usage/UsageMonitor$UsageMonitoringThread;->this$0:Lcom/getjar/sdk/data/usage/UsageMonitor;

    invoke-static {v4}, Lcom/getjar/sdk/data/usage/UsageMonitor;->access$300(Lcom/getjar/sdk/data/usage/UsageMonitor;)Z

    move-result v4

    if-nez v4, :cond_a

    .line 288
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    move-result-wide v22

    .line 292
    .local v22, "loopStart":J
    :try_start_6
    invoke-static {}, Lcom/getjar/sdk/data/usage/UsageScreenReceiver;->getInstance()Lcom/getjar/sdk/data/usage/UsageScreenReceiver;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/getjar/sdk/data/usage/UsageMonitor$UsageMonitoringThread;->this$0:Lcom/getjar/sdk/data/usage/UsageMonitor;

    invoke-static {v5}, Lcom/getjar/sdk/data/usage/UsageMonitor;->access$200(Lcom/getjar/sdk/data/usage/UsageMonitor;)Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/getjar/sdk/data/usage/UsageScreenReceiver;->isScreenOn(Landroid/content/Context;)Z

    move-result v4

    if-nez v4, :cond_2

    .line 293
    sget-object v4, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    const-string v11, "UsageMonitor: UsageMonitoringThread: exiting because the screen is not on"

    invoke-static {v4, v5, v11}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;)V

    .line 294
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/getjar/sdk/data/usage/UsageMonitor$UsageMonitoringThread;->this$0:Lcom/getjar/sdk/data/usage/UsageMonitor;

    const/4 v5, 0x1

    invoke-static {v4, v5}, Lcom/getjar/sdk/data/usage/UsageMonitor;->access$302(Lcom/getjar/sdk/data/usage/UsageMonitor;Z)Z
    :try_end_6
    .catch Ljava/lang/InterruptedException; {:try_start_6 .. :try_end_6} :catch_7
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 349
    :try_start_7
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sub-long v4, v4, v22

    add-long v28, v28, v4

    .line 350
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/getjar/sdk/data/usage/UsageMonitor$UsageMonitoringThread;->this$0:Lcom/getjar/sdk/data/usage/UsageMonitor;

    invoke-static {v4}, Lcom/getjar/sdk/data/usage/UsageMonitor;->access$700(Lcom/getjar/sdk/data/usage/UsageMonitor;)J

    move-result-wide v4

    cmp-long v4, v28, v4

    if-ltz v4, :cond_0

    .line 351
    const-wide/16 v28, 0x0

    .line 352
    invoke-direct/range {p0 .. p0}, Lcom/getjar/sdk/data/usage/UsageMonitor$UsageMonitoringThread;->updateLastChecked()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_1
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 357
    :try_start_8
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/getjar/sdk/data/usage/UsageMonitor$UsageMonitoringThread;->this$0:Lcom/getjar/sdk/data/usage/UsageMonitor;

    invoke-static {v4}, Lcom/getjar/sdk/data/usage/UsageMonitor;->access$800(Lcom/getjar/sdk/data/usage/UsageMonitor;)Lcom/getjar/sdk/comm/CommContext;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/getjar/sdk/data/usage/UsageMonitor$UsageMonitoringThread;->this$0:Lcom/getjar/sdk/data/usage/UsageMonitor;

    invoke-static {v5}, Lcom/getjar/sdk/data/usage/UsageMonitor;->access$800(Lcom/getjar/sdk/data/usage/UsageMonitor;)Lcom/getjar/sdk/comm/CommContext;

    move-result-object v5

    const/4 v11, 0x0

    invoke-static {v5, v11}, Lcom/getjar/sdk/comm/GetJarConfig;->getInstance(Lcom/getjar/sdk/comm/CommContext;Z)Lcom/getjar/sdk/comm/GetJarConfig;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/getjar/sdk/utilities/AlarmsUtility;->startBackgroundReporting(Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/comm/GetJarConfig;)V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_6
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 365
    :goto_4
    :try_start_9
    invoke-virtual {v8}, Lcom/getjar/sdk/data/usage/UsageDatabase;->purgeSyncedClosedEntries()V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_0
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    goto :goto_3

    .line 366
    :catch_0
    move-exception v15

    .line 367
    .local v15, "e":Ljava/lang/Exception;
    :try_start_a
    sget-object v4, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    const-string v11, "Error in purgeSyncedClosedEntries"

    invoke-static {v4, v5, v11, v15}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;Ljava/lang/Throwable;)V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_1
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    goto :goto_3

    .line 373
    .end local v15    # "e":Ljava/lang/Exception;
    .end local v22    # "loopStart":J
    :catch_1
    move-exception v15

    .line 374
    .restart local v15    # "e":Ljava/lang/Exception;
    const/16 v16, 0x1

    .line 375
    move-object/from16 v17, v15

    .line 376
    :try_start_b
    throw v15
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_0

    .line 379
    .end local v15    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v4

    if-eqz v16, :cond_d

    :try_start_c
    sget-object v9, Lcom/getjar/sdk/data/usage/SessionEvent$Reason;->THREAD_EXCEPTION:Lcom/getjar/sdk/data/usage/SessionEvent$Reason;

    .line 381
    .local v9, "reason":Lcom/getjar/sdk/data/usage/SessionEvent$Reason;
    :goto_5
    const/4 v10, 0x0

    .line 382
    .local v10, "reasonDetails":Ljava/lang/String;
    if-eqz v17, :cond_1

    .line 383
    invoke-static/range {v17 .. v17}, Lcom/getjar/sdk/logging/Logger;->getThrowableDump(Ljava/lang/Throwable;)Ljava/lang/String;
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_2
    .catchall {:try_start_c .. :try_end_c} :catchall_1

    move-result-object v10

    .line 391
    :cond_1
    const/4 v5, 0x0

    :try_start_d
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v11

    invoke-virtual {v2, v9, v5, v11, v12}, Lcom/getjar/sdk/data/usage/UsageManager;->closeAllOpenAppSessions(Lcom/getjar/sdk/data/usage/SessionEvent$Reason;Ljava/lang/String;J)V
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_10
    .catchall {:try_start_d .. :try_end_d} :catchall_1

    .line 399
    :goto_6
    :try_start_e
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v11

    move-object v13, v6

    invoke-virtual/range {v8 .. v13}, Lcom/getjar/sdk/data/usage/UsageDatabase;->phoneSessionStop(Lcom/getjar/sdk/data/usage/SessionEvent$Reason;Ljava/lang/String;JLjava/lang/String;)V
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_11
    .catchall {:try_start_e .. :try_end_e} :catchall_1

    .line 403
    :goto_7
    :try_start_f
    throw v4
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_f} :catch_2
    .catchall {:try_start_f .. :try_end_f} :catchall_1

    .line 407
    .end local v2    # "usageManager":Lcom/getjar/sdk/data/usage/UsageManager;
    .end local v6    # "phoneSessionId":Ljava/lang/String;
    .end local v8    # "usageDB":Lcom/getjar/sdk/data/usage/UsageDatabase;
    .end local v9    # "reason":Lcom/getjar/sdk/data/usage/SessionEvent$Reason;
    .end local v10    # "reasonDetails":Ljava/lang/String;
    .end local v16    # "exitingDueToException":Z
    .end local v17    # "exitingException":Ljava/lang/Exception;
    .end local v20    # "lastCheckTime":J
    .end local v28    # "trackingTimeBuffer":J
    :catch_2
    move-exception v15

    .line 408
    .restart local v15    # "e":Ljava/lang/Exception;
    :try_start_10
    sget-object v4, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    const-string v11, "UsageMonitor: UsageMonitoringThread: run() failed"

    invoke-static {v4, v5, v11, v15}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_1

    .line 410
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/getjar/sdk/data/usage/UsageMonitor$UsageMonitoringThread;->this$0:Lcom/getjar/sdk/data/usage/UsageMonitor;

    invoke-static {v4}, Lcom/getjar/sdk/data/usage/UsageMonitor;->access$900(Lcom/getjar/sdk/data/usage/UsageMonitor;)Ljava/lang/Object;

    move-result-object v5

    monitor-enter v5

    .line 411
    :try_start_11
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/getjar/sdk/data/usage/UsageMonitor$UsageMonitoringThread;->this$0:Lcom/getjar/sdk/data/usage/UsageMonitor;

    sget-object v11, Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;->STOPPED:Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;

    invoke-static {v4, v11}, Lcom/getjar/sdk/data/usage/UsageMonitor;->access$102(Lcom/getjar/sdk/data/usage/UsageMonitor;Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;)Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;

    .line 412
    monitor-exit v5
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_5

    .line 413
    sget-object v4, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    sget-object v11, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v12, "UsageMonitor: UsageMonitoringThread: exiting [thread:%1$d]"

    const/4 v13, 0x1

    new-array v13, v13, [Ljava/lang/Object;

    const/16 v30, 0x0

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v31

    invoke-virtual/range {v31 .. v31}, Ljava/lang/Thread;->getId()J

    move-result-wide v31

    invoke-static/range {v31 .. v32}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v31

    aput-object v31, v13, v30

    invoke-static {v11, v12, v13}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-static {v4, v5, v11}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 415
    .end local v15    # "e":Ljava/lang/Exception;
    :goto_8
    return-void

    .line 257
    .restart local v2    # "usageManager":Lcom/getjar/sdk/data/usage/UsageManager;
    .restart local v8    # "usageDB":Lcom/getjar/sdk/data/usage/UsageDatabase;
    .restart local v20    # "lastCheckTime":J
    :catch_3
    move-exception v15

    .line 258
    .restart local v15    # "e":Ljava/lang/Exception;
    :try_start_12
    sget-object v4, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    const-string v11, "UsageMonitor: UsageMonitoringThread: SharedPreferences read failed"

    invoke-static {v4, v5, v11, v15}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V
    :try_end_12
    .catch Ljava/lang/Exception; {:try_start_12 .. :try_end_12} :catch_2
    .catchall {:try_start_12 .. :try_end_12} :catchall_1

    goto/16 :goto_0

    .line 410
    .end local v2    # "usageManager":Lcom/getjar/sdk/data/usage/UsageManager;
    .end local v8    # "usageDB":Lcom/getjar/sdk/data/usage/UsageDatabase;
    .end local v15    # "e":Ljava/lang/Exception;
    .end local v20    # "lastCheckTime":J
    :catchall_1
    move-exception v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/getjar/sdk/data/usage/UsageMonitor$UsageMonitoringThread;->this$0:Lcom/getjar/sdk/data/usage/UsageMonitor;

    invoke-static {v5}, Lcom/getjar/sdk/data/usage/UsageMonitor;->access$900(Lcom/getjar/sdk/data/usage/UsageMonitor;)Ljava/lang/Object;

    move-result-object v5

    monitor-enter v5

    .line 411
    :try_start_13
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/getjar/sdk/data/usage/UsageMonitor$UsageMonitoringThread;->this$0:Lcom/getjar/sdk/data/usage/UsageMonitor;

    sget-object v12, Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;->STOPPED:Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;

    invoke-static {v11, v12}, Lcom/getjar/sdk/data/usage/UsageMonitor;->access$102(Lcom/getjar/sdk/data/usage/UsageMonitor;Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;)Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;

    .line 412
    monitor-exit v5
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_6

    .line 413
    sget-object v5, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v11

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v13, "UsageMonitor: UsageMonitoringThread: exiting [thread:%1$d]"

    const/16 v30, 0x1

    move/from16 v0, v30

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v30, v0

    const/16 v31, 0x0

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/Thread;->getId()J

    move-result-wide v32

    invoke-static/range {v32 .. v33}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v32

    aput-object v32, v30, v31

    move-object/from16 v0, v30

    invoke-static {v5, v13, v0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v11, v12, v5}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    throw v4

    .line 265
    .restart local v2    # "usageManager":Lcom/getjar/sdk/data/usage/UsageManager;
    .restart local v8    # "usageDB":Lcom/getjar/sdk/data/usage/UsageDatabase;
    .restart local v20    # "lastCheckTime":J
    :catch_4
    move-exception v15

    .line 266
    .restart local v15    # "e":Ljava/lang/Exception;
    :try_start_14
    sget-object v4, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    const-string v11, "UsageMonitor: UsageMonitoringThread: failed to close open app sessions."

    invoke-static {v4, v5, v11, v15}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_1

    .line 272
    .end local v15    # "e":Ljava/lang/Exception;
    :catch_5
    move-exception v15

    .line 273
    .restart local v15    # "e":Ljava/lang/Exception;
    sget-object v4, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    const-string v11, "UsageMonitor: UsageMonitoringThread: failed to close open phone sessions."

    invoke-static {v4, v5, v11, v15}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V
    :try_end_14
    .catch Ljava/lang/Exception; {:try_start_14 .. :try_end_14} :catch_2
    .catchall {:try_start_14 .. :try_end_14} :catchall_1

    goto/16 :goto_2

    .line 358
    .end local v15    # "e":Ljava/lang/Exception;
    .restart local v6    # "phoneSessionId":Ljava/lang/String;
    .restart local v16    # "exitingDueToException":Z
    .restart local v17    # "exitingException":Ljava/lang/Exception;
    .restart local v22    # "loopStart":J
    .restart local v28    # "trackingTimeBuffer":J
    :catch_6
    move-exception v15

    .line 359
    .restart local v15    # "e":Ljava/lang/Exception;
    :try_start_15
    sget-object v4, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    const-string v11, "Error in AlarmUtility.startBackgroundReporting"

    invoke-static {v4, v5, v11, v15}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;Ljava/lang/Throwable;)V
    :try_end_15
    .catch Ljava/lang/Exception; {:try_start_15 .. :try_end_15} :catch_1
    .catchall {:try_start_15 .. :try_end_15} :catchall_0

    goto/16 :goto_4

    .line 299
    .end local v15    # "e":Ljava/lang/Exception;
    :cond_2
    :try_start_16
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/getjar/sdk/data/usage/UsageMonitor$UsageMonitoringThread;->this$0:Lcom/getjar/sdk/data/usage/UsageMonitor;

    invoke-static {v4}, Lcom/getjar/sdk/data/usage/UsageMonitor;->access$400(Lcom/getjar/sdk/data/usage/UsageMonitor;)Ljava/util/List;

    move-result-object v27

    .line 300
    .local v27, "runningPackageNames":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    sget-object v4, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    sget-object v11, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v12, "UsageMonitor: UsageMonitoringThread: looking at %1$d most recently run apps"

    const/4 v13, 0x1

    new-array v13, v13, [Ljava/lang/Object;

    const/16 v30, 0x0

    invoke-interface/range {v27 .. v27}, Ljava/util/List;->size()I

    move-result v31

    invoke-static/range {v31 .. v31}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v31

    aput-object v31, v13, v30

    invoke-static {v11, v12, v13}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-static {v4, v5, v11}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 303
    invoke-virtual {v8}, Lcom/getjar/sdk/data/usage/UsageDatabase;->appSessionLoadOpenStartLists()Lcom/getjar/sdk/data/usage/ApplicationLists;

    move-result-object v24

    .line 304
    .local v24, "openPackageNameLists":Lcom/getjar/sdk/data/usage/ApplicationLists;
    sget-object v4, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    sget-object v11, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v12, "UsageMonitor: UsageMonitoringThread: %1$d new open app sessions, %2$d old open app sessions"

    const/4 v13, 0x2

    new-array v13, v13, [Ljava/lang/Object;

    const/16 v30, 0x0

    invoke-virtual/range {v24 .. v24}, Lcom/getjar/sdk/data/usage/ApplicationLists;->getNewNonDisposedStart()Ljava/util/List;

    move-result-object v31

    invoke-interface/range {v31 .. v31}, Ljava/util/List;->size()I

    move-result v31

    invoke-static/range {v31 .. v31}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v31

    aput-object v31, v13, v30

    const/16 v30, 0x1

    invoke-virtual/range {v24 .. v24}, Lcom/getjar/sdk/data/usage/ApplicationLists;->getOldNonDisposedStart()Ljava/util/List;

    move-result-object v31

    invoke-interface/range {v31 .. v31}, Ljava/util/List;->size()I

    move-result v31

    invoke-static/range {v31 .. v31}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v31

    aput-object v31, v13, v30

    invoke-static {v11, v12, v13}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-static {v4, v5, v11}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 310
    invoke-virtual/range {v24 .. v24}, Lcom/getjar/sdk/data/usage/ApplicationLists;->getOldNonDisposedStart()Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v18

    .local v18, "i$":Ljava/util/Iterator;
    :goto_9
    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;

    .line 311
    .local v14, "appSessionEvent":Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;
    sget-object v4, Lcom/getjar/sdk/data/usage/SessionEvent$Reason;->THREAD_APP_DETECTION:Lcom/getjar/sdk/data/usage/SessionEvent$Reason;

    const/4 v5, 0x0

    invoke-virtual {v2, v14, v4, v5}, Lcom/getjar/sdk/data/usage/UsageManager;->stopAppSession(Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;Lcom/getjar/sdk/data/usage/SessionEvent$Reason;Ljava/lang/String;)J
    :try_end_16
    .catch Ljava/lang/InterruptedException; {:try_start_16 .. :try_end_16} :catch_7
    .catchall {:try_start_16 .. :try_end_16} :catchall_2

    goto :goto_9

    .line 342
    .end local v14    # "appSessionEvent":Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;
    .end local v18    # "i$":Ljava/util/Iterator;
    .end local v24    # "openPackageNameLists":Lcom/getjar/sdk/data/usage/ApplicationLists;
    .end local v27    # "runningPackageNames":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :catch_7
    move-exception v19

    .line 343
    .local v19, "ie":Ljava/lang/InterruptedException;
    :try_start_17
    sget-object v4, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    sget-object v11, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v12, "UsageMonitor: UsageMonitoringThread: Received an InterruptedException [_exitMonitoringThread = %1$s]"

    const/4 v13, 0x1

    new-array v13, v13, [Ljava/lang/Object;

    const/16 v30, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getjar/sdk/data/usage/UsageMonitor$UsageMonitoringThread;->this$0:Lcom/getjar/sdk/data/usage/UsageMonitor;

    move-object/from16 v31, v0

    invoke-static/range {v31 .. v31}, Lcom/getjar/sdk/data/usage/UsageMonitor;->access$300(Lcom/getjar/sdk/data/usage/UsageMonitor;)Z

    move-result v31

    invoke-static/range {v31 .. v31}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v31

    aput-object v31, v13, v30

    invoke-static {v11, v12, v13}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-static {v4, v5, v11}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V
    :try_end_17
    .catchall {:try_start_17 .. :try_end_17} :catchall_2

    .line 349
    :try_start_18
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sub-long v4, v4, v22

    add-long v28, v28, v4

    .line 350
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/getjar/sdk/data/usage/UsageMonitor$UsageMonitoringThread;->this$0:Lcom/getjar/sdk/data/usage/UsageMonitor;

    invoke-static {v4}, Lcom/getjar/sdk/data/usage/UsageMonitor;->access$700(Lcom/getjar/sdk/data/usage/UsageMonitor;)J

    move-result-wide v4

    cmp-long v4, v28, v4

    if-ltz v4, :cond_0

    .line 351
    const-wide/16 v28, 0x0

    .line 352
    invoke-direct/range {p0 .. p0}, Lcom/getjar/sdk/data/usage/UsageMonitor$UsageMonitoringThread;->updateLastChecked()V
    :try_end_18
    .catch Ljava/lang/Exception; {:try_start_18 .. :try_end_18} :catch_1
    .catchall {:try_start_18 .. :try_end_18} :catchall_0

    .line 357
    :try_start_19
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/getjar/sdk/data/usage/UsageMonitor$UsageMonitoringThread;->this$0:Lcom/getjar/sdk/data/usage/UsageMonitor;

    invoke-static {v4}, Lcom/getjar/sdk/data/usage/UsageMonitor;->access$800(Lcom/getjar/sdk/data/usage/UsageMonitor;)Lcom/getjar/sdk/comm/CommContext;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/getjar/sdk/data/usage/UsageMonitor$UsageMonitoringThread;->this$0:Lcom/getjar/sdk/data/usage/UsageMonitor;

    invoke-static {v5}, Lcom/getjar/sdk/data/usage/UsageMonitor;->access$800(Lcom/getjar/sdk/data/usage/UsageMonitor;)Lcom/getjar/sdk/comm/CommContext;

    move-result-object v5

    const/4 v11, 0x0

    invoke-static {v5, v11}, Lcom/getjar/sdk/comm/GetJarConfig;->getInstance(Lcom/getjar/sdk/comm/CommContext;Z)Lcom/getjar/sdk/comm/GetJarConfig;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/getjar/sdk/utilities/AlarmsUtility;->startBackgroundReporting(Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/comm/GetJarConfig;)V
    :try_end_19
    .catch Ljava/lang/Exception; {:try_start_19 .. :try_end_19} :catch_b
    .catchall {:try_start_19 .. :try_end_19} :catchall_0

    .line 365
    :goto_a
    :try_start_1a
    invoke-virtual {v8}, Lcom/getjar/sdk/data/usage/UsageDatabase;->purgeSyncedClosedEntries()V
    :try_end_1a
    .catch Ljava/lang/Exception; {:try_start_1a .. :try_end_1a} :catch_8
    .catchall {:try_start_1a .. :try_end_1a} :catchall_0

    goto/16 :goto_3

    .line 366
    :catch_8
    move-exception v15

    .line 367
    .restart local v15    # "e":Ljava/lang/Exception;
    :try_start_1b
    sget-object v4, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    const-string v11, "Error in purgeSyncedClosedEntries"

    invoke-static {v4, v5, v11, v15}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1b
    .catch Ljava/lang/Exception; {:try_start_1b .. :try_end_1b} :catch_1
    .catchall {:try_start_1b .. :try_end_1b} :catchall_0

    goto/16 :goto_3

    .line 315
    .end local v15    # "e":Ljava/lang/Exception;
    .end local v19    # "ie":Ljava/lang/InterruptedException;
    .restart local v18    # "i$":Ljava/util/Iterator;
    .restart local v24    # "openPackageNameLists":Lcom/getjar/sdk/data/usage/ApplicationLists;
    .restart local v27    # "runningPackageNames":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_3
    :try_start_1c
    invoke-virtual/range {v24 .. v24}, Lcom/getjar/sdk/data/usage/ApplicationLists;->getNewNonDisposedStart()Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v18

    :cond_4
    :goto_b
    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_6

    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;

    .line 316
    .restart local v14    # "appSessionEvent":Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;
    invoke-virtual {v14}, Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;->getPackageName()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, v27

    invoke-interface {v0, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_4

    invoke-virtual/range {v24 .. v24}, Lcom/getjar/sdk/data/usage/ApplicationLists;->getOldNonDisposedStart()Ljava/util/List;

    move-result-object v4

    invoke-virtual {v14}, Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;->getPackageName()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_4

    .line 317
    sget-object v4, Lcom/getjar/sdk/data/usage/SessionEvent$Reason;->THREAD_APP_DETECTION:Lcom/getjar/sdk/data/usage/SessionEvent$Reason;

    const/4 v5, 0x0

    invoke-virtual {v2, v14, v4, v5}, Lcom/getjar/sdk/data/usage/UsageManager;->stopAppSession(Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;Lcom/getjar/sdk/data/usage/SessionEvent$Reason;Ljava/lang/String;)J
    :try_end_1c
    .catch Ljava/lang/InterruptedException; {:try_start_1c .. :try_end_1c} :catch_7
    .catchall {:try_start_1c .. :try_end_1c} :catchall_2

    goto :goto_b

    .line 349
    .end local v14    # "appSessionEvent":Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;
    .end local v18    # "i$":Ljava/util/Iterator;
    .end local v24    # "openPackageNameLists":Lcom/getjar/sdk/data/usage/ApplicationLists;
    .end local v27    # "runningPackageNames":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :catchall_2
    move-exception v4

    :try_start_1d
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v11

    sub-long v11, v11, v22

    add-long v28, v28, v11

    .line 350
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/getjar/sdk/data/usage/UsageMonitor$UsageMonitoringThread;->this$0:Lcom/getjar/sdk/data/usage/UsageMonitor;

    invoke-static {v5}, Lcom/getjar/sdk/data/usage/UsageMonitor;->access$700(Lcom/getjar/sdk/data/usage/UsageMonitor;)J

    move-result-wide v11

    cmp-long v5, v28, v11

    if-ltz v5, :cond_5

    .line 351
    const-wide/16 v28, 0x0

    .line 352
    invoke-direct/range {p0 .. p0}, Lcom/getjar/sdk/data/usage/UsageMonitor$UsageMonitoringThread;->updateLastChecked()V
    :try_end_1d
    .catch Ljava/lang/Exception; {:try_start_1d .. :try_end_1d} :catch_1
    .catchall {:try_start_1d .. :try_end_1d} :catchall_0

    .line 357
    :try_start_1e
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/getjar/sdk/data/usage/UsageMonitor$UsageMonitoringThread;->this$0:Lcom/getjar/sdk/data/usage/UsageMonitor;

    invoke-static {v5}, Lcom/getjar/sdk/data/usage/UsageMonitor;->access$800(Lcom/getjar/sdk/data/usage/UsageMonitor;)Lcom/getjar/sdk/comm/CommContext;

    move-result-object v5

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/getjar/sdk/data/usage/UsageMonitor$UsageMonitoringThread;->this$0:Lcom/getjar/sdk/data/usage/UsageMonitor;

    invoke-static {v11}, Lcom/getjar/sdk/data/usage/UsageMonitor;->access$800(Lcom/getjar/sdk/data/usage/UsageMonitor;)Lcom/getjar/sdk/comm/CommContext;

    move-result-object v11

    const/4 v12, 0x0

    invoke-static {v11, v12}, Lcom/getjar/sdk/comm/GetJarConfig;->getInstance(Lcom/getjar/sdk/comm/CommContext;Z)Lcom/getjar/sdk/comm/GetJarConfig;

    move-result-object v11

    invoke-static {v5, v11}, Lcom/getjar/sdk/utilities/AlarmsUtility;->startBackgroundReporting(Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/comm/GetJarConfig;)V
    :try_end_1e
    .catch Ljava/lang/Exception; {:try_start_1e .. :try_end_1e} :catch_c
    .catchall {:try_start_1e .. :try_end_1e} :catchall_0

    .line 365
    :goto_c
    :try_start_1f
    invoke-virtual {v8}, Lcom/getjar/sdk/data/usage/UsageDatabase;->purgeSyncedClosedEntries()V
    :try_end_1f
    .catch Ljava/lang/Exception; {:try_start_1f .. :try_end_1f} :catch_d
    .catchall {:try_start_1f .. :try_end_1f} :catchall_0

    .line 368
    :cond_5
    :goto_d
    :try_start_20
    throw v4
    :try_end_20
    .catch Ljava/lang/Exception; {:try_start_20 .. :try_end_20} :catch_1
    .catchall {:try_start_20 .. :try_end_20} :catchall_0

    .line 322
    .restart local v18    # "i$":Ljava/util/Iterator;
    .restart local v24    # "openPackageNameLists":Lcom/getjar/sdk/data/usage/ApplicationLists;
    .restart local v27    # "runningPackageNames":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_6
    :try_start_21
    invoke-virtual {v8}, Lcom/getjar/sdk/data/usage/UsageDatabase;->appSessionLoadOpenStartPackageNames()Ljava/util/List;

    move-result-object v25

    .line 323
    .local v25, "openStartPackageNames":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface/range {v27 .. v27}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v18

    :cond_7
    :goto_e
    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_8

    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 324
    .local v3, "packageName":Ljava/lang/String;
    move-object/from16 v0, v25

    invoke-interface {v0, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_7

    .line 325
    invoke-virtual {v8}, Lcom/getjar/sdk/data/usage/UsageDatabase;->getNewApplicationSessionID()Ljava/lang/String;

    move-result-object v7

    .line 326
    .local v7, "newAppSessionId":Ljava/lang/String;
    sget-object v4, Lcom/getjar/sdk/data/usage/SessionEvent$Reason;->THREAD_APP_DETECTION:Lcom/getjar/sdk/data/usage/SessionEvent$Reason;

    const/4 v5, 0x0

    invoke-virtual/range {v2 .. v7}, Lcom/getjar/sdk/data/usage/UsageManager;->startAppSession(Ljava/lang/String;Lcom/getjar/sdk/data/usage/SessionEvent$Reason;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)J

    goto :goto_e

    .line 331
    .end local v3    # "packageName":Ljava/lang/String;
    .end local v7    # "newAppSessionId":Ljava/lang/String;
    :cond_8
    const/16 v27, 0x0

    .line 332
    const/16 v25, 0x0

    .line 333
    const/16 v24, 0x0

    .line 336
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/getjar/sdk/data/usage/UsageMonitor$UsageMonitoringThread;->this$0:Lcom/getjar/sdk/data/usage/UsageMonitor;

    invoke-static {v4}, Lcom/getjar/sdk/data/usage/UsageMonitor;->access$300(Lcom/getjar/sdk/data/usage/UsageMonitor;)Z

    move-result v4

    if-nez v4, :cond_9

    .line 337
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/getjar/sdk/data/usage/UsageMonitor$UsageMonitoringThread;->this$0:Lcom/getjar/sdk/data/usage/UsageMonitor;

    invoke-static {v4}, Lcom/getjar/sdk/data/usage/UsageMonitor;->access$500(Lcom/getjar/sdk/data/usage/UsageMonitor;)Ljava/lang/Object;

    move-result-object v5

    monitor-enter v5
    :try_end_21
    .catch Ljava/lang/InterruptedException; {:try_start_21 .. :try_end_21} :catch_7
    .catchall {:try_start_21 .. :try_end_21} :catchall_2

    .line 338
    :try_start_22
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/getjar/sdk/data/usage/UsageMonitor$UsageMonitoringThread;->this$0:Lcom/getjar/sdk/data/usage/UsageMonitor;

    invoke-static {v4}, Lcom/getjar/sdk/data/usage/UsageMonitor;->access$500(Lcom/getjar/sdk/data/usage/UsageMonitor;)Ljava/lang/Object;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/getjar/sdk/data/usage/UsageMonitor$UsageMonitoringThread;->this$0:Lcom/getjar/sdk/data/usage/UsageMonitor;

    invoke-static {v11}, Lcom/getjar/sdk/data/usage/UsageMonitor;->access$600(Lcom/getjar/sdk/data/usage/UsageMonitor;)J

    move-result-wide v11

    invoke-virtual {v4, v11, v12}, Ljava/lang/Object;->wait(J)V

    .line 339
    monitor-exit v5
    :try_end_22
    .catchall {:try_start_22 .. :try_end_22} :catchall_3

    .line 349
    :cond_9
    :try_start_23
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sub-long v4, v4, v22

    add-long v28, v28, v4

    .line 350
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/getjar/sdk/data/usage/UsageMonitor$UsageMonitoringThread;->this$0:Lcom/getjar/sdk/data/usage/UsageMonitor;

    invoke-static {v4}, Lcom/getjar/sdk/data/usage/UsageMonitor;->access$700(Lcom/getjar/sdk/data/usage/UsageMonitor;)J

    move-result-wide v4

    cmp-long v4, v28, v4

    if-ltz v4, :cond_0

    .line 351
    const-wide/16 v28, 0x0

    .line 352
    invoke-direct/range {p0 .. p0}, Lcom/getjar/sdk/data/usage/UsageMonitor$UsageMonitoringThread;->updateLastChecked()V
    :try_end_23
    .catch Ljava/lang/Exception; {:try_start_23 .. :try_end_23} :catch_1
    .catchall {:try_start_23 .. :try_end_23} :catchall_0

    .line 357
    :try_start_24
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/getjar/sdk/data/usage/UsageMonitor$UsageMonitoringThread;->this$0:Lcom/getjar/sdk/data/usage/UsageMonitor;

    invoke-static {v4}, Lcom/getjar/sdk/data/usage/UsageMonitor;->access$800(Lcom/getjar/sdk/data/usage/UsageMonitor;)Lcom/getjar/sdk/comm/CommContext;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/getjar/sdk/data/usage/UsageMonitor$UsageMonitoringThread;->this$0:Lcom/getjar/sdk/data/usage/UsageMonitor;

    invoke-static {v5}, Lcom/getjar/sdk/data/usage/UsageMonitor;->access$800(Lcom/getjar/sdk/data/usage/UsageMonitor;)Lcom/getjar/sdk/comm/CommContext;

    move-result-object v5

    const/4 v11, 0x0

    invoke-static {v5, v11}, Lcom/getjar/sdk/comm/GetJarConfig;->getInstance(Lcom/getjar/sdk/comm/CommContext;Z)Lcom/getjar/sdk/comm/GetJarConfig;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/getjar/sdk/utilities/AlarmsUtility;->startBackgroundReporting(Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/comm/GetJarConfig;)V
    :try_end_24
    .catch Ljava/lang/Exception; {:try_start_24 .. :try_end_24} :catch_a
    .catchall {:try_start_24 .. :try_end_24} :catchall_0

    .line 365
    :goto_f
    :try_start_25
    invoke-virtual {v8}, Lcom/getjar/sdk/data/usage/UsageDatabase;->purgeSyncedClosedEntries()V
    :try_end_25
    .catch Ljava/lang/Exception; {:try_start_25 .. :try_end_25} :catch_9
    .catchall {:try_start_25 .. :try_end_25} :catchall_0

    goto/16 :goto_3

    .line 366
    :catch_9
    move-exception v15

    .line 367
    .restart local v15    # "e":Ljava/lang/Exception;
    :try_start_26
    sget-object v4, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    const-string v11, "Error in purgeSyncedClosedEntries"

    invoke-static {v4, v5, v11, v15}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;Ljava/lang/Throwable;)V
    :try_end_26
    .catch Ljava/lang/Exception; {:try_start_26 .. :try_end_26} :catch_1
    .catchall {:try_start_26 .. :try_end_26} :catchall_0

    goto/16 :goto_3

    .line 339
    .end local v15    # "e":Ljava/lang/Exception;
    :catchall_3
    move-exception v4

    :try_start_27
    monitor-exit v5
    :try_end_27
    .catchall {:try_start_27 .. :try_end_27} :catchall_3

    :try_start_28
    throw v4
    :try_end_28
    .catch Ljava/lang/InterruptedException; {:try_start_28 .. :try_end_28} :catch_7
    .catchall {:try_start_28 .. :try_end_28} :catchall_2

    .line 358
    :catch_a
    move-exception v15

    .line 359
    .restart local v15    # "e":Ljava/lang/Exception;
    :try_start_29
    sget-object v4, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    const-string v11, "Error in AlarmUtility.startBackgroundReporting"

    invoke-static {v4, v5, v11, v15}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_f

    .line 358
    .end local v15    # "e":Ljava/lang/Exception;
    .end local v18    # "i$":Ljava/util/Iterator;
    .end local v24    # "openPackageNameLists":Lcom/getjar/sdk/data/usage/ApplicationLists;
    .end local v25    # "openStartPackageNames":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v27    # "runningPackageNames":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v19    # "ie":Ljava/lang/InterruptedException;
    :catch_b
    move-exception v15

    .line 359
    .restart local v15    # "e":Ljava/lang/Exception;
    sget-object v4, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    const-string v11, "Error in AlarmUtility.startBackgroundReporting"

    invoke-static {v4, v5, v11, v15}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_a

    .line 358
    .end local v15    # "e":Ljava/lang/Exception;
    .end local v19    # "ie":Ljava/lang/InterruptedException;
    :catch_c
    move-exception v15

    .line 359
    .restart local v15    # "e":Ljava/lang/Exception;
    sget-object v5, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v11

    const-string v5, "Error in AlarmUtility.startBackgroundReporting"

    invoke-static {v11, v12, v5, v15}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_c

    .line 366
    .end local v15    # "e":Ljava/lang/Exception;
    :catch_d
    move-exception v15

    .line 367
    .restart local v15    # "e":Ljava/lang/Exception;
    sget-object v5, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v11

    const-string v5, "Error in purgeSyncedClosedEntries"

    invoke-static {v11, v12, v5, v15}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;Ljava/lang/Throwable;)V
    :try_end_29
    .catch Ljava/lang/Exception; {:try_start_29 .. :try_end_29} :catch_1
    .catchall {:try_start_29 .. :try_end_29} :catchall_0

    goto/16 :goto_d

    .line 379
    .end local v15    # "e":Ljava/lang/Exception;
    .end local v22    # "loopStart":J
    :cond_a
    if-eqz v16, :cond_c

    :try_start_2a
    sget-object v9, Lcom/getjar/sdk/data/usage/SessionEvent$Reason;->THREAD_EXCEPTION:Lcom/getjar/sdk/data/usage/SessionEvent$Reason;

    .line 381
    .restart local v9    # "reason":Lcom/getjar/sdk/data/usage/SessionEvent$Reason;
    :goto_10
    const/4 v10, 0x0

    .line 382
    .restart local v10    # "reasonDetails":Ljava/lang/String;
    if-eqz v17, :cond_b

    .line 383
    invoke-static/range {v17 .. v17}, Lcom/getjar/sdk/logging/Logger;->getThrowableDump(Ljava/lang/Throwable;)Ljava/lang/String;
    :try_end_2a
    .catch Ljava/lang/Exception; {:try_start_2a .. :try_end_2a} :catch_2
    .catchall {:try_start_2a .. :try_end_2a} :catchall_1

    move-result-object v10

    .line 391
    :cond_b
    const/4 v4, 0x0

    :try_start_2b
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v11

    invoke-virtual {v2, v9, v4, v11, v12}, Lcom/getjar/sdk/data/usage/UsageManager;->closeAllOpenAppSessions(Lcom/getjar/sdk/data/usage/SessionEvent$Reason;Ljava/lang/String;J)V
    :try_end_2b
    .catch Ljava/lang/Exception; {:try_start_2b .. :try_end_2b} :catch_e
    .catchall {:try_start_2b .. :try_end_2b} :catchall_1

    .line 399
    :goto_11
    :try_start_2c
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v11

    move-object v13, v6

    invoke-virtual/range {v8 .. v13}, Lcom/getjar/sdk/data/usage/UsageDatabase;->phoneSessionStop(Lcom/getjar/sdk/data/usage/SessionEvent$Reason;Ljava/lang/String;JLjava/lang/String;)V
    :try_end_2c
    .catch Ljava/lang/Exception; {:try_start_2c .. :try_end_2c} :catch_f
    .catchall {:try_start_2c .. :try_end_2c} :catchall_1

    .line 410
    :goto_12
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/getjar/sdk/data/usage/UsageMonitor$UsageMonitoringThread;->this$0:Lcom/getjar/sdk/data/usage/UsageMonitor;

    invoke-static {v4}, Lcom/getjar/sdk/data/usage/UsageMonitor;->access$900(Lcom/getjar/sdk/data/usage/UsageMonitor;)Ljava/lang/Object;

    move-result-object v5

    monitor-enter v5

    .line 411
    :try_start_2d
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/getjar/sdk/data/usage/UsageMonitor$UsageMonitoringThread;->this$0:Lcom/getjar/sdk/data/usage/UsageMonitor;

    sget-object v11, Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;->STOPPED:Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;

    invoke-static {v4, v11}, Lcom/getjar/sdk/data/usage/UsageMonitor;->access$102(Lcom/getjar/sdk/data/usage/UsageMonitor;Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;)Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;

    .line 412
    monitor-exit v5
    :try_end_2d
    .catchall {:try_start_2d .. :try_end_2d} :catchall_4

    .line 413
    sget-object v4, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    sget-object v11, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v12, "UsageMonitor: UsageMonitoringThread: exiting [thread:%1$d]"

    const/4 v13, 0x1

    new-array v13, v13, [Ljava/lang/Object;

    const/16 v30, 0x0

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v31

    invoke-virtual/range {v31 .. v31}, Ljava/lang/Thread;->getId()J

    move-result-wide v31

    invoke-static/range {v31 .. v32}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v31

    aput-object v31, v13, v30

    invoke-static {v11, v12, v13}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-static {v4, v5, v11}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    goto/16 :goto_8

    .line 379
    .end local v9    # "reason":Lcom/getjar/sdk/data/usage/SessionEvent$Reason;
    .end local v10    # "reasonDetails":Ljava/lang/String;
    :cond_c
    :try_start_2e
    sget-object v9, Lcom/getjar/sdk/data/usage/SessionEvent$Reason;->THREAD_EXIT:Lcom/getjar/sdk/data/usage/SessionEvent$Reason;

    goto :goto_10

    .line 392
    .restart local v9    # "reason":Lcom/getjar/sdk/data/usage/SessionEvent$Reason;
    .restart local v10    # "reasonDetails":Ljava/lang/String;
    :catch_e
    move-exception v15

    .line 393
    .restart local v15    # "e":Ljava/lang/Exception;
    sget-object v4, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    const-string v11, "UsageMonitor: UsageMonitoringThread: failed to close all open app sessions."

    invoke-static {v4, v5, v11, v15}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_11

    .line 400
    .end local v15    # "e":Ljava/lang/Exception;
    :catch_f
    move-exception v15

    .line 401
    .restart local v15    # "e":Ljava/lang/Exception;
    sget-object v4, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    const-string v11, "UsageMonitor: UsageMonitoringThread: failed to close the phone session."

    invoke-static {v4, v5, v11, v15}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_12

    .line 379
    .end local v9    # "reason":Lcom/getjar/sdk/data/usage/SessionEvent$Reason;
    .end local v10    # "reasonDetails":Ljava/lang/String;
    .end local v15    # "e":Ljava/lang/Exception;
    :cond_d
    sget-object v9, Lcom/getjar/sdk/data/usage/SessionEvent$Reason;->THREAD_EXIT:Lcom/getjar/sdk/data/usage/SessionEvent$Reason;

    goto/16 :goto_5

    .line 392
    .restart local v9    # "reason":Lcom/getjar/sdk/data/usage/SessionEvent$Reason;
    .restart local v10    # "reasonDetails":Ljava/lang/String;
    :catch_10
    move-exception v15

    .line 393
    .restart local v15    # "e":Ljava/lang/Exception;
    sget-object v5, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v11

    const-string v5, "UsageMonitor: UsageMonitoringThread: failed to close all open app sessions."

    invoke-static {v11, v12, v5, v15}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_6

    .line 400
    .end local v15    # "e":Ljava/lang/Exception;
    :catch_11
    move-exception v15

    .line 401
    .restart local v15    # "e":Ljava/lang/Exception;
    sget-object v5, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v11

    const-string v5, "UsageMonitor: UsageMonitoringThread: failed to close the phone session."

    invoke-static {v11, v12, v5, v15}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2e
    .catch Ljava/lang/Exception; {:try_start_2e .. :try_end_2e} :catch_2
    .catchall {:try_start_2e .. :try_end_2e} :catchall_1

    goto/16 :goto_7

    .line 412
    .end local v15    # "e":Ljava/lang/Exception;
    :catchall_4
    move-exception v4

    :try_start_2f
    monitor-exit v5
    :try_end_2f
    .catchall {:try_start_2f .. :try_end_2f} :catchall_4

    throw v4

    .end local v2    # "usageManager":Lcom/getjar/sdk/data/usage/UsageManager;
    .end local v6    # "phoneSessionId":Ljava/lang/String;
    .end local v8    # "usageDB":Lcom/getjar/sdk/data/usage/UsageDatabase;
    .end local v9    # "reason":Lcom/getjar/sdk/data/usage/SessionEvent$Reason;
    .end local v10    # "reasonDetails":Ljava/lang/String;
    .end local v16    # "exitingDueToException":Z
    .end local v17    # "exitingException":Ljava/lang/Exception;
    .end local v20    # "lastCheckTime":J
    .end local v28    # "trackingTimeBuffer":J
    .restart local v15    # "e":Ljava/lang/Exception;
    :catchall_5
    move-exception v4

    :try_start_30
    monitor-exit v5
    :try_end_30
    .catchall {:try_start_30 .. :try_end_30} :catchall_5

    throw v4

    .end local v15    # "e":Ljava/lang/Exception;
    :catchall_6
    move-exception v4

    :try_start_31
    monitor-exit v5
    :try_end_31
    .catchall {:try_start_31 .. :try_end_31} :catchall_6

    throw v4
.end method
