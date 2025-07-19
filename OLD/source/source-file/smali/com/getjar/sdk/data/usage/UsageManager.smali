.class public Lcom/getjar/sdk/data/usage/UsageManager;
.super Ljava/lang/Object;
.source "UsageManager.java"


# static fields
.field private static final BACKGROUND_SEND_BATCH_COUNT:I = 0x32

.field private static final BACKGROUND_SEND_ENABLED:Z = false

.field private static final BACKGROUND_SEND_INTERVAL_SECONDS:I = 0x1c20

.field private static ComparatorPackageName:Ljava/util/Comparator; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator",
            "<",
            "Lcom/getjar/sdk/data/usage/AggregateUsageRecord;",
            ">;"
        }
    .end annotation
.end field

.field private static ComparatorTimestampStart:Ljava/util/Comparator; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator",
            "<",
            "Lcom/getjar/sdk/data/usage/AggregateUsageRecord;",
            ">;"
        }
    .end annotation
.end field

.field private static ComparatorTimestampStop:Ljava/util/Comparator; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator",
            "<",
            "Lcom/getjar/sdk/data/usage/AggregateUsageRecord;",
            ">;"
        }
    .end annotation
.end field

.field private static ComparatorTotalSessionsCount:Ljava/util/Comparator; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator",
            "<",
            "Lcom/getjar/sdk/data/usage/AggregateUsageRecord;",
            ">;"
        }
    .end annotation
.end field

.field private static ComparatorTotalUseDuration:Ljava/util/Comparator; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator",
            "<",
            "Lcom/getjar/sdk/data/usage/AggregateUsageRecord;",
            ">;"
        }
    .end annotation
.end field

.field private static final REQUEST_MAX_COUNT:I = 0xa

.field private static final REQUEST_TIME_WINDOW_COUNT:I = 0x7

.field private static final REQUEST_TIME_WINDOW_SECONDS:I = 0x15180

.field private static final USAGE_FILTER_SYSTEM_ENABLED:Z = true

.field private static final USAGE_MONITORING_ENABLED:Z = true

.field private static final USAGE_REQUEST_SEND_ENABLED:Z

.field private static volatile _Instance:Lcom/getjar/sdk/data/usage/UsageManager;

.field private static typeFilterLock:Ljava/lang/Object;


# instance fields
.field private final _context:Landroid/content/Context;

.field private _regExCache:Ljava/lang/String;

.field private _regExPatternCache:Ljava/util/regex/Pattern;

.field private volatile _typeFilterCache:Ljava/lang/String;

.field private volatile _typeFilterSetCache:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet",
            "<",
            "Lcom/getjar/sdk/data/ReportUsageData$UsageType;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 32
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/getjar/sdk/data/usage/UsageManager;->typeFilterLock:Ljava/lang/Object;

    .line 51
    const/4 v0, 0x0

    sput-object v0, Lcom/getjar/sdk/data/usage/UsageManager;->_Instance:Lcom/getjar/sdk/data/usage/UsageManager;

    .line 502
    new-instance v0, Lcom/getjar/sdk/data/usage/UsageManager$1;

    invoke-direct {v0}, Lcom/getjar/sdk/data/usage/UsageManager$1;-><init>()V

    sput-object v0, Lcom/getjar/sdk/data/usage/UsageManager;->ComparatorPackageName:Ljava/util/Comparator;

    .line 505
    new-instance v0, Lcom/getjar/sdk/data/usage/UsageManager$2;

    invoke-direct {v0}, Lcom/getjar/sdk/data/usage/UsageManager$2;-><init>()V

    sput-object v0, Lcom/getjar/sdk/data/usage/UsageManager;->ComparatorTimestampStart:Ljava/util/Comparator;

    .line 508
    new-instance v0, Lcom/getjar/sdk/data/usage/UsageManager$3;

    invoke-direct {v0}, Lcom/getjar/sdk/data/usage/UsageManager$3;-><init>()V

    sput-object v0, Lcom/getjar/sdk/data/usage/UsageManager;->ComparatorTimestampStop:Ljava/util/Comparator;

    .line 511
    new-instance v0, Lcom/getjar/sdk/data/usage/UsageManager$4;

    invoke-direct {v0}, Lcom/getjar/sdk/data/usage/UsageManager$4;-><init>()V

    sput-object v0, Lcom/getjar/sdk/data/usage/UsageManager;->ComparatorTotalUseDuration:Ljava/util/Comparator;

    .line 514
    new-instance v0, Lcom/getjar/sdk/data/usage/UsageManager$5;

    invoke-direct {v0}, Lcom/getjar/sdk/data/usage/UsageManager$5;-><init>()V

    sput-object v0, Lcom/getjar/sdk/data/usage/UsageManager;->ComparatorTotalSessionsCount:Ljava/util/Comparator;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x0

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput-object v1, p0, Lcom/getjar/sdk/data/usage/UsageManager;->_regExPatternCache:Ljava/util/regex/Pattern;

    .line 28
    iput-object v1, p0, Lcom/getjar/sdk/data/usage/UsageManager;->_regExCache:Ljava/lang/String;

    .line 30
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/getjar/sdk/data/usage/UsageManager;->_typeFilterSetCache:Ljava/util/HashSet;

    .line 31
    iput-object v1, p0, Lcom/getjar/sdk/data/usage/UsageManager;->_typeFilterCache:Ljava/lang/String;

    .line 47
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/getjar/sdk/data/usage/UsageManager;->_context:Landroid/content/Context;

    .line 49
    return-void
.end method

