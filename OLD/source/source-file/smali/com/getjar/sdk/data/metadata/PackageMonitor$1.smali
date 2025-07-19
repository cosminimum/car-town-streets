.class Lcom/getjar/sdk/data/metadata/PackageMonitor$1;
.super Ljava/lang/Object;
.source "PackageMonitor.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/getjar/sdk/data/metadata/PackageMonitor;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/getjar/sdk/data/metadata/PackageMonitor;

.field final synthetic val$finalContext:Landroid/content/Context;

.field final synthetic val$finalIntent:Landroid/content/Intent;


# direct methods
.method constructor <init>(Lcom/getjar/sdk/data/metadata/PackageMonitor;Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0

    .prologue
    .line 90
    iput-object p1, p0, Lcom/getjar/sdk/data/metadata/PackageMonitor$1;->this$0:Lcom/getjar/sdk/data/metadata/PackageMonitor;

    iput-object p2, p0, Lcom/getjar/sdk/data/metadata/PackageMonitor$1;->val$finalContext:Landroid/content/Context;

    iput-object p3, p0, Lcom/getjar/sdk/data/metadata/PackageMonitor$1;->val$finalIntent:Landroid/content/Intent;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 94
    :try_start_0
    iget-object v1, p0, Lcom/getjar/sdk/data/metadata/PackageMonitor$1;->this$0:Lcom/getjar/sdk/data/metadata/PackageMonitor;

    iget-object v2, p0, Lcom/getjar/sdk/data/metadata/PackageMonitor$1;->val$finalContext:Landroid/content/Context;

    iget-object v3, p0, Lcom/getjar/sdk/data/metadata/PackageMonitor$1;->val$finalIntent:Landroid/content/Intent;

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/data/metadata/PackageMonitor;->access$000(Lcom/getjar/sdk/data/metadata/PackageMonitor;Landroid/content/Context;Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 100
    :goto_0
    return-void

    .line 95
    :catch_0
    move-exception v0

    .line 98
    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    const-string v3, "PackageMonitor: onReceive() failed"

    invoke-static {v1, v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
