.class final Lcom/miniclip/nativeJNI/cocojava$21;
.super Ljava/lang/Object;
.source "cocojava.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/cocojava;->showMopubView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 1602
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 11

    .prologue
    .line 1609
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->access$200()Landroid/widget/RelativeLayout;

    move-result-object v7

    if-eqz v7, :cond_0

    .line 1610
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->access$200()Landroid/widget/RelativeLayout;

    move-result-object v7

    invoke-virtual {v7}, Landroid/widget/RelativeLayout;->removeAllViews()V

    .line 1622
    :goto_0
    new-instance v7, Landroid/widget/RelativeLayout;

    sget-object v8, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    invoke-direct {v7, v8}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    invoke-static {v7}, Lcom/miniclip/nativeJNI/cocojava;->access$302(Landroid/widget/RelativeLayout;)Landroid/widget/RelativeLayout;

    .line 1623
    new-instance v2, Landroid/widget/RelativeLayout$LayoutParams;

    const-wide v7, 0x4072c00000000000L    # 300.0

    sget v9, Lcom/miniclip/nativeJNI/cocojava;->mDensity:F

    float-to-double v9, v9

    mul-double/2addr v7, v9

    double-to-int v7, v7

    add-int/lit8 v7, v7, 0x28

    const/4 v8, -0x1

    invoke-direct {v2, v7, v8}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 1626
    .local v2, "params":Landroid/widget/RelativeLayout$LayoutParams;
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->access$300()Landroid/widget/RelativeLayout;

    move-result-object v7

    invoke-virtual {v7, v2}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1627
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->access$300()Landroid/widget/RelativeLayout;

    move-result-object v8

    sget-object v7, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v7, Landroid/view/View$OnClickListener;

    invoke-virtual {v8, v7}, Landroid/widget/RelativeLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1628
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->access$200()Landroid/widget/RelativeLayout;

    move-result-object v7

    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->access$300()Landroid/widget/RelativeLayout;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 1630
    new-instance v0, Landroid/widget/ImageView;

    sget-object v7, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    invoke-direct {v0, v7}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 1632
    .local v0, "bg1":Landroid/widget/ImageView;
    sget-object v7, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    invoke-virtual {v7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const-string v8, "full_dialog1"

    const-string v9, "drawable"

    sget-object v10, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    invoke-virtual {v10}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v7, v8, v9, v10}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v6

    .line 1634
    .local v6, "resourceId":I
    sget-object v7, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    invoke-virtual {v7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    invoke-virtual {v7, v6}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v7

    invoke-virtual {v0, v7}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 1636
    sget-object v7, Landroid/widget/ImageView$ScaleType;->FIT_XY:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v0, v7}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 1637
    new-instance v7, Landroid/widget/Gallery$LayoutParams;

    const/4 v8, -0x1

    const/4 v9, -0x1

    invoke-direct {v7, v8, v9}, Landroid/widget/Gallery$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v7}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1639
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->access$300()Landroid/widget/RelativeLayout;

    move-result-object v7

    invoke-virtual {v7, v0}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 1641
    new-instance v1, Landroid/widget/RelativeLayout;

    sget-object v7, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    invoke-direct {v1, v7}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 1642
    .local v1, "centerdButton":Landroid/widget/RelativeLayout;
    new-instance v3, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v7, -0x1

    const/4 v8, -0x2

    invoke-direct {v3, v7, v8}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 1645
    .local v3, "paramsB":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v7, 0x50

    invoke-virtual {v1, v7}, Landroid/widget/RelativeLayout;->setVerticalGravity(I)V

    .line 1646
    const/16 v7, 0xc

    invoke-virtual {v3, v7}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 1647
    invoke-virtual {v1, v3}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1648
    const/16 v7, 0x14

    const/4 v8, 0x0

    const/16 v9, 0x14

    const/4 v10, 0x5

    invoke-virtual {v1, v7, v8, v9, v10}, Landroid/widget/RelativeLayout;->setPadding(IIII)V

    .line 1649
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->access$300()Landroid/widget/RelativeLayout;

    move-result-object v7

    invoke-virtual {v7, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 1651
    new-instance v7, Landroid/widget/Button;

    sget-object v8, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    invoke-direct {v7, v8}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    invoke-static {v7}, Lcom/miniclip/nativeJNI/cocojava;->access$402(Landroid/widget/Button;)Landroid/widget/Button;

    .line 1652
    new-instance v5, Landroid/widget/RelativeLayout$LayoutParams;

    const-wide v7, 0x4072c00000000000L    # 300.0

    sget v9, Lcom/miniclip/nativeJNI/cocojava;->mDensity:F

    float-to-double v9, v9

    mul-double/2addr v7, v9

    const-wide/high16 v9, 0x3fe0000000000000L    # 0.5

    mul-double/2addr v7, v9

    double-to-int v7, v7

    add-int/lit8 v7, v7, -0x28

    const/4 v8, -0x2

    invoke-direct {v5, v7, v8}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 1655
    .local v5, "paramsS":Landroid/widget/RelativeLayout$LayoutParams;
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->access$400()Landroid/widget/Button;

    move-result-object v7

    const-string v8, "Skip"

    invoke-virtual {v7, v8}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 1656
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->access$400()Landroid/widget/Button;

    move-result-object v7

    invoke-virtual {v1, v7}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 1657
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->access$400()Landroid/widget/Button;

    move-result-object v8

    sget-object v7, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v7, Landroid/view/View$OnClickListener;

    invoke-virtual {v8, v7}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1658
    new-instance v7, Landroid/widget/Button;

    sget-object v8, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    invoke-direct {v7, v8}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    invoke-static {v7}, Lcom/miniclip/nativeJNI/cocojava;->access$502(Landroid/widget/Button;)Landroid/widget/Button;

    .line 1659
    new-instance v4, Landroid/widget/RelativeLayout$LayoutParams;

    const-wide v7, 0x4072c00000000000L    # 300.0

    sget v9, Lcom/miniclip/nativeJNI/cocojava;->mDensity:F

    float-to-double v9, v9

    mul-double/2addr v7, v9

    const-wide/high16 v9, 0x3fe0000000000000L    # 0.5

    mul-double/2addr v7, v9

    double-to-int v7, v7

    add-int/lit8 v7, v7, -0x28

    const/4 v8, -0x2

    invoke-direct {v4, v7, v8}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 1662
    .local v4, "paramsR":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v7, 0xb

    invoke-virtual {v4, v7}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 1663
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->access$500()Landroid/widget/Button;

    move-result-object v7

    invoke-virtual {v7, v4}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1664
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->access$500()Landroid/widget/Button;

    move-result-object v7

    const-string v8, "Remove Ads"

    invoke-virtual {v7, v8}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 1665
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->access$500()Landroid/widget/Button;

    move-result-object v7

    invoke-virtual {v1, v7}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 1666
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->access$500()Landroid/widget/Button;

    move-result-object v8

    sget-object v7, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v7, Landroid/view/View$OnClickListener;

    invoke-virtual {v8, v7}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1679
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->access$200()Landroid/widget/RelativeLayout;

    move-result-object v8

    sget-object v7, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v7, Landroid/view/View$OnClickListener;

    invoke-virtual {v8, v7}, Landroid/widget/RelativeLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1680
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->access$200()Landroid/widget/RelativeLayout;

    move-result-object v7

    const/4 v8, 0x1

    invoke-virtual {v7, v8}, Landroid/widget/RelativeLayout;->setClickable(Z)V

    .line 1688
    sget-object v7, Lcom/miniclip/nativeJNI/cocojava;->mGLView:Lcom/miniclip/nativeJNI/ClearGLSurfaceView;

    new-instance v8, Lcom/miniclip/nativeJNI/cocojava$21$1;

    invoke-direct {v8, p0}, Lcom/miniclip/nativeJNI/cocojava$21$1;-><init>(Lcom/miniclip/nativeJNI/cocojava$21;)V

    invoke-virtual {v7, v8}, Lcom/miniclip/nativeJNI/ClearGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    .line 1694
    return-void

    .line 1612
    .end local v0    # "bg1":Landroid/widget/ImageView;
    .end local v1    # "centerdButton":Landroid/widget/RelativeLayout;
    .end local v2    # "params":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v3    # "paramsB":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v4    # "paramsR":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v5    # "paramsS":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v6    # "resourceId":I
    :cond_0
    new-instance v7, Landroid/widget/RelativeLayout;

    sget-object v8, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    invoke-direct {v7, v8}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    invoke-static {v7}, Lcom/miniclip/nativeJNI/cocojava;->access$202(Landroid/widget/RelativeLayout;)Landroid/widget/RelativeLayout;

    .line 1613
    new-instance v2, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v7, -0x1

    const/4 v8, -0x1

    invoke-direct {v2, v7, v8}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 1616
    .restart local v2    # "params":Landroid/widget/RelativeLayout$LayoutParams;
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->access$200()Landroid/widget/RelativeLayout;

    move-result-object v7

    const/16 v8, 0x11

    invoke-virtual {v7, v8}, Landroid/widget/RelativeLayout;->setHorizontalGravity(I)V

    .line 1617
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->access$200()Landroid/widget/RelativeLayout;

    move-result-object v7

    const/16 v8, 0x50

    invoke-virtual {v7, v8}, Landroid/widget/RelativeLayout;->setVerticalGravity(I)V

    .line 1618
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->access$200()Landroid/widget/RelativeLayout;

    move-result-object v7

    invoke-virtual {v7, v2}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1619
    sget-object v7, Lcom/miniclip/nativeJNI/cocojava;->layout:Landroid/widget/RelativeLayout;

    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->access$200()Landroid/widget/RelativeLayout;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    goto/16 :goto_0
.end method
