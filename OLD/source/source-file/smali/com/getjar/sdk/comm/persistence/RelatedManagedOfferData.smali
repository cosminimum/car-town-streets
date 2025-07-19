.class public Lcom/getjar/sdk/comm/persistence/RelatedManagedOfferData;
.super Ljava/lang/Object;
.source "RelatedManagedOfferData.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = 0x1341d923c32b7b6fL


# instance fields
.field private _offerId:Ljava/lang/String;

.field private _purchaseMetadata:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private _trackingMetadata:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/util/HashMap;Ljava/util/HashMap;)V
    .locals 3
    .param p1, "offerId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 35
    .local p2, "purchaseMetadata":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .local p3, "trackingMetadata":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'productId\' cannot be null or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 37
    :cond_0
    if-eqz p2, :cond_1

    invoke-virtual {p2}, Ljava/util/HashMap;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'itemMetadata\' cannot be null or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 38
    :cond_2
    if-eqz p3, :cond_3

    invoke-virtual {p3}, Ljava/util/HashMap;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_4

    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'trackingMetadata\' cannot be null or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 40
    :cond_4
    iput-object p1, p0, Lcom/getjar/sdk/comm/persistence/RelatedManagedOfferData;->_offerId:Ljava/lang/String;

    .line 41
    iput-object p2, p0, Lcom/getjar/sdk/comm/persistence/RelatedManagedOfferData;->_purchaseMetadata:Ljava/util/HashMap;

    .line 42
    iput-object p3, p0, Lcom/getjar/sdk/comm/persistence/RelatedManagedOfferData;->_trackingMetadata:Ljava/util/HashMap;

    .line 43
    iget-object v0, p0, Lcom/getjar/sdk/comm/persistence/RelatedManagedOfferData;->_purchaseMetadata:Ljava/util/HashMap;

    const-string v1, "marketplace"

    const-string v2, "marketplace.google_play"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    return-void
.end method

