.class public Lcom/miniclip/nativeJNI/TapJoyView;
.super Lcom/miniclip/newsfeed/MCDialog;
.source "TapJoyView.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private mFeaturedApObject:Lcom/tapjoy/TapjoyFeaturedAppObject;

.field private mGameImage:Landroid/widget/ImageView;

.field private mGotoButton:Landroid/widget/ImageView;

.field private mWebview:Landroid/webkit/WebView;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/tapjoy/TapjoyFeaturedAppObject;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "featApObj"    # Lcom/tapjoy/TapjoyFeaturedAppObject;

    .prologue
    .line 27
    invoke-direct {p0, p1}, Lcom/miniclip/newsfeed/MCDialog;-><init>(Landroid/content/Context;)V

    .line 28
    iput-object p2, p0, Lcom/miniclip/nativeJNI/TapJoyView;->mFeaturedApObject:Lcom/tapjoy/TapjoyFeaturedAppObject;

    .line 30
    invoke-virtual {p0}, Lcom/miniclip/nativeJNI/TapJoyView;->setScreenContents()V

    .line 31
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 74
    invoke-super {p0, p1}, Lcom/miniclip/newsfeed/MCDialog;->onClick(Landroid/view/View;)V

    .line 76
    iget-object v3, p0, Lcom/miniclip/nativeJNI/TapJoyView;->mGotoButton:Landroid/widget/ImageView;

    if-ne p1, v3, :cond_1

    .line 77
    invoke-virtual {p0}, Lcom/miniclip/nativeJNI/TapJoyView;->removeAllViews()V

    .line 80
    iget-object v3, p0, Lcom/miniclip/nativeJNI/TapJoyView;->mFeaturedApObject:Lcom/tapjoy/TapjoyFeaturedAppObject;

    iget-object v2, v3, Lcom/tapjoy/TapjoyFeaturedAppObject;->redirectURL:Ljava/lang/String;

    .line 81
    .local v2, "url":Ljava/lang/String;
    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 82
    .local v1, "uriUrl":Landroid/net/Uri;
    new-instance v0, Landroid/content/Intent;

    const-string v3, "android.intent.action.VIEW"

    invoke-direct {v0, v3, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 83
    .local v0, "launchBrowser":Landroid/content/Intent;
    iget-object v3, p0, Lcom/miniclip/nativeJNI/TapJoyView;->mContext:Landroid/content/Context;

    invoke-virtual {v3, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 90
    .end local v0    # "launchBrowser":Landroid/content/Intent;
    .end local v1    # "uriUrl":Landroid/net/Uri;
    .end local v2    # "url":Ljava/lang/String;
    :cond_0
    :goto_0
    return-void

    .line 85
    :cond_1
    iget-object v3, p0, Lcom/miniclip/nativeJNI/TapJoyView;->mCloseButton:Landroid/widget/ImageView;

    if-ne p1, v3, :cond_0

    .line 87
    invoke-virtual {p0}, Lcom/miniclip/nativeJNI/TapJoyView;->removeAllViews()V

    goto :goto_0
.end method

.method public setScreenContents()V
    .locals 13

    .prologue
    const/4 v12, -0x2

    .line 34
    iget-object v9, p0, Lcom/miniclip/nativeJNI/TapJoyView;->mContext:Landroid/content/Context;

    check-cast v9, Landroid/app/Activity;

    invoke-virtual {v9}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v9

    invoke-interface {v9}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    .line 35
    .local v0, "display":Landroid/view/Display;
    invoke-virtual {v0}, Landroid/view/Display;->getWidth()I

    move-result v8

    .line 36
    .local v8, "width":I
    invoke-virtual {v0}, Landroid/view/Display;->getHeight()I

    move-result v1

    .line 37
    .local v1, "height":I
    int-to-float v9, v8

    const v10, 0x44558000    # 854.0f

    div-float v6, v9, v10

    .line 38
    .local v6, "scaleF":F
    int-to-float v9, v8

    int-to-float v10, v1

    div-float v7, v9, v10

    .line 39
    .local v7, "scaleH":F
    const v9, 0x3faa3d71    # 1.33f

    sub-float/2addr v7, v9

    .line 40
    const v9, 0x400ccccd    # 2.2f

    mul-float/2addr v7, v9

    .line 42
    iget-object v9, p0, Lcom/miniclip/nativeJNI/TapJoyView;->mContext:Landroid/content/Context;

    check-cast v9, Lcom/miniclip/nativeJNI/cocojava;

    iget-object v10, p0, Lcom/miniclip/nativeJNI/TapJoyView;->mFeaturedApObject:Lcom/tapjoy/TapjoyFeaturedAppObject;

    invoke-virtual {v9, v10}, Lcom/miniclip/nativeJNI/cocojava;->getTapJoyHtmlOffer(Lcom/tapjoy/TapjoyFeaturedAppObject;)Ljava/lang/String;

    move-result-object v2

    .line 44
    .local v2, "htmlContent":Ljava/lang/String;
    invoke-static {v2}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 45
    new-instance v9, Landroid/webkit/WebView;

    iget-object v10, p0, Lcom/miniclip/nativeJNI/TapJoyView;->mContext:Landroid/content/Context;

    invoke-direct {v9, v10}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    iput-object v9, p0, Lcom/miniclip/nativeJNI/TapJoyView;->mWebview:Landroid/webkit/WebView;

    .line 46
    iget-object v9, p0, Lcom/miniclip/nativeJNI/TapJoyView;->mWebview:Landroid/webkit/WebView;

    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Landroid/webkit/WebView;->setBackgroundColor(I)V

    .line 47
    iget-object v9, p0, Lcom/miniclip/nativeJNI/TapJoyView;->mWebview:Landroid/webkit/WebView;

    const-string v10, "text/html"

    const-string v11, "UTF-8"

    invoke-virtual {v9, v2, v10, v11}, Landroid/webkit/WebView;->loadData(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    new-instance v3, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v3, v12, v12}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 53
    .local v3, "params":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v9, 0xd

    invoke-virtual {v3, v9}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 55
    iget-object v9, p0, Lcom/miniclip/nativeJNI/TapJoyView;->mWebview:Landroid/webkit/WebView;

    invoke-virtual {v9, v3}, Landroid/webkit/WebView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 56
    iget-object v9, p0, Lcom/miniclip/nativeJNI/TapJoyView;->mContentView:Landroid/widget/RelativeLayout;

    iget-object v10, p0, Lcom/miniclip/nativeJNI/TapJoyView;->mWebview:Landroid/webkit/WebView;

    invoke-virtual {v9, v10}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 58
    new-instance v4, Landroid/widget/RelativeLayout$LayoutParams;

    const/high16 v9, 0x43970000    # 302.0f

    mul-float/2addr v9, v6

    float-to-int v9, v9

    const/high16 v10, 0x42920000    # 73.0f

    mul-float/2addr v10, v6

    float-to-int v10, v10

    invoke-direct {v4, v9, v10}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 59
    .local v4, "paramsCenter1":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v9, 0xe

    invoke-virtual {v4, v9}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 61
    const/16 v9, 0xc

    invoke-virtual {v4, v9}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 63
    new-instance v9, Landroid/widget/ImageView;

    iget-object v10, p0, Lcom/miniclip/nativeJNI/TapJoyView;->mContext:Landroid/content/Context;

    invoke-direct {v9, v10}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object v9, p0, Lcom/miniclip/nativeJNI/TapJoyView;->mGotoButton:Landroid/widget/ImageView;

    .line 64
    iget-object v9, p0, Lcom/miniclip/nativeJNI/TapJoyView;->mContext:Landroid/content/Context;

    invoke-virtual {v9}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const-string v10, "get_it_now_button"

    const-string v11, "drawable"

    iget-object v12, p0, Lcom/miniclip/nativeJNI/TapJoyView;->mContext:Landroid/content/Context;

    invoke-virtual {v12}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v9, v10, v11, v12}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v5

    .line 65
    .local v5, "resourceId":I
    iget-object v9, p0, Lcom/miniclip/nativeJNI/TapJoyView;->mGotoButton:Landroid/widget/ImageView;

    iget-object v10, p0, Lcom/miniclip/nativeJNI/TapJoyView;->mContext:Landroid/content/Context;

    invoke-virtual {v10}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    invoke-virtual {v10, v5}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v10

    invoke-virtual {v9, v10}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 66
    iget-object v9, p0, Lcom/miniclip/nativeJNI/TapJoyView;->mGotoButton:Landroid/widget/ImageView;

    invoke-virtual {v9, v4}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 67
    iget-object v9, p0, Lcom/miniclip/nativeJNI/TapJoyView;->mContentView:Landroid/widget/RelativeLayout;

    iget-object v10, p0, Lcom/miniclip/nativeJNI/TapJoyView;->mGotoButton:Landroid/widget/ImageView;

    invoke-virtual {v9, v10}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 68
    iget-object v9, p0, Lcom/miniclip/nativeJNI/TapJoyView;->mGotoButton:Landroid/widget/ImageView;

    invoke-virtual {v9, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 69
    return-void
.end method
