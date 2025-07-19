.class public Lcom/miniclip/nativeJNI/TapJoyView_;
.super Landroid/widget/RelativeLayout;
.source "TapJoyView_.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private mCloseButton:Landroid/widget/ImageView;

.field private mContext:Landroid/content/Context;

.field private mFeaturedApObject:Lcom/tapjoy/TapjoyFeaturedAppObject;

.field private mForwardButton:Landroid/widget/ImageView;

.field private mGotoButton:Landroid/widget/ImageView;

.field private mMainView:Landroid/widget/RelativeLayout;

.field private mUrlButton:Landroid/widget/ImageView;

.field private mWebview:Landroid/webkit/WebView;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/tapjoy/TapjoyFeaturedAppObject;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "featuredApObject"    # Lcom/tapjoy/TapjoyFeaturedAppObject;

    .prologue
    .line 27
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 28
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miniclip/nativeJNI/TapJoyView_;->mMainView:Landroid/widget/RelativeLayout;

    .line 29
    iput-object p1, p0, Lcom/miniclip/nativeJNI/TapJoyView_;->mContext:Landroid/content/Context;

    .line 30
    iput-object p2, p0, Lcom/miniclip/nativeJNI/TapJoyView_;->mFeaturedApObject:Lcom/tapjoy/TapjoyFeaturedAppObject;

    .line 31
    invoke-virtual {p0}, Lcom/miniclip/nativeJNI/TapJoyView_;->displayTJ()V

    .line 32
    return-void
.end method


