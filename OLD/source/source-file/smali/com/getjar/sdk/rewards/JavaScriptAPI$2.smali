.class Lcom/getjar/sdk/rewards/JavaScriptAPI$2;
.super Ljava/lang/Object;
.source "JavaScriptAPI.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/getjar/sdk/rewards/JavaScriptAPI;->purchaseManagedOffer(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/getjar/sdk/rewards/JavaScriptAPI;

.field final synthetic val$callback:Ljava/lang/String;

.field final synthetic val$offerId:Ljava/lang/String;

.field final synthetic val$purchaseMetadata:Ljava/lang/String;

.field final synthetic val$trackingMetadata:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/getjar/sdk/rewards/JavaScriptAPI;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 450
    iput-object p1, p0, Lcom/getjar/sdk/rewards/JavaScriptAPI$2;->this$0:Lcom/getjar/sdk/rewards/JavaScriptAPI;

    iput-object p2, p0, Lcom/getjar/sdk/rewards/JavaScriptAPI$2;->val$purchaseMetadata:Ljava/lang/String;

    iput-object p3, p0, Lcom/getjar/sdk/rewards/JavaScriptAPI$2;->val$trackingMetadata:Ljava/lang/String;

    iput-object p4, p0, Lcom/getjar/sdk/rewards/JavaScriptAPI$2;->val$offerId:Ljava/lang/String;

    iput-object p5, p0, Lcom/getjar/sdk/rewards/JavaScriptAPI$2;->val$callback:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 23

    .prologue
    .line 454
    sget-object v1, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    const-string v1, "JavaScriptAPI: purchaseManagedOffer() START"

    invoke-static {v6, v7, v1}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 457
    :try_start_0
    sget-object v1, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    sget-object v1, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v8

    or-long/2addr v6, v8

    sget-object v1, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v8

    or-long/2addr v6, v8

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "JavaScriptAPI: purchaseManagedOffer() purchaseMetadata:\'%1$s\'"

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/getjar/sdk/rewards/JavaScriptAPI$2;->val$purchaseMetadata:Ljava/lang/String;

    aput-object v10, v8, v9

    invoke-static {v1, v3, v8}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v6, v7, v1}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 458
    sget-object v1, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    sget-object v1, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v8

    or-long/2addr v6, v8

    sget-object v1, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v8

    or-long/2addr v6, v8

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "JavaScriptAPI: purchaseManagedOffer() trackingMetadata:\'%1$s\'"

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/getjar/sdk/rewards/JavaScriptAPI$2;->val$trackingMetadata:Ljava/lang/String;

    aput-object v10, v8, v9

    invoke-static {v1, v3, v8}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v6, v7, v1}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 460
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/getjar/sdk/rewards/JavaScriptAPI$2;->val$purchaseMetadata:Ljava/lang/String;

    invoke-static {v1}, Lcom/getjar/sdk/utilities/Utility;->jsonArrayStringToMap(Ljava/lang/String;)Ljava/util/HashMap;

    move-result-object v4

    .line 461
    .local v4, "purchaseMetadataMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/getjar/sdk/rewards/JavaScriptAPI$2;->val$trackingMetadata:Ljava/lang/String;

    invoke-static {v1}, Lcom/getjar/sdk/utilities/Utility;->jsonArrayStringToMap(Ljava/lang/String;)Ljava/util/HashMap;

    move-result-object v5

    .line 462
    .local v5, "trackingMetadataMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v2

    .line 463
    .local v2, "clientTransactionId":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/getjar/sdk/rewards/JavaScriptAPI$2;->this$0:Lcom/getjar/sdk/rewards/JavaScriptAPI;

    iget-object v1, v1, Lcom/getjar/sdk/rewards/JavaScriptAPI;->_parentActivity:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-virtual {v1}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->getParentActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/rewards/InAppPurchaseManager;

    move-result-object v1

    invoke-virtual {v1, v2}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->setCurrentClientTransactionId(Ljava/lang/String;)V

    .line 464
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/getjar/sdk/rewards/JavaScriptAPI$2;->this$0:Lcom/getjar/sdk/rewards/JavaScriptAPI;

    iget-object v1, v1, Lcom/getjar/sdk/rewards/JavaScriptAPI;->_parentActivity:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-virtual {v1}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->getParentActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/rewards/InAppPurchaseManager;

    move-result-object v1

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/getjar/sdk/rewards/JavaScriptAPI$2;->val$offerId:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/getjar/sdk/rewards/JavaScriptAPI$2;->this$0:Lcom/getjar/sdk/rewards/JavaScriptAPI;

    iget-object v6, v6, Lcom/getjar/sdk/rewards/JavaScriptAPI;->_parentActivity:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-virtual/range {v1 .. v6}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->reserveManagedOffer(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;Ljava/util/HashMap;Lcom/getjar/sdk/rewards/GetJarSubActivityBase;)Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;

    move-result-object v21

    .line 465
    .local v21, "status":Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;
    sget-object v1, Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;->SUCCESS:Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;

    move-object/from16 v0, v21

    invoke-virtual {v1, v0}, Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 467
    const-string v1, "marketplace_product_id"

    invoke-virtual {v4, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Ljava/lang/String;

    .line 468
    .local v19, "marketplaceItemId":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/getjar/sdk/rewards/JavaScriptAPI$2;->this$0:Lcom/getjar/sdk/rewards/JavaScriptAPI;

    iget-object v1, v1, Lcom/getjar/sdk/rewards/JavaScriptAPI;->_parentActivity:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-virtual {v1}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->getParentActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/rewards/InAppPurchaseManager;

    move-result-object v1

    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->processOutstandingPurchases(Z)Z

    .line 470
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/getjar/sdk/rewards/JavaScriptAPI$2;->this$0:Lcom/getjar/sdk/rewards/JavaScriptAPI;

    iget-object v1, v1, Lcom/getjar/sdk/rewards/JavaScriptAPI;->_parentActivity:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-virtual {v1}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->getParentActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/rewards/InAppPurchaseManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->isGooglePlayConnected()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 472
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/getjar/sdk/rewards/JavaScriptAPI$2;->this$0:Lcom/getjar/sdk/rewards/JavaScriptAPI;

    iget-object v1, v1, Lcom/getjar/sdk/rewards/JavaScriptAPI;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v1}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/comm/persistence/DBTransactions;

    move-result-object v1

    invoke-virtual {v1, v2}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->loadTransaction(Ljava/lang/String;)Lcom/getjar/sdk/comm/persistence/TransactionBucket;

    move-result-object v22

    check-cast v22, Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;

    .line 473
    .local v22, "transaction":Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;
    if-eqz v22, :cond_2

    invoke-virtual/range {v22 .. v22}, Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;->getState()Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    move-result-object v1

    sget-object v3, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->RESERVED:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    invoke-virtual {v1, v3}, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 474
    invoke-static/range {v19 .. v19}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 475
    sget-object v1, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    sget-object v1, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v8

    or-long/2addr v6, v8

    const-string v1, "JavaScriptAPI: purchaseManagedOffer() \'marketplace_product_id\' not found in purchaseMetadata"

    invoke-static {v6, v7, v1}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;)V

    .line 476
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/getjar/sdk/rewards/JavaScriptAPI$2;->val$callback:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/getjar/sdk/rewards/JavaScriptAPI$2;->this$0:Lcom/getjar/sdk/rewards/JavaScriptAPI;

    iget-object v3, v3, Lcom/getjar/sdk/rewards/JavaScriptAPI;->_parentActivity:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-virtual {v3}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->getParentActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-static {v1, v3}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->saveCallback(Ljava/lang/String;Landroid/content/Context;)V

    .line 477
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/getjar/sdk/rewards/JavaScriptAPI$2;->this$0:Lcom/getjar/sdk/rewards/JavaScriptAPI;

    iget-object v1, v1, Lcom/getjar/sdk/rewards/JavaScriptAPI;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    sget-object v3, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->PURCHASED:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    move-object/from16 v0, v22

    invoke-static {v1, v0, v3}, Lcom/getjar/sdk/comm/TransactionManager;->updateOfferTransactionState(Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;)V

    .line 478
    new-instance v1, Lcom/getjar/sdk/comm/TransactionManager;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/getjar/sdk/rewards/JavaScriptAPI$2;->this$0:Lcom/getjar/sdk/rewards/JavaScriptAPI;

    iget-object v3, v3, Lcom/getjar/sdk/rewards/JavaScriptAPI;->_parentActivity:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-virtual {v3}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->getParentActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-direct {v1, v3}, Lcom/getjar/sdk/comm/TransactionManager;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/getjar/sdk/rewards/JavaScriptAPI$2;->this$0:Lcom/getjar/sdk/rewards/JavaScriptAPI;

    iget-object v3, v3, Lcom/getjar/sdk/rewards/JavaScriptAPI;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v1, v3}, Lcom/getjar/sdk/comm/TransactionManager;->runEarnAndManagedOfferTransactions(Lcom/getjar/sdk/comm/CommContext;)Ljava/util/List;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 551
    .end local v19    # "marketplaceItemId":Ljava/lang/String;
    .end local v22    # "transaction":Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;
    :goto_0
    sget-object v1, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    const-string v1, "JavaScriptAPI: purchaseManagedOffer() FINISH"

    invoke-static {v6, v7, v1}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 553
    .end local v2    # "clientTransactionId":Ljava/lang/String;
    .end local v4    # "purchaseMetadataMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v5    # "trackingMetadataMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v21    # "status":Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;
    :goto_1
    return-void

    .line 481
    .restart local v2    # "clientTransactionId":Ljava/lang/String;
    .restart local v4    # "purchaseMetadataMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v5    # "trackingMetadataMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v19    # "marketplaceItemId":Ljava/lang/String;
    .restart local v21    # "status":Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;
    .restart local v22    # "transaction":Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;
    :cond_0
    :try_start_1
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/getjar/sdk/rewards/JavaScriptAPI$2;->this$0:Lcom/getjar/sdk/rewards/JavaScriptAPI;

    iget-object v1, v1, Lcom/getjar/sdk/rewards/JavaScriptAPI;->_parentActivity:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-virtual {v1}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->getParentActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/rewards/InAppPurchaseManager;

    move-result-object v1

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/getjar/sdk/rewards/JavaScriptAPI$2;->this$0:Lcom/getjar/sdk/rewards/JavaScriptAPI;

    iget-object v3, v3, Lcom/getjar/sdk/rewards/JavaScriptAPI;->_parentActivity:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    move-object/from16 v0, v19

    invoke-virtual {v1, v0, v2, v3}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->requestPurchaseIntent(Ljava/lang/String;Ljava/lang/String;Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;)Landroid/app/PendingIntent;

    move-result-object v20

    .line 482
    .local v20, "pendingIntent":Landroid/app/PendingIntent;
    if-eqz v20, :cond_1

    .line 483
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/getjar/sdk/rewards/JavaScriptAPI$2;->this$0:Lcom/getjar/sdk/rewards/JavaScriptAPI;

    iget-object v1, v1, Lcom/getjar/sdk/rewards/JavaScriptAPI;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    sget-object v3, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->PURCHASING:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    move-object/from16 v0, v22

    invoke-static {v1, v0, v3}, Lcom/getjar/sdk/comm/TransactionManager;->updateOfferTransactionState(Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;)V

    .line 484
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/getjar/sdk/rewards/JavaScriptAPI$2;->this$0:Lcom/getjar/sdk/rewards/JavaScriptAPI;

    iget-object v1, v1, Lcom/getjar/sdk/rewards/JavaScriptAPI;->_parentActivity:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/getjar/sdk/rewards/JavaScriptAPI$2;->val$callback:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/getjar/sdk/rewards/JavaScriptAPI$2;->this$0:Lcom/getjar/sdk/rewards/JavaScriptAPI;

    iget-object v6, v6, Lcom/getjar/sdk/rewards/JavaScriptAPI;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    move-object/from16 v0, v20

    invoke-virtual {v1, v0, v3, v6, v2}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->startGooglePlayForPurchase(Landroid/app/PendingIntent;Ljava/lang/String;Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 546
    .end local v2    # "clientTransactionId":Ljava/lang/String;
    .end local v4    # "purchaseMetadataMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v5    # "trackingMetadataMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v19    # "marketplaceItemId":Ljava/lang/String;
    .end local v20    # "pendingIntent":Landroid/app/PendingIntent;
    .end local v21    # "status":Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;
    .end local v22    # "transaction":Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;
    :catch_0
    move-exception v18

    .line 547
    .local v18, "e":Ljava/lang/Exception;
    :try_start_2
    sget-object v1, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    const-string v1, "JavaScriptAPI: purchaseManagedOffer() Unknown failure"

    move-object/from16 v0, v18

    invoke-static {v6, v7, v1, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 548
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/getjar/sdk/rewards/JavaScriptAPI$2;->val$callback:Ljava/lang/String;

    new-instance v13, Lorg/json/JSONObject;

    invoke-direct {v13}, Lorg/json/JSONObject;-><init>()V

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    sget-object v17, Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;->UNKNOWN:Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;

    invoke-static/range {v12 .. v18}, Lcom/getjar/sdk/rewards/JavaScriptAPI;->addDataAndMakeJSCallback(Ljava/lang/String;Lorg/json/JSONObject;ZZZLcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;Ljava/lang/Throwable;)V

    .line 549
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/getjar/sdk/rewards/JavaScriptAPI$2;->this$0:Lcom/getjar/sdk/rewards/JavaScriptAPI;

    iget-object v1, v1, Lcom/getjar/sdk/rewards/JavaScriptAPI;->_parentActivity:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-virtual {v1}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->getParentActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/rewards/InAppPurchaseManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->removeLastClientTransactionId()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 551
    sget-object v1, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    const-string v1, "JavaScriptAPI: purchaseManagedOffer() FINISH"

    invoke-static {v6, v7, v1}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    goto :goto_1

    .line 488
    .end local v18    # "e":Ljava/lang/Exception;
    .restart local v2    # "clientTransactionId":Ljava/lang/String;
    .restart local v4    # "purchaseMetadataMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v5    # "trackingMetadataMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v19    # "marketplaceItemId":Ljava/lang/String;
    .restart local v20    # "pendingIntent":Landroid/app/PendingIntent;
    .restart local v21    # "status":Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;
    .restart local v22    # "transaction":Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;
    :cond_1
    :try_start_3
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/getjar/sdk/rewards/JavaScriptAPI$2;->val$callback:Ljava/lang/String;

    new-instance v7, Lorg/json/JSONObject;

    invoke-direct {v7}, Lorg/json/JSONObject;-><init>()V

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x1

    sget-object v11, Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;->MARKETPLACE:Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;

    new-instance v12, Lcom/getjar/sdk/exceptions/CommunicationException;

    const-string v1, "Null pending intent. Couldn\'t connect to google play or google play returned null pending intent"

    invoke-direct {v12, v1}, Lcom/getjar/sdk/exceptions/CommunicationException;-><init>(Ljava/lang/String;)V

    invoke-static/range {v6 .. v12}, Lcom/getjar/sdk/rewards/JavaScriptAPI;->addDataAndMakeJSCallback(Ljava/lang/String;Lorg/json/JSONObject;ZZZLcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;Ljava/lang/Throwable;)V

    .line 496
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/getjar/sdk/rewards/JavaScriptAPI$2;->this$0:Lcom/getjar/sdk/rewards/JavaScriptAPI;

    iget-object v1, v1, Lcom/getjar/sdk/rewards/JavaScriptAPI;->_parentActivity:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-virtual {v1}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->getParentActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/rewards/InAppPurchaseManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->removeLastClientTransactionId()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto/16 :goto_0

    .line 551
    .end local v2    # "clientTransactionId":Ljava/lang/String;
    .end local v4    # "purchaseMetadataMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v5    # "trackingMetadataMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v19    # "marketplaceItemId":Ljava/lang/String;
    .end local v20    # "pendingIntent":Landroid/app/PendingIntent;
    .end local v21    # "status":Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;
    .end local v22    # "transaction":Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;
    :catchall_0
    move-exception v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    const-string v3, "JavaScriptAPI: purchaseManagedOffer() FINISH"

    invoke-static {v6, v7, v3}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    throw v1

    .line 501
    .restart local v2    # "clientTransactionId":Ljava/lang/String;
    .restart local v4    # "purchaseMetadataMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v5    # "trackingMetadataMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v19    # "marketplaceItemId":Ljava/lang/String;
    .restart local v21    # "status":Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;
    .restart local v22    # "transaction":Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;
    :cond_2
    :try_start_4
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/getjar/sdk/rewards/JavaScriptAPI$2;->val$callback:Ljava/lang/String;

    new-instance v7, Lorg/json/JSONObject;

    invoke-direct {v7}, Lorg/json/JSONObject;-><init>()V

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    sget-object v11, Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;->UNKNOWN:Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;

    new-instance v12, Lcom/getjar/sdk/exceptions/TransactionException;

    const-string v1, "Entered into some weird state. Transaction is null when trying to Buy. Reserved transaction must have been canceled somehow."

    invoke-direct {v12, v1}, Lcom/getjar/sdk/exceptions/TransactionException;-><init>(Ljava/lang/String;)V

    invoke-static/range {v6 .. v12}, Lcom/getjar/sdk/rewards/JavaScriptAPI;->addDataAndMakeJSCallback(Ljava/lang/String;Lorg/json/JSONObject;ZZZLcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;Ljava/lang/Throwable;)V

    .line 509
    new-instance v1, Lcom/getjar/sdk/comm/TransactionManager;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/getjar/sdk/rewards/JavaScriptAPI$2;->this$0:Lcom/getjar/sdk/rewards/JavaScriptAPI;

    iget-object v3, v3, Lcom/getjar/sdk/rewards/JavaScriptAPI;->_parentActivity:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-virtual {v3}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->getParentActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-direct {v1, v3}, Lcom/getjar/sdk/comm/TransactionManager;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/getjar/sdk/rewards/JavaScriptAPI$2;->this$0:Lcom/getjar/sdk/rewards/JavaScriptAPI;

    iget-object v3, v3, Lcom/getjar/sdk/rewards/JavaScriptAPI;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v1, v2, v3}, Lcom/getjar/sdk/comm/TransactionManager;->cancelManagedOfferTransaction(Ljava/lang/String;Lcom/getjar/sdk/comm/CommContext;)V

    .line 510
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/getjar/sdk/rewards/JavaScriptAPI$2;->this$0:Lcom/getjar/sdk/rewards/JavaScriptAPI;

    iget-object v1, v1, Lcom/getjar/sdk/rewards/JavaScriptAPI;->_parentActivity:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-virtual {v1}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->getParentActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/rewards/InAppPurchaseManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->removeLastClientTransactionId()V

    goto/16 :goto_0

    .line 515
    .end local v22    # "transaction":Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;
    :cond_3
    sget-object v1, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    sget-object v1, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v8

    or-long/2addr v6, v8

    sget-object v1, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v8

    or-long/2addr v6, v8

    const-string v1, "JavaScriptAPI: purchaseManagedOffer() Couldn\'t connect to google play"

    invoke-static {v6, v7, v1}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;)V

    .line 516
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/getjar/sdk/rewards/JavaScriptAPI$2;->val$callback:Ljava/lang/String;

    new-instance v7, Lorg/json/JSONObject;

    invoke-direct {v7}, Lorg/json/JSONObject;-><init>()V

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x1

    sget-object v11, Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;->MARKETPLACE:Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;

    new-instance v12, Lcom/getjar/sdk/exceptions/CommunicationException;

    const-string v1, "Couldn\'t connect to google play"

    invoke-direct {v12, v1}, Lcom/getjar/sdk/exceptions/CommunicationException;-><init>(Ljava/lang/String;)V

    invoke-static/range {v6 .. v12}, Lcom/getjar/sdk/rewards/JavaScriptAPI;->addDataAndMakeJSCallback(Ljava/lang/String;Lorg/json/JSONObject;ZZZLcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;Ljava/lang/Throwable;)V

    .line 524
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/getjar/sdk/rewards/JavaScriptAPI$2;->this$0:Lcom/getjar/sdk/rewards/JavaScriptAPI;

    iget-object v1, v1, Lcom/getjar/sdk/rewards/JavaScriptAPI;->_parentActivity:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-virtual {v1}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->getParentActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/rewards/InAppPurchaseManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->removeLastClientTransactionId()V

    goto/16 :goto_0

    .line 529
    .end local v19    # "marketplaceItemId":Ljava/lang/String;
    :cond_4
    sget-object v11, Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;->UNKNOWN:Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 532
    .local v11, "failureReason":Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;
    :try_start_5
    invoke-virtual/range {v21 .. v21}, Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;->name()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;->valueOf(Ljava/lang/String;)Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    move-result-object v11

    .line 535
    :goto_2
    :try_start_6
    sget-object v1, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    sget-object v1, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v8

    or-long/2addr v6, v8

    sget-object v1, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v8

    or-long/2addr v6, v8

    const-string v1, "JavaScriptAPI: purchaseManagedOffer() Reserve failed"

    invoke-static {v6, v7, v1}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;)V

    .line 536
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/getjar/sdk/rewards/JavaScriptAPI$2;->val$callback:Ljava/lang/String;

    new-instance v7, Lorg/json/JSONObject;

    invoke-direct {v7}, Lorg/json/JSONObject;-><init>()V

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    new-instance v12, Lcom/getjar/sdk/GetJarException;

    const-string v1, "Reserve failed"

    invoke-direct {v12, v1}, Lcom/getjar/sdk/GetJarException;-><init>(Ljava/lang/String;)V

    invoke-static/range {v6 .. v12}, Lcom/getjar/sdk/rewards/JavaScriptAPI;->addDataAndMakeJSCallback(Ljava/lang/String;Lorg/json/JSONObject;ZZZLcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;Ljava/lang/Throwable;)V

    .line 544
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/getjar/sdk/rewards/JavaScriptAPI$2;->this$0:Lcom/getjar/sdk/rewards/JavaScriptAPI;

    iget-object v1, v1, Lcom/getjar/sdk/rewards/JavaScriptAPI;->_parentActivity:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-virtual {v1}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->getParentActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/rewards/InAppPurchaseManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->removeLastClientTransactionId()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_0
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    goto/16 :goto_0

    .line 533
    :catch_1
    move-exception v1

    goto :goto_2
.end method
