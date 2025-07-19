.class public Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$InAppBillingNotifier;
.super Landroid/content/BroadcastReceiver;
.source "GetJarWebViewSubActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "InAppBillingNotifier"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;


# direct methods
.method public constructor <init>(Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;)V
    .locals 0

    .prologue
    .line 1233
    iput-object p1, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$InAppBillingNotifier;->this$0:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 9
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v8, 0x2

    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 1241
    if-eqz p2, :cond_0

    .line 1243
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    const-string v2, "com.getjar.sdk.NOTIFY_BUY_GOLD"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1244
    const-string v1, "FAILURE_REASON"

    invoke-virtual {p2, v1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 1246
    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v2, "javascript:GJ.successfulBuyGold(\"%s\",%s)"

    new-array v3, v8, [Ljava/lang/Object;

    const-string v4, "ITEM_ID"

    invoke-virtual {p2, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v6

    const-string v4, "order.gold_value"

    invoke-virtual {p2, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v7

    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 1250
    .local v0, "callJavascript":Ljava/lang/String;
    invoke-static {}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->access$500()Landroid/webkit/WebView;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 1251
    sget-object v1, Lcom/getjar/sdk/logging/Area;->BUY_GOLD:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "GetJarActivity BuyingGoldJavascriptNotifier success "

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 1263
    .end local v0    # "callJavascript":Ljava/lang/String;
    :cond_0
    :goto_0
    return-void

    .line 1255
    :cond_1
    sget-object v1, Lcom/getjar/sdk/logging/Area;->BUY_GOLD:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "GetJarActivity BuyingGoldJavascriptNotifier failure"

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 1256
    invoke-static {}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->access$500()Landroid/webkit/WebView;

    move-result-object v1

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "javascript:GJ.failedBuyGold(\"%s\",%s,\"%s\")"

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/Object;

    const-string v5, "ITEM_ID"

    invoke-virtual {p2, v5}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v6

    const-string v5, "order.gold_value"

    invoke-virtual {p2, v5}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v7

    const-string v5, "FAILURE_REASON"

    invoke-virtual {p2, v5}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v8

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    goto :goto_0
.end method
