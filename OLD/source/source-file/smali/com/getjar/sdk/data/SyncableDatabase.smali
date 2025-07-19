.class public abstract Lcom/getjar/sdk/data/SyncableDatabase;
.super Landroid/database/sqlite/SQLiteOpenHelper;
.source "SyncableDatabase.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/getjar/sdk/data/DatabaseRecordBase;",
        ">",
        "Landroid/database/sqlite/SQLiteOpenHelper;"
    }
.end annotation


# instance fields
.field protected volatile _databaseAccessLock:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "factory"    # Landroid/database/sqlite/SQLiteDatabase$CursorFactory;
    .param p4, "version"    # I

    .prologue
    .line 25
    .local p0, "this":Lcom/getjar/sdk/data/SyncableDatabase;, "Lcom/getjar/sdk/data/SyncableDatabase<TT;>;"
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/database/sqlite/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    .line 21
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/getjar/sdk/data/SyncableDatabase;->_databaseAccessLock:Ljava/lang/Object;

    .line 26
    return-void
.end method

.method private getRecordCountInternal()J
    .locals 8

    .prologue
    .line 207
    .local p0, "this":Lcom/getjar/sdk/data/SyncableDatabase;, "Lcom/getjar/sdk/data/SyncableDatabase<TT;>;"
    invoke-virtual {p0}, Lcom/getjar/sdk/data/SyncableDatabase;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "SELECT count(*) FROM %1$s"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-virtual {p0}, Lcom/getjar/sdk/data/SyncableDatabase;->getTableName()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v0

    .line 209
    .local v0, "dbStatement":Landroid/database/sqlite/SQLiteStatement;
    :try_start_0
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteStatement;->simpleQueryForLong()J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-wide v2

    .line 211
    :try_start_1
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteStatement;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

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
.method protected checkForRecord(J)Z
    .locals 10
    .param p1, "id"    # J

    .prologue
    .local p0, "this":Lcom/getjar/sdk/data/SyncableDatabase;, "Lcom/getjar/sdk/data/SyncableDatabase<TT;>;"
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 188
    const/4 v0, 0x0

    .line 190
    .local v0, "dbStatement":Landroid/database/sqlite/SQLiteStatement;
    :try_start_0
    invoke-virtual {p0}, Lcom/getjar/sdk/data/SyncableDatabase;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v4

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "SELECT count(*) FROM %1$s WHERE id = ?"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    invoke-virtual {p0}, Lcom/getjar/sdk/data/SyncableDatabase;->getTableName()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v0

    .line 191
    const/4 v4, 0x1

    invoke-virtual {v0, v4, p1, p2}, Landroid/database/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 192
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteStatement;->simpleQueryForLong()J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-wide v4

    const-wide/16 v6, 0x0

    cmp-long v4, v4, v6

    if-lez v4, :cond_1

    .line 195
    :goto_0
    if-eqz v0, :cond_0

    .line 196
    :try_start_1
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteStatement;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 197
    const/4 v0, 0x0

    .line 201
    :cond_0
    :goto_1
    return v2

    :cond_1
    move v2, v3

    .line 192
    goto :goto_0

    .line 199
    :catch_0
    move-exception v1

    .line 200
    .local v1, "e":Ljava/lang/Exception;
    sget-object v3, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    const-string v5, "SQLiteStatement.close() failed"

    invoke-static {v3, v4, v5, v1}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 194
    .end local v1    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v2

    .line 195
    if-eqz v0, :cond_2

    .line 196
    :try_start_2
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteStatement;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 197
    const/4 v0, 0x0

    .line 201
    :cond_2
    :goto_2
    throw v2

    .line 199
    :catch_1
    move-exception v1

    .line 200
    .restart local v1    # "e":Ljava/lang/Exception;
    sget-object v3, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    const-string v5, "SQLiteStatement.close() failed"

    invoke-static {v3, v4, v5, v1}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_2
.end method

.method protected deleteAllRecords()V
    .locals 3

    .prologue
    .local p0, "this":Lcom/getjar/sdk/data/SyncableDatabase;, "Lcom/getjar/sdk/data/SyncableDatabase<TT;>;"
    const/4 v2, 0x0

    .line 183
    invoke-virtual {p0}, Lcom/getjar/sdk/data/SyncableDatabase;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    invoke-virtual {p0}, Lcom/getjar/sdk/data/SyncableDatabase;->getTableName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, v2, v2}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 184
    return-void
.end method

