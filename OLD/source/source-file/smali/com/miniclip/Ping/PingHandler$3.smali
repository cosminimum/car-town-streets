.class Lcom/miniclip/Ping/PingHandler$3;
.super Ljava/lang/Object;
.source "PingHandler.java"

# interfaces
.implements Ljava/lang/Runnable;


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


# direct methods
.method constructor <init>(Lcom/miniclip/Ping/PingHandler;I)V
    .locals 0

    .prologue
    .line 67
    iput-object p1, p0, Lcom/miniclip/Ping/PingHandler$3;->this$0:Lcom/miniclip/Ping/PingHandler;

    iput p2, p0, Lcom/miniclip/Ping/PingHandler$3;->val$callback:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 70
    iget-object v0, p0, Lcom/miniclip/Ping/PingHandler$3;->this$0:Lcom/miniclip/Ping/PingHandler;

    invoke-static {v0}, Lcom/miniclip/Ping/PingHandler;->access$100(Lcom/miniclip/Ping/PingHandler;)I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 71
    iget-object v0, p0, Lcom/miniclip/Ping/PingHandler$3;->this$0:Lcom/miniclip/Ping/PingHandler;

    invoke-static {v0, v2}, Lcom/miniclip/Ping/PingHandler;->access$102(Lcom/miniclip/Ping/PingHandler;I)I

    .line 72
    iget-object v0, p0, Lcom/miniclip/Ping/PingHandler$3;->this$0:Lcom/miniclip/Ping/PingHandler;

    iget v1, p0, Lcom/miniclip/Ping/PingHandler$3;->val$callback:I

    invoke-static {v0, v1, v2}, Lcom/miniclip/Ping/PingHandler;->access$200(Lcom/miniclip/Ping/PingHandler;IZ)V

    .line 74
    :cond_0
    return-void
.end method
