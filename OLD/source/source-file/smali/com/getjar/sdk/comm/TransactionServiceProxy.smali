.class public Lcom/getjar/sdk/comm/TransactionServiceProxy;
.super Lcom/getjar/sdk/comm/ServiceProxyBase;
.source "TransactionServiceProxy.java"


# static fields
.field private static final _CONTRACT_VERSION:Ljava/lang/String; = "20130625"

.field private static volatile _Instance:Lcom/getjar/sdk/comm/TransactionServiceProxy;

.field private static final _URL_TEMPLATE_BUY_CURRENCY:Ljava/lang/String;

.field private static final _URL_TEMPLATE_CANCEL_TRANSACTION:Ljava/lang/String;

.field private static final _URL_TEMPLATE_CONFIRM_AND_LICENSE:Ljava/lang/String;

.field private static final _URL_TEMPLATE_CONFIRM_MANAGED_OFFER:Ljava/lang/String;

.field private static final _URL_TEMPLATE_CONFIRM_UNMANAGED_OFFER:Ljava/lang/String;

.field private static final _URL_TEMPLATE_EARN:Ljava/lang/String;

.field private static final _URL_TEMPLATE_RESERVE_MANAGED_OFFER:Ljava/lang/String;

.field private static final _URL_TEMPLATE_RESERVE_UNMANAGED_OFFER:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 26
    const/4 v0, 0x0

    sput-object v0, Lcom/getjar/sdk/comm/TransactionServiceProxy;->_Instance:Lcom/getjar/sdk/comm/TransactionServiceProxy;

    .line 53
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "%1$s%2$s"

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "%1$stransaction/transactions/reserve?developer_product_id=%2$s&developer_product_name=%3$s&developer_product_description=%4$s&amount=%5$s&client_transaction_token=%6$s&version="

    aput-object v3, v2, v4

    const-string v3, "20130625"

    aput-object v3, v2, v5

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/getjar/sdk/comm/TransactionServiceProxy;->_URL_TEMPLATE_RESERVE_UNMANAGED_OFFER:Ljava/lang/String;

    .line 58
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "%1$s%2$s"

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "%1$stransaction/transactions/confirm?client_transaction_token=%2$s&version="

    aput-object v3, v2, v4

    const-string v3, "20130625"

    aput-object v3, v2, v5

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/getjar/sdk/comm/TransactionServiceProxy;->_URL_TEMPLATE_CONFIRM_UNMANAGED_OFFER:Ljava/lang/String;

    .line 63
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "%1$s%2$s"

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "%1$stransaction/transactions/cancel?client_transaction_token=%2$s&version="

    aput-object v3, v2, v4

    const-string v3, "20130625"

    aput-object v3, v2, v5

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/getjar/sdk/comm/TransactionServiceProxy;->_URL_TEMPLATE_CANCEL_TRANSACTION:Ljava/lang/String;

    .line 68
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "%1$s%2$s"

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "%1$stransaction/transactions/earn?item_id=%2$s&client_transaction_token=%3$s&version="

    aput-object v3, v2, v4

    const-string v3, "20130625"

    aput-object v3, v2, v5

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/getjar/sdk/comm/TransactionServiceProxy;->_URL_TEMPLATE_EARN:Ljava/lang/String;

    .line 73
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "%1$s%2$s"

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "%1$stransaction/transactions/confirm_and_acquire_license?signature=%2$s&version="

    aput-object v3, v2, v4

    const-string v3, "20130625"

    aput-object v3, v2, v5

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/getjar/sdk/comm/TransactionServiceProxy;->_URL_TEMPLATE_CONFIRM_AND_LICENSE:Ljava/lang/String;

    .line 78
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "%1$s%2$s"

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "%1$stransaction/transactions/buy_currency?version="

    aput-object v3, v2, v4

    const-string v3, "20130625"

    aput-object v3, v2, v5

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/getjar/sdk/comm/TransactionServiceProxy;->_URL_TEMPLATE_BUY_CURRENCY:Ljava/lang/String;

    .line 83
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "%1$s%2$s"

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "%1$stransaction/transactions/reserve?version="

    aput-object v3, v2, v4

    const-string v3, "20130625"

    aput-object v3, v2, v5

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/getjar/sdk/comm/TransactionServiceProxy;->_URL_TEMPLATE_RESERVE_MANAGED_OFFER:Ljava/lang/String;

    .line 88
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "%1$s%2$s"

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "%1$stransaction/transactions/confirm?version="

    aput-object v3, v2, v4

    const-string v3, "20130625"

    aput-object v3, v2, v5

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/getjar/sdk/comm/TransactionServiceProxy;->_URL_TEMPLATE_CONFIRM_MANAGED_OFFER:Ljava/lang/String;

    .line 93
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 25
    invoke-direct {p0}, Lcom/getjar/sdk/comm/ServiceProxyBase;-><init>()V

    return-void
