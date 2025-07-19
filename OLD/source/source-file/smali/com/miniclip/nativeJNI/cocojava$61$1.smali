.class Lcom/miniclip/nativeJNI/cocojava$61$1;
.super Ljava/lang/Object;
.source "cocojava.java"

# interfaces
.implements Lcom/facebook/Session$StatusCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/cocojava$61;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miniclip/nativeJNI/cocojava$61;


# direct methods
.method constructor <init>(Lcom/miniclip/nativeJNI/cocojava$61;)V
    .locals 0

    .prologue
    .line 3575
    iput-object p1, p0, Lcom/miniclip/nativeJNI/cocojava$61$1;->this$0:Lcom/miniclip/nativeJNI/cocojava$61;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Lcom/facebook/Session;Lcom/facebook/SessionState;Ljava/lang/Exception;)V
    .locals 4
    .param p1, "session"    # Lcom/facebook/Session;
    .param p2, "state"    # Lcom/facebook/SessionState;
    .param p3, "exception"    # Ljava/lang/Exception;

    .prologue
    .line 3578
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->access$1400()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p2}, Lcom/facebook/SessionState;->isOpened()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 3580
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mGLView:Lcom/miniclip/nativeJNI/ClearGLSurfaceView;

    new-instance v1, Lcom/miniclip/nativeJNI/cocojava$61$1$1;

    invoke-direct {v1, p0}, Lcom/miniclip/nativeJNI/cocojava$61$1$1;-><init>(Lcom/miniclip/nativeJNI/cocojava$61$1;)V

    invoke-virtual {v0, v1}, Lcom/miniclip/nativeJNI/ClearGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    .line 3587
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->access$1500()Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/miniclip/nativeJNI/cocojava$61$1;->this$0:Lcom/miniclip/nativeJNI/cocojava$61;

    iget-object v1, v1, Lcom/miniclip/nativeJNI/cocojava$61;->val$runAfterLogin:Ljava/lang/Runnable;

    const-wide/16 v2, 0x1f4

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 3590
    :cond_0
    return-void
.end method
