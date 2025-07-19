.class public Lcom/getjar/sdk/comm/StatisticsTracker;
.super Ljava/lang/Object;
.source "StatisticsTracker.java"


# static fields
.field private static _SessionRequestCounts:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static _Start:J


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 16
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    sput-wide v0, Lcom/getjar/sdk/comm/StatisticsTracker;->_Start:J

    .line 17
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    sput-object v0, Lcom/getjar/sdk/comm/StatisticsTracker;->_SessionRequestCounts:Ljava/util/concurrent/ConcurrentHashMap;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static dumpAllStatsToLogCat(Landroid/content/Context;)V
    .locals 10
    .param p0, "androidContext"    # Landroid/content/Context;

    .prologue
    .line 28
    :try_start_0
    invoke-static {}, Lcom/getjar/sdk/comm/StatisticsTracker;->dumpSessionRatesToLogCat()V

    .line 31
    invoke-static {p0}, Lcom/getjar/sdk/data/DBRequestStatistics;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/DBRequestStatistics;

    move-result-object v4

    invoke-virtual {v4}, Lcom/getjar/sdk/data/DBRequestStatistics;->getAnalyticData()Ljava/util/Map;

    move-result-object v3

    .line 32
    .local v3, "stats":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Float;>;"
    invoke-interface {v3}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 33
    .local v2, "name":Ljava/lang/String;
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "STATS: %1$s = %2$f"

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object v2, v7, v8

    const/4 v8, 0x1

    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 36
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "name":Ljava/lang/String;
    .end local v3    # "stats":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Float;>;"
    :catch_0
    move-exception v0

    .line 37
    .local v0, "e":Ljava/lang/Exception;
    sget-object v4, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    const-string v6, "StatisticsTracker: dumpAllStatsToLogCat() failed"

    invoke-static {v4, v5, v6, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 40
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_0
    return-void
.end method

.method private static dumpSessionRatesToLogCat()V
    .locals 14

    .prologue
    .line 46
    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    sget-wide v9, Lcom/getjar/sdk/comm/StatisticsTracker;->_Start:J

    sub-long v0, v7, v9

    .line 47
    .local v0, "delta":J
    long-to-float v7, v0

    const/high16 v8, 0x447a0000    # 1000.0f

    div-float v2, v7, v8

    .line 48
    .local v2, "deltaSeconds":F
    sget-object v7, Lcom/getjar/sdk/comm/StatisticsTracker;->_SessionRequestCounts:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v7}, Ljava/util/concurrent/ConcurrentHashMap;->keySet()Ljava/util/Set;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 49
    .local v5, "name":Ljava/lang/String;
    sget-object v7, Lcom/getjar/sdk/comm/StatisticsTracker;->_SessionRequestCounts:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v7, v5}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v6

    .line 50
    .local v6, "value":I
    sget-object v7, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    sget-object v9, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v10, "STATS: %1$s has been called %2$d times in %3$f seconds (%4$f requests per second)"

    const/4 v11, 0x4

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    aput-object v5, v11, v12

    const/4 v12, 0x1

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    aput-object v13, v11, v12

    const/4 v12, 0x2

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v13

    aput-object v13, v11, v12

    const/4 v12, 0x3

    int-to-float v13, v6

    div-float/2addr v13, v2

    invoke-static {v13}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v13

    aput-object v13, v11, v12

    invoke-static {v9, v10, v11}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v7, v8, v9}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 57
    .end local v4    # "i$":Ljava/util/Iterator;
    .end local v5    # "name":Ljava/lang/String;
    .end local v6    # "value":I
    :catch_0
    move-exception v3

    .line 58
    .local v3, "e":Ljava/lang/Exception;
    sget-object v7, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    const-string v9, "StatisticsTracker: dumpSessionRatesToLogCat() failed"

    invoke-static {v7, v8, v9, v3}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 61
    .end local v3    # "e":Ljava/lang/Exception;
    :cond_0
    return-void
.end method

