.class Lcom/getjar/sdk/rewards/GetJarService$2;
.super Ljava/lang/Object;
.source "GetJarService.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/getjar/sdk/rewards/GetJarService;->onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
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
    .line 664
    iput-object p1, p0, Lcom/getjar/sdk/rewards/GetJarService$2;->this$0:Lcom/getjar/sdk/rewards/GetJarService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 669
    :try_start_0
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarService$2;->this$0:Lcom/getjar/sdk/rewards/GetJarService;

    invoke-static {v1}, Lcom/getjar/sdk/rewards/GetJarService;->access$500(Lcom/getjar/sdk/rewards/GetJarService;)V

    .line 670
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarService$2;->this$0:Lcom/getjar/sdk/rewards/GetJarService;

    invoke-static {v1}, Lcom/getjar/sdk/rewards/GetJarService;->access$600(Lcom/getjar/sdk/rewards/GetJarService;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 674
    :goto_0
    return-void

    .line 671
    :catch_0
    move-exception v0

    .line 672
    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Lcom/getjar/sdk/logging/Area;->BUY_GOLD:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    const-string v3, "GetjarService onServiceConnected"

    invoke-static {v1, v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
