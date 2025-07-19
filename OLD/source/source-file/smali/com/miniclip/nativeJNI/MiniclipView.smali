.class public Lcom/miniclip/nativeJNI/MiniclipView;
.super Landroid/widget/RelativeLayout;
.source "MiniclipView.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private mBodyView:Landroid/widget/ImageView;

.field private mCloseButton:Landroid/widget/ImageView;

.field private mContext:Landroid/content/Context;

.field private mFeaturedApObject:Lcom/tapjoy/TapjoyFeaturedAppObject;

.field private mImageId:I

.field private mMainView:Landroid/widget/RelativeLayout;

.field private mUrl:Landroid/widget/ImageView;

.field private mUrlString:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;ILjava/lang/String;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "imageId"    # I
    .param p3, "urlString"    # Ljava/lang/String;

    .prologue
    .line 27
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 28
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miniclip/nativeJNI/MiniclipView;->mMainView:Landroid/widget/RelativeLayout;

    .line 29
    iput-object p1, p0, Lcom/miniclip/nativeJNI/MiniclipView;->mContext:Landroid/content/Context;

    .line 30
    iput p2, p0, Lcom/miniclip/nativeJNI/MiniclipView;->mImageId:I

    .line 31
    iput-object p3, p0, Lcom/miniclip/nativeJNI/MiniclipView;->mUrlString:Ljava/lang/String;

    .line 32
    invoke-virtual {p0}, Lcom/miniclip/nativeJNI/MiniclipView;->display()V

    .line 33
    return-void
.end method


