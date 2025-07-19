.class public Lcom/miniclip/nativeJNI/rotatedBannerImg;
.super Landroid/widget/RelativeLayout;
.source "rotatedBannerImg.java"

# interfaces
.implements Lcom/mopub/mobileads/MoPubView$OnAdFailedListener;
.implements Lcom/mopub/mobileads/MoPubView$OnAdLoadedListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miniclip/nativeJNI/rotatedBannerImg$MoPubViewRotate;
    }
.end annotation


# static fields
.field public static adView:Lcom/miniclip/nativeJNI/rotatedBannerImg$MoPubViewRotate;


# instance fields
.field private mAdLayoutVerticle:Landroid/widget/RelativeLayout;

.field private mAlignment:I

.field private mAnimationHandler:Landroid/os/Handler;

.field private mContext:Landroid/content/Context;

.field mLoop:Ljava/lang/Runnable;

.field private mOfflineAd:Landroid/widget/RelativeLayout;


# direct methods
.method public constructor <init>(Landroid/content/Context;I)V
    .locals 10
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "alignment"    # I

    .prologue
    const/high16 v9, 0x43a00000    # 320.0f

    .line 58
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 51
    new-instance v5, Landroid/os/Handler;

    invoke-direct {v5}, Landroid/os/Handler;-><init>()V

    iput-object v5, p0, Lcom/miniclip/nativeJNI/rotatedBannerImg;->mAnimationHandler:Landroid/os/Handler;

    .line 52
    new-instance v5, Lcom/miniclip/nativeJNI/rotatedBannerImg$1;

    invoke-direct {v5, p0}, Lcom/miniclip/nativeJNI/rotatedBannerImg$1;-><init>(Lcom/miniclip/nativeJNI/rotatedBannerImg;)V

    iput-object v5, p0, Lcom/miniclip/nativeJNI/rotatedBannerImg;->mLoop:Ljava/lang/Runnable;

    .line 59
    iput-object p1, p0, Lcom/miniclip/nativeJNI/rotatedBannerImg;->mContext:Landroid/content/Context;

    .line 60
    iput p2, p0, Lcom/miniclip/nativeJNI/rotatedBannerImg;->mAlignment:I

    .line 62
    sget v0, Lcom/miniclip/nativeJNI/cocojava;->mDensity:F

    .line 63
    .local v0, "density":F
    iget-object v5, p0, Lcom/miniclip/nativeJNI/rotatedBannerImg;->mContext:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const-string v6, "a100x640"

    const-string v7, "drawable"

    iget-object v8, p0, Lcom/miniclip/nativeJNI/rotatedBannerImg;->mContext:Landroid/content/Context;

    invoke-virtual {v8}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v6, v7, v8}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v2

    .line 65
    .local v2, "resourceIdSide4":I
    new-instance v5, Landroid/widget/RelativeLayout;

    iget-object v6, p0, Lcom/miniclip/nativeJNI/rotatedBannerImg;->mContext:Landroid/content/Context;

    invoke-direct {v5, v6}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    iput-object v5, p0, Lcom/miniclip/nativeJNI/rotatedBannerImg;->mOfflineAd:Landroid/widget/RelativeLayout;

    .line 66
    new-instance v4, Landroid/widget/RelativeLayout$LayoutParams;

    const/high16 v5, 0x42480000    # 50.0f

    mul-float/2addr v5, v0

    float-to-int v5, v5

    mul-float v6, v9, v0

    float-to-int v6, v6

    invoke-direct {v4, v5, v6}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 70
    .local v4, "sideBar3Params":Landroid/widget/RelativeLayout$LayoutParams;
    iget-object v5, p0, Lcom/miniclip/nativeJNI/rotatedBannerImg;->mOfflineAd:Landroid/widget/RelativeLayout;

    invoke-virtual {v5, v4}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 72
    new-instance v3, Landroid/widget/ImageView;

    iget-object v5, p0, Lcom/miniclip/nativeJNI/rotatedBannerImg;->mContext:Landroid/content/Context;

    invoke-direct {v3, v5}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 73
    .local v3, "sideBar3Image1":Landroid/widget/ImageView;
    invoke-virtual {p0}, Lcom/miniclip/nativeJNI/rotatedBannerImg;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    invoke-virtual {v3, v5}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 75
    new-instance v1, Landroid/widget/Gallery$LayoutParams;

    const-wide/high16 v5, 0x4049000000000000L    # 50.0

    float-to-double v7, v0

    mul-double/2addr v5, v7

    double-to-int v5, v5

    mul-float v6, v9, v0

    float-to-int v6, v6

    invoke-direct {v1, v5, v6}, Landroid/widget/Gallery$LayoutParams;-><init>(II)V

    .line 77
    .local v1, "params":Landroid/widget/Gallery$LayoutParams;
    invoke-virtual {v3, v1}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 78
    sget-object v5, Landroid/widget/ImageView$ScaleType;->FIT_XY:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v3, v5}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 80
    iget-object v5, p0, Lcom/miniclip/nativeJNI/rotatedBannerImg;->mOfflineAd:Landroid/widget/RelativeLayout;

    invoke-virtual {v5, v3}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 84
    iget-object v5, p0, Lcom/miniclip/nativeJNI/rotatedBannerImg;->mOfflineAd:Landroid/widget/RelativeLayout;

    new-instance v6, Lcom/miniclip/nativeJNI/rotatedBannerImg$2;

    invoke-direct {v6, p0}, Lcom/miniclip/nativeJNI/rotatedBannerImg$2;-><init>(Lcom/miniclip/nativeJNI/rotatedBannerImg;)V

    invoke-virtual {v5, v6}, Landroid/widget/RelativeLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 95
    new-instance v5, Lcom/miniclip/nativeJNI/rotatedBannerImg$MoPubViewRotate;

    iget-object v6, p0, Lcom/miniclip/nativeJNI/rotatedBannerImg;->mContext:Landroid/content/Context;

    invoke-direct {v5, p0, v6}, Lcom/miniclip/nativeJNI/rotatedBannerImg$MoPubViewRotate;-><init>(Lcom/miniclip/nativeJNI/rotatedBannerImg;Landroid/content/Context;)V

    sput-object v5, Lcom/miniclip/nativeJNI/rotatedBannerImg;->adView:Lcom/miniclip/nativeJNI/rotatedBannerImg$MoPubViewRotate;

    .line 96
    sget-object v5, Lcom/miniclip/nativeJNI/rotatedBannerImg;->adView:Lcom/miniclip/nativeJNI/rotatedBannerImg$MoPubViewRotate;

    invoke-virtual {v5, p0}, Lcom/miniclip/nativeJNI/rotatedBannerImg$MoPubViewRotate;->setOnAdFailedListener(Lcom/mopub/mobileads/MoPubView$OnAdFailedListener;)V

    .line 97
    sget-object v5, Lcom/miniclip/nativeJNI/rotatedBannerImg;->adView:Lcom/miniclip/nativeJNI/rotatedBannerImg$MoPubViewRotate;

    invoke-virtual {v5, p0}, Lcom/miniclip/nativeJNI/rotatedBannerImg$MoPubViewRotate;->setOnAdLoadedListener(Lcom/mopub/mobileads/MoPubView$OnAdLoadedListener;)V

    .line 98
    sget-object v6, Lcom/miniclip/nativeJNI/rotatedBannerImg;->adView:Lcom/miniclip/nativeJNI/rotatedBannerImg$MoPubViewRotate;

    iget-object v5, p0, Lcom/miniclip/nativeJNI/rotatedBannerImg;->mContext:Landroid/content/Context;

    check-cast v5, Lcom/miniclip/nativeJNI/cocojava;

    invoke-virtual {v5}, Lcom/miniclip/nativeJNI/cocojava;->getMoPubGameplayBannerId()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v6, v5}, Lcom/miniclip/nativeJNI/rotatedBannerImg$MoPubViewRotate;->setAdUnitId(Ljava/lang/String;)V

    .line 99
    sget-object v5, Lcom/miniclip/nativeJNI/rotatedBannerImg;->adView:Lcom/miniclip/nativeJNI/rotatedBannerImg$MoPubViewRotate;

    invoke-virtual {v5}, Lcom/miniclip/nativeJNI/rotatedBannerImg$MoPubViewRotate;->loadAd()V

    .line 101
    invoke-virtual {p0}, Lcom/miniclip/nativeJNI/rotatedBannerImg;->reAdd()V

    .line 102
    return-void
