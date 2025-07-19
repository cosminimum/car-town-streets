.class public Lcom/miniclip/nativeJNI/rotatedBanner;
.super Landroid/widget/RelativeLayout;
.source "rotatedBanner.java"

# interfaces
.implements Lcom/mopub/mobileads/MoPubView$OnAdFailedListener;
.implements Lcom/mopub/mobileads/MoPubView$OnAdLoadedListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miniclip/nativeJNI/rotatedBanner$MoPubViewRotate;
    }
.end annotation


# static fields
.field public static adView:Lcom/miniclip/nativeJNI/rotatedBanner$MoPubViewRotate;


# instance fields
.field private mAdLayoutVerticle:Landroid/widget/RelativeLayout;

.field private mAlignment:I

.field private mAnimationHandler:Landroid/os/Handler;

.field private mContext:Landroid/content/Context;

.field mLoop:Ljava/lang/Runnable;

.field private mOfflineAd:Landroid/widget/RelativeLayout;


# direct methods
.method public constructor <init>(Landroid/content/Context;I)V
    .locals 12
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "alignment"    # I

    .prologue
    const/high16 v11, 0x43a00000    # 320.0f

    const-wide/high16 v9, 0x4049000000000000L    # 50.0

    .line 65
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 45
    new-instance v5, Landroid/os/Handler;

    invoke-direct {v5}, Landroid/os/Handler;-><init>()V

    iput-object v5, p0, Lcom/miniclip/nativeJNI/rotatedBanner;->mAnimationHandler:Landroid/os/Handler;

    .line 46
    new-instance v5, Lcom/miniclip/nativeJNI/rotatedBanner$1;

    invoke-direct {v5, p0}, Lcom/miniclip/nativeJNI/rotatedBanner$1;-><init>(Lcom/miniclip/nativeJNI/rotatedBanner;)V

    iput-object v5, p0, Lcom/miniclip/nativeJNI/rotatedBanner;->mLoop:Ljava/lang/Runnable;

    .line 66
    iput-object p1, p0, Lcom/miniclip/nativeJNI/rotatedBanner;->mContext:Landroid/content/Context;

    .line 67
    iput p2, p0, Lcom/miniclip/nativeJNI/rotatedBanner;->mAlignment:I

    .line 69
    sget v0, Lcom/miniclip/nativeJNI/cocojava;->mDensity:F

    .line 70
    .local v0, "density":F
    iget-object v5, p0, Lcom/miniclip/nativeJNI/rotatedBanner;->mContext:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const-string v6, "a100x640"

    const-string v7, "drawable"

    iget-object v8, p0, Lcom/miniclip/nativeJNI/rotatedBanner;->mContext:Landroid/content/Context;

    invoke-virtual {v8}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v6, v7, v8}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v2

    .line 72
    .local v2, "resourceIdSide4":I
    new-instance v5, Landroid/widget/RelativeLayout;

    iget-object v6, p0, Lcom/miniclip/nativeJNI/rotatedBanner;->mContext:Landroid/content/Context;

    invoke-direct {v5, v6}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    iput-object v5, p0, Lcom/miniclip/nativeJNI/rotatedBanner;->mOfflineAd:Landroid/widget/RelativeLayout;

    .line 73
    new-instance v4, Landroid/widget/RelativeLayout$LayoutParams;

    float-to-double v5, v0

    mul-double/2addr v5, v9

    double-to-int v5, v5

    mul-float v6, v11, v0

    float-to-int v6, v6

    invoke-direct {v4, v5, v6}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 77
    .local v4, "sideBar3Params":Landroid/widget/RelativeLayout$LayoutParams;
    iget-object v5, p0, Lcom/miniclip/nativeJNI/rotatedBanner;->mOfflineAd:Landroid/widget/RelativeLayout;

    invoke-virtual {v5, v4}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 79
    new-instance v3, Landroid/widget/ImageView;

    iget-object v5, p0, Lcom/miniclip/nativeJNI/rotatedBanner;->mContext:Landroid/content/Context;

    invoke-direct {v3, v5}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 80
    .local v3, "sideBar3Image1":Landroid/widget/ImageView;
    invoke-virtual {p0}, Lcom/miniclip/nativeJNI/rotatedBanner;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    invoke-virtual {v3, v5}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 82
    new-instance v1, Landroid/widget/Gallery$LayoutParams;

    float-to-double v5, v0

    mul-double/2addr v5, v9

    double-to-int v5, v5

    mul-float v6, v11, v0

    float-to-int v6, v6

    invoke-direct {v1, v5, v6}, Landroid/widget/Gallery$LayoutParams;-><init>(II)V

    .line 84
    .local v1, "params":Landroid/widget/Gallery$LayoutParams;
    invoke-virtual {v3, v1}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 85
    sget-object v5, Landroid/widget/ImageView$ScaleType;->FIT_XY:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v3, v5}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 87
    iget-object v5, p0, Lcom/miniclip/nativeJNI/rotatedBanner;->mOfflineAd:Landroid/widget/RelativeLayout;

    invoke-virtual {v5, v3}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 89
    iget-object v5, p0, Lcom/miniclip/nativeJNI/rotatedBanner;->mOfflineAd:Landroid/widget/RelativeLayout;

    const v6, -0xff01

    invoke-virtual {v5, v6}, Landroid/widget/RelativeLayout;->setBackgroundColor(I)V

    .line 91
    iget-object v5, p0, Lcom/miniclip/nativeJNI/rotatedBanner;->mOfflineAd:Landroid/widget/RelativeLayout;

    new-instance v6, Lcom/miniclip/nativeJNI/rotatedBanner$2;

    invoke-direct {v6, p0}, Lcom/miniclip/nativeJNI/rotatedBanner$2;-><init>(Lcom/miniclip/nativeJNI/rotatedBanner;)V

    invoke-virtual {v5, v6}, Landroid/widget/RelativeLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 102
    new-instance v5, Lcom/miniclip/nativeJNI/rotatedBanner$MoPubViewRotate;

    iget-object v6, p0, Lcom/miniclip/nativeJNI/rotatedBanner;->mContext:Landroid/content/Context;

    invoke-direct {v5, p0, v6}, Lcom/miniclip/nativeJNI/rotatedBanner$MoPubViewRotate;-><init>(Lcom/miniclip/nativeJNI/rotatedBanner;Landroid/content/Context;)V

    sput-object v5, Lcom/miniclip/nativeJNI/rotatedBanner;->adView:Lcom/miniclip/nativeJNI/rotatedBanner$MoPubViewRotate;

    .line 103
    sget-object v5, Lcom/miniclip/nativeJNI/rotatedBanner;->adView:Lcom/miniclip/nativeJNI/rotatedBanner$MoPubViewRotate;

    invoke-virtual {v5, p0}, Lcom/miniclip/nativeJNI/rotatedBanner$MoPubViewRotate;->setOnAdFailedListener(Lcom/mopub/mobileads/MoPubView$OnAdFailedListener;)V

    .line 104
    sget-object v5, Lcom/miniclip/nativeJNI/rotatedBanner;->adView:Lcom/miniclip/nativeJNI/rotatedBanner$MoPubViewRotate;

    invoke-virtual {v5, p0}, Lcom/miniclip/nativeJNI/rotatedBanner$MoPubViewRotate;->setOnAdLoadedListener(Lcom/mopub/mobileads/MoPubView$OnAdLoadedListener;)V

    .line 105
    sget-object v6, Lcom/miniclip/nativeJNI/rotatedBanner;->adView:Lcom/miniclip/nativeJNI/rotatedBanner$MoPubViewRotate;

    iget-object v5, p0, Lcom/miniclip/nativeJNI/rotatedBanner;->mContext:Landroid/content/Context;

    check-cast v5, Lcom/miniclip/nativeJNI/cocojava;

    invoke-virtual {v5}, Lcom/miniclip/nativeJNI/cocojava;->getMoPubGameplayBannerId()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v6, v5}, Lcom/miniclip/nativeJNI/rotatedBanner$MoPubViewRotate;->setAdUnitId(Ljava/lang/String;)V

    .line 106
    sget-object v5, Lcom/miniclip/nativeJNI/rotatedBanner;->adView:Lcom/miniclip/nativeJNI/rotatedBanner$MoPubViewRotate;

    invoke-virtual {v5}, Lcom/miniclip/nativeJNI/rotatedBanner$MoPubViewRotate;->loadAd()V

    .line 108
    invoke-virtual {p0}, Lcom/miniclip/nativeJNI/rotatedBanner;->reAdd()V

    .line 109
    return-void