# virtual methods
.method public displayTJ()V
    .locals 29

    .prologue
    .line 39
    invoke-virtual/range {p0 .. p0}, Lcom/miniclip/nativeJNI/TapJoyView_;->removeAllViews()V

    .line 41
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/TapJoyView_;->mContext:Landroid/content/Context;

    move-object/from16 v24, v0

    check-cast v24, Landroid/app/Activity;

    invoke-virtual/range {v24 .. v24}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v24

    move-object/from16 v0, v24

    iget v8, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 42
    .local v8, "height":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/TapJoyView_;->mContext:Landroid/content/Context;

    move-object/from16 v24, v0

    check-cast v24, Landroid/app/Activity;

    invoke-virtual/range {v24 .. v24}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v24

    move-object/from16 v0, v24

    iget v7, v0, Landroid/util/DisplayMetrics;->density:F

    .line 43
    .local v7, "density":F
    int-to-float v0, v8

    move/from16 v24, v0

    const/high16 v25, 0x43f00000    # 480.0f

    div-float v23, v24, v25

    .line 45
    .local v23, "scaleF":F
    new-instance v12, Landroid/widget/RelativeLayout$LayoutParams;

    const/16 v24, -0x1

    const/16 v25, -0x1

    move/from16 v0, v24

    move/from16 v1, v25

    invoke-direct {v12, v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 48
    .local v12, "paramsF1":Landroid/widget/RelativeLayout$LayoutParams;
    new-instance v6, Landroid/widget/RelativeLayout;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/TapJoyView_;->mContext:Landroid/content/Context;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    invoke-direct {v6, v0}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 49
    .local v6, "blockTouch":Landroid/widget/RelativeLayout;
    invoke-virtual {v6, v12}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 50
    move-object/from16 v0, p0

    invoke-virtual {v6, v0}, Landroid/widget/RelativeLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 51
    move-object/from16 v0, p0

    invoke-virtual {v0, v6}, Lcom/miniclip/nativeJNI/TapJoyView_;->addView(Landroid/view/View;)V

    .line 53
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/TapJoyView_;->mMainView:Landroid/widget/RelativeLayout;

    move-object/from16 v24, v0

    if-eqz v24, :cond_0

    .line 54
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/TapJoyView_;->mMainView:Landroid/widget/RelativeLayout;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Landroid/widget/RelativeLayout;->removeAllViews()V

    .line 56
    :cond_0
    new-instance v24, Landroid/widget/RelativeLayout;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/TapJoyView_;->mContext:Landroid/content/Context;

    move-object/from16 v25, v0

    invoke-direct/range {v24 .. v25}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, v24

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/miniclip/nativeJNI/TapJoyView_;->mMainView:Landroid/widget/RelativeLayout;

    .line 57
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/TapJoyView_;->mMainView:Landroid/widget/RelativeLayout;

    move-object/from16 v24, v0

    const/16 v25, 0x14

    const/16 v26, 0x5

    const/16 v27, 0x14

    const/16 v28, 0x5

    invoke-virtual/range {v24 .. v28}, Landroid/widget/RelativeLayout;->setPadding(IIII)V

    .line 58
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/TapJoyView_;->mMainView:Landroid/widget/RelativeLayout;

    move-object/from16 v24, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/miniclip/nativeJNI/TapJoyView_;->addView(Landroid/view/View;)V

    .line 60
    move-object/from16 v0, p0

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lcom/miniclip/nativeJNI/TapJoyView_;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 62
    new-instance v5, Landroid/widget/ImageView;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/TapJoyView_;->mContext:Landroid/content/Context;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    invoke-direct {v5, v0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 64
    .local v5, "bg1":Landroid/widget/ImageView;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/TapJoyView_;->mContext:Landroid/content/Context;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v24

    const-string v25, "newbox2"

    const-string v26, "drawable"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/TapJoyView_;->mContext:Landroid/content/Context;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v24 .. v27}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v16

    .line 65
    .local v16, "resourceId":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/TapJoyView_;->mContext:Landroid/content/Context;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v24

    move-object/from16 v0, v24

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v5, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 67
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/TapJoyView_;->mMainView:Landroid/widget/RelativeLayout;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    invoke-virtual {v0, v5}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 69
    new-instance v24, Landroid/webkit/WebView;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/TapJoyView_;->mContext:Landroid/content/Context;

    move-object/from16 v25, v0

    invoke-direct/range {v24 .. v25}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, v24

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/miniclip/nativeJNI/TapJoyView_;->mWebview:Landroid/webkit/WebView;

    .line 70
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/TapJoyView_;->mWebview:Landroid/webkit/WebView;

    move-object/from16 v24, v0

    const/16 v25, 0x0

    invoke-virtual/range {v24 .. v25}, Landroid/webkit/WebView;->setBackgroundColor(I)V

    .line 73
    new-instance v17, Landroid/widget/RelativeLayout;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/TapJoyView_;->mContext:Landroid/content/Context;

    move-object/from16 v24, v0

    move-object/from16 v0, v17

    move-object/from16 v1, v24

    invoke-direct {v0, v1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 74
    .local v17, "rl1":Landroid/widget/RelativeLayout;
    move-object/from16 v0, v17

    invoke-virtual {v0, v12}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 75
    const/16 v24, 0x3c

    const/16 v25, 0x32

    const/16 v26, 0x3c

    const/16 v27, 0x0

    move-object/from16 v0, v17

    move/from16 v1, v24

    move/from16 v2, v25

    move/from16 v3, v26

    move/from16 v4, v27

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/widget/RelativeLayout;->setPadding(IIII)V

    .line 77
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/TapJoyView_;->mWebview:Landroid/webkit/WebView;

    move-object/from16 v24, v0

    move-object/from16 v0, v17

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 79
    new-instance v22, Landroid/widget/RelativeLayout;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/TapJoyView_;->mContext:Landroid/content/Context;

    move-object/from16 v24, v0

    move-object/from16 v0, v22

    move-object/from16 v1, v24

    invoke-direct {v0, v1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 80
    .local v22, "rl7":Landroid/widget/RelativeLayout;
    new-instance v11, Landroid/widget/RelativeLayout$LayoutParams;

    const/high16 v24, 0x42f00000    # 120.0f

    mul-float v24, v24, v7

    move/from16 v0, v24

    float-to-int v0, v0

    move/from16 v24, v0

    const/high16 v25, 0x42f00000    # 120.0f

    mul-float v25, v25, v7

    move/from16 v0, v25

    float-to-int v0, v0

    move/from16 v25, v0

    move/from16 v0, v24

    move/from16 v1, v25

    invoke-direct {v11, v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 81
    .local v11, "params7":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v24, 0xe

    move/from16 v0, v24

    invoke-virtual {v11, v0}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 82
    move-object/from16 v0, v22

    invoke-virtual {v0, v11}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 92
    new-instance v19, Landroid/widget/RelativeLayout;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/TapJoyView_;->mContext:Landroid/content/Context;

    move-object/from16 v24, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v24

    invoke-direct {v0, v1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 93
    .local v19, "rl3":Landroid/widget/RelativeLayout;
    new-instance v10, Landroid/widget/RelativeLayout$LayoutParams;

    const/16 v24, -0x1

    const/16 v25, -0x2

    move/from16 v0, v24

    move/from16 v1, v25

    invoke-direct {v10, v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 96
    .local v10, "params":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v24, 0xc

    move/from16 v0, v24

    invoke-virtual {v10, v0}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 97
    const/16 v24, 0x9

    move/from16 v0, v24

    invoke-virtual {v10, v0}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 98
    move-object/from16 v0, v19

    invoke-virtual {v0, v10}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 100
    new-instance v13, Landroid/widget/RelativeLayout$LayoutParams;

    const/high16 v24, 0x43c80000    # 400.0f

    mul-float v24, v24, v23

    move/from16 v0, v24

    float-to-int v0, v0

    move/from16 v24, v0

    const/16 v25, -0x2

    move/from16 v0, v24

    move/from16 v1, v25

    invoke-direct {v13, v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 103
    .local v13, "paramsnb1":Landroid/widget/RelativeLayout$LayoutParams;
    new-instance v20, Landroid/widget/RelativeLayout;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/TapJoyView_;->mContext:Landroid/content/Context;

    move-object/from16 v24, v0

    move-object/from16 v0, v20

    move-object/from16 v1, v24

    invoke-direct {v0, v1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 104
    .local v20, "rl4":Landroid/widget/RelativeLayout;
    const/16 v24, 0xe

    move/from16 v0, v24

    invoke-virtual {v13, v0}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 105
    move-object/from16 v0, v20

    invoke-virtual {v0, v13}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 106
    invoke-virtual/range {v19 .. v20}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 107
    new-instance v14, Landroid/widget/RelativeLayout$LayoutParams;

    const/high16 v24, 0x43c80000    # 400.0f

    mul-float v24, v24, v23

    move/from16 v0, v24

    float-to-int v0, v0

    move/from16 v24, v0

    const/16 v25, -0x2

    move/from16 v0, v24

    move/from16 v1, v25

    invoke-direct {v14, v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 110
    .local v14, "paramsnb2":Landroid/widget/RelativeLayout$LayoutParams;
    new-instance v21, Landroid/widget/RelativeLayout;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/TapJoyView_;->mContext:Landroid/content/Context;

    move-object/from16 v24, v0

    move-object/from16 v0, v21

    move-object/from16 v1, v24

    invoke-direct {v0, v1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 111
    .local v21, "rl5":Landroid/widget/RelativeLayout;
    const/16 v24, 0xb

    move/from16 v0, v24

    invoke-virtual {v14, v0}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 112
    move-object/from16 v0, v21

    invoke-virtual {v0, v14}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 113
    move-object/from16 v0, v19

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 115
    new-instance v18, Landroid/widget/RelativeLayout;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/TapJoyView_;->mContext:Landroid/content/Context;

    move-object/from16 v24, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v24

    invoke-direct {v0, v1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 116
    .local v18, "rl2":Landroid/widget/RelativeLayout;
    const/16 v24, 0x16

    const/16 v25, 0x14

    const/16 v26, 0x14

    const/16 v27, 0xa

    move-object/from16 v0, v18

    move/from16 v1, v24

    move/from16 v2, v25

    move/from16 v3, v26

    move/from16 v4, v27

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/widget/RelativeLayout;->setPadding(IIII)V

    .line 117
    move-object/from16 v0, v18

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 118
    invoke-virtual/range {v18 .. v19}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 124
    const-string v24, "<center><p style=\'font-family:Impact;color:white;font-size:20px;font-name:arial;font-weight:bold\'>Get %s free slowmotions</p><img style=\'display: block;margin-left: auto;margin-right: auto;width:100px;height:100px;\' src=\'%s\' /><p style=\'font-family:Impact;color:white;font-size:20px;font-name:arial\'>%s %s</p></center>"

    const/16 v25, 0x4

    move/from16 v0, v25

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v25, v0

    const/16 v26, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/TapJoyView_;->mFeaturedApObject:Lcom/tapjoy/TapjoyFeaturedAppObject;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    iget v0, v0, Lcom/tapjoy/TapjoyFeaturedAppObject;->amount:I

    move/from16 v27, v0

    div-int/lit8 v27, v27, 0x32

    invoke-static/range {v27 .. v27}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v27

    aput-object v27, v25, v26

    const/16 v26, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/TapJoyView_;->mFeaturedApObject:Lcom/tapjoy/TapjoyFeaturedAppObject;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    iget-object v0, v0, Lcom/tapjoy/TapjoyFeaturedAppObject;->iconURL:Ljava/lang/String;

    move-object/from16 v27, v0

    aput-object v27, v25, v26

    const/16 v26, 0x2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/TapJoyView_;->mFeaturedApObject:Lcom/tapjoy/TapjoyFeaturedAppObject;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    iget-object v0, v0, Lcom/tapjoy/TapjoyFeaturedAppObject;->description:Ljava/lang/String;

    move-object/from16 v27, v0

    aput-object v27, v25, v26

    const/16 v26, 0x3

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/TapJoyView_;->mFeaturedApObject:Lcom/tapjoy/TapjoyFeaturedAppObject;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    iget-object v0, v0, Lcom/tapjoy/TapjoyFeaturedAppObject;->cost:Ljava/lang/String;

    move-object/from16 v27, v0

    aput-object v27, v25, v26

    invoke-static/range {v24 .. v25}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    .line 134
    .local v9, "htmlContent":Ljava/lang/String;
    invoke-static {v9}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 135
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/TapJoyView_;->mWebview:Landroid/webkit/WebView;

    move-object/from16 v24, v0

    const-string v25, "text/html"

    const-string v26, "UTF-8"

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    move-object/from16 v2, v26

    invoke-virtual {v0, v9, v1, v2}, Landroid/webkit/WebView;->loadData(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 136
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/TapJoyView_;->mMainView:Landroid/widget/RelativeLayout;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 139
    new-instance v24, Landroid/widget/ImageView;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/TapJoyView_;->mContext:Landroid/content/Context;

    move-object/from16 v25, v0

    invoke-direct/range {v24 .. v25}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, v24

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/miniclip/nativeJNI/TapJoyView_;->mUrlButton:Landroid/widget/ImageView;

    .line 140
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/TapJoyView_;->mContext:Landroid/content/Context;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v24

    const-string v25, "newsgetitnow1"

    const-string v26, "drawable"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/TapJoyView_;->mContext:Landroid/content/Context;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v24 .. v27}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v16

    .line 141
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/TapJoyView_;->mUrlButton:Landroid/widget/ImageView;

    move-object/from16 v24, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/TapJoyView_;->mContext:Landroid/content/Context;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v25

    move-object/from16 v0, v25

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v25

    invoke-virtual/range {v24 .. v25}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 143
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/TapJoyView_;->mUrlButton:Landroid/widget/ImageView;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 144
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/TapJoyView_;->mUrlButton:Landroid/widget/ImageView;

    move-object/from16 v24, v0

    move-object/from16 v0, v20

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 153
    new-instance v24, Landroid/widget/ImageView;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/TapJoyView_;->mContext:Landroid/content/Context;

    move-object/from16 v25, v0

    invoke-direct/range {v24 .. v25}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, v24

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/miniclip/nativeJNI/TapJoyView_;->mCloseButton:Landroid/widget/ImageView;

    .line 154
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/TapJoyView_;->mContext:Landroid/content/Context;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v24

    const-string v25, "newsclose1"

    const-string v26, "drawable"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/TapJoyView_;->mContext:Landroid/content/Context;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v24 .. v27}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v16

    .line 155
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/TapJoyView_;->mCloseButton:Landroid/widget/ImageView;

    move-object/from16 v24, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/TapJoyView_;->mContext:Landroid/content/Context;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v25

    move-object/from16 v0, v25

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v25

    invoke-virtual/range {v24 .. v25}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 157
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/TapJoyView_;->mCloseButton:Landroid/widget/ImageView;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 158
    new-instance v15, Landroid/widget/RelativeLayout$LayoutParams;

    const/high16 v24, 0x42f00000    # 120.0f

    mul-float v24, v24, v23

    move/from16 v0, v24

    float-to-int v0, v0

    move/from16 v24, v0

    const/16 v25, -0x2

    move/from16 v0, v24

    move/from16 v1, v25

    invoke-direct {v15, v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 161
    .local v15, "paramsnb3":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v24, 0xb

    move/from16 v0, v24

    invoke-virtual {v15, v0}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 162
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/TapJoyView_;->mCloseButton:Landroid/widget/ImageView;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    invoke-virtual {v0, v15}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 163
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/TapJoyView_;->mCloseButton:Landroid/widget/ImageView;

    move-object/from16 v24, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 164
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 169
    iget-object v3, p0, Lcom/miniclip/nativeJNI/TapJoyView_;->mUrlButton:Landroid/widget/ImageView;

    if-ne p1, v3, :cond_1

    .line 170
    invoke-virtual {p0}, Lcom/miniclip/nativeJNI/TapJoyView_;->removeAllViews()V

    .line 173
    iget-object v3, p0, Lcom/miniclip/nativeJNI/TapJoyView_;->mFeaturedApObject:Lcom/tapjoy/TapjoyFeaturedAppObject;

    iget-object v2, v3, Lcom/tapjoy/TapjoyFeaturedAppObject;->redirectURL:Ljava/lang/String;

    .line 174
    .local v2, "url":Ljava/lang/String;
    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 175
    .local v1, "uriUrl":Landroid/net/Uri;
    new-instance v0, Landroid/content/Intent;

    const-string v3, "android.intent.action.VIEW"

    invoke-direct {v0, v3, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 176
    .local v0, "launchBrowser":Landroid/content/Intent;
    iget-object v3, p0, Lcom/miniclip/nativeJNI/TapJoyView_;->mContext:Landroid/content/Context;

    invoke-virtual {v3, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 183
    .end local v0    # "launchBrowser":Landroid/content/Intent;
    .end local v1    # "uriUrl":Landroid/net/Uri;
    .end local v2    # "url":Ljava/lang/String;
    :cond_0
    :goto_0
    return-void

    .line 178
    :cond_1
    iget-object v3, p0, Lcom/miniclip/nativeJNI/TapJoyView_;->mCloseButton:Landroid/widget/ImageView;

    if-ne p1, v3, :cond_0

    .line 180
    invoke-virtual {p0}, Lcom/miniclip/nativeJNI/TapJoyView_;->removeAllViews()V

    goto :goto_0
.end method