.end method

.method static synthetic access$000(Lcom/miniclip/nativeJNI/rotatedBannerImg;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/miniclip/nativeJNI/rotatedBannerImg;

    .prologue
    .line 33
    iget-object v0, p0, Lcom/miniclip/nativeJNI/rotatedBannerImg;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$100(Lcom/miniclip/nativeJNI/rotatedBannerImg;)I
    .locals 1
    .param p0, "x0"    # Lcom/miniclip/nativeJNI/rotatedBannerImg;

    .prologue
    .line 33
    iget v0, p0, Lcom/miniclip/nativeJNI/rotatedBannerImg;->mAlignment:I

    return v0
.end method

.method static synthetic access$200(Lcom/miniclip/nativeJNI/rotatedBannerImg;)Landroid/widget/RelativeLayout;
    .locals 1
    .param p0, "x0"    # Lcom/miniclip/nativeJNI/rotatedBannerImg;

    .prologue
    .line 33
    iget-object v0, p0, Lcom/miniclip/nativeJNI/rotatedBannerImg;->mOfflineAd:Landroid/widget/RelativeLayout;

    return-object v0
.end method

.method static synthetic access$202(Lcom/miniclip/nativeJNI/rotatedBannerImg;Landroid/widget/RelativeLayout;)Landroid/widget/RelativeLayout;
    .locals 0
    .param p0, "x0"    # Lcom/miniclip/nativeJNI/rotatedBannerImg;
    .param p1, "x1"    # Landroid/widget/RelativeLayout;

    .prologue
    .line 33
    iput-object p1, p0, Lcom/miniclip/nativeJNI/rotatedBannerImg;->mOfflineAd:Landroid/widget/RelativeLayout;

    return-object p1
.end method


# virtual methods
.method public OnAdFailed(Lcom/mopub/mobileads/MoPubView;)V
    .locals 0
    .param p1, "m"    # Lcom/mopub/mobileads/MoPubView;

    .prologue
    .line 223
    return-void
.end method

.method public OnAdLoaded(Lcom/mopub/mobileads/MoPubView;)V
    .locals 2
    .param p1, "m"    # Lcom/mopub/mobileads/MoPubView;

    .prologue
    .line 228
    const-string v0, "rotatedBanner"

    const-string v1, "OnAdLoaded"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 231
    invoke-virtual {p0}, Lcom/miniclip/nativeJNI/rotatedBannerImg;->runAnimation()V

    .line 232
    return-void
.end method

.method public reAdd()V
    .locals 14

    .prologue
    const/4 v13, -0x1

    const/4 v12, 0x0

    const-wide/high16 v10, 0x4074000000000000L    # 320.0

    .line 135
    invoke-virtual {p0}, Lcom/miniclip/nativeJNI/rotatedBannerImg;->removeAllViews()V

    .line 137
    sget v7, Lcom/miniclip/nativeJNI/cocojava;->mHeight:I

    int-to-float v2, v7

    .line 138
    .local v2, "height":F
    sget v1, Lcom/miniclip/nativeJNI/cocojava;->mDensity:F

    .line 140
    .local v1, "density":F
    new-instance v7, Landroid/widget/RelativeLayout;

    iget-object v8, p0, Lcom/miniclip/nativeJNI/rotatedBannerImg;->mContext:Landroid/content/Context;

    invoke-direct {v7, v8}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    iput-object v7, p0, Lcom/miniclip/nativeJNI/rotatedBannerImg;->mAdLayoutVerticle:Landroid/widget/RelativeLayout;

    .line 141
    new-instance v5, Landroid/widget/RelativeLayout$LayoutParams;

    float-to-double v7, v1

    mul-double/2addr v7, v10

    double-to-int v7, v7

    float-to-double v8, v1

    mul-double/2addr v8, v10

    double-to-int v8, v8

    invoke-direct {v5, v7, v8}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 143
    .local v5, "paramsVerticle":Landroid/widget/RelativeLayout$LayoutParams;
    iget-object v7, p0, Lcom/miniclip/nativeJNI/rotatedBannerImg;->mAdLayoutVerticle:Landroid/widget/RelativeLayout;

    invoke-virtual {v7, v5}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 147
    sget-object v7, Lcom/miniclip/nativeJNI/rotatedBannerImg;->adView:Lcom/miniclip/nativeJNI/rotatedBannerImg$MoPubViewRotate;

    invoke-virtual {v7}, Lcom/miniclip/nativeJNI/rotatedBannerImg$MoPubViewRotate;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    check-cast v3, Landroid/view/ViewGroup;

    .line 148
    .local v3, "p":Landroid/view/ViewGroup;
    if-eqz v3, :cond_0

    .line 149
    sget-object v7, Lcom/miniclip/nativeJNI/rotatedBannerImg;->adView:Lcom/miniclip/nativeJNI/rotatedBannerImg$MoPubViewRotate;

    invoke-virtual {v3, v7}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 150
    :cond_0
    iget-object v7, p0, Lcom/miniclip/nativeJNI/rotatedBannerImg;->mAdLayoutVerticle:Landroid/widget/RelativeLayout;

    sget-object v8, Lcom/miniclip/nativeJNI/rotatedBannerImg;->adView:Lcom/miniclip/nativeJNI/rotatedBannerImg$MoPubViewRotate;

    invoke-virtual {v7, v8}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 165
    new-instance v0, Lcom/miniclip/nativeJNI/rotatedBannerImg$1RelativeLayoutRotate;

    iget-object v7, p0, Lcom/miniclip/nativeJNI/rotatedBannerImg;->mContext:Landroid/content/Context;

    invoke-direct {v0, p0, v7}, Lcom/miniclip/nativeJNI/rotatedBannerImg$1RelativeLayoutRotate;-><init>(Lcom/miniclip/nativeJNI/rotatedBannerImg;Landroid/content/Context;)V

    .line 166
    .local v0, "adLayoutVerticleClick":Landroid/widget/RelativeLayout;
    new-instance v6, Landroid/widget/RelativeLayout$LayoutParams;

    float-to-double v7, v1

    mul-double/2addr v7, v10

    double-to-int v7, v7

    float-to-double v8, v1

    mul-double/2addr v8, v10

    double-to-int v8, v8

    invoke-direct {v6, v7, v8}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 168
    .local v6, "paramsVerticleClick":Landroid/widget/RelativeLayout$LayoutParams;
    invoke-virtual {v0, v6}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 170
    new-instance v4, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v4, v13, v13}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 171
    .local v4, "paramsThis":Landroid/widget/RelativeLayout$LayoutParams;
    const/high16 v7, 0x43a00000    # 320.0f

    mul-float/2addr v7, v1

    sub-float v7, v2, v7

    const/high16 v8, 0x3f000000    # 0.5f

    mul-float/2addr v7, v8

    float-to-int v7, v7

    invoke-virtual {v4, v12, v7, v12, v12}, Landroid/widget/RelativeLayout$LayoutParams;->setMargins(IIII)V

    .line 172
    invoke-virtual {p0, v4}, Lcom/miniclip/nativeJNI/rotatedBannerImg;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 174
    iget-object v7, p0, Lcom/miniclip/nativeJNI/rotatedBannerImg;->mOfflineAd:Landroid/widget/RelativeLayout;

    invoke-virtual {p0, v7}, Lcom/miniclip/nativeJNI/rotatedBannerImg;->addView(Landroid/view/View;)V

    .line 175
    iget-object v7, p0, Lcom/miniclip/nativeJNI/rotatedBannerImg;->mAdLayoutVerticle:Landroid/widget/RelativeLayout;

    invoke-virtual {p0, v7}, Lcom/miniclip/nativeJNI/rotatedBannerImg;->addView(Landroid/view/View;)V

    .line 176
    invoke-virtual {p0, v0}, Lcom/miniclip/nativeJNI/rotatedBannerImg;->addView(Landroid/view/View;)V

    .line 177
    return-void
