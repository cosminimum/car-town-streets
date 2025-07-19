.class public Lcom/getjar/sdk/data/usage/UsageReporter;
.super Lcom/getjar/sdk/data/ReportUsageReporter;
.source "UsageReporter.java"


# static fields
.field private static volatile _Instance:Lcom/getjar/sdk/data/usage/UsageReporter;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 30
    const/4 v0, 0x0

    sput-object v0, Lcom/getjar/sdk/data/usage/UsageReporter;->_Instance:Lcom/getjar/sdk/data/usage/UsageReporter;

    return-void
.end method

.method private constructor <init>(Lcom/getjar/sdk/comm/CommContext;)V
    .locals 0
    .param p1, "commContext"    # Lcom/getjar/sdk/comm/CommContext;

    .prologue
    .line 28
    invoke-direct {p0, p1}, Lcom/getjar/sdk/data/ReportUsageReporter;-><init>(Lcom/getjar/sdk/comm/CommContext;)V

    .line 29
    return-void
.end method

.method public static declared-synchronized getInstance(Lcom/getjar/sdk/comm/CommContext;)Lcom/getjar/sdk/data/usage/UsageReporter;
    .locals 3
    .param p0, "commContext"    # Lcom/getjar/sdk/comm/CommContext;

    .prologue
    .line 32
    const-class v1, Lcom/getjar/sdk/data/usage/UsageReporter;

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

    .line 33
    :cond_0
    :try_start_1
    sget-object v0, Lcom/getjar/sdk/data/usage/UsageReporter;->_Instance:Lcom/getjar/sdk/data/usage/UsageReporter;

    if-nez v0, :cond_1

    .line 34
    new-instance v0, Lcom/getjar/sdk/data/usage/UsageReporter;

    invoke-direct {v0, p0}, Lcom/getjar/sdk/data/usage/UsageReporter;-><init>(Lcom/getjar/sdk/comm/CommContext;)V

    sput-object v0, Lcom/getjar/sdk/data/usage/UsageReporter;->_Instance:Lcom/getjar/sdk/data/usage/UsageReporter;

    .line 36
    :cond_1
    sget-object v0, Lcom/getjar/sdk/data/usage/UsageReporter;->_Instance:Lcom/getjar/sdk/data/usage/UsageReporter;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit v1

    return-object v0
.end method

