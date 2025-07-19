.class Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ScreenWakeupReceiver;
.super Landroid/content/BroadcastReceiver;
.source "GetJarWebViewSubActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ScreenWakeupReceiver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;


# direct methods
.method private constructor <init>(Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;)V
    .locals 0

    .prologue
    .line 1343
    iput-object p1, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ScreenWakeupReceiver;->this$0:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;
    .param p2, "x1"    # Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$1;

    .prologue
    .line 1343
    invoke-direct {p0, p1}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ScreenWakeupReceiver;-><init>(Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;)V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 1349
    :try_start_0
    sget-object v3, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    const-string v5, "Reloading the WebView due to screen wake-up"

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 1350
    iget-object v3, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ScreenWakeupReceiver;->this$0:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-static {v3}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->access$900(Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;)Lcom/getjar/sdk/comm/CommContext;

    move-result-object v3

    const/4 v4, 0x0

    invoke-static {v3, v4}, Lcom/getjar/sdk/comm/GetJarConfig;->getInstance(Lcom/getjar/sdk/comm/CommContext;Z)Lcom/getjar/sdk/comm/GetJarConfig;

    move-result-object v3

    const-string v4, "webview.sleep_reload.interval"

    invoke-virtual {v3, v4}, Lcom/getjar/sdk/comm/GetJarConfig;->getDirectiveValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    .line 1352
    .local v1, "webviewSleepReloadInterval":J
    sget-object v3, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "GetJarJavaScriptInterface ScreenWakeupReceiver sleepReloadInterval="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 1353
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    const-wide/16 v5, 0x3e8

    div-long/2addr v3, v5

    iget-object v5, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ScreenWakeupReceiver;->this$0:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    iget-object v5, v5, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mJavaScriptInterface:Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;

    invoke-virtual {v5}, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->getLastReloadTime()J

    move-result-wide v5

    sub-long/2addr v3, v5

    cmp-long v3, v3, v1

    if-lez v3, :cond_0

    .line 1354
    sget-object v3, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    const-string v5, "GetJarJavaScriptInterface ScreenWakeupReceiver reloading..."

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 1355
    invoke-static {}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->access$500()Landroid/webkit/WebView;

    move-result-object v3

    invoke-virtual {v3}, Landroid/webkit/WebView;->reload()V

    .line 1356
    iget-object v3, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ScreenWakeupReceiver;->this$0:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    iget-object v3, v3, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mJavaScriptInterface:Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;

    invoke-virtual {v3}, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->setLastReloadTime()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1360
    .end local v1    # "webviewSleepReloadInterval":J
    :cond_0
    :goto_0
    return-void

    .line 1359
    :catch_0
    move-exception v0

    .local v0, "e":Ljava/lang/Exception;
    sget-object v3, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    const-string v5, "WebView reload failed"

    invoke-static {v3, v4, v5, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
