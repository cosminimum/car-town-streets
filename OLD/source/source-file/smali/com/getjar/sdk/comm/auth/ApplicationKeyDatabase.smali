.class public Lcom/getjar/sdk/comm/auth/ApplicationKeyDatabase;
.super Landroid/database/sqlite/SQLiteOpenHelper;
.source "ApplicationKeyDatabase.java"


# static fields
.field private static final DATABASE_CREATE:Ljava/lang/String; = "CREATE TABLE IF NOT EXISTS applicationKey (applicationKey TEXT NOT NULL UNIQUE);"

.field private static final DATABASE_NAME:Ljava/lang/String; = "GetJarDBApplicationKey"

.field private static final DATABASE_TABLE:Ljava/lang/String; = "applicationKey"

.field private static final DATABASE_VERSION:I = 0x1

.field private static volatile _Instance:Lcom/getjar/sdk/comm/auth/ApplicationKeyDatabase;


# instance fields
.field private volatile _databaseAccessLock:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 27
    const/4 v0, 0x0

    sput-object v0, Lcom/getjar/sdk/comm/auth/ApplicationKeyDatabase;->_Instance:Lcom/getjar/sdk/comm/auth/ApplicationKeyDatabase;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 25
    const-string v0, "GetJarDBApplicationKey"

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-direct {p0, p1, v0, v1, v2}, Landroid/database/sqlite/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    .line 63
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/getjar/sdk/comm/auth/ApplicationKeyDatabase;->_databaseAccessLock:Ljava/lang/Object;

    .line 26
    return-void
.end method

.method public static declared-synchronized getInstance(Landroid/content/Context;)Lcom/getjar/sdk/comm/auth/ApplicationKeyDatabase;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 29
    const-class v1, Lcom/getjar/sdk/comm/auth/ApplicationKeyDatabase;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/getjar/sdk/comm/auth/ApplicationKeyDatabase;->_Instance:Lcom/getjar/sdk/comm/auth/ApplicationKeyDatabase;

    if-nez v0, :cond_0

    .line 30
    new-instance v0, Lcom/getjar/sdk/comm/auth/ApplicationKeyDatabase;

    invoke-direct {v0, p0}, Lcom/getjar/sdk/comm/auth/ApplicationKeyDatabase;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/getjar/sdk/comm/auth/ApplicationKeyDatabase;->_Instance:Lcom/getjar/sdk/comm/auth/ApplicationKeyDatabase;

    .line 32
    :cond_0
    sget-object v0, Lcom/getjar/sdk/comm/auth/ApplicationKeyDatabase;->_Instance:Lcom/getjar/sdk/comm/auth/ApplicationKeyDatabase;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 29
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private getRecordCount()J
    .locals 8

    .prologue
    .line 106
    invoke-virtual {p0}, Lcom/getjar/sdk/comm/auth/ApplicationKeyDatabase;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "SELECT count(*) FROM %1$s"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    const-string v7, "applicationKey"

    aput-object v7, v5, v6

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v0

    .line 108
    .local v0, "dbStatement":Landroid/database/sqlite/SQLiteStatement;
    :try_start_0
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteStatement;->simpleQueryForLong()J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-wide v2

    .line 110
    :try_start_1
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteStatement;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    const/4 v0, 0x0

    :goto_0
    return-wide v2

    :catch_0
    move-exception v1

    .local v1, "e":Ljava/lang/Exception;
    sget-object v4, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

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

    const/4 v0, 0x0

    :goto_1
    throw v2

    :catch_1
    move-exception v1

    .restart local v1    # "e":Ljava/lang/Exception;
    sget-object v3, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    const-string v5, "SQLiteStatement.close() failed"

    invoke-static {v3, v4, v5, v1}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1
.end method


