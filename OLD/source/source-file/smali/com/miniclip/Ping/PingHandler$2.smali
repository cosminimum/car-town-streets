.class Lcom/miniclip/Ping/PingHandler$2;
.super Ljava/lang/Thread;
.source "PingHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/Ping/PingHandler;->simplePingAsync(Ljava/lang/String;II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miniclip/Ping/PingHandler;

.field final synthetic val$callback:I

.field final synthetic val$serverName:Ljava/lang/String;

.field final synthetic val$timeout:I


# direct methods
.method constructor <init>(Lcom/miniclip/Ping/PingHandler;Ljava/lang/String;II)V
    .locals 0

    .prologue
    .line 48
    iput-object p1, p0, Lcom/miniclip/Ping/PingHandler$2;->this$0:Lcom/miniclip/Ping/PingHandler;

    iput-object p2, p0, Lcom/miniclip/Ping/PingHandler$2;->val$serverName:Ljava/lang/String;

    iput p3, p0, Lcom/miniclip/Ping/PingHandler$2;->val$timeout:I

    iput p4, p0, Lcom/miniclip/Ping/PingHandler$2;->val$callback:I

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 52
    :try_start_0
    iget-object v2, p0, Lcom/miniclip/Ping/PingHandler$2;->this$0:Lcom/miniclip/Ping/PingHandler;

    iget-object v3, p0, Lcom/miniclip/Ping/PingHandler$2;->val$serverName:Ljava/lang/String;

    iget v4, p0, Lcom/miniclip/Ping/PingHandler$2;->val$timeout:I

    invoke-static {v2, v3, v4}, Lcom/miniclip/Ping/PingHandler;->access$000(Lcom/miniclip/Ping/PingHandler;Ljava/lang/String;I)Z

    move-result v1

    .line 53
    .local v1, "result":Z
    iget-object v2, p0, Lcom/miniclip/Ping/PingHandler$2;->this$0:Lcom/miniclip/Ping/PingHandler;

    invoke-static {v2}, Lcom/miniclip/Ping/PingHandler;->access$100(Lcom/miniclip/Ping/PingHandler;)I

    move-result v2

    if-ne v2, v6, :cond_0

    .line 54
    iget-object v2, p0, Lcom/miniclip/Ping/PingHandler$2;->this$0:Lcom/miniclip/Ping/PingHandler;

    const/4 v3, 0x0

    invoke-static {v2, v3}, Lcom/miniclip/Ping/PingHandler;->access$102(Lcom/miniclip/Ping/PingHandler;I)I

    .line 55
    iget-object v2, p0, Lcom/miniclip/Ping/PingHandler$2;->this$0:Lcom/miniclip/Ping/PingHandler;

    iget v3, p0, Lcom/miniclip/Ping/PingHandler$2;->val$callback:I

    invoke-static {v2, v3, v1}, Lcom/miniclip/Ping/PingHandler;->access$200(Lcom/miniclip/Ping/PingHandler;IZ)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 64
    .end local v1    # "result":Z
    :cond_0
    :goto_0
    return-void

    .line 57
    :catch_0
    move-exception v0

    .line 58
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 59
    iget-object v2, p0, Lcom/miniclip/Ping/PingHandler$2;->this$0:Lcom/miniclip/Ping/PingHandler;

    invoke-static {v2}, Lcom/miniclip/Ping/PingHandler;->access$100(Lcom/miniclip/Ping/PingHandler;)I

    move-result v2

    if-ne v2, v6, :cond_0

    .line 60
    iget-object v2, p0, Lcom/miniclip/Ping/PingHandler$2;->this$0:Lcom/miniclip/Ping/PingHandler;

    invoke-static {v2, v5}, Lcom/miniclip/Ping/PingHandler;->access$102(Lcom/miniclip/Ping/PingHandler;I)I

    .line 61
    iget-object v2, p0, Lcom/miniclip/Ping/PingHandler$2;->this$0:Lcom/miniclip/Ping/PingHandler;

    iget v3, p0, Lcom/miniclip/Ping/PingHandler$2;->val$callback:I

    invoke-static {v2, v3, v5}, Lcom/miniclip/Ping/PingHandler;->access$200(Lcom/miniclip/Ping/PingHandler;IZ)V

    goto :goto_0
.end method
