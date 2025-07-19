.class public Lcom/chartboost/sdk/impl/u;
.super Landroid/view/View;
.source "SourceFile"


# instance fields
.field private a:Landroid/os/Handler;

.field private b:F

.field private c:J

.field private d:Landroid/graphics/Paint;

.field private e:Landroid/graphics/Paint;

.field private f:Landroid/graphics/Path;

.field private g:Landroid/graphics/Path;

.field private h:Landroid/graphics/RectF;

.field private i:Landroid/graphics/RectF;

.field private j:Landroid/graphics/Bitmap;

.field private k:Landroid/graphics/Canvas;

.field private l:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 56
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 35
    iput-object v0, p0, Lcom/chartboost/sdk/impl/u;->j:Landroid/graphics/Bitmap;

    .line 36
    iput-object v0, p0, Lcom/chartboost/sdk/impl/u;->k:Landroid/graphics/Canvas;

    .line 38
    new-instance v0, Lcom/chartboost/sdk/impl/u$1;

    invoke-direct {v0, p0}, Lcom/chartboost/sdk/impl/u$1;-><init>(Lcom/chartboost/sdk/impl/u;)V

    iput-object v0, p0, Lcom/chartboost/sdk/impl/u;->l:Ljava/lang/Runnable;

    .line 57
    invoke-direct {p0, p1}, Lcom/chartboost/sdk/impl/u;->a(Landroid/content/Context;)V

    .line 58
    return-void
.end method

.method static synthetic a(Lcom/chartboost/sdk/impl/u;)F
    .locals 1

    .prologue
    .line 28
    iget v0, p0, Lcom/chartboost/sdk/impl/u;->b:F

    return v0
.end method

.method private a(Landroid/content/Context;)V
    .locals 7

    .prologue
    const/4 v6, -0x1

    const/4 v5, 0x1

    .line 73
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    .line 74
    const/4 v1, 0x0

    iput v1, p0, Lcom/chartboost/sdk/impl/u;->b:F

    .line 75
    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    iput-object v1, p0, Lcom/chartboost/sdk/impl/u;->a:Landroid/os/Handler;

    .line 76
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v1

    long-to-double v1, v1

    const-wide v3, 0x412e848000000000L    # 1000000.0

    div-double/2addr v1, v3

    double-to-long v1, v1

    iput-wide v1, p0, Lcom/chartboost/sdk/impl/u;->c:J

    .line 78
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    iput-object v1, p0, Lcom/chartboost/sdk/impl/u;->d:Landroid/graphics/Paint;

    .line 79
    iget-object v1, p0, Lcom/chartboost/sdk/impl/u;->d:Landroid/graphics/Paint;

    invoke-virtual {v1, v6}, Landroid/graphics/Paint;->setColor(I)V

    .line 80
    iget-object v1, p0, Lcom/chartboost/sdk/impl/u;->d:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 81
    iget-object v1, p0, Lcom/chartboost/sdk/impl/u;->d:Landroid/graphics/Paint;

    const/high16 v2, 0x40400000    # 3.0f

    mul-float/2addr v0, v2

    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 82
    iget-object v0, p0, Lcom/chartboost/sdk/impl/u;->d:Landroid/graphics/Paint;

    invoke-virtual {v0, v5}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 84
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/chartboost/sdk/impl/u;->e:Landroid/graphics/Paint;

    .line 85
    iget-object v0, p0, Lcom/chartboost/sdk/impl/u;->e:Landroid/graphics/Paint;

    invoke-virtual {v0, v6}, Landroid/graphics/Paint;->setColor(I)V

    .line 86
    iget-object v0, p0, Lcom/chartboost/sdk/impl/u;->e:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 87
    iget-object v0, p0, Lcom/chartboost/sdk/impl/u;->e:Landroid/graphics/Paint;

    invoke-virtual {v0, v5}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 89
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lcom/chartboost/sdk/impl/u;->f:Landroid/graphics/Path;

    .line 90
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lcom/chartboost/sdk/impl/u;->g:Landroid/graphics/Path;

    .line 92
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/chartboost/sdk/impl/u;->i:Landroid/graphics/RectF;

    .line 93
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/chartboost/sdk/impl/u;->h:Landroid/graphics/RectF;

    .line 97
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "setLayerType"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Class;

    const/4 v3, 0x0

    sget-object v4, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v4, v2, v3

    const/4 v3, 0x1

    const-class v4, Landroid/graphics/Paint;

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 98
    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 102
    :goto_0
    return-void

    .line 99
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method static synthetic a(Lcom/chartboost/sdk/impl/u;F)V
    .locals 0

    .prologue
    .line 28
    iput p1, p0, Lcom/chartboost/sdk/impl/u;->b:F

    return-void