.end method

.method public resetRefreshTime()V
    .locals 1

    .prologue
    .line 130
    sget-object v0, Lcom/miniclip/nativeJNI/rotatedBannerImg;->adView:Lcom/miniclip/nativeJNI/rotatedBannerImg$MoPubViewRotate;

    invoke-virtual {v0}, Lcom/miniclip/nativeJNI/rotatedBannerImg$MoPubViewRotate;->resetRefreshTime()V

    .line 131
    return-void
.end method

.method public runAnimation()V
    .locals 5

    .prologue
    .line 181
    move-object v0, p0

    .line 182
    .local v0, "thiz":Lcom/miniclip/nativeJNI/rotatedBannerImg;
    iget-object v1, p0, Lcom/miniclip/nativeJNI/rotatedBannerImg;->mAnimationHandler:Landroid/os/Handler;

    new-instance v2, Lcom/miniclip/nativeJNI/rotatedBannerImg$3;

    invoke-direct {v2, p0, v0}, Lcom/miniclip/nativeJNI/rotatedBannerImg$3;-><init>(Lcom/miniclip/nativeJNI/rotatedBannerImg;Lcom/miniclip/nativeJNI/rotatedBannerImg;)V

    const-wide/16 v3, 0x3e8

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 209
    return-void
.end method

