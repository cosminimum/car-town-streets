.class public Lcom/getjar/sdk/data/PurchaseResult;
.super Ljava/lang/Object;
.source "PurchaseResult.java"


# instance fields
.field private mCost:J

.field private mProductId:Ljava/lang/String;

.field private mTransactionId:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "b"    # Landroid/os/Bundle;

    .prologue
    const-wide/16 v1, 0x0

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    const-string v0, ""

    iput-object v0, p0, Lcom/getjar/sdk/data/PurchaseResult;->mTransactionId:Ljava/lang/String;

    .line 27
    const-string v0, ""

    iput-object v0, p0, Lcom/getjar/sdk/data/PurchaseResult;->mProductId:Ljava/lang/String;

    .line 28
    iput-wide v1, p0, Lcom/getjar/sdk/data/PurchaseResult;->mCost:J

    .line 31
    if-nez p1, :cond_0

    .line 32
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Must have a valid bundle."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 34
    :cond_0
    const-string v0, "transactionId"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/getjar/sdk/data/PurchaseResult;->mTransactionId:Ljava/lang/String;

    .line 35
    const-string v0, "id"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/getjar/sdk/data/PurchaseResult;->mProductId:Ljava/lang/String;

    .line 36
    const-string v0, "price"

    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Bundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/getjar/sdk/data/PurchaseResult;->mCost:J

    .line 37
    return-void
.end method


# virtual methods
.method public getCost()J
    .locals 2

    .prologue
    .line 57
    iget-wide v0, p0, Lcom/getjar/sdk/data/PurchaseResult;->mCost:J

    return-wide v0
.end method

.method public getProductId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 43
    iget-object v0, p0, Lcom/getjar/sdk/data/PurchaseResult;->mProductId:Ljava/lang/String;

    return-object v0
.end method

.method public getTransactionId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 50
    iget-object v0, p0, Lcom/getjar/sdk/data/PurchaseResult;->mTransactionId:Ljava/lang/String;

    return-object v0
.end method