.end method

.method static synthetic access$000(Lcom/miniclip/nativeJNI/rotatedBanner;)Landroid/os/Handler;
    .locals 1
    .param p0, "x0"    # Lcom/miniclip/nativeJNI/rotatedBanner;

    .prologue
    .line 27
    iget-object v0, p0, Lcom/miniclip/nativeJNI/rotatedBanner;->mAnimationHandler:Landroid/os/Handler;

    return-object v0
.end method


# virtual methods
.method public OnAdFailed(Lcom/mopub/mobileads/MoPubView;)V
    .locals 0
    .param p1, "m"    # Lcom/mopub/mobileads/MoPubView;

    .prologue
    .line 244
    return-void
.end method

.method public OnAdLoaded(Lcom/mopub/mobileads/MoPubView;)V
    .locals 2
    .param p1, "m"    # Lcom/mopub/mobileads/MoPubView;

    .prologue
    .line 249
    const-string v0, "rotatedBanner"

    const-string v1, "OnAdLoaded"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 250
    iget-object v0, p0, Lcom/miniclip/nativeJNI/rotatedBanner;->mAnimationHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/miniclip/nativeJNI/rotatedBanner;->mLoop:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 251
    iget-object v0, p0, Lcom/miniclip/nativeJNI/rotatedBanner;->mOfflineAd:Landroid/widget/RelativeLayout;

    invoke-virtual {p0, v0}, Lcom/miniclip/nativeJNI/rotatedBanner;->removeView(Landroid/view/View;)V

    .line 252
    invoke-virtual {p0}, Lcom/miniclip/nativeJNI/rotatedBanner;->runAnimation()V

    .line 253
    return-void
