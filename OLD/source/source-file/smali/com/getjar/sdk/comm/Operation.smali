.class public Lcom/getjar/sdk/comm/Operation;
.super Ljava/lang/Object;
.source "Operation.java"

# interfaces
.implements Ljava/util/concurrent/Future;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/getjar/sdk/comm/Operation$Status;,
        Lcom/getjar/sdk/comm/Operation$Priority;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Future",
        "<",
        "Lcom/getjar/sdk/comm/Result;",
        ">;"
    }
.end annotation


# static fields
.field private static _PriorityPromotionIntervalInMilliseconds:J


# instance fields
.field private final _authFlowId:Ljava/lang/String;

.field private final _commContext:Lcom/getjar/sdk/comm/CommContext;

.field private final _createdTimestamp:J

.field private final _doNotCache:Z

.field private _exception:Ljava/lang/Exception;

.field private volatile _future:Ljava/util/concurrent/FutureTask;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/FutureTask",
            "<",
            "Lcom/getjar/sdk/comm/Result;",
            ">;"
        }
    .end annotation
.end field

.field private final _isIdempotent:Z

.field private _lastPriorityPromotionTimestamp:J

.field private _priority:I

.field private _reauthThenRetryCount:I

.field private final _request:Lcom/getjar/sdk/comm/Request;

.field private _result:Lcom/getjar/sdk/comm/Result;

.field private _retryAfterCount:I

.field private _retryAfterTimestamp:J

.field private final _startingPriority:Lcom/getjar/sdk/comm/Operation$Priority;

.field private _state:Lcom/getjar/sdk/comm/Operation$Status;

.field private final _suppressInternalCallbacks:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 58
    const-wide/32 v0, 0xea60

    sput-wide v0, Lcom/getjar/sdk/comm/Operation;->_PriorityPromotionIntervalInMilliseconds:J

    return-void
.end method

