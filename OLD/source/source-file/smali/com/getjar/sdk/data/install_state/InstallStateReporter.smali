.class Lcom/getjar/sdk/data/install_state/InstallStateReporter;
.super Lcom/getjar/sdk/data/ReportUsageReporter;
.source "InstallStateReporter.java"


# static fields
.field private static volatile _Instance:Lcom/getjar/sdk/data/install_state/InstallStateReporter;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 28
    const/4 v0, 0x0

    sput-object v0, Lcom/getjar/sdk/data/install_state/InstallStateReporter;->_Instance:Lcom/getjar/sdk/data/install_state/InstallStateReporter;

    return-void
.end method

.method private constructor <init>(Lcom/getjar/sdk/comm/CommContext;)V
    .locals 0
    .param p1, "commContext"    # Lcom/getjar/sdk/comm/CommContext;

    .prologue
    .line 26
    invoke-direct {p0, p1}, Lcom/getjar/sdk/data/ReportUsageReporter;-><init>(Lcom/getjar/sdk/comm/CommContext;)V

    .line 27
    return-void
.end method

.method public static declared-synchronized getInstance(Lcom/getjar/sdk/comm/CommContext;)Lcom/getjar/sdk/data/install_state/InstallStateReporter;
    .locals 3
    .param p0, "commContext"    # Lcom/getjar/sdk/comm/CommContext;

    .prologue
    .line 30
    const-class v1, Lcom/getjar/sdk/data/install_state/InstallStateReporter;

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

    .line 31
    :cond_0
    :try_start_1
    sget-object v0, Lcom/getjar/sdk/data/install_state/InstallStateReporter;->_Instance:Lcom/getjar/sdk/data/install_state/InstallStateReporter;

    if-nez v0, :cond_1

    .line 32
    new-instance v0, Lcom/getjar/sdk/data/install_state/InstallStateReporter;

    invoke-direct {v0, p0}, Lcom/getjar/sdk/data/install_state/InstallStateReporter;-><init>(Lcom/getjar/sdk/comm/CommContext;)V

    sput-object v0, Lcom/getjar/sdk/data/install_state/InstallStateReporter;->_Instance:Lcom/getjar/sdk/data/install_state/InstallStateReporter;

    .line 34
    :cond_1
    sget-object v0, Lcom/getjar/sdk/data/install_state/InstallStateReporter;->_Instance:Lcom/getjar/sdk/data/install_state/InstallStateReporter;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit v1

    return-object v0
.end method


