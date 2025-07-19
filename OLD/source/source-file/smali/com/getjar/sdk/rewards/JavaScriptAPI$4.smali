.class Lcom/getjar/sdk/rewards/JavaScriptAPI$4;
.super Ljava/lang/Object;
.source "JavaScriptAPI.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/getjar/sdk/rewards/JavaScriptAPI;->getLocalizedPriceBuckets(Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/getjar/sdk/rewards/JavaScriptAPI;

.field final synthetic val$callback:Ljava/lang/String;

.field final synthetic val$priceBuckets:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/getjar/sdk/rewards/JavaScriptAPI;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 711
    iput-object p1, p0, Lcom/getjar/sdk/rewards/JavaScriptAPI$4;->this$0:Lcom/getjar/sdk/rewards/JavaScriptAPI;

    iput-object p2, p0, Lcom/getjar/sdk/rewards/JavaScriptAPI$4;->val$priceBuckets:Ljava/lang/String;

    iput-object p3, p0, Lcom/getjar/sdk/rewards/JavaScriptAPI$4;->val$callback:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 13

    .prologue
    .line 715
    sget-object v0, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    const-string v0, "JavaScriptAPI: getLocalizedPriceBuckets() START"

    invoke-static {v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 718
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    iget-object v2, p0, Lcom/getjar/sdk/rewards/JavaScriptAPI$4;->val$priceBuckets:Ljava/lang/String;

    invoke-direct {v0, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v2, "price_buckets"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v12

    .line 719
    .local v12, "priceBucketJsonArray":Lorg/json/JSONArray;
    invoke-virtual {v12}, Lorg/json/JSONArray;->length()I

    move-result v0

    new-array v11, v0, [Ljava/lang/String;

    .line 720
    .local v11, "priceBucketArray":[Ljava/lang/String;
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_0
    invoke-virtual {v12}, Lorg/json/JSONArray;->length()I

    move-result v0

    if-ge v9, v0, :cond_0

    .line 721
    invoke-virtual {v12, v9}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v0

    const-string v2, "marketplace_product_id"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    aput-object v0, v11, v9

    .line 720
    add-int/lit8 v9, v9, 0x1

    goto :goto_0

    .line 723
    :cond_0
    iget-object v0, p0, Lcom/getjar/sdk/rewards/JavaScriptAPI$4;->this$0:Lcom/getjar/sdk/rewards/JavaScriptAPI;

    iget-object v0, v0, Lcom/getjar/sdk/rewards/JavaScriptAPI;->_parentActivity:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-virtual {v0}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->getParentActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/rewards/InAppPurchaseManager;

    move-result-object v0

    invoke-virtual {v0, v11}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->getLocalizedPrices([Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v10

    .line 725
    .local v10, "localizedPrices":Lorg/json/JSONArray;
    iget-object v0, p0, Lcom/getjar/sdk/rewards/JavaScriptAPI$4;->this$0:Lcom/getjar/sdk/rewards/JavaScriptAPI;

    iget-object v0, v0, Lcom/getjar/sdk/rewards/JavaScriptAPI;->_parentActivity:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-virtual {v0}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->getParentActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/rewards/InAppPurchaseManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->isGooglePlayConnected()Z

    move-result v0

    if-nez v0, :cond_1

    .line 726
    sget-object v0, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v0, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    sget-object v0, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    const-string v0, "JavaScriptAPI: getLocalizedPriceBuckets() Unable to connect to Google play"

    invoke-static {v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;)V

    .line 727
    iget-object v0, p0, Lcom/getjar/sdk/rewards/JavaScriptAPI$4;->val$callback:Ljava/lang/String;

    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x1

    sget-object v5, Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;->MARKETPLACE:Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;

    new-instance v6, Lcom/getjar/sdk/exceptions/CommunicationException;

    const-string v7, "Unable to connect to Google play"

    invoke-direct {v6, v7}, Lcom/getjar/sdk/exceptions/CommunicationException;-><init>(Ljava/lang/String;)V

    invoke-static/range {v0 .. v6}, Lcom/getjar/sdk/rewards/JavaScriptAPI;->addDataAndMakeJSCallback(Ljava/lang/String;Lorg/json/JSONObject;ZZZLcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;Ljava/lang/Throwable;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 749
    :goto_1
    sget-object v0, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    const-string v0, "JavaScriptAPI: getLocalizedPriceBuckets() FINISH"

    invoke-static {v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 751
    .end local v9    # "i":I
    .end local v10    # "localizedPrices":Lorg/json/JSONArray;
    .end local v11    # "priceBucketArray":[Ljava/lang/String;
    .end local v12    # "priceBucketJsonArray":Lorg/json/JSONArray;
    :goto_2
    return-void

    .line 736
    .restart local v9    # "i":I
    .restart local v10    # "localizedPrices":Lorg/json/JSONArray;
    .restart local v11    # "priceBucketArray":[Ljava/lang/String;
    .restart local v12    # "priceBucketJsonArray":Lorg/json/JSONArray;
    :cond_1
    :try_start_1
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 737
    .local v1, "obj":Lorg/json/JSONObject;
    const-string v0, "price_buckets"

    invoke-virtual {v1, v0, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 738
    sget-object v0, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "JavaScriptAPI: getLocalizedPriceBuckets() Price buckets: %1$s"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object v10, v5, v6

    invoke-static {v0, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 739
    iget-object v0, p0, Lcom/getjar/sdk/rewards/JavaScriptAPI$4;->val$callback:Ljava/lang/String;

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v4, 0x1

    sget-object v5, Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;->NONE:Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;

    const/4 v6, 0x0

    invoke-static/range {v0 .. v6}, Lcom/getjar/sdk/rewards/JavaScriptAPI;->addDataAndMakeJSCallback(Ljava/lang/String;Lorg/json/JSONObject;ZZZLcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;Ljava/lang/Throwable;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 742
    .end local v1    # "obj":Lorg/json/JSONObject;
    .end local v9    # "i":I
    .end local v10    # "localizedPrices":Lorg/json/JSONArray;
    .end local v11    # "priceBucketArray":[Ljava/lang/String;
    .end local v12    # "priceBucketJsonArray":Lorg/json/JSONArray;
    :catch_0
    move-exception v8

    .line 743
    .local v8, "e":Lorg/json/JSONException;
    :try_start_2
    sget-object v0, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v0, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    sget-object v0, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    const-string v0, "JavaScriptAPI: getLocalizedPriceBuckets() Invalid JSON"

    invoke-static {v2, v3, v0, v8}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 744
    iget-object v2, p0, Lcom/getjar/sdk/rewards/JavaScriptAPI$4;->val$callback:Ljava/lang/String;

    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x1

    sget-object v7, Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;->UNKNOWN:Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;

    invoke-static/range {v2 .. v8}, Lcom/getjar/sdk/rewards/JavaScriptAPI;->addDataAndMakeJSCallback(Ljava/lang/String;Lorg/json/JSONObject;ZZZLcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 749
    sget-object v0, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    const-string v0, "JavaScriptAPI: getLocalizedPriceBuckets() FINISH"

    invoke-static {v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    goto :goto_2

    .line 745
    .end local v8    # "e":Lorg/json/JSONException;
    :catch_1
    move-exception v8

    .line 746
    .local v8, "e":Ljava/lang/Exception;
    :try_start_3
    sget-object v0, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v0, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    sget-object v0, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    const-string v0, "JavaScriptAPI: getLocalizedPriceBuckets() Unknown failure"

    invoke-static {v2, v3, v0, v8}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 747
    iget-object v2, p0, Lcom/getjar/sdk/rewards/JavaScriptAPI$4;->val$callback:Ljava/lang/String;

    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x1

    sget-object v7, Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;->UNKNOWN:Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;

    invoke-static/range {v2 .. v8}, Lcom/getjar/sdk/rewards/JavaScriptAPI;->addDataAndMakeJSCallback(Ljava/lang/String;Lorg/json/JSONObject;ZZZLcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 749
    sget-object v0, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    const-string v0, "JavaScriptAPI: getLocalizedPriceBuckets() FINISH"

    invoke-static {v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    goto/16 :goto_2

    .end local v8    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    const-string v4, "JavaScriptAPI: getLocalizedPriceBuckets() FINISH"

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    throw v0
.end method
