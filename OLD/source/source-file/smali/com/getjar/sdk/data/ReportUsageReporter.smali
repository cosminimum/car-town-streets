.class public abstract Lcom/getjar/sdk/data/ReportUsageReporter;
.super Ljava/lang/Object;
.source "ReportUsageReporter.java"


# instance fields
.field protected final _commContext:Lcom/getjar/sdk/comm/CommContext;


# direct methods
.method protected constructor <init>(Lcom/getjar/sdk/comm/CommContext;)V
    .locals 2
    .param p1, "commContext"    # Lcom/getjar/sdk/comm/CommContext;

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'commContext\' cannot be NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 26
    :cond_0
    iput-object p1, p0, Lcom/getjar/sdk/data/ReportUsageReporter;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    .line 27
    return-void
.end method


# virtual methods
.method protected handleResults(Lcom/getjar/sdk/data/SyncableDatabase;Lcom/getjar/sdk/comm/Operation;Ljava/util/List;Ljava/util/HashMap;)V
    .locals 15
    .param p2, "operation"    # Lcom/getjar/sdk/comm/Operation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/getjar/sdk/data/SyncableDatabase",
            "<*>;",
            "Lcom/getjar/sdk/comm/Operation;",
            "Ljava/util/List",
            "<",
            "Lcom/getjar/sdk/data/ReportUsageData;",
            ">;",
            "Ljava/util/HashMap",
            "<",
            "Lcom/getjar/sdk/data/ReportUsageData;",
            "+",
            "Lcom/getjar/sdk/data/DatabaseRecordBase;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 45
    .local p1, "database":Lcom/getjar/sdk/data/SyncableDatabase;, "Lcom/getjar/sdk/data/SyncableDatabase<*>;"
    .local p3, "usageList":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/data/ReportUsageData;>;"
    .local p4, "usageToDBObject":Ljava/util/HashMap;, "Ljava/util/HashMap<Lcom/getjar/sdk/data/ReportUsageData;+Lcom/getjar/sdk/data/DatabaseRecordBase;>;"
    const/4 v6, 0x0

    .line 46
    .local v6, "updateRecordsAsSynced":Z
    if-nez p2, :cond_1

    .line 49
    const/4 v6, 0x1

    .line 65
    :cond_0
    :goto_0
    if-eqz v6, :cond_2

    .line 66
    invoke-interface/range {p3 .. p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/getjar/sdk/data/ReportUsageData;

    .line 68
    .local v1, "appUsage":Lcom/getjar/sdk/data/ReportUsageData;
    :try_start_0
    move-object/from16 v0, p4

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/getjar/sdk/data/DatabaseRecordBase;

    .line 69
    .local v4, "record":Lcom/getjar/sdk/data/DatabaseRecordBase;
    invoke-virtual {v4}, Lcom/getjar/sdk/data/DatabaseRecordBase;->getId()J

    move-result-wide v7

    move-object/from16 v0, p1

    invoke-virtual {v0, v7, v8}, Lcom/getjar/sdk/data/SyncableDatabase;->setRecordAsSynced(J)V

    .line 70
    sget-object v7, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    sget-object v9, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v9}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v9

    or-long/2addr v7, v9

    sget-object v9, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v10, "Usage: InstallStateReporter: handleResults() Updated record as synced [id:%1$d]"

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    invoke-virtual {v4}, Lcom/getjar/sdk/data/DatabaseRecordBase;->getId()J

    move-result-wide v13

    invoke-static {v13, v14}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v13

    aput-object v13, v11, v12

    invoke-static {v9, v10, v11}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v7, v8, v9}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 73
    .end local v4    # "record":Lcom/getjar/sdk/data/DatabaseRecordBase;
    :catch_0
    move-exception v2

    .line 76
    .local v2, "e":Ljava/lang/Exception;
    sget-object v7, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    sget-object v9, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v9}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v9

    or-long/2addr v7, v9

    const-string v9, "Usage: InstallStateReporter: handleResults() Failed"

    invoke-static {v7, v8, v9, v2}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 53
    .end local v1    # "appUsage":Lcom/getjar/sdk/data/ReportUsageData;
    .end local v2    # "e":Ljava/lang/Exception;
    .end local v3    # "i$":Ljava/util/Iterator;
    :cond_1
    :try_start_1
    invoke-virtual/range {p2 .. p2}, Lcom/getjar/sdk/comm/Operation;->get()Lcom/getjar/sdk/comm/Result;

    move-result-object v5

    .line 54
    .local v5, "result":Lcom/getjar/sdk/comm/Result;
    if-eqz v5, :cond_0

    invoke-virtual {v5}, Lcom/getjar/sdk/comm/Result;->isSuccessfulResponse()Z
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_1 .. :try_end_1} :catch_2

    move-result v7

    if-eqz v7, :cond_0

    .line 55
    const/4 v6, 0x1

    goto :goto_0

    .line 57
    .end local v5    # "result":Lcom/getjar/sdk/comm/Result;
    :catch_1
    move-exception v2

    .line 58
    .local v2, "e":Ljava/lang/InterruptedException;
    new-instance v7, Lcom/getjar/sdk/exceptions/CommunicationException;

    invoke-direct {v7, v2}, Lcom/getjar/sdk/exceptions/CommunicationException;-><init>(Ljava/lang/Throwable;)V

    throw v7

    .line 59
    .end local v2    # "e":Ljava/lang/InterruptedException;
    :catch_2
    move-exception v2

    .line 60
    .local v2, "e":Ljava/util/concurrent/ExecutionException;
    new-instance v7, Lcom/getjar/sdk/exceptions/CommunicationException;

    invoke-direct {v7, v2}, Lcom/getjar/sdk/exceptions/CommunicationException;-><init>(Ljava/lang/Throwable;)V

    throw v7

    .line 82
    .end local v2    # "e":Ljava/util/concurrent/ExecutionException;
    :cond_2
    return-void
