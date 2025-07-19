.class public Lcom/getjar/sdk/comm/persistence/RelatedEarnData;
.super Ljava/lang/Object;
.source "RelatedEarnData.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = -0x626b20b8421e6235L


# instance fields
.field private _itemId:Ljava/lang/String;

.field private _itemMetadata:Ljava/util/HashMap;
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

.field private _packageName:Ljava/lang/String;

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
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;Ljava/util/HashMap;)V
    .locals 0
    .param p1, "itemId"    # Ljava/lang/String;
    .param p2, "packageName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
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
    .line 28
    .local p3, "itemMetadata":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .local p4, "trackingMetadata":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    iput-object p1, p0, Lcom/getjar/sdk/comm/persistence/RelatedEarnData;->_itemId:Ljava/lang/String;

    .line 30
    iput-object p2, p0, Lcom/getjar/sdk/comm/persistence/RelatedEarnData;->_packageName:Ljava/lang/String;

    .line 31
    iput-object p3, p0, Lcom/getjar/sdk/comm/persistence/RelatedEarnData;->_itemMetadata:Ljava/util/HashMap;

    .line 32
    iput-object p4, p0, Lcom/getjar/sdk/comm/persistence/RelatedEarnData;->_trackingMetadata:Ljava/util/HashMap;

    .line 33
    invoke-direct {p0}, Lcom/getjar/sdk/comm/persistence/RelatedEarnData;->validateObjectState()V

    .line 34
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
    .line 59
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readUTF()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/getjar/sdk/comm/persistence/RelatedEarnData;->_itemId:Ljava/lang/String;

    .line 60
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readUTF()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/getjar/sdk/comm/persistence/RelatedEarnData;->_packageName:Ljava/lang/String;

    .line 61
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    iput-object v0, p0, Lcom/getjar/sdk/comm/persistence/RelatedEarnData;->_itemMetadata:Ljava/util/HashMap;

    .line 62
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    iput-object v0, p0, Lcom/getjar/sdk/comm/persistence/RelatedEarnData;->_trackingMetadata:Ljava/util/HashMap;

    .line 63
    return-void
.end method

.method private validateObjectState()V
    .locals 2

    .prologue
    .line 43
    iget-object v0, p0, Lcom/getjar/sdk/comm/persistence/RelatedEarnData;->_itemId:Ljava/lang/String;

    invoke-static {v0}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "\'itemId\' can not be NULL or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 44
    :cond_0
    iget-object v0, p0, Lcom/getjar/sdk/comm/persistence/RelatedEarnData;->_packageName:Ljava/lang/String;

    invoke-static {v0}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "\'packageName\' can not be NULL or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 45
    :cond_1
    iget-object v0, p0, Lcom/getjar/sdk/comm/persistence/RelatedEarnData;->_itemMetadata:Ljava/util/HashMap;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/getjar/sdk/comm/persistence/RelatedEarnData;->_itemMetadata:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    move-result v0

    if-gtz v0, :cond_3

    :cond_2
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "\'itemMetadata\' can not be NULL or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 46
    :cond_3
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
    .line 50
    iget-object v0, p0, Lcom/getjar/sdk/comm/persistence/RelatedEarnData;->_itemId:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 51
    iget-object v0, p0, Lcom/getjar/sdk/comm/persistence/RelatedEarnData;->_packageName:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 52
    iget-object v0, p0, Lcom/getjar/sdk/comm/persistence/RelatedEarnData;->_itemMetadata:Ljava/util/HashMap;

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 53
    iget-object v0, p0, Lcom/getjar/sdk/comm/persistence/RelatedEarnData;->_trackingMetadata:Ljava/util/HashMap;

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 54
    return-void
.end method


# virtual methods
.method public getItemId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 37
    iget-object v0, p0, Lcom/getjar/sdk/comm/persistence/RelatedEarnData;->_itemId:Ljava/lang/String;

    return-object v0
.end method

.method public getItemMetadata()Ljava/util/HashMap;
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
    .line 39
    iget-object v0, p0, Lcom/getjar/sdk/comm/persistence/RelatedEarnData;->_itemMetadata:Ljava/util/HashMap;

    return-object v0
.end method

.method public getPackageName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 38
    iget-object v0, p0, Lcom/getjar/sdk/comm/persistence/RelatedEarnData;->_packageName:Ljava/lang/String;

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
    .line 40
    iget-object v0, p0, Lcom/getjar/sdk/comm/persistence/RelatedEarnData;->_trackingMetadata:Ljava/util/HashMap;

    return-object v0
.end method