# virtual methods
.method protected sendUnsyncedData()V
    .locals 19

    .prologue
    .line 45
    invoke-static {}, Lcom/getjar/sdk/data/install_state/InstallStateDatabase;->getInstance()Lcom/getjar/sdk/data/install_state/InstallStateDatabase;

    move-result-object v2

    invoke-virtual {v2}, Lcom/getjar/sdk/data/install_state/InstallStateDatabase;->loadUnsyncedRecords()Ljava/util/List;

    move-result-object v11

    .line 48
    .local v11, "unsyncedRecords":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/data/install_state/InstallStateRecord;>;"
    new-instance v13, Ljava/util/HashMap;

    invoke-direct {v13}, Ljava/util/HashMap;-><init>()V

    .line 49
    .local v13, "usageToDBRecord":Ljava/util/HashMap;, "Ljava/util/HashMap<Lcom/getjar/sdk/data/ReportUsageData;Lcom/getjar/sdk/data/DatabaseRecordBase;>;"
    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    .line 52
    .local v12, "usageList":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/data/ReportUsageData;>;"
    invoke-interface {v11}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .local v9, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/getjar/sdk/data/install_state/InstallStateRecord;

    .line 56
    .local v10, "unsyncedRecord":Lcom/getjar/sdk/data/install_state/InstallStateRecord;
    const/4 v3, 0x0

    .line 57
    .local v3, "type":Lcom/getjar/sdk/data/ReportUsageData$UsageType;
    :try_start_0
    sget-object v2, Lcom/getjar/sdk/data/install_state/InstallStateManager$InstallState;->FOUND_INSTALLED:Lcom/getjar/sdk/data/install_state/InstallStateManager$InstallState;

    invoke-virtual {v10}, Lcom/getjar/sdk/data/install_state/InstallStateRecord;->getStatus()Lcom/getjar/sdk/data/install_state/InstallStateManager$InstallState;

    move-result-object v14

    invoke-virtual {v2, v14}, Lcom/getjar/sdk/data/install_state/InstallStateManager$InstallState;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 58
    sget-object v3, Lcom/getjar/sdk/data/ReportUsageData$UsageType;->FOUND_INSTALLED:Lcom/getjar/sdk/data/ReportUsageData$UsageType;

    .line 65
    :goto_1
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 66
    .local v4, "trackingMetadata":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v2, "business.event.timestamp"

    invoke-virtual {v10}, Lcom/getjar/sdk/data/install_state/InstallStateRecord;->getTimestamp()J

    move-result-wide v14

    invoke-static {v14, v15}, Lcom/getjar/sdk/utilities/Utility;->epochToISO8601(J)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v4, v2, v14}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 67
    const-string v2, "business.event.type"

    invoke-virtual {v3}, Lcom/getjar/sdk/data/ReportUsageData$UsageType;->name()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v4, v2, v14}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 69
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 70
    .local v5, "appMetadata":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-virtual {v10}, Lcom/getjar/sdk/data/install_state/InstallStateRecord;->getPackageName()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/getjar/sdk/data/install_state/InstallStateReporter;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v14}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v14

    invoke-static {v2, v3, v14, v5}, Lcom/getjar/sdk/utilities/RewardUtility;->prepAppDataForReportUsage(Ljava/lang/String;Lcom/getjar/sdk/data/ReportUsageData$UsageType;Landroid/content/Context;Ljava/util/Map;)I

    move-result v6

    .line 76
    .local v6, "appFlags":I
    new-instance v1, Lcom/getjar/sdk/data/ReportUsageData;

    invoke-virtual {v10}, Lcom/getjar/sdk/data/install_state/InstallStateRecord;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-direct/range {v1 .. v6}, Lcom/getjar/sdk/data/ReportUsageData;-><init>(Ljava/lang/String;Lcom/getjar/sdk/data/ReportUsageData$UsageType;Ljava/util/Map;Ljava/util/Map;I)V

    .line 77
    .local v1, "usageData":Lcom/getjar/sdk/data/ReportUsageData;
    invoke-virtual {v13, v1, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 78
    invoke-interface {v12, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 80
    .end local v1    # "usageData":Lcom/getjar/sdk/data/ReportUsageData;
    .end local v4    # "trackingMetadata":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v5    # "appMetadata":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v6    # "appFlags":I
    :catch_0
    move-exception v8

    .line 83
    .local v8, "e":Ljava/lang/Exception;
    sget-object v2, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v14

    const-string v2, "Bad database record loaded"

    invoke-static {v14, v15, v2, v8}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 85
    :try_start_1
    invoke-static {}, Lcom/getjar/sdk/data/install_state/InstallStateDatabase;->getInstance()Lcom/getjar/sdk/data/install_state/InstallStateDatabase;

    move-result-object v2

    invoke-virtual {v10}, Lcom/getjar/sdk/data/install_state/InstallStateRecord;->getId()J

    move-result-wide v14

    invoke-virtual {v2, v14, v15}, Lcom/getjar/sdk/data/install_state/InstallStateDatabase;->deleteRecord(J)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 86
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
    :cond_0
    :try_start_2
    sget-object v2, Lcom/getjar/sdk/data/install_state/InstallStateManager$InstallState;->FOUND_UNINSTALLED:Lcom/getjar/sdk/data/install_state/InstallStateManager$InstallState;

    invoke-virtual {v10}, Lcom/getjar/sdk/data/install_state/InstallStateRecord;->getStatus()Lcom/getjar/sdk/data/install_state/InstallStateManager$InstallState;

    move-result-object v14

    invoke-virtual {v2, v14}, Lcom/getjar/sdk/data/install_state/InstallStateManager$InstallState;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 60
    sget-object v3, Lcom/getjar/sdk/data/ReportUsageData$UsageType;->FOUND_UNINSTALLED:Lcom/getjar/sdk/data/ReportUsageData$UsageType;

    goto :goto_1

    .line 62
    :cond_1
    new-instance v2, Ljava/lang/IllegalStateException;

    sget-object v14, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v15, "Unrecognized InstallStateRecord state [%1$s]"

    const/16 v16, 0x1

    move/from16 v0, v16

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    invoke-virtual {v10}, Lcom/getjar/sdk/data/install_state/InstallStateRecord;->getStatus()Lcom/getjar/sdk/data/install_state/InstallStateManager$InstallState;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Lcom/getjar/sdk/data/install_state/InstallStateManager$InstallState;->name()Ljava/lang/String;

    move-result-object v18

    aput-object v18, v16, v17

    invoke-static/range {v14 .. v16}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    invoke-direct {v2, v14}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 91
    .end local v3    # "type":Lcom/getjar/sdk/data/ReportUsageData$UsageType;
    .end local v10    # "unsyncedRecord":Lcom/getjar/sdk/data/install_state/InstallStateRecord;
    :cond_2
    invoke-interface {v12}, Ljava/util/List;->size()I

    move-result v2

    if-lez v2, :cond_3

    .line 92
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/getjar/sdk/data/install_state/InstallStateReporter;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v2}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/getjar/sdk/data/usage/UsageManager;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/usage/UsageManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/getjar/sdk/data/usage/UsageManager;->getBackgroundBatchCount()I

    move-result v2

    invoke-static {}, Lcom/getjar/sdk/data/install_state/InstallStateDatabase;->getInstance()Lcom/getjar/sdk/data/install_state/InstallStateDatabase;

    move-result-object v14

    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v14, v12, v13}, Lcom/getjar/sdk/data/install_state/InstallStateReporter;->reportUsageInChunks(ILcom/getjar/sdk/data/SyncableDatabase;Ljava/util/List;Ljava/util/HashMap;)V

    .line 98
    :cond_3
    return-void
.end method
