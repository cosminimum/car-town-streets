.class public Lcom/miniclip/nativeJNI/horizontalBanner;
.super Landroid/widget/RelativeLayout;
.source "horizontalBanner.java"

# interfaces
.implements Lcom/mopub/mobileads/MoPubView$OnAdFailedListener;
.implements Lcom/mopub/mobileads/MoPubView$OnAdLoadedListener;


# static fields
.field public static adView:Lcom/mopub/mobileads/MoPubView;


# instance fields
.field private mAdLayoutVerticle:Landroid/widget/RelativeLayout;

.field private mAnimationHandler:Landroid/os/Handler;

.field private mContext:Landroid/content/Context;

.field mLoop:Ljava/lang/Runnable;

.field private mOfflineAd:Landroid/widget/RelativeLayout;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 10
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v9, -0x1

    .line 43
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 26
    new-instance v4, Landroid/os/Handler;

    invoke-direct {v4}, Landroid/os/Handler;-><init>()V

    iput-object v4, p0, Lcom/miniclip/nativeJNI/horizontalBanner;->mAnimationHandler:Landroid/os/Handler;

    .line 27
    new-instance v4, Lcom/miniclip/nativeJNI/horizontalBanner$1;

    invoke-direct {v4, p0}, Lcom/miniclip/nativeJNI/horizontalBanner$1;-><init>(Lcom/miniclip/nativeJNI/horizontalBanner;)V

    iput-object v4, p0, Lcom/miniclip/nativeJNI/horizontalBanner;->mLoop:Ljava/lang/Runnable;

    .line 44
    iput-object p1, p0, Lcom/miniclip/nativeJNI/horizontalBanner;->mContext:Landroid/content/Context;

    .line 46
    sget v0, Lcom/miniclip/nativeJNI/cocojava;->mDensity:F

    .line 47
    .local v0, "density":F
    iget-object v4, p0, Lcom/miniclip/nativeJNI/horizontalBanner;->mContext:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const-string v5, "a100x640"

    const-string v6, "drawable"

    iget-object v7, p0, Lcom/miniclip/nativeJNI/horizontalBanner;->mContext:Landroid/content/Context;

    invoke-virtual {v7}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v5, v6, v7}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    .line 48
    .local v1, "resourceIdSide4":I
    new-instance v4, Landroid/widget/RelativeLayout;

    iget-object v5, p0, Lcom/miniclip/nativeJNI/horizontalBanner;->mContext:Landroid/content/Context;

    invoke-direct {v4, v5}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    iput-object v4, p0, Lcom/miniclip/nativeJNI/horizontalBanner;->mOfflineAd:Landroid/widget/RelativeLayout;

    .line 49
    new-instance v3, Landroid/widget/RelativeLayout$LayoutParams;

    const/high16 v4, 0x43a00000    # 320.0f

    mul-float/2addr v4, v0

    float-to-int v4, v4

    const-wide/high16 v5, 0x4049000000000000L    # 50.0

    float-to-double v7, v0

    mul-double/2addr v5, v7

    double-to-int v5, v5

    invoke-direct {v3, v4, v5}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 51
    .local v3, "sideBar3Params":Landroid/widget/RelativeLayout$LayoutParams;
    iget-object v4, p0, Lcom/miniclip/nativeJNI/horizontalBanner;->mOfflineAd:Landroid/widget/RelativeLayout;

    invoke-virtual {v4, v3}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 52
    new-instance v2, Landroid/widget/ImageView;

    iget-object v4, p0, Lcom/miniclip/nativeJNI/horizontalBanner;->mContext:Landroid/content/Context;

    invoke-direct {v2, v4}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 53
    .local v2, "sideBar3Image1":Landroid/widget/ImageView;
    invoke-virtual {p0}, Lcom/miniclip/nativeJNI/horizontalBanner;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 54
    new-instance v4, Landroid/widget/Gallery$LayoutParams;

    invoke-direct {v4, v9, v9}, Landroid/widget/Gallery$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v4}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 55
    sget-object v4, Landroid/widget/ImageView$ScaleType;->FIT_XY:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v2, v4}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 56
    iget-object v4, p0, Lcom/miniclip/nativeJNI/horizontalBanner;->mOfflineAd:Landroid/widget/RelativeLayout;

    invoke-virtual {v4, v2}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 57
    iget-object v4, p0, Lcom/miniclip/nativeJNI/horizontalBanner;->mOfflineAd:Landroid/widget/RelativeLayout;

    new-instance v5, Lcom/miniclip/nativeJNI/horizontalBanner$2;

    invoke-direct {v5, p0}, Lcom/miniclip/nativeJNI/horizontalBanner$2;-><init>(Lcom/miniclip/nativeJNI/horizontalBanner;)V

    invoke-virtual {v4, v5}, Landroid/widget/RelativeLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 68
    new-instance v4, Lcom/mopub/mobileads/MoPubView;

    iget-object v5, p0, Lcom/miniclip/nativeJNI/horizontalBanner;->mContext:Landroid/content/Context;

    invoke-direct {v4, v5}, Lcom/mopub/mobileads/MoPubView;-><init>(Landroid/content/Context;)V

    sput-object v4, Lcom/miniclip/nativeJNI/horizontalBanner;->adView:Lcom/mopub/mobileads/MoPubView;

    .line 69
    sget-object v4, Lcom/miniclip/nativeJNI/horizontalBanner;->adView:Lcom/mopub/mobileads/MoPubView;

    invoke-virtual {v4, p0}, Lcom/mopub/mobileads/MoPubView;->setOnAdFailedListener(Lcom/mopub/mobileads/MoPubView$OnAdFailedListener;)V

    .line 70
    sget-object v4, Lcom/miniclip/nativeJNI/horizontalBanner;->adView:Lcom/mopub/mobileads/MoPubView;

    invoke-virtual {v4, p0}, Lcom/mopub/mobileads/MoPubView;->setOnAdLoadedListener(Lcom/mopub/mobileads/MoPubView$OnAdLoadedListener;)V

    .line 71
    sget-object v5, Lcom/miniclip/nativeJNI/horizontalBanner;->adView:Lcom/mopub/mobileads/MoPubView;

    iget-object v4, p0, Lcom/miniclip/nativeJNI/horizontalBanner;->mContext:Landroid/content/Context;

    check-cast v4, Lcom/miniclip/nativeJNI/cocojava;

    invoke-virtual {v4}, Lcom/miniclip/nativeJNI/cocojava;->getMoPubGameplayBannerId()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v5, v4}, Lcom/mopub/mobileads/MoPubView;->setAdUnitId(Ljava/lang/String;)V

    .line 72
    sget-object v4, Lcom/miniclip/nativeJNI/horizontalBanner;->adView:Lcom/mopub/mobileads/MoPubView;

    invoke-virtual {v4}, Lcom/mopub/mobileads/MoPubView;->loadAd()V

    .line 74
    invoke-virtual {p0}, Lcom/miniclip/nativeJNI/horizontalBanner;->reAdd()V

    .line 75
    return-void