.method protected constructor <init>(Lcom/getjar/sdk/comm/Request$ServiceName;Ljava/lang/String;Ljava/net/URI;Lcom/getjar/sdk/comm/Request$HttpMethod;Ljava/util/Map;Ljava/util/Map;Lcom/getjar/sdk/comm/Operation$Priority;Lcom/getjar/sdk/comm/CommContext;ZZZLjava/lang/String;)V
    .locals 8
    .param p1, "serviceName"    # Lcom/getjar/sdk/comm/Request$ServiceName;
    .param p2, "requestType"    # Ljava/lang/String;
    .param p3, "requestUri"    # Ljava/net/URI;
    .param p4, "httpMethod"    # Lcom/getjar/sdk/comm/Request$HttpMethod;
    .param p7, "priority"    # Lcom/getjar/sdk/comm/Operation$Priority;
    .param p8, "commContext"    # Lcom/getjar/sdk/comm/CommContext;
    .param p9, "suppressInternalCallbacks"    # Z
    .param p10, "doNotCache"    # Z
    .param p11, "isIdempotent"    # Z
    .param p12, "authFlowId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/getjar/sdk/comm/Request$ServiceName;",
            "Ljava/lang/String;",
            "Ljava/net/URI;",
            "Lcom/getjar/sdk/comm/Request$HttpMethod;",
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
            "Lcom/getjar/sdk/comm/Operation$Priority;",
            "Lcom/getjar/sdk/comm/CommContext;",
            "ZZZ",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 92
    .local p5, "postData":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .local p6, "requestHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 68
    sget-object v1, Lcom/getjar/sdk/comm/Operation$Status;->CREATED:Lcom/getjar/sdk/comm/Operation$Status;

    iput-object v1, p0, Lcom/getjar/sdk/comm/Operation;->_state:Lcom/getjar/sdk/comm/Operation$Status;

    .line 71
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/getjar/sdk/comm/Operation;->_exception:Ljava/lang/Exception;

    .line 73
    const/4 v1, 0x0

    iput v1, p0, Lcom/getjar/sdk/comm/Operation;->_retryAfterCount:I

    .line 74
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/getjar/sdk/comm/Operation;->_result:Lcom/getjar/sdk/comm/Result;

    .line 76
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/getjar/sdk/comm/Operation;->_future:Ljava/util/concurrent/FutureTask;

    .line 77
    const/4 v1, 0x0

    iput v1, p0, Lcom/getjar/sdk/comm/Operation;->_reauthThenRetryCount:I

    .line 95
    if-nez p1, :cond_0

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\'serviceName\' can not be NULL"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 96
    :cond_0
    invoke-static {p2}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\'requestType\' can not be NULL or empty"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 97
    :cond_1
    if-nez p7, :cond_2

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\'priority\' can not be NULL"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 98
    :cond_2
    if-nez p3, :cond_3

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\'requestUri\' can not be NULL"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 99
    :cond_3
    if-nez p4, :cond_4

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\'httpMethod\' can not be NULL"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 100
    :cond_4
    if-nez p8, :cond_5

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\'commContext\' can not be NULL"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 101
    :cond_5
    if-eqz p5, :cond_6

    sget-object v1, Lcom/getjar/sdk/comm/Request$HttpMethod;->POST:Lcom/getjar/sdk/comm/Request$HttpMethod;

    invoke-virtual {v1, p4}, Lcom/getjar/sdk/comm/Request$HttpMethod;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_6

    .line 102
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\'postData\' can only be provided for requests of method type \"POST\""

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 106
    :cond_6
    iput-object p7, p0, Lcom/getjar/sdk/comm/Operation;->_startingPriority:Lcom/getjar/sdk/comm/Operation$Priority;

    .line 107
    move-object/from16 v0, p8

    iput-object v0, p0, Lcom/getjar/sdk/comm/Operation;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    .line 108
    move/from16 v0, p9

    iput-boolean v0, p0, Lcom/getjar/sdk/comm/Operation;->_suppressInternalCallbacks:Z

    .line 109
    move/from16 v0, p10

    iput-boolean v0, p0, Lcom/getjar/sdk/comm/Operation;->_doNotCache:Z

    .line 110
    move/from16 v0, p11

    iput-boolean v0, p0, Lcom/getjar/sdk/comm/Operation;->_isIdempotent:Z

    .line 111
    move-object/from16 v0, p12

    iput-object v0, p0, Lcom/getjar/sdk/comm/Operation;->_authFlowId:Ljava/lang/String;

    .line 113
    invoke-virtual {p7}, Lcom/getjar/sdk/comm/Operation$Priority;->getValue()I

    move-result v1

    iput v1, p0, Lcom/getjar/sdk/comm/Operation;->_priority:I

    .line 114
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    iput-wide v1, p0, Lcom/getjar/sdk/comm/Operation;->_createdTimestamp:J

    .line 115
    iget-wide v1, p0, Lcom/getjar/sdk/comm/Operation;->_createdTimestamp:J

    iput-wide v1, p0, Lcom/getjar/sdk/comm/Operation;->_lastPriorityPromotionTimestamp:J

    .line 116
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/getjar/sdk/comm/Operation;->_exception:Ljava/lang/Exception;

    .line 117
    sget-object v1, Lcom/getjar/sdk/comm/Operation$Status;->CREATED:Lcom/getjar/sdk/comm/Operation$Status;

    iput-object v1, p0, Lcom/getjar/sdk/comm/Operation;->_state:Lcom/getjar/sdk/comm/Operation$Status;

    .line 119
    new-instance v1, Lcom/getjar/sdk/comm/Request;

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    move-object v7, p6

    invoke-direct/range {v1 .. v7}, Lcom/getjar/sdk/comm/Request;-><init>(Lcom/getjar/sdk/comm/Request$ServiceName;Ljava/lang/String;Ljava/net/URI;Lcom/getjar/sdk/comm/Request$HttpMethod;Ljava/util/Map;Ljava/util/Map;)V

    iput-object v1, p0, Lcom/getjar/sdk/comm/Operation;->_request:Lcom/getjar/sdk/comm/Request;

    .line 120
    return-void
