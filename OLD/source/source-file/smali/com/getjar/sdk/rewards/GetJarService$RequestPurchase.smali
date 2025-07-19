.class Lcom/getjar/sdk/rewards/GetJarService$RequestPurchase;
.super Lcom/getjar/sdk/rewards/GetJarService$BillingRequest;
.source "GetJarService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getjar/sdk/rewards/GetJarService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "RequestPurchase"
.end annotation


# instance fields
.field public final mProductId:Ljava/lang/String;

.field final synthetic this$0:Lcom/getjar/sdk/rewards/GetJarService;


# direct methods
.method public constructor <init>(Lcom/getjar/sdk/rewards/GetJarService;Ljava/lang/String;)V
    .locals 1
    .param p2, "itemId"    # Ljava/lang/String;

    .prologue
    .line 245
    iput-object p1, p0, Lcom/getjar/sdk/rewards/GetJarService$RequestPurchase;->this$0:Lcom/getjar/sdk/rewards/GetJarService;

    .line 246
    const/4 v0, -0x1

    invoke-direct {p0, p1, v0}, Lcom/getjar/sdk/rewards/GetJarService$BillingRequest;-><init>(Lcom/getjar/sdk/rewards/GetJarService;I)V

    .line 247
    iput-object p2, p0, Lcom/getjar/sdk/rewards/GetJarService$RequestPurchase;->mProductId:Ljava/lang/String;

    .line 248
    return-void
.end method


# virtual methods
.method protected responseCodeReceived(Lcom/getjar/sdk/utilities/Constants$ResponseCode;)V
    .locals 4
    .param p1, "responseCode"    # Lcom/getjar/sdk/utilities/Constants$ResponseCode;

    .prologue
    .line 285
    sget-object v0, Lcom/getjar/sdk/utilities/Constants$ResponseCode;->RESULT_OK:Lcom/getjar/sdk/utilities/Constants$ResponseCode;

    invoke-virtual {v0, p1}, Lcom/getjar/sdk/utilities/Constants$ResponseCode;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 287
    sget-object v0, Lcom/getjar/sdk/utilities/Constants$ResponseCode;->RESULT_ITEM_UNAVAILABLE:Lcom/getjar/sdk/utilities/Constants$ResponseCode;

    invoke-virtual {p1, v0}, Lcom/getjar/sdk/utilities/Constants$ResponseCode;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 289
    iget-object v0, p0, Lcom/getjar/sdk/rewards/GetJarService$RequestPurchase;->this$0:Lcom/getjar/sdk/rewards/GetJarService;

    invoke-virtual {v0}, Lcom/getjar/sdk/rewards/GetJarService;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/rewards/InAppPurchaseManager;

    move-result-object v0

    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarService$RequestPurchase;->mProductId:Ljava/lang/String;

    sget-object v2, Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;->ITEM_NOT_AVAILABLE:Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;

    iget-object v3, p0, Lcom/getjar/sdk/rewards/GetJarService$RequestPurchase;->this$0:Lcom/getjar/sdk/rewards/GetJarService;

    invoke-virtual {v3}, Lcom/getjar/sdk/rewards/GetJarService;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v0, v1, v2, v3}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->handleFailure(Ljava/lang/String;Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;Landroid/content/Context;)V

    .line 300
    :cond_0
    :goto_0
    return-void

    .line 291
    :cond_1
    sget-object v0, Lcom/getjar/sdk/utilities/Constants$ResponseCode;->RESULT_USER_CANCELED:Lcom/getjar/sdk/utilities/Constants$ResponseCode;

    invoke-virtual {p1, v0}, Lcom/getjar/sdk/utilities/Constants$ResponseCode;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 293
    iget-object v0, p0, Lcom/getjar/sdk/rewards/GetJarService$RequestPurchase;->this$0:Lcom/getjar/sdk/rewards/GetJarService;

    invoke-virtual {v0}, Lcom/getjar/sdk/rewards/GetJarService;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/rewards/InAppPurchaseManager;

    move-result-object v0

    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarService$RequestPurchase;->mProductId:Ljava/lang/String;

    sget-object v2, Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;->CANCELLED:Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;

    iget-object v3, p0, Lcom/getjar/sdk/rewards/GetJarService$RequestPurchase;->this$0:Lcom/getjar/sdk/rewards/GetJarService;

    invoke-virtual {v3}, Lcom/getjar/sdk/rewards/GetJarService;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v0, v1, v2, v3}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->handleFailure(Ljava/lang/String;Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;Landroid/content/Context;)V

    goto :goto_0

    .line 297
    :cond_2
    iget-object v0, p0, Lcom/getjar/sdk/rewards/GetJarService$RequestPurchase;->this$0:Lcom/getjar/sdk/rewards/GetJarService;

    invoke-virtual {v0}, Lcom/getjar/sdk/rewards/GetJarService;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/rewards/InAppPurchaseManager;

    move-result-object v0

    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarService$RequestPurchase;->mProductId:Ljava/lang/String;

    sget-object v2, Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;->GOOGLE_PLAY_BIND_FAILURE:Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;

    iget-object v3, p0, Lcom/getjar/sdk/rewards/GetJarService$RequestPurchase;->this$0:Lcom/getjar/sdk/rewards/GetJarService;

    invoke-virtual {v3}, Lcom/getjar/sdk/rewards/GetJarService;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v0, v1, v2, v3}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->handleFailure(Ljava/lang/String;Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;Landroid/content/Context;)V

    goto :goto_0
