.class final Lcom/miniclip/nativeJNI/cocojava$26;
.super Ljava/lang/Object;
.source "cocojava.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/cocojava;->enableAdsWithPosition(FFFFFLjava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$adId:Ljava/lang/String;

.field final synthetic val$anchorX:F

.field final synthetic val$anchorY:F

.field final synthetic val$currentWidth:F

.field final synthetic val$x:F

.field final synthetic val$y:F


# direct methods
.method constructor <init>(FFFFFLjava/lang/String;)V
    .locals 0

    .prologue
    .line 1806
    iput p1, p0, Lcom/miniclip/nativeJNI/cocojava$26;->val$currentWidth:F

    iput p2, p0, Lcom/miniclip/nativeJNI/cocojava$26;->val$x:F

    iput p3, p0, Lcom/miniclip/nativeJNI/cocojava$26;->val$anchorX:F

    iput p4, p0, Lcom/miniclip/nativeJNI/cocojava$26;->val$y:F

    iput p5, p0, Lcom/miniclip/nativeJNI/cocojava$26;->val$anchorY:F

    iput-object p6, p0, Lcom/miniclip/nativeJNI/cocojava$26;->val$adId:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 18

    .prologue
    .line 1809
    sget-object v2, Lcom/miniclip/nativeJNI/cocojava;->adLayout:Landroid/widget/RelativeLayout;

    if-eqz v2, :cond_0

    sget-object v2, Lcom/miniclip/nativeJNI/cocojava;->adLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {v2}, Landroid/widget/RelativeLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    sget-object v3, Lcom/miniclip/nativeJNI/cocojava;->adLayoutH:Landroid/widget/RelativeLayout;

    if-eq v2, v3, :cond_0

    .line 1810
    sget-object v2, Lcom/miniclip/nativeJNI/cocojava;->adLayoutH:Landroid/widget/RelativeLayout;

    sget-object v3, Lcom/miniclip/nativeJNI/cocojava;->adLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {v2, v3}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 1812
    :cond_0
    new-instance v13, Landroid/widget/RelativeLayout$LayoutParams;

    const-wide/high16 v2, 0x4074000000000000L    # 320.0

    sget v4, Lcom/miniclip/nativeJNI/cocojava;->mDensity:F

    float-to-double v4, v4

    mul-double/2addr v2, v4

    double-to-int v2, v2

    const-wide/high16 v3, 0x4049000000000000L    # 50.0

    sget v5, Lcom/miniclip/nativeJNI/cocojava;->mDensity:F

    float-to-double v5, v5

    mul-double/2addr v3, v5

    double-to-int v3, v3

    invoke-direct {v13, v2, v3}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 1815
    .local v13, "params":Landroid/widget/RelativeLayout$LayoutParams;
    sget v17, Lcom/miniclip/nativeJNI/cocojava;->mINGAME_WIDTH:F

    .line 1816
    .local v17, "screenWidth":F
    sget v16, Lcom/miniclip/nativeJNI/cocojava;->mINGAME_HEIGHT:F

    .line 1818
    .local v16, "screenHeight":F
    move-object/from16 v0, p0

    iget v2, v0, Lcom/miniclip/nativeJNI/cocojava$26;->val$currentWidth:F

    const/4 v3, 0x0

    cmpl-float v2, v2, v3

    if-nez v2, :cond_7

    .line 1819
    sget-boolean v2, Lcom/miniclip/nativeJNI/cocojava;->mINGAME_LANDSCAPE:Z

    if-eqz v2, :cond_6

    sget-boolean v2, Lcom/miniclip/nativeJNI/cocojava;->mINGAME_SCALE:Z

    if-nez v2, :cond_6

    .line 1820
    sget v2, Lcom/miniclip/nativeJNI/cocojava;->mINGAME_HEIGHT:F

    sget v3, Lcom/miniclip/nativeJNI/cocojava;->mHeight:I

    int-to-float v3, v3

    div-float/2addr v2, v3

    sget v3, Lcom/miniclip/nativeJNI/cocojava;->mWidth:I

    int-to-float v3, v3

    mul-float v17, v2, v3

    .line 1825
    :cond_1
    :goto_0
    sget v2, Lcom/miniclip/nativeJNI/cocojava;->mWidth:I

    const/16 v3, 0x31f

    if-gt v2, v3, :cond_2

    sget v2, Lcom/miniclip/nativeJNI/cocojava;->mHeight:I

    const/16 v3, 0x31f

    if-le v2, v3, :cond_3

    :cond_2
    sget-boolean v2, Lcom/miniclip/nativeJNI/cocojava;->mHAS_RETINA:Z

    if-eqz v2, :cond_3

    .line 1826
    const/high16 v2, 0x3f800000    # 1.0f

    mul-float v17, v17, v2

    .line 1827
    const/high16 v2, 0x3f800000    # 1.0f

    mul-float v16, v16, v2

    .line 1832
    :cond_3
    :goto_1
    sget v2, Lcom/miniclip/nativeJNI/cocojava;->mUSE_ADS_VERTICAL_BANNER_OFFSET:F

    sget v3, Lcom/miniclip/nativeJNI/cocojava;->mDensity:F

    mul-float/2addr v2, v3

    float-to-int v8, v2

    .line 1836
    .local v8, "adOffsetX":I
    sget v2, Lcom/miniclip/nativeJNI/cocojava;->mUSE_ADS_HORIZONTAL_BANNER_OFFSET:F

    sget v3, Lcom/miniclip/nativeJNI/cocojava;->mDensity:F

    mul-float/2addr v2, v3

    float-to-int v9, v2

    .line 1838
    .local v9, "adOffsetY":I
    move-object/from16 v0, p0

    iget v2, v0, Lcom/miniclip/nativeJNI/cocojava$26;->val$x:F

    sget v3, Lcom/miniclip/nativeJNI/cocojava;->mWidth:I

    int-to-float v3, v3

    div-float v3, v3, v17

    mul-float/2addr v2, v3

    move-object/from16 v0, p0

    iget v3, v0, Lcom/miniclip/nativeJNI/cocojava$26;->val$anchorX:F

    const/high16 v4, 0x43a00000    # 320.0f

    sget v5, Lcom/miniclip/nativeJNI/cocojava;->mDensity:F

    mul-float/2addr v4, v5

    mul-float/2addr v3, v4

    sub-float/2addr v2, v3

    float-to-int v2, v2

    add-int/2addr v2, v8

    iput v2, v13, Landroid/widget/RelativeLayout$LayoutParams;->leftMargin:I

    .line 1839
    move-object/from16 v0, p0

    iget v2, v0, Lcom/miniclip/nativeJNI/cocojava$26;->val$y:F

    sget v3, Lcom/miniclip/nativeJNI/cocojava;->mHeight:I

    int-to-float v3, v3

    div-float v3, v3, v16

    mul-float/2addr v2, v3

    const/high16 v3, 0x3f800000    # 1.0f

    move-object/from16 v0, p0

    iget v4, v0, Lcom/miniclip/nativeJNI/cocojava$26;->val$anchorY:F

    sub-float/2addr v3, v4

    const/high16 v4, 0x42480000    # 50.0f

    sget v5, Lcom/miniclip/nativeJNI/cocojava;->mDensity:F

    mul-float/2addr v4, v5

    mul-float/2addr v3, v4

    sub-float/2addr v2, v3

    float-to-int v2, v2

    add-int/2addr v2, v9

    iput v2, v13, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    .line 1846
    const/4 v12, 0x0

    .line 1847
    .local v12, "adViewType":I
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/miniclip/nativeJNI/cocojava$26;->val$adId:Ljava/lang/String;

    sget-object v2, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v2, Lcom/miniclip/nativeJNI/cocojava;

    invoke-virtual {v2}, Lcom/miniclip/nativeJNI/cocojava;->getMoPubGameplayBannerId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    if-nez v2, :cond_8

    .line 1849
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->access$800()Lcom/mopub/mobileads/MoPubView;

    move-result-object v10

    .line 1850
    .local v10, "adView":Lcom/mopub/mobileads/MoPubView;
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->access$900()Lcom/mopub/mobileads/MoPubView;

    move-result-object v2

    invoke-static {v2}, Lcom/miniclip/nativeJNI/cocojava;->hideAd(Lcom/mopub/mobileads/MoPubView;)V

    .line 1851
    const/4 v12, 0x1

    .line 1858
    :goto_2
    if-eqz v10, :cond_9

    invoke-virtual {v10}, Lcom/mopub/mobileads/MoPubView;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    sget-object v3, Lcom/miniclip/nativeJNI/cocojava;->adLayout:Landroid/widget/RelativeLayout;

    if-ne v2, v3, :cond_9

    invoke-virtual {v10}, Lcom/mopub/mobileads/MoPubView;->isShown()Z

    move-result v2

    if-eqz v2, :cond_9

    invoke-virtual {v10}, Lcom/mopub/mobileads/MoPubView;->AdLoaded()Z

    move-result v2

    if-eqz v2, :cond_9

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/miniclip/nativeJNI/cocojava$26;->val$adId:Ljava/lang/String;

    invoke-virtual {v10}, Lcom/mopub/mobileads/MoPubView;->getAdUnitId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    if-nez v2, :cond_9

    .line 1861
    invoke-virtual {v10}, Lcom/mopub/mobileads/MoPubView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v14

    check-cast v14, Landroid/widget/RelativeLayout$LayoutParams;

    .line 1863
    .local v14, "paramsCur":Landroid/widget/RelativeLayout$LayoutParams;
    move-object v15, v13

    .line 1864
    .local v15, "paramsFinal":Landroid/widget/RelativeLayout$LayoutParams;
    move-object v11, v10

    .line 1865
    .local v11, "adViewFinal":Lcom/mopub/mobileads/MoPubView;
    iget v2, v14, Landroid/widget/RelativeLayout$LayoutParams;->leftMargin:I

    iget v3, v13, Landroid/widget/RelativeLayout$LayoutParams;->leftMargin:I

    if-ne v2, v3, :cond_4

    iget v2, v14, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    iget v3, v13, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    if-eq v2, v3, :cond_5

    .line 1867
    :cond_4
    new-instance v1, Landroid/view/animation/ScaleAnimation;

    const/high16 v2, 0x3f800000    # 1.0f

    const/4 v3, 0x0

    const/high16 v4, 0x3f800000    # 1.0f

    const/high16 v5, 0x3f800000    # 1.0f

    const/high16 v6, 0x43200000    # 160.0f

    sget v7, Lcom/miniclip/nativeJNI/cocojava;->mDensity:F

    mul-float/2addr v6, v7

    const/4 v7, 0x0

    invoke-direct/range {v1 .. v7}, Landroid/view/animation/ScaleAnimation;-><init>(FFFFFF)V

    .line 1869
    .local v1, "anim":Landroid/view/animation/Animation;
    const-wide/16 v2, 0x1f4

    invoke-virtual {v1, v2, v3}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 1870
    new-instance v2, Lcom/miniclip/nativeJNI/cocojava$26$1;

    move-object/from16 v0, p0

    invoke-direct {v2, v0, v11, v15}, Lcom/miniclip/nativeJNI/cocojava$26$1;-><init>(Lcom/miniclip/nativeJNI/cocojava$26;Lcom/mopub/mobileads/MoPubView;Landroid/widget/RelativeLayout$LayoutParams;)V

    invoke-virtual {v1, v2}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 1888
    invoke-virtual {v10, v1}, Lcom/mopub/mobileads/MoPubView;->startAnimation(Landroid/view/animation/Animation;)V

    .line 1945
    .end local v1    # "anim":Landroid/view/animation/Animation;
    .end local v11    # "adViewFinal":Lcom/mopub/mobileads/MoPubView;
    .end local v14    # "paramsCur":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v15    # "paramsFinal":Landroid/widget/RelativeLayout$LayoutParams;
    :cond_5
    :goto_3
    return-void

    .line 1822
    .end local v8    # "adOffsetX":I
    .end local v9    # "adOffsetY":I
    .end local v10    # "adView":Lcom/mopub/mobileads/MoPubView;
    .end local v12    # "adViewType":I
    :cond_6
    sget-boolean v2, Lcom/miniclip/nativeJNI/cocojava;->mINGAME_SCALE:Z

    if-nez v2, :cond_1

    .line 1823
    sget v2, Lcom/miniclip/nativeJNI/cocojava;->mINGAME_WIDTH:F

    sget v3, Lcom/miniclip/nativeJNI/cocojava;->mWidth:I

    int-to-float v3, v3

    div-float/2addr v2, v3

    sget v3, Lcom/miniclip/nativeJNI/cocojava;->mHeight:I

    int-to-float v3, v3

    mul-float v16, v2, v3

    goto/16 :goto_0

    .line 1830
    :cond_7
    move-object/from16 v0, p0

    iget v0, v0, Lcom/miniclip/nativeJNI/cocojava$26;->val$currentWidth:F

    move/from16 v17, v0

    goto/16 :goto_1

    .line 1853
    .restart local v8    # "adOffsetX":I
    .restart local v9    # "adOffsetY":I
    .restart local v12    # "adViewType":I
    :cond_8
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->access$900()Lcom/mopub/mobileads/MoPubView;

    move-result-object v10

    .line 1854
    .restart local v10    # "adView":Lcom/mopub/mobileads/MoPubView;
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->access$800()Lcom/mopub/mobileads/MoPubView;

    move-result-object v2

    invoke-static {v2}, Lcom/miniclip/nativeJNI/cocojava;->hideAd(Lcom/mopub/mobileads/MoPubView;)V

    .line 1855
    const/4 v12, 0x2

    goto/16 :goto_2

    .line 1897
    :cond_9
    sget-boolean v2, Lcom/miniclip/nativeJNI/cocojava;->mConstantAd:Z

    if-eqz v2, :cond_c

    .line 1898
    if-nez v10, :cond_b

    .line 1899
    const/4 v2, 0x1

    if-ne v12, v2, :cond_a

    .line 1900
    new-instance v2, Lcom/mopub/mobileads/MoPubView;

    sget-object v3, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    invoke-direct {v2, v3}, Lcom/mopub/mobileads/MoPubView;-><init>(Landroid/content/Context;)V

    invoke-static {v2}, Lcom/miniclip/nativeJNI/cocojava;->access$802(Lcom/mopub/mobileads/MoPubView;)Lcom/mopub/mobileads/MoPubView;

    .line 1901
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->access$800()Lcom/mopub/mobileads/MoPubView;

    move-result-object v10

    .line 1906
    :goto_4
    sget-object v2, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v2, Lcom/miniclip/nativeJNI/cocojava;

    invoke-virtual {v10, v2}, Lcom/mopub/mobileads/MoPubView;->setOnAdLoadedListener(Lcom/mopub/mobileads/MoPubView$OnAdLoadedListener;)V

    .line 1907
    sget-object v2, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v2, Lcom/miniclip/nativeJNI/cocojava;

    invoke-virtual {v10, v2}, Lcom/mopub/mobileads/MoPubView;->setOnAdFailedListener(Lcom/mopub/mobileads/MoPubView$OnAdFailedListener;)V

    .line 1908
    sget-object v2, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v2, Lcom/miniclip/nativeJNI/cocojava;

    invoke-virtual {v10, v2}, Lcom/mopub/mobileads/MoPubView;->setOnAdClickedListener(Lcom/mopub/mobileads/MoPubView$OnAdClickedListener;)V

    .line 1909
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/miniclip/nativeJNI/cocojava$26;->val$adId:Ljava/lang/String;

    invoke-virtual {v10, v2}, Lcom/mopub/mobileads/MoPubView;->setAdUnitId(Ljava/lang/String;)V

    .line 1910
    const/4 v2, 0x0

    invoke-virtual {v10, v2}, Lcom/mopub/mobileads/MoPubView;->setVisibility(I)V

    .line 1911
    invoke-virtual {v10}, Lcom/mopub/mobileads/MoPubView;->loadAd()V

    .line 1935
    :goto_5
    sget-object v2, Lcom/miniclip/nativeJNI/cocojava;->adLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {v2, v10, v13}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1938
    invoke-virtual {v10}, Lcom/mopub/mobileads/MoPubView;->AdLoaded()Z

    move-result v2

    if-eqz v2, :cond_5

    .line 1939
    new-instance v1, Landroid/view/animation/ScaleAnimation;

    const/4 v2, 0x0

    const/high16 v3, 0x3f800000    # 1.0f

    const/high16 v4, 0x3f800000    # 1.0f

    const/high16 v5, 0x3f800000    # 1.0f

    const/high16 v6, 0x43200000    # 160.0f

    sget v7, Lcom/miniclip/nativeJNI/cocojava;->mDensity:F

    mul-float/2addr v6, v7

    const/4 v7, 0x0

    invoke-direct/range {v1 .. v7}, Landroid/view/animation/ScaleAnimation;-><init>(FFFFFF)V

    .line 1941
    .restart local v1    # "anim":Landroid/view/animation/Animation;
    const-wide/16 v2, 0x1f4

    invoke-virtual {v1, v2, v3}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 1942
    const/4 v2, 0x1

    invoke-virtual {v10, v2}, Lcom/mopub/mobileads/MoPubView;->setVisibility(I)V

    .line 1943
    invoke-virtual {v10, v1}, Lcom/mopub/mobileads/MoPubView;->startAnimation(Landroid/view/animation/Animation;)V

    goto/16 :goto_3

    .line 1903
    .end local v1    # "anim":Landroid/view/animation/Animation;
    :cond_a
    new-instance v2, Lcom/mopub/mobileads/MoPubView;

    sget-object v3, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    invoke-direct {v2, v3}, Lcom/mopub/mobileads/MoPubView;-><init>(Landroid/content/Context;)V

    invoke-static {v2}, Lcom/miniclip/nativeJNI/cocojava;->access$902(Lcom/mopub/mobileads/MoPubView;)Lcom/mopub/mobileads/MoPubView;

    .line 1904
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->access$900()Lcom/mopub/mobileads/MoPubView;

    move-result-object v10

    goto :goto_4

    .line 1913
    :cond_b
    sget-object v2, Lcom/miniclip/nativeJNI/cocojava;->adLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {v2, v10}, Landroid/widget/RelativeLayout;->removeView(Landroid/view/View;)V

    goto :goto_5

    .line 1915
    :cond_c
    if-eqz v10, :cond_d

    .line 1916
    sget-object v2, Lcom/miniclip/nativeJNI/cocojava;->adLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {v2, v10}, Landroid/widget/RelativeLayout;->removeView(Landroid/view/View;)V

    .line 1917
    invoke-virtual {v10}, Lcom/mopub/mobileads/MoPubView;->destroy()V

    .line 1920
    :cond_d
    const/4 v2, 0x1

    if-ne v12, v2, :cond_e

    .line 1921
    new-instance v2, Lcom/mopub/mobileads/MoPubView;

    sget-object v3, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    invoke-direct {v2, v3}, Lcom/mopub/mobileads/MoPubView;-><init>(Landroid/content/Context;)V

    invoke-static {v2}, Lcom/miniclip/nativeJNI/cocojava;->access$802(Lcom/mopub/mobileads/MoPubView;)Lcom/mopub/mobileads/MoPubView;

    .line 1922
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->access$800()Lcom/mopub/mobileads/MoPubView;

    move-result-object v10

    .line 1927
    :goto_6
    sget-object v2, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v2, Lcom/miniclip/nativeJNI/cocojava;

    invoke-virtual {v10, v2}, Lcom/mopub/mobileads/MoPubView;->setOnAdLoadedListener(Lcom/mopub/mobileads/MoPubView$OnAdLoadedListener;)V

    .line 1928
    sget-object v2, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v2, Lcom/miniclip/nativeJNI/cocojava;

    invoke-virtual {v10, v2}, Lcom/mopub/mobileads/MoPubView;->setOnAdFailedListener(Lcom/mopub/mobileads/MoPubView$OnAdFailedListener;)V

    .line 1929
    sget-object v2, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v2, Lcom/miniclip/nativeJNI/cocojava;

    invoke-virtual {v10, v2}, Lcom/mopub/mobileads/MoPubView;->setOnAdClickedListener(Lcom/mopub/mobileads/MoPubView$OnAdClickedListener;)V

    .line 1930
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/miniclip/nativeJNI/cocojava$26;->val$adId:Ljava/lang/String;

    invoke-virtual {v10, v2}, Lcom/mopub/mobileads/MoPubView;->setAdUnitId(Ljava/lang/String;)V

    .line 1931
    const/4 v2, 0x0

    invoke-virtual {v10, v2}, Lcom/mopub/mobileads/MoPubView;->setVisibility(I)V

    .line 1932
    invoke-virtual {v10}, Lcom/mopub/mobileads/MoPubView;->loadAd()V

    goto :goto_5

    .line 1924
    :cond_e
    new-instance v2, Lcom/mopub/mobileads/MoPubView;

    sget-object v3, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    invoke-direct {v2, v3}, Lcom/mopub/mobileads/MoPubView;-><init>(Landroid/content/Context;)V

    invoke-static {v2}, Lcom/miniclip/nativeJNI/cocojava;->access$902(Lcom/mopub/mobileads/MoPubView;)Lcom/mopub/mobileads/MoPubView;

    .line 1925
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->access$900()Lcom/mopub/mobileads/MoPubView;

    move-result-object v10

    goto :goto_6
.end method