.end method


# virtual methods
.method public cancel(Z)Z
    .locals 1
    .param p1, "mayInterruptIfRunning"    # Z

    .prologue
    .line 376
    invoke-static {}, Lcom/getjar/sdk/comm/CommManager;->getInstance()Lcom/getjar/sdk/comm/CommManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/getjar/sdk/comm/CommManager;->cancelRequest(Lcom/getjar/sdk/comm/Operation;)Z

    move-result v0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 2
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 354
    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'object\' can not be NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 355
    :cond_0
    instance-of v0, p1, Lcom/getjar/sdk/comm/Operation;

    if-nez v0, :cond_1

    const/4 v0, 0x0

    .line 356
    .end local p1    # "object":Ljava/lang/Object;
    :goto_0
    return v0

    .restart local p1    # "object":Ljava/lang/Object;
    :cond_1
    iget-object v0, p0, Lcom/getjar/sdk/comm/Operation;->_request:Lcom/getjar/sdk/comm/Request;

    check-cast p1, Lcom/getjar/sdk/comm/Operation;

    .end local p1    # "object":Ljava/lang/Object;
    iget-object v1, p1, Lcom/getjar/sdk/comm/Operation;->_request:Lcom/getjar/sdk/comm/Request;

    invoke-virtual {v0, v1}, Lcom/getjar/sdk/comm/Request;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0
.end method

.method public get()Lcom/getjar/sdk/comm/Result;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/ExecutionException;
        }
    .end annotation

    .prologue
    .line 382
    invoke-static {}, Lcom/getjar/sdk/comm/CommManager;->getInstance()Lcom/getjar/sdk/comm/CommManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/getjar/sdk/comm/CommManager;->waitOnOperation(Lcom/getjar/sdk/comm/Operation;)Lcom/getjar/sdk/comm/Result;

    move-result-object v0

    return-object v0
.end method

.method public get(JLjava/util/concurrent/TimeUnit;)Lcom/getjar/sdk/comm/Result;
    .locals 2
    .param p1, "timeout"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/ExecutionException;,
            Ljava/util/concurrent/TimeoutException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 389
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Not supported. Use get() instead."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public bridge synthetic get()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/ExecutionException;
        }
    .end annotation

    .prologue
    .line 24
    invoke-virtual {p0}, Lcom/getjar/sdk/comm/Operation;->get()Lcom/getjar/sdk/comm/Result;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # J
    .param p3, "x1"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/ExecutionException;,
            Ljava/util/concurrent/TimeoutException;
        }
    .end annotation

    .prologue
    .line 24
    invoke-virtual {p0, p1, p2, p3}, Lcom/getjar/sdk/comm/Operation;->get(JLjava/util/concurrent/TimeUnit;)Lcom/getjar/sdk/comm/Result;

    move-result-object v0

    return-object v0
.end method

.method public getAuthFlowId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 197
    iget-object v0, p0, Lcom/getjar/sdk/comm/Operation;->_authFlowId:Ljava/lang/String;

    return-object v0
.end method

.method public getCommContext()Lcom/getjar/sdk/comm/CommContext;
    .locals 1

    .prologue
    .line 188
    iget-object v0, p0, Lcom/getjar/sdk/comm/Operation;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    return-object v0
.end method

.method public getCreatedTimestamp()J
    .locals 2

    .prologue
    .line 162
    iget-wide v0, p0, Lcom/getjar/sdk/comm/Operation;->_createdTimestamp:J

    return-wide v0
.end method