.end method

.method public reAdd()V
    .locals 14

    .prologue
    const/4 v13, -0x1

    const/4 v12, 0x0

    const-wide/high16 v10, 0x4074000000000000L    # 320.0

    .line 142
    invoke-virtual {p0}, Lcom/miniclip/nativeJNI/rotatedBanner;->removeAllViews()V

    .line 144
    sget v7, Lcom/miniclip/nativeJNI/cocojava;->mHeight:I

    int-to-float v2, v7

    .line 145
    .local v2, "height":F
    sget v1, Lcom/miniclip/nativeJNI/cocojava;->mDensity:F

    .line 147
    .local v1, "density":F
    new-instance v7, Landroid/widget/RelativeLayout;

    iget-object v8, p0, Lcom/miniclip/nativeJNI/rotatedBanner;->mContext:Landroid/content/Context;

    invoke-direct {v7, v8}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    iput-object v7, p0, Lcom/miniclip/nativeJNI/rotatedBanner;->mAdLayoutVerticle:Landroid/widget/RelativeLayout;

    .line 148
    new-instance v5, Landroid/widget/RelativeLayout$LayoutParams;

    float-to-double v7, v1

    mul-double/2addr v7, v10

    double-to-int v7, v7

    float-to-double v8, v1

    mul-double/2addr v8, v10

    double-to-int v8, v8

    invoke-direct {v5, v7, v8}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 150
    .local v5, "paramsVerticle":Landroid/widget/RelativeLayout$LayoutParams;
    iget-object v7, p0, Lcom/miniclip/nativeJNI/rotatedBanner;->mAdLayoutVerticle:Landroid/widget/RelativeLayout;

    invoke-virtual {v7, v5}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 154
    sget-object v7, Lcom/miniclip/nativeJNI/rotatedBanner;->adView:Lcom/miniclip/nativeJNI/rotatedBanner$MoPubViewRotate;

    invoke-virtual {v7}, Lcom/miniclip/nativeJNI/rotatedBanner$MoPubViewRotate;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    check-cast v3, Landroid/view/ViewGroup;

    .line 155
    .local v3, "p":Landroid/view/ViewGroup;
    if-eqz v3, :cond_0

    .line 156
    sget-object v7, Lcom/miniclip/nativeJNI/rotatedBanner;->adView:Lcom/miniclip/nativeJNI/rotatedBanner$MoPubViewRotate;

    invoke-virtual {v3, v7}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 157
    :cond_0
    iget-object v7, p0, Lcom/miniclip/nativeJNI/rotatedBanner;->mAdLayoutVerticle:Landroid/widget/RelativeLayout;

    sget-object v8, Lcom/miniclip/nativeJNI/rotatedBanner;->adView:Lcom/miniclip/nativeJNI/rotatedBanner$MoPubViewRotate;

    invoke-virtual {v7, v8}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 159
    invoke-virtual {p0}, Lcom/miniclip/nativeJNI/rotatedBanner;->runAnimation()V

    .line 171
    new-instance v0, Lcom/miniclip/nativeJNI/rotatedBanner$1RelativeLayoutRotate;

    iget-object v7, p0, Lcom/miniclip/nativeJNI/rotatedBanner;->mContext:Landroid/content/Context;

    invoke-direct {v0, p0, v7}, Lcom/miniclip/nativeJNI/rotatedBanner$1RelativeLayoutRotate;-><init>(Lcom/miniclip/nativeJNI/rotatedBanner;Landroid/content/Context;)V

    .line 172
    .local v0, "adLayoutVerticleClick":Landroid/widget/RelativeLayout;
    new-instance v6, Landroid/widget/RelativeLayout$LayoutParams;

    float-to-double v7, v1

    mul-double/2addr v7, v10

    double-to-int v7, v7

    float-to-double v8, v1

    mul-double/2addr v8, v10

    double-to-int v8, v8

    invoke-direct {v6, v7, v8}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 174
    .local v6, "paramsVerticleClick":Landroid/widget/RelativeLayout$LayoutParams;
    invoke-virtual {v0, v6}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 176
    new-instance v4, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v4, v13, v13}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 177
    .local v4, "paramsThis":Landroid/widget/RelativeLayout$LayoutParams;
    const/high16 v7, 0x43a00000    # 320.0f

    mul-float/2addr v7, v1

    sub-float v7, v2, v7

    const/high16 v8, 0x3f000000    # 0.5f

    mul-float/2addr v7, v8

    float-to-int v7, v7

    invoke-virtual {v4, v12, v7, v12, v12}, Landroid/widget/RelativeLayout$LayoutParams;->setMargins(IIII)V

    .line 178
    invoke-virtual {p0, v4}, Lcom/miniclip/nativeJNI/rotatedBanner;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 180
    iget-object v7, p0, Lcom/miniclip/nativeJNI/rotatedBanner;->mOfflineAd:Landroid/widget/RelativeLayout;

    invoke-virtual {p0, v7}, Lcom/miniclip/nativeJNI/rotatedBanner;->addView(Landroid/view/View;)V

    .line 181
    iget-object v7, p0, Lcom/miniclip/nativeJNI/rotatedBanner;->mAdLayoutVerticle:Landroid/widget/RelativeLayout;

    invoke-virtual {p0, v7}, Lcom/miniclip/nativeJNI/rotatedBanner;->addView(Landroid/view/View;)V

    .line 182
    invoke-virtual {p0, v0}, Lcom/miniclip/nativeJNI/rotatedBanner;->addView(Landroid/view/View;)V

    .line 183
    return-void
