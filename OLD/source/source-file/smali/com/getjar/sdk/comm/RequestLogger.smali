.class public Lcom/getjar/sdk/comm/RequestLogger;
.super Ljava/lang/Object;
.source "RequestLogger.java"


# static fields
.field private static volatile _AccountsCount:Ljava/lang/Integer; = null

.field private static volatile _AccountsCountLock:Ljava/lang/Object; = null

.field private static _ConnectionTimeout:I = 0x0

.field private static final _ExecutorService:Ljava/util/concurrent/ThreadPoolExecutor;

.field private static final _MaxQueueSize:I = 0x64

.field private static _PrefesFileName:Ljava/lang/String;

.field private static _PrefsKeyInstallationId:Ljava/lang/String;

.field private static volatile _PrefsLock:Ljava/lang/Object;

.field private static _SocketTimeout:I


# instance fields
.field private _authFlowId:Ljava/lang/String;

.field private final _commContextId:Ljava/lang/String;

.field private final _context:Landroid/content/Context;

.field private _installationId:Ljava/lang/String;

.field private final _loggingEndPoint:Ljava/lang/String;

.field private final _requestId:J

.field private _sdkUserAgent:Ljava/lang/String;

.field private final _serviceEndPoint:Ljava/lang/String;

.field private _timestampBefore:Ljava/lang/Long;

.field private final _uniqueRequestId:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const v7, 0xea60

    const/4 v1, 0x1

    .line 50
    new-instance v0, Ljava/util/concurrent/ThreadPoolExecutor;

    const-wide/16 v3, 0x0

    sget-object v5, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    new-instance v6, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v6}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    move v2, v1

    invoke-direct/range {v0 .. v6}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;)V

    sput-object v0, Lcom/getjar/sdk/comm/RequestLogger;->_ExecutorService:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 55
    const/4 v0, 0x0

    sput-object v0, Lcom/getjar/sdk/comm/RequestLogger;->_AccountsCount:Ljava/lang/Integer;

    .line 56
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/getjar/sdk/comm/RequestLogger;->_AccountsCountLock:Ljava/lang/Object;

    .line 58
    const-string v0, "RequestLoggerPrefs"

    sput-object v0, Lcom/getjar/sdk/comm/RequestLogger;->_PrefesFileName:Ljava/lang/String;

    .line 59
    const-string v0, "installationId"

    sput-object v0, Lcom/getjar/sdk/comm/RequestLogger;->_PrefsKeyInstallationId:Ljava/lang/String;

    .line 60
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/getjar/sdk/comm/RequestLogger;->_PrefsLock:Ljava/lang/Object;

    .line 63
    sput v7, Lcom/getjar/sdk/comm/RequestLogger;->_ConnectionTimeout:I

    .line 65
    sput v7, Lcom/getjar/sdk/comm/RequestLogger;->_SocketTimeout:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;J)V
    .locals 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "loggingUrl"    # Ljava/lang/String;
    .param p3, "message"    # Ljava/lang/String;
    .param p4, "messageId"    # J

    .prologue
    .line 96
    const/4 v3, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v4, p3

    move-wide v5, p4

    invoke-direct/range {v0 .. v6}, Lcom/getjar/sdk/comm/RequestLogger;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V

    .line 97
    return-void
.end method

.method private constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "loggingUrl"    # Ljava/lang/String;
    .param p3, "commContextId"    # Ljava/lang/String;
    .param p4, "message"    # Ljava/lang/String;
    .param p5, "messageId"    # J

    .prologue
    const/4 v0, 0x0

    .line 99
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 74
    iput-object v0, p0, Lcom/getjar/sdk/comm/RequestLogger;->_authFlowId:Ljava/lang/String;

    .line 75
    iput-object v0, p0, Lcom/getjar/sdk/comm/RequestLogger;->_timestampBefore:Ljava/lang/Long;

    .line 76
    iput-object v0, p0, Lcom/getjar/sdk/comm/RequestLogger;->_installationId:Ljava/lang/String;

    .line 400
    iput-object v0, p0, Lcom/getjar/sdk/comm/RequestLogger;->_sdkUserAgent:Ljava/lang/String;

    .line 100
    iput-object p1, p0, Lcom/getjar/sdk/comm/RequestLogger;->_context:Landroid/content/Context;

    .line 101
    iput-object p4, p0, Lcom/getjar/sdk/comm/RequestLogger;->_serviceEndPoint:Ljava/lang/String;

    .line 102
    iput-wide p5, p0, Lcom/getjar/sdk/comm/RequestLogger;->_requestId:J

    .line 103
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/getjar/sdk/comm/RequestLogger;->_uniqueRequestId:Ljava/lang/String;

    .line 104
    iput-object p3, p0, Lcom/getjar/sdk/comm/RequestLogger;->_commContextId:Ljava/lang/String;

    .line 107
    invoke-direct {p0}, Lcom/getjar/sdk/comm/RequestLogger;->resolveAccountsCount()V

    .line 110
    invoke-direct {p0}, Lcom/getjar/sdk/comm/RequestLogger;->resolveInstallationID()V

    .line 113
    iput-object p2, p0, Lcom/getjar/sdk/comm/RequestLogger;->_loggingEndPoint:Ljava/lang/String;

    .line 114
    return-void