.method public getException()Ljava/lang/Exception;
    .locals 1

    .prologue
    .line 203
    iget-object v0, p0, Lcom/getjar/sdk/comm/Operation;->_exception:Ljava/lang/Exception;

    return-object v0
.end method

.method protected getFuture()Ljava/util/concurrent/FutureTask;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/concurrent/FutureTask",
            "<",
            "Lcom/getjar/sdk/comm/Result;",
            ">;"
        }
    .end annotation

    .prologue
    .line 229
    iget-object v0, p0, Lcom/getjar/sdk/comm/Operation;->_future:Ljava/util/concurrent/FutureTask;

    return-object v0
.end method

.method public getId()I
    .locals 1

    .prologue
    .line 342
    iget-object v0, p0, Lcom/getjar/sdk/comm/Operation;->_request:Lcom/getjar/sdk/comm/Request;

    invoke-virtual {v0}, Lcom/getjar/sdk/comm/Request;->getId()I

    move-result v0

    return v0
.end method

.method public getLastPriorityPromotionTimestamp()J
    .locals 2

    .prologue
    .line 165
    iget-wide v0, p0, Lcom/getjar/sdk/comm/Operation;->_lastPriorityPromotionTimestamp:J

    return-wide v0
.end method

.method public getPriority()I
    .locals 1

    .prologue
    .line 159
    iget v0, p0, Lcom/getjar/sdk/comm/Operation;->_priority:I

    return v0
.end method

.method public getReauthThenRetryCount()I
    .locals 1

    .prologue
    .line 123
    iget v0, p0, Lcom/getjar/sdk/comm/Operation;->_reauthThenRetryCount:I

    return v0
.end method

.method public getRequest()Lcom/getjar/sdk/comm/Request;
    .locals 1

    .prologue
    .line 212
    iget-object v0, p0, Lcom/getjar/sdk/comm/Operation;->_request:Lcom/getjar/sdk/comm/Request;

    return-object v0
.end method

.method public getResult()Lcom/getjar/sdk/comm/Result;
    .locals 1

    .prologue
    .line 215
    iget-object v0, p0, Lcom/getjar/sdk/comm/Operation;->_result:Lcom/getjar/sdk/comm/Result;

    return-object v0
.end method

.method protected getRetryAfterCount()I
    .locals 1

    .prologue
    .line 182
    iget v0, p0, Lcom/getjar/sdk/comm/Operation;->_retryAfterCount:I

    return v0
.end method

.method protected getRetryAfterTimestamp()J
    .locals 2

    .prologue
    .line 168
    iget-wide v0, p0, Lcom/getjar/sdk/comm/Operation;->_retryAfterTimestamp:J

    return-wide v0
.end method

.method public getStartingPriority()Lcom/getjar/sdk/comm/Operation$Priority;
    .locals 1

    .prologue
    .line 156
    iget-object v0, p0, Lcom/getjar/sdk/comm/Operation;->_startingPriority:Lcom/getjar/sdk/comm/Operation$Priority;

    return-object v0
.end method

.method public getState()Lcom/getjar/sdk/comm/Operation$Status;
    .locals 1

    .prologue
    .line 147
    iget-object v0, p0, Lcom/getjar/sdk/comm/Operation;->_state:Lcom/getjar/sdk/comm/Operation$Status;

    return-object v0
.end method

.method public getSuppressInternalCallbacks()Z
    .locals 1

    .prologue
    .line 191
    iget-boolean v0, p0, Lcom/getjar/sdk/comm/Operation;->_suppressInternalCallbacks:Z

    return v0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 367
    iget-object v0, p0, Lcom/getjar/sdk/comm/Operation;->_request:Lcom/getjar/sdk/comm/Request;

    invoke-virtual {v0}, Lcom/getjar/sdk/comm/Request;->hashCode()I

    move-result v0

    return v0
.end method

