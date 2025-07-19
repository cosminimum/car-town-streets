.class public Lcom/getjar/sdk/comm/CommContext;
.super Ljava/lang/Object;
.source "CommContext.java"


# static fields
.field private static final _ResponseOrderOfPrecedence:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Class",
            "<+",
            "Lcom/getjar/sdk/response/Response;",
            ">;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private _appEncryptionKeyIndex:Ljava/lang/String;

.field private _appEncryptionPublicKey:Ljava/security/PublicKey;

.field private final _applicationContext:Landroid/content/Context;

.field private final _applicationKey:Ljava/lang/String;

.field private final _commContextId:Ljava/lang/String;

.field private _commFailureCallbackInterfaceList:Ljava/util/concurrent/ConcurrentLinkedQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentLinkedQueue",
            "<",
            "Lcom/getjar/sdk/comm/CommFailureCallbackInterface;",
            ">;"
        }
    .end annotation
.end field

.field private final _developerResultReceiver:Landroid/os/ResultReceiver;

.field private final _deviceMetadata:Lcom/getjar/sdk/data/DeviceMetadata;

.field private _epochToException:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap",
            "<",
            "Ljava/lang/Long;",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation
.end field

.field private _internalResultReceiver:Landroid/os/ResultReceiver;

.field private volatile _lastUpdated:J

.field private _pulledResponse:Lcom/getjar/sdk/response/Response;

.field private volatile _pulledResponseLock:Ljava/lang/Object;

.field private final _reAuthLock:Ljava/lang/Object;

.field private final _sdkUserAgent:Ljava/lang/String;

.field private _webKitUserAgent:Ljava/lang/String;

.field private nonces:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private signatures:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 43
    new-instance v0, Lcom/getjar/sdk/comm/CommContext$1;

    invoke-direct {v0}, Lcom/getjar/sdk/comm/CommContext$1;-><init>()V

    sput-object v0, Lcom/getjar/sdk/comm/CommContext;->_ResponseOrderOfPrecedence:Ljava/util/Map;

    return-void
.end method

