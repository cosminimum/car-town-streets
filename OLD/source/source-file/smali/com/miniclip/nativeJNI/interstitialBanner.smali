.class public Lcom/miniclip/nativeJNI/interstitialBanner;
.super Landroid/widget/RelativeLayout;
.source "interstitialBanner.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# static fields
.field private static adView:Lcom/mopub/mobileads/MoPubView;

.field private static mSkip1:Landroid/widget/Button;


# instance fields
.field private mAddSkipButton:Ljava/lang/Runnable;

.field private mContext:Landroid/content/Context;

.field private mDialogView:Landroid/widget/RelativeLayout;

.field protected mFullView:Landroid/widget/RelativeLayout;

.field private mHandler:Landroid/os/Handler;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 29
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 26
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/miniclip/nativeJNI/interstitialBanner;->mHandler:Landroid/os/Handler;

    .line 39
    new-instance v0, Lcom/miniclip/nativeJNI/interstitialBanner$1;

    invoke-direct {v0, p0}, Lcom/miniclip/nativeJNI/interstitialBanner$1;-><init>(Lcom/miniclip/nativeJNI/interstitialBanner;)V

    iput-object v0, p0, Lcom/miniclip/nativeJNI/interstitialBanner;->mAddSkipButton:Ljava/lang/Runnable;

    .line 30
    iput-object p1, p0, Lcom/miniclip/nativeJNI/interstitialBanner;->mContext:Landroid/content/Context;

    .line 31
    return-void
.end method

.method static synthetic access$000()Landroid/widget/Button;
    .locals 1

    .prologue
    .line 20
    sget-object v0, Lcom/miniclip/nativeJNI/interstitialBanner;->mSkip1:Landroid/widget/Button;

    return-object v0
.end method

.method static synthetic access$100(Lcom/miniclip/nativeJNI/interstitialBanner;)Landroid/widget/RelativeLayout;
    .locals 1
    .param p0, "x0"    # Lcom/miniclip/nativeJNI/interstitialBanner;

    .prologue
    .line 20
    iget-object v0, p0, Lcom/miniclip/nativeJNI/interstitialBanner;->mDialogView:Landroid/widget/RelativeLayout;

    return-object v0
.end method


# virtual methods
.method hasAd()Z
    .locals 1

    .prologue
    .line 117
    sget-object v0, Lcom/miniclip/nativeJNI/interstitialBanner;->adView:Lcom/mopub/mobileads/MoPubView;

    invoke-virtual {v0}, Lcom/mopub/mobileads/MoPubView;->AdLoaded()Z

    move-result v0

    return v0
.end method

.method hideAd()V
    .locals 1

    .prologue
    .line 111
    iget-object v0, p0, Lcom/miniclip/nativeJNI/interstitialBanner;->mDialogView:Landroid/widget/RelativeLayout;

    invoke-virtual {v0}, Landroid/widget/RelativeLayout;->removeAllViews()V

    .line 112
    invoke-virtual {p0}, Lcom/miniclip/nativeJNI/interstitialBanner;->removeAllViews()V

    .line 113
    return-void
.end method

.method loadAd()V
    .locals 2

    .prologue
    .line 34
    new-instance v0, Lcom/mopub/mobileads/MoPubView;

    iget-object v1, p0, Lcom/miniclip/nativeJNI/interstitialBanner;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/mopub/mobileads/MoPubView;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/miniclip/nativeJNI/interstitialBanner;->adView:Lcom/mopub/mobileads/MoPubView;

    .line 35
    sget-object v1, Lcom/miniclip/nativeJNI/interstitialBanner;->adView:Lcom/mopub/mobileads/MoPubView;

    iget-object v0, p0, Lcom/miniclip/nativeJNI/interstitialBanner;->mContext:Landroid/content/Context;

    check-cast v0, Lcom/miniclip/nativeJNI/cocojava;

    invoke-virtual {v0}, Lcom/miniclip/nativeJNI/cocojava;->getMoPubInterstitialBannerId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/mopub/mobileads/MoPubView;->setAdUnitId(Ljava/lang/String;)V

    .line 36
    sget-object v0, Lcom/miniclip/nativeJNI/interstitialBanner;->adView:Lcom/mopub/mobileads/MoPubView;

    invoke-virtual {v0}, Lcom/mopub/mobileads/MoPubView;->loadAd()V

    .line 37
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 122
    sget-object v0, Lcom/miniclip/nativeJNI/interstitialBanner;->mSkip1:Landroid/widget/Button;

    if-ne p1, v0, :cond_0

    .line 123
    invoke-virtual {p0}, Lcom/miniclip/nativeJNI/interstitialBanner;->hideAd()V

    .line 124
    :cond_0
    return-void
