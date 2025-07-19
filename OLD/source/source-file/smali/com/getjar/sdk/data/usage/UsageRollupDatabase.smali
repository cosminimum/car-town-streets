.class public Lcom/getjar/sdk/data/usage/UsageRollupDatabase;
.super Landroid/database/sqlite/SQLiteOpenHelper;
.source "UsageRollupDatabase.java"


# static fields
.field private static final DATABASE_CREATE_TABLE_ROLLUP:Ljava/lang/String; = "CREATE TABLE IF NOT EXISTS usageRollup (id INTEGER PRIMARY KEY AUTOINCREMENT, window_id INTEGER NOT NULL, package_name TEXT NOT NULL, start_timestamp INTEGER NOT NULL, stop_timestamp INTEGER NOT NULL, duration INTEGER NOT NULL, sessions INTEGER NOT NULL, last_start_timestamp INTEGER NOT NULL DEFAULT 0, last_stop_timestamp INTEGER NOT NULL DEFAULT 0, FOREIGN KEY(window_id) REFERENCES reportingWindow(id), UNIQUE(window_id, package_name) ON CONFLICT ABORT);"

.field private static final DATABASE_CREATE_TABLE_WINDOW:Ljava/lang/String; = "CREATE TABLE IF NOT EXISTS reportingWindow (id INTEGER PRIMARY KEY AUTOINCREMENT, start_timestamp INTEGER NOT NULL UNIQUE, stop_timestamp INTEGER NOT NULL UNIQUE);"

.field private static final DATABASE_NAME:Ljava/lang/String; = "GetJarDBUsageRollup"

.field private static final DATABASE_TABLE_ROLLUP:Ljava/lang/String; = "usageRollup"

.field private static final DATABASE_TABLE_WINDOW:Ljava/lang/String; = "reportingWindow"

.field private static final DATABASE_VERSION:I = 0x1

