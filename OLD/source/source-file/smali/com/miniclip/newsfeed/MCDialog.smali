.class public Lcom/miniclip/newsfeed/MCDialog;
.super Landroid/widget/RelativeLayout;
.source "MCDialog.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field protected mCloseButton:Landroid/widget/ImageView;

.field protected mContentView:Landroid/widget/RelativeLayout;

.field protected mContext:Landroid/content/Context;

.field private mDialogView:Landroid/widget/RelativeLayout;

.field protected mFullView:Landroid/widget/RelativeLayout;

.field protected mWindowView:Landroid/widget/RelativeLayout;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 17
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 25
    invoke-direct/range {p0 .. p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 26
    move-object/from16 v0, p1

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/miniclip/newsfeed/MCDialog;->mContext:Landroid/content/Context;

    .line 28
    new-instance v6, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v12, -0x1

    const/4 v13, -0x1

    invoke-direct {v6, v12, v13}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 29
    .local v6, "paramsFull1":Landroid/widget/RelativeLayout$LayoutParams;
    new-instance v12, Landroid/widget/RelativeLayout;

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/miniclip/newsfeed/MCDialog;->mContext:Landroid/content/Context;

    invoke-direct {v12, v13}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, p0

    iput-object v12, v0, Lcom/miniclip/newsfeed/MCDialog;->mFullView:Landroid/widget/RelativeLayout;

    .line 30
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/miniclip/newsfeed/MCDialog;->mFullView:Landroid/widget/RelativeLayout;

    invoke-virtual {v12, v6}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 31
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/miniclip/newsfeed/MCDialog;->mFullView:Landroid/widget/RelativeLayout;

    move-object/from16 v0, p0

    invoke-virtual {v12, v0}, Landroid/widget/RelativeLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 33
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/miniclip/newsfeed/MCDialog;->mFullView:Landroid/widget/RelativeLayout;

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/miniclip/newsfeed/MCDialog;->addView(Landroid/view/View;)V

    .line 35
    new-instance v7, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v12, -0x1

    const/4 v13, -0x1

    invoke-direct {v7, v12, v13}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 36
    .local v7, "paramsFull2":Landroid/widget/RelativeLayout$LayoutParams;
    new-instance v12, Landroid/widget/RelativeLayout;

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/miniclip/newsfeed/MCDialog;->mContext:Landroid/content/Context;

    invoke-direct {v12, v13}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, p0

    iput-object v12, v0, Lcom/miniclip/newsfeed/MCDialog;->mDialogView:Landroid/widget/RelativeLayout;

    .line 37
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/miniclip/newsfeed/MCDialog;->mDialogView:Landroid/widget/RelativeLayout;

    invoke-virtual {v12, v7}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 39
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/miniclip/newsfeed/MCDialog;->mFullView:Landroid/widget/RelativeLayout;

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/miniclip/newsfeed/MCDialog;->mDialogView:Landroid/widget/RelativeLayout;

    invoke-virtual {v12, v13}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 41
    new-instance v8, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v12, -0x1

    const/4 v13, -0x1

    invoke-direct {v8, v12, v13}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 42
    .local v8, "paramsFull3":Landroid/widget/RelativeLayout$LayoutParams;
    new-instance v12, Landroid/widget/RelativeLayout;

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/miniclip/newsfeed/MCDialog;->mContext:Landroid/content/Context;

    invoke-direct {v12, v13}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, p0

    iput-object v12, v0, Lcom/miniclip/newsfeed/MCDialog;->mWindowView:Landroid/widget/RelativeLayout;

    .line 43
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/miniclip/newsfeed/MCDialog;->mWindowView:Landroid/widget/RelativeLayout;

    invoke-virtual {v12, v8}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 45
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/miniclip/newsfeed/MCDialog;->mWindowView:Landroid/widget/RelativeLayout;

    const/16 v13, 0x19

    const/16 v14, 0x19

    const/16 v15, 0x19

    const/16 v16, 0xa

    invoke-virtual/range {v12 .. v16}, Landroid/widget/RelativeLayout;->setPadding(IIII)V

    .line 46
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/miniclip/newsfeed/MCDialog;->mDialogView:Landroid/widget/RelativeLayout;

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/miniclip/newsfeed/MCDialog;->mWindowView:Landroid/widget/RelativeLayout;

    invoke-virtual {v12, v13}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 48
    new-instance v4, Landroid/widget/Button;

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/miniclip/newsfeed/MCDialog;->mContext:Landroid/content/Context;

    invoke-direct {v4, v12}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 50
    .local v4, "i":Landroid/widget/Button;
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/miniclip/newsfeed/MCDialog;->mContext:Landroid/content/Context;

    invoke-virtual {v12}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v12

    const-string v13, "full_dialog1"

    const-string v14, "drawable"

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/miniclip/newsfeed/MCDialog;->mContext:Landroid/content/Context;

    invoke-virtual {v15}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v12, v13, v14, v15}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v10

    .line 52
    .local v10, "resourceId":I
    invoke-virtual {v4, v10}, Landroid/widget/Button;->setBackgroundResource(I)V

    .line 54
    new-instance v12, Landroid/widget/Gallery$LayoutParams;

    const/4 v13, -0x1

    const/4 v14, -0x1

    invoke-direct {v12, v13, v14}, Landroid/widget/Gallery$LayoutParams;-><init>(II)V

    invoke-virtual {v4, v12}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 55
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/miniclip/newsfeed/MCDialog;->mWindowView:Landroid/widget/RelativeLayout;

    invoke-virtual {v12, v4}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 57
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/miniclip/newsfeed/MCDialog;->mContext:Landroid/content/Context;

    check-cast v12, Landroid/app/Activity;

    invoke-virtual {v12}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v12

    invoke-interface {v12}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v2

    .line 58
    .local v2, "display":Landroid/view/Display;
    invoke-virtual {v2}, Landroid/view/Display;->getWidth()I

    move-result v11

    .line 59
    .local v11, "width":I
    invoke-virtual {v2}, Landroid/view/Display;->getHeight()I

    move-result v3

    .line 61
    .local v3, "height":I
    new-instance v5, Landroid/widget/RelativeLayout$LayoutParams;

    add-int/lit8 v12, v11, -0x64

    add-int/lit8 v13, v3, -0x32

    invoke-direct {v5, v12, v13}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 62
    .local v5, "paramsContent1":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v12, 0xd

    invoke-virtual {v5, v12}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 63
    new-instance v12, Landroid/widget/RelativeLayout;

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/miniclip/newsfeed/MCDialog;->mContext:Landroid/content/Context;

    invoke-direct {v12, v13}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, p0

    iput-object v12, v0, Lcom/miniclip/newsfeed/MCDialog;->mContentView:Landroid/widget/RelativeLayout;

    .line 64
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/miniclip/newsfeed/MCDialog;->mContentView:Landroid/widget/RelativeLayout;

    invoke-virtual {v12, v5}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 66
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/miniclip/newsfeed/MCDialog;->mFullView:Landroid/widget/RelativeLayout;

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/miniclip/newsfeed/MCDialog;->mContentView:Landroid/widget/RelativeLayout;

    invoke-virtual {v12, v13}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 68
    new-instance v9, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v12, -0x2

    const/4 v13, -0x2

    invoke-direct {v9, v12, v13}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 69
    .local v9, "paramsRight1":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v12, 0xb

    invoke-virtual {v9, v12}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 70
    new-instance v12, Landroid/widget/ImageView;

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/miniclip/newsfeed/MCDialog;->mContext:Landroid/content/Context;

    invoke-direct {v12, v13}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, p0

    iput-object v12, v0, Lcom/miniclip/newsfeed/MCDialog;->mCloseButton:Landroid/widget/ImageView;

    .line 72
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/miniclip/newsfeed/MCDialog;->mContext:Landroid/content/Context;

    invoke-virtual {v12}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v12

    const-string v13, "close_button"

    const-string v14, "drawable"

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/miniclip/newsfeed/MCDialog;->mContext:Landroid/content/Context;

    invoke-virtual {v15}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v12, v13, v14, v15}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v10

    .line 75
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/miniclip/newsfeed/MCDialog;->mCloseButton:Landroid/widget/ImageView;

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/miniclip/newsfeed/MCDialog;->mContext:Landroid/content/Context;

    invoke-virtual {v13}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v13

    invoke-virtual {v13, v10}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v13

    invoke-virtual {v12, v13}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 76
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/miniclip/newsfeed/MCDialog;->mCloseButton:Landroid/widget/ImageView;

    invoke-virtual {v12, v9}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 77
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/miniclip/newsfeed/MCDialog;->mFullView:Landroid/widget/RelativeLayout;

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/miniclip/newsfeed/MCDialog;->mCloseButton:Landroid/widget/ImageView;

    invoke-virtual {v12, v13}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 78
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/miniclip/newsfeed/MCDialog;->mCloseButton:Landroid/widget/ImageView;

    move-object/from16 v0, p0

    invoke-virtual {v12, v0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 79
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 84
    iget-object v0, p0, Lcom/miniclip/newsfeed/MCDialog;->mCloseButton:Landroid/widget/ImageView;

    if-ne p1, v0, :cond_0

    .line 86
    invoke-virtual {p0}, Lcom/miniclip/newsfeed/MCDialog;->removeAllViews()V

    .line 88
    :cond_0
    return-void
.end method
