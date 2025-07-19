.class Lcom/getjar/sdk/data/usage/UsageScreenReceiver$1;
.super Ljava/lang/Object;
.source "UsageScreenReceiver.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/getjar/sdk/data/usage/UsageScreenReceiver;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/getjar/sdk/data/usage/UsageScreenReceiver;

.field final synthetic val$finalContext:Landroid/content/Context;

.field final synthetic val$finalIntent:Landroid/content/Intent;


# direct methods
.method constructor <init>(Lcom/getjar/sdk/data/usage/UsageScreenReceiver;Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0

    .prologue
    .line 41
    iput-object p1, p0, Lcom/getjar/sdk/data/usage/UsageScreenReceiver$1;->this$0:Lcom/getjar/sdk/data/usage/UsageScreenReceiver;

    iput-object p2, p0, Lcom/getjar/sdk/data/usage/UsageScreenReceiver$1;->val$finalContext:Landroid/content/Context;

    iput-object p3, p0, Lcom/getjar/sdk/data/usage/UsageScreenReceiver$1;->val$finalIntent:Landroid/content/Intent;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 45
    :try_start_0
    iget-object v1, p0, Lcom/getjar/sdk/data/usage/UsageScreenReceiver$1;->this$0:Lcom/getjar/sdk/data/usage/UsageScreenReceiver;

    iget-object v2, p0, Lcom/getjar/sdk/data/usage/UsageScreenReceiver$1;->val$finalContext:Landroid/content/Context;

    iget-object v3, p0, Lcom/getjar/sdk/data/usage/UsageScreenReceiver$1;->val$finalIntent:Landroid/content/Intent;

    invoke-virtual {v1, v2, v3}, Lcom/getjar/sdk/data/usage/UsageScreenReceiver;->doOnReceive(Landroid/content/Context;Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 51
    :goto_0
    return-void

    .line 46
    :catch_0
    move-exception v0

    .line 49
    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "UsageScreenReceiver: onReceive() failed"

    invoke-static {v1, v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