.method public isAuthRelated()Z
    .locals 1

    .prologue
    .line 200
    iget-object v0, p0, Lcom/getjar/sdk/comm/Operation;->_authFlowId:Ljava/lang/String;

    invoke-static {v0}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isCancelled()Z
    .locals 2

    .prologue
    .line 401
    iget-object v0, p0, Lcom/getjar/sdk/comm/Operation;->_state:Lcom/getjar/sdk/comm/Operation$Status;

    sget-object v1, Lcom/getjar/sdk/comm/Operation$Status;->CANCELLED:Lcom/getjar/sdk/comm/Operation$Status;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isDoNotCache()Z
    .locals 1

    .prologue
    .line 194
    iget-boolean v0, p0, Lcom/getjar/sdk/comm/Operation;->_doNotCache:Z

    return v0
.end method

.method public isDone()Z
    .locals 2

    .prologue
    .line 395
    iget-object v0, p0, Lcom/getjar/sdk/comm/Operation;->_state:Lcom/getjar/sdk/comm/Operation$Status;

    sget-object v1, Lcom/getjar/sdk/comm/Operation$Status;->CANCELLED:Lcom/getjar/sdk/comm/Operation$Status;

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/getjar/sdk/comm/Operation;->_state:Lcom/getjar/sdk/comm/Operation$Status;

    sget-object v1, Lcom/getjar/sdk/comm/Operation$Status;->COMPLETED:Lcom/getjar/sdk/comm/Operation$Status;

    if-ne v0, v1, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isIdempotent()Z
    .locals 1

    .prologue
    .line 143
    iget-boolean v0, p0, Lcom/getjar/sdk/comm/Operation;->_isIdempotent:Z

    return v0
.end method

