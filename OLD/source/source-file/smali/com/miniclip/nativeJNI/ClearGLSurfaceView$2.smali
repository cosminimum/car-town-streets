.class Lcom/miniclip/nativeJNI/ClearGLSurfaceView$2;
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

.field final synthetic val$idDown:I

.field final synthetic val$xDown:F

.field final synthetic val$yDown:F


# direct methods
.method constructor <init>(Lcom/miniclip/nativeJNI/ClearGLSurfaceView;IFF)V
    .locals 0

    .prologue
    .line 73
    iput-object p1, p0, Lcom/miniclip/nativeJNI/ClearGLSurfaceView$2;->this$0:Lcom/miniclip/nativeJNI/ClearGLSurfaceView;

    iput p2, p0, Lcom/miniclip/nativeJNI/ClearGLSurfaceView$2;->val$idDown:I

    iput p3, p0, Lcom/miniclip/nativeJNI/ClearGLSurfaceView$2;->val$xDown:F

    iput p4, p0, Lcom/miniclip/nativeJNI/ClearGLSurfaceView$2;->val$yDown:F

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 76
    iget-object v0, p0, Lcom/miniclip/nativeJNI/ClearGLSurfaceView$2;->this$0:Lcom/miniclip/nativeJNI/ClearGLSurfaceView;

    iget-object v0, v0, Lcom/miniclip/nativeJNI/ClearGLSurfaceView;->mRenderer:Lcom/miniclip/nativeJNI/ClearRenderer;

    iget v1, p0, Lcom/miniclip/nativeJNI/ClearGLSurfaceView$2;->val$idDown:I

    iget v2, p0, Lcom/miniclip/nativeJNI/ClearGLSurfaceView$2;->val$xDown:F

    iget v3, p0, Lcom/miniclip/nativeJNI/ClearGLSurfaceView$2;->val$yDown:F

    invoke-virtual {v0, v1, v2, v3}, Lcom/miniclip/nativeJNI/ClearRenderer;->handleActionDown(IFF)V

    .line 77
    return-void
.end method