.field private static final DB_CREATE_TABLE_COMMANDS:[Ljava/lang/String;

.field private static final DB_TABLE_NAMES:[Ljava/lang/String;

.field private static volatile _Instance:Lcom/getjar/sdk/data/usage/UsageRollupDatabase;


# instance fields
.field private final _context:Landroid/content/Context;

.field private volatile _databaseAccessLock:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 22
    const/4 v0, 0x0

    sput-object v0, Lcom/getjar/sdk/data/usage/UsageRollupDatabase;->_Instance:Lcom/getjar/sdk/data/usage/UsageRollupDatabase;

    .line 44
    new-array v0, v4, [Ljava/lang/String;

    const-string v1, "reportingWindow"

    aput-object v1, v0, v2

    const-string v1, "usageRollup"

    aput-object v1, v0, v3

    sput-object v0, Lcom/getjar/sdk/data/usage/UsageRollupDatabase;->DB_TABLE_NAMES:[Ljava/lang/String;

    .line 69
    new-array v0, v4, [Ljava/lang/String;

    const-string v1, "CREATE TABLE IF NOT EXISTS reportingWindow (id INTEGER PRIMARY KEY AUTOINCREMENT, start_timestamp INTEGER NOT NULL UNIQUE, stop_timestamp INTEGER NOT NULL UNIQUE);"

    aput-object v1, v0, v2

    const-string v1, "CREATE TABLE IF NOT EXISTS usageRollup (id INTEGER PRIMARY KEY AUTOINCREMENT, window_id INTEGER NOT NULL, package_name TEXT NOT NULL, start_timestamp INTEGER NOT NULL, stop_timestamp INTEGER NOT NULL, duration INTEGER NOT NULL, sessions INTEGER NOT NULL, last_start_timestamp INTEGER NOT NULL DEFAULT 0, last_stop_timestamp INTEGER NOT NULL DEFAULT 0, FOREIGN KEY(window_id) REFERENCES reportingWindow(id), UNIQUE(window_id, package_name) ON CONFLICT ABORT);"

    aput-object v1, v0, v3

    sput-object v0, Lcom/getjar/sdk/data/usage/UsageRollupDatabase;->DB_CREATE_TABLE_COMMANDS:[Ljava/lang/String;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x1

    .line 33
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0, v4}, Landroid/database/sqlite/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    .line 71
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/getjar/sdk/data/usage/UsageRollupDatabase;->_databaseAccessLock:Ljava/lang/Object;

    .line 34
    iput-object p1, p0, Lcom/getjar/sdk/data/usage/UsageRollupDatabase;->_context:Landroid/content/Context;

    .line 35
    sget-object v0, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "UsageRollupDatabase: Opened database \'%1$s\'"

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object p2, v4, v5

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    .line 36
    return-void
.end method

.method private deleteAllRecords()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 525
    invoke-virtual {p0}, Lcom/getjar/sdk/data/usage/UsageRollupDatabase;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string v1, "usageRollup"

    invoke-virtual {v0, v1, v2, v2}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 526
    invoke-virtual {p0}, Lcom/getjar/sdk/data/usage/UsageRollupDatabase;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string v1, "reportingWindow"

    invoke-virtual {v0, v1, v2, v2}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 527
    return-void
.end method

.method public static declared-synchronized getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/usage/UsageRollupDatabase;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 25
    const-class v1, Lcom/getjar/sdk/data/usage/UsageRollupDatabase;

    monitor-enter v1

    if-nez p0, :cond_0

    :try_start_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v2, "\'context\' can not be NULL"

    invoke-direct {v0, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0

    .line 26
    :cond_0
    :try_start_1
    sget-object v0, Lcom/getjar/sdk/data/usage/UsageRollupDatabase;->_Instance:Lcom/getjar/sdk/data/usage/UsageRollupDatabase;

    if-nez v0, :cond_1

    new-instance v0, Lcom/getjar/sdk/data/usage/UsageRollupDatabase;

    const-string v2, "GetJarDBUsageRollup"

    invoke-direct {v0, p0, v2}, Lcom/getjar/sdk/data/usage/UsageRollupDatabase;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    sput-object v0, Lcom/getjar/sdk/data/usage/UsageRollupDatabase;->_Instance:Lcom/getjar/sdk/data/usage/UsageRollupDatabase;

    .line 27
    :cond_1
    sget-object v0, Lcom/getjar/sdk/data/usage/UsageRollupDatabase;->_Instance:Lcom/getjar/sdk/data/usage/UsageRollupDatabase;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit v1

    return-object v0
.end method

.method private loadAggregateSession(JLjava/lang/String;)Lcom/getjar/sdk/data/usage/AggregateSession;
    .locals 11
    .param p1, "windowId"    # J
    .param p3, "packageName"    # Ljava/lang/String;

    .prologue
    .line 499
    const/4 v9, 0x0

    .line 500
    .local v9, "result":Lcom/getjar/sdk/data/usage/AggregateSession;
    const/4 v10, 0x0

    .line 502
    .local v10, "results":Landroid/database/Cursor;
    :try_start_0
    invoke-virtual {p0}, Lcom/getjar/sdk/data/usage/UsageRollupDatabase;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string v1, "usageRollup"

    const/4 v2, 0x0

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "window_id = %1$d AND package_name = ?"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    aput-object p3, v4, v5

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v10

    .line 510
    invoke-interface {v10}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 511
    new-instance v9, Lcom/getjar/sdk/data/usage/AggregateSession;

    .end local v9    # "result":Lcom/getjar/sdk/data/usage/AggregateSession;
    invoke-direct {v9, v10}, Lcom/getjar/sdk/data/usage/AggregateSession;-><init>(Landroid/database/Cursor;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 515
    .restart local v9    # "result":Lcom/getjar/sdk/data/usage/AggregateSession;
    :cond_0
    if-eqz v10, :cond_1

    :try_start_1
    invoke-interface {v10}, Landroid/database/Cursor;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    const/4 v10, 0x0

    .line 520
    :cond_1
    :goto_0
    return-object v9

    .line 516
    :catch_0
    move-exception v8

    .line 517
    .local v8, "e":Ljava/lang/Exception;
    sget-object v0, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    const-string v2, "Usage: UsageRollupDatabase: loadAggregateSession() results.close() failed"

    invoke-static {v0, v1, v2, v8}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 514
    .end local v8    # "e":Ljava/lang/Exception;
    .end local v9    # "result":Lcom/getjar/sdk/data/usage/AggregateSession;
    :catchall_0
    move-exception v0

    .line 515
    if-eqz v10, :cond_2

    :try_start_2
    invoke-interface {v10}, Landroid/database/Cursor;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    const/4 v10, 0x0

    .line 518
    :cond_2
    :goto_1
    throw v0

    .line 516
    :catch_1
    move-exception v8

    .line 517
    .restart local v8    # "e":Ljava/lang/Exception;
    sget-object v1, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "Usage: UsageRollupDatabase: loadAggregateSession() results.close() failed"

    invoke-static {v1, v2, v3, v8}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1
.end method

.method private loadAggregateSessions(J)Ljava/util/List;
    .locals 11
    .param p1, "windowId"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)",
            "Ljava/util/List",
            "<",
            "Lcom/getjar/sdk/data/usage/AggregateSession;",
            ">;"
        }
    .end annotation

    .prologue
    .line 431
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 432
    .local v9, "result":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/data/usage/AggregateSession;>;"
    const/4 v10, 0x0

    .line 434
    .local v10, "results":Landroid/database/Cursor;
    :try_start_0
    invoke-virtual {p0}, Lcom/getjar/sdk/data/usage/UsageRollupDatabase;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string v1, "usageRollup"

    const/4 v2, 0x0

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "window_id = %1$d"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v10

    .line 435
    :goto_0
    invoke-interface {v10}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 436
    new-instance v0, Lcom/getjar/sdk/data/usage/AggregateSession;

    invoke-direct {v0, v10}, Lcom/getjar/sdk/data/usage/AggregateSession;-><init>(Landroid/database/Cursor;)V

    invoke-interface {v9, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 439
    :catchall_0
    move-exception v0

    .line 440
    if-eqz v10, :cond_0

    :try_start_1
    invoke-interface {v10}, Landroid/database/Cursor;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    const/4 v10, 0x0

    .line 443
    :cond_0
    :goto_1
    throw v0

    .line 440
    :cond_1
    if-eqz v10, :cond_2

    :try_start_2
    invoke-interface {v10}, Landroid/database/Cursor;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    const/4 v10, 0x0

    .line 445
    :cond_2
    :goto_2
    return-object v9

    .line 441
    :catch_0
    move-exception v8

    .line 442
    .local v8, "e":Ljava/lang/Exception;
    sget-object v0, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    const-string v2, "Usage: UsageRollupDatabase: loadAggregateSessions() results.close() failed"

    invoke-static {v0, v1, v2, v8}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_2

    .line 441
    .end local v8    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v8

    .line 442
    .restart local v8    # "e":Ljava/lang/Exception;
    sget-object v1, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "Usage: UsageRollupDatabase: loadAggregateSessions() results.close() failed"

    invoke-static {v1, v2, v3, v8}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1
.end method

.method private loadReportingWindows()Ljava/util/List;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/getjar/sdk/data/usage/ReportingWindow;",
            ">;"
        }
    .end annotation

    .prologue
    .line 481
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 482
    .local v9, "resultList":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/data/usage/ReportingWindow;>;"
    const/4 v10, 0x0

    .line 484
    .local v10, "results":Landroid/database/Cursor;
    :try_start_0
    invoke-virtual {p0}, Lcom/getjar/sdk/data/usage/UsageRollupDatabase;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string v1, "reportingWindow"

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const-string v7, "stop_timestamp DESC"

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v10

    .line 485
    :goto_0
    invoke-interface {v10}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 486
    new-instance v0, Lcom/getjar/sdk/data/usage/ReportingWindow;

    invoke-direct {v0, v10}, Lcom/getjar/sdk/data/usage/ReportingWindow;-><init>(Landroid/database/Cursor;)V

    invoke-interface {v9, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 489
    :catchall_0
    move-exception v0

    .line 490
    if-eqz v10, :cond_0

    :try_start_1
    invoke-interface {v10}, Landroid/database/Cursor;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    const/4 v10, 0x0

    .line 493
    :cond_0
    :goto_1
    throw v0

    .line 490
    :cond_1
    if-eqz v10, :cond_2

    :try_start_2
    invoke-interface {v10}, Landroid/database/Cursor;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    const/4 v10, 0x0

    .line 495
    :cond_2
    :goto_2
    return-object v9

    .line 491
    :catch_0
    move-exception v8

    .line 492
    .local v8, "e":Ljava/lang/Exception;
    sget-object v0, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    const-string v2, "Usage: UsageRollupDatabase: loadReportingWindows() results.close() failed"

    invoke-static {v0, v1, v2, v8}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_2

    .line 491
    .end local v8    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v8

    .line 492
    .restart local v8    # "e":Ljava/lang/Exception;
    sget-object v1, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "Usage: UsageRollupDatabase: loadReportingWindows() results.close() failed"

    invoke-static {v1, v2, v3, v8}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1
.end method

.method private purgeObsoleteAggregationDataInternal()V
    .locals 15

    .prologue
    const/4 v14, 0x0

    const/4 v13, 0x1

    const/4 v12, 0x0

    .line 452
    iget-object v6, p0, Lcom/getjar/sdk/data/usage/UsageRollupDatabase;->_context:Landroid/content/Context;

    invoke-static {v6}, Lcom/getjar/sdk/data/usage/UsageManager;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/usage/UsageManager;

    move-result-object v6

    invoke-virtual {v6}, Lcom/getjar/sdk/data/usage/UsageManager;->getRequestTimeWindowCount()I

    move-result v3

    .line 453
    .local v3, "windowCount":I
    invoke-direct {p0}, Lcom/getjar/sdk/data/usage/UsageRollupDatabase;->loadReportingWindows()Ljava/util/List;

    move-result-object v2

    .line 454
    .local v2, "reportingWindows":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/data/usage/ReportingWindow;>;"
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v6

    if-le v6, v3, :cond_0

    .line 457
    move v1, v3

    .local v1, "i":I
    :goto_0
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v6

    if-ge v1, v6, :cond_0

    .line 458
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/getjar/sdk/data/usage/ReportingWindow;

    invoke-virtual {v6}, Lcom/getjar/sdk/data/usage/ReportingWindow;->getId()J

    move-result-wide v4

    .line 461
    .local v4, "windowIdToKill":J
    invoke-virtual {p0}, Lcom/getjar/sdk/data/usage/UsageRollupDatabase;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v6

    const-string v7, "usageRollup"

    sget-object v8, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v9, "window_id = %1$d"

    new-array v10, v13, [Ljava/lang/Object;

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    aput-object v11, v10, v12

    invoke-static {v8, v9, v10}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8, v14}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    .line 462
    .local v0, "deleteCount":I
    sget-object v6, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    sget-object v8, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v8}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v8

    or-long/2addr v6, v8

    sget-object v8, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v9, "Usage: UsageRollupDatabase: purgeObsoleteAggregationDataInternal() Removed %1$d roll-up records for aged-out reporting window %2$d"

    const/4 v10, 0x2

    new-array v10, v10, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v10, v12

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    aput-object v11, v10, v13

    invoke-static {v8, v9, v10}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v6, v7, v8}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 468
    invoke-virtual {p0}, Lcom/getjar/sdk/data/usage/UsageRollupDatabase;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v6

    const-string v7, "reportingWindow"

    sget-object v8, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v9, "id = %1$d"

    new-array v10, v13, [Ljava/lang/Object;

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    aput-object v11, v10, v12

    invoke-static {v8, v9, v10}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8, v14}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 469
    sget-object v6, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    sget-object v8, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v8}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v8

    or-long/2addr v6, v8

    sget-object v8, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v9, "Usage: UsageRollupDatabase: purgeObsoleteAggregationDataInternal() Removed aged-out reporting window %1$d"

    new-array v10, v13, [Ljava/lang/Object;

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    aput-object v11, v10, v12

    invoke-static {v8, v9, v10}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v6, v7, v8}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 457
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_0

    .line 474
    .end local v0    # "deleteCount":I
    .end local v1    # "i":I
    .end local v4    # "windowIdToKill":J
    :cond_0
    return-void
.end method


# virtual methods
.method protected collectAppSessionEvent(Lcom/getjar/sdk/data/usage/SessionEvent$Type;JLjava/lang/String;Ljava/lang/Long;)V
    .locals 49
    .param p1, "eventType"    # Lcom/getjar/sdk/data/usage/SessionEvent$Type;
    .param p2, "eventTimestamp"    # J
    .param p4, "eventPackageName"    # Ljava/lang/String;
    .param p5, "startEventTimestamp"    # Ljava/lang/Long;

    .prologue
    .line 113
    if-nez p1, :cond_0

    new-instance v40, Ljava/lang/IllegalArgumentException;

    const-string v41, "\'eventType\' cannot be NULL"

    invoke-direct/range {v40 .. v41}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v40

    .line 114
    :cond_0
    const-wide/16 v40, 0x0

    cmp-long v40, p2, v40

    if-gez v40, :cond_1

    new-instance v40, Ljava/lang/IllegalArgumentException;

    const-string v41, "\'eventTimestamp\' cannot be less than zero"

    invoke-direct/range {v40 .. v41}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v40

    .line 115
    :cond_1
    invoke-static/range {p4 .. p4}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v40

    if-eqz v40, :cond_2

    new-instance v40, Ljava/lang/IllegalArgumentException;

    const-string v41, "\'eventPackageName\' cannot be NULL or empty"

    invoke-direct/range {v40 .. v41}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v40

    .line 116
    :cond_2
    sget-object v40, Lcom/getjar/sdk/data/usage/SessionEvent$Type;->stop:Lcom/getjar/sdk/data/usage/SessionEvent$Type;

    move-object/from16 v0, v40

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Lcom/getjar/sdk/data/usage/SessionEvent$Type;->equals(Ljava/lang/Object;)Z

    move-result v40

    if-eqz v40, :cond_4

    .line 117
    if-nez p5, :cond_3

    new-instance v40, Ljava/lang/IllegalArgumentException;

    const-string v41, "\'startEventTimestamp\' cannot be NULL for collecting \'stop\' events"

    invoke-direct/range {v40 .. v41}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v40

    .line 118
    :cond_3
    invoke-virtual/range {p5 .. p5}, Ljava/lang/Long;->longValue()J

    move-result-wide v40

    const-wide/16 v42, 0x0

    cmp-long v40, v40, v42

    if-gez v40, :cond_4

    new-instance v40, Ljava/lang/IllegalArgumentException;

    const-string v41, "\'startEventTimestamp\' cannot be less than zero for collecting \'stop\' events"

    invoke-direct/range {v40 .. v41}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v40

    .line 121
    :cond_4
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v14

    .line 122
    .local v14, "now":J
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getjar/sdk/data/usage/UsageRollupDatabase;->_databaseAccessLock:Ljava/lang/Object;

    move-object/from16 v41, v0

    monitor-enter v41

    .line 128
    const/4 v13, 0x0

    .line 129
    .local v13, "newWindowsCreated":Z
    const-wide/16 v32, -0x1

    .line 130
    .local v32, "windowId":J
    :try_start_0
    invoke-direct/range {p0 .. p0}, Lcom/getjar/sdk/data/usage/UsageRollupDatabase;->loadReportingWindows()Ljava/util/List;

    move-result-object v21

    .line 131
    .local v21, "reportingWindows":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/data/usage/ReportingWindow;>;"
    invoke-interface/range {v21 .. v21}, Ljava/util/List;->size()I

    move-result v40

    if-gtz v40, :cond_6

    .line 134
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getjar/sdk/data/usage/UsageRollupDatabase;->_context:Landroid/content/Context;

    move-object/from16 v40, v0

    invoke-static/range {v40 .. v40}, Lcom/getjar/sdk/data/usage/UsageManager;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/usage/UsageManager;

    move-result-object v40

    invoke-virtual/range {v40 .. v40}, Lcom/getjar/sdk/data/usage/UsageManager;->getRequestTimeWindowMilliseconds()I

    move-result v40

    move/from16 v0, v40

    int-to-long v0, v0

    move-wide/from16 v42, v0

    add-long v28, p2, v42

    .line 135
    .local v28, "stop":J
    new-instance v30, Landroid/content/ContentValues;

    invoke-direct/range {v30 .. v30}, Landroid/content/ContentValues;-><init>()V

    .line 136
    .local v30, "values":Landroid/content/ContentValues;
    const-string v40, "start_timestamp"

    invoke-static/range {p2 .. p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v42

    move-object/from16 v0, v30

    move-object/from16 v1, v40

    move-object/from16 v2, v42

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 137
    const-string v40, "stop_timestamp"

    invoke-static/range {v28 .. v29}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v42

    move-object/from16 v0, v30

    move-object/from16 v1, v40

    move-object/from16 v2, v42

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 138
    invoke-virtual/range {p0 .. p0}, Lcom/getjar/sdk/data/usage/UsageRollupDatabase;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v40

    const-string v42, "reportingWindow"

    const/16 v43, 0x0

    move-object/from16 v0, v40

    move-object/from16 v1, v42

    move-object/from16 v2, v43

    move-object/from16 v3, v30

    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v32

    .line 139
    const/4 v13, 0x1

    .line 140
    sget-object v40, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v40 .. v40}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v42

    sget-object v40, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v40 .. v40}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v44

    or-long v42, v42, v44

    sget-object v40, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v44, "Usage: UsageRollupDatabase: collectAppSessionEvent() Created reporting window [id:%1$d start:%2$d stop:%3$d]"

    const/16 v45, 0x3

    move/from16 v0, v45

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v45, v0

    const/16 v46, 0x0

    invoke-static/range {v32 .. v33}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v47

    aput-object v47, v45, v46

    const/16 v46, 0x1

    invoke-static/range {p2 .. p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v47

    aput-object v47, v45, v46

    const/16 v46, 0x2

    invoke-static/range {v28 .. v29}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v47

    aput-object v47, v45, v46

    move-object/from16 v0, v40

    move-object/from16 v1, v44

    move-object/from16 v2, v45

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v40

    move-wide/from16 v0, v42

    move-object/from16 v2, v40

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 195
    .end local v28    # "stop":J
    .end local v30    # "values":Landroid/content/ContentValues;
    :cond_5
    const-wide/16 v42, 0x0

    cmp-long v40, v32, v42

    if-gez v40, :cond_a

    .line 196
    sget-object v40, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v40 .. v40}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v42

    sget-object v40, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v40 .. v40}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v44

    or-long v42, v42, v44

    sget-object v40, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v44, "Usage: UsageRollupDatabase: collectAppSessionEvent() Failed to find or create a reporting window for an event with timestamp %1$d, giving up..."

    const/16 v45, 0x1

    move/from16 v0, v45

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v45, v0

    const/16 v46, 0x0

    invoke-static/range {p2 .. p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v47

    aput-object v47, v45, v46

    move-object/from16 v0, v40

    move-object/from16 v1, v44

    move-object/from16 v2, v45

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v40

    move-wide/from16 v0, v42

    move-object/from16 v2, v40

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;)V

    .line 199
    monitor-exit v41

    .line 369
    :goto_0
    return-void

    .line 149
    :cond_6
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_1
    invoke-interface/range {v21 .. v21}, Ljava/util/List;->size()I

    move-result v40

    move/from16 v0, v40

    if-ge v8, v0, :cond_7

    .line 150
    move-object/from16 v0, v21

    invoke-interface {v0, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v31

    check-cast v31, Lcom/getjar/sdk/data/usage/ReportingWindow;

    .line 151
    .local v31, "window":Lcom/getjar/sdk/data/usage/ReportingWindow;
    invoke-virtual/range {v31 .. v31}, Lcom/getjar/sdk/data/usage/ReportingWindow;->getTimestampStart()J

    move-result-wide v42

    cmp-long v40, v42, p2

    if-gtz v40, :cond_9

    invoke-virtual/range {v31 .. v31}, Lcom/getjar/sdk/data/usage/ReportingWindow;->getTimestampStop()J

    move-result-wide v42

    cmp-long v40, v42, p2

    if-ltz v40, :cond_9

    .line 152
    invoke-virtual/range {v31 .. v31}, Lcom/getjar/sdk/data/usage/ReportingWindow;->getId()J

    move-result-wide v32

    .line 158
    .end local v31    # "window":Lcom/getjar/sdk/data/usage/ReportingWindow;
    :cond_7
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getjar/sdk/data/usage/UsageRollupDatabase;->_context:Landroid/content/Context;

    move-object/from16 v40, v0

    invoke-static/range {v40 .. v40}, Lcom/getjar/sdk/data/usage/UsageManager;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/usage/UsageManager;

    move-result-object v40

    invoke-virtual/range {v40 .. v40}, Lcom/getjar/sdk/data/usage/UsageManager;->getRequestTimeWindowMilliseconds()I

    move-result v40

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getjar/sdk/data/usage/UsageRollupDatabase;->_context:Landroid/content/Context;

    move-object/from16 v42, v0

    invoke-static/range {v42 .. v42}, Lcom/getjar/sdk/data/usage/UsageManager;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/usage/UsageManager;

    move-result-object v42

    invoke-virtual/range {v42 .. v42}, Lcom/getjar/sdk/data/usage/UsageManager;->getRequestTimeWindowCount()I

    move-result v42

    mul-int v40, v40, v42

    move/from16 v0, v40

    int-to-long v0, v0

    move-wide/from16 v19, v0

    .line 161
    .local v19, "reportingTimeSpan":J
    sub-long v17, v14, v19

    .line 162
    .local v17, "reportingStart":J
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getjar/sdk/data/usage/UsageRollupDatabase;->_context:Landroid/content/Context;

    move-object/from16 v40, v0

    invoke-static/range {v40 .. v40}, Lcom/getjar/sdk/data/usage/UsageManager;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/usage/UsageManager;

    move-result-object v40

    invoke-virtual/range {v40 .. v40}, Lcom/getjar/sdk/data/usage/UsageManager;->getRequestTimeWindowMilliseconds()I

    move-result v40

    move/from16 v0, v40

    int-to-long v0, v0

    move-wide/from16 v34, v0

    .line 164
    .local v34, "windowSize":J
    const/16 v40, 0x0

    move-object/from16 v0, v21

    move/from16 v1, v40

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/getjar/sdk/data/usage/ReportingWindow;

    .line 165
    .local v10, "mostRecentWindow":Lcom/getjar/sdk/data/usage/ReportingWindow;
    invoke-virtual {v10}, Lcom/getjar/sdk/data/usage/ReportingWindow;->getTimestampStop()J

    move-result-wide v38

    .line 166
    .local v38, "windowStop":J
    :cond_8
    :goto_2
    cmp-long v40, v38, v14

    if-gez v40, :cond_5

    .line 168
    const-wide/16 v42, 0x1

    add-long v36, v38, v42

    .line 169
    .local v36, "windowStart":J
    add-long v38, v36, v34

    .line 173
    cmp-long v40, v38, v17

    if-ltz v40, :cond_8

    .line 175
    new-instance v30, Landroid/content/ContentValues;

    invoke-direct/range {v30 .. v30}, Landroid/content/ContentValues;-><init>()V

    .line 176
    .restart local v30    # "values":Landroid/content/ContentValues;
    const-string v40, "start_timestamp"

    invoke-static/range {v36 .. v37}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v42

    move-object/from16 v0, v30

    move-object/from16 v1, v40

    move-object/from16 v2, v42

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 177
    const-string v40, "stop_timestamp"

    invoke-static/range {v38 .. v39}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v42

    move-object/from16 v0, v30

    move-object/from16 v1, v40

    move-object/from16 v2, v42

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 178
    invoke-virtual/range {p0 .. p0}, Lcom/getjar/sdk/data/usage/UsageRollupDatabase;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v40

    const-string v42, "reportingWindow"

    const/16 v43, 0x0

    move-object/from16 v0, v40

    move-object/from16 v1, v42

    move-object/from16 v2, v43

    move-object/from16 v3, v30

    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v11

    .line 179
    .local v11, "newId":J
    const/4 v13, 0x1

    .line 180
    sget-object v40, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v40 .. v40}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v42

    sget-object v40, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v40 .. v40}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v44

    or-long v42, v42, v44

    sget-object v40, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v44, "Usage: UsageRollupDatabase: collectAppSessionEvent() Created reporting window [id:%1$d start:%2$d stop:%3$d]"

    const/16 v45, 0x3

    move/from16 v0, v45

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v45, v0

    const/16 v46, 0x0

    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v47

    aput-object v47, v45, v46

    const/16 v46, 0x1

    invoke-static/range {v36 .. v37}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v47

    aput-object v47, v45, v46

    const/16 v46, 0x2

    invoke-static/range {v38 .. v39}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v47

    aput-object v47, v45, v46

    move-object/from16 v0, v40

    move-object/from16 v1, v44

    move-object/from16 v2, v45

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v40

    move-wide/from16 v0, v42

    move-object/from16 v2, v40

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 187
    cmp-long v40, v36, p2

    if-gtz v40, :cond_8

    cmp-long v40, v38, p2

    if-ltz v40, :cond_8

    .line 188
    move-wide/from16 v32, v11

    goto/16 :goto_2

    .line 149
    .end local v10    # "mostRecentWindow":Lcom/getjar/sdk/data/usage/ReportingWindow;
    .end local v11    # "newId":J
    .end local v17    # "reportingStart":J
    .end local v19    # "reportingTimeSpan":J
    .end local v30    # "values":Landroid/content/ContentValues;
    .end local v34    # "windowSize":J
    .end local v36    # "windowStart":J
    .end local v38    # "windowStop":J
    .restart local v31    # "window":Lcom/getjar/sdk/data/usage/ReportingWindow;
    :cond_9
    add-int/lit8 v8, v8, 0x1

    goto/16 :goto_1

    .line 203
    .end local v8    # "i":I
    .end local v31    # "window":Lcom/getjar/sdk/data/usage/ReportingWindow;
    :cond_a
    if-eqz v13, :cond_b

    .line 204
    invoke-direct/range {p0 .. p0}, Lcom/getjar/sdk/data/usage/UsageRollupDatabase;->loadReportingWindows()Ljava/util/List;

    move-result-object v21

    .line 209
    :cond_b
    const/4 v5, 0x0

    .line 210
    .local v5, "activeWindow":Lcom/getjar/sdk/data/usage/ReportingWindow;
    invoke-interface/range {v21 .. v21}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .local v9, "i$":Ljava/util/Iterator;
    :cond_c
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v40

    if-eqz v40, :cond_d

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v31

    check-cast v31, Lcom/getjar/sdk/data/usage/ReportingWindow;

    .line 211
    .restart local v31    # "window":Lcom/getjar/sdk/data/usage/ReportingWindow;
    invoke-virtual/range {v31 .. v31}, Lcom/getjar/sdk/data/usage/ReportingWindow;->getId()J

    move-result-wide v42

    cmp-long v40, v32, v42

    if-nez v40, :cond_c

    .line 212
    move-object/from16 v5, v31

    .line 216
    .end local v31    # "window":Lcom/getjar/sdk/data/usage/ReportingWindow;
    :cond_d
    if-nez v5, :cond_e

    .line 217
    sget-object v40, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v40 .. v40}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v42

    sget-object v40, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v40 .. v40}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v44

    or-long v42, v42, v44

    sget-object v40, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v44, "Usage: UsageRollupDatabase: collectAppSessionEvent() Reporting window %1$d for an event with timestamp %2$d, has been purged, giving up..."

    const/16 v45, 0x2

    move/from16 v0, v45

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v45, v0

    const/16 v46, 0x0

    invoke-static/range {v32 .. v33}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v47

    aput-object v47, v45, v46

    const/16 v46, 0x1

    invoke-static/range {p2 .. p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v47

    aput-object v47, v45, v46

    move-object/from16 v0, v40

    move-object/from16 v1, v44

    move-object/from16 v2, v45

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v40

    move-wide/from16 v0, v42

    move-object/from16 v2, v40

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;)V

    .line 221
    monitor-exit v41

    goto/16 :goto_0

    .line 368
    .end local v5    # "activeWindow":Lcom/getjar/sdk/data/usage/ReportingWindow;
    .end local v9    # "i$":Ljava/util/Iterator;
    .end local v21    # "reportingWindows":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/data/usage/ReportingWindow;>;"
    :catchall_0
    move-exception v40

    monitor-exit v41
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v40

    .line 226
    .restart local v5    # "activeWindow":Lcom/getjar/sdk/data/usage/ReportingWindow;
    .restart local v9    # "i$":Ljava/util/Iterator;
    .restart local v21    # "reportingWindows":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/data/usage/ReportingWindow;>;"
    :cond_e
    :try_start_1
    sget-object v40, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v40 .. v40}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v42

    sget-object v40, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v40 .. v40}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v44

    or-long v42, v42, v44

    sget-object v40, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v44, "Usage: UsageRollupDatabase: collectAppSessionEvent() Collecting event [packageName:%1$s type:%2$s time:%3$d] into reporting window [id:%4$d start:%5$d stop:%6$d]"

    const/16 v45, 0x6

    move/from16 v0, v45

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v45, v0

    const/16 v46, 0x0

    aput-object p4, v45, v46

    const/16 v46, 0x1

    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/data/usage/SessionEvent$Type;->name()Ljava/lang/String;

    move-result-object v47

    aput-object v47, v45, v46

    const/16 v46, 0x2

    invoke-static/range {p2 .. p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v47

    aput-object v47, v45, v46

    const/16 v46, 0x3

    invoke-virtual {v5}, Lcom/getjar/sdk/data/usage/ReportingWindow;->getId()J

    move-result-wide v47

    invoke-static/range {v47 .. v48}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v47

    aput-object v47, v45, v46

    const/16 v46, 0x4

    invoke-virtual {v5}, Lcom/getjar/sdk/data/usage/ReportingWindow;->getTimestampStart()J

    move-result-wide v47

    invoke-static/range {v47 .. v48}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v47

    aput-object v47, v45, v46

    const/16 v46, 0x5

    invoke-virtual {v5}, Lcom/getjar/sdk/data/usage/ReportingWindow;->getTimestampStop()J

    move-result-wide v47

    invoke-static/range {v47 .. v48}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v47

    aput-object v47, v45, v46

    move-object/from16 v0, v40

    move-object/from16 v1, v44

    move-object/from16 v2, v45

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v40

    move-wide/from16 v0, v42

    move-object/from16 v2, v40

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 238
    invoke-virtual {v5}, Lcom/getjar/sdk/data/usage/ReportingWindow;->getId()J

    move-result-wide v42

    move-object/from16 v0, p0

    move-wide/from16 v1, v42

    move-object/from16 v3, p4

    invoke-direct {v0, v1, v2, v3}, Lcom/getjar/sdk/data/usage/UsageRollupDatabase;->loadAggregateSession(JLjava/lang/String;)Lcom/getjar/sdk/data/usage/AggregateSession;

    move-result-object v23

    .line 240
    .local v23, "rollupRecord":Lcom/getjar/sdk/data/usage/AggregateSession;
    sget-object v40, Lcom/getjar/sdk/data/usage/SessionEvent$Type;->start:Lcom/getjar/sdk/data/usage/SessionEvent$Type;

    move-object/from16 v0, v40

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Lcom/getjar/sdk/data/usage/SessionEvent$Type;->equals(Ljava/lang/Object;)Z

    move-result v40

    if-eqz v40, :cond_11

    .line 256
    if-eqz v23, :cond_10

    .line 259
    new-instance v30, Landroid/content/ContentValues;

    invoke-direct/range {v30 .. v30}, Landroid/content/ContentValues;-><init>()V

    .line 260
    .restart local v30    # "values":Landroid/content/ContentValues;
    const-string v40, "start_timestamp"

    invoke-virtual/range {v23 .. v23}, Lcom/getjar/sdk/data/usage/AggregateSession;->getTimestampStart()J

    move-result-wide v42

    move-wide/from16 v0, p2

    move-wide/from16 v2, v42

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v42

    invoke-static/range {v42 .. v43}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v42

    move-object/from16 v0, v30

    move-object/from16 v1, v40

    move-object/from16 v2, v42

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 261
    const-string v40, "stop_timestamp"

    invoke-virtual/range {v23 .. v23}, Lcom/getjar/sdk/data/usage/AggregateSession;->getTimestampStart()J

    move-result-wide v42

    move-wide/from16 v0, p2

    move-wide/from16 v2, v42

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v42

    invoke-static/range {v42 .. v43}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v42

    move-object/from16 v0, v30

    move-object/from16 v1, v40

    move-object/from16 v2, v42

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 262
    const-string v40, "sessions"

    invoke-virtual/range {v23 .. v23}, Lcom/getjar/sdk/data/usage/AggregateSession;->getTotalSessionsCount()I

    move-result v42

    add-int/lit8 v42, v42, 0x1

    invoke-static/range {v42 .. v42}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v42

    move-object/from16 v0, v30

    move-object/from16 v1, v40

    move-object/from16 v2, v42

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 263
    const-string v40, "last_start_timestamp"

    invoke-static/range {p2 .. p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v42

    move-object/from16 v0, v30

    move-object/from16 v1, v40

    move-object/from16 v2, v42

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 264
    invoke-virtual/range {p0 .. p0}, Lcom/getjar/sdk/data/usage/UsageRollupDatabase;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v40

    const-string v42, "usageRollup"

    sget-object v43, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v44, "id = %1$d"

    const/16 v45, 0x1

    move/from16 v0, v45

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v45, v0

    const/16 v46, 0x0

    invoke-virtual/range {v23 .. v23}, Lcom/getjar/sdk/data/usage/AggregateSession;->getId()J

    move-result-wide v47

    invoke-static/range {v47 .. v48}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v47

    aput-object v47, v45, v46

    invoke-static/range {v43 .. v45}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v43

    const/16 v44, 0x0

    move-object/from16 v0, v40

    move-object/from16 v1, v42

    move-object/from16 v2, v30

    move-object/from16 v3, v43

    move-object/from16 v4, v44

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 349
    :goto_3
    const/4 v8, 0x1

    .restart local v8    # "i":I
    :goto_4
    invoke-interface/range {v21 .. v21}, Ljava/util/List;->size()I

    move-result v40

    move/from16 v0, v40

    if-ge v8, v0, :cond_18

    .line 350
    move-object/from16 v0, v21

    invoke-interface {v0, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lcom/getjar/sdk/data/usage/ReportingWindow;

    .line 351
    .local v16, "oldWindow":Lcom/getjar/sdk/data/usage/ReportingWindow;
    invoke-virtual/range {v16 .. v16}, Lcom/getjar/sdk/data/usage/ReportingWindow;->getId()J

    move-result-wide v42

    move-object/from16 v0, p0

    move-wide/from16 v1, v42

    invoke-direct {v0, v1, v2}, Lcom/getjar/sdk/data/usage/UsageRollupDatabase;->loadAggregateSessions(J)Ljava/util/List;

    move-result-object v6

    .line 352
    .local v6, "aggregateSessions":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/data/usage/AggregateSession;>;"
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_f
    :goto_5
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v40

    if-eqz v40, :cond_17

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Lcom/getjar/sdk/data/usage/AggregateSession;

    .line 353
    .local v22, "rollup":Lcom/getjar/sdk/data/usage/AggregateSession;
    invoke-virtual/range {v22 .. v22}, Lcom/getjar/sdk/data/usage/AggregateSession;->getTimestampLastStop()J

    move-result-wide v42

    invoke-virtual/range {v22 .. v22}, Lcom/getjar/sdk/data/usage/AggregateSession;->getTimestampLastStart()J

    move-result-wide v44

    cmp-long v40, v42, v44

    if-gez v40, :cond_f

    .line 356
    invoke-virtual/range {v16 .. v16}, Lcom/getjar/sdk/data/usage/ReportingWindow;->getTimestampStop()J

    move-result-wide v42

    invoke-virtual/range {v22 .. v22}, Lcom/getjar/sdk/data/usage/AggregateSession;->getTimestampLastStart()J

    move-result-wide v44

    sub-long v42, v42, v44

    move-wide/from16 v0, v42

    long-to-int v7, v0

    .line 357
    .local v7, "durationDelta":I
    new-instance v30, Landroid/content/ContentValues;

    .end local v30    # "values":Landroid/content/ContentValues;
    invoke-direct/range {v30 .. v30}, Landroid/content/ContentValues;-><init>()V

    .line 358
    .restart local v30    # "values":Landroid/content/ContentValues;
    const-string v40, "stop_timestamp"

    invoke-virtual/range {v16 .. v16}, Lcom/getjar/sdk/data/usage/ReportingWindow;->getTimestampStop()J

    move-result-wide v42

    invoke-static/range {v42 .. v43}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v42

    move-object/from16 v0, v30

    move-object/from16 v1, v40

    move-object/from16 v2, v42

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 359
    const-string v40, "duration"

    invoke-virtual/range {v22 .. v22}, Lcom/getjar/sdk/data/usage/AggregateSession;->getTotalUseDuration()I

    move-result v42

    add-int v42, v42, v7

    invoke-static/range {v42 .. v42}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v42

    move-object/from16 v0, v30

    move-object/from16 v1, v40

    move-object/from16 v2, v42

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 360
    const-string v40, "last_stop_timestamp"

    invoke-virtual/range {v16 .. v16}, Lcom/getjar/sdk/data/usage/ReportingWindow;->getTimestampStop()J

    move-result-wide v42

    invoke-static/range {v42 .. v43}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v42

    move-object/from16 v0, v30

    move-object/from16 v1, v40

    move-object/from16 v2, v42

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 361
    invoke-virtual/range {p0 .. p0}, Lcom/getjar/sdk/data/usage/UsageRollupDatabase;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v40

    const-string v42, "usageRollup"

    sget-object v43, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v44, "id = %1$d"

    const/16 v45, 0x1

    move/from16 v0, v45

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v45, v0

    const/16 v46, 0x0

    invoke-virtual/range {v22 .. v22}, Lcom/getjar/sdk/data/usage/AggregateSession;->getId()J

    move-result-wide v47

    invoke-static/range {v47 .. v48}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v47

    aput-object v47, v45, v46

    invoke-static/range {v43 .. v45}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v43

    const/16 v44, 0x0

    move-object/from16 v0, v40

    move-object/from16 v1, v42

    move-object/from16 v2, v30

    move-object/from16 v3, v43

    move-object/from16 v4, v44

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    goto/16 :goto_5

    .line 269
    .end local v6    # "aggregateSessions":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/data/usage/AggregateSession;>;"
    .end local v7    # "durationDelta":I
    .end local v8    # "i":I
    .end local v16    # "oldWindow":Lcom/getjar/sdk/data/usage/ReportingWindow;
    .end local v22    # "rollup":Lcom/getjar/sdk/data/usage/AggregateSession;
    .end local v30    # "values":Landroid/content/ContentValues;
    :cond_10
    new-instance v30, Landroid/content/ContentValues;

    invoke-direct/range {v30 .. v30}, Landroid/content/ContentValues;-><init>()V

    .line 270
    .restart local v30    # "values":Landroid/content/ContentValues;
    const-string v40, "window_id"

    invoke-virtual {v5}, Lcom/getjar/sdk/data/usage/ReportingWindow;->getId()J

    move-result-wide v42

    invoke-static/range {v42 .. v43}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v42

    move-object/from16 v0, v30

    move-object/from16 v1, v40

    move-object/from16 v2, v42

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 271
    const-string v40, "package_name"

    move-object/from16 v0, v30

    move-object/from16 v1, v40

    move-object/from16 v2, p4

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 272
    const-string v40, "start_timestamp"

    invoke-static/range {p2 .. p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v42

    move-object/from16 v0, v30

    move-object/from16 v1, v40

    move-object/from16 v2, v42

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 273
    const-string v40, "stop_timestamp"

    invoke-static/range {p2 .. p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v42

    move-object/from16 v0, v30

    move-object/from16 v1, v40

    move-object/from16 v2, v42

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 274
    const-string v40, "duration"

    const/16 v42, 0x0

    invoke-static/range {v42 .. v42}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v42

    move-object/from16 v0, v30

    move-object/from16 v1, v40

    move-object/from16 v2, v42

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 275
    const-string v40, "sessions"

    const/16 v42, 0x1

    invoke-static/range {v42 .. v42}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v42

    move-object/from16 v0, v30

    move-object/from16 v1, v40

    move-object/from16 v2, v42

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 276
    const-string v40, "last_start_timestamp"

    invoke-static/range {p2 .. p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v42

    move-object/from16 v0, v30

    move-object/from16 v1, v40

    move-object/from16 v2, v42

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 277
    invoke-virtual/range {p0 .. p0}, Lcom/getjar/sdk/data/usage/UsageRollupDatabase;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v40

    const-string v42, "usageRollup"

    const/16 v43, 0x0

    move-object/from16 v0, v40

    move-object/from16 v1, v42

    move-object/from16 v2, v43

    move-object/from16 v3, v30

    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    goto/16 :goto_3

    .line 281
    .end local v30    # "values":Landroid/content/ContentValues;
    :cond_11
    sget-object v40, Lcom/getjar/sdk/data/usage/SessionEvent$Type;->stop:Lcom/getjar/sdk/data/usage/SessionEvent$Type;

    move-object/from16 v0, v40

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Lcom/getjar/sdk/data/usage/SessionEvent$Type;->equals(Ljava/lang/Object;)Z

    move-result v40

    if-eqz v40, :cond_16

    .line 308
    invoke-virtual {v5}, Lcom/getjar/sdk/data/usage/ReportingWindow;->getTimestampStart()J

    move-result-wide v26

    .line 309
    .local v26, "startTime":J
    if-eqz p5, :cond_14

    .line 310
    invoke-virtual/range {p5 .. p5}, Ljava/lang/Long;->longValue()J

    move-result-wide v26

    .line 316
    :cond_12
    :goto_6
    sub-long v24, p2, v26

    .line 317
    .local v24, "sessionDuration":J
    const-wide/16 v42, 0x0

    cmp-long v40, v24, v42

    if-gez v40, :cond_13

    const-wide/16 v24, 0x0

    .line 319
    :cond_13
    if-eqz v23, :cond_15

    .line 322
    new-instance v30, Landroid/content/ContentValues;

    invoke-direct/range {v30 .. v30}, Landroid/content/ContentValues;-><init>()V

    .line 323
    .restart local v30    # "values":Landroid/content/ContentValues;
    const-string v40, "stop_timestamp"

    invoke-virtual/range {v23 .. v23}, Lcom/getjar/sdk/data/usage/AggregateSession;->getTimestampStart()J

    move-result-wide v42

    move-wide/from16 v0, p2

    move-wide/from16 v2, v42

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v42

    invoke-static/range {v42 .. v43}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v42

    move-object/from16 v0, v30

    move-object/from16 v1, v40

    move-object/from16 v2, v42

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 324
    const-string v40, "duration"

    invoke-virtual/range {v23 .. v23}, Lcom/getjar/sdk/data/usage/AggregateSession;->getTotalUseDuration()I

    move-result v42

    move/from16 v0, v42

    int-to-long v0, v0

    move-wide/from16 v42, v0

    add-long v42, v42, v24

    invoke-static/range {v42 .. v43}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v42

    move-object/from16 v0, v30

    move-object/from16 v1, v40

    move-object/from16 v2, v42

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 325
    const-string v40, "last_stop_timestamp"

    invoke-static/range {p2 .. p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v42

    move-object/from16 v0, v30

    move-object/from16 v1, v40

    move-object/from16 v2, v42

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 326
    invoke-virtual/range {p0 .. p0}, Lcom/getjar/sdk/data/usage/UsageRollupDatabase;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v40

    const-string v42, "usageRollup"

    sget-object v43, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v44, "id = %1$d"

    const/16 v45, 0x1

    move/from16 v0, v45

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v45, v0

    const/16 v46, 0x0

    invoke-virtual/range {v23 .. v23}, Lcom/getjar/sdk/data/usage/AggregateSession;->getId()J

    move-result-wide v47

    invoke-static/range {v47 .. v48}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v47

    aput-object v47, v45, v46

    invoke-static/range {v43 .. v45}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v43

    const/16 v44, 0x0

    move-object/from16 v0, v40

    move-object/from16 v1, v42

    move-object/from16 v2, v30

    move-object/from16 v3, v43

    move-object/from16 v4, v44

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    goto/16 :goto_3

    .line 311
    .end local v24    # "sessionDuration":J
    .end local v30    # "values":Landroid/content/ContentValues;
    :cond_14
    if-eqz v23, :cond_12

    .line 312
    invoke-virtual/range {v23 .. v23}, Lcom/getjar/sdk/data/usage/AggregateSession;->getTimestampStart()J

    move-result-wide v26

    goto/16 :goto_6

    .line 331
    .restart local v24    # "sessionDuration":J
    :cond_15
    new-instance v30, Landroid/content/ContentValues;

    invoke-direct/range {v30 .. v30}, Landroid/content/ContentValues;-><init>()V

    .line 332
    .restart local v30    # "values":Landroid/content/ContentValues;
    const-string v40, "window_id"

    invoke-virtual {v5}, Lcom/getjar/sdk/data/usage/ReportingWindow;->getId()J

    move-result-wide v42

    invoke-static/range {v42 .. v43}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v42

    move-object/from16 v0, v30

    move-object/from16 v1, v40

    move-object/from16 v2, v42

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 333
    const-string v40, "package_name"

    move-object/from16 v0, v30

    move-object/from16 v1, v40

    move-object/from16 v2, p4

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 334
    const-string v40, "start_timestamp"

    invoke-static/range {v26 .. v27}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v42

    move-object/from16 v0, v30

    move-object/from16 v1, v40

    move-object/from16 v2, v42

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 335
    const-string v40, "stop_timestamp"

    invoke-static/range {p2 .. p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v42

    move-object/from16 v0, v30

    move-object/from16 v1, v40

    move-object/from16 v2, v42

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 336
    const-string v40, "duration"

    invoke-static/range {v24 .. v25}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v42

    move-object/from16 v0, v30

    move-object/from16 v1, v40

    move-object/from16 v2, v42

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 337
    const-string v40, "sessions"

    const/16 v42, 0x1

    invoke-static/range {v42 .. v42}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v42

    move-object/from16 v0, v30

    move-object/from16 v1, v40

    move-object/from16 v2, v42

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 338
    const-string v40, "last_start_timestamp"

    invoke-static/range {v26 .. v27}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v42

    move-object/from16 v0, v30

    move-object/from16 v1, v40

    move-object/from16 v2, v42

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 339
    const-string v40, "last_stop_timestamp"

    invoke-static/range {p2 .. p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v42

    move-object/from16 v0, v30

    move-object/from16 v1, v40

    move-object/from16 v2, v42

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 340
    invoke-virtual/range {p0 .. p0}, Lcom/getjar/sdk/data/usage/UsageRollupDatabase;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v40

    const-string v42, "usageRollup"

    const/16 v43, 0x0

    move-object/from16 v0, v40

    move-object/from16 v1, v42

    move-object/from16 v2, v43

    move-object/from16 v3, v30

    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    goto/16 :goto_3

    .line 345
    .end local v24    # "sessionDuration":J
    .end local v26    # "startTime":J
    .end local v30    # "values":Landroid/content/ContentValues;
    :cond_16
    new-instance v40, Ljava/lang/IllegalStateException;

    const-string v42, "Unrecognized event type [%1$s]"

    const/16 v43, 0x1

    move/from16 v0, v43

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v43, v0

    const/16 v44, 0x0

    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/data/usage/SessionEvent$Type;->name()Ljava/lang/String;

    move-result-object v45

    aput-object v45, v43, v44

    invoke-static/range {v42 .. v43}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v42

    move-object/from16 v0, v40

    move-object/from16 v1, v42

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v40

    .line 349
    .restart local v6    # "aggregateSessions":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/data/usage/AggregateSession;>;"
    .restart local v8    # "i":I
    .restart local v16    # "oldWindow":Lcom/getjar/sdk/data/usage/ReportingWindow;
    .restart local v30    # "values":Landroid/content/ContentValues;
    :cond_17
    add-int/lit8 v8, v8, 0x1

    goto/16 :goto_4

    .line 367
    .end local v6    # "aggregateSessions":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/data/usage/AggregateSession;>;"
    .end local v16    # "oldWindow":Lcom/getjar/sdk/data/usage/ReportingWindow;
    :cond_18
    invoke-direct/range {p0 .. p0}, Lcom/getjar/sdk/data/usage/UsageRollupDatabase;->purgeObsoleteAggregationDataInternal()V

    .line 368
    monitor-exit v41
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto/16 :goto_0
.end method

.method protected getTotalReportingWindow()[J
    .locals 9

    .prologue
    .line 409
    const/4 v3, 0x2

    new-array v1, v3, [J

    fill-array-data v1, :array_0

    .line 410
    .local v1, "minMax":[J
    const/4 v2, 0x0

    .line 412
    .local v2, "results":Landroid/database/Cursor;
    :try_start_0
    invoke-virtual {p0}, Lcom/getjar/sdk/data/usage/UsageRollupDatabase;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "SELECT min(start_timestamp), max(stop_timestamp) FROM %1$s"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    const-string v8, "reportingWindow"

    aput-object v8, v6, v7

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    .line 415
    invoke-interface {v2}, Landroid/database/Cursor;->moveToNext()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 416
    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-interface {v2, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    aput-wide v4, v1, v3

    .line 417
    const/4 v3, 0x1

    const/4 v4, 0x1

    invoke-interface {v2, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    aput-wide v4, v1, v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 421
    :cond_0
    if-eqz v2, :cond_1

    :try_start_1
    invoke-interface {v2}, Landroid/database/Cursor;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    const/4 v2, 0x0

    .line 426
    :cond_1
    :goto_0
    return-object v1

    .line 422
    :catch_0
    move-exception v0

    .line 423
    .local v0, "e":Ljava/lang/Exception;
    sget-object v3, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    const-string v5, "Usage: UsageRollupDatabase: loadAggregateSessions() results.close() failed"

    invoke-static {v3, v4, v5, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 420
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v3

    .line 421
    if-eqz v2, :cond_2

    :try_start_2
    invoke-interface {v2}, Landroid/database/Cursor;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    const/4 v2, 0x0

    .line 424
    :cond_2
    :goto_1
    throw v3

    .line 422
    :catch_1
    move-exception v0

    .line 423
    .restart local v0    # "e":Ljava/lang/Exception;
    sget-object v4, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    sget-object v6, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    or-long/2addr v4, v6

    const-string v6, "Usage: UsageRollupDatabase: loadAggregateSessions() results.close() failed"

    invoke-static {v4, v5, v6, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 409
    nop

    :array_0
    .array-data 8
        0x0
        0x0
    .end array-data
.end method

.method protected loadAggregateSessions()Ljava/util/List;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/getjar/sdk/data/usage/AggregateSession;",
            ">;"
        }
    .end annotation

    .prologue
    .line 373
    iget-object v11, p0, Lcom/getjar/sdk/data/usage/UsageRollupDatabase;->_databaseAccessLock:Ljava/lang/Object;

    monitor-enter v11

    .line 374
    :try_start_0
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 375
    .local v9, "result":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/data/usage/AggregateSession;>;"
    const/4 v10, 0x0

    .line 377
    .local v10, "results":Landroid/database/Cursor;
    :try_start_1
    invoke-virtual {p0}, Lcom/getjar/sdk/data/usage/UsageRollupDatabase;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string v1, "usageRollup"

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const-string v7, "package_name"

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v10

    .line 378
    :goto_0
    invoke-interface {v10}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 379
    new-instance v0, Lcom/getjar/sdk/data/usage/AggregateSession;

    invoke-direct {v0, v10}, Lcom/getjar/sdk/data/usage/AggregateSession;-><init>(Landroid/database/Cursor;)V

    invoke-interface {v9, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 382
    :catchall_0
    move-exception v0

    .line 383
    if-eqz v10, :cond_0

    :try_start_2
    invoke-interface {v10}, Landroid/database/Cursor;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    const/4 v10, 0x0

    .line 386
    :cond_0
    :goto_1
    :try_start_3
    throw v0

    .line 389
    .end local v9    # "result":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/data/usage/AggregateSession;>;"
    .end local v10    # "results":Landroid/database/Cursor;
    :catchall_1
    move-exception v0

    monitor-exit v11
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw v0

    .line 383
    .restart local v9    # "result":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/data/usage/AggregateSession;>;"
    .restart local v10    # "results":Landroid/database/Cursor;
    :cond_1
    if-eqz v10, :cond_2

    :try_start_4
    invoke-interface {v10}, Landroid/database/Cursor;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    const/4 v10, 0x0

    .line 388
    :cond_2
    :goto_2
    :try_start_5
    monitor-exit v11

    return-object v9

    .line 384
    :catch_0
    move-exception v8

    .line 385
    .local v8, "e":Ljava/lang/Exception;
    sget-object v0, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    const-string v2, "Usage: UsageRollupDatabase: loadAggregateSessions() results.close() failed"

    invoke-static {v0, v1, v2, v8}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_2

    .line 384
    .end local v8    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v8

    .line 385
    .restart local v8    # "e":Ljava/lang/Exception;
    sget-object v1, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "Usage: UsageRollupDatabase: loadAggregateSessions() results.close() failed"

    invoke-static {v1, v2, v3, v8}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    goto :goto_1
.end method

.method public onCreate(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 6
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .prologue
    .line 76
    iget-object v5, p0, Lcom/getjar/sdk/data/usage/UsageRollupDatabase;->_databaseAccessLock:Ljava/lang/Object;

    monitor-enter v5

    .line 77
    :try_start_0
    sget-object v0, Lcom/getjar/sdk/data/usage/UsageRollupDatabase;->DB_CREATE_TABLE_COMMANDS:[Ljava/lang/String;

    .local v0, "arr$":[Ljava/lang/String;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_0

    aget-object v1, v0, v2

    .line 78
    .local v1, "createCommand":Ljava/lang/String;
    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 77
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 80
    .end local v1    # "createCommand":Ljava/lang/String;
    :cond_0
    monitor-exit v5

    .line 81
    return-void

    .line 80
    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v2    # "i$":I
    .end local v3    # "len$":I
    :catchall_0
    move-exception v4

    monitor-exit v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v4
.end method

.method public onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 12
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "oldVersion"    # I
    .param p3, "newVersion"    # I

    .prologue
    .line 86
    iget-object v5, p0, Lcom/getjar/sdk/data/usage/UsageRollupDatabase;->_databaseAccessLock:Ljava/lang/Object;

    monitor-enter v5

    .line 87
    :try_start_0
    sget-object v4, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    sget-object v4, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v8

    or-long/2addr v6, v8

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v8, "Upgrading database \'%1$s\' from version %2$d to %3$d, which will destroy all old data"

    const/4 v9, 0x3

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    const-string v11, "GetJarDBUsageRollup"

    aput-object v11, v9, v10

    const/4 v10, 0x1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v9, v10

    const/4 v10, 0x2

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v9, v10

    invoke-static {v4, v8, v9}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v6, v7, v4}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 92
    sget-object v0, Lcom/getjar/sdk/data/usage/UsageRollupDatabase;->DB_TABLE_NAMES:[Ljava/lang/String;

    .local v0, "arr$":[Ljava/lang/String;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v2, :cond_0

    aget-object v3, v0, v1

    .line 93
    .local v3, "tableName":Ljava/lang/String;
    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "DROP TABLE IF EXISTS %1$s"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object v3, v7, v8

    invoke-static {v4, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 92
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 95
    .end local v3    # "tableName":Ljava/lang/String;
    :cond_0
    invoke-virtual {p0, p1}, Lcom/getjar/sdk/data/usage/UsageRollupDatabase;->onCreate(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 96
    monitor-exit v5

    .line 97
    return-void

    .line 96
    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v1    # "i$":I
    .end local v2    # "len$":I
    :catchall_0
    move-exception v4

    monitor-exit v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v4
.end method

.method protected purgeObsoleteAggregationData()V
    .locals 2

    .prologue
    .line 398
    iget-object v1, p0, Lcom/getjar/sdk/data/usage/UsageRollupDatabase;->_databaseAccessLock:Ljava/lang/Object;

    monitor-enter v1

    .line 399
    :try_start_0
    invoke-direct {p0}, Lcom/getjar/sdk/data/usage/UsageRollupDatabase;->purgeObsoleteAggregationDataInternal()V

    .line 400
    monitor-exit v1

    .line 401
    return-void

    .line 400
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