.method public mapResultToCallbacks(Lcom/getjar/sdk/comm/CallbackInterface;)V
    .locals 13
    .param p1, "legacyCallbacks"    # Lcom/getjar/sdk/comm/CallbackInterface;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/getjar/sdk/exceptions/ServiceException;,
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v10, 0x2

    const/4 v12, 0x1

    const/4 v11, 0x0

    .line 281
    const/4 v3, 0x0

    .line 282
    .local v3, "getExc":Ljava/lang/Exception;
    const/4 v5, 0x0

    .line 284
    .local v5, "result":Lcom/getjar/sdk/comm/Result;
    :try_start_0
    invoke-virtual {p0}, Lcom/getjar/sdk/comm/Operation;->get()Lcom/getjar/sdk/comm/Result;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v5

    .line 287
    :goto_0
    if-nez v5, :cond_1

    .line 290
    invoke-virtual {p0}, Lcom/getjar/sdk/comm/Operation;->getException()Ljava/lang/Exception;

    move-result-object v7

    if-eqz v7, :cond_0

    .line 291
    invoke-virtual {p0}, Lcom/getjar/sdk/comm/Operation;->getException()Ljava/lang/Exception;

    move-result-object v7

    invoke-virtual {p0}, Lcom/getjar/sdk/comm/Operation;->getId()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0}, Lcom/getjar/sdk/comm/Operation;->getCommContext()Lcom/getjar/sdk/comm/CommContext;

    move-result-object v9

    invoke-interface {p1, v5, v7, v8, v9}, Lcom/getjar/sdk/comm/CallbackInterface;->serviceRequestFailed(Lcom/getjar/sdk/comm/Result;Ljava/lang/Exception;Ljava/lang/String;Lcom/getjar/sdk/comm/CommContext;)V

    .line 332
    :goto_1
    return-void

    .line 285
    :catch_0
    move-exception v1

    .local v1, "e":Ljava/lang/Exception;
    move-object v3, v1

    goto :goto_0

    .line 293
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_0
    invoke-virtual {p0}, Lcom/getjar/sdk/comm/Operation;->getId()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0}, Lcom/getjar/sdk/comm/Operation;->getCommContext()Lcom/getjar/sdk/comm/CommContext;

    move-result-object v8

    invoke-interface {p1, v5, v3, v7, v8}, Lcom/getjar/sdk/comm/CallbackInterface;->serviceRequestFailed(Lcom/getjar/sdk/comm/Result;Ljava/lang/Exception;Ljava/lang/String;Lcom/getjar/sdk/comm/CommContext;)V

    goto :goto_1

    .line 297
    :cond_1
    invoke-static {p0}, Lcom/getjar/sdk/comm/StatisticsTracker;->logResponse(Lcom/getjar/sdk/comm/Operation;)V

    .line 298
    invoke-virtual {p0}, Lcom/getjar/sdk/comm/Operation;->isCancelled()Z

    move-result v7

    if-eqz v7, :cond_2

    .line 301
    invoke-virtual {p0}, Lcom/getjar/sdk/comm/Operation;->getId()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    .line 302
    .local v4, "requestId":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/getjar/sdk/comm/Operation;->getCommContext()Lcom/getjar/sdk/comm/CommContext;

    move-result-object v0

    .line 303
    .local v0, "commContext":Lcom/getjar/sdk/comm/CommContext;
    new-instance v7, Lcom/getjar/sdk/comm/RequestCancelledException;

    sget-object v8, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v9, "Request %1$s on CommContext %2$s was canceled"

    new-array v10, v10, [Ljava/lang/Object;

    aput-object v4, v10, v11

    aput-object v0, v10, v12

    invoke-static {v8, v9, v10}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Lcom/getjar/sdk/comm/RequestCancelledException;-><init>(Ljava/lang/String;)V

    invoke-interface {p1, v5, v7, v4, v0}, Lcom/getjar/sdk/comm/CallbackInterface;->serviceRequestFailed(Lcom/getjar/sdk/comm/Result;Ljava/lang/Exception;Ljava/lang/String;Lcom/getjar/sdk/comm/CommContext;)V

    goto :goto_1

    .line 311
    .end local v0    # "commContext":Lcom/getjar/sdk/comm/CommContext;
    .end local v4    # "requestId":Ljava/lang/String;
    :cond_2
    invoke-static {v5}, Lcom/getjar/sdk/comm/RequestUtilities;->getServicesException(Lcom/getjar/sdk/comm/Result;)Lcom/getjar/sdk/exceptions/ServiceException;

    move-result-object v6

    .line 312
    .local v6, "servicesException":Lcom/getjar/sdk/exceptions/ServiceException;
    if-eqz v6, :cond_3

    .line 313
    invoke-virtual {p0}, Lcom/getjar/sdk/comm/Operation;->getId()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0}, Lcom/getjar/sdk/comm/Operation;->getCommContext()Lcom/getjar/sdk/comm/CommContext;

    move-result-object v8

    invoke-interface {p1, v5, v6, v7, v8}, Lcom/getjar/sdk/comm/CallbackInterface;->serviceRequestFailed(Lcom/getjar/sdk/comm/Result;Ljava/lang/Exception;Ljava/lang/String;Lcom/getjar/sdk/comm/CommContext;)V

    goto :goto_1

    .line 317
    :cond_3
    invoke-virtual {v5}, Lcom/getjar/sdk/comm/Result;->isSuccessfulResponse()Z

    move-result v7

    if-nez v7, :cond_5

    .line 318
    sget-object v8, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v9, "Non-200 response from request [response code: %1$d] [response body: %2$s]"

    new-array v10, v10, [Ljava/lang/Object;

    invoke-virtual {v5}, Lcom/getjar/sdk/comm/Result;->getResponseCode()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v10, v11

    invoke-virtual {v5}, Lcom/getjar/sdk/comm/Result;->getResponseBody()Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_4

    invoke-virtual {v5}, Lcom/getjar/sdk/comm/Result;->getResponseBody()Ljava/lang/String;

    move-result-object v7

    :goto_2
    aput-object v7, v10, v12

    invoke-static {v8, v9, v10}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 322
    .local v2, "excMsg":Ljava/lang/String;
    new-instance v7, Ljava/lang/RuntimeException;

    invoke-direct {v7, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/getjar/sdk/comm/Operation;->getId()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0}, Lcom/getjar/sdk/comm/Operation;->getCommContext()Lcom/getjar/sdk/comm/CommContext;

    move-result-object v9

    invoke-interface {p1, v5, v7, v8, v9}, Lcom/getjar/sdk/comm/CallbackInterface;->serviceRequestFailed(Lcom/getjar/sdk/comm/Result;Ljava/lang/Exception;Ljava/lang/String;Lcom/getjar/sdk/comm/CommContext;)V

    goto/16 :goto_1

    .line 318
    .end local v2    # "excMsg":Ljava/lang/String;
    :cond_4
    const-string v7, ""

    goto :goto_2

    .line 326
    :cond_5
    invoke-virtual {p0}, Lcom/getjar/sdk/comm/Operation;->getId()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0}, Lcom/getjar/sdk/comm/Operation;->getCommContext()Lcom/getjar/sdk/comm/CommContext;

    move-result-object v8

    invoke-interface {p1, v5, v7, v8}, Lcom/getjar/sdk/comm/CallbackInterface;->serviceRequestSucceeded(Lcom/getjar/sdk/comm/Result;Ljava/lang/String;Lcom/getjar/sdk/comm/CommContext;)V

    goto/16 :goto_1
