.class public Lcom/getjar/sdk/response/CloseResponse;
.super Lcom/getjar/sdk/response/Response;
.source "CloseResponse.java"


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/getjar/sdk/response/CloseResponse;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 28
    new-instance v0, Lcom/getjar/sdk/response/CloseResponse$1;

    invoke-direct {v0}, Lcom/getjar/sdk/response/CloseResponse$1;-><init>()V

    sput-object v0, Lcom/getjar/sdk/response/CloseResponse;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 17
    invoke-direct {p0}, Lcom/getjar/sdk/response/Response;-><init>()V

    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .locals 0
    .param p1, "source"    # Landroid/os/Parcel;

    .prologue
    .line 24
    invoke-direct {p0, p1}, Lcom/getjar/sdk/response/Response;-><init>(Landroid/os/Parcel;)V

    .line 25
    return-void
.end method
