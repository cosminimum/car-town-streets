.class Lcom/getjar/sdk/comm/NetworkStateReceiver$1;
.super Ljava/lang/Object;
.source "NetworkStateReceiver.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/getjar/sdk/comm/NetworkStateReceiver;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/getjar/sdk/comm/NetworkStateReceiver;

.field final synthetic val$finalContext:Landroid/content/Context;

.field final synthetic val$finalIntent:Landroid/content/Intent;


# direct methods
.method constructor <init>(Lcom/getjar/sdk/comm/NetworkStateReceiver;Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0

    .prologue
    .line 47
    iput-object p1, p0, Lcom/getjar/sdk/comm/NetworkStateReceiver$1;->this$0:Lcom/getjar/sdk/comm/NetworkStateReceiver;

    iput-object p2, p0, Lcom/getjar/sdk/comm/NetworkStateReceiver$1;->val$finalContext:Landroid/content/Context;

    iput-object p3, p0, Lcom/getjar/sdk/comm/NetworkStateReceiver$1;->val$finalIntent:Landroid/content/Intent;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 51
    :try_start_0
    iget-object v1, p0, Lcom/getjar/sdk/comm/NetworkStateReceiver$1;->this$0:Lcom/getjar/sdk/comm/NetworkStateReceiver;

    iget-object v2, p0, Lcom/getjar/sdk/comm/NetworkStateReceiver$1;->val$finalContext:Landroid/content/Context;

    iget-object v3, p0, Lcom/getjar/sdk/comm/NetworkStateReceiver$1;->val$finalIntent:Landroid/content/Intent;

    invoke-virtual {v1, v2, v3}, Lcom/getjar/sdk/comm/NetworkStateReceiver;->doOnReceive(Landroid/content/Context;Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 57
    :goto_0
    return-void

    .line 52
    :catch_0
    move-exception v0

    .line 55
    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    const-string v3, "NetworkStateReceiver: onReceive() failed"

    invoke-static {v1, v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