.end method

.method protected reportUsageInChunks(ILcom/getjar/sdk/data/SyncableDatabase;Ljava/util/List;Ljava/util/HashMap;)V
    .locals 10
    .param p1, "batchSize"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/getjar/sdk/data/SyncableDatabase",
            "<*>;",
            "Ljava/util/List",
            "<",
            "Lcom/getjar/sdk/data/ReportUsageData;",
            ">;",
            "Ljava/util/HashMap",
            "<",
            "Lcom/getjar/sdk/data/ReportUsageData;",
            "+",
            "Lcom/getjar/sdk/data/DatabaseRecordBase;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p2, "database":Lcom/getjar/sdk/data/SyncableDatabase;, "Lcom/getjar/sdk/data/SyncableDatabase<*>;"
    .local p3, "usageList":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/data/ReportUsageData;>;"
    .local p4, "usageToDBObject":Ljava/util/HashMap;, "Ljava/util/HashMap<Lcom/getjar/sdk/data/ReportUsageData;+Lcom/getjar/sdk/data/DatabaseRecordBase;>;"
    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 95
    sget-object v2, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    const-string v4, "Usage: UsageReporter: reportUsageInChunks() START"

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 97
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 99
    .local v0, "currentUsageList":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/data/ReportUsageData;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 102
    invoke-interface {p3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 103
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    if-lt v2, p1, :cond_0

    .line 106
    sget-object v2, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "Usage: UsageReporter: reportUsageInChunks() Calling reportApplicationUsage for %1$d records"

    new-array v6, v9, [Ljava/lang/Object;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v8

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 109
    invoke-static {}, Lcom/getjar/sdk/comm/ReportUsageProxy;->getInstance()Lcom/getjar/sdk/comm/ReportUsageProxy;

    move-result-object v2

    iget-object v3, p0, Lcom/getjar/sdk/data/ReportUsageReporter;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v2, v3, v0}, Lcom/getjar/sdk/comm/ReportUsageProxy;->reportApplicationUsage(Lcom/getjar/sdk/comm/CommContext;Ljava/util/List;)Lcom/getjar/sdk/comm/Operation;

    move-result-object v2

    invoke-virtual {p0, p2, v2, v0, p4}, Lcom/getjar/sdk/data/ReportUsageReporter;->handleResults(Lcom/getjar/sdk/data/SyncableDatabase;Lcom/getjar/sdk/comm/Operation;Ljava/util/List;Ljava/util/HashMap;)V

    .line 116
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 99
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 120
    :cond_1
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    if-lez v2, :cond_2

    .line 123
    sget-object v2, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "Usage: UsageReporter: reportUsageInChunks() Calling reportApplicationUsage for %1$d records"

    new-array v6, v9, [Ljava/lang/Object;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v8

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 126
    invoke-static {}, Lcom/getjar/sdk/comm/ReportUsageProxy;->getInstance()Lcom/getjar/sdk/comm/ReportUsageProxy;

    move-result-object v2

    iget-object v3, p0, Lcom/getjar/sdk/data/ReportUsageReporter;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v2, v3, v0}, Lcom/getjar/sdk/comm/ReportUsageProxy;->reportApplicationUsage(Lcom/getjar/sdk/comm/CommContext;Ljava/util/List;)Lcom/getjar/sdk/comm/Operation;

    move-result-object v2

    invoke-virtual {p0, p2, v2, v0, p4}, Lcom/getjar/sdk/data/ReportUsageReporter;->handleResults(Lcom/getjar/sdk/data/SyncableDatabase;Lcom/getjar/sdk/comm/Operation;Ljava/util/List;Ljava/util/HashMap;)V

    .line 133
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 135
    :cond_2
    sget-object v2, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    const-string v4, "Usage: UsageReporter: reportUsageInChunks() -- DONE"

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 136
    return-void
.end method

.method protected abstract sendUnsyncedData()V
.end method