.end method


# virtual methods
.method protected onAttachedToWindow()V
    .locals 2

    .prologue
    .line 211
    iget-object v0, p0, Lcom/chartboost/sdk/impl/u;->a:Landroid/os/Handler;

    iget-object v1, p0, Lcom/chartboost/sdk/impl/u;->l:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 212
    iget-object v0, p0, Lcom/chartboost/sdk/impl/u;->a:Landroid/os/Handler;

    iget-object v1, p0, Lcom/chartboost/sdk/impl/u;->l:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 213
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 2

    .prologue
    .line 217
    iget-object v0, p0, Lcom/chartboost/sdk/impl/u;->a:Landroid/os/Handler;

    iget-object v1, p0, Lcom/chartboost/sdk/impl/u;->l:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 218
    iget-object v0, p0, Lcom/chartboost/sdk/impl/u;->j:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/chartboost/sdk/impl/u;->j:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v0

    if-nez v0, :cond_0

    .line 219
    iget-object v0, p0, Lcom/chartboost/sdk/impl/u;->j:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 220
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/chartboost/sdk/impl/u;->j:Landroid/graphics/Bitmap;

    .line 221
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 10
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/high16 v9, 0x40400000    # 3.0f

    const/high16 v8, 0x3fc00000    # 1.5f

    const/high16 v7, 0x40000000    # 2.0f

    const/4 v6, 0x0

    .line 106
    invoke-virtual {p0}, Lcom/chartboost/sdk/impl/u;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v2, v1, Landroid/util/DisplayMetrics;->density:F

    .line 109
    iget-object v1, p0, Lcom/chartboost/sdk/impl/u;->j:Landroid/graphics/Bitmap;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/chartboost/sdk/impl/u;->j:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v3

    if-ne v1, v3, :cond_0

    iget-object v1, p0, Lcom/chartboost/sdk/impl/u;->j:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v3

    if-eq v1, v3, :cond_2

    .line 110
    :cond_0
    iget-object v1, p0, Lcom/chartboost/sdk/impl/u;->j:Landroid/graphics/Bitmap;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/chartboost/sdk/impl/u;->j:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v1

    if-nez v1, :cond_1

    .line 111
    iget-object v1, p0, Lcom/chartboost/sdk/impl/u;->j:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->recycle()V

    .line 112
    :cond_1
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v1

    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v3

    sget-object v4, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v1, v3, v4}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v1

    iput-object v1, p0, Lcom/chartboost/sdk/impl/u;->j:Landroid/graphics/Bitmap;

    .line 113
    new-instance v1, Landroid/graphics/Canvas;

    iget-object v3, p0, Lcom/chartboost/sdk/impl/u;->j:Landroid/graphics/Bitmap;

    invoke-direct {v1, v3}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    iput-object v1, p0, Lcom/chartboost/sdk/impl/u;->k:Landroid/graphics/Canvas;

    .line 115
    :cond_2
    iget-object v1, p0, Lcom/chartboost/sdk/impl/u;->j:Landroid/graphics/Bitmap;

    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Landroid/graphics/Bitmap;->eraseColor(I)V

    .line 117
    iget-object v0, p0, Lcom/chartboost/sdk/impl/u;->k:Landroid/graphics/Canvas;

    .line 120
    .end local p1    # "canvas":Landroid/graphics/Canvas;
    .local v0, "canvas":Landroid/graphics/Canvas;
    invoke-static {}, Lcom/chartboost/sdk/Chartboost;->sharedChartboost()Lcom/chartboost/sdk/Chartboost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/chartboost/sdk/Chartboost;->getForcedOrientationDifference()Lcom/chartboost/sdk/Libraries/CBOrientation$Difference;

    move-result-object v4

    .line 121
    invoke-virtual {v0}, Landroid/graphics/Canvas;->save()I

    .line 122
    invoke-virtual {v4}, Lcom/chartboost/sdk/Libraries/CBOrientation$Difference;->isReverse()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 123
    const/high16 v1, 0x43340000    # 180.0f

    invoke-virtual {p0}, Lcom/chartboost/sdk/impl/u;->getWidth()I

    move-result v3

    int-to-float v3, v3

    div-float/2addr v3, v7

    invoke-virtual {p0}, Lcom/chartboost/sdk/impl/u;->getHeight()I

    move-result v5

    int-to-float v5, v5

    div-float/2addr v5, v7

    invoke-virtual {v0, v1, v3, v5}, Landroid/graphics/Canvas;->rotate(FFF)V

    .line 126
    :cond_3
    iget-object v1, p0, Lcom/chartboost/sdk/impl/u;->h:Landroid/graphics/RectF;

    invoke-virtual {p0}, Lcom/chartboost/sdk/impl/u;->getWidth()I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {p0}, Lcom/chartboost/sdk/impl/u;->getHeight()I

    move-result v5

    int-to-float v5, v5

    invoke-virtual {v1, v6, v6, v3, v5}, Landroid/graphics/RectF;->set(FFFF)V

    .line 127
    iget-object v1, p0, Lcom/chartboost/sdk/impl/u;->h:Landroid/graphics/RectF;

    mul-float v3, v8, v2

    mul-float v5, v8, v2

    invoke-virtual {v1, v3, v5}, Landroid/graphics/RectF;->inset(FF)V

    .line 128
    invoke-virtual {v4}, Lcom/chartboost/sdk/Libraries/CBOrientation$Difference;->isOdd()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-virtual {p0}, Lcom/chartboost/sdk/impl/u;->getWidth()I

    move-result v1

    :goto_0
    int-to-float v1, v1

    div-float/2addr v1, v7

    .line 129
    iget-object v3, p0, Lcom/chartboost/sdk/impl/u;->h:Landroid/graphics/RectF;

    iget-object v5, p0, Lcom/chartboost/sdk/impl/u;->d:Landroid/graphics/Paint;

    invoke-virtual {v0, v3, v1, v1, v5}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 132
    iget-object v1, p0, Lcom/chartboost/sdk/impl/u;->i:Landroid/graphics/RectF;

    iget-object v3, p0, Lcom/chartboost/sdk/impl/u;->h:Landroid/graphics/RectF;

    invoke-virtual {v1, v3}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 133
    iget-object v1, p0, Lcom/chartboost/sdk/impl/u;->i:Landroid/graphics/RectF;

    mul-float v3, v9, v2

    mul-float/2addr v2, v9

    invoke-virtual {v1, v3, v2}, Landroid/graphics/RectF;->inset(FF)V

    .line 134
    invoke-virtual {v4}, Lcom/chartboost/sdk/Libraries/CBOrientation$Difference;->isOdd()Z

    move-result v1

    if-eqz v1, :cond_5

    iget-object v1, p0, Lcom/chartboost/sdk/impl/u;->i:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    move-result v1

    :goto_1
    div-float/2addr v1, v7

    .line 135
    iget-object v2, p0, Lcom/chartboost/sdk/impl/u;->f:Landroid/graphics/Path;

    invoke-virtual {v2}, Landroid/graphics/Path;->reset()V

    .line 136
    iget-object v2, p0, Lcom/chartboost/sdk/impl/u;->f:Landroid/graphics/Path;

    iget-object v3, p0, Lcom/chartboost/sdk/impl/u;->i:Landroid/graphics/RectF;

    sget-object v5, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    invoke-virtual {v2, v3, v1, v1, v5}, Landroid/graphics/Path;->addRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Path$Direction;)V

    .line 139
    invoke-virtual {v4}, Lcom/chartboost/sdk/Libraries/CBOrientation$Difference;->isOdd()Z

    move-result v1

    if-eqz v1, :cond_6

    iget-object v1, p0, Lcom/chartboost/sdk/impl/u;->i:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    move-result v1

    .line 140
    :goto_2
    iget-object v2, p0, Lcom/chartboost/sdk/impl/u;->g:Landroid/graphics/Path;

    invoke-virtual {v2}, Landroid/graphics/Path;->reset()V

    .line 141
    invoke-virtual {v4}, Lcom/chartboost/sdk/Libraries/CBOrientation$Difference;->isOdd()Z

    move-result v2

    if-eqz v2, :cond_7

    .line 142
    iget-object v2, p0, Lcom/chartboost/sdk/impl/u;->g:Landroid/graphics/Path;

    invoke-virtual {v2, v1, v6}, Landroid/graphics/Path;->moveTo(FF)V

    .line 143
    iget-object v2, p0, Lcom/chartboost/sdk/impl/u;->g:Landroid/graphics/Path;

    invoke-virtual {v2, v1, v1}, Landroid/graphics/Path;->lineTo(FF)V

    .line 144
    iget-object v2, p0, Lcom/chartboost/sdk/impl/u;->g:Landroid/graphics/Path;

    mul-float v3, v1, v7

    invoke-virtual {v2, v6, v3}, Landroid/graphics/Path;->lineTo(FF)V

    .line 145
    iget-object v2, p0, Lcom/chartboost/sdk/impl/u;->g:Landroid/graphics/Path;

    invoke-virtual {v2, v6, v1}, Landroid/graphics/Path;->lineTo(FF)V

    .line 152
    :goto_3
    iget-object v2, p0, Lcom/chartboost/sdk/impl/u;->g:Landroid/graphics/Path;

    invoke-virtual {v2}, Landroid/graphics/Path;->close()V

    .line 155
    invoke-virtual {v0}, Landroid/graphics/Canvas;->save()I

    .line 156
    iget-object v2, p0, Lcom/chartboost/sdk/impl/u;->f:Landroid/graphics/Path;

    invoke-virtual {v0, v2}, Landroid/graphics/Canvas;->clipPath(Landroid/graphics/Path;)Z

    .line 160
    neg-float v2, v1

    iget v3, p0, Lcom/chartboost/sdk/impl/u;->b:F

    add-float/2addr v2, v3

    :goto_4
    invoke-virtual {v4}, Lcom/chartboost/sdk/Libraries/CBOrientation$Difference;->isOdd()Z

    move-result v3

    if-eqz v3, :cond_b

    iget-object v3, p0, Lcom/chartboost/sdk/impl/u;->i:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->height()F

    move-result v3

    :goto_5
    add-float/2addr v3, v1

    cmpg-float v3, v2, v3

    if-ltz v3, :cond_8

    .line 178
    invoke-virtual {v0}, Landroid/graphics/Canvas;->restore()V

    .line 181
    invoke-virtual {v0}, Landroid/graphics/Canvas;->restore()V

    .line 184
    if-eqz p1, :cond_c

    .line 185
    iget-object v1, p0, Lcom/chartboost/sdk/impl/u;->j:Landroid/graphics/Bitmap;

    const/4 v2, 0x0

    invoke-virtual {p1, v1, v6, v6, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 190
    .end local v0    # "canvas":Landroid/graphics/Canvas;
    .restart local p1    # "canvas":Landroid/graphics/Canvas;
    :goto_6
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v1

    long-to-double v1, v1

    const-wide v3, 0x412e848000000000L    # 1000000.0

    div-double/2addr v1, v3

    double-to-long v1, v1

    .line 191
    iget-wide v3, p0, Lcom/chartboost/sdk/impl/u;->c:J

    sub-long/2addr v1, v3

    .line 192
    const-wide/16 v3, 0x0

    const-wide/16 v5, 0x10

    sub-long v1, v5, v1

    invoke-static {v3, v4, v1, v2}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v1

    .line 194
    iget-object v3, p0, Lcom/chartboost/sdk/impl/u;->a:Landroid/os/Handler;

    iget-object v4, p0, Lcom/chartboost/sdk/impl/u;->l:Ljava/lang/Runnable;

    invoke-virtual {v3, v4}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 195
    iget-object v3, p0, Lcom/chartboost/sdk/impl/u;->a:Landroid/os/Handler;

    iget-object v4, p0, Lcom/chartboost/sdk/impl/u;->l:Ljava/lang/Runnable;

    invoke-virtual {v3, v4, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 196
    return-void

    .line 128
    .end local p1    # "canvas":Landroid/graphics/Canvas;
    .restart local v0    # "canvas":Landroid/graphics/Canvas;
    :cond_4
    invoke-virtual {p0}, Lcom/chartboost/sdk/impl/u;->getHeight()I

    move-result v1

    goto/16 :goto_0

    .line 134
    :cond_5
    iget-object v1, p0, Lcom/chartboost/sdk/impl/u;->i:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->height()F

    move-result v1

    goto/16 :goto_1

    .line 139
    :cond_6
    iget-object v1, p0, Lcom/chartboost/sdk/impl/u;->i:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->height()F

    move-result v1

    goto/16 :goto_2

    .line 147
    :cond_7
    iget-object v2, p0, Lcom/chartboost/sdk/impl/u;->g:Landroid/graphics/Path;

    invoke-virtual {v2, v6, v1}, Landroid/graphics/Path;->moveTo(FF)V

    .line 148
    iget-object v2, p0, Lcom/chartboost/sdk/impl/u;->g:Landroid/graphics/Path;

    invoke-virtual {v2, v1, v1}, Landroid/graphics/Path;->lineTo(FF)V

    .line 149
    iget-object v2, p0, Lcom/chartboost/sdk/impl/u;->g:Landroid/graphics/Path;

    mul-float v3, v1, v7

    invoke-virtual {v2, v3, v6}, Landroid/graphics/Path;->lineTo(FF)V

    .line 150
    iget-object v2, p0, Lcom/chartboost/sdk/impl/u;->g:Landroid/graphics/Path;

    invoke-virtual {v2, v1, v6}, Landroid/graphics/Path;->lineTo(FF)V

    goto/16 :goto_3

    .line 161
    :cond_8
    invoke-virtual {v4}, Lcom/chartboost/sdk/Libraries/CBOrientation$Difference;->isOdd()Z

    move-result v3

    if-eqz v3, :cond_9

    iget-object v3, p0, Lcom/chartboost/sdk/impl/u;->i:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->top:F

    .line 162
    :goto_7
    add-float/2addr v3, v2

    .line 165
    invoke-virtual {v0}, Landroid/graphics/Canvas;->save()I

    .line 166
    invoke-virtual {v4}, Lcom/chartboost/sdk/Libraries/CBOrientation$Difference;->isOdd()Z

    move-result v5

    if-eqz v5, :cond_a

    .line 167
    iget-object v5, p0, Lcom/chartboost/sdk/impl/u;->i:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->left:F

    invoke-virtual {v0, v5, v3}, Landroid/graphics/Canvas;->translate(FF)V

    .line 172
    :goto_8
    iget-object v3, p0, Lcom/chartboost/sdk/impl/u;->g:Landroid/graphics/Path;

    iget-object v5, p0, Lcom/chartboost/sdk/impl/u;->e:Landroid/graphics/Paint;

    invoke-virtual {v0, v3, v5}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 175
    invoke-virtual {v0}, Landroid/graphics/Canvas;->restore()V

    .line 160
    mul-float v3, v7, v1

    add-float/2addr v2, v3

    goto/16 :goto_4

    .line 161
    :cond_9
    iget-object v3, p0, Lcom/chartboost/sdk/impl/u;->i:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->left:F

    goto :goto_7

    .line 169
    :cond_a
    iget-object v5, p0, Lcom/chartboost/sdk/impl/u;->i:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->top:F

    invoke-virtual {v0, v3, v5}, Landroid/graphics/Canvas;->translate(FF)V

    goto :goto_8

    .line 160
    :cond_b
    iget-object v3, p0, Lcom/chartboost/sdk/impl/u;->i:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->width()F

    move-result v3

    goto/16 :goto_5

    :cond_c
    move-object p1, v0

    .end local v0    # "canvas":Landroid/graphics/Canvas;
    .restart local p1    # "canvas":Landroid/graphics/Canvas;
    goto/16 :goto_6
.end method

.method protected onWindowVisibilityChanged(I)V
    .locals 2
    .param p1, "visibility"    # I

    .prologue
    .line 202
    invoke-super {p0, p1}, Landroid/view/View;->onWindowVisibilityChanged(I)V

    .line 203
    iget-object v0, p0, Lcom/chartboost/sdk/impl/u;->a:Landroid/os/Handler;

    iget-object v1, p0, Lcom/chartboost/sdk/impl/u;->l:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 205
    if-nez p1, :cond_0

    .line 206
    iget-object v0, p0, Lcom/chartboost/sdk/impl/u;->a:Landroid/os/Handler;

    iget-object v1, p0, Lcom/chartboost/sdk/impl/u;->l:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 207
    :cond_0
    return-void
.end method
