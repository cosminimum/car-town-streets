.class public Lcom/getjar/sdk/comm/AuthorizationServiceProxy;
.super Lcom/getjar/sdk/comm/ServiceProxyBase;
.source "AuthorizationServiceProxy.java"


# static fields
.field private static final _CONTRACT_VERSION:Ljava/lang/String; = "20130716"

.field private static volatile _Instance:Lcom/getjar/sdk/comm/AuthorizationServiceProxy;

.field private static final _URL_TEMPLATE_AUTHORIZE:Ljava/lang/String;

.field private static final _URL_TEMPLATE_GENERATE_SIGNATURE:Ljava/lang/String;

.field private static final _URL_TEMPLATE_USER_ACCESS_ENSURE:Ljava/lang/String;

.field private static final _URL_TEMPLATE_VALIDATE_AUTH:Ljava/lang/String;

.field private static final _URL_TEMPLATE_VALIDATE_PROXIED_AUTH:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 26
    const/4 v0, 0x0

    sput-object v0, Lcom/getjar/sdk/comm/AuthorizationServiceProxy;->_Instance:Lcom/getjar/sdk/comm/AuthorizationServiceProxy;

    .line 49
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "%1$s%2$s"

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "%1$sapp_auth/app/authorize?application_key=%2$s&provider_filter=%3$s&version="

    aput-object v3, v2, v4

    const-string v3, "20130716"

    aput-object v3, v2, v5

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/getjar/sdk/comm/AuthorizationServiceProxy;->_URL_TEMPLATE_AUTHORIZE:Ljava/lang/String;

    .line 54
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "%1$s%2$s"

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "%1$suser_auth/user_accesses/ensure?provider_filter=%2$s&version="

    aput-object v3, v2, v4

    const-string v3, "20130716"

    aput-object v3, v2, v5

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/getjar/sdk/comm/AuthorizationServiceProxy;->_URL_TEMPLATE_USER_ACCESS_ENSURE:Ljava/lang/String;

    .line 59
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "%1$s%2$s"

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "%1$sauth/validate?version="

    aput-object v3, v2, v4

    const-string v3, "20130716"

    aput-object v3, v2, v5

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/getjar/sdk/comm/AuthorizationServiceProxy;->_URL_TEMPLATE_VALIDATE_AUTH:Ljava/lang/String;

    .line 64
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "%1$s%2$s"

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "%1$sauth/validate?provider_filter=%2$s&version="

    aput-object v3, v2, v4

    const-string v3, "20130716"

    aput-object v3, v2, v5

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/getjar/sdk/comm/AuthorizationServiceProxy;->_URL_TEMPLATE_VALIDATE_PROXIED_AUTH:Ljava/lang/String;

    .line 69
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "%1$s%2$s"

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "%1$sauth/generate_signature?provider_filter=%2$s&version="

    aput-object v3, v2, v4

    const-string v3, "20130716"

    aput-object v3, v2, v5

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/getjar/sdk/comm/AuthorizationServiceProxy;->_URL_TEMPLATE_GENERATE_SIGNATURE:Ljava/lang/String;

    .line 73
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 25
    invoke-direct {p0}, Lcom/getjar/sdk/comm/ServiceProxyBase;-><init>()V

    return-void
.end method

.method public static getInstance()Lcom/getjar/sdk/comm/AuthorizationServiceProxy;
    .locals 1

    .prologue
    .line 32
    sget-object v0, Lcom/getjar/sdk/comm/AuthorizationServiceProxy;->_Instance:Lcom/getjar/sdk/comm/AuthorizationServiceProxy;

    if-nez v0, :cond_0

    invoke-static {}, Lcom/getjar/sdk/comm/AuthorizationServiceProxy;->makeTheInstance()V

    .line 33
    :cond_0
    sget-object v0, Lcom/getjar/sdk/comm/AuthorizationServiceProxy;->_Instance:Lcom/getjar/sdk/comm/AuthorizationServiceProxy;

    return-object v0
.end method

