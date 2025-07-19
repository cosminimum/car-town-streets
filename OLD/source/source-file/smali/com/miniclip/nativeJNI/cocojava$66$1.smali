.class Lcom/miniclip/nativeJNI/cocojava$66$1;
.super Ljava/lang/Object;
.source "cocojava.java"

# interfaces
.implements Lcom/facebook/widget/WebDialog$OnCompleteListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/cocojava$66;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miniclip/nativeJNI/cocojava$66;


# direct methods
.method constructor <init>(Lcom/miniclip/nativeJNI/cocojava$66;)V
    .locals 0

    .prologue
    .line 3744
    iput-object p1, p0, Lcom/miniclip/nativeJNI/cocojava$66$1;->this$0:Lcom/miniclip/nativeJNI/cocojava$66;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onComplete(Landroid/os/Bundle;Lcom/facebook/FacebookException;)V
    .locals 3
    .param p1, "values"    # Landroid/os/Bundle;
    .param p2, "error"    # Lcom/facebook/FacebookException;

    .prologue
    .line 3748
    const/4 v0, 0x0

    .line 3749
    .local v0, "posted":Z
    if-nez p2, :cond_2

    .line 3753
    const-string v1, "request"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_0

    const-string v1, "post_id"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 3755
    :cond_0
    const/4 v0, 0x1

    .line 3774
    :goto_0
    if-eqz v0, :cond_4

    .line 3776
    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->mGLView:Lcom/miniclip/nativeJNI/ClearGLSurfaceView;

    new-instance v2, Lcom/miniclip/nativeJNI/cocojava$66$1$1;

    invoke-direct {v2, p0}, Lcom/miniclip/nativeJNI/cocojava$66$1$1;-><init>(Lcom/miniclip/nativeJNI/cocojava$66$1;)V

    invoke-virtual {v1, v2}, Lcom/miniclip/nativeJNI/ClearGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    .line 3794
    :goto_1
    return-void

    .line 3760
    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    .line 3763
    :cond_2
    instance-of v1, p2, Lcom/facebook/FacebookOperationCanceledException;

    if-eqz v1, :cond_3

    .line 3766
    const/4 v0, 0x0

    goto :goto_0

    .line 3771
    :cond_3
    const/4 v0, 0x0

    goto :goto_0

    .line 3785
    :cond_4
    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->mGLView:Lcom/miniclip/nativeJNI/ClearGLSurfaceView;

    new-instance v2, Lcom/miniclip/nativeJNI/cocojava$66$1$2;

    invoke-direct {v2, p0}, Lcom/miniclip/nativeJNI/cocojava$66$1$2;-><init>(Lcom/miniclip/nativeJNI/cocojava$66$1;)V

    invoke-virtual {v1, v2}, Lcom/miniclip/nativeJNI/ClearGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    goto :goto_1
.end method