.method private getBackgroundSendEnabled()Z
    .locals 7

    .prologue
    const/4 v6, 0x0

    .line 79
    iget-object v1, p0, Lcom/getjar/sdk/data/usage/UsageManager;->_context:Landroid/content/Context;

    invoke-static {v1}, Lcom/getjar/sdk/comm/GetJarConfig;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/comm/GetJarConfig;

    move-result-object v1

    const-string v2, "usage.background.send.enabled"

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/getjar/sdk/comm/GetJarConfig;->getBooleanValue(Ljava/lang/String;Ljava/lang/Boolean;)Ljava/lang/Boolean;

    move-result-object v0

    .line 80
    .local v0, "value":Ljava/lang/Boolean;
    if-nez v0, :cond_0

    .line 81
    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    .line 83
    :cond_0
    sget-object v1, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->CONFIG:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "UsageManager getBackgroundSendEnabled: %1$s"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Boolean;->toString()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 84
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    return v1
.end method

.method private getBackgroundTypeFilter()Ljava/lang/String;
    .locals 6

    .prologue
    .line 137
    iget-object v1, p0, Lcom/getjar/sdk/data/usage/UsageManager;->_context:Landroid/content/Context;

    invoke-static {v1}, Lcom/getjar/sdk/comm/GetJarConfig;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/comm/GetJarConfig;

    move-result-object v1

    const-string v2, "usage.background.type_filter"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Lcom/getjar/sdk/comm/GetJarConfig;->getDirectiveValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 138
    .local v0, "value":Ljava/lang/String;
    sget-object v1, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->CONFIG:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "UsageManager getBackgroundTypeFilter: %1$s"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v0, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 139
    return-object v0
.end method

