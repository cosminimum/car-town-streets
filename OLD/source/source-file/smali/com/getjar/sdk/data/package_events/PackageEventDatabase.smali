.class Lcom/getjar/sdk/data/package_events/PackageEventDatabase;
.super Lcom/getjar/sdk/data/SyncableDatabase;
.source "PackageEventDatabase.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/getjar/sdk/data/SyncableDatabase",
        "<",
        "Lcom/getjar/sdk/data/package_events/PackageEventRecord;",
        ">;"
    }
.end annotation


# static fields
.field private static final DATABASE_NAME_PREFIX:Ljava/lang/String; = "GetJarDBPackageEvents"

.field private static final DATABASE_TABLE:Ljava/lang/String; = "packageEvents"

.field private static final DATABASE_VERSION:I = 0x1

.field private static LRU_CAP:I

.field private static volatile _Instance:Lcom/getjar/sdk/data/package_events/PackageEventDatabase;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 22
    const/4 v0, 0x0

    sput-object v0, Lcom/getjar/sdk/data/package_events/PackageEventDatabase;->_Instance:Lcom/getjar/sdk/data/package_events/PackageEventDatabase;

    .line 70
    const/16 v0, 0x3e8

    sput v0, Lcom/getjar/sdk/data/package_events/PackageEventDatabase;->LRU_CAP:I

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    const/4 v7, 0x1

    .line 56
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0, v7}, Lcom/getjar/sdk/data/SyncableDatabase;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    .line 57
    sget-object v0, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "PackageEventDatabase: Opened user specific database \'%1$s%2$d\'"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    const-string v6, "GetJarDBPackageEvents"

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

    .line 61
    return-void
.end method

