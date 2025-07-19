.class public Lcom/getjar/sdk/comm/VoucherServiceProxy;
.super Lcom/getjar/sdk/comm/ServiceProxyBase;
.source "VoucherServiceProxy.java"


# static fields
.field private static final _CONTRACT_VERSION:Ljava/lang/String; = "20130625"

.field private static volatile _Instance:Lcom/getjar/sdk/comm/VoucherServiceProxy;

.field private static final _URL_TEMPLATE_GET_VOUCHER:Ljava/lang/String;

.field private static final _URL_TEMPLATE_REDEEM_VOUCHER:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 19
    const/4 v0, 0x0

    sput-object v0, Lcom/getjar/sdk/comm/VoucherServiceProxy;->_Instance:Lcom/getjar/sdk/comm/VoucherServiceProxy;

    .line 37
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "%1$s%2$s"

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "%1$svoucher/vouchers/%2$s?version="

    aput-object v3, v2, v4

    const-string v3, "20130625"

    aput-object v3, v2, v5

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/getjar/sdk/comm/VoucherServiceProxy;->_URL_TEMPLATE_GET_VOUCHER:Ljava/lang/String;

    .line 42
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "%1$s%2$s"

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "%1$svoucher/vouchers/%2$s/redeem?version="

    aput-object v3, v2, v4

    const-string v3, "20130625"

    aput-object v3, v2, v5

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/getjar/sdk/comm/VoucherServiceProxy;->_URL_TEMPLATE_REDEEM_VOUCHER:Ljava/lang/String;

    .line 47
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 18
    invoke-direct {p0}, Lcom/getjar/sdk/comm/ServiceProxyBase;-><init>()V

    return-void
.end method

.method public static getInstance()Lcom/getjar/sdk/comm/VoucherServiceProxy;
    .locals 1

    .prologue
    .line 25
    sget-object v0, Lcom/getjar/sdk/comm/VoucherServiceProxy;->_Instance:Lcom/getjar/sdk/comm/VoucherServiceProxy;

    if-nez v0, :cond_0

    invoke-static {}, Lcom/getjar/sdk/comm/VoucherServiceProxy;->makeTheInstance()V

    .line 26
    :cond_0
    sget-object v0, Lcom/getjar/sdk/comm/VoucherServiceProxy;->_Instance:Lcom/getjar/sdk/comm/VoucherServiceProxy;

    return-object v0
.end method

.method private static declared-synchronized makeTheInstance()V
    .locals 2

    .prologue
    .line 21
    const-class v1, Lcom/getjar/sdk/comm/VoucherServiceProxy;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/getjar/sdk/comm/VoucherServiceProxy;->_Instance:Lcom/getjar/sdk/comm/VoucherServiceProxy;

    if-nez v0, :cond_0

    new-instance v0, Lcom/getjar/sdk/comm/VoucherServiceProxy;

    invoke-direct {v0}, Lcom/getjar/sdk/comm/VoucherServiceProxy;-><init>()V

    sput-object v0, Lcom/getjar/sdk/comm/VoucherServiceProxy;->_Instance:Lcom/getjar/sdk/comm/VoucherServiceProxy;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 22
    :cond_0
    monitor-exit v1

    return-void

    .line 21
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method protected getServiceName()Lcom/getjar/sdk/comm/Request$ServiceName;
    .locals 1

    .prologue
    .line 51
    sget-object v0, Lcom/getjar/sdk/comm/Request$ServiceName;->VOUCHER:Lcom/getjar/sdk/comm/Request$ServiceName;

    return-object v0
.end method

