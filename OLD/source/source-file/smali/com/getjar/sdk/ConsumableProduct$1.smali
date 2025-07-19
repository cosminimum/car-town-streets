.class final Lcom/getjar/sdk/ConsumableProduct$1;
.super Ljava/lang/Object;
.source "ConsumableProduct.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getjar/sdk/ConsumableProduct;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator",
        "<",
        "Lcom/getjar/sdk/ConsumableProduct;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 83
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromParcel(Landroid/os/Parcel;)Lcom/getjar/sdk/ConsumableProduct;
    .locals 2
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 85
    new-instance v0, Lcom/getjar/sdk/ConsumableProduct;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lcom/getjar/sdk/ConsumableProduct;-><init>(Landroid/os/Parcel;Lcom/getjar/sdk/ConsumableProduct$1;)V

    return-object v0
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # Landroid/os/Parcel;

    .prologue
    .line 83
    invoke-virtual {p0, p1}, Lcom/getjar/sdk/ConsumableProduct$1;->createFromParcel(Landroid/os/Parcel;)Lcom/getjar/sdk/ConsumableProduct;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Lcom/getjar/sdk/ConsumableProduct;
    .locals 1
    .param p1, "size"    # I

    .prologue
    .line 88
    new-array v0, p1, [Lcom/getjar/sdk/ConsumableProduct;

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # I

    .prologue
    .line 83
    invoke-virtual {p0, p1}, Lcom/getjar/sdk/ConsumableProduct$1;->newArray(I)[Lcom/getjar/sdk/ConsumableProduct;

    move-result-object v0

    return-object v0
.end method
