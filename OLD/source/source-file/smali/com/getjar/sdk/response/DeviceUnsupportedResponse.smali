.class public Lcom/getjar/sdk/response/DeviceUnsupportedResponse;
.super Lcom/getjar/sdk/response/Response;
.source "DeviceUnsupportedResponse.java"


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/getjar/sdk/response/DeviceUnsupportedResponse;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private _deviceMetadata:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 48
    new-instance v0, Lcom/getjar/sdk/response/DeviceUnsupportedResponse$1;

    invoke-direct {v0}, Lcom/getjar/sdk/response/DeviceUnsupportedResponse$1;-><init>()V

    sput-object v0, Lcom/getjar/sdk/response/DeviceUnsupportedResponse;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .locals 2
    .param p1, "source"    # Landroid/os/Parcel;

    .prologue
    .line 31
    invoke-direct {p0, p1}, Lcom/getjar/sdk/response/Response;-><init>(Landroid/os/Parcel;)V

    .line 20
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/getjar/sdk/response/DeviceUnsupportedResponse;->_deviceMetadata:Ljava/util/Map;

    .line 32
    iget-object v0, p0, Lcom/getjar/sdk/response/DeviceUnsupportedResponse;->_deviceMetadata:Ljava/util/Map;

    const-class v1, Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->readMap(Ljava/util/Map;Ljava/lang/ClassLoader;)V

    .line 33
    return-void
.end method

.method public constructor <init>(Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 22
    .local p1, "deviceMetadata":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct {p0}, Lcom/getjar/sdk/response/Response;-><init>()V

    .line 20
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/getjar/sdk/response/DeviceUnsupportedResponse;->_deviceMetadata:Ljava/util/Map;

    .line 23
    iput-object p1, p0, Lcom/getjar/sdk/response/DeviceUnsupportedResponse;->_deviceMetadata:Ljava/util/Map;

    .line 24
    return-void
.end method


# virtual methods
.method public getDeviceMetadata()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 44
    iget-object v0, p0, Lcom/getjar/sdk/response/DeviceUnsupportedResponse;->_deviceMetadata:Ljava/util/Map;

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 38
    invoke-super {p0, p1, p2}, Lcom/getjar/sdk/response/Response;->writeToParcel(Landroid/os/Parcel;I)V

    .line 39
    iget-object v0, p0, Lcom/getjar/sdk/response/DeviceUnsupportedResponse;->_deviceMetadata:Ljava/util/Map;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeMap(Ljava/util/Map;)V

    .line 40
    return-void
.end method
