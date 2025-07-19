.class final Lcom/miniclip/nativeJNI/cocojava$47;
.super Ljava/lang/Object;
.source "cocojava.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/cocojava;->showRotatedBanner(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$alignment:I


# direct methods
.method constructor <init>(I)V
    .locals 0

    .prologue
    .line 3066
    iput p1, p0, Lcom/miniclip/nativeJNI/cocojava$47;->val$alignment:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 10

    .prologue
    const/high16 v9, 0x43a00000    # 320.0f

    const/4 v8, 0x1

    const/16 v7, 0xb

    .line 3068
    const-string v4, "rotatedBanner"

    const-string v5, "showRotatedBanner"

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 3070
    iget v4, p0, Lcom/miniclip/nativeJNI/cocojava$47;->val$alignment:I

    sget v5, Lcom/miniclip/nativeJNI/cocojava;->ALIGN_RIGHT:I

    if-ne v4, v5, :cond_0

    .line 3071
    new-instance v2, Landroid/widget/RelativeLayout$LayoutParams;

    sget-object v4, Lcom/miniclip/nativeJNI/cocojava;->sideBar1:Landroid/widget/RelativeLayout;

    invoke-virtual {v4}, Landroid/widget/RelativeLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    invoke-direct {v2, v4}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    .line 3073
    .local v2, "p1":Landroid/widget/RelativeLayout$LayoutParams;
    invoke-virtual {v2, v7}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 3074
    sget-object v4, Lcom/miniclip/nativeJNI/cocojava;->sideBar1:Landroid/widget/RelativeLayout;

    invoke-virtual {v4, v2}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 3076
    new-instance v3, Landroid/widget/RelativeLayout$LayoutParams;

    sget-object v4, Lcom/miniclip/nativeJNI/cocojava;->sideBar2:Landroid/widget/RelativeLayout;

    invoke-virtual {v4}, Landroid/widget/RelativeLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    invoke-direct {v3, v4}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    .line 3078
    .local v3, "p2":Landroid/widget/RelativeLayout$LayoutParams;
    invoke-virtual {v3, v7}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 3079
    const/16 v4, 0xc

    invoke-virtual {v3, v4}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 3080
    sget-object v4, Lcom/miniclip/nativeJNI/cocojava;->sideBar2:Landroid/widget/RelativeLayout;

    invoke-virtual {v4, v3}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 3083
    .end local v2    # "p1":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v3    # "p2":Landroid/widget/RelativeLayout$LayoutParams;
    :cond_0
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    sget v4, Lcom/miniclip/nativeJNI/cocojava;->mWidth:I

    const/high16 v5, 0x42480000    # 50.0f

    sget v6, Lcom/miniclip/nativeJNI/cocojava;->mDensity:F

    mul-float/2addr v5, v6

    float-to-int v5, v5

    sub-int/2addr v4, v5

    sget v5, Lcom/miniclip/nativeJNI/cocojava;->mHeight:I

    invoke-direct {v0, v4, v5}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 3085
    .local v0, "gLLayout":Landroid/widget/RelativeLayout$LayoutParams;
    iget v4, p0, Lcom/miniclip/nativeJNI/cocojava$47;->val$alignment:I

    sget v5, Lcom/miniclip/nativeJNI/cocojava;->ALIGN_LEFT:I

    if-ne v4, v5, :cond_1

    .line 3086
    invoke-virtual {v0, v7}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 3088
    :cond_1
    sget-object v4, Lcom/miniclip/nativeJNI/cocojava;->mGLView:Lcom/miniclip/nativeJNI/ClearGLSurfaceView;

    invoke-virtual {v4, v0}, Lcom/miniclip/nativeJNI/ClearGLSurfaceView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 3090
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->access$1100()Lcom/miniclip/nativeJNI/rotatedBannerImg;

    move-result-object v4

    if-nez v4, :cond_3

    .line 3091
    new-instance v4, Lcom/miniclip/nativeJNI/rotatedBannerImg;

    sget-object v5, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    iget v6, p0, Lcom/miniclip/nativeJNI/cocojava$47;->val$alignment:I

    invoke-direct {v4, v5, v6}, Lcom/miniclip/nativeJNI/rotatedBannerImg;-><init>(Landroid/content/Context;I)V

    invoke-static {v4}, Lcom/miniclip/nativeJNI/cocojava;->access$1102(Lcom/miniclip/nativeJNI/rotatedBannerImg;)Lcom/miniclip/nativeJNI/rotatedBannerImg;

    .line 3092
    sget-object v4, Lcom/miniclip/nativeJNI/cocojava;->layout:Landroid/widget/RelativeLayout;

    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->access$1100()Lcom/miniclip/nativeJNI/rotatedBannerImg;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 3097
    :goto_0
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->access$1100()Lcom/miniclip/nativeJNI/rotatedBannerImg;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Lcom/miniclip/nativeJNI/rotatedBannerImg;->setBlockAutoRefresh(Z)V

    .line 3098
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->access$1100()Lcom/miniclip/nativeJNI/rotatedBannerImg;

    move-result-object v4

    invoke-virtual {v4}, Lcom/miniclip/nativeJNI/rotatedBannerImg;->resetRefreshTime()V

    .line 3099
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->access$1100()Lcom/miniclip/nativeJNI/rotatedBannerImg;

    move-result-object v4

    invoke-virtual {v4, v8}, Lcom/miniclip/nativeJNI/rotatedBannerImg;->setAutorefreshEnabled(Z)V

    .line 3100
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->access$1100()Lcom/miniclip/nativeJNI/rotatedBannerImg;

    move-result-object v4

    invoke-virtual {v4, v8}, Lcom/miniclip/nativeJNI/rotatedBannerImg;->setBlockAutoRefresh(Z)V

    .line 3102
    iget v4, p0, Lcom/miniclip/nativeJNI/cocojava$47;->val$alignment:I

    sget v5, Lcom/miniclip/nativeJNI/cocojava;->ALIGN_RIGHT:I

    if-ne v4, v5, :cond_2

    .line 3104
    new-instance v1, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->access$1100()Lcom/miniclip/nativeJNI/rotatedBannerImg;

    move-result-object v4

    invoke-virtual {v4}, Lcom/miniclip/nativeJNI/rotatedBannerImg;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    invoke-direct {v1, v4}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    .line 3106
    .local v1, "glLayout2":Landroid/widget/RelativeLayout$LayoutParams;
    sget v4, Lcom/miniclip/nativeJNI/cocojava;->mDensity:F

    mul-float/2addr v4, v9

    float-to-int v4, v4

    iput v4, v1, Landroid/widget/RelativeLayout$LayoutParams;->width:I

    .line 3107
    sget v4, Lcom/miniclip/nativeJNI/cocojava;->mDensity:F

    mul-float/2addr v4, v9

    float-to-int v4, v4

    iput v4, v1, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    .line 3108
    invoke-virtual {v1, v7}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 3109
    const/16 v4, 0xf

    invoke-virtual {v1, v4}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 3110
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->access$1100()Lcom/miniclip/nativeJNI/rotatedBannerImg;

    move-result-object v4

    invoke-virtual {v4, v1}, Lcom/miniclip/nativeJNI/rotatedBannerImg;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 3115
    .end local v1    # "glLayout2":Landroid/widget/RelativeLayout$LayoutParams;
    :cond_2
    sput v8, Lcom/miniclip/nativeJNI/cocojava;->mRotatedBannerDisplayed:I

    .line 3116
    return-void

    .line 3094
    :cond_3
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->access$1100()Lcom/miniclip/nativeJNI/rotatedBannerImg;

    move-result-object v4

    iget v5, p0, Lcom/miniclip/nativeJNI/cocojava$47;->val$alignment:I

    invoke-virtual {v4, v5}, Lcom/miniclip/nativeJNI/rotatedBannerImg;->setAlignment(I)V

    goto :goto_0
.end method
