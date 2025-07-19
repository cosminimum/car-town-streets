.class Lcom/getjar/sdk/rewards/GetJarService$3;
.super Ljava/lang/Object;
.source "GetJarService.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/getjar/sdk/rewards/GetJarService;->onCreate()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/getjar/sdk/rewards/GetJarService;


# direct methods
.method constructor <init>(Lcom/getjar/sdk/rewards/GetJarService;)V
    .locals 0

    .prologue
    .line 709
    iput-object p1, p0, Lcom/getjar/sdk/rewards/GetJarService$3;->this$0:Lcom/getjar/sdk/rewards/GetJarService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 715
    :try_start_0
    sget-object v1, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    const-string v3, "GetJarService: onCreate()"

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 716
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarService$3;->this$0:Lcom/getjar/sdk/rewards/GetJarService;

    invoke-virtual {v1}, Lcom/getjar/sdk/rewards/GetJarService;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/getjar/sdk/data/earning/EarningMonitor;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/earning/EarningMonitor;

    move-result-object v1

    invoke-virtual {v1}, Lcom/getjar/sdk/data/earning/EarningMonitor;->isMonitoring()Z

    move-result v1

    if-nez v1, :cond_0

    .line 717
    sget-object v1, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "GetJarService: onCreate() starting earning monitoring thread"

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 718
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarService$3;->this$0:Lcom/getjar/sdk/rewards/GetJarService;

    invoke-virtual {v1}, Lcom/getjar/sdk/rewards/GetJarService;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/getjar/sdk/data/earning/EarningMonitor;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/earning/EarningMonitor;

    move-result-object v1

    invoke-virtual {v1}, Lcom/getjar/sdk/data/earning/EarningMonitor;->startMonitoring()V

    .line 720
    :cond_0
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarService$3;->this$0:Lcom/getjar/sdk/rewards/GetJarService;

    invoke-virtual {v1}, Lcom/getjar/sdk/rewards/GetJarService;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/getjar/sdk/data/usage/UsageMonitor;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/usage/UsageMonitor;

    move-result-object v1

    invoke-virtual {v1}, Lcom/getjar/sdk/data/usage/UsageMonitor;->isMonitoring()Z

    move-result v1

    if-nez v1, :cond_1

    .line 721
    sget-object v1, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "GetJarService: onCreate() starting usage monitoring thread"

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 722
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarService$3;->this$0:Lcom/getjar/sdk/rewards/GetJarService;

    invoke-virtual {v1}, Lcom/getjar/sdk/rewards/GetJarService;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/getjar/sdk/data/usage/UsageMonitor;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/usage/UsageMonitor;

    move-result-object v1

    invoke-virtual {v1}, Lcom/getjar/sdk/data/usage/UsageMonitor;->startMonitoring()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 727
    :cond_1
    :goto_0
    return-void

    .line 724
    :catch_0
    move-exception v0

    .line 725
    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    const-string v3, "GetJarService: onCreate() failed"

    invoke-static {v1, v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
