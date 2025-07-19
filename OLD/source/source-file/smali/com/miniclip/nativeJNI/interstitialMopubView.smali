.class public Lcom/miniclip/nativeJNI/interstitialMopubView;
.super Landroid/widget/RelativeLayout;
.source "interstitialMopubView.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# static fields
.field private static adView:Lcom/mopub/mobileads/MoPubView;

.field private static mRemove1:Landroid/widget/Button;

.field private static mSkip1:Landroid/widget/Button;


# instance fields
.field private mAddSkipButton:Ljava/lang/Runnable;

.field private mContext:Landroid/content/Context;

.field protected mDialog:Landroid/widget/RelativeLayout;

.field protected mFullView:Landroid/widget/RelativeLayout;

.field private mHandler:Landroid/os/Handler;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v2, -0x1

    .line 30
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 27
    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    iput-object v1, p0, Lcom/miniclip/nativeJNI/interstitialMopubView;->mHandler:Landroid/os/Handler;

    .line 45
    new-instance v1, Lcom/miniclip/nativeJNI/interstitialMopubView$1;

    invoke-direct {v1, p0}, Lcom/miniclip/nativeJNI/interstitialMopubView$1;-><init>(Lcom/miniclip/nativeJNI/interstitialMopubView;)V

    iput-object v1, p0, Lcom/miniclip/nativeJNI/interstitialMopubView;->mAddSkipButton:Ljava/lang/Runnable;

    .line 31
    iput-object p1, p0, Lcom/miniclip/nativeJNI/interstitialMopubView;->mContext:Landroid/content/Context;

    .line 33
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v0, v2, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 34
    .local v0, "params":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v1, 0x11

    invoke-virtual {p0, v1}, Lcom/miniclip/nativeJNI/interstitialMopubView;->setHorizontalGravity(I)V

    .line 35
    invoke-virtual {p0, v0}, Lcom/miniclip/nativeJNI/interstitialMopubView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 36
    return-void
.end method

.method static synthetic access$000()Landroid/widget/Button;
    .locals 1

    .prologue
    .line 20
    sget-object v0, Lcom/miniclip/nativeJNI/interstitialMopubView;->mSkip1:Landroid/widget/Button;

    return-object v0
.end method


# virtual methods
.method hideAd()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 135
    iget-object v0, p0, Lcom/miniclip/nativeJNI/interstitialMopubView;->mDialog:Landroid/widget/RelativeLayout;

    invoke-virtual {v0}, Landroid/widget/RelativeLayout;->removeAllViews()V

    .line 136
    iget-object v0, p0, Lcom/miniclip/nativeJNI/interstitialMopubView;->mFullView:Landroid/widget/RelativeLayout;

    invoke-virtual {v0}, Landroid/widget/RelativeLayout;->removeAllViews()V

    .line 137
    invoke-virtual {p0}, Lcom/miniclip/nativeJNI/interstitialMopubView;->removeAllViews()V

    .line 139
    iput-object v1, p0, Lcom/miniclip/nativeJNI/interstitialMopubView;->mDialog:Landroid/widget/RelativeLayout;

    .line 140
    iput-object v1, p0, Lcom/miniclip/nativeJNI/interstitialMopubView;->mFullView:Landroid/widget/RelativeLayout;

    .line 141
    return-void
.end method

