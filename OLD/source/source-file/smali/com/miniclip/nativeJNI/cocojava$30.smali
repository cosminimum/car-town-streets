.class final Lcom/miniclip/nativeJNI/cocojava$30;
.super Ljava/lang/Object;
.source "cocojava.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/cocojava;->showAd(Lcom/mopub/mobileads/MoPubView;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$adView:Lcom/mopub/mobileads/MoPubView;


# direct methods
.method constructor <init>(Lcom/mopub/mobileads/MoPubView;)V
    .locals 0

    .prologue
    .line 2052
    iput-object p1, p0, Lcom/miniclip/nativeJNI/cocojava$30;->val$adView:Lcom/mopub/mobileads/MoPubView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 2055
    iget-object v0, p0, Lcom/miniclip/nativeJNI/cocojava$30;->val$adView:Lcom/mopub/mobileads/MoPubView;

    if-eqz v0, :cond_0

    .line 2056
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->adLayout:Landroid/widget/RelativeLayout;

    iget-object v1, p0, Lcom/miniclip/nativeJNI/cocojava$30;->val$adView:Lcom/mopub/mobileads/MoPubView;

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->removeView(Landroid/view/View;)V

    .line 2057
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->adLayout:Landroid/widget/RelativeLayout;

    iget-object v1, p0, Lcom/miniclip/nativeJNI/cocojava$30;->val$adView:Lcom/mopub/mobileads/MoPubView;

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 2059
    :cond_0
    return-void
.end method
