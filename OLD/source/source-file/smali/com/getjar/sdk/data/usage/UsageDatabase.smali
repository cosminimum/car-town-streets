.class public Lcom/getjar/sdk/data/usage/UsageDatabase;
.super Landroid/database/sqlite/SQLiteOpenHelper;
.source "UsageDatabase.java"


# static fields
.field private static final DATABASE_CREATE_TABLE_APP_SESSIONS:Ljava/lang/String; = "CREATE TABLE IF NOT EXISTS appSessions (id INTEGER PRIMARY KEY AUTOINCREMENT, packageName TEXT NOT NULL, timestamp INTEGER NOT NULL, type TEXT NOT NULL, reason TEXT NOT NULL, reasonDetails TEXT, sessionId TEXT NOT NULL, phoneSessionId TEXT NOT NULL, synced INTEGER NOT NULL DEFAULT 0, disposable INTEGER NOT NULL DEFAULT 0);"

.field private static final DATABASE_CREATE_TABLE_PHONE_SESSIONS:Ljava/lang/String; = "CREATE TABLE IF NOT EXISTS phoneSessions (id INTEGER PRIMARY KEY AUTOINCREMENT, timestamp INTEGER NOT NULL, type TEXT NOT NULL, reason TEXT NOT NULL, reasonDetails TEXT, sessionId TEXT NOT NULL, synced INTEGER NOT NULL DEFAULT 0, disposable INTEGER NOT NULL DEFAULT 0);"

.field private static final DATABASE_NAME:Ljava/lang/String; = "GetJarDBUsage"

.field private static final DATABASE_TABLE_APP_SESSIONS:Ljava/lang/String; = "appSessions"

.field private static final DATABASE_TABLE_PHONE_SESSIONS:Ljava/lang/String; = "phoneSessions"

.field private static final DATABASE_VERSION:I = 0x4

