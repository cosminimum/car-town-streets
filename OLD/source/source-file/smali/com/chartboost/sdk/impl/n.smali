.class public Lcom/chartboost/sdk/impl/n;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/chartboost/sdk/impl/n$a;,
        Lcom/chartboost/sdk/impl/n$b;
    }
.end annotation


# static fields
.field private static synthetic a:[I

.field private static synthetic b:[I


# direct methods
.method public static a(Lcom/chartboost/sdk/impl/n$b;Lcom/chartboost/sdk/impl/a;)V
    .locals 1

    .prologue
    .line 39
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/chartboost/sdk/impl/n;->a(Lcom/chartboost/sdk/impl/n$b;Lcom/chartboost/sdk/impl/a;Lcom/chartboost/sdk/impl/n$a;)V

    .line 40
    return-void
.end method

.method public static a(Lcom/chartboost/sdk/impl/n$b;Lcom/chartboost/sdk/impl/a;Lcom/chartboost/sdk/impl/n$a;)V
    .locals 1

    .prologue
    .line 43
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-static {p0, p1, p2, v0}, Lcom/chartboost/sdk/impl/n;->b(Lcom/chartboost/sdk/impl/n$b;Lcom/chartboost/sdk/impl/a;Lcom/chartboost/sdk/impl/n$a;Ljava/lang/Boolean;)V

    .line 44
    return-void
.end method

.method static synthetic a(Lcom/chartboost/sdk/impl/n$b;Lcom/chartboost/sdk/impl/a;Lcom/chartboost/sdk/impl/n$a;Ljava/lang/Boolean;)V
    .locals 0

    .prologue
    .line 82
    invoke-static {p0, p1, p2, p3}, Lcom/chartboost/sdk/impl/n;->c(Lcom/chartboost/sdk/impl/n$b;Lcom/chartboost/sdk/impl/a;Lcom/chartboost/sdk/impl/n$a;Ljava/lang/Boolean;)V

    return-void
.end method

.method static synthetic a()[I
    .locals 3

    .prologue
    .line 20
    sget-object v0, Lcom/chartboost/sdk/impl/n;->a:[I

    if-eqz v0, :cond_0

    :goto_0
    return-object v0

    :cond_0
    invoke-static {}, Lcom/chartboost/sdk/Libraries/CBOrientation$Difference;->values()[Lcom/chartboost/sdk/Libraries/CBOrientation$Difference;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_0
    sget-object v1, Lcom/chartboost/sdk/Libraries/CBOrientation$Difference;->ANGLE_0:Lcom/chartboost/sdk/Libraries/CBOrientation$Difference;

    invoke-virtual {v1}, Lcom/chartboost/sdk/Libraries/CBOrientation$Difference;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_3

    :goto_1
    :try_start_1
    sget-object v1, Lcom/chartboost/sdk/Libraries/CBOrientation$Difference;->ANGLE_180:Lcom/chartboost/sdk/Libraries/CBOrientation$Difference;

    invoke-virtual {v1}, Lcom/chartboost/sdk/Libraries/CBOrientation$Difference;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_2

    :goto_2
    :try_start_2
    sget-object v1, Lcom/chartboost/sdk/Libraries/CBOrientation$Difference;->ANGLE_270:Lcom/chartboost/sdk/Libraries/CBOrientation$Difference;

    invoke-virtual {v1}, Lcom/chartboost/sdk/Libraries/CBOrientation$Difference;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_1

    :goto_3
    :try_start_3
    sget-object v1, Lcom/chartboost/sdk/Libraries/CBOrientation$Difference;->ANGLE_90:Lcom/chartboost/sdk/Libraries/CBOrientation$Difference;

    invoke-virtual {v1}, Lcom/chartboost/sdk/Libraries/CBOrientation$Difference;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_0

    :goto_4
    sput-object v0, Lcom/chartboost/sdk/impl/n;->a:[I

    goto :goto_0

    :catch_0
    move-exception v1

    goto :goto_4

    :catch_1
    move-exception v1

    goto :goto_3

    :catch_2
    move-exception v1

    goto :goto_2

    :catch_3
    move-exception v1

    goto :goto_1
.end method

.method public static b(Lcom/chartboost/sdk/impl/n$b;Lcom/chartboost/sdk/impl/a;Lcom/chartboost/sdk/impl/n$a;)V
    .locals 1

    .prologue
    .line 52
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-static {p0, p1, p2, v0}, Lcom/chartboost/sdk/impl/n;->c(Lcom/chartboost/sdk/impl/n$b;Lcom/chartboost/sdk/impl/a;Lcom/chartboost/sdk/impl/n$a;Ljava/lang/Boolean;)V

    .line 53
    return-void
.end method

.method private static b(Lcom/chartboost/sdk/impl/n$b;Lcom/chartboost/sdk/impl/a;Lcom/chartboost/sdk/impl/n$a;Ljava/lang/Boolean;)V
    .locals 7

    .prologue
    .line 59
    if-eqz p1, :cond_0

    iget-object v0, p1, Lcom/chartboost/sdk/impl/a;->h:Lcom/chartboost/sdk/impl/s;

    if-nez v0, :cond_1

    .line 80
    :cond_0
    :goto_0
    return-void

    .line 64
    :cond_1
    iget-object v0, p1, Lcom/chartboost/sdk/impl/a;->h:Lcom/chartboost/sdk/impl/s;

    invoke-virtual {v0}, Lcom/chartboost/sdk/impl/s;->c()Landroid/view/View;

    move-result-object v1

    .line 65
    if-eqz v1, :cond_0

    .line 70
    invoke-virtual {v1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v6

    .line 71
    invoke-virtual {v6}, Landroid/view/ViewTreeObserver;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 72
    new-instance v0, Lcom/chartboost/sdk/impl/n$1;

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/chartboost/sdk/impl/n$1;-><init>(Landroid/view/View;Lcom/chartboost/sdk/impl/n$b;Lcom/chartboost/sdk/impl/a;Lcom/chartboost/sdk/impl/n$a;Ljava/lang/Boolean;)V

    invoke-virtual {v6, v0}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    goto :goto_0
.end method

.method static synthetic b()[I
    .locals 3

    .prologue
    .line 20
    sget-object v0, Lcom/chartboost/sdk/impl/n;->b:[I

    if-eqz v0, :cond_0

    :goto_0
    return-object v0

    :cond_0
    invoke-static {}, Lcom/chartboost/sdk/impl/n$b;->values()[Lcom/chartboost/sdk/impl/n$b;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_0
    sget-object v1, Lcom/chartboost/sdk/impl/n$b;->c:Lcom/chartboost/sdk/impl/n$b;

    invoke-virtual {v1}, Lcom/chartboost/sdk/impl/n$b;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_5

    :goto_1
    :try_start_1
    sget-object v1, Lcom/chartboost/sdk/impl/n$b;->a:Lcom/chartboost/sdk/impl/n$b;

    invoke-virtual {v1}, Lcom/chartboost/sdk/impl/n$b;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_4

    :goto_2
    :try_start_2
    sget-object v1, Lcom/chartboost/sdk/impl/n$b;->b:Lcom/chartboost/sdk/impl/n$b;

    invoke-virtual {v1}, Lcom/chartboost/sdk/impl/n$b;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_3

    :goto_3
    :try_start_3
    sget-object v1, Lcom/chartboost/sdk/impl/n$b;->d:Lcom/chartboost/sdk/impl/n$b;

    invoke-virtual {v1}, Lcom/chartboost/sdk/impl/n$b;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_2

    :goto_4
    :try_start_4
    sget-object v1, Lcom/chartboost/sdk/impl/n$b;->e:Lcom/chartboost/sdk/impl/n$b;

    invoke-virtual {v1}, Lcom/chartboost/sdk/impl/n$b;->ordinal()I

    move-result v1

    const/4 v2, 0x5

    aput v2, v0, v1
    :try_end_4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4 .. :try_end_4} :catch_1

    :goto_5
    :try_start_5
    sget-object v1, Lcom/chartboost/sdk/impl/n$b;->f:Lcom/chartboost/sdk/impl/n$b;

    invoke-virtual {v1}, Lcom/chartboost/sdk/impl/n$b;->ordinal()I

    move-result v1

    const/4 v2, 0x6

    aput v2, v0, v1
    :try_end_5
    .catch Ljava/lang/NoSuchFieldError; {:try_start_5 .. :try_end_5} :catch_0

    :goto_6
    sput-object v0, Lcom/chartboost/sdk/impl/n;->b:[I

    goto :goto_0

    :catch_0
    move-exception v1

    goto :goto_6

    :catch_1
    move-exception v1

    goto :goto_5

    :catch_2
    move-exception v1

    goto :goto_4

    :catch_3
    move-exception v1

    goto :goto_3

    :catch_4
    move-exception v1

    goto :goto_2

    :catch_5
    move-exception v1

    goto :goto_1
.end method

.method private static c(Lcom/chartboost/sdk/impl/n$b;Lcom/chartboost/sdk/impl/a;Lcom/chartboost/sdk/impl/n$a;Ljava/lang/Boolean;)V
    .locals 18

    .prologue
    .line 84
    const-wide/16 v11, 0x258

    .line 85
    new-instance v13, Landroid/view/animation/AnimationSet;

    const/4 v2, 0x1

    invoke-direct {v13, v2}, Landroid/view/animation/AnimationSet;-><init>(Z)V

    .line 86
    new-instance v2, Landroid/view/animation/AlphaAnimation;

    const/high16 v3, 0x3f800000    # 1.0f

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-direct {v2, v3, v4}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    invoke-virtual {v13, v2}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    .line 89
    if-eqz p1, :cond_0

    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/chartboost/sdk/impl/a;->h:Lcom/chartboost/sdk/impl/s;

    if-nez v2, :cond_1

    .line 327
    :cond_0
    :goto_0
    return-void

    .line 94
    :cond_1
    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/chartboost/sdk/impl/a;->h:Lcom/chartboost/sdk/impl/s;

    invoke-virtual {v2}, Lcom/chartboost/sdk/impl/s;->c()Landroid/view/View;

    move-result-object v14

    .line 95
    if-eqz v14, :cond_0

    .line 101
    invoke-virtual {v14}, Landroid/view/View;->getWidth()I

    move-result v2

    int-to-float v10, v2

    .line 102
    invoke-virtual {v14}, Landroid/view/View;->getHeight()I

    move-result v2

    int-to-float v9, v2

    .line 103
    const/high16 v4, 0x42700000    # 60.0f

    .line 104
    const v15, 0x3ecccccd    # 0.4f

    .line 105
    const/high16 v2, 0x3f800000    # 1.0f

    sub-float/2addr v2, v15

    const/high16 v3, 0x40000000    # 2.0f

    div-float v16, v2, v3

    .line 112
    invoke-static {}, Lcom/chartboost/sdk/Chartboost;->sharedChartboost()Lcom/chartboost/sdk/Chartboost;

    move-result-object v2

    invoke-virtual {v2}, Lcom/chartboost/sdk/Chartboost;->getForcedOrientationDifference()Lcom/chartboost/sdk/Libraries/CBOrientation$Difference;

    move-result-object v17

    .line 114
    invoke-static {}, Lcom/chartboost/sdk/impl/n;->b()[I

    move-result-object v2

    invoke-virtual/range {p0 .. p0}, Lcom/chartboost/sdk/impl/n$b;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_0

    .line 313
    :goto_1
    new-instance v2, Lcom/chartboost/sdk/impl/n$2;

    move-object/from16 v0, p2

    move-object/from16 v1, p1

    invoke-direct {v2, v0, v1}, Lcom/chartboost/sdk/impl/n$2;-><init>(Lcom/chartboost/sdk/impl/n$a;Lcom/chartboost/sdk/impl/a;)V

    invoke-virtual {v13, v2}, Landroid/view/animation/AnimationSet;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 326
    invoke-virtual {v14, v13}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    goto :goto_0

    .line 116
    :pswitch_0
    invoke-static {}, Lcom/chartboost/sdk/impl/n;->a()[I

    move-result-object v2

    invoke-virtual/range {v17 .. v17}, Lcom/chartboost/sdk/Libraries/CBOrientation$Difference;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_1

    .line 131
    invoke-virtual/range {p3 .. p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_5

    new-instance v2, Lcom/chartboost/sdk/impl/p;

    neg-float v3, v4

    const/4 v4, 0x0

    const/high16 v5, 0x40000000    # 2.0f

    div-float v5, v10, v5

    const/high16 v6, 0x40000000    # 2.0f

    div-float v6, v9, v6

    const/4 v7, 0x0

    invoke-direct/range {v2 .. v7}, Lcom/chartboost/sdk/impl/p;-><init>(FFFFZ)V

    .line 135
    :goto_2
    invoke-virtual {v2, v11, v12}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 136
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/view/animation/Animation;->setFillAfter(Z)V

    .line 137
    invoke-virtual {v13, v2}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    .line 139
    invoke-virtual/range {p3 .. p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_6

    new-instance v2, Landroid/view/animation/ScaleAnimation;

    const/high16 v3, 0x3f800000    # 1.0f

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-direct {v2, v15, v3, v15, v4}, Landroid/view/animation/ScaleAnimation;-><init>(FFFF)V

    .line 141
    :goto_3
    invoke-virtual {v2, v11, v12}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 142
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/view/animation/Animation;->setFillAfter(Z)V

    .line 143
    invoke-virtual {v13, v2}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    .line 145
    invoke-static {}, Lcom/chartboost/sdk/impl/n;->a()[I

    move-result-object v2

    invoke-virtual/range {v17 .. v17}, Lcom/chartboost/sdk/Libraries/CBOrientation$Difference;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_2

    .line 160
    invoke-virtual/range {p3 .. p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_a

    new-instance v2, Landroid/view/animation/TranslateAnimation;

    mul-float v3, v10, v16

    const/4 v4, 0x0

    neg-float v5, v9

    mul-float/2addr v5, v15

    const/4 v6, 0x0

    invoke-direct {v2, v3, v4, v5, v6}, Landroid/view/animation/TranslateAnimation;-><init>(FFFF)V

    .line 164
    :goto_4
    invoke-virtual {v2, v11, v12}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 165
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/view/animation/Animation;->setFillAfter(Z)V

    .line 166
    invoke-virtual {v13, v2}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    goto :goto_1

    .line 118
    :pswitch_1
    invoke-virtual/range {p3 .. p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_2

    new-instance v2, Lcom/chartboost/sdk/impl/p;

    neg-float v3, v4

    const/4 v4, 0x0

    const/high16 v5, 0x40000000    # 2.0f

    div-float v5, v10, v5

    const/high16 v6, 0x40000000    # 2.0f

    div-float v6, v9, v6

    const/4 v7, 0x1

    invoke-direct/range {v2 .. v7}, Lcom/chartboost/sdk/impl/p;-><init>(FFFFZ)V

    goto :goto_2

    .line 119
    :cond_2
    new-instance v2, Lcom/chartboost/sdk/impl/p;

    const/4 v3, 0x0

    const/high16 v5, 0x40000000    # 2.0f

    div-float v5, v10, v5

    const/high16 v6, 0x40000000    # 2.0f

    div-float v6, v9, v6

    const/4 v7, 0x1

    invoke-direct/range {v2 .. v7}, Lcom/chartboost/sdk/impl/p;-><init>(FFFFZ)V

    goto :goto_2

    .line 122
    :pswitch_2
    invoke-virtual/range {p3 .. p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_3

    new-instance v3, Lcom/chartboost/sdk/impl/p;

    const/4 v5, 0x0

    const/high16 v2, 0x40000000    # 2.0f

    div-float v6, v10, v2

    const/high16 v2, 0x40000000    # 2.0f

    div-float v7, v9, v2

    const/4 v8, 0x0

    invoke-direct/range {v3 .. v8}, Lcom/chartboost/sdk/impl/p;-><init>(FFFFZ)V

    move-object v2, v3

    goto/16 :goto_2

    .line 123
    :cond_3
    new-instance v2, Lcom/chartboost/sdk/impl/p;

    const/4 v3, 0x0

    neg-float v4, v4

    const/high16 v5, 0x40000000    # 2.0f

    div-float v5, v10, v5

    const/high16 v6, 0x40000000    # 2.0f

    div-float v6, v9, v6

    const/4 v7, 0x0

    invoke-direct/range {v2 .. v7}, Lcom/chartboost/sdk/impl/p;-><init>(FFFFZ)V

    goto/16 :goto_2

    .line 126
    :pswitch_3
    invoke-virtual/range {p3 .. p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_4

    new-instance v3, Lcom/chartboost/sdk/impl/p;

    const/4 v5, 0x0

    const/high16 v2, 0x40000000    # 2.0f

    div-float v6, v10, v2

    const/high16 v2, 0x40000000    # 2.0f

    div-float v7, v9, v2

    const/4 v8, 0x1

    invoke-direct/range {v3 .. v8}, Lcom/chartboost/sdk/impl/p;-><init>(FFFFZ)V

    move-object v2, v3

    goto/16 :goto_2

    .line 127
    :cond_4
    new-instance v2, Lcom/chartboost/sdk/impl/p;

    const/4 v3, 0x0

    neg-float v4, v4

    const/high16 v5, 0x40000000    # 2.0f

    div-float v5, v10, v5

    const/high16 v6, 0x40000000    # 2.0f

    div-float v6, v9, v6

    const/4 v7, 0x1

    invoke-direct/range {v2 .. v7}, Lcom/chartboost/sdk/impl/p;-><init>(FFFFZ)V

    goto/16 :goto_2

    .line 132
    :cond_5
    new-instance v2, Lcom/chartboost/sdk/impl/p;

    const/4 v3, 0x0

    const/high16 v5, 0x40000000    # 2.0f

    div-float v5, v10, v5

    const/high16 v6, 0x40000000    # 2.0f

    div-float v6, v9, v6

    const/4 v7, 0x0

    invoke-direct/range {v2 .. v7}, Lcom/chartboost/sdk/impl/p;-><init>(FFFFZ)V

    goto/16 :goto_2

    .line 140
    :cond_6
    new-instance v2, Landroid/view/animation/ScaleAnimation;

    const/high16 v3, 0x3f800000    # 1.0f

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-direct {v2, v3, v15, v4, v15}, Landroid/view/animation/ScaleAnimation;-><init>(FFFF)V

    goto/16 :goto_3

    .line 147
    :pswitch_4
    invoke-virtual/range {p3 .. p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_7

    new-instance v2, Landroid/view/animation/TranslateAnimation;

    const/4 v3, 0x0

    mul-float v4, v9, v16

    const/4 v5, 0x0

    invoke-direct {v2, v10, v3, v4, v5}, Landroid/view/animation/TranslateAnimation;-><init>(FFFF)V

    goto/16 :goto_4

    .line 148
    :cond_7
    new-instance v2, Landroid/view/animation/TranslateAnimation;

    const/4 v3, 0x0

    neg-float v4, v10

    mul-float/2addr v4, v15

    const/4 v5, 0x0

    mul-float v6, v9, v16

    invoke-direct {v2, v3, v4, v5, v6}, Landroid/view/animation/TranslateAnimation;-><init>(FFFF)V

    goto/16 :goto_4

    .line 151
    :pswitch_5
    invoke-virtual/range {p3 .. p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_8

    new-instance v2, Landroid/view/animation/TranslateAnimation;

    mul-float v3, v10, v16

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-direct {v2, v3, v4, v9, v5}, Landroid/view/animation/TranslateAnimation;-><init>(FFFF)V

    goto/16 :goto_4

    .line 152
    :cond_8
    new-instance v2, Landroid/view/animation/TranslateAnimation;

    const/4 v3, 0x0

    mul-float v4, v10, v16

    const/4 v5, 0x0

    neg-float v6, v9

    mul-float/2addr v6, v15

    invoke-direct {v2, v3, v4, v5, v6}, Landroid/view/animation/TranslateAnimation;-><init>(FFFF)V

    goto/16 :goto_4

    .line 155
    :pswitch_6
    invoke-virtual/range {p3 .. p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_9

    new-instance v2, Landroid/view/animation/TranslateAnimation;

    neg-float v3, v10

    mul-float/2addr v3, v15

    const/4 v4, 0x0

    mul-float v5, v9, v16

    const/4 v6, 0x0

    invoke-direct {v2, v3, v4, v5, v6}, Landroid/view/animation/TranslateAnimation;-><init>(FFFF)V

    goto/16 :goto_4

    .line 156
    :cond_9
    new-instance v2, Landroid/view/animation/TranslateAnimation;

    const/4 v3, 0x0

    const/4 v4, 0x0

    mul-float v5, v9, v16

    invoke-direct {v2, v3, v10, v4, v5}, Landroid/view/animation/TranslateAnimation;-><init>(FFFF)V

    goto/16 :goto_4

    .line 161
    :cond_a
    new-instance v2, Landroid/view/animation/TranslateAnimation;

    const/4 v3, 0x0

    mul-float v4, v10, v16

    const/4 v5, 0x0

    invoke-direct {v2, v3, v4, v5, v9}, Landroid/view/animation/TranslateAnimation;-><init>(FFFF)V

    goto/16 :goto_4

    .line 171
    :pswitch_7
    invoke-static {}, Lcom/chartboost/sdk/impl/n;->a()[I

    move-result-object v2

    invoke-virtual/range {v17 .. v17}, Lcom/chartboost/sdk/Libraries/CBOrientation$Difference;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_3

    .line 186
    invoke-virtual/range {p3 .. p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_e

    new-instance v2, Lcom/chartboost/sdk/impl/p;

    neg-float v3, v4

    const/4 v4, 0x0

    const/high16 v5, 0x40000000    # 2.0f

    div-float v5, v10, v5

    const/high16 v6, 0x40000000    # 2.0f

    div-float v6, v9, v6

    const/4 v7, 0x1

    invoke-direct/range {v2 .. v7}, Lcom/chartboost/sdk/impl/p;-><init>(FFFFZ)V

    .line 190
    :goto_5
    invoke-virtual {v2, v11, v12}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 191
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/view/animation/Animation;->setFillAfter(Z)V

    .line 192
    invoke-virtual {v13, v2}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    .line 194
    invoke-virtual/range {p3 .. p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_f

    new-instance v2, Landroid/view/animation/ScaleAnimation;

    const/high16 v3, 0x3f800000    # 1.0f

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-direct {v2, v15, v3, v15, v4}, Landroid/view/animation/ScaleAnimation;-><init>(FFFF)V

    .line 196
    :goto_6
    invoke-virtual {v2, v11, v12}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 197
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/view/animation/Animation;->setFillAfter(Z)V

    .line 198
    invoke-virtual {v13, v2}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    .line 200
    invoke-static {}, Lcom/chartboost/sdk/impl/n;->a()[I

    move-result-object v2

    invoke-virtual/range {v17 .. v17}, Lcom/chartboost/sdk/Libraries/CBOrientation$Difference;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_4

    .line 215
    invoke-virtual/range {p3 .. p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_13

    new-instance v2, Landroid/view/animation/TranslateAnimation;

    neg-float v3, v10

    mul-float/2addr v3, v15

    const/4 v4, 0x0

    mul-float v5, v9, v16

    const/4 v6, 0x0

    invoke-direct {v2, v3, v4, v5, v6}, Landroid/view/animation/TranslateAnimation;-><init>(FFFF)V

    .line 219
    :goto_7
    invoke-virtual {v2, v11, v12}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 220
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/view/animation/Animation;->setFillAfter(Z)V

    .line 221
    invoke-virtual {v13, v2}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    goto/16 :goto_1

    .line 173
    :pswitch_8
    invoke-virtual/range {p3 .. p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_b

    new-instance v3, Lcom/chartboost/sdk/impl/p;

    const/4 v5, 0x0

    const/high16 v2, 0x40000000    # 2.0f

    div-float v6, v10, v2

    const/high16 v2, 0x40000000    # 2.0f

    div-float v7, v9, v2

    const/4 v8, 0x0

    invoke-direct/range {v3 .. v8}, Lcom/chartboost/sdk/impl/p;-><init>(FFFFZ)V

    move-object v2, v3

    goto :goto_5

    .line 174
    :cond_b
    new-instance v2, Lcom/chartboost/sdk/impl/p;

    const/4 v3, 0x0

    neg-float v4, v4

    const/high16 v5, 0x40000000    # 2.0f

    div-float v5, v10, v5

    const/high16 v6, 0x40000000    # 2.0f

    div-float v6, v9, v6

    const/4 v7, 0x0

    invoke-direct/range {v2 .. v7}, Lcom/chartboost/sdk/impl/p;-><init>(FFFFZ)V

    goto :goto_5

    .line 177
    :pswitch_9
    invoke-virtual/range {p3 .. p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_c

    new-instance v3, Lcom/chartboost/sdk/impl/p;

    const/4 v5, 0x0

    const/high16 v2, 0x40000000    # 2.0f

    div-float v6, v10, v2

    const/high16 v2, 0x40000000    # 2.0f

    div-float v7, v9, v2

    const/4 v8, 0x1

    invoke-direct/range {v3 .. v8}, Lcom/chartboost/sdk/impl/p;-><init>(FFFFZ)V

    move-object v2, v3

    goto/16 :goto_5

    .line 178
    :cond_c
    new-instance v2, Lcom/chartboost/sdk/impl/p;

    const/4 v3, 0x0

    neg-float v4, v4

    const/high16 v5, 0x40000000    # 2.0f

    div-float v5, v10, v5

    const/high16 v6, 0x40000000    # 2.0f

    div-float v6, v9, v6

    const/4 v7, 0x1

    invoke-direct/range {v2 .. v7}, Lcom/chartboost/sdk/impl/p;-><init>(FFFFZ)V

    goto/16 :goto_5

    .line 181
    :pswitch_a
    invoke-virtual/range {p3 .. p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_d

    new-instance v2, Lcom/chartboost/sdk/impl/p;

    neg-float v3, v4

    const/4 v4, 0x0

    const/high16 v5, 0x40000000    # 2.0f

    div-float v5, v10, v5

    const/high16 v6, 0x40000000    # 2.0f

    div-float v6, v9, v6

    const/4 v7, 0x0

    invoke-direct/range {v2 .. v7}, Lcom/chartboost/sdk/impl/p;-><init>(FFFFZ)V

    goto/16 :goto_5

    .line 182
    :cond_d
    new-instance v2, Lcom/chartboost/sdk/impl/p;

    const/4 v3, 0x0

    const/high16 v5, 0x40000000    # 2.0f

    div-float v5, v10, v5

    const/high16 v6, 0x40000000    # 2.0f

    div-float v6, v9, v6

    const/4 v7, 0x0

    invoke-direct/range {v2 .. v7}, Lcom/chartboost/sdk/impl/p;-><init>(FFFFZ)V

    goto/16 :goto_5

    .line 187
    :cond_e
    new-instance v2, Lcom/chartboost/sdk/impl/p;

    const/4 v3, 0x0

    const/high16 v5, 0x40000000    # 2.0f

    div-float v5, v10, v5

    const/high16 v6, 0x40000000    # 2.0f

    div-float v6, v9, v6

    const/4 v7, 0x1

    invoke-direct/range {v2 .. v7}, Lcom/chartboost/sdk/impl/p;-><init>(FFFFZ)V

    goto/16 :goto_5

    .line 195
    :cond_f
    new-instance v2, Landroid/view/animation/ScaleAnimation;

    const/high16 v3, 0x3f800000    # 1.0f

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-direct {v2, v3, v15, v4, v15}, Landroid/view/animation/ScaleAnimation;-><init>(FFFF)V

    goto/16 :goto_6

    .line 202
    :pswitch_b
    invoke-virtual/range {p3 .. p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_10

    new-instance v2, Landroid/view/animation/TranslateAnimation;

    mul-float v3, v10, v16

    const/4 v4, 0x0

    neg-float v5, v9

    mul-float/2addr v5, v15

    const/4 v6, 0x0

    invoke-direct {v2, v3, v4, v5, v6}, Landroid/view/animation/TranslateAnimation;-><init>(FFFF)V

    goto/16 :goto_7

    .line 203
    :cond_10
    new-instance v2, Landroid/view/animation/TranslateAnimation;

    const/4 v3, 0x0

    mul-float v4, v10, v16

    const/4 v5, 0x0

    invoke-direct {v2, v3, v4, v5, v9}, Landroid/view/animation/TranslateAnimation;-><init>(FFFF)V

    goto/16 :goto_7

    .line 206
    :pswitch_c
    invoke-virtual/range {p3 .. p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_11

    new-instance v2, Landroid/view/animation/TranslateAnimation;

    const/4 v3, 0x0

    mul-float v4, v9, v16

    const/4 v5, 0x0

    invoke-direct {v2, v10, v3, v4, v5}, Landroid/view/animation/TranslateAnimation;-><init>(FFFF)V

    goto/16 :goto_7

    .line 207
    :cond_11
    new-instance v2, Landroid/view/animation/TranslateAnimation;

    const/4 v3, 0x0

    neg-float v4, v10

    mul-float/2addr v4, v15

    const/4 v5, 0x0

    mul-float v6, v9, v16

    invoke-direct {v2, v3, v4, v5, v6}, Landroid/view/animation/TranslateAnimation;-><init>(FFFF)V

    goto/16 :goto_7

    .line 210
    :pswitch_d
    invoke-virtual/range {p3 .. p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_12

    new-instance v2, Landroid/view/animation/TranslateAnimation;

    mul-float v3, v10, v16

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-direct {v2, v3, v4, v9, v5}, Landroid/view/animation/TranslateAnimation;-><init>(FFFF)V

    goto/16 :goto_7

    .line 211
    :cond_12
    new-instance v2, Landroid/view/animation/TranslateAnimation;

    const/4 v3, 0x0

    mul-float v4, v10, v16

    const/4 v5, 0x0

    neg-float v6, v9

    mul-float/2addr v6, v15

    invoke-direct {v2, v3, v4, v5, v6}, Landroid/view/animation/TranslateAnimation;-><init>(FFFF)V

    goto/16 :goto_7

    .line 216
    :cond_13
    new-instance v2, Landroid/view/animation/TranslateAnimation;

    const/4 v3, 0x0

    const/4 v4, 0x0

    mul-float v5, v9, v16

    invoke-direct {v2, v3, v10, v4, v5}, Landroid/view/animation/TranslateAnimation;-><init>(FFFF)V

    goto/16 :goto_7

    .line 226
    :pswitch_e
    const/4 v7, 0x0

    const/4 v6, 0x0

    .line 227
    const/4 v5, 0x0

    const/4 v4, 0x0

    .line 228
    invoke-static {}, Lcom/chartboost/sdk/impl/n;->a()[I

    move-result-object v2

    invoke-virtual/range {v17 .. v17}, Lcom/chartboost/sdk/Libraries/CBOrientation$Difference;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_5

    move v9, v4

    move v2, v5

    move v3, v6

    move v4, v7

    .line 246
    :goto_8
    new-instance v5, Landroid/view/animation/TranslateAnimation;

    invoke-direct {v5, v4, v3, v2, v9}, Landroid/view/animation/TranslateAnimation;-><init>(FFFF)V

    .line 247
    invoke-virtual {v5, v11, v12}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 248
    const/4 v2, 0x1

    invoke-virtual {v5, v2}, Landroid/view/animation/Animation;->setFillAfter(Z)V

    .line 249
    invoke-virtual {v13, v5}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    goto/16 :goto_1

    .line 230
    :pswitch_f
    invoke-virtual/range {p3 .. p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_15

    move v2, v9

    .line 231
    :goto_9
    invoke-virtual/range {p3 .. p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_14

    const/4 v9, 0x0

    :cond_14
    move v3, v6

    move v4, v7

    .line 232
    goto :goto_8

    .line 230
    :cond_15
    const/4 v2, 0x0

    goto :goto_9

    .line 234
    :pswitch_10
    invoke-virtual/range {p3 .. p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_16

    neg-float v2, v10

    .line 235
    :goto_a
    invoke-virtual/range {p3 .. p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_17

    const/4 v3, 0x0

    :goto_b
    move v9, v4

    move v4, v2

    move v2, v5

    .line 236
    goto :goto_8

    .line 234
    :cond_16
    const/4 v2, 0x0

    goto :goto_a

    .line 235
    :cond_17
    neg-float v3, v10

    goto :goto_b

    .line 238
    :pswitch_11
    invoke-virtual/range {p3 .. p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_18

    neg-float v2, v9

    .line 239
    :goto_c
    invoke-virtual/range {p3 .. p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_19

    const/4 v3, 0x0

    :goto_d
    move v9, v3

    move v4, v7

    move v3, v6

    .line 240
    goto :goto_8

    .line 238
    :cond_18
    const/4 v2, 0x0

    goto :goto_c

    .line 239
    :cond_19
    neg-float v3, v9

    goto :goto_d

    .line 242
    :pswitch_12
    invoke-virtual/range {p3 .. p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_1b

    move v2, v10

    .line 243
    :goto_e
    invoke-virtual/range {p3 .. p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_1a

    const/4 v10, 0x0

    :cond_1a
    move v9, v4

    move v3, v10

    move v4, v2

    move v2, v5

    goto :goto_8

    .line 242
    :cond_1b
    const/4 v2, 0x0

    goto :goto_e

    .line 254
    :pswitch_13
    const/4 v7, 0x0

    const/4 v6, 0x0

    .line 255
    const/4 v5, 0x0

    const/4 v4, 0x0

    .line 256
    invoke-static {}, Lcom/chartboost/sdk/impl/n;->a()[I

    move-result-object v2

    invoke-virtual/range {v17 .. v17}, Lcom/chartboost/sdk/Libraries/CBOrientation$Difference;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_6

    move v3, v4

    move v2, v5

    move v10, v6

    move v4, v7

    .line 274
    :goto_f
    new-instance v5, Landroid/view/animation/TranslateAnimation;

    invoke-direct {v5, v4, v10, v2, v3}, Landroid/view/animation/TranslateAnimation;-><init>(FFFF)V

    .line 275
    invoke-virtual {v5, v11, v12}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 276
    const/4 v2, 0x1

    invoke-virtual {v5, v2}, Landroid/view/animation/Animation;->setFillAfter(Z)V

    .line 277
    invoke-virtual {v13, v5}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    goto/16 :goto_1

    .line 258
    :pswitch_14
    invoke-virtual/range {p3 .. p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_1c

    neg-float v2, v9

    .line 259
    :goto_10
    invoke-virtual/range {p3 .. p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_1d

    const/4 v3, 0x0

    :goto_11
    move v10, v6

    move v4, v7

    .line 260
    goto :goto_f

    .line 258
    :cond_1c
    const/4 v2, 0x0

    goto :goto_10

    .line 259
    :cond_1d
    neg-float v3, v9

    goto :goto_11

    .line 262
    :pswitch_15
    invoke-virtual/range {p3 .. p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_1f

    move v2, v10

    .line 263
    :goto_12
    invoke-virtual/range {p3 .. p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_1e

    const/4 v10, 0x0

    :cond_1e
    move v3, v4

    move v4, v2

    move v2, v5

    .line 264
    goto :goto_f

    .line 262
    :cond_1f
    const/4 v2, 0x0

    goto :goto_12

    .line 266
    :pswitch_16
    invoke-virtual/range {p3 .. p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_21

    move v2, v9

    .line 267
    :goto_13
    invoke-virtual/range {p3 .. p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_20

    const/4 v9, 0x0

    :cond_20
    move v3, v9

    move v10, v6

    move v4, v7

    .line 268
    goto :goto_f

    .line 266
    :cond_21
    const/4 v2, 0x0

    goto :goto_13

    .line 270
    :pswitch_17
    invoke-virtual/range {p3 .. p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_22

    neg-float v2, v10

    .line 271
    :goto_14
    invoke-virtual/range {p3 .. p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_23

    const/4 v3, 0x0

    :goto_15
    move v10, v3

    move v3, v4

    move v4, v2

    move v2, v5

    goto :goto_f

    .line 270
    :cond_22
    const/4 v2, 0x0

    goto :goto_14

    .line 271
    :cond_23
    neg-float v3, v10

    goto :goto_15

    .line 281
    :pswitch_18
    invoke-virtual/range {p3 .. p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_24

    .line 282
    new-instance v2, Landroid/view/animation/ScaleAnimation;

    const v3, 0x3f19999a    # 0.6f

    const v4, 0x3f8ccccd    # 1.1f

    const v5, 0x3f19999a    # 0.6f

    const v6, 0x3f8ccccd    # 1.1f

    const/4 v7, 0x1

    const/high16 v8, 0x3f000000    # 0.5f

    const/4 v9, 0x1

    const/high16 v10, 0x3f000000    # 0.5f

    invoke-direct/range {v2 .. v10}, Landroid/view/animation/ScaleAnimation;-><init>(FFFFIFIF)V

    .line 283
    long-to-float v3, v11

    const v4, 0x3f19999a    # 0.6f

    mul-float/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v3

    int-to-long v3, v3

    invoke-virtual {v2, v3, v4}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 284
    const-wide/16 v3, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/view/animation/Animation;->setStartOffset(J)V

    .line 285
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/view/animation/Animation;->setFillAfter(Z)V

    .line 286
    invoke-virtual {v13, v2}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    .line 288
    new-instance v2, Landroid/view/animation/ScaleAnimation;

    const/high16 v3, 0x3f800000    # 1.0f

    const v4, 0x3f51745c

    const/high16 v5, 0x3f800000    # 1.0f

    const v6, 0x3f51745c

    const/4 v7, 0x1

    const/high16 v8, 0x3f000000    # 0.5f

    const/4 v9, 0x1

    const/high16 v10, 0x3f000000    # 0.5f

    invoke-direct/range {v2 .. v10}, Landroid/view/animation/ScaleAnimation;-><init>(FFFFIFIF)V

    .line 289
    long-to-float v3, v11

    const v4, 0x3e4ccccc    # 0.19999999f

    mul-float/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v3

    int-to-long v3, v3

    invoke-virtual {v2, v3, v4}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 291
    long-to-float v3, v11

    const v4, 0x3f19999a    # 0.6f

    mul-float/2addr v3, v4

    .line 290
    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v3

    int-to-long v3, v3

    invoke-virtual {v2, v3, v4}, Landroid/view/animation/Animation;->setStartOffset(J)V

    .line 292
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/view/animation/Animation;->setFillAfter(Z)V

    .line 293
    invoke-virtual {v13, v2}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    .line 295
    new-instance v2, Landroid/view/animation/ScaleAnimation;

    const/high16 v3, 0x3f800000    # 1.0f

    const v4, 0x3f8e38e4

    const/high16 v5, 0x3f800000    # 1.0f

    const v6, 0x3f8e38e4

    const/4 v7, 0x1

    const/high16 v8, 0x3f000000    # 0.5f

    const/4 v9, 0x1

    const/high16 v10, 0x3f000000    # 0.5f

    invoke-direct/range {v2 .. v10}, Landroid/view/animation/ScaleAnimation;-><init>(FFFFIFIF)V

    .line 296
    long-to-float v3, v11

    const v4, 0x3dccccc8    # 0.099999964f

    mul-float/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v3

    int-to-long v3, v3

    invoke-virtual {v2, v3, v4}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 297
    long-to-float v3, v11

    const v4, 0x3f4ccccd    # 0.8f

    mul-float/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v3

    int-to-long v3, v3

    invoke-virtual {v2, v3, v4}, Landroid/view/animation/Animation;->setStartOffset(J)V

    .line 298
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/view/animation/Animation;->setFillAfter(Z)V

    .line 299
    invoke-virtual {v13, v2}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    goto/16 :goto_1

    .line 302
    :cond_24
    new-instance v2, Landroid/view/animation/ScaleAnimation;

    const/high16 v3, 0x3f800000    # 1.0f

    const/4 v4, 0x0

    const/high16 v5, 0x3f800000    # 1.0f

    const/4 v6, 0x0

    const/4 v7, 0x1

    const/high16 v8, 0x3f000000    # 0.5f

    const/4 v9, 0x1

    const/high16 v10, 0x3f000000    # 0.5f

    invoke-direct/range {v2 .. v10}, Landroid/view/animation/ScaleAnimation;-><init>(FFFFIFIF)V

    .line 303
    invoke-virtual {v2, v11, v12}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 304
    const-wide/16 v3, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/view/animation/Animation;->setStartOffset(J)V

    .line 305
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/view/animation/Animation;->setFillAfter(Z)V

    .line 306
    invoke-virtual {v13, v2}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    goto/16 :goto_1

    .line 114
    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_7
        :pswitch_18
        :pswitch_0
        :pswitch_e
        :pswitch_13
    .end packed-switch

    .line 116
    :pswitch_data_1
    .packed-switch 0x2
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch

    .line 145
    :pswitch_data_2
    .packed-switch 0x2
        :pswitch_4
        :pswitch_5
        :pswitch_6
    .end packed-switch

    .line 171
    :pswitch_data_3
    .packed-switch 0x2
        :pswitch_8
        :pswitch_9
        :pswitch_a
    .end packed-switch

    .line 200
    :pswitch_data_4
    .packed-switch 0x2
        :pswitch_b
        :pswitch_c
        :pswitch_d
    .end packed-switch

    .line 228
    :pswitch_data_5
    .packed-switch 0x1
        :pswitch_f
        :pswitch_10
        :pswitch_11
        :pswitch_12
    .end packed-switch

    .line 256
    :pswitch_data_6
    .packed-switch 0x1
        :pswitch_14
        :pswitch_15
        :pswitch_16
        :pswitch_17
    .end packed-switch
.end method
