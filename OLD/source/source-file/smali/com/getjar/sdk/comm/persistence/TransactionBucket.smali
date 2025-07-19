.class public abstract Lcom/getjar/sdk/comm/persistence/TransactionBucket;
.super Ljava/lang/Object;
.source "TransactionBucket.java"


# instance fields
.field private _clientTransactionId:Ljava/lang/String;

.field private _databaseId:I

.field private _isNewTransaction:Z

.field private _notificationState:Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;

.field protected _relatedObject:Ljava/lang/String;

.field private _state:Ljava/lang/String;

.field private _timestampCreated:J

.field private _timestampLastUpdated:J

.field private _type:Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;


# direct methods
.method protected constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput-object v1, p0, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->_state:Ljava/lang/String;

    .line 21
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->_isNewTransaction:Z

    .line 22
    iput-object v1, p0, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->_relatedObject:Ljava/lang/String;

    .line 23
    iput-object v1, p0, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->_notificationState:Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;

    .line 26
    return-void
.end method

.method protected constructor <init>(Ljava/lang/String;Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;Ljava/io/Serializable;)V
    .locals 2
    .param p1, "clientTransactionId"    # Ljava/lang/String;
    .param p2, "type"    # Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;
    .param p3, "relatedObject"    # Ljava/io/Serializable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput-object v1, p0, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->_state:Ljava/lang/String;

    .line 21
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->_isNewTransaction:Z

    .line 22
    iput-object v1, p0, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->_relatedObject:Ljava/lang/String;

    .line 23
    iput-object v1, p0, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->_notificationState:Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;

    .line 31
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'clientTransactionId\' can not be NULL or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 32
    :cond_0
    if-nez p2, :cond_1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'type\' can not be NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 35
    :cond_1
    iput-object p1, p0, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->_clientTransactionId:Ljava/lang/String;

    .line 36
    iput-object p2, p0, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->_type:Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;

    .line 37
    if-eqz p3, :cond_2

    .line 38
    invoke-static {p3}, Lcom/getjar/sdk/utilities/Base64;->encodeObject(Ljava/io/Serializable;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->_relatedObject:Ljava/lang/String;

    .line 40
    :cond_2
    return-void
.end method


# virtual methods
.method public getClientTransactionId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 51
    iget-object v0, p0, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->_clientTransactionId:Ljava/lang/String;

    return-object v0
.end method

.method protected getDatabaseId()I
    .locals 1

    .prologue
    .line 48
    iget v0, p0, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->_databaseId:I

    return v0
.end method

.method public getIsNewTransaction()Z
    .locals 1

    .prologue
    .line 46
    iget-boolean v0, p0, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->_isNewTransaction:Z

    return v0
.end method

.method public getNotificationState()Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;
    .locals 1

    .prologue
    .line 67
    iget-object v0, p0, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->_notificationState:Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;

    return-object v0
.end method

.method public getRelatedObject()Ljava/io/Serializable;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 93
    iget-object v0, p0, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->_relatedObject:Ljava/lang/String;

    invoke-static {v0}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    .line 94
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->_relatedObject:Ljava/lang/String;

    invoke-static {v0}, Lcom/getjar/sdk/utilities/Base64;->decodeToObject(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/Serializable;

    goto :goto_0
.end method

.method protected getSerializedRelatedObject()Ljava/lang/String;
    .locals 1

    .prologue
    .line 89
    iget-object v0, p0, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->_relatedObject:Ljava/lang/String;

    return-object v0
.end method

.method protected getStateString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 70
    iget-object v0, p0, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->_state:Ljava/lang/String;

    return-object v0
.end method

.method public getTimestampCreated()J
    .locals 2

    .prologue
    .line 54
    iget-wide v0, p0, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->_timestampCreated:J

    return-wide v0
.end method

.method public getTimestampLastUpdated()J
    .locals 2

    .prologue
    .line 57
    iget-wide v0, p0, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->_timestampLastUpdated:J

    return-wide v0
.end method

.method public getType()Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;
    .locals 1

    .prologue
    .line 64
    iget-object v0, p0, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->_type:Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;

    return-object v0
.end method

.method protected getTypeString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 61
    iget-object v0, p0, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->_type:Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;

    invoke-virtual {v0}, Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;->name()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public setClientTransactionId(Ljava/lang/String;)V
    .locals 0
    .param p1, "clientTransactionId"    # Ljava/lang/String;

    .prologue
    .line 52
    iput-object p1, p0, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->_clientTransactionId:Ljava/lang/String;

    return-void
.end method

.method protected setDatabaseId(I)V
    .locals 0
    .param p1, "databaseId"    # I

    .prologue
    .line 49
    iput p1, p0, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->_databaseId:I

    return-void
.end method

.method public setNotificationState(Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;)V
    .locals 0
    .param p1, "notificationState"    # Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;

    .prologue
    .line 68
    iput-object p1, p0, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->_notificationState:Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;

    return-void
.end method

.method public setRelatedObject(Ljava/io/Serializable;)V
    .locals 1
    .param p1, "relatedObject"    # Ljava/io/Serializable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 97
    if-nez p1, :cond_0

    .line 98
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->_relatedObject:Ljava/lang/String;

    .line 102
    :goto_0
    return-void

    .line 100
    :cond_0
    invoke-static {p1}, Lcom/getjar/sdk/utilities/Base64;->encodeObject(Ljava/io/Serializable;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->_relatedObject:Ljava/lang/String;

    goto :goto_0
.end method

.method protected setSerializedRelatedObject(Ljava/lang/String;)V
    .locals 0
    .param p1, "relatedObject"    # Ljava/lang/String;

    .prologue
    .line 90
    iput-object p1, p0, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->_relatedObject:Ljava/lang/String;

    return-void
.end method

.method protected setStateString(Ljava/lang/String;)V
    .locals 6
    .param p1, "state"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x1

    .line 75
    :try_start_0
    const-class v1, Lcom/getjar/sdk/comm/persistence/EarnBucket;

    invoke-virtual {v1, p0}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-class v1, Lcom/getjar/sdk/comm/persistence/DBTransactions$EarnState;

    invoke-static {v1, p1}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v1

    check-cast v1, Lcom/getjar/sdk/comm/persistence/DBTransactions$EarnState;

    sget-object v2, Lcom/getjar/sdk/comm/persistence/DBTransactions$EarnState;->CREATED:Lcom/getjar/sdk/comm/persistence/DBTransactions$EarnState;

    invoke-virtual {v1, v2}, Lcom/getjar/sdk/comm/persistence/DBTransactions$EarnState;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    :cond_0
    const-class v1, Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;

    invoke-virtual {v1, p0}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    const-class v1, Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;

    invoke-static {v1, p1}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v1

    check-cast v1, Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;

    sget-object v2, Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;->CREATED:Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;

    invoke-virtual {v1, v2}, Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 78
    :cond_1
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->_isNewTransaction:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 85
    :cond_2
    iput-object p1, p0, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->_state:Ljava/lang/String;

    .line 86
    return-void

    .line 80
    :catch_0
    move-exception v0

    .line 81
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/lang/IllegalArgumentException;

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "Unable to parse the string \'%1$s\' into one of our transaction state enums"

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object p1, v4, v5

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public setTimestampCreated(J)V
    .locals 0
    .param p1, "timestampCreated"    # J

    .prologue
    .line 55
    iput-wide p1, p0, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->_timestampCreated:J

    return-void
.end method

.method public setTimestampLastUpdated(J)V
    .locals 0
    .param p1, "timestampLastUpdated"    # J

    .prologue
    .line 58
    iput-wide p1, p0, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->_timestampLastUpdated:J

    return-void
.end method

.method public setType(Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;)V
    .locals 0
    .param p1, "type"    # Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;

    .prologue
    .line 65
    iput-object p1, p0, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->_type:Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;

    return-void
.end method

.method protected setTypeString(Ljava/lang/String;)V
    .locals 1
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    .line 62
    const-class v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;

    invoke-static {v0, p1}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;

    iput-object v0, p0, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->_type:Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 107
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 108
    .local v0, "textBuffer":Ljava/lang/StringBuilder;
    const-string v1, "DB ID: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    iget v1, p0, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->_databaseId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 110
    const-string v1, "\r\n      "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    iget-object v1, p0, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->_clientTransactionId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    const-string v1, "\r\n      "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 113
    iget-wide v1, p0, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->_timestampCreated:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 114
    const-string v1, "\r\n      "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    iget-wide v1, p0, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->_timestampLastUpdated:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 116
    const-string v1, "\r\n      "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 117
    iget-object v1, p0, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->_type:Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;

    invoke-virtual {v1}, Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    const-string v1, "\r\n      "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 119
    iget-object v1, p0, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->_state:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    const-string v1, "\r\n      "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 121
    iget-object v1, p0, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->_relatedObject:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 122
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
