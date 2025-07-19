.class public Lcom/miniclip/nativeJNI/MiniclipUpsellView;
.super Lcom/miniclip/newsfeed/MCDialog;
.source "MiniclipUpsellView.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private mGameImage:Landroid/widget/ImageView;

.field private mGotoButton:Landroid/widget/ImageView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 12
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v11, -0x1

    .line 26
    invoke-direct {p0, p1}, Lcom/miniclip/newsfeed/MCDialog;-><init>(Landroid/content/Context;)V

    .line 28
    iget-object v7, p0, Lcom/miniclip/nativeJNI/MiniclipUpsellView;->mContext:Landroid/content/Context;

    check-cast v7, Landroid/app/Activity;

    invoke-virtual {v7}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v7

    invoke-interface {v7}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    .line 29
    .local v0, "display":Landroid/view/Display;
    invoke-virtual {v0}, Landroid/view/Display;->getWidth()I

    move-result v6

    .line 30
    .local v6, "width":I
    invoke-virtual {v0}, Landroid/view/Display;->getHeight()I

    move-result v1

    .line 31
    .local v1, "height":I
    int-to-float v7, v6

    const v8, 0x44558000    # 854.0f

    div-float v4, v7, v8

    .line 32
    .local v4, "scaleF":F
    int-to-float v7, v6

    int-to-float v8, v1

    div-float v5, v7, v8

    .line 33
    .local v5, "scaleH":F
    const v7, 0x3faa3d71    # 1.33f

    sub-float/2addr v5, v7

    .line 34
    const v7, 0x400ccccd    # 2.2f

    mul-float/2addr v5, v7

    .line 36
    new-instance v7, Landroid/widget/ImageView;

    iget-object v8, p0, Lcom/miniclip/nativeJNI/MiniclipUpsellView;->mContext:Landroid/content/Context;

    invoke-direct {v7, v8}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object v7, p0, Lcom/miniclip/nativeJNI/MiniclipUpsellView;->mGameImage:Landroid/widget/ImageView;

    .line 37
    iget-object v7, p0, Lcom/miniclip/nativeJNI/MiniclipUpsellView;->mContext:Landroid/content/Context;

    invoke-virtual {v7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    iget-object v7, p0, Lcom/miniclip/nativeJNI/MiniclipUpsellView;->mContext:Landroid/content/Context;

    check-cast v7, Lcom/miniclip/nativeJNI/cocojava;

    invoke-virtual {v7}, Lcom/miniclip/nativeJNI/cocojava;->getFullVersionGameImageId()Ljava/lang/String;

    move-result-object v7

    const-string v9, "drawable"

    iget-object v10, p0, Lcom/miniclip/nativeJNI/MiniclipUpsellView;->mContext:Landroid/content/Context;

    invoke-virtual {v10}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v8, v7, v9, v10}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    .line 38
    .local v3, "resourceId":I
    iget-object v7, p0, Lcom/miniclip/nativeJNI/MiniclipUpsellView;->mGameImage:Landroid/widget/ImageView;

    iget-object v8, p0, Lcom/miniclip/nativeJNI/MiniclipUpsellView;->mContext:Landroid/content/Context;

    invoke-virtual {v8}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-virtual {v8, v3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 39
    iget-object v7, p0, Lcom/miniclip/nativeJNI/MiniclipUpsellView;->mGameImage:Landroid/widget/ImageView;

    new-instance v8, Landroid/widget/Gallery$LayoutParams;

    invoke-direct {v8, v11, v11}, Landroid/widget/Gallery$LayoutParams;-><init>(II)V

    invoke-virtual {v7, v8}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 40
    iget-object v7, p0, Lcom/miniclip/nativeJNI/MiniclipUpsellView;->mContentView:Landroid/widget/RelativeLayout;

    iget-object v8, p0, Lcom/miniclip/nativeJNI/MiniclipUpsellView;->mGameImage:Landroid/widget/ImageView;

    invoke-virtual {v7, v8}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 42
    new-instance v2, Landroid/widget/RelativeLayout$LayoutParams;

    const/high16 v7, 0x43970000    # 302.0f

    mul-float/2addr v7, v4

    float-to-int v7, v7

    const/high16 v8, 0x42920000    # 73.0f

    mul-float/2addr v8, v4

    float-to-int v8, v8

    invoke-direct {v2, v7, v8}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 43
    .local v2, "paramsCenter1":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v7, 0xe

    invoke-virtual {v2, v7}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 45
    const/16 v7, 0xc

    invoke-virtual {v2, v7}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 47
    new-instance v7, Landroid/widget/ImageView;

    iget-object v8, p0, Lcom/miniclip/nativeJNI/MiniclipUpsellView;->mContext:Landroid/content/Context;

    invoke-direct {v7, v8}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object v7, p0, Lcom/miniclip/nativeJNI/MiniclipUpsellView;->mGotoButton:Landroid/widget/ImageView;

    .line 48
    iget-object v7, p0, Lcom/miniclip/nativeJNI/MiniclipUpsellView;->mContext:Landroid/content/Context;

    invoke-virtual {v7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const-string v8, "get_it_now_button"

    const-string v9, "drawable"

    iget-object v10, p0, Lcom/miniclip/nativeJNI/MiniclipUpsellView;->mContext:Landroid/content/Context;

    invoke-virtual {v10}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v7, v8, v9, v10}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    .line 49
    iget-object v7, p0, Lcom/miniclip/nativeJNI/MiniclipUpsellView;->mGotoButton:Landroid/widget/ImageView;

    iget-object v8, p0, Lcom/miniclip/nativeJNI/MiniclipUpsellView;->mContext:Landroid/content/Context;

    invoke-virtual {v8}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-virtual {v8, v3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 50
    iget-object v7, p0, Lcom/miniclip/nativeJNI/MiniclipUpsellView;->mGotoButton:Landroid/widget/ImageView;

    invoke-virtual {v7, v2}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 51
    iget-object v7, p0, Lcom/miniclip/nativeJNI/MiniclipUpsellView;->mContentView:Landroid/widget/RelativeLayout;

    iget-object v8, p0, Lcom/miniclip/nativeJNI/MiniclipUpsellView;->mGotoButton:Landroid/widget/ImageView;

    invoke-virtual {v7, v8}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 52
    iget-object v7, p0, Lcom/miniclip/nativeJNI/MiniclipUpsellView;->mGotoButton:Landroid/widget/ImageView;

    invoke-virtual {v7, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 53
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 58
    invoke-super {p0, p1}, Lcom/miniclip/newsfeed/MCDialog;->onClick(Landroid/view/View;)V

    .line 60
    iget-object v1, p0, Lcom/miniclip/nativeJNI/MiniclipUpsellView;->mGotoButton:Landroid/widget/ImageView;

    if-ne p1, v1, :cond_1

    .line 61
    invoke-virtual {p0}, Lcom/miniclip/nativeJNI/MiniclipUpsellView;->removeAllViews()V

    .line 62
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 63
    .local v0, "intent":Landroid/content/Intent;
    iget-object v1, p0, Lcom/miniclip/nativeJNI/MiniclipUpsellView;->mContext:Landroid/content/Context;

    check-cast v1, Lcom/miniclip/nativeJNI/cocojava;

    invoke-virtual {v1}, Lcom/miniclip/nativeJNI/cocojava;->getFullAppURI()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 64
    iget-object v1, p0, Lcom/miniclip/nativeJNI/MiniclipUpsellView;->mContext:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 68
    .end local v0    # "intent":Landroid/content/Intent;
    :cond_0
    :goto_0
    return-void

    .line 65
    :cond_1
    iget-object v1, p0, Lcom/miniclip/nativeJNI/MiniclipUpsellView;->mCloseButton:Landroid/widget/ImageView;

    if-ne p1, v1, :cond_0

    .line 66
    invoke-virtual {p0}, Lcom/miniclip/nativeJNI/MiniclipUpsellView;->removeAllViews()V

    goto :goto_0
.end method
