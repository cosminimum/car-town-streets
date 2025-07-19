.class public Lcom/getjar/sdk/LicensableProduct;
.super Lcom/getjar/sdk/Product;
.source "LicensableProduct.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/getjar/sdk/LicensableProduct;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private licenseScope:Lcom/getjar/sdk/License$LicenseScope;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 141
    new-instance v0, Lcom/getjar/sdk/LicensableProduct$1;

    invoke-direct {v0}, Lcom/getjar/sdk/LicensableProduct$1;-><init>()V

    sput-object v0, Lcom/getjar/sdk/LicensableProduct;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .locals 1
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 152
    invoke-direct {p0, p1}, Lcom/getjar/sdk/Product;-><init>(Landroid/os/Parcel;)V

    .line 153
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/getjar/sdk/License$LicenseScope;->valueOf(Ljava/lang/String;)Lcom/getjar/sdk/License$LicenseScope;

    move-result-object v0

    iput-object v0, p0, Lcom/getjar/sdk/LicensableProduct;->licenseScope:Lcom/getjar/sdk/License$LicenseScope;

    .line 154
    return-void
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lcom/getjar/sdk/LicensableProduct$1;)V
    .locals 0
    .param p1, "x0"    # Landroid/os/Parcel;
    .param p2, "x1"    # Lcom/getjar/sdk/LicensableProduct$1;

    .prologue
    .line 18
    invoke-direct {p0, p1}, Lcom/getjar/sdk/LicensableProduct;-><init>(Landroid/os/Parcel;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JILcom/getjar/sdk/License$LicenseScope;)V
    .locals 2
    .param p1, "theProductId"    # Ljava/lang/String;
    .param p2, "theProductName"    # Ljava/lang/String;
    .param p3, "theProductDescription"    # Ljava/lang/String;
    .param p4, "theAmount"    # J
    .param p6, "imageResourceId"    # I
    .param p7, "licenseScope"    # Lcom/getjar/sdk/License$LicenseScope;

    .prologue
    .line 75
    invoke-direct/range {p0 .. p6}, Lcom/getjar/sdk/Product;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JI)V

    .line 76
    if-nez p7, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "licenseScope cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 78
    :cond_0
    iput-object p7, p0, Lcom/getjar/sdk/LicensableProduct;->licenseScope:Lcom/getjar/sdk/License$LicenseScope;

    .line 79
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JILcom/getjar/sdk/License$LicenseScope;Ljava/lang/String;)V
    .locals 8
    .param p1, "theProductId"    # Ljava/lang/String;
    .param p2, "theProductName"    # Ljava/lang/String;
    .param p3, "theProductDescription"    # Ljava/lang/String;
    .param p4, "theAmount"    # J
    .param p6, "imageResourceId"    # I
    .param p7, "licenseScope"    # Lcom/getjar/sdk/License$LicenseScope;
    .param p8, "developerPayload"    # Ljava/lang/String;

    .prologue
    .line 110
    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-wide v4, p4

    move v6, p6

    move-object/from16 v7, p8

    invoke-direct/range {v0 .. v7}, Lcom/getjar/sdk/Product;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JILjava/lang/String;)V

    .line 111
    if-nez p7, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "licenseScope cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 112
    :cond_0
    iput-object p7, p0, Lcom/getjar/sdk/LicensableProduct;->licenseScope:Lcom/getjar/sdk/License$LicenseScope;

    .line 113
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLcom/getjar/sdk/License$LicenseScope;)V
    .locals 2
    .param p1, "theProductId"    # Ljava/lang/String;
    .param p2, "theProductName"    # Ljava/lang/String;
    .param p3, "theProductDescription"    # Ljava/lang/String;
    .param p4, "theAmount"    # J
    .param p6, "licenseScope"    # Lcom/getjar/sdk/License$LicenseScope;

    .prologue
    .line 42
    invoke-direct/range {p0 .. p5}, Lcom/getjar/sdk/Product;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V

    .line 43
    if-nez p6, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "licenseScope cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 45
    :cond_0
    iput-object p6, p0, Lcom/getjar/sdk/LicensableProduct;->licenseScope:Lcom/getjar/sdk/License$LicenseScope;

    .line 46
    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .prologue
    .line 127
    const/4 v0, 0x0

    return v0
.end method

.method public getLicenseScope()Lcom/getjar/sdk/License$LicenseScope;
    .locals 1

    .prologue
    .line 122
    iget-object v0, p0, Lcom/getjar/sdk/LicensableProduct;->licenseScope:Lcom/getjar/sdk/License$LicenseScope;

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 5
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 133
    :try_start_0
    invoke-super {p0, p1, p2}, Lcom/getjar/sdk/Product;->writeToParcel(Landroid/os/Parcel;I)V

    .line 134
    iget-object v1, p0, Lcom/getjar/sdk/LicensableProduct;->licenseScope:Lcom/getjar/sdk/License$LicenseScope;

    invoke-virtual {v1}, Lcom/getjar/sdk/License$LicenseScope;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 138
    :goto_0
    return-void

    .line 135
    :catch_0
    move-exception v0

    .line 136
    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Lcom/getjar/sdk/logging/Area;->LICENSING:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "LicensableProduct: failed"

    invoke-static {v1, v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