.method public setAlignment(I)V
    .locals 4
    .param p1, "alignment"    # I

    .prologue
    .line 105
    iput p1, p0, Lcom/miniclip/nativeJNI/rotatedBannerImg;->mAlignment:I

    .line 107
    sget v2, Lcom/miniclip/nativeJNI/cocojava;->ALIGN_RIGHT:I

    if-ne p1, v2, :cond_0

    .line 108
    sget v0, Lcom/miniclip/nativeJNI/cocojava;->mDensity:F

    .line 109
    .local v0, "density":F
    new-instance v1, Landroid/widget/RelativeLayout$LayoutParams;

    const/high16 v2, 0x42480000    # 50.0f

    mul-float/2addr v2, v0

    float-to-int v2, v2

    const/high16 v3, 0x43a00000    # 320.0f

    mul-float/2addr v3, v0

    float-to-int v3, v3

    invoke-direct {v1, v2, v3}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 112
    .local v1, "sideBar3Params":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v2, 0xb

    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 114
    iget-object v2, p0, Lcom/miniclip/nativeJNI/rotatedBannerImg;->mOfflineAd:Landroid/widget/RelativeLayout;

    invoke-virtual {v2, v1}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 116
    .end local v0    # "density":F
    .end local v1    # "sideBar3Params":Landroid/widget/RelativeLayout$LayoutParams;
    :cond_0
    return-void
.end method

.method public setAutorefreshEnabled(Z)V
    .locals 1
    .param p1, "enabled"    # Z

    .prologue
    .line 120
    sget-object v0, Lcom/miniclip/nativeJNI/rotatedBannerImg;->adView:Lcom/miniclip/nativeJNI/rotatedBannerImg$MoPubViewRotate;

    invoke-virtual {v0, p1}, Lcom/miniclip/nativeJNI/rotatedBannerImg$MoPubViewRotate;->setAutorefreshEnabled(Z)V

    .line 121
    return-void
.end method

.method public setBlockAutoRefresh(Z)V
    .locals 1
    .param p1, "blocked"    # Z

    .prologue
    .line 125
    sget-object v0, Lcom/miniclip/nativeJNI/rotatedBannerImg;->adView:Lcom/miniclip/nativeJNI/rotatedBannerImg$MoPubViewRotate;

    invoke-virtual {v0, p1}, Lcom/miniclip/nativeJNI/rotatedBannerImg$MoPubViewRotate;->setBlockAutoRefresh(Z)V

    .line 126
    return-void
.end method
