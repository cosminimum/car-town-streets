.class final Lcom/miniclip/nativeJNI/cocojava$20;
.super Ljava/lang/Object;
.source "cocojava.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/cocojava;->showInterstitialMopubView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 1584
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 1586
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mGLView:Lcom/miniclip/nativeJNI/ClearGLSurfaceView;

    new-instance v1, Lcom/miniclip/nativeJNI/cocojava$20$1;

    invoke-direct {v1, p0}, Lcom/miniclip/nativeJNI/cocojava$20$1;-><init>(Lcom/miniclip/nativeJNI/cocojava$20;)V

    invoke-virtual {v0, v1}, Lcom/miniclip/nativeJNI/ClearGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    .line 1593
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->adLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {v0}, Landroid/widget/RelativeLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->adLayoutH:Landroid/widget/RelativeLayout;

    if-ne v0, v1, :cond_0

    .line 1594
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->adLayoutH:Landroid/widget/RelativeLayout;

    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->adLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->removeView(Landroid/view/View;)V

    .line 1596
    :cond_0
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mFullscreenInterstitial:Lcom/miniclip/nativeJNI/interstitialMopubView;

    invoke-virtual {v0}, Lcom/miniclip/nativeJNI/interstitialMopubView;->showAd()V

    .line 1597
    return-void
.end method
