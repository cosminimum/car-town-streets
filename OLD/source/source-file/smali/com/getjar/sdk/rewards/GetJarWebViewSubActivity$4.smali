.class Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$4;
.super Landroid/content/BroadcastReceiver;
.source "GetJarWebViewSubActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;


# direct methods
.method constructor <init>(Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;)V
    .locals 0

    .prologue
    .line 229
    iput-object p1, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$4;->this$0:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 9
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 232
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 233
    .local v0, "action":Ljava/lang/String;
    sget-object v1, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "** PackageReceiver: %1$s [%2$s]"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    aput-object v0, v5, v7

    invoke-static {p2}, Lcom/getjar/sdk/utilities/Utility;->getPackageNameFromBroadcastIntent(Landroid/content/Intent;)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v8

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 234
    const-string v1, "android.intent.action.PACKAGE_ADDED"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "android.intent.extra.REPLACING"

    invoke-virtual {p2, v1, v7}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v1

    if-nez v1, :cond_0

    .line 236
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$4;->this$0:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-static {v1, v8}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->access$102(Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;Z)Z

    .line 237
    new-instance v1, Ljava/lang/Thread;

    new-instance v2, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$newPackageReceived;

    iget-object v3, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$4;->this$0:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    iget-object v4, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$4;->this$0:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    iget-object v4, v4, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mReceiver:Landroid/os/ResultReceiver;

    invoke-direct {v2, v3, v4}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$newPackageReceived;-><init>(Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;Landroid/os/ResultReceiver;)V

    invoke-direct {v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 239
    :cond_0
    return-void
.end method
