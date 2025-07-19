.class Lcom/getjar/sdk/data/install_state/InstallStateDatabase;
.super Lcom/getjar/sdk/data/SyncableDatabase;
.source "InstallStateDatabase.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/getjar/sdk/data/SyncableDatabase",
        "<",
        "Lcom/getjar/sdk/data/install_state/InstallStateRecord;",
        ">;"
    }
.end annotation


# static fields
.field private static final DATABASE_NAME_PREFIX:Ljava/lang/String; = "GetJarDBInstallState"

.field private static final DATABASE_TABLE:Ljava/lang/String; = "installState"

.field private static final DATABASE_VERSION:I = 0x1

.field private static LRU_CAP:I

.field private static volatile _Instance:Lcom/getjar/sdk/data/install_state/InstallStateDatabase;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 25
    const/4 v0, 0x0

    sput-object v0, Lcom/getjar/sdk/data/install_state/InstallStateDatabase;->_Instance:Lcom/getjar/sdk/data/install_state/InstallStateDatabase;

    .line 73
    const/16 v0, 0x3e8

    sput v0, Lcom/getjar/sdk/data/install_state/InstallStateDatabase;->LRU_CAP:I

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    const/4 v7, 0x1

    .line 59
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0, v7}, Lcom/getjar/sdk/data/SyncableDatabase;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    .line 60
    sget-object v0, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "InstallStateDatabase: Opened user specific database \'%1$s%2$d\'"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    const-string v6, "GetJarDBInstallState"

    aput-object v6, v4, v5

    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v5

    invoke-virtual {v5}, Lcom/getjar/sdk/comm/auth/AuthManager;->getUserAccessId()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->hashCode()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v7

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    .line 64
    return-void
.end method

.method private checkForRecord(Ljava/lang/String;)Z
    .locals 10
    .param p1, "packageName"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 160
    const/4 v0, 0x0

    .line 162
    .local v0, "dbStatement":Landroid/database/sqlite/SQLiteStatement;
    :try_start_0
    invoke-virtual {p0}, Lcom/getjar/sdk/data/install_state/InstallStateDatabase;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v4

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "SELECT count(*) FROM %1$s WHERE packageName = ?"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    const-string v9, "installState"

    aput-object v9, v7, v8

    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v0

    .line 163
    const/4 v4, 0x1

    invoke-virtual {v0, v4, p1}, Landroid/database/sqlite/SQLiteStatement;->bindString(ILjava/lang/String;)V

    .line 164
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteStatement;->simpleQueryForLong()J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-wide v4

    const-wide/16 v6, 0x0

    cmp-long v4, v4, v6

    if-lez v4, :cond_1

    .line 167
    :goto_0
    if-eqz v0, :cond_0

    .line 168
    :try_start_1
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteStatement;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 169
    const/4 v0, 0x0

    .line 173
    :cond_0
    :goto_1
    return v2

    :cond_1
    move v2, v3

    .line 164
    goto :goto_0

    .line 171
    :catch_0
    move-exception v1

    .line 172
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

    .line 166
    .end local v1    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v2

    .line 167
    if-eqz v0, :cond_2

    .line 168
    :try_start_2
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteStatement;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 169
    const/4 v0, 0x0

    .line 173
    :cond_2
    :goto_2
    throw v2

    .line 171
    :catch_1
    move-exception v1

    .line 172
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

