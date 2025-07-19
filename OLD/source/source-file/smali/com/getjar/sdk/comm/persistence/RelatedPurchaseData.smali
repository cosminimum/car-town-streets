.class public Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;
.super Ljava/lang/Object;
.source "RelatedPurchaseData.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = 0x1341d923c32b7b6fL


# instance fields
.field private _amount:Ljava/lang/Integer;

.field private _developerPayload:Ljava/lang/String;

.field private _licenseScope:Lcom/getjar/sdk/License$LicenseScope;

.field private _productDescription:Ljava/lang/String;

.field private _productId:Ljava/lang/String;

.field private _productName:Ljava/lang/String;

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
    .locals 1

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    const-string v0, ""

    iput-object v0, p0, Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;->_productId:Ljava/lang/String;

    .line 20
    const-string v0, ""

    iput-object v0, p0, Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;->_productName:Ljava/lang/String;

    .line 22
    const-string v0, ""

    iput-object v0, p0, Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;->_productDescription:Ljava/lang/String;

    .line 26
    const-string v0, ""

    iput-object v0, p0, Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;->_developerPayload:Ljava/lang/String;

    .line 28
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;->_trackingMetadata:Ljava/util/HashMap;

    .line 30
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;->_licenseScope:Lcom/getjar/sdk/License$LicenseScope;

    .line 33
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Lcom/getjar/sdk/License$LicenseScope;Ljava/util/HashMap;)V
    .locals 2
    .param p1, "productId"    # Ljava/lang/String;
    .param p2, "productName"    # Ljava/lang/String;
    .param p3, "productDescription"    # Ljava/lang/String;
    .param p4, "amount"    # I
    .param p5, "developerPayload"    # Ljava/lang/String;
    .param p6, "licenseScope"    # Lcom/getjar/sdk/License$LicenseScope;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "I",
            "Ljava/lang/String;",
            "Lcom/getjar/sdk/License$LicenseScope;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 43
    .local p7, "trackingMetadata":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    const-string v0, ""

    iput-object v0, p0, Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;->_productId:Ljava/lang/String;

    .line 20
    const-string v0, ""

    iput-object v0, p0, Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;->_productName:Ljava/lang/String;

    .line 22
    const-string v0, ""

    iput-object v0, p0, Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;->_productDescription:Ljava/lang/String;

    .line 26
    const-string v0, ""

    iput-object v0, p0, Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;->_developerPayload:Ljava/lang/String;

    .line 28
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;->_trackingMetadata:Ljava/util/HashMap;

    .line 30
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;->_licenseScope:Lcom/getjar/sdk/License$LicenseScope;

    .line 44
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'productId\' cannot be null or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 45
    :cond_0
    invoke-static {p2}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'productName\' cannot be null or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 46
    :cond_1
    if-gez p4, :cond_2

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'amount\' cannot be less than 0"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 48
    :cond_2
    iput-object p1, p0, Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;->_productId:Ljava/lang/String;

    .line 49
    iput-object p2, p0, Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;->_productName:Ljava/lang/String;

    .line 50
    if-nez p3, :cond_3

    const-string p3, ""

    .end local p3    # "productDescription":Ljava/lang/String;
    :cond_3
    iput-object p3, p0, Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;->_productDescription:Ljava/lang/String;

    .line 51
    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;->_amount:Ljava/lang/Integer;

    .line 52
    if-nez p5, :cond_4

    const-string p5, ""

    .end local p5    # "developerPayload":Ljava/lang/String;
    :cond_4
    iput-object p5, p0, Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;->_developerPayload:Ljava/lang/String;

    .line 53
    if-eqz p7, :cond_5

    .line 54
    iput-object p7, p0, Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;->_trackingMetadata:Ljava/util/HashMap;

    .line 56
    :cond_5
    iput-object p6, p0, Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;->_licenseScope:Lcom/getjar/sdk/License$LicenseScope;

    .line 57
    return-void
.end method