.method public deleteRecord(J)V
    .locals 8
    .param p1, "id"    # J

    .prologue
    .line 176
    .local p0, "this":Lcom/getjar/sdk/data/SyncableDatabase;, "Lcom/getjar/sdk/data/SyncableDatabase<TT;>;"
    iget-object v1, p0, Lcom/getjar/sdk/data/SyncableDatabase;->_databaseAccessLock:Ljava/lang/Object;

    monitor-enter v1

    .line 177
    :try_start_0
    invoke-virtual {p0}, Lcom/getjar/sdk/data/SyncableDatabase;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    invoke-virtual {p0}, Lcom/getjar/sdk/data/SyncableDatabase;->getTableName()Ljava/lang/String;

    move-result-object v2

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

    .line 178
    monitor-exit v1

    .line 179
    return-void

    .line 178
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method protected abstract getLRUCap()I
.end method

.method public getRecordCount()J
    .locals 4

    .prologue
    .line 123
    .local p0, "this":Lcom/getjar/sdk/data/SyncableDatabase;, "Lcom/getjar/sdk/data/SyncableDatabase<TT;>;"
    iget-object v1, p0, Lcom/getjar/sdk/data/SyncableDatabase;->_databaseAccessLock:Ljava/lang/Object;

    monitor-enter v1

    .line 124
    :try_start_0
    invoke-direct {p0}, Lcom/getjar/sdk/data/SyncableDatabase;->getRecordCountInternal()J

    move-result-wide v2

    monitor-exit v1

    return-wide v2

    .line 125
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method protected abstract getTableCreateSQL()Ljava/lang/String;
.end method

.method protected abstract getTableName()Ljava/lang/String;
.end method

.method public loadAllRecords()Ljava/util/List;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 67
    .local p0, "this":Lcom/getjar/sdk/data/SyncableDatabase;, "Lcom/getjar/sdk/data/SyncableDatabase<TT;>;"
    iget-object v10, p0, Lcom/getjar/sdk/data/SyncableDatabase;->_databaseAccessLock:Ljava/lang/Object;

    monitor-enter v10

    .line 68
    :try_start_0
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 69
    .local v8, "records":Ljava/util/List;, "Ljava/util/List<TT;>;"
    const/4 v9, 0x0

    .line 71
    .local v9, "results":Landroid/database/Cursor;
    :try_start_1
    invoke-virtual {p0}, Lcom/getjar/sdk/data/SyncableDatabase;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    invoke-virtual {p0}, Lcom/getjar/sdk/data/SyncableDatabase;->getTableName()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v9

    .line 72
    :goto_0
    invoke-interface {v9}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 73
    invoke-virtual {p0, v9}, Lcom/getjar/sdk/data/SyncableDatabase;->loadFromDB(Landroid/database/Cursor;)Lcom/getjar/sdk/data/DatabaseRecordBase;

    move-result-object v0

    invoke-interface {v8, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 76
    :catchall_0
    move-exception v0

    .line 77
    if-eqz v9, :cond_0

    :try_start_2
    invoke-interface {v9}, Landroid/database/Cursor;->close()V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    const/4 v9, 0x0

    .line 78
    :cond_0
    :goto_1
    :try_start_3
    throw v0

    .line 81
    .end local v8    # "records":Ljava/util/List;, "Ljava/util/List<TT;>;"
    .end local v9    # "results":Landroid/database/Cursor;
    :catchall_1
    move-exception v0

    monitor-exit v10
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw v0

    .line 77
    .restart local v8    # "records":Ljava/util/List;, "Ljava/util/List<TT;>;"
    .restart local v9    # "results":Landroid/database/Cursor;
    :cond_1
    if-eqz v9, :cond_2

    :try_start_4
    invoke-interface {v9}, Landroid/database/Cursor;->close()V
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    const/4 v9, 0x0

    .line 80
    :cond_2
    :goto_2
    :try_start_5
    monitor-exit v10
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    return-object v8

    .line 78
    :catch_0
    move-exception v0

    goto :goto_2

    :catch_1
    move-exception v1

    goto :goto_1
.end method

.method protected abstract loadFromDB(Landroid/database/Cursor;)Lcom/getjar/sdk/data/DatabaseRecordBase;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/Cursor;",
            ")TT;"
        }
    .end annotation
.end method

