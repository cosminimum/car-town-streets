.class public Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;
.super Landroid/view/SurfaceView;
.source "GLSurfaceViewProfile.java"

# interfaces
.implements Landroid/view/SurfaceHolder$Callback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$1;,
        Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;,
        Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$LogWriter;,
        Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;,
        Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;,
        Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$SimpleEGLConfigChooser;,
        Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$ComponentSizeChooser;,
        Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$BaseConfigChooser;,
        Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EGLConfigChooser;,
        Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$DefaultWindowSurfaceFactory;,
        Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EGLWindowSurfaceFactory;,
        Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$DefaultContextFactory;,
        Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EGLContextFactory;,
        Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$Renderer;,
        Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLWrapper;
    }
.end annotation


# static fields
.field public static final DEBUG_CHECK_GL_ERROR:I = 0x1

.field public static final DEBUG_LOG_GL_CALLS:I = 0x2

.field private static final DRAW_TWICE_AFTER_SIZE_CHANGED:Z = true

.field private static final LOG_EGL:Z = false

.field private static final LOG_PAUSE_RESUME:Z = false

.field private static final LOG_RENDERER:Z = false

.field private static final LOG_RENDERER_DRAW_FRAME:Z = false

.field private static final LOG_SURFACE:Z = false

.field private static final LOG_THREADS:Z = false

.field public static final RENDERMODE_CONTINUOUSLY:I = 0x1

.field public static final RENDERMODE_WHEN_DIRTY:I

.field private static final sGLThreadManager:Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;


# instance fields
.field private mDebugFlags:I

.field private mEGLConfigChooser:Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EGLConfigChooser;

.field private mEGLContextClientVersion:I

.field private mEGLContextFactory:Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EGLContextFactory;

.field private mEGLWindowSurfaceFactory:Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EGLWindowSurfaceFactory;

.field private mGLThread:Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;

.field private mGLWrapper:Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLWrapper;

.field private mPreserveEGLContextOnPause:Z

.field private mSizeChanged:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 1759
    new-instance v0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;-><init>(Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$1;)V

    sput-object v0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->sGLThreadManager:Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 207
    invoke-direct {p0, p1}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;)V

    .line 1760
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->mSizeChanged:Z

    .line 208
    invoke-direct {p0}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->init()V

    .line 209
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 216
    invoke-direct {p0, p1, p2}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 1760
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->mSizeChanged:Z

    .line 217
    invoke-direct {p0}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->init()V

    .line 218
    return-void
.end method

.method static synthetic access$1000(Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;)Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;
    .locals 1
    .param p0, "x0"    # Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;

    .prologue
    .line 157
    iget-object v0, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->mGLThread:Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;

    return-object v0
.end method

.method static synthetic access$200(Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;)I
    .locals 1
    .param p0, "x0"    # Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;

    .prologue
    .line 157
    iget v0, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->mEGLContextClientVersion:I

    return v0
.end method

.method static synthetic access$300(Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;)Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EGLConfigChooser;
    .locals 1
    .param p0, "x0"    # Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;

    .prologue
    .line 157
    iget-object v0, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->mEGLConfigChooser:Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EGLConfigChooser;

    return-object v0
.end method

.method static synthetic access$400(Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;)Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EGLContextFactory;
    .locals 1
    .param p0, "x0"    # Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;

    .prologue
    .line 157
    iget-object v0, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->mEGLContextFactory:Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EGLContextFactory;

    return-object v0
.end method

.method static synthetic access$500(Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;)Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EGLWindowSurfaceFactory;
    .locals 1
    .param p0, "x0"    # Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;

    .prologue
    .line 157
    iget-object v0, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->mEGLWindowSurfaceFactory:Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EGLWindowSurfaceFactory;

    return-object v0
.end method

.method static synthetic access$600(Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;)Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLWrapper;
    .locals 1
    .param p0, "x0"    # Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;

    .prologue
    .line 157
    iget-object v0, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->mGLWrapper:Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLWrapper;

    return-object v0
.end method

.method static synthetic access$700()Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;
    .locals 1

    .prologue
    .line 157
    sget-object v0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->sGLThreadManager:Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;

    return-object v0
.end method

.method static synthetic access$800(Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;)Z
    .locals 1
    .param p0, "x0"    # Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;

    .prologue
    .line 157
    iget-boolean v0, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->mPreserveEGLContextOnPause:Z

    return v0
.end method

.method static synthetic access$900(Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;)Z
    .locals 1
    .param p0, "x0"    # Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;

    .prologue
    .line 157
    iget-boolean v0, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->mSizeChanged:Z

    return v0
.end method

