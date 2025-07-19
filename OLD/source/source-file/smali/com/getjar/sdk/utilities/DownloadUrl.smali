.class public Lcom/getjar/sdk/utilities/DownloadUrl;
.super Ljava/lang/Object;
.source "DownloadUrl.java"


# instance fields
.field private mAppIcon:Landroid/graphics/Bitmap;

.field private mAppLink:Ljava/lang/String;

.field private mAppName:Ljava/lang/String;

.field private mAppPackageName:Ljava/lang/String;

.field private mGetIcon:Landroid/graphics/Bitmap;

.field private mGetJarLink:Ljava/lang/String;

.field private mGetJarName:Ljava/lang/String;

.field private mGetJarPackageName:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V
    .locals 0
    .param p1, "aname"    # Ljava/lang/String;
    .param p2, "apackage"    # Ljava/lang/String;
    .param p3, "alink"    # Ljava/lang/String;
    .param p4, "gname"    # Ljava/lang/String;
    .param p5, "gpackage"    # Ljava/lang/String;
    .param p6, "glink"    # Ljava/lang/String;
    .param p7, "appicon"    # Landroid/graphics/Bitmap;
    .param p8, "geticon"    # Landroid/graphics/Bitmap;

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iput-object p1, p0, Lcom/getjar/sdk/utilities/DownloadUrl;->mAppName:Ljava/lang/String;

    .line 33
    iput-object p3, p0, Lcom/getjar/sdk/utilities/DownloadUrl;->mAppLink:Ljava/lang/String;

    .line 34
    iput-object p6, p0, Lcom/getjar/sdk/utilities/DownloadUrl;->mGetJarLink:Ljava/lang/String;

    .line 35
    iput-object p8, p0, Lcom/getjar/sdk/utilities/DownloadUrl;->mGetIcon:Landroid/graphics/Bitmap;

    .line 36
    iput-object p7, p0, Lcom/getjar/sdk/utilities/DownloadUrl;->mAppIcon:Landroid/graphics/Bitmap;

    .line 37
    iput-object p2, p0, Lcom/getjar/sdk/utilities/DownloadUrl;->mAppPackageName:Ljava/lang/String;

    .line 38
    iput-object p4, p0, Lcom/getjar/sdk/utilities/DownloadUrl;->mGetJarName:Ljava/lang/String;

    .line 39
    iput-object p5, p0, Lcom/getjar/sdk/utilities/DownloadUrl;->mGetJarPackageName:Ljava/lang/String;

    .line 40
    return-void
.end method


# virtual methods
.method public getAppIcon()Landroid/graphics/Bitmap;
    .locals 1

    .prologue
    .line 55
    iget-object v0, p0, Lcom/getjar/sdk/utilities/DownloadUrl;->mAppIcon:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method public getAppLink()Ljava/lang/String;
    .locals 1

    .prologue
    .line 58
    iget-object v0, p0, Lcom/getjar/sdk/utilities/DownloadUrl;->mAppLink:Ljava/lang/String;

    return-object v0
.end method

.method public getAppName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 43
    iget-object v0, p0, Lcom/getjar/sdk/utilities/DownloadUrl;->mAppName:Ljava/lang/String;

    return-object v0
.end method

.method public getAppPackageName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 46
    iget-object v0, p0, Lcom/getjar/sdk/utilities/DownloadUrl;->mAppPackageName:Ljava/lang/String;

    return-object v0
.end method

.method public getGetJarIcon()Landroid/graphics/Bitmap;
    .locals 1

    .prologue
    .line 62
    iget-object v0, p0, Lcom/getjar/sdk/utilities/DownloadUrl;->mGetIcon:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method public getGetJarLink()Ljava/lang/String;
    .locals 1

    .prologue
    .line 65
    iget-object v0, p0, Lcom/getjar/sdk/utilities/DownloadUrl;->mGetJarLink:Ljava/lang/String;

    return-object v0
.end method

.method public getGetJarName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 49
    iget-object v0, p0, Lcom/getjar/sdk/utilities/DownloadUrl;->mGetJarName:Ljava/lang/String;

    return-object v0
.end method

.method public getGetPackageName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 52
    iget-object v0, p0, Lcom/getjar/sdk/utilities/DownloadUrl;->mGetJarPackageName:Ljava/lang/String;

    return-object v0
.end method