.method loadAd()V
    .locals 2

    .prologue
    .line 39
    new-instance v0, Lcom/mopub/mobileads/MoPubView;

    iget-object v1, p0, Lcom/miniclip/nativeJNI/interstitialMopubView;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/mopub/mobileads/MoPubView;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/miniclip/nativeJNI/interstitialMopubView;->adView:Lcom/mopub/mobileads/MoPubView;

    .line 40
    sget-object v1, Lcom/miniclip/nativeJNI/interstitialMopubView;->adView:Lcom/mopub/mobileads/MoPubView;

    iget-object v0, p0, Lcom/miniclip/nativeJNI/interstitialMopubView;->mContext:Landroid/content/Context;

    check-cast v0, Lcom/miniclip/nativeJNI/cocojava;

    invoke-virtual {v0}, Lcom/miniclip/nativeJNI/cocojava;->getMoPubInterstitialId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/mopub/mobileads/MoPubView;->setAdUnitId(Ljava/lang/String;)V

    .line 41
    sget-object v0, Lcom/miniclip/nativeJNI/interstitialMopubView;->adView:Lcom/mopub/mobileads/MoPubView;

    invoke-virtual {v0}, Lcom/mopub/mobileads/MoPubView;->loadAd()V

    .line 42
    sget-object v0, Lcom/miniclip/nativeJNI/interstitialMopubView;->adView:Lcom/mopub/mobileads/MoPubView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/mopub/mobileads/MoPubView;->setAutorefreshEnabled(Z)V

    .line 43
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 145
    sget-object v0, Lcom/miniclip/nativeJNI/interstitialMopubView;->mSkip1:Landroid/widget/Button;

    if-ne p1, v0, :cond_1

    .line 146
    invoke-virtual {p0}, Lcom/miniclip/nativeJNI/interstitialMopubView;->hideAd()V

    .line 147
    iget-object v0, p0, Lcom/miniclip/nativeJNI/interstitialMopubView;->mContext:Landroid/content/Context;

    check-cast v0, Lcom/miniclip/nativeJNI/cocojava;

    invoke-virtual {v0}, Lcom/miniclip/nativeJNI/cocojava;->onInterstitialMopubViewExit()V

    .line 159
    :cond_0
    :goto_0
    return-void

    .line 148
    :cond_1
    sget-object v0, Lcom/miniclip/nativeJNI/interstitialMopubView;->mRemove1:Landroid/widget/Button;

    if-ne p1, v0, :cond_0

    .line 149
    invoke-virtual {p0}, Lcom/miniclip/nativeJNI/interstitialMopubView;->hideAd()V

    .line 155
    iget-object v0, p0, Lcom/miniclip/nativeJNI/interstitialMopubView;->mContext:Landroid/content/Context;

    check-cast v0, Lcom/miniclip/nativeJNI/cocojava;

    invoke-virtual {v0}, Lcom/miniclip/nativeJNI/cocojava;->callRemoveAds()V

    .line 157
    iget-object v0, p0, Lcom/miniclip/nativeJNI/interstitialMopubView;->mContext:Landroid/content/Context;

    check-cast v0, Lcom/miniclip/nativeJNI/cocojava;

    invoke-virtual {v0}, Lcom/miniclip/nativeJNI/cocojava;->onInterstitialMopubViewExit()V

    goto :goto_0
.end method

