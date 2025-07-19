.class Lcom/miniclip/nativeJNI/cocojava$53;
.super Ljava/lang/Object;
.source "cocojava.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/cocojava;->OnAdLoaded(Lcom/mopub/mobileads/MoPubView;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miniclip/nativeJNI/cocojava;

.field final synthetic val$m:Lcom/mopub/mobileads/MoPubView;


# direct methods
.method constructor <init>(Lcom/miniclip/nativeJNI/cocojava;Lcom/mopub/mobileads/MoPubView;)V
    .locals 0

    .prologue
    .line 3394
    iput-object p1, p0, Lcom/miniclip/nativeJNI/cocojava$53;->this$0:Lcom/miniclip/nativeJNI/cocojava;

    iput-object p2, p0, Lcom/miniclip/nativeJNI/cocojava$53;->val$m:Lcom/mopub/mobileads/MoPubView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 9
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .prologue
    const/4 v8, 0x1

    const/4 v1, 0x0

    const/high16 v2, 0x3f800000    # 1.0f

    .line 3397
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->access$900()Lcom/mopub/mobileads/MoPubView;

    move-result-object v7

    .line 3398
    .local v7, "adView":Lcom/mopub/mobileads/MoPubView;
    iget-object v3, p0, Lcom/miniclip/nativeJNI/cocojava$53;->val$m:Lcom/mopub/mobileads/MoPubView;

    invoke-virtual {v3}, Lcom/mopub/mobileads/MoPubView;->getAdUnitId()Ljava/lang/String;

    move-result-object v4

    sget-object v3, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v3, Lcom/miniclip/nativeJNI/cocojava;

    invoke-virtual {v3}, Lcom/miniclip/nativeJNI/cocojava;->getMoPubGameplayBannerId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v3

    if-nez v3, :cond_0

    .line 3399
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->access$800()Lcom/mopub/mobileads/MoPubView;

    move-result-object v7

    .line 3401
    :cond_0
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0xa

    if-le v3, v4, :cond_1

    .line 3402
    const/4 v3, 0x0

    invoke-virtual {v7, v8, v3}, Lcom/mopub/mobileads/MoPubView;->setLayerType(ILandroid/graphics/Paint;)V

    .line 3405
    :cond_1
    if-eqz v7, :cond_2

    iget-object v3, p0, Lcom/miniclip/nativeJNI/cocojava$53;->val$m:Lcom/mopub/mobileads/MoPubView;

    if-ne v3, v7, :cond_2

    invoke-virtual {v7}, Lcom/mopub/mobileads/MoPubView;->getVisibility()I

    move-result v3

    if-nez v3, :cond_2

    .line 3406
    new-instance v0, Landroid/view/animation/ScaleAnimation;

    const/high16 v3, 0x43200000    # 160.0f

    sget v4, Lcom/miniclip/nativeJNI/cocojava;->mDensity:F

    mul-float v5, v3, v4

    move v3, v2

    move v4, v2

    move v6, v1

    invoke-direct/range {v0 .. v6}, Landroid/view/animation/ScaleAnimation;-><init>(FFFFFF)V

    .line 3407
    .local v0, "anim":Landroid/view/animation/Animation;
    const-wide/16 v1, 0x1f4

    invoke-virtual {v0, v1, v2}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 3408
    invoke-virtual {v7, v8}, Lcom/mopub/mobileads/MoPubView;->setVisibility(I)V

    .line 3409
    invoke-virtual {v7, v0}, Lcom/mopub/mobileads/MoPubView;->startAnimation(Landroid/view/animation/Animation;)V

    .line 3411
    .end local v0    # "anim":Landroid/view/animation/Animation;
    :cond_2
    return-void
.end method
