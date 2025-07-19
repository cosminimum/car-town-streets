.class Lcom/getjar/sdk/rewards/GetJarService$1;
.super Ljava/lang/Object;
.source "GetJarService.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/getjar/sdk/rewards/GetJarService;->onStartCommand(Landroid/content/Intent;II)I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/getjar/sdk/rewards/GetJarService;

.field final synthetic val$intent:Landroid/content/Intent;

.field final synthetic val$startId:I


# direct methods
.method constructor <init>(Lcom/getjar/sdk/rewards/GetJarService;Landroid/content/Intent;I)V
    .locals 0

    .prologue
    .line 428
    iput-object p1, p0, Lcom/getjar/sdk/rewards/GetJarService$1;->this$0:Lcom/getjar/sdk/rewards/GetJarService;

    iput-object p2, p0, Lcom/getjar/sdk/rewards/GetJarService$1;->val$intent:Landroid/content/Intent;

    iput p3, p0, Lcom/getjar/sdk/rewards/GetJarService$1;->val$startId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 433
    :try_start_0
    iget-object v2, p0, Lcom/getjar/sdk/rewards/GetJarService$1;->this$0:Lcom/getjar/sdk/rewards/GetJarService;

    iget-object v3, p0, Lcom/getjar/sdk/rewards/GetJarService$1;->val$intent:Landroid/content/Intent;

    iget v4, p0, Lcom/getjar/sdk/rewards/GetJarService$1;->val$startId:I

    invoke-virtual {v2, v3, v4}, Lcom/getjar/sdk/rewards/GetJarService;->handleCommand(Landroid/content/Intent;I)V

    .line 434
    iget-object v2, p0, Lcom/getjar/sdk/rewards/GetJarService$1;->this$0:Lcom/getjar/sdk/rewards/GetJarService;

    invoke-virtual {v2}, Lcom/getjar/sdk/rewards/GetJarService;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const-string v3, "GetJarClientPrefs"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 435
    .local v1, "prefs":Landroid/content/SharedPreferences;
    const-string v2, "billing_supported"

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-nez v2, :cond_0

    .line 437
    iget-object v2, p0, Lcom/getjar/sdk/rewards/GetJarService$1;->this$0:Lcom/getjar/sdk/rewards/GetJarService;

    invoke-virtual {v2}, Lcom/getjar/sdk/rewards/GetJarService;->checkBillingSupported()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 443
    .end local v1    # "prefs":Landroid/content/SharedPreferences;
    :cond_0
    :goto_0
    return-void

    .line 439
    :catch_0
    move-exception v0

    .line 440
    .local v0, "ex":Ljava/lang/Exception;
    sget-object v2, Lcom/getjar/sdk/logging/Area;->BUY_GOLD:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    const-string v4, "GetJarService onStart"

    invoke-static {v2, v3, v4, v0}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
