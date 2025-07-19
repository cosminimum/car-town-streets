.class final Lcom/miniclip/nativeJNI/cocojava$23;
.super Ljava/lang/Object;
.source "cocojava.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/cocojava;->showBigAd()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 1727
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 1729
    new-instance v0, Lcom/mopub/mobileads/MoPubView;

    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/mopub/mobileads/MoPubView;-><init>(Landroid/content/Context;)V

    .line 1730
    .local v0, "bigAd":Lcom/mopub/mobileads/MoPubView;
    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v1, Lcom/miniclip/nativeJNI/cocojava;

    invoke-virtual {v0, v1}, Lcom/mopub/mobileads/MoPubView;->setOnAdLoadedListener(Lcom/mopub/mobileads/MoPubView$OnAdLoadedListener;)V

    .line 1731
    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v1, Lcom/miniclip/nativeJNI/cocojava;

    invoke-virtual {v1}, Lcom/miniclip/nativeJNI/cocojava;->getMoPubInterstitialId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/mopub/mobileads/MoPubView;->setAdUnitId(Ljava/lang/String;)V

    .line 1733
    invoke-virtual {v0}, Lcom/mopub/mobileads/MoPubView;->loadAd()V

    .line 1734
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->access$600()Lcom/miniclip/nativeJNI/MopubView;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 1735
    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->layout:Landroid/widget/RelativeLayout;

    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->access$600()Lcom/miniclip/nativeJNI/MopubView;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout;->removeView(Landroid/view/View;)V

    .line 1736
    :cond_0
    new-instance v1, Lcom/miniclip/nativeJNI/MopubView;

    sget-object v2, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    invoke-direct {v1, v2, v0}, Lcom/miniclip/nativeJNI/MopubView;-><init>(Landroid/content/Context;Lcom/mopub/mobileads/MoPubView;)V

    invoke-static {v1}, Lcom/miniclip/nativeJNI/cocojava;->access$602(Lcom/miniclip/nativeJNI/MopubView;)Lcom/miniclip/nativeJNI/MopubView;

    .line 1737
    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->layout:Landroid/widget/RelativeLayout;

    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->access$600()Lcom/miniclip/nativeJNI/MopubView;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 1738
    return-void
.end method
