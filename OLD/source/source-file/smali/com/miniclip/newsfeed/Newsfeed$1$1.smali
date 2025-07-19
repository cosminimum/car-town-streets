.class Lcom/miniclip/newsfeed/Newsfeed$1$1;
.super Ljava/lang/Object;
.source "Newsfeed.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/newsfeed/Newsfeed$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miniclip/newsfeed/Newsfeed$1;


# direct methods
.method constructor <init>(Lcom/miniclip/newsfeed/Newsfeed$1;)V
    .locals 0

    .prologue
    .line 57
    iput-object p1, p0, Lcom/miniclip/newsfeed/Newsfeed$1$1;->this$1:Lcom/miniclip/newsfeed/Newsfeed$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 60
    invoke-static {}, Lcom/miniclip/nativeJNI/CocoJNI;->NFcallShouldShowUrgentMessage()I

    move-result v0

    .line 61
    .local v0, "display":I
    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/miniclip/newsfeed/Newsfeed$1$1;->this$1:Lcom/miniclip/newsfeed/Newsfeed$1;

    iget-object v1, v1, Lcom/miniclip/newsfeed/Newsfeed$1;->this$0:Lcom/miniclip/newsfeed/Newsfeed;

    iget-boolean v1, v1, Lcom/miniclip/newsfeed/Newsfeed;->mIsVisible:Z

    if-nez v1, :cond_0

    .line 62
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->NF_showUrgentBoard()I

    .line 63
    const-string v1, "Newsfeed"

    const-string v2, "Allowed showing"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 68
    :goto_0
    return-void

    .line 65
    :cond_0
    iget-object v1, p0, Lcom/miniclip/newsfeed/Newsfeed$1$1;->this$1:Lcom/miniclip/newsfeed/Newsfeed$1;

    iget-object v1, v1, Lcom/miniclip/newsfeed/Newsfeed$1;->this$0:Lcom/miniclip/newsfeed/Newsfeed;

    invoke-static {v1}, Lcom/miniclip/newsfeed/Newsfeed;->access$000(Lcom/miniclip/newsfeed/Newsfeed;)Landroid/os/Handler;

    move-result-object v1

    iget-object v2, p0, Lcom/miniclip/newsfeed/Newsfeed$1$1;->this$1:Lcom/miniclip/newsfeed/Newsfeed$1;

    iget-object v2, v2, Lcom/miniclip/newsfeed/Newsfeed$1;->this$0:Lcom/miniclip/newsfeed/Newsfeed;

    iget-object v2, v2, Lcom/miniclip/newsfeed/Newsfeed;->mDisplayRunnable:Ljava/lang/Runnable;

    const-wide/16 v3, 0x4e20

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 66
    const-string v1, "Newsfeed"

    const-string v2, "Blocked showing"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method