.end method

.method static synthetic access$000(Lcom/miniclip/nativeJNI/horizontalBanner;)Landroid/os/Handler;
    .locals 1
    .param p0, "x0"    # Lcom/miniclip/nativeJNI/horizontalBanner;

    .prologue
    .line 21
    iget-object v0, p0, Lcom/miniclip/nativeJNI/horizontalBanner;->mAnimationHandler:Landroid/os/Handler;

    return-object v0
.end method


# virtual methods
.method public OnAdFailed(Lcom/mopub/mobileads/MoPubView;)V
    .locals 0
    .param p1, "m"    # Lcom/mopub/mobileads/MoPubView;

    .prologue
    .line 160
    return-void
.end method

.method public OnAdLoaded(Lcom/mopub/mobileads/MoPubView;)V
    .locals 2
    .param p1, "m"    # Lcom/mopub/mobileads/MoPubView;

    .prologue
    .line 164
    const-string v0, "horizontalBanner"

    const-string v1, "OnAdLoaded"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 165
    iget-object v0, p0, Lcom/miniclip/nativeJNI/horizontalBanner;->mAnimationHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/miniclip/nativeJNI/horizontalBanner;->mLoop:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 166
    iget-object v0, p0, Lcom/miniclip/nativeJNI/horizontalBanner;->mOfflineAd:Landroid/widget/RelativeLayout;

    invoke-virtual {p0, v0}, Lcom/miniclip/nativeJNI/horizontalBanner;->removeView(Landroid/view/View;)V

    .line 168
    return-void
