.class Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;
.super Ljava/lang/Object;
.source "GLSurfaceViewProfile.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "EglHelper"
.end annotation


# instance fields
.field mEgl:Ljavax/microedition/khronos/egl/EGL10;

.field mEglConfig:Ljavax/microedition/khronos/egl/EGLConfig;

.field mEglContext:Ljavax/microedition/khronos/egl/EGLContext;

.field mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

.field mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

.field final synthetic this$0:Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;


# direct methods
.method public constructor <init>(Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;)V
    .locals 0

    .prologue
    .line 914
    iput-object p1, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;->this$0:Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 916
    return-void
.end method

.method private throwEglException(Ljava/lang/String;)V
    .locals 1
    .param p1, "function"    # Ljava/lang/String;

    .prologue
    .line 1100
    iget-object v0, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    invoke-interface {v0}, Ljavax/microedition/khronos/egl/EGL10;->eglGetError()I

    move-result v0

    invoke-direct {p0, p1, v0}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;->throwEglException(Ljava/lang/String;I)V

    .line 1101
    return-void
.end method

.method private throwEglException(Ljava/lang/String;I)V
    .locals 3
    .param p1, "function"    # Ljava/lang/String;
    .param p2, "error"    # I

    .prologue
    .line 1104
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " failed: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1108
    .local v0, "message":Ljava/lang/String;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
.end method


# virtual methods
.method public createSurface(Landroid/view/SurfaceHolder;)Ljavax/microedition/khronos/opengles/GL;
    .locals 7
    .param p1, "holder"    # Landroid/view/SurfaceHolder;

    .prologue
    .line 976
    iget-object v2, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    if-nez v2, :cond_0

    .line 977
    new-instance v2, Ljava/lang/RuntimeException;

    const-string v3, "egl not initialized"

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 979
    :cond_0
    iget-object v2, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    if-nez v2, :cond_1

    .line 980
    new-instance v2, Ljava/lang/RuntimeException;

    const-string v3, "eglDisplay not initialized"

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 982
    :cond_1
    iget-object v2, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;->mEglConfig:Ljavax/microedition/khronos/egl/EGLConfig;

    if-nez v2, :cond_2

    .line 983
    new-instance v2, Ljava/lang/RuntimeException;

    const-string v3, "mEglConfig not initialized"

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 989
    :cond_2
    iget-object v2, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    sget-object v3, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    if-eq v2, v3, :cond_3

    .line 995
    iget-object v2, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v3, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    sget-object v4, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    sget-object v5, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    sget-object v6, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_CONTEXT:Ljavax/microedition/khronos/egl/EGLContext;

    invoke-interface {v2, v3, v4, v5, v6}, Ljavax/microedition/khronos/egl/EGL10;->eglMakeCurrent(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLContext;)Z

    .line 997
    iget-object v2, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;->this$0:Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;

    invoke-static {v2}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->access$500(Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;)Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EGLWindowSurfaceFactory;

    move-result-object v2

    iget-object v3, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v4, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    iget-object v5, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    invoke-interface {v2, v3, v4, v5}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EGLWindowSurfaceFactory;->destroySurface(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;)V

    .line 1003
    :cond_3
    iget-object v2, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;->this$0:Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;

    invoke-static {v2}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->access$500(Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;)Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EGLWindowSurfaceFactory;

    move-result-object v2

    iget-object v3, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v4, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    iget-object v5, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;->mEglConfig:Ljavax/microedition/khronos/egl/EGLConfig;

    invoke-interface {v2, v3, v4, v5, p1}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EGLWindowSurfaceFactory;->createWindowSurface(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;Ljava/lang/Object;)Ljavax/microedition/khronos/egl/EGLSurface;

    move-result-object v2

    iput-object v2, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 1006
    iget-object v2, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    if-eqz v2, :cond_4

    iget-object v2, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    sget-object v3, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    if-ne v2, v3, :cond_7

    .line 1007
    :cond_4
    iget-object v2, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    invoke-interface {v2}, Ljavax/microedition/khronos/egl/EGL10;->eglGetError()I

    move-result v0

    .line 1008
    .local v0, "error":I
    const/16 v2, 0x300b

    if-ne v0, v2, :cond_6

    .line 1009
    const-string v2, "EglHelper"

    const-string v3, "createWindowSurface returned EGL_BAD_NATIVE_WINDOW."

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1010
    const/4 v1, 0x0

    .line 1039
    .end local v0    # "error":I
    :cond_5
    :goto_0
    return-object v1

    .line 1012
    .restart local v0    # "error":I
    :cond_6
    const-string v2, "createWindowSurface"

    invoke-direct {p0, v2, v0}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;->throwEglException(Ljava/lang/String;I)V

    .line 1019
    .end local v0    # "error":I
    :cond_7
    iget-object v2, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v3, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    iget-object v4, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    iget-object v5, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    iget-object v6, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;->mEglContext:Ljavax/microedition/khronos/egl/EGLContext;

    invoke-interface {v2, v3, v4, v5, v6}, Ljavax/microedition/khronos/egl/EGL10;->eglMakeCurrent(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLContext;)Z

    move-result v2

    if-nez v2, :cond_8

    .line 1020
    const-string v2, "eglMakeCurrent"

    invoke-direct {p0, v2}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;->throwEglException(Ljava/lang/String;)V

    .line 1023
    :cond_8
    iget-object v2, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;->mEglContext:Ljavax/microedition/khronos/egl/EGLContext;

    invoke-virtual {v2}, Ljavax/microedition/khronos/egl/EGLContext;->getGL()Ljavax/microedition/khronos/opengles/GL;

    move-result-object v1

    .line 1024
    .local v1, "gl":Ljavax/microedition/khronos/opengles/GL;
    iget-object v2, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;->this$0:Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;

    invoke-static {v2}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->access$600(Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;)Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLWrapper;

    move-result-object v2

    if-eqz v2, :cond_5

    .line 1025
    iget-object v2, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;->this$0:Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;

    invoke-static {v2}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->access$600(Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;)Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLWrapper;

    move-result-object v2

    invoke-interface {v2, v1}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLWrapper;->wrap(Ljavax/microedition/khronos/opengles/GL;)Ljavax/microedition/khronos/opengles/GL;

    move-result-object v1

    goto :goto_0