.method protected static declared-synchronized getInstance()Lcom/getjar/sdk/data/package_events/PackageEventDatabase;
    .locals 3

    .prologue
    .line 26
    const-class v1, Lcom/getjar/sdk/data/package_events/PackageEventDatabase;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/getjar/sdk/data/package_events/PackageEventDatabase;->_Instance:Lcom/getjar/sdk/data/package_events/PackageEventDatabase;

    if-nez v0, :cond_0

    .line 27
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v2, "initialize() must be called first"

    invoke-direct {v0, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 26
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0

    .line 29
    :cond_0
    :try_start_1
    sget-object v0, Lcom/getjar/sdk/data/package_events/PackageEventDatabase;->_Instance:Lcom/getjar/sdk/data/package_events/PackageEventDatabase;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit v1

    return-object v0
.end method

.method protected static declared-synchronized initialize(Landroid/content/Context;)V
    .locals 8
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 34
    const-class v1, Lcom/getjar/sdk/data/package_events/PackageEventDatabase;

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

    .line 35
    :cond_0
    :try_start_1
    sget-object v0, Lcom/getjar/sdk/data/package_events/PackageEventDatabase;->_Instance:Lcom/getjar/sdk/data/package_events/PackageEventDatabase;

    if-nez v0, :cond_2

    .line 38
    sget-object v0, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v0, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "PackageEventDatabase: waitForUserAccess() START [%1$s]"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-static {}, Lcom/getjar/sdk/logging/Logger;->getShortStack()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v0, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    .line 39
    invoke-static {p0}, Lcom/getjar/sdk/comm/auth/AuthManager;->initialize(Landroid/content/Context;)V

    .line 40
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/getjar/sdk/comm/auth/AuthManager;->waitOnAuth()V

    .line 41
    sget-object v0, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v0, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    const-string v0, "PackageEventDatabase: waitForUserAccess() DONE"

    invoke-static {v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    .line 42
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

    .line 45
    :cond_1
    new-instance v0, Lcom/getjar/sdk/data/package_events/PackageEventDatabase;

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "%1$s%2$d"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    const-string v6, "GetJarDBPackageEvents"

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

    invoke-direct {v0, p0, v2}, Lcom/getjar/sdk/data/package_events/PackageEventDatabase;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    sput-object v0, Lcom/getjar/sdk/data/package_events/PackageEventDatabase;->_Instance:Lcom/getjar/sdk/data/package_events/PackageEventDatabase;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 53
    monitor-exit v1

    return-void

    .line 51
    :cond_2
    :try_start_2
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v2, "PackageEventDatabase has already been initialized"

    invoke-direct {v0, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
.end method


# virtual methods
.method public addRecord(Ljava/lang/String;Lcom/getjar/sdk/data/package_events/PackageEventManager$EventType;)V
    .locals 9
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "eventType"    # Lcom/getjar/sdk/data/package_events/PackageEventManager$EventType;

    .prologue
    .line 106
    iget-object v2, p0, Lcom/getjar/sdk/data/package_events/PackageEventDatabase;->_databaseAccessLock:Ljava/lang/Object;

    monitor-enter v2

    .line 109
    :try_start_0
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v3, "\'packageName\' cannot be NULL or empty"

    invoke-direct {v1, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 122
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 110
    :cond_0
    if-nez p2, :cond_1

    :try_start_1
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v3, "\'eventType\' cannot be NULL"

    invoke-direct {v1, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 113
    :cond_1
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 114
    .local v0, "values":Landroid/content/ContentValues;
    const-string v1, "packageName"

    invoke-virtual {v0, v1, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 115
    const-string v1, "timestamp"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 116
    const-string v1, "eventType"

    invoke-virtual {p2}, Lcom/getjar/sdk/data/package_events/PackageEventManager$EventType;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 117
    const-string v1, "synced"

    const/4 v3, 0x0

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 120
    invoke-virtual {p0}, Lcom/getjar/sdk/data/package_events/PackageEventDatabase;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    const-string v3, "packageEvents"

    const/4 v4, 0x0

    invoke-virtual {v1, v3, v4, v0}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 121
    sget-object v1, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v1, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "PackageEventDatabase: Added a \'%1$s\' record for \'%2$s\'"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-virtual {p2}, Lcom/getjar/sdk/data/package_events/PackageEventManager$EventType;->name()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x1

    aput-object p1, v6, v7

    invoke-static {v1, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v4, v1}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 122
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 125
    invoke-virtual {p0}, Lcom/getjar/sdk/data/package_events/PackageEventDatabase;->trimLruEntries()V

    .line 126
    return-void
.end method

.method protected getLRUCap()I
    .locals 1

    .prologue
    .line 93
    sget v0, Lcom/getjar/sdk/data/package_events/PackageEventDatabase;->LRU_CAP:I

    return v0
.end method

.method protected getTableCreateSQL()Ljava/lang/String;
    .locals 1

    .prologue
    .line 75
    const-string v0, "CREATE TABLE IF NOT EXISTS packageEvents (id INTEGER PRIMARY KEY AUTOINCREMENT, packageName TEXT NOT NULL, timestamp INTEGER NOT NULL, eventType TEXT NOT NULL, synced INTEGER NOT NULL DEFAULT 0, UNIQUE(packageName, timestamp, eventType) ON CONFLICT REPLACE);"

    return-object v0
.end method

.method protected getTableName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 89
    const-string v0, "packageEvents"

    return-object v0
.end method

.method protected bridge synthetic loadFromDB(Landroid/database/Cursor;)Lcom/getjar/sdk/data/DatabaseRecordBase;
    .locals 1
    .param p1, "x0"    # Landroid/database/Cursor;

    .prologue
    .line 18
    invoke-virtual {p0, p1}, Lcom/getjar/sdk/data/package_events/PackageEventDatabase;->loadFromDB(Landroid/database/Cursor;)Lcom/getjar/sdk/data/package_events/PackageEventRecord;

    move-result-object v0

    return-object v0
.end method

.method protected loadFromDB(Landroid/database/Cursor;)Lcom/getjar/sdk/data/package_events/PackageEventRecord;
    .locals 1
    .param p1, "results"    # Landroid/database/Cursor;

    .prologue
    .line 98
    invoke-static {p1}, Lcom/getjar/sdk/data/package_events/PackageEventRecord;->loadFromDB(Landroid/database/Cursor;)Lcom/getjar/sdk/data/package_events/PackageEventRecord;

    move-result-object v0

    return-object v0
.end method