.method public getVoucher(Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Z)Lcom/getjar/sdk/comm/Operation;
    .locals 10
    .param p1, "commContext"    # Lcom/getjar/sdk/comm/CommContext;
    .param p2, "voucherToken"    # Ljava/lang/String;
    .param p3, "suppressInternalCallbacks"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    const/4 v8, 0x1

    .line 60
    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The required parameter \'commContext\' was not provided"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 61
    :cond_0
    invoke-static {p2}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The required parameter \'voucherToken\' was not provided"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 64
    :cond_1
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/getjar/sdk/comm/auth/AuthManager;->initialize(Landroid/content/Context;)V

    .line 65
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/getjar/sdk/comm/auth/AuthManager;->waitOnAuth()V

    .line 66
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    sget-object v1, Lcom/getjar/sdk/comm/VoucherServiceProxy;->_URL_TEMPLATE_GET_VOUCHER:Ljava/lang/String;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p1, v8}, Lcom/getjar/sdk/comm/GetJarConfig;->getInstance(Lcom/getjar/sdk/comm/CommContext;Z)Lcom/getjar/sdk/comm/GetJarConfig;

    move-result-object v6

    const-string v7, "service.voucher_service.endpoint"

    invoke-virtual {v6, v7}, Lcom/getjar/sdk/comm/GetJarConfig;->getDirectiveValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v2, v3

    const-string v3, "UTF-8"

    invoke-static {p2, v3}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v8

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 71
    .local v4, "url":Ljava/lang/String;
    const-string v1, "getVoucher"

    sget-object v2, Lcom/getjar/sdk/comm/Operation$Priority;->MEDIUM:Lcom/getjar/sdk/comm/Operation$Priority;

    move-object v0, p0

    move-object v3, p1

    move-object v6, v5

    move v7, p3

    move v9, v8

    invoke-virtual/range {v0 .. v9}, Lcom/getjar/sdk/comm/VoucherServiceProxy;->makeAsyncGETRequestForJson(Ljava/lang/String;Lcom/getjar/sdk/comm/Operation$Priority;Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Ljava/util/Map;Lcom/getjar/sdk/comm/CallbackInterface;ZZZ)Lcom/getjar/sdk/comm/Operation;

    move-result-object v0

    return-object v0
.end method

.method public redeemVoucher(Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lcom/getjar/sdk/comm/Operation;
    .locals 11
    .param p1, "commContext"    # Lcom/getjar/sdk/comm/CommContext;
    .param p2, "voucherToken"    # Ljava/lang/String;
    .param p3, "developerPayload"    # Ljava/lang/String;
    .param p4, "clientTransactionId"    # Ljava/lang/String;
    .param p5, "suppressInternalCallbacks"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 88
    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The required parameter \'commContext\' was not provided"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 89
    :cond_0
    invoke-static {p2}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The required parameter \'voucherToken\' was not provided"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 90
    :cond_1
    invoke-static {p4}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The required parameter \'client_transaction_id\' was not provided"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 93
    :cond_2
    new-instance v5, Ljava/util/HashMap;

    const/4 v0, 0x2

    invoke-direct {v5, v0}, Ljava/util/HashMap;-><init>(I)V

    .line 94
    .local v5, "postData":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v0, "client_transaction_token"

    invoke-virtual {v5, v0, p4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    const-string v0, "developer_payload"

    invoke-virtual {v5, v0, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 98
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/getjar/sdk/comm/auth/AuthManager;->initialize(Landroid/content/Context;)V

    .line 99
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/getjar/sdk/comm/auth/AuthManager;->waitOnAuth()V

    .line 100
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    sget-object v1, Lcom/getjar/sdk/comm/VoucherServiceProxy;->_URL_TEMPLATE_REDEEM_VOUCHER:Ljava/lang/String;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    const/4 v6, 0x1

    invoke-static {p1, v6}, Lcom/getjar/sdk/comm/GetJarConfig;->getInstance(Lcom/getjar/sdk/comm/CommContext;Z)Lcom/getjar/sdk/comm/GetJarConfig;

    move-result-object v6

    const-string v7, "service.voucher_service.endpoint"

    invoke-virtual {v6, v7}, Lcom/getjar/sdk/comm/GetJarConfig;->getDirectiveValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v2, v3

    const/4 v3, 0x1

    const-string v6, "UTF-8"

    invoke-static {p2, v6}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v2, v3

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 106
    .local v4, "url":Ljava/lang/String;
    const-string v1, "redeemVoucher"

    sget-object v2, Lcom/getjar/sdk/comm/Operation$Priority;->HIGH:Lcom/getjar/sdk/comm/Operation$Priority;

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v9, 0x1

    const/4 v10, 0x1

    move-object v0, p0

    move-object v3, p1

    move/from16 v8, p5

    invoke-virtual/range {v0 .. v10}, Lcom/getjar/sdk/comm/VoucherServiceProxy;->makeAsyncPOSTRequestForJson(Ljava/lang/String;Lcom/getjar/sdk/comm/Operation$Priority;Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;Lcom/getjar/sdk/comm/CallbackInterface;ZZZ)Lcom/getjar/sdk/comm/Operation;

    move-result-object v0

    return-object v0
.end method
