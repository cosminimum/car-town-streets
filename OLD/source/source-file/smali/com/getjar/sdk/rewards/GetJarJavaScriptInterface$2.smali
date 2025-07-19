.class Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$2;
.super Ljava/lang/Object;
.source "GetJarJavaScriptInterface.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->requestGoldOffers()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;


# direct methods
.method constructor <init>(Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;)V
    .locals 0

    .prologue
    .line 431
    iput-object p1, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$2;->this$0:Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 437
    :try_start_0
    iget-object v2, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$2;->this$0:Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;

    iget-object v2, v2, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v2}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/rewards/InAppPurchaseManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->getGoldOffers()Ljava/lang/String;

    move-result-object v1

    .line 438
    .local v1, "offers":Ljava/lang/String;
    iget-object v2, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$2;->this$0:Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;

    iget-object v2, v2, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_parentActivity:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-virtual {v2}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->getParentActivity()Landroid/app/Activity;

    move-result-object v2

    new-instance v3, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$2$1;

    invoke-direct {v3, p0, v1}, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$2$1;-><init>(Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$2;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 459
    .end local v1    # "offers":Ljava/lang/String;
    :goto_0
    return-void

    .line 454
    :catch_0
    move-exception v0

    .line 457
    .local v0, "e":Ljava/lang/Exception;
    sget-object v2, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    sget-object v4, Lcom/getjar/sdk/logging/Area;->BUY_GOLD:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    const-string v4, "JavaScriptAPI: requestGoldOffers() failed"

    invoke-static {v2, v3, v4, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