.field private static final DB_CREATE_TABLE_COMMANDS:[Ljava/lang/String;

.field private static final DB_TABLE_NAMES:[Ljava/lang/String;

.field public static final EmptyUUID:Ljava/lang/String; = "00000000-0000-0000-0000-000000000000"

.field public static final LRUCap:I = 0x9c4

.field private static final _APP_EVENT_AGE_THRESHOLD:J = 0x4ef6d80L

.field private static volatile _Instance:Lcom/getjar/sdk/data/usage/UsageDatabase;

.field private static final _SessionIdColumns:[Ljava/lang/String;


# instance fields
.field private volatile _databaseAccessLock:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 27
    const/4 v0, 0x0

    sput-object v0, Lcom/getjar/sdk/data/usage/UsageDatabase;->_Instance:Lcom/getjar/sdk/data/usage/UsageDatabase;

    .line 40
    new-array v0, v4, [Ljava/lang/String;

    const-string v1, "appSessions"

    aput-object v1, v0, v2

    const-string v1, "phoneSessions"

    aput-object v1, v0, v3

    sput-object v0, Lcom/getjar/sdk/data/usage/UsageDatabase;->DB_TABLE_NAMES:[Ljava/lang/String;

    .line 68
    new-array v0, v4, [Ljava/lang/String;

    const-string v1, "CREATE TABLE IF NOT EXISTS appSessions (id INTEGER PRIMARY KEY AUTOINCREMENT, packageName TEXT NOT NULL, timestamp INTEGER NOT NULL, type TEXT NOT NULL, reason TEXT NOT NULL, reasonDetails TEXT, sessionId TEXT NOT NULL, phoneSessionId TEXT NOT NULL, synced INTEGER NOT NULL DEFAULT 0, disposable INTEGER NOT NULL DEFAULT 0);"

    aput-object v1, v0, v2

    const-string v1, "CREATE TABLE IF NOT EXISTS phoneSessions (id INTEGER PRIMARY KEY AUTOINCREMENT, timestamp INTEGER NOT NULL, type TEXT NOT NULL, reason TEXT NOT NULL, reasonDetails TEXT, sessionId TEXT NOT NULL, synced INTEGER NOT NULL DEFAULT 0, disposable INTEGER NOT NULL DEFAULT 0);"

    aput-object v1, v0, v3

    sput-object v0, Lcom/getjar/sdk/data/usage/UsageDatabase;->DB_CREATE_TABLE_COMMANDS:[Ljava/lang/String;

    .line 75
    new-array v0, v4, [Ljava/lang/String;

    const-string v1, "sessionId"

    aput-object v1, v0, v2

    const-string v1, "timestamp"

    aput-object v1, v0, v3

    sput-object v0, Lcom/getjar/sdk/data/usage/UsageDatabase;->_SessionIdColumns:[Ljava/lang/String;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 24
    const/4 v0, 0x0

    const/4 v1, 0x4

    invoke-direct {p0, p1, p2, v0, v1}, Landroid/database/sqlite/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    .line 77
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/getjar/sdk/data/usage/UsageDatabase;->_databaseAccessLock:Ljava/lang/Object;

    .line 25
    sget-object v0, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "UsageDatabase: Opened database \'%1$s\'"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    const-string v6, "GetJarDBUsage"

    aput-object v6, v4, v5

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    .line 26
    return-void
.end method

.method private appSessionLoadOpenStartsInternal()Ljava/util/List;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;",
            ">;"
        }
    .end annotation

    .prologue
    .line 512
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 513
    .local v8, "appSessionList":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;>;"
    const/4 v10, 0x0

    .line 515
    .local v10, "results":Landroid/database/Cursor;
    :try_start_0
    invoke-virtual {p0}, Lcom/getjar/sdk/data/usage/UsageDatabase;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string v1, "appSessions"

    const/4 v2, 0x0

    const-string v3, "disposable = 0 AND type = \'start\'"

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v10

    .line 516
    :goto_0
    invoke-interface {v10}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 517
    invoke-static {v10}, Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;->loadFromDB(Landroid/database/Cursor;)Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;

    move-result-object v0

    invoke-interface {v8, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 520
    :catchall_0
    move-exception v0

    .line 521
    if-eqz v10, :cond_0

    :try_start_1
    invoke-interface {v10}, Landroid/database/Cursor;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    const/4 v10, 0x0

    .line 524
    :cond_0
    :goto_1
    throw v0

    .line 521
    :cond_1
    if-eqz v10, :cond_2

    :try_start_2
    invoke-interface {v10}, Landroid/database/Cursor;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    const/4 v10, 0x0

    .line 526
    :cond_2
    :goto_2
    return-object v8

    .line 522
    :catch_0
    move-exception v9

    .line 523
    .local v9, "e":Ljava/lang/Exception;
    sget-object v0, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    const-string v2, "Usage: UsageDatabase: appSessionLoadOpenStartsInternal() failed"

    invoke-static {v0, v1, v2, v9}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_2

    .line 522
    .end local v9    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v9

    .line 523
    .restart local v9    # "e":Ljava/lang/Exception;
    sget-object v1, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "Usage: UsageDatabase: appSessionLoadOpenStartsInternal() failed"

    invoke-static {v1, v2, v3, v9}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1
.end method

.method private checkForRecord(Ljava/lang/String;J)Z
    .locals 9
    .param p1, "tableName"    # Ljava/lang/String;
    .param p2, "id"    # J

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 169
    const/4 v0, 0x0

    .line 171
    .local v0, "dbStatement":Landroid/database/sqlite/SQLiteStatement;
    :try_start_0
    invoke-virtual {p0}, Lcom/getjar/sdk/data/usage/UsageDatabase;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v4

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "SELECT count(*) FROM %1$s WHERE id = ?"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object p1, v7, v8

    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v0

    .line 172
    const/4 v4, 0x1

    invoke-virtual {v0, v4, p2, p3}, Landroid/database/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 173
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteStatement;->simpleQueryForLong()J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-wide v4

    const-wide/16 v6, 0x0

    cmp-long v4, v4, v6

    if-lez v4, :cond_1

    .line 176
    :goto_0
    if-eqz v0, :cond_0

    .line 177
    :try_start_1
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteStatement;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 178
    const/4 v0, 0x0

    .line 182
    :cond_0
    :goto_1
    return v2

    :cond_1
    move v2, v3

    .line 173
    goto :goto_0

    .line 180
    :catch_0
    move-exception v1

    .line 181
    .local v1, "e":Ljava/lang/Exception;
    sget-object v3, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    const-string v5, "SQLiteStatement.close() failed"

    invoke-static {v3, v4, v5, v1}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 175
    .end local v1    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v2

    .line 176
    if-eqz v0, :cond_2

    .line 177
    :try_start_2
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteStatement;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 178
    const/4 v0, 0x0

    .line 182
    :cond_2
    :goto_2
    throw v2

    .line 180
    :catch_1
    move-exception v1

    .line 181
    .restart local v1    # "e":Ljava/lang/Exception;
    sget-object v3, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    const-string v5, "SQLiteStatement.close() failed"

    invoke-static {v3, v4, v5, v1}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_2
.end method

.method private deleteAllRecords()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 121
    invoke-virtual {p0}, Lcom/getjar/sdk/data/usage/UsageDatabase;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string v1, "appSessions"

    invoke-virtual {v0, v1, v2, v2}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 122
    invoke-virtual {p0}, Lcom/getjar/sdk/data/usage/UsageDatabase;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string v1, "phoneSessions"

    invoke-virtual {v0, v1, v2, v2}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 123
    return-void
.end method

.method private getCurrentApplicationSessionId(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p1, "packageName"    # Ljava/lang/String;

    .prologue
    .line 552
    const-string v0, "00000000-0000-0000-0000-000000000000"

    .line 553
    .local v0, "sessionId":Ljava/lang/String;
    invoke-direct {p0, p1}, Lcom/getjar/sdk/data/usage/UsageDatabase;->getLatestStartApplicationSessionId(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 554
    .local v1, "sessionIdStart":Ljava/lang/String;
    invoke-direct {p0, p1}, Lcom/getjar/sdk/data/usage/UsageDatabase;->getLatestStopApplicationSessionId(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 555
    .local v2, "sessionIdStop":Ljava/lang/String;
    invoke-static {v1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 556
    move-object v0, v1

    .line 558
    :cond_0
    return-object v0
.end method

.method public static declared-synchronized getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/usage/UsageDatabase;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 29
    const-class v1, Lcom/getjar/sdk/data/usage/UsageDatabase;

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

    .line 30
    :cond_0
    :try_start_1
    sget-object v0, Lcom/getjar/sdk/data/usage/UsageDatabase;->_Instance:Lcom/getjar/sdk/data/usage/UsageDatabase;

    if-nez v0, :cond_1

    new-instance v0, Lcom/getjar/sdk/data/usage/UsageDatabase;

    const-string v2, "GetJarDBUsage"

    invoke-direct {v0, p0, v2}, Lcom/getjar/sdk/data/usage/UsageDatabase;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    sput-object v0, Lcom/getjar/sdk/data/usage/UsageDatabase;->_Instance:Lcom/getjar/sdk/data/usage/UsageDatabase;

    .line 31
    :cond_1
    sget-object v0, Lcom/getjar/sdk/data/usage/UsageDatabase;->_Instance:Lcom/getjar/sdk/data/usage/UsageDatabase;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit v1

    return-object v0
.end method

.method private getLatestStartApplicationSessionId(Ljava/lang/String;)Ljava/lang/String;
    .locals 12
    .param p1, "packageName"    # Ljava/lang/String;

    .prologue
    .line 593
    const/4 v9, 0x0

    .line 594
    .local v9, "applicationSessionId":Ljava/lang/String;
    const/4 v11, 0x0

    .line 596
    .local v11, "results":Landroid/database/Cursor;
    :try_start_0
    invoke-virtual {p0}, Lcom/getjar/sdk/data/usage/UsageDatabase;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string v1, "appSessions"

    sget-object v2, Lcom/getjar/sdk/data/usage/UsageDatabase;->_SessionIdColumns:[Ljava/lang/String;

    const-string v3, "packageName = ? AND type = ?"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    aput-object p1, v4, v5

    const/4 v5, 0x1

    const-string v6, "start"

    aput-object v6, v4, v5

    const/4 v5, 0x0

    const/4 v6, 0x0

    const-string v7, "timestamp DESC"

    const-string v8, "1"

    invoke-virtual/range {v0 .. v8}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v11

    .line 605
    invoke-interface {v11}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 606
    const/4 v0, 0x0

    invoke-interface {v11, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v9

    .line 607
    sget-object v0, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "Usage: UsageDatabase: getLatestStartApplicationSessionId() loaded: %1$s"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v9, v4, v5

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 611
    :cond_0
    if-eqz v11, :cond_1

    :try_start_1
    invoke-interface {v11}, Landroid/database/Cursor;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    const/4 v11, 0x0

    .line 616
    :cond_1
    :goto_0
    return-object v9

    .line 612
    :catch_0
    move-exception v10

    .line 613
    .local v10, "e":Ljava/lang/Exception;
    sget-object v0, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    const-string v2, "Usage: UsageDatabase: getLatestStartApplicationSessionId() failed"

    invoke-static {v0, v1, v2, v10}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 610
    .end local v10    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v0

    .line 611
    if-eqz v11, :cond_2

    :try_start_2
    invoke-interface {v11}, Landroid/database/Cursor;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    const/4 v11, 0x0

    .line 614
    :cond_2
    :goto_1
    throw v0

    .line 612
    :catch_1
    move-exception v10

    .line 613
    .restart local v10    # "e":Ljava/lang/Exception;
    sget-object v1, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "Usage: UsageDatabase: getLatestStartApplicationSessionId() failed"

    invoke-static {v1, v2, v3, v10}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1
.end method

.method private getLatestStopApplicationSessionId(Ljava/lang/String;)Ljava/lang/String;
    .locals 12
    .param p1, "packageName"    # Ljava/lang/String;

    .prologue
    .line 564
    const/4 v9, 0x0

    .line 565
    .local v9, "applicationSessionId":Ljava/lang/String;
    const/4 v11, 0x0

    .line 567
    .local v11, "results":Landroid/database/Cursor;
    :try_start_0
    invoke-virtual {p0}, Lcom/getjar/sdk/data/usage/UsageDatabase;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string v1, "appSessions"

    sget-object v2, Lcom/getjar/sdk/data/usage/UsageDatabase;->_SessionIdColumns:[Ljava/lang/String;

    const-string v3, "packageName = ? AND type = ?"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    aput-object p1, v4, v5

    const/4 v5, 0x1

    const-string v6, "stop"

    aput-object v6, v4, v5

    const/4 v5, 0x0

    const/4 v6, 0x0

    const-string v7, "timestamp DESC"

    const-string v8, "1"

    invoke-virtual/range {v0 .. v8}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v11

    .line 576
    invoke-interface {v11}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 577
    const/4 v0, 0x0

    invoke-interface {v11, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v9

    .line 578
    sget-object v0, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "Usage: UsageDatabase: getLatestStopApplicationSessionId() loaded: %1$s"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v9, v4, v5

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 582
    :cond_0
    if-eqz v11, :cond_1

    :try_start_1
    invoke-interface {v11}, Landroid/database/Cursor;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    const/4 v11, 0x0

    .line 587
    :cond_1
    :goto_0
    return-object v9

    .line 583
    :catch_0
    move-exception v10

    .line 584
    .local v10, "e":Ljava/lang/Exception;
    sget-object v0, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    const-string v2, "Usage: UsageDatabase: getLatestStopApplicationSessionId() failed"

    invoke-static {v0, v1, v2, v10}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 581
    .end local v10    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v0

    .line 582
    if-eqz v11, :cond_2

    :try_start_2
    invoke-interface {v11}, Landroid/database/Cursor;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    const/4 v11, 0x0

    .line 585
    :cond_2
    :goto_1
    throw v0

    .line 583
    :catch_1
    move-exception v10

    .line 584
    .restart local v10    # "e":Ljava/lang/Exception;
    sget-object v1, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "Usage: UsageDatabase: getLatestStopApplicationSessionId() failed"

    invoke-static {v1, v2, v3, v10}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1
.end method

.method private getPhoneSessionStart(Ljava/lang/String;)Lcom/getjar/sdk/data/usage/PhoneSessionEvent;
    .locals 12
    .param p1, "phoneSessionId"    # Ljava/lang/String;

    .prologue
    .line 751
    const/4 v11, 0x0

    .line 752
    .local v11, "result":Lcom/getjar/sdk/data/usage/PhoneSessionEvent;
    const/4 v9, 0x0

    .line 755
    .local v9, "dbResults":Landroid/database/Cursor;
    :try_start_0
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "00000000-0000-0000-0000-000000000000"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 758
    :cond_0
    invoke-virtual {p0}, Lcom/getjar/sdk/data/usage/UsageDatabase;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string v1, "phoneSessions"

    const/4 v2, 0x0

    const-string v3, "type = \'start\' AND disposable = 0"

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const-string v7, "timestamp DESC"

    const-string v8, "1"

    invoke-virtual/range {v0 .. v8}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v9

    .line 779
    :goto_0
    invoke-interface {v9}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 780
    invoke-static {v9}, Lcom/getjar/sdk/data/usage/PhoneSessionEvent;->loadFromDB(Landroid/database/Cursor;)Lcom/getjar/sdk/data/usage/PhoneSessionEvent;

    move-result-object v11

    .line 781
    sget-object v0, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "Usage: UsageDatabase: getPhoneSession() loaded: %1$s"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v11, v4, v5

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 786
    :cond_1
    if-eqz v9, :cond_2

    :try_start_1
    invoke-interface {v9}, Landroid/database/Cursor;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    const/4 v9, 0x0

    .line 791
    :cond_2
    :goto_1
    return-object v11

    .line 769
    :cond_3
    :try_start_2
    invoke-virtual {p0}, Lcom/getjar/sdk/data/usage/UsageDatabase;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string v1, "phoneSessions"

    const/4 v2, 0x0

    const-string v3, "type = \'start\' AND sessionId = ?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    aput-object p1, v4, v5

    const/4 v5, 0x0

    const/4 v6, 0x0

    const-string v7, "timestamp DESC"

    const-string v8, "1"

    invoke-virtual/range {v0 .. v8}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v9

    goto :goto_0

    .line 787
    :catch_0
    move-exception v10

    .line 788
    .local v10, "e":Ljava/lang/Exception;
    sget-object v0, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    const-string v2, "Usage: UsageDatabase: getPhoneSession() failed"

    invoke-static {v0, v1, v2, v10}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 785
    .end local v10    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v0

    .line 786
    if-eqz v9, :cond_4

    :try_start_3
    invoke-interface {v9}, Landroid/database/Cursor;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    const/4 v9, 0x0

    .line 789
    :cond_4
    :goto_2
    throw v0

    .line 787
    :catch_1
    move-exception v10

    .line 788
    .restart local v10    # "e":Ljava/lang/Exception;
    sget-object v1, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "Usage: UsageDatabase: getPhoneSession() failed"

    invoke-static {v1, v2, v3, v10}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_2
.end method

.method private getRecordCount(Ljava/lang/String;)J
    .locals 8
    .param p1, "tableName"    # Ljava/lang/String;

    .prologue
    .line 159
    invoke-virtual {p0}, Lcom/getjar/sdk/data/usage/UsageDatabase;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "SELECT count(*) FROM %1$s"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v0

    .line 161
    .local v0, "dbStatement":Landroid/database/sqlite/SQLiteStatement;
    :try_start_0
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteStatement;->simpleQueryForLong()J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-wide v2

    .line 163
    :try_start_1
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteStatement;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    :goto_0
    return-wide v2

    :catch_0
    move-exception v1

    .local v1, "e":Ljava/lang/Exception;
    sget-object v4, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    sget-object v6, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    or-long/2addr v4, v6

    const-string v6, "SQLiteStatement.close() failed"

    invoke-static {v4, v5, v6, v1}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .end local v1    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v2

    :try_start_2
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteStatement;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    :goto_1
    throw v2

    :catch_1
    move-exception v1

    .restart local v1    # "e":Ljava/lang/Exception;
    sget-object v3, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    const-string v5, "SQLiteStatement.close() failed"

    invoke-static {v3, v4, v5, v1}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1
.end method

.method private setRecordAsSynced(Ljava/lang/String;J)V
    .locals 8
    .param p1, "tableName"    # Ljava/lang/String;
    .param p2, "id"    # J

    .prologue
    const/4 v7, 0x0

    const/4 v5, 0x1

    .line 188
    invoke-direct {p0, p1, p2, p3}, Lcom/getjar/sdk/data/usage/UsageDatabase;->checkForRecord(Ljava/lang/String;J)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 190
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 191
    .local v0, "values":Landroid/content/ContentValues;
    const-string v1, "synced"

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 192
    invoke-virtual {p0}, Lcom/getjar/sdk/data/usage/UsageDatabase;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "id = %1$d"

    new-array v4, v5, [Ljava/lang/Object;

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    aput-object v5, v4, v7

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v1, p1, v0, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 198
    .end local v0    # "values":Landroid/content/ContentValues;
    :goto_0
    return-void

    .line 196
    :cond_0
    sget-object v1, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "Usage: UsageDatabase: setRecordAsSynced() failed to find record %1$d"

    new-array v5, v5, [Ljava/lang/Object;

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    aput-object v6, v5, v7

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;)V

    goto :goto_0
.end method

.method private setSessionAsDisposable(Ljava/lang/String;Ljava/lang/String;)V
    .locals 10
    .param p1, "tableName"    # Ljava/lang/String;
    .param p2, "sessionId"    # Ljava/lang/String;

    .prologue
    const/4 v9, 0x0

    const/4 v8, 0x1

    .line 202
    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    .line 203
    .local v1, "values":Landroid/content/ContentValues;
    const-string v2, "disposable"

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 204
    invoke-virtual {p0}, Lcom/getjar/sdk/data/usage/UsageDatabase;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    const-string v3, "sessionId = ? AND disposable != 1"

    new-array v4, v8, [Ljava/lang/String;

    aput-object p2, v4, v9

    invoke-virtual {v2, p1, v1, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    .line 205
    .local v0, "updateCount":I
    if-lez v0, :cond_0

    .line 206
    sget-object v2, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "Usage: UsageDatabase: setSessionAsDisposable() %1$d non-disposable record(s) in %2$s for session ID %3$s, updated as \'disposable\'"

    const/4 v6, 0x3

    new-array v6, v6, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v9

    aput-object p1, v6, v8

    const/4 v7, 0x2

    aput-object p2, v6, v7

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 212
    :cond_0
    return-void
.end method

.method private trimLruEntries(Ljava/lang/String;I)V
    .locals 11
    .param p1, "tableName"    # Ljava/lang/String;
    .param p2, "maxRecordsCap"    # I

    .prologue
    .line 131
    if-gez p2, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'maxRecordsCap\' can not be negative"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 132
    :cond_0
    invoke-direct {p0, p1}, Lcom/getjar/sdk/data/usage/UsageDatabase;->getRecordCount(Ljava/lang/String;)J

    move-result-wide v0

    int-to-long v2, p2

    cmp-long v0, v0, v2

    if-gez v0, :cond_2

    .line 155
    :cond_1
    :goto_0
    return-void

    .line 134
    :cond_2
    const/4 v9, 0x0

    .line 135
    .local v9, "id":Ljava/lang/Long;
    const/4 v10, 0x0

    .line 137
    .local v10, "results":Landroid/database/Cursor;
    :try_start_0
    invoke-virtual {p0}, Lcom/getjar/sdk/data/usage/UsageDatabase;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v3, "id"

    aput-object v3, v2, v1

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const-string v7, "timestamp DESC"

    move-object v1, p1

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v10

    .line 145
    invoke-interface {v10, p2}, Landroid/database/Cursor;->moveToPosition(I)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 146
    const/4 v0, 0x0

    invoke-interface {v10, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v9

    .line 149
    :cond_3
    if-eqz v10, :cond_4

    :try_start_1
    invoke-interface {v10}, Landroid/database/Cursor;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    const/4 v10, 0x0

    .line 151
    :cond_4
    :goto_1
    invoke-virtual {p0}, Lcom/getjar/sdk/data/usage/UsageDatabase;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v2, "id <= %1$d"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v9, v3, v4

    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, p1, v1, v2}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v8

    .line 152
    .local v8, "count":I
    if-lez v8, :cond_1

    .line 153
    sget-object v0, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "Usage: UsageDatabase: trimLruEntries() %1$d LRU rows deleted form %2$s"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x1

    aput-object p1, v4, v5

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    goto :goto_0

    .line 149
    .end local v8    # "count":I
    :catchall_0
    move-exception v0

    if-eqz v10, :cond_5

    :try_start_2
    invoke-interface {v10}, Landroid/database/Cursor;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    const/4 v10, 0x0

    :cond_5
    :goto_2
    throw v0

    :catch_0
    move-exception v0

    goto :goto_1

    :catch_1
    move-exception v1

    goto :goto_2
.end method


# virtual methods
.method public appSessionGetRecordCount()J
    .locals 4

    .prologue
    .line 216
    iget-object v1, p0, Lcom/getjar/sdk/data/usage/UsageDatabase;->_databaseAccessLock:Ljava/lang/Object;

    monitor-enter v1

    .line 217
    :try_start_0
    const-string v0, "appSessions"

    invoke-direct {p0, v0}, Lcom/getjar/sdk/data/usage/UsageDatabase;->getRecordCount(Ljava/lang/String;)J

    move-result-wide v2

    monitor-exit v1

    return-wide v2

    .line 218
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method protected appSessionLoad(J)Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;
    .locals 12
    .param p1, "rowId"    # J

    .prologue
    .line 531
    iget-object v11, p0, Lcom/getjar/sdk/data/usage/UsageDatabase;->_databaseAccessLock:Ljava/lang/Object;

    monitor-enter v11

    .line 532
    const/4 v9, 0x0

    .line 533
    .local v9, "event":Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;
    const/4 v10, 0x0

    .line 535
    .local v10, "results":Landroid/database/Cursor;
    :try_start_0
    invoke-virtual {p0}, Lcom/getjar/sdk/data/usage/UsageDatabase;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string v1, "appSessions"

    const/4 v2, 0x0

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "id = %1$d"

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

    .line 536
    invoke-interface {v10}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 537
    invoke-static {v10}, Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;->loadFromDB(Landroid/database/Cursor;)Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    move-result-object v9

    .line 541
    :cond_0
    if-eqz v10, :cond_1

    :try_start_1
    invoke-interface {v10}, Landroid/database/Cursor;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const/4 v10, 0x0

    .line 546
    :cond_1
    :goto_0
    :try_start_2
    monitor-exit v11

    return-object v9

    .line 542
    :catch_0
    move-exception v8

    .line 543
    .local v8, "e":Ljava/lang/Exception;
    sget-object v0, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    const-string v2, "Usage: UsageDatabase: appSessionLoad() failed"

    invoke-static {v0, v1, v2, v8}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 547
    .end local v8    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v0

    monitor-exit v11
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0

    .line 540
    :catchall_1
    move-exception v0

    .line 541
    if-eqz v10, :cond_2

    :try_start_3
    invoke-interface {v10}, Landroid/database/Cursor;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    const/4 v10, 0x0

    .line 544
    :cond_2
    :goto_1
    :try_start_4
    throw v0

    .line 542
    :catch_1
    move-exception v8

    .line 543
    .restart local v8    # "e":Ljava/lang/Exception;
    sget-object v1, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "Usage: UsageDatabase: appSessionLoad() failed"

    invoke-static {v1, v2, v3, v8}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_1
.end method

.method public appSessionLoadOpenStartLists()Lcom/getjar/sdk/data/usage/ApplicationLists;
    .locals 17

    .prologue
    .line 260
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getjar/sdk/data/usage/UsageDatabase;->_databaseAccessLock:Ljava/lang/Object;

    move-object/from16 v16, v0

    monitor-enter v16

    .line 261
    :try_start_0
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 262
    .local v11, "newerList":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;>;"
    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    .line 263
    .local v12, "olderList":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;>;"
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    move-result-wide v1

    const-wide/32 v3, 0x4ef6d80

    sub-long v14, v1, v3

    .line 265
    .local v14, "thresholdTimestamp":J
    const/4 v13, 0x0

    .line 269
    .local v13, "results":Landroid/database/Cursor;
    :try_start_1
    invoke-virtual/range {p0 .. p0}, Lcom/getjar/sdk/data/usage/UsageDatabase;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    const-string v2, "appSessions"

    const/4 v3, 0x0

    const-string v4, "type = \'start\' AND disposable = 0"

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-virtual/range {v1 .. v8}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v13

    .line 279
    :cond_0
    :goto_0
    invoke-interface {v13}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 280
    invoke-static {v13}, Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;->loadFromDB(Landroid/database/Cursor;)Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;

    move-result-object v9

    .line 283
    .local v9, "appSessionEvent":Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;
    invoke-virtual {v9}, Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;->getTimestamp()J

    move-result-wide v1

    cmp-long v1, v1, v14

    if-ltz v1, :cond_2

    .line 284
    invoke-interface {v11, v9}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 285
    invoke-interface {v11, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 301
    .end local v9    # "appSessionEvent":Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;
    :catchall_0
    move-exception v1

    .line 302
    if-eqz v13, :cond_1

    :try_start_2
    invoke-interface {v13}, Landroid/database/Cursor;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    const/4 v13, 0x0

    .line 305
    :cond_1
    :goto_1
    :try_start_3
    throw v1

    .line 309
    .end local v11    # "newerList":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;>;"
    .end local v12    # "olderList":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;>;"
    .end local v13    # "results":Landroid/database/Cursor;
    .end local v14    # "thresholdTimestamp":J
    :catchall_1
    move-exception v1

    monitor-exit v16
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw v1

    .line 288
    .restart local v9    # "appSessionEvent":Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;
    .restart local v11    # "newerList":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;>;"
    .restart local v12    # "olderList":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;>;"
    .restart local v13    # "results":Landroid/database/Cursor;
    .restart local v14    # "thresholdTimestamp":J
    :cond_2
    :try_start_4
    invoke-interface {v12, v9}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 289
    invoke-interface {v12, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_0

    .line 296
    .end local v9    # "appSessionEvent":Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;
    :cond_3
    :try_start_5
    invoke-interface {v13}, Landroid/database/Cursor;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    const/4 v13, 0x0

    .line 302
    :goto_2
    if-eqz v13, :cond_4

    :try_start_6
    invoke-interface {v13}, Landroid/database/Cursor;->close()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_1
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    const/4 v13, 0x0

    .line 308
    :cond_4
    :goto_3
    :try_start_7
    new-instance v1, Lcom/getjar/sdk/data/usage/ApplicationLists;

    invoke-direct {v1, v11, v12}, Lcom/getjar/sdk/data/usage/ApplicationLists;-><init>(Ljava/util/List;Ljava/util/List;)V

    monitor-exit v16
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    return-object v1

    .line 297
    :catch_0
    move-exception v10

    .line 298
    .local v10, "e":Ljava/lang/Exception;
    :try_start_8
    sget-object v1, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "Usage: UsageDatabase: appSessionLoadUnsynced() failed"

    invoke-static {v1, v2, v3, v10}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    goto :goto_2

    .line 303
    .end local v10    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v10

    .line 304
    .restart local v10    # "e":Ljava/lang/Exception;
    :try_start_9
    sget-object v1, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "Usage: UsageDatabase: appSessionLoadUnsynced() failed"

    invoke-static {v1, v2, v3, v10}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_3

    .line 303
    .end local v10    # "e":Ljava/lang/Exception;
    :catch_2
    move-exception v10

    .line 304
    .restart local v10    # "e":Ljava/lang/Exception;
    sget-object v2, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    const-string v4, "Usage: UsageDatabase: appSessionLoadUnsynced() failed"

    invoke-static {v2, v3, v4, v10}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    goto :goto_1
.end method

.method public appSessionLoadOpenStartPackageNames()Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 458
    iget-object v4, p0, Lcom/getjar/sdk/data/usage/UsageDatabase;->_databaseAccessLock:Ljava/lang/Object;

    monitor-enter v4

    .line 459
    :try_start_0
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 460
    .local v2, "resultList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-direct {p0}, Lcom/getjar/sdk/data/usage/UsageDatabase;->appSessionLoadOpenStartsInternal()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;

    .line 461
    .local v0, "event":Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;
    invoke-virtual {v0}, Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 464
    .end local v0    # "event":Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "resultList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :catchall_0
    move-exception v3

    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v3

    .line 463
    .restart local v1    # "i$":Ljava/util/Iterator;
    .restart local v2    # "resultList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_0
    :try_start_1
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    return-object v2
.end method

.method protected appSessionLoadOpenStarts()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;",
            ">;"
        }
    .end annotation

    .prologue
    .line 504
    iget-object v1, p0, Lcom/getjar/sdk/data/usage/UsageDatabase;->_databaseAccessLock:Ljava/lang/Object;

    monitor-enter v1

    .line 505
    :try_start_0
    invoke-direct {p0}, Lcom/getjar/sdk/data/usage/UsageDatabase;->appSessionLoadOpenStartsInternal()Ljava/util/List;

    move-result-object v0

    monitor-exit v1

    return-object v0

    .line 506
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method protected appSessionLoadStartRecord(Ljava/lang/String;)Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;
    .locals 12
    .param p1, "stopEventSessionId"    # Ljava/lang/String;

    .prologue
    .line 469
    iget-object v11, p0, Lcom/getjar/sdk/data/usage/UsageDatabase;->_databaseAccessLock:Ljava/lang/Object;

    monitor-enter v11

    .line 470
    const/4 v10, 0x0

    .line 471
    .local v10, "startEvent":Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;
    const/4 v9, 0x0

    .line 473
    .local v9, "results":Landroid/database/Cursor;
    :try_start_0
    invoke-virtual {p0}, Lcom/getjar/sdk/data/usage/UsageDatabase;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string v1, "appSessions"

    const/4 v2, 0x0

    const-string v3, "sessionId = ? AND type = \'start\'"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    aput-object p1, v4, v5

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v9

    .line 481
    invoke-interface {v9}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 482
    invoke-static {v9}, Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;->loadFromDB(Landroid/database/Cursor;)Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    move-result-object v10

    .line 486
    :cond_0
    if-eqz v9, :cond_1

    :try_start_1
    invoke-interface {v9}, Landroid/database/Cursor;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const/4 v9, 0x0

    .line 491
    :cond_1
    :goto_0
    :try_start_2
    monitor-exit v11

    return-object v10

    .line 487
    :catch_0
    move-exception v8

    .line 488
    .local v8, "e":Ljava/lang/Exception;
    sget-object v0, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    const-string v2, "Usage: UsageDatabase: appSessionLoadStartRecord() failed"

    invoke-static {v0, v1, v2, v8}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 492
    .end local v8    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v0

    monitor-exit v11
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0

    .line 485
    :catchall_1
    move-exception v0

    .line 486
    if-eqz v9, :cond_2

    :try_start_3
    invoke-interface {v9}, Landroid/database/Cursor;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    const/4 v9, 0x0

    .line 489
    :cond_2
    :goto_1
    :try_start_4
    throw v0

    .line 487
    :catch_1
    move-exception v8

    .line 488
    .restart local v8    # "e":Ljava/lang/Exception;
    sget-object v1, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "Usage: UsageDatabase: appSessionLoadStartRecord() failed"

    invoke-static {v1, v2, v3, v8}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_1
.end method

.method public appSessionLoadUnsynced()Ljava/util/List;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;",
            ">;"
        }
    .end annotation

    .prologue
    .line 230
    iget-object v11, p0, Lcom/getjar/sdk/data/usage/UsageDatabase;->_databaseAccessLock:Ljava/lang/Object;

    monitor-enter v11

    .line 232
    :try_start_0
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 233
    .local v8, "appSessionList":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;>;"
    const/4 v10, 0x0

    .line 235
    .local v10, "results":Landroid/database/Cursor;
    :try_start_1
    invoke-virtual {p0}, Lcom/getjar/sdk/data/usage/UsageDatabase;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string v1, "appSessions"

    const/4 v2, 0x0

    const-string v3, "synced = 0"

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v10

    .line 236
    :goto_0
    invoke-interface {v10}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 237
    invoke-static {v10}, Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;->loadFromDB(Landroid/database/Cursor;)Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;

    move-result-object v0

    invoke-interface {v8, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 240
    :catchall_0
    move-exception v0

    .line 241
    if-eqz v10, :cond_0

    :try_start_2
    invoke-interface {v10}, Landroid/database/Cursor;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    const/4 v10, 0x0

    .line 244
    :cond_0
    :goto_1
    :try_start_3
    throw v0

    .line 247
    .end local v8    # "appSessionList":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;>;"
    .end local v10    # "results":Landroid/database/Cursor;
    :catchall_1
    move-exception v0

    monitor-exit v11
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw v0

    .line 241
    .restart local v8    # "appSessionList":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;>;"
    .restart local v10    # "results":Landroid/database/Cursor;
    :cond_1
    if-eqz v10, :cond_2

    :try_start_4
    invoke-interface {v10}, Landroid/database/Cursor;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    const/4 v10, 0x0

    .line 246
    :cond_2
    :goto_2
    :try_start_5
    monitor-exit v11

    return-object v8

    .line 242
    :catch_0
    move-exception v9

    .line 243
    .local v9, "e":Ljava/lang/Exception;
    sget-object v0, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    const-string v2, "Usage: UsageDatabase: appSessionLoadUnsynced() failed"

    invoke-static {v0, v1, v2, v9}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_2

    .line 242
    .end local v9    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v9

    .line 243
    .restart local v9    # "e":Ljava/lang/Exception;
    sget-object v1, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "Usage: UsageDatabase: appSessionLoadUnsynced() failed"

    invoke-static {v1, v2, v3, v9}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    goto :goto_1
.end method

.method protected appSessionSetAsSynced(J)V
    .locals 2
    .param p1, "id"    # J

    .prologue
    .line 223
    iget-object v1, p0, Lcom/getjar/sdk/data/usage/UsageDatabase;->_databaseAccessLock:Ljava/lang/Object;

    monitor-enter v1

    .line 224
    :try_start_0
    const-string v0, "appSessions"

    invoke-direct {p0, v0, p1, p2}, Lcom/getjar/sdk/data/usage/UsageDatabase;->setRecordAsSynced(Ljava/lang/String;J)V

    .line 225
    monitor-exit v1

    .line 226
    return-void

    .line 225
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method protected appSessionStart(Ljava/lang/String;Lcom/getjar/sdk/data/usage/SessionEvent$Reason;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;)J
    .locals 12
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "reason"    # Lcom/getjar/sdk/data/usage/SessionEvent$Reason;
    .param p3, "reasonDetails"    # Ljava/lang/String;
    .param p4, "eventTimestamp"    # J
    .param p6, "phoneSessionId"    # Ljava/lang/String;
    .param p7, "appSessionId"    # Ljava/lang/String;

    .prologue
    .line 320
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "\'packageName\' cannot be NULL or empty"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 321
    :cond_0
    if-nez p2, :cond_1

    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "\'reason\' cannot be NULL"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 322
    :cond_1
    invoke-static/range {p6 .. p6}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "\'phoneSessionId\' cannot be NULL or empty"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 323
    :cond_2
    invoke-static/range {p7 .. p7}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3

    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "\'appSessionId\' cannot be NULL or empty"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 326
    :cond_3
    const-wide/16 v1, -0x1

    .line 327
    .local v1, "rowId":J
    iget-object v5, p0, Lcom/getjar/sdk/data/usage/UsageDatabase;->_databaseAccessLock:Ljava/lang/Object;

    monitor-enter v5

    .line 330
    :try_start_0
    new-instance v3, Landroid/content/ContentValues;

    invoke-direct {v3}, Landroid/content/ContentValues;-><init>()V

    .line 331
    .local v3, "values":Landroid/content/ContentValues;
    const-string v4, "packageName"

    invoke-virtual {v3, v4, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 332
    const-string v4, "timestamp"

    invoke-static/range {p4 .. p5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-virtual {v3, v4, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 333
    const-string v4, "type"

    const-string v6, "start"

    invoke-virtual {v3, v4, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 334
    const-string v4, "reason"

    invoke-virtual {p2}, Lcom/getjar/sdk/data/usage/SessionEvent$Reason;->name()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v4, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 335
    invoke-static {p3}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_4

    .line 336
    const-string v4, "reasonDetails"

    invoke-virtual {v3, v4, p3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 338
    :cond_4
    const-string v4, "sessionId"

    move-object/from16 v0, p7

    invoke-virtual {v3, v4, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 339
    const-string v4, "phoneSessionId"

    move-object/from16 v0, p6

    invoke-virtual {v3, v4, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 340
    const-string v4, "synced"

    const/4 v6, 0x0

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v3, v4, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 341
    const-string v4, "disposable"

    const/4 v6, 0x0

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v3, v4, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 344
    invoke-virtual {p0}, Lcom/getjar/sdk/data/usage/UsageDatabase;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v4

    const-string v6, "appSessions"

    const/4 v7, 0x0

    invoke-virtual {v4, v6, v7, v3}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v1

    .line 345
    sget-object v4, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    sget-object v4, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v8

    or-long/2addr v6, v8

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v8, "Usage: UsageDatabase: appSessionStart() [packageName:%1$s timestamp:%2$d sessionId:%3$s phoneSessionId:%4$s]"

    const/4 v9, 0x4

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    aput-object p1, v9, v10

    const/4 v10, 0x1

    invoke-static/range {p4 .. p5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    aput-object v11, v9, v10

    const/4 v10, 0x2

    aput-object p7, v9, v10

    const/4 v10, 0x3

    aput-object p6, v9, v10

    invoke-static {v4, v8, v9}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v6, v7, v4}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 351
    monitor-exit v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 352
    invoke-virtual {p0}, Lcom/getjar/sdk/data/usage/UsageDatabase;->trimLruEntries()V

    .line 353
    return-wide v1

    .line 351
    .end local v3    # "values":Landroid/content/ContentValues;
    :catchall_0
    move-exception v4

    :try_start_1
    monitor-exit v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v4
.end method

.method protected appSessionStop(Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;Lcom/getjar/sdk/data/usage/SessionEvent$Reason;Ljava/lang/String;J)J
    .locals 14
    .param p1, "startEvent"    # Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;
    .param p2, "reason"    # Lcom/getjar/sdk/data/usage/SessionEvent$Reason;
    .param p3, "reasonDetails"    # Ljava/lang/String;
    .param p4, "eventTime"    # J

    .prologue
    .line 412
    if-nez p1, :cond_0

    new-instance v6, Ljava/lang/IllegalArgumentException;

    const-string v7, "\'startEvent\' cannot be NULL"

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 413
    :cond_0
    sget-object v6, Lcom/getjar/sdk/data/usage/SessionEvent$Type;->start:Lcom/getjar/sdk/data/usage/SessionEvent$Type;

    invoke-virtual {p1}, Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;->getType()Lcom/getjar/sdk/data/usage/SessionEvent$Type;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/getjar/sdk/data/usage/SessionEvent$Type;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_1

    new-instance v6, Ljava/lang/IllegalArgumentException;

    const-string v7, "\'startEvent\' must be a \'start\' record"

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 414
    :cond_1
    if-nez p2, :cond_2

    new-instance v6, Ljava/lang/IllegalArgumentException;

    const-string v7, "\'reason\' cannot be NULL"

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 415
    :cond_2
    const-wide/16 v6, 0x0

    cmp-long v6, p4, v6

    if-gez v6, :cond_3

    new-instance v6, Ljava/lang/IllegalArgumentException;

    const-string v7, "\'eventTime\' cannot be less than zero"

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 417
    :cond_3
    const-wide/16 v1, -0x1

    .line 418
    .local v1, "rowId":J
    iget-object v7, p0, Lcom/getjar/sdk/data/usage/UsageDatabase;->_databaseAccessLock:Ljava/lang/Object;

    monitor-enter v7

    .line 421
    :try_start_0
    const-string v6, "appSessions"

    invoke-virtual {p1}, Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;->getSessionId()Ljava/lang/String;

    move-result-object v8

    invoke-direct {p0, v6, v8}, Lcom/getjar/sdk/data/usage/UsageDatabase;->setSessionAsDisposable(Ljava/lang/String;Ljava/lang/String;)V

    .line 424
    move-wide/from16 v3, p4

    .line 425
    .local v3, "stopTime":J
    const-wide/16 v8, 0x0

    cmp-long v6, v3, v8

    if-lez v6, :cond_4

    invoke-virtual {p1}, Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;->getTimestamp()J

    move-result-wide v8

    cmp-long v6, v3, v8

    if-gez v6, :cond_4

    .line 426
    invoke-virtual {p1}, Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;->getTimestamp()J

    move-result-wide v3

    .line 430
    :cond_4
    new-instance v5, Landroid/content/ContentValues;

    invoke-direct {v5}, Landroid/content/ContentValues;-><init>()V

    .line 431
    .local v5, "values":Landroid/content/ContentValues;
    const-string v6, "packageName"

    invoke-virtual {p1}, Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;->getPackageName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v6, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 432
    const-string v6, "timestamp"

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-virtual {v5, v6, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 433
    const-string v6, "type"

    const-string v8, "stop"

    invoke-virtual {v5, v6, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 434
    const-string v6, "reason"

    invoke-virtual/range {p2 .. p2}, Lcom/getjar/sdk/data/usage/SessionEvent$Reason;->name()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v6, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 435
    invoke-static/range {p3 .. p3}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_5

    .line 436
    const-string v6, "reasonDetails"

    move-object/from16 v0, p3

    invoke-virtual {v5, v6, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 438
    :cond_5
    const-string v6, "sessionId"

    invoke-virtual {p1}, Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;->getSessionId()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v6, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 439
    const-string v6, "phoneSessionId"

    invoke-virtual {p1}, Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;->getPhoneSessionId()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v6, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 440
    const-string v6, "synced"

    const/4 v8, 0x0

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v5, v6, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 441
    const-string v6, "disposable"

    const/4 v8, 0x1

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v5, v6, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 444
    invoke-virtual {p0}, Lcom/getjar/sdk/data/usage/UsageDatabase;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v6

    const-string v8, "appSessions"

    const/4 v9, 0x0

    invoke-virtual {v6, v8, v9, v5}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v1

    .line 445
    sget-object v6, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v8

    sget-object v6, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v10

    or-long/2addr v8, v10

    sget-object v6, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v10, "Usage: UsageDatabase: appSessionStop() [packageName:%1$s timestamp:%2$d sessionId:%3$s phoneSessionId:%4$s]"

    const/4 v11, 0x4

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    invoke-virtual {p1}, Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;->getPackageName()Ljava/lang/String;

    move-result-object v13

    aput-object v13, v11, v12

    const/4 v12, 0x1

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v13

    aput-object v13, v11, v12

    const/4 v12, 0x2

    invoke-virtual {p1}, Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;->getSessionId()Ljava/lang/String;

    move-result-object v13

    aput-object v13, v11, v12

    const/4 v12, 0x3

    invoke-virtual {p1}, Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;->getPhoneSessionId()Ljava/lang/String;

    move-result-object v13

    aput-object v13, v11, v12

    invoke-static {v6, v10, v11}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v8, v9, v6}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 451
    monitor-exit v7
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 452
    invoke-virtual {p0}, Lcom/getjar/sdk/data/usage/UsageDatabase;->trimLruEntries()V

    .line 453
    return-wide v1

    .line 451
    .end local v3    # "stopTime":J
    .end local v5    # "values":Landroid/content/ContentValues;
    :catchall_0
    move-exception v6

    :try_start_1
    monitor-exit v7
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v6
.end method

.method protected appSessionStop(Ljava/lang/String;Lcom/getjar/sdk/data/usage/SessionEvent$Reason;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;)J
    .locals 13
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "reason"    # Lcom/getjar/sdk/data/usage/SessionEvent$Reason;
    .param p3, "reasonDetails"    # Ljava/lang/String;
    .param p4, "eventTimestamp"    # J
    .param p6, "phoneSessionId"    # Ljava/lang/String;
    .param p7, "appSessionId"    # Ljava/lang/String;

    .prologue
    .line 360
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "\'packageName\' cannot be NULL or empty"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 361
    :cond_0
    if-nez p2, :cond_1

    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "\'reason\' cannot be NULL"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 362
    :cond_1
    invoke-static/range {p6 .. p6}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2

    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "\'phoneSessionId\' cannot be NULL or empty"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 365
    :cond_2
    const-wide/16 v1, -0x1

    .line 366
    .local v1, "rowId":J
    iget-object v6, p0, Lcom/getjar/sdk/data/usage/UsageDatabase;->_databaseAccessLock:Ljava/lang/Object;

    monitor-enter v6

    .line 369
    move-object/from16 v3, p7

    .line 370
    .local v3, "sessionId":Ljava/lang/String;
    :try_start_0
    invoke-static {v3}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 371
    invoke-direct {p0, p1}, Lcom/getjar/sdk/data/usage/UsageDatabase;->getCurrentApplicationSessionId(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 375
    :cond_3
    const-string v5, "appSessions"

    invoke-direct {p0, v5, v3}, Lcom/getjar/sdk/data/usage/UsageDatabase;->setSessionAsDisposable(Ljava/lang/String;Ljava/lang/String;)V

    .line 378
    new-instance v4, Landroid/content/ContentValues;

    invoke-direct {v4}, Landroid/content/ContentValues;-><init>()V

    .line 379
    .local v4, "values":Landroid/content/ContentValues;
    const-string v5, "packageName"

    invoke-virtual {v4, v5, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 380
    const-string v5, "timestamp"

    invoke-static/range {p4 .. p5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-virtual {v4, v5, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 381
    const-string v5, "type"

    const-string v7, "stop"

    invoke-virtual {v4, v5, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 382
    const-string v5, "reason"

    invoke-virtual {p2}, Lcom/getjar/sdk/data/usage/SessionEvent$Reason;->name()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v5, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 383
    invoke-static/range {p3 .. p3}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_4

    .line 384
    const-string v5, "reasonDetails"

    move-object/from16 v0, p3

    invoke-virtual {v4, v5, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 386
    :cond_4
    const-string v5, "sessionId"

    invoke-virtual {v4, v5, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 387
    const-string v5, "phoneSessionId"

    move-object/from16 v0, p6

    invoke-virtual {v4, v5, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 388
    const-string v5, "synced"

    const/4 v7, 0x0

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v4, v5, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 389
    const-string v5, "disposable"

    const/4 v7, 0x1

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v4, v5, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 392
    invoke-virtual {p0}, Lcom/getjar/sdk/data/usage/UsageDatabase;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v5

    const-string v7, "appSessions"

    const/4 v8, 0x0

    invoke-virtual {v5, v7, v8, v4}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v1

    .line 393
    sget-object v5, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    sget-object v5, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v9

    or-long/2addr v7, v9

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v9, "Usage: UsageDatabase: appSessionStop() [packageName:%1$s timestamp:%2$d sessionId:%3$s phoneSessionId:%4$s] stack:%5$s"

    const/4 v10, 0x5

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    aput-object p1, v10, v11

    const/4 v11, 0x1

    invoke-static/range {p4 .. p5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v12

    aput-object v12, v10, v11

    const/4 v11, 0x2

    aput-object v3, v10, v11

    const/4 v11, 0x3

    aput-object p6, v10, v11

    const/4 v11, 0x4

    invoke-static {}, Lcom/getjar/sdk/logging/Logger;->getShortStack()Ljava/lang/String;

    move-result-object v12

    aput-object v12, v10, v11

    invoke-static {v5, v9, v10}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v7, v8, v5}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 400
    monitor-exit v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 401
    invoke-virtual {p0}, Lcom/getjar/sdk/data/usage/UsageDatabase;->trimLruEntries()V

    .line 402
    return-wide v1

    .line 400
    .end local v4    # "values":Landroid/content/ContentValues;
    :catchall_0
    move-exception v5

    :try_start_1
    monitor-exit v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v5
.end method

.method protected deleteAppSession(J)V
    .locals 8
    .param p1, "id"    # J

    .prologue
    .line 497
    iget-object v1, p0, Lcom/getjar/sdk/data/usage/UsageDatabase;->_databaseAccessLock:Ljava/lang/Object;

    monitor-enter v1

    .line 498
    :try_start_0
    invoke-virtual {p0}, Lcom/getjar/sdk/data/usage/UsageDatabase;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string v2, "appSessions"

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "id = %1$d"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v0, v2, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 499
    monitor-exit v1

    .line 500
    return-void

    .line 499
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method protected deletePhoneSession(J)V
    .locals 8
    .param p1, "id"    # J

    .prologue
    .line 739
    iget-object v1, p0, Lcom/getjar/sdk/data/usage/UsageDatabase;->_databaseAccessLock:Ljava/lang/Object;

    monitor-enter v1

    .line 740
    :try_start_0
    invoke-virtual {p0}, Lcom/getjar/sdk/data/usage/UsageDatabase;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string v2, "phoneSessions"

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "id = %1$d"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v0, v2, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 741
    monitor-exit v1

    .line 742
    return-void

    .line 741
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method protected getNewApplicationSessionID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 313
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getNewPhoneSessionID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 655
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public declared-synchronized onCreate(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 3
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .prologue
    .line 81
    monitor-enter p0

    :try_start_0
    iget-object v2, p0, Lcom/getjar/sdk/data/usage/UsageDatabase;->_databaseAccessLock:Ljava/lang/Object;

    monitor-enter v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 82
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    :try_start_1
    sget-object v1, Lcom/getjar/sdk/data/usage/UsageDatabase;->DB_CREATE_TABLE_COMMANDS:[Ljava/lang/String;

    array-length v1, v1

    if-ge v0, v1, :cond_0

    .line 83
    sget-object v1, Lcom/getjar/sdk/data/usage/UsageDatabase;->DB_CREATE_TABLE_COMMANDS:[Ljava/lang/String;

    aget-object v1, v1, v0

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 82
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 85
    :cond_0
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 86
    monitor-exit p0

    return-void

    .line 85
    :catchall_0
    move-exception v1

    :try_start_2
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    throw v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 81
    .end local v0    # "i":I
    :catchall_1
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 12
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "oldVersion"    # I
    .param p3, "newVersion"    # I

    .prologue
    .line 90
    monitor-enter p0

    :try_start_0
    iget-object v5, p0, Lcom/getjar/sdk/data/usage/UsageDatabase;->_databaseAccessLock:Ljava/lang/Object;

    monitor-enter v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 91
    :try_start_1
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

    const-string v11, "GetJarDBUsage"

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

    .line 96
    sget-object v0, Lcom/getjar/sdk/data/usage/UsageDatabase;->DB_TABLE_NAMES:[Ljava/lang/String;

    .local v0, "arr$":[Ljava/lang/String;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v2, :cond_0

    aget-object v3, v0, v1

    .line 97
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

    .line 96
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 99
    .end local v3    # "tableName":Ljava/lang/String;
    :cond_0
    monitor-exit v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 100
    :try_start_2
    invoke-virtual {p0, p1}, Lcom/getjar/sdk/data/usage/UsageDatabase;->onCreate(Landroid/database/sqlite/SQLiteDatabase;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 101
    monitor-exit p0

    return-void

    .line 99
    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v1    # "i$":I
    .end local v2    # "len$":I
    :catchall_0
    move-exception v4

    :try_start_3
    monitor-exit v5
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    throw v4
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 90
    :catchall_1
    move-exception v4

    monitor-exit p0

    throw v4
.end method

.method public phoneSessionGetRecordCount()J
    .locals 4

    .prologue
    .line 621
    iget-object v1, p0, Lcom/getjar/sdk/data/usage/UsageDatabase;->_databaseAccessLock:Ljava/lang/Object;

    monitor-enter v1

    .line 622
    :try_start_0
    const-string v0, "phoneSessions"

    invoke-direct {p0, v0}, Lcom/getjar/sdk/data/usage/UsageDatabase;->getRecordCount(Ljava/lang/String;)J

    move-result-wide v2

    monitor-exit v1

    return-wide v2

    .line 623
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public phoneSessionLoadUnsynced()Ljava/util/List;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/getjar/sdk/data/usage/PhoneSessionEvent;",
            ">;"
        }
    .end annotation

    .prologue
    .line 634
    iget-object v11, p0, Lcom/getjar/sdk/data/usage/UsageDatabase;->_databaseAccessLock:Ljava/lang/Object;

    monitor-enter v11

    .line 636
    :try_start_0
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 637
    .local v9, "phoneSessionList":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/data/usage/PhoneSessionEvent;>;"
    const/4 v10, 0x0

    .line 639
    .local v10, "results":Landroid/database/Cursor;
    :try_start_1
    invoke-virtual {p0}, Lcom/getjar/sdk/data/usage/UsageDatabase;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string v1, "phoneSessions"

    const/4 v2, 0x0

    const-string v3, "synced = 0"

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v10

    .line 640
    :goto_0
    invoke-interface {v10}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 641
    invoke-static {v10}, Lcom/getjar/sdk/data/usage/PhoneSessionEvent;->loadFromDB(Landroid/database/Cursor;)Lcom/getjar/sdk/data/usage/PhoneSessionEvent;

    move-result-object v0

    invoke-interface {v9, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 644
    :catchall_0
    move-exception v0

    .line 645
    if-eqz v10, :cond_0

    :try_start_2
    invoke-interface {v10}, Landroid/database/Cursor;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    const/4 v10, 0x0

    .line 648
    :cond_0
    :goto_1
    :try_start_3
    throw v0

    .line 651
    .end local v9    # "phoneSessionList":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/data/usage/PhoneSessionEvent;>;"
    .end local v10    # "results":Landroid/database/Cursor;
    :catchall_1
    move-exception v0

    monitor-exit v11
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw v0

    .line 645
    .restart local v9    # "phoneSessionList":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/data/usage/PhoneSessionEvent;>;"
    .restart local v10    # "results":Landroid/database/Cursor;
    :cond_1
    if-eqz v10, :cond_2

    :try_start_4
    invoke-interface {v10}, Landroid/database/Cursor;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    const/4 v10, 0x0

    .line 650
    :cond_2
    :goto_2
    :try_start_5
    monitor-exit v11

    return-object v9

    .line 646
    :catch_0
    move-exception v8

    .line 647
    .local v8, "e":Ljava/lang/Exception;
    sget-object v0, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    const-string v2, "Usage: UsageDatabase: phoneSessionLoadUnsynced() failed"

    invoke-static {v0, v1, v2, v8}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_2

    .line 646
    .end local v8    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v8

    .line 647
    .restart local v8    # "e":Ljava/lang/Exception;
    sget-object v1, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "Usage: UsageDatabase: phoneSessionLoadUnsynced() failed"

    invoke-static {v1, v2, v3, v8}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    goto :goto_1
.end method

.method protected phoneSessionSetAsSynced(J)V
    .locals 2
    .param p1, "id"    # J

    .prologue
    .line 628
    iget-object v1, p0, Lcom/getjar/sdk/data/usage/UsageDatabase;->_databaseAccessLock:Ljava/lang/Object;

    monitor-enter v1

    .line 629
    :try_start_0
    const-string v0, "phoneSessions"

    invoke-direct {p0, v0, p1, p2}, Lcom/getjar/sdk/data/usage/UsageDatabase;->setRecordAsSynced(Ljava/lang/String;J)V

    .line 630
    monitor-exit v1

    .line 631
    return-void

    .line 630
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method protected phoneSessionStart(Lcom/getjar/sdk/data/usage/SessionEvent$Reason;Ljava/lang/String;Ljava/lang/String;)V
    .locals 11
    .param p1, "reason"    # Lcom/getjar/sdk/data/usage/SessionEvent$Reason;
    .param p2, "reasonDetails"    # Ljava/lang/String;
    .param p3, "phoneSessionId"    # Ljava/lang/String;

    .prologue
    .line 659
    if-nez p1, :cond_0

    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "\'reason\' cannot be NULL"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 660
    :cond_0
    invoke-static {p3}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "\'phoneSessionId\' cannot be NULL or empty"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 661
    :cond_1
    iget-object v4, p0, Lcom/getjar/sdk/data/usage/UsageDatabase;->_databaseAccessLock:Ljava/lang/Object;

    monitor-enter v4

    .line 664
    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 665
    .local v0, "now":J
    new-instance v2, Landroid/content/ContentValues;

    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    .line 666
    .local v2, "values":Landroid/content/ContentValues;
    const-string v3, "timestamp"

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v2, v3, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 667
    const-string v3, "type"

    const-string v5, "start"

    invoke-virtual {v2, v3, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 668
    const-string v3, "reason"

    invoke-virtual {p1}, Lcom/getjar/sdk/data/usage/SessionEvent$Reason;->name()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v3, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 669
    invoke-static {p2}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 670
    const-string v3, "reasonDetails"

    invoke-virtual {v2, v3, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 672
    :cond_2
    const-string v3, "sessionId"

    invoke-virtual {v2, v3, p3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 673
    const-string v3, "synced"

    const/4 v5, 0x0

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v2, v3, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 674
    const-string v3, "disposable"

    const/4 v5, 0x0

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v2, v3, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 677
    invoke-virtual {p0}, Lcom/getjar/sdk/data/usage/UsageDatabase;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    const-string v5, "phoneSessions"

    const/4 v6, 0x0

    invoke-virtual {v3, v5, v6, v2}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 678
    sget-object v3, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    sget-object v3, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    or-long/2addr v5, v7

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v7, "Usage: UsageDatabase: phoneSessionStart() [timestamp:%1$d sessionId:%2$s]"

    const/4 v8, 0x2

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    aput-object v10, v8, v9

    const/4 v9, 0x1

    aput-object p3, v8, v9

    invoke-static {v3, v7, v8}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v5, v6, v3}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 679
    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 680
    invoke-virtual {p0}, Lcom/getjar/sdk/data/usage/UsageDatabase;->trimLruEntries()V

    .line 681
    return-void

    .line 679
    .end local v0    # "now":J
    .end local v2    # "values":Landroid/content/ContentValues;
    :catchall_0
    move-exception v3

    :try_start_1
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v3
.end method

.method protected phoneSessionStop(Lcom/getjar/sdk/data/usage/SessionEvent$Reason;Ljava/lang/String;J)V
    .locals 6
    .param p1, "reason"    # Lcom/getjar/sdk/data/usage/SessionEvent$Reason;
    .param p2, "reasonDetails"    # Ljava/lang/String;
    .param p3, "eventTime"    # J

    .prologue
    .line 688
    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-wide v3, p3

    invoke-virtual/range {v0 .. v5}, Lcom/getjar/sdk/data/usage/UsageDatabase;->phoneSessionStop(Lcom/getjar/sdk/data/usage/SessionEvent$Reason;Ljava/lang/String;JLjava/lang/String;)V

    .line 689
    return-void
.end method

.method protected phoneSessionStop(Lcom/getjar/sdk/data/usage/SessionEvent$Reason;Ljava/lang/String;JLjava/lang/String;)V
    .locals 13
    .param p1, "reason"    # Lcom/getjar/sdk/data/usage/SessionEvent$Reason;
    .param p2, "reasonDetails"    # Ljava/lang/String;
    .param p3, "eventTime"    # J
    .param p5, "phoneSessionId"    # Ljava/lang/String;

    .prologue
    .line 696
    if-nez p1, :cond_0

    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "\'reason\' cannot be NULL"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 697
    :cond_0
    const-wide/16 v5, 0x0

    cmp-long v5, p3, v5

    if-gez v5, :cond_1

    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "\'eventTime\' cannot be less than zero"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 698
    :cond_1
    iget-object v6, p0, Lcom/getjar/sdk/data/usage/UsageDatabase;->_databaseAccessLock:Ljava/lang/Object;

    monitor-enter v6

    .line 701
    :try_start_0
    move-object/from16 v0, p5

    invoke-direct {p0, v0}, Lcom/getjar/sdk/data/usage/UsageDatabase;->getPhoneSessionStart(Ljava/lang/String;)Lcom/getjar/sdk/data/usage/PhoneSessionEvent;

    move-result-object v1

    .line 702
    .local v1, "startEvent":Lcom/getjar/sdk/data/usage/PhoneSessionEvent;
    if-nez v1, :cond_2

    .line 706
    monitor-exit v6

    .line 735
    :goto_0
    return-void

    .line 710
    :cond_2
    const-string v5, "phoneSessions"

    invoke-virtual {v1}, Lcom/getjar/sdk/data/usage/PhoneSessionEvent;->getSessionId()Ljava/lang/String;

    move-result-object v7

    invoke-direct {p0, v5, v7}, Lcom/getjar/sdk/data/usage/UsageDatabase;->setSessionAsDisposable(Ljava/lang/String;Ljava/lang/String;)V

    .line 713
    move-wide/from16 v2, p3

    .line 714
    .local v2, "stopTime":J
    const-wide/16 v7, 0x0

    cmp-long v5, v2, v7

    if-lez v5, :cond_3

    invoke-virtual {v1}, Lcom/getjar/sdk/data/usage/PhoneSessionEvent;->getTimestamp()J

    move-result-wide v7

    cmp-long v5, v2, v7

    if-gez v5, :cond_3

    .line 715
    invoke-virtual {v1}, Lcom/getjar/sdk/data/usage/PhoneSessionEvent;->getTimestamp()J

    move-result-wide v2

    .line 719
    :cond_3
    new-instance v4, Landroid/content/ContentValues;

    invoke-direct {v4}, Landroid/content/ContentValues;-><init>()V

    .line 720
    .local v4, "values":Landroid/content/ContentValues;
    const-string v5, "timestamp"

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-virtual {v4, v5, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 721
    const-string v5, "type"

    const-string v7, "stop"

    invoke-virtual {v4, v5, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 722
    const-string v5, "reason"

    invoke-virtual {p1}, Lcom/getjar/sdk/data/usage/SessionEvent$Reason;->name()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v5, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 723
    invoke-static {p2}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_4

    .line 724
    const-string v5, "reasonDetails"

    invoke-virtual {v4, v5, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 726
    :cond_4
    const-string v5, "sessionId"

    invoke-virtual {v1}, Lcom/getjar/sdk/data/usage/PhoneSessionEvent;->getSessionId()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v5, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 727
    const-string v5, "synced"

    const/4 v7, 0x0

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v4, v5, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 728
    const-string v5, "disposable"

    const/4 v7, 0x1

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v4, v5, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 731
    invoke-virtual {p0}, Lcom/getjar/sdk/data/usage/UsageDatabase;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v5

    const-string v7, "phoneSessions"

    const/4 v8, 0x0

    invoke-virtual {v5, v7, v8, v4}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 732
    sget-object v5, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    sget-object v5, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v9

    or-long/2addr v7, v9

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v9, "Usage: UsageDatabase: phoneSessionStop() [timestamp:%1$d sessionId:%2$s]"

    const/4 v10, 0x2

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v12

    aput-object v12, v10, v11

    const/4 v11, 0x1

    invoke-virtual {v1}, Lcom/getjar/sdk/data/usage/PhoneSessionEvent;->getSessionId()Ljava/lang/String;

    move-result-object v12

    aput-object v12, v10, v11

    invoke-static {v5, v9, v10}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v7, v8, v5}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 733
    monitor-exit v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 734
    invoke-virtual {p0}, Lcom/getjar/sdk/data/usage/UsageDatabase;->trimLruEntries()V

    goto/16 :goto_0

    .line 733
    .end local v1    # "startEvent":Lcom/getjar/sdk/data/usage/PhoneSessionEvent;
    .end local v2    # "stopTime":J
    .end local v4    # "values":Landroid/content/ContentValues;
    :catchall_0
    move-exception v5

    :try_start_1
    monitor-exit v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v5
.end method

.method protected purgeSyncedClosedEntries()V
    .locals 5

    .prologue
    .line 113
    iget-object v1, p0, Lcom/getjar/sdk/data/usage/UsageDatabase;->_databaseAccessLock:Ljava/lang/Object;

    monitor-enter v1

    .line 114
    :try_start_0
    invoke-virtual {p0}, Lcom/getjar/sdk/data/usage/UsageDatabase;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string v2, "appSessions"

    const-string v3, "synced = 1 AND disposable = 1"

    const/4 v4, 0x0

    invoke-virtual {v0, v2, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 115
    invoke-virtual {p0}, Lcom/getjar/sdk/data/usage/UsageDatabase;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string v2, "phoneSessions"

    const-string v3, "synced = 1 AND disposable = 1"

    const/4 v4, 0x0

    invoke-virtual {v0, v2, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 116
    monitor-exit v1

    .line 117
    return-void

    .line 116
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method protected trimLruEntries()V
    .locals 3

    .prologue
    .line 105
    iget-object v1, p0, Lcom/getjar/sdk/data/usage/UsageDatabase;->_databaseAccessLock:Ljava/lang/Object;

    monitor-enter v1

    .line 106
    :try_start_0
    const-string v0, "appSessions"

    const/16 v2, 0x9c4

    invoke-direct {p0, v0, v2}, Lcom/getjar/sdk/data/usage/UsageDatabase;->trimLruEntries(Ljava/lang/String;I)V

    .line 107
    const-string v0, "phoneSessions"

    const/16 v2, 0x9c4

    invoke-direct {p0, v0, v2}, Lcom/getjar/sdk/data/usage/UsageDatabase;->trimLruEntries(Ljava/lang/String;I)V

    .line 108
    monitor-exit v1

    .line 109
    return-void

    .line 108
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