.method static synthetic access$902(Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;
    .param p1, "x1"    # Z

    .prologue
    .line 157
    iput-boolean p1, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->mSizeChanged:Z

    return p1
.end method

.method private checkRenderThreadState()V
    .locals 2

    .prologue
    .line 1641
    iget-object v0, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->mGLThread:Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;

    if-eqz v0, :cond_0

    .line 1642
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "setRenderer has already been called for this instance."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1645
    :cond_0
    return-void
.end method

.method private init()V
    .locals 1

    .prologue
    .line 223
    invoke-virtual {p0}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    .line 224
    .local v0, "holder":Landroid/view/SurfaceHolder;
    invoke-interface {v0, p0}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 232
    return-void
.end method


# virtual methods
.method public getDebugFlags()I
    .locals 1

    .prologue
    .line 269
    iget v0, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->mDebugFlags:I

    return v0
.end method

.method public getPreserveEGLContextOnPause()Z
    .locals 1

    .prologue
    .line 298
    iget-boolean v0, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->mPreserveEGLContextOnPause:Z

    return v0
.end method

.method public getRenderMode()I
    .locals 1

    .prologue
    .line 484
    iget-object v0, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->mGLThread:Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;

    invoke-virtual {v0}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->getRenderMode()I

    move-result v0

    return v0
.end method

.method protected onDetachedFromWindow()V
    .locals 1

    .prologue
    .line 561
    invoke-super {p0}, Landroid/view/SurfaceView;->onDetachedFromWindow()V

    .line 562
    iget-object v0, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->mGLThread:Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;

    invoke-virtual {v0}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->requestExitAndWait()V

    .line 563
    return-void
.end method

.method public onPause()V
    .locals 1

    .prologue
    .line 530
    iget-object v0, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->mGLThread:Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;

    invoke-virtual {v0}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->onPause()V

    .line 531
    return-void
.end method

.method public onResume()V
    .locals 1

    .prologue
    .line 541
    iget-object v0, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->mGLThread:Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;

    invoke-virtual {v0}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->onResume()V

    .line 542
    return-void
.end method

.method public queueEvent(Ljava/lang/Runnable;)V
    .locals 1
    .param p1, "r"    # Ljava/lang/Runnable;

    .prologue
    .line 551
    iget-object v0, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->mGLThread:Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;

    invoke-virtual {v0, p1}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->queueEvent(Ljava/lang/Runnable;)V

    .line 552
    return-void
.end method

.method public requestRender()V
    .locals 1

    .prologue
    .line 495
    iget-object v0, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->mGLThread:Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;

    invoke-virtual {v0}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->requestRender()V

    .line 496
    return-void
.end method

.method public setDebugFlags(I)V
    .locals 0
    .param p1, "debugFlags"    # I

    .prologue
    .line 261
    iput p1, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->mDebugFlags:I

    .line 262
    return-void
.end method

.method public setEGLConfigChooser(IIIIII)V
    .locals 8
    .param p1, "redSize"    # I
    .param p2, "greenSize"    # I
    .param p3, "blueSize"    # I
    .param p4, "alphaSize"    # I
    .param p5, "depthSize"    # I
    .param p6, "stencilSize"    # I

    .prologue
    .line 421
    new-instance v0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$ComponentSizeChooser;

    move-object v1, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    move v7, p6

    invoke-direct/range {v0 .. v7}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$ComponentSizeChooser;-><init>(Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;IIIIII)V

    invoke-virtual {p0, v0}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->setEGLConfigChooser(Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EGLConfigChooser;)V

    .line 423
    return-void
.end method

.method public setEGLConfigChooser(Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EGLConfigChooser;)V
    .locals 0
    .param p1, "configChooser"    # Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EGLConfigChooser;

    .prologue
    .line 384
    invoke-direct {p0}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->checkRenderThreadState()V

    .line 385
    iput-object p1, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->mEGLConfigChooser:Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EGLConfigChooser;

    .line 386
    return-void
.end method

.method public setEGLConfigChooser(Z)V
    .locals 1
    .param p1, "needDepth"    # Z

    .prologue
    .line 403
    new-instance v0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$SimpleEGLConfigChooser;

    invoke-direct {v0, p0, p1}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$SimpleEGLConfigChooser;-><init>(Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;Z)V

    invoke-virtual {p0, v0}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->setEGLConfigChooser(Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EGLConfigChooser;)V

    .line 404
    return-void
.end method

.method public setEGLContextClientVersion(I)V
    .locals 0
    .param p1, "version"    # I

    .prologue
    .line 452
    invoke-direct {p0}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->checkRenderThreadState()V

    .line 453
    iput p1, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->mEGLContextClientVersion:I

    .line 454
    return-void
.end method

.method public setEGLContextFactory(Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EGLContextFactory;)V
    .locals 0
    .param p1, "factory"    # Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EGLContextFactory;

    .prologue
    .line 353
    invoke-direct {p0}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->checkRenderThreadState()V

    .line 354
    iput-object p1, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->mEGLContextFactory:Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EGLContextFactory;

    .line 355
    return-void
.end method

.method public setEGLWindowSurfaceFactory(Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EGLWindowSurfaceFactory;)V
    .locals 0
    .param p1, "factory"    # Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EGLWindowSurfaceFactory;

    .prologue
    .line 367
    invoke-direct {p0}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->checkRenderThreadState()V

    .line 368
    iput-object p1, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->mEGLWindowSurfaceFactory:Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EGLWindowSurfaceFactory;

    .line 369
    return-void
.end method

.method public setGLWrapper(Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLWrapper;)V
    .locals 0
    .param p1, "glWrapper"    # Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLWrapper;

    .prologue
    .line 248
    iput-object p1, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->mGLWrapper:Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLWrapper;

    .line 249
    return-void
.end method

.method public setPreserveEGLContextOnPause(Z)V
    .locals 0
    .param p1, "preserveOnPause"    # Z

    .prologue
    .line 291
    iput-boolean p1, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->mPreserveEGLContextOnPause:Z

    .line 292
    return-void
.end method

.method public setRenderMode(I)V
    .locals 1
    .param p1, "renderMode"    # I

    .prologue
    .line 473
    iget-object v0, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->mGLThread:Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;

    invoke-virtual {v0, p1}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->setRenderMode(I)V

    .line 474
    return-void
.end method

.method public setRenderer(Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$Renderer;)V
    .locals 3
    .param p1, "renderer"    # Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$Renderer;

    .prologue
    const/4 v2, 0x0

    .line 328
    invoke-direct {p0}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->checkRenderThreadState()V

    .line 329
    iget-object v0, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->mEGLConfigChooser:Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EGLConfigChooser;

    if-nez v0, :cond_0

    .line 330
    new-instance v0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$SimpleEGLConfigChooser;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$SimpleEGLConfigChooser;-><init>(Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;Z)V

    iput-object v0, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->mEGLConfigChooser:Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EGLConfigChooser;

    .line 332
    :cond_0
    iget-object v0, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->mEGLContextFactory:Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EGLContextFactory;

    if-nez v0, :cond_1

    .line 333
    new-instance v0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$DefaultContextFactory;

    invoke-direct {v0, p0, v2}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$DefaultContextFactory;-><init>(Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$1;)V

    iput-object v0, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->mEGLContextFactory:Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EGLContextFactory;

    .line 335
    :cond_1
    iget-object v0, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->mEGLWindowSurfaceFactory:Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EGLWindowSurfaceFactory;

    if-nez v0, :cond_2

    .line 336
    new-instance v0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$DefaultWindowSurfaceFactory;

    invoke-direct {v0, v2}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$DefaultWindowSurfaceFactory;-><init>(Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$1;)V

    iput-object v0, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->mEGLWindowSurfaceFactory:Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EGLWindowSurfaceFactory;

    .line 338
    :cond_2
    new-instance v0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;

    invoke-direct {v0, p0, p1}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;-><init>(Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$Renderer;)V

    iput-object v0, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->mGLThread:Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;

    .line 339
    iget-object v0, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->mGLThread:Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;

    invoke-virtual {v0}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->start()V

    .line 340
    return-void
.end method

.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 1
    .param p1, "holder"    # Landroid/view/SurfaceHolder;
    .param p2, "format"    # I
    .param p3, "w"    # I
    .param p4, "h"    # I

    .prologue
    .line 520
    iget-object v0, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->mGLThread:Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;

    invoke-virtual {v0, p3, p4}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->onWindowResize(II)V

    .line 521
    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 1
    .param p1, "holder"    # Landroid/view/SurfaceHolder;

    .prologue
    .line 503
    iget-object v0, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->mGLThread:Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;

    invoke-virtual {v0}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->surfaceCreated()V

    .line 504
    return-void
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 1
    .param p1, "holder"    # Landroid/view/SurfaceHolder;

    .prologue
    .line 512
    iget-object v0, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->mGLThread:Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;

    invoke-virtual {v0}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->surfaceDestroyed()V

    .line 513
    return-void
.end method