.end method

.method public static getInstance()Lcom/getjar/sdk/comm/TransactionServiceProxy;
    .locals 1

    .prologue
    .line 32
    sget-object v0, Lcom/getjar/sdk/comm/TransactionServiceProxy;->_Instance:Lcom/getjar/sdk/comm/TransactionServiceProxy;

    if-nez v0, :cond_0

    invoke-static {}, Lcom/getjar/sdk/comm/TransactionServiceProxy;->makeTheInstance()V

    .line 33
    :cond_0
    sget-object v0, Lcom/getjar/sdk/comm/TransactionServiceProxy;->_Instance:Lcom/getjar/sdk/comm/TransactionServiceProxy;

    return-object v0
.end method

.method private static declared-synchronized makeTheInstance()V
    .locals 2

    .prologue
    .line 28
    const-class v1, Lcom/getjar/sdk/comm/TransactionServiceProxy;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/getjar/sdk/comm/TransactionServiceProxy;->_Instance:Lcom/getjar/sdk/comm/TransactionServiceProxy;

    if-nez v0, :cond_0

    new-instance v0, Lcom/getjar/sdk/comm/TransactionServiceProxy;

    invoke-direct {v0}, Lcom/getjar/sdk/comm/TransactionServiceProxy;-><init>()V

    sput-object v0, Lcom/getjar/sdk/comm/TransactionServiceProxy;->_Instance:Lcom/getjar/sdk/comm/TransactionServiceProxy;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 29
    :cond_0
    monitor-exit v1

    return-void

    .line 28
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method public buyCurrency(Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;Ljava/util/HashMap;Z)Lcom/getjar/sdk/comm/Operation;
    .locals 12
    .param p1, "commContext"    # Lcom/getjar/sdk/comm/CommContext;
    .param p2, "clientTransactionId"    # Ljava/lang/String;
    .param p3, "productId"    # Ljava/lang/String;
    .param p6, "suppressInternalCallbacks"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/getjar/sdk/comm/CommContext;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;Z)",
            "Lcom/getjar/sdk/comm/Operation;"
        }
    .end annotation

    .prologue
    .line 335
    .local p4, "itemMetadata":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .local p5, "trackingMetadata":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The required parameter \'commContext\' was not provided"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 336
    :cond_0
    invoke-static {p2}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The required parameter \'clientTransactionId\' was not provided"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 337
    :cond_1
    invoke-static {p3}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The required parameter \'itemId\' was not provided"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 338
    :cond_2
    if-nez p4, :cond_3

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The required parameter \'itemMetadata\' was not provided"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 339
    :cond_3
    if-nez p5, :cond_4

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The required parameter \'trackingMetadata\' was not provided"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 341
    :cond_4
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/getjar/sdk/comm/auth/AuthManager;->initialize(Landroid/content/Context;)V

    .line 342
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/getjar/sdk/comm/auth/AuthManager;->waitOnAuth()V

    .line 344
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    sget-object v1, Lcom/getjar/sdk/comm/TransactionServiceProxy;->_URL_TEMPLATE_BUY_CURRENCY:Ljava/lang/String;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    const/4 v6, 0x1

    invoke-static {p1, v6}, Lcom/getjar/sdk/comm/GetJarConfig;->getInstance(Lcom/getjar/sdk/comm/CommContext;Z)Lcom/getjar/sdk/comm/GetJarConfig;

    move-result-object v6

    const-string v7, "service.transaction_service.endpoint"

    invoke-virtual {v6, v7}, Lcom/getjar/sdk/comm/GetJarConfig;->getDirectiveValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v2, v3

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 349
    .local v4, "url":Ljava/lang/String;
    new-instance v5, Ljava/util/HashMap;

    const/4 v0, 0x5

    invoke-direct {v5, v0}, Ljava/util/HashMap;-><init>(I)V

    .line 350
    .local v5, "postData":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v0, "marketplace"

    const-string v1, "marketplace.google_play"

    invoke-virtual {v5, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 351
    const-string v0, "marketplace_item_id"

    invoke-virtual {v5, v0, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 353
    :try_start_0
    const-string v0, "item_metadata"

    invoke-static/range {p4 .. p4}, Lcom/getjar/sdk/utilities/Utility;->mapToJsonString(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v5, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 359
    :try_start_1
    const-string v0, "tracking_metadata"

    invoke-static/range {p5 .. p5}, Lcom/getjar/sdk/utilities/Utility;->mapToJsonString(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v5, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    .line 364
    const-string v0, "client_transaction_token"

    invoke-virtual {v5, v0, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 367
    const-string v1, "buyCurrency"

    sget-object v2, Lcom/getjar/sdk/comm/Operation$Priority;->HIGH:Lcom/getjar/sdk/comm/Operation$Priority;

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v9, 0x1

    const/4 v10, 0x1

    move-object v0, p0

    move-object v3, p1

    move/from16 v8, p6

    invoke-virtual/range {v0 .. v10}, Lcom/getjar/sdk/comm/TransactionServiceProxy;->makeAsyncPOSTRequestForJson(Ljava/lang/String;Lcom/getjar/sdk/comm/Operation$Priority;Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;Lcom/getjar/sdk/comm/CallbackInterface;ZZZ)Lcom/getjar/sdk/comm/Operation;

    move-result-object v0

    return-object v0

    .line 354
    :catch_0
    move-exception v11

    .line 355
    .local v11, "e":Lorg/json/JSONException;
    new-instance v0, Lcom/getjar/sdk/exceptions/CommunicationException;

    const-string v1, "Invalid item_metadata"

    invoke-direct {v0, v1}, Lcom/getjar/sdk/exceptions/CommunicationException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 360
    .end local v11    # "e":Lorg/json/JSONException;
    :catch_1
    move-exception v11

    .line 361
    .restart local v11    # "e":Lorg/json/JSONException;
    new-instance v0, Lcom/getjar/sdk/exceptions/CommunicationException;

    const-string v1, "Invalid tracking_metadata"

    invoke-direct {v0, v1}, Lcom/getjar/sdk/exceptions/CommunicationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected cancelTransaction(Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Z)Lcom/getjar/sdk/comm/Operation;
    .locals 11
    .param p1, "commContext"    # Lcom/getjar/sdk/comm/CommContext;
    .param p2, "clientTransactionId"    # Ljava/lang/String;
    .param p3, "suppressInternalCallbacks"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v9, 0x0

    const/4 v5, 0x0

    const/4 v10, 0x1

    .line 380
    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The required parameter \'commContext\' was not provided"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 381
    :cond_0
    invoke-static {p2}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The required parameter \'client_transaction_id\' was not provided"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 384
    :cond_1
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/getjar/sdk/comm/auth/AuthManager;->initialize(Landroid/content/Context;)V

    .line 385
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/getjar/sdk/comm/auth/AuthManager;->waitOnAuth()V

    .line 386
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    sget-object v1, Lcom/getjar/sdk/comm/TransactionServiceProxy;->_URL_TEMPLATE_CANCEL_TRANSACTION:Ljava/lang/String;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {p1, v10}, Lcom/getjar/sdk/comm/GetJarConfig;->getInstance(Lcom/getjar/sdk/comm/CommContext;Z)Lcom/getjar/sdk/comm/GetJarConfig;

    move-result-object v3

    const-string v6, "service.transaction_service.endpoint"

    invoke-virtual {v3, v6}, Lcom/getjar/sdk/comm/GetJarConfig;->getDirectiveValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v9

    const-string v3, "UTF-8"

    invoke-static {p2, v3}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v10

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 392
    .local v4, "url":Ljava/lang/String;
    const-string v1, "cancelTransaction"

    sget-object v2, Lcom/getjar/sdk/comm/Operation$Priority;->HIGH:Lcom/getjar/sdk/comm/Operation$Priority;

    move-object v0, p0

    move-object v3, p1

    move-object v6, v5

    move-object v7, v5

    move v8, p3

    invoke-virtual/range {v0 .. v10}, Lcom/getjar/sdk/comm/TransactionServiceProxy;->makeAsyncPOSTRequestForJson(Ljava/lang/String;Lcom/getjar/sdk/comm/Operation$Priority;Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;Lcom/getjar/sdk/comm/CallbackInterface;ZZZ)Lcom/getjar/sdk/comm/Operation;

    move-result-object v0

    return-object v0
.end method

.method protected confirmAndLicense(Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Ljava/lang/String;Lcom/getjar/sdk/License$LicenseScope;Z)Lcom/getjar/sdk/comm/Operation;
    .locals 20
    .param p1, "commContext"    # Lcom/getjar/sdk/comm/CommContext;
    .param p2, "clientTransactionId"    # Ljava/lang/String;
    .param p3, "itemId"    # Ljava/lang/String;
    .param p4, "licenseScope"    # Lcom/getjar/sdk/License$LicenseScope;
    .param p5, "suppressInternalCallbacks"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 275
    if-nez p1, :cond_0

    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "The required parameter \'commContext\' was not provided"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 276
    :cond_0
    invoke-static/range {p2 .. p2}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "The required parameter \'clientTransactionId\' was not provided"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 277
    :cond_1
    if-nez p4, :cond_2

    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "The required parameter \'licenseScope\' was not provided"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 278
    :cond_2
    invoke-static/range {p3 .. p3}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "\'itemId\' cannot be null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 280
    :cond_3
    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/getjar/sdk/comm/auth/AuthManager;->initialize(Landroid/content/Context;)V

    .line 281
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/getjar/sdk/comm/auth/AuthManager;->waitOnAuth()V

    .line 283
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/getjar/sdk/comm/auth/AuthManager;->getAuthToken()Ljava/lang/String;

    move-result-object v6

    .line 284
    .local v6, "authToken":Ljava/lang/String;
    invoke-static {}, Lcom/getjar/sdk/comm/LicenseServiceProxy;->generateNonce()Ljava/lang/String;

    move-result-object v5

    .line 285
    .local v5, "nonce":Ljava/lang/String;
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/getjar/sdk/comm/auth/AuthManager;->getUserDeviceId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/CommContext;->getAppEncryptionKeyIndex()Ljava/lang/String;

    move-result-object v7

    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/CommContext;->getAppEncryptionPublicKey()Ljava/security/PublicKey;

    move-result-object v8

    move-object/from16 v3, p3

    move-object/from16 v4, p4

    invoke-static/range {v2 .. v8}, Lcom/getjar/sdk/comm/LicenseServiceProxy;->generateSignatureForAcquire(Ljava/lang/String;Ljava/lang/String;Lcom/getjar/sdk/License$LicenseScope;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/security/PublicKey;)Ljava/lang/String;

    move-result-object v18

    .line 294
    .local v18, "signature":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p3

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual/range {p4 .. p4}, Lcom/getjar/sdk/License$LicenseScope;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    .line 295
    .local v19, "signatureKey":Ljava/lang/String;
    const/4 v2, 0x4

    move-object/from16 v0, v18

    invoke-virtual {v0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p1

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v2}, Lcom/getjar/sdk/comm/CommContext;->putSignature(Ljava/lang/String;Ljava/lang/String;)V

    .line 296
    move-object/from16 v0, p1

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v5}, Lcom/getjar/sdk/comm/CommContext;->putNonce(Ljava/lang/String;Ljava/lang/String;)V

    .line 298
    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    sget-object v3, Lcom/getjar/sdk/comm/TransactionServiceProxy;->_URL_TEMPLATE_CONFIRM_AND_LICENSE:Ljava/lang/String;

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v7, 0x0

    const/4 v8, 0x1

    move-object/from16 v0, p1

    invoke-static {v0, v8}, Lcom/getjar/sdk/comm/GetJarConfig;->getInstance(Lcom/getjar/sdk/comm/CommContext;Z)Lcom/getjar/sdk/comm/GetJarConfig;

    move-result-object v8

    const-string v9, "service.transaction_service.endpoint"

    invoke-virtual {v8, v9}, Lcom/getjar/sdk/comm/GetJarConfig;->getDirectiveValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v4, v7

    const/4 v7, 0x1

    const-string v8, "UTF-8"

    move-object/from16 v0, v18

    invoke-static {v0, v8}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v4, v7

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    .line 304
    .local v11, "url":Ljava/lang/String;
    new-instance v12, Ljava/util/HashMap;

    const/4 v2, 0x4

    invoke-direct {v12, v2}, Ljava/util/HashMap;-><init>(I)V

    .line 305
    .local v12, "postData":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v2, "license_scope"

    invoke-virtual/range {p4 .. p4}, Lcom/getjar/sdk/License$LicenseScope;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v12, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 306
    const-string v2, "license_type"

    sget-object v3, Lcom/getjar/sdk/data/LicenseInternal$LicenseType;->UNMANAGED:Lcom/getjar/sdk/data/LicenseInternal$LicenseType;

    invoke-virtual {v3}, Lcom/getjar/sdk/data/LicenseInternal$LicenseType;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v12, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 307
    const-string v2, "nonce"

    invoke-virtual {v12, v2, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 308
    const-string v2, "client_transaction_token"

    move-object/from16 v0, p2

    invoke-virtual {v12, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 311
    const-string v8, "confirmAndLicense"

    sget-object v9, Lcom/getjar/sdk/comm/Operation$Priority;->HIGH:Lcom/getjar/sdk/comm/Operation$Priority;

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/16 v16, 0x1

    const/16 v17, 0x1

    move-object/from16 v7, p0

    move-object/from16 v10, p1

    move/from16 v15, p5

    invoke-virtual/range {v7 .. v17}, Lcom/getjar/sdk/comm/TransactionServiceProxy;->makeAsyncPOSTRequestForJson(Ljava/lang/String;Lcom/getjar/sdk/comm/Operation$Priority;Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;Lcom/getjar/sdk/comm/CallbackInterface;ZZZ)Lcom/getjar/sdk/comm/Operation;

    move-result-object v2

    return-object v2
.end method

.method public confirmManagedOffer(Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Ljava/util/HashMap;Z)Lcom/getjar/sdk/comm/Operation;
    .locals 11
    .param p1, "commContext"    # Lcom/getjar/sdk/comm/CommContext;
    .param p2, "clientTransactionId"    # Ljava/lang/String;
    .param p4, "suppressInternalCallbacks"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/getjar/sdk/comm/CommContext;",
            "Ljava/lang/String;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;Z)",
            "Lcom/getjar/sdk/comm/Operation;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .local p3, "purchaseMetadata":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v6, 0x0

    const/4 v9, 0x1

    .line 162
    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The required parameter \'commContext\' was not provided"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 163
    :cond_0
    invoke-static {p2}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The required parameter \'clientTransactionId\' was not provided"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 164
    :cond_1
    if-eqz p3, :cond_2

    invoke-virtual {p3}, Ljava/util/HashMap;->size()I

    move-result v0

    if-gtz v0, :cond_3

    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The required parameter \'purchaseMetadata\' cannot be NULL or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 167
    :cond_3
    new-instance v5, Ljava/util/HashMap;

    const/4 v0, 0x4

    invoke-direct {v5, v0}, Ljava/util/HashMap;-><init>(I)V

    .line 168
    .local v5, "postData":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v0, "client_transaction_token"

    invoke-virtual {v5, v0, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 169
    const-string v0, "purchase_metadata"

    invoke-static {p3}, Lcom/getjar/sdk/utilities/Utility;->mapToJsonString(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v5, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 172
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/getjar/sdk/comm/auth/AuthManager;->initialize(Landroid/content/Context;)V

    .line 173
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/getjar/sdk/comm/auth/AuthManager;->waitOnAuth()V

    .line 174
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    sget-object v1, Lcom/getjar/sdk/comm/TransactionServiceProxy;->_URL_TEMPLATE_CONFIRM_MANAGED_OFFER:Ljava/lang/String;

    new-array v2, v9, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p1, v9}, Lcom/getjar/sdk/comm/GetJarConfig;->getInstance(Lcom/getjar/sdk/comm/CommContext;Z)Lcom/getjar/sdk/comm/GetJarConfig;

    move-result-object v7

    const-string v8, "service.transaction_service.endpoint"

    invoke-virtual {v7, v8}, Lcom/getjar/sdk/comm/GetJarConfig;->getDirectiveValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v2, v3

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 179
    .local v4, "url":Ljava/lang/String;
    const-string v1, "confirmManagedOffer"

    sget-object v2, Lcom/getjar/sdk/comm/Operation$Priority;->HIGH:Lcom/getjar/sdk/comm/Operation$Priority;

    move-object v0, p0

    move-object v3, p1

    move-object v7, v6

    move v8, p4

    move v10, v9

    invoke-virtual/range {v0 .. v10}, Lcom/getjar/sdk/comm/TransactionServiceProxy;->makeAsyncPOSTRequestForJson(Ljava/lang/String;Lcom/getjar/sdk/comm/Operation$Priority;Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;Lcom/getjar/sdk/comm/CallbackInterface;ZZZ)Lcom/getjar/sdk/comm/Operation;

    move-result-object v0

    return-object v0
.end method

.method protected confirmUnmanagedPurchase(Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Z)Lcom/getjar/sdk/comm/Operation;
    .locals 11
    .param p1, "commContext"    # Lcom/getjar/sdk/comm/CommContext;
    .param p2, "clientTransactionId"    # Ljava/lang/String;
    .param p3, "suppressInternalCallbacks"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v9, 0x0

    const/4 v5, 0x0

    const/4 v10, 0x1

    .line 252
    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The required parameter \'commContext\' was not provided"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 253
    :cond_0
    invoke-static {p2}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The required parameter \'client_transaction_id\' was not provided"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 256
    :cond_1
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/getjar/sdk/comm/auth/AuthManager;->initialize(Landroid/content/Context;)V

    .line 257
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/getjar/sdk/comm/auth/AuthManager;->waitOnAuth()V

    .line 258
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    sget-object v1, Lcom/getjar/sdk/comm/TransactionServiceProxy;->_URL_TEMPLATE_CONFIRM_UNMANAGED_OFFER:Ljava/lang/String;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {p1, v10}, Lcom/getjar/sdk/comm/GetJarConfig;->getInstance(Lcom/getjar/sdk/comm/CommContext;Z)Lcom/getjar/sdk/comm/GetJarConfig;

    move-result-object v3

    const-string v6, "service.transaction_service.endpoint"

    invoke-virtual {v3, v6}, Lcom/getjar/sdk/comm/GetJarConfig;->getDirectiveValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v9

    const-string v3, "UTF-8"

    invoke-static {p2, v3}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v10

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 264
    .local v4, "url":Ljava/lang/String;
    const-string v1, "confirmUnmanagedPurchase"

    sget-object v2, Lcom/getjar/sdk/comm/Operation$Priority;->HIGH:Lcom/getjar/sdk/comm/Operation$Priority;

    move-object v0, p0

    move-object v3, p1

    move-object v6, v5

    move-object v7, v5

    move v8, p3

    invoke-virtual/range {v0 .. v10}, Lcom/getjar/sdk/comm/TransactionServiceProxy;->makeAsyncPOSTRequestForJson(Ljava/lang/String;Lcom/getjar/sdk/comm/Operation$Priority;Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;Lcom/getjar/sdk/comm/CallbackInterface;ZZZ)Lcom/getjar/sdk/comm/Operation;

    move-result-object v0

    return-object v0
.end method

.method protected earn(Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;Ljava/util/HashMap;Z)Lcom/getjar/sdk/comm/Operation;
    .locals 11
    .param p1, "commContext"    # Lcom/getjar/sdk/comm/CommContext;
    .param p2, "itemId"    # Ljava/lang/String;
    .param p3, "packageName"    # Ljava/lang/String;
    .param p4, "clientTransactionId"    # Ljava/lang/String;
    .param p7, "suppressInternalCallbacks"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/getjar/sdk/comm/CommContext;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;Z)",
            "Lcom/getjar/sdk/comm/Operation;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 423
    .local p5, "itemMetadata":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .local p6, "trackingMetadata":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The required parameter \'commContext\' was not provided"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 424
    :cond_0
    invoke-static {p2}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The required parameter \'item_id\' was not provided"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 425
    :cond_1
    invoke-static {p4}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The required parameter \'client_transaction_id\' was not provided"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 426
    :cond_2
    if-nez p5, :cond_3

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The required parameter \'item_metadata\' was not provided"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 427
    :cond_3
    if-nez p6, :cond_4

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The required parameter \'tracking_metadata\' was not provided"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 428
    :cond_4
    invoke-virtual/range {p6 .. p6}, Ljava/util/HashMap;->size()I

    move-result v0

    if-gtz v0, :cond_5

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The required parameter \'tracking_metadata\' contains no data"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 431
    :cond_5
    new-instance v5, Ljava/util/HashMap;

    const/4 v0, 0x2

    invoke-direct {v5, v0}, Ljava/util/HashMap;-><init>(I)V

    .line 432
    .local v5, "postData":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v0, "item_metadata"

    invoke-static/range {p5 .. p5}, Lcom/getjar/sdk/utilities/Utility;->mapToJsonString(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v5, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 433
    const-string v0, "tracking_metadata"

    invoke-static/range {p6 .. p6}, Lcom/getjar/sdk/utilities/Utility;->mapToJsonString(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v5, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 436
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/getjar/sdk/comm/auth/AuthManager;->initialize(Landroid/content/Context;)V

    .line 437
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/getjar/sdk/comm/auth/AuthManager;->waitOnAuth()V

    .line 438
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    sget-object v1, Lcom/getjar/sdk/comm/TransactionServiceProxy;->_URL_TEMPLATE_EARN:Ljava/lang/String;

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    const/4 v6, 0x1

    invoke-static {p1, v6}, Lcom/getjar/sdk/comm/GetJarConfig;->getInstance(Lcom/getjar/sdk/comm/CommContext;Z)Lcom/getjar/sdk/comm/GetJarConfig;

    move-result-object v6

    const-string v7, "service.transaction_service.endpoint"

    invoke-virtual {v6, v7}, Lcom/getjar/sdk/comm/GetJarConfig;->getDirectiveValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v2, v3

    const/4 v3, 0x1

    const-string v6, "UTF-8"

    invoke-static {p2, v6}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v2, v3

    const/4 v3, 0x2

    const-string v6, "UTF-8"

    invoke-static {p4, v6}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v2, v3

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 445
    .local v4, "url":Ljava/lang/String;
    const-string v1, "earn"

    sget-object v2, Lcom/getjar/sdk/comm/Operation$Priority;->HIGH:Lcom/getjar/sdk/comm/Operation$Priority;

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x1

    move-object v0, p0

    move-object v3, p1

    move/from16 v8, p7

    invoke-virtual/range {v0 .. v10}, Lcom/getjar/sdk/comm/TransactionServiceProxy;->makeAsyncPOSTRequestForJson(Ljava/lang/String;Lcom/getjar/sdk/comm/Operation$Priority;Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;Lcom/getjar/sdk/comm/CallbackInterface;ZZZ)Lcom/getjar/sdk/comm/Operation;

    move-result-object v0

    return-object v0
.end method

.method protected getServiceName()Lcom/getjar/sdk/comm/Request$ServiceName;
    .locals 1

    .prologue
    .line 96
    sget-object v0, Lcom/getjar/sdk/comm/Request$ServiceName;->TRANSACTION:Lcom/getjar/sdk/comm/Request$ServiceName;

    return-object v0
.end method

.method public reserveManagedOffer(Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;Ljava/util/HashMap;Z)Lcom/getjar/sdk/comm/Operation;
    .locals 11
    .param p1, "commContext"    # Lcom/getjar/sdk/comm/CommContext;
    .param p2, "offerId"    # Ljava/lang/String;
    .param p3, "clientTransactionId"    # Ljava/lang/String;
    .param p6, "suppressInternalCallbacks"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/getjar/sdk/comm/CommContext;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;Z)",
            "Lcom/getjar/sdk/comm/Operation;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 120
    .local p4, "purchaseMetadata":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .local p5, "trackingMetadata":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The required parameter \'commContext\' was not provided"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 121
    :cond_0
    invoke-static {p2}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The required parameter \'offerId\' was not provided"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 122
    :cond_1
    invoke-static {p3}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The required parameter \'client_transaction_id\' was not provided"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 123
    :cond_2
    if-eqz p4, :cond_3

    invoke-virtual {p4}, Ljava/util/HashMap;->size()I

    move-result v0

    if-gtz v0, :cond_4

    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The required parameter \'purchaseMetadata\' cannot be NULL or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 124
    :cond_4
    if-eqz p5, :cond_5

    invoke-virtual/range {p5 .. p5}, Ljava/util/HashMap;->size()I

    move-result v0

    if-gtz v0, :cond_6

    :cond_5
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The required parameter \'trackingMetadata\' cannot be NULL or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 127
    :cond_6
    new-instance v5, Ljava/util/HashMap;

    const/4 v0, 0x4

    invoke-direct {v5, v0}, Ljava/util/HashMap;-><init>(I)V

    .line 128
    .local v5, "postData":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v0, "offer_id"

    invoke-virtual {v5, v0, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 129
    const-string v0, "client_transaction_token"

    invoke-virtual {v5, v0, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 130
    const-string v0, "purchase_metadata"

    invoke-static {p4}, Lcom/getjar/sdk/utilities/Utility;->mapToJsonString(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v5, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 131
    const-string v0, "tracking_metadata"

    invoke-static/range {p5 .. p5}, Lcom/getjar/sdk/utilities/Utility;->mapToJsonString(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v5, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 134
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/getjar/sdk/comm/auth/AuthManager;->initialize(Landroid/content/Context;)V

    .line 135
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/getjar/sdk/comm/auth/AuthManager;->waitOnAuth()V

    .line 136
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    sget-object v1, Lcom/getjar/sdk/comm/TransactionServiceProxy;->_URL_TEMPLATE_RESERVE_MANAGED_OFFER:Ljava/lang/String;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    const/4 v6, 0x1

    invoke-static {p1, v6}, Lcom/getjar/sdk/comm/GetJarConfig;->getInstance(Lcom/getjar/sdk/comm/CommContext;Z)Lcom/getjar/sdk/comm/GetJarConfig;

    move-result-object v6

    const-string v7, "service.transaction_service.endpoint"

    invoke-virtual {v6, v7}, Lcom/getjar/sdk/comm/GetJarConfig;->getDirectiveValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v2, v3

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 141
    .local v4, "url":Ljava/lang/String;
    const-string v1, "reserveManagedOffer"

    sget-object v2, Lcom/getjar/sdk/comm/Operation$Priority;->HIGH:Lcom/getjar/sdk/comm/Operation$Priority;

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v9, 0x1

    const/4 v10, 0x1

    move-object v0, p0

    move-object v3, p1

    move/from16 v8, p6

    invoke-virtual/range {v0 .. v10}, Lcom/getjar/sdk/comm/TransactionServiceProxy;->makeAsyncPOSTRequestForJson(Ljava/lang/String;Lcom/getjar/sdk/comm/Operation$Priority;Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;Lcom/getjar/sdk/comm/CallbackInterface;ZZZ)Lcom/getjar/sdk/comm/Operation;

    move-result-object v0

    return-object v0
.end method

.method protected reserveUnmanagedPurchase(Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;Z)Lcom/getjar/sdk/comm/Operation;
    .locals 12
    .param p1, "commContext"    # Lcom/getjar/sdk/comm/CommContext;
    .param p2, "productId"    # Ljava/lang/String;
    .param p3, "productName"    # Ljava/lang/String;
    .param p4, "productDescription"    # Ljava/lang/String;
    .param p5, "amount"    # Ljava/lang/Integer;
    .param p6, "developerPayload"    # Ljava/lang/String;
    .param p7, "clientTransactionId"    # Ljava/lang/String;
    .param p9, "suppressInternalCallbacks"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/getjar/sdk/comm/CommContext;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;Z)",
            "Lcom/getjar/sdk/comm/Operation;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 212
    .local p8, "trackingMetadata":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    if-nez p1, :cond_0

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "The required parameter \'commContext\' was not provided"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 213
    :cond_0
    invoke-static {p2}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "The required parameter \'productId\' was not provided"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 214
    :cond_1
    invoke-static {p3}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "The required parameter \'productName\' was not provided"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 215
    :cond_2
    invoke-static/range {p4 .. p4}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "The required parameter \'productDescription\' was not provided"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 216
    :cond_3
    if-nez p5, :cond_4

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "The required parameter \'amount\' was not provided"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 217
    :cond_4
    invoke-virtual/range {p5 .. p5}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-gez v1, :cond_5

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "The parameter \'amount\' can not have a negative value"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 218
    :cond_5
    invoke-static/range {p7 .. p7}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_6

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "The required parameter \'client_transaction_id\' was not provided"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 219
    :cond_6
    if-nez p8, :cond_7

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "The required parameter \'trackingData\' was not provided"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 220
    :cond_7
    invoke-virtual/range {p8 .. p8}, Ljava/util/HashMap;->size()I

    move-result v1

    if-gtz v1, :cond_8

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "The required parameter \'trackingData\' contains no data"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 223
    :cond_8
    new-instance v6, Ljava/util/HashMap;

    const/4 v1, 0x1

    invoke-direct {v6, v1}, Ljava/util/HashMap;-><init>(I)V

    .line 224
    .local v6, "postData":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v1, "tracking_metadata"

    invoke-static/range {p8 .. p8}, Lcom/getjar/sdk/utilities/Utility;->mapToJsonString(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v6, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 225
    const-string v1, "developer_payload"

    move-object/from16 v0, p6

    invoke-virtual {v6, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 228
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/getjar/sdk/comm/auth/AuthManager;->initialize(Landroid/content/Context;)V

    .line 229
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/getjar/sdk/comm/auth/AuthManager;->waitOnAuth()V

    .line 230
    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    sget-object v2, Lcom/getjar/sdk/comm/TransactionServiceProxy;->_URL_TEMPLATE_RESERVE_UNMANAGED_OFFER:Ljava/lang/String;

    const/4 v3, 0x6

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    const/4 v7, 0x1

    invoke-static {p1, v7}, Lcom/getjar/sdk/comm/GetJarConfig;->getInstance(Lcom/getjar/sdk/comm/CommContext;Z)Lcom/getjar/sdk/comm/GetJarConfig;

    move-result-object v7

    const-string v8, "service.transaction_service.endpoint"

    invoke-virtual {v7, v8}, Lcom/getjar/sdk/comm/GetJarConfig;->getDirectiveValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v3, v4

    const/4 v4, 0x1

    const-string v7, "UTF-8"

    invoke-static {p2, v7}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v3, v4

    const/4 v4, 0x2

    const-string v7, "UTF-8"

    invoke-static {p3, v7}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v3, v4

    const/4 v4, 0x3

    const-string v7, "UTF-8"

    move-object/from16 v0, p4

    invoke-static {v0, v7}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v3, v4

    const/4 v4, 0x4

    invoke-virtual/range {p5 .. p5}, Ljava/lang/Integer;->intValue()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v3, v4

    const/4 v4, 0x5

    const-string v7, "UTF-8"

    move-object/from16 v0, p7

    invoke-static {v0, v7}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v3, v4

    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    .line 240
    .local v5, "url":Ljava/lang/String;
    const-string v2, "reserveUnmanagedPurchase"

    sget-object v3, Lcom/getjar/sdk/comm/Operation$Priority;->HIGH:Lcom/getjar/sdk/comm/Operation$Priority;

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x1

    move-object v1, p0

    move-object v4, p1

    move/from16 v9, p9

    invoke-virtual/range {v1 .. v11}, Lcom/getjar/sdk/comm/TransactionServiceProxy;->makeAsyncPOSTRequestForJson(Ljava/lang/String;Lcom/getjar/sdk/comm/Operation$Priority;Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;Lcom/getjar/sdk/comm/CallbackInterface;ZZZ)Lcom/getjar/sdk/comm/Operation;

    move-result-object v1

    return-object v1
.end method