.method public static logRequest(Lcom/getjar/sdk/comm/Operation;)V
    .locals 8
    .param p0, "operation"    # Lcom/getjar/sdk/comm/Operation;

    .prologue
    .line 66
    if-nez p0, :cond_0

    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "\'operation\' can not be NULL"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 70
    :cond_0
    const/4 v0, 0x0

    .line 71
    .local v0, "count":I
    :try_start_0
    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "%1$s:%2$s"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-virtual {p0}, Lcom/getjar/sdk/comm/Operation;->getRequest()Lcom/getjar/sdk/comm/Request;

    move-result-object v7

    invoke-virtual {v7}, Lcom/getjar/sdk/comm/Request;->getServiceName()Lcom/getjar/sdk/comm/Request$ServiceName;

    move-result-object v7

    invoke-virtual {v7}, Lcom/getjar/sdk/comm/Request$ServiceName;->name()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x1

    invoke-virtual {p0}, Lcom/getjar/sdk/comm/Operation;->getRequest()Lcom/getjar/sdk/comm/Request;

    move-result-object v7

    invoke-virtual {v7}, Lcom/getjar/sdk/comm/Request;->getRequestType()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 72
    .local v2, "srcKey":Ljava/lang/String;
    sget-object v3, Lcom/getjar/sdk/comm/StatisticsTracker;->_SessionRequestCounts:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v3, v2}, Ljava/util/concurrent/ConcurrentHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 73
    sget-object v3, Lcom/getjar/sdk/comm/StatisticsTracker;->_SessionRequestCounts:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v3, v2}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 75
    :cond_1
    sget-object v3, Lcom/getjar/sdk/comm/StatisticsTracker;->_SessionRequestCounts:Ljava/util/concurrent/ConcurrentHashMap;

    add-int/lit8 v4, v0, 0x1

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v2, v4}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 78
    invoke-virtual {p0}, Lcom/getjar/sdk/comm/Operation;->getCommContext()Lcom/getjar/sdk/comm/CommContext;

    move-result-object v3

    invoke-virtual {v3}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/getjar/sdk/data/DBRequestStatistics;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/DBRequestStatistics;

    move-result-object v3

    invoke-virtual {p0}, Lcom/getjar/sdk/comm/Operation;->getRequest()Lcom/getjar/sdk/comm/Request;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/getjar/sdk/data/DBRequestStatistics;->upsertRequestRecord(Lcom/getjar/sdk/comm/Request;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 84
    .end local v2    # "srcKey":Ljava/lang/String;
    :goto_0
    return-void

    .line 80
    :catch_0
    move-exception v1

    .line 81
    .local v1, "e":Ljava/lang/Exception;
    sget-object v3, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    const-string v5, "StatisticsTracker: logRequest() failed"

    invoke-static {v3, v4, v5, v1}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public static logResponse(Lcom/getjar/sdk/comm/Operation;)V
    .locals 4
    .param p0, "operation"    # Lcom/getjar/sdk/comm/Operation;

    .prologue
    .line 89
    if-nez p0, :cond_0

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\'operation\' can not be NULL"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 90
    :cond_0
    invoke-virtual {p0}, Lcom/getjar/sdk/comm/Operation;->getResult()Lcom/getjar/sdk/comm/Result;

    move-result-object v1

    if-nez v1, :cond_1

    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "logResponse() can not be called with an operation that has no result"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 92
    :cond_1
    :try_start_0
    invoke-virtual {p0}, Lcom/getjar/sdk/comm/Operation;->getCommContext()Lcom/getjar/sdk/comm/CommContext;

    move-result-object v1

    invoke-virtual {v1}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/getjar/sdk/data/DBRequestStatistics;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/DBRequestStatistics;

    move-result-object v1

    invoke-virtual {p0}, Lcom/getjar/sdk/comm/Operation;->getRequest()Lcom/getjar/sdk/comm/Request;

    move-result-object v2

    invoke-virtual {p0}, Lcom/getjar/sdk/comm/Operation;->getResult()Lcom/getjar/sdk/comm/Result;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/getjar/sdk/data/DBRequestStatistics;->addResponseRecord(Lcom/getjar/sdk/comm/Request;Lcom/getjar/sdk/comm/Result;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 97
    :goto_0
    return-void

    .line 93
    :catch_0
    move-exception v0

    .line 94
    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    const-string v3, "StatisticsTracker: logResponse() failed"

    invoke-static {v1, v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