.method protected constructor <init>(Ljava/lang/String;Landroid/content/Context;Landroid/os/ResultReceiver;)V
    .locals 3
    .param p1, "applicationKey"    # Ljava/lang/String;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "resultReceiver"    # Landroid/os/ResultReceiver;

    .prologue
    .line 146
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lcom/getjar/sdk/comm/CommContext;->_epochToException:Ljava/util/concurrent/ConcurrentHashMap;

    .line 56
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/getjar/sdk/comm/CommContext;->_pulledResponseLock:Ljava/lang/Object;

    .line 57
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/getjar/sdk/comm/CommContext;->_pulledResponse:Lcom/getjar/sdk/response/Response;

    .line 125
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/getjar/sdk/comm/CommContext;->nonces:Ljava/util/HashMap;

    .line 126
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/getjar/sdk/comm/CommContext;->signatures:Ljava/util/HashMap;

    .line 128
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/getjar/sdk/comm/CommContext;->_reAuthLock:Ljava/lang/Object;

    .line 325
    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    iput-object v0, p0, Lcom/getjar/sdk/comm/CommContext;->_commFailureCallbackInterfaceList:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 149
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'applicationKey\' can not be NULL or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 150
    :cond_0
    if-nez p2, :cond_1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'context\' can not be NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 152
    :cond_1
    iput-object p3, p0, Lcom/getjar/sdk/comm/CommContext;->_developerResultReceiver:Landroid/os/ResultReceiver;

    .line 153
    iput-object p1, p0, Lcom/getjar/sdk/comm/CommContext;->_applicationKey:Ljava/lang/String;

    .line 154
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/getjar/sdk/comm/CommContext;->_commContextId:Ljava/lang/String;

    .line 155
    sget-object v0, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    const-string v2, "CommContext: creating DeviceMetadata instance"

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 156
    new-instance v0, Lcom/getjar/sdk/data/DeviceMetadata;

    invoke-direct {v0, p2}, Lcom/getjar/sdk/data/DeviceMetadata;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/getjar/sdk/comm/CommContext;->_deviceMetadata:Lcom/getjar/sdk/data/DeviceMetadata;

    .line 157
    invoke-virtual {p2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/getjar/sdk/comm/CommContext;->_applicationContext:Landroid/content/Context;

    .line 158
    sget-object v0, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    const-string v2, "CommContext: calling UserAgentValuesManager.getSdkUserAgent()"

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 159
    invoke-static {}, Lcom/getjar/sdk/comm/UserAgentValuesManager;->getInstance()Lcom/getjar/sdk/comm/UserAgentValuesManager;

    move-result-object v0

    invoke-virtual {v0, p2, p1}, Lcom/getjar/sdk/comm/UserAgentValuesManager;->getSdkUserAgent(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/getjar/sdk/comm/CommContext;->_sdkUserAgent:Ljava/lang/String;

    .line 160
    invoke-virtual {p0}, Lcom/getjar/sdk/comm/CommContext;->updateLastUpdated()V

    .line 161
    return-void
.end method

.method protected constructor <init>(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;Landroid/os/ResultReceiver;)V
    .locals 4
    .param p1, "applicationKey"    # Ljava/lang/String;
    .param p2, "appEncryptionPublicKey"    # Ljava/lang/String;
    .param p3, "context"    # Landroid/content/Context;
    .param p4, "resultReceiver"    # Landroid/os/ResultReceiver;

    .prologue
    const/4 v3, 0x4

    .line 183
    invoke-direct {p0, p1, p3, p4}, Lcom/getjar/sdk/comm/CommContext;-><init>(Ljava/lang/String;Landroid/content/Context;Landroid/os/ResultReceiver;)V

    .line 185
    invoke-static {p2}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "appEncryptionPublicKey cannot be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 186
    :cond_0
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v2, 0x5

    if-ge v1, v2, :cond_1

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Invalid \'appEncryptionPublicKey\'"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 188
    :cond_1
    const/4 v1, 0x0

    invoke-virtual {p2, v1, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/getjar/sdk/comm/CommContext;->_appEncryptionKeyIndex:Ljava/lang/String;

    .line 190
    const/4 v1, 0x4

    :try_start_0
    invoke-virtual {p2, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/getjar/sdk/utilities/Base64;->decode(Ljava/lang/String;)[B

    move-result-object v1

    invoke-static {v1}, Lcom/getjar/sdk/utilities/Security;->generatePublicKey([B)Ljava/security/PublicKey;

    move-result-object v1

    iput-object v1, p0, Lcom/getjar/sdk/comm/CommContext;->_appEncryptionPublicKey:Ljava/security/PublicKey;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 194
    return-void

    .line 191
    :catch_0
    move-exception v0

    .line 192
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lcom/getjar/sdk/exceptions/SigningException;

    const-string v2, "Invalid appEncryptionPublicKey"

    invoke-direct {v1, v2}, Lcom/getjar/sdk/exceptions/SigningException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private static asSortedList(Ljava/util/Collection;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Ljava/lang/Comparable",
            "<-TT;>;>(",
            "Ljava/util/Collection",
            "<TT;>;)",
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 432
    .local p0, "c":Ljava/util/Collection;, "Ljava/util/Collection<TT;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 433
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<TT;>;"
    invoke-static {v0}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 434
    return-object v0
.end method

.method private setResponse(Lcom/getjar/sdk/response/Response;)V
    .locals 10
    .param p1, "response"    # Lcom/getjar/sdk/response/Response;

    .prologue
    .line 294
    if-nez p1, :cond_0

    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "\'response\' can not be NULL"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 295
    :cond_0
    iget-object v3, p0, Lcom/getjar/sdk/comm/CommContext;->_pulledResponseLock:Ljava/lang/Object;

    monitor-enter v3

    .line 297
    :try_start_0
    iget-object v2, p0, Lcom/getjar/sdk/comm/CommContext;->_pulledResponse:Lcom/getjar/sdk/response/Response;

    if-nez v2, :cond_2

    .line 300
    iput-object p1, p0, Lcom/getjar/sdk/comm/CommContext;->_pulledResponse:Lcom/getjar/sdk/response/Response;

    .line 301
    sget-object v2, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "Current response updated to %1$s"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    iget-object v9, p0, Lcom/getjar/sdk/comm/CommContext;->_pulledResponse:Lcom/getjar/sdk/response/Response;

    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-static {v2, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v4, v5, v2}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 320
    :cond_1
    :goto_0
    monitor-exit v3

    .line 321
    return-void

    .line 305
    :cond_2
    sget-object v2, Lcom/getjar/sdk/comm/CommContext;->_ResponseOrderOfPrecedence:Ljava/util/Map;

    iget-object v4, p0, Lcom/getjar/sdk/comm/CommContext;->_pulledResponse:Lcom/getjar/sdk/response/Response;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-interface {v2, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 306
    .local v0, "currentResponseRank":I
    sget-object v2, Lcom/getjar/sdk/comm/CommContext;->_ResponseOrderOfPrecedence:Ljava/util/Map;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-interface {v2, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 307
    .local v1, "newResponseRank":I
    sget-object v2, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "setResponse() called [currentResponse:%1$d:%2$s] [newResponse:%3$d:%4$s]"

    const/4 v7, 0x4

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v7, v8

    const/4 v8, 0x1

    iget-object v9, p0, Lcom/getjar/sdk/comm/CommContext;->_pulledResponse:Lcom/getjar/sdk/response/Response;

    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v7, v8

    const/4 v8, 0x2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v7, v8

    const/4 v8, 0x3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-static {v2, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v4, v5, v2}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 315
    if-ge v1, v0, :cond_1

    .line 316
    iput-object p1, p0, Lcom/getjar/sdk/comm/CommContext;->_pulledResponse:Lcom/getjar/sdk/response/Response;

    .line 317
    sget-object v2, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "Current response updated to %1$s"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    iget-object v9, p0, Lcom/getjar/sdk/comm/CommContext;->_pulledResponse:Lcom/getjar/sdk/response/Response;

    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-static {v2, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v4, v5, v2}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    goto/16 :goto_0

    .line 320
    .end local v0    # "currentResponseRank":I
    .end local v1    # "newResponseRank":I
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method


# virtual methods
.method public addException(Ljava/lang/Throwable;)V
    .locals 3
    .param p1, "exc"    # Ljava/lang/Throwable;

    .prologue
    .line 439
    iget-object v0, p0, Lcom/getjar/sdk/comm/CommContext;->_epochToException:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 440
    return-void
.end method

.method protected clearExceptions()V
    .locals 1

    .prologue
    .line 387
    iget-object v0, p0, Lcom/getjar/sdk/comm/CommContext;->_epochToException:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->clear()V

    .line 388
    return-void
.end method

.method public clearResponse()V
    .locals 3

    .prologue
    .line 392
    iget-object v1, p0, Lcom/getjar/sdk/comm/CommContext;->_pulledResponseLock:Ljava/lang/Object;

    monitor-enter v1

    .line 393
    const/4 v0, 0x0

    :try_start_0
    iput-object v0, p0, Lcom/getjar/sdk/comm/CommContext;->_pulledResponse:Lcom/getjar/sdk/response/Response;

    .line 394
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 395
    sget-object v0, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    const-string v2, "Current response cleared"

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 396
    return-void

    .line 394
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public getAppEncryptionKeyIndex()Ljava/lang/String;
    .locals 1

    .prologue
    .line 199
    iget-object v0, p0, Lcom/getjar/sdk/comm/CommContext;->_appEncryptionKeyIndex:Ljava/lang/String;

    return-object v0
.end method

.method public getAppEncryptionPublicKey()Ljava/security/PublicKey;
    .locals 1

    .prologue
    .line 202
    iget-object v0, p0, Lcom/getjar/sdk/comm/CommContext;->_appEncryptionPublicKey:Ljava/security/PublicKey;

    return-object v0
.end method

.method public getApplicationContext()Landroid/content/Context;
    .locals 1

    .prologue
    .line 259
    iget-object v0, p0, Lcom/getjar/sdk/comm/CommContext;->_applicationContext:Landroid/content/Context;

    return-object v0
.end method

.method protected getApplicationKey()Ljava/lang/String;
    .locals 1

    .prologue
    .line 224
    iget-object v0, p0, Lcom/getjar/sdk/comm/CommContext;->_applicationKey:Ljava/lang/String;

    return-object v0
.end method

.method public getCommContextId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 256
    iget-object v0, p0, Lcom/getjar/sdk/comm/CommContext;->_commContextId:Ljava/lang/String;

    return-object v0
.end method

.method public getDeviceMetadata()Lcom/getjar/sdk/data/DeviceMetadata;
    .locals 1

    .prologue
    .line 212
    iget-object v0, p0, Lcom/getjar/sdk/comm/CommContext;->_deviceMetadata:Lcom/getjar/sdk/data/DeviceMetadata;

    return-object v0
.end method

.method protected getDeviceMetadataJson()Ljava/lang/String;
    .locals 2

    .prologue
    .line 240
    :try_start_0
    iget-object v1, p0, Lcom/getjar/sdk/comm/CommContext;->_deviceMetadata:Lcom/getjar/sdk/data/DeviceMetadata;

    invoke-virtual {v1}, Lcom/getjar/sdk/data/DeviceMetadata;->toJsonString()Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 241
    :catch_0
    move-exception v0

    .line 242
    .local v0, "e":Lorg/json/JSONException;
    new-instance v1, Lcom/getjar/sdk/exceptions/CommunicationException;

    invoke-direct {v1, v0}, Lcom/getjar/sdk/exceptions/CommunicationException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method protected getDeviceMetadataJsonWithReliabilities()Ljava/lang/String;
    .locals 2

    .prologue
    .line 249
    :try_start_0
    iget-object v1, p0, Lcom/getjar/sdk/comm/CommContext;->_deviceMetadata:Lcom/getjar/sdk/data/DeviceMetadata;

    invoke-virtual {v1}, Lcom/getjar/sdk/data/DeviceMetadata;->toJsonStringWithReliabilities()Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 250
    :catch_0
    move-exception v0

    .line 251
    .local v0, "e":Lorg/json/JSONException;
    new-instance v1, Lcom/getjar/sdk/exceptions/CommunicationException;

    invoke-direct {v1, v0}, Lcom/getjar/sdk/exceptions/CommunicationException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public getDeviceMetadataValues()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 215
    iget-object v0, p0, Lcom/getjar/sdk/comm/CommContext;->_deviceMetadata:Lcom/getjar/sdk/data/DeviceMetadata;

    invoke-virtual {v0}, Lcom/getjar/sdk/data/DeviceMetadata;->getMetadata()Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public getExceptions()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Long;",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation

    .prologue
    .line 267
    iget-object v0, p0, Lcom/getjar/sdk/comm/CommContext;->_epochToException:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method protected getLastUpdated()J
    .locals 2

    .prologue
    .line 221
    iget-wide v0, p0, Lcom/getjar/sdk/comm/CommContext;->_lastUpdated:J

    return-wide v0
.end method

.method public getMostRecentException()Ljava/lang/Throwable;
    .locals 3

    .prologue
    .line 423
    invoke-virtual {p0}, Lcom/getjar/sdk/comm/CommContext;->getExceptions()Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Map;->size()I

    move-result v1

    if-lez v1, :cond_0

    .line 424
    invoke-virtual {p0}, Lcom/getjar/sdk/comm/CommContext;->getExceptions()Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-static {v1}, Lcom/getjar/sdk/comm/CommContext;->asSortedList(Ljava/util/Collection;)Ljava/util/List;

    move-result-object v0

    .line 425
    .local v0, "sortedKeys":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Long;>;"
    invoke-virtual {p0}, Lcom/getjar/sdk/comm/CommContext;->getExceptions()Ljava/util/Map;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Throwable;

    .line 427
    .end local v0    # "sortedKeys":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Long;>;"
    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getReAuthLock()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 209
    iget-object v0, p0, Lcom/getjar/sdk/comm/CommContext;->_reAuthLock:Ljava/lang/Object;

    return-object v0
.end method

.method public getResponse()Lcom/getjar/sdk/response/Response;
    .locals 1

    .prologue
    .line 276
    iget-object v0, p0, Lcom/getjar/sdk/comm/CommContext;->_pulledResponse:Lcom/getjar/sdk/response/Response;

    return-object v0
.end method

.method public getSdkUserAgent()Ljava/lang/String;
    .locals 1

    .prologue
    .line 227
    iget-object v0, p0, Lcom/getjar/sdk/comm/CommContext;->_sdkUserAgent:Ljava/lang/String;

    return-object v0
.end method

.method public getWebKitUserAgent()Ljava/lang/String;
    .locals 2

    .prologue
    .line 231
    iget-object v0, p0, Lcom/getjar/sdk/comm/CommContext;->_webKitUserAgent:Ljava/lang/String;

    invoke-static {v0}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 232
    invoke-static {}, Lcom/getjar/sdk/comm/UserAgentValuesManager;->getInstance()Lcom/getjar/sdk/comm/UserAgentValuesManager;

    move-result-object v0

    iget-object v1, p0, Lcom/getjar/sdk/comm/CommContext;->_applicationContext:Landroid/content/Context;

    invoke-virtual {v0, v1}, Lcom/getjar/sdk/comm/UserAgentValuesManager;->getWebKitUserAgent(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/getjar/sdk/comm/CommContext;->_webKitUserAgent:Ljava/lang/String;

    .line 234
    :cond_0
    iget-object v0, p0, Lcom/getjar/sdk/comm/CommContext;->_webKitUserAgent:Ljava/lang/String;

    return-object v0
.end method

.method public makeAuthorizationFailureCallbacks(Ljava/lang/String;)V
    .locals 11
    .param p1, "subcode"    # Ljava/lang/String;

    .prologue
    .line 374
    sget-object v3, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "makeAuthorizationFailureCallbacks() with %1$d call-back interfaces registered [from %2$s]"

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    iget-object v9, p0, Lcom/getjar/sdk/comm/CommContext;->_commFailureCallbackInterfaceList:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v9}, Ljava/util/concurrent/ConcurrentLinkedQueue;->size()I

    move-result v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v7, v8

    const/4 v8, 0x1

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v9

    const/4 v10, 0x3

    aget-object v9, v9, v10

    invoke-virtual {v9}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 378
    iget-object v3, p0, Lcom/getjar/sdk/comm/CommContext;->_commFailureCallbackInterfaceList:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v3}, Ljava/util/concurrent/ConcurrentLinkedQueue;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/getjar/sdk/comm/CommFailureCallbackInterface;

    .line 380
    .local v0, "callback":Lcom/getjar/sdk/comm/CommFailureCallbackInterface;
    :try_start_0
    invoke-interface {v0, p1}, Lcom/getjar/sdk/comm/CommFailureCallbackInterface;->authorizationFailure(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 381
    :catch_0
    move-exception v1

    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 383
    .end local v0    # "callback":Lcom/getjar/sdk/comm/CommFailureCallbackInterface;
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_0
    return-void
.end method

.method public makeNetworkFailureCallbacks()V
    .locals 11

    .prologue
    .line 358
    sget-object v3, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "makeNetworkFailureCallbacks() with %1$d call-back interfaces registered [from %2$s]"

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    iget-object v9, p0, Lcom/getjar/sdk/comm/CommContext;->_commFailureCallbackInterfaceList:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v9}, Ljava/util/concurrent/ConcurrentLinkedQueue;->size()I

    move-result v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v7, v8

    const/4 v8, 0x1

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v9

    const/4 v10, 0x3

    aget-object v9, v9, v10

    invoke-virtual {v9}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 362
    iget-object v3, p0, Lcom/getjar/sdk/comm/CommContext;->_commFailureCallbackInterfaceList:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v3}, Ljava/util/concurrent/ConcurrentLinkedQueue;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/getjar/sdk/comm/CommFailureCallbackInterface;

    .line 364
    .local v0, "callback":Lcom/getjar/sdk/comm/CommFailureCallbackInterface;
    :try_start_0
    invoke-interface {v0}, Lcom/getjar/sdk/comm/CommFailureCallbackInterface;->networkFailure()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 365
    :catch_0
    move-exception v1

    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 367
    .end local v0    # "callback":Lcom/getjar/sdk/comm/CommFailureCallbackInterface;
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_0
    return-void
.end method

.method public makeServiceFailureCallbacks(Lcom/getjar/sdk/comm/Result;)V
    .locals 11
    .param p1, "result"    # Lcom/getjar/sdk/comm/Result;

    .prologue
    .line 342
    sget-object v3, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "makeServiceFailureCallbacks() with %1$d call-back interfaces registered [from %2$s]"

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    iget-object v9, p0, Lcom/getjar/sdk/comm/CommContext;->_commFailureCallbackInterfaceList:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v9}, Ljava/util/concurrent/ConcurrentLinkedQueue;->size()I

    move-result v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v7, v8

    const/4 v8, 0x1

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v9

    const/4 v10, 0x3

    aget-object v9, v9, v10

    invoke-virtual {v9}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 346
    iget-object v3, p0, Lcom/getjar/sdk/comm/CommContext;->_commFailureCallbackInterfaceList:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v3}, Ljava/util/concurrent/ConcurrentLinkedQueue;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/getjar/sdk/comm/CommFailureCallbackInterface;

    .line 348
    .local v0, "callback":Lcom/getjar/sdk/comm/CommFailureCallbackInterface;
    :try_start_0
    invoke-interface {v0, p1}, Lcom/getjar/sdk/comm/CommFailureCallbackInterface;->serviceFailure(Lcom/getjar/sdk/comm/Result;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 349
    :catch_0
    move-exception v1

    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 351
    .end local v0    # "callback":Lcom/getjar/sdk/comm/CommFailureCallbackInterface;
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_0
    return-void
.end method

.method public postResponse(Lcom/getjar/sdk/response/Response;)V
    .locals 3
    .param p1, "response"    # Lcom/getjar/sdk/response/Response;

    .prologue
    const/4 v2, 0x0

    .line 406
    invoke-direct {p0, p1}, Lcom/getjar/sdk/comm/CommContext;->setResponse(Lcom/getjar/sdk/response/Response;)V

    .line 409
    iget-object v1, p0, Lcom/getjar/sdk/comm/CommContext;->_developerResultReceiver:Landroid/os/ResultReceiver;

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/getjar/sdk/comm/CommContext;->_internalResultReceiver:Landroid/os/ResultReceiver;

    if-eqz v1, :cond_2

    .line 410
    :cond_0
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 411
    .local v0, "serializedResponse":Landroid/os/Bundle;
    const-string v1, "response"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 412
    iget-object v1, p0, Lcom/getjar/sdk/comm/CommContext;->_developerResultReceiver:Landroid/os/ResultReceiver;

    if-eqz v1, :cond_1

    .line 413
    iget-object v1, p0, Lcom/getjar/sdk/comm/CommContext;->_developerResultReceiver:Landroid/os/ResultReceiver;

    invoke-virtual {v1, v2, v0}, Landroid/os/ResultReceiver;->send(ILandroid/os/Bundle;)V

    .line 415
    :cond_1
    iget-object v1, p0, Lcom/getjar/sdk/comm/CommContext;->_internalResultReceiver:Landroid/os/ResultReceiver;

    if-eqz v1, :cond_2

    .line 416
    iget-object v1, p0, Lcom/getjar/sdk/comm/CommContext;->_internalResultReceiver:Landroid/os/ResultReceiver;

    invoke-virtual {v1, v2, v0}, Landroid/os/ResultReceiver;->send(ILandroid/os/Bundle;)V

    .line 419
    .end local v0    # "serializedResponse":Landroid/os/Bundle;
    :cond_2
    return-void
.end method

.method public putNonce(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "hashKey"    # Ljava/lang/String;
    .param p2, "nonce"    # Ljava/lang/String;

    .prologue
    .line 89
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "hashKey cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 90
    :cond_0
    invoke-static {p2}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "nonce cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 92
    :cond_1
    iget-object v0, p0, Lcom/getjar/sdk/comm/CommContext;->nonces:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 93
    return-void
.end method

.method public putSignature(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "hashKey"    # Ljava/lang/String;
    .param p2, "signature"    # Ljava/lang/String;

    .prologue
    .line 100
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "hashKey cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 101
    :cond_0
    invoke-static {p2}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "signature cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 103
    :cond_1
    iget-object v0, p0, Lcom/getjar/sdk/comm/CommContext;->signatures:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 104
    return-void
.end method

.method public registerFailureCallback(Lcom/getjar/sdk/comm/CommFailureCallbackInterface;)V
    .locals 1
    .param p1, "callbackInterface"    # Lcom/getjar/sdk/comm/CommFailureCallbackInterface;

    .prologue
    .line 332
    iget-object v0, p0, Lcom/getjar/sdk/comm/CommContext;->_commFailureCallbackInterfaceList:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 333
    iget-object v0, p0, Lcom/getjar/sdk/comm/CommContext;->_commFailureCallbackInterfaceList:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->add(Ljava/lang/Object;)Z

    .line 335
    :cond_0
    return-void
.end method

.method public removeNonce(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "hashKey"    # Ljava/lang/String;

    .prologue
    .line 78
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "hashKey cannot be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 79
    :cond_0
    iget-object v1, p0, Lcom/getjar/sdk/comm/CommContext;->nonces:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 80
    .local v0, "nonce":Ljava/lang/String;
    iget-object v1, p0, Lcom/getjar/sdk/comm/CommContext;->nonces:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 81
    return-object v0
.end method

.method public removeSignature(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "hashKey"    # Ljava/lang/String;

    .prologue
    .line 114
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "hashKey cannot be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 116
    :cond_0
    iget-object v1, p0, Lcom/getjar/sdk/comm/CommContext;->signatures:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 117
    .local v0, "signature":Ljava/lang/String;
    iget-object v1, p0, Lcom/getjar/sdk/comm/CommContext;->signatures:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 118
    return-object v0
.end method

.method public setInternalResultReceiver(Landroid/os/ResultReceiver;)V
    .locals 0
    .param p1, "internalResultReceiver"    # Landroid/os/ResultReceiver;

    .prologue
    .line 284
    iput-object p1, p0, Lcom/getjar/sdk/comm/CommContext;->_internalResultReceiver:Landroid/os/ResultReceiver;

    .line 285
    return-void
.end method

.method protected updateLastUpdated()V
    .locals 2

    .prologue
    .line 443
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/getjar/sdk/comm/CommContext;->_lastUpdated:J

    return-void
.end method