.method private getCollapsedSortedAggregateSessions()Ljava/util/List;
    .locals 18
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/getjar/sdk/data/usage/AggregateUsageRecord;",
            ">;"
        }
    .end annotation

    .prologue
    .line 454
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/getjar/sdk/data/usage/UsageManager;->_context:Landroid/content/Context;

    invoke-static {v1}, Lcom/getjar/sdk/data/usage/UsageRollupDatabase;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/usage/UsageRollupDatabase;

    move-result-object v1

    invoke-virtual {v1}, Lcom/getjar/sdk/data/usage/UsageRollupDatabase;->loadAggregateSessions()Ljava/util/List;

    move-result-object v16

    .line 457
    .local v16, "sourceList":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/data/usage/AggregateSession;>;"
    new-instance v9, Ljava/util/HashMap;

    invoke-direct {v9}, Ljava/util/HashMap;-><init>()V

    .line 458
    .local v9, "collapsedRecords":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/getjar/sdk/data/usage/AggregateUsageRecord;>;"
    invoke-interface/range {v16 .. v16}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v11

    .local v11, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lcom/getjar/sdk/data/usage/AggregateSession;

    .line 459
    .local v15, "session":Lcom/getjar/sdk/data/usage/AggregateSession;
    invoke-virtual {v15}, Lcom/getjar/sdk/data/usage/AggregateSession;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v9, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 460
    invoke-virtual {v15}, Lcom/getjar/sdk/data/usage/AggregateSession;->getPackageName()Ljava/lang/String;

    move-result-object v17

    new-instance v1, Lcom/getjar/sdk/data/usage/AggregateUsageRecord;

    invoke-virtual {v15}, Lcom/getjar/sdk/data/usage/AggregateSession;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v15}, Lcom/getjar/sdk/data/usage/AggregateSession;->getTimestampStart()J

    move-result-wide v3

    invoke-virtual {v15}, Lcom/getjar/sdk/data/usage/AggregateSession;->getTimestampStop()J

    move-result-wide v5

    invoke-virtual {v15}, Lcom/getjar/sdk/data/usage/AggregateSession;->getTotalUseDuration()I

    move-result v7

    invoke-virtual {v15}, Lcom/getjar/sdk/data/usage/AggregateSession;->getTotalSessionsCount()I

    move-result v8

    invoke-direct/range {v1 .. v8}, Lcom/getjar/sdk/data/usage/AggregateUsageRecord;-><init>(Ljava/lang/String;JJII)V

    move-object/from16 v0, v17

    invoke-interface {v9, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 469
    :cond_0
    invoke-virtual {v15}, Lcom/getjar/sdk/data/usage/AggregateSession;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v9, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/getjar/sdk/data/usage/AggregateUsageRecord;

    .line 470
    .local v12, "record":Lcom/getjar/sdk/data/usage/AggregateUsageRecord;
    invoke-virtual {v12}, Lcom/getjar/sdk/data/usage/AggregateUsageRecord;->getTimestampStart()J

    move-result-wide v1

    invoke-virtual {v15}, Lcom/getjar/sdk/data/usage/AggregateSession;->getTimestampStart()J

    move-result-wide v3

    invoke-static {v1, v2, v3, v4}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v1

    invoke-virtual {v12, v1, v2}, Lcom/getjar/sdk/data/usage/AggregateUsageRecord;->setTimestampStart(J)V

    .line 471
    invoke-virtual {v12}, Lcom/getjar/sdk/data/usage/AggregateUsageRecord;->getTimestampStop()J

    move-result-wide v1

    invoke-virtual {v15}, Lcom/getjar/sdk/data/usage/AggregateSession;->getTimestampStop()J

    move-result-wide v3

    invoke-static {v1, v2, v3, v4}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v1

    invoke-virtual {v12, v1, v2}, Lcom/getjar/sdk/data/usage/AggregateUsageRecord;->setTimestampStop(J)V

    .line 472
    invoke-virtual {v12}, Lcom/getjar/sdk/data/usage/AggregateUsageRecord;->getTotalUseDuration()I

    move-result v1

    invoke-virtual {v15}, Lcom/getjar/sdk/data/usage/AggregateSession;->getTotalUseDuration()I

    move-result v2

    add-int/2addr v1, v2

    invoke-virtual {v12, v1}, Lcom/getjar/sdk/data/usage/AggregateUsageRecord;->setTotalUseDuration(I)V

    .line 473
    invoke-virtual {v12}, Lcom/getjar/sdk/data/usage/AggregateUsageRecord;->getTotalSessionsCount()I

    move-result v1

    invoke-virtual {v15}, Lcom/getjar/sdk/data/usage/AggregateSession;->getTotalSessionsCount()I

    move-result v2

    add-int/2addr v1, v2

    invoke-virtual {v12, v1}, Lcom/getjar/sdk/data/usage/AggregateUsageRecord;->setTotalSessionsCount(I)V

    goto :goto_0

    .line 477
    .end local v12    # "record":Lcom/getjar/sdk/data/usage/AggregateUsageRecord;
    .end local v15    # "session":Lcom/getjar/sdk/data/usage/AggregateSession;
    :cond_1
    invoke-direct/range {p0 .. p0}, Lcom/getjar/sdk/data/usage/UsageManager;->getRequestSort()Ljava/lang/String;

    move-result-object v13

    .line 480
    .local v13, "requestSort":Ljava/lang/String;
    const/4 v10, 0x0

    .line 481
    .local v10, "comparatorToUse":Ljava/util/Comparator;, "Ljava/util/Comparator<Lcom/getjar/sdk/data/usage/AggregateUsageRecord;>;"
    const-string v1, "android.package.name"

    invoke-virtual {v1, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 482
    sget-object v10, Lcom/getjar/sdk/data/usage/UsageManager;->ComparatorPackageName:Ljava/util/Comparator;

    .line 495
    :goto_1
    new-instance v14, Ljava/util/ArrayList;

    invoke-interface {v9}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-direct {v14, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 496
    .local v14, "resultList":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/data/usage/AggregateUsageRecord;>;"
    invoke-static {v14, v10}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 498
    return-object v14

    .line 483
    .end local v14    # "resultList":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/data/usage/AggregateUsageRecord;>;"
    :cond_2
    const-string v1, "start_timestamp"

    invoke-virtual {v1, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 484
    sget-object v10, Lcom/getjar/sdk/data/usage/UsageManager;->ComparatorTimestampStart:Ljava/util/Comparator;

    goto :goto_1

    .line 485
    :cond_3
    const-string v1, "stop_timestamp"

    invoke-virtual {v1, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 486
    sget-object v10, Lcom/getjar/sdk/data/usage/UsageManager;->ComparatorTimestampStop:Ljava/util/Comparator;

    goto :goto_1

    .line 487
    :cond_4
    const-string v1, "duration"

    invoke-virtual {v1, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 488
    sget-object v10, Lcom/getjar/sdk/data/usage/UsageManager;->ComparatorTotalUseDuration:Ljava/util/Comparator;

    goto :goto_1

    .line 489
    :cond_5
    const-string v1, "sessions"

    invoke-virtual {v1, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 490
    sget-object v10, Lcom/getjar/sdk/data/usage/UsageManager;->ComparatorTotalSessionsCount:Ljava/util/Comparator;

    goto :goto_1

    .line 492
    :cond_6
    sget-object v1, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "UsageManager: Unrecognized sort column \'%1$s\'"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object v13, v5, v6

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;)V

    .line 493
    sget-object v10, Lcom/getjar/sdk/data/usage/UsageManager;->ComparatorTotalUseDuration:Ljava/util/Comparator;

    goto :goto_1
.end method

.method private getFilterRegex()Ljava/lang/String;
    .locals 6

    .prologue
    .line 130
    iget-object v1, p0, Lcom/getjar/sdk/data/usage/UsageManager;->_context:Landroid/content/Context;

    invoke-static {v1}, Lcom/getjar/sdk/comm/GetJarConfig;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/comm/GetJarConfig;

    move-result-object v1

    const-string v2, "usage.package_filter.regex"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Lcom/getjar/sdk/comm/GetJarConfig;->getDirectiveValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 131
    .local v0, "value":Ljava/lang/String;
    sget-object v1, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->CONFIG:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "UsageManager getFilterRegex: %1$s"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v0, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 132
    return-object v0
.end method

.method public static declared-synchronized getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/usage/UsageManager;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 53
    const-class v1, Lcom/getjar/sdk/data/usage/UsageManager;

    monitor-enter v1

    if-nez p0, :cond_0

    :try_start_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v2, "\'context\' cannot be NULL"

    invoke-direct {v0, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0

    .line 54
    :cond_0
    :try_start_1
    sget-object v0, Lcom/getjar/sdk/data/usage/UsageManager;->_Instance:Lcom/getjar/sdk/data/usage/UsageManager;

    if-nez v0, :cond_1

    .line 55
    new-instance v0, Lcom/getjar/sdk/data/usage/UsageManager;

    invoke-direct {v0, p0}, Lcom/getjar/sdk/data/usage/UsageManager;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/getjar/sdk/data/usage/UsageManager;->_Instance:Lcom/getjar/sdk/data/usage/UsageManager;

    .line 57
    :cond_1
    sget-object v0, Lcom/getjar/sdk/data/usage/UsageManager;->_Instance:Lcom/getjar/sdk/data/usage/UsageManager;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit v1

    return-object v0
.end method

.method private getPackagePattern()Ljava/util/regex/Pattern;
    .locals 9

    .prologue
    .line 103
    invoke-direct {p0}, Lcom/getjar/sdk/data/usage/UsageManager;->getFilterRegex()Ljava/lang/String;

    move-result-object v1

    .line 104
    .local v1, "newRegEx":Ljava/lang/String;
    invoke-static {v1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 105
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/getjar/sdk/data/usage/UsageManager;->_regExPatternCache:Ljava/util/regex/Pattern;

    .line 114
    :cond_0
    :goto_0
    iput-object v1, p0, Lcom/getjar/sdk/data/usage/UsageManager;->_regExCache:Ljava/lang/String;

    .line 115
    iget-object v2, p0, Lcom/getjar/sdk/data/usage/UsageManager;->_regExPatternCache:Ljava/util/regex/Pattern;

    return-object v2

    .line 106
    :cond_1
    iget-object v2, p0, Lcom/getjar/sdk/data/usage/UsageManager;->_regExCache:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 108
    :try_start_0
    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v2

    iput-object v2, p0, Lcom/getjar/sdk/data/usage/UsageManager;->_regExPatternCache:Ljava/util/regex/Pattern;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 109
    :catch_0
    move-exception v0

    .line 110
    .local v0, "e":Ljava/lang/Exception;
    sget-object v2, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Lcom/getjar/sdk/logging/Area;->CONFIG:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "UsageManager: getPackagePattern() Bad regex pattern [%1$s]"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-direct {p0}, Lcom/getjar/sdk/data/usage/UsageManager;->getFilterRegex()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;)V

    goto :goto_0
.end method

.method private getRequestMaxCount()I
    .locals 7

    .prologue
    const/16 v4, 0xa

    .line 186
    iget-object v1, p0, Lcom/getjar/sdk/data/usage/UsageManager;->_context:Landroid/content/Context;

    invoke-static {v1}, Lcom/getjar/sdk/comm/GetJarConfig;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/comm/GetJarConfig;

    move-result-object v1

    const-string v2, "usage.request.send.max_count"

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/getjar/sdk/comm/GetJarConfig;->getIntegerValue(Ljava/lang/String;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v0

    .line 187
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_0

    .line 188
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 190
    :cond_0
    sget-object v1, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->CONFIG:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "UsageManager getRequestMaxCount: %1$s"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-virtual {v0}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 191
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    return v1
.end method

.method private getRequestSendEnabled()Z
    .locals 7

    .prologue
    const/4 v6, 0x0

    .line 88
    iget-object v1, p0, Lcom/getjar/sdk/data/usage/UsageManager;->_context:Landroid/content/Context;

    invoke-static {v1}, Lcom/getjar/sdk/comm/GetJarConfig;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/comm/GetJarConfig;

    move-result-object v1

    const-string v2, "usage.request.send.enabled"

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/getjar/sdk/comm/GetJarConfig;->getBooleanValue(Ljava/lang/String;Ljava/lang/Boolean;)Ljava/lang/Boolean;

    move-result-object v0

    .line 89
    .local v0, "value":Ljava/lang/Boolean;
    if-nez v0, :cond_0

    .line 90
    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    .line 92
    :cond_0
    sget-object v1, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->CONFIG:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "UsageManager getRequestSendEnabled: %1$s"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Boolean;->toString()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 93
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    return v1
.end method

.method private getRequestSort()Ljava/lang/String;
    .locals 6

    .prologue
    .line 196
    iget-object v1, p0, Lcom/getjar/sdk/data/usage/UsageManager;->_context:Landroid/content/Context;

    invoke-static {v1}, Lcom/getjar/sdk/comm/GetJarConfig;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/comm/GetJarConfig;

    move-result-object v1

    const-string v2, "usage.request.send.sort"

    const-string v3, "duration"

    invoke-virtual {v1, v2, v3}, Lcom/getjar/sdk/comm/GetJarConfig;->getDirectiveValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 197
    .local v0, "value":Ljava/lang/String;
    sget-object v1, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->CONFIG:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "UsageManager getRequestSort: %1$s"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v0, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 198
    return-object v0
.end method

.method private isFilterSystemEnabled()Z
    .locals 7

    .prologue
    const/4 v5, 0x1

    .line 144
    iget-object v1, p0, Lcom/getjar/sdk/data/usage/UsageManager;->_context:Landroid/content/Context;

    invoke-static {v1}, Lcom/getjar/sdk/comm/GetJarConfig;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/comm/GetJarConfig;

    move-result-object v1

    const-string v2, "usage.package_filter.system"

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/getjar/sdk/comm/GetJarConfig;->getBooleanValue(Ljava/lang/String;Ljava/lang/Boolean;)Ljava/lang/Boolean;

    move-result-object v0

    .line 145
    .local v0, "value":Ljava/lang/Boolean;
    if-nez v0, :cond_0

    .line 146
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    .line 148
    :cond_0
    sget-object v1, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->CONFIG:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "UsageManager isFilterSystemEnabled: %1$s"

    new-array v4, v5, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-virtual {v0}, Ljava/lang/Boolean;->toString()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 149
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    return v1
.end method


# virtual methods
.method protected closeAllOpenAppSessions(Lcom/getjar/sdk/data/usage/SessionEvent$Reason;Ljava/lang/String;J)V
    .locals 12
    .param p1, "reason"    # Lcom/getjar/sdk/data/usage/SessionEvent$Reason;
    .param p2, "reasonDetails"    # Ljava/lang/String;
    .param p3, "eventTime"    # J

    .prologue
    .line 418
    iget-object v0, p0, Lcom/getjar/sdk/data/usage/UsageManager;->_context:Landroid/content/Context;

    invoke-static {v0}, Lcom/getjar/sdk/data/usage/UsageDatabase;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/usage/UsageDatabase;

    move-result-object v10

    .line 419
    .local v10, "usageDB":Lcom/getjar/sdk/data/usage/UsageDatabase;
    invoke-virtual {v10}, Lcom/getjar/sdk/data/usage/UsageDatabase;->appSessionLoadOpenStarts()Ljava/util/List;

    move-result-object v9

    .line 420
    .local v9, "openSessions":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;>;"
    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_1

    .line 421
    sget-object v0, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "UsageManager: stopPhoneSession() Closing %1$d open app session(s)"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v11

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v4, v5

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 423
    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .local v8, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;

    .line 427
    .local v6, "appEvent":Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;
    :try_start_0
    iget-object v0, p0, Lcom/getjar/sdk/data/usage/UsageManager;->_context:Landroid/content/Context;

    invoke-static {v0}, Lcom/getjar/sdk/data/usage/UsageRollupDatabase;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/usage/UsageRollupDatabase;

    move-result-object v0

    sget-object v1, Lcom/getjar/sdk/data/usage/SessionEvent$Type;->stop:Lcom/getjar/sdk/data/usage/SessionEvent$Type;

    invoke-virtual {v6}, Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v6}, Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;->getTimestamp()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    move-wide v2, p3

    invoke-virtual/range {v0 .. v5}, Lcom/getjar/sdk/data/usage/UsageRollupDatabase;->collectAppSessionEvent(Lcom/getjar/sdk/data/usage/SessionEvent$Type;JLjava/lang/String;Ljava/lang/Long;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_1
    move-object v0, v10

    move-object v1, v6

    move-object v2, p1

    move-object v3, p2

    move-wide v4, p3

    .line 442
    invoke-virtual/range {v0 .. v5}, Lcom/getjar/sdk/data/usage/UsageDatabase;->appSessionStop(Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;Lcom/getjar/sdk/data/usage/SessionEvent$Reason;Ljava/lang/String;J)J

    goto :goto_0

    .line 432
    :catch_0
    move-exception v7

    .line 433
    .local v7, "e":Ljava/lang/Exception;
    sget-object v0, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    const-string v2, "UsageManager: closeAllOpenAppSessions() collectAppSessionEvent() failed"

    invoke-static {v0, v1, v2, v7}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 434
    invoke-static {p2}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 435
    invoke-static {v7}, Lcom/getjar/sdk/logging/Logger;->getThrowableDump(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object p2

    goto :goto_1

    .line 437
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " | "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {v7}, Lcom/getjar/sdk/logging/Logger;->getThrowableDump(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    goto :goto_1

    .line 445
    .end local v6    # "appEvent":Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;
    .end local v7    # "e":Ljava/lang/Exception;
    .end local v8    # "i$":Ljava/util/Iterator;
    :cond_1
    return-void
.end method

.method public getAggregateSessionsForReporting()Lcom/getjar/sdk/data/usage/AggregateUsageReport;
    .locals 10

    .prologue
    .line 307
    iget-object v0, p0, Lcom/getjar/sdk/data/usage/UsageManager;->_context:Landroid/content/Context;

    invoke-static {v0}, Lcom/getjar/sdk/data/usage/UsageRollupDatabase;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/usage/UsageRollupDatabase;

    move-result-object v0

    invoke-virtual {v0}, Lcom/getjar/sdk/data/usage/UsageRollupDatabase;->purgeObsoleteAggregationData()V

    .line 310
    invoke-virtual {p0}, Lcom/getjar/sdk/data/usage/UsageManager;->isRequestSendEnabled()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    .line 332
    :goto_0
    return-object v0

    .line 313
    :cond_0
    invoke-direct {p0}, Lcom/getjar/sdk/data/usage/UsageManager;->getCollapsedSortedAggregateSessions()Ljava/util/List;

    move-result-object v8

    .line 315
    .local v8, "sourceList":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/data/usage/AggregateUsageRecord;>;"
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 316
    .local v5, "returnList":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/data/usage/AggregateUsageRecord;>;"
    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .local v6, "i$":Ljava/util/Iterator;
    :cond_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/getjar/sdk/data/usage/AggregateUsageRecord;

    .line 319
    .local v9, "sourceSession":Lcom/getjar/sdk/data/usage/AggregateUsageRecord;
    invoke-virtual {v9}, Lcom/getjar/sdk/data/usage/AggregateUsageRecord;->getPackageName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/getjar/sdk/data/usage/UsageManager;->shouldFilterFromUsage(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 324
    invoke-interface {v5, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 325
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v0

    invoke-direct {p0}, Lcom/getjar/sdk/data/usage/UsageManager;->getRequestMaxCount()I

    move-result v1

    if-lt v0, v1, :cond_1

    .line 330
    .end local v9    # "sourceSession":Lcom/getjar/sdk/data/usage/AggregateUsageRecord;
    :cond_2
    iget-object v0, p0, Lcom/getjar/sdk/data/usage/UsageManager;->_context:Landroid/content/Context;

    invoke-static {v0}, Lcom/getjar/sdk/data/usage/UsageRollupDatabase;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/usage/UsageRollupDatabase;

    move-result-object v0

    invoke-virtual {v0}, Lcom/getjar/sdk/data/usage/UsageRollupDatabase;->getTotalReportingWindow()[J

    move-result-object v7

    .line 332
    .local v7, "minMax":[J
    new-instance v0, Lcom/getjar/sdk/data/usage/AggregateUsageReport;

    const/4 v1, 0x0

    aget-wide v1, v7, v1

    const/4 v3, 0x1

    aget-wide v3, v7, v3

    invoke-direct/range {v0 .. v5}, Lcom/getjar/sdk/data/usage/AggregateUsageReport;-><init>(JJLjava/util/List;)V

    goto :goto_0
.end method

.method public getBackgroundBatchCount()I
    .locals 7

    .prologue
    const/16 v4, 0x32

    .line 120
    iget-object v1, p0, Lcom/getjar/sdk/data/usage/UsageManager;->_context:Landroid/content/Context;

    invoke-static {v1}, Lcom/getjar/sdk/comm/GetJarConfig;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/comm/GetJarConfig;

    move-result-object v1

    const-string v2, "usage.background.send.batch_count"

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/getjar/sdk/comm/GetJarConfig;->getIntegerValue(Ljava/lang/String;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v0

    .line 121
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_0

    .line 122
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 124
    :cond_0
    sget-object v1, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->CONFIG:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "UsageManager getBackgroundBatchCount: %1$s"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-virtual {v0}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 125
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    return v1
.end method

.method public getBackgroundSendIntervalMilliseconds()I
    .locals 7

    .prologue
    const/16 v4, 0x1c20

    .line 154
    iget-object v1, p0, Lcom/getjar/sdk/data/usage/UsageManager;->_context:Landroid/content/Context;

    invoke-static {v1}, Lcom/getjar/sdk/comm/GetJarConfig;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/comm/GetJarConfig;

    move-result-object v1

    const-string v2, "usage.background.send.interval"

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/getjar/sdk/comm/GetJarConfig;->getIntegerValue(Ljava/lang/String;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v0

    .line 155
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_0

    .line 156
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 158
    :cond_0
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    mul-int/lit16 v1, v1, 0x3e8

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 159
    sget-object v1, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->CONFIG:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "UsageManager getBackgroundSendIntervalMilliseconds: %1$s"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-virtual {v0}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 160
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    return v1
.end method

.method public getRequestTimeWindowCount()I
    .locals 7

    .prologue
    const/4 v4, 0x7

    .line 176
    iget-object v1, p0, Lcom/getjar/sdk/data/usage/UsageManager;->_context:Landroid/content/Context;

    invoke-static {v1}, Lcom/getjar/sdk/comm/GetJarConfig;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/comm/GetJarConfig;

    move-result-object v1

    const-string v2, "usage.request.time_window_count"

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/getjar/sdk/comm/GetJarConfig;->getIntegerValue(Ljava/lang/String;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v0

    .line 177
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_0

    .line 178
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 180
    :cond_0
    sget-object v1, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->CONFIG:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "UsageManager getRequestTimeWindowCount: %1$s"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-virtual {v0}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 181
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    return v1
.end method

.method public getRequestTimeWindowMilliseconds()I
    .locals 7

    .prologue
    const v4, 0x15180

    .line 165
    iget-object v1, p0, Lcom/getjar/sdk/data/usage/UsageManager;->_context:Landroid/content/Context;

    invoke-static {v1}, Lcom/getjar/sdk/comm/GetJarConfig;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/comm/GetJarConfig;

    move-result-object v1

    const-string v2, "usage.request.time_window"

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/getjar/sdk/comm/GetJarConfig;->getIntegerValue(Ljava/lang/String;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v0

    .line 166
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_0

    .line 167
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 169
    :cond_0
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    mul-int/lit16 v1, v1, 0x3e8

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 170
    sget-object v1, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->CONFIG:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "UsageManager getRequestTimeWindowMilliseconds: %1$s"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-virtual {v0}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 171
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    return v1
.end method

.method public isBackgroundSendEnabled()Z
    .locals 1

    .prologue
    .line 71
    invoke-direct {p0}, Lcom/getjar/sdk/data/usage/UsageManager;->getBackgroundSendEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/getjar/sdk/data/usage/UsageManager;->isMonitoringEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isMonitoringEnabled()Z
    .locals 7

    .prologue
    const/4 v5, 0x1

    .line 62
    iget-object v1, p0, Lcom/getjar/sdk/data/usage/UsageManager;->_context:Landroid/content/Context;

    invoke-static {v1}, Lcom/getjar/sdk/comm/GetJarConfig;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/comm/GetJarConfig;

    move-result-object v1

    const-string v2, "usage.monitoring.enabled"

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/getjar/sdk/comm/GetJarConfig;->getBooleanValue(Ljava/lang/String;Ljava/lang/Boolean;)Ljava/lang/Boolean;

    move-result-object v0

    .line 63
    .local v0, "value":Ljava/lang/Boolean;
    if-nez v0, :cond_0

    .line 64
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    .line 66
    :cond_0
    sget-object v1, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->CONFIG:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "UsageManager isMonitoringEnabled: %1$s"

    new-array v4, v5, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-virtual {v0}, Ljava/lang/Boolean;->toString()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 67
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    return v1
.end method

.method public isRequestSendEnabled()Z
    .locals 1

    .prologue
    .line 74
    invoke-direct {p0}, Lcom/getjar/sdk/data/usage/UsageManager;->getRequestSendEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/getjar/sdk/data/usage/UsageManager;->isMonitoringEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public shouldFilterFromUsage(Ljava/lang/String;)Z
    .locals 12
    .param p1, "packageName"    # Ljava/lang/String;

    .prologue
    const-wide/16 v8, 0x1

    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 341
    invoke-direct {p0}, Lcom/getjar/sdk/data/usage/UsageManager;->getPackagePattern()Ljava/util/regex/Pattern;

    move-result-object v3

    .line 343
    .local v3, "filterPattern":Ljava/util/regex/Pattern;
    if-eqz v3, :cond_1

    invoke-virtual {v3, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/regex/Matcher;->matches()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 360
    :cond_0
    :goto_0
    return v4

    .line 348
    :cond_1
    invoke-direct {p0}, Lcom/getjar/sdk/data/usage/UsageManager;->isFilterSystemEnabled()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 350
    :try_start_0
    iget-object v6, p0, Lcom/getjar/sdk/data/usage/UsageManager;->_context:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v6

    const/16 v7, 0x80

    invoke-virtual {v6, p1, v7}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v6

    iget-object v6, v6, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget v6, v6, Landroid/content/pm/ApplicationInfo;->flags:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    int-to-long v0, v6

    .line 351
    .local v0, "appFlags":J
    and-long v6, v0, v8

    cmp-long v6, v6, v8

    if-eqz v6, :cond_0

    .end local v0    # "appFlags":J
    :cond_2
    :goto_1
    move v4, v5

    .line 360
    goto :goto_0

    .line 354
    :catch_0
    move-exception v2

    .line 355
    .local v2, "e":Ljava/lang/Exception;
    sget-object v6, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    sget-object v8, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v9, "UsageManager: Failed to get app flags [packageName:\'%1$s\' error:\'%2$s\']"

    const/4 v10, 0x2

    new-array v10, v10, [Ljava/lang/Object;

    aput-object p1, v10, v5

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v11

    aput-object v11, v10, v4

    invoke-static {v8, v9, v10}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v6, v7, v4}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;)V

    goto :goto_1
.end method

.method public shouldFilterTypeFromUsage(Lcom/getjar/sdk/data/ReportUsageData$UsageType;)Z
    .locals 19
    .param p1, "usageType"    # Lcom/getjar/sdk/data/ReportUsageData$UsageType;

    .prologue
    .line 369
    if-nez p1, :cond_0

    new-instance v12, Ljava/lang/IllegalArgumentException;

    const-string v13, "\'usageType\' cannot be null"

    invoke-direct {v12, v13}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v12

    .line 371
    :cond_0
    sget-object v13, Lcom/getjar/sdk/data/usage/UsageManager;->typeFilterLock:Ljava/lang/Object;

    monitor-enter v13

    .line 373
    :try_start_0
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/getjar/sdk/data/usage/UsageManager;->_typeFilterCache:Ljava/lang/String;

    .line 375
    .local v9, "typeFilterCache":Ljava/lang/String;
    invoke-direct/range {p0 .. p0}, Lcom/getjar/sdk/data/usage/UsageManager;->getBackgroundTypeFilter()Ljava/lang/String;

    move-result-object v8

    .line 378
    .local v8, "typeFilter":Ljava/lang/String;
    if-eqz v9, :cond_1

    invoke-virtual {v9, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_4

    .line 380
    :cond_1
    new-instance v10, Ljava/util/HashSet;

    invoke-direct {v10}, Ljava/util/HashSet;-><init>()V

    .line 382
    .local v10, "typeFilterSetCache":Ljava/util/HashSet;, "Ljava/util/HashSet<Lcom/getjar/sdk/data/ReportUsageData$UsageType;>;"
    if-eqz v8, :cond_3

    .line 383
    invoke-virtual {v8}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v12

    const-string v14, "\\|"

    invoke-virtual {v12, v14}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v11

    .line 384
    .local v11, "types":[Ljava/lang/String;
    move-object v1, v11

    .local v1, "arr$":[Ljava/lang/String;
    array-length v4, v1

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_0
    if-ge v3, v4, :cond_3

    aget-object v7, v1, v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 385
    .local v7, "type":Ljava/lang/String;
    if-eqz v7, :cond_2

    .line 387
    :try_start_1
    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Lcom/getjar/sdk/data/ReportUsageData$UsageType;->valueOf(Ljava/lang/String;)Lcom/getjar/sdk/data/ReportUsageData$UsageType;

    move-result-object v6

    .line 388
    .local v6, "tempUsageType":Lcom/getjar/sdk/data/ReportUsageData$UsageType;
    invoke-virtual {v10, v6}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 384
    .end local v6    # "tempUsageType":Lcom/getjar/sdk/data/ReportUsageData$UsageType;
    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 390
    :catch_0
    move-exception v2

    .line 392
    .local v2, "e":Ljava/lang/IllegalArgumentException;
    :try_start_2
    sget-object v12, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v12}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v14

    const-string v12, "Illegal value [%s] for usage type filter"

    const/16 v16, 0x1

    move/from16 v0, v16

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    aput-object v7, v16, v17

    move-object/from16 v0, v16

    invoke-static {v12, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    invoke-static {v14, v15, v12, v2}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 393
    invoke-static {}, Lcom/getjar/sdk/data/ReportUsageData$UsageType;->values()[Lcom/getjar/sdk/data/ReportUsageData$UsageType;

    move-result-object v12

    invoke-static {v12}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v12

    invoke-virtual {v10, v12}, Ljava/util/HashSet;->addAll(Ljava/util/Collection;)Z

    .line 399
    .end local v1    # "arr$":[Ljava/lang/String;
    .end local v2    # "e":Ljava/lang/IllegalArgumentException;
    .end local v3    # "i$":I
    .end local v4    # "len$":I
    .end local v7    # "type":Ljava/lang/String;
    .end local v11    # "types":[Ljava/lang/String;
    :cond_3
    move-object/from16 v0, p0

    iput-object v10, v0, Lcom/getjar/sdk/data/usage/UsageManager;->_typeFilterSetCache:Ljava/util/HashSet;

    .line 400
    move-object/from16 v0, p0

    iput-object v8, v0, Lcom/getjar/sdk/data/usage/UsageManager;->_typeFilterCache:Ljava/lang/String;

    .line 402
    .end local v10    # "typeFilterSetCache":Ljava/util/HashSet;, "Ljava/util/HashSet<Lcom/getjar/sdk/data/ReportUsageData$UsageType;>;"
    :cond_4
    monitor-exit v13
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 404
    const/4 v5, 0x0

    .line 406
    .local v5, "result":Z
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/getjar/sdk/data/usage/UsageManager;->_typeFilterSetCache:Ljava/util/HashSet;

    move-object/from16 v0, p1

    invoke-virtual {v12, v0}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_5

    .line 407
    const/4 v5, 0x1

    .line 410
    :cond_5
    sget-object v12, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v12}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v12

    sget-object v14, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v15, "UsageManager shouldFilterTypeFromUsage returning %s for %s"

    const/16 v16, 0x2

    move/from16 v0, v16

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    invoke-static {v5}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v18

    aput-object v18, v16, v17

    const/16 v17, 0x1

    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/data/ReportUsageData$UsageType;->name()Ljava/lang/String;

    move-result-object v18

    aput-object v18, v16, v17

    invoke-static/range {v14 .. v16}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    invoke-static {v12, v13, v14}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 411
    return v5

    .line 402
    .end local v5    # "result":Z
    .end local v8    # "typeFilter":Ljava/lang/String;
    .end local v9    # "typeFilterCache":Ljava/lang/String;
    :catchall_0
    move-exception v12

    :try_start_3
    monitor-exit v13
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v12
.end method

.method public startAppSession(Ljava/lang/String;Lcom/getjar/sdk/data/usage/SessionEvent$Reason;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)J
    .locals 14
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "reason"    # Lcom/getjar/sdk/data/usage/SessionEvent$Reason;
    .param p3, "reasonDetails"    # Ljava/lang/String;
    .param p4, "phoneSessionId"    # Ljava/lang/String;
    .param p5, "appSessionId"    # Ljava/lang/String;

    .prologue
    .line 206
    invoke-virtual {p0}, Lcom/getjar/sdk/data/usage/UsageManager;->isMonitoringEnabled()Z

    move-result v1

    if-nez v1, :cond_0

    const-wide/16 v1, -0x1

    .line 227
    :goto_0
    return-wide v1

    .line 208
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    .line 212
    .local v3, "eventTimestamp":J
    :try_start_0
    iget-object v1, p0, Lcom/getjar/sdk/data/usage/UsageManager;->_context:Landroid/content/Context;

    invoke-static {v1}, Lcom/getjar/sdk/data/usage/UsageRollupDatabase;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/usage/UsageRollupDatabase;

    move-result-object v1

    sget-object v2, Lcom/getjar/sdk/data/usage/SessionEvent$Type;->start:Lcom/getjar/sdk/data/usage/SessionEvent$Type;

    const/4 v6, 0x0

    move-object v5, p1

    invoke-virtual/range {v1 .. v6}, Lcom/getjar/sdk/data/usage/UsageRollupDatabase;->collectAppSessionEvent(Lcom/getjar/sdk/data/usage/SessionEvent$Type;JLjava/lang/String;Ljava/lang/Long;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 227
    :goto_1
    iget-object v1, p0, Lcom/getjar/sdk/data/usage/UsageManager;->_context:Landroid/content/Context;

    invoke-static {v1}, Lcom/getjar/sdk/data/usage/UsageDatabase;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/usage/UsageDatabase;

    move-result-object v5

    move-object v6, p1

    move-object/from16 v7, p2

    move-object/from16 v8, p3

    move-wide v9, v3

    move-object/from16 v11, p4

    move-object/from16 v12, p5

    invoke-virtual/range {v5 .. v12}, Lcom/getjar/sdk/data/usage/UsageDatabase;->appSessionStart(Ljava/lang/String;Lcom/getjar/sdk/data/usage/SessionEvent$Reason;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;)J

    move-result-wide v1

    goto :goto_0

    .line 217
    :catch_0
    move-exception v13

    .line 218
    .local v13, "e":Ljava/lang/Exception;
    sget-object v1, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    const-string v5, "UsageManager: startAppSession() collectAppSessionEvent() failed"

    invoke-static {v1, v2, v5, v13}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 219
    invoke-static/range {p3 .. p3}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 220
    invoke-static {v13}, Lcom/getjar/sdk/logging/Logger;->getThrowableDump(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object p3

    goto :goto_1

    .line 222
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p3

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " | "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {v13}, Lcom/getjar/sdk/logging/Logger;->getThrowableDump(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    goto :goto_1
.end method

.method public startPhoneSession()V
    .locals 1

    .prologue
    .line 276
    iget-object v0, p0, Lcom/getjar/sdk/data/usage/UsageManager;->_context:Landroid/content/Context;

    invoke-static {v0}, Lcom/getjar/sdk/data/usage/UsageMonitor;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/usage/UsageMonitor;

    move-result-object v0

    invoke-virtual {v0}, Lcom/getjar/sdk/data/usage/UsageMonitor;->startMonitoring()V

    .line 277
    return-void
.end method

.method public stopAppSession(Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;Lcom/getjar/sdk/data/usage/SessionEvent$Reason;Ljava/lang/String;)J
    .locals 14
    .param p1, "startEvent"    # Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;
    .param p2, "reason"    # Lcom/getjar/sdk/data/usage/SessionEvent$Reason;
    .param p3, "reasonDetails"    # Ljava/lang/String;

    .prologue
    .line 241
    invoke-virtual {p0}, Lcom/getjar/sdk/data/usage/UsageManager;->isMonitoringEnabled()Z

    move-result v1

    if-nez v1, :cond_0

    const-wide/16 v1, -0x1

    .line 262
    :goto_0
    return-wide v1

    .line 243
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    .line 247
    .local v3, "eventTimestamp":J
    :try_start_0
    iget-object v1, p0, Lcom/getjar/sdk/data/usage/UsageManager;->_context:Landroid/content/Context;

    invoke-static {v1}, Lcom/getjar/sdk/data/usage/UsageRollupDatabase;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/usage/UsageRollupDatabase;

    move-result-object v1

    sget-object v2, Lcom/getjar/sdk/data/usage/SessionEvent$Type;->stop:Lcom/getjar/sdk/data/usage/SessionEvent$Type;

    invoke-virtual {p1}, Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;->getPackageName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1}, Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;->getTimestamp()J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-virtual/range {v1 .. v6}, Lcom/getjar/sdk/data/usage/UsageRollupDatabase;->collectAppSessionEvent(Lcom/getjar/sdk/data/usage/SessionEvent$Type;JLjava/lang/String;Ljava/lang/Long;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 262
    :goto_1
    iget-object v1, p0, Lcom/getjar/sdk/data/usage/UsageManager;->_context:Landroid/content/Context;

    invoke-static {v1}, Lcom/getjar/sdk/data/usage/UsageDatabase;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/usage/UsageDatabase;

    move-result-object v5

    invoke-virtual {p1}, Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;->getPackageName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p1}, Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;->getPhoneSessionId()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {p1}, Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;->getSessionId()Ljava/lang/String;

    move-result-object v12

    move-object/from16 v7, p2

    move-object/from16 v8, p3

    move-wide v9, v3

    invoke-virtual/range {v5 .. v12}, Lcom/getjar/sdk/data/usage/UsageDatabase;->appSessionStop(Ljava/lang/String;Lcom/getjar/sdk/data/usage/SessionEvent$Reason;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;)J

    move-result-wide v1

    goto :goto_0

    .line 252
    :catch_0
    move-exception v13

    .line 253
    .local v13, "e":Ljava/lang/Exception;
    sget-object v1, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    const-string v5, "UsageManager: stopAppSession() collectAppSessionEvent() failed"

    invoke-static {v1, v2, v5, v13}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 254
    invoke-static/range {p3 .. p3}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 255
    invoke-static {v13}, Lcom/getjar/sdk/logging/Logger;->getThrowableDump(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object p3

    goto :goto_1

    .line 257
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p3

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " | "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {v13}, Lcom/getjar/sdk/logging/Logger;->getThrowableDump(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    goto :goto_1
.end method

.method public stopPhoneSession()V
    .locals 1

    .prologue
    .line 284
    iget-object v0, p0, Lcom/getjar/sdk/data/usage/UsageManager;->_context:Landroid/content/Context;

    invoke-static {v0}, Lcom/getjar/sdk/data/usage/UsageMonitor;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/usage/UsageMonitor;

    move-result-object v0

    invoke-virtual {v0}, Lcom/getjar/sdk/data/usage/UsageMonitor;->stopMonitoring()V

    .line 285
    return-void
.end method