.method showAd()V
    .locals 14

    .prologue
    const/4 v9, -0x1

    const/high16 v13, 0x435c0000    # 220.0f

    const/16 v12, 0xc

    const/4 v11, 0x0

    const/high16 v10, 0x42480000    # 50.0f

    .line 50
    sget-object v8, Lcom/miniclip/nativeJNI/interstitialMopubView;->adView:Lcom/mopub/mobileads/MoPubView;

    invoke-virtual {v8}, Lcom/mopub/mobileads/MoPubView;->AdLoaded()Z

    move-result v8

    if-nez v8, :cond_0

    .line 51
    const-string v8, "interstitialBanner"

    const-string v9, "showAd called when ad not loaded"

    invoke-static {v8, v9}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 52
    sget-object v8, Lcom/miniclip/nativeJNI/interstitialMopubView;->adView:Lcom/mopub/mobileads/MoPubView;

    invoke-virtual {v8}, Lcom/mopub/mobileads/MoPubView;->loadAd()V

    .line 54
    iget-object v8, p0, Lcom/miniclip/nativeJNI/interstitialMopubView;->mContext:Landroid/content/Context;

    check-cast v8, Lcom/miniclip/nativeJNI/cocojava;

    invoke-virtual {v8}, Lcom/miniclip/nativeJNI/cocojava;->onInterstitialMopubViewExit()V

    .line 132
    :goto_0
    return-void

    .line 58
    :cond_0
    new-instance v4, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v4, v9, v9}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 59
    .local v4, "paramsFull1":Landroid/widget/RelativeLayout$LayoutParams;
    new-instance v8, Landroid/widget/RelativeLayout;

    iget-object v9, p0, Lcom/miniclip/nativeJNI/interstitialMopubView;->mContext:Landroid/content/Context;

    invoke-direct {v8, v9}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    iput-object v8, p0, Lcom/miniclip/nativeJNI/interstitialMopubView;->mFullView:Landroid/widget/RelativeLayout;

    .line 60
    iget-object v8, p0, Lcom/miniclip/nativeJNI/interstitialMopubView;->mFullView:Landroid/widget/RelativeLayout;

    invoke-virtual {v8, v4}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 61
    iget-object v8, p0, Lcom/miniclip/nativeJNI/interstitialMopubView;->mFullView:Landroid/widget/RelativeLayout;

    invoke-virtual {v8, p0}, Landroid/widget/RelativeLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 62
    iget-object v8, p0, Lcom/miniclip/nativeJNI/interstitialMopubView;->mFullView:Landroid/widget/RelativeLayout;

    const/high16 v9, -0x71000000

    invoke-virtual {v8, v9}, Landroid/widget/RelativeLayout;->setBackgroundColor(I)V

    .line 63
    iget-object v8, p0, Lcom/miniclip/nativeJNI/interstitialMopubView;->mFullView:Landroid/widget/RelativeLayout;

    invoke-virtual {p0, v8}, Lcom/miniclip/nativeJNI/interstitialMopubView;->addView(Landroid/view/View;)V

    .line 65
    sget v1, Lcom/miniclip/nativeJNI/cocojava;->mDensity:F

    .line 68
    .local v1, "density":F
    sget-boolean v8, Lcom/miniclip/nativeJNI/cocojava;->mINGAME_LANDSCAPE:Z

    if-eqz v8, :cond_1

    .line 69
    new-instance v3, Landroid/widget/RelativeLayout$LayoutParams;

    sget v8, Lcom/miniclip/nativeJNI/cocojava;->mWidth:I

    int-to-float v8, v8

    mul-float/2addr v8, v1

    float-to-int v8, v8

    sget v9, Lcom/miniclip/nativeJNI/cocojava;->mHeight:I

    int-to-float v9, v9

    mul-float/2addr v9, v1

    float-to-int v9, v9

    invoke-direct {v3, v8, v9}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 73
    .local v3, "paramsDialog":Landroid/widget/RelativeLayout$LayoutParams;
    :goto_1
    const/16 v8, 0xe

    invoke-virtual {v3, v8}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 74
    const/16 v8, 0xd

    invoke-virtual {v3, v8}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 75
    new-instance v8, Landroid/widget/RelativeLayout;

    iget-object v9, p0, Lcom/miniclip/nativeJNI/interstitialMopubView;->mContext:Landroid/content/Context;

    invoke-direct {v8, v9}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    iput-object v8, p0, Lcom/miniclip/nativeJNI/interstitialMopubView;->mDialog:Landroid/widget/RelativeLayout;

    .line 76
    iget-object v8, p0, Lcom/miniclip/nativeJNI/interstitialMopubView;->mDialog:Landroid/widget/RelativeLayout;

    invoke-virtual {v8, v3}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 77
    iget-object v8, p0, Lcom/miniclip/nativeJNI/interstitialMopubView;->mDialog:Landroid/widget/RelativeLayout;

    invoke-virtual {v8, p0}, Landroid/widget/RelativeLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 78
    iget-object v8, p0, Lcom/miniclip/nativeJNI/interstitialMopubView;->mDialog:Landroid/widget/RelativeLayout;

    invoke-virtual {v8, v11}, Landroid/widget/RelativeLayout;->setBackgroundColor(I)V

    .line 79
    iget-object v8, p0, Lcom/miniclip/nativeJNI/interstitialMopubView;->mFullView:Landroid/widget/RelativeLayout;

    iget-object v9, p0, Lcom/miniclip/nativeJNI/interstitialMopubView;->mDialog:Landroid/widget/RelativeLayout;

    invoke-virtual {v8, v9}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 82
    sget-boolean v8, Lcom/miniclip/nativeJNI/cocojava;->mINGAME_LANDSCAPE:Z

    if-eqz v8, :cond_2

    .line 83
    new-instance v2, Landroid/widget/RelativeLayout$LayoutParams;

    mul-float v8, v13, v1

    float-to-int v8, v8

    mul-float v9, v10, v1

    float-to-int v9, v9

    invoke-direct {v2, v8, v9}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 84
    .local v2, "params":Landroid/widget/RelativeLayout$LayoutParams;
    invoke-virtual {v2, v12}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 85
    const/16 v8, 0x9

    invoke-virtual {v2, v8}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 86
    move-object v7, v2

    .line 93
    .local v7, "paramsS":Landroid/widget/RelativeLayout$LayoutParams;
    :goto_2
    new-instance v8, Landroid/widget/Button;

    iget-object v9, p0, Lcom/miniclip/nativeJNI/interstitialMopubView;->mContext:Landroid/content/Context;

    invoke-direct {v8, v9}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    sput-object v8, Lcom/miniclip/nativeJNI/interstitialMopubView;->mSkip1:Landroid/widget/Button;

    .line 94
    sget-object v8, Lcom/miniclip/nativeJNI/interstitialMopubView;->mSkip1:Landroid/widget/Button;

    invoke-virtual {v8, v7}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 95
    sget-object v8, Lcom/miniclip/nativeJNI/interstitialMopubView;->mSkip1:Landroid/widget/Button;

    const-string v9, "Skip"

    invoke-virtual {v8, v9}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 96
    sget-object v8, Lcom/miniclip/nativeJNI/interstitialMopubView;->mSkip1:Landroid/widget/Button;

    invoke-virtual {v8, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 99
    sget-boolean v8, Lcom/miniclip/nativeJNI/cocojava;->mINGAME_LANDSCAPE:Z

    if-eqz v8, :cond_3

    .line 100
    new-instance v2, Landroid/widget/RelativeLayout$LayoutParams;

    .end local v2    # "params":Landroid/widget/RelativeLayout$LayoutParams;
    mul-float v8, v13, v1

    float-to-int v8, v8

    mul-float v9, v10, v1

    float-to-int v9, v9

    invoke-direct {v2, v8, v9}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 101
    .restart local v2    # "params":Landroid/widget/RelativeLayout$LayoutParams;
    invoke-virtual {v2, v12}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 102
    const/16 v8, 0xb

    invoke-virtual {v2, v8}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 103
    move-object v6, v2

    .line 110
    .local v6, "paramsR":Landroid/widget/RelativeLayout$LayoutParams;
    :goto_3
    new-instance v8, Landroid/widget/Button;

    iget-object v9, p0, Lcom/miniclip/nativeJNI/interstitialMopubView;->mContext:Landroid/content/Context;

    invoke-direct {v8, v9}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    sput-object v8, Lcom/miniclip/nativeJNI/interstitialMopubView;->mRemove1:Landroid/widget/Button;

    .line 111
    sget-object v8, Lcom/miniclip/nativeJNI/interstitialMopubView;->mRemove1:Landroid/widget/Button;

    invoke-virtual {v8, v6}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 112
    sget-object v8, Lcom/miniclip/nativeJNI/interstitialMopubView;->mRemove1:Landroid/widget/Button;

    const-string v9, "Remove Ads"

    invoke-virtual {v8, v9}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 113
    iget-object v8, p0, Lcom/miniclip/nativeJNI/interstitialMopubView;->mDialog:Landroid/widget/RelativeLayout;

    sget-object v9, Lcom/miniclip/nativeJNI/interstitialMopubView;->mRemove1:Landroid/widget/Button;

    invoke-virtual {v8, v9}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 114
    sget-object v8, Lcom/miniclip/nativeJNI/interstitialMopubView;->mRemove1:Landroid/widget/Button;

    invoke-virtual {v8, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 116
    new-instance v5, Landroid/widget/RelativeLayout$LayoutParams;

    const/high16 v8, 0x43960000    # 300.0f

    mul-float/2addr v8, v1

    float-to-int v8, v8

    const/high16 v9, 0x437a0000    # 250.0f

    mul-float/2addr v9, v1

    float-to-int v9, v9

    invoke-direct {v5, v8, v9}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 117
    .local v5, "paramsN":Landroid/widget/RelativeLayout$LayoutParams;
    iget v8, v5, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    div-int/lit8 v8, v8, 0x2

    iget v9, v7, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    add-int/2addr v8, v9

    invoke-virtual {p0}, Lcom/miniclip/nativeJNI/interstitialMopubView;->getHeight()I

    move-result v9

    div-int/lit8 v9, v9, 0x2

    if-lt v8, v9, :cond_4

    .line 118
    const/16 v8, 0xa

    invoke-virtual {v5, v8}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 119
    const/16 v8, 0xe

    invoke-virtual {v5, v8}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 120
    const/4 v8, 0x5

    invoke-virtual {v5, v11, v8, v11, v11}, Landroid/widget/RelativeLayout$LayoutParams;->setMargins(IIII)V

    .line 123
    :goto_4
    sget-object v8, Lcom/miniclip/nativeJNI/interstitialMopubView;->adView:Lcom/mopub/mobileads/MoPubView;

    invoke-virtual {v8, v5}, Lcom/mopub/mobileads/MoPubView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 125
    iget-object v8, p0, Lcom/miniclip/nativeJNI/interstitialMopubView;->mDialog:Landroid/widget/RelativeLayout;

    sget-object v9, Lcom/miniclip/nativeJNI/interstitialMopubView;->adView:Lcom/mopub/mobileads/MoPubView;

    invoke-virtual {v8, v9}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 127
    iget-object v8, p0, Lcom/miniclip/nativeJNI/interstitialMopubView;->mHandler:Landroid/os/Handler;

    iget-object v9, p0, Lcom/miniclip/nativeJNI/interstitialMopubView;->mAddSkipButton:Ljava/lang/Runnable;

    const-wide/16 v10, 0x7d0

    invoke-virtual {v8, v9, v10, v11}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 129
    new-instance v0, Landroid/view/animation/AlphaAnimation;

    const/4 v8, 0x0

    const/high16 v9, 0x3f800000    # 1.0f

    invoke-direct {v0, v8, v9}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    .line 130
    .local v0, "anim":Landroid/view/animation/Animation;
    const-wide/16 v8, 0x1f4

    invoke-virtual {v0, v8, v9}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 131
    iget-object v8, p0, Lcom/miniclip/nativeJNI/interstitialMopubView;->mFullView:Landroid/widget/RelativeLayout;

    invoke-virtual {v8, v0}, Landroid/widget/RelativeLayout;->startAnimation(Landroid/view/animation/Animation;)V

    goto/16 :goto_0

    .line 71
    .end local v0    # "anim":Landroid/view/animation/Animation;
    .end local v2    # "params":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v3    # "paramsDialog":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v5    # "paramsN":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v6    # "paramsR":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v7    # "paramsS":Landroid/widget/RelativeLayout$LayoutParams;
    :cond_1
    new-instance v3, Landroid/widget/RelativeLayout$LayoutParams;

    sget v8, Lcom/miniclip/nativeJNI/cocojava;->mWidth:I

    sget v9, Lcom/miniclip/nativeJNI/cocojava;->mHeight:I

    invoke-direct {v3, v8, v9}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .restart local v3    # "paramsDialog":Landroid/widget/RelativeLayout$LayoutParams;
    goto/16 :goto_1

    .line 88
    :cond_2
    new-instance v2, Landroid/widget/RelativeLayout$LayoutParams;

    iget v8, v3, Landroid/widget/RelativeLayout$LayoutParams;->width:I

    div-int/lit8 v8, v8, 0x2

    mul-float v9, v10, v1

    float-to-int v9, v9

    invoke-direct {v2, v8, v9}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 89
    .restart local v2    # "params":Landroid/widget/RelativeLayout$LayoutParams;
    invoke-virtual {v2, v12}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 90
    const/16 v8, 0x9

    invoke-virtual {v2, v8}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 91
    move-object v7, v2

    .restart local v7    # "paramsS":Landroid/widget/RelativeLayout$LayoutParams;
    goto/16 :goto_2

    .line 105
    :cond_3
    new-instance v2, Landroid/widget/RelativeLayout$LayoutParams;

    .end local v2    # "params":Landroid/widget/RelativeLayout$LayoutParams;
    iget v8, v3, Landroid/widget/RelativeLayout$LayoutParams;->width:I

    div-int/lit8 v8, v8, 0x2

    mul-float v9, v10, v1

    float-to-int v9, v9

    invoke-direct {v2, v8, v9}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 106
    .restart local v2    # "params":Landroid/widget/RelativeLayout$LayoutParams;
    invoke-virtual {v2, v12}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 107
    const/16 v8, 0xb

    invoke-virtual {v2, v8}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 108
    move-object v6, v2

    .restart local v6    # "paramsR":Landroid/widget/RelativeLayout$LayoutParams;
    goto/16 :goto_3

    .line 122
    .restart local v5    # "paramsN":Landroid/widget/RelativeLayout$LayoutParams;
    :cond_4
    const/16 v8, 0xd

    invoke-virtual {v5, v8}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    goto :goto_4
.end method
