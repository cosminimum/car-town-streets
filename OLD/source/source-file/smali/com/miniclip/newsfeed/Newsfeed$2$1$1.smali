.class Lcom/miniclip/newsfeed/Newsfeed$2$1$1;
.super Ljava/lang/Object;
.source "Newsfeed.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/newsfeed/Newsfeed$2$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/miniclip/newsfeed/Newsfeed$2$1;


# direct methods
.method constructor <init>(Lcom/miniclip/newsfeed/Newsfeed$2$1;)V
    .locals 0

    .prologue
    .line 133
    iput-object p1, p0, Lcom/miniclip/newsfeed/Newsfeed$2$1$1;->this$2:Lcom/miniclip/newsfeed/Newsfeed$2$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 136
    iget-object v0, p0, Lcom/miniclip/newsfeed/Newsfeed$2$1$1;->this$2:Lcom/miniclip/newsfeed/Newsfeed$2$1;

    iget-object v0, v0, Lcom/miniclip/newsfeed/Newsfeed$2$1;->this$1:Lcom/miniclip/newsfeed/Newsfeed$2;

    iget-object v0, v0, Lcom/miniclip/newsfeed/Newsfeed$2;->this$0:Lcom/miniclip/newsfeed/Newsfeed;

    iget v0, v0, Lcom/miniclip/newsfeed/Newsfeed;->messagesNumUnread:I

    invoke-static {v0}, Lcom/miniclip/nativeJNI/CocoJNI;->NFcallNrOfUnreadMessagesChanged(I)V

    .line 137
    return-void
.end method