.method private readObject(Ljava/io/ObjectInputStream;)V
    .locals 2
    .param p1, "in"    # Ljava/io/ObjectInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 92
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readUTF()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;->_developerPayload:Ljava/lang/String;

    .line 93
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readInt()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, p0, Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;->_amount:Ljava/lang/Integer;

    .line 94
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readUTF()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;->_productDescription:Ljava/lang/String;

    .line 95
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readUTF()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;->_productId:Ljava/lang/String;

    .line 96
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readUTF()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;->_productName:Ljava/lang/String;

    .line 97
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/HashMap;

    iput-object v1, p0, Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;->_trackingMetadata:Ljava/util/HashMap;

    .line 99
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readUTF()Ljava/lang/String;

    move-result-object v0

    .line 100
    .local v0, "licenseScopeString":Ljava/lang/String;
    invoke-static {v0}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 102
    invoke-static {v0}, Lcom/getjar/sdk/License$LicenseScope;->valueOf(Ljava/lang/String;)Lcom/getjar/sdk/License$LicenseScope;

    move-result-object v1

    iput-object v1, p0, Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;->_licenseScope:Lcom/getjar/sdk/License$LicenseScope;

    .line 114
    :goto_0
    invoke-direct {p0}, Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;->validateObjectState()V

    .line 115
    return-void

    .line 106
    :cond_0
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;->_licenseScope:Lcom/getjar/sdk/License$LicenseScope;

    goto :goto_0
.end method

.method private validateObjectState()V
    .locals 2

    .prologue
    .line 69
    iget-object v0, p0, Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;->_amount:Ljava/lang/Integer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;->_amount:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-gez v0, :cond_1

    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "\'amount\' can not be NULL or less than 0"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 70
    :cond_1
    iget-object v0, p0, Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;->_productId:Ljava/lang/String;

    invoke-static {v0}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "\'productId\' can not be NULL or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 71
    :cond_2
    iget-object v0, p0, Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;->_productName:Ljava/lang/String;

    invoke-static {v0}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "\'productName\' can not be NULL or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 72
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
    .line 76
    iget-object v0, p0, Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;->_developerPayload:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 77
    iget-object v0, p0, Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;->_amount:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeInt(I)V

    .line 78
    iget-object v0, p0, Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;->_productDescription:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 79
    iget-object v0, p0, Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;->_productId:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 80
    iget-object v0, p0, Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;->_productName:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 81
    iget-object v0, p0, Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;->_trackingMetadata:Ljava/util/HashMap;

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 82
    iget-object v0, p0, Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;->_licenseScope:Lcom/getjar/sdk/License$LicenseScope;

    if-eqz v0, :cond_0

    .line 83
    iget-object v0, p0, Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;->_licenseScope:Lcom/getjar/sdk/License$LicenseScope;

    invoke-virtual {v0}, Lcom/getjar/sdk/License$LicenseScope;->name()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 87
    :goto_0
    return-void

    .line 85
    :cond_0
    const-string v0, ""

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeUTF(Ljava/lang/String;)V

    goto :goto_0
.end method


# virtual methods
.method public getAmount()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 63
    iget-object v0, p0, Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;->_amount:Ljava/lang/Integer;

    return-object v0
.end method

.method public getDeveloperPayload()Ljava/lang/String;
    .locals 1

    .prologue
    .line 64
    iget-object v0, p0, Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;->_developerPayload:Ljava/lang/String;

    return-object v0
.end method

.method public getLicenseScope()Lcom/getjar/sdk/License$LicenseScope;
    .locals 1

    .prologue
    .line 65
    iget-object v0, p0, Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;->_licenseScope:Lcom/getjar/sdk/License$LicenseScope;

    return-object v0
.end method

.method public getProductDescription()Ljava/lang/String;
    .locals 1

    .prologue
    .line 62
    iget-object v0, p0, Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;->_productDescription:Ljava/lang/String;

    return-object v0
.end method

.method public getProductId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 60
    iget-object v0, p0, Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;->_productId:Ljava/lang/String;

    return-object v0
.end method

.method public getProductName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 61
    iget-object v0, p0, Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;->_productName:Ljava/lang/String;

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
    .line 66
    iget-object v0, p0, Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;->_trackingMetadata:Ljava/util/HashMap;

    return-object v0
.end method
