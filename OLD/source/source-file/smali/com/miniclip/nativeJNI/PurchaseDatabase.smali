.class public Lcom/miniclip/nativeJNI/PurchaseDatabase;
.super Ljava/lang/Object;
.source "PurchaseDatabase.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miniclip/nativeJNI/PurchaseDatabase$DatabaseHelper;
    }
.end annotation


# static fields
.field private static final DATABASE_NAME:Ljava/lang/String; = "purchase.db"

.field private static final DATABASE_VERSION:I = 0x1

.field private static final HISTORY_COLUMNS:[Ljava/lang/String;

.field static final HISTORY_DEVELOPER_PAYLOAD_COL:Ljava/lang/String; = "developerPayload"

.field static final HISTORY_ORDER_ID_COL:Ljava/lang/String; = "_id"

.field static final HISTORY_PRODUCT_ID_COL:Ljava/lang/String; = "productId"

.field static final HISTORY_PURCHASE_TIME_COL:Ljava/lang/String; = "purchaseTime"

.field static final HISTORY_STATE_COL:Ljava/lang/String; = "state"

.field private static final PURCHASED_COLUMNS:[Ljava/lang/String;

.field private static final PURCHASED_ITEMS_TABLE_NAME:Ljava/lang/String; = "purchased"

.field public static final PURCHASED_PRODUCT_ID_COL:Ljava/lang/String; = "_id"

.field public static final PURCHASED_QUANTITY_COL:Ljava/lang/String; = "quantity"

.field private static final PURCHASE_HISTORY_TABLE_NAME:Ljava/lang/String; = "history"

.field private static final TAG:Ljava/lang/String; = "PurchaseDatabase"


# instance fields
.field private mDatabaseHelper:Lcom/miniclip/nativeJNI/PurchaseDatabase$DatabaseHelper;

.field private mDb:Landroid/database/sqlite/SQLiteDatabase;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 54
    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "_id"

    aput-object v1, v0, v3

    const-string v1, "productId"

    aput-object v1, v0, v4

    const-string v1, "state"

    aput-object v1, v0, v5

    const/4 v1, 0x3

    const-string v2, "purchaseTime"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "developerPayload"

    aput-object v2, v0, v1

    sput-object v0, Lcom/miniclip/nativeJNI/PurchaseDatabase;->HISTORY_COLUMNS:[Ljava/lang/String;

    .line 63
    new-array v0, v5, [Ljava/lang/String;

    const-string v1, "_id"

    aput-object v1, v0, v3

    const-string v1, "quantity"

    aput-object v1, v0, v4

    sput-object v0, Lcom/miniclip/nativeJNI/PurchaseDatabase;->PURCHASED_COLUMNS:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 71
    invoke-static {p1}, Lcom/miniclip/nativeJNI/PurchaseDatabase$DatabaseHelper;->getInstance(Landroid/content/Context;)Lcom/miniclip/nativeJNI/PurchaseDatabase$DatabaseHelper;

    move-result-object v3

    iput-object v3, p0, Lcom/miniclip/nativeJNI/PurchaseDatabase;->mDatabaseHelper:Lcom/miniclip/nativeJNI/PurchaseDatabase$DatabaseHelper;

    .line 76
    :try_start_0
    iget-object v3, p0, Lcom/miniclip/nativeJNI/PurchaseDatabase;->mDatabaseHelper:Lcom/miniclip/nativeJNI/PurchaseDatabase$DatabaseHelper;

    invoke-virtual {v3}, Lcom/miniclip/nativeJNI/PurchaseDatabase$DatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    iput-object v3, p0, Lcom/miniclip/nativeJNI/PurchaseDatabase;->mDb:Landroid/database/sqlite/SQLiteDatabase;
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 88
    :goto_0
    return-void

    .line 77
    :catch_0
    move-exception v1

    .line 78
    .local v1, "e":Ljava/lang/RuntimeException;
    const-string v3, "purchase.db"

    invoke-virtual {p1, v3}, Landroid/content/Context;->getDatabasePath(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 79
    .local v0, "db":Ljava/io/File;
    if-eqz v0, :cond_0

    .line 80
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 82
    :cond_0
    new-instance v2, Ljava/io/File;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "/data/data/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "/databases/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 83
    .local v2, "f":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    .line 85
    invoke-static {p1}, Lcom/miniclip/nativeJNI/PurchaseDatabase$DatabaseHelper;->getInstance(Landroid/content/Context;)Lcom/miniclip/nativeJNI/PurchaseDatabase$DatabaseHelper;

    move-result-object v3

    iput-object v3, p0, Lcom/miniclip/nativeJNI/PurchaseDatabase;->mDatabaseHelper:Lcom/miniclip/nativeJNI/PurchaseDatabase$DatabaseHelper;

    .line 86
    iget-object v3, p0, Lcom/miniclip/nativeJNI/PurchaseDatabase;->mDatabaseHelper:Lcom/miniclip/nativeJNI/PurchaseDatabase$DatabaseHelper;

    invoke-virtual {v3}, Lcom/miniclip/nativeJNI/PurchaseDatabase$DatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    iput-object v3, p0, Lcom/miniclip/nativeJNI/PurchaseDatabase;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    goto :goto_0
.end method

.method private insertOrder(Ljava/lang/String;Ljava/lang/String;Lcom/miniclip/nativeJNI/Consts$PurchaseState;JLjava/lang/String;)V
    .locals 4
    .param p1, "orderId"    # Ljava/lang/String;
    .param p2, "productId"    # Ljava/lang/String;
    .param p3, "state"    # Lcom/miniclip/nativeJNI/Consts$PurchaseState;
    .param p4, "purchaseTime"    # J
    .param p6, "developerPayload"    # Ljava/lang/String;

    .prologue
    .line 108
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 109
    .local v0, "values":Landroid/content/ContentValues;
    const-string v1, "_id"

    invoke-virtual {v0, v1, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 110
    const-string v1, "productId"

    invoke-virtual {v0, v1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 111
    const-string v1, "state"

    invoke-virtual {p3}, Lcom/miniclip/nativeJNI/Consts$PurchaseState;->ordinal()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 112
    const-string v1, "purchaseTime"

    invoke-static {p4, p5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 113
    const-string v1, "developerPayload"

    invoke-virtual {v0, v1, p6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 114
    iget-object v1, p0, Lcom/miniclip/nativeJNI/PurchaseDatabase;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    const-string v2, "history"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3, v0}, Landroid/database/sqlite/SQLiteDatabase;->replace(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 115
    return-void
.end method

.method private updatePurchasedItem(Ljava/lang/String;I)V
    .locals 6
    .param p1, "productId"    # Ljava/lang/String;
    .param p2, "quantity"    # I

    .prologue
    .line 124
    if-nez p2, :cond_0

    .line 125
    iget-object v1, p0, Lcom/miniclip/nativeJNI/PurchaseDatabase;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    const-string v2, "purchased"

    const-string v3, "_id=?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    aput-object p1, v4, v5

    invoke-virtual {v1, v2, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 133
    :goto_0
    return-void

    .line 129
    :cond_0
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 130
    .local v0, "values":Landroid/content/ContentValues;
    const-string v1, "_id"

    invoke-virtual {v0, v1, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 131
    const-string v1, "quantity"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 132
    iget-object v1, p0, Lcom/miniclip/nativeJNI/PurchaseDatabase;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    const-string v2, "purchased"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3, v0}, Landroid/database/sqlite/SQLiteDatabase;->replace(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    goto :goto_0
.end method


# virtual methods
.method public close()V
    .locals 2

    .prologue
    .line 91
    const-string v0, "InAppActivity"

    const-string v1, "close database"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 92
    iget-object v0, p0, Lcom/miniclip/nativeJNI/PurchaseDatabase;->mDatabaseHelper:Lcom/miniclip/nativeJNI/PurchaseDatabase$DatabaseHelper;

    invoke-virtual {v0}, Lcom/miniclip/nativeJNI/PurchaseDatabase$DatabaseHelper;->close()V

    .line 93
    return-void
.end method

.method public queryAllPurchasedItems()Landroid/database/Cursor;
    .locals 8

    .prologue
    const/4 v3, 0x0

    .line 183
    iget-object v0, p0, Lcom/miniclip/nativeJNI/PurchaseDatabase;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "purchased"

    sget-object v2, Lcom/miniclip/nativeJNI/PurchaseDatabase;->PURCHASED_COLUMNS:[Ljava/lang/String;

    move-object v4, v3

    move-object v5, v3

    move-object v6, v3

    move-object v7, v3

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    return-object v0
.end method

.method public declared-synchronized updatePurchase(Ljava/lang/String;Ljava/lang/String;Lcom/miniclip/nativeJNI/Consts$PurchaseState;JLjava/lang/String;)I
    .locals 13
    .param p1, "orderId"    # Ljava/lang/String;
    .param p2, "productId"    # Ljava/lang/String;
    .param p3, "purchaseState"    # Lcom/miniclip/nativeJNI/Consts$PurchaseState;
    .param p4, "purchaseTime"    # J
    .param p6, "developerPayload"    # Ljava/lang/String;

    .prologue
    .line 149
    monitor-enter p0

    :try_start_0
    invoke-direct/range {p0 .. p6}, Lcom/miniclip/nativeJNI/PurchaseDatabase;->insertOrder(Ljava/lang/String;Ljava/lang/String;Lcom/miniclip/nativeJNI/Consts$PurchaseState;JLjava/lang/String;)V

    .line 150
    iget-object v0, p0, Lcom/miniclip/nativeJNI/PurchaseDatabase;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "history"

    sget-object v2, Lcom/miniclip/nativeJNI/PurchaseDatabase;->HISTORY_COLUMNS:[Ljava/lang/String;

    const-string v3, "productId=?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    aput-object p2, v4, v5

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-virtual/range {v0 .. v8}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v9

    .line 152
    .local v9, "cursor":Landroid/database/Cursor;
    if-nez v9, :cond_1

    .line 153
    const/4 v10, 0x0

    .line 175
    :cond_0
    :goto_0
    monitor-exit p0

    return v10

    .line 155
    :cond_1
    const/4 v10, 0x0

    .line 158
    .local v10, "quantity":I
    :cond_2
    :goto_1
    :try_start_1
    invoke-interface {v9}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 159
    const/4 v0, 0x2

    invoke-interface {v9, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v12

    .line 160
    .local v12, "stateIndex":I
    invoke-static {v12}, Lcom/miniclip/nativeJNI/Consts$PurchaseState;->valueOf(I)Lcom/miniclip/nativeJNI/Consts$PurchaseState;

    move-result-object v11

    .line 163
    .local v11, "state":Lcom/miniclip/nativeJNI/Consts$PurchaseState;
    sget-object v0, Lcom/miniclip/nativeJNI/Consts$PurchaseState;->PURCHASED:Lcom/miniclip/nativeJNI/Consts$PurchaseState;

    if-eq v11, v0, :cond_3

    sget-object v0, Lcom/miniclip/nativeJNI/Consts$PurchaseState;->REFUNDED:Lcom/miniclip/nativeJNI/Consts$PurchaseState;

    if-ne v11, v0, :cond_2

    .line 164
    :cond_3
    add-int/lit8 v10, v10, 0x1

    goto :goto_1

    .line 169
    .end local v11    # "state":Lcom/miniclip/nativeJNI/Consts$PurchaseState;
    .end local v12    # "stateIndex":I
    :cond_4
    invoke-direct {p0, p2, v10}, Lcom/miniclip/nativeJNI/PurchaseDatabase;->updatePurchasedItem(Ljava/lang/String;I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 171
    if-eqz v9, :cond_0

    .line 172
    :try_start_2
    invoke-interface {v9}, Landroid/database/Cursor;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 149
    .end local v9    # "cursor":Landroid/database/Cursor;
    .end local v10    # "quantity":I
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 171
    .restart local v9    # "cursor":Landroid/database/Cursor;
    .restart local v10    # "quantity":I
    :catchall_1
    move-exception v0

    if-eqz v9, :cond_5

    .line 172
    :try_start_3
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    :cond_5
    throw v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
.end method