.method private mapSessionToEventType(Lcom/getjar/sdk/data/usage/SessionEvent;)Lcom/getjar/sdk/data/ReportUsageData$UsageType;
    .locals 6
    .param p1, "session"    # Lcom/getjar/sdk/data/usage/SessionEvent;

    .prologue
    const/4 v3, 0x1

    const/4 v5, 0x0

    .line 196
    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'session\' cannot be NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 198
    :cond_0
    sget-object v0, Lcom/getjar/sdk/data/usage/SessionEvent$Type;->start:Lcom/getjar/sdk/data/usage/SessionEvent$Type;

    invoke-virtual {p1}, Lcom/getjar/sdk/data/usage/SessionEvent;->getType()Lcom/getjar/sdk/data/usage/SessionEvent$Type;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/getjar/sdk/data/usage/SessionEvent$Type;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 201
    instance-of v0, p1, Lcom/getjar/sdk/data/usage/PhoneSessionEvent;

    if-eqz v0, :cond_1

    .line 202
    sget-object v0, Lcom/getjar/sdk/data/ReportUsageData$UsageType;->PHONE_SESSION_STARTED:Lcom/getjar/sdk/data/ReportUsageData$UsageType;

    .line 215
    :goto_0
    return-object v0

    .line 203
    :cond_1
    instance-of v0, p1, Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;

    if-eqz v0, :cond_2

    .line 204
    sget-object v0, Lcom/getjar/sdk/data/ReportUsageData$UsageType;->APP_SESSION_STARTED:Lcom/getjar/sdk/data/ReportUsageData$UsageType;

    goto :goto_0

    .line 206
    :cond_2
    new-instance v0, Ljava/lang/IllegalStateException;

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v2, "Unrecognized session class [%1$s]"

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 209
    :cond_3
    sget-object v0, Lcom/getjar/sdk/data/usage/SessionEvent$Type;->stop:Lcom/getjar/sdk/data/usage/SessionEvent$Type;

    invoke-virtual {p1}, Lcom/getjar/sdk/data/usage/SessionEvent;->getType()Lcom/getjar/sdk/data/usage/SessionEvent$Type;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/getjar/sdk/data/usage/SessionEvent$Type;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 212
    instance-of v0, p1, Lcom/getjar/sdk/data/usage/PhoneSessionEvent;

    if-eqz v0, :cond_4

    .line 213
    sget-object v0, Lcom/getjar/sdk/data/ReportUsageData$UsageType;->PHONE_SESSION_ENDED:Lcom/getjar/sdk/data/ReportUsageData$UsageType;

    goto :goto_0

    .line 214
    :cond_4
    instance-of v0, p1, Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;

    if-eqz v0, :cond_5

    .line 215
    sget-object v0, Lcom/getjar/sdk/data/ReportUsageData$UsageType;->APP_SESSION_ENDED:Lcom/getjar/sdk/data/ReportUsageData$UsageType;

    goto :goto_0

    .line 217
    :cond_5
    new-instance v0, Ljava/lang/IllegalStateException;

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v2, "Unrecognized session class [%1$s]"

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 220
    :cond_6
    invoke-virtual {p1}, Lcom/getjar/sdk/data/usage/SessionEvent;->getType()Lcom/getjar/sdk/data/usage/SessionEvent$Type;

    move-result-object v0

    if-eqz v0, :cond_7

    .line 221
    new-instance v0, Ljava/lang/IllegalStateException;

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v2, "Unrecognized session record type [%1$s]"

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {p1}, Lcom/getjar/sdk/data/usage/SessionEvent;->getType()Lcom/getjar/sdk/data/usage/SessionEvent$Type;

    move-result-object v4

    invoke-virtual {v4}, Lcom/getjar/sdk/data/usage/SessionEvent$Type;->name()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 223
    :cond_7
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Session record found with NULL type"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method protected handleResults(Lcom/getjar/sdk/data/SyncableDatabase;Lcom/getjar/sdk/comm/Operation;Ljava/util/List;Ljava/util/HashMap;)V
    .locals 16
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
    .line 139
    .local p1, "database":Lcom/getjar/sdk/data/SyncableDatabase;, "Lcom/getjar/sdk/data/SyncableDatabase<*>;"
    .local p3, "usageList":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/data/ReportUsageData;>;"
    .local p4, "usageToSession":Ljava/util/HashMap;, "Ljava/util/HashMap<Lcom/getjar/sdk/data/ReportUsageData;+Lcom/getjar/sdk/data/DatabaseRecordBase;>;"
    const/4 v6, 0x0

    .line 140
    .local v6, "updateRecordsAsSynced":Z
    if-nez p2, :cond_1

    .line 143
    const/4 v6, 0x1

    .line 158
    :cond_0
    :goto_0
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/getjar/sdk/data/usage/UsageReporter;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v8}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v8

    invoke-static {v8}, Lcom/getjar/sdk/data/usage/UsageDatabase;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/usage/UsageDatabase;

    move-result-object v7

    .line 161
    .local v7, "usageDB":Lcom/getjar/sdk/data/usage/UsageDatabase;
    if-eqz v6, :cond_4

    .line 162
    invoke-interface/range {p3 .. p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_4

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/getjar/sdk/data/ReportUsageData;

    .line 164
    .local v1, "appUsage":Lcom/getjar/sdk/data/ReportUsageData;
    :try_start_0
    move-object/from16 v0, p4

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/getjar/sdk/data/DatabaseRecordBase;

    .line 165
    .local v5, "session":Lcom/getjar/sdk/data/DatabaseRecordBase;
    instance-of v8, v5, Lcom/getjar/sdk/data/usage/PhoneSessionEvent;

    if-eqz v8, :cond_2

    .line 166
    invoke-virtual {v5}, Lcom/getjar/sdk/data/DatabaseRecordBase;->getId()J

    move-result-wide v8

    invoke-virtual {v7, v8, v9}, Lcom/getjar/sdk/data/usage/UsageDatabase;->phoneSessionSetAsSynced(J)V

    .line 167
    sget-object v8, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v8}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v8

    sget-object v10, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v11, "Usage: UsageReporter: handleResults() Updated phone session record as synced [id:%1$d]"

    const/4 v12, 0x1

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    invoke-virtual {v5}, Lcom/getjar/sdk/data/DatabaseRecordBase;->getId()J

    move-result-wide v14

    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v14

    aput-object v14, v12, v13

    invoke-static {v10, v11, v12}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v8, v9, v10}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 180
    .end local v5    # "session":Lcom/getjar/sdk/data/DatabaseRecordBase;
    :catch_0
    move-exception v2

    .line 183
    .local v2, "e":Ljava/lang/Exception;
    sget-object v8, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v8}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v8

    const-string v10, "Usage: UsageReporter: handleResults() Failed to find a Session for an App Usage"

    invoke-static {v8, v9, v10, v2}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 147
    .end local v1    # "appUsage":Lcom/getjar/sdk/data/ReportUsageData;
    .end local v2    # "e":Ljava/lang/Exception;
    .end local v3    # "i$":Ljava/util/Iterator;
    .end local v7    # "usageDB":Lcom/getjar/sdk/data/usage/UsageDatabase;
    :cond_1
    :try_start_1
    invoke-virtual/range {p2 .. p2}, Lcom/getjar/sdk/comm/Operation;->get()Lcom/getjar/sdk/comm/Result;

    move-result-object v4

    .line 148
    .local v4, "result":Lcom/getjar/sdk/comm/Result;
    if-eqz v4, :cond_0

    invoke-virtual {v4}, Lcom/getjar/sdk/comm/Result;->isSuccessfulResponse()Z
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_1 .. :try_end_1} :catch_2

    move-result v8

    if-eqz v8, :cond_0

    .line 149
    const/4 v6, 0x1

    goto :goto_0

    .line 151
    .end local v4    # "result":Lcom/getjar/sdk/comm/Result;
    :catch_1
    move-exception v2

    .line 152
    .local v2, "e":Ljava/lang/InterruptedException;
    new-instance v8, Lcom/getjar/sdk/exceptions/CommunicationException;

    invoke-direct {v8, v2}, Lcom/getjar/sdk/exceptions/CommunicationException;-><init>(Ljava/lang/Throwable;)V

    throw v8

    .line 153
    .end local v2    # "e":Ljava/lang/InterruptedException;
    :catch_2
    move-exception v2

    .line 154
    .local v2, "e":Ljava/util/concurrent/ExecutionException;
    new-instance v8, Lcom/getjar/sdk/exceptions/CommunicationException;

    invoke-direct {v8, v2}, Lcom/getjar/sdk/exceptions/CommunicationException;-><init>(Ljava/lang/Throwable;)V

    throw v8

    .line 170
    .end local v2    # "e":Ljava/util/concurrent/ExecutionException;
    .restart local v1    # "appUsage":Lcom/getjar/sdk/data/ReportUsageData;
    .restart local v3    # "i$":Ljava/util/Iterator;
    .restart local v5    # "session":Lcom/getjar/sdk/data/DatabaseRecordBase;
    .restart local v7    # "usageDB":Lcom/getjar/sdk/data/usage/UsageDatabase;
    :cond_2
    :try_start_2
    instance-of v8, v5, Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;

    if-eqz v8, :cond_3

    .line 171
    invoke-virtual {v5}, Lcom/getjar/sdk/data/DatabaseRecordBase;->getId()J

    move-result-wide v8

    invoke-virtual {v7, v8, v9}, Lcom/getjar/sdk/data/usage/UsageDatabase;->appSessionSetAsSynced(J)V

    .line 172
    sget-object v8, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v8}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v8

    sget-object v10, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v11, "Usage: UsageReporter: handleResults() Updated application session record as synced [id:%1$d]"

    const/4 v12, 0x1

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    invoke-virtual {v5}, Lcom/getjar/sdk/data/DatabaseRecordBase;->getId()J

    move-result-wide v14

    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v14

    aput-object v14, v12, v13

    invoke-static {v10, v11, v12}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v8, v9, v10}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    goto/16 :goto_1

    .line 176
    :cond_3
    new-instance v8, Ljava/lang/IllegalStateException;

    sget-object v9, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v10, "Usage: UsageReporter: handleResults() Unrecognized session event type [%1$s]"

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v13

    aput-object v13, v11, v12

    invoke-static {v9, v10, v11}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v8
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 188
    .end local v1    # "appUsage":Lcom/getjar/sdk/data/ReportUsageData;
    .end local v3    # "i$":Ljava/util/Iterator;
    .end local v5    # "session":Lcom/getjar/sdk/data/DatabaseRecordBase;
    :cond_4
    return-void
