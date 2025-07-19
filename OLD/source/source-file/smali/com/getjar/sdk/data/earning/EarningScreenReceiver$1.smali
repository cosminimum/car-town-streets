.class Lcom/getjar/sdk/data/earning/EarningScreenReceiver$1;
.super Ljava/lang/Object;
.source "EarningScreenReceiver.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/getjar/sdk/data/earning/EarningScreenReceiver;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/getjar/sdk/data/earning/EarningScreenReceiver;

.field final synthetic val$finalContext:Landroid/content/Context;

.field final synthetic val$finalIntent:Landroid/content/Intent;


# direct methods
.method constructor <init>(Lcom/getjar/sdk/data/earning/EarningScreenReceiver;Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0

    .prologue
    .line 40
    iput-object p1, p0, Lcom/getjar/sdk/data/earning/EarningScreenReceiver$1;->this$0:Lcom/getjar/sdk/data/earning/EarningScreenReceiver;

    iput-object p2, p0, Lcom/getjar/sdk/data/earning/EarningScreenReceiver$1;->val$finalContext:Landroid/content/Context;

    iput-object p3, p0, Lcom/getjar/sdk/data/earning/EarningScreenReceiver$1;->val$finalIntent:Landroid/content/Intent;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 44
    :try_start_0
    iget-object v1, p0, Lcom/getjar/sdk/data/earning/EarningScreenReceiver$1;->this$0:Lcom/getjar/sdk/data/earning/EarningScreenReceiver;

    iget-object v2, p0, Lcom/getjar/sdk/data/earning/EarningScreenReceiver$1;->val$finalContext:Landroid/content/Context;

    iget-object v3, p0, Lcom/getjar/sdk/data/earning/EarningScreenReceiver$1;->val$finalIntent:Landroid/content/Intent;

    invoke-virtual {v1, v2, v3}, Lcom/getjar/sdk/data/earning/EarningScreenReceiver;->doOnReceive(Landroid/content/Context;Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 50
    :goto_0
    return-void

    .line 45
    :catch_0
    move-exception v0

    .line 48
    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "EarningScreenReceiver: onReceive() failed"

    invoke-static {v1, v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