.end method

.method public constructor <init>(Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;J)V
    .locals 7
    .param p1, "commContext"    # Lcom/getjar/sdk/comm/CommContext;
    .param p2, "serviceEndPoint"    # Ljava/lang/String;
    .param p3, "requestId"    # J

    .prologue
    .line 86
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const/4 v0, 0x1

    invoke-static {p1, v0}, Lcom/getjar/sdk/comm/GetJarConfig;->getInstance(Lcom/getjar/sdk/comm/CommContext;Z)Lcom/getjar/sdk/comm/GetJarConfig;

    move-result-object v0

    const-string v2, "service.logging.endpoint"

    invoke-virtual {v0, v2}, Lcom/getjar/sdk/comm/GetJarConfig;->getDirectiveValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lcom/getjar/sdk/comm/CommContext;->getCommContextId()Ljava/lang/String;

    move-result-object v3

    move-object v0, p0

    move-object v4, p2

    move-wide v5, p3

    invoke-direct/range {v0 .. v6}, Lcom/getjar/sdk/comm/RequestLogger;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V

    .line 92
    return-void
.end method

.method public constructor <init>(Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;JLjava/lang/String;)V
    .locals 0
    .param p1, "commContext"    # Lcom/getjar/sdk/comm/CommContext;
    .param p2, "serviceEndPoint"    # Ljava/lang/String;
    .param p3, "requestId"    # J
    .param p5, "authFlowId"    # Ljava/lang/String;

    .prologue
    .line 80
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/getjar/sdk/comm/RequestLogger;-><init>(Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;J)V

    .line 81
    iput-object p5, p0, Lcom/getjar/sdk/comm/RequestLogger;->_authFlowId:Ljava/lang/String;

    .line 82
    return-void
.end method

.method static synthetic access$000(Lcom/getjar/sdk/comm/RequestLogger;Ljava/util/Map;)V
    .locals 0
    .param p0, "x0"    # Lcom/getjar/sdk/comm/RequestLogger;
    .param p1, "x1"    # Ljava/util/Map;

    .prologue
    .line 40
    invoke-direct {p0, p1}, Lcom/getjar/sdk/comm/RequestLogger;->addCommonArgs(Ljava/util/Map;)V

    return-void
.end method

