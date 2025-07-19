.class Lcom/miniclip/nativeJNI/rotatedBannerImg$3;
.super Ljava/lang/Object;
.source "rotatedBannerImg.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/rotatedBannerImg;->runAnimation()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miniclip/nativeJNI/rotatedBannerImg;

.field final synthetic val$thiz:Lcom/miniclip/nativeJNI/rotatedBannerImg;


# direct methods
.method constructor <init>(Lcom/miniclip/nativeJNI/rotatedBannerImg;Lcom/miniclip/nativeJNI/rotatedBannerImg;)V
    .locals 0

    .prologue
    .line 182
    iput-object p1, p0, Lcom/miniclip/nativeJNI/rotatedBannerImg$3;->this$0:Lcom/miniclip/nativeJNI/rotatedBannerImg;

    iput-object p2, p0, Lcom/miniclip/nativeJNI/rotatedBannerImg$3;->val$thiz:Lcom/miniclip/nativeJNI/rotatedBannerImg;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 15

    .prologue
    const/4 v14, 0x0

    const/high16 v13, 0x43200000    # 160.0f

    const/high16 v12, 0x43a00000    # 320.0f

    const/high16 v11, 0x42480000    # 50.0f

    .line 185
    new-instance v5, Landroid/widget/RelativeLayout;

    iget-object v8, p0, Lcom/miniclip/nativeJNI/rotatedBannerImg$3;->this$0:Lcom/miniclip/nativeJNI/rotatedBannerImg;

    invoke-static {v8}, Lcom/miniclip/nativeJNI/rotatedBannerImg;->access$000(Lcom/miniclip/nativeJNI/rotatedBannerImg;)Landroid/content/Context;

    move-result-object v8

    invoke-direct {v5, v8}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 186
    .local v5, "rl":Landroid/widget/RelativeLayout;
    new-instance v6, Landroid/widget/RelativeLayout$LayoutParams;

    sget v8, Lcom/miniclip/nativeJNI/cocojava;->mDensity:F

    mul-float/2addr v8, v11

    float-to-int v8, v8

    sget v9, Lcom/miniclip/nativeJNI/cocojava;->mDensity:F

    mul-float/2addr v9, v12

    float-to-int v9, v9

    invoke-direct {v6, v8, v9}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 187
    .local v6, "rlp":Landroid/widget/RelativeLayout$LayoutParams;
    invoke-virtual {v5, v6}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 188
    iget-object v8, p0, Lcom/miniclip/nativeJNI/rotatedBannerImg$3;->this$0:Lcom/miniclip/nativeJNI/rotatedBannerImg;

    invoke-static {v8}, Lcom/miniclip/nativeJNI/rotatedBannerImg;->access$100(Lcom/miniclip/nativeJNI/rotatedBannerImg;)I

    move-result v8

    sget v9, Lcom/miniclip/nativeJNI/cocojava;->ALIGN_RIGHT:I

    if-ne v8, v9, :cond_0

    .line 189
    const/16 v8, 0xb

    invoke-virtual {v6, v8}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 190
    :cond_0
    const/high16 v8, -0x1000000

    invoke-virtual {v5, v8}, Landroid/widget/RelativeLayout;->setBackgroundColor(I)V

    .line 191
    sget v8, Lcom/miniclip/nativeJNI/cocojava;->mDensity:F

    mul-float/2addr v8, v12

    float-to-int v8, v8

    sget v9, Lcom/miniclip/nativeJNI/cocojava;->mDensity:F

    mul-float/2addr v9, v11

    float-to-int v9, v9

    sget-object v10, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v8, v9, v10}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 192
    .local v0, "adBitmap":Landroid/graphics/Bitmap;
    new-instance v1, Landroid/graphics/Canvas;

    invoke-direct {v1, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 193
    .local v1, "c":Landroid/graphics/Canvas;
    sget-object v8, Lcom/miniclip/nativeJNI/rotatedBannerImg;->adView:Lcom/miniclip/nativeJNI/rotatedBannerImg$MoPubViewRotate;

    sget v9, Lcom/miniclip/nativeJNI/cocojava;->mDensity:F

    mul-float/2addr v9, v12

    float-to-int v9, v9

    sget v10, Lcom/miniclip/nativeJNI/cocojava;->mDensity:F

    mul-float/2addr v10, v11

    float-to-int v10, v10

    invoke-virtual {v8, v14, v14, v9, v10}, Lcom/miniclip/nativeJNI/rotatedBannerImg$MoPubViewRotate;->layout(IIII)V

    .line 194
    sget-object v8, Lcom/miniclip/nativeJNI/rotatedBannerImg;->adView:Lcom/miniclip/nativeJNI/rotatedBannerImg$MoPubViewRotate;

    invoke-virtual {v8, v1}, Lcom/miniclip/nativeJNI/rotatedBannerImg$MoPubViewRotate;->draw(Landroid/graphics/Canvas;)V

    .line 195
    sget v8, Lcom/miniclip/nativeJNI/cocojava;->mDensity:F

    mul-float/2addr v8, v11

    float-to-int v8, v8

    sget v9, Lcom/miniclip/nativeJNI/cocojava;->mDensity:F

    mul-float/2addr v9, v12

    float-to-int v9, v9

    sget-object v10, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v8, v9, v10}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v7

    .line 196
    .local v7, "rotatedBitmap":Landroid/graphics/Bitmap;
    new-instance v2, Landroid/graphics/Canvas;

    invoke-direct {v2, v7}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 197
    .local v2, "canvas":Landroid/graphics/Canvas;
    new-instance v3, Landroid/graphics/Matrix;

    invoke-direct {v3}, Landroid/graphics/Matrix;-><init>()V

    .line 198
    .local v3, "matrix":Landroid/graphics/Matrix;
    const/high16 v8, 0x43870000    # 270.0f

    sget v9, Lcom/miniclip/nativeJNI/cocojava;->mDensity:F

    mul-float/2addr v9, v13

    float-to-int v9, v9

    int-to-float v9, v9

    sget v10, Lcom/miniclip/nativeJNI/cocojava;->mDensity:F

    mul-float/2addr v10, v13

    float-to-int v10, v10

    int-to-float v10, v10

    invoke-virtual {v3, v8, v9, v10}, Landroid/graphics/Matrix;->setRotate(FFF)V

    .line 199
    new-instance v8, Landroid/graphics/Paint;

    invoke-direct {v8}, Landroid/graphics/Paint;-><init>()V

    invoke-virtual {v2, v0, v3, v8}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;Landroid/graphics/Paint;)V

    .line 200
    new-instance v4, Landroid/widget/ImageView;

    iget-object v8, p0, Lcom/miniclip/nativeJNI/rotatedBannerImg$3;->this$0:Lcom/miniclip/nativeJNI/rotatedBannerImg;

    invoke-static {v8}, Lcom/miniclip/nativeJNI/rotatedBannerImg;->access$000(Lcom/miniclip/nativeJNI/rotatedBannerImg;)Landroid/content/Context;

    move-result-object v8

    invoke-direct {v4, v8}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 201
    .local v4, "newImage":Landroid/widget/ImageView;
    invoke-virtual {v4, v7}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 202
    invoke-virtual {v5, v4}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 204
    iget-object v8, p0, Lcom/miniclip/nativeJNI/rotatedBannerImg$3;->val$thiz:Lcom/miniclip/nativeJNI/rotatedBannerImg;

    iget-object v9, p0, Lcom/miniclip/nativeJNI/rotatedBannerImg$3;->this$0:Lcom/miniclip/nativeJNI/rotatedBannerImg;

    invoke-static {v9}, Lcom/miniclip/nativeJNI/rotatedBannerImg;->access$200(Lcom/miniclip/nativeJNI/rotatedBannerImg;)Landroid/widget/RelativeLayout;

    move-result-object v9

    invoke-virtual {v8, v9}, Lcom/miniclip/nativeJNI/rotatedBannerImg;->removeView(Landroid/view/View;)V

    .line 205
    iget-object v8, p0, Lcom/miniclip/nativeJNI/rotatedBannerImg$3;->this$0:Lcom/miniclip/nativeJNI/rotatedBannerImg;

    invoke-static {v8, v5}, Lcom/miniclip/nativeJNI/rotatedBannerImg;->access$202(Lcom/miniclip/nativeJNI/rotatedBannerImg;Landroid/widget/RelativeLayout;)Landroid/widget/RelativeLayout;

    .line 206
    iget-object v8, p0, Lcom/miniclip/nativeJNI/rotatedBannerImg$3;->val$thiz:Lcom/miniclip/nativeJNI/rotatedBannerImg;

    iget-object v9, p0, Lcom/miniclip/nativeJNI/rotatedBannerImg$3;->this$0:Lcom/miniclip/nativeJNI/rotatedBannerImg;

    invoke-static {v9}, Lcom/miniclip/nativeJNI/rotatedBannerImg;->access$200(Lcom/miniclip/nativeJNI/rotatedBannerImg;)Landroid/widget/RelativeLayout;

    move-result-object v9

    invoke-virtual {v8, v9}, Lcom/miniclip/nativeJNI/rotatedBannerImg;->addView(Landroid/view/View;)V

    .line 207
    return-void
.end method
