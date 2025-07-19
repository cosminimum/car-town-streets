.class Lcom/miniclip/newsfeed/Newsfeed$2;
.super Ljava/lang/Thread;
.source "Newsfeed.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/newsfeed/Newsfeed;->update()I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miniclip/newsfeed/Newsfeed;


# direct methods
.method constructor <init>(Lcom/miniclip/newsfeed/Newsfeed;)V
    .locals 0

    .prologue
    .line 121
    iput-object p1, p0, Lcom/miniclip/newsfeed/Newsfeed$2;->this$0:Lcom/miniclip/newsfeed/Newsfeed;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 124
    iget-object v0, p0, Lcom/miniclip/newsfeed/Newsfeed$2;->this$0:Lcom/miniclip/newsfeed/Newsfeed;

    invoke-virtual {v0}, Lcom/miniclip/newsfeed/Newsfeed;->checkServer()I

    .line 125
    iget-object v0, p0, Lcom/miniclip/newsfeed/Newsfeed$2;->this$0:Lcom/miniclip/newsfeed/Newsfeed;

    invoke-static {v0}, Lcom/miniclip/newsfeed/Newsfeed;->access$100(Lcom/miniclip/newsfeed/Newsfeed;)Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/miniclip/newsfeed/Newsfeed$2$1;

    invoke-direct {v1, p0}, Lcom/miniclip/newsfeed/Newsfeed$2$1;-><init>(Lcom/miniclip/newsfeed/Newsfeed$2;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 170
    iget-object v0, p0, Lcom/miniclip/newsfeed/Newsfeed$2;->this$0:Lcom/miniclip/newsfeed/Newsfeed;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/miniclip/newsfeed/Newsfeed;->access$202(Lcom/miniclip/newsfeed/Newsfeed;I)I

    .line 171
    return-void
.end method