.end method

.method protected run()J
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    const/4 v11, 0x1

    const/4 v10, 0x0

    .line 253
    sget-object v4, Lcom/getjar/sdk/logging/Area;->BUY_GOLD:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    sget-object v6, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v7, "GooglePlayBillingService RequestPurchase run mProductId %s"

    new-array v8, v11, [Ljava/lang/Object;

    iget-object v9, p0, Lcom/getjar/sdk/rewards/GetJarService$RequestPurchase;->mProductId:Ljava/lang/String;

    aput-object v9, v8, v10

    invoke-static {v6, v7, v8}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v5, v6}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 254
    const-string v4, "REQUEST_PURCHASE"

    invoke-virtual {p0, v4}, Lcom/getjar/sdk/rewards/GetJarService$RequestPurchase;->makeRequestBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v2

    .line 255
    .local v2, "request":Landroid/os/Bundle;
    const-string v4, "ITEM_ID"

    iget-object v5, p0, Lcom/getjar/sdk/rewards/GetJarService$RequestPurchase;->mProductId:Ljava/lang/String;

    invoke-virtual {v2, v4, v5}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 260
    const-string v4, "DEVELOPER_PAYLOAD"

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "%s%s"

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Object;

    const-string v8, "db8ecd00-3db5-11e2-a25f-0800200c9a66"

    aput-object v8, v7, v10

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v7, v11

    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v4, v5}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 261
    sget-object v4, Lcom/getjar/sdk/logging/Area;->BUY_GOLD:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    sget-object v6, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v7, "GetJarService requestBundle: %s"

    new-array v8, v11, [Ljava/lang/Object;

    aput-object v2, v8, v10

    invoke-static {v6, v7, v8}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v5, v6}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 262
    invoke-static {}, Lcom/getjar/sdk/rewards/GetJarService;->access$200()Lcom/getjar/sdk/vending/billing/IMarketBillingService;

    move-result-object v4

    if-eqz v4, :cond_1

    .line 263
    invoke-static {}, Lcom/getjar/sdk/rewards/GetJarService;->access$200()Lcom/getjar/sdk/vending/billing/IMarketBillingService;

    move-result-object v4

    invoke-interface {v4, v2}, Lcom/getjar/sdk/vending/billing/IMarketBillingService;->sendBillingRequest(Landroid/os/Bundle;)Landroid/os/Bundle;

    move-result-object v3

    .line 264
    .local v3, "response":Landroid/os/Bundle;
    const-string v4, "PURCHASE_INTENT"

    invoke-virtual {v3, v4}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Landroid/app/PendingIntent;

    .line 266
    .local v1, "pendingIntent":Landroid/app/PendingIntent;
    if-nez v1, :cond_0

    .line 267
    sget-object v4, Lcom/getjar/sdk/logging/Area;->BUY_GOLD:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    const-string v6, "Error with requestPurchase"

    invoke-static {v4, v5, v6}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;)V

    .line 268
    sget-wide v4, Lcom/getjar/sdk/utilities/Constants;->BILLING_RESPONSE_INVALID_REQUEST_ID:J

    .line 278
    .end local v1    # "pendingIntent":Landroid/app/PendingIntent;
    .end local v3    # "response":Landroid/os/Bundle;
    :goto_0
    return-wide v4

    .line 271
    .restart local v1    # "pendingIntent":Landroid/app/PendingIntent;
    .restart local v3    # "response":Landroid/os/Bundle;
    :cond_0
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 272
    .local v0, "intent":Landroid/content/Intent;
    iget-object v4, p0, Lcom/getjar/sdk/rewards/GetJarService$RequestPurchase;->this$0:Lcom/getjar/sdk/rewards/GetJarService;

    invoke-virtual {v4, v1, v0}, Lcom/getjar/sdk/rewards/GetJarService;->startBuyPageActivity(Landroid/app/PendingIntent;Landroid/content/Intent;)V

    .line 274
    const-string v4, "REQUEST_ID"

    sget-wide v5, Lcom/getjar/sdk/utilities/Constants;->BILLING_RESPONSE_INVALID_REQUEST_ID:J

    invoke-virtual {v3, v4, v5, v6}, Landroid/os/Bundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v4

    goto :goto_0

    .line 277
    .end local v0    # "intent":Landroid/content/Intent;
    .end local v1    # "pendingIntent":Landroid/app/PendingIntent;
    .end local v3    # "response":Landroid/os/Bundle;
    :cond_1
    iget-object v4, p0, Lcom/getjar/sdk/rewards/GetJarService$RequestPurchase;->this$0:Lcom/getjar/sdk/rewards/GetJarService;

    invoke-static {v4}, Lcom/getjar/sdk/rewards/GetJarService;->access$000(Lcom/getjar/sdk/rewards/GetJarService;)Z

    .line 278
    sget-wide v4, Lcom/getjar/sdk/utilities/Constants;->BILLING_RESPONSE_INVALID_REQUEST_ID:J

    goto :goto_0
.end method
