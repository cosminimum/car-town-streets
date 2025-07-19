.class final Lcom/miniclip/nativeJNI/cocojava$50;
.super Ljava/lang/Object;
.source "cocojava.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/cocojava;->hideHorizontalBanner()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 3174
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 3176
    const-string v1, "horizontalBanner"

    const-string v2, "hideHorizontalBanner"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 3177
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    sget v1, Lcom/miniclip/nativeJNI/cocojava;->mWidth:I

    sget v2, Lcom/miniclip/nativeJNI/cocojava;->mHeight:I

    invoke-direct {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 3179
    .local v0, "gLLayout":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 3180
    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->mGLView:Lcom/miniclip/nativeJNI/ClearGLSurfaceView;

    invoke-virtual {v1, v0}, Lcom/miniclip/nativeJNI/ClearGLSurfaceView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 3181
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->access$1200()Lcom/miniclip/nativeJNI/horizontalBanner;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 3182
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->access$1200()Lcom/miniclip/nativeJNI/horizontalBanner;

    move-result-object v1

    invoke-virtual {v1, v3}, Lcom/miniclip/nativeJNI/horizontalBanner;->setBlockAutoRefresh(Z)V

    .line 3183
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->access$1200()Lcom/miniclip/nativeJNI/horizontalBanner;

    move-result-object v1

    invoke-virtual {v1, v3}, Lcom/miniclip/nativeJNI/horizontalBanner;->setAutorefreshEnabled(Z)V

    .line 3184
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->access$1200()Lcom/miniclip/nativeJNI/horizontalBanner;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/miniclip/nativeJNI/horizontalBanner;->setBlockAutoRefresh(Z)V

    .line 3186
    :cond_0
    sput-boolean v3, Lcom/miniclip/nativeJNI/cocojava;->mHorizontalBannerDisplayed:Z

    .line 3187
    return-void
.end method
