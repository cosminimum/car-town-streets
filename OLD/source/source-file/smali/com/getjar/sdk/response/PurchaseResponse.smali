.class public abstract Lcom/getjar/sdk/response/PurchaseResponse;
.super Lcom/getjar/sdk/response/Response;
.source "PurchaseResponse.java"


# instance fields
.field private _amount:J

.field private _productId:Ljava/lang/String;

.field private _productName:Ljava/lang/String;

.field private _transactionId:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/os/Parcel;)V
    .locals 2
    .param p1, "source"    # Landroid/os/Parcel;

    .prologue
    .line 38
    invoke-direct {p0, p1}, Lcom/getjar/sdk/response/Response;-><init>(Landroid/os/Parcel;)V

    .line 39
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/getjar/sdk/response/PurchaseResponse;->_productId:Ljava/lang/String;

    .line 40
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/getjar/sdk/response/PurchaseResponse;->_amount:J

    .line 41
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/getjar/sdk/response/PurchaseResponse;->_productName:Ljava/lang/String;

    .line 42
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/getjar/sdk/response/PurchaseResponse;->_transactionId:Ljava/lang/String;

    .line 43
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "productId"    # Ljava/lang/String;
    .param p2, "amount"    # J
    .param p4, "productName"    # Ljava/lang/String;
    .param p5, "transactionId"    # Ljava/lang/String;

    .prologue
    .line 26
    invoke-direct {p0}, Lcom/getjar/sdk/response/Response;-><init>()V

    .line 27
    iput-object p1, p0, Lcom/getjar/sdk/response/PurchaseResponse;->_productId:Ljava/lang/String;

    .line 28
    iput-wide p2, p0, Lcom/getjar/sdk/response/PurchaseResponse;->_amount:J

    .line 29
    iput-object p4, p0, Lcom/getjar/sdk/response/PurchaseResponse;->_productName:Ljava/lang/String;

    .line 30
    iput-object p5, p0, Lcom/getjar/sdk/response/PurchaseResponse;->_transactionId:Ljava/lang/String;

    .line 31
    return-void
.end method


# virtual methods
.method public getAmount()J
    .locals 2

    .prologue
    .line 59
    iget-wide v0, p0, Lcom/getjar/sdk/response/PurchaseResponse;->_amount:J

    return-wide v0
.end method

.method public getProductId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 56
    iget-object v0, p0, Lcom/getjar/sdk/response/PurchaseResponse;->_productId:Ljava/lang/String;

    return-object v0
.end method

.method public getProductName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 62
    iget-object v0, p0, Lcom/getjar/sdk/response/PurchaseResponse;->_productName:Ljava/lang/String;

    return-object v0
.end method

.method public getTransactionId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 65
    iget-object v0, p0, Lcom/getjar/sdk/response/PurchaseResponse;->_transactionId:Ljava/lang/String;

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 2
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 48
    invoke-super {p0, p1, p2}, Lcom/getjar/sdk/response/Response;->writeToParcel(Landroid/os/Parcel;I)V

    .line 49
    iget-object v0, p0, Lcom/getjar/sdk/response/PurchaseResponse;->_productId:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 50
    iget-wide v0, p0, Lcom/getjar/sdk/response/PurchaseResponse;->_amount:J

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 51
    iget-object v0, p0, Lcom/getjar/sdk/response/PurchaseResponse;->_productName:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 52
    iget-object v0, p0, Lcom/getjar/sdk/response/PurchaseResponse;->_transactionId:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 53
    return-void
.end method