# virtual methods
.method public display()V
    .locals 28

    .prologue
    .line 41
    invoke-virtual/range {p0 .. p0}, Lcom/miniclip/nativeJNI/MiniclipView;->removeAllViews()V

    .line 43
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/MiniclipView;->mContext:Landroid/content/Context;

    move-object/from16 v23, v0

    check-cast v23, Landroid/app/Activity;

    invoke-virtual/range {v23 .. v23}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v23

    move-object/from16 v0, v23

    iget v8, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 44
    .local v8, "height":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/MiniclipView;->mContext:Landroid/content/Context;

    move-object/from16 v23, v0

    check-cast v23, Landroid/app/Activity;

    invoke-virtual/range {v23 .. v23}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v23

    move-object/from16 v0, v23

    iget v7, v0, Landroid/util/DisplayMetrics;->density:F

    .line 45
    .local v7, "density":F
    int-to-float v0, v8

    move/from16 v23, v0

    const/high16 v24, 0x43f00000    # 480.0f

    div-float v22, v23, v24

    .line 47
    .local v22, "scaleF":F
    new-instance v11, Landroid/widget/RelativeLayout$LayoutParams;

    const/16 v23, -0x1

    const/16 v24, -0x1

    move/from16 v0, v23

    move/from16 v1, v24

    invoke-direct {v11, v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 50
    .local v11, "paramsF1":Landroid/widget/RelativeLayout$LayoutParams;
    new-instance v6, Landroid/widget/RelativeLayout;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/MiniclipView;->mContext:Landroid/content/Context;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    invoke-direct {v6, v0}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 51
    .local v6, "blockTouch":Landroid/widget/RelativeLayout;
    invoke-virtual {v6, v11}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 52
    move-object/from16 v0, p0

    invoke-virtual {v6, v0}, Landroid/widget/RelativeLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 53
    move-object/from16 v0, p0

    invoke-virtual {v0, v6}, Lcom/miniclip/nativeJNI/MiniclipView;->addView(Landroid/view/View;)V

    .line 55
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/MiniclipView;->mMainView:Landroid/widget/RelativeLayout;

    move-object/from16 v23, v0

    if-eqz v23, :cond_0

    .line 56
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/MiniclipView;->mMainView:Landroid/widget/RelativeLayout;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Landroid/widget/RelativeLayout;->removeAllViews()V

    .line 58
    :cond_0
    new-instance v23, Landroid/widget/RelativeLayout;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/MiniclipView;->mContext:Landroid/content/Context;

    move-object/from16 v24, v0

    invoke-direct/range {v23 .. v24}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/miniclip/nativeJNI/MiniclipView;->mMainView:Landroid/widget/RelativeLayout;

    .line 59
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/MiniclipView;->mMainView:Landroid/widget/RelativeLayout;

    move-object/from16 v23, v0

    const/16 v24, 0x14

    const/16 v25, 0x5

    const/16 v26, 0x14

    const/16 v27, 0x5

    invoke-virtual/range {v23 .. v27}, Landroid/widget/RelativeLayout;->setPadding(IIII)V

    .line 60
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/MiniclipView;->mMainView:Landroid/widget/RelativeLayout;

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Lcom/miniclip/nativeJNI/MiniclipView;->addView(Landroid/view/View;)V

    .line 62
    move-object/from16 v0, p0

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lcom/miniclip/nativeJNI/MiniclipView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 64
    new-instance v5, Landroid/widget/ImageView;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/MiniclipView;->mContext:Landroid/content/Context;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    invoke-direct {v5, v0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 66
    .local v5, "bg1":Landroid/widget/ImageView;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/MiniclipView;->mContext:Landroid/content/Context;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v23

    const-string v24, "newbox2"

    const-string v25, "drawable"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/MiniclipView;->mContext:Landroid/content/Context;

    move-object/from16 v26, v0

    invoke-virtual/range {v26 .. v26}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v26

    invoke-virtual/range {v23 .. v26}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v15

    .line 67
    .local v15, "resourceId":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/MiniclipView;->mContext:Landroid/content/Context;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-virtual {v0, v15}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-virtual {v5, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 69
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/MiniclipView;->mMainView:Landroid/widget/RelativeLayout;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    invoke-virtual {v0, v5}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 72
    new-instance v23, Landroid/widget/ImageView;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/MiniclipView;->mContext:Landroid/content/Context;

    move-object/from16 v24, v0

    invoke-direct/range {v23 .. v24}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/miniclip/nativeJNI/MiniclipView;->mBodyView:Landroid/widget/ImageView;

    .line 73
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/MiniclipView;->mContext:Landroid/content/Context;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v23

    const-string v24, "buynow_v2"

    const-string v25, "drawable"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/MiniclipView;->mContext:Landroid/content/Context;

    move-object/from16 v26, v0

    invoke-virtual/range {v26 .. v26}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v26

    invoke-virtual/range {v23 .. v26}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v15

    .line 74
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/MiniclipView;->mBodyView:Landroid/widget/ImageView;

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/MiniclipView;->mContext:Landroid/content/Context;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v0, v15}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v24

    invoke-virtual/range {v23 .. v24}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 76
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/MiniclipView;->mBodyView:Landroid/widget/ImageView;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 78
    new-instance v16, Landroid/widget/RelativeLayout;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/MiniclipView;->mContext:Landroid/content/Context;

    move-object/from16 v23, v0

    move-object/from16 v0, v16

    move-object/from16 v1, v23

    invoke-direct {v0, v1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 79
    .local v16, "rl1":Landroid/widget/RelativeLayout;
    move-object/from16 v0, v16

    invoke-virtual {v0, v11}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 80
    const/16 v23, 0x3c

    const/16 v24, 0x32

    const/16 v25, 0x3c

    const/16 v26, 0x32

    move-object/from16 v0, v16

    move/from16 v1, v23

    move/from16 v2, v24

    move/from16 v3, v25

    move/from16 v4, v26

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/widget/RelativeLayout;->setPadding(IIII)V

    .line 81
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/MiniclipView;->mBodyView:Landroid/widget/ImageView;

    move-object/from16 v23, v0

    move-object/from16 v0, v16

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 83
    new-instance v21, Landroid/widget/RelativeLayout;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/MiniclipView;->mContext:Landroid/content/Context;

    move-object/from16 v23, v0

    move-object/from16 v0, v21

    move-object/from16 v1, v23

    invoke-direct {v0, v1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 84
    .local v21, "rl7":Landroid/widget/RelativeLayout;
    new-instance v10, Landroid/widget/RelativeLayout$LayoutParams;

    const/high16 v23, 0x42f00000    # 120.0f

    mul-float v23, v23, v7

    move/from16 v0, v23

    float-to-int v0, v0

    move/from16 v23, v0

    const/high16 v24, 0x42f00000    # 120.0f

    mul-float v24, v24, v7

    move/from16 v0, v24

    float-to-int v0, v0

    move/from16 v24, v0

    move/from16 v0, v23

    move/from16 v1, v24

    invoke-direct {v10, v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 85
    .local v10, "params7":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v23, 0xe

    move/from16 v0, v23

    invoke-virtual {v10, v0}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 86
    move-object/from16 v0, v21

    invoke-virtual {v0, v10}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 88
    new-instance v18, Landroid/widget/RelativeLayout;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/MiniclipView;->mContext:Landroid/content/Context;

    move-object/from16 v23, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v23

    invoke-direct {v0, v1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 89
    .local v18, "rl3":Landroid/widget/RelativeLayout;
    new-instance v9, Landroid/widget/RelativeLayout$LayoutParams;

    const/16 v23, -0x1

    const/16 v24, -0x2

    move/from16 v0, v23

    move/from16 v1, v24

    invoke-direct {v9, v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 92
    .local v9, "params":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v23, 0xc

    move/from16 v0, v23

    invoke-virtual {v9, v0}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 93
    const/16 v23, 0x9

    move/from16 v0, v23

    invoke-virtual {v9, v0}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 94
    move-object/from16 v0, v18

    invoke-virtual {v0, v9}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 96
    new-instance v12, Landroid/widget/RelativeLayout$LayoutParams;

    const/high16 v23, 0x43c80000    # 400.0f

    mul-float v23, v23, v22

    move/from16 v0, v23

    float-to-int v0, v0

    move/from16 v23, v0

    const/16 v24, -0x2

    move/from16 v0, v23

    move/from16 v1, v24

    invoke-direct {v12, v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 97
    .local v12, "paramsnb1":Landroid/widget/RelativeLayout$LayoutParams;
    new-instance v19, Landroid/widget/RelativeLayout;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/MiniclipView;->mContext:Landroid/content/Context;

    move-object/from16 v23, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v23

    invoke-direct {v0, v1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 98
    .local v19, "rl4":Landroid/widget/RelativeLayout;
    const/16 v23, 0xe

    move/from16 v0, v23

    invoke-virtual {v12, v0}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 99
    move-object/from16 v0, v19

    invoke-virtual {v0, v12}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 100
    invoke-virtual/range {v18 .. v19}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 101
    new-instance v13, Landroid/widget/RelativeLayout$LayoutParams;

    const/high16 v23, 0x43c80000    # 400.0f

    mul-float v23, v23, v22

    move/from16 v0, v23

    float-to-int v0, v0

    move/from16 v23, v0

    const/16 v24, -0x2

    move/from16 v0, v23

    move/from16 v1, v24

    invoke-direct {v13, v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 102
    .local v13, "paramsnb2":Landroid/widget/RelativeLayout$LayoutParams;
    new-instance v20, Landroid/widget/RelativeLayout;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/MiniclipView;->mContext:Landroid/content/Context;

    move-object/from16 v23, v0

    move-object/from16 v0, v20

    move-object/from16 v1, v23

    invoke-direct {v0, v1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 103
    .local v20, "rl5":Landroid/widget/RelativeLayout;
    const/16 v23, 0xb

    move/from16 v0, v23

    invoke-virtual {v13, v0}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 104
    move-object/from16 v0, v20

    invoke-virtual {v0, v13}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 105
    move-object/from16 v0, v18

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 107
    new-instance v17, Landroid/widget/RelativeLayout;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/MiniclipView;->mContext:Landroid/content/Context;

    move-object/from16 v23, v0

    move-object/from16 v0, v17

    move-object/from16 v1, v23

    invoke-direct {v0, v1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 108
    .local v17, "rl2":Landroid/widget/RelativeLayout;
    const/16 v23, 0x16

    const/16 v24, 0x14

    const/16 v25, 0x14

    const/16 v26, 0xa

    move-object/from16 v0, v17

    move/from16 v1, v23

    move/from16 v2, v24

    move/from16 v3, v25

    move/from16 v4, v26

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/widget/RelativeLayout;->setPadding(IIII)V

    .line 109
    move-object/from16 v0, v17

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 110
    invoke-virtual/range {v17 .. v18}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 112
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/MiniclipView;->mMainView:Landroid/widget/RelativeLayout;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 114
    new-instance v23, Landroid/widget/ImageView;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/MiniclipView;->mContext:Landroid/content/Context;

    move-object/from16 v24, v0

    invoke-direct/range {v23 .. v24}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/miniclip/nativeJNI/MiniclipView;->mUrl:Landroid/widget/ImageView;

    .line 116
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/MiniclipView;->mContext:Landroid/content/Context;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v23

    const-string v24, "newsgetitnow1"

    const-string v25, "drawable"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/MiniclipView;->mContext:Landroid/content/Context;

    move-object/from16 v26, v0

    invoke-virtual/range {v26 .. v26}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v26

    invoke-virtual/range {v23 .. v26}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v15

    .line 117
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/MiniclipView;->mUrl:Landroid/widget/ImageView;

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/MiniclipView;->mContext:Landroid/content/Context;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v0, v15}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v24

    invoke-virtual/range {v23 .. v24}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 119
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/MiniclipView;->mUrl:Landroid/widget/ImageView;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 120
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/MiniclipView;->mUrl:Landroid/widget/ImageView;

    move-object/from16 v23, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 122
    new-instance v23, Landroid/widget/ImageView;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/MiniclipView;->mContext:Landroid/content/Context;

    move-object/from16 v24, v0

    invoke-direct/range {v23 .. v24}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/miniclip/nativeJNI/MiniclipView;->mCloseButton:Landroid/widget/ImageView;

    .line 123
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/MiniclipView;->mContext:Landroid/content/Context;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v23

    const-string v24, "newsclose1"

    const-string v25, "drawable"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/MiniclipView;->mContext:Landroid/content/Context;

    move-object/from16 v26, v0

    invoke-virtual/range {v26 .. v26}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v26

    invoke-virtual/range {v23 .. v26}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v15

    .line 124
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/MiniclipView;->mCloseButton:Landroid/widget/ImageView;

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/MiniclipView;->mContext:Landroid/content/Context;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v0, v15}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v24

    invoke-virtual/range {v23 .. v24}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 126
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/MiniclipView;->mCloseButton:Landroid/widget/ImageView;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 127
    new-instance v14, Landroid/widget/RelativeLayout$LayoutParams;

    const/high16 v23, 0x42f00000    # 120.0f

    mul-float v23, v23, v22

    move/from16 v0, v23

    float-to-int v0, v0

    move/from16 v23, v0

    const/16 v24, -0x2

    move/from16 v0, v23

    move/from16 v1, v24

    invoke-direct {v14, v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 130
    .local v14, "paramsnb3":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v23, 0xb

    move/from16 v0, v23

    invoke-virtual {v14, v0}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 131
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/MiniclipView;->mCloseButton:Landroid/widget/ImageView;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    invoke-virtual {v0, v14}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 132
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/MiniclipView;->mCloseButton:Landroid/widget/ImageView;

    move-object/from16 v23, v0

    move-object/from16 v0, v17

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 133
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 137
    iget-object v1, p0, Lcom/miniclip/nativeJNI/MiniclipView;->mUrl:Landroid/widget/ImageView;

    if-ne p1, v1, :cond_1

    .line 138
    invoke-virtual {p0}, Lcom/miniclip/nativeJNI/MiniclipView;->removeAllViews()V

    .line 141
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 142
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "market://details?id=com.miniclip.gravityguypaid"

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 143
    iget-object v1, p0, Lcom/miniclip/nativeJNI/MiniclipView;->mContext:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 151
    .end local v0    # "intent":Landroid/content/Intent;
    :cond_0
    :goto_0
    return-void

    .line 145
    :cond_1
    iget-object v1, p0, Lcom/miniclip/nativeJNI/MiniclipView;->mCloseButton:Landroid/widget/ImageView;

    if-ne p1, v1, :cond_0

    .line 147
    invoke-virtual {p0}, Lcom/miniclip/nativeJNI/MiniclipView;->removeAllViews()V

    goto :goto_0
.end method
