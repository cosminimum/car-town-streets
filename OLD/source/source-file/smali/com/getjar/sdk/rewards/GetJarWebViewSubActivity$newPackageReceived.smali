.class Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$newPackageReceived;
.super Ljava/lang/Object;
.source "GetJarWebViewSubActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "newPackageReceived"
.end annotation


# instance fields
.field mReceiver:Landroid/os/ResultReceiver;

.field final synthetic this$0:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;


# direct methods
.method public constructor <init>(Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;Landroid/os/ResultReceiver;)V
    .locals 0
    .param p2, "receiver"    # Landroid/os/ResultReceiver;

    .prologue
    .line 255
    iput-object p1, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$newPackageReceived;->this$0:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 256
    iput-object p2, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$newPackageReceived;->mReceiver:Landroid/os/ResultReceiver;

    .line 257
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 261
    :try_start_0
    sget-object v1, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    const-string v3, "waiting..."

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 262
    const-wide/16 v1, 0x2710

    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V

    .line 263
    sget-object v1, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    const-string v3, "finish waiting..."

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 264
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$newPackageReceived;->mReceiver:Landroid/os/ResultReceiver;

    const/4 v2, 0x4

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/os/ResultReceiver;->send(ILandroid/os/Bundle;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 270
    :goto_0
    return-void

    .line 265
    :catch_0
    move-exception v0

    .line 268
    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    const-string v3, "newPackageReceived() failed"

    invoke-static {v1, v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
