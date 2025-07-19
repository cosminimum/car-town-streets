.class Lcom/mopub/mobileads/AdView$LoadNativeAdTaskResult;
.super Lcom/mopub/mobileads/AdView$LoadUrlTaskResult;
.source "AdView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mopub/mobileads/AdView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "LoadNativeAdTaskResult"
.end annotation


# instance fields
.field protected mParamsHash:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Lcom/mopub/mobileads/AdView;Ljava/util/HashMap;)V
    .locals 0
    .param p1, "adView"    # Lcom/mopub/mobileads/AdView;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/mopub/mobileads/AdView;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 786
    .local p2, "hash":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct {p0, p1}, Lcom/mopub/mobileads/AdView$LoadUrlTaskResult;-><init>(Lcom/mopub/mobileads/AdView;)V

    .line 787
    iput-object p2, p0, Lcom/mopub/mobileads/AdView$LoadNativeAdTaskResult;->mParamsHash:Ljava/util/HashMap;

    .line 788
    return-void
.end method

.method synthetic constructor <init>(Lcom/mopub/mobileads/AdView;Ljava/util/HashMap;Lcom/mopub/mobileads/AdView$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/mopub/mobileads/AdView;
    .param p2, "x1"    # Ljava/util/HashMap;
    .param p3, "x2"    # Lcom/mopub/mobileads/AdView$1;

    .prologue
    .line 782
    invoke-direct {p0, p1, p2}, Lcom/mopub/mobileads/AdView$LoadNativeAdTaskResult;-><init>(Lcom/mopub/mobileads/AdView;Ljava/util/HashMap;)V

    return-void
.end method


# virtual methods
.method public cleanup()V
    .locals 1

    .prologue
    .line 800
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mopub/mobileads/AdView$LoadNativeAdTaskResult;->mParamsHash:Ljava/util/HashMap;

    .line 801
    return-void
.end method

.method public execute()V
    .locals 3

    .prologue
    .line 791
    iget-object v2, p0, Lcom/mopub/mobileads/AdView$LoadNativeAdTaskResult;->mWeakAdView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mopub/mobileads/AdView;

    .line 792
    .local v0, "adView":Lcom/mopub/mobileads/AdView;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/mopub/mobileads/AdView;->isDestroyed()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 797
    :cond_0
    :goto_0
    return-void

    .line 794
    :cond_1
    const/4 v2, 0x0

    invoke-static {v0, v2}, Lcom/mopub/mobileads/AdView;->access$1302(Lcom/mopub/mobileads/AdView;Z)Z

    .line 795
    iget-object v1, v0, Lcom/mopub/mobileads/AdView;->mMoPubView:Lcom/mopub/mobileads/MoPubView;

    .line 796
    .local v1, "mpv":Lcom/mopub/mobileads/MoPubView;
    iget-object v2, p0, Lcom/mopub/mobileads/AdView$LoadNativeAdTaskResult;->mParamsHash:Ljava/util/HashMap;

    invoke-virtual {v1, v2}, Lcom/mopub/mobileads/MoPubView;->loadNativeSDK(Ljava/util/HashMap;)V

    goto :goto_0
.end method
