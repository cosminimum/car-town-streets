.class final Lcom/miniclip/nativeJNI/cocojava$45;
.super Ljava/lang/Object;
.source "cocojava.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/cocojava;->permanentlyRemoveAds()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 3003
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 3005
    const/4 v0, 0x1

    invoke-static {v0}, Lcom/miniclip/nativeJNI/cocojava;->setAdsDisabled(I)V

    .line 3006
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->disableAds()V

    .line 3007
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->hideRemoveAds()V

    .line 3008
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->hideRotatedBanner()V

    .line 3009
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->hideHorizontalBanner()V

    .line 3010
    sput-boolean v1, Lcom/miniclip/nativeJNI/cocojava;->mUSE_ADS:Z

    .line 3011
    sput-boolean v1, Lcom/miniclip/nativeJNI/cocojava;->mUSE_ADS_VERTICAL:Z

    .line 3012
    sput-boolean v1, Lcom/miniclip/nativeJNI/cocojava;->mUSE_ADS_HORIZONTAL:Z

    .line 3013
    return-void
.end method