.method private static declared-synchronized makeTheInstance()V
    .locals 2

    .prologue
    .line 28
    const-class v1, Lcom/getjar/sdk/comm/AuthorizationServiceProxy;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/getjar/sdk/comm/AuthorizationServiceProxy;->_Instance:Lcom/getjar/sdk/comm/AuthorizationServiceProxy;

    if-nez v0, :cond_0

    new-instance v0, Lcom/getjar/sdk/comm/AuthorizationServiceProxy;

    invoke-direct {v0}, Lcom/getjar/sdk/comm/AuthorizationServiceProxy;-><init>()V

    sput-object v0, Lcom/getjar/sdk/comm/AuthorizationServiceProxy;->_Instance:Lcom/getjar/sdk/comm/AuthorizationServiceProxy;
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
.method public authorize(Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;)Lcom/getjar/sdk/comm/Operation;
    .locals 13
    .param p1, "commContext"    # Lcom/getjar/sdk/comm/CommContext;
    .param p2, "authFlowId"    # Ljava/lang/String;
    .param p4, "providerFilter"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/getjar/sdk/comm/CommContext;",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/getjar/sdk/data/MetadataValue;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Lcom/getjar/sdk/comm/Operation;"
        }
    .end annotation

    .prologue
    .line 89
    .local p3, "metadata":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/getjar/sdk/data/MetadataValue;>;"
    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The required parameter \'commContext\' was not provided"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 90
    :cond_0
    invoke-static {p2}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The required parameter \'authFlowId\' was not provided"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 91
    :cond_1
    if-nez p3, :cond_2

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The required parameter \'providerData\' was not provided"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 92
    :cond_2
    invoke-static/range {p4 .. p4}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The required parameter \'providerFilter\' was not provided"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 95
    :cond_3
    new-instance v5, Ljava/util/HashMap;

    const/4 v0, 0x2

    invoke-direct {v5, v0}, Ljava/util/HashMap;-><init>(I)V

    .line 96
    .local v5, "postData":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v0, "scope"

    const-string v1, "[\"default\"]"

    invoke-interface {v5, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 98
    :try_start_0
    const-string v0, "metadata"

    invoke-static/range {p3 .. p3}, Lcom/getjar/sdk/utilities/Utility;->metadataMapToJsonString(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v5, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 104
    const/4 v4, 0x0

    .line 106
    .local v4, "url":Ljava/lang/String;
    :try_start_1
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    sget-object v1, Lcom/getjar/sdk/comm/AuthorizationServiceProxy;->_URL_TEMPLATE_AUTHORIZE:Ljava/lang/String;

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    const/4 v6, 0x1

    invoke-static {p1, v6}, Lcom/getjar/sdk/comm/GetJarConfig;->getInstance(Lcom/getjar/sdk/comm/CommContext;Z)Lcom/getjar/sdk/comm/GetJarConfig;

    move-result-object v6

    const-string v7, "service.auth_service.endpoint"

    invoke-virtual {v6, v7}, Lcom/getjar/sdk/comm/GetJarConfig;->getDirectiveValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v2, v3

    const/4 v3, 0x1

    invoke-virtual {p1}, Lcom/getjar/sdk/comm/CommContext;->getApplicationKey()Ljava/lang/String;

    move-result-object v6

    const-string v7, "UTF-8"

    invoke-static {v6, v7}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v2, v3

    const/4 v3, 0x2

    aput-object p4, v2, v3

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    :try_end_1
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v4

    .line 115
    const-string v1, "authorize"

    sget-object v2, Lcom/getjar/sdk/comm/Operation$Priority;->HIGH:Lcom/getjar/sdk/comm/Operation$Priority;

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x1

    const/4 v10, 0x1

    move-object v0, p0

    move-object v3, p1

    move-object v11, p2

    invoke-virtual/range {v0 .. v11}, Lcom/getjar/sdk/comm/AuthorizationServiceProxy;->makeAsyncPOSTRequestForJson(Ljava/lang/String;Lcom/getjar/sdk/comm/Operation$Priority;Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;Lcom/getjar/sdk/comm/CallbackInterface;ZZZLjava/lang/String;)Lcom/getjar/sdk/comm/Operation;

    move-result-object v0

    return-object v0

    .line 99
    .end local v4    # "url":Ljava/lang/String;
    :catch_0
    move-exception v12

    .line 100
    .local v12, "e":Lorg/json/JSONException;
    new-instance v0, Lcom/getjar/sdk/exceptions/CommunicationException;

    invoke-direct {v0, v12}, Lcom/getjar/sdk/exceptions/CommunicationException;-><init>(Ljava/lang/Throwable;)V

    throw v0

    .line 111
    .end local v12    # "e":Lorg/json/JSONException;
    .restart local v4    # "url":Ljava/lang/String;
    :catch_1
    move-exception v12

    .line 112
    .local v12, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v0, Lcom/getjar/sdk/exceptions/CommunicationException;

    invoke-direct {v0, v12}, Lcom/getjar/sdk/exceptions/CommunicationException;-><init>(Ljava/lang/Throwable;)V

    throw v0
.end method

.method public generateSignature(Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;)Lcom/getjar/sdk/comm/Operation;
    .locals 14
    .param p1, "commContext"    # Lcom/getjar/sdk/comm/CommContext;
    .param p2, "authFlowId"    # Ljava/lang/String;
    .param p3, "authToken"    # Ljava/lang/String;
    .param p4, "sourceUserAccessId"    # Ljava/lang/String;
    .param p5, "sourceUserDeviceId"    # Ljava/lang/String;
    .param p7, "providerFilter"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/getjar/sdk/comm/CommContext;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/getjar/sdk/data/MetadataValue;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Lcom/getjar/sdk/comm/Operation;"
        }
    .end annotation

    .prologue
    .line 246
    .local p6, "metadata":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/getjar/sdk/data/MetadataValue;>;"
    if-nez p1, :cond_0

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "The required parameter \'commContext\' was not provided"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 247
    :cond_0
    invoke-static/range {p2 .. p2}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "The required parameter \'authFlowId\' was not provided"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 248
    :cond_1
    invoke-static/range {p3 .. p3}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "The required parameter \'authToken\' was not provided"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 249
    :cond_2
    invoke-static/range {p4 .. p4}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "The required parameter \'userAccessId\' was not provided"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 250
    :cond_3
    invoke-static/range {p5 .. p5}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "The required parameter \'userDeviceId\' was not provided"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 251
    :cond_4
    if-nez p6, :cond_5

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "The required parameter \'providerData\' was not provided"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 252
    :cond_5
    invoke-static/range {p7 .. p7}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_6

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "The required parameter \'providerFilter\' was not provided"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 255
    :cond_6
    new-instance v6, Ljava/util/HashMap;

    const/4 v1, 0x1

    invoke-direct {v6, v1}, Ljava/util/HashMap;-><init>(I)V

    .line 257
    .local v6, "postData":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :try_start_0
    const-string v1, "metadata"

    invoke-static/range {p6 .. p6}, Lcom/getjar/sdk/utilities/Utility;->metadataMapToJsonString(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v6, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 261
    const-string v1, "user_access_id"

    move-object/from16 v0, p4

    invoke-interface {v6, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 262
    const-string v1, "user_device_id"

    move-object/from16 v0, p5

    invoke-interface {v6, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 265
    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    .line 266
    .local v7, "requestHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v1, "Authorization"

    move-object/from16 v0, p3

    invoke-interface {v7, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 269
    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    sget-object v2, Lcom/getjar/sdk/comm/AuthorizationServiceProxy;->_URL_TEMPLATE_GENERATE_SIGNATURE:Ljava/lang/String;

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    const/4 v8, 0x1

    invoke-static {p1, v8}, Lcom/getjar/sdk/comm/GetJarConfig;->getInstance(Lcom/getjar/sdk/comm/CommContext;Z)Lcom/getjar/sdk/comm/GetJarConfig;

    move-result-object v8

    const-string v9, "service.auth_service.endpoint"

    invoke-virtual {v8, v9}, Lcom/getjar/sdk/comm/GetJarConfig;->getDirectiveValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v3, v4

    const/4 v4, 0x1

    aput-object p7, v3, v4

    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    .line 273
    .local v5, "url":Ljava/lang/String;
    const-string v2, "validateProxyAuth"

    sget-object v3, Lcom/getjar/sdk/comm/Operation$Priority;->HIGH:Lcom/getjar/sdk/comm/Operation$Priority;

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x1

    const/4 v11, 0x1

    move-object v1, p0

    move-object v4, p1

    move-object/from16 v12, p2

    invoke-virtual/range {v1 .. v12}, Lcom/getjar/sdk/comm/AuthorizationServiceProxy;->makeAsyncPOSTRequestForJson(Ljava/lang/String;Lcom/getjar/sdk/comm/Operation$Priority;Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;Lcom/getjar/sdk/comm/CallbackInterface;ZZZLjava/lang/String;)Lcom/getjar/sdk/comm/Operation;

    move-result-object v1

    return-object v1

    .line 258
    .end local v5    # "url":Ljava/lang/String;
    .end local v7    # "requestHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :catch_0
    move-exception v13

    .line 259
    .local v13, "e":Lorg/json/JSONException;
    new-instance v1, Lcom/getjar/sdk/exceptions/CommunicationException;

    invoke-direct {v1, v13}, Lcom/getjar/sdk/exceptions/CommunicationException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method protected getServiceName()Lcom/getjar/sdk/comm/Request$ServiceName;
    .locals 1

    .prologue
    .line 76
    sget-object v0, Lcom/getjar/sdk/comm/Request$ServiceName;->AUTH:Lcom/getjar/sdk/comm/Request$ServiceName;

    return-object v0
.end method

.method public userAccessEnsure(Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;)Lcom/getjar/sdk/comm/Operation;
    .locals 14
    .param p1, "commContext"    # Lcom/getjar/sdk/comm/CommContext;
    .param p2, "authFlowId"    # Ljava/lang/String;
    .param p3, "authToken"    # Ljava/lang/String;
    .param p5, "providerFilter"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/getjar/sdk/comm/CommContext;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/getjar/sdk/data/MetadataValue;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Lcom/getjar/sdk/comm/Operation;"
        }
    .end annotation

    .prologue
    .line 129
    .local p4, "metadata":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/getjar/sdk/data/MetadataValue;>;"
    if-nez p1, :cond_0

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "The required parameter \'commContext\' was not provided"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 130
    :cond_0
    invoke-static/range {p2 .. p2}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "The required parameter \'authFlowId\' was not provided"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 131
    :cond_1
    invoke-static/range {p3 .. p3}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "The required parameter \'authToken\' was not provided"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 132
    :cond_2
    if-nez p4, :cond_3

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "The required parameter \'providerData\' was not provided"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 133
    :cond_3
    invoke-static/range {p5 .. p5}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "The required parameter \'providerFilter\' was not provided"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 136
    :cond_4
    new-instance v6, Ljava/util/HashMap;

    const/4 v1, 0x2

    invoke-direct {v6, v1}, Ljava/util/HashMap;-><init>(I)V

    .line 137
    .local v6, "postData":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v1, "scope"

    const-string v2, "[\"default\"]"

    invoke-interface {v6, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 139
    :try_start_0
    const-string v1, "metadata"

    invoke-static/range {p4 .. p4}, Lcom/getjar/sdk/utilities/Utility;->metadataMapToJsonString(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v6, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 145
    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    .line 146
    .local v7, "requestHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v1, "Authorization"

    move-object/from16 v0, p3

    invoke-interface {v7, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 149
    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    sget-object v2, Lcom/getjar/sdk/comm/AuthorizationServiceProxy;->_URL_TEMPLATE_USER_ACCESS_ENSURE:Ljava/lang/String;

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    const/4 v8, 0x1

    invoke-static {p1, v8}, Lcom/getjar/sdk/comm/GetJarConfig;->getInstance(Lcom/getjar/sdk/comm/CommContext;Z)Lcom/getjar/sdk/comm/GetJarConfig;

    move-result-object v8

    const-string v9, "service.auth_service.endpoint"

    invoke-virtual {v8, v9}, Lcom/getjar/sdk/comm/GetJarConfig;->getDirectiveValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v3, v4

    const/4 v4, 0x1

    aput-object p5, v3, v4

    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    .line 153
    .local v5, "url":Ljava/lang/String;
    const-string v2, "userAccessEnsure"

    sget-object v3, Lcom/getjar/sdk/comm/Operation$Priority;->HIGH:Lcom/getjar/sdk/comm/Operation$Priority;

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x1

    const/4 v11, 0x1

    move-object v1, p0

    move-object v4, p1

    move-object/from16 v12, p2

    invoke-virtual/range {v1 .. v12}, Lcom/getjar/sdk/comm/AuthorizationServiceProxy;->makeAsyncPOSTRequestForJson(Ljava/lang/String;Lcom/getjar/sdk/comm/Operation$Priority;Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;Lcom/getjar/sdk/comm/CallbackInterface;ZZZLjava/lang/String;)Lcom/getjar/sdk/comm/Operation;

    move-result-object v1

    return-object v1

    .line 140
    .end local v5    # "url":Ljava/lang/String;
    .end local v7    # "requestHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :catch_0
    move-exception v13

    .line 141
    .local v13, "e":Lorg/json/JSONException;
    new-instance v1, Lcom/getjar/sdk/exceptions/CommunicationException;

    invoke-direct {v1, v13}, Lcom/getjar/sdk/exceptions/CommunicationException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public validateAuth(Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Ljava/lang/String;)Lcom/getjar/sdk/comm/Operation;
    .locals 11
    .param p1, "commContext"    # Lcom/getjar/sdk/comm/CommContext;
    .param p2, "authFlowId"    # Ljava/lang/String;
    .param p3, "authToken"    # Ljava/lang/String;

    .prologue
    const/4 v7, 0x0

    const/4 v8, 0x1

    .line 167
    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The required parameter \'commContext\' was not provided"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 168
    :cond_0
    invoke-static {p2}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The required parameter \'authFlowId\' was not provided"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 169
    :cond_1
    invoke-static {p3}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The required parameter \'authToken\' was not provided"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 172
    :cond_2
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 173
    .local v5, "requestHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v0, "Authorization"

    invoke-interface {v5, v0, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 176
    const/4 v4, 0x0

    .line 177
    .local v4, "url":Ljava/lang/String;
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    sget-object v1, Lcom/getjar/sdk/comm/AuthorizationServiceProxy;->_URL_TEMPLATE_VALIDATE_AUTH:Ljava/lang/String;

    new-array v2, v8, [Ljava/lang/Object;

    invoke-static {p1, v8}, Lcom/getjar/sdk/comm/GetJarConfig;->getInstance(Lcom/getjar/sdk/comm/CommContext;Z)Lcom/getjar/sdk/comm/GetJarConfig;

    move-result-object v3

    const-string v6, "service.auth_service.endpoint"

    invoke-virtual {v3, v6}, Lcom/getjar/sdk/comm/GetJarConfig;->getDirectiveValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v7

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 180
    const-string v1, "validateAuth"

    sget-object v2, Lcom/getjar/sdk/comm/Operation$Priority;->HIGH:Lcom/getjar/sdk/comm/Operation$Priority;

    const/4 v6, 0x0

    move-object v0, p0

    move-object v3, p1

    move v9, v8

    move-object v10, p2

    invoke-virtual/range {v0 .. v10}, Lcom/getjar/sdk/comm/AuthorizationServiceProxy;->makeAsyncGETRequestForJson(Ljava/lang/String;Lcom/getjar/sdk/comm/Operation$Priority;Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Ljava/util/Map;Lcom/getjar/sdk/comm/CallbackInterface;ZZZLjava/lang/String;)Lcom/getjar/sdk/comm/Operation;

    move-result-object v0

    return-object v0
.end method

.method public validateAuth(Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;)Lcom/getjar/sdk/comm/Operation;
    .locals 14
    .param p1, "commContext"    # Lcom/getjar/sdk/comm/CommContext;
    .param p2, "authFlowId"    # Ljava/lang/String;
    .param p3, "authToken"    # Ljava/lang/String;
    .param p5, "providerFilter"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/getjar/sdk/comm/CommContext;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/getjar/sdk/data/MetadataValue;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Lcom/getjar/sdk/comm/Operation;"
        }
    .end annotation

    .prologue
    .line 196
    .local p4, "metadata":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/getjar/sdk/data/MetadataValue;>;"
    if-nez p1, :cond_0

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "The required parameter \'commContext\' was not provided"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 197
    :cond_0
    invoke-static/range {p2 .. p2}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "The required parameter \'authFlowId\' was not provided"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 198
    :cond_1
    invoke-static/range {p3 .. p3}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "The required parameter \'authToken\' was not provided"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 199
    :cond_2
    if-nez p4, :cond_3

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "The required parameter \'providerData\' was not provided"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 200
    :cond_3
    invoke-static/range {p5 .. p5}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "The required parameter \'providerFilter\' was not provided"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 203
    :cond_4
    new-instance v6, Ljava/util/HashMap;

    const/4 v1, 0x1

    invoke-direct {v6, v1}, Ljava/util/HashMap;-><init>(I)V

    .line 205
    .local v6, "postData":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :try_start_0
    const-string v1, "metadata"

    invoke-static/range {p4 .. p4}, Lcom/getjar/sdk/utilities/Utility;->metadataMapToJsonString(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v6, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 211
    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    .line 212
    .local v7, "requestHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v1, "Authorization"

    move-object/from16 v0, p3

    invoke-interface {v7, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 215
    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    sget-object v2, Lcom/getjar/sdk/comm/AuthorizationServiceProxy;->_URL_TEMPLATE_VALIDATE_PROXIED_AUTH:Ljava/lang/String;

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    const/4 v8, 0x1

    invoke-static {p1, v8}, Lcom/getjar/sdk/comm/GetJarConfig;->getInstance(Lcom/getjar/sdk/comm/CommContext;Z)Lcom/getjar/sdk/comm/GetJarConfig;

    move-result-object v8

    const-string v9, "service.auth_service.endpoint"

    invoke-virtual {v8, v9}, Lcom/getjar/sdk/comm/GetJarConfig;->getDirectiveValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v3, v4

    const/4 v4, 0x1

    aput-object p5, v3, v4

    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    .line 219
    .local v5, "url":Ljava/lang/String;
    const-string v2, "validateProxyAuth"

    sget-object v3, Lcom/getjar/sdk/comm/Operation$Priority;->HIGH:Lcom/getjar/sdk/comm/Operation$Priority;

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x1

    const/4 v11, 0x1

    move-object v1, p0

    move-object v4, p1

    move-object/from16 v12, p2

    invoke-virtual/range {v1 .. v12}, Lcom/getjar/sdk/comm/AuthorizationServiceProxy;->makeAsyncPOSTRequestForJson(Ljava/lang/String;Lcom/getjar/sdk/comm/Operation$Priority;Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;Lcom/getjar/sdk/comm/CallbackInterface;ZZZLjava/lang/String;)Lcom/getjar/sdk/comm/Operation;

    move-result-object v1

    return-object v1

    .line 206
    .end local v5    # "url":Ljava/lang/String;
    .end local v7    # "requestHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :catch_0
    move-exception v13

    .line 207
    .local v13, "e":Lorg/json/JSONException;
    new-instance v1, Lcom/getjar/sdk/exceptions/CommunicationException;

    invoke-direct {v1, v13}, Lcom/getjar/sdk/exceptions/CommunicationException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method
