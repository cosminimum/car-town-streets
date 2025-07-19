.class public abstract Lcom/getjar/sdk/comm/ServiceProxyBase;
.super Ljava/lang/Object;
.source "ServiceProxyBase.java"


# static fields
.field public static final USER_AGENT_HEADER:Ljava/lang/String; = "User-Agent"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private mapWaitToCallbacks(Lcom/getjar/sdk/comm/Operation;Lcom/getjar/sdk/comm/CallbackInterface;)V
    .locals 3
    .param p1, "operation"    # Lcom/getjar/sdk/comm/Operation;
    .param p2, "callbacks"    # Lcom/getjar/sdk/comm/CallbackInterface;

    .prologue
    .line 197
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/getjar/sdk/comm/ServiceProxyBase$1;

    invoke-direct {v1, p0, p1, p2}, Lcom/getjar/sdk/comm/ServiceProxyBase$1;-><init>(Lcom/getjar/sdk/comm/ServiceProxyBase;Lcom/getjar/sdk/comm/Operation;Lcom/getjar/sdk/comm/CallbackInterface;)V

    const-string v2, "Legacy Callback Mapping Thread"

    invoke-direct {v0, v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 206
    return-void
.end method


# virtual methods
.method protected abstract getServiceName()Lcom/getjar/sdk/comm/Request$ServiceName;
.end method

.method protected makeAsyncGETRequestForJson(Ljava/lang/String;Lcom/getjar/sdk/comm/Operation$Priority;Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Ljava/util/Map;Lcom/getjar/sdk/comm/CallbackInterface;ZZZ)Lcom/getjar/sdk/comm/Operation;
    .locals 11
    .param p1, "requestType"    # Ljava/lang/String;
    .param p2, "priority"    # Lcom/getjar/sdk/comm/Operation$Priority;
    .param p3, "commContext"    # Lcom/getjar/sdk/comm/CommContext;
    .param p4, "urlStr"    # Ljava/lang/String;
    .param p6, "callbacks"    # Lcom/getjar/sdk/comm/CallbackInterface;
    .param p7, "suppressInternalCallbacks"    # Z
    .param p8, "doNotCache"    # Z
    .param p9, "isIdempotent"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/getjar/sdk/comm/Operation$Priority;",
            "Lcom/getjar/sdk/comm/CommContext;",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lcom/getjar/sdk/comm/CallbackInterface;",
            "ZZZ)",
            "Lcom/getjar/sdk/comm/Operation;"
        }
    .end annotation

    .prologue
    .line 34
    .local p5, "requestHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v10, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object/from16 v5, p5

    move-object/from16 v6, p6

    move/from16 v7, p7

    move/from16 v8, p8

    move/from16 v9, p9

    invoke-virtual/range {v0 .. v10}, Lcom/getjar/sdk/comm/ServiceProxyBase;->makeAsyncGETRequestForJson(Ljava/lang/String;Lcom/getjar/sdk/comm/Operation$Priority;Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Ljava/util/Map;Lcom/getjar/sdk/comm/CallbackInterface;ZZZLjava/lang/String;)Lcom/getjar/sdk/comm/Operation;

    move-result-object v0

    return-object v0
.end method

