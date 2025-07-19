.class public Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;
.super Lcom/getjar/sdk/comm/persistence/TransactionBucket;
.source "ManagedOfferBucket.java"


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 15
    invoke-direct {p0}, Lcom/getjar/sdk/comm/persistence/TransactionBucket;-><init>()V

    .line 16
    sget-object v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;->MANAGED_OFFER:Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;

    invoke-virtual {p0, v0}, Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;->setType(Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;)V

    .line 17
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/io/Serializable;)V
    .locals 1
    .param p1, "clientTransactionId"    # Ljava/lang/String;
    .param p2, "relatedObject"    # Ljava/io/Serializable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 20
    sget-object v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;->MANAGED_OFFER:Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;

    invoke-direct {p0, p1, v0, p2}, Lcom/getjar/sdk/comm/persistence/TransactionBucket;-><init>(Ljava/lang/String;Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;Ljava/io/Serializable;)V

    .line 21
    return-void
.end method


# virtual methods
.method public getRelatedObject()Lcom/getjar/sdk/comm/persistence/RelatedManagedOfferData;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 71
    iget-object v0, p0, Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;->_relatedObject:Ljava/lang/String;

    invoke-static {v0}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    .line 72
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;->_relatedObject:Ljava/lang/String;

    invoke-static {v0}, Lcom/getjar/sdk/utilities/Base64;->decodeToObject(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/getjar/sdk/comm/persistence/RelatedManagedOfferData;

    goto :goto_0
.end method

.method public bridge synthetic getRelatedObject()Ljava/io/Serializable;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 12
    invoke-virtual {p0}, Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;->getRelatedObject()Lcom/getjar/sdk/comm/persistence/RelatedManagedOfferData;

    move-result-object v0

    return-object v0
.end method

.method public getState()Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;
    .locals 2

    .prologue
    .line 50
    const-class v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    invoke-super {p0}, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->getStateString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    return-object v0
.end method

.method public setState(Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;)V
    .locals 1
    .param p1, "state"    # Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    .prologue
    .line 54
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->name()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;->setStateString(Ljava/lang/String;)V

    .line 55
    return-void
.end method

.method protected setStateString(Ljava/lang/String;)V
    .locals 6
    .param p1, "state"    # Ljava/lang/String;

    .prologue
    .line 61
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\'state\' can not be NULL or empty"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 63
    :cond_0
    :try_start_0
    const-class v1, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    invoke-static {v1, p1}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 67
    invoke-super {p0, p1}, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->setStateString(Ljava/lang/String;)V

    .line 68
    return-void

    .line 64
    :catch_0
    move-exception v0

    .line 65
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/lang/IllegalArgumentException;

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "Can not set the state for ManagedOfferBucket to \'%1$s\'"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object p1, v4, v5

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public setType(Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;)V
    .locals 6
    .param p1, "type"    # Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;

    .prologue
    .line 41
    sget-object v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;->MANAGED_OFFER:Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;

    invoke-virtual {v0, p1}, Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 42
    new-instance v0, Ljava/lang/IllegalArgumentException;

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v2, "Can not set the TransactionType for ManagedOfferBucket to \'%1$s\'"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-virtual {p1}, Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;->name()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 46
    :cond_0
    sget-object v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;->MANAGED_OFFER:Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;

    invoke-virtual {v0}, Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;->name()Ljava/lang/String;

    move-result-object v0

    invoke-super {p0, v0}, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->setTypeString(Ljava/lang/String;)V

    .line 47
    return-void
.end method

.method protected setTypeString(Ljava/lang/String;)V
    .locals 6
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    .line 27
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\'type\' can not be NULL or empty"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 28
    :cond_0
    const-class v1, Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;

    invoke-static {v1, p1}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;

    .line 29
    .local v0, "transactionType":Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;
    sget-object v1, Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;->MANAGED_OFFER:Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;

    invoke-virtual {v1, v0}, Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 30
    new-instance v1, Ljava/lang/IllegalArgumentException;

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "Can not set the TransactionType for ManagedOfferBucket to \'%1$s\'"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object p1, v4, v5

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 34
    :cond_1
    sget-object v1, Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;->MANAGED_OFFER:Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;

    invoke-virtual {v1}, Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;->name()Ljava/lang/String;

    move-result-object v1

    invoke-super {p0, v1}, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->setTypeString(Ljava/lang/String;)V

    .line 35
    return-void
.end method
