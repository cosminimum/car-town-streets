.class public Lcom/miniclip/nativeJNI/ClearRenderer;
.super Ljava/lang/Object;
.source "ClearRenderer.java"

# interfaces
.implements Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$Renderer;


# static fields
.field private static final NANOSECONDSPERMINISECOND:J = 0xf4240L

.field private static final NANOSECONDSPERSECOND:J = 0x3b9aca00L

.field public static animationInterval:J

.field public static mGLRenderer:Ljava/lang/String;


# instance fields
.field public TouchConvertionRatioX:F

.field public TouchConvertionRatioY:F

.field private curIntervalD:I

.field private firstHeight:I

.field private firstWidth:I

.field private frames:I

.field public hasStarted:Z

.field public hasSwitched:Z

.field private intervalsD:[J

.field private last:J

.field mContext:Landroid/content/Context;

.field private mProfile:Z

.field private start:J


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 23
    const-wide/32 v0, 0x1fca055

    sput-wide v0, Lcom/miniclip/nativeJNI/ClearRenderer;->animationInterval:J

    .line 41
    const-string v0, ""

    sput-object v0, Lcom/miniclip/nativeJNI/ClearRenderer;->mGLRenderer:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .prologue
    const/high16 v0, 0x3f800000    # 1.0f

    const/4 v2, 0x0

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    iput v0, p0, Lcom/miniclip/nativeJNI/ClearRenderer;->TouchConvertionRatioX:F

    .line 26
    iput v0, p0, Lcom/miniclip/nativeJNI/ClearRenderer;->TouchConvertionRatioY:F

    .line 30
    iput-boolean v2, p0, Lcom/miniclip/nativeJNI/ClearRenderer;->hasStarted:Z

    .line 31
    iput-boolean v2, p0, Lcom/miniclip/nativeJNI/ClearRenderer;->hasSwitched:Z

    .line 32
    iput v2, p0, Lcom/miniclip/nativeJNI/ClearRenderer;->frames:I

    .line 34
    const/16 v0, 0x64

    new-array v0, v0, [J

    iput-object v0, p0, Lcom/miniclip/nativeJNI/ClearRenderer;->intervalsD:[J

    .line 35
    iput v2, p0, Lcom/miniclip/nativeJNI/ClearRenderer;->curIntervalD:I

    .line 36
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/miniclip/nativeJNI/ClearRenderer;->start:J

    .line 37
    iput-boolean v2, p0, Lcom/miniclip/nativeJNI/ClearRenderer;->mProfile:Z

    .line 39
    iput v2, p0, Lcom/miniclip/nativeJNI/ClearRenderer;->firstWidth:I

    .line 40
    iput v2, p0, Lcom/miniclip/nativeJNI/ClearRenderer;->firstHeight:I

    return-void
.end method


# virtual methods
.method public handleActionCancel([I[F[F)V
    .locals 3
    .param p1, "id"    # [I
    .param p2, "x"    # [F
    .param p3, "y"    # [F

    .prologue
    .line 270
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p2

    if-ge v0, v1, :cond_0

    .line 271
    aget v1, p2, v0

    iget v2, p0, Lcom/miniclip/nativeJNI/ClearRenderer;->TouchConvertionRatioX:F

    mul-float/2addr v1, v2

    aput v1, p2, v0

    .line 272
    aget v1, p3, v0

    iget v2, p0, Lcom/miniclip/nativeJNI/ClearRenderer;->TouchConvertionRatioY:F

    mul-float/2addr v1, v2

    aput v1, p3, v0

    .line 270
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 274
    :cond_0
    invoke-static {p1, p2, p3}, Lcom/miniclip/nativeJNI/CocoJNI;->MtouchesCancel([I[F[F)V

    .line 275
    return-void
.end method

.method public handleActionDown(IFF)V
    .locals 2
    .param p1, "id"    # I
    .param p2, "x"    # F
    .param p3, "y"    # F

    .prologue
    .line 258
    iget v0, p0, Lcom/miniclip/nativeJNI/ClearRenderer;->TouchConvertionRatioX:F

    mul-float/2addr v0, p2

    iget v1, p0, Lcom/miniclip/nativeJNI/ClearRenderer;->TouchConvertionRatioY:F

    mul-float/2addr v1, p3

    invoke-static {p1, v0, v1}, Lcom/miniclip/nativeJNI/CocoJNI;->MtouchesBegin(IFF)V

    .line 260
    return-void
.end method

.method public handleActionMove([I[F[F)V
    .locals 3
    .param p1, "id"    # [I
    .param p2, "x"    # [F
    .param p3, "y"    # [F

    .prologue
    .line 279
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p2

    if-ge v0, v1, :cond_0

    .line 280
    aget v1, p2, v0

    iget v2, p0, Lcom/miniclip/nativeJNI/ClearRenderer;->TouchConvertionRatioX:F

    mul-float/2addr v1, v2

    aput v1, p2, v0

    .line 281
    aget v1, p3, v0

    iget v2, p0, Lcom/miniclip/nativeJNI/ClearRenderer;->TouchConvertionRatioY:F

    mul-float/2addr v1, v2

    aput v1, p3, v0

    .line 279
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 284
    :cond_0
    invoke-static {p1, p2, p3}, Lcom/miniclip/nativeJNI/CocoJNI;->MtouchesMove([I[F[F)V

    .line 285
    return-void
.end method

.method public handleActionUp(IFF)V
    .locals 2
    .param p1, "id"    # I
    .param p2, "x"    # F
    .param p3, "y"    # F

    .prologue
    .line 264
    iget v0, p0, Lcom/miniclip/nativeJNI/ClearRenderer;->TouchConvertionRatioX:F

    mul-float/2addr v0, p2

    iget v1, p0, Lcom/miniclip/nativeJNI/ClearRenderer;->TouchConvertionRatioY:F

    mul-float/2addr v1, p3

    invoke-static {p1, v0, v1}, Lcom/miniclip/nativeJNI/CocoJNI;->MtouchesEnd(IFF)V

    .line 266
    return-void
.end method

.method public handleOnPause()V
    .locals 0

    .prologue
    .line 289
    invoke-static {}, Lcom/miniclip/nativeJNI/CocoJNI;->Mpause()V

    .line 290
    return-void
.end method

.method public handleOnResume()V
    .locals 0

    .prologue
    .line 294
    invoke-static {}, Lcom/miniclip/nativeJNI/CocoJNI;->Mresume()V

    .line 295
    return-void
.end method

.method public onDrawFrame(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 21
    .param p1, "gl"    # Ljavax/microedition/khronos/opengles/GL10;

    .prologue
    .line 143
    const/16 v10, 0x28

    .line 144
    .local v10, "showSecondIntro":I
    const/16 v11, 0x28

    .line 145
    .local v11, "startGame":I
    const/16 v12, 0x50

    .line 147
    .local v12, "switchToGame":I
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/miniclip/nativeJNI/ClearRenderer;->mContext:Landroid/content/Context;

    check-cast v13, Lcom/miniclip/nativeJNI/cocojava;

    sget-boolean v13, Lcom/miniclip/nativeJNI/cocojava;->mENOUGH_MEMORY:Z

    if-nez v13, :cond_0

    .line 254
    :goto_0
    return-void

    .line 151
    :cond_0
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/miniclip/nativeJNI/ClearRenderer;->hasStarted:Z

    if-nez v13, :cond_2

    .line 153
    move-object/from16 v0, p0

    iget v13, v0, Lcom/miniclip/nativeJNI/ClearRenderer;->frames:I

    if-le v13, v10, :cond_1

    sget-boolean v13, Lcom/miniclip/nativeJNI/cocojava;->mHasSecondIntro:Z

    if-eqz v13, :cond_1

    .line 155
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/miniclip/nativeJNI/ClearRenderer;->mContext:Landroid/content/Context;

    check-cast v13, Landroid/app/Activity;

    new-instance v14, Lcom/miniclip/nativeJNI/ClearRenderer$1;

    move-object/from16 v0, p0

    invoke-direct {v14, v0}, Lcom/miniclip/nativeJNI/ClearRenderer$1;-><init>(Lcom/miniclip/nativeJNI/ClearRenderer;)V

    invoke-virtual {v13, v14}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 164
    :cond_1
    move-object/from16 v0, p0

    iget v13, v0, Lcom/miniclip/nativeJNI/ClearRenderer;->frames:I

    if-le v13, v11, :cond_5

    .line 166
    const/16 v13, 0x1f01

    invoke-static {v13}, Landroid/opengl/GLES10;->glGetString(I)Ljava/lang/String;

    move-result-object v13

    sput-object v13, Lcom/miniclip/nativeJNI/ClearRenderer;->mGLRenderer:Ljava/lang/String;

    .line 167
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/miniclip/nativeJNI/ClearRenderer;->mContext:Landroid/content/Context;

    check-cast v13, Lcom/miniclip/nativeJNI/cocojava;

    invoke-virtual {v13}, Lcom/miniclip/nativeJNI/cocojava;->createResources()V

    .line 168
    const-string v13, "GL_RENDERER"

    sget-object v14, Lcom/miniclip/nativeJNI/ClearRenderer;->mGLRenderer:Ljava/lang/String;

    invoke-static {v13, v14}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 169
    const-string v13, "JAVAINFO"

    const-string v14, "assets unpacked"

    invoke-static {v13, v14}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 170
    const-string v13, "JAVAINFO"

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/miniclip/nativeJNI/ClearRenderer;->mContext:Landroid/content/Context;

    invoke-virtual {v14}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 171
    invoke-static {}, Lcom/miniclip/nativeJNI/CocoJNI;->Mrun()V

    .line 173
    const/4 v13, 0x1

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/miniclip/nativeJNI/ClearRenderer;->hasStarted:Z

    .line 175
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/miniclip/nativeJNI/ClearRenderer;->mContext:Landroid/content/Context;

    check-cast v13, Landroid/app/Activity;

    new-instance v14, Lcom/miniclip/nativeJNI/ClearRenderer$2;

    move-object/from16 v0, p0

    invoke-direct {v14, v0}, Lcom/miniclip/nativeJNI/ClearRenderer$2;-><init>(Lcom/miniclip/nativeJNI/ClearRenderer;)V

    invoke-virtual {v13, v14}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 191
    :cond_2
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/miniclip/nativeJNI/ClearRenderer;->hasSwitched:Z

    if-nez v13, :cond_3

    .line 193
    move-object/from16 v0, p0

    iget v13, v0, Lcom/miniclip/nativeJNI/ClearRenderer;->frames:I

    if-le v13, v12, :cond_6

    .line 195
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->setContentToGl()V

    .line 196
    const/4 v13, 0x1

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/miniclip/nativeJNI/ClearRenderer;->hasSwitched:Z

    .line 204
    :cond_3
    :goto_1
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v8

    .line 205
    .local v8, "now":J
    move-object/from16 v0, p0

    iget-wide v13, v0, Lcom/miniclip/nativeJNI/ClearRenderer;->last:J

    sub-long v6, v8, v13

    .line 218
    .local v6, "interval":J
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/miniclip/nativeJNI/ClearRenderer;->mProfile:Z

    if-eqz v13, :cond_4

    .line 219
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v13

    move-object/from16 v0, p0

    iput-wide v13, v0, Lcom/miniclip/nativeJNI/ClearRenderer;->start:J

    .line 220
    :cond_4
    invoke-static {}, Lcom/miniclip/nativeJNI/CocoJNI;->Mrender()V

    .line 221
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/miniclip/nativeJNI/ClearRenderer;->mProfile:Z

    if-eqz v13, :cond_8

    .line 223
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v3

    .line 224
    .local v3, "finish":J
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/miniclip/nativeJNI/ClearRenderer;->intervalsD:[J

    move-object/from16 v0, p0

    iget v14, v0, Lcom/miniclip/nativeJNI/ClearRenderer;->curIntervalD:I

    move-object/from16 v0, p0

    iget-wide v15, v0, Lcom/miniclip/nativeJNI/ClearRenderer;->start:J

    sub-long v15, v3, v15

    aput-wide v15, v13, v14

    .line 225
    move-object/from16 v0, p0

    iget v13, v0, Lcom/miniclip/nativeJNI/ClearRenderer;->curIntervalD:I

    add-int/lit8 v13, v13, 0x1

    move-object/from16 v0, p0

    iput v13, v0, Lcom/miniclip/nativeJNI/ClearRenderer;->curIntervalD:I

    .line 226
    move-object/from16 v0, p0

    iget v13, v0, Lcom/miniclip/nativeJNI/ClearRenderer;->curIntervalD:I

    rem-int/lit8 v13, v13, 0x64

    move-object/from16 v0, p0

    iput v13, v0, Lcom/miniclip/nativeJNI/ClearRenderer;->curIntervalD:I

    .line 227
    move-object/from16 v0, p0

    iget v13, v0, Lcom/miniclip/nativeJNI/ClearRenderer;->curIntervalD:I

    if-nez v13, :cond_8

    .line 229
    const-wide/16 v1, 0x0

    .line 230
    .local v1, "avgInterval":J
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_2
    const/16 v13, 0x64

    if-ge v5, v13, :cond_7

    .line 231
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/miniclip/nativeJNI/ClearRenderer;->intervalsD:[J

    aget-wide v13, v13, v5

    add-long/2addr v1, v13

    .line 230
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .line 186
    .end local v1    # "avgInterval":J
    .end local v3    # "finish":J
    .end local v5    # "i":I
    .end local v6    # "interval":J
    .end local v8    # "now":J
    :cond_5
    move-object/from16 v0, p0

    iget v13, v0, Lcom/miniclip/nativeJNI/ClearRenderer;->frames:I

    add-int/lit8 v13, v13, 0x1

    move-object/from16 v0, p0

    iput v13, v0, Lcom/miniclip/nativeJNI/ClearRenderer;->frames:I

    goto/16 :goto_0

    .line 200
    :cond_6
    move-object/from16 v0, p0

    iget v13, v0, Lcom/miniclip/nativeJNI/ClearRenderer;->frames:I

    add-int/lit8 v13, v13, 0x1

    move-object/from16 v0, p0

    iput v13, v0, Lcom/miniclip/nativeJNI/ClearRenderer;->frames:I

    goto :goto_1

    .line 232
    .restart local v1    # "avgInterval":J
    .restart local v3    # "finish":J
    .restart local v5    # "i":I
    .restart local v6    # "interval":J
    .restart local v8    # "now":J
    :cond_7
    const-wide/16 v13, 0x64

    div-long/2addr v1, v13

    .line 233
    const-string v13, "GLView"

    const-string v14, "average draw interval: %d"

    const/4 v15, 0x1

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    const-wide/16 v17, 0x3e8

    div-long v17, v1, v17

    invoke-static/range {v17 .. v18}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v17

    aput-object v17, v15, v16

    invoke-static {v14, v15}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 234
    const-string v13, "GLView"

    const-string v14, "last draw interval: %d"

    const/4 v15, 0x1

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/ClearRenderer;->intervalsD:[J

    move-object/from16 v17, v0

    const/16 v18, 0x0

    aget-wide v17, v17, v18

    const-wide/16 v19, 0x3e8

    div-long v17, v17, v19

    invoke-static/range {v17 .. v18}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v17

    aput-object v17, v15, v16

    invoke-static {v14, v15}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 246
    .end local v1    # "avgInterval":J
    .end local v3    # "finish":J
    .end local v5    # "i":I
    :cond_8
    sget-wide v13, Lcom/miniclip/nativeJNI/ClearRenderer;->animationInterval:J

    cmp-long v13, v6, v13

    if-gez v13, :cond_9

    .line 249
    :try_start_0
    sget-wide v13, Lcom/miniclip/nativeJNI/ClearRenderer;->animationInterval:J

    sub-long/2addr v13, v6

    const-wide/16 v15, 0x2

    mul-long/2addr v13, v15

    const-wide/32 v15, 0xf4240

    div-long/2addr v13, v15

    invoke-static {v13, v14}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 253
    :cond_9
    :goto_3
    move-object/from16 v0, p0

    iput-wide v8, v0, Lcom/miniclip/nativeJNI/ClearRenderer;->last:J

    goto/16 :goto_0

    .line 250
    :catch_0
    move-exception v13

    goto :goto_3
.end method

.method public onSurfaceChanged(Ljavax/microedition/khronos/opengles/GL10;II)V
    .locals 11
    .param p1, "gl"    # Ljavax/microedition/khronos/opengles/GL10;
    .param p2, "w"    # I
    .param p3, "h"    # I

    .prologue
    const/4 v10, 0x2

    const/high16 v9, 0x42480000    # 50.0f

    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 55
    invoke-static {}, Lcom/miniclip/nativeJNI/CocoJNI;->MrestoreContext()V

    .line 57
    const-string v3, "Dim"

    const-string v4, "width: %d, height: %d"

    new-array v5, v10, [Ljava/lang/Object;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v7

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v8

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 59
    if-ne p2, p3, :cond_0

    .line 139
    :goto_0
    return-void

    .line 64
    :cond_0
    sget-boolean v3, Lcom/miniclip/nativeJNI/cocojava;->mINGAME_LANDSCAPE:Z

    if-eqz v3, :cond_1

    if-le p3, p2, :cond_1

    .line 65
    move v1, p2

    .line 66
    .local v1, "temp":I
    move p2, p3

    .line 67
    move p3, v1

    .line 70
    .end local v1    # "temp":I
    :cond_1
    const-string v3, "After Hack Dim"

    const-string v4, "width: %d, height: %d"

    new-array v5, v10, [Ljava/lang/Object;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v7

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v8

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 78
    sget-boolean v3, Lcom/miniclip/nativeJNI/cocojava;->mHAS_RETINA:Z

    if-eqz v3, :cond_2

    .line 81
    sget v3, Lcom/miniclip/nativeJNI/cocojava;->mWidth:I

    const/16 v4, 0x31f

    if-le v3, v4, :cond_2

    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->getNumCores()I

    move-result v3

    if-le v3, v8, :cond_2

    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->getTotalRAM()I

    move-result v3

    const v4, 0x1e848000

    if-le v3, v4, :cond_2

    .line 83
    invoke-static {v8}, Lcom/miniclip/nativeJNI/CocoJNI;->MsetIsRetina(I)V

    .line 87
    :cond_2
    sget-boolean v3, Lcom/miniclip/nativeJNI/cocojava;->mUSE_ADS_VERTICAL:Z

    if-eqz v3, :cond_5

    .line 89
    iget v3, p0, Lcom/miniclip/nativeJNI/ClearRenderer;->firstWidth:I

    if-eqz v3, :cond_3

    iget v3, p0, Lcom/miniclip/nativeJNI/ClearRenderer;->firstHeight:I

    if-nez v3, :cond_4

    .line 91
    :cond_3
    iput p2, p0, Lcom/miniclip/nativeJNI/ClearRenderer;->firstWidth:I

    .line 92
    iput p3, p0, Lcom/miniclip/nativeJNI/ClearRenderer;->firstHeight:I

    .line 94
    :cond_4
    iget v3, p0, Lcom/miniclip/nativeJNI/ClearRenderer;->firstWidth:I

    sget v4, Lcom/miniclip/nativeJNI/cocojava;->mDensity:F

    mul-float/2addr v4, v9

    float-to-int v4, v4

    sub-int v2, v3, v4

    .line 95
    .local v2, "w2":I
    iget v0, p0, Lcom/miniclip/nativeJNI/ClearRenderer;->firstHeight:I

    .line 96
    .local v0, "h2":I
    invoke-static {v7, v7, p2, p3}, Landroid/opengl/GLES10;->glViewport(IIII)V

    .line 97
    invoke-static {p2, p3}, Lcom/miniclip/nativeJNI/CocoJNI;->MrealDisplayInfo(II)V

    .line 98
    invoke-static {v2, v0}, Lcom/miniclip/nativeJNI/CocoJNI;->MdisplayInfo(II)V

    goto :goto_0

    .line 100
    .end local v0    # "h2":I
    .end local v2    # "w2":I
    :cond_5
    sget-boolean v3, Lcom/miniclip/nativeJNI/cocojava;->mUSE_ADS_HORIZONTAL:Z

    if-eqz v3, :cond_8

    .line 102
    iget v3, p0, Lcom/miniclip/nativeJNI/ClearRenderer;->firstWidth:I

    if-eqz v3, :cond_6

    iget v3, p0, Lcom/miniclip/nativeJNI/ClearRenderer;->firstHeight:I

    if-nez v3, :cond_7

    .line 104
    :cond_6
    iput p2, p0, Lcom/miniclip/nativeJNI/ClearRenderer;->firstWidth:I

    .line 105
    iput p3, p0, Lcom/miniclip/nativeJNI/ClearRenderer;->firstHeight:I

    .line 107
    :cond_7
    iget v2, p0, Lcom/miniclip/nativeJNI/ClearRenderer;->firstWidth:I

    .line 108
    .restart local v2    # "w2":I
    iget v3, p0, Lcom/miniclip/nativeJNI/ClearRenderer;->firstHeight:I

    sget v4, Lcom/miniclip/nativeJNI/cocojava;->mDensity:F

    mul-float/2addr v4, v9

    float-to-int v4, v4

    sub-int v0, v3, v4

    .line 109
    .restart local v0    # "h2":I
    invoke-static {v7, v7, p2, p3}, Landroid/opengl/GLES10;->glViewport(IIII)V

    .line 110
    invoke-static {p2, p3}, Lcom/miniclip/nativeJNI/CocoJNI;->MrealDisplayInfo(II)V

    .line 111
    invoke-static {v2, v0}, Lcom/miniclip/nativeJNI/CocoJNI;->MdisplayInfo(II)V

    goto/16 :goto_0

    .line 113
    .end local v0    # "h2":I
    .end local v2    # "w2":I
    :cond_8
    sget-boolean v3, Lcom/miniclip/nativeJNI/cocojava;->mMinimumResolutionSD:Z

    if-eqz v3, :cond_9

    .line 115
    invoke-static {p2, p3}, Lcom/miniclip/nativeJNI/CocoJNI;->MrealDisplayInfo(II)V

    .line 116
    sget v3, Lcom/miniclip/nativeJNI/cocojava;->mWidth:I

    sget v4, Lcom/miniclip/nativeJNI/cocojava;->mHeight:I

    invoke-static {v3, v4}, Lcom/miniclip/nativeJNI/CocoJNI;->MdisplayInfo(II)V

    goto/16 :goto_0

    .line 135
    :cond_9
    invoke-static {p2, p3}, Lcom/miniclip/nativeJNI/CocoJNI;->MrealDisplayInfo(II)V

    .line 136
    invoke-static {p2, p3}, Lcom/miniclip/nativeJNI/CocoJNI;->MdisplayInfo(II)V

    goto/16 :goto_0
.end method

.method public onSurfaceCreated(Ljavax/microedition/khronos/opengles/GL10;Ljavax/microedition/khronos/egl/EGLConfig;)V
    .locals 2
    .param p1, "gl"    # Ljavax/microedition/khronos/opengles/GL10;
    .param p2, "config"    # Ljavax/microedition/khronos/egl/EGLConfig;

    .prologue
    .line 50
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miniclip/nativeJNI/ClearRenderer;->last:J

    .line 51
    return-void
.end method

.method public setContext(Landroid/content/Context;)V
    .locals 0
    .param p1, "c"    # Landroid/content/Context;

    .prologue
    .line 45
    iput-object p1, p0, Lcom/miniclip/nativeJNI/ClearRenderer;->mContext:Landroid/content/Context;

    .line 46
    return-void
.end method
