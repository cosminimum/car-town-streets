.class Lcom/miniclip/Ping/PingHandler$1;
.super Ljava/lang/Object;
.source "PingHandler.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/Ping/PingHandler;->returnResult(IZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miniclip/Ping/PingHandler;

.field final synthetic val$callback:I

.field final synthetic val$result:Z


# direct methods
.method constructor <init>(Lcom/miniclip/Ping/PingHandler;IZ)V
    .locals 0

    .prologue
    .line 35
    iput-object p1, p0, Lcom/miniclip/Ping/PingHandler$1;->this$0:Lcom/miniclip/Ping/PingHandler;

    iput p2, p0, Lcom/miniclip/Ping/PingHandler$1;->val$callback:I

    iput-boolean p3, p0, Lcom/miniclip/Ping/PingHandler$1;->val$result:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 38
    iget v1, p0, Lcom/miniclip/Ping/PingHandler$1;->val$callback:I

    iget-boolean v0, p0, Lcom/miniclip/Ping/PingHandler$1;->val$result:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    invoke-static {v1, v0}, Lcom/miniclip/nativeJNI/CocoJNI;->MsimplePingResponce(II)V

    .line 39
    return-void

    .line 38
    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method