.end method

.method public reAdd()V
    .locals 14

    .prologue
    const/4 v13, -0x1

    const/4 v12, 0x0

    const-wide/high16 v10, 0x4074000000000000L    # 320.0

    .line 90
    invoke-virtual {p0}, Lcom/miniclip/nativeJNI/horizontalBanner;->removeAllViews()V

    .line 92
    sget v7, Lcom/miniclip/nativeJNI/cocojava;->mWidth:I

    int-to-float v6, v7

    .line 93
    .local v6, "width":F
    sget v1, Lcom/miniclip/nativeJNI/cocojava;->mDensity:F

    .line 95
    .local v1, "density":F
    new-instance v7, Landroid/widget/RelativeLayout;

    iget-object v8, p0, Lcom/miniclip/nativeJNI/horizontalBanner;->mContext:Landroid/content/Context;

    invoke-direct {v7, v8}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    iput-object v7, p0, Lcom/miniclip/nativeJNI/horizontalBanner;->mAdLayoutVerticle:Landroid/widget/RelativeLayout;

    .line 96
    new-instance v3, Landroid/widget/RelativeLayout$LayoutParams;

    float-to-double v7, v1

    mul-double/2addr v7, v10

    double-to-int v7, v7

    float-to-double v8, v1

    mul-double/2addr v8, v10

    double-to-int v8, v8

    invoke-direct {v3, v7, v8}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 97
    .local v3, "paramsHorizontal":Landroid/widget/RelativeLayout$LayoutParams;
    iget-object v7, p0, Lcom/miniclip/nativeJNI/horizontalBanner;->mAdLayoutVerticle:Landroid/widget/RelativeLayout;

    invoke-virtual {v7, v3}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 99
    sget-object v7, Lcom/miniclip/nativeJNI/horizontalBanner;->adView:Lcom/mopub/mobileads/MoPubView;

    invoke-virtual {v7}, Lcom/mopub/mobileads/MoPubView;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    .line 100
    .local v2, "p":Landroid/view/ViewGroup;
    if-eqz v2, :cond_0

    .line 101
    sget-object v7, Lcom/miniclip/nativeJNI/horizontalBanner;->adView:Lcom/mopub/mobileads/MoPubView;

    invoke-virtual {v2, v7}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 102
    :cond_0
    iget-object v7, p0, Lcom/miniclip/nativeJNI/horizontalBanner;->mAdLayoutVerticle:Landroid/widget/RelativeLayout;

    sget-object v8, Lcom/miniclip/nativeJNI/horizontalBanner;->adView:Lcom/mopub/mobileads/MoPubView;

    invoke-virtual {v7, v8}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 106
    new-instance v0, Landroid/widget/RelativeLayout;

    iget-object v7, p0, Lcom/miniclip/nativeJNI/horizontalBanner;->mContext:Landroid/content/Context;

    invoke-direct {v0, v7}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 107
    .local v0, "adLayoutVerticleClick":Landroid/widget/RelativeLayout;
    new-instance v5, Landroid/widget/RelativeLayout$LayoutParams;

    float-to-double v7, v1

    mul-double/2addr v7, v10

    double-to-int v7, v7

    const-wide/high16 v8, 0x4049000000000000L    # 50.0

    float-to-double v10, v1

    mul-double/2addr v8, v10

    double-to-int v8, v8

    invoke-direct {v5, v7, v8}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 108
    .local v5, "paramsVerticleClick":Landroid/widget/RelativeLayout$LayoutParams;
    invoke-virtual {v0, v5}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 110
    new-instance v4, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v4, v13, v13}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 111
    .local v4, "paramsThis":Landroid/widget/RelativeLayout$LayoutParams;
    const/high16 v7, 0x43a00000    # 320.0f

    mul-float/2addr v7, v1

    sub-float v7, v6, v7

    const/high16 v8, 0x3f000000    # 0.5f

    mul-float/2addr v7, v8

    float-to-int v7, v7

    invoke-virtual {v4, v7, v12, v12, v12}, Landroid/widget/RelativeLayout$LayoutParams;->setMargins(IIII)V

    .line 112
    invoke-virtual {p0, v4}, Lcom/miniclip/nativeJNI/horizontalBanner;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 114
    iget-object v7, p0, Lcom/miniclip/nativeJNI/horizontalBanner;->mOfflineAd:Landroid/widget/RelativeLayout;

    invoke-virtual {p0, v7}, Lcom/miniclip/nativeJNI/horizontalBanner;->addView(Landroid/view/View;)V

    .line 115
    iget-object v7, p0, Lcom/miniclip/nativeJNI/horizontalBanner;->mAdLayoutVerticle:Landroid/widget/RelativeLayout;

    invoke-virtual {p0, v7}, Lcom/miniclip/nativeJNI/horizontalBanner;->addView(Landroid/view/View;)V

    .line 116
    invoke-virtual {p0, v0}, Lcom/miniclip/nativeJNI/horizontalBanner;->addView(Landroid/view/View;)V

    .line 117
    return-void
