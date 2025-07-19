.class final Lcom/miniclip/nativeJNI/cocojava$49;
.super Ljava/lang/Object;
.source "cocojava.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/cocojava;->showHorizontalBanner()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 3147
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    const/4 v5, 0x1

    .line 3149
    const-string v1, "horizontalBanner"

    const-string v2, "showHorizontalBanner"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 3150
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    sget v1, Lcom/miniclip/nativeJNI/cocojava;->mWidth:I

    sget v2, Lcom/miniclip/nativeJNI/cocojava;->mHeight:I

    const/high16 v3, 0x42480000    # 50.0f

    sget v4, Lcom/miniclip/nativeJNI/cocojava;->mDensity:F

    mul-float/2addr v3, v4

    float-to-int v3, v3

    sub-int/2addr v2, v3

    invoke-direct {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 3152
    .local v0, "gLLayout":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v1, 0xc

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 3154
    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->mGLView:Lcom/miniclip/nativeJNI/ClearGLSurfaceView;

    invoke-virtual {v1, v0}, Lcom/miniclip/nativeJNI/ClearGLSurfaceView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 3156
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->access$1200()Lcom/miniclip/nativeJNI/horizontalBanner;

    move-result-object v1

    if-nez v1, :cond_0

    .line 3157
    new-instance v1, Lcom/miniclip/nativeJNI/horizontalBanner;

    sget-object v2, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    invoke-direct {v1, v2}, Lcom/miniclip/nativeJNI/horizontalBanner;-><init>(Landroid/content/Context;)V

    invoke-static {v1}, Lcom/miniclip/nativeJNI/cocojava;->access$1202(Lcom/miniclip/nativeJNI/horizontalBanner;)Lcom/miniclip/nativeJNI/horizontalBanner;

    .line 3158
    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->layout:Landroid/widget/RelativeLayout;

    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->access$1200()Lcom/miniclip/nativeJNI/horizontalBanner;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 3160
    :cond_0
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->access$1200()Lcom/miniclip/nativeJNI/horizontalBanner;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/miniclip/nativeJNI/horizontalBanner;->setBlockAutoRefresh(Z)V

    .line 3161
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->access$1200()Lcom/miniclip/nativeJNI/horizontalBanner;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miniclip/nativeJNI/horizontalBanner;->resetRefreshTime()V

    .line 3162
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->access$1200()Lcom/miniclip/nativeJNI/horizontalBanner;

    move-result-object v1

    invoke-virtual {v1, v5}, Lcom/miniclip/nativeJNI/horizontalBanner;->setAutorefreshEnabled(Z)V

    .line 3163
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->access$1200()Lcom/miniclip/nativeJNI/horizontalBanner;

    move-result-object v1

    invoke-virtual {v1, v5}, Lcom/miniclip/nativeJNI/horizontalBanner;->setBlockAutoRefresh(Z)V

    .line 3165
    sput-boolean v5, Lcom/miniclip/nativeJNI/cocojava;->mHorizontalBannerDisplayed:Z

    .line 3166
    return-void
.end method
