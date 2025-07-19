.class public Lcom/getjar/sdk/comm/persistence/DBTransactions;
.super Landroid/database/sqlite/SQLiteOpenHelper;
.source "DBTransactions.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;,
        Lcom/getjar/sdk/comm/persistence/DBTransactions$EarnState;,
        Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;,
        Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionState;,
        Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;,
        Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;
    }
.end annotation


# static fields
.field private static final DATABASE_CREATE:Ljava/lang/String;

.field private static final DATABASE_NAME_PREFIX:Ljava/lang/String; = "GetJarDBTransactions"

.field private static final DATABASE_TABLE:Ljava/lang/String; = "transactions"

.field private static final DATABASE_VERSION:I = 0x3

.field private static volatile _Instance:Lcom/getjar/sdk/comm/persistence/DBTransactions;


# instance fields
.field private volatile _databaseAccessLock:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 97
    const/4 v0, 0x0

    sput-object v0, Lcom/getjar/sdk/comm/persistence/DBTransactions;->_Instance:Lcom/getjar/sdk/comm/persistence/DBTransactions;

    .line 115
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "CREATE TABLE IF NOT EXISTS transactions (id INTEGER PRIMARY KEY AUTOINCREMENT, clientTransactionId TEXT NOT NULL UNIQUE, timestampCreated INTEGER NOT NULL, timestampLastUpdated INTEGER NOT NULL, state TEXT NOT NULL, type TEXT NOT NULL, relatedObject TEXT, notificationState TEXT NOT NULL DEFAULT \'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;->NONE:Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;

    invoke-virtual {v1}, Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ");"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/getjar/sdk/comm/persistence/DBTransactions;->DATABASE_CREATE:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 8
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v4, 0x2

    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 87
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "%1$s%2$d"

    new-array v2, v4, [Ljava/lang/Object;

    const-string v3, "GetJarDBTransactions"

    aput-object v3, v2, v6

    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/getjar/sdk/comm/auth/AuthManager;->getUserAccessId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v7

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x3

    invoke-direct {p0, p1, v0, v1, v2}, Landroid/database/sqlite/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    .line 141
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/getjar/sdk/comm/persistence/DBTransactions;->_databaseAccessLock:Ljava/lang/Object;

    .line 92
    sget-object v0, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "DBTransactions: Opened user specific database \'%1$s%2$d\'"

    new-array v4, v4, [Ljava/lang/Object;

    const-string v5, "GetJarDBTransactions"

    aput-object v5, v4, v6

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

    .line 96
    return-void
.end method

.method public static declared-synchronized getInstance(Landroid/content/Context;)Lcom/getjar/sdk/comm/persistence/DBTransactions;
    .locals 8
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 99
    const-class v1, Lcom/getjar/sdk/comm/persistence/DBTransactions;

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

    .line 100
    :cond_0
    :try_start_1
    sget-object v0, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v0, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "DBTransactions: waitForUserAccess() START [%1$s]"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-static {}, Lcom/getjar/sdk/logging/Logger;->getShortStack()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v0, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    .line 101
    invoke-static {p0}, Lcom/getjar/sdk/comm/auth/AuthManager;->initialize(Landroid/content/Context;)V

    .line 102
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/getjar/sdk/comm/auth/AuthManager;->waitOnAuth()V

    .line 103
    sget-object v0, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v0, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    const-string v0, "DBTransactions: waitForUserAccess() DONE"

    invoke-static {v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    .line 104
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

    .line 105
    :cond_1
    sget-object v0, Lcom/getjar/sdk/comm/persistence/DBTransactions;->_Instance:Lcom/getjar/sdk/comm/persistence/DBTransactions;

    if-nez v0, :cond_2

    .line 106
    new-instance v0, Lcom/getjar/sdk/comm/persistence/DBTransactions;

    invoke-direct {v0, p0}, Lcom/getjar/sdk/comm/persistence/DBTransactions;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/getjar/sdk/comm/persistence/DBTransactions;->_Instance:Lcom/getjar/sdk/comm/persistence/DBTransactions;

    .line 108
    :cond_2
    sget-object v0, Lcom/getjar/sdk/comm/persistence/DBTransactions;->_Instance:Lcom/getjar/sdk/comm/persistence/DBTransactions;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit v1

    return-object v0
.end method

.method private getTransactionBucketInstance(Landroid/database/Cursor;)Lcom/getjar/sdk/comm/persistence/TransactionBucket;
    .locals 18
    .param p1, "results"    # Landroid/database/Cursor;

    .prologue
    .line 343
    const/4 v12, 0x0

    move-object/from16 v0, p1

    invoke-interface {v0, v12}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    .line 344
    .local v2, "id":I
    const/4 v12, 0x1

    move-object/from16 v0, p1

    invoke-interface {v0, v12}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 345
    .local v1, "clientTransactionId":Ljava/lang/String;
    const/4 v12, 0x2

    move-object/from16 v0, p1

    invoke-interface {v0, v12}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v6

    .line 346
    .local v6, "timestampCreated":J
    const/4 v12, 0x3

    move-object/from16 v0, p1

    invoke-interface {v0, v12}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v8

    .line 347
    .local v8, "timestampLastUpdated":J
    const/4 v12, 0x4

    move-object/from16 v0, p1

    invoke-interface {v0, v12}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 348
    .local v5, "stateString":Ljava/lang/String;
    const-class v12, Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;

    const/4 v13, 0x5

    move-object/from16 v0, p1

    invoke-interface {v0, v13}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v11

    check-cast v11, Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;

    .line 349
    .local v11, "type":Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;
    const/4 v12, 0x6

    move-object/from16 v0, p1

    invoke-interface {v0, v12}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 350
    .local v4, "relatedObject":Ljava/lang/String;
    const-class v12, Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;

    const/4 v13, 0x7

    move-object/from16 v0, p1

    invoke-interface {v0, v13}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v3

    check-cast v3, Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;

    .line 353
    .local v3, "notificationState":Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;
    const/4 v10, 0x0

    .line 354
    .local v10, "transaction":Lcom/getjar/sdk/comm/persistence/TransactionBucket;
    sget-object v12, Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;->PURCHASE:Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;

    invoke-virtual {v12, v11}, Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    .line 355
    new-instance v10, Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;

    .end local v10    # "transaction":Lcom/getjar/sdk/comm/persistence/TransactionBucket;
    invoke-direct {v10}, Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;-><init>()V

    .line 365
    .restart local v10    # "transaction":Lcom/getjar/sdk/comm/persistence/TransactionBucket;
    :goto_0
    invoke-virtual {v10, v1}, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->setClientTransactionId(Ljava/lang/String;)V

    .line 366
    invoke-virtual {v10, v2}, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->setDatabaseId(I)V

    .line 367
    invoke-virtual {v10, v4}, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->setSerializedRelatedObject(Ljava/lang/String;)V

    .line 368
    invoke-virtual {v10, v5}, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->setStateString(Ljava/lang/String;)V

    .line 369
    invoke-virtual {v10, v6, v7}, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->setTimestampCreated(J)V

    .line 370
    invoke-virtual {v10, v8, v9}, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->setTimestampLastUpdated(J)V

    .line 371
    invoke-virtual {v10, v11}, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->setType(Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;)V

    .line 372
    invoke-virtual {v10, v3}, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->setNotificationState(Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;)V

    .line 375
    return-object v10

    .line 356
    :cond_0
    sget-object v12, Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;->EARN:Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;

    invoke-virtual {v12, v11}, Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_1

    .line 357
    new-instance v10, Lcom/getjar/sdk/comm/persistence/EarnBucket;

    .end local v10    # "transaction":Lcom/getjar/sdk/comm/persistence/TransactionBucket;
    invoke-direct {v10}, Lcom/getjar/sdk/comm/persistence/EarnBucket;-><init>()V

    .restart local v10    # "transaction":Lcom/getjar/sdk/comm/persistence/TransactionBucket;
    goto :goto_0

    .line 358
    :cond_1
    sget-object v12, Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;->MANAGED_OFFER:Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;

    invoke-virtual {v12, v11}, Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_2

    .line 359
    new-instance v10, Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;

    .end local v10    # "transaction":Lcom/getjar/sdk/comm/persistence/TransactionBucket;
    invoke-direct {v10}, Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;-><init>()V

    .restart local v10    # "transaction":Lcom/getjar/sdk/comm/persistence/TransactionBucket;
    goto :goto_0

    .line 361
    :cond_2
    new-instance v12, Ljava/lang/IllegalStateException;

    sget-object v13, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v14, "Unrecognized transaction type \'%1$s\'"

    const/4 v15, 0x1

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    invoke-virtual {v11}, Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;->name()Ljava/lang/String;

    move-result-object v17

    aput-object v17, v15, v16

    invoke-static {v13, v14, v15}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v12
.end method

.method private insertTransaction(Ljava/lang/String;Ljava/io/Serializable;Ljava/lang/String;Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionState;)Z
    .locals 10
    .param p1, "clientTransactionId"    # Ljava/lang/String;
    .param p2, "relatedObject"    # Ljava/io/Serializable;
    .param p3, "type"    # Ljava/lang/String;
    .param p4, "state"    # Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionState;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 385
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "\'clientTransactionId\' can not be NULL or empty"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 388
    :cond_0
    invoke-virtual {p0, p1}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->checkForRecord(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 389
    new-instance v5, Ljava/lang/IllegalStateException;

    sget-object v6, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v7, "A record with a client transaction ID of \'%1$s\' already exists in the database"

    new-array v3, v3, [Ljava/lang/Object;

    aput-object p1, v3, v4

    invoke-static {v6, v7, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v5, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 393
    :cond_1
    new-instance v2, Landroid/content/ContentValues;

    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    .line 394
    .local v2, "values":Landroid/content/ContentValues;
    const-string v5, "clientTransactionId"

    invoke-virtual {v2, v5, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 396
    if-nez p2, :cond_3

    .line 397
    const-string v5, "relatedObject"

    invoke-virtual {v2, v5}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    .line 402
    :goto_0
    const-class v5, Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;

    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 403
    const-string v5, "state"

    check-cast p4, Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;

    .end local p4    # "state":Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionState;
    invoke-virtual {p4}, Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;->name()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 407
    :cond_2
    :goto_1
    const-string v5, "type"

    invoke-virtual {v2, v5, p3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 409
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 410
    .local v0, "timestamp":J
    const-string v5, "timestampCreated"

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-virtual {v2, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 411
    const-string v5, "timestampLastUpdated"

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-virtual {v2, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 414
    iget-object v5, p0, Lcom/getjar/sdk/comm/persistence/DBTransactions;->_databaseAccessLock:Ljava/lang/Object;

    monitor-enter v5

    .line 415
    :try_start_0
    invoke-virtual {p0}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v6

    const-string v7, "transactions"

    const/4 v8, 0x0

    invoke-virtual {v6, v7, v8, v2}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v6

    const-wide/16 v8, -0x1

    cmp-long v6, v6, v8

    if-eqz v6, :cond_5

    :goto_2
    monitor-exit v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return v3

    .line 399
    .end local v0    # "timestamp":J
    .restart local p4    # "state":Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionState;
    :cond_3
    const-string v5, "relatedObject"

    invoke-static {p2}, Lcom/getjar/sdk/utilities/Base64;->encodeObject(Ljava/io/Serializable;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 404
    :cond_4
    const-class v5, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 405
    const-string v5, "state"

    check-cast p4, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    .end local p4    # "state":Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionState;
    invoke-virtual {p4}, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->name()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .restart local v0    # "timestamp":J
    :cond_5
    move v3, v4

    .line 415
    goto :goto_2

    .line 416
    :catchall_0
    move-exception v3

    :try_start_1
    monitor-exit v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v3
.end method

.method private updateTransaction(Lcom/getjar/sdk/comm/persistence/TransactionBucket;Ljava/lang/String;)Z
    .locals 13
    .param p1, "transaction"    # Lcom/getjar/sdk/comm/persistence/TransactionBucket;
    .param p2, "state"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 427
    if-nez p1, :cond_0

    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "\'transaction\' can not be NULL"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 428
    :cond_0
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->getClientTransactionId()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1

    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "\'clientTransactionId\' can not be NULL or empty"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 429
    :cond_1
    invoke-static {p2}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_2

    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "\'state\' can not be NULL or empty"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 431
    :cond_2
    sget-object v6, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    sget-object v8, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v8}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v8

    or-long/2addr v6, v8

    sget-object v8, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v9, "DBTransactions updateTransaction [clientTransactionId:%1$s] [newState:%2$s]"

    const/4 v10, 0x2

    new-array v10, v10, [Ljava/lang/Object;

    invoke-virtual {p1}, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->getClientTransactionId()Ljava/lang/String;

    move-result-object v11

    aput-object v11, v10, v5

    aput-object p2, v10, v4

    invoke-static {v8, v9, v10}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v6, v7, v8}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 432
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 433
    .local v0, "currentTime":J
    new-instance v2, Landroid/content/ContentValues;

    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    .line 434
    .local v2, "values":Landroid/content/ContentValues;
    const-string v6, "timestampLastUpdated"

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-virtual {v2, v6, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 435
    const-string v6, "state"

    invoke-virtual {v2, v6, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 438
    const/4 v3, 0x0

    .line 439
    .local v3, "wasUpdated":Z
    iget-object v6, p0, Lcom/getjar/sdk/comm/persistence/DBTransactions;->_databaseAccessLock:Ljava/lang/Object;

    monitor-enter v6

    .line 440
    :try_start_0
    invoke-virtual {p0}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v7

    const-string v8, "transactions"

    const-string v9, "clientTransactionId = ?"

    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/String;

    const/4 v11, 0x0

    invoke-virtual {p1}, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->getClientTransactionId()Ljava/lang/String;

    move-result-object v12

    aput-object v12, v10, v11

    invoke-virtual {v7, v8, v2, v9, v10}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v7

    if-lez v7, :cond_4

    move v3, v4

    .line 441
    :goto_0
    monitor-exit v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 442
    if-eqz v3, :cond_3

    .line 443
    invoke-virtual {p1, p2}, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->setStateString(Ljava/lang/String;)V

    .line 444
    invoke-virtual {p1, v0, v1}, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->setTimestampLastUpdated(J)V

    .line 446
    :cond_3
    return v3

    :cond_4
    move v3, v5

    .line 440
    goto :goto_0

    .line 441
    :catchall_0
    move-exception v4

    :try_start_1
    monitor-exit v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v4
.end method


# virtual methods
.method public checkForRecord(Ljava/lang/String;)Z
    .locals 11
    .param p1, "clientTransactionId"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 161
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "\'clientTransactionId\' can not be NULL or empty"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 162
    :cond_0
    iget-object v4, p0, Lcom/getjar/sdk/comm/persistence/DBTransactions;->_databaseAccessLock:Ljava/lang/Object;

    monitor-enter v4

    .line 163
    :try_start_0
    invoke-virtual {p0}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v5

    sget-object v6, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v7, "SELECT count(*) FROM %1$s WHERE clientTransactionId = ?"

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    const-string v10, "transactions"

    aput-object v10, v8, v9

    invoke-static {v6, v7, v8}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 165
    .local v0, "dbStatement":Landroid/database/sqlite/SQLiteStatement;
    const/4 v5, 0x1

    :try_start_1
    invoke-virtual {v0, v5, p1}, Landroid/database/sqlite/SQLiteStatement;->bindString(ILjava/lang/String;)V

    .line 166
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteStatement;->simpleQueryForLong()J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-result-wide v5

    const-wide/16 v7, 0x0

    cmp-long v5, v5, v7

    if-lez v5, :cond_1

    .line 168
    :goto_0
    :try_start_2
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteStatement;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    const/4 v0, 0x0

    :goto_1
    :try_start_3
    monitor-exit v4

    return v2

    :cond_1
    move v2, v3

    .line 166
    goto :goto_0

    .line 168
    :catch_0
    move-exception v1

    .local v1, "e":Ljava/lang/Exception;
    sget-object v3, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    sget-object v3, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    or-long/2addr v5, v7

    const-string v3, "SQLiteStatement.close() failed"

    invoke-static {v5, v6, v3, v1}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 170
    .end local v0    # "dbStatement":Landroid/database/sqlite/SQLiteStatement;
    .end local v1    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v2

    monitor-exit v4
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v2

    .line 168
    .restart local v0    # "dbStatement":Landroid/database/sqlite/SQLiteStatement;
    :catchall_1
    move-exception v2

    :try_start_4
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteStatement;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    const/4 v0, 0x0

    :goto_2
    :try_start_5
    throw v2

    :catch_1
    move-exception v1

    .restart local v1    # "e":Ljava/lang/Exception;
    sget-object v3, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    sget-object v3, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    or-long/2addr v5, v7

    const-string v3, "SQLiteStatement.close() failed"

    invoke-static {v5, v6, v3, v1}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_2
.end method

.method public deleteTransaction(Ljava/lang/String;)Z
    .locals 9
    .param p1, "clientTransactionId"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 293
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\'clientTransactionId\' can not be NULL or empty"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 294
    :cond_0
    iget-object v3, p0, Lcom/getjar/sdk/comm/persistence/DBTransactions;->_databaseAccessLock:Ljava/lang/Object;

    monitor-enter v3

    .line 295
    :try_start_0
    invoke-virtual {p0}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v4

    const-string v5, "transactions"

    const-string v6, "clientTransactionId = ?"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/String;

    const/4 v8, 0x0

    aput-object p1, v7, v8

    invoke-virtual {v4, v5, v6, v7}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    .line 296
    .local v0, "deleteCount":I
    if-lez v0, :cond_1

    :goto_0
    monitor-exit v3

    return v1

    :cond_1
    move v1, v2

    goto :goto_0

    .line 297
    .end local v0    # "deleteCount":I
    :catchall_0
    move-exception v1

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getRecordCount()J
    .locals 10

    .prologue
    .line 149
    iget-object v3, p0, Lcom/getjar/sdk/comm/persistence/DBTransactions;->_databaseAccessLock:Ljava/lang/Object;

    monitor-enter v3

    .line 150
    :try_start_0
    invoke-virtual {p0}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "SELECT count(*) FROM %1$s"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    const-string v8, "transactions"

    aput-object v8, v6, v7

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 152
    .local v0, "dbStatement":Landroid/database/sqlite/SQLiteStatement;
    :try_start_1
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteStatement;->simpleQueryForLong()J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-result-wide v4

    .line 154
    :try_start_2
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteStatement;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    const/4 v0, 0x0

    :goto_0
    :try_start_3
    monitor-exit v3

    return-wide v4

    :catch_0
    move-exception v1

    .local v1, "e":Ljava/lang/Exception;
    sget-object v2, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    sget-object v2, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v8

    or-long/2addr v6, v8

    const-string v2, "SQLiteStatement.close() failed"

    invoke-static {v6, v7, v2, v1}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 156
    .end local v0    # "dbStatement":Landroid/database/sqlite/SQLiteStatement;
    .end local v1    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v2

    .line 154
    .restart local v0    # "dbStatement":Landroid/database/sqlite/SQLiteStatement;
    :catchall_1
    move-exception v2

    :try_start_4
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteStatement;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    const/4 v0, 0x0

    :goto_1
    :try_start_5
    throw v2

    :catch_1
    move-exception v1

    .restart local v1    # "e":Ljava/lang/Exception;
    sget-object v4, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    sget-object v6, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    or-long/2addr v4, v6

    const-string v6, "SQLiteStatement.close() failed"

    invoke-static {v4, v5, v6, v1}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_1
.end method

.method public insertEarnTransaction(Ljava/lang/String;Ljava/io/Serializable;)Z
    .locals 2
    .param p1, "clientTransactionId"    # Ljava/lang/String;
    .param p2, "relatedObject"    # Ljava/io/Serializable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 194
    sget-object v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;->EARN:Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;

    invoke-virtual {v0}, Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;->name()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;->CREATED:Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;

    invoke-direct {p0, p1, p2, v0, v1}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->insertTransaction(Ljava/lang/String;Ljava/io/Serializable;Ljava/lang/String;Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionState;)Z

    move-result v0

    return v0
.end method

.method public insertManagedOfferTransaction(Ljava/lang/String;Ljava/io/Serializable;Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;)Z
    .locals 1
    .param p1, "clientTransactionId"    # Ljava/lang/String;
    .param p2, "relatedObject"    # Ljava/io/Serializable;
    .param p3, "managedOfferState"    # Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 186
    sget-object v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;->MANAGED_OFFER:Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;

    invoke-virtual {v0}, Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;->name()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, p2, v0, p3}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->insertTransaction(Ljava/lang/String;Ljava/io/Serializable;Ljava/lang/String;Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionState;)Z

    move-result v0

    return v0
.end method

.method public insertPurchaseTransaction(Ljava/lang/String;Ljava/io/Serializable;)Z
    .locals 2
    .param p1, "clientTransactionId"    # Ljava/lang/String;
    .param p2, "relatedObject"    # Ljava/io/Serializable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 178
    sget-object v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;->PURCHASE:Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;

    invoke-virtual {v0}, Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;->name()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;->CREATED:Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;

    invoke-direct {p0, p1, p2, v0, v1}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->insertTransaction(Ljava/lang/String;Ljava/io/Serializable;Ljava/lang/String;Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionState;)Z

    move-result v0

    return v0
.end method

.method public loadAllTransactions()Ljava/util/List;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/getjar/sdk/comm/persistence/TransactionBucket;",
            ">;"
        }
    .end annotation

    .prologue
    .line 322
    iget-object v10, p0, Lcom/getjar/sdk/comm/persistence/DBTransactions;->_databaseAccessLock:Ljava/lang/Object;

    monitor-enter v10

    .line 323
    :try_start_0
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 324
    .local v9, "transactionList":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/comm/persistence/TransactionBucket;>;"
    invoke-virtual {p0}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string v1, "transactions"

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const-string v7, "timestampCreated DESC"

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    move-result-object v8

    .line 326
    .local v8, "results":Landroid/database/Cursor;
    :goto_0
    :try_start_1
    invoke-interface {v8}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 327
    invoke-direct {p0, v8}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->getTransactionBucketInstance(Landroid/database/Cursor;)Lcom/getjar/sdk/comm/persistence/TransactionBucket;

    move-result-object v0

    invoke-interface {v9, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 330
    :catchall_0
    move-exception v0

    :try_start_2
    invoke-interface {v8}, Landroid/database/Cursor;->close()V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    const/4 v8, 0x0

    :goto_1
    :try_start_3
    throw v0

    .line 333
    .end local v8    # "results":Landroid/database/Cursor;
    .end local v9    # "transactionList":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/comm/persistence/TransactionBucket;>;"
    :catchall_1
    move-exception v0

    monitor-exit v10
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw v0

    .line 330
    .restart local v8    # "results":Landroid/database/Cursor;
    .restart local v9    # "transactionList":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/comm/persistence/TransactionBucket;>;"
    :cond_0
    :try_start_4
    invoke-interface {v8}, Landroid/database/Cursor;->close()V
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    const/4 v8, 0x0

    .line 332
    :goto_2
    :try_start_5
    monitor-exit v10
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    return-object v9

    .line 330
    :catch_0
    move-exception v0

    goto :goto_2

    :catch_1
    move-exception v1

    goto :goto_1
.end method

.method public loadTransaction(Ljava/lang/String;)Lcom/getjar/sdk/comm/persistence/TransactionBucket;
    .locals 11
    .param p1, "clientTransactionId"    # Ljava/lang/String;

    .prologue
    .line 305
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'clientTransactionId\' can not be NULL or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 306
    :cond_0
    iget-object v10, p0, Lcom/getjar/sdk/comm/persistence/DBTransactions;->_databaseAccessLock:Ljava/lang/Object;

    monitor-enter v10

    .line 307
    const/4 v9, 0x0

    .line 308
    .local v9, "transaction":Lcom/getjar/sdk/comm/persistence/TransactionBucket;
    :try_start_0
    invoke-virtual {p0}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string v1, "transactions"

    const/4 v2, 0x0

    const-string v3, "clientTransactionId = ?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    aput-object p1, v4, v5

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    move-result-object v8

    .line 310
    .local v8, "results":Landroid/database/Cursor;
    :try_start_1
    invoke-interface {v8}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 311
    invoke-direct {p0, v8}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->getTransactionBucketInstance(Landroid/database/Cursor;)Lcom/getjar/sdk/comm/persistence/TransactionBucket;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v9

    .line 314
    :cond_1
    :try_start_2
    invoke-interface {v8}, Landroid/database/Cursor;->close()V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    const/4 v8, 0x0

    .line 316
    :goto_0
    :try_start_3
    monitor-exit v10
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    return-object v9

    .line 314
    :catchall_0
    move-exception v0

    :try_start_4
    invoke-interface {v8}, Landroid/database/Cursor;->close()V
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    const/4 v8, 0x0

    :goto_1
    :try_start_5
    throw v0

    .line 317
    .end local v8    # "results":Landroid/database/Cursor;
    :catchall_1
    move-exception v0

    monitor-exit v10
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    throw v0

    .line 314
    .restart local v8    # "results":Landroid/database/Cursor;
    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v1

    goto :goto_1
.end method

.method public onCreate(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .prologue
    .line 130
    sget-object v0, Lcom/getjar/sdk/comm/persistence/DBTransactions;->DATABASE_CREATE:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 131
    return-void
.end method

.method public onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 7
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "oldVersion"    # I
    .param p3, "newVersion"    # I

    .prologue
    .line 136
    sget-object v0, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "Upgrading database from version %1$d to %2$d, which will destroy all old data"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x1

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 137
    const-string v0, "DROP TABLE IF EXISTS transactions"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 138
    invoke-virtual {p0, p1}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->onCreate(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 139
    return-void
.end method

.method public updateEarnTransaction(Lcom/getjar/sdk/comm/persistence/EarnBucket;Lcom/getjar/sdk/comm/persistence/DBTransactions$EarnState;)Z
    .locals 1
    .param p1, "transaction"    # Lcom/getjar/sdk/comm/persistence/EarnBucket;
    .param p2, "state"    # Lcom/getjar/sdk/comm/persistence/DBTransactions$EarnState;

    .prologue
    .line 212
    invoke-virtual {p2}, Lcom/getjar/sdk/comm/persistence/DBTransactions$EarnState;->name()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->updateTransaction(Lcom/getjar/sdk/comm/persistence/TransactionBucket;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public updateEarnTransactionNotificationState(Lcom/getjar/sdk/comm/persistence/EarnBucket;Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;)Z
    .locals 12
    .param p1, "transaction"    # Lcom/getjar/sdk/comm/persistence/EarnBucket;
    .param p2, "newState"    # Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;

    .prologue
    .line 250
    if-nez p1, :cond_0

    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "\'transaction\' can not be NULL"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 251
    :cond_0
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/persistence/EarnBucket;->getClientTransactionId()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "\'clientTransactionId\' can not be NULL or empty"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 252
    :cond_1
    if-nez p2, :cond_2

    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "\'newState\' can not be NULL"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 255
    :cond_2
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/persistence/EarnBucket;->getNotificationState()Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;

    move-result-object v2

    .line 256
    .local v2, "oldState":Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;
    sget-object v5, Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;->NONE:Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;

    invoke-virtual {v5, v2}, Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_3

    sget-object v5, Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;->NONE:Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;

    invoke-virtual {v5, p2}, Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 257
    new-instance v5, Ljava/lang/IllegalStateException;

    const-string v6, "We can not update state from having sent a notification to not having sent a notification"

    invoke-direct {v5, v6}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 259
    :cond_3
    sget-object v5, Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;->FAILED:Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;

    invoke-virtual {v5, v2}, Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_4

    sget-object v5, Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;->SUCCEEDED:Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;

    invoke-virtual {v5, v2}, Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_5

    :cond_4
    sget-object v5, Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;->NO_GOLD:Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;

    invoke-virtual {v5, p2}, Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_5

    .line 260
    new-instance v5, Ljava/lang/IllegalStateException;

    const-string v6, "We can not update state from having sent a final notification to having sent a NO_GOLD notification"

    invoke-direct {v5, v6}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 262
    :cond_5
    sget-object v5, Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;->FAILED:Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;

    invoke-virtual {v5, v2}, Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_6

    sget-object v5, Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;->SUCCEEDED:Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;

    invoke-virtual {v5, p2}, Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 263
    new-instance v5, Ljava/lang/IllegalStateException;

    const-string v6, "We can not update state from having sent a failed notification to having sent a succeeded notification"

    invoke-direct {v5, v6}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 265
    :cond_6
    sget-object v5, Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;->SUCCEEDED:Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;

    invoke-virtual {v5, v2}, Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_7

    sget-object v5, Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;->FAILED:Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;

    invoke-virtual {v5, p2}, Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_7

    .line 266
    new-instance v5, Ljava/lang/IllegalStateException;

    const-string v6, "We can not update state from having sent a succeeded notification to having sent a failed notification"

    invoke-direct {v5, v6}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 270
    :cond_7
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 271
    .local v0, "currentTime":J
    new-instance v3, Landroid/content/ContentValues;

    invoke-direct {v3}, Landroid/content/ContentValues;-><init>()V

    .line 272
    .local v3, "values":Landroid/content/ContentValues;
    const-string v5, "timestampLastUpdated"

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-virtual {v3, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 273
    const-string v5, "notificationState"

    invoke-virtual {p2}, Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;->name()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 276
    const/4 v4, 0x0

    .line 277
    .local v4, "wasUpdated":Z
    iget-object v6, p0, Lcom/getjar/sdk/comm/persistence/DBTransactions;->_databaseAccessLock:Ljava/lang/Object;

    monitor-enter v6

    .line 278
    :try_start_0
    invoke-virtual {p0}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v5

    const-string v7, "transactions"

    const-string v8, "clientTransactionId = ?"

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/String;

    const/4 v10, 0x0

    invoke-virtual {p1}, Lcom/getjar/sdk/comm/persistence/EarnBucket;->getClientTransactionId()Ljava/lang/String;

    move-result-object v11

    aput-object v11, v9, v10

    invoke-virtual {v5, v7, v3, v8, v9}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v5

    if-lez v5, :cond_9

    const/4 v4, 0x1

    .line 279
    :goto_0
    monitor-exit v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 280
    if-eqz v4, :cond_8

    .line 281
    invoke-virtual {p1, p2}, Lcom/getjar/sdk/comm/persistence/EarnBucket;->setNotificationState(Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;)V

    .line 282
    invoke-virtual {p1, v0, v1}, Lcom/getjar/sdk/comm/persistence/EarnBucket;->setTimestampLastUpdated(J)V

    .line 283
    sget-object v5, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    sget-object v7, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    or-long/2addr v5, v7

    sget-object v7, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    or-long/2addr v5, v7

    sget-object v7, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v8, "DBTransactions: updateEarnTransactionNotificationState() Updated from %1$s to %2$s"

    const/4 v9, 0x2

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    aput-object v2, v9, v10

    const/4 v10, 0x1

    aput-object p2, v9, v10

    invoke-static {v7, v8, v9}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v6, v7}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 285
    :cond_8
    return v4

    .line 278
    :cond_9
    const/4 v4, 0x0

    goto :goto_0

    .line 279
    :catchall_0
    move-exception v5

    :try_start_1
    monitor-exit v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v5
.end method

.method public updateManagedOfferTransaction(Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;)Z
    .locals 1
    .param p1, "transaction"    # Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;
    .param p2, "state"    # Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    .prologue
    .line 221
    invoke-virtual {p2}, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->name()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->updateTransaction(Lcom/getjar/sdk/comm/persistence/TransactionBucket;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public updateManagedOfferTransaction(Ljava/lang/String;Lcom/getjar/sdk/comm/persistence/RelatedManagedOfferData;)Z
    .locals 12
    .param p1, "clientTransactionId"    # Ljava/lang/String;
    .param p2, "relatedData"    # Lcom/getjar/sdk/comm/persistence/RelatedManagedOfferData;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 226
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_0

    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "\'clientTransactionId\' can not be NULL or empty"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 227
    :cond_0
    if-nez p2, :cond_1

    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "\'relatedData\' can not be NULL"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 229
    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 230
    .local v0, "currentTime":J
    new-instance v2, Landroid/content/ContentValues;

    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    .line 231
    .local v2, "values":Landroid/content/ContentValues;
    const-string v6, "timestampLastUpdated"

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-virtual {v2, v6, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 232
    const-string v6, "relatedObject"

    invoke-static {p2}, Lcom/getjar/sdk/utilities/Base64;->encodeObject(Ljava/io/Serializable;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v6, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 235
    const/4 v3, 0x0

    .line 236
    .local v3, "wasUpdated":Z
    iget-object v6, p0, Lcom/getjar/sdk/comm/persistence/DBTransactions;->_databaseAccessLock:Ljava/lang/Object;

    monitor-enter v6

    .line 237
    :try_start_0
    invoke-virtual {p0}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v7

    const-string v8, "transactions"

    const-string v9, "clientTransactionId = ?"

    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/String;

    const/4 v11, 0x0

    aput-object p1, v10, v11

    invoke-virtual {v7, v8, v2, v9, v10}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v7

    if-lez v7, :cond_2

    move v3, v4

    .line 238
    :goto_0
    monitor-exit v6

    .line 239
    return v3

    :cond_2
    move v3, v5

    .line 237
    goto :goto_0

    .line 238
    :catchall_0
    move-exception v4

    monitor-exit v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v4
.end method

.method public updatePurchaseTransaction(Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;)Z
    .locals 1
    .param p1, "transaction"    # Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;
    .param p2, "state"    # Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;

    .prologue
    .line 203
    invoke-virtual {p2}, Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;->name()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->updateTransaction(Lcom/getjar/sdk/comm/persistence/TransactionBucket;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method
