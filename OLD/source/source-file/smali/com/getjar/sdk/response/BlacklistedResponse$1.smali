.class final Lcom/getjar/sdk/response/BlacklistedResponse$1;
.super Ljava/lang/Object;
.source "BlacklistedResponse.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getjar/sdk/response/BlacklistedResponse;
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
        "Lcom/getjar/sdk/response/BlacklistedResponse;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromParcel(Landroid/os/Parcel;)Lcom/getjar/sdk/response/BlacklistedResponse;
    .locals 1
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 63
    new-instance v0, Lcom/getjar/sdk/response/BlacklistedResponse;

    invoke-direct {v0, p1}, Lcom/getjar/sdk/response/BlacklistedResponse;-><init>(Landroid/os/Parcel;)V

    return-object v0
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # Landroid/os/Parcel;

    .prologue
    .line 61
    invoke-virtual {p0, p1}, Lcom/getjar/sdk/response/BlacklistedResponse$1;->createFromParcel(Landroid/os/Parcel;)Lcom/getjar/sdk/response/BlacklistedResponse;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Lcom/getjar/sdk/response/BlacklistedResponse;
    .locals 1
    .param p1, "size"    # I

    .prologue
    .line 66
    new-array v0, p1, [Lcom/getjar/sdk/response/BlacklistedResponse;

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # I

    .prologue
    .line 61
    invoke-virtual {p0, p1}, Lcom/getjar/sdk/response/BlacklistedResponse$1;->newArray(I)[Lcom/getjar/sdk/response/BlacklistedResponse;

    move-result-object v0

    return-object v0
.end method
