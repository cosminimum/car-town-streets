.class Lcom/miniclip/newsfeed/Newsfeed$2$1;
.super Ljava/lang/Object;
.source "Newsfeed.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/newsfeed/Newsfeed$2;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miniclip/newsfeed/Newsfeed$2;


# direct methods
.method constructor <init>(Lcom/miniclip/newsfeed/Newsfeed$2;)V
    .locals 0

    .prologue
    .line 127
    iput-object p1, p0, Lcom/miniclip/newsfeed/Newsfeed$2$1;->this$1:Lcom/miniclip/newsfeed/Newsfeed$2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 130
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->NF_dismissBoard()V

    .line 133
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mGLView:Lcom/miniclip/nativeJNI/ClearGLSurfaceView;

    new-instance v1, Lcom/miniclip/newsfeed/Newsfeed$2$1$1;

    invoke-direct {v1, p0}, Lcom/miniclip/newsfeed/Newsfeed$2$1$1;-><init>(Lcom/miniclip/newsfeed/Newsfeed$2$1;)V

    invoke-virtual {v0, v1}, Lcom/miniclip/nativeJNI/ClearGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    .line 140
    iget-object v0, p0, Lcom/miniclip/newsfeed/Newsfeed$2$1;->this$1:Lcom/miniclip/newsfeed/Newsfeed$2;

    iget-object v0, v0, Lcom/miniclip/newsfeed/Newsfeed$2;->this$0:Lcom/miniclip/newsfeed/Newsfeed;

    iget v0, v0, Lcom/miniclip/newsfeed/Newsfeed;->messagesNumUrgent:I

    if-lez v0, :cond_0

    .line 142
    iget-object v0, p0, Lcom/miniclip/newsfeed/Newsfeed$2$1;->this$1:Lcom/miniclip/newsfeed/Newsfeed$2;

    iget-object v0, v0, Lcom/miniclip/newsfeed/Newsfeed$2;->this$0:Lcom/miniclip/newsfeed/Newsfeed;

    iget v0, v0, Lcom/miniclip/newsfeed/Newsfeed;->urgentItem:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 144
    iget-object v0, p0, Lcom/miniclip/newsfeed/Newsfeed$2$1;->this$1:Lcom/miniclip/newsfeed/Newsfeed$2;

    iget-object v0, v0, Lcom/miniclip/newsfeed/Newsfeed$2;->this$0:Lcom/miniclip/newsfeed/Newsfeed;

    invoke-static {v0}, Lcom/miniclip/newsfeed/Newsfeed;->access$000(Lcom/miniclip/newsfeed/Newsfeed;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/miniclip/newsfeed/Newsfeed$2$1;->this$1:Lcom/miniclip/newsfeed/Newsfeed$2;

    iget-object v1, v1, Lcom/miniclip/newsfeed/Newsfeed$2;->this$0:Lcom/miniclip/newsfeed/Newsfeed;

    iget-object v1, v1, Lcom/miniclip/newsfeed/Newsfeed;->mDisplayRunnable:Ljava/lang/Runnable;

    iget-object v2, p0, Lcom/miniclip/newsfeed/Newsfeed$2$1;->this$1:Lcom/miniclip/newsfeed/Newsfeed$2;

    iget-object v2, v2, Lcom/miniclip/newsfeed/Newsfeed$2;->this$0:Lcom/miniclip/newsfeed/Newsfeed;

    iget v2, v2, Lcom/miniclip/newsfeed/Newsfeed;->urgentDelay:I

    mul-int/lit16 v2, v2, 0x3e8

    int-to-long v2, v2

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 145
    const-string v0, "Newsfeed"

    const-string v1, "Show Urgent in %d milliseconds"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/miniclip/newsfeed/Newsfeed$2$1;->this$1:Lcom/miniclip/newsfeed/Newsfeed$2;

    iget-object v4, v4, Lcom/miniclip/newsfeed/Newsfeed$2;->this$0:Lcom/miniclip/newsfeed/Newsfeed;

    iget v4, v4, Lcom/miniclip/newsfeed/Newsfeed;->urgentDelay:I

    mul-int/lit16 v4, v4, 0x3e8

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 149
    :cond_0
    iget-object v0, p0, Lcom/miniclip/newsfeed/Newsfeed$2$1;->this$1:Lcom/miniclip/newsfeed/Newsfeed$2;

    iget-object v0, v0, Lcom/miniclip/newsfeed/Newsfeed$2;->this$0:Lcom/miniclip/newsfeed/Newsfeed;

    iget v0, v0, Lcom/miniclip/newsfeed/Newsfeed;->messagesNum:I

    if-lez v0, :cond_1

    .line 152
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mGLView:Lcom/miniclip/nativeJNI/ClearGLSurfaceView;

    new-instance v1, Lcom/miniclip/newsfeed/Newsfeed$2$1$2;

    invoke-direct {v1, p0}, Lcom/miniclip/newsfeed/Newsfeed$2$1$2;-><init>(Lcom/miniclip/newsfeed/Newsfeed$2$1;)V

    invoke-virtual {v0, v1}, Lcom/miniclip/nativeJNI/ClearGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    .line 168
    :goto_0
    return-void

    .line 161
    :cond_1
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mGLView:Lcom/miniclip/nativeJNI/ClearGLSurfaceView;

    new-instance v1, Lcom/miniclip/newsfeed/Newsfeed$2$1$3;

    invoke-direct {v1, p0}, Lcom/miniclip/newsfeed/Newsfeed$2$1$3;-><init>(Lcom/miniclip/newsfeed/Newsfeed$2$1;)V

    invoke-virtual {v0, v1}, Lcom/miniclip/nativeJNI/ClearGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    goto :goto_0
.end method
