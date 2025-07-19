.class final Lcom/miniclip/nativeJNI/cocojava$27;
.super Ljava/lang/Object;
.source "cocojava.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/cocojava;->hideAds()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 1987
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 1989
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->adLayout:Landroid/widget/RelativeLayout;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->adLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {v0}, Landroid/widget/RelativeLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->adLayoutH:Landroid/widget/RelativeLayout;

    if-ne v0, v1, :cond_0

    .line 1990
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->adLayoutH:Landroid/widget/RelativeLayout;

    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->adLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->removeView(Landroid/view/View;)V

    .line 1992
    :cond_0
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->access$800()Lcom/mopub/mobileads/MoPubView;

    move-result-object v0

    invoke-static {v0}, Lcom/miniclip/nativeJNI/cocojava;->hideAd(Lcom/mopub/mobileads/MoPubView;)V

    .line 1993
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->access$900()Lcom/mopub/mobileads/MoPubView;

    move-result-object v0

    invoke-static {v0}, Lcom/miniclip/nativeJNI/cocojava;->hideAd(Lcom/mopub/mobileads/MoPubView;)V

    .line 1994
    return-void
.end method
