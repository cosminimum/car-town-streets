.class public Lcom/getjar/sdk/ConsumableProduct;
.super Lcom/getjar/sdk/Product;
.source "ConsumableProduct.java"


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/getjar/sdk/ConsumableProduct;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 83
    new-instance v0, Lcom/getjar/sdk/ConsumableProduct$1;

    invoke-direct {v0}, Lcom/getjar/sdk/ConsumableProduct$1;-><init>()V

    sput-object v0, Lcom/getjar/sdk/ConsumableProduct;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .locals 0
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 94
    invoke-direct {p0, p1}, Lcom/getjar/sdk/Product;-><init>(Landroid/os/Parcel;)V

    .line 95
    return-void
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lcom/getjar/sdk/ConsumableProduct$1;)V
    .locals 0
    .param p1, "x0"    # Landroid/os/Parcel;
    .param p2, "x1"    # Lcom/getjar/sdk/ConsumableProduct$1;

    .prologue
    .line 11
    invoke-direct {p0, p1}, Lcom/getjar/sdk/ConsumableProduct;-><init>(Landroid/os/Parcel;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V
    .locals 0
    .param p1, "theProductId"    # Ljava/lang/String;
    .param p2, "theProductName"    # Ljava/lang/String;
    .param p3, "theProductDescription"    # Ljava/lang/String;
    .param p4, "theAmount"    # J

    .prologue
    .line 30
    invoke-direct/range {p0 .. p5}, Lcom/getjar/sdk/Product;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V

    .line 31
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JI)V
    .locals 0
    .param p1, "theProductId"    # Ljava/lang/String;
    .param p2, "theProductName"    # Ljava/lang/String;
    .param p3, "theProductDescription"    # Ljava/lang/String;
    .param p4, "theAmount"    # J
    .param p6, "imageResourceId"    # I

    .prologue
    .line 51
    invoke-direct/range {p0 .. p6}, Lcom/getjar/sdk/Product;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JI)V

    .line 52
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JILjava/lang/String;)V
    .locals 0
    .param p1, "theProductId"    # Ljava/lang/String;
    .param p2, "theProductName"    # Ljava/lang/String;
    .param p3, "theProductDescription"    # Ljava/lang/String;
    .param p4, "theAmount"    # J
    .param p6, "imageResourceId"    # I
    .param p7, "developerPayload"    # Ljava/lang/String;

    .prologue
    .line 79
    invoke-direct/range {p0 .. p7}, Lcom/getjar/sdk/Product;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JILjava/lang/String;)V

    .line 80
    return-void
.end method
