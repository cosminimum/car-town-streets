.class public Lcom/getjar/sdk/response/PurchaseSucceededResponse;
.super Lcom/getjar/sdk/response/PurchaseResponse;
.source "PurchaseSucceededResponse.java"


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/getjar/sdk/response/PurchaseSucceededResponse;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private _signature:Ljava/lang/String;

.field private _signedPayload:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 66
    new-instance v0, Lcom/getjar/sdk/response/PurchaseSucceededResponse$1;

    invoke-direct {v0}, Lcom/getjar/sdk/response/PurchaseSucceededResponse$1;-><init>()V

    sput-object v0, Lcom/getjar/sdk/response/PurchaseSucceededResponse;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .locals 1
    .param p1, "source"    # Landroid/os/Parcel;

    .prologue
    .line 39
    invoke-direct {p0, p1}, Lcom/getjar/sdk/response/PurchaseResponse;-><init>(Landroid/os/Parcel;)V

    .line 40
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/getjar/sdk/response/PurchaseSucceededResponse;->_signedPayload:Ljava/lang/String;

    .line 41
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/getjar/sdk/response/PurchaseSucceededResponse;->_signature:Ljava/lang/String;

    .line 42
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "productId"    # Ljava/lang/String;
    .param p2, "amount"    # J
    .param p4, "productName"    # Ljava/lang/String;
    .param p5, "transactionId"    # Ljava/lang/String;
    .param p6, "signedPayload"    # Ljava/lang/String;
    .param p7, "signature"    # Ljava/lang/String;

    .prologue
    .line 29
    invoke-direct/range {p0 .. p5}, Lcom/getjar/sdk/response/PurchaseResponse;-><init>(Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;)V

    .line 30
    iput-object p6, p0, Lcom/getjar/sdk/response/PurchaseSucceededResponse;->_signedPayload:Ljava/lang/String;

    .line 31
    iput-object p7, p0, Lcom/getjar/sdk/response/PurchaseSucceededResponse;->_signature:Ljava/lang/String;

    .line 32
    return-void
.end method


# virtual methods
.method public getSignature()Ljava/lang/String;
    .locals 1

    .prologue
    .line 63
    iget-object v0, p0, Lcom/getjar/sdk/response/PurchaseSucceededResponse;->_signature:Ljava/lang/String;

    return-object v0
.end method

.method public getSignedPayload()Ljava/lang/String;
    .locals 1

    .prologue
    .line 56
    iget-object v0, p0, Lcom/getjar/sdk/response/PurchaseSucceededResponse;->_signedPayload:Ljava/lang/String;

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 47
    invoke-super {p0, p1, p2}, Lcom/getjar/sdk/response/PurchaseResponse;->writeToParcel(Landroid/os/Parcel;I)V

    .line 48
    iget-object v0, p0, Lcom/getjar/sdk/response/PurchaseSucceededResponse;->_signedPayload:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 49
    iget-object v0, p0, Lcom/getjar/sdk/response/PurchaseSucceededResponse;->_signature:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 50
    return-void
.end method