.end method

.method protected promotePriority()V
    .locals 12

    .prologue
    const/4 v11, 0x3

    const/4 v10, 0x2

    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 252
    iget v3, p0, Lcom/getjar/sdk/comm/Operation;->_priority:I

    if-gt v3, v1, :cond_1

    .line 272
    :cond_0
    :goto_0
    return-void

    .line 255
    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    iget-wide v5, p0, Lcom/getjar/sdk/comm/Operation;->_lastPriorityPromotionTimestamp:J

    sub-long/2addr v3, v5

    sget-wide v5, Lcom/getjar/sdk/comm/Operation;->_PriorityPromotionIntervalInMilliseconds:J

    cmp-long v3, v3, v5

    if-ltz v3, :cond_2

    move v0, v1

    .line 256
    .local v0, "promote":Z
    :goto_1
    if-eqz v0, :cond_0

    .line 259
    sget-object v3, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "Operation: promotePriority() BEFORE Promoting request %1$d [priority:%2$d lastPriorityPromotionTimestamp:%3$d]"

    new-array v7, v11, [Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/getjar/sdk/comm/Operation;->getId()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v2

    iget v8, p0, Lcom/getjar/sdk/comm/Operation;->_priority:I

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v1

    iget-wide v8, p0, Lcom/getjar/sdk/comm/Operation;->_lastPriorityPromotionTimestamp:J

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    aput-object v8, v7, v10

    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 264
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    iput-wide v3, p0, Lcom/getjar/sdk/comm/Operation;->_lastPriorityPromotionTimestamp:J

    .line 265
    iget v3, p0, Lcom/getjar/sdk/comm/Operation;->_priority:I

    add-int/lit8 v3, v3, -0x1

    iput v3, p0, Lcom/getjar/sdk/comm/Operation;->_priority:I

    .line 266
    sget-object v3, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "Operation: promotePriority() AFTER Promoted request %1$d [priority:%2$d lastPriorityPromotionTimestamp:%3$d]"

    new-array v7, v11, [Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/getjar/sdk/comm/Operation;->getId()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v2

    iget v2, p0, Lcom/getjar/sdk/comm/Operation;->_priority:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v7, v1

    iget-wide v1, p0, Lcom/getjar/sdk/comm/Operation;->_lastPriorityPromotionTimestamp:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    aput-object v1, v7, v10

    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v4, v1}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    goto :goto_0

    .end local v0    # "promote":Z
    :cond_2
    move v0, v2

    .line 255
    goto :goto_1
.end method

.method public setException(Ljava/lang/Exception;)V
    .locals 0
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 206
    iput-object p1, p0, Lcom/getjar/sdk/comm/Operation;->_exception:Ljava/lang/Exception;

    return-void
.end method

.method protected setFuture(Ljava/util/concurrent/FutureTask;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/FutureTask",
            "<",
            "Lcom/getjar/sdk/comm/Result;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 236
    .local p1, "future":Ljava/util/concurrent/FutureTask;, "Ljava/util/concurrent/FutureTask<Lcom/getjar/sdk/comm/Result;>;"
    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'future\' can not be NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 237
    :cond_0
    iput-object p1, p0, Lcom/getjar/sdk/comm/Operation;->_future:Ljava/util/concurrent/FutureTask;

    .line 238
    return-void
.end method

.method public setResult(Lcom/getjar/sdk/comm/Result;)V
    .locals 2
    .param p1, "result"    # Lcom/getjar/sdk/comm/Result;

    .prologue
    .line 219
    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'result\' can not be NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 220
    :cond_0
    iput-object p1, p0, Lcom/getjar/sdk/comm/Operation;->_result:Lcom/getjar/sdk/comm/Result;

    .line 221
    return-void
.end method

.method protected setState(Lcom/getjar/sdk/comm/Operation$Status;)V
    .locals 2
    .param p1, "state"    # Lcom/getjar/sdk/comm/Operation$Status;

    .prologue
    .line 151
    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'state\' can not be NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 152
    :cond_0
    iput-object p1, p0, Lcom/getjar/sdk/comm/Operation;->_state:Lcom/getjar/sdk/comm/Operation$Status;

    .line 153
    return-void
.end method

.method protected tickRetryAfterCount()V
    .locals 1

    .prologue
    .line 185
    iget v0, p0, Lcom/getjar/sdk/comm/Operation;->_retryAfterCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/getjar/sdk/comm/Operation;->_retryAfterCount:I

    return-void
.end method

.method protected updateRetryAfterTimestamp(J)V
    .locals 2
    .param p1, "retryAfterDeltaInMilliseconds"    # J

    .prologue
    .line 175
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    add-long/2addr v0, p1

    iput-wide v0, p0, Lcom/getjar/sdk/comm/Operation;->_retryAfterTimestamp:J

    .line 176
    return-void
.end method

.method public updateStateForRetryAfterReauth()V
    .locals 2

    .prologue
    .line 131
    iget v0, p0, Lcom/getjar/sdk/comm/Operation;->_reauthThenRetryCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/getjar/sdk/comm/Operation;->_reauthThenRetryCount:I

    .line 132
    sget-object v0, Lcom/getjar/sdk/comm/Operation$Status;->RETRYING:Lcom/getjar/sdk/comm/Operation$Status;

    invoke-virtual {p0, v0}, Lcom/getjar/sdk/comm/Operation;->setState(Lcom/getjar/sdk/comm/Operation$Status;)V

    .line 133
    iget v0, p0, Lcom/getjar/sdk/comm/Operation;->_priority:I

    sget-object v1, Lcom/getjar/sdk/comm/Operation$Priority;->HIGH:Lcom/getjar/sdk/comm/Operation$Priority;

    invoke-virtual {v1}, Lcom/getjar/sdk/comm/Operation$Priority;->getValue()I

    move-result v1

    if-gt v0, v1, :cond_0

    .line 134
    sget-object v0, Lcom/getjar/sdk/comm/Operation$Priority;->MEDIUM:Lcom/getjar/sdk/comm/Operation$Priority;

    invoke-virtual {v0}, Lcom/getjar/sdk/comm/Operation$Priority;->getValue()I

    move-result v0

    iput v0, p0, Lcom/getjar/sdk/comm/Operation;->_priority:I

    .line 136
    :cond_0
    return-void
.end method
