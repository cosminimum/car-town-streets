.class Lcom/getjar/sdk/comm/CommManager$RequestPipelineManagementRunnable;
.super Ljava/lang/Object;
.source "CommManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getjar/sdk/comm/CommManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RequestPipelineManagementRunnable"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/getjar/sdk/comm/CommManager;


# direct methods
.method private constructor <init>(Lcom/getjar/sdk/comm/CommManager;)V
    .locals 0

    .prologue
    .line 1456
    iput-object p1, p0, Lcom/getjar/sdk/comm/CommManager$RequestPipelineManagementRunnable;->this$0:Lcom/getjar/sdk/comm/CommManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/getjar/sdk/comm/CommManager;Lcom/getjar/sdk/comm/CommManager$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/getjar/sdk/comm/CommManager;
    .param p2, "x1"    # Lcom/getjar/sdk/comm/CommManager$1;

    .prologue
    .line 1456
    invoke-direct {p0, p1}, Lcom/getjar/sdk/comm/CommManager$RequestPipelineManagementRunnable;-><init>(Lcom/getjar/sdk/comm/CommManager;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 19

    .prologue
    .line 1466
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/getjar/sdk/comm/CommManager$RequestPipelineManagementRunnable;->this$0:Lcom/getjar/sdk/comm/CommManager;

    invoke-static {v11}, Lcom/getjar/sdk/comm/CommManager;->access$1100(Lcom/getjar/sdk/comm/CommManager;)Landroid/content/Context;

    move-result-object v11

    invoke-static {v11}, Lcom/getjar/sdk/comm/auth/AuthManager;->initialize(Landroid/content/Context;)V

    .line 1467
    const-wide v9, 0x7fffffffffffffffL

    .line 1468
    .local v9, "sleepTime":J
    :cond_0
    :goto_0
    invoke-static {}, Lcom/getjar/sdk/comm/CommManager;->access$1200()Z

    move-result v11

    if-nez v11, :cond_1

    .line 1471
    :try_start_0
    invoke-static {}, Lcom/getjar/sdk/comm/CommManager;->access$1200()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v11

    if-eqz v11, :cond_2

    .line 1538
    :cond_1
    :goto_1
    sget-object v11, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v11}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v11

    sget-object v13, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v14, "%1$s Worker Thread exited"

    const/4 v15, 0x1

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    invoke-static {}, Lcom/getjar/sdk/comm/CommManager;->access$300()Ljava/lang/String;

    move-result-object v17

    aput-object v17, v15, v16

    invoke-static {v13, v14, v15}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    invoke-static {v11, v12, v13}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    .line 1539
    return-void

    .line 1474
    :cond_2
    :try_start_1
    invoke-static {}, Lcom/getjar/sdk/comm/CommManager;->access$600()Ljava/lang/Object;

    move-result-object v12

    monitor-enter v12
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 1475
    :try_start_2
    sget-object v11, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v11}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v13

    sget-object v11, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v15, "%1$s queued:%2$d active:%3$d retry:%4$d"

    const/16 v16, 0x4

    move/from16 v0, v16

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    invoke-static {}, Lcom/getjar/sdk/comm/CommManager;->access$300()Ljava/lang/String;

    move-result-object v18

    aput-object v18, v16, v17

    const/16 v17, 0x1

    invoke-static {}, Lcom/getjar/sdk/comm/CommManager;->access$900()Ljava/util/LinkedList;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/util/LinkedList;->size()I

    move-result v18

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    aput-object v18, v16, v17

    const/16 v17, 0x2

    invoke-static {}, Lcom/getjar/sdk/comm/CommManager;->access$800()Ljava/util/ArrayList;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/util/ArrayList;->size()I

    move-result v18

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    aput-object v18, v16, v17

    const/16 v17, 0x3

    invoke-static {}, Lcom/getjar/sdk/comm/CommManager;->access$1000()Ljava/util/ArrayList;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/util/ArrayList;->size()I

    move-result v18

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    aput-object v18, v16, v17

    move-object/from16 v0, v16

    invoke-static {v11, v15, v0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-static {v13, v14, v11}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 1483
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    .line 1484
    .local v3, "now":J
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 1485
    .local v7, "requestsToMove":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/comm/Operation;>;"
    invoke-static {}, Lcom/getjar/sdk/comm/CommManager;->access$1000()Ljava/util/ArrayList;

    move-result-object v11

    invoke-virtual {v11}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_3
    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_6

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/getjar/sdk/comm/Operation;

    .line 1486
    .local v8, "retryOperation":Lcom/getjar/sdk/comm/Operation;
    invoke-virtual {v8}, Lcom/getjar/sdk/comm/Operation;->getRetryAfterTimestamp()J

    move-result-wide v13

    cmp-long v11, v13, v3

    if-gtz v11, :cond_3

    .line 1487
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v11

    invoke-virtual {v11}, Lcom/getjar/sdk/comm/auth/AuthManager;->isAuthed()Z

    move-result v11

    if-nez v11, :cond_4

    invoke-virtual {v8}, Lcom/getjar/sdk/comm/Operation;->isAuthRelated()Z

    move-result v11

    if-eqz v11, :cond_5

    .line 1488
    :cond_4
    invoke-interface {v7, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 1529
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v3    # "now":J
    .end local v7    # "requestsToMove":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/comm/Operation;>;"
    .end local v8    # "retryOperation":Lcom/getjar/sdk/comm/Operation;
    :catchall_0
    move-exception v11

    monitor-exit v12
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    throw v11
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    .line 1533
    :catch_0
    move-exception v1

    .line 1534
    .local v1, "e":Ljava/lang/Exception;
    sget-object v11, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v11}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v11

    sget-object v13, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v14, "%1$s failure"

    const/4 v15, 0x1

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    invoke-static {}, Lcom/getjar/sdk/comm/CommManager;->access$300()Ljava/lang/String;

    move-result-object v17

    aput-object v17, v15, v16

    invoke-static {v13, v14, v15}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    invoke-static {v11, v12, v13, v1}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 1535
    const-wide/16 v11, 0x1388

    :try_start_4
    invoke-static {v11, v12}, Ljava/lang/Thread;->sleep(J)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    goto/16 :goto_0

    :catch_1
    move-exception v11

    goto/16 :goto_0

    .line 1492
    .end local v1    # "e":Ljava/lang/Exception;
    .restart local v2    # "i$":Ljava/util/Iterator;
    .restart local v3    # "now":J
    .restart local v7    # "requestsToMove":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/comm/Operation;>;"
    .restart local v8    # "retryOperation":Lcom/getjar/sdk/comm/Operation;
    :cond_5
    const-wide/16 v13, 0x7d0

    :try_start_5
    invoke-virtual {v8, v13, v14}, Lcom/getjar/sdk/comm/Operation;->updateRetryAfterTimestamp(J)V

    goto :goto_2

    .line 1496
    .end local v8    # "retryOperation":Lcom/getjar/sdk/comm/Operation;
    :cond_6
    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_3
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_8

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/getjar/sdk/comm/Operation;

    .line 1497
    .restart local v8    # "retryOperation":Lcom/getjar/sdk/comm/Operation;
    invoke-static {}, Lcom/getjar/sdk/comm/CommManager;->access$1000()Ljava/util/ArrayList;

    move-result-object v11

    invoke-virtual {v11, v8}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 1498
    invoke-static {}, Lcom/getjar/sdk/comm/CommManager;->access$900()Ljava/util/LinkedList;

    move-result-object v11

    invoke-virtual {v11, v8}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 1499
    sget-object v11, Lcom/getjar/sdk/comm/Operation$Status;->WAITING:Lcom/getjar/sdk/comm/Operation$Status;

    invoke-virtual {v8, v11}, Lcom/getjar/sdk/comm/Operation;->setState(Lcom/getjar/sdk/comm/Operation$Status;)V

    .line 1500
    sget-object v11, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v11}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v13

    sget-object v11, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v15, "%1$s moved request from retry to queue"

    const/16 v16, 0x1

    move/from16 v0, v16

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    invoke-static {v8}, Lcom/getjar/sdk/comm/CommManager;->access$500(Lcom/getjar/sdk/comm/Operation;)Ljava/lang/String;

    move-result-object v18

    aput-object v18, v16, v17

    move-object/from16 v0, v16

    invoke-static {v11, v15, v0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-static {v13, v14, v11}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    goto :goto_3

    .line 1510
    .end local v8    # "retryOperation":Lcom/getjar/sdk/comm/Operation;
    :cond_7
    invoke-static {}, Lcom/getjar/sdk/comm/CommManager;->access$900()Ljava/util/LinkedList;

    move-result-object v11

    invoke-static {}, Lcom/getjar/sdk/comm/OperationPriorityComparator;->getInstance()Lcom/getjar/sdk/comm/OperationPriorityComparator;

    move-result-object v13

    invoke-static {v11, v13}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 1511
    invoke-static {}, Lcom/getjar/sdk/comm/CommManager;->access$900()Ljava/util/LinkedList;

    move-result-object v11

    invoke-virtual {v11}, Ljava/util/LinkedList;->remove()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/getjar/sdk/comm/Operation;

    .line 1514
    .local v6, "requestToStart":Lcom/getjar/sdk/comm/Operation;
    invoke-static {}, Lcom/getjar/sdk/comm/CommManager;->access$800()Ljava/util/ArrayList;

    move-result-object v11

    invoke-virtual {v11, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1515
    sget-object v11, Lcom/getjar/sdk/comm/Operation$Status;->RUNNING:Lcom/getjar/sdk/comm/Operation$Status;

    invoke-virtual {v6, v11}, Lcom/getjar/sdk/comm/Operation;->setState(Lcom/getjar/sdk/comm/Operation$Status;)V

    .line 1516
    invoke-static {}, Lcom/getjar/sdk/comm/CommManager;->access$1300()Ljava/util/concurrent/ExecutorService;

    move-result-object v11

    invoke-virtual {v6}, Lcom/getjar/sdk/comm/Operation;->getFuture()Ljava/util/concurrent/FutureTask;

    move-result-object v13

    invoke-interface {v11, v13}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 1504
    .end local v6    # "requestToStart":Lcom/getjar/sdk/comm/Operation;
    :cond_8
    invoke-static {}, Lcom/getjar/sdk/comm/CommManager;->access$800()Ljava/util/ArrayList;

    move-result-object v11

    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v11

    const/4 v13, 0x2

    if-ge v11, v13, :cond_9

    invoke-static {}, Lcom/getjar/sdk/comm/CommManager;->access$900()Ljava/util/LinkedList;

    move-result-object v11

    invoke-virtual {v11}, Ljava/util/LinkedList;->size()I

    move-result v11

    if-lez v11, :cond_9

    .line 1507
    invoke-static {}, Lcom/getjar/sdk/comm/CommManager;->access$900()Ljava/util/LinkedList;

    move-result-object v11

    invoke-virtual {v11}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_4
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_7

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/getjar/sdk/comm/Operation;

    .local v5, "operation":Lcom/getjar/sdk/comm/Operation;
    invoke-virtual {v5}, Lcom/getjar/sdk/comm/Operation;->promotePriority()V

    goto :goto_4

    .line 1520
    .end local v5    # "operation":Lcom/getjar/sdk/comm/Operation;
    :cond_9
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/getjar/sdk/comm/CommManager$RequestPipelineManagementRunnable;->this$0:Lcom/getjar/sdk/comm/CommManager;

    invoke-static {v11}, Lcom/getjar/sdk/comm/CommManager;->access$1400(Lcom/getjar/sdk/comm/CommManager;)Lcom/getjar/sdk/comm/ResultCachingManager;

    move-result-object v11

    invoke-virtual {v11}, Lcom/getjar/sdk/comm/ResultCachingManager;->trimLruEntries()V

    .line 1523
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/getjar/sdk/comm/CommManager$RequestPipelineManagementRunnable;->this$0:Lcom/getjar/sdk/comm/CommManager;

    invoke-static {v11}, Lcom/getjar/sdk/comm/CommManager;->access$1500(Lcom/getjar/sdk/comm/CommManager;)J

    move-result-wide v9

    .line 1526
    sget-object v11, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v11}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v13

    sget-object v11, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v15, "%1$s Worker Thread is waiting to be notified"

    const/16 v16, 0x1

    move/from16 v0, v16

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    invoke-static {}, Lcom/getjar/sdk/comm/CommManager;->access$300()Ljava/lang/String;

    move-result-object v18

    aput-object v18, v16, v17

    move-object/from16 v0, v16

    invoke-static {v11, v15, v0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-static {v13, v14, v11}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 1527
    invoke-static {}, Lcom/getjar/sdk/comm/CommManager;->access$600()Ljava/lang/Object;

    move-result-object v11

    invoke-virtual {v11, v9, v10}, Ljava/lang/Object;->wait(J)V

    .line 1528
    sget-object v11, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v11}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v13

    sget-object v11, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v15, "%1$s Worker Thread is awake"

    const/16 v16, 0x1

    move/from16 v0, v16

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    invoke-static {}, Lcom/getjar/sdk/comm/CommManager;->access$300()Ljava/lang/String;

    move-result-object v18

    aput-object v18, v16, v17

    move-object/from16 v0, v16

    invoke-static {v11, v15, v0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-static {v13, v14, v11}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 1529
    monitor-exit v12
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 1531
    :try_start_6
    invoke-static {}, Lcom/getjar/sdk/comm/CommManager;->access$1200()Z
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_0

    move-result v11

    if-eqz v11, :cond_0

    goto/16 :goto_1
.end method
