.class Lcom/getjar/sdk/data/earning/EarningMonitor$EarningMonitoringThread;
.super Ljava/lang/Thread;
.source "EarningMonitor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getjar/sdk/data/earning/EarningMonitor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "EarningMonitoringThread"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/getjar/sdk/data/earning/EarningMonitor;


# direct methods
.method private constructor <init>(Lcom/getjar/sdk/data/earning/EarningMonitor;)V
    .locals 0

    .prologue
    .line 271
    iput-object p1, p0, Lcom/getjar/sdk/data/earning/EarningMonitor$EarningMonitoringThread;->this$0:Lcom/getjar/sdk/data/earning/EarningMonitor;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/getjar/sdk/data/earning/EarningMonitor;Lcom/getjar/sdk/data/earning/EarningMonitor$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/getjar/sdk/data/earning/EarningMonitor;
    .param p2, "x1"    # Lcom/getjar/sdk/data/earning/EarningMonitor$1;

    .prologue
    .line 271
    invoke-direct {p0, p1}, Lcom/getjar/sdk/data/earning/EarningMonitor$EarningMonitoringThread;-><init>(Lcom/getjar/sdk/data/earning/EarningMonitor;)V

    return-void
.end method

.method private processOpenEvent(Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/data/earning/EarnStateRecord;)Z
    .locals 7
    .param p1, "commContext"    # Lcom/getjar/sdk/comm/CommContext;
    .param p2, "appState"    # Lcom/getjar/sdk/data/earning/EarnStateRecord;

    .prologue
    .line 454
    if-nez p1, :cond_0

    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "commContext cannot be null"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 455
    :cond_0
    if-nez p2, :cond_1

    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "appState cannot be null"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 457
    :cond_1
    const/4 v2, 0x0

    .line 461
    .local v2, "result":Z
    :try_start_0
    iget-object v3, p0, Lcom/getjar/sdk/data/earning/EarningMonitor$EarningMonitoringThread;->this$0:Lcom/getjar/sdk/data/earning/EarningMonitor;

    invoke-virtual {v3, p2}, Lcom/getjar/sdk/data/earning/EarningMonitor;->ensureAppMetadataOnEarnStateRecord(Lcom/getjar/sdk/data/earning/EarnStateRecord;)Lcom/getjar/sdk/data/earning/EarnStateRecord;

    move-result-object p2

    .line 464
    iget-object v3, p0, Lcom/getjar/sdk/data/earning/EarningMonitor$EarningMonitoringThread;->this$0:Lcom/getjar/sdk/data/earning/EarningMonitor;

    iget-object v4, p0, Lcom/getjar/sdk/data/earning/EarningMonitor$EarningMonitoringThread;->this$0:Lcom/getjar/sdk/data/earning/EarningMonitor;

    invoke-static {v4}, Lcom/getjar/sdk/data/earning/EarningMonitor;->access$100(Lcom/getjar/sdk/data/earning/EarningMonitor;)Landroid/content/Context;

    move-result-object v4

    invoke-static {v3, v4, p1, p2}, Lcom/getjar/sdk/data/earning/EarningMonitor;->access$800(Lcom/getjar/sdk/data/earning/EarningMonitor;Landroid/content/Context;Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/data/earning/EarnStateRecord;)Ljava/util/concurrent/Future;

    move-result-object v1

    .line 468
    .local v1, "operation":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<Lcom/getjar/sdk/comm/Operation;>;"
    if-eqz v1, :cond_2

    invoke-interface {v1}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_2

    invoke-interface {v1}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/getjar/sdk/comm/Operation;

    invoke-virtual {v3}, Lcom/getjar/sdk/comm/Operation;->getResult()Lcom/getjar/sdk/comm/Result;

    move-result-object v3

    if-eqz v3, :cond_2

    invoke-interface {v1}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/getjar/sdk/comm/Operation;

    invoke-virtual {v3}, Lcom/getjar/sdk/comm/Operation;->getResult()Lcom/getjar/sdk/comm/Result;

    move-result-object v3

    invoke-virtual {v3}, Lcom/getjar/sdk/comm/Result;->isSuccessfulResponse()Z

    move-result v3

    if-nez v3, :cond_3

    .line 469
    :cond_2
    sget-object v3, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    const-string v5, "Earning: EarningMonitor: EarningMonitoringThread: processOpenEvent() earn operation failed"

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;)V

    .line 473
    :cond_3
    const/4 v2, 0x1

    .line 474
    iget-object v3, p0, Lcom/getjar/sdk/data/earning/EarningMonitor$EarningMonitoringThread;->this$0:Lcom/getjar/sdk/data/earning/EarningMonitor;

    invoke-static {v3}, Lcom/getjar/sdk/data/earning/EarningMonitor;->access$100(Lcom/getjar/sdk/data/earning/EarningMonitor;)Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/getjar/sdk/data/earning/EarnStateDatabase;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/earning/EarnStateDatabase;

    move-result-object v3

    invoke-virtual {p2}, Lcom/getjar/sdk/data/earning/EarnStateRecord;->getPackageName()Ljava/lang/String;

    move-result-object v4

    sget-object v5, Lcom/getjar/sdk/data/earning/EarnStateDatabase$Status;->OPENED:Lcom/getjar/sdk/data/earning/EarnStateDatabase$Status;

    invoke-virtual {v3, v4, v5}, Lcom/getjar/sdk/data/earning/EarnStateDatabase;->updateStatus(Ljava/lang/String;Lcom/getjar/sdk/data/earning/EarnStateDatabase$Status;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 479
    .end local v1    # "operation":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<Lcom/getjar/sdk/comm/Operation;>;"
    :goto_0
    return v2

    .line 476
    :catch_0
    move-exception v0

    .line 477
    .local v0, "e":Ljava/lang/Exception;
    sget-object v3, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    const-string v5, "Earning: EarningMonitor: EarningMonitoringThread: processOpenEvent() failed"

    invoke-static {v3, v4, v5, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method


# virtual methods
.method public run()V
    .locals 30

    .prologue
    .line 277
    :try_start_0
    sget-object v21, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v21 .. v21}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v21

    sget-object v23, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v23 .. v23}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v23

    or-long v21, v21, v23

    sget-object v23, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v23 .. v23}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v23

    or-long v21, v21, v23

    sget-object v23, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v24, "Earning: EarningMonitor: EarningMonitoringThread: started [thread:%1$d]"

    const/16 v25, 0x1

    move/from16 v0, v25

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v25, v0

    const/16 v26, 0x0

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/Thread;->getId()J

    move-result-wide v27

    invoke-static/range {v27 .. v28}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v27

    aput-object v27, v25, v26

    invoke-static/range {v23 .. v25}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v23

    invoke-static/range {v21 .. v23}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 279
    const-wide/16 v17, 0x0

    .line 280
    .local v17, "recordCount":J
    const/4 v7, 0x0

    .line 281
    .local v7, "appStates":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/data/earning/EarnStateRecord;>;"
    const/16 v19, 0x0

    .line 282
    .local v19, "runningTasks":Ljava/util/List;, "Ljava/util/List<Landroid/app/ActivityManager$RunningTaskInfo;>;"
    new-instance v15, Ljava/util/ArrayList;

    invoke-direct {v15}, Ljava/util/ArrayList;-><init>()V

    .line 285
    .local v15, "openedPackageNames":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getjar/sdk/data/earning/EarningMonitor$EarningMonitoringThread;->this$0:Lcom/getjar/sdk/data/earning/EarningMonitor;

    move-object/from16 v21, v0

    invoke-static/range {v21 .. v21}, Lcom/getjar/sdk/data/earning/EarningMonitor;->access$100(Lcom/getjar/sdk/data/earning/EarningMonitor;)Landroid/content/Context;

    move-result-object v21

    invoke-static/range {v21 .. v21}, Lcom/getjar/sdk/comm/auth/AuthManager;->initialize(Landroid/content/Context;)V

    .line 286
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Lcom/getjar/sdk/comm/auth/AuthManager;->waitOnAuth()V

    .line 288
    :cond_0
    :goto_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getjar/sdk/data/earning/EarningMonitor$EarningMonitoringThread;->this$0:Lcom/getjar/sdk/data/earning/EarningMonitor;

    move-object/from16 v21, v0

    invoke-static/range {v21 .. v21}, Lcom/getjar/sdk/data/earning/EarningMonitor;->access$200(Lcom/getjar/sdk/data/earning/EarningMonitor;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_4
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v21

    if-nez v21, :cond_c

    .line 292
    :try_start_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getjar/sdk/data/earning/EarningMonitor$EarningMonitoringThread;->this$0:Lcom/getjar/sdk/data/earning/EarningMonitor;

    move-object/from16 v21, v0

    invoke-static/range {v21 .. v21}, Lcom/getjar/sdk/data/earning/EarningMonitor;->access$100(Lcom/getjar/sdk/data/earning/EarningMonitor;)Landroid/content/Context;

    move-result-object v21

    invoke-static/range {v21 .. v21}, Lcom/getjar/sdk/data/earning/EarnStateDatabase;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/earning/EarnStateDatabase;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Lcom/getjar/sdk/data/earning/EarnStateDatabase;->getAllDownloadedOrInstalledAppStates()Ljava/util/List;

    move-result-object v7

    .line 293
    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v21

    move/from16 v0, v21

    int-to-long v0, v0

    move-wide/from16 v17, v0

    .line 296
    const-wide/16 v21, 0x0

    cmp-long v21, v17, v21

    if-gtz v21, :cond_1

    .line 297
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getjar/sdk/data/earning/EarningMonitor$EarningMonitoringThread;->this$0:Lcom/getjar/sdk/data/earning/EarningMonitor;

    move-object/from16 v21, v0

    const/16 v22, 0x1

    invoke-static/range {v21 .. v22}, Lcom/getjar/sdk/data/earning/EarningMonitor;->access$202(Lcom/getjar/sdk/data/earning/EarningMonitor;Z)Z
    :try_end_1
    .catch Lcom/getjar/sdk/exceptions/AuthException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_4
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 420
    :catch_0
    move-exception v3

    .line 423
    .local v3, "ae":Lcom/getjar/sdk/exceptions/AuthException;
    :try_start_2
    sget-object v21, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v21 .. v21}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v21

    sget-object v23, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v23 .. v23}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v23

    or-long v21, v21, v23

    const-string v23, "Earning: EarningMonitor: EarningMonitoringThread: not yet authed"

    invoke-static/range {v21 .. v23}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_4
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 425
    :try_start_3
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Lcom/getjar/sdk/comm/auth/AuthManager;->reAuth()V
    :try_end_3
    .catch Lcom/getjar/sdk/exceptions/AuthException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_4
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 426
    :catch_1
    move-exception v21

    goto :goto_0

    .line 301
    .end local v3    # "ae":Lcom/getjar/sdk/exceptions/AuthException;
    :cond_1
    :try_start_4
    sget-object v21, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v21 .. v21}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v21

    sget-object v23, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v23 .. v23}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v23

    or-long v21, v21, v23

    sget-object v23, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v24, "Earning: EarningMonitor: EarningMonitoringThread: found %d packages"

    const/16 v25, 0x1

    move/from16 v0, v25

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v25, v0

    const/16 v26, 0x0

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v27

    invoke-static/range {v27 .. v27}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v27

    aput-object v27, v25, v26

    invoke-static/range {v23 .. v25}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v23

    invoke-static/range {v21 .. v23}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 305
    invoke-interface {v15}, Ljava/util/List;->clear()V

    .line 308
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v13

    .line 309
    .local v13, "now":J
    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v11

    .local v11, "i$":Ljava/util/Iterator;
    :cond_2
    :goto_1
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v21

    if-eqz v21, :cond_6

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/getjar/sdk/data/earning/EarnStateRecord;
    :try_end_4
    .catch Lcom/getjar/sdk/exceptions/AuthException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/lang/InterruptedException; {:try_start_4 .. :try_end_4} :catch_3
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 311
    .local v6, "appState":Lcom/getjar/sdk/data/earning/EarnStateRecord;
    :try_start_5
    invoke-virtual {v6}, Lcom/getjar/sdk/data/earning/EarnStateRecord;->getTimestampCreated()J

    move-result-wide v21

    sub-long v4, v13, v21

    .line 312
    .local v4, "age":J
    invoke-virtual {v6}, Lcom/getjar/sdk/data/earning/EarnStateRecord;->getTimestampModified()J

    move-result-wide v21

    sub-long v8, v13, v21

    .line 313
    .local v8, "changeDelta":J
    const-wide/32 v21, 0x5265c00

    cmp-long v21, v4, v21

    if-lez v21, :cond_3

    .line 316
    sget-object v21, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v21 .. v21}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v21

    sget-object v23, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v23 .. v23}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v23

    or-long v21, v21, v23

    sget-object v23, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v24, "Earning: EarningMonitor: EarningMonitoringThread: %s timed out"

    const/16 v25, 0x1

    move/from16 v0, v25

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v25, v0

    const/16 v26, 0x0

    invoke-virtual {v6}, Lcom/getjar/sdk/data/earning/EarnStateRecord;->getPackageName()Ljava/lang/String;

    move-result-object v27

    aput-object v27, v25, v26

    invoke-static/range {v23 .. v25}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v23

    invoke-static/range {v21 .. v23}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 317
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getjar/sdk/data/earning/EarningMonitor$EarningMonitoringThread;->this$0:Lcom/getjar/sdk/data/earning/EarningMonitor;

    move-object/from16 v21, v0

    invoke-static/range {v21 .. v21}, Lcom/getjar/sdk/data/earning/EarningMonitor;->access$100(Lcom/getjar/sdk/data/earning/EarningMonitor;)Landroid/content/Context;

    move-result-object v21

    invoke-virtual {v6}, Lcom/getjar/sdk/data/earning/EarnStateRecord;->getPackageName()Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v21 .. v22}, Lcom/getjar/sdk/utilities/NotificationsUtility;->clearInstallNotification(Landroid/content/Context;Ljava/lang/String;)V

    .line 318
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getjar/sdk/data/earning/EarningMonitor$EarningMonitoringThread;->this$0:Lcom/getjar/sdk/data/earning/EarningMonitor;

    move-object/from16 v21, v0

    invoke-static/range {v21 .. v21}, Lcom/getjar/sdk/data/earning/EarningMonitor;->access$100(Lcom/getjar/sdk/data/earning/EarningMonitor;)Landroid/content/Context;

    move-result-object v21

    invoke-virtual {v6}, Lcom/getjar/sdk/data/earning/EarnStateRecord;->getPackageName()Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v21 .. v22}, Lcom/getjar/sdk/utilities/NotificationsUtility;->clearOpenNotification(Landroid/content/Context;Ljava/lang/String;)V

    .line 319
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getjar/sdk/data/earning/EarningMonitor$EarningMonitoringThread;->this$0:Lcom/getjar/sdk/data/earning/EarningMonitor;

    move-object/from16 v21, v0

    invoke-static/range {v21 .. v21}, Lcom/getjar/sdk/data/earning/EarningMonitor;->access$100(Lcom/getjar/sdk/data/earning/EarningMonitor;)Landroid/content/Context;

    move-result-object v21

    invoke-static/range {v21 .. v21}, Lcom/getjar/sdk/data/earning/EarnStateDatabase;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/earning/EarnStateDatabase;

    move-result-object v21

    invoke-virtual {v6}, Lcom/getjar/sdk/data/earning/EarnStateRecord;->getPackageName()Ljava/lang/String;

    move-result-object v22

    sget-object v23, Lcom/getjar/sdk/data/earning/EarnStateDatabase$NotificationState;->DONE:Lcom/getjar/sdk/data/earning/EarnStateDatabase$NotificationState;

    invoke-virtual/range {v21 .. v23}, Lcom/getjar/sdk/data/earning/EarnStateDatabase;->updateNotificationState(Ljava/lang/String;Lcom/getjar/sdk/data/earning/EarnStateDatabase$NotificationState;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2
    .catch Lcom/getjar/sdk/exceptions/AuthException; {:try_start_5 .. :try_end_5} :catch_0
    .catch Ljava/lang/InterruptedException; {:try_start_5 .. :try_end_5} :catch_3
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto/16 :goto_1

    .line 358
    .end local v4    # "age":J
    .end local v8    # "changeDelta":J
    :catch_2
    move-exception v10

    .line 361
    .local v10, "e":Ljava/lang/Exception;
    :try_start_6
    sget-object v21, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v21 .. v21}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v21

    sget-object v23, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v23 .. v23}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v23

    or-long v21, v21, v23

    sget-object v23, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v24, "Earning: EarningMonitor: EarningMonitoringThread: failed timeout and notification processing for %1$s"

    const/16 v25, 0x1

    move/from16 v0, v25

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v25, v0

    const/16 v26, 0x0

    invoke-virtual {v6}, Lcom/getjar/sdk/data/earning/EarnStateRecord;->getPackageName()Ljava/lang/String;

    move-result-object v27

    aput-object v27, v25, v26

    invoke-static/range {v23 .. v25}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v23

    move-wide/from16 v0, v21

    move-object/from16 v2, v23

    invoke-static {v0, v1, v2, v10}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V
    :try_end_6
    .catch Lcom/getjar/sdk/exceptions/AuthException; {:try_start_6 .. :try_end_6} :catch_0
    .catch Ljava/lang/InterruptedException; {:try_start_6 .. :try_end_6} :catch_3
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_4
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    goto/16 :goto_1

    .line 427
    .end local v6    # "appState":Lcom/getjar/sdk/data/earning/EarnStateRecord;
    .end local v10    # "e":Ljava/lang/Exception;
    .end local v11    # "i$":Ljava/util/Iterator;
    .end local v13    # "now":J
    :catch_3
    move-exception v12

    .line 428
    .local v12, "ie":Ljava/lang/InterruptedException;
    :try_start_7
    sget-object v21, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v21 .. v21}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v21

    sget-object v23, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v23 .. v23}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v23

    or-long v21, v21, v23

    sget-object v23, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v24, "Usage: UsageMonitor: UsageMonitoringThread: Received an InterruptedException [_exitMonitoringThread = %1$s]"

    const/16 v25, 0x1

    move/from16 v0, v25

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v25, v0

    const/16 v26, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getjar/sdk/data/earning/EarningMonitor$EarningMonitoringThread;->this$0:Lcom/getjar/sdk/data/earning/EarningMonitor;

    move-object/from16 v27, v0

    invoke-static/range {v27 .. v27}, Lcom/getjar/sdk/data/earning/EarningMonitor;->access$200(Lcom/getjar/sdk/data/earning/EarningMonitor;)Z

    move-result v27

    invoke-static/range {v27 .. v27}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v27

    aput-object v27, v25, v26

    invoke-static/range {v23 .. v25}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v23

    invoke-static/range {v21 .. v23}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_4
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    goto/16 :goto_0

    .line 437
    .end local v7    # "appStates":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/data/earning/EarnStateRecord;>;"
    .end local v12    # "ie":Ljava/lang/InterruptedException;
    .end local v15    # "openedPackageNames":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v17    # "recordCount":J
    .end local v19    # "runningTasks":Ljava/util/List;, "Ljava/util/List<Landroid/app/ActivityManager$RunningTaskInfo;>;"
    :catch_4
    move-exception v10

    .line 438
    .restart local v10    # "e":Ljava/lang/Exception;
    :try_start_8
    sget-object v21, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v21 .. v21}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v21

    sget-object v23, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v23 .. v23}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v23

    or-long v21, v21, v23

    const-string v23, "Earning: EarningMonitor: EarningMonitoringThread: run() failed"

    move-wide/from16 v0, v21

    move-object/from16 v2, v23

    invoke-static {v0, v1, v2, v10}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 440
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getjar/sdk/data/earning/EarningMonitor$EarningMonitoringThread;->this$0:Lcom/getjar/sdk/data/earning/EarningMonitor;

    move-object/from16 v21, v0

    invoke-static/range {v21 .. v21}, Lcom/getjar/sdk/data/earning/EarningMonitor;->access$600(Lcom/getjar/sdk/data/earning/EarningMonitor;)Ljava/lang/Object;

    move-result-object v22

    monitor-enter v22

    :try_start_9
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getjar/sdk/data/earning/EarningMonitor$EarningMonitoringThread;->this$0:Lcom/getjar/sdk/data/earning/EarningMonitor;

    move-object/from16 v21, v0

    const/16 v23, 0x0

    move-object/from16 v0, v21

    move-object/from16 v1, v23

    invoke-static {v0, v1}, Lcom/getjar/sdk/data/earning/EarningMonitor;->access$702(Lcom/getjar/sdk/data/earning/EarningMonitor;Lcom/getjar/sdk/data/earning/EarningMonitor$EarningMonitoringThread;)Lcom/getjar/sdk/data/earning/EarningMonitor$EarningMonitoringThread;

    monitor-exit v22
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_3

    .line 441
    sget-object v21, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v21 .. v21}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v21

    sget-object v23, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v23 .. v23}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v23

    or-long v21, v21, v23

    sget-object v23, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v24, "Earning: EarningMonitor: EarningMonitoringThread: exiting [thread:%1$d]"

    const/16 v25, 0x1

    move/from16 v0, v25

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v25, v0

    const/16 v26, 0x0

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/Thread;->getId()J

    move-result-wide v27

    invoke-static/range {v27 .. v28}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v27

    aput-object v27, v25, v26

    invoke-static/range {v23 .. v25}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v23

    invoke-static/range {v21 .. v23}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 443
    .end local v10    # "e":Ljava/lang/Exception;
    :goto_2
    return-void

    .line 321
    .restart local v4    # "age":J
    .restart local v6    # "appState":Lcom/getjar/sdk/data/earning/EarnStateRecord;
    .restart local v7    # "appStates":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/data/earning/EarnStateRecord;>;"
    .restart local v8    # "changeDelta":J
    .restart local v11    # "i$":Ljava/util/Iterator;
    .restart local v13    # "now":J
    .restart local v15    # "openedPackageNames":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v17    # "recordCount":J
    .restart local v19    # "runningTasks":Ljava/util/List;, "Ljava/util/List<Landroid/app/ActivityManager$RunningTaskInfo;>;"
    :cond_3
    const-wide/32 v21, 0xea60

    cmp-long v21, v8, v21

    if-lez v21, :cond_5

    :try_start_a
    sget-object v21, Lcom/getjar/sdk/data/earning/EarnStateDatabase$Status;->INSTALLED:Lcom/getjar/sdk/data/earning/EarnStateDatabase$Status;

    invoke-virtual {v6}, Lcom/getjar/sdk/data/earning/EarnStateRecord;->getStatus()Lcom/getjar/sdk/data/earning/EarnStateDatabase$Status;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Lcom/getjar/sdk/data/earning/EarnStateDatabase$Status;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_5

    invoke-virtual {v6}, Lcom/getjar/sdk/data/earning/EarnStateRecord;->canShowOpenReminder()Z

    move-result v21

    if-eqz v21, :cond_5

    .line 327
    sget-object v21, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v21 .. v21}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v21

    sget-object v23, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v23 .. v23}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v23

    or-long v21, v21, v23

    sget-object v23, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v24, "Earning: EarningMonitor: EarningMonitoringThread: %s showing open reminder notification"

    const/16 v25, 0x1

    move/from16 v0, v25

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v25, v0

    const/16 v26, 0x0

    invoke-virtual {v6}, Lcom/getjar/sdk/data/earning/EarnStateRecord;->getPackageName()Ljava/lang/String;

    move-result-object v27

    aput-object v27, v25, v26

    invoke-static/range {v23 .. v25}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v23

    invoke-static/range {v21 .. v23}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 330
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getjar/sdk/data/earning/EarningMonitor$EarningMonitoringThread;->this$0:Lcom/getjar/sdk/data/earning/EarningMonitor;

    move-object/from16 v21, v0

    invoke-static/range {v21 .. v21}, Lcom/getjar/sdk/data/earning/EarningMonitor;->access$100(Lcom/getjar/sdk/data/earning/EarningMonitor;)Landroid/content/Context;

    move-result-object v21

    invoke-virtual {v6}, Lcom/getjar/sdk/data/earning/EarnStateRecord;->getPackageName()Ljava/lang/String;

    move-result-object v22

    invoke-virtual {v6}, Lcom/getjar/sdk/data/earning/EarnStateRecord;->getFriendlyName()Ljava/lang/String;

    move-result-object v23

    invoke-static/range {v21 .. v23}, Lcom/getjar/sdk/utilities/NotificationsUtility;->showOpenNotification(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v21

    if-nez v21, :cond_4

    .line 333
    sget-object v21, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v21 .. v21}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v21

    sget-object v23, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v23 .. v23}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v23

    or-long v21, v21, v23

    sget-object v23, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v24, "Earning: EarningMonitor: EarningMonitoringThread: %s no-longer installed, push the install notification instead"

    const/16 v25, 0x1

    move/from16 v0, v25

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v25, v0

    const/16 v26, 0x0

    invoke-virtual {v6}, Lcom/getjar/sdk/data/earning/EarnStateRecord;->getPackageName()Ljava/lang/String;

    move-result-object v27

    aput-object v27, v25, v26

    invoke-static/range {v23 .. v25}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v23

    invoke-static/range {v21 .. v23}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 336
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getjar/sdk/data/earning/EarningMonitor$EarningMonitoringThread;->this$0:Lcom/getjar/sdk/data/earning/EarningMonitor;

    move-object/from16 v21, v0

    invoke-static/range {v21 .. v21}, Lcom/getjar/sdk/data/earning/EarningMonitor;->access$100(Lcom/getjar/sdk/data/earning/EarningMonitor;)Landroid/content/Context;

    move-result-object v21

    invoke-virtual {v6}, Lcom/getjar/sdk/data/earning/EarnStateRecord;->getPackageName()Ljava/lang/String;

    move-result-object v22

    invoke-virtual {v6}, Lcom/getjar/sdk/data/earning/EarnStateRecord;->getFriendlyName()Ljava/lang/String;

    move-result-object v23

    invoke-static/range {v21 .. v23}, Lcom/getjar/sdk/utilities/NotificationsUtility;->showInstallNotification(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 337
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getjar/sdk/data/earning/EarningMonitor$EarningMonitoringThread;->this$0:Lcom/getjar/sdk/data/earning/EarningMonitor;

    move-object/from16 v21, v0

    invoke-static/range {v21 .. v21}, Lcom/getjar/sdk/data/earning/EarningMonitor;->access$100(Lcom/getjar/sdk/data/earning/EarningMonitor;)Landroid/content/Context;

    move-result-object v21

    invoke-static/range {v21 .. v21}, Lcom/getjar/sdk/data/earning/EarnStateDatabase;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/earning/EarnStateDatabase;

    move-result-object v21

    invoke-virtual {v6}, Lcom/getjar/sdk/data/earning/EarnStateRecord;->getPackageName()Ljava/lang/String;

    move-result-object v22

    sget-object v23, Lcom/getjar/sdk/data/earning/EarnStateDatabase$NotificationState;->OPEN_REMINDER:Lcom/getjar/sdk/data/earning/EarnStateDatabase$NotificationState;

    invoke-virtual/range {v21 .. v23}, Lcom/getjar/sdk/data/earning/EarnStateDatabase;->updateNotificationState(Ljava/lang/String;Lcom/getjar/sdk/data/earning/EarnStateDatabase$NotificationState;)V

    .line 338
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getjar/sdk/data/earning/EarningMonitor$EarningMonitoringThread;->this$0:Lcom/getjar/sdk/data/earning/EarningMonitor;

    move-object/from16 v21, v0

    invoke-static/range {v21 .. v21}, Lcom/getjar/sdk/data/earning/EarningMonitor;->access$100(Lcom/getjar/sdk/data/earning/EarningMonitor;)Landroid/content/Context;

    move-result-object v21

    invoke-virtual {v6}, Lcom/getjar/sdk/data/earning/EarnStateRecord;->getPackageName()Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v21 .. v22}, Lcom/getjar/sdk/utilities/NotificationsUtility;->clearOpenNotification(Landroid/content/Context;Ljava/lang/String;)V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_2
    .catch Lcom/getjar/sdk/exceptions/AuthException; {:try_start_a .. :try_end_a} :catch_0
    .catch Ljava/lang/InterruptedException; {:try_start_a .. :try_end_a} :catch_3
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    goto/16 :goto_1

    .line 440
    .end local v4    # "age":J
    .end local v6    # "appState":Lcom/getjar/sdk/data/earning/EarnStateRecord;
    .end local v7    # "appStates":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/data/earning/EarnStateRecord;>;"
    .end local v8    # "changeDelta":J
    .end local v11    # "i$":Ljava/util/Iterator;
    .end local v13    # "now":J
    .end local v15    # "openedPackageNames":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v17    # "recordCount":J
    .end local v19    # "runningTasks":Ljava/util/List;, "Ljava/util/List<Landroid/app/ActivityManager$RunningTaskInfo;>;"
    :catchall_0
    move-exception v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getjar/sdk/data/earning/EarningMonitor$EarningMonitoringThread;->this$0:Lcom/getjar/sdk/data/earning/EarningMonitor;

    move-object/from16 v22, v0

    invoke-static/range {v22 .. v22}, Lcom/getjar/sdk/data/earning/EarningMonitor;->access$600(Lcom/getjar/sdk/data/earning/EarningMonitor;)Ljava/lang/Object;

    move-result-object v22

    monitor-enter v22

    :try_start_b
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getjar/sdk/data/earning/EarningMonitor$EarningMonitoringThread;->this$0:Lcom/getjar/sdk/data/earning/EarningMonitor;

    move-object/from16 v23, v0

    const/16 v24, 0x0

    invoke-static/range {v23 .. v24}, Lcom/getjar/sdk/data/earning/EarningMonitor;->access$702(Lcom/getjar/sdk/data/earning/EarningMonitor;Lcom/getjar/sdk/data/earning/EarningMonitor$EarningMonitoringThread;)Lcom/getjar/sdk/data/earning/EarningMonitor$EarningMonitoringThread;

    monitor-exit v22
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_4

    .line 441
    sget-object v22, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v22 .. v22}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v22

    sget-object v24, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v24 .. v24}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v24

    or-long v22, v22, v24

    sget-object v24, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v25, "Earning: EarningMonitor: EarningMonitoringThread: exiting [thread:%1$d]"

    const/16 v26, 0x1

    move/from16 v0, v26

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v26, v0

    const/16 v27, 0x0

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Ljava/lang/Thread;->getId()J

    move-result-wide v28

    invoke-static/range {v28 .. v29}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v28

    aput-object v28, v26, v27

    invoke-static/range {v24 .. v26}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v22 .. v24}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    throw v21

    .line 340
    .restart local v4    # "age":J
    .restart local v6    # "appState":Lcom/getjar/sdk/data/earning/EarnStateRecord;
    .restart local v7    # "appStates":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/data/earning/EarnStateRecord;>;"
    .restart local v8    # "changeDelta":J
    .restart local v11    # "i$":Ljava/util/Iterator;
    .restart local v13    # "now":J
    .restart local v15    # "openedPackageNames":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v17    # "recordCount":J
    .restart local v19    # "runningTasks":Ljava/util/List;, "Ljava/util/List<Landroid/app/ActivityManager$RunningTaskInfo;>;"
    :cond_4
    :try_start_c
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getjar/sdk/data/earning/EarningMonitor$EarningMonitoringThread;->this$0:Lcom/getjar/sdk/data/earning/EarningMonitor;

    move-object/from16 v21, v0

    invoke-static/range {v21 .. v21}, Lcom/getjar/sdk/data/earning/EarningMonitor;->access$100(Lcom/getjar/sdk/data/earning/EarningMonitor;)Landroid/content/Context;

    move-result-object v21

    invoke-static/range {v21 .. v21}, Lcom/getjar/sdk/data/earning/EarnStateDatabase;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/earning/EarnStateDatabase;

    move-result-object v21

    invoke-virtual {v6}, Lcom/getjar/sdk/data/earning/EarnStateRecord;->getPackageName()Ljava/lang/String;

    move-result-object v22

    sget-object v23, Lcom/getjar/sdk/data/earning/EarnStateDatabase$NotificationState;->OPEN_REMINDER:Lcom/getjar/sdk/data/earning/EarnStateDatabase$NotificationState;

    invoke-virtual/range {v21 .. v23}, Lcom/getjar/sdk/data/earning/EarnStateDatabase;->updateNotificationState(Ljava/lang/String;Lcom/getjar/sdk/data/earning/EarnStateDatabase$NotificationState;)V

    .line 341
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getjar/sdk/data/earning/EarningMonitor$EarningMonitoringThread;->this$0:Lcom/getjar/sdk/data/earning/EarningMonitor;

    move-object/from16 v21, v0

    invoke-static/range {v21 .. v21}, Lcom/getjar/sdk/data/earning/EarningMonitor;->access$100(Lcom/getjar/sdk/data/earning/EarningMonitor;)Landroid/content/Context;

    move-result-object v21

    invoke-virtual {v6}, Lcom/getjar/sdk/data/earning/EarnStateRecord;->getPackageName()Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v21 .. v22}, Lcom/getjar/sdk/utilities/NotificationsUtility;->clearInstallNotification(Landroid/content/Context;Ljava/lang/String;)V

    goto/16 :goto_1

    .line 344
    :cond_5
    const-wide/32 v21, 0x493e0

    cmp-long v21, v8, v21

    if-lez v21, :cond_2

    sget-object v21, Lcom/getjar/sdk/data/earning/EarnStateDatabase$Status;->DOWNLOADED:Lcom/getjar/sdk/data/earning/EarnStateDatabase$Status;

    invoke-virtual {v6}, Lcom/getjar/sdk/data/earning/EarnStateRecord;->getStatus()Lcom/getjar/sdk/data/earning/EarnStateDatabase$Status;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Lcom/getjar/sdk/data/earning/EarnStateDatabase$Status;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_2

    invoke-virtual {v6}, Lcom/getjar/sdk/data/earning/EarnStateRecord;->canShowInstallReminder()Z

    move-result v21

    if-eqz v21, :cond_2

    .line 350
    sget-object v21, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v21 .. v21}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v21

    sget-object v23, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v23 .. v23}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v23

    or-long v21, v21, v23

    sget-object v23, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v24, "Earning: EarningMonitor: EarningMonitoringThread: %s showing install reminder notification"

    const/16 v25, 0x1

    move/from16 v0, v25

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v25, v0

    const/16 v26, 0x0

    invoke-virtual {v6}, Lcom/getjar/sdk/data/earning/EarnStateRecord;->getPackageName()Ljava/lang/String;

    move-result-object v27

    aput-object v27, v25, v26

    invoke-static/range {v23 .. v25}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v23

    invoke-static/range {v21 .. v23}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 353
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getjar/sdk/data/earning/EarningMonitor$EarningMonitoringThread;->this$0:Lcom/getjar/sdk/data/earning/EarningMonitor;

    move-object/from16 v21, v0

    invoke-static/range {v21 .. v21}, Lcom/getjar/sdk/data/earning/EarningMonitor;->access$100(Lcom/getjar/sdk/data/earning/EarningMonitor;)Landroid/content/Context;

    move-result-object v21

    invoke-virtual {v6}, Lcom/getjar/sdk/data/earning/EarnStateRecord;->getPackageName()Ljava/lang/String;

    move-result-object v22

    invoke-virtual {v6}, Lcom/getjar/sdk/data/earning/EarnStateRecord;->getFriendlyName()Ljava/lang/String;

    move-result-object v23

    invoke-static/range {v21 .. v23}, Lcom/getjar/sdk/utilities/NotificationsUtility;->showInstallNotification(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 354
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getjar/sdk/data/earning/EarningMonitor$EarningMonitoringThread;->this$0:Lcom/getjar/sdk/data/earning/EarningMonitor;

    move-object/from16 v21, v0

    invoke-static/range {v21 .. v21}, Lcom/getjar/sdk/data/earning/EarningMonitor;->access$100(Lcom/getjar/sdk/data/earning/EarningMonitor;)Landroid/content/Context;

    move-result-object v21

    invoke-static/range {v21 .. v21}, Lcom/getjar/sdk/data/earning/EarnStateDatabase;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/earning/EarnStateDatabase;

    move-result-object v21

    invoke-virtual {v6}, Lcom/getjar/sdk/data/earning/EarnStateRecord;->getPackageName()Ljava/lang/String;

    move-result-object v22

    sget-object v23, Lcom/getjar/sdk/data/earning/EarnStateDatabase$NotificationState;->INSTALL_REMINDER:Lcom/getjar/sdk/data/earning/EarnStateDatabase$NotificationState;

    invoke-virtual/range {v21 .. v23}, Lcom/getjar/sdk/data/earning/EarnStateDatabase;->updateNotificationState(Ljava/lang/String;Lcom/getjar/sdk/data/earning/EarnStateDatabase$NotificationState;)V

    .line 355
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getjar/sdk/data/earning/EarningMonitor$EarningMonitoringThread;->this$0:Lcom/getjar/sdk/data/earning/EarningMonitor;

    move-object/from16 v21, v0

    invoke-static/range {v21 .. v21}, Lcom/getjar/sdk/data/earning/EarningMonitor;->access$100(Lcom/getjar/sdk/data/earning/EarningMonitor;)Landroid/content/Context;

    move-result-object v21

    invoke-virtual {v6}, Lcom/getjar/sdk/data/earning/EarnStateRecord;->getPackageName()Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v21 .. v22}, Lcom/getjar/sdk/utilities/NotificationsUtility;->clearOpenNotification(Landroid/content/Context;Ljava/lang/String;)V
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_2
    .catch Lcom/getjar/sdk/exceptions/AuthException; {:try_start_c .. :try_end_c} :catch_0
    .catch Ljava/lang/InterruptedException; {:try_start_c .. :try_end_c} :catch_3
    .catchall {:try_start_c .. :try_end_c} :catchall_0

    goto/16 :goto_1

    .line 368
    .end local v4    # "age":J
    .end local v6    # "appState":Lcom/getjar/sdk/data/earning/EarnStateRecord;
    .end local v8    # "changeDelta":J
    :cond_6
    :try_start_d
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getjar/sdk/data/earning/EarningMonitor$EarningMonitoringThread;->this$0:Lcom/getjar/sdk/data/earning/EarningMonitor;

    move-object/from16 v21, v0

    invoke-static/range {v21 .. v21}, Lcom/getjar/sdk/data/earning/EarningMonitor;->access$100(Lcom/getjar/sdk/data/earning/EarningMonitor;)Landroid/content/Context;

    move-result-object v21

    invoke-static/range {v21 .. v21}, Lcom/getjar/sdk/data/earning/EarnStateDatabase;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/earning/EarnStateDatabase;

    move-result-object v21

    const-wide/32 v22, 0x5265c00

    invoke-virtual/range {v21 .. v23}, Lcom/getjar/sdk/data/earning/EarnStateDatabase;->deleteOldRecords(J)V

    .line 369
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getjar/sdk/data/earning/EarningMonitor$EarningMonitoringThread;->this$0:Lcom/getjar/sdk/data/earning/EarningMonitor;

    move-object/from16 v21, v0

    invoke-static/range {v21 .. v21}, Lcom/getjar/sdk/data/earning/EarningMonitor;->access$100(Lcom/getjar/sdk/data/earning/EarningMonitor;)Landroid/content/Context;

    move-result-object v21

    invoke-static/range {v21 .. v21}, Lcom/getjar/sdk/data/earning/EarnStateDatabase;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/earning/EarnStateDatabase;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Lcom/getjar/sdk/data/earning/EarnStateDatabase;->getAllDownloadedOrInstalledAppStates()Ljava/util/List;

    move-result-object v7

    .line 370
    sget-object v21, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v21 .. v21}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v21

    sget-object v23, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v23 .. v23}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v23

    or-long v21, v21, v23

    sget-object v23, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v24, "Earning: EarningMonitor: EarningMonitoringThread: found %d packages after removing old records"

    const/16 v25, 0x1

    move/from16 v0, v25

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v25, v0

    const/16 v26, 0x0

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v27

    invoke-static/range {v27 .. v27}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v27

    aput-object v27, v25, v26

    invoke-static/range {v23 .. v25}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v23

    invoke-static/range {v21 .. v23}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 373
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getjar/sdk/data/earning/EarningMonitor$EarningMonitoringThread;->this$0:Lcom/getjar/sdk/data/earning/EarningMonitor;

    move-object/from16 v21, v0

    invoke-static/range {v21 .. v21}, Lcom/getjar/sdk/data/earning/EarningMonitor;->access$100(Lcom/getjar/sdk/data/earning/EarningMonitor;)Landroid/content/Context;

    move-result-object v21

    invoke-static/range {v21 .. v21}, Lcom/getjar/sdk/utilities/SystemUtility;->getRecentlyRunAppsFromOS(Landroid/content/Context;)Ljava/util/List;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-interface {v15, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 377
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getjar/sdk/data/earning/EarningMonitor$EarningMonitoringThread;->this$0:Lcom/getjar/sdk/data/earning/EarningMonitor;

    move-object/from16 v21, v0

    invoke-static/range {v21 .. v21}, Lcom/getjar/sdk/data/earning/EarningMonitor;->access$100(Lcom/getjar/sdk/data/earning/EarningMonitor;)Landroid/content/Context;

    move-result-object v21

    const-string v22, "android.permission.GET_TASKS"

    invoke-static/range {v21 .. v22}, Lcom/getjar/sdk/utilities/RewardUtility;->checkPermission(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v21

    if-eqz v21, :cond_7

    .line 378
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getjar/sdk/data/earning/EarningMonitor$EarningMonitoringThread;->this$0:Lcom/getjar/sdk/data/earning/EarningMonitor;

    move-object/from16 v21, v0

    invoke-static/range {v21 .. v21}, Lcom/getjar/sdk/data/earning/EarningMonitor;->access$100(Lcom/getjar/sdk/data/earning/EarningMonitor;)Landroid/content/Context;

    move-result-object v21

    const-string v22, "activity"

    invoke-virtual/range {v21 .. v22}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v21

    check-cast v21, Landroid/app/ActivityManager;

    const/16 v22, 0x64

    invoke-virtual/range {v21 .. v22}, Landroid/app/ActivityManager;->getRunningTasks(I)Ljava/util/List;

    move-result-object v19

    .line 380
    :cond_7
    if-eqz v19, :cond_9

    .line 381
    invoke-interface/range {v19 .. v19}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :cond_8
    :goto_3
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v21

    if-eqz v21, :cond_9

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Landroid/app/ActivityManager$RunningTaskInfo;

    .line 382
    .local v20, "taskInfo":Landroid/app/ActivityManager$RunningTaskInfo;
    move-object/from16 v0, v20

    iget-object v0, v0, Landroid/app/ActivityManager$RunningTaskInfo;->topActivity:Landroid/content/ComponentName;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-interface {v15, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v21

    if-nez v21, :cond_8

    .line 383
    move-object/from16 v0, v20

    iget-object v0, v0, Landroid/app/ActivityManager$RunningTaskInfo;->topActivity:Landroid/content/ComponentName;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-interface {v15, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 390
    .end local v20    # "taskInfo":Landroid/app/ActivityManager$RunningTaskInfo;
    :cond_9
    invoke-interface {v15}, Ljava/util/List;->size()I

    move-result v21

    if-lez v21, :cond_b

    .line 391
    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :cond_a
    :goto_4
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v21

    if-eqz v21, :cond_b

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/getjar/sdk/data/earning/EarnStateRecord;
    :try_end_d
    .catch Lcom/getjar/sdk/exceptions/AuthException; {:try_start_d .. :try_end_d} :catch_0
    .catch Ljava/lang/InterruptedException; {:try_start_d .. :try_end_d} :catch_3
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_4
    .catchall {:try_start_d .. :try_end_d} :catchall_0

    .line 393
    .restart local v6    # "appState":Lcom/getjar/sdk/data/earning/EarnStateRecord;
    :try_start_e
    invoke-virtual {v6}, Lcom/getjar/sdk/data/earning/EarnStateRecord;->getPackageName()Ljava/lang/String;

    move-result-object v16

    .line 394
    .local v16, "packageName":Ljava/lang/String;
    invoke-interface/range {v15 .. v16}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_a

    .line 396
    sget-object v21, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v21 .. v21}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v21

    sget-object v23, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v23 .. v23}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v23

    or-long v21, v21, v23

    sget-object v23, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v24, "Earning: EarningMonitor: EarningMonitoringThread: %s match found, processing OPEN"

    const/16 v25, 0x1

    move/from16 v0, v25

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v25, v0

    const/16 v26, 0x0

    aput-object v16, v25, v26

    invoke-static/range {v23 .. v25}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v23

    invoke-static/range {v21 .. v23}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 397
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getjar/sdk/data/earning/EarningMonitor$EarningMonitoringThread;->this$0:Lcom/getjar/sdk/data/earning/EarningMonitor;

    move-object/from16 v21, v0

    invoke-static/range {v21 .. v21}, Lcom/getjar/sdk/data/earning/EarningMonitor;->access$300(Lcom/getjar/sdk/data/earning/EarningMonitor;)Lcom/getjar/sdk/comm/CommContext;

    move-result-object v21

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-direct {v0, v1, v6}, Lcom/getjar/sdk/data/earning/EarningMonitor$EarningMonitoringThread;->processOpenEvent(Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/data/earning/EarnStateRecord;)Z
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_5
    .catch Lcom/getjar/sdk/exceptions/AuthException; {:try_start_e .. :try_end_e} :catch_0
    .catch Ljava/lang/InterruptedException; {:try_start_e .. :try_end_e} :catch_3
    .catchall {:try_start_e .. :try_end_e} :catchall_0

    goto :goto_4

    .line 399
    .end local v16    # "packageName":Ljava/lang/String;
    :catch_5
    move-exception v10

    .line 402
    .restart local v10    # "e":Ljava/lang/Exception;
    :try_start_f
    sget-object v21, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v21 .. v21}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v21

    sget-object v23, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v23 .. v23}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v23

    or-long v21, v21, v23

    sget-object v23, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v24, "Earning: EarningMonitor: EarningMonitoringThread: failed OPEN processing for %1$s"

    const/16 v25, 0x1

    move/from16 v0, v25

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v25, v0

    const/16 v26, 0x0

    invoke-virtual {v6}, Lcom/getjar/sdk/data/earning/EarnStateRecord;->getPackageName()Ljava/lang/String;

    move-result-object v27

    aput-object v27, v25, v26

    invoke-static/range {v23 .. v25}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v23

    move-wide/from16 v0, v21

    move-object/from16 v2, v23

    invoke-static {v0, v1, v2, v10}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_4

    .line 410
    .end local v6    # "appState":Lcom/getjar/sdk/data/earning/EarnStateRecord;
    .end local v10    # "e":Ljava/lang/Exception;
    :cond_b
    const/4 v7, 0x0

    .line 411
    const/16 v19, 0x0

    .line 414
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getjar/sdk/data/earning/EarningMonitor$EarningMonitoringThread;->this$0:Lcom/getjar/sdk/data/earning/EarningMonitor;

    move-object/from16 v21, v0

    invoke-static/range {v21 .. v21}, Lcom/getjar/sdk/data/earning/EarningMonitor;->access$200(Lcom/getjar/sdk/data/earning/EarningMonitor;)Z

    move-result v21

    if-nez v21, :cond_0

    .line 415
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getjar/sdk/data/earning/EarningMonitor$EarningMonitoringThread;->this$0:Lcom/getjar/sdk/data/earning/EarningMonitor;

    move-object/from16 v21, v0

    invoke-static/range {v21 .. v21}, Lcom/getjar/sdk/data/earning/EarningMonitor;->access$400(Lcom/getjar/sdk/data/earning/EarningMonitor;)Ljava/lang/Object;

    move-result-object v22

    monitor-enter v22
    :try_end_f
    .catch Lcom/getjar/sdk/exceptions/AuthException; {:try_start_f .. :try_end_f} :catch_0
    .catch Ljava/lang/InterruptedException; {:try_start_f .. :try_end_f} :catch_3
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_f} :catch_4
    .catchall {:try_start_f .. :try_end_f} :catchall_0

    .line 416
    :try_start_10
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getjar/sdk/data/earning/EarningMonitor$EarningMonitoringThread;->this$0:Lcom/getjar/sdk/data/earning/EarningMonitor;

    move-object/from16 v21, v0

    invoke-static/range {v21 .. v21}, Lcom/getjar/sdk/data/earning/EarningMonitor;->access$400(Lcom/getjar/sdk/data/earning/EarningMonitor;)Ljava/lang/Object;

    move-result-object v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getjar/sdk/data/earning/EarningMonitor$EarningMonitoringThread;->this$0:Lcom/getjar/sdk/data/earning/EarningMonitor;

    move-object/from16 v23, v0

    invoke-static/range {v23 .. v23}, Lcom/getjar/sdk/data/earning/EarningMonitor;->access$500(Lcom/getjar/sdk/data/earning/EarningMonitor;)J

    move-result-wide v23

    move-object/from16 v0, v21

    move-wide/from16 v1, v23

    invoke-virtual {v0, v1, v2}, Ljava/lang/Object;->wait(J)V

    .line 417
    monitor-exit v22

    goto/16 :goto_0

    :catchall_1
    move-exception v21

    monitor-exit v22
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_1

    :try_start_11
    throw v21
    :try_end_11
    .catch Lcom/getjar/sdk/exceptions/AuthException; {:try_start_11 .. :try_end_11} :catch_0
    .catch Ljava/lang/InterruptedException; {:try_start_11 .. :try_end_11} :catch_3
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_11} :catch_4
    .catchall {:try_start_11 .. :try_end_11} :catchall_0

    .line 440
    .end local v11    # "i$":Ljava/util/Iterator;
    .end local v13    # "now":J
    :cond_c
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getjar/sdk/data/earning/EarningMonitor$EarningMonitoringThread;->this$0:Lcom/getjar/sdk/data/earning/EarningMonitor;

    move-object/from16 v21, v0

    invoke-static/range {v21 .. v21}, Lcom/getjar/sdk/data/earning/EarningMonitor;->access$600(Lcom/getjar/sdk/data/earning/EarningMonitor;)Ljava/lang/Object;

    move-result-object v22

    monitor-enter v22

    :try_start_12
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getjar/sdk/data/earning/EarningMonitor$EarningMonitoringThread;->this$0:Lcom/getjar/sdk/data/earning/EarningMonitor;

    move-object/from16 v21, v0

    const/16 v23, 0x0

    move-object/from16 v0, v21

    move-object/from16 v1, v23

    invoke-static {v0, v1}, Lcom/getjar/sdk/data/earning/EarningMonitor;->access$702(Lcom/getjar/sdk/data/earning/EarningMonitor;Lcom/getjar/sdk/data/earning/EarningMonitor$EarningMonitoringThread;)Lcom/getjar/sdk/data/earning/EarningMonitor$EarningMonitoringThread;

    monitor-exit v22
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_2

    .line 441
    sget-object v21, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v21 .. v21}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v21

    sget-object v23, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v23 .. v23}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v23

    or-long v21, v21, v23

    sget-object v23, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v24, "Earning: EarningMonitor: EarningMonitoringThread: exiting [thread:%1$d]"

    const/16 v25, 0x1

    move/from16 v0, v25

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v25, v0

    const/16 v26, 0x0

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/Thread;->getId()J

    move-result-wide v27

    invoke-static/range {v27 .. v28}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v27

    aput-object v27, v25, v26

    invoke-static/range {v23 .. v25}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v23

    invoke-static/range {v21 .. v23}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    goto/16 :goto_2

    .line 440
    :catchall_2
    move-exception v21

    :try_start_13
    monitor-exit v22
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_2

    throw v21

    .end local v7    # "appStates":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/data/earning/EarnStateRecord;>;"
    .end local v15    # "openedPackageNames":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v17    # "recordCount":J
    .end local v19    # "runningTasks":Ljava/util/List;, "Ljava/util/List<Landroid/app/ActivityManager$RunningTaskInfo;>;"
    .restart local v10    # "e":Ljava/lang/Exception;
    :catchall_3
    move-exception v21

    :try_start_14
    monitor-exit v22
    :try_end_14
    .catchall {:try_start_14 .. :try_end_14} :catchall_3

    throw v21

    .end local v10    # "e":Ljava/lang/Exception;
    :catchall_4
    move-exception v21

    :try_start_15
    monitor-exit v22
    :try_end_15
    .catchall {:try_start_15 .. :try_end_15} :catchall_4

    throw v21
.end method
