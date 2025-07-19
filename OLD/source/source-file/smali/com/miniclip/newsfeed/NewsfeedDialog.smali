.class public Lcom/miniclip/newsfeed/NewsfeedDialog;
.super Landroid/widget/RelativeLayout;
.source "NewsfeedDialog.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miniclip/newsfeed/NewsfeedDialog$URLImageView;
    }
.end annotation


# instance fields
.field private localUrgentNewsNum:I

.field protected mCloseButton:Landroid/widget/ImageView;

.field protected mContentView:Landroid/widget/RelativeLayout;

.field protected mContext:Landroid/content/Context;

.field private mCurNews:I

.field private mDialogView:Landroid/widget/RelativeLayout;

.field protected mFullView:Landroid/widget/RelativeLayout;

.field private mGotoButton1:Landroid/widget/ImageView;

.field private mHandler:Landroid/os/Handler;

.field private mImageView:Lcom/miniclip/newsfeed/NewsfeedDialog$URLImageView;

.field private mLeftButton1:Landroid/widget/ImageView;

.field private mNewsfeed:Lcom/miniclip/newsfeed/Newsfeed;

.field private mResetEffests:Ljava/lang/Runnable;

.field private mRightButton1:Landroid/widget/ImageView;

.field private mUrgent:Z

.field private mWebCover1:Landroid/widget/RelativeLayout;

