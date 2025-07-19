.class Lcom/miniclip/nativeJNI/ClearGLSurfaceView$6;
.super Ljava/lang/Object;
.source "ClearGLSurfaceView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/ClearGLSurfaceView;->onTouchEvent(Landroid/view/MotionEvent;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miniclip/nativeJNI/ClearGLSurfaceView;

.field final synthetic val$ids:[I

.field final synthetic val$xs:[F

.field final synthetic val$ys:[F


# direct methods
.method constructor <init>(Lcom/miniclip/nativeJNI/ClearGLSurfaceView;[I[F[F)V
    .locals 0

    .prologue
    .line 119
    iput-object p1, p0, Lcom/miniclip/nativeJNI/ClearGLSurfaceView$6;->this$0:Lcom/miniclip/nativeJNI/ClearGLSurfaceView;

    iput-object p2, p0, Lcom/miniclip/nativeJNI/ClearGLSurfaceView$6;->val$ids:[I

    iput-object p3, p0, Lcom/miniclip/nativeJNI/ClearGLSurfaceView$6;->val$xs:[F

    iput-object p4, p0, Lcom/miniclip/nativeJNI/ClearGLSurfaceView$6;->val$ys:[F

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 122
    iget-object v0, p0, Lcom/miniclip/nativeJNI/ClearGLSurfaceView$6;->this$0:Lcom/miniclip/nativeJNI/ClearGLSurfaceView;

    iget-object v0, v0, Lcom/miniclip/nativeJNI/ClearGLSurfaceView;->mRenderer:Lcom/miniclip/nativeJNI/ClearRenderer;

    iget-object v1, p0, Lcom/miniclip/nativeJNI/ClearGLSurfaceView$6;->val$ids:[I

    iget-object v2, p0, Lcom/miniclip/nativeJNI/ClearGLSurfaceView$6;->val$xs:[F

    iget-object v3, p0, Lcom/miniclip/nativeJNI/ClearGLSurfaceView$6;->val$ys:[F

    invoke-virtual {v0, v1, v2, v3}, Lcom/miniclip/nativeJNI/ClearRenderer;->handleActionCancel([I[F[F)V

    .line 123
    return-void
.end method
