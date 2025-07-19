.class Lcom/miniclip/nativeJNI/PurchaseDatabase$DatabaseHelper;
.super Landroid/database/sqlite/SQLiteOpenHelper;
.source "PurchaseDatabase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miniclip/nativeJNI/PurchaseDatabase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DatabaseHelper"
.end annotation


# static fields
.field private static mInstance:Lcom/miniclip/nativeJNI/PurchaseDatabase$DatabaseHelper;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 211
    const-string v0, "purchase.db"

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-direct {p0, p1, v0, v1, v2}, Landroid/database/sqlite/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    .line 212
    return-void
.end method

.method private createPurchaseTable(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .prologue
    .line 235
    const-string v0, "CREATE TABLE history(_id TEXT PRIMARY KEY, state INTEGER, productId TEXT, developerPayload TEXT, purchaseTime INTEGER)"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 241
    const-string v0, "CREATE TABLE purchased(_id TEXT PRIMARY KEY, quantity INTEGER)"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 244
    return-void
.end method

.method public static getInstance(Landroid/content/Context;)Lcom/miniclip/nativeJNI/PurchaseDatabase$DatabaseHelper;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 195
    sget-object v0, Lcom/miniclip/nativeJNI/PurchaseDatabase$DatabaseHelper;->mInstance:Lcom/miniclip/nativeJNI/PurchaseDatabase$DatabaseHelper;

    if-nez v0, :cond_0

    .line 196
    new-instance v0, Lcom/miniclip/nativeJNI/PurchaseDatabase$DatabaseHelper;

    invoke-direct {v0, p0}, Lcom/miniclip/nativeJNI/PurchaseDatabase$DatabaseHelper;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/miniclip/nativeJNI/PurchaseDatabase$DatabaseHelper;->mInstance:Lcom/miniclip/nativeJNI/PurchaseDatabase$DatabaseHelper;

    .line 198
    :cond_0
    sget-object v0, Lcom/miniclip/nativeJNI/PurchaseDatabase$DatabaseHelper;->mInstance:Lcom/miniclip/nativeJNI/PurchaseDatabase$DatabaseHelper;

    return-object v0
.end method


# virtual methods
.method public close()V
    .locals 1

    .prologue
    .line 204
    sget-object v0, Lcom/miniclip/nativeJNI/PurchaseDatabase$DatabaseHelper;->mInstance:Lcom/miniclip/nativeJNI/PurchaseDatabase$DatabaseHelper;

    if-eqz v0, :cond_0

    .line 205
    sget-object v0, Lcom/miniclip/nativeJNI/PurchaseDatabase$DatabaseHelper;->mInstance:Lcom/miniclip/nativeJNI/PurchaseDatabase$DatabaseHelper;

    invoke-virtual {v0}, Lcom/miniclip/nativeJNI/PurchaseDatabase$DatabaseHelper;->close()V

    .line 206
    const/4 v0, 0x0

    sput-object v0, Lcom/miniclip/nativeJNI/PurchaseDatabase$DatabaseHelper;->mInstance:Lcom/miniclip/nativeJNI/PurchaseDatabase$DatabaseHelper;

    .line 208
    :cond_0
    return-void
.end method

.method public onCreate(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 0
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .prologue
    .line 216
    invoke-direct {p0, p1}, Lcom/miniclip/nativeJNI/PurchaseDatabase$DatabaseHelper;->createPurchaseTable(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 217
    return-void
.end method

.method public onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 3
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "oldVersion"    # I
    .param p3, "newVersion"    # I

    .prologue
    .line 224
    const/4 v0, 0x1

    if-eq p3, v0, :cond_0

    .line 225
    const-string v0, "PurchaseDatabase"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Database upgrade from old: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " to: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 227
    const-string v0, "DROP TABLE IF EXISTS history"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 228
    const-string v0, "DROP TABLE IF EXISTS purchased"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 229
    invoke-direct {p0, p1}, Lcom/miniclip/nativeJNI/PurchaseDatabase$DatabaseHelper;->createPurchaseTable(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 232
    :cond_0
    return-void
.end method
