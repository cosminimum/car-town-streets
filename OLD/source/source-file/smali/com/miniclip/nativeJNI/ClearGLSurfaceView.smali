.class public Lcom/miniclip/nativeJNI/ClearGLSurfaceView;
.super Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;
.source "ClearGLSurfaceView.java"


# instance fields
.field mContext:Landroid/content/Context;

.field mRenderer:Lcom/miniclip/nativeJNI/ClearRenderer;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v2, 0x1

    .line 14
    invoke-direct {p0, p1}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;-><init>(Landroid/content/Context;)V

    .line 15
    iput-object p1, p0, Lcom/miniclip/nativeJNI/ClearGLSurfaceView;->mContext:Landroid/content/Context;

    .line 17
    sget-boolean v0, Lcom/miniclip/nativeJNI/cocojava;->mUSE_PRESERVE_CONTEXT:Z

    if-eqz v0, :cond_0

    sget-boolean v0, Lcom/miniclip/nativeJNI/cocojava;->mHAS_RETINA:Z

    if-eqz v0, :cond_0

    sget v0, Lcom/miniclip/nativeJNI/cocojava;->mWidth:I

    const/16 v1, 0x31f

    if-le v0, v1, :cond_0

    .line 21
    invoke-virtual {p0, v2}, Lcom/miniclip/nativeJNI/ClearGLSurfaceView;->setPreserveEGLContextOnPause(Z)V

    .line 22
    invoke-static {v2}, Lcom/miniclip/nativeJNI/CocoJNI;->MpreserveContext(I)V

    .line 26
    :cond_0
    return-void
.end method