.end method

.method public resetRefreshTime()V
    .locals 1

    .prologue
    .line 137
    sget-object v0, Lcom/miniclip/nativeJNI/rotatedBanner;->adView:Lcom/miniclip/nativeJNI/rotatedBanner$MoPubViewRotate;

    invoke-virtual {v0}, Lcom/miniclip/nativeJNI/rotatedBanner$MoPubViewRotate;->resetRefreshTime()V

    .line 138
    return-void
.end method

.method public runAnimation()V
    .locals 9

    .prologue
    const/4 v8, 0x1

    const/high16 v7, 0x42b40000    # 90.0f

    const/high16 v6, -0x3d4c0000    # -90.0f

    .line 187
    sget v1, Lcom/miniclip/nativeJNI/cocojava;->mDensity:F

    .line 188
    .local v1, "density":F
    sget v4, Lcom/miniclip/nativeJNI/cocojava;->mHeight:I

    int-to-float v2, v4

    .line 190
    .local v2, "height":F
    const/high16 v4, 0x43200000    # 160.0f

    mul-float v3, v4, v1

    .line 192
    .local v3, "offset":F
    const/4 v0, 0x0

    .line 193
    .local v0, "anim":Landroid/view/animation/Animation;
    iget v4, p0, Lcom/miniclip/nativeJNI/rotatedBanner;->mAlignment:I

    sget v5, Lcom/miniclip/nativeJNI/cocojava;->ALIGN_LEFT:I

    if-ne v4, v5, :cond_1

    .line 194
    new-instance v0, Landroid/view/animation/RotateAnimation;

    .end local v0    # "anim":Landroid/view/animation/Animation;
    invoke-direct {v0, v6, v6, v3, v3}, Landroid/view/animation/RotateAnimation;-><init>(FFFF)V

    .line 199
    .restart local v0    # "anim":Landroid/view/animation/Animation;
    :cond_0
    :goto_0
    if-nez v0, :cond_2

    .line 200
    const-string v4, "rotatedBanner"

    const-string v5, "runAnimation: Trying to runAnimation on banner with undefined alignment!"

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 228
    :goto_1
    return-void

    .line 195
    :cond_1
    iget v4, p0, Lcom/miniclip/nativeJNI/rotatedBanner;->mAlignment:I

    sget v5, Lcom/miniclip/nativeJNI/cocojava;->ALIGN_RIGHT:I

    if-ne v4, v5, :cond_0

    .line 196
    new-instance v0, Landroid/view/animation/RotateAnimation;

    .end local v0    # "anim":Landroid/view/animation/Animation;
    invoke-direct {v0, v7, v7, v3, v3}, Landroid/view/animation/RotateAnimation;-><init>(FFFF)V

    .restart local v0    # "anim":Landroid/view/animation/Animation;
    goto :goto_0

    .line 204
    :cond_2
    const-wide/16 v4, 0x64

    invoke-virtual {v0, v4, v5}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 205
    invoke-virtual {v0, v8}, Landroid/view/animation/Animation;->setRepeatCount(I)V

    .line 207
    invoke-virtual {v0, v8}, Landroid/view/animation/Animation;->setFillAfter(Z)V

    .line 208
    new-instance v4, Lcom/miniclip/nativeJNI/rotatedBanner$3;

    invoke-direct {v4, p0}, Lcom/miniclip/nativeJNI/rotatedBanner$3;-><init>(Lcom/miniclip/nativeJNI/rotatedBanner;)V

    invoke-virtual {v0, v4}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 227
    sget-object v4, Lcom/miniclip/nativeJNI/rotatedBanner;->adView:Lcom/miniclip/nativeJNI/rotatedBanner$MoPubViewRotate;

    invoke-virtual {v4, v0}, Lcom/miniclip/nativeJNI/rotatedBanner$MoPubViewRotate;->startAnimation(Landroid/view/animation/Animation;)V

    goto :goto_1