.end method

.method public sendUnsyncedData()V
    .locals 21

    .prologue
    .line 47
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/getjar/sdk/data/usage/UsageReporter;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v5}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5}, Lcom/getjar/sdk/data/usage/UsageDatabase;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/usage/UsageDatabase;

    move-result-object v16

    .line 48
    .local v16, "usageDB":Lcom/getjar/sdk/data/usage/UsageDatabase;
    invoke-virtual/range {v16 .. v16}, Lcom/getjar/sdk/data/usage/UsageDatabase;->phoneSessionLoadUnsynced()Ljava/util/List;

    move-result-object v15

    .line 49
    .local v15, "phoneSessions":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/data/usage/PhoneSessionEvent;>;"
    invoke-virtual/range {v16 .. v16}, Lcom/getjar/sdk/data/usage/UsageDatabase;->appSessionLoadUnsynced()Ljava/util/List;

    move-result-object v11

    .line 52
    .local v11, "appSessions":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;>;"
    new-instance v18, Ljava/util/HashMap;

    invoke-direct/range {v18 .. v18}, Ljava/util/HashMap;-><init>()V

    .line 53
    .local v18, "usageToSession":Ljava/util/HashMap;, "Ljava/util/HashMap<Lcom/getjar/sdk/data/ReportUsageData;Lcom/getjar/sdk/data/DatabaseRecordBase;>;"
    new-instance v17, Ljava/util/ArrayList;

    invoke-direct/range {v17 .. v17}, Ljava/util/ArrayList;-><init>()V

    .line 56
    .local v17, "usageList":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/data/ReportUsageData;>;"
    invoke-interface {v15}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v13

    .local v13, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/getjar/sdk/data/usage/PhoneSessionEvent;

    .line 58
    .local v14, "phoneSession":Lcom/getjar/sdk/data/usage/PhoneSessionEvent;
    :try_start_0
    move-object/from16 v0, p0

    invoke-direct {v0, v14}, Lcom/getjar/sdk/data/usage/UsageReporter;->mapSessionToEventType(Lcom/getjar/sdk/data/usage/SessionEvent;)Lcom/getjar/sdk/data/ReportUsageData$UsageType;

    move-result-object v6

    .line 60
    .local v6, "type":Lcom/getjar/sdk/data/ReportUsageData$UsageType;
    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    .line 61
    .local v7, "trackingMetadata":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v5, "business.event.phone.session_id"

    invoke-virtual {v14}, Lcom/getjar/sdk/data/usage/PhoneSessionEvent;->getSessionId()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v7, v5, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    const-string v5, "business.event.timestamp"

    invoke-virtual {v14}, Lcom/getjar/sdk/data/usage/PhoneSessionEvent;->getTimestamp()J

    move-result-wide v19

    invoke-static/range {v19 .. v20}, Lcom/getjar/sdk/utilities/Utility;->epochToISO8601(J)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v7, v5, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    const-string v5, "business.event.type"

    invoke-virtual {v6}, Lcom/getjar/sdk/data/ReportUsageData$UsageType;->name()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v7, v5, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    const-string v5, "business.event.reason"

    invoke-virtual {v14}, Lcom/getjar/sdk/data/usage/PhoneSessionEvent;->getReason()Lcom/getjar/sdk/data/usage/SessionEvent$Reason;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Lcom/getjar/sdk/data/usage/SessionEvent$Reason;->name()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v7, v5, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    invoke-virtual {v14}, Lcom/getjar/sdk/data/usage/PhoneSessionEvent;->getReasonDetails()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 66
    const-string v5, "business.event.reason_details"

    invoke-virtual {v14}, Lcom/getjar/sdk/data/usage/PhoneSessionEvent;->getReasonDetails()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v7, v5, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 69
    :cond_0
    new-instance v8, Ljava/util/HashMap;

    invoke-direct {v8}, Ljava/util/HashMap;-><init>()V

    .line 70
    .local v8, "appMetadata":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v5, "device.platform"

    const-string v19, "android"

    move-object/from16 v0, v19

    invoke-virtual {v8, v5, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 71
    const-string v5, "device.platform_version"

    sget-object v19, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    move-object/from16 v0, v19

    invoke-virtual {v8, v5, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 73
    new-instance v4, Lcom/getjar/sdk/data/ReportUsageData;

    const/4 v5, 0x0

    invoke-direct {v4, v6, v7, v8, v5}, Lcom/getjar/sdk/data/ReportUsageData;-><init>(Lcom/getjar/sdk/data/ReportUsageData$UsageType;Ljava/util/Map;Ljava/util/Map;I)V

    .line 74
    .local v4, "usageData":Lcom/getjar/sdk/data/ReportUsageData;
    move-object/from16 v0, v18

    invoke-virtual {v0, v4, v14}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 75
    move-object/from16 v0, v17

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 76
    .end local v4    # "usageData":Lcom/getjar/sdk/data/ReportUsageData;
    .end local v6    # "type":Lcom/getjar/sdk/data/ReportUsageData$UsageType;
    .end local v7    # "trackingMetadata":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v8    # "appMetadata":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :catch_0
    move-exception v12

    .line 79
    .local v12, "e":Ljava/lang/Exception;
    sget-object v5, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v19

    const-string v5, "Bad phone session record loaded"

    move-wide/from16 v0, v19

    invoke-static {v0, v1, v5, v12}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 80
    :try_start_1
    invoke-virtual {v14}, Lcom/getjar/sdk/data/usage/PhoneSessionEvent;->getId()J

    move-result-wide v19

    move-object/from16 v0, v16

    move-wide/from16 v1, v19

    invoke-virtual {v0, v1, v2}, Lcom/getjar/sdk/data/usage/UsageDatabase;->deletePhoneSession(J)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto/16 :goto_0

    :catch_1
    move-exception v5

    goto/16 :goto_0

    .line 85
    .end local v12    # "e":Ljava/lang/Exception;
    .end local v14    # "phoneSession":Lcom/getjar/sdk/data/usage/PhoneSessionEvent;
    :cond_1
    invoke-interface {v11}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v13

    :goto_1
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;

    .line 87
    .local v10, "appSession":Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;
    :try_start_2
    move-object/from16 v0, p0

    invoke-direct {v0, v10}, Lcom/getjar/sdk/data/usage/UsageReporter;->mapSessionToEventType(Lcom/getjar/sdk/data/usage/SessionEvent;)Lcom/getjar/sdk/data/ReportUsageData$UsageType;

    move-result-object v6

    .line 89
    .restart local v6    # "type":Lcom/getjar/sdk/data/ReportUsageData$UsageType;
    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    .line 90
    .restart local v7    # "trackingMetadata":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v5, "business.event.phone.session_id"

    invoke-virtual {v10}, Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;->getPhoneSessionId()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v7, v5, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 91
    const-string v5, "business.event.app.session_id"

    invoke-virtual {v10}, Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;->getSessionId()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v7, v5, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    const-string v5, "business.event.timestamp"

    invoke-virtual {v10}, Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;->getTimestamp()J

    move-result-wide v19

    invoke-static/range {v19 .. v20}, Lcom/getjar/sdk/utilities/Utility;->epochToISO8601(J)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v7, v5, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 93
    const-string v5, "business.event.type"

    invoke-virtual {v6}, Lcom/getjar/sdk/data/ReportUsageData$UsageType;->name()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v7, v5, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    const-string v5, "business.event.reason"

    invoke-virtual {v10}, Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;->getReason()Lcom/getjar/sdk/data/usage/SessionEvent$Reason;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Lcom/getjar/sdk/data/usage/SessionEvent$Reason;->name()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v7, v5, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    invoke-virtual {v10}, Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;->getReasonDetails()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_2

    .line 96
    const-string v5, "business.event.reason_details"

    invoke-virtual {v10}, Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;->getReasonDetails()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v7, v5, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 99
    :cond_2
    new-instance v8, Ljava/util/HashMap;

    invoke-direct {v8}, Ljava/util/HashMap;-><init>()V

    .line 100
    .restart local v8    # "appMetadata":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-virtual {v10}, Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;->getPackageName()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getjar/sdk/data/usage/UsageReporter;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-static {v5, v6, v0, v8}, Lcom/getjar/sdk/utilities/RewardUtility;->prepAppDataForReportUsage(Ljava/lang/String;Lcom/getjar/sdk/data/ReportUsageData$UsageType;Landroid/content/Context;Ljava/util/Map;)I

    move-result v9

    .line 106
    .local v9, "appFlags":I
    new-instance v4, Lcom/getjar/sdk/data/ReportUsageData;

    invoke-virtual {v10}, Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;->getPackageName()Ljava/lang/String;

    move-result-object v5

    invoke-direct/range {v4 .. v9}, Lcom/getjar/sdk/data/ReportUsageData;-><init>(Ljava/lang/String;Lcom/getjar/sdk/data/ReportUsageData$UsageType;Ljava/util/Map;Ljava/util/Map;I)V

    .line 107
    .restart local v4    # "usageData":Lcom/getjar/sdk/data/ReportUsageData;
    move-object/from16 v0, v18

    invoke-virtual {v0, v4, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 108
    move-object/from16 v0, v17

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    goto/16 :goto_1

    .line 109
    .end local v4    # "usageData":Lcom/getjar/sdk/data/ReportUsageData;
    .end local v6    # "type":Lcom/getjar/sdk/data/ReportUsageData$UsageType;
    .end local v7    # "trackingMetadata":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v8    # "appMetadata":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v9    # "appFlags":I
    :catch_2
    move-exception v12

    .line 112
    .restart local v12    # "e":Ljava/lang/Exception;
    sget-object v5, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v19

    const-string v5, "Bad application session record loaded"

    move-wide/from16 v0, v19

    invoke-static {v0, v1, v5, v12}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 113
    :try_start_3
    invoke-virtual {v10}, Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;->getId()J

    move-result-wide v19

    move-object/from16 v0, v16

    move-wide/from16 v1, v19

    invoke-virtual {v0, v1, v2}, Lcom/getjar/sdk/data/usage/UsageDatabase;->deleteAppSession(J)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    goto/16 :goto_1

    :catch_3
    move-exception v5

    goto/16 :goto_1

    .line 117
    .end local v10    # "appSession":Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;
    .end local v12    # "e":Ljava/lang/Exception;
    :cond_3
    invoke-interface/range {v17 .. v17}, Ljava/util/List;->size()I

    move-result v5

    if-lez v5, :cond_4

    .line 118
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/getjar/sdk/data/usage/UsageReporter;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v5}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5}, Lcom/getjar/sdk/data/usage/UsageManager;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/usage/UsageManager;

    move-result-object v5

    invoke-virtual {v5}, Lcom/getjar/sdk/data/usage/UsageManager;->getBackgroundBatchCount()I

    move-result v5

    const/16 v19, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move-object/from16 v2, v17

    move-object/from16 v3, v18

    invoke-virtual {v0, v5, v1, v2, v3}, Lcom/getjar/sdk/data/usage/UsageReporter;->reportUsageInChunks(ILcom/getjar/sdk/data/SyncableDatabase;Ljava/util/List;Ljava/util/HashMap;)V

    .line 124
    :cond_4
    return-void
.end method