.method private dumpEvent(Landroid/view/MotionEvent;)V
    .locals 10
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v9, 0x6

    const/4 v8, 0x5

    const/4 v7, 0x2

    .line 132
    const/16 v5, 0xa

    new-array v3, v5, [Ljava/lang/String;

    const/4 v5, 0x0

    const-string v6, "DOWN"

    aput-object v6, v3, v5

    const/4 v5, 0x1

    const-string v6, "UP"

    aput-object v6, v3, v5

    const-string v5, "MOVE"

    aput-object v5, v3, v7

    const/4 v5, 0x3

    const-string v6, "CANCEL"

    aput-object v6, v3, v5

    const/4 v5, 0x4

    const-string v6, "OUTSIDE"

    aput-object v6, v3, v5

    const-string v5, "POINTER_DOWN"

    aput-object v5, v3, v8

    const-string v5, "POINTER_UP"

    aput-object v5, v3, v9

    const/4 v5, 0x7

    const-string v6, "7?"

    aput-object v6, v3, v5

    const/16 v5, 0x8

    const-string v6, "8?"

    aput-object v6, v3, v5

    const/16 v5, 0x9

    const-string v6, "9?"

    aput-object v6, v3, v5

    .line 134
    .local v3, "names":[Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 135
    .local v4, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    .line 136
    .local v0, "action":I
    and-int/lit16 v1, v0, 0xff

    .line 137
    .local v1, "actionCode":I
    if-ne v1, v7, :cond_0

    .line 157
    :goto_0
    return-void

    .line 139
    :cond_0
    const-string v5, "event ACTION_"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    aget-object v6, v3, v1

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 140
    if-eq v1, v8, :cond_1

    if-ne v1, v9, :cond_2

    .line 142
    :cond_1
    const-string v5, "(pid "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    shr-int/lit8 v6, v0, 0x8

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 144
    const-string v5, ")"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 146
    :cond_2
    const-string v5, "["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 147
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v5

    if-ge v2, v5, :cond_4

    .line 148
    const-string v5, "#"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 149
    const-string v5, "(pid "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 150
    const-string v5, ")="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getX(I)F

    move-result v6

    float-to-int v6, v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 151
    const-string v5, ","

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getY(I)F

    move-result v6

    float-to-int v6, v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 152
    add-int/lit8 v5, v2, 0x1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v6

    if-ge v5, v6, :cond_3

    .line 153
    const-string v5, ";"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 147
    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 155
    :cond_4
    const-string v5, "]"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 156
    const-string v5, "ClearGLSurefaceView"

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method


# virtual methods
.method public onPause()V
    .locals 1

    .prologue
    .line 160
    new-instance v0, Lcom/miniclip/nativeJNI/ClearGLSurfaceView$7;

    invoke-direct {v0, p0}, Lcom/miniclip/nativeJNI/ClearGLSurfaceView$7;-><init>(Lcom/miniclip/nativeJNI/ClearGLSurfaceView;)V

    invoke-virtual {p0, v0}, Lcom/miniclip/nativeJNI/ClearGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    .line 167
    invoke-super {p0}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->onPause()V

    .line 168
    return-void
.end method

.method public onResume()V
    .locals 1

    .prologue
    .line 171
    new-instance v0, Lcom/miniclip/nativeJNI/ClearGLSurfaceView$8;

    invoke-direct {v0, p0}, Lcom/miniclip/nativeJNI/ClearGLSurfaceView$8;-><init>(Lcom/miniclip/nativeJNI/ClearGLSurfaceView;)V

    invoke-virtual {p0, v0}, Lcom/miniclip/nativeJNI/ClearGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    .line 178
    invoke-super {p0}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->onResume()V

    .line 179
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 24
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 41
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v12

    .line 42
    .local v12, "pointerNumber":I
    new-array v9, v12, [I

    .line 43
    .local v9, "ids":[I
    new-array v0, v12, [F

    move-object/from16 v17, v0

    .line 44
    .local v17, "xs":[F
    new-array v0, v12, [F

    move-object/from16 v22, v0

    .line 46
    .local v22, "ys":[F
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    if-ge v4, v12, :cond_0

    .line 47
    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v23

    aput v23, v9, v4

    .line 48
    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Landroid/view/MotionEvent;->getX(I)F

    move-result v23

    aput v23, v17, v4

    .line 49
    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Landroid/view/MotionEvent;->getY(I)F

    move-result v23

    aput v23, v22, v4

    .line 46
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 52
    :cond_0
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v23

    move/from16 v0, v23

    and-int/lit16 v0, v0, 0xff

    move/from16 v23, v0

    packed-switch v23, :pswitch_data_0

    .line 128
    :goto_1
    :pswitch_0
    const/16 v23, 0x1

    return v23

    .line 54
    :pswitch_1
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v23

    shr-int/lit8 v11, v23, 0x8

    .line 55
    .local v11, "indexPointerDown":I
    move-object/from16 v0, p1

    invoke-virtual {v0, v11}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v6

    .line 56
    .local v6, "idPointerDown":I
    move-object/from16 v0, p1

    invoke-virtual {v0, v11}, Landroid/view/MotionEvent;->getX(I)F

    move-result v14

    .line 57
    .local v14, "xPointerDown":F
    move-object/from16 v0, p1

    invoke-virtual {v0, v11}, Landroid/view/MotionEvent;->getY(I)F

    move-result v19

    .line 59
    .local v19, "yPointerDown":F
    new-instance v23, Lcom/miniclip/nativeJNI/ClearGLSurfaceView$1;

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    move/from16 v2, v19

    invoke-direct {v0, v1, v6, v14, v2}, Lcom/miniclip/nativeJNI/ClearGLSurfaceView$1;-><init>(Lcom/miniclip/nativeJNI/ClearGLSurfaceView;IFF)V

    move-object/from16 v0, p0

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Lcom/miniclip/nativeJNI/ClearGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    goto :goto_1

    .line 69
    .end local v6    # "idPointerDown":I
    .end local v11    # "indexPointerDown":I
    .end local v14    # "xPointerDown":F
    .end local v19    # "yPointerDown":F
    :pswitch_2
    const/16 v23, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v5

    .line 70
    .local v5, "idDown":I
    const/16 v23, 0x0

    aget v13, v17, v23

    .line 71
    .local v13, "xDown":F
    const/16 v23, 0x0

    aget v18, v22, v23

    .line 73
    .local v18, "yDown":F
    new-instance v23, Lcom/miniclip/nativeJNI/ClearGLSurfaceView$2;

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    move/from16 v2, v18

    invoke-direct {v0, v1, v5, v13, v2}, Lcom/miniclip/nativeJNI/ClearGLSurfaceView$2;-><init>(Lcom/miniclip/nativeJNI/ClearGLSurfaceView;IFF)V

    move-object/from16 v0, p0

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Lcom/miniclip/nativeJNI/ClearGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    goto :goto_1

    .line 82
    .end local v5    # "idDown":I
    .end local v13    # "xDown":F
    .end local v18    # "yDown":F
    :pswitch_3
    new-instance v23, Lcom/miniclip/nativeJNI/ClearGLSurfaceView$3;

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    move-object/from16 v2, v17

    move-object/from16 v3, v22

    invoke-direct {v0, v1, v9, v2, v3}, Lcom/miniclip/nativeJNI/ClearGLSurfaceView$3;-><init>(Lcom/miniclip/nativeJNI/ClearGLSurfaceView;[I[F[F)V

    move-object/from16 v0, p0

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Lcom/miniclip/nativeJNI/ClearGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    goto :goto_1

    .line 91
    :pswitch_4
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v23

    shr-int/lit8 v10, v23, 0x8

    .line 92
    .local v10, "indexPointUp":I
    move-object/from16 v0, p1

    invoke-virtual {v0, v10}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v7

    .line 93
    .local v7, "idPointerUp":I
    move-object/from16 v0, p1

    invoke-virtual {v0, v10}, Landroid/view/MotionEvent;->getX(I)F

    move-result v15

    .line 94
    .local v15, "xPointerUp":F
    move-object/from16 v0, p1

    invoke-virtual {v0, v10}, Landroid/view/MotionEvent;->getY(I)F

    move-result v20

    .line 96
    .local v20, "yPointerUp":F
    new-instance v23, Lcom/miniclip/nativeJNI/ClearGLSurfaceView$4;

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    move/from16 v2, v20

    invoke-direct {v0, v1, v7, v15, v2}, Lcom/miniclip/nativeJNI/ClearGLSurfaceView$4;-><init>(Lcom/miniclip/nativeJNI/ClearGLSurfaceView;IFF)V

    move-object/from16 v0, p0

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Lcom/miniclip/nativeJNI/ClearGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    goto/16 :goto_1

    .line 106
    .end local v7    # "idPointerUp":I
    .end local v10    # "indexPointUp":I
    .end local v15    # "xPointerUp":F
    .end local v20    # "yPointerUp":F
    :pswitch_5
    const/16 v23, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v8

    .line 107
    .local v8, "idUp":I
    const/16 v23, 0x0

    aget v16, v17, v23

    .line 108
    .local v16, "xUp":F
    const/16 v23, 0x0

    aget v21, v22, v23

    .line 110
    .local v21, "yUp":F
    new-instance v23, Lcom/miniclip/nativeJNI/ClearGLSurfaceView$5;

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    move/from16 v2, v16

    move/from16 v3, v21

    invoke-direct {v0, v1, v8, v2, v3}, Lcom/miniclip/nativeJNI/ClearGLSurfaceView$5;-><init>(Lcom/miniclip/nativeJNI/ClearGLSurfaceView;IFF)V

    move-object/from16 v0, p0

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Lcom/miniclip/nativeJNI/ClearGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    goto/16 :goto_1

    .line 119
    .end local v8    # "idUp":I
    .end local v16    # "xUp":F
    .end local v21    # "yUp":F
    :pswitch_6
    new-instance v23, Lcom/miniclip/nativeJNI/ClearGLSurfaceView$6;

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    move-object/from16 v2, v17

    move-object/from16 v3, v22

    invoke-direct {v0, v1, v9, v2, v3}, Lcom/miniclip/nativeJNI/ClearGLSurfaceView$6;-><init>(Lcom/miniclip/nativeJNI/ClearGLSurfaceView;[I[F[F)V

    move-object/from16 v0, p0

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Lcom/miniclip/nativeJNI/ClearGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    goto/16 :goto_1

    .line 52
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_5
        :pswitch_3
        :pswitch_6
        :pswitch_0
        :pswitch_1
        :pswitch_4
    .end packed-switch
.end method

.method public setRenderer(Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$Renderer;)V
    .locals 1
    .param p1, "renderer"    # Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$Renderer;

    .prologue
    .line 32
    move-object v0, p1

    check-cast v0, Lcom/miniclip/nativeJNI/ClearRenderer;

    iput-object v0, p0, Lcom/miniclip/nativeJNI/ClearGLSurfaceView;->mRenderer:Lcom/miniclip/nativeJNI/ClearRenderer;

    .line 33
    invoke-super {p0, p1}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->setRenderer(Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$Renderer;)V

    .line 34
    return-void
.end method