.end method

.method public destroySurface()V
    .locals 5

    .prologue
    .line 1076
    iget-object v0, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    sget-object v1, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    if-eq v0, v1, :cond_0

    .line 1077
    iget-object v0, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v1, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    sget-object v2, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    sget-object v3, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    sget-object v4, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_CONTEXT:Ljavax/microedition/khronos/egl/EGLContext;

    invoke-interface {v0, v1, v2, v3, v4}, Ljavax/microedition/khronos/egl/EGL10;->eglMakeCurrent(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLContext;)Z

    .line 1080
    iget-object v0, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;->this$0:Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;

    invoke-static {v0}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->access$500(Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;)Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EGLWindowSurfaceFactory;

    move-result-object v0

    iget-object v1, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v2, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    iget-object v3, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    invoke-interface {v0, v1, v2, v3}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EGLWindowSurfaceFactory;->destroySurface(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;)V

    .line 1081
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 1083
    :cond_0
    return-void
.end method

.method public finish()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 1089
    iget-object v0, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;->mEglContext:Ljavax/microedition/khronos/egl/EGLContext;

    if-eqz v0, :cond_0

    .line 1090
    iget-object v0, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;->this$0:Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;

    invoke-static {v0}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->access$400(Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;)Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EGLContextFactory;

    move-result-object v0

    iget-object v1, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v2, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    iget-object v3, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;->mEglContext:Ljavax/microedition/khronos/egl/EGLContext;

    invoke-interface {v0, v1, v2, v3}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EGLContextFactory;->destroyContext(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLContext;)V

    .line 1091
    iput-object v4, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;->mEglContext:Ljavax/microedition/khronos/egl/EGLContext;

    .line 1093
    :cond_0
    iget-object v0, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    if-eqz v0, :cond_1

    .line 1094
    iget-object v0, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v1, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    invoke-interface {v0, v1}, Ljavax/microedition/khronos/egl/EGL10;->eglTerminate(Ljavax/microedition/khronos/egl/EGLDisplay;)Z

    .line 1095
    iput-object v4, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 1097
    :cond_1
    return-void
.end method

