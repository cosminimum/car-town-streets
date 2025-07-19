.class Lcom/miniclip/nativeJNI/cocojava$26$1;
.super Ljava/lang/Object;
.source "cocojava.java"

# interfaces
.implements Landroid/view/animation/Animation$AnimationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/cocojava$26;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miniclip/nativeJNI/cocojava$26;

.field final synthetic val$adViewFinal:Lcom/mopub/mobileads/MoPubView;

.field final synthetic val$paramsFinal:Landroid/widget/RelativeLayout$LayoutParams;


# direct methods
.method constructor <init>(Lcom/miniclip/nativeJNI/cocojava$26;Lcom/mopub/mobileads/MoPubView;Landroid/widget/RelativeLayout$LayoutParams;)V
    .locals 0

    .prologue
    .line 1870
    iput-object p1, p0, Lcom/miniclip/nativeJNI/cocojava$26$1;->this$0:Lcom/miniclip/nativeJNI/cocojava$26;

    iput-object p2, p0, Lcom/miniclip/nativeJNI/cocojava$26$1;->val$adViewFinal:Lcom/mopub/mobileads/MoPubView;

    iput-object p3, p0, Lcom/miniclip/nativeJNI/cocojava$26$1;->val$paramsFinal:Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/view/animation/Animation;)V
    .locals 7
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    const/4 v1, 0x0

    const/high16 v2, 0x3f800000    # 1.0f

    .line 1881
    new-instance v0, Landroid/view/animation/ScaleAnimation;

    const/high16 v3, 0x43200000    # 160.0f

    sget v4, Lcom/miniclip/nativeJNI/cocojava;->mDensity:F

    mul-float v5, v3, v4

    move v3, v2

    move v4, v2

    move v6, v1

    invoke-direct/range {v0 .. v6}, Landroid/view/animation/ScaleAnimation;-><init>(FFFFFF)V

    .line 1883
    .local v0, "anim":Landroid/view/animation/Animation;
    const-wide/16 v1, 0x1f4

    invoke-virtual {v0, v1, v2}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 1884
    iget-object v1, p0, Lcom/miniclip/nativeJNI/cocojava$26$1;->val$adViewFinal:Lcom/mopub/mobileads/MoPubView;

    iget-object v2, p0, Lcom/miniclip/nativeJNI/cocojava$26$1;->val$paramsFinal:Landroid/widget/RelativeLayout$LayoutParams;

    invoke-virtual {v1, v2}, Lcom/mopub/mobileads/MoPubView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1885
    iget-object v1, p0, Lcom/miniclip/nativeJNI/cocojava$26$1;->val$adViewFinal:Lcom/mopub/mobileads/MoPubView;

    invoke-virtual {v1, v0}, Lcom/mopub/mobileads/MoPubView;->startAnimation(Landroid/view/animation/Animation;)V

    .line 1886
    return-void
.end method

.method public onAnimationRepeat(Landroid/view/animation/Animation;)V
    .locals 0
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 1877
    return-void
.end method

.method public onAnimationStart(Landroid/view/animation/Animation;)V
    .locals 0
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 1873
    return-void
.end method