.method static synthetic access$100(Lcom/getjar/sdk/comm/RequestLogger;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/getjar/sdk/comm/RequestLogger;

    .prologue
    .line 40
    iget-object v0, p0, Lcom/getjar/sdk/comm/RequestLogger;->_context:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$200(Lcom/getjar/sdk/comm/RequestLogger;Ljava/util/Map;)V
    .locals 0
    .param p0, "x0"    # Lcom/getjar/sdk/comm/RequestLogger;
    .param p1, "x1"    # Ljava/util/Map;

    .prologue
    .line 40
    invoke-direct {p0, p1}, Lcom/getjar/sdk/comm/RequestLogger;->pushLogMessage(Ljava/util/Map;)V

    return-void
.end method

.method static synthetic access$300(Lcom/getjar/sdk/comm/RequestLogger;)Ljava/lang/Long;
    .locals 1
    .param p0, "x0"    # Lcom/getjar/sdk/comm/RequestLogger;

    .prologue
    .line 40
    iget-object v0, p0, Lcom/getjar/sdk/comm/RequestLogger;->_timestampBefore:Ljava/lang/Long;

    return-object v0
.end method

.method private addCommonArgs(Ljava/util/Map;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 374
    .local p1, "logValues":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v0, "pid"

    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 375
    const-string v0, "uniqueRequestId"

    iget-object v1, p0, Lcom/getjar/sdk/comm/RequestLogger;->_uniqueRequestId:Ljava/lang/String;

    invoke-interface {p1, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 376
    const-string v0, "installationId"

    iget-object v1, p0, Lcom/getjar/sdk/comm/RequestLogger;->_installationId:Ljava/lang/String;

    invoke-interface {p1, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 377
    const-string v0, "requestId"

    iget-wide v1, p0, Lcom/getjar/sdk/comm/RequestLogger;->_requestId:J

    invoke-static {v1, v2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 378
    const-string v0, "packageName"

    iget-object v1, p0, Lcom/getjar/sdk/comm/RequestLogger;->_context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 380
    iget-object v0, p0, Lcom/getjar/sdk/comm/RequestLogger;->_commContextId:Ljava/lang/String;

    invoke-static {v0}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 381
    const-string v0, "contextId"

    iget-object v1, p0, Lcom/getjar/sdk/comm/RequestLogger;->_commContextId:Ljava/lang/String;

    invoke-interface {p1, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 383
    :cond_0
    iget-object v0, p0, Lcom/getjar/sdk/comm/RequestLogger;->_context:Landroid/content/Context;

    invoke-static {v0}, Lcom/getjar/sdk/comm/auth/AuthManager;->initialize(Landroid/content/Context;)V

    .line 384
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/getjar/sdk/comm/auth/AuthManager;->getUserAccessId()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 385
    const-string v0, "userAccessId"

    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/getjar/sdk/comm/auth/AuthManager;->getUserAccessId()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 387
    :cond_1
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/getjar/sdk/comm/auth/AuthManager;->getUserDeviceId()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 388
    const-string v0, "userDeviceId"

    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/getjar/sdk/comm/auth/AuthManager;->getUserDeviceId()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 391
    :cond_2
    const-string v0, "endPoint"

    iget-object v1, p0, Lcom/getjar/sdk/comm/RequestLogger;->_serviceEndPoint:Ljava/lang/String;

    invoke-interface {p1, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 392
    iget-object v0, p0, Lcom/getjar/sdk/comm/RequestLogger;->_authFlowId:Ljava/lang/String;

    invoke-static {v0}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 393
    const-string v0, "authFlowId"

    iget-object v1, p0, Lcom/getjar/sdk/comm/RequestLogger;->_authFlowId:Ljava/lang/String;

    invoke-interface {p1, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 396
    const-string v0, "accountsCount"

    sget-object v1, Lcom/getjar/sdk/comm/RequestLogger;->_AccountsCount:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 398
    :cond_3
    return-void
.end method

.method private getAndroidAccountsCount()I
    .locals 6

    .prologue
    .line 489
    :try_start_0
    iget-object v3, p0, Lcom/getjar/sdk/comm/RequestLogger;->_context:Landroid/content/Context;

    invoke-static {v3}, Landroid/accounts/AccountManager;->get(Landroid/content/Context;)Landroid/accounts/AccountManager;

    move-result-object v0

    .line 490
    .local v0, "accountManager":Landroid/accounts/AccountManager;
    const-string v3, "com.google"

    invoke-virtual {v0, v3}, Landroid/accounts/AccountManager;->getAccountsByType(Ljava/lang/String;)[Landroid/accounts/Account;

    move-result-object v1

    .line 491
    .local v1, "accounts":[Landroid/accounts/Account;
    array-length v3, v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 495
    .end local v0    # "accountManager":Landroid/accounts/AccountManager;
    .end local v1    # "accounts":[Landroid/accounts/Account;
    :goto_0
    return v3

    .line 492
    :catch_0
    move-exception v2

    .line 493
    .local v2, "e":Ljava/lang/Exception;
    sget-object v3, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    const-string v5, "RequestLogger: getAndroidAccounts() failed"

    invoke-static {v3, v4, v5, v2}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 495
    const/4 v3, 0x0

    goto :goto_0
.end method

.method private logRequestBefore(Lcom/getjar/sdk/comm/Operation;Ljava/lang/String;Ljava/lang/String;)V
    .locals 10
    .param p1, "operation"    # Lcom/getjar/sdk/comm/Operation;
    .param p2, "stackTrace"    # Ljava/lang/String;
    .param p3, "authState"    # Ljava/lang/String;

    .prologue
    const/16 v9, 0x64

    .line 218
    sget-object v0, Lcom/getjar/sdk/comm/RequestLogger;->_ExecutorService:Ljava/util/concurrent/ThreadPoolExecutor;

    invoke-virtual {v0}, Ljava/util/concurrent/ThreadPoolExecutor;->getActiveCount()I

    move-result v0

    if-le v0, v9, :cond_0

    .line 219
    sget-object v0, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "RequestLogger: queue of length %1$d exteeds max of %2$d"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    sget-object v8, Lcom/getjar/sdk/comm/RequestLogger;->_ExecutorService:Ljava/util/concurrent/ThreadPoolExecutor;

    invoke-virtual {v8}, Ljava/util/concurrent/ThreadPoolExecutor;->getActiveCount()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x1

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v0, v1, v4}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;)V

    .line 275
    :goto_0
    return-void

    .line 223
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    iput-object v0, p0, Lcom/getjar/sdk/comm/RequestLogger;->_timestampBefore:Ljava/lang/Long;

    .line 224
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->getId()J

    move-result-wide v2

    .line 227
    .local v2, "tid":J
    sget-object v7, Lcom/getjar/sdk/comm/RequestLogger;->_ExecutorService:Ljava/util/concurrent/ThreadPoolExecutor;

    new-instance v0, Lcom/getjar/sdk/comm/RequestLogger$2;

    move-object v1, p0

    move-object v4, p1

    move-object v5, p2

    move-object v6, p3

    invoke-direct/range {v0 .. v6}, Lcom/getjar/sdk/comm/RequestLogger$2;-><init>(Lcom/getjar/sdk/comm/RequestLogger;JLcom/getjar/sdk/comm/Operation;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v7, v0}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method private pushLogMessage(Ljava/util/Map;)V
    .locals 19
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 410
    .local p1, "logValues":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :try_start_0
    new-instance v10, Ljava/lang/StringBuilder;

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/getjar/sdk/comm/RequestLogger;->_loggingEndPoint:Ljava/lang/String;

    invoke-direct {v10, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 411
    .local v10, "url":Ljava/lang/StringBuilder;
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/getjar/sdk/comm/RequestLogger;->_loggingEndPoint:Ljava/lang/String;

    const-string v14, "?"

    invoke-virtual {v13, v14}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v13

    if-nez v13, :cond_0

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/getjar/sdk/comm/RequestLogger;->_loggingEndPoint:Ljava/lang/String;

    const-string v14, "&"

    invoke-virtual {v13, v14}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v13

    if-nez v13, :cond_0

    .line 412
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/getjar/sdk/comm/RequestLogger;->_loggingEndPoint:Ljava/lang/String;

    const-string v14, "?"

    invoke-virtual {v13, v14}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v13

    if-eqz v13, :cond_2

    .line 413
    const-string v13, "&"

    invoke-virtual {v10, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 420
    :cond_0
    :goto_0
    invoke-interface/range {p1 .. p1}, Ljava/util/Map;->size()I

    move-result v1

    .line 421
    .local v1, "argCount":I
    invoke-interface/range {p1 .. p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v13

    invoke-interface {v13}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .local v6, "i$":Ljava/util/Iterator;
    :cond_1
    :goto_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_3

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 422
    .local v7, "key":Ljava/lang/String;
    add-int/lit8 v1, v1, -0x1

    .line 423
    move-object/from16 v0, p1

    invoke-interface {v0, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    .line 424
    .local v12, "value":Ljava/lang/String;
    invoke-static {v7}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v13

    if-nez v13, :cond_1

    invoke-static {v12}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v13

    if-nez v13, :cond_1

    .line 425
    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 426
    const-string v13, "="

    invoke-virtual {v10, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 427
    const-string v13, "UTF-8"

    invoke-static {v12, v13}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v10, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 428
    if-lez v1, :cond_1

    .line 429
    const-string v13, "&"

    invoke-virtual {v10, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 458
    .end local v1    # "argCount":I
    .end local v6    # "i$":Ljava/util/Iterator;
    .end local v7    # "key":Ljava/lang/String;
    .end local v10    # "url":Ljava/lang/StringBuilder;
    .end local v12    # "value":Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 459
    .local v2, "e":Ljava/lang/Exception;
    sget-object v13, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v13}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v13

    const-string v15, "RequestLogger: failed"

    invoke-static {v13, v14, v15, v2}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 461
    .end local v2    # "e":Ljava/lang/Exception;
    :goto_2
    return-void

    .line 415
    .restart local v10    # "url":Ljava/lang/StringBuilder;
    :cond_2
    :try_start_1
    const-string v13, "?"

    invoke-virtual {v10, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 434
    .restart local v1    # "argCount":I
    .restart local v6    # "i$":Ljava/util/Iterator;
    :cond_3
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 435
    .local v9, "uriToUse":Ljava/lang/String;
    invoke-direct/range {p0 .. p0}, Lcom/getjar/sdk/comm/RequestLogger;->resolveUserAgent()Ljava/lang/String;

    move-result-object v11

    .line 436
    .local v11, "userAgentToUse":Ljava/lang/String;
    sget v13, Lcom/getjar/sdk/comm/RequestLogger;->_ConnectionTimeout:I

    sget v14, Lcom/getjar/sdk/comm/RequestLogger;->_SocketTimeout:I

    invoke-static {v11, v13, v14}, Lcom/getjar/sdk/comm/GetJarHttpClient;->newInstance(Ljava/lang/String;II)Lcom/getjar/sdk/comm/GetJarHttpClient;

    move-result-object v3

    .line 437
    .local v3, "httpClient":Lcom/getjar/sdk/comm/GetJarHttpClient;
    new-instance v4, Lorg/apache/http/client/methods/HttpGet;

    invoke-direct {v4, v9}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    .line 438
    .local v4, "httpRequest":Lorg/apache/http/client/methods/HttpGet;
    invoke-static {v4}, Lcom/getjar/sdk/comm/RequestUtilities;->debugDumpRequestProperties(Lorg/apache/http/client/methods/HttpRequestBase;)V

    .line 439
    invoke-virtual {v3, v4}, Lcom/getjar/sdk/comm/GetJarHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v5

    .line 440
    .local v5, "httpResponse":Lorg/apache/http/HttpResponse;
    if-nez v5, :cond_4

    .line 441
    sget-object v13, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v13}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v13

    sget-object v15, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v16, "RequestLogger: failed [URL:%1$s]"

    const/16 v17, 0x1

    move/from16 v0, v17

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    aput-object v9, v17, v18

    invoke-static/range {v15 .. v17}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v15

    invoke-static {v13, v14, v15}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;)V

    goto :goto_2

    .line 444
    :cond_4
    sget-object v13, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v13}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v13

    sget-object v15, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v16, "RequestLogger: logged [URL:%1$s]"

    const/16 v17, 0x1

    move/from16 v0, v17

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    aput-object v9, v17, v18

    invoke-static/range {v15 .. v17}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v15

    invoke-static {v13, v14, v15}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 448
    const/4 v8, 0x0

    .line 449
    .local v8, "responseCode":Ljava/lang/Integer;
    invoke-interface {v5}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v13

    if-eqz v13, :cond_5

    .line 450
    invoke-interface {v5}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v13

    invoke-interface {v13}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v13

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    .line 452
    :cond_5
    if-eqz v8, :cond_6

    .line 453
    sget-object v13, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v13}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v13

    sget-object v15, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v16, "RequestLogger: result code: %1$d"

    const/16 v17, 0x1

    move/from16 v0, v17

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    aput-object v8, v17, v18

    invoke-static/range {v15 .. v17}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v15

    invoke-static {v13, v14, v15}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    goto/16 :goto_2

    .line 455
    :cond_6
    sget-object v13, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v13}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v13

    const-string v15, "RequestLogger: failed to get result code"

    invoke-static {v13, v14, v15}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_2
.end method

.method private resolveAccountsCount()V
    .locals 2

    .prologue
    .line 117
    sget-object v0, Lcom/getjar/sdk/comm/RequestLogger;->_AccountsCount:Ljava/lang/Integer;

    if-nez v0, :cond_1

    .line 118
    sget-object v1, Lcom/getjar/sdk/comm/RequestLogger;->_AccountsCountLock:Ljava/lang/Object;

    monitor-enter v1

    .line 119
    :try_start_0
    sget-object v0, Lcom/getjar/sdk/comm/RequestLogger;->_AccountsCount:Ljava/lang/Integer;

    if-nez v0, :cond_0

    .line 120
    invoke-direct {p0}, Lcom/getjar/sdk/comm/RequestLogger;->getAndroidAccountsCount()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sput-object v0, Lcom/getjar/sdk/comm/RequestLogger;->_AccountsCount:Ljava/lang/Integer;

    .line 122
    :cond_0
    monitor-exit v1

    .line 124
    :cond_1
    return-void

    .line 122
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private resolveInstallationID()V
    .locals 10

    .prologue
    const/4 v9, 0x0

    .line 128
    :try_start_0
    iget-object v3, p0, Lcom/getjar/sdk/comm/RequestLogger;->_context:Landroid/content/Context;

    sget-object v4, Lcom/getjar/sdk/comm/RequestLogger;->_PrefesFileName:Ljava/lang/String;

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 129
    .local v2, "prefs":Landroid/content/SharedPreferences;
    sget-object v3, Lcom/getjar/sdk/comm/RequestLogger;->_PrefsKeyInstallationId:Ljava/lang/String;

    invoke-interface {v2, v3}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 130
    sget-object v4, Lcom/getjar/sdk/comm/RequestLogger;->_PrefsLock:Ljava/lang/Object;

    monitor-enter v4
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 131
    :try_start_1
    sget-object v3, Lcom/getjar/sdk/comm/RequestLogger;->_PrefsKeyInstallationId:Ljava/lang/String;

    invoke-interface {v2, v3}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 132
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/getjar/sdk/comm/RequestLogger;->_installationId:Ljava/lang/String;

    .line 133
    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 134
    .local v1, "edit":Landroid/content/SharedPreferences$Editor;
    sget-object v3, Lcom/getjar/sdk/comm/RequestLogger;->_PrefsKeyInstallationId:Ljava/lang/String;

    iget-object v5, p0, Lcom/getjar/sdk/comm/RequestLogger;->_installationId:Ljava/lang/String;

    invoke-interface {v1, v3, v5}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 135
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 137
    .end local v1    # "edit":Landroid/content/SharedPreferences$Editor;
    :cond_0
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 139
    :cond_1
    :try_start_2
    iget-object v3, p0, Lcom/getjar/sdk/comm/RequestLogger;->_installationId:Ljava/lang/String;

    invoke-static {v3}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 140
    sget-object v3, Lcom/getjar/sdk/comm/RequestLogger;->_PrefsKeyInstallationId:Ljava/lang/String;

    const-string v4, "failedToGetInstallationId"

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/getjar/sdk/comm/RequestLogger;->_installationId:Ljava/lang/String;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 148
    .end local v2    # "prefs":Landroid/content/SharedPreferences;
    :cond_2
    :goto_0
    sget-object v3, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "RequestLogger:_installation ID = \'%1$s\'"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    iget-object v8, p0, Lcom/getjar/sdk/comm/RequestLogger;->_installationId:Ljava/lang/String;

    aput-object v8, v7, v9

    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 149
    return-void

    .line 137
    .restart local v2    # "prefs":Landroid/content/SharedPreferences;
    :catchall_0
    move-exception v3

    :try_start_3
    monitor-exit v4
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    throw v3
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 142
    .end local v2    # "prefs":Landroid/content/SharedPreferences;
    :catch_0
    move-exception v0

    .line 143
    .local v0, "e":Ljava/lang/Exception;
    sget-object v3, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    const-string v5, "RequestLogger failed"

    invoke-static {v3, v4, v5, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 144
    iget-object v3, p0, Lcom/getjar/sdk/comm/RequestLogger;->_installationId:Ljava/lang/String;

    invoke-static {v3}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 145
    const-string v3, "failedToGetInstallationId"

    iput-object v3, p0, Lcom/getjar/sdk/comm/RequestLogger;->_installationId:Ljava/lang/String;

    goto :goto_0
.end method

.method private resolveUserAgent()Ljava/lang/String;
    .locals 5

    .prologue
    .line 469
    :try_start_0
    iget-object v2, p0, Lcom/getjar/sdk/comm/RequestLogger;->_sdkUserAgent:Ljava/lang/String;

    invoke-static {v2}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 470
    iget-object v2, p0, Lcom/getjar/sdk/comm/RequestLogger;->_sdkUserAgent:Ljava/lang/String;

    .line 482
    :goto_0
    return-object v2

    .line 472
    :cond_0
    iget-object v2, p0, Lcom/getjar/sdk/comm/RequestLogger;->_context:Landroid/content/Context;

    invoke-static {v2}, Lcom/getjar/sdk/comm/auth/ApplicationKeyDatabase;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/comm/auth/ApplicationKeyDatabase;

    move-result-object v2

    invoke-virtual {v2}, Lcom/getjar/sdk/comm/auth/ApplicationKeyDatabase;->getApplicationKey()Ljava/lang/String;

    move-result-object v0

    .line 473
    .local v0, "applicationKey":Ljava/lang/String;
    invoke-static {v0}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 474
    invoke-static {}, Lcom/getjar/sdk/comm/UserAgentValuesManager;->getInstance()Lcom/getjar/sdk/comm/UserAgentValuesManager;

    move-result-object v2

    iget-object v3, p0, Lcom/getjar/sdk/comm/RequestLogger;->_context:Landroid/content/Context;

    invoke-virtual {v2, v3, v0}, Lcom/getjar/sdk/comm/UserAgentValuesManager;->getSdkUserAgent(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/getjar/sdk/comm/RequestLogger;->_sdkUserAgent:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 479
    .end local v0    # "applicationKey":Ljava/lang/String;
    :cond_1
    :goto_1
    iget-object v2, p0, Lcom/getjar/sdk/comm/RequestLogger;->_sdkUserAgent:Ljava/lang/String;

    invoke-static {v2}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 480
    iget-object v2, p0, Lcom/getjar/sdk/comm/RequestLogger;->_sdkUserAgent:Ljava/lang/String;

    goto :goto_0

    .line 476
    :catch_0
    move-exception v1

    .line 477
    .local v1, "e":Ljava/lang/Exception;
    sget-object v2, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    const-string v4, "RequestLogger: resolveUserAgent() failed"

    invoke-static {v2, v3, v4, v1}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 482
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_2
    const-string v2, "UNRESOLVED"

    goto :goto_0
.end method


# virtual methods
.method public logAuthStateBefore(Ljava/lang/String;)V
    .locals 1
    .param p1, "authState"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 206
    invoke-direct {p0, v0, v0, p1}, Lcom/getjar/sdk/comm/RequestLogger;->logRequestBefore(Lcom/getjar/sdk/comm/Operation;Ljava/lang/String;Ljava/lang/String;)V

    .line 207
    return-void
.end method

.method public logAuthStateBeforeWithStack(Ljava/lang/String;)V
    .locals 2
    .param p1, "authState"    # Ljava/lang/String;

    .prologue
    .line 211
    const/4 v0, 0x0

    invoke-static {}, Lcom/getjar/sdk/logging/Logger;->getShortStack()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1, p1}, Lcom/getjar/sdk/comm/RequestLogger;->logRequestBefore(Lcom/getjar/sdk/comm/Operation;Ljava/lang/String;Ljava/lang/String;)V

    .line 212
    return-void
.end method

.method public logRequestAfter(Lcom/getjar/sdk/comm/Operation;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Exception;II)V
    .locals 8
    .param p1, "operation"    # Lcom/getjar/sdk/comm/Operation;
    .param p2, "responseCode"    # Ljava/lang/Integer;
    .param p3, "executionTime"    # Ljava/lang/Integer;
    .param p4, "exception"    # Ljava/lang/Exception;
    .param p5, "reauthCount"    # I
    .param p6, "exceptionCount"    # I

    .prologue
    .line 285
    const/4 v7, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move v5, p5

    move v6, p6

    invoke-virtual/range {v0 .. v7}, Lcom/getjar/sdk/comm/RequestLogger;->logRequestAfter(Lcom/getjar/sdk/comm/Operation;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Exception;IILjava/lang/String;)V

    .line 286
    return-void
.end method

.method public logRequestAfter(Lcom/getjar/sdk/comm/Operation;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Exception;IILjava/lang/String;)V
    .locals 17
    .param p1, "operation"    # Lcom/getjar/sdk/comm/Operation;
    .param p2, "responseCode"    # Ljava/lang/Integer;
    .param p3, "executionTime"    # Ljava/lang/Integer;
    .param p4, "exception"    # Ljava/lang/Exception;
    .param p5, "reauthCount"    # I
    .param p6, "exceptionCount"    # I
    .param p7, "authState"    # Ljava/lang/String;

    .prologue
    .line 305
    sget-object v1, Lcom/getjar/sdk/comm/RequestLogger;->_ExecutorService:Ljava/util/concurrent/ThreadPoolExecutor;

    invoke-virtual {v1}, Ljava/util/concurrent/ThreadPoolExecutor;->getActiveCount()I

    move-result v1

    const/16 v2, 0x64

    if-le v1, v2, :cond_0

    .line 306
    sget-object v1, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "RequestLogger: queue of length %1$d exceeds max of %2$d"

    const/4 v9, 0x2

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v12, 0x0

    sget-object v13, Lcom/getjar/sdk/comm/RequestLogger;->_ExecutorService:Ljava/util/concurrent/ThreadPoolExecutor;

    invoke-virtual {v13}, Ljava/util/concurrent/ThreadPoolExecutor;->getActiveCount()I

    move-result v13

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    aput-object v13, v9, v12

    const/4 v12, 0x1

    const/16 v13, 0x64

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    aput-object v13, v9, v12

    invoke-static {v5, v6, v9}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v1, v2, v5}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;)V

    .line 370
    :goto_0
    return-void

    .line 310
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    .line 311
    .local v3, "timestamp":J
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/getjar/sdk/comm/RequestLogger;->_timestampBefore:Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    sub-long v10, v3, v1

    .line 312
    .local v10, "delta":J
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->getId()J

    move-result-wide v7

    .line 315
    .local v7, "tid":J
    sget-object v16, Lcom/getjar/sdk/comm/RequestLogger;->_ExecutorService:Ljava/util/concurrent/ThreadPoolExecutor;

    new-instance v1, Lcom/getjar/sdk/comm/RequestLogger$3;

    move-object/from16 v2, p0

    move/from16 v5, p5

    move/from16 v6, p6

    move-object/from16 v9, p1

    move-object/from16 v12, p2

    move-object/from16 v13, p3

    move-object/from16 v14, p4

    move-object/from16 v15, p7

    invoke-direct/range {v1 .. v15}, Lcom/getjar/sdk/comm/RequestLogger$3;-><init>(Lcom/getjar/sdk/comm/RequestLogger;JIIJLcom/getjar/sdk/comm/Operation;JLjava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Exception;Ljava/lang/String;)V

    move-object/from16 v0, v16

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method public logRequestBefore()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 201
    invoke-static {}, Lcom/getjar/sdk/logging/Logger;->getShortStack()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v1, v0, v1}, Lcom/getjar/sdk/comm/RequestLogger;->logRequestBefore(Lcom/getjar/sdk/comm/Operation;Ljava/lang/String;Ljava/lang/String;)V

    .line 202
    return-void
.end method

.method public logRequestBefore(Lcom/getjar/sdk/comm/Operation;)V
    .locals 1
    .param p1, "operation"    # Lcom/getjar/sdk/comm/Operation;

    .prologue
    const/4 v0, 0x0

    .line 196
    invoke-direct {p0, p1, v0, v0}, Lcom/getjar/sdk/comm/RequestLogger;->logRequestBefore(Lcom/getjar/sdk/comm/Operation;Ljava/lang/String;Ljava/lang/String;)V

    .line 197
    return-void
.end method

.method public logRewardsWallShow()V
    .locals 12

    .prologue
    const/16 v11, 0x64

    .line 155
    sget-object v0, Lcom/getjar/sdk/comm/RequestLogger;->_ExecutorService:Ljava/util/concurrent/ThreadPoolExecutor;

    invoke-virtual {v0}, Ljava/util/concurrent/ThreadPoolExecutor;->getActiveCount()I

    move-result v0

    if-le v0, v11, :cond_0

    .line 156
    sget-object v0, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v6, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v7, "RequestLogger: queue of length %1$d exteeds max of %2$d"

    const/4 v8, 0x2

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    sget-object v10, Lcom/getjar/sdk/comm/RequestLogger;->_ExecutorService:Ljava/util/concurrent/ThreadPoolExecutor;

    invoke-virtual {v10}, Ljava/util/concurrent/ThreadPoolExecutor;->getActiveCount()I

    move-result v10

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v8, v9

    const/4 v9, 0x1

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-static {v6, v7, v8}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v0, v1, v6}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;)V

    .line 192
    :goto_0
    return-void

    .line 160
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 161
    .local v2, "timestamp":J
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->getId()J

    move-result-wide v4

    .line 164
    .local v4, "tid":J
    sget-object v6, Lcom/getjar/sdk/comm/RequestLogger;->_ExecutorService:Ljava/util/concurrent/ThreadPoolExecutor;

    new-instance v0, Lcom/getjar/sdk/comm/RequestLogger$1;

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/getjar/sdk/comm/RequestLogger$1;-><init>(Lcom/getjar/sdk/comm/RequestLogger;JJ)V

    invoke-virtual {v6, v0}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    goto :goto_0
.end method