.method protected makeAsyncGETRequestForJson(Ljava/lang/String;Lcom/getjar/sdk/comm/Operation$Priority;Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Ljava/util/Map;Lcom/getjar/sdk/comm/CallbackInterface;ZZZLjava/lang/String;)Lcom/getjar/sdk/comm/Operation;
    .locals 18
    .param p1, "requestType"    # Ljava/lang/String;
    .param p2, "priority"    # Lcom/getjar/sdk/comm/Operation$Priority;
    .param p3, "commContext"    # Lcom/getjar/sdk/comm/CommContext;
    .param p4, "urlStr"    # Ljava/lang/String;
    .param p6, "callbacks"    # Lcom/getjar/sdk/comm/CallbackInterface;
    .param p7, "suppressInternalCallbacks"    # Z
    .param p8, "doNotCache"    # Z
    .param p9, "isIdempotent"    # Z
    .param p10, "authFlowId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/getjar/sdk/comm/Operation$Priority;",
            "Lcom/getjar/sdk/comm/CommContext;",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lcom/getjar/sdk/comm/CallbackInterface;",
            "ZZZ",
            "Ljava/lang/String;",
            ")",
            "Lcom/getjar/sdk/comm/Operation;"
        }
    .end annotation

    .prologue
    .line 68
    .local p5, "requestHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-nez p2, :cond_0

    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "\'priority\' can not be NULL"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 69
    :cond_0
    if-nez p3, :cond_1

    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "\'commContext\' can not be NULL"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 70
    :cond_1
    invoke-static/range {p4 .. p4}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "\'urlStr\' can not be NULL or empty"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 73
    :cond_2
    const/4 v6, 0x0

    .line 75
    .local v6, "uri":Ljava/net/URI;
    :try_start_0
    new-instance v6, Ljava/net/URI;

    .end local v6    # "uri":Ljava/net/URI;
    move-object/from16 v0, p4

    invoke-direct {v6, v0}, Ljava/net/URI;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_0

    .line 81
    .restart local v6    # "uri":Ljava/net/URI;
    invoke-virtual/range {p3 .. p3}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/getjar/sdk/comm/CommManager;->initialize(Landroid/content/Context;)V

    .line 82
    invoke-static {}, Lcom/getjar/sdk/comm/CommManager;->getInstance()Lcom/getjar/sdk/comm/CommManager;

    move-result-object v3

    invoke-virtual/range {p0 .. p0}, Lcom/getjar/sdk/comm/ServiceProxyBase;->getServiceName()Lcom/getjar/sdk/comm/Request$ServiceName;

    move-result-object v4

    sget-object v7, Lcom/getjar/sdk/comm/Request$HttpMethod;->GET:Lcom/getjar/sdk/comm/Request$HttpMethod;

    const/4 v8, 0x0

    const/4 v12, 0x0

    move-object/from16 v5, p1

    move-object/from16 v9, p5

    move-object/from16 v10, p2

    move-object/from16 v11, p3

    move/from16 v13, p8

    move/from16 v14, p9

    move-object/from16 v15, p10

    invoke-virtual/range {v3 .. v15}, Lcom/getjar/sdk/comm/CommManager;->enqueueOperation(Lcom/getjar/sdk/comm/Request$ServiceName;Ljava/lang/String;Ljava/net/URI;Lcom/getjar/sdk/comm/Request$HttpMethod;Ljava/util/Map;Ljava/util/Map;Lcom/getjar/sdk/comm/Operation$Priority;Lcom/getjar/sdk/comm/CommContext;ZZZLjava/lang/String;)Lcom/getjar/sdk/comm/Operation;

    move-result-object v17

    .line 96
    .local v17, "operation":Lcom/getjar/sdk/comm/Operation;
    invoke-static/range {v17 .. v17}, Lcom/getjar/sdk/comm/StatisticsTracker;->logRequest(Lcom/getjar/sdk/comm/Operation;)V

    .line 99
    if-eqz p6, :cond_3

    .line 100
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move-object/from16 v2, p6

    invoke-direct {v0, v1, v2}, Lcom/getjar/sdk/comm/ServiceProxyBase;->mapWaitToCallbacks(Lcom/getjar/sdk/comm/Operation;Lcom/getjar/sdk/comm/CallbackInterface;)V

    .line 104
    :cond_3
    return-object v17

    .line 76
    .end local v6    # "uri":Ljava/net/URI;
    .end local v17    # "operation":Lcom/getjar/sdk/comm/Operation;
    :catch_0
    move-exception v16

    .line 77
    .local v16, "e":Ljava/net/URISyntaxException;
    new-instance v3, Ljava/lang/RuntimeException;

    move-object/from16 v0, v16

    invoke-direct {v3, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v3
.end method

.method protected makeAsyncPOSTRequestForJson(Ljava/lang/String;Lcom/getjar/sdk/comm/Operation$Priority;Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;Lcom/getjar/sdk/comm/CallbackInterface;ZZZ)Lcom/getjar/sdk/comm/Operation;
    .locals 12
    .param p1, "requestType"    # Ljava/lang/String;
    .param p2, "priority"    # Lcom/getjar/sdk/comm/Operation$Priority;
    .param p3, "commContext"    # Lcom/getjar/sdk/comm/CommContext;
    .param p4, "urlStr"    # Ljava/lang/String;
    .param p7, "callbacks"    # Lcom/getjar/sdk/comm/CallbackInterface;
    .param p8, "suppressInternalCallbacks"    # Z
    .param p9, "doNotCache"    # Z
    .param p10, "isIdempotent"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/getjar/sdk/comm/Operation$Priority;",
            "Lcom/getjar/sdk/comm/CommContext;",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lcom/getjar/sdk/comm/CallbackInterface;",
            "ZZZ)",
            "Lcom/getjar/sdk/comm/Operation;"
        }
    .end annotation

    .prologue
    .line 120
    .local p5, "postData":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .local p6, "requestHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v11, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object/from16 v4, p4

    move-object/from16 v5, p5

    move-object/from16 v6, p6

    move-object/from16 v7, p7

    move/from16 v8, p8

    move/from16 v9, p9

    move/from16 v10, p10

    invoke-virtual/range {v0 .. v11}, Lcom/getjar/sdk/comm/ServiceProxyBase;->makeAsyncPOSTRequestForJson(Ljava/lang/String;Lcom/getjar/sdk/comm/Operation$Priority;Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;Lcom/getjar/sdk/comm/CallbackInterface;ZZZLjava/lang/String;)Lcom/getjar/sdk/comm/Operation;

    move-result-object v0

    return-object v0
