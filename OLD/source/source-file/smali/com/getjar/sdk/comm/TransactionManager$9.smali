.class Lcom/getjar/sdk/comm/TransactionManager$9;
.super Ljava/lang/Object;
.source "TransactionManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/getjar/sdk/comm/TransactionManager;->buyCurrencyForGoogleTransactions(Lcom/getjar/sdk/comm/CommContext;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/getjar/sdk/comm/TransactionManager;

.field final synthetic val$commContext:Lcom/getjar/sdk/comm/CommContext;


# direct methods
.method constructor <init>(Lcom/getjar/sdk/comm/TransactionManager;Lcom/getjar/sdk/comm/CommContext;)V
    .locals 0

    .prologue
    .line 1623
    iput-object p1, p0, Lcom/getjar/sdk/comm/TransactionManager$9;->this$0:Lcom/getjar/sdk/comm/TransactionManager;

    iput-object p2, p0, Lcom/getjar/sdk/comm/TransactionManager$9;->val$commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 18

    .prologue
    .line 1627
    invoke-static {}, Lcom/getjar/sdk/comm/TransactionManager;->access$600()Ljava/lang/Object;

    move-result-object v15

    monitor-enter v15

    .line 1629
    :try_start_0
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/getjar/sdk/comm/TransactionManager$9;->val$commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v1}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/rewards/InAppPurchaseManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->getAllPurchaseResponses()Ljava/util/List;

    move-result-object v13

    check-cast v13, Ljava/util/ArrayList;

    .line 1632
    .local v13, "responseItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/getjar/sdk/data/GooglePurchaseResponse;>;"
    invoke-virtual {v13}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .local v9, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/getjar/sdk/data/GooglePurchaseResponse;

    .line 1634
    .local v12, "purchaseResponse":Lcom/getjar/sdk/data/GooglePurchaseResponse;
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/getjar/sdk/comm/TransactionManager$9;->this$0:Lcom/getjar/sdk/comm/TransactionManager;

    invoke-static {v1}, Lcom/getjar/sdk/comm/TransactionManager;->access$400(Lcom/getjar/sdk/comm/TransactionManager;)Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v12, v1}, Lcom/getjar/sdk/data/GooglePurchaseResponse;->getResponseAsMap(Landroid/content/Context;)Ljava/util/Map;

    move-result-object v5

    check-cast v5, Ljava/util/HashMap;

    .line 1635
    .local v5, "purchaseDetailsMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-virtual {v12}, Lcom/getjar/sdk/data/GooglePurchaseResponse;->getProductId()Ljava/lang/String;

    move-result-object v4

    .line 1636
    .local v4, "productId":Ljava/lang/String;
    invoke-virtual {v12}, Lcom/getjar/sdk/data/GooglePurchaseResponse;->getDeveloperPayload()Ljava/lang/String;

    move-result-object v3

    .line 1638
    .local v3, "developerPayload":Ljava/lang/String;
    sget-object v1, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "TransactionManager buyGold dev payload: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v1, v2, v6}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 1640
    invoke-static {v3}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1642
    const-string v1, "android.test"

    invoke-virtual {v4, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 1644
    sget-object v1, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    const-string v6, "TransactionManager: buyCurrencyForGoogleTransactions() putting in demo clientTransactionId"

    invoke-static {v1, v2, v6}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 1645
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "db8ecd00-3db5-11e2-a25f-0800200c9a66"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 1655
    :cond_0
    const-string v1, "db8ecd00-3db5-11e2-a25f-0800200c9a66"

    invoke-virtual {v3, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4

    const-string v1, "getjar"

    invoke-virtual {v4, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string v1, "android.test"

    invoke-virtual {v4, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 1657
    :cond_1
    const-string v1, "db8ecd00-3db5-11e2-a25f-0800200c9a66"

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {v3, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .line 1666
    invoke-static {}, Lcom/getjar/sdk/comm/TransactionServiceProxy;->getInstance()Lcom/getjar/sdk/comm/TransactionServiceProxy;

    move-result-object v1

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/getjar/sdk/comm/TransactionManager$9;->val$commContext:Lcom/getjar/sdk/comm/CommContext;

    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    const/4 v7, 0x1

    invoke-virtual/range {v1 .. v7}, Lcom/getjar/sdk/comm/TransactionServiceProxy;->buyCurrency(Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;Ljava/util/HashMap;Z)Lcom/getjar/sdk/comm/Operation;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v11

    .line 1675
    .local v11, "operation":Lcom/getjar/sdk/comm/Operation;
    :try_start_1
    invoke-virtual {v11}, Lcom/getjar/sdk/comm/Operation;->get()Lcom/getjar/sdk/comm/Result;

    move-result-object v14

    .line 1677
    .local v14, "result":Lcom/getjar/sdk/comm/Result;
    if-eqz v14, :cond_7

    .line 1680
    invoke-virtual {v14}, Lcom/getjar/sdk/comm/Result;->checkForCallerUnauthorized()Z

    move-result v1

    if-eqz v1, :cond_5

    .line 1681
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/getjar/sdk/comm/TransactionManager$9;->val$commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v1}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/rewards/InAppPurchaseManager;

    move-result-object v1

    sget-object v2, Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;->UNAUTHORIZED:Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/getjar/sdk/comm/TransactionManager$9;->this$0:Lcom/getjar/sdk/comm/TransactionManager;

    invoke-static {v6}, Lcom/getjar/sdk/comm/TransactionManager;->access$400(Lcom/getjar/sdk/comm/TransactionManager;)Landroid/content/Context;

    move-result-object v6

    invoke-virtual {v1, v4, v2, v6}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->handleFailure(Ljava/lang/String;Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;Landroid/content/Context;)V

    .line 1682
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/getjar/sdk/comm/TransactionManager$9;->val$commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v1}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/rewards/InAppPurchaseManager;

    move-result-object v1

    invoke-virtual {v12}, Lcom/getjar/sdk/data/GooglePurchaseResponse;->getOrderId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->removePurchaseResponse(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto/16 :goto_0

    .line 1711
    .end local v14    # "result":Lcom/getjar/sdk/comm/Result;
    :catch_0
    move-exception v8

    .line 1713
    .local v8, "e":Ljava/lang/InterruptedException;
    :try_start_2
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/getjar/sdk/comm/TransactionManager$9;->val$commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v1}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/rewards/InAppPurchaseManager;

    move-result-object v1

    sget-object v2, Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;->GETJAR_SERVICE_FAILURE:Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/getjar/sdk/comm/TransactionManager$9;->this$0:Lcom/getjar/sdk/comm/TransactionManager;

    invoke-static {v6}, Lcom/getjar/sdk/comm/TransactionManager;->access$400(Lcom/getjar/sdk/comm/TransactionManager;)Landroid/content/Context;

    move-result-object v6

    invoke-virtual {v1, v4, v2, v6}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->handleFailure(Ljava/lang/String;Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;Landroid/content/Context;)V

    .line 1715
    sget-object v1, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    const-string v6, "TransactionManager: buyCurrencyForGoogleTransactions() failed"

    invoke-static {v1, v2, v6, v8}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto/16 :goto_0

    .line 1723
    .end local v3    # "developerPayload":Ljava/lang/String;
    .end local v4    # "productId":Ljava/lang/String;
    .end local v5    # "purchaseDetailsMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v8    # "e":Ljava/lang/InterruptedException;
    .end local v9    # "i$":Ljava/util/Iterator;
    .end local v11    # "operation":Lcom/getjar/sdk/comm/Operation;
    .end local v12    # "purchaseResponse":Lcom/getjar/sdk/data/GooglePurchaseResponse;
    .end local v13    # "responseItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/getjar/sdk/data/GooglePurchaseResponse;>;"
    :catch_1
    move-exception v8

    .line 1726
    .local v8, "e":Ljava/lang/Exception;
    :try_start_3
    sget-object v1, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    const-string v6, "TransactionManager: buyCurrencyForGoogleTransactions() failed"

    invoke-static {v1, v2, v6, v8}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 1728
    .end local v8    # "e":Ljava/lang/Exception;
    :cond_2
    monitor-exit v15
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1729
    return-void

    .line 1649
    .restart local v3    # "developerPayload":Ljava/lang/String;
    .restart local v4    # "productId":Ljava/lang/String;
    .restart local v5    # "purchaseDetailsMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v9    # "i$":Ljava/util/Iterator;
    .restart local v12    # "purchaseResponse":Lcom/getjar/sdk/data/GooglePurchaseResponse;
    .restart local v13    # "responseItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/getjar/sdk/data/GooglePurchaseResponse;>;"
    :cond_3
    :try_start_4
    sget-object v1, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    const-string v6, "TransactionManager: buyCurrencyForGoogleTransactions() buying gold failed [null payload]"

    invoke-static {v1, v2, v6}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;)V

    .line 1650
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/getjar/sdk/comm/TransactionManager$9;->val$commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v1}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/rewards/InAppPurchaseManager;

    move-result-object v1

    invoke-virtual {v12}, Lcom/getjar/sdk/data/GooglePurchaseResponse;->getOrderId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->removePurchaseResponse(Ljava/lang/String;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto/16 :goto_0

    .line 1728
    .end local v3    # "developerPayload":Ljava/lang/String;
    .end local v4    # "productId":Ljava/lang/String;
    .end local v5    # "purchaseDetailsMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v9    # "i$":Ljava/util/Iterator;
    .end local v12    # "purchaseResponse":Lcom/getjar/sdk/data/GooglePurchaseResponse;
    .end local v13    # "responseItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/getjar/sdk/data/GooglePurchaseResponse;>;"
    :catchall_0
    move-exception v1

    :try_start_5
    monitor-exit v15
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    throw v1

    .line 1661
    .restart local v3    # "developerPayload":Ljava/lang/String;
    .restart local v4    # "productId":Ljava/lang/String;
    .restart local v5    # "purchaseDetailsMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v9    # "i$":Ljava/util/Iterator;
    .restart local v12    # "purchaseResponse":Lcom/getjar/sdk/data/GooglePurchaseResponse;
    .restart local v13    # "responseItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/getjar/sdk/data/GooglePurchaseResponse;>;"
    :cond_4
    :try_start_6
    sget-object v1, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    const-string v6, "TransactionManager: buyCurrencyForGoogleTransactions() buying gold failed [not getjar]"

    invoke-static {v1, v2, v6}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;)V

    .line 1662
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/getjar/sdk/comm/TransactionManager$9;->val$commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v1}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/rewards/InAppPurchaseManager;

    move-result-object v1

    invoke-virtual {v12}, Lcom/getjar/sdk/data/GooglePurchaseResponse;->getOrderId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->removePurchaseResponse(Ljava/lang/String;)V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_1
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    goto/16 :goto_0

    .line 1686
    .restart local v11    # "operation":Lcom/getjar/sdk/comm/Operation;
    .restart local v14    # "result":Lcom/getjar/sdk/comm/Result;
    :cond_5
    :try_start_7
    invoke-virtual {v14}, Lcom/getjar/sdk/comm/Result;->isSuccessfulResponse()Z

    move-result v1

    if-eqz v1, :cond_6

    .line 1688
    sget-object v1, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    const-string v6, "TransactionManager: buyCurrencyForGoogleTransactions() -- Successfully bought currency!"

    invoke-static {v1, v2, v6}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    .line 1689
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/getjar/sdk/comm/TransactionManager$9;->val$commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v1}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/rewards/InAppPurchaseManager;

    move-result-object v1

    invoke-virtual {v12}, Lcom/getjar/sdk/data/GooglePurchaseResponse;->getOrderId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->removePurchaseResponse(Ljava/lang/String;)V

    .line 1691
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/getjar/sdk/comm/TransactionManager$9;->val$commContext:Lcom/getjar/sdk/comm/CommContext;

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "%s Gold added to your balance!"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/16 v16, 0x0

    const-string v17, "order.gold_value"

    move-object/from16 v0, v17

    invoke-virtual {v5, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v17

    aput-object v17, v7, v16

    invoke-static {v2, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/getjar/sdk/utilities/NotificationsUtility;->pushSuccessNotification(Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;)V

    .line 1695
    new-instance v10, Landroid/content/Intent;

    const-string v1, "com.getjar.sdk.NOTIFY_BUY_GOLD"

    invoke-direct {v10, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1696
    .local v10, "intent":Landroid/content/Intent;
    const-string v1, "ITEM_ID"

    invoke-virtual {v10, v1, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1697
    const-string v2, "order.gold_value"

    const-string v1, "order.gold_value"

    invoke-virtual {v5, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v10, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1698
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/getjar/sdk/comm/TransactionManager$9;->this$0:Lcom/getjar/sdk/comm/TransactionManager;

    invoke-static {v1}, Lcom/getjar/sdk/comm/TransactionManager;->access$400(Lcom/getjar/sdk/comm/TransactionManager;)Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, v10}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V
    :try_end_7
    .catch Ljava/lang/InterruptedException; {:try_start_7 .. :try_end_7} :catch_0
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_7 .. :try_end_7} :catch_2
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_1
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    goto/16 :goto_0

    .line 1716
    .end local v10    # "intent":Landroid/content/Intent;
    .end local v14    # "result":Lcom/getjar/sdk/comm/Result;
    :catch_2
    move-exception v8

    .line 1718
    .local v8, "e":Ljava/util/concurrent/ExecutionException;
    :try_start_8
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/getjar/sdk/comm/TransactionManager$9;->val$commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v1}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/rewards/InAppPurchaseManager;

    move-result-object v1

    sget-object v2, Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;->GETJAR_SERVICE_FAILURE:Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/getjar/sdk/comm/TransactionManager$9;->this$0:Lcom/getjar/sdk/comm/TransactionManager;

    invoke-static {v6}, Lcom/getjar/sdk/comm/TransactionManager;->access$400(Lcom/getjar/sdk/comm/TransactionManager;)Landroid/content/Context;

    move-result-object v6

    invoke-virtual {v1, v4, v2, v6}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->handleFailure(Ljava/lang/String;Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;Landroid/content/Context;)V

    .line 1720
    sget-object v1, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    const-string v6, "TransactionManager: buyCurrencyForGoogleTransactions() failed"

    invoke-static {v1, v2, v6, v8}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_1
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    goto/16 :goto_0

    .line 1702
    .end local v8    # "e":Ljava/util/concurrent/ExecutionException;
    .restart local v14    # "result":Lcom/getjar/sdk/comm/Result;
    :cond_6
    :try_start_9
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/getjar/sdk/comm/TransactionManager$9;->val$commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v1}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/rewards/InAppPurchaseManager;

    move-result-object v1

    sget-object v2, Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;->GETJAR_SERVICE_FAILURE:Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/getjar/sdk/comm/TransactionManager$9;->this$0:Lcom/getjar/sdk/comm/TransactionManager;

    invoke-static {v6}, Lcom/getjar/sdk/comm/TransactionManager;->access$400(Lcom/getjar/sdk/comm/TransactionManager;)Landroid/content/Context;

    move-result-object v6

    invoke-virtual {v1, v4, v2, v6}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->handleFailure(Ljava/lang/String;Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;Landroid/content/Context;)V

    goto/16 :goto_0

    .line 1708
    :cond_7
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/getjar/sdk/comm/TransactionManager$9;->val$commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v1}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/rewards/InAppPurchaseManager;

    move-result-object v1

    sget-object v2, Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;->NETWORK_ERROR:Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/getjar/sdk/comm/TransactionManager$9;->this$0:Lcom/getjar/sdk/comm/TransactionManager;

    invoke-static {v6}, Lcom/getjar/sdk/comm/TransactionManager;->access$400(Lcom/getjar/sdk/comm/TransactionManager;)Landroid/content/Context;

    move-result-object v6

    invoke-virtual {v1, v4, v2, v6}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->handleFailure(Ljava/lang/String;Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;Landroid/content/Context;)V
    :try_end_9
    .catch Ljava/lang/InterruptedException; {:try_start_9 .. :try_end_9} :catch_0
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_9 .. :try_end_9} :catch_2
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_1
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    goto/16 :goto_0
.end method
