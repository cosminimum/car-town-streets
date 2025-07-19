.class final Lcom/miniclip/nativeJNI/cocojava$48;
.super Ljava/lang/Object;
.source "cocojava.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/cocojava;->hideRotatedBanner()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 3123
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 3125
    const-string v1, "rotatedBanner"

    const-string v2, "hideRotatedBanner"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 3126
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    sget v1, Lcom/miniclip/nativeJNI/cocojava;->mWidth:I

    sget v2, Lcom/miniclip/nativeJNI/cocojava;->mHeight:I

    invoke-direct {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 3128
    .local v0, "gLLayout":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v1, 0xb

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 3129
    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->mGLView:Lcom/miniclip/nativeJNI/ClearGLSurfaceView;

    invoke-virtual {v1, v0}, Lcom/miniclip/nativeJNI/ClearGLSurfaceView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 3131
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->access$1100()Lcom/miniclip/nativeJNI/rotatedBannerImg;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 3132
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->access$1100()Lcom/miniclip/nativeJNI/rotatedBannerImg;

    move-result-object v1

    invoke-virtual {v1, v3}, Lcom/miniclip/nativeJNI/rotatedBannerImg;->setBlockAutoRefresh(Z)V

    .line 3133
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->access$1100()Lcom/miniclip/nativeJNI/rotatedBannerImg;

    move-result-object v1

    invoke-virtual {v1, v3}, Lcom/miniclip/nativeJNI/rotatedBannerImg;->setAutorefreshEnabled(Z)V

    .line 3134
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->access$1100()Lcom/miniclip/nativeJNI/rotatedBannerImg;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/miniclip/nativeJNI/rotatedBannerImg;->setBlockAutoRefresh(Z)V

    .line 3138
    :cond_0
    sput v3, Lcom/miniclip/nativeJNI/cocojava;->mRotatedBannerDisplayed:I

    .line 3139
    return-void
.end method
