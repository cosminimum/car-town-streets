.class final Lcom/miniclip/nativeJNI/cocojava$28;
.super Ljava/lang/Object;
.source "cocojava.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/cocojava;->hideAd(Lcom/mopub/mobileads/MoPubView;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$adViewFinal:Lcom/mopub/mobileads/MoPubView;


# direct methods
.method constructor <init>(Lcom/mopub/mobileads/MoPubView;)V
    .locals 0

    .prologue
    .line 2006
    iput-object p1, p0, Lcom/miniclip/nativeJNI/cocojava$28;->val$adViewFinal:Lcom/mopub/mobileads/MoPubView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .prologue
    const/4 v2, 0x0

    const/high16 v1, 0x3f800000    # 1.0f

    .line 2009
    new-instance v0, Landroid/view/animation/ScaleAnimation;

    const/high16 v3, 0x43200000    # 160.0f

    sget v4, Lcom/miniclip/nativeJNI/cocojava;->mDensity:F

    mul-float v5, v3, v4

    move v3, v1

    move v4, v1

    move v6, v2

    invoke-direct/range {v0 .. v6}, Landroid/view/animation/ScaleAnimation;-><init>(FFFFFF)V

    .line 2011
    .local v0, "anim":Landroid/view/animation/Animation;
    const-wide/16 v1, 0x1f4

    invoke-virtual {v0, v1, v2}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 2012
    new-instance v1, Lcom/miniclip/nativeJNI/cocojava$28$1;

    invoke-direct {v1, p0}, Lcom/miniclip/nativeJNI/cocojava$28$1;-><init>(Lcom/miniclip/nativeJNI/cocojava$28;)V

    invoke-virtual {v0, v1}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 2028
    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->adLayout:Landroid/widget/RelativeLayout;

    iget-object v2, p0, Lcom/miniclip/nativeJNI/cocojava$28;->val$adViewFinal:Lcom/mopub/mobileads/MoPubView;

    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout;->removeView(Landroid/view/View;)V

    .line 2029
    return-void
.end method
