.class public Lcom/getjar/sdk/data/TransactionItem;
.super Ljava/lang/Object;
.source "TransactionItem.java"


# instance fields
.field private mClientTransactionID:Ljava/lang/String;

.field private mItemId:Ljava/lang/String;

.field private mItemMetaData:Ljava/lang/String;

.field private mPackageName:Ljava/lang/String;

.field private mTrackingData:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "itemId"    # Ljava/lang/String;
    .param p3, "transactionId"    # Ljava/lang/String;
    .param p4, "metadata"    # Ljava/lang/String;
    .param p5, "trackingData"    # Ljava/lang/String;

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    iput-object p1, p0, Lcom/getjar/sdk/data/TransactionItem;->mPackageName:Ljava/lang/String;

    .line 32
    iput-object p2, p0, Lcom/getjar/sdk/data/TransactionItem;->mItemId:Ljava/lang/String;

    .line 33
    iput-object p3, p0, Lcom/getjar/sdk/data/TransactionItem;->mClientTransactionID:Ljava/lang/String;

    .line 34
    iput-object p4, p0, Lcom/getjar/sdk/data/TransactionItem;->mItemMetaData:Ljava/lang/String;

    .line 35
    iput-object p5, p0, Lcom/getjar/sdk/data/TransactionItem;->mTrackingData:Ljava/lang/String;

    .line 36
    return-void
.end method


# virtual methods
.method public getItemId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 43
    iget-object v0, p0, Lcom/getjar/sdk/data/TransactionItem;->mItemId:Ljava/lang/String;

    return-object v0
.end method

.method public getMetaData()Ljava/lang/String;
    .locals 1

    .prologue
    .line 51
    iget-object v0, p0, Lcom/getjar/sdk/data/TransactionItem;->mItemMetaData:Ljava/lang/String;

    return-object v0
.end method

.method public getPackageName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 39
    iget-object v0, p0, Lcom/getjar/sdk/data/TransactionItem;->mPackageName:Ljava/lang/String;

    return-object v0
.end method

.method public getTrackingData()Ljava/lang/String;
    .locals 1

    .prologue
    .line 55
    iget-object v0, p0, Lcom/getjar/sdk/data/TransactionItem;->mTrackingData:Ljava/lang/String;

    return-object v0
.end method

.method public getTransactionId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 47
    iget-object v0, p0, Lcom/getjar/sdk/data/TransactionItem;->mClientTransactionID:Ljava/lang/String;

    return-object v0
.end method
