.class public Lcom/getjar/sdk/data/GooglePurchaseResponse;
.super Ljava/lang/Object;
.source "GooglePurchaseResponse.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = -0x7c46f8dd1e9422f8L


# instance fields
.field private developerPayload:Ljava/lang/String;

.field private notificationId:Ljava/lang/String;

.field private orderId:Ljava/lang/String;

.field private productId:Ljava/lang/String;

.field private purchaseState:S

.field private signature:Ljava/lang/String;

.field private signedData:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;SLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "notificationId"    # Ljava/lang/String;
    .param p2, "orderId"    # Ljava/lang/String;
    .param p3, "productId"    # Ljava/lang/String;
    .param p4, "purchaseState"    # S
    .param p5, "developerPayload"    # Ljava/lang/String;
    .param p6, "signedData"    # Ljava/lang/String;
    .param p7, "signature"    # Ljava/lang/String;

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "notificationId cannot be empty or null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 47
    :cond_0
    invoke-static {p2}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "orderId cannot be empty or null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 48
    :cond_1
    invoke-static {p3}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "productId cannot be empty or null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 49
    :cond_2
    invoke-static {p6}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "signedData cannot be empty or null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 50
    :cond_3
    invoke-static {p7}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "signature cannot be empty or null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 57
    :cond_4
    iput-object p1, p0, Lcom/getjar/sdk/data/GooglePurchaseResponse;->notificationId:Ljava/lang/String;

    .line 58
    iput-object p2, p0, Lcom/getjar/sdk/data/GooglePurchaseResponse;->orderId:Ljava/lang/String;

    .line 59
    iput-object p3, p0, Lcom/getjar/sdk/data/GooglePurchaseResponse;->productId:Ljava/lang/String;

    .line 60
    iput-short p4, p0, Lcom/getjar/sdk/data/GooglePurchaseResponse;->purchaseState:S

    .line 61
    iput-object p5, p0, Lcom/getjar/sdk/data/GooglePurchaseResponse;->developerPayload:Ljava/lang/String;

    .line 62
    iput-object p7, p0, Lcom/getjar/sdk/data/GooglePurchaseResponse;->signature:Ljava/lang/String;

    .line 63
    iput-object p6, p0, Lcom/getjar/sdk/data/GooglePurchaseResponse;->signedData:Ljava/lang/String;

    .line 64
    return-void
.end method

.method private readObject(Ljava/io/ObjectInputStream;)V
    .locals 1
    .param p1, "in"    # Ljava/io/ObjectInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 132
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readUTF()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/getjar/sdk/data/GooglePurchaseResponse;->notificationId:Ljava/lang/String;

    .line 133
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readUTF()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/getjar/sdk/data/GooglePurchaseResponse;->orderId:Ljava/lang/String;

    .line 134
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readUTF()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/getjar/sdk/data/GooglePurchaseResponse;->productId:Ljava/lang/String;

    .line 135
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readShort()S

    move-result v0

    iput-short v0, p0, Lcom/getjar/sdk/data/GooglePurchaseResponse;->purchaseState:S

    .line 136
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readUTF()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/getjar/sdk/data/GooglePurchaseResponse;->developerPayload:Ljava/lang/String;

    .line 137
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readUTF()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/getjar/sdk/data/GooglePurchaseResponse;->signedData:Ljava/lang/String;

    .line 138
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readUTF()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/getjar/sdk/data/GooglePurchaseResponse;->signature:Ljava/lang/String;

    .line 139
    return-void
.end method

.method private writeObject(Ljava/io/ObjectOutputStream;)V
    .locals 1
    .param p1, "out"    # Ljava/io/ObjectOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 144
    iget-object v0, p0, Lcom/getjar/sdk/data/GooglePurchaseResponse;->notificationId:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 145
    iget-object v0, p0, Lcom/getjar/sdk/data/GooglePurchaseResponse;->orderId:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 146
    iget-object v0, p0, Lcom/getjar/sdk/data/GooglePurchaseResponse;->productId:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 147
    iget-short v0, p0, Lcom/getjar/sdk/data/GooglePurchaseResponse;->purchaseState:S

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeShort(I)V

    .line 148
    iget-object v0, p0, Lcom/getjar/sdk/data/GooglePurchaseResponse;->developerPayload:Ljava/lang/String;

    invoke-static {v0}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 150
    const-string v0, ""

    iput-object v0, p0, Lcom/getjar/sdk/data/GooglePurchaseResponse;->developerPayload:Ljava/lang/String;

    .line 152
    :cond_0
    iget-object v0, p0, Lcom/getjar/sdk/data/GooglePurchaseResponse;->developerPayload:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 153
    iget-object v0, p0, Lcom/getjar/sdk/data/GooglePurchaseResponse;->signedData:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 154
    iget-object v0, p0, Lcom/getjar/sdk/data/GooglePurchaseResponse;->signature:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 155
    return-void
.end method


# virtual methods
.method public getDeveloperPayload()Ljava/lang/String;
    .locals 1

    .prologue
    .line 84
    iget-object v0, p0, Lcom/getjar/sdk/data/GooglePurchaseResponse;->developerPayload:Ljava/lang/String;

    return-object v0
.end method

.method public getNotificationId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 105
    iget-object v0, p0, Lcom/getjar/sdk/data/GooglePurchaseResponse;->notificationId:Ljava/lang/String;

    return-object v0
.end method

.method public getOrderId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 70
    iget-object v0, p0, Lcom/getjar/sdk/data/GooglePurchaseResponse;->orderId:Ljava/lang/String;

    return-object v0
.end method

.method public getProductId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 77
    iget-object v0, p0, Lcom/getjar/sdk/data/GooglePurchaseResponse;->productId:Ljava/lang/String;

    return-object v0
.end method

.method public getPurchaseState()S
    .locals 1

    .prologue
    .line 112
    iget-short v0, p0, Lcom/getjar/sdk/data/GooglePurchaseResponse;->purchaseState:S

    return v0
.end method

.method public getResponseAsMap(Landroid/content/Context;)Ljava/util/Map;
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 122
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 123
    .local v0, "object":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v1, p0, Lcom/getjar/sdk/data/GooglePurchaseResponse;->productId:Ljava/lang/String;

    invoke-static {v1, p1}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->getGoldBucketDetails(Ljava/lang/String;Landroid/content/Context;)Ljava/util/HashMap;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    .line 124
    const-string v1, "order.google_play.signed_data"

    iget-object v2, p0, Lcom/getjar/sdk/data/GooglePurchaseResponse;->signedData:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 125
    const-string v1, "order.google_play.signature"

    iget-object v2, p0, Lcom/getjar/sdk/data/GooglePurchaseResponse;->signature:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 126
    return-object v0
.end method

.method public getSignature()Ljava/lang/String;
    .locals 1

    .prologue
    .line 98
    iget-object v0, p0, Lcom/getjar/sdk/data/GooglePurchaseResponse;->signature:Ljava/lang/String;

    return-object v0
.end method

.method public getSignedData()Ljava/lang/String;
    .locals 1

    .prologue
    .line 91
    iget-object v0, p0, Lcom/getjar/sdk/data/GooglePurchaseResponse;->signedData:Ljava/lang/String;

    return-object v0
.end method