.method protected static declared-synchronized getInstance()Lcom/getjar/sdk/data/install_state/InstallStateDatabase;
    .locals 3

    .prologue
    .line 29
    const-class v1, Lcom/getjar/sdk/data/install_state/InstallStateDatabase;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/getjar/sdk/data/install_state/InstallStateDatabase;->_Instance:Lcom/getjar/sdk/data/install_state/InstallStateDatabase;

    if-nez v0, :cond_0

    .line 30
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v2, "initialize() must be called first"

    invoke-direct {v0, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 29
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0

    .line 32
    :cond_0
    :try_start_1
    sget-object v0, Lcom/getjar/sdk/data/install_state/InstallStateDatabase;->_Instance:Lcom/getjar/sdk/data/install_state/InstallStateDatabase;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit v1

    return-object v0
.end method

.method protected static declared-synchronized initialize(Landroid/content/Context;)V
    .locals 8
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 37
    const-class v1, Lcom/getjar/sdk/data/install_state/InstallStateDatabase;

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

    .line 38
    :cond_0
    :try_start_1
    sget-object v0, Lcom/getjar/sdk/data/install_state/InstallStateDatabase;->_Instance:Lcom/getjar/sdk/data/install_state/InstallStateDatabase;

    if-nez v0, :cond_2

    .line 41
    sget-object v0, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v0, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "InstallStateDatabase: waitForUserAccess() START [%1$s]"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-static {}, Lcom/getjar/sdk/logging/Logger;->getShortStack()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v0, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    .line 42
    invoke-static {p0}, Lcom/getjar/sdk/comm/auth/AuthManager;->initialize(Landroid/content/Context;)V

    .line 43
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/getjar/sdk/comm/auth/AuthManager;->waitOnAuth()V

    .line 44
    sget-object v0, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v0, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    const-string v0, "InstallStateDatabase: waitForUserAccess() DONE"

    invoke-static {v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    .line 45
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/getjar/sdk/comm/auth/AuthManager;->getUserAccessId()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v2, "Must have a user access ID"

    invoke-direct {v0, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 48
    :cond_1
    new-instance v0, Lcom/getjar/sdk/data/install_state/InstallStateDatabase;

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "%1$s%2$d"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    const-string v6, "GetJarDBInstallState"

    aput-object v6, v4, v5

    const/4 v5, 0x1

    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v6

    invoke-virtual {v6}, Lcom/getjar/sdk/comm/auth/AuthManager;->getUserAccessId()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->hashCode()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, p0, v2}, Lcom/getjar/sdk/data/install_state/InstallStateDatabase;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    sput-object v0, Lcom/getjar/sdk/data/install_state/InstallStateDatabase;->_Instance:Lcom/getjar/sdk/data/install_state/InstallStateDatabase;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 56
    monitor-exit v1

    return-void

    .line 54
    :cond_2
    :try_start_2
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v2, "InstallStateDatabase has already been initialized"

    invoke-direct {v0, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
.end method


# virtual methods
.method public addRecord(Ljava/lang/String;)V
    .locals 8
    .param p1, "packageName"    # Ljava/lang/String;

    .prologue
    .line 109
    iget-object v2, p0, Lcom/getjar/sdk/data/install_state/InstallStateDatabase;->_databaseAccessLock:Ljava/lang/Object;

    monitor-enter v2

    .line 112
    :try_start_0
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v3, "\'packageName\' cannot be NULL or empty"

    invoke-direct {v1, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 130
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 115
    :cond_0
    :try_start_1
    invoke-direct {p0, p1}, Lcom/getjar/sdk/data/install_state/InstallStateDatabase;->checkForRecord(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 116
    sget-object v1, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v1, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "InstallStateDatabase: Preexisting record found for \'%1$s\'"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object p1, v6, v7

    invoke-static {v1, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v4, v1}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 117
    monitor-exit v2

    .line 134
    :goto_0
    return-void

    .line 121
    :cond_1
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 122
    .local v0, "values":Landroid/content/ContentValues;
    const-string v1, "packageName"

    invoke-virtual {v0, v1, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 123
    const-string v1, "timestamp"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 124
    const-string v1, "status"

    sget-object v3, Lcom/getjar/sdk/data/install_state/InstallStateManager$InstallState;->FOUND_INSTALLED:Lcom/getjar/sdk/data/install_state/InstallStateManager$InstallState;

    invoke-virtual {v3}, Lcom/getjar/sdk/data/install_state/InstallStateManager$InstallState;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 125
    const-string v1, "synced"

    const/4 v3, 0x0

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 128
    invoke-virtual {p0}, Lcom/getjar/sdk/data/install_state/InstallStateDatabase;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    const-string v3, "installState"

    const/4 v4, 0x0

    invoke-virtual {v1, v3, v4, v0}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 129
    sget-object v1, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v1, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "InstallStateDatabase: Added a FOUND_INSTALLED record for \'%1$s\'"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object p1, v6, v7

    invoke-static {v1, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v4, v1}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 130
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 133
    invoke-virtual {p0}, Lcom/getjar/sdk/data/install_state/InstallStateDatabase;->trimLruEntries()V

    goto :goto_0
.end method

.method protected getLRUCap()I
    .locals 1

    .prologue
    .line 95
    sget v0, Lcom/getjar/sdk/data/install_state/InstallStateDatabase;->LRU_CAP:I

    return v0
.end method

.method protected getTableCreateSQL()Ljava/lang/String;
    .locals 1

    .prologue
    .line 78
    const-string v0, "CREATE TABLE IF NOT EXISTS installState (id INTEGER PRIMARY KEY AUTOINCREMENT, packageName TEXT NOT NULL UNIQUE, timestamp INTEGER NOT NULL, status TEXT NOT NULL, synced INTEGER NOT NULL DEFAULT 0);"

    return-object v0
.end method

.method protected getTableName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 91
    const-string v0, "installState"

    return-object v0
.end method

.method protected bridge synthetic loadFromDB(Landroid/database/Cursor;)Lcom/getjar/sdk/data/DatabaseRecordBase;
    .locals 1
    .param p1, "x0"    # Landroid/database/Cursor;

    .prologue
    .line 21
    invoke-virtual {p0, p1}, Lcom/getjar/sdk/data/install_state/InstallStateDatabase;->loadFromDB(Landroid/database/Cursor;)Lcom/getjar/sdk/data/install_state/InstallStateRecord;

    move-result-object v0

    return-object v0
.end method

.method protected loadFromDB(Landroid/database/Cursor;)Lcom/getjar/sdk/data/install_state/InstallStateRecord;
    .locals 1
    .param p1, "results"    # Landroid/database/Cursor;

    .prologue
    .line 100
    invoke-static {p1}, Lcom/getjar/sdk/data/install_state/InstallStateRecord;->loadFromDB(Landroid/database/Cursor;)Lcom/getjar/sdk/data/install_state/InstallStateRecord;

    move-result-object v0

    return-object v0
.end method

.method public purgeSyncedRecords()V
    .locals 2

    .prologue
    .line 183
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "In this database we do not purge synced records as the set of records is used over time to send delta updates"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public updateState(JLcom/getjar/sdk/data/install_state/InstallStateManager$InstallState;)V
    .locals 9
    .param p1, "id"    # J
    .param p3, "installState"    # Lcom/getjar/sdk/data/install_state/InstallStateManager$InstallState;

    .prologue
    .line 140
    if-nez p3, :cond_0

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\'installState\' cannot be NULL"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 143
    :cond_0
    iget-object v2, p0, Lcom/getjar/sdk/data/install_state/InstallStateDatabase;->_databaseAccessLock:Ljava/lang/Object;

    monitor-enter v2

    .line 144
    :try_start_0
    invoke-virtual {p0, p1, p2}, Lcom/getjar/sdk/data/install_state/InstallStateDatabase;->checkForRecord(J)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 146
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 147
    .local v0, "values":Landroid/content/ContentValues;
    const-string v1, "status"

    invoke-virtual {p3}, Lcom/getjar/sdk/data/install_state/InstallStateManager$InstallState;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 148
    const-string v1, "synced"

    const/4 v3, 0x0

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 149
    invoke-virtual {p0}, Lcom/getjar/sdk/data/install_state/InstallStateDatabase;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    const-string v3, "installState"

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "id = %1$d"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v1, v3, v0, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 155
    .end local v0    # "values":Landroid/content/ContentValues;
    :goto_0
    monitor-exit v2

    .line 156
    return-void

    .line 153
    :cond_1
    sget-object v1, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v1, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "InstallStateDatabase: updateState() failed to find record %1$d"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v1, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v4, v1}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;)V

    goto :goto_0

    .line 155
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method
