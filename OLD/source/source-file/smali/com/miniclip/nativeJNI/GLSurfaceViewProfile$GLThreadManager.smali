.class Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;
.super Ljava/lang/Object;
.source "GLSurfaceViewProfile.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "GLThreadManager"
.end annotation


# static fields
.field private static TAG:Ljava/lang/String; = null

.field private static final kGLES_20:I = 0x20000

.field private static final kMSM7K_RENDERER_PREFIX:Ljava/lang/String; = "Q3Dimension MSM7500 "


# instance fields
.field private mEglOwner:Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;

.field private mGLESDriverCheckComplete:Z

.field private mGLESVersion:I

.field private mGLESVersionCheckComplete:Z

.field private mLimitedGLESContexts:Z

.field private mMultipleGLESContextsAllowed:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 1648
    const-string v0, "GLThreadManager"

    sput-object v0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;->TAG:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 1647
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$1;

    .prologue
    .line 1647
    invoke-direct {p0}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;-><init>()V

    return-void
.end method

.method private checkGLESVersion()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 1731
    iget-boolean v0, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;->mGLESVersionCheckComplete:Z

    if-nez v0, :cond_1

    .line 1732
    iput v1, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;->mGLESVersion:I

    .line 1733
    iput-boolean v1, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;->mMultipleGLESContextsAllowed:Z

    .line 1737
    iget v0, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;->mGLESVersion:I

    const/high16 v1, 0x20000

    if-lt v0, v1, :cond_0

    .line 1738
    iput-boolean v2, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;->mMultipleGLESContextsAllowed:Z

    .line 1744
    :cond_0
    iput-boolean v2, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;->mGLESVersionCheckComplete:Z

    .line 1746
    :cond_1
    return-void
.end method


# virtual methods
.method public declared-synchronized checkGLDriver(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 5
    .param p1, "gl"    # Ljavax/microedition/khronos/opengles/GL10;

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 1712
    monitor-enter p0

    :try_start_0
    iget-boolean v3, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;->mGLESDriverCheckComplete:Z

    if-nez v3, :cond_1

    .line 1713
    invoke-direct {p0}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;->checkGLESVersion()V

    .line 1714
    const/16 v3, 0x1f01

    invoke-interface {p1, v3}, Ljavax/microedition/khronos/opengles/GL10;->glGetString(I)Ljava/lang/String;

    move-result-object v0

    .line 1715
    .local v0, "renderer":Ljava/lang/String;
    iget v3, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;->mGLESVersion:I

    const/high16 v4, 0x20000

    if-ge v3, v4, :cond_0

    .line 1716
    const-string v3, "Q3Dimension MSM7500 "

    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_2

    move v3, v1

    :goto_0
    iput-boolean v3, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;->mMultipleGLESContextsAllowed:Z

    .line 1718
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 1720
    :cond_0
    iget-boolean v3, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;->mMultipleGLESContextsAllowed:Z

    if-nez v3, :cond_3

    :goto_1
    iput-boolean v1, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;->mLimitedGLESContexts:Z

    .line 1726
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;->mGLESDriverCheckComplete:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1728
    .end local v0    # "renderer":Ljava/lang/String;
    :cond_1
    monitor-exit p0

    return-void

    .restart local v0    # "renderer":Ljava/lang/String;
    :cond_2
    move v3, v2

    .line 1716
    goto :goto_0

    :cond_3
    move v1, v2

    .line 1720
    goto :goto_1

    .line 1712
    .end local v0    # "renderer":Ljava/lang/String;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public releaseEglContextLocked(Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;)V
    .locals 1
    .param p1, "thread"    # Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;

    .prologue
    .line 1693
    iget-object v0, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;->mEglOwner:Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;

    if-ne v0, p1, :cond_0

    .line 1694
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;->mEglOwner:Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;

    .line 1696
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 1697
    return-void
.end method

.method public declared-synchronized shouldReleaseEGLContextWhenPausing()Z
    .locals 1

    .prologue
    .line 1703
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;->mLimitedGLESContexts:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized shouldTerminateEGLWhenPausing()Z
    .locals 1

    .prologue
    .line 1707
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;->checkGLESVersion()V

    .line 1708
    iget-boolean v0, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;->mMultipleGLESContextsAllowed:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    monitor-exit p0

    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 1707
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized threadExiting(Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;)V
    .locals 1
    .param p1, "thread"    # Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;

    .prologue
    .line 1654
    monitor-enter p0

    const/4 v0, 0x1

    :try_start_0
    invoke-static {p1, v0}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->access$1102(Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;Z)Z

    .line 1655
    iget-object v0, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;->mEglOwner:Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;

    if-ne v0, p1, :cond_0

    .line 1656
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;->mEglOwner:Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;

    .line 1658
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1659
    monitor-exit p0

    return-void

    .line 1654
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public tryAcquireEglContextLocked(Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;)Z
    .locals 2
    .param p1, "thread"    # Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;

    .prologue
    const/4 v0, 0x1

    .line 1669
    iget-object v1, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;->mEglOwner:Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;

    if-eq v1, p1, :cond_0

    iget-object v1, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;->mEglOwner:Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;

    if-nez v1, :cond_2

    .line 1670
    :cond_0
    iput-object p1, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;->mEglOwner:Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;

    .line 1671
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 1685
    :cond_1
    :goto_0
    return v0

    .line 1674
    :cond_2
    invoke-direct {p0}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;->checkGLESVersion()V

    .line 1675
    iget-boolean v1, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;->mMultipleGLESContextsAllowed:Z

    if-nez v1, :cond_1

    .line 1682
    iget-object v0, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;->mEglOwner:Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;

    if-eqz v0, :cond_3

    .line 1683
    iget-object v0, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;->mEglOwner:Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;

    invoke-virtual {v0}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->requestReleaseEglContextLocked()V

    .line 1685
    :cond_3
    const/4 v0, 0x0

    goto :goto_0
.end method
