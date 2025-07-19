.class Lcom/getjar/sdk/comm/CommManager$RequestCallable;
.super Ljava/lang/Object;
.source "CommManager.java"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getjar/sdk/comm/CommManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RequestCallable"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable",
        "<",
        "Lcom/getjar/sdk/comm/Result;",
        ">;"
    }
.end annotation


# instance fields
.field private _operation:Lcom/getjar/sdk/comm/Operation;

.field final synthetic this$0:Lcom/getjar/sdk/comm/CommManager;


# direct methods
.method private constructor <init>(Lcom/getjar/sdk/comm/CommManager;Lcom/getjar/sdk/comm/Operation;)V
    .locals 2
    .param p2, "operation"    # Lcom/getjar/sdk/comm/Operation;

    .prologue
    .line 1365
    iput-object p1, p0, Lcom/getjar/sdk/comm/CommManager$RequestCallable;->this$0:Lcom/getjar/sdk/comm/CommManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1364
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/getjar/sdk/comm/CommManager$RequestCallable;->_operation:Lcom/getjar/sdk/comm/Operation;

    .line 1366
    if-nez p2, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'operation\' can not be NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1367
    :cond_0
    iput-object p2, p0, Lcom/getjar/sdk/comm/CommManager$RequestCallable;->_operation:Lcom/getjar/sdk/comm/Operation;

    .line 1368
    return-void
.end method

.method synthetic constructor <init>(Lcom/getjar/sdk/comm/CommManager;Lcom/getjar/sdk/comm/Operation;Lcom/getjar/sdk/comm/CommManager$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/getjar/sdk/comm/CommManager;
    .param p2, "x1"    # Lcom/getjar/sdk/comm/Operation;
    .param p3, "x2"    # Lcom/getjar/sdk/comm/CommManager$1;

    .prologue
    .line 1363
    invoke-direct {p0, p1, p2}, Lcom/getjar/sdk/comm/CommManager$RequestCallable;-><init>(Lcom/getjar/sdk/comm/CommManager;Lcom/getjar/sdk/comm/Operation;)V

    return-void
.end method

.method private cleanup()V
    .locals 9

    .prologue
    .line 1413
    invoke-static {}, Lcom/getjar/sdk/comm/CommManager;->access$600()Ljava/lang/Object;

    move-result-object v2

    monitor-enter v2

    .line 1415
    :try_start_0
    sget-object v1, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "%1$s RequestFutureTask has completed work, doing cleanup work [state:%2$s]"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    iget-object v8, p0, Lcom/getjar/sdk/comm/CommManager$RequestCallable;->_operation:Lcom/getjar/sdk/comm/Operation;

    invoke-static {v8}, Lcom/getjar/sdk/comm/CommManager;->access$500(Lcom/getjar/sdk/comm/Operation;)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x1

    iget-object v8, p0, Lcom/getjar/sdk/comm/CommManager$RequestCallable;->_operation:Lcom/getjar/sdk/comm/Operation;

    invoke-virtual {v8}, Lcom/getjar/sdk/comm/Operation;->getState()Lcom/getjar/sdk/comm/Operation$Status;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v1, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v4, v1}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1422
    :try_start_1
    iget-object v1, p0, Lcom/getjar/sdk/comm/CommManager$RequestCallable;->this$0:Lcom/getjar/sdk/comm/CommManager;

    iget-object v3, p0, Lcom/getjar/sdk/comm/CommManager$RequestCallable;->_operation:Lcom/getjar/sdk/comm/Operation;

    invoke-static {v1, v3}, Lcom/getjar/sdk/comm/CommManager;->access$700(Lcom/getjar/sdk/comm/CommManager;Lcom/getjar/sdk/comm/Operation;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1427
    :goto_0
    :try_start_2
    invoke-static {}, Lcom/getjar/sdk/comm/CommManager;->access$800()Ljava/util/ArrayList;

    move-result-object v1

    iget-object v3, p0, Lcom/getjar/sdk/comm/CommManager$RequestCallable;->_operation:Lcom/getjar/sdk/comm/Operation;

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 1428
    sget-object v1, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "%1$s Completed Request has been removed from _ActiveRequests"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    iget-object v8, p0, Lcom/getjar/sdk/comm/CommManager$RequestCallable;->_operation:Lcom/getjar/sdk/comm/Operation;

    invoke-static {v8}, Lcom/getjar/sdk/comm/CommManager;->access$500(Lcom/getjar/sdk/comm/Operation;)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v1, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v4, v1}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    .line 1433
    :goto_1
    sget-object v1, Lcom/getjar/sdk/comm/Operation$Status;->RETRYING:Lcom/getjar/sdk/comm/Operation$Status;

    iget-object v3, p0, Lcom/getjar/sdk/comm/CommManager$RequestCallable;->_operation:Lcom/getjar/sdk/comm/Operation;

    invoke-virtual {v3}, Lcom/getjar/sdk/comm/Operation;->getState()Lcom/getjar/sdk/comm/Operation$Status;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/getjar/sdk/comm/Operation$Status;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 1435
    invoke-static {}, Lcom/getjar/sdk/comm/CommManager;->access$900()Ljava/util/LinkedList;

    move-result-object v1

    iget-object v3, p0, Lcom/getjar/sdk/comm/CommManager$RequestCallable;->_operation:Lcom/getjar/sdk/comm/Operation;

    invoke-virtual {v1, v3}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1436
    sget-object v1, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "%1$s Found completed Request in _RequestQueue"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    iget-object v8, p0, Lcom/getjar/sdk/comm/CommManager$RequestCallable;->_operation:Lcom/getjar/sdk/comm/Operation;

    invoke-static {v8}, Lcom/getjar/sdk/comm/CommManager;->access$500(Lcom/getjar/sdk/comm/Operation;)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v1, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v4, v1}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;)V

    .line 1438
    :cond_0
    invoke-static {}, Lcom/getjar/sdk/comm/CommManager;->access$1000()Ljava/util/ArrayList;

    move-result-object v1

    iget-object v3, p0, Lcom/getjar/sdk/comm/CommManager$RequestCallable;->_operation:Lcom/getjar/sdk/comm/Operation;

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1439
    sget-object v1, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "%1$s Found completed Request in _RetryRequests"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    iget-object v8, p0, Lcom/getjar/sdk/comm/CommManager$RequestCallable;->_operation:Lcom/getjar/sdk/comm/Operation;

    invoke-static {v8}, Lcom/getjar/sdk/comm/CommManager;->access$500(Lcom/getjar/sdk/comm/Operation;)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v1, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v4, v1}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;)V

    .line 1444
    :cond_1
    sget-object v1, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "%1$s kicking worker thread"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    iget-object v8, p0, Lcom/getjar/sdk/comm/CommManager$RequestCallable;->_operation:Lcom/getjar/sdk/comm/Operation;

    invoke-static {v8}, Lcom/getjar/sdk/comm/CommManager;->access$500(Lcom/getjar/sdk/comm/Operation;)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v1, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v4, v1}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 1445
    invoke-static {}, Lcom/getjar/sdk/comm/CommManager;->access$600()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->notify()V

    .line 1446
    monitor-exit v2

    .line 1447
    return-void

    .line 1423
    :catch_0
    move-exception v0

    .line 1424
    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "%1$s updateOperationStateFromResult() failed"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    iget-object v8, p0, Lcom/getjar/sdk/comm/CommManager$RequestCallable;->_operation:Lcom/getjar/sdk/comm/Operation;

    invoke-static {v8}, Lcom/getjar/sdk/comm/CommManager;->access$500(Lcom/getjar/sdk/comm/Operation;)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v1, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v4, v1, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_0

    .line 1446
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1

    .line 1430
    :cond_2
    :try_start_3
    sget-object v1, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "%1$s Completed Request was not found in _ActiveRequests"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    iget-object v8, p0, Lcom/getjar/sdk/comm/CommManager$RequestCallable;->_operation:Lcom/getjar/sdk/comm/Operation;

    invoke-static {v8}, Lcom/getjar/sdk/comm/CommManager;->access$500(Lcom/getjar/sdk/comm/Operation;)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v1, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v4, v1}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto/16 :goto_1