.end method

.method public setAlignment(I)V
    .locals 6
    .param p1, "alignment"    # I

    .prologue
    .line 112
    iput p1, p0, Lcom/miniclip/nativeJNI/rotatedBanner;->mAlignment:I

    .line 114
    sget v2, Lcom/miniclip/nativeJNI/cocojava;->ALIGN_RIGHT:I

    if-ne p1, v2, :cond_0

    .line 115
    sget v0, Lcom/miniclip/nativeJNI/cocojava;->mDensity:F

    .line 116
    .local v0, "density":F
    new-instance v1, Landroid/widget/RelativeLayout$LayoutParams;

    const-wide/high16 v2, 0x4049000000000000L    # 50.0

    float-to-double v4, v0

    mul-double/2addr v2, v4

    double-to-int v2, v2

    const/high16 v3, 0x43a00000    # 320.0f

    mul-float/2addr v3, v0

    float-to-int v3, v3

    invoke-direct {v1, v2, v3}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 119
    .local v1, "sideBar3Params":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v2, 0xb

    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 121
    iget-object v2, p0, Lcom/miniclip/nativeJNI/rotatedBanner;->mOfflineAd:Landroid/widget/RelativeLayout;

    invoke-virtual {v2, v1}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 123
    .end local v0    # "density":F
    .end local v1    # "sideBar3Params":Landroid/widget/RelativeLayout$LayoutParams;
    :cond_0
    return-void
.end method

.method public setAutorefreshEnabled(Z)V
    .locals 1
    .param p1, "enabled"    # Z

    .prologue
    .line 127
    sget-object v0, Lcom/miniclip/nativeJNI/rotatedBanner;->adView:Lcom/miniclip/nativeJNI/rotatedBanner$MoPubViewRotate;

    invoke-virtual {v0, p1}, Lcom/miniclip/nativeJNI/rotatedBanner$MoPubViewRotate;->setAutorefreshEnabled(Z)V

    .line 128
    return-void
.end method

.method public setBlockAutoRefresh(Z)V
    .locals 1
    .param p1, "blocked"    # Z

    .prologue
    .line 132
    sget-object v0, Lcom/miniclip/nativeJNI/rotatedBanner;->adView:Lcom/miniclip/nativeJNI/rotatedBanner$MoPubViewRotate;

    invoke-virtual {v0, p1}, Lcom/miniclip/nativeJNI/rotatedBanner$MoPubViewRotate;->setBlockAutoRefresh(Z)V

    .line 133
    return-void
.end method
