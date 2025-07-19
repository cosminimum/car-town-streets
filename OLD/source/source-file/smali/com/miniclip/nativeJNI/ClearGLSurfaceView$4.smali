.class Lcom/miniclip/nativeJNI/ClearGLSurfaceView$4;
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

.field final synthetic val$idPointerUp:I

.field final synthetic val$xPointerUp:F

.field final synthetic val$yPointerUp:F


# direct methods
.method constructor <init>(Lcom/miniclip/nativeJNI/ClearGLSurfaceView;IFF)V
    .locals 0

    .prologue
    .line 96
    iput-object p1, p0, Lcom/miniclip/nativeJNI/ClearGLSurfaceView$4;->this$0:Lcom/miniclip/nativeJNI/ClearGLSurfaceView;

    iput p2, p0, Lcom/miniclip/nativeJNI/ClearGLSurfaceView$4;->val$idPointerUp:I

    iput p3, p0, Lcom/miniclip/nativeJNI/ClearGLSurfaceView$4;->val$xPointerUp:F

    iput p4, p0, Lcom/miniclip/nativeJNI/ClearGLSurfaceView$4;->val$yPointerUp:F

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 99
    iget-object v0, p0, Lcom/miniclip/nativeJNI/ClearGLSurfaceView$4;->this$0:Lcom/miniclip/nativeJNI/ClearGLSurfaceView;

    iget-object v0, v0, Lcom/miniclip/nativeJNI/ClearGLSurfaceView;->mRenderer:Lcom/miniclip/nativeJNI/ClearRenderer;

    iget v1, p0, Lcom/miniclip/nativeJNI/ClearGLSurfaceView$4;->val$idPointerUp:I

    iget v2, p0, Lcom/miniclip/nativeJNI/ClearGLSurfaceView$4;->val$xPointerUp:F

    iget v3, p0, Lcom/miniclip/nativeJNI/ClearGLSurfaceView$4;->val$yPointerUp:F

    invoke-virtual {v0, v1, v2, v3}, Lcom/miniclip/nativeJNI/ClearRenderer;->handleActionUp(IFF)V

    .line 100
    return-void
.end method