.method public start()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 929
    invoke-static {}, Ljavax/microedition/khronos/egl/EGLContext;->getEGL()Ljavax/microedition/khronos/egl/EGL;

    move-result-object v1

    check-cast v1, Ljavax/microedition/khronos/egl/EGL10;

    iput-object v1, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    .line 934
    iget-object v1, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    sget-object v2, Ljavax/microedition/khronos/egl/EGL10;->EGL_DEFAULT_DISPLAY:Ljava/lang/Object;

    invoke-interface {v1, v2}, Ljavax/microedition/khronos/egl/EGL10;->eglGetDisplay(Ljava/lang/Object;)Ljavax/microedition/khronos/egl/EGLDisplay;

    move-result-object v1

    iput-object v1, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 936
    iget-object v1, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    sget-object v2, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_DISPLAY:Ljavax/microedition/khronos/egl/EGLDisplay;

    if-ne v1, v2, :cond_0

    .line 937
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "eglGetDisplay failed"

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 943
    :cond_0
    const/4 v1, 0x2

    new-array v0, v1, [I

    .line 944
    .local v0, "version":[I
    iget-object v1, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v2, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    invoke-interface {v1, v2, v0}, Ljavax/microedition/khronos/egl/EGL10;->eglInitialize(Ljavax/microedition/khronos/egl/EGLDisplay;[I)Z

    move-result v1

    if-nez v1, :cond_1

    .line 945
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "eglInitialize failed"

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 947
    :cond_1
    iget-object v1, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;->this$0:Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;

    invoke-static {v1}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->access$300(Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;)Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EGLConfigChooser;

    move-result-object v1

    iget-object v2, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v3, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    invoke-interface {v1, v2, v3}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EGLConfigChooser;->chooseConfig(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;)Ljavax/microedition/khronos/egl/EGLConfig;

    move-result-object v1

    iput-object v1, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;->mEglConfig:Ljavax/microedition/khronos/egl/EGLConfig;

    .line 953
    iget-object v1, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;->this$0:Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;

    invoke-static {v1}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->access$400(Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;)Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EGLContextFactory;

    move-result-object v1

    iget-object v2, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v3, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    iget-object v4, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;->mEglConfig:Ljavax/microedition/khronos/egl/EGLConfig;

    invoke-interface {v1, v2, v3, v4}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EGLContextFactory;->createContext(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;)Ljavax/microedition/khronos/egl/EGLContext;

    move-result-object v1

    iput-object v1, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;->mEglContext:Ljavax/microedition/khronos/egl/EGLContext;

    .line 954
    iget-object v1, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;->mEglContext:Ljavax/microedition/khronos/egl/EGLContext;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;->mEglContext:Ljavax/microedition/khronos/egl/EGLContext;

    sget-object v2, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_CONTEXT:Ljavax/microedition/khronos/egl/EGLContext;

    if-ne v1, v2, :cond_3

    .line 955
    :cond_2
    iput-object v5, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;->mEglContext:Ljavax/microedition/khronos/egl/EGLContext;

    .line 956
    const-string v1, "createContext"

    invoke-direct {p0, v1}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;->throwEglException(Ljava/lang/String;)V

    .line 962
    :cond_3
    iput-object v5, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 963
    return-void
.end method

.method public swap()Z
    .locals 5

    .prologue
    .line 1047
    iget-object v1, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v2, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    iget-object v3, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    invoke-interface {v1, v2, v3}, Ljavax/microedition/khronos/egl/EGL10;->eglSwapBuffers(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 1055
    iget-object v1, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    invoke-interface {v1}, Ljavax/microedition/khronos/egl/EGL10;->eglGetError()I

    move-result v0

    .line 1056
    .local v0, "error":I
    packed-switch v0, :pswitch_data_0

    .line 1066
    :pswitch_0
    const-string v1, "eglSwapBuffers"

    invoke-direct {p0, v1, v0}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;->throwEglException(Ljava/lang/String;I)V

    .line 1069
    .end local v0    # "error":I
    :cond_0
    :goto_0
    const/4 v1, 0x1

    :goto_1
    return v1

    .line 1058
    .restart local v0    # "error":I
    :pswitch_1
    const/4 v1, 0x0

    goto :goto_1

    .line 1063
    :pswitch_2
    const-string v1, "EglHelper"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "eglSwapBuffers returned EGL_BAD_NATIVE_WINDOW. tid="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Thread;->getId()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 1056
    nop

    :pswitch_data_0
    .packed-switch 0x300b
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