.method public constructor <init>(Ljava/util/HashMap;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 28
    .local p1, "purchaseMetadata":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/util/HashMap;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'itemMetadata\' cannot be null or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 31
    :cond_1
    iput-object p1, p0, Lcom/getjar/sdk/comm/persistence/RelatedManagedOfferData;->_purchaseMetadata:Ljava/util/HashMap;

    .line 32
    iget-object v0, p0, Lcom/getjar/sdk/comm/persistence/RelatedManagedOfferData;->_purchaseMetadata:Ljava/util/HashMap;

    const-string v1, "marketplace"

    const-string v2, "marketplace.google_play"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    return-void
.end method

.method private readObject(Ljava/io/ObjectInputStream;)V
    .locals 3
    .param p1, "in"    # Ljava/io/ObjectInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 97
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readUTF()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/getjar/sdk/comm/persistence/RelatedManagedOfferData;->_offerId:Ljava/lang/String;

    .line 98
    iget-object v1, p0, Lcom/getjar/sdk/comm/persistence/RelatedManagedOfferData;->_offerId:Ljava/lang/String;

    invoke-static {v1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 99
    iput-object v2, p0, Lcom/getjar/sdk/comm/persistence/RelatedManagedOfferData;->_offerId:Ljava/lang/String;

    .line 103
    :cond_0
    :try_start_0
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/HashMap;

    iput-object v1, p0, Lcom/getjar/sdk/comm/persistence/RelatedManagedOfferData;->_trackingMetadata:Ljava/util/HashMap;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 109
    :goto_0
    :try_start_1
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/HashMap;

    iput-object v1, p0, Lcom/getjar/sdk/comm/persistence/RelatedManagedOfferData;->_purchaseMetadata:Ljava/util/HashMap;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 113
    :goto_1
    return-void

    .line 104
    :catch_0
    move-exception v0

    .line 105
    .local v0, "e":Ljava/lang/Exception;
    iput-object v2, p0, Lcom/getjar/sdk/comm/persistence/RelatedManagedOfferData;->_trackingMetadata:Ljava/util/HashMap;

    goto :goto_0

    .line 110
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v0

    .line 111
    .restart local v0    # "e":Ljava/lang/Exception;
    iput-object v2, p0, Lcom/getjar/sdk/comm/persistence/RelatedManagedOfferData;->_purchaseMetadata:Ljava/util/HashMap;

    goto :goto_1
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
    .line 74
    iget-object v0, p0, Lcom/getjar/sdk/comm/persistence/RelatedManagedOfferData;->_offerId:Ljava/lang/String;

    invoke-static {v0}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 75
    const-string v0, ""

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 80
    :goto_0
    iget-object v0, p0, Lcom/getjar/sdk/comm/persistence/RelatedManagedOfferData;->_trackingMetadata:Ljava/util/HashMap;

    if-nez v0, :cond_1

    .line 81
    const-string v0, ""

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 86
    :goto_1
    iget-object v0, p0, Lcom/getjar/sdk/comm/persistence/RelatedManagedOfferData;->_purchaseMetadata:Ljava/util/HashMap;

    if-nez v0, :cond_2

    .line 87
    const-string v0, ""

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 91
    :goto_2
    return-void

    .line 77
    :cond_0
    iget-object v0, p0, Lcom/getjar/sdk/comm/persistence/RelatedManagedOfferData;->_offerId:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeUTF(Ljava/lang/String;)V

    goto :goto_0

    .line 83
    :cond_1
    iget-object v0, p0, Lcom/getjar/sdk/comm/persistence/RelatedManagedOfferData;->_trackingMetadata:Ljava/util/HashMap;

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    goto :goto_1

    .line 89
    :cond_2
    iget-object v0, p0, Lcom/getjar/sdk/comm/persistence/RelatedManagedOfferData;->_purchaseMetadata:Ljava/util/HashMap;

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    goto :goto_2
.end method


# virtual methods
.method public addGooglePlayTransactionData(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "purchaseData"    # Ljava/lang/String;
    .param p2, "signature"    # Ljava/lang/String;

    .prologue
    .line 59
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'purchaseData\' cannot be null or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 60
    :cond_0
    invoke-static {p2}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'signature\' cannot be null or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 62
    :cond_1
    iget-object v0, p0, Lcom/getjar/sdk/comm/persistence/RelatedManagedOfferData;->_purchaseMetadata:Ljava/util/HashMap;

    if-nez v0, :cond_2

    .line 63
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/getjar/sdk/comm/persistence/RelatedManagedOfferData;->_purchaseMetadata:Ljava/util/HashMap;

    .line 64
    iget-object v0, p0, Lcom/getjar/sdk/comm/persistence/RelatedManagedOfferData;->_purchaseMetadata:Ljava/util/HashMap;

    const-string v1, "marketplace"

    const-string v2, "marketplace.google_play"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 67
    :cond_2
    iget-object v0, p0, Lcom/getjar/sdk/comm/persistence/RelatedManagedOfferData;->_purchaseMetadata:Ljava/util/HashMap;

    const-string v1, "order.google_play.signature"

    invoke-virtual {v0, v1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    iget-object v0, p0, Lcom/getjar/sdk/comm/persistence/RelatedManagedOfferData;->_purchaseMetadata:Ljava/util/HashMap;

    const-string v1, "order.google_play.signed_data"

    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 69
    return-void
.end method

.method public getOfferToken()Ljava/lang/String;
    .locals 1

    .prologue
    .line 47
    iget-object v0, p0, Lcom/getjar/sdk/comm/persistence/RelatedManagedOfferData;->_offerId:Ljava/lang/String;

    return-object v0
.end method

.method public getPurchaseMetadata()Ljava/util/HashMap;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 49
    iget-object v0, p0, Lcom/getjar/sdk/comm/persistence/RelatedManagedOfferData;->_purchaseMetadata:Ljava/util/HashMap;

    return-object v0
.end method

.method public getTrackingMetadata()Ljava/util/HashMap;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 48
    iget-object v0, p0, Lcom/getjar/sdk/comm/persistence/RelatedManagedOfferData;->_trackingMetadata:Ljava/util/HashMap;

    return-object v0
.end method