.end method

.method public resetRefreshTime()V
    .locals 0

    .prologue
    .line 87
    return-void
.end method

.method public runAnimation()V
    .locals 6

    .prologue
    const/4 v5, 0x1

    const/high16 v4, -0x3d4c0000    # -90.0f

    .line 120
    sget v1, Lcom/miniclip/nativeJNI/cocojava;->mDensity:F

    .line 123
    .local v1, "density":F
    const/high16 v3, 0x43200000    # 160.0f

    mul-float v2, v3, v1

    .line 124
    .local v2, "offset":F
    new-instance v0, Landroid/view/animation/RotateAnimation;

    invoke-direct {v0, v4, v4, v2, v2}, Landroid/view/animation/RotateAnimation;-><init>(FFFF)V

    .line 125
    .local v0, "anim":Landroid/view/animation/Animation;
    const-wide/16 v3, 0x3e8

    invoke-virtual {v0, v3, v4}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 126
    invoke-virtual {v0, v5}, Landroid/view/animation/Animation;->setRepeatCount(I)V

    .line 128
    invoke-virtual {v0, v5}, Landroid/view/animation/Animation;->setFillAfter(Z)V

    .line 129
    new-instance v3, Lcom/miniclip/nativeJNI/horizontalBanner$3;

    invoke-direct {v3, p0}, Lcom/miniclip/nativeJNI/horizontalBanner$3;-><init>(Lcom/miniclip/nativeJNI/horizontalBanner;)V

    invoke-virtual {v0, v3}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 148
    sget-object v3, Lcom/miniclip/nativeJNI/horizontalBanner;->adView:Lcom/mopub/mobileads/MoPubView;

    invoke-virtual {v3, v0}, Lcom/mopub/mobileads/MoPubView;->startAnimation(Landroid/view/animation/Animation;)V

    .line 149
    return-void
.end method

.method public setAutorefreshEnabled(Z)V
    .locals 0
    .param p1, "enabled"    # Z

    .prologue
    .line 79
    return-void
.end method

.method public setBlockAutoRefresh(Z)V
    .locals 0
    .param p1, "blocked"    # Z

    .prologue
    .line 83
    return-void
.end method
