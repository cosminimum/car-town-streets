.class public Lcom/getjar/sdk/response/BlacklistedResponse;
.super Lcom/getjar/sdk/response/Response;
.source "BlacklistedResponse.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/getjar/sdk/response/BlacklistedResponse$BlacklistType;
    }
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/getjar/sdk/response/BlacklistedResponse;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private _blacklistType:Lcom/getjar/sdk/response/BlacklistedResponse$BlacklistType;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 61
    new-instance v0, Lcom/getjar/sdk/response/BlacklistedResponse$1;

    invoke-direct {v0}, Lcom/getjar/sdk/response/BlacklistedResponse$1;-><init>()V

    sput-object v0, Lcom/getjar/sdk/response/BlacklistedResponse;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .locals 1
    .param p1, "source"    # Landroid/os/Parcel;

    .prologue
    .line 44
    invoke-direct {p0, p1}, Lcom/getjar/sdk/response/Response;-><init>(Landroid/os/Parcel;)V

    .line 45
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/getjar/sdk/response/BlacklistedResponse$BlacklistType;->valueOf(Ljava/lang/String;)Lcom/getjar/sdk/response/BlacklistedResponse$BlacklistType;

    move-result-object v0

    iput-object v0, p0, Lcom/getjar/sdk/response/BlacklistedResponse;->_blacklistType:Lcom/getjar/sdk/response/BlacklistedResponse$BlacklistType;

    .line 46
    return-void
.end method

.method public constructor <init>(Lcom/getjar/sdk/response/BlacklistedResponse$BlacklistType;)V
    .locals 0
    .param p1, "blacklistType"    # Lcom/getjar/sdk/response/BlacklistedResponse$BlacklistType;

    .prologue
    .line 35
    invoke-direct {p0}, Lcom/getjar/sdk/response/Response;-><init>()V

    .line 36
    iput-object p1, p0, Lcom/getjar/sdk/response/BlacklistedResponse;->_blacklistType:Lcom/getjar/sdk/response/BlacklistedResponse$BlacklistType;

    .line 37
    return-void
.end method


# virtual methods
.method public getBlacklistType()Lcom/getjar/sdk/response/BlacklistedResponse$BlacklistType;
    .locals 1

    .prologue
    .line 57
    iget-object v0, p0, Lcom/getjar/sdk/response/BlacklistedResponse;->_blacklistType:Lcom/getjar/sdk/response/BlacklistedResponse$BlacklistType;

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 51
    invoke-super {p0, p1, p2}, Lcom/getjar/sdk/response/Response;->writeToParcel(Landroid/os/Parcel;I)V

    .line 52
    iget-object v0, p0, Lcom/getjar/sdk/response/BlacklistedResponse;->_blacklistType:Lcom/getjar/sdk/response/BlacklistedResponse$BlacklistType;

    invoke-virtual {v0}, Lcom/getjar/sdk/response/BlacklistedResponse$BlacklistType;->name()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 53
    return-void
.end method
