.class Lcom/getjar/sdk/data/package_events/PackageEventReporter;
.super Lcom/getjar/sdk/data/ReportUsageReporter;
.source "PackageEventReporter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/getjar/sdk/data/package_events/PackageEventReporter$1;
    }
.end annotation


# static fields
.field private static volatile _Instance:Lcom/getjar/sdk/data/package_events/PackageEventReporter;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 29
    const/4 v0, 0x0

    sput-object v0, Lcom/getjar/sdk/data/package_events/PackageEventReporter;->_Instance:Lcom/getjar/sdk/data/package_events/PackageEventReporter;

    return-void
.end method

.method private constructor <init>(Lcom/getjar/sdk/comm/CommContext;)V
    .locals 0
    .param p1, "commContext"    # Lcom/getjar/sdk/comm/CommContext;

    .prologue
    .line 27
    invoke-direct {p0, p1}, Lcom/getjar/sdk/data/ReportUsageReporter;-><init>(Lcom/getjar/sdk/comm/CommContext;)V

    .line 28
    return-void
.end method

.method public static declared-synchronized getInstance(Lcom/getjar/sdk/comm/CommContext;)Lcom/getjar/sdk/data/package_events/PackageEventReporter;
    .locals 3
    .param p0, "commContext"    # Lcom/getjar/sdk/comm/CommContext;

    .prologue
    .line 31
    const-class v1, Lcom/getjar/sdk/data/package_events/PackageEventReporter;

    monitor-enter v1

    if-nez p0, :cond_0

    :try_start_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v2, "\'commContext\' cannot be NULL"

    invoke-direct {v0, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0

    .line 32
    :cond_0
    :try_start_1
    sget-object v0, Lcom/getjar/sdk/data/package_events/PackageEventReporter;->_Instance:Lcom/getjar/sdk/data/package_events/PackageEventReporter;

    if-nez v0, :cond_1

    .line 33
    new-instance v0, Lcom/getjar/sdk/data/package_events/PackageEventReporter;

    invoke-direct {v0, p0}, Lcom/getjar/sdk/data/package_events/PackageEventReporter;-><init>(Lcom/getjar/sdk/comm/CommContext;)V

    sput-object v0, Lcom/getjar/sdk/data/package_events/PackageEventReporter;->_Instance:Lcom/getjar/sdk/data/package_events/PackageEventReporter;

    .line 35
    :cond_1
    sget-object v0, Lcom/getjar/sdk/data/package_events/PackageEventReporter;->_Instance:Lcom/getjar/sdk/data/package_events/PackageEventReporter;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit v1

    return-object v0
.end method


# virtual methods
.method protected handleResults(Lcom/getjar/sdk/data/SyncableDatabase;Lcom/getjar/sdk/comm/Operation;Ljava/util/List;Ljava/util/HashMap;)V
    .locals 0
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
    .line 114
    .local p1, "database":Lcom/getjar/sdk/data/SyncableDatabase;, "Lcom/getjar/sdk/data/SyncableDatabase<*>;"
    .local p3, "usageList":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/data/ReportUsageData;>;"
    .local p4, "usageToDBObject":Ljava/util/HashMap;, "Ljava/util/HashMap<Lcom/getjar/sdk/data/ReportUsageData;+Lcom/getjar/sdk/data/DatabaseRecordBase;>;"
    invoke-super {p0, p1, p2, p3, p4}, Lcom/getjar/sdk/data/ReportUsageReporter;->handleResults(Lcom/getjar/sdk/data/SyncableDatabase;Lcom/getjar/sdk/comm/Operation;Ljava/util/List;Ljava/util/HashMap;)V

    .line 117
    invoke-virtual {p1}, Lcom/getjar/sdk/data/SyncableDatabase;->purgeSyncedRecords()V

    .line 118
    return-void
.end method

.method protected sendUnsyncedData()V
    .locals 19

    .prologue
    .line 46
    invoke-static {}, Lcom/getjar/sdk/data/package_events/PackageEventDatabase;->getInstance()Lcom/getjar/sdk/data/package_events/PackageEventDatabase;

    move-result-object v2

    invoke-virtual {v2}, Lcom/getjar/sdk/data/package_events/PackageEventDatabase;->loadUnsyncedRecords()Ljava/util/List;

    move-result-object v11

    .line 49
    .local v11, "unsyncedRecords":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/data/package_events/PackageEventRecord;>;"
    new-instance v13, Ljava/util/HashMap;

    invoke-direct {v13}, Ljava/util/HashMap;-><init>()V

    .line 50
    .local v13, "usageToDBRecord":Ljava/util/HashMap;, "Ljava/util/HashMap<Lcom/getjar/sdk/data/ReportUsageData;Lcom/getjar/sdk/data/DatabaseRecordBase;>;"
    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    .line 53
    .local v12, "usageList":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/data/ReportUsageData;>;"
    invoke-interface {v11}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .local v9, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/getjar/sdk/data/package_events/PackageEventRecord;

    .line 57
    .local v10, "unsyncedRecord":Lcom/getjar/sdk/data/package_events/PackageEventRecord;
    const/4 v3, 0x0

    .line 58
    .local v3, "type":Lcom/getjar/sdk/data/ReportUsageData$UsageType;
    :try_start_0
    sget-object v2, Lcom/getjar/sdk/data/package_events/PackageEventReporter$1;->$SwitchMap$com$getjar$sdk$data$package_events$PackageEventManager$EventType:[I

    invoke-virtual {v10}, Lcom/getjar/sdk/data/package_events/PackageEventRecord;->getEventType()Lcom/getjar/sdk/data/package_events/PackageEventManager$EventType;

    move-result-object v14

    invoke-virtual {v14}, Lcom/getjar/sdk/data/package_events/PackageEventManager$EventType;->ordinal()I

    move-result v14

    aget v2, v2, v14

    packed-switch v2, :pswitch_data_0

    .line 63
    new-instance v2, Ljava/lang/IllegalStateException;

    sget-object v14, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v15, "Unrecognized EventType [%1$s]"

    const/16 v16, 0x1

    move/from16 v0, v16

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    invoke-virtual {v10}, Lcom/getjar/sdk/data/package_events/PackageEventRecord;->getEventType()Lcom/getjar/sdk/data/package_events/PackageEventManager$EventType;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Lcom/getjar/sdk/data/package_events/PackageEventManager$EventType;->name()Ljava/lang/String;

    move-result-object v18

    aput-object v18, v16, v17

    invoke-static/range {v14 .. v16}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    invoke-direct {v2, v14}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 81
    :catch_0
    move-exception v8

    .line 84
    .local v8, "e":Ljava/lang/Exception;
    sget-object v2, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v14

    const-string v2, "Bad database record loaded"

    invoke-static {v14, v15, v2, v8}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 86
    :try_start_1
    invoke-static {}, Lcom/getjar/sdk/data/package_events/PackageEventDatabase;->getInstance()Lcom/getjar/sdk/data/package_events/PackageEventDatabase;

    move-result-object v2

    invoke-virtual {v10}, Lcom/getjar/sdk/data/package_events/PackageEventRecord;->getId()J

    move-result-wide v14

    invoke-virtual {v2, v14, v15}, Lcom/getjar/sdk/data/package_events/PackageEventDatabase;->deleteRecord(J)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 87
    :catch_1
    move-exception v7

    .local v7, "dbe":Ljava/lang/Exception;
    sget-object v2, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v14

    const-string v2, "deleteRecord failed"

    invoke-static {v14, v15, v2, v7}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 59
    .end local v7    # "dbe":Ljava/lang/Exception;
    .end local v8    # "e":Ljava/lang/Exception;
    :pswitch_0
    :try_start_2
    sget-object v3, Lcom/getjar/sdk/data/ReportUsageData$UsageType;->INSTALLED:Lcom/getjar/sdk/data/ReportUsageData$UsageType;

    .line 66
    :goto_1
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 67
    .local v4, "trackingMetadata":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v2, "business.event.timestamp"

    invoke-virtual {v10}, Lcom/getjar/sdk/data/package_events/PackageEventRecord;->getTimestamp()J

    move-result-wide v14

    invoke-static {v14, v15}, Lcom/getjar/sdk/utilities/Utility;->epochToISO8601(J)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v4, v2, v14}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    const-string v2, "business.event.type"

    invoke-virtual {v3}, Lcom/getjar/sdk/data/ReportUsageData$UsageType;->name()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v4, v2, v14}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 70
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 71
    .local v5, "appMetadata":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-virtual {v10}, Lcom/getjar/sdk/data/package_events/PackageEventRecord;->getPackageName()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/getjar/sdk/data/package_events/PackageEventReporter;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v14}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v14

    invoke-static {v2, v3, v14, v5}, Lcom/getjar/sdk/utilities/RewardUtility;->prepAppDataForReportUsage(Ljava/lang/String;Lcom/getjar/sdk/data/ReportUsageData$UsageType;Landroid/content/Context;Ljava/util/Map;)I

    move-result v6

    .line 77
    .local v6, "appFlags":I
    new-instance v1, Lcom/getjar/sdk/data/ReportUsageData;

    invoke-virtual {v10}, Lcom/getjar/sdk/data/package_events/PackageEventRecord;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-direct/range {v1 .. v6}, Lcom/getjar/sdk/data/ReportUsageData;-><init>(Ljava/lang/String;Lcom/getjar/sdk/data/ReportUsageData$UsageType;Ljava/util/Map;Ljava/util/Map;I)V

    .line 78
    .local v1, "usageData":Lcom/getjar/sdk/data/ReportUsageData;
    invoke-virtual {v13, v1, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 79
    invoke-interface {v12, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 60
    .end local v1    # "usageData":Lcom/getjar/sdk/data/ReportUsageData;
    .end local v4    # "trackingMetadata":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v5    # "appMetadata":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v6    # "appFlags":I
    :pswitch_1
    sget-object v3, Lcom/getjar/sdk/data/ReportUsageData$UsageType;->UNINSTALLED:Lcom/getjar/sdk/data/ReportUsageData$UsageType;

    goto :goto_1

    .line 61
    :pswitch_2
    sget-object v3, Lcom/getjar/sdk/data/ReportUsageData$UsageType;->FIRST_OPENED:Lcom/getjar/sdk/data/ReportUsageData$UsageType;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_1

    .line 92
    .end local v3    # "type":Lcom/getjar/sdk/data/ReportUsageData$UsageType;
    .end local v10    # "unsyncedRecord":Lcom/getjar/sdk/data/package_events/PackageEventRecord;
    :cond_0
    invoke-interface {v12}, Ljava/util/List;->size()I

    move-result v2

    if-lez v2, :cond_1

    .line 93
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/getjar/sdk/data/package_events/PackageEventReporter;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v2}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/getjar/sdk/data/usage/UsageManager;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/usage/UsageManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/getjar/sdk/data/usage/UsageManager;->getBackgroundBatchCount()I

    move-result v2

    invoke-static {}, Lcom/getjar/sdk/data/package_events/PackageEventDatabase;->getInstance()Lcom/getjar/sdk/data/package_events/PackageEventDatabase;

    move-result-object v14

    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v14, v12, v13}, Lcom/getjar/sdk/data/package_events/PackageEventReporter;->reportUsageInChunks(ILcom/getjar/sdk/data/SyncableDatabase;Ljava/util/List;Ljava/util/HashMap;)V

    .line 99
    :cond_1
    return-void

    .line 58
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method