.method public loadUnsyncedRecords()Ljava/util/List;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 86
    .local p0, "this":Lcom/getjar/sdk/data/SyncableDatabase;, "Lcom/getjar/sdk/data/SyncableDatabase<TT;>;"
    iget-object v10, p0, Lcom/getjar/sdk/data/SyncableDatabase;->_databaseAccessLock:Ljava/lang/Object;

    monitor-enter v10

    .line 87
    :try_start_0
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 88
    .local v9, "unsyncedRecords":Ljava/util/List;, "Ljava/util/List<TT;>;"
    const/4 v8, 0x0

    .line 90
    .local v8, "results":Landroid/database/Cursor;
    :try_start_1
    invoke-virtual {p0}, Lcom/getjar/sdk/data/SyncableDatabase;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    invoke-virtual {p0}, Lcom/getjar/sdk/data/SyncableDatabase;->getTableName()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    const-string v3, "synced = 0"

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 91
    :goto_0
    invoke-interface {v8}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 94
    invoke-virtual {p0, v8}, Lcom/getjar/sdk/data/SyncableDatabase;->loadFromDB(Landroid/database/Cursor;)Lcom/getjar/sdk/data/DatabaseRecordBase;

    move-result-object v0

    invoke-interface {v9, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 97
    :catchall_0
    move-exception v0

    .line 98
    if-eqz v8, :cond_0

    :try_start_2
    invoke-interface {v8}, Landroid/database/Cursor;->close()V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    const/4 v8, 0x0

    .line 99
    :cond_0
    :goto_1
    :try_start_3
    throw v0

    .line 102
    .end local v8    # "results":Landroid/database/Cursor;
    .end local v9    # "unsyncedRecords":Ljava/util/List;, "Ljava/util/List<TT;>;"
    :catchall_1
    move-exception v0

    monitor-exit v10
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw v0

    .line 98
    .restart local v8    # "results":Landroid/database/Cursor;
    .restart local v9    # "unsyncedRecords":Ljava/util/List;, "Ljava/util/List<TT;>;"
    :cond_1
    if-eqz v8, :cond_2

    :try_start_4
    invoke-interface {v8}, Landroid/database/Cursor;->close()V
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    const/4 v8, 0x0

    .line 101
    :cond_2
    :goto_2
    :try_start_5
    monitor-exit v10
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    return-object v9

    .line 99
    :catch_0
    move-exception v0

    goto :goto_2

    :catch_1
    move-exception v1

    goto :goto_1
.end method

.method public onCreate(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 2
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .prologue
    .line 31
    .local p0, "this":Lcom/getjar/sdk/data/SyncableDatabase;, "Lcom/getjar/sdk/data/SyncableDatabase<TT;>;"
    iget-object v1, p0, Lcom/getjar/sdk/data/SyncableDatabase;->_databaseAccessLock:Ljava/lang/Object;

    monitor-enter v1

    .line 32
    :try_start_0
    invoke-virtual {p0}, Lcom/getjar/sdk/data/SyncableDatabase;->getTableCreateSQL()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 33
    monitor-exit v1

    .line 34
    return-void

    .line 33
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
    .line 39
    .local p0, "this":Lcom/getjar/sdk/data/SyncableDatabase;, "Lcom/getjar/sdk/data/SyncableDatabase<TT;>;"
    iget-object v1, p0, Lcom/getjar/sdk/data/SyncableDatabase;->_databaseAccessLock:Ljava/lang/Object;

    monitor-enter v1

    .line 40
    :try_start_0
    sget-object v0, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "Upgrading database from version %1$d to %2$d [deleting old data from table \'%3$s\']"

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x1

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x2

    invoke-virtual {p0}, Lcom/getjar/sdk/data/SyncableDatabase;->getTableName()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v0, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 45
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "DROP TABLE IF EXISTS "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/getjar/sdk/data/SyncableDatabase;->getTableName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 46
    invoke-virtual {p0, p1}, Lcom/getjar/sdk/data/SyncableDatabase;->onCreate(Landroid/database/sqlite/SQLiteDatabase;)V

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

.method public purgeSyncedRecords()V
    .locals 5

    .prologue
    .line 169
    .local p0, "this":Lcom/getjar/sdk/data/SyncableDatabase;, "Lcom/getjar/sdk/data/SyncableDatabase<TT;>;"
    iget-object v1, p0, Lcom/getjar/sdk/data/SyncableDatabase;->_databaseAccessLock:Ljava/lang/Object;

    monitor-enter v1

    .line 170
    :try_start_0
    invoke-virtual {p0}, Lcom/getjar/sdk/data/SyncableDatabase;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    invoke-virtual {p0}, Lcom/getjar/sdk/data/SyncableDatabase;->getTableName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "synced = 1"

    const/4 v4, 0x0

    invoke-virtual {v0, v2, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 171
    monitor-exit v1

    .line 172
    return-void

    .line 171
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public setRecordAsSynced(J)V
    .locals 9
    .param p1, "id"    # J

    .prologue
    .line 107
    .local p0, "this":Lcom/getjar/sdk/data/SyncableDatabase;, "Lcom/getjar/sdk/data/SyncableDatabase<TT;>;"
    iget-object v2, p0, Lcom/getjar/sdk/data/SyncableDatabase;->_databaseAccessLock:Ljava/lang/Object;

    monitor-enter v2

    .line 108
    :try_start_0
    invoke-virtual {p0, p1, p2}, Lcom/getjar/sdk/data/SyncableDatabase;->checkForRecord(J)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 110
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 111
    .local v0, "values":Landroid/content/ContentValues;
    const-string v1, "synced"

    const/4 v3, 0x1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 112
    invoke-virtual {p0}, Lcom/getjar/sdk/data/SyncableDatabase;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    invoke-virtual {p0}, Lcom/getjar/sdk/data/SyncableDatabase;->getTableName()Ljava/lang/String;

    move-result-object v3

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

    .line 118
    .end local v0    # "values":Landroid/content/ContentValues;
    :goto_0
    monitor-exit v2

    .line 119
    return-void

    .line 116
    :cond_0
    sget-object v1, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "Usage: %1$s: setRecordAsSynced() failed to find record %2$d"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x1

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v1, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v4, v1}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;)V

    goto :goto_0

    .line 118
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public trimLruEntries()V
    .locals 13

    .prologue
    .line 130
    .local p0, "this":Lcom/getjar/sdk/data/SyncableDatabase;, "Lcom/getjar/sdk/data/SyncableDatabase<TT;>;"
    iget-object v12, p0, Lcom/getjar/sdk/data/SyncableDatabase;->_databaseAccessLock:Ljava/lang/Object;

    monitor-enter v12

    .line 133
    :try_start_0
    invoke-virtual {p0}, Lcom/getjar/sdk/data/SyncableDatabase;->getLRUCap()I

    move-result v10

    .line 134
    .local v10, "maxRecordsCap":I
    if-gez v10, :cond_0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "\'maxRecordsCap\' can not be negative"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 164
    .end local v10    # "maxRecordsCap":I
    :catchall_0
    move-exception v0

    monitor-exit v12
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    .line 135
    .restart local v10    # "maxRecordsCap":I
    :cond_0
    :try_start_1
    invoke-direct {p0}, Lcom/getjar/sdk/data/SyncableDatabase;->getRecordCountInternal()J

    move-result-wide v0

    int-to-long v2, v10

    cmp-long v0, v0, v2

    if-gez v0, :cond_1

    monitor-exit v12
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 165
    :goto_0
    return-void

    .line 137
    :cond_1
    const/4 v9, 0x0

    .line 138
    .local v9, "id":Ljava/lang/Long;
    const/4 v11, 0x0

    .line 141
    .local v11, "results":Landroid/database/Cursor;
    :try_start_2
    invoke-virtual {p0}, Lcom/getjar/sdk/data/SyncableDatabase;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    invoke-virtual {p0}, Lcom/getjar/sdk/data/SyncableDatabase;->getTableName()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "id"

    aput-object v4, v2, v3

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const-string v7, "timestamp DESC"

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v11

    .line 149
    invoke-interface {v11, v10}, Landroid/database/Cursor;->moveToPosition(I)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 150
    const/4 v0, 0x0

    invoke-interface {v11, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    move-result-object v9

    .line 154
    :cond_2
    if-eqz v11, :cond_3

    :try_start_3
    invoke-interface {v11}, Landroid/database/Cursor;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    const/4 v11, 0x0

    .line 156
    :cond_3
    :goto_1
    :try_start_4
    invoke-virtual {p0}, Lcom/getjar/sdk/data/SyncableDatabase;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    invoke-virtual {p0}, Lcom/getjar/sdk/data/SyncableDatabase;->getTableName()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "id <= %1$d"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v9, v4, v5

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v8

    .line 157
    .local v8, "count":I
    if-lez v8, :cond_4

    .line 158
    sget-object v0, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "Usage: %1$s: trimLruEntries() %2$d LRU rows deleted form %3$s"

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x1

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x2

    invoke-virtual {p0}, Lcom/getjar/sdk/data/SyncableDatabase;->getTableName()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 164
    :cond_4
    monitor-exit v12
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_0

    .line 154
    .end local v8    # "count":I
    :catchall_1
    move-exception v0

    if-eqz v11, :cond_5

    :try_start_5
    invoke-interface {v11}, Landroid/database/Cursor;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    const/4 v11, 0x0

    :cond_5
    :goto_2
    :try_start_6
    throw v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    :catch_0
    move-exception v0

    goto :goto_1

    :catch_1
    move-exception v1

    goto :goto_2
.end method