.end method


# virtual methods
.method public call()Lcom/getjar/sdk/comm/Result;
    .locals 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v14, 0x2

    const/4 v13, 0x1

    const/4 v12, 0x0

    .line 1373
    iget-object v6, p0, Lcom/getjar/sdk/comm/CommManager$RequestCallable;->this$0:Lcom/getjar/sdk/comm/CommManager;

    iget-object v7, p0, Lcom/getjar/sdk/comm/CommManager$RequestCallable;->_operation:Lcom/getjar/sdk/comm/Operation;

    invoke-static {v6, v7}, Lcom/getjar/sdk/comm/CommManager;->access$400(Lcom/getjar/sdk/comm/CommManager;Lcom/getjar/sdk/comm/Operation;)Lcom/getjar/sdk/comm/Result;

    move-result-object v4

    .line 1376
    .local v4, "requestResult":Lcom/getjar/sdk/comm/Result;
    if-nez v4, :cond_1

    .line 1377
    sget-object v6, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    sget-object v8, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v9, "%1$s Received a NULL result"

    new-array v10, v13, [Ljava/lang/Object;

    iget-object v11, p0, Lcom/getjar/sdk/comm/CommManager$RequestCallable;->_operation:Lcom/getjar/sdk/comm/Operation;

    invoke-static {v11}, Lcom/getjar/sdk/comm/CommManager;->access$500(Lcom/getjar/sdk/comm/Operation;)Ljava/lang/String;

    move-result-object v11

    aput-object v11, v10, v12

    invoke-static {v8, v9, v10}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v6, v7, v8}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;)V

    .line 1404
    :cond_0
    :goto_0
    invoke-direct {p0}, Lcom/getjar/sdk/comm/CommManager$RequestCallable;->cleanup()V

    .line 1407
    return-object v4

    .line 1379
    :cond_1
    sget-object v6, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    sget-object v8, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v9, "%1$s Received response code: %2$d"

    new-array v10, v14, [Ljava/lang/Object;

    iget-object v11, p0, Lcom/getjar/sdk/comm/CommManager$RequestCallable;->_operation:Lcom/getjar/sdk/comm/Operation;

    invoke-static {v11}, Lcom/getjar/sdk/comm/CommManager;->access$500(Lcom/getjar/sdk/comm/Operation;)Ljava/lang/String;

    move-result-object v11

    aput-object v11, v10, v12

    invoke-virtual {v4}, Lcom/getjar/sdk/comm/Result;->getResponseCode()I

    move-result v11

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v10, v13

    invoke-static {v8, v9, v10}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v6, v7, v8}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 1380
    invoke-virtual {v4}, Lcom/getjar/sdk/comm/Result;->getResponseJson()Lorg/json/JSONObject;

    move-result-object v6

    if-eqz v6, :cond_4

    .line 1381
    sget-object v6, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    sget-object v8, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v9, "%1$s Received response body:\r\n%2$s"

    new-array v10, v14, [Ljava/lang/Object;

    iget-object v11, p0, Lcom/getjar/sdk/comm/CommManager$RequestCallable;->_operation:Lcom/getjar/sdk/comm/Operation;

    invoke-static {v11}, Lcom/getjar/sdk/comm/CommManager;->access$500(Lcom/getjar/sdk/comm/Operation;)Ljava/lang/String;

    move-result-object v11

    aput-object v11, v10, v12

    invoke-virtual {v4}, Lcom/getjar/sdk/comm/Result;->getResponseJson()Lorg/json/JSONObject;

    move-result-object v11

    const/4 v12, 0x4

    invoke-virtual {v11, v12}, Lorg/json/JSONObject;->toString(I)Ljava/lang/String;

    move-result-object v11

    aput-object v11, v10, v13

    invoke-static {v8, v9, v10}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v6, v7, v8}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 1385
    :cond_2
    :goto_1
    invoke-virtual {v4}, Lcom/getjar/sdk/comm/Result;->getHeaders()Ljava/util/Map;

    move-result-object v6

    if-eqz v6, :cond_0

    invoke-virtual {v4}, Lcom/getjar/sdk/comm/Result;->getHeaders()Ljava/util/Map;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Map;->size()I

    move-result v6

    if-lez v6, :cond_0

    .line 1388
    new-instance v2, Ljava/lang/StringBuilder;

    iget-object v6, p0, Lcom/getjar/sdk/comm/CommManager$RequestCallable;->_operation:Lcom/getjar/sdk/comm/Operation;

    invoke-static {v6}, Lcom/getjar/sdk/comm/CommManager;->access$500(Lcom/getjar/sdk/comm/Operation;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1389
    .local v2, "logMsg":Ljava/lang/StringBuilder;
    const-string v6, " Received response headers:\r\n"

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1390
    invoke-virtual {v4}, Lcom/getjar/sdk/comm/Result;->getHeaders()Ljava/util/Map;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_3
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_5

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 1391
    .local v3, "name":Ljava/lang/String;
    invoke-virtual {v4}, Lcom/getjar/sdk/comm/Result;->getHeaders()Ljava/util/Map;

    move-result-object v6

    invoke-interface {v6, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 1392
    .local v5, "value":Ljava/lang/String;
    const-string v6, "    "

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1393
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1394
    const-string v6, " = "

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1395
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1396
    const-string v6, "\r\n"

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 1382
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "logMsg":Ljava/lang/StringBuilder;
    .end local v3    # "name":Ljava/lang/String;
    .end local v5    # "value":Ljava/lang/String;
    :cond_4
    invoke-virtual {v4}, Lcom/getjar/sdk/comm/Result;->getResponseBody()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_2

    .line 1383
    sget-object v6, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    sget-object v8, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v9, "%1$s Received response body:\r\n%2$s"

    new-array v10, v14, [Ljava/lang/Object;

    iget-object v11, p0, Lcom/getjar/sdk/comm/CommManager$RequestCallable;->_operation:Lcom/getjar/sdk/comm/Operation;

    invoke-static {v11}, Lcom/getjar/sdk/comm/CommManager;->access$500(Lcom/getjar/sdk/comm/Operation;)Ljava/lang/String;

    move-result-object v11

    aput-object v11, v10, v12

    invoke-virtual {v4}, Lcom/getjar/sdk/comm/Result;->getResponseBody()Ljava/lang/String;

    move-result-object v11

    aput-object v11, v10, v13

    invoke-static {v8, v9, v10}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v6, v7, v8}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    goto/16 :goto_1

    .line 1399
    .restart local v2    # "logMsg":Ljava/lang/StringBuilder;
    :cond_5
    sget-object v6, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v6, v7, v8}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    goto/16 :goto_0
.end method

.method public bridge synthetic call()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 1363
    invoke-virtual {p0}, Lcom/getjar/sdk/comm/CommManager$RequestCallable;->call()Lcom/getjar/sdk/comm/Result;

    move-result-object v0

    return-object v0
.end method
