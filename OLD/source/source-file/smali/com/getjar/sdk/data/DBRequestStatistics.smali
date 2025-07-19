.class public Lcom/getjar/sdk/data/DBRequestStatistics;
.super Landroid/database/sqlite/SQLiteOpenHelper;
.source "DBRequestStatistics.java"


# static fields
.field private static final DB_CREATE_TABLE_COMMANDS:[Ljava/lang/String;

.field private static final DB_TABLE_NAMES:[Ljava/lang/String;

.field private static final _DATABASE_NAME:Ljava/lang/String; = "GetJarStatisticsDB"

.field private static final _DATABASE_TABLE_NAME_REQUESTS:Ljava/lang/String; = "requests"

.field private static final _DATABASE_TABLE_NAME_RESPONSES:Ljava/lang/String; = "responses"

.field private static final _DATABASE_VERSION:I = 0x4

.field private static final _DB_CREATE_TABLE_REQUESTS:Ljava/lang/String; = "CREATE TABLE IF NOT EXISTS requests (id INTEGER PRIMARY KEY AUTOINCREMENT, serviceName TEXT NOT NULL, requestType TEXT NOT NULL, requestCount INTEGER NOT NULL, responseCount INTEGER NOT NULL, observedSizeSmallest INTEGER NOT NULL, observedSizeLargest INTEGER NOT NULL);"

.field private static final _DB_CREATE_TABLE_RESPONSES:Ljava/lang/String; = "CREATE TABLE IF NOT EXISTS responses (id INTEGER PRIMARY KEY AUTOINCREMENT, requestId INTEGER NOT NULL, responseTime INTEGER NOT NULL, responseSize INTEGER NOT NULL,responseCode INTEGER NOT NULL DEFAULT 0);"

.field private static volatile _Instance:Lcom/getjar/sdk/data/DBRequestStatistics; = null

.field private static final _MaxResponseRecordsCap:I = 0x258


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

    sput-object v0, Lcom/getjar/sdk/data/DBRequestStatistics;->_Instance:Lcom/getjar/sdk/data/DBRequestStatistics;

    .line 64
    new-array v0, v4, [Ljava/lang/String;

    const-string v1, "requests"

    aput-object v1, v0, v2

    const-string v1, "responses"

    aput-object v1, v0, v3

    sput-object v0, Lcom/getjar/sdk/data/DBRequestStatistics;->DB_TABLE_NAMES:[Ljava/lang/String;

    .line 65
    new-array v0, v4, [Ljava/lang/String;

    const-string v1, "CREATE TABLE IF NOT EXISTS requests (id INTEGER PRIMARY KEY AUTOINCREMENT, serviceName TEXT NOT NULL, requestType TEXT NOT NULL, requestCount INTEGER NOT NULL, responseCount INTEGER NOT NULL, observedSizeSmallest INTEGER NOT NULL, observedSizeLargest INTEGER NOT NULL);"

    aput-object v1, v0, v2

    const-string v1, "CREATE TABLE IF NOT EXISTS responses (id INTEGER PRIMARY KEY AUTOINCREMENT, requestId INTEGER NOT NULL, responseTime INTEGER NOT NULL, responseSize INTEGER NOT NULL,responseCode INTEGER NOT NULL DEFAULT 0);"

    aput-object v1, v0, v3

    sput-object v0, Lcom/getjar/sdk/data/DBRequestStatistics;->DB_CREATE_TABLE_COMMANDS:[Ljava/lang/String;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 25
    const-string v0, "GetJarStatisticsDB"

    const/4 v1, 0x0

    const/4 v2, 0x4

    invoke-direct {p0, p1, v0, v1, v2}, Landroid/database/sqlite/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    .line 67
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/getjar/sdk/data/DBRequestStatistics;->_databaseAccessLock:Ljava/lang/Object;

    .line 26
    return-void
.end method

.method public static declared-synchronized getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/DBRequestStatistics;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 29
    const-class v1, Lcom/getjar/sdk/data/DBRequestStatistics;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/getjar/sdk/data/DBRequestStatistics;->_Instance:Lcom/getjar/sdk/data/DBRequestStatistics;

    if-nez v0, :cond_0

    .line 30
    new-instance v0, Lcom/getjar/sdk/data/DBRequestStatistics;

    invoke-direct {v0, p0}, Lcom/getjar/sdk/data/DBRequestStatistics;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/getjar/sdk/data/DBRequestStatistics;->_Instance:Lcom/getjar/sdk/data/DBRequestStatistics;

    .line 32
    :cond_0
    sget-object v0, Lcom/getjar/sdk/data/DBRequestStatistics;->_Instance:Lcom/getjar/sdk/data/DBRequestStatistics;
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

.method private lruCapResponsesAtMaxRecords()V
    .locals 12

    .prologue
    .line 104
    iget-object v11, p0, Lcom/getjar/sdk/data/DBRequestStatistics;->_databaseAccessLock:Ljava/lang/Object;

    monitor-enter v11

    .line 105
    :try_start_0
    invoke-virtual {p0}, Lcom/getjar/sdk/data/DBRequestStatistics;->getResponseRecordCount()J

    move-result-wide v0

    const-wide/16 v2, 0x258

    cmp-long v0, v0, v2

    if-gez v0, :cond_0

    monitor-exit v11

    .line 123
    :goto_0
    return-void

    .line 106
    :cond_0
    invoke-virtual {p0}, Lcom/getjar/sdk/data/DBRequestStatistics;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string v1, "responses"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "id"

    aput-object v4, v2, v3

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const-string v7, "id DESC"

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v10

    .line 114
    .local v10, "results":Landroid/database/Cursor;
    const/4 v9, 0x0

    .line 116
    .local v9, "id":Ljava/lang/Long;
    const/16 v0, 0x258

    :try_start_1
    invoke-interface {v10, v0}, Landroid/database/Cursor;->moveToPosition(I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 117
    const/4 v0, 0x0

    invoke-interface {v10, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-result-object v9

    .line 119
    :cond_1
    :try_start_2
    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    .line 120
    invoke-virtual {p0}, Lcom/getjar/sdk/data/DBRequestStatistics;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string v1, "responses"

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

    .line 121
    .local v8, "count":I
    sget-object v0, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->STATS:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "DBRequestStatistics: lruCapResponsesAtMaxRecords() %1$d LRU rows deleted form the response statistics DB"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 122
    monitor-exit v11

    goto :goto_0

    .end local v8    # "count":I
    .end local v9    # "id":Ljava/lang/Long;
    .end local v10    # "results":Landroid/database/Cursor;
    :catchall_0
    move-exception v0

    monitor-exit v11
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0

    .line 119
    .restart local v9    # "id":Ljava/lang/Long;
    .restart local v10    # "results":Landroid/database/Cursor;
    :catchall_1
    move-exception v0

    :try_start_3
    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    throw v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
.end method


# virtual methods
.method public addResponseRecord(Lcom/getjar/sdk/comm/Request;Lcom/getjar/sdk/comm/Result;)Z
    .locals 15
    .param p1, "request"    # Lcom/getjar/sdk/comm/Request;
    .param p2, "response"    # Lcom/getjar/sdk/comm/Result;

    .prologue
    .line 131
    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'request\' can not be NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 132
    :cond_0
    if-nez p2, :cond_1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'response\' can not be NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 135
    :cond_1
    invoke-virtual/range {p0 .. p1}, Lcom/getjar/sdk/data/DBRequestStatistics;->checkForRequestEntry(Lcom/getjar/sdk/comm/Request;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 136
    invoke-virtual/range {p0 .. p1}, Lcom/getjar/sdk/data/DBRequestStatistics;->upsertRequestRecord(Lcom/getjar/sdk/comm/Request;)Z

    .line 140
    :cond_2
    const/4 v12, 0x0

    .line 141
    .local v12, "result":Z
    iget-object v14, p0, Lcom/getjar/sdk/data/DBRequestStatistics;->_databaseAccessLock:Ljava/lang/Object;

    monitor-enter v14

    .line 143
    :try_start_0
    invoke-virtual {p0}, Lcom/getjar/sdk/data/DBRequestStatistics;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string v1, "requests"

    const/4 v2, 0x0

    const-string v3, "serviceName = ? AND requestType = ?"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/Request;->getServiceName()Lcom/getjar/sdk/comm/Request$ServiceName;

    move-result-object v6

    invoke-virtual {v6}, Lcom/getjar/sdk/comm/Request$ServiceName;->name()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x1

    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/Request;->getRequestType()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    move-result-object v8

    .line 152
    .local v8, "existingRequestStats":Landroid/database/Cursor;
    :try_start_1
    invoke-interface {v8}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 154
    const/4 v0, 0x0

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v9

    .line 155
    .local v9, "requestId":I
    const/4 v0, 0x4

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v10

    .line 158
    .local v10, "responseCount":I
    new-instance v13, Landroid/content/ContentValues;

    invoke-direct {v13}, Landroid/content/ContentValues;-><init>()V

    .line 159
    .local v13, "values":Landroid/content/ContentValues;
    const-string v0, "responseCount"

    add-int/lit8 v1, v10, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v13, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 161
    sget-object v0, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->STATS:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "DBRequestStatistics: addResponseRecord() Updating request stats record [serviceName:%1$s requestType:%2$s responseCount:%3$d]"

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/Request;->getServiceName()Lcom/getjar/sdk/comm/Request$ServiceName;

    move-result-object v6

    invoke-virtual {v6}, Lcom/getjar/sdk/comm/Request$ServiceName;->name()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x1

    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/Request;->getRequestType()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x2

    add-int/lit8 v6, v10, 0x1

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 167
    invoke-virtual {p0}, Lcom/getjar/sdk/data/DBRequestStatistics;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string v1, "requests"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "id = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {v9}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v13, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 173
    :try_start_2
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    .line 174
    const/4 v8, 0x0

    .line 184
    invoke-virtual/range {p2 .. p2}, Lcom/getjar/sdk/comm/Result;->getEstimatedResponseSizeInBytes()I

    move-result v11

    .line 185
    .local v11, "responseSizeInBytes":I
    new-instance v13, Landroid/content/ContentValues;

    .end local v13    # "values":Landroid/content/ContentValues;
    invoke-direct {v13}, Landroid/content/ContentValues;-><init>()V

    .line 186
    .restart local v13    # "values":Landroid/content/ContentValues;
    const-string v0, "requestId"

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v13, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 187
    const-string v0, "responseTime"

    invoke-virtual/range {p2 .. p2}, Lcom/getjar/sdk/comm/Result;->getResponseTime()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v13, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 188
    const-string v0, "responseSize"

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v13, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 189
    const-string v0, "responseCode"

    invoke-virtual/range {p2 .. p2}, Lcom/getjar/sdk/comm/Result;->getResponseCode()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v13, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 191
    sget-object v0, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->STATS:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "DBRequestStatistics: addResponseRecord() Inserting response stats record [serviceName:%1$s requestType:%2$s responseTime:%3$d responseSize:%4$d responseCode:%5$d]"

    const/4 v4, 0x5

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/Request;->getServiceName()Lcom/getjar/sdk/comm/Request$ServiceName;

    move-result-object v6

    invoke-virtual {v6}, Lcom/getjar/sdk/comm/Request$ServiceName;->name()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x1

    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/Request;->getRequestType()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x2

    invoke-virtual/range {p2 .. p2}, Lcom/getjar/sdk/comm/Result;->getResponseTime()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x3

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x4

    invoke-virtual/range {p2 .. p2}, Lcom/getjar/sdk/comm/Result;->getResponseCode()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 199
    invoke-virtual {p0}, Lcom/getjar/sdk/data/DBRequestStatistics;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string v1, "responses"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2, v13}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v0

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-eqz v0, :cond_4

    const/4 v12, 0x1

    .line 200
    :goto_0
    monitor-exit v14
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 203
    invoke-direct {p0}, Lcom/getjar/sdk/data/DBRequestStatistics;->lruCapResponsesAtMaxRecords()V

    .line 205
    return v12

    .line 170
    .end local v9    # "requestId":I
    .end local v10    # "responseCount":I
    .end local v11    # "responseSizeInBytes":I
    .end local v13    # "values":Landroid/content/ContentValues;
    :cond_3
    :try_start_3
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Unable to find or create a request statistics record"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 173
    :catchall_0
    move-exception v0

    :try_start_4
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    .line 174
    const/4 v8, 0x0

    throw v0

    .line 200
    .end local v8    # "existingRequestStats":Landroid/database/Cursor;
    :catchall_1
    move-exception v0

    monitor-exit v14
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    throw v0

    .line 199
    .restart local v8    # "existingRequestStats":Landroid/database/Cursor;
    .restart local v9    # "requestId":I
    .restart local v10    # "responseCount":I
    .restart local v11    # "responseSizeInBytes":I
    .restart local v13    # "values":Landroid/content/ContentValues;
    :cond_4
    const/4 v12, 0x0

    goto :goto_0
.end method

.method public checkForRequestEntry(Lcom/getjar/sdk/comm/Request;)Z
    .locals 11
    .param p1, "request"    # Lcom/getjar/sdk/comm/Request;

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 300
    if-nez p1, :cond_0

    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "\'request\' can not be NULL"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 302
    :cond_0
    iget-object v4, p0, Lcom/getjar/sdk/data/DBRequestStatistics;->_databaseAccessLock:Ljava/lang/Object;

    monitor-enter v4

    .line 303
    :try_start_0
    invoke-virtual {p0}, Lcom/getjar/sdk/data/DBRequestStatistics;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v5

    sget-object v6, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v7, "SELECT count(*) FROM %1$s WHERE serviceName = ? AND requestType = ?"

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    const-string v10, "requests"

    aput-object v10, v8, v9

    invoke-static {v6, v7, v8}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 305
    .local v0, "dbStatement":Landroid/database/sqlite/SQLiteStatement;
    const/4 v5, 0x1

    :try_start_1
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/Request;->getServiceName()Lcom/getjar/sdk/comm/Request$ServiceName;

    move-result-object v6

    invoke-virtual {v6}, Lcom/getjar/sdk/comm/Request$ServiceName;->name()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v5, v6}, Landroid/database/sqlite/SQLiteStatement;->bindString(ILjava/lang/String;)V

    .line 306
    const/4 v5, 0x2

    invoke-virtual {p1}, Lcom/getjar/sdk/comm/Request;->getRequestType()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v5, v6}, Landroid/database/sqlite/SQLiteStatement;->bindString(ILjava/lang/String;)V

    .line 307
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteStatement;->simpleQueryForLong()J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-result-wide v5

    const-wide/16 v7, 0x0

    cmp-long v5, v5, v7

    if-lez v5, :cond_1

    .line 310
    :goto_0
    :try_start_2
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteStatement;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 311
    const/4 v0, 0x0

    .line 314
    :goto_1
    :try_start_3
    monitor-exit v4

    return v2

    :cond_1
    move v2, v3

    .line 307
    goto :goto_0

    .line 312
    :catch_0
    move-exception v1

    .line 313
    .local v1, "e":Ljava/lang/Exception;
    sget-object v3, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    sget-object v3, Lcom/getjar/sdk/logging/Area;->STATS:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    or-long/2addr v5, v7

    const-string v3, "DBRequestStatistics: checkForRequestEntry() SQLiteOpenHelper.close() failed"

    invoke-static {v5, v6, v3, v1}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 316
    .end local v0    # "dbStatement":Landroid/database/sqlite/SQLiteStatement;
    .end local v1    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v2

    monitor-exit v4
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v2

    .line 309
    .restart local v0    # "dbStatement":Landroid/database/sqlite/SQLiteStatement;
    :catchall_1
    move-exception v2

    .line 310
    :try_start_4
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteStatement;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 311
    const/4 v0, 0x0

    .line 314
    :goto_2
    :try_start_5
    throw v2

    .line 312
    :catch_1
    move-exception v1

    .line 313
    .restart local v1    # "e":Ljava/lang/Exception;
    sget-object v3, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    sget-object v3, Lcom/getjar/sdk/logging/Area;->STATS:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    or-long/2addr v5, v7

    const-string v3, "DBRequestStatistics: checkForRequestEntry() SQLiteOpenHelper.close() failed"

    invoke-static {v5, v6, v3, v1}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_2
.end method

.method public getAnalyticData()Ljava/util/Map;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation

    .prologue
    .line 333
    new-instance v10, Ljava/util/TreeMap;

    invoke-direct {v10}, Ljava/util/TreeMap;-><init>()V

    .line 334
    .local v10, "resultMap":Ljava/util/SortedMap;, "Ljava/util/SortedMap<Ljava/lang/String;Ljava/lang/Float;>;"
    iget-object v11, p0, Lcom/getjar/sdk/data/DBRequestStatistics;->_databaseAccessLock:Ljava/lang/Object;

    monitor-enter v11

    .line 337
    :try_start_0
    invoke-virtual {p0}, Lcom/getjar/sdk/data/DBRequestStatistics;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v2, "SELECT count(requestCount) FROM %1$s"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    const-string v5, "requests"

    aput-object v5, v3, v4

    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    move-result-object v9

    .line 339
    .local v9, "dbStatement":Landroid/database/sqlite/SQLiteStatement;
    :try_start_1
    const-string v0, "Overall: total number of requests"

    invoke-virtual {v9}, Landroid/database/sqlite/SQLiteStatement;->simpleQueryForLong()J

    move-result-wide v1

    long-to-float v1, v1

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-interface {v10, v0, v1}, Ljava/util/SortedMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 341
    :try_start_2
    invoke-virtual {v9}, Landroid/database/sqlite/SQLiteStatement;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    const/4 v9, 0x0

    .line 345
    :goto_0
    :try_start_3
    invoke-virtual {p0}, Lcom/getjar/sdk/data/DBRequestStatistics;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v2, "SELECT count(responseCount) FROM %1$s"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    const-string v5, "requests"

    aput-object v5, v3, v4

    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    move-result-object v9

    .line 347
    :try_start_4
    const-string v0, "Overall: total number of responses"

    invoke-virtual {v9}, Landroid/database/sqlite/SQLiteStatement;->simpleQueryForLong()J

    move-result-wide v1

    long-to-float v1, v1

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-interface {v10, v0, v1}, Ljava/util/SortedMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    .line 349
    :try_start_5
    invoke-virtual {v9}, Landroid/database/sqlite/SQLiteStatement;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    const/4 v9, 0x0

    .line 353
    :goto_1
    :try_start_6
    invoke-virtual {p0}, Lcom/getjar/sdk/data/DBRequestStatistics;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string v1, "responses"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "responseCode"

    aput-object v4, v2, v3

    const/4 v3, 0x1

    const-string v4, "count(responseCode)"

    aput-object v4, v2, v3

    const/4 v3, 0x0

    const/4 v4, 0x0

    const-string v5, "responseCode"

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    move-result-object v8

    .line 355
    .local v8, "cursor":Landroid/database/Cursor;
    :goto_2
    :try_start_7
    invoke-interface {v8}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 356
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "Overall: number of responses [response code: %1$d]"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-interface {v8, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-interface {v8, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    int-to-float v1, v1

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-interface {v10, v0, v1}, Ljava/util/SortedMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    goto :goto_2

    .line 361
    :catchall_0
    move-exception v0

    :try_start_8
    invoke-interface {v8}, Landroid/database/Cursor;->close()V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_5
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    const/4 v8, 0x0

    :goto_3
    :try_start_9
    throw v0

    .line 387
    .end local v8    # "cursor":Landroid/database/Cursor;
    .end local v9    # "dbStatement":Landroid/database/sqlite/SQLiteStatement;
    :catchall_1
    move-exception v0

    monitor-exit v11
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    throw v0

    .line 341
    .restart local v9    # "dbStatement":Landroid/database/sqlite/SQLiteStatement;
    :catchall_2
    move-exception v0

    :try_start_a
    invoke-virtual {v9}, Landroid/database/sqlite/SQLiteStatement;->close()V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_1
    .catchall {:try_start_a .. :try_end_a} :catchall_1

    const/4 v9, 0x0

    :goto_4
    :try_start_b
    throw v0
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_1

    .line 349
    :catchall_3
    move-exception v0

    :try_start_c
    invoke-virtual {v9}, Landroid/database/sqlite/SQLiteStatement;->close()V
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_3
    .catchall {:try_start_c .. :try_end_c} :catchall_1

    const/4 v9, 0x0

    :goto_5
    :try_start_d
    throw v0
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_1

    .line 361
    .restart local v8    # "cursor":Landroid/database/Cursor;
    :cond_0
    :try_start_e
    invoke-interface {v8}, Landroid/database/Cursor;->close()V
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_4
    .catchall {:try_start_e .. :try_end_e} :catchall_1

    const/4 v8, 0x0

    .line 367
    :goto_6
    :try_start_f
    invoke-virtual {p0}, Lcom/getjar/sdk/data/DBRequestStatistics;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string v1, "responses"

    const/4 v2, 0x6

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "min(responseTime)"

    aput-object v4, v2, v3

    const/4 v3, 0x1

    const-string v4, "max(responseTime)"

    aput-object v4, v2, v3

    const/4 v3, 0x2

    const-string v4, "avg(responseTime)"

    aput-object v4, v2, v3

    const/4 v3, 0x3

    const-string v4, "min(responseSize)"

    aput-object v4, v2, v3

    const/4 v3, 0x4

    const-string v4, "max(responseSize)"

    aput-object v4, v2, v3

    const/4 v3, 0x5

    const-string v4, "avg(responseSize)"

    aput-object v4, v2, v3

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_1

    move-result-object v8

    .line 376
    :try_start_10
    invoke-interface {v8}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 377
    const-string v0, "Overall: min response time"

    const/4 v1, 0x0

    invoke-interface {v8, v1}, Landroid/database/Cursor;->getFloat(I)F

    move-result v1

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-interface {v10, v0, v1}, Ljava/util/SortedMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 378
    const-string v0, "Overall: max response time"

    const/4 v1, 0x1

    invoke-interface {v8, v1}, Landroid/database/Cursor;->getFloat(I)F

    move-result v1

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-interface {v10, v0, v1}, Ljava/util/SortedMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 379
    const-string v0, "Overall: avg response time"

    const/4 v1, 0x2

    invoke-interface {v8, v1}, Landroid/database/Cursor;->getFloat(I)F

    move-result v1

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-interface {v10, v0, v1}, Ljava/util/SortedMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 380
    const-string v0, "Overall: min response size"

    const/4 v1, 0x3

    invoke-interface {v8, v1}, Landroid/database/Cursor;->getFloat(I)F

    move-result v1

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-interface {v10, v0, v1}, Ljava/util/SortedMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 381
    const-string v0, "Overall: max response size"

    const/4 v1, 0x4

    invoke-interface {v8, v1}, Landroid/database/Cursor;->getFloat(I)F

    move-result v1

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-interface {v10, v0, v1}, Ljava/util/SortedMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 382
    const-string v0, "Overall: avg response size"

    const/4 v1, 0x5

    invoke-interface {v8, v1}, Landroid/database/Cursor;->getFloat(I)F

    move-result v1

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-interface {v10, v0, v1}, Ljava/util/SortedMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_4

    .line 385
    :cond_1
    :try_start_11
    invoke-interface {v8}, Landroid/database/Cursor;->close()V
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_11} :catch_6
    .catchall {:try_start_11 .. :try_end_11} :catchall_1

    const/4 v8, 0x0

    .line 387
    :goto_7
    :try_start_12
    monitor-exit v11
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_1

    .line 413
    return-object v10

    .line 385
    :catchall_4
    move-exception v0

    :try_start_13
    invoke-interface {v8}, Landroid/database/Cursor;->close()V
    :try_end_13
    .catch Ljava/lang/Exception; {:try_start_13 .. :try_end_13} :catch_7
    .catchall {:try_start_13 .. :try_end_13} :catchall_1

    const/4 v8, 0x0

    :goto_8
    :try_start_14
    throw v0
    :try_end_14
    .catchall {:try_start_14 .. :try_end_14} :catchall_1

    .line 341
    .end local v8    # "cursor":Landroid/database/Cursor;
    :catch_0
    move-exception v0

    goto/16 :goto_0

    :catch_1
    move-exception v1

    goto/16 :goto_4

    .line 349
    :catch_2
    move-exception v0

    goto/16 :goto_1

    :catch_3
    move-exception v1

    goto/16 :goto_5

    .line 361
    .restart local v8    # "cursor":Landroid/database/Cursor;
    :catch_4
    move-exception v0

    goto/16 :goto_6

    :catch_5
    move-exception v1

    goto/16 :goto_3

    .line 385
    :catch_6
    move-exception v0

    goto :goto_7

    :catch_7
    move-exception v1

    goto :goto_8
.end method

.method public getResponseRecordCount()J
    .locals 8

    .prologue
    .line 89
    iget-object v2, p0, Lcom/getjar/sdk/data/DBRequestStatistics;->_databaseAccessLock:Ljava/lang/Object;

    monitor-enter v2

    .line 90
    :try_start_0
    invoke-virtual {p0}, Lcom/getjar/sdk/data/DBRequestStatistics;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "SELECT count(*) FROM %1$s"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    const-string v7, "responses"

    aput-object v7, v5, v6

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    move-result-object v0

    .line 92
    .local v0, "dbStatement":Landroid/database/sqlite/SQLiteStatement;
    :try_start_1
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteStatement;->simpleQueryForLong()J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-wide v3

    .line 94
    :try_start_2
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteStatement;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    const/4 v0, 0x0

    :goto_0
    :try_start_3
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    return-wide v3

    :catchall_0
    move-exception v1

    :try_start_4
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteStatement;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    const/4 v0, 0x0

    :goto_1
    :try_start_5
    throw v1

    .line 96
    .end local v0    # "dbStatement":Landroid/database/sqlite/SQLiteStatement;
    :catchall_1
    move-exception v1

    monitor-exit v2
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    throw v1

    .line 94
    .restart local v0    # "dbStatement":Landroid/database/sqlite/SQLiteStatement;
    :catch_0
    move-exception v1

    goto :goto_0

    :catch_1
    move-exception v3

    goto :goto_1
.end method

.method public onCreate(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 2
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .prologue
    .line 72
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    sget-object v1, Lcom/getjar/sdk/data/DBRequestStatistics;->DB_CREATE_TABLE_COMMANDS:[Ljava/lang/String;

    array-length v1, v1

    if-ge v0, v1, :cond_0

    .line 73
    sget-object v1, Lcom/getjar/sdk/data/DBRequestStatistics;->DB_CREATE_TABLE_COMMANDS:[Ljava/lang/String;

    aget-object v1, v1, v0

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 72
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 75
    :cond_0
    return-void
.end method

.method public onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 8
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "oldVersion"    # I
    .param p3, "newVersion"    # I

    .prologue
    .line 80
    sget-object v1, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->STATS:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "DBRequestStatistics: onUpgrade() Upgrading DB %1$s from version %2$d to %3$d (deletes all data)"

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    const-string v7, "GetJarStatisticsDB"

    aput-object v7, v5, v6

    const/4 v6, 0x1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x2

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    .line 81
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    sget-object v1, Lcom/getjar/sdk/data/DBRequestStatistics;->DB_TABLE_NAMES:[Ljava/lang/String;

    array-length v1, v1

    if-ge v0, v1, :cond_0

    .line 82
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "DROP TABLE IF EXISTS "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lcom/getjar/sdk/data/DBRequestStatistics;->DB_TABLE_NAMES:[Ljava/lang/String;

    aget-object v2, v2, v0

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 81
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 84
    :cond_0
    invoke-virtual {p0, p1}, Lcom/getjar/sdk/data/DBRequestStatistics;->onCreate(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 85
    return-void
.end method

.method public upsertRequestRecord(Lcom/getjar/sdk/comm/Request;)Z
    .locals 18
    .param p1, "request"    # Lcom/getjar/sdk/comm/Request;

    .prologue
    .line 214
    if-nez p1, :cond_0

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\'request\' can not be NULL"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 224
    :cond_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getjar/sdk/data/DBRequestStatistics;->_databaseAccessLock:Ljava/lang/Object;

    move-object/from16 v17, v0

    monitor-enter v17

    .line 227
    :try_start_0
    invoke-virtual/range {p0 .. p0}, Lcom/getjar/sdk/data/DBRequestStatistics;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    const-string v2, "requests"

    const/4 v3, 0x0

    const-string v4, "serviceName = ? AND requestType = ?"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/String;

    const/4 v6, 0x0

    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/Request;->getServiceName()Lcom/getjar/sdk/comm/Request$ServiceName;

    move-result-object v7

    invoke-virtual {v7}, Lcom/getjar/sdk/comm/Request$ServiceName;->name()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x1

    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/Request;->getRequestType()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-virtual/range {v1 .. v8}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v9

    .line 236
    .local v9, "existingRequestStats":Landroid/database/Cursor;
    :try_start_1
    invoke-interface {v9}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 239
    const/4 v1, 0x0

    invoke-interface {v9, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v10

    .line 240
    .local v10, "id":I
    const/4 v1, 0x3

    invoke-interface {v9, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v13

    .line 241
    .local v13, "requestCount":I
    const/4 v1, 0x4

    invoke-interface {v9, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v15

    .line 242
    .local v15, "responseCount":I
    const/4 v1, 0x5

    invoke-interface {v9, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v12

    .line 243
    .local v12, "observedSizeSmallest":I
    const/4 v1, 0x6

    invoke-interface {v9, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v11

    .line 246
    .local v11, "observedSizeLarges":I
    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/Request;->getEstimatedRequestSizeInBytes()I

    move-result v14

    .line 247
    .local v14, "requestSize":I
    new-instance v16, Landroid/content/ContentValues;

    invoke-direct/range {v16 .. v16}, Landroid/content/ContentValues;-><init>()V

    .line 248
    .local v16, "values":Landroid/content/ContentValues;
    const-string v1, "requestCount"

    add-int/lit8 v2, v13, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    move-object/from16 v0, v16

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 249
    if-ge v14, v12, :cond_1

    .line 250
    move v12, v14

    .line 252
    :cond_1
    if-le v14, v11, :cond_2

    .line 253
    move v11, v14

    .line 255
    :cond_2
    const-string v1, "observedSizeSmallest"

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    move-object/from16 v0, v16

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 256
    const-string v1, "observedSizeLargest"

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    move-object/from16 v0, v16

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 258
    sget-object v1, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->STATS:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "DBRequestStatistics: upsertRequestRecord() Updating request stats record [serviceName:%1$s requestType:%2$s requestCount:%3$d responseCount:%4$d observedSizeSmallest:%5$d observedSizeLargest:%6$d]"

    const/4 v5, 0x6

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/Request;->getServiceName()Lcom/getjar/sdk/comm/Request$ServiceName;

    move-result-object v7

    invoke-virtual {v7}, Lcom/getjar/sdk/comm/Request$ServiceName;->name()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x1

    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/Request;->getRequestType()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x2

    add-int/lit8 v7, v13, 0x1

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x3

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x4

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x5

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 267
    invoke-virtual/range {p0 .. p0}, Lcom/getjar/sdk/data/DBRequestStatistics;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    const-string v2, "requests"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "id = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {v10}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    move-object/from16 v0, v16

    invoke-virtual {v1, v2, v0, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-result v1

    if-lez v1, :cond_3

    const/4 v1, 0x1

    .line 292
    :goto_0
    :try_start_2
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    .line 293
    const/4 v9, 0x0

    monitor-exit v17
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .end local v10    # "id":I
    .end local v11    # "observedSizeLarges":I
    .end local v12    # "observedSizeSmallest":I
    .end local v13    # "requestCount":I
    .end local v15    # "responseCount":I
    :goto_1
    return v1

    .line 267
    .restart local v10    # "id":I
    .restart local v11    # "observedSizeLarges":I
    .restart local v12    # "observedSizeSmallest":I
    .restart local v13    # "requestCount":I
    .restart local v15    # "responseCount":I
    :cond_3
    const/4 v1, 0x0

    goto :goto_0

    .line 271
    .end local v10    # "id":I
    .end local v11    # "observedSizeLarges":I
    .end local v12    # "observedSizeSmallest":I
    .end local v13    # "requestCount":I
    .end local v14    # "requestSize":I
    .end local v15    # "responseCount":I
    .end local v16    # "values":Landroid/content/ContentValues;
    :cond_4
    :try_start_3
    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/Request;->getEstimatedRequestSizeInBytes()I

    move-result v14

    .line 272
    .restart local v14    # "requestSize":I
    new-instance v16, Landroid/content/ContentValues;

    invoke-direct/range {v16 .. v16}, Landroid/content/ContentValues;-><init>()V

    .line 273
    .restart local v16    # "values":Landroid/content/ContentValues;
    const-string v1, "serviceName"

    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/Request;->getServiceName()Lcom/getjar/sdk/comm/Request$ServiceName;

    move-result-object v2

    invoke-virtual {v2}, Lcom/getjar/sdk/comm/Request$ServiceName;->name()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v16

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 274
    const-string v1, "requestType"

    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/Request;->getRequestType()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v16

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 275
    const-string v1, "requestCount"

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    move-object/from16 v0, v16

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 276
    const-string v1, "responseCount"

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    move-object/from16 v0, v16

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 277
    const-string v1, "observedSizeSmallest"

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    move-object/from16 v0, v16

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 278
    const-string v1, "observedSizeLargest"

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    move-object/from16 v0, v16

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 280
    sget-object v1, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->STATS:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "DBRequestStatistics: upsertRequestRecord() Inserting request stats record [serviceName:%1$s requestType:%2$s requestCount:%3$d responseCount:%4$d observedSizeSmallest:%5$d observedSizeLargest:%6$d]"

    const/4 v5, 0x6

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/Request;->getServiceName()Lcom/getjar/sdk/comm/Request$ServiceName;

    move-result-object v7

    invoke-virtual {v7}, Lcom/getjar/sdk/comm/Request$ServiceName;->name()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x1

    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/Request;->getRequestType()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x2

    const/4 v7, 0x1

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x3

    const/4 v7, 0x0

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x4

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x5

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 289
    invoke-virtual/range {p0 .. p0}, Lcom/getjar/sdk/data/DBRequestStatistics;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    const-string v2, "requests"

    const/4 v3, 0x0

    move-object/from16 v0, v16

    invoke-virtual {v1, v2, v3, v0}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    move-result-wide v1

    const-wide/16 v3, -0x1

    cmp-long v1, v1, v3

    if-eqz v1, :cond_5

    const/4 v1, 0x1

    .line 292
    :goto_2
    :try_start_4
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    .line 293
    const/4 v9, 0x0

    monitor-exit v17

    goto/16 :goto_1

    .line 295
    .end local v9    # "existingRequestStats":Landroid/database/Cursor;
    .end local v14    # "requestSize":I
    .end local v16    # "values":Landroid/content/ContentValues;
    :catchall_0
    move-exception v1

    monitor-exit v17
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    throw v1

    .line 289
    .restart local v9    # "existingRequestStats":Landroid/database/Cursor;
    .restart local v14    # "requestSize":I
    .restart local v16    # "values":Landroid/content/ContentValues;
    :cond_5
    const/4 v1, 0x0

    goto :goto_2

    .line 292
    .end local v14    # "requestSize":I
    .end local v16    # "values":Landroid/content/ContentValues;
    :catchall_1
    move-exception v1

    :try_start_5
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    .line 293
    const/4 v9, 0x0

    throw v1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0
.end method