# virtual methods
.method public getApplicationKey()Ljava/lang/String;
    .locals 12

    .prologue
    .line 89
    iget-object v11, p0, Lcom/getjar/sdk/comm/auth/ApplicationKeyDatabase;->_databaseAccessLock:Ljava/lang/Object;

    monitor-enter v11

    .line 90
    const/4 v8, 0x0

    .line 91
    .local v8, "applicationKey":Ljava/lang/String;
    :try_start_0
    invoke-virtual {p0}, Lcom/getjar/sdk/comm/auth/ApplicationKeyDatabase;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string v1, "applicationKey"

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v10

    .line 93
    .local v10, "results":Landroid/database/Cursor;
    :try_start_1
    invoke-interface {v10}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 94
    const/4 v0, 0x0

    invoke-interface {v10, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-result-object v8

    .line 97
    :cond_0
    :try_start_2
    invoke-interface {v10}, Landroid/database/Cursor;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    const/4 v10, 0x0

    .line 99
    :goto_0
    :try_start_3
    sget-object v0, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    const-string v2, "ApplicationKeyDatabase: getApplicationKey()"

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 100
    monitor-exit v11

    return-object v8

    .line 97
    :catch_0
    move-exception v9

    .local v9, "e":Ljava/lang/Exception;
    sget-object v0, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    const-string v2, "ApplicationKeyDatabase: getApplicationKey() failed"

    invoke-static {v0, v1, v2, v9}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 101
    .end local v9    # "e":Ljava/lang/Exception;
    .end local v10    # "results":Landroid/database/Cursor;
    :catchall_0
    move-exception v0

    monitor-exit v11
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v0

    .line 97
    .restart local v10    # "results":Landroid/database/Cursor;
    :catchall_1
    move-exception v0

    :try_start_4
    invoke-interface {v10}, Landroid/database/Cursor;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    const/4 v10, 0x0

    :goto_1
    :try_start_5
    throw v0

    :catch_1
    move-exception v9

    .restart local v9    # "e":Ljava/lang/Exception;
    sget-object v1, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    const-string v3, "ApplicationKeyDatabase: getApplicationKey() failed"

    invoke-static {v1, v2, v3, v9}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_1
.end method

.method public onCreate(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 2
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .prologue
    .line 45
    iget-object v1, p0, Lcom/getjar/sdk/comm/auth/ApplicationKeyDatabase;->_databaseAccessLock:Ljava/lang/Object;

    monitor-enter v1

    .line 46
    :try_start_0
    const-string v0, "CREATE TABLE IF NOT EXISTS applicationKey (applicationKey TEXT NOT NULL UNIQUE);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 47
    monitor-exit v1

    .line 48
    return-void

    .line 47
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 8
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "oldVersion"    # I
    .param p3, "newVersion"    # I

    .prologue
    .line 52
    iget-object v1, p0, Lcom/getjar/sdk/comm/auth/ApplicationKeyDatabase;->_databaseAccessLock:Ljava/lang/Object;

    monitor-enter v1

    .line 53
    :try_start_0
    sget-object v0, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "Upgrading database \'%1$s\' from version %2$d to %3$d, which will destroy all old data"

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    const-string v7, "GetJarDBApplicationKey"

    aput-object v7, v5, v6

    const/4 v6, 0x1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x2

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v0, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 58
    const-string v0, "DROP TABLE IF EXISTS applicationKey"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 59
    invoke-virtual {p0, p1}, Lcom/getjar/sdk/comm/auth/ApplicationKeyDatabase;->onCreate(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 60
    monitor-exit v1

    .line 61
    return-void

    .line 60
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public setApplicationKey(Ljava/lang/String;)V
    .locals 7
    .param p1, "applicationKey"    # Ljava/lang/String;

    .prologue
    .line 67
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\'applicationKey\' cannot be NULL or empty"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 68
    :cond_0
    iget-object v2, p0, Lcom/getjar/sdk/comm/auth/ApplicationKeyDatabase;->_databaseAccessLock:Ljava/lang/Object;

    monitor-enter v2

    .line 71
    :try_start_0
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 72
    .local v0, "values":Landroid/content/ContentValues;
    const-string v1, "applicationKey"

    invoke-virtual {v0, v1, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    invoke-direct {p0}, Lcom/getjar/sdk/comm/auth/ApplicationKeyDatabase;->getRecordCount()J

    move-result-wide v3

    const-wide/16 v5, 0x0

    cmp-long v1, v3, v5

    if-lez v1, :cond_1

    .line 77
    invoke-virtual {p0}, Lcom/getjar/sdk/comm/auth/ApplicationKeyDatabase;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    const-string v3, "applicationKey"

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual {v1, v3, v0, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 83
    :goto_0
    sget-object v1, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    const-string v1, "ApplicationKeyDatabase: setApplicationKey()"

    invoke-static {v3, v4, v1}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 84
    monitor-exit v2

    .line 85
    return-void

    .line 81
    :cond_1
    invoke-virtual {p0}, Lcom/getjar/sdk/comm/auth/ApplicationKeyDatabase;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    const-string v3, "applicationKey"

    const/4 v4, 0x0

    invoke-virtual {v1, v3, v4, v0}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    goto :goto_0

    .line 84
    .end local v0    # "values":Landroid/content/ContentValues;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method