.field protected mWindowView:Landroid/widget/RelativeLayout;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/miniclip/newsfeed/Newsfeed;Z)V
    .locals 33
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "newsfeed"    # Lcom/miniclip/newsfeed/Newsfeed;
    .param p3, "urgent"    # Z

    .prologue
    .line 81
    invoke-direct/range {p0 .. p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 65
    const/16 v28, 0x0

    move-object/from16 v0, v28

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/miniclip/newsfeed/NewsfeedDialog;->mImageView:Lcom/miniclip/newsfeed/NewsfeedDialog$URLImageView;

    .line 77
    new-instance v28, Landroid/os/Handler;

    invoke-direct/range {v28 .. v28}, Landroid/os/Handler;-><init>()V

    move-object/from16 v0, v28

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/miniclip/newsfeed/NewsfeedDialog;->mHandler:Landroid/os/Handler;

    .line 243
    new-instance v28, Lcom/miniclip/newsfeed/NewsfeedDialog$1;

    move-object/from16 v0, v28

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/miniclip/newsfeed/NewsfeedDialog$1;-><init>(Lcom/miniclip/newsfeed/NewsfeedDialog;)V

    move-object/from16 v0, v28

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/miniclip/newsfeed/NewsfeedDialog;->mResetEffests:Ljava/lang/Runnable;

    .line 83
    move-object/from16 v0, p1

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/miniclip/newsfeed/NewsfeedDialog;->mContext:Landroid/content/Context;

    .line 84
    move/from16 v0, p3

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/miniclip/newsfeed/NewsfeedDialog;->mUrgent:Z

    .line 86
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mContext:Landroid/content/Context;

    move-object/from16 v28, v0

    check-cast v28, Landroid/app/Activity;

    invoke-virtual/range {v28 .. v28}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v28

    invoke-interface/range {v28 .. v28}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v8

    .line 87
    .local v8, "display":Landroid/view/Display;
    invoke-virtual {v8}, Landroid/view/Display;->getWidth()I

    move-result v27

    .line 88
    .local v27, "width":I
    invoke-virtual {v8}, Landroid/view/Display;->getHeight()I

    move-result v9

    .line 89
    .local v9, "height":I
    sget v7, Lcom/miniclip/nativeJNI/cocojava;->mDensity:F

    .line 91
    .local v7, "density":F
    new-instance v18, Landroid/widget/RelativeLayout$LayoutParams;

    const/16 v28, -0x1

    const/16 v29, -0x1

    move-object/from16 v0, v18

    move/from16 v1, v28

    move/from16 v2, v29

    invoke-direct {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 92
    .local v18, "paramsFull1":Landroid/widget/RelativeLayout$LayoutParams;
    new-instance v28, Landroid/widget/RelativeLayout;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mContext:Landroid/content/Context;

    move-object/from16 v29, v0

    invoke-direct/range {v28 .. v29}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, v28

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/miniclip/newsfeed/NewsfeedDialog;->mFullView:Landroid/widget/RelativeLayout;

    .line 93
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mFullView:Landroid/widget/RelativeLayout;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 94
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mFullView:Landroid/widget/RelativeLayout;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 95
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mFullView:Landroid/widget/RelativeLayout;

    move-object/from16 v28, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Lcom/miniclip/newsfeed/NewsfeedDialog;->addView(Landroid/view/View;)V

    .line 98
    sget-boolean v28, Lcom/miniclip/nativeJNI/cocojava;->mINGAME_LANDSCAPE:Z

    if-eqz v28, :cond_0

    .line 99
    new-instance v19, Landroid/widget/RelativeLayout$LayoutParams;

    const/high16 v28, 0x43f50000    # 490.0f

    mul-float v28, v28, v7

    move/from16 v0, v28

    float-to-int v0, v0

    move/from16 v28, v0

    const v29, 0x43a28000    # 325.0f

    mul-float v29, v29, v7

    move/from16 v0, v29

    float-to-int v0, v0

    move/from16 v29, v0

    move-object/from16 v0, v19

    move/from16 v1, v28

    move/from16 v2, v29

    invoke-direct {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 102
    .local v19, "paramsFull2":Landroid/widget/RelativeLayout$LayoutParams;
    :goto_0
    const/16 v28, 0xd

    move-object/from16 v0, v19

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 103
    new-instance v28, Landroid/widget/RelativeLayout;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mContext:Landroid/content/Context;

    move-object/from16 v29, v0

    invoke-direct/range {v28 .. v29}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, v28

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/miniclip/newsfeed/NewsfeedDialog;->mDialogView:Landroid/widget/RelativeLayout;

    .line 104
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mDialogView:Landroid/widget/RelativeLayout;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 105
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mFullView:Landroid/widget/RelativeLayout;

    move-object/from16 v28, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mDialogView:Landroid/widget/RelativeLayout;

    move-object/from16 v29, v0

    invoke-virtual/range {v28 .. v29}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 108
    sget-boolean v28, Lcom/miniclip/nativeJNI/cocojava;->mINGAME_LANDSCAPE:Z

    if-eqz v28, :cond_1

    .line 109
    new-instance v20, Landroid/widget/RelativeLayout$LayoutParams;

    const/high16 v28, 0x43e10000    # 450.0f

    mul-float v28, v28, v7

    move/from16 v0, v28

    float-to-int v0, v0

    move/from16 v28, v0

    const v29, 0x43848000    # 265.0f

    mul-float v29, v29, v7

    move/from16 v0, v29

    float-to-int v0, v0

    move/from16 v29, v0

    move-object/from16 v0, v20

    move/from16 v1, v28

    move/from16 v2, v29

    invoke-direct {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 112
    .local v20, "paramsFull3":Landroid/widget/RelativeLayout$LayoutParams;
    :goto_1
    const/16 v28, 0xd

    move-object/from16 v0, v20

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 113
    new-instance v28, Landroid/widget/RelativeLayout;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mContext:Landroid/content/Context;

    move-object/from16 v29, v0

    invoke-direct/range {v28 .. v29}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, v28

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/miniclip/newsfeed/NewsfeedDialog;->mWindowView:Landroid/widget/RelativeLayout;

    .line 114
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mWindowView:Landroid/widget/RelativeLayout;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 115
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mDialogView:Landroid/widget/RelativeLayout;

    move-object/from16 v28, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mWindowView:Landroid/widget/RelativeLayout;

    move-object/from16 v29, v0

    invoke-virtual/range {v28 .. v29}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 117
    new-instance v11, Landroid/widget/Button;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mContext:Landroid/content/Context;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    invoke-direct {v11, v0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 119
    .local v11, "i":Landroid/widget/Button;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mContext:Landroid/content/Context;

    move-object/from16 v28, v0

    invoke-virtual/range {v28 .. v28}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v28

    const-string v29, "full_dialog1"

    const-string v30, "drawable"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mContext:Landroid/content/Context;

    move-object/from16 v31, v0

    invoke-virtual/range {v31 .. v31}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v31

    invoke-virtual/range {v28 .. v31}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v26

    .line 120
    .local v26, "resourceId":I
    move/from16 v0, v26

    invoke-virtual {v11, v0}, Landroid/widget/Button;->setBackgroundResource(I)V

    .line 122
    new-instance v28, Landroid/widget/Gallery$LayoutParams;

    const/16 v29, -0x1

    const/16 v30, -0x1

    invoke-direct/range {v28 .. v30}, Landroid/widget/Gallery$LayoutParams;-><init>(II)V

    move-object/from16 v0, v28

    invoke-virtual {v11, v0}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 123
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mWindowView:Landroid/widget/RelativeLayout;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    invoke-virtual {v0, v11}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 126
    sget-boolean v28, Lcom/miniclip/nativeJNI/cocojava;->mINGAME_LANDSCAPE:Z

    if-eqz v28, :cond_2

    .line 127
    new-instance v17, Landroid/widget/RelativeLayout$LayoutParams;

    const/high16 v28, 0x43d70000    # 430.0f

    mul-float v28, v28, v7

    move/from16 v0, v28

    float-to-int v0, v0

    move/from16 v28, v0

    const/high16 v29, 0x43570000    # 215.0f

    mul-float v29, v29, v7

    move/from16 v0, v29

    float-to-int v0, v0

    move/from16 v29, v0

    move-object/from16 v0, v17

    move/from16 v1, v28

    move/from16 v2, v29

    invoke-direct {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 130
    .local v17, "paramsContent1":Landroid/widget/RelativeLayout$LayoutParams;
    :goto_2
    const/16 v28, 0xd

    move-object/from16 v0, v17

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 131
    const/high16 v28, 0x42180000    # 38.0f

    mul-float v28, v28, v7

    move/from16 v0, v28

    float-to-int v12, v0

    .line 132
    .local v12, "margin2":I
    new-instance v28, Landroid/widget/RelativeLayout;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mContext:Landroid/content/Context;

    move-object/from16 v29, v0

    invoke-direct/range {v28 .. v29}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, v28

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/miniclip/newsfeed/NewsfeedDialog;->mContentView:Landroid/widget/RelativeLayout;

    .line 133
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mContentView:Landroid/widget/RelativeLayout;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 134
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mDialogView:Landroid/widget/RelativeLayout;

    move-object/from16 v28, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mContentView:Landroid/widget/RelativeLayout;

    move-object/from16 v29, v0

    invoke-virtual/range {v28 .. v29}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 136
    new-instance v23, Landroid/widget/RelativeLayout$LayoutParams;

    const/high16 v28, 0x425c0000    # 55.0f

    mul-float v28, v28, v7

    move/from16 v0, v28

    float-to-int v0, v0

    move/from16 v28, v0

    const/high16 v29, 0x425c0000    # 55.0f

    mul-float v29, v29, v7

    move/from16 v0, v29

    float-to-int v0, v0

    move/from16 v29, v0

    move-object/from16 v0, v23

    move/from16 v1, v28

    move/from16 v2, v29

    invoke-direct {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 137
    .local v23, "paramsRight1":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v28, 0xb

    move-object/from16 v0, v23

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 139
    new-instance v28, Landroid/widget/ImageView;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mContext:Landroid/content/Context;

    move-object/from16 v29, v0

    invoke-direct/range {v28 .. v29}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, v28

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/miniclip/newsfeed/NewsfeedDialog;->mCloseButton:Landroid/widget/ImageView;

    .line 140
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mContext:Landroid/content/Context;

    move-object/from16 v28, v0

    invoke-virtual/range {v28 .. v28}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v28

    const-string v29, "close_button"

    const-string v30, "drawable"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mContext:Landroid/content/Context;

    move-object/from16 v31, v0

    invoke-virtual/range {v31 .. v31}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v31

    invoke-virtual/range {v28 .. v31}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v26

    .line 141
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mCloseButton:Landroid/widget/ImageView;

    move-object/from16 v28, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mContext:Landroid/content/Context;

    move-object/from16 v29, v0

    invoke-virtual/range {v29 .. v29}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v29

    move-object/from16 v0, v29

    move/from16 v1, v26

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v29

    invoke-virtual/range {v28 .. v29}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 142
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mCloseButton:Landroid/widget/ImageView;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 143
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mDialogView:Landroid/widget/RelativeLayout;

    move-object/from16 v28, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mCloseButton:Landroid/widget/ImageView;

    move-object/from16 v29, v0

    invoke-virtual/range {v28 .. v29}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 144
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mCloseButton:Landroid/widget/ImageView;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 146
    const/16 v28, 0x0

    move/from16 v0, v28

    move-object/from16 v1, p0

    iput v0, v1, Lcom/miniclip/newsfeed/NewsfeedDialog;->mCurNews:I

    .line 147
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/miniclip/newsfeed/NewsfeedDialog;->mNewsfeed:Lcom/miniclip/newsfeed/Newsfeed;

    .line 148
    if-nez p3, :cond_3

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mNewsfeed:Lcom/miniclip/newsfeed/Newsfeed;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    iget v0, v0, Lcom/miniclip/newsfeed/Newsfeed;->messagesNum:I

    move/from16 v28, v0

    const/16 v29, 0x1

    move/from16 v0, v28

    move/from16 v1, v29

    if-ge v0, v1, :cond_3

    .line 150
    const-string v28, "Newsfeed"

    const-string v29, "0 messages"

    invoke-static/range {v28 .. v29}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 241
    :goto_3
    return-void

    .line 101
    .end local v11    # "i":Landroid/widget/Button;
    .end local v12    # "margin2":I
    .end local v17    # "paramsContent1":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v19    # "paramsFull2":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v20    # "paramsFull3":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v23    # "paramsRight1":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v26    # "resourceId":I
    :cond_0
    new-instance v19, Landroid/widget/RelativeLayout$LayoutParams;

    const/high16 v28, 0x43a00000    # 320.0f

    mul-float v28, v28, v7

    move/from16 v0, v28

    float-to-int v0, v0

    move/from16 v28, v0

    const/high16 v29, 0x43dc0000    # 440.0f

    mul-float v29, v29, v7

    move/from16 v0, v29

    float-to-int v0, v0

    move/from16 v29, v0

    move-object/from16 v0, v19

    move/from16 v1, v28

    move/from16 v2, v29

    invoke-direct {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .restart local v19    # "paramsFull2":Landroid/widget/RelativeLayout$LayoutParams;
    goto/16 :goto_0

    .line 111
    :cond_1
    new-instance v20, Landroid/widget/RelativeLayout$LayoutParams;

    const/high16 v28, 0x438c0000    # 280.0f

    mul-float v28, v28, v7

    move/from16 v0, v28

    float-to-int v0, v0

    move/from16 v28, v0

    const/high16 v29, 0x43be0000    # 380.0f

    mul-float v29, v29, v7

    move/from16 v0, v29

    float-to-int v0, v0

    move/from16 v29, v0

    move-object/from16 v0, v20

    move/from16 v1, v28

    move/from16 v2, v29

    invoke-direct {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .restart local v20    # "paramsFull3":Landroid/widget/RelativeLayout$LayoutParams;
    goto/16 :goto_1

    .line 129
    .restart local v11    # "i":Landroid/widget/Button;
    .restart local v26    # "resourceId":I
    :cond_2
    new-instance v17, Landroid/widget/RelativeLayout$LayoutParams;

    const/high16 v28, 0x43820000    # 260.0f

    mul-float v28, v28, v7

    move/from16 v0, v28

    float-to-int v0, v0

    move/from16 v28, v0

    const/high16 v29, 0x43a50000    # 330.0f

    mul-float v29, v29, v7

    move/from16 v0, v29

    float-to-int v0, v0

    move/from16 v29, v0

    move-object/from16 v0, v17

    move/from16 v1, v28

    move/from16 v2, v29

    invoke-direct {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .restart local v17    # "paramsContent1":Landroid/widget/RelativeLayout$LayoutParams;
    goto/16 :goto_2

    .line 153
    .restart local v12    # "margin2":I
    .restart local v23    # "paramsRight1":Landroid/widget/RelativeLayout$LayoutParams;
    :cond_3
    const/16 v28, 0x1

    move/from16 v0, p3

    move/from16 v1, v28

    if-ne v0, v1, :cond_4

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mNewsfeed:Lcom/miniclip/newsfeed/Newsfeed;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    iget v0, v0, Lcom/miniclip/newsfeed/Newsfeed;->messagesNumUrgent:I

    move/from16 v28, v0

    const/16 v29, 0x1

    move/from16 v0, v28

    move/from16 v1, v29

    if-ge v0, v1, :cond_4

    .line 155
    const-string v28, "Newsfeed"

    const-string v29, "0 urgent messages"

    invoke-static/range {v28 .. v29}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_3

    .line 159
    :cond_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mNewsfeed:Lcom/miniclip/newsfeed/Newsfeed;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    iget v0, v0, Lcom/miniclip/newsfeed/Newsfeed;->messagesNumUrgent:I

    move/from16 v28, v0

    move/from16 v0, v28

    move-object/from16 v1, p0

    iput v0, v1, Lcom/miniclip/newsfeed/NewsfeedDialog;->localUrgentNewsNum:I

    .line 165
    new-instance v28, Lcom/miniclip/newsfeed/NewsfeedDialog$URLImageView;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mContext:Landroid/content/Context;

    move-object/from16 v29, v0

    move-object/from16 v0, v28

    move-object/from16 v1, p0

    move-object/from16 v2, v29

    invoke-direct {v0, v1, v2}, Lcom/miniclip/newsfeed/NewsfeedDialog$URLImageView;-><init>(Lcom/miniclip/newsfeed/NewsfeedDialog;Landroid/content/Context;)V

    move-object/from16 v0, v28

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/miniclip/newsfeed/NewsfeedDialog;->mImageView:Lcom/miniclip/newsfeed/NewsfeedDialog$URLImageView;

    .line 166
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mImageView:Lcom/miniclip/newsfeed/NewsfeedDialog$URLImageView;

    move-object/from16 v28, v0

    new-instance v29, Landroid/widget/RelativeLayout$LayoutParams;

    const/16 v30, -0x1

    const/16 v31, -0x1

    invoke-direct/range {v29 .. v31}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    invoke-virtual/range {v28 .. v29}, Lcom/miniclip/newsfeed/NewsfeedDialog$URLImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 167
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mImageView:Lcom/miniclip/newsfeed/NewsfeedDialog$URLImageView;

    move-object/from16 v28, v0

    sget-object v29, Landroid/widget/ImageView$ScaleType;->FIT_XY:Landroid/widget/ImageView$ScaleType;

    invoke-virtual/range {v28 .. v29}, Lcom/miniclip/newsfeed/NewsfeedDialog$URLImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 168
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mContentView:Landroid/widget/RelativeLayout;

    move-object/from16 v28, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mImageView:Lcom/miniclip/newsfeed/NewsfeedDialog$URLImageView;

    move-object/from16 v29, v0

    invoke-virtual/range {v28 .. v29}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 170
    new-instance v25, Landroid/widget/RelativeLayout$LayoutParams;

    const/16 v28, -0x1

    const/16 v29, -0x1

    move-object/from16 v0, v25

    move/from16 v1, v28

    move/from16 v2, v29

    invoke-direct {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 171
    .local v25, "paramsWeb2":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v28, 0xe

    move-object/from16 v0, v25

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 172
    new-instance v28, Landroid/widget/RelativeLayout;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mContext:Landroid/content/Context;

    move-object/from16 v29, v0

    invoke-direct/range {v28 .. v29}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, v28

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/miniclip/newsfeed/NewsfeedDialog;->mWebCover1:Landroid/widget/RelativeLayout;

    .line 173
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mWebCover1:Landroid/widget/RelativeLayout;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 174
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mWebCover1:Landroid/widget/RelativeLayout;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 177
    const-string v10, ""

    .line 178
    .local v10, "htmlContent":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mUrgent:Z

    move/from16 v28, v0

    if-eqz v28, :cond_7

    .line 179
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mNewsfeed:Lcom/miniclip/newsfeed/Newsfeed;

    move-object/from16 v28, v0

    const/16 v29, 0x0

    const/16 v30, 0x1

    invoke-virtual/range {v28 .. v30}, Lcom/miniclip/newsfeed/Newsfeed;->getHTML(IZ)Ljava/lang/String;

    move-result-object v10

    .line 185
    :goto_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mImageView:Lcom/miniclip/newsfeed/NewsfeedDialog$URLImageView;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    invoke-virtual {v0, v10}, Lcom/miniclip/newsfeed/NewsfeedDialog$URLImageView;->loadFromURL(Ljava/lang/String;)Z

    .line 187
    sub-int v28, v27, v12

    sub-int v6, v28, v12

    .line 188
    .local v6, "bWidth":I
    int-to-float v0, v6

    move/from16 v28, v0

    const/high16 v29, 0x43960000    # 300.0f

    mul-float v29, v29, v7

    cmpl-float v28, v28, v29

    if-lez v28, :cond_5

    .line 189
    const/high16 v28, 0x43960000    # 300.0f

    mul-float v28, v28, v7

    move/from16 v0, v28

    float-to-int v6, v0

    .line 190
    :cond_5
    const/high16 v5, 0x3f800000    # 1.0f

    .line 191
    .local v5, "bScale":F
    const v28, 0x44058000    # 534.0f

    mul-float v28, v28, v7

    move/from16 v0, v28

    float-to-int v0, v0

    move/from16 v28, v0

    move/from16 v0, v28

    if-le v0, v6, :cond_6

    .line 192
    int-to-float v0, v6

    move/from16 v28, v0

    const v29, 0x44058000    # 534.0f

    mul-float v29, v29, v7

    div-float v5, v28, v29

    .line 193
    :cond_6
    new-instance v16, Landroid/widget/RelativeLayout$LayoutParams;

    const v28, 0x44058000    # 534.0f

    mul-float v29, v7, v5

    mul-float v28, v28, v29

    move/from16 v0, v28

    float-to-int v0, v0

    move/from16 v28, v0

    const/high16 v29, 0x42700000    # 60.0f

    mul-float v30, v7, v5

    mul-float v29, v29, v30

    move/from16 v0, v29

    float-to-int v0, v0

    move/from16 v29, v0

    add-int v28, v28, v29

    const/high16 v29, 0x42920000    # 73.0f

    mul-float v30, v7, v5

    mul-float v29, v29, v30

    move/from16 v0, v29

    float-to-int v0, v0

    move/from16 v29, v0

    const/high16 v30, 0x420c0000    # 35.0f

    mul-float v31, v7, v5

    mul-float v30, v30, v31

    move/from16 v0, v30

    float-to-int v0, v0

    move/from16 v30, v0

    add-int v29, v29, v30

    move-object/from16 v0, v16

    move/from16 v1, v28

    move/from16 v2, v29

    invoke-direct {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 194
    .local v16, "paramsCenter2":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v28, 0xe

    move-object/from16 v0, v16

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 195
    const/16 v28, 0xc

    move-object/from16 v0, v16

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 197
    new-instance v13, Landroid/widget/RelativeLayout;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mContext:Landroid/content/Context;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    invoke-direct {v13, v0}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 198
    .local v13, "navButtons":Landroid/widget/RelativeLayout;
    move-object/from16 v0, v16

    invoke-virtual {v13, v0}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 200
    new-instance v21, Landroid/widget/RelativeLayout$LayoutParams;

    const/high16 v28, 0x42e80000    # 116.0f

    mul-float v29, v7, v5

    mul-float v28, v28, v29

    move/from16 v0, v28

    float-to-int v0, v0

    move/from16 v28, v0

    const/high16 v29, 0x42920000    # 73.0f

    mul-float v30, v7, v5

    mul-float v29, v29, v30

    move/from16 v0, v29

    float-to-int v0, v0

    move/from16 v29, v0

    move-object/from16 v0, v21

    move/from16 v1, v28

    move/from16 v2, v29

    invoke-direct {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 201
    .local v21, "paramsLeft1":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v28, 0xf

    move-object/from16 v0, v21

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 203
    new-instance v28, Landroid/widget/ImageView;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mContext:Landroid/content/Context;

    move-object/from16 v29, v0

    invoke-direct/range {v28 .. v29}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, v28

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/miniclip/newsfeed/NewsfeedDialog;->mLeftButton1:Landroid/widget/ImageView;

    .line 204
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mContext:Landroid/content/Context;

    move-object/from16 v28, v0

    invoke-virtual/range {v28 .. v28}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v28

    const-string v29, "left_button"

    const-string v30, "drawable"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mContext:Landroid/content/Context;

    move-object/from16 v31, v0

    invoke-virtual/range {v31 .. v31}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v31

    invoke-virtual/range {v28 .. v31}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v26

    .line 205
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mLeftButton1:Landroid/widget/ImageView;

    move-object/from16 v28, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mContext:Landroid/content/Context;

    move-object/from16 v29, v0

    invoke-virtual/range {v29 .. v29}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v29

    move-object/from16 v0, v29

    move/from16 v1, v26

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v29

    invoke-virtual/range {v28 .. v29}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 206
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mLeftButton1:Landroid/widget/ImageView;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 207
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mLeftButton1:Landroid/widget/ImageView;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    invoke-virtual {v13, v0}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 208
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mLeftButton1:Landroid/widget/ImageView;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 210
    new-instance v15, Landroid/widget/RelativeLayout$LayoutParams;

    const/high16 v28, 0x43970000    # 302.0f

    mul-float v29, v7, v5

    mul-float v28, v28, v29

    move/from16 v0, v28

    float-to-int v0, v0

    move/from16 v28, v0

    const/high16 v29, 0x42920000    # 73.0f

    mul-float v30, v7, v5

    mul-float v29, v29, v30

    move/from16 v0, v29

    float-to-int v0, v0

    move/from16 v29, v0

    move/from16 v0, v28

    move/from16 v1, v29

    invoke-direct {v15, v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 211
    .local v15, "paramsCenter1":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v28, 0xe

    move/from16 v0, v28

    invoke-virtual {v15, v0}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 212
    const/16 v28, 0xf

    move/from16 v0, v28

    invoke-virtual {v15, v0}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 213
    new-instance v28, Landroid/widget/ImageView;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mContext:Landroid/content/Context;

    move-object/from16 v29, v0

    invoke-direct/range {v28 .. v29}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, v28

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/miniclip/newsfeed/NewsfeedDialog;->mGotoButton1:Landroid/widget/ImageView;

    .line 214
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mContext:Landroid/content/Context;

    move-object/from16 v28, v0

    invoke-virtual/range {v28 .. v28}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v28

    const-string v29, "get_it_now_button"

    const-string v30, "drawable"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mContext:Landroid/content/Context;

    move-object/from16 v31, v0

    invoke-virtual/range {v31 .. v31}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v31

    invoke-virtual/range {v28 .. v31}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v26

    .line 215
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mGotoButton1:Landroid/widget/ImageView;

    move-object/from16 v28, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mContext:Landroid/content/Context;

    move-object/from16 v29, v0

    invoke-virtual/range {v29 .. v29}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v29

    move-object/from16 v0, v29

    move/from16 v1, v26

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v29

    invoke-virtual/range {v28 .. v29}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 216
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mGotoButton1:Landroid/widget/ImageView;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    invoke-virtual {v0, v15}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 217
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mGotoButton1:Landroid/widget/ImageView;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    invoke-virtual {v13, v0}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 218
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mGotoButton1:Landroid/widget/ImageView;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 220
    new-instance v24, Landroid/widget/RelativeLayout$LayoutParams;

    const-wide/high16 v28, 0x405d000000000000L    # 116.0

    mul-float v30, v7, v5

    move/from16 v0, v30

    float-to-double v0, v0

    move-wide/from16 v30, v0

    mul-double v28, v28, v30

    move-wide/from16 v0, v28

    double-to-int v0, v0

    move/from16 v28, v0

    const-wide v29, 0x4052400000000000L    # 73.0

    mul-float v31, v7, v5

    move/from16 v0, v31

    float-to-double v0, v0

    move-wide/from16 v31, v0

    mul-double v29, v29, v31

    move-wide/from16 v0, v29

    double-to-int v0, v0

    move/from16 v29, v0

    move-object/from16 v0, v24

    move/from16 v1, v28

    move/from16 v2, v29

    invoke-direct {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 221
    .local v24, "paramsRight2":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v28, 0xb

    move-object/from16 v0, v24

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 222
    const/16 v28, 0xf

    move-object/from16 v0, v24

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 224
    new-instance v28, Landroid/widget/ImageView;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mContext:Landroid/content/Context;

    move-object/from16 v29, v0

    invoke-direct/range {v28 .. v29}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, v28

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/miniclip/newsfeed/NewsfeedDialog;->mRightButton1:Landroid/widget/ImageView;

    .line 225
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mContext:Landroid/content/Context;

    move-object/from16 v28, v0

    invoke-virtual/range {v28 .. v28}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v28

    const-string v29, "right_button"

    const-string v30, "drawable"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mContext:Landroid/content/Context;

    move-object/from16 v31, v0

    invoke-virtual/range {v31 .. v31}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v31

    invoke-virtual/range {v28 .. v31}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v26

    .line 226
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mRightButton1:Landroid/widget/ImageView;

    move-object/from16 v28, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mContext:Landroid/content/Context;

    move-object/from16 v29, v0

    invoke-virtual/range {v29 .. v29}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v29

    move-object/from16 v0, v29

    move/from16 v1, v26

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v29

    invoke-virtual/range {v28 .. v29}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 227
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mRightButton1:Landroid/widget/ImageView;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 228
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mRightButton1:Landroid/widget/ImageView;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    invoke-virtual {v13, v0}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 229
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mRightButton1:Landroid/widget/ImageView;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 231
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mDialogView:Landroid/widget/RelativeLayout;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    invoke-virtual {v0, v13}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 233
    new-instance v22, Landroid/widget/RelativeLayout$LayoutParams;

    const/high16 v28, 0x42fc0000    # 126.0f

    mul-float v28, v28, v7

    move/from16 v0, v28

    float-to-int v0, v0

    move/from16 v28, v0

    const/high16 v29, 0x42480000    # 50.0f

    mul-float v29, v29, v7

    move/from16 v0, v29

    float-to-int v0, v0

    move/from16 v29, v0

    move-object/from16 v0, v22

    move/from16 v1, v28

    move/from16 v2, v29

    invoke-direct {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 234
    .local v22, "paramsNews1":Landroid/widget/RelativeLayout$LayoutParams;
    const/high16 v28, 0x425c0000    # 55.0f

    mul-float v28, v28, v7

    move/from16 v0, v28

    float-to-int v0, v0

    move/from16 v28, v0

    const/16 v29, 0x0

    const/16 v30, 0x0

    const/16 v31, 0x0

    move-object/from16 v0, v22

    move/from16 v1, v28

    move/from16 v2, v29

    move/from16 v3, v30

    move/from16 v4, v31

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/widget/RelativeLayout$LayoutParams;->setMargins(IIII)V

    .line 236
    new-instance v14, Landroid/widget/ImageView;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mContext:Landroid/content/Context;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    invoke-direct {v14, v0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 237
    .local v14, "newsImg1":Landroid/widget/ImageView;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mContext:Landroid/content/Context;

    move-object/from16 v28, v0

    invoke-virtual/range {v28 .. v28}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v28

    const-string v29, "news"

    const-string v30, "drawable"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mContext:Landroid/content/Context;

    move-object/from16 v31, v0

    invoke-virtual/range {v31 .. v31}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v31

    invoke-virtual/range {v28 .. v31}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v26

    .line 238
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mContext:Landroid/content/Context;

    move-object/from16 v28, v0

    invoke-virtual/range {v28 .. v28}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v28

    move-object/from16 v0, v28

    move/from16 v1, v26

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v28

    move-object/from16 v0, v28

    invoke-virtual {v14, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 239
    move-object/from16 v0, v22

    invoke-virtual {v14, v0}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 240
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mDialogView:Landroid/widget/RelativeLayout;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    invoke-virtual {v0, v14}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    goto/16 :goto_3

    .line 181
    .end local v5    # "bScale":F
    .end local v6    # "bWidth":I
    .end local v13    # "navButtons":Landroid/widget/RelativeLayout;
    .end local v14    # "newsImg1":Landroid/widget/ImageView;
    .end local v15    # "paramsCenter1":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v16    # "paramsCenter2":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v21    # "paramsLeft1":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v22    # "paramsNews1":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v24    # "paramsRight2":Landroid/widget/RelativeLayout$LayoutParams;
    :cond_7
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mNewsfeed:Lcom/miniclip/newsfeed/Newsfeed;

    move-object/from16 v28, v0

    const/16 v29, 0x0

    const/16 v30, 0x0

    invoke-virtual/range {v28 .. v30}, Lcom/miniclip/newsfeed/Newsfeed;->getHTML(IZ)Ljava/lang/String;

    move-result-object v10

    goto/16 :goto_4
.end method

.method static synthetic access$000(Lcom/miniclip/newsfeed/NewsfeedDialog;)Landroid/widget/ImageView;
    .locals 1
    .param p0, "x0"    # Lcom/miniclip/newsfeed/NewsfeedDialog;

    .prologue
    .line 31
    iget-object v0, p0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mLeftButton1:Landroid/widget/ImageView;

    return-object v0
.end method

.method static synthetic access$100(Lcom/miniclip/newsfeed/NewsfeedDialog;)Landroid/widget/ImageView;
    .locals 1
    .param p0, "x0"    # Lcom/miniclip/newsfeed/NewsfeedDialog;

    .prologue
    .line 31
    iget-object v0, p0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mRightButton1:Landroid/widget/ImageView;

    return-object v0
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 12
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const-wide/16 v10, 0xc8

    const/16 v6, 0x64

    const/4 v9, 0x1

    const/4 v8, -0x1

    const/4 v7, 0x0

    .line 254
    iget-object v5, p0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mCloseButton:Landroid/widget/ImageView;

    if-ne p1, v5, :cond_1

    .line 256
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->NF_dismissBoard()V

    .line 364
    :cond_0
    :goto_0
    return-void

    .line 258
    :cond_1
    iget-object v5, p0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mLeftButton1:Landroid/widget/ImageView;

    if-ne p1, v5, :cond_7

    .line 260
    iget-object v5, p0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mNewsfeed:Lcom/miniclip/newsfeed/Newsfeed;

    iget v2, v5, Lcom/miniclip/newsfeed/Newsfeed;->messagesNum:I

    .line 261
    .local v2, "messageNumCur":I
    iget-boolean v5, p0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mUrgent:Z

    if-eqz v5, :cond_2

    .line 262
    iget v2, p0, Lcom/miniclip/newsfeed/NewsfeedDialog;->localUrgentNewsNum:I

    .line 264
    :cond_2
    iget v5, p0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mCurNews:I

    if-lez v5, :cond_5

    .line 265
    iget v5, p0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mCurNews:I

    add-int/lit8 v5, v5, -0x1

    iput v5, p0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mCurNews:I

    .line 269
    :goto_1
    iget v5, p0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mCurNews:I

    if-gez v5, :cond_3

    .line 270
    iput v7, p0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mCurNews:I

    .line 272
    :cond_3
    iget-object v5, p0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mLeftButton1:Landroid/widget/ImageView;

    invoke-virtual {v5, v6}, Landroid/widget/ImageView;->setAlpha(I)V

    .line 274
    iget-boolean v5, p0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mUrgent:Z

    if-eqz v5, :cond_6

    .line 275
    iget-object v5, p0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mNewsfeed:Lcom/miniclip/newsfeed/Newsfeed;

    iget v6, p0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mCurNews:I

    invoke-virtual {v5, v6, v9}, Lcom/miniclip/newsfeed/Newsfeed;->getHTML(IZ)Ljava/lang/String;

    move-result-object v0

    .line 280
    .local v0, "htmlContent":Ljava/lang/String;
    :goto_2
    const-string v5, "NewsFeed"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "html content is"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 289
    iget-object v5, p0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mImageView:Lcom/miniclip/newsfeed/NewsfeedDialog$URLImageView;

    if-eqz v5, :cond_4

    .line 290
    iget-object v5, p0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mContentView:Landroid/widget/RelativeLayout;

    iget-object v6, p0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mImageView:Lcom/miniclip/newsfeed/NewsfeedDialog$URLImageView;

    invoke-virtual {v5, v6}, Landroid/widget/RelativeLayout;->removeView(Landroid/view/View;)V

    .line 291
    :cond_4
    new-instance v5, Lcom/miniclip/newsfeed/NewsfeedDialog$URLImageView;

    iget-object v6, p0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mContext:Landroid/content/Context;

    invoke-direct {v5, p0, v6}, Lcom/miniclip/newsfeed/NewsfeedDialog$URLImageView;-><init>(Lcom/miniclip/newsfeed/NewsfeedDialog;Landroid/content/Context;)V

    iput-object v5, p0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mImageView:Lcom/miniclip/newsfeed/NewsfeedDialog$URLImageView;

    .line 292
    iget-object v5, p0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mImageView:Lcom/miniclip/newsfeed/NewsfeedDialog$URLImageView;

    new-instance v6, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v6, v8, v8}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v5, v6}, Lcom/miniclip/newsfeed/NewsfeedDialog$URLImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 293
    iget-object v5, p0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mImageView:Lcom/miniclip/newsfeed/NewsfeedDialog$URLImageView;

    sget-object v6, Landroid/widget/ImageView$ScaleType;->FIT_XY:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v5, v6}, Lcom/miniclip/newsfeed/NewsfeedDialog$URLImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 294
    iget-object v5, p0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mImageView:Lcom/miniclip/newsfeed/NewsfeedDialog$URLImageView;

    invoke-virtual {v5, v0}, Lcom/miniclip/newsfeed/NewsfeedDialog$URLImageView;->loadFromURL(Ljava/lang/String;)Z

    .line 295
    iget-object v5, p0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mContentView:Landroid/widget/RelativeLayout;

    iget-object v6, p0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mImageView:Lcom/miniclip/newsfeed/NewsfeedDialog$URLImageView;

    invoke-virtual {v5, v6}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 297
    iget-object v5, p0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mHandler:Landroid/os/Handler;

    iget-object v6, p0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mResetEffests:Ljava/lang/Runnable;

    invoke-virtual {v5, v6}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 298
    iget-object v5, p0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mHandler:Landroid/os/Handler;

    iget-object v6, p0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mResetEffests:Ljava/lang/Runnable;

    invoke-virtual {v5, v6, v10, v11}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto/16 :goto_0

    .line 267
    .end local v0    # "htmlContent":Ljava/lang/String;
    :cond_5
    add-int/lit8 v5, v2, -0x1

    iput v5, p0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mCurNews:I

    goto :goto_1

    .line 277
    :cond_6
    iget-object v5, p0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mNewsfeed:Lcom/miniclip/newsfeed/Newsfeed;

    iget v6, p0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mCurNews:I

    invoke-virtual {v5, v6, v7}, Lcom/miniclip/newsfeed/Newsfeed;->getHTML(IZ)Ljava/lang/String;

    move-result-object v0

    .restart local v0    # "htmlContent":Ljava/lang/String;
    goto :goto_2

    .line 300
    .end local v0    # "htmlContent":Ljava/lang/String;
    .end local v2    # "messageNumCur":I
    :cond_7
    iget-object v5, p0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mRightButton1:Landroid/widget/ImageView;

    if-ne p1, v5, :cond_c

    .line 302
    iget-object v5, p0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mNewsfeed:Lcom/miniclip/newsfeed/Newsfeed;

    iget v2, v5, Lcom/miniclip/newsfeed/Newsfeed;->messagesNum:I

    .line 303
    .restart local v2    # "messageNumCur":I
    iget-boolean v5, p0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mUrgent:Z

    if-eqz v5, :cond_8

    .line 304
    iget v2, p0, Lcom/miniclip/newsfeed/NewsfeedDialog;->localUrgentNewsNum:I

    .line 306
    :cond_8
    iget v5, p0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mCurNews:I

    add-int/lit8 v5, v5, 0x1

    if-ge v5, v2, :cond_a

    .line 307
    iget v5, p0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mCurNews:I

    add-int/lit8 v5, v5, 0x1

    iput v5, p0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mCurNews:I

    .line 311
    :goto_3
    iget-object v5, p0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mRightButton1:Landroid/widget/ImageView;

    invoke-virtual {v5, v6}, Landroid/widget/ImageView;->setAlpha(I)V

    .line 313
    iget-boolean v5, p0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mUrgent:Z

    if-eqz v5, :cond_b

    .line 314
    iget-object v5, p0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mNewsfeed:Lcom/miniclip/newsfeed/Newsfeed;

    iget v6, p0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mCurNews:I

    invoke-virtual {v5, v6, v9}, Lcom/miniclip/newsfeed/Newsfeed;->getHTML(IZ)Ljava/lang/String;

    move-result-object v0

    .line 319
    .restart local v0    # "htmlContent":Ljava/lang/String;
    :goto_4
    const-string v5, "NewsFeed"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "html content is"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 328
    iget-object v5, p0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mImageView:Lcom/miniclip/newsfeed/NewsfeedDialog$URLImageView;

    if-eqz v5, :cond_9

    .line 329
    iget-object v5, p0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mContentView:Landroid/widget/RelativeLayout;

    iget-object v6, p0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mImageView:Lcom/miniclip/newsfeed/NewsfeedDialog$URLImageView;

    invoke-virtual {v5, v6}, Landroid/widget/RelativeLayout;->removeView(Landroid/view/View;)V

    .line 330
    :cond_9
    new-instance v5, Lcom/miniclip/newsfeed/NewsfeedDialog$URLImageView;

    iget-object v6, p0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mContext:Landroid/content/Context;

    invoke-direct {v5, p0, v6}, Lcom/miniclip/newsfeed/NewsfeedDialog$URLImageView;-><init>(Lcom/miniclip/newsfeed/NewsfeedDialog;Landroid/content/Context;)V

    iput-object v5, p0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mImageView:Lcom/miniclip/newsfeed/NewsfeedDialog$URLImageView;

    .line 331
    iget-object v5, p0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mImageView:Lcom/miniclip/newsfeed/NewsfeedDialog$URLImageView;

    new-instance v6, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v6, v8, v8}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v5, v6}, Lcom/miniclip/newsfeed/NewsfeedDialog$URLImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 332
    iget-object v5, p0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mImageView:Lcom/miniclip/newsfeed/NewsfeedDialog$URLImageView;

    sget-object v6, Landroid/widget/ImageView$ScaleType;->FIT_XY:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v5, v6}, Lcom/miniclip/newsfeed/NewsfeedDialog$URLImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 333
    iget-object v5, p0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mImageView:Lcom/miniclip/newsfeed/NewsfeedDialog$URLImageView;

    invoke-virtual {v5, v0}, Lcom/miniclip/newsfeed/NewsfeedDialog$URLImageView;->loadFromURL(Ljava/lang/String;)Z

    .line 334
    iget-object v5, p0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mContentView:Landroid/widget/RelativeLayout;

    iget-object v6, p0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mImageView:Lcom/miniclip/newsfeed/NewsfeedDialog$URLImageView;

    invoke-virtual {v5, v6}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 336
    iget-object v5, p0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mHandler:Landroid/os/Handler;

    iget-object v6, p0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mResetEffests:Ljava/lang/Runnable;

    invoke-virtual {v5, v6}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 337
    iget-object v5, p0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mHandler:Landroid/os/Handler;

    iget-object v6, p0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mResetEffests:Ljava/lang/Runnable;

    invoke-virtual {v5, v6, v10, v11}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto/16 :goto_0

    .line 309
    .end local v0    # "htmlContent":Ljava/lang/String;
    :cond_a
    iput v7, p0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mCurNews:I

    goto :goto_3

    .line 316
    :cond_b
    iget-object v5, p0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mNewsfeed:Lcom/miniclip/newsfeed/Newsfeed;

    iget v6, p0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mCurNews:I

    invoke-virtual {v5, v6, v7}, Lcom/miniclip/newsfeed/Newsfeed;->getHTML(IZ)Ljava/lang/String;

    move-result-object v0

    .restart local v0    # "htmlContent":Ljava/lang/String;
    goto :goto_4

    .line 339
    .end local v0    # "htmlContent":Ljava/lang/String;
    .end local v2    # "messageNumCur":I
    :cond_c
    iget-object v5, p0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mGotoButton1:Landroid/widget/ImageView;

    if-eq p1, v5, :cond_d

    iget-object v5, p0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mWebCover1:Landroid/widget/RelativeLayout;

    if-ne p1, v5, :cond_0

    .line 341
    :cond_d
    iget-object v5, p0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mCloseButton:Landroid/widget/ImageView;

    invoke-virtual {v5, v6}, Landroid/widget/ImageView;->setAlpha(I)V

    .line 343
    iget-boolean v5, p0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mUrgent:Z

    if-eqz v5, :cond_e

    .line 345
    iget-object v5, p0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mNewsfeed:Lcom/miniclip/newsfeed/Newsfeed;

    iget v6, p0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mCurNews:I

    invoke-virtual {v5, v6, v9}, Lcom/miniclip/newsfeed/Newsfeed;->setClicked(IZ)V

    .line 346
    iget-object v5, p0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mNewsfeed:Lcom/miniclip/newsfeed/Newsfeed;

    iget v6, p0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mCurNews:I

    invoke-virtual {v5, v6, v9}, Lcom/miniclip/newsfeed/Newsfeed;->getLink(IZ)Ljava/lang/String;

    move-result-object v4

    .line 354
    .local v4, "url":Ljava/lang/String;
    :goto_5
    if-eqz v4, :cond_0

    const-string v5, ""

    if-eq v4, v5, :cond_0

    .line 355
    const-string v5, "Newsfeed"

    invoke-static {v5, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 356
    invoke-static {v4}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    .line 357
    .local v3, "uriUrl":Landroid/net/Uri;
    if-eqz v3, :cond_0

    .line 359
    new-instance v1, Landroid/content/Intent;

    const-string v5, "android.intent.action.VIEW"

    invoke-direct {v1, v5, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 360
    .local v1, "launchBrowser":Landroid/content/Intent;
    iget-object v5, p0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mContext:Landroid/content/Context;

    invoke-virtual {v5, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_0

    .line 350
    .end local v1    # "launchBrowser":Landroid/content/Intent;
    .end local v3    # "uriUrl":Landroid/net/Uri;
    .end local v4    # "url":Ljava/lang/String;
    :cond_e
    iget-object v5, p0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mNewsfeed:Lcom/miniclip/newsfeed/Newsfeed;

    iget v6, p0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mCurNews:I

    invoke-virtual {v5, v6, v7}, Lcom/miniclip/newsfeed/Newsfeed;->setClicked(IZ)V

    .line 351
    iget-object v5, p0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mNewsfeed:Lcom/miniclip/newsfeed/Newsfeed;

    iget v6, p0, Lcom/miniclip/newsfeed/NewsfeedDialog;->mCurNews:I

    invoke-virtual {v5, v6, v7}, Lcom/miniclip/newsfeed/Newsfeed;->getLink(IZ)Ljava/lang/String;

    move-result-object v4

    .restart local v4    # "url":Ljava/lang/String;
    goto :goto_5
.end method