.end method

.method showAd()V
    .locals 17

    .prologue
    .line 48
    new-instance v12, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v2, -0x1

    const/4 v3, -0x1

    invoke-direct {v12, v2, v3}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 49
    .local v12, "paramsFull1":Landroid/widget/RelativeLayout$LayoutParams;
    new-instance v2, Landroid/widget/RelativeLayout;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/miniclip/nativeJNI/interstitialBanner;->mContext:Landroid/content/Context;

    invoke-direct {v2, v3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/miniclip/nativeJNI/interstitialBanner;->mFullView:Landroid/widget/RelativeLayout;

    .line 50
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/miniclip/nativeJNI/interstitialBanner;->mFullView:Landroid/widget/RelativeLayout;

    invoke-virtual {v2, v12}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 51
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/miniclip/nativeJNI/interstitialBanner;->mFullView:Landroid/widget/RelativeLayout;

    move-object/from16 v0, p0

    invoke-virtual {v2, v0}, Landroid/widget/RelativeLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 52
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/miniclip/nativeJNI/interstitialBanner;->mFullView:Landroid/widget/RelativeLayout;

    const/high16 v3, -0x70000000

    invoke-virtual {v2, v3}, Landroid/widget/RelativeLayout;->setBackgroundColor(I)V

    .line 53
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/miniclip/nativeJNI/interstitialBanner;->mFullView:Landroid/widget/RelativeLayout;

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/miniclip/nativeJNI/interstitialBanner;->addView(Landroid/view/View;)V

    .line 55
    sget v8, Lcom/miniclip/nativeJNI/cocojava;->mDensity:F

    .line 56
    .local v8, "density":F
    new-instance v13, Landroid/widget/RelativeLayout$LayoutParams;

    const/high16 v2, 0x43a00000    # 320.0f

    mul-float/2addr v2, v8

    float-to-int v2, v2

    add-int/lit8 v2, v2, 0xa

    const/high16 v3, 0x42480000    # 50.0f

    mul-float/2addr v3, v8

    const/high16 v4, 0x40000000    # 2.0f

    mul-float/2addr v3, v4

    float-to-int v3, v3

    add-int/lit8 v3, v3, 0xa

    invoke-direct {v13, v2, v3}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 57
    .local v13, "paramsFull2":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v2, 0xd

    invoke-virtual {v13, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 58
    new-instance v2, Landroid/widget/RelativeLayout;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/miniclip/nativeJNI/interstitialBanner;->mContext:Landroid/content/Context;

    invoke-direct {v2, v3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/miniclip/nativeJNI/interstitialBanner;->mDialogView:Landroid/widget/RelativeLayout;

    .line 59
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/miniclip/nativeJNI/interstitialBanner;->mDialogView:Landroid/widget/RelativeLayout;

    invoke-virtual {v2, v13}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 60
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/miniclip/nativeJNI/interstitialBanner;->mDialogView:Landroid/widget/RelativeLayout;

    const/high16 v3, -0x1000000

    invoke-virtual {v2, v3}, Landroid/widget/RelativeLayout;->setBackgroundColor(I)V

    .line 61
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/miniclip/nativeJNI/interstitialBanner;->mFullView:Landroid/widget/RelativeLayout;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/miniclip/nativeJNI/interstitialBanner;->mDialogView:Landroid/widget/RelativeLayout;

    invoke-virtual {v2, v3}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 63
    new-instance v15, Landroid/widget/RelativeLayout$LayoutParams;

    const/high16 v2, 0x43a00000    # 320.0f

    mul-float/2addr v2, v8

    float-to-int v2, v2

    const/high16 v3, 0x42480000    # 50.0f

    mul-float/2addr v3, v8

    float-to-int v3, v3

    invoke-direct {v15, v2, v3}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 64
    .local v15, "paramsS":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v2, 0xe

    invoke-virtual {v15, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 65
    const/16 v2, 0xc

    invoke-virtual {v15, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 66
    new-instance v2, Landroid/widget/Button;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/miniclip/nativeJNI/interstitialBanner;->mContext:Landroid/content/Context;

    invoke-direct {v2, v3}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    sput-object v2, Lcom/miniclip/nativeJNI/interstitialBanner;->mSkip1:Landroid/widget/Button;

    .line 67
    sget-object v2, Lcom/miniclip/nativeJNI/interstitialBanner;->mSkip1:Landroid/widget/Button;

    invoke-virtual {v2, v15}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 68
    sget-object v2, Lcom/miniclip/nativeJNI/interstitialBanner;->mSkip1:Landroid/widget/Button;

    const-string v3, "Skip"

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 69
    sget-object v2, Lcom/miniclip/nativeJNI/interstitialBanner;->mSkip1:Landroid/widget/Button;

    move-object/from16 v0, p0

    invoke-virtual {v2, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 71
    invoke-virtual/range {p0 .. p0}, Lcom/miniclip/nativeJNI/interstitialBanner;->hasAd()Z

    move-result v2

    if-nez v2, :cond_0

    .line 73
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/miniclip/nativeJNI/interstitialBanner;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const-string v3, "a640x100"

    const-string v4, "drawable"

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/miniclip/nativeJNI/interstitialBanner;->mContext:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v3, v4, v5}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v16

    .line 74
    .local v16, "resourceIdOffline1":I
    new-instance v10, Landroid/widget/RelativeLayout;

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/miniclip/nativeJNI/interstitialBanner;->mContext:Landroid/content/Context;

    invoke-direct {v10, v2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 75
    .local v10, "offlineView":Landroid/widget/RelativeLayout;
    new-instance v11, Landroid/widget/RelativeLayout$LayoutParams;

    const/high16 v2, 0x43a00000    # 320.0f

    mul-float/2addr v2, v8

    float-to-int v2, v2

    const/high16 v3, 0x42480000    # 50.0f

    mul-float/2addr v3, v8

    float-to-int v3, v3

    invoke-direct {v11, v2, v3}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 76
    .local v11, "paramsD":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v2, 0xe

    invoke-virtual {v11, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 77
    const/16 v2, 0xa

    invoke-virtual {v11, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 78
    const/4 v2, 0x0

    const/4 v3, 0x5

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual {v11, v2, v3, v4, v5}, Landroid/widget/RelativeLayout$LayoutParams;->setMargins(IIII)V

    .line 79
    invoke-virtual {v10, v11}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 80
    new-instance v9, Landroid/widget/ImageView;

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/miniclip/nativeJNI/interstitialBanner;->mContext:Landroid/content/Context;

    invoke-direct {v9, v2}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 81
    .local v9, "offlineImage":Landroid/widget/ImageView;
    invoke-virtual/range {p0 .. p0}, Lcom/miniclip/nativeJNI/interstitialBanner;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    move/from16 v0, v16

    invoke-virtual {v2, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v9, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 82
    new-instance v2, Landroid/widget/Gallery$LayoutParams;

    const/4 v3, -0x1

    const/4 v4, -0x1

    invoke-direct {v2, v3, v4}, Landroid/widget/Gallery$LayoutParams;-><init>(II)V

    invoke-virtual {v9, v2}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 83
    sget-object v2, Landroid/widget/ImageView$ScaleType;->FIT_XY:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v9, v2}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 84
    invoke-virtual {v10, v9}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 85
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/miniclip/nativeJNI/interstitialBanner;->mDialogView:Landroid/widget/RelativeLayout;

    invoke-virtual {v2, v10}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 87
    new-instance v1, Landroid/view/animation/ScaleAnimation;

    const/4 v2, 0x0

    const/high16 v3, 0x3f800000    # 1.0f

    const/high16 v4, 0x3f800000    # 1.0f

    const/high16 v5, 0x3f800000    # 1.0f

    const/high16 v6, 0x43200000    # 160.0f

    mul-float/2addr v6, v8

    const/4 v7, 0x0

    invoke-direct/range {v1 .. v7}, Landroid/view/animation/ScaleAnimation;-><init>(FFFFFF)V

    .line 88
    .local v1, "anim":Landroid/view/animation/Animation;
    const-wide/16 v2, 0x1f4

    invoke-virtual {v1, v2, v3}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 89
    invoke-virtual {v10, v1}, Landroid/widget/RelativeLayout;->startAnimation(Landroid/view/animation/Animation;)V

    .line 107
    .end local v9    # "offlineImage":Landroid/widget/ImageView;
    .end local v10    # "offlineView":Landroid/widget/RelativeLayout;
    .end local v11    # "paramsD":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v16    # "resourceIdOffline1":I
    :goto_0
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/miniclip/nativeJNI/interstitialBanner;->mHandler:Landroid/os/Handler;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/miniclip/nativeJNI/interstitialBanner;->mAddSkipButton:Ljava/lang/Runnable;

    const-wide/16 v4, 0x7d0

    invoke-virtual {v2, v3, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 108
    return-void

    .line 93
    .end local v1    # "anim":Landroid/view/animation/Animation;
    :cond_0
    new-instance v14, Landroid/widget/RelativeLayout$LayoutParams;

    const/high16 v2, 0x43a00000    # 320.0f

    mul-float/2addr v2, v8

    float-to-int v2, v2

    const/high16 v3, 0x42480000    # 50.0f

    mul-float/2addr v3, v8

    float-to-int v3, v3

    invoke-direct {v14, v2, v3}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 94
    .local v14, "paramsN":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v2, 0xe

    invoke-virtual {v14, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 95
    const/16 v2, 0xa

    invoke-virtual {v14, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 96
    const/4 v2, 0x0

    const/4 v3, 0x5

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual {v14, v2, v3, v4, v5}, Landroid/widget/RelativeLayout$LayoutParams;->setMargins(IIII)V

    .line 97
    sget-object v2, Lcom/miniclip/nativeJNI/interstitialBanner;->adView:Lcom/mopub/mobileads/MoPubView;

    invoke-virtual {v2, v14}, Lcom/mopub/mobileads/MoPubView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 98
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/miniclip/nativeJNI/interstitialBanner;->mDialogView:Landroid/widget/RelativeLayout;

    sget-object v3, Lcom/miniclip/nativeJNI/interstitialBanner;->adView:Lcom/mopub/mobileads/MoPubView;

    invoke-virtual {v2, v3}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 102
    new-instance v1, Landroid/view/animation/ScaleAnimation;

    const/4 v2, 0x0

    const/high16 v3, 0x3f800000    # 1.0f

    const/high16 v4, 0x3f800000    # 1.0f

    const/high16 v5, 0x3f800000    # 1.0f

    const/high16 v6, 0x43200000    # 160.0f

    mul-float/2addr v6, v8

    const/4 v7, 0x0

    invoke-direct/range {v1 .. v7}, Landroid/view/animation/ScaleAnimation;-><init>(FFFFFF)V

    .line 103
    .restart local v1    # "anim":Landroid/view/animation/Animation;
    const-wide/16 v2, 0x1f4

    invoke-virtual {v1, v2, v3}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 104
    sget-object v2, Lcom/miniclip/nativeJNI/interstitialBanner;->adView:Lcom/mopub/mobileads/MoPubView;

    invoke-virtual {v2, v1}, Lcom/mopub/mobileads/MoPubView;->startAnimation(Landroid/view/animation/Animation;)V

    goto :goto_0
.end method
