.class Lcom/getjar/sdk/logging/RemoteAppender$RemoteLoggingThread$1;
.super Ljava/lang/Object;
.source "RemoteAppender.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/getjar/sdk/logging/RemoteAppender$RemoteLoggingThread;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/getjar/sdk/logging/RemoteAppender$RemoteLoggingThread;

.field final synthetic val$messagesToSend:Ljava/util/List;


# direct methods
.method constructor <init>(Lcom/getjar/sdk/logging/RemoteAppender$RemoteLoggingThread;Ljava/util/List;)V
    .locals 0

    .prologue
    .line 274
    iput-object p1, p0, Lcom/getjar/sdk/logging/RemoteAppender$RemoteLoggingThread$1;->this$1:Lcom/getjar/sdk/logging/RemoteAppender$RemoteLoggingThread;

    iput-object p2, p0, Lcom/getjar/sdk/logging/RemoteAppender$RemoteLoggingThread$1;->val$messagesToSend:Ljava/util/List;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 277
    iget-object v0, p0, Lcom/getjar/sdk/logging/RemoteAppender$RemoteLoggingThread$1;->this$1:Lcom/getjar/sdk/logging/RemoteAppender$RemoteLoggingThread;

    iget-object v0, v0, Lcom/getjar/sdk/logging/RemoteAppender$RemoteLoggingThread;->this$0:Lcom/getjar/sdk/logging/RemoteAppender;

    iget-object v1, p0, Lcom/getjar/sdk/logging/RemoteAppender$RemoteLoggingThread$1;->val$messagesToSend:Ljava/util/List;

    invoke-static {v0, v1}, Lcom/getjar/sdk/logging/RemoteAppender;->access$600(Lcom/getjar/sdk/logging/RemoteAppender;Ljava/util/List;)V

    .line 278
    return-void
.end method