.end method

.method protected makeAsyncPOSTRequestForJson(Ljava/lang/String;Lcom/getjar/sdk/comm/Operation$Priority;Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;Lcom/getjar/sdk/comm/CallbackInterface;ZZZLjava/lang/String;)Lcom/getjar/sdk/comm/Operation;
    .locals 18
    .param p1, "requestType"    # Ljava/lang/String;
    .param p2, "priority"    # Lcom/getjar/sdk/comm/Operation$Priority;
    .param p3, "commContext"    # Lcom/getjar/sdk/comm/CommContext;
    .param p4, "urlStr"    # Ljava/lang/String;
    .param p7, "callbacks"    # Lcom/getjar/sdk/comm/CallbackInterface;
    .param p8, "suppressInternalCallbacks"    # Z
    .param p9, "doNotCache"    # Z
    .param p10, "isIdempotent"    # Z
    .param p11, "authFlowId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/getjar/sdk/comm/Operation$Priority;",
            "Lcom/getjar/sdk/comm/CommContext;",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lcom/getjar/sdk/comm/CallbackInterface;",
            "ZZZ",
            "Ljava/lang/String;",
            ")",
            "Lcom/getjar/sdk/comm/Operation;"
        }
    .end annotation

    .prologue
    .line 156
    .local p5, "postData":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .local p6, "requestHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-nez p2, :cond_0

    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "\'priority\' can not be NULL"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 157
    :cond_0
    if-nez p3, :cond_1

    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "\'commContext\' can not be NULL"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 158
    :cond_1
    invoke-static/range {p4 .. p4}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "\'urlStr\' can not be NULL or empty"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 161
    :cond_2
    const/4 v6, 0x0

    .line 163
    .local v6, "uri":Ljava/net/URI;
    :try_start_0
    new-instance v6, Ljava/net/URI;

    .end local v6    # "uri":Ljava/net/URI;
    move-object/from16 v0, p4

    invoke-direct {v6, v0}, Ljava/net/URI;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_0

    .line 169
    .restart local v6    # "uri":Ljava/net/URI;
    invoke-virtual/range {p3 .. p3}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/getjar/sdk/comm/CommManager;->initialize(Landroid/content/Context;)V

    .line 170
    invoke-static {}, Lcom/getjar/sdk/comm/CommManager;->getInstance()Lcom/getjar/sdk/comm/CommManager;

    move-result-object v3

    invoke-virtual/range {p0 .. p0}, Lcom/getjar/sdk/comm/ServiceProxyBase;->getServiceName()Lcom/getjar/sdk/comm/Request$ServiceName;

    move-result-object v4

    sget-object v7, Lcom/getjar/sdk/comm/Request$HttpMethod;->POST:Lcom/getjar/sdk/comm/Request$HttpMethod;

    const/4 v12, 0x0

    move-object/from16 v5, p1

    move-object/from16 v8, p5

    move-object/from16 v9, p6

    move-object/from16 v10, p2

    move-object/from16 v11, p3

    move/from16 v13, p9

    move/from16 v14, p10

    move-object/from16 v15, p11

    invoke-virtual/range {v3 .. v15}, Lcom/getjar/sdk/comm/CommManager;->enqueueOperation(Lcom/getjar/sdk/comm/Request$ServiceName;Ljava/lang/String;Ljava/net/URI;Lcom/getjar/sdk/comm/Request$HttpMethod;Ljava/util/Map;Ljava/util/Map;Lcom/getjar/sdk/comm/Operation$Priority;Lcom/getjar/sdk/comm/CommContext;ZZZLjava/lang/String;)Lcom/getjar/sdk/comm/Operation;

    move-result-object v17

    .line 184
    .local v17, "operation":Lcom/getjar/sdk/comm/Operation;
    invoke-static/range {v17 .. v17}, Lcom/getjar/sdk/comm/StatisticsTracker;->logRequest(Lcom/getjar/sdk/comm/Operation;)V

    .line 187
    if-eqz p7, :cond_3

    .line 188
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move-object/from16 v2, p7

    invoke-direct {v0, v1, v2}, Lcom/getjar/sdk/comm/ServiceProxyBase;->mapWaitToCallbacks(Lcom/getjar/sdk/comm/Operation;Lcom/getjar/sdk/comm/CallbackInterface;)V

    .line 192
    :cond_3
    return-object v17

    .line 164
    .end local v6    # "uri":Ljava/net/URI;
    .end local v17    # "operation":Lcom/getjar/sdk/comm/Operation;
    :catch_0
    move-exception v16

    .line 165
    .local v16, "e":Ljava/net/URISyntaxException;
    new-instance v3, Ljava/lang/RuntimeException;

    move-object/from16 v0, v16

    invoke-direct {v3, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v3
.end method
