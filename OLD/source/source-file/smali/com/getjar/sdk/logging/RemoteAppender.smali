.class Lcom/getjar/sdk/logging/RemoteAppender;
.super Lcom/getjar/sdk/logging/AppenderBase;
.source "RemoteAppender.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/getjar/sdk/logging/RemoteAppender$1;,
        Lcom/getjar/sdk/logging/RemoteAppender$RemoteLoggingThread;,
        Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;
    }
.end annotation


# static fields
.field private static _ConfigurationLock:Ljava/lang/Object; = null

.field private static _ConnectionTimeout:I = 0x0

.field private static final _ExecutorService:Ljava/util/concurrent/ThreadPoolExecutor;

.field private static _Instance:Lcom/getjar/sdk/logging/RemoteAppender; = null

.field private static _InstanceLock:Ljava/lang/Object; = null

.field private static final _MaxExecutorServiceQueueSize:I = 0x64

.field private static _SocketTimeout:I


# instance fields
.field private volatile _approximateBufferSize:I

.field private _context:Landroid/content/Context;

.field private _logBuffer:Ljava/util/concurrent/ConcurrentLinkedQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentLinkedQueue",
            "<",
            "Lcom/getjar/sdk/logging/LogMessage;",
            ">;"
        }
    .end annotation
.end field

.field private _loggingEndPoint:Ljava/lang/String;

.field private _maxBatchCount:I

.field private _maxWaitIntervalInMilliseconds:J

.field private volatile _remoteLoggingThread:Lcom/getjar/sdk/logging/RemoteAppender$RemoteLoggingThread;

.field private volatile _requestThreadExit:Z

.field private _sdkUserAgent:Ljava/lang/String;

.field private final _startStopLock:Ljava/lang/Object;

.field private volatile _threadState:Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;

.field private final _waitMonitor:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const v7, 0xea60

    const/4 v1, 0x1

    .line 44
    const/4 v0, 0x0

    sput-object v0, Lcom/getjar/sdk/logging/RemoteAppender;->_Instance:Lcom/getjar/sdk/logging/RemoteAppender;

    .line 45
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/getjar/sdk/logging/RemoteAppender;->_InstanceLock:Ljava/lang/Object;

    .line 74
    new-instance v0, Ljava/util/concurrent/ThreadPoolExecutor;

    const-wide/16 v3, 0x0

    sget-object v5, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    new-instance v6, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v6}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    move v2, v1

    invoke-direct/range {v0 .. v6}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;)V

    sput-object v0, Lcom/getjar/sdk/logging/RemoteAppender;->_ExecutorService:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 80
    sput v7, Lcom/getjar/sdk/logging/RemoteAppender;->_ConnectionTimeout:I

    .line 82
    sput v7, Lcom/getjar/sdk/logging/RemoteAppender;->_SocketTimeout:I

    .line 99
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/getjar/sdk/logging/RemoteAppender;->_ConfigurationLock:Ljava/lang/Object;

    return-void
.end method

.method private constructor <init>()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x0

    .line 42
    const/4 v0, 0x6

    sget-object v1, Lcom/getjar/sdk/logging/Area;->ALL:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    invoke-direct {p0, v4, v0, v1, v2}, Lcom/getjar/sdk/logging/AppenderBase;-><init>(ZIJ)V

    .line 84
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/getjar/sdk/logging/RemoteAppender;->_waitMonitor:Ljava/lang/Object;

    .line 85
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/getjar/sdk/logging/RemoteAppender;->_startStopLock:Ljava/lang/Object;

    .line 86
    iput-boolean v4, p0, Lcom/getjar/sdk/logging/RemoteAppender;->_requestThreadExit:Z

    .line 87
    sget-object v0, Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;->STOPPED:Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;

    iput-object v0, p0, Lcom/getjar/sdk/logging/RemoteAppender;->_threadState:Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;

    .line 88
    iput-object v3, p0, Lcom/getjar/sdk/logging/RemoteAppender;->_remoteLoggingThread:Lcom/getjar/sdk/logging/RemoteAppender$RemoteLoggingThread;

    .line 91
    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    iput-object v0, p0, Lcom/getjar/sdk/logging/RemoteAppender;->_logBuffer:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 92
    iput v4, p0, Lcom/getjar/sdk/logging/RemoteAppender;->_approximateBufferSize:I

    .line 94
    const/16 v0, 0x64

    iput v0, p0, Lcom/getjar/sdk/logging/RemoteAppender;->_maxBatchCount:I

    .line 95
    const-wide/32 v0, 0xea60

    iput-wide v0, p0, Lcom/getjar/sdk/logging/RemoteAppender;->_maxWaitIntervalInMilliseconds:J

    .line 96
    iput-object v3, p0, Lcom/getjar/sdk/logging/RemoteAppender;->_context:Landroid/content/Context;

    .line 97
    iput-object v3, p0, Lcom/getjar/sdk/logging/RemoteAppender;->_sdkUserAgent:Ljava/lang/String;

    .line 98
    iput-object v3, p0, Lcom/getjar/sdk/logging/RemoteAppender;->_loggingEndPoint:Ljava/lang/String;

    .line 43
    return-void
.end method

.method static synthetic access$102(Lcom/getjar/sdk/logging/RemoteAppender;Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;)Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;
    .locals 0
    .param p0, "x0"    # Lcom/getjar/sdk/logging/RemoteAppender;
    .param p1, "x1"    # Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;

    .prologue
    .line 36
    iput-object p1, p0, Lcom/getjar/sdk/logging/RemoteAppender;->_threadState:Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;

    return-object p1
.end method

.method static synthetic access$200(Lcom/getjar/sdk/logging/RemoteAppender;)Z
    .locals 1
    .param p0, "x0"    # Lcom/getjar/sdk/logging/RemoteAppender;

    .prologue
    .line 36
    iget-boolean v0, p0, Lcom/getjar/sdk/logging/RemoteAppender;->_requestThreadExit:Z

    return v0
.end method

.method static synthetic access$300(Lcom/getjar/sdk/logging/RemoteAppender;)I
    .locals 1
    .param p0, "x0"    # Lcom/getjar/sdk/logging/RemoteAppender;

    .prologue
    .line 36
    iget v0, p0, Lcom/getjar/sdk/logging/RemoteAppender;->_approximateBufferSize:I

    return v0
.end method

.method static synthetic access$302(Lcom/getjar/sdk/logging/RemoteAppender;I)I
    .locals 0
    .param p0, "x0"    # Lcom/getjar/sdk/logging/RemoteAppender;
    .param p1, "x1"    # I

    .prologue
    .line 36
    iput p1, p0, Lcom/getjar/sdk/logging/RemoteAppender;->_approximateBufferSize:I

    return p1
.end method

.method static synthetic access$310(Lcom/getjar/sdk/logging/RemoteAppender;)I
    .locals 2
    .param p0, "x0"    # Lcom/getjar/sdk/logging/RemoteAppender;

    .prologue
    .line 36
    iget v0, p0, Lcom/getjar/sdk/logging/RemoteAppender;->_approximateBufferSize:I

    add-int/lit8 v1, v0, -0x1

    iput v1, p0, Lcom/getjar/sdk/logging/RemoteAppender;->_approximateBufferSize:I

    return v0
.end method

.method static synthetic access$400(Lcom/getjar/sdk/logging/RemoteAppender;)Ljava/util/concurrent/ConcurrentLinkedQueue;
    .locals 1
    .param p0, "x0"    # Lcom/getjar/sdk/logging/RemoteAppender;

    .prologue
    .line 36
    iget-object v0, p0, Lcom/getjar/sdk/logging/RemoteAppender;->_logBuffer:Ljava/util/concurrent/ConcurrentLinkedQueue;

    return-object v0
.end method

.method static synthetic access$500()Ljava/util/concurrent/ThreadPoolExecutor;
    .locals 1

    .prologue
    .line 36
    sget-object v0, Lcom/getjar/sdk/logging/RemoteAppender;->_ExecutorService:Ljava/util/concurrent/ThreadPoolExecutor;

    return-object v0
.end method

.method static synthetic access$600(Lcom/getjar/sdk/logging/RemoteAppender;Ljava/util/List;)V
    .locals 0
    .param p0, "x0"    # Lcom/getjar/sdk/logging/RemoteAppender;
    .param p1, "x1"    # Ljava/util/List;

    .prologue
    .line 36
    invoke-direct {p0, p1}, Lcom/getjar/sdk/logging/RemoteAppender;->pushLogMessage(Ljava/util/List;)V

    return-void
.end method

.method static synthetic access$700(Lcom/getjar/sdk/logging/RemoteAppender;)Ljava/lang/Object;
    .locals 1
    .param p0, "x0"    # Lcom/getjar/sdk/logging/RemoteAppender;

    .prologue
    .line 36
    iget-object v0, p0, Lcom/getjar/sdk/logging/RemoteAppender;->_waitMonitor:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$800(Lcom/getjar/sdk/logging/RemoteAppender;)J
    .locals 2
    .param p0, "x0"    # Lcom/getjar/sdk/logging/RemoteAppender;

    .prologue
    .line 36
    iget-wide v0, p0, Lcom/getjar/sdk/logging/RemoteAppender;->_maxWaitIntervalInMilliseconds:J

    return-wide v0
.end method

.method protected static getInstance()Lcom/getjar/sdk/logging/RemoteAppender;
    .locals 2

    .prologue
    .line 47
    sget-object v0, Lcom/getjar/sdk/logging/RemoteAppender;->_Instance:Lcom/getjar/sdk/logging/RemoteAppender;

    if-nez v0, :cond_1

    .line 48
    sget-object v1, Lcom/getjar/sdk/logging/RemoteAppender;->_InstanceLock:Ljava/lang/Object;

    monitor-enter v1

    .line 49
    :try_start_0
    sget-object v0, Lcom/getjar/sdk/logging/RemoteAppender;->_Instance:Lcom/getjar/sdk/logging/RemoteAppender;

    if-nez v0, :cond_0

    .line 50
    new-instance v0, Lcom/getjar/sdk/logging/RemoteAppender;

    invoke-direct {v0}, Lcom/getjar/sdk/logging/RemoteAppender;-><init>()V

    sput-object v0, Lcom/getjar/sdk/logging/RemoteAppender;->_Instance:Lcom/getjar/sdk/logging/RemoteAppender;

    .line 52
    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 54
    :cond_1
    sget-object v0, Lcom/getjar/sdk/logging/RemoteAppender;->_Instance:Lcom/getjar/sdk/logging/RemoteAppender;

    return-object v0

    .line 52
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method private pushLogMessage(Ljava/util/List;)V
    .locals 23
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/getjar/sdk/logging/LogMessage;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 301
    .local p1, "messagesToSend":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/logging/LogMessage;>;"
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/Thread;->getId()J

    move-result-wide v14

    .line 303
    .local v14, "tid":J
    const/16 v16, 0x3

    :try_start_0
    sget-object v17, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v18, "RemoteAppender: pushLogMessage() starting [thread:%1$d]"

    const/16 v19, 0x1

    move/from16 v0, v19

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v21

    aput-object v21, v19, v20

    invoke-static/range {v17 .. v19}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, p0

    move/from16 v1, v16

    move-object/from16 v2, v17

    invoke-virtual {v0, v1, v2}, Lcom/getjar/sdk/logging/RemoteAppender;->logInternal(ILjava/lang/String;)V

    .line 306
    if-eqz p1, :cond_0

    invoke-interface/range {p1 .. p1}, Ljava/util/List;->size()I

    move-result v16

    if-gtz v16, :cond_1

    :cond_0
    new-instance v16, Ljava/lang/IllegalArgumentException;

    const-string v17, "\'messagesToSend\' cannot be NULL or empty"

    invoke-direct/range {v16 .. v17}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v16
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 365
    :catch_0
    move-exception v3

    .line 366
    .local v3, "e":Ljava/lang/Exception;
    const/16 v16, 0x6

    :try_start_1
    sget-object v17, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v18, "RemoteAppender: pushLogMessage() failed [thread:%1$d]"

    const/16 v19, 0x1

    move/from16 v0, v19

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v21

    aput-object v21, v19, v20

    invoke-static/range {v17 .. v19}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, p0

    move/from16 v1, v16

    move-object/from16 v2, v17

    invoke-virtual {v0, v1, v2, v3}, Lcom/getjar/sdk/logging/RemoteAppender;->logInternal(ILjava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 368
    const/16 v16, 0x3

    sget-object v17, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v18, "RemoteAppender: pushLogMessage() finished [thread:%1$d]"

    const/16 v19, 0x1

    move/from16 v0, v19

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v21

    aput-object v21, v19, v20

    invoke-static/range {v17 .. v19}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, p0

    move/from16 v1, v16

    move-object/from16 v2, v17

    invoke-virtual {v0, v1, v2}, Lcom/getjar/sdk/logging/RemoteAppender;->logInternal(ILjava/lang/String;)V

    .line 370
    .end local v3    # "e":Ljava/lang/Exception;
    :goto_0
    return-void

    .line 309
    :cond_1
    :try_start_2
    invoke-virtual/range {p0 .. p0}, Lcom/getjar/sdk/logging/RemoteAppender;->isEnabled()Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result v16

    if-nez v16, :cond_2

    .line 368
    const/16 v16, 0x3

    sget-object v17, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v18, "RemoteAppender: pushLogMessage() finished [thread:%1$d]"

    const/16 v19, 0x1

    move/from16 v0, v19

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v21

    aput-object v21, v19, v20

    invoke-static/range {v17 .. v19}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, p0

    move/from16 v1, v16

    move-object/from16 v2, v17

    invoke-virtual {v0, v1, v2}, Lcom/getjar/sdk/logging/RemoteAppender;->logInternal(ILjava/lang/String;)V

    goto :goto_0

    .line 312
    :cond_2
    :try_start_3
    new-instance v10, Lorg/json/JSONObject;

    invoke-direct {v10}, Lorg/json/JSONObject;-><init>()V

    .line 313
    .local v10, "jsonRoot":Lorg/json/JSONObject;
    new-instance v9, Lorg/json/JSONArray;

    invoke-direct {v9}, Lorg/json/JSONArray;-><init>()V

    .line 314
    .local v9, "jsonMessages":Lorg/json/JSONArray;
    const-string v16, "message_count"

    invoke-interface/range {p1 .. p1}, Ljava/util/List;->size()I

    move-result v17

    move-object/from16 v0, v16

    move/from16 v1, v17

    invoke-virtual {v10, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 315
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .local v7, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v16

    if-eqz v16, :cond_4

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/getjar/sdk/logging/LogMessage;

    .line 316
    .local v11, "msg":Lcom/getjar/sdk/logging/LogMessage;
    new-instance v8, Lorg/json/JSONObject;

    invoke-direct {v8}, Lorg/json/JSONObject;-><init>()V

    .line 317
    .local v8, "jsonMessage":Lorg/json/JSONObject;
    const-string v16, "level"

    invoke-virtual {v11}, Lcom/getjar/sdk/logging/LogMessage;->getLevel()I

    move-result v17

    move-object/from16 v0, v16

    move/from16 v1, v17

    invoke-virtual {v8, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 318
    const-string v16, "areas"

    invoke-virtual {v11}, Lcom/getjar/sdk/logging/LogMessage;->getAreas()J

    move-result-wide v17

    move-object/from16 v0, v16

    move-wide/from16 v1, v17

    invoke-virtual {v8, v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 319
    const-string v16, "time"

    invoke-virtual {v11}, Lcom/getjar/sdk/logging/LogMessage;->getTimestamp()J

    move-result-wide v17

    move-object/from16 v0, v16

    move-wide/from16 v1, v17

    invoke-virtual {v8, v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 320
    const-string v16, "text"

    invoke-virtual {v11}, Lcom/getjar/sdk/logging/LogMessage;->getMessage()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    invoke-virtual {v8, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 321
    invoke-virtual {v11}, Lcom/getjar/sdk/logging/LogMessage;->getThrowable()Ljava/lang/Throwable;

    move-result-object v16

    if-eqz v16, :cond_3

    .line 322
    const-string v16, "exception"

    invoke-virtual {v11}, Lcom/getjar/sdk/logging/LogMessage;->getThrowable()Ljava/lang/Throwable;

    move-result-object v17

    invoke-static/range {v17 .. v17}, Lcom/getjar/sdk/logging/Logger;->getThrowableDump(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    invoke-virtual {v8, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 324
    :cond_3
    invoke-virtual {v9, v8}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_1

    .line 368
    .end local v7    # "i$":Ljava/util/Iterator;
    .end local v8    # "jsonMessage":Lorg/json/JSONObject;
    .end local v9    # "jsonMessages":Lorg/json/JSONArray;
    .end local v10    # "jsonRoot":Lorg/json/JSONObject;
    .end local v11    # "msg":Lcom/getjar/sdk/logging/LogMessage;
    :catchall_0
    move-exception v16

    const/16 v17, 0x3

    sget-object v18, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v19, "RemoteAppender: pushLogMessage() finished [thread:%1$d]"

    const/16 v20, 0x1

    move/from16 v0, v20

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v22

    aput-object v22, v20, v21

    invoke-static/range {v18 .. v20}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, p0

    move/from16 v1, v17

    move-object/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lcom/getjar/sdk/logging/RemoteAppender;->logInternal(ILjava/lang/String;)V

    throw v16

    .line 326
    .restart local v7    # "i$":Ljava/util/Iterator;
    .restart local v9    # "jsonMessages":Lorg/json/JSONArray;
    .restart local v10    # "jsonRoot":Lorg/json/JSONObject;
    :cond_4
    :try_start_4
    const-string v16, "messages"

    move-object/from16 v0, v16

    invoke-virtual {v10, v0, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 327
    invoke-virtual {v10}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v12

    .line 330
    .local v12, "postDataBlob":Ljava/lang/String;
    invoke-direct/range {p0 .. p0}, Lcom/getjar/sdk/logging/RemoteAppender;->resolveUserAgent()Ljava/lang/String;

    move-result-object v16

    sget v17, Lcom/getjar/sdk/logging/RemoteAppender;->_ConnectionTimeout:I

    sget v18, Lcom/getjar/sdk/logging/RemoteAppender;->_SocketTimeout:I

    invoke-static/range {v16 .. v18}, Lcom/getjar/sdk/comm/GetJarHttpClient;->newInstance(Ljava/lang/String;II)Lcom/getjar/sdk/comm/GetJarHttpClient;

    move-result-object v4

    .line 331
    .local v4, "httpClient":Lcom/getjar/sdk/comm/GetJarHttpClient;
    new-instance v5, Lorg/apache/http/client/methods/HttpPost;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getjar/sdk/logging/RemoteAppender;->_loggingEndPoint:Ljava/lang/String;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-direct {v5, v0}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .line 332
    .local v5, "httpRequest":Lorg/apache/http/client/methods/HttpPost;
    const-string v16, "Content-Language"

    const-string v17, "en-US"

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    invoke-virtual {v5, v0, v1}, Lorg/apache/http/client/methods/HttpPost;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 333
    const-string v16, "Content-Type"

    const-string v17, "application/x-www-form-urlencoded"

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    invoke-virtual {v5, v0, v1}, Lorg/apache/http/client/methods/HttpPost;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 334
    const-string v16, "Cache-Control"

    const-string v17, "no-transform"

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    invoke-virtual {v5, v0, v1}, Lorg/apache/http/client/methods/HttpPost;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 335
    new-instance v16, Lorg/apache/http/entity/StringEntity;

    move-object/from16 v0, v16

    invoke-direct {v0, v12}, Lorg/apache/http/entity/StringEntity;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v16

    invoke-virtual {v5, v0}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 339
    const/16 v16, 0x2

    sget-object v17, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v18, "RemoteAppender: pushLogMessage() sending messages [URL:%1$s] [thread:%2$d] [message_count:%2$d]"

    const/16 v19, 0x3

    move/from16 v0, v19

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getjar/sdk/logging/RemoteAppender;->_loggingEndPoint:Ljava/lang/String;

    move-object/from16 v21, v0

    aput-object v21, v19, v20

    const/16 v20, 0x1

    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v21

    aput-object v21, v19, v20

    const/16 v20, 0x2

    invoke-interface/range {p1 .. p1}, Ljava/util/List;->size()I

    move-result v21

    invoke-static/range {v21 .. v21}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v21

    aput-object v21, v19, v20

    invoke-static/range {v17 .. v19}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, p0

    move/from16 v1, v16

    move-object/from16 v2, v17

    invoke-virtual {v0, v1, v2}, Lcom/getjar/sdk/logging/RemoteAppender;->logInternal(ILjava/lang/String;)V

    .line 346
    invoke-virtual {v4, v5}, Lcom/getjar/sdk/comm/GetJarHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v6

    .line 347
    .local v6, "httpResponse":Lorg/apache/http/HttpResponse;
    if-nez v6, :cond_5

    .line 348
    const/16 v16, 0x5

    sget-object v17, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v18, "RemoteAppender: pushLogMessage() failed [URL:%1$s] [thread:%2$d]"

    const/16 v19, 0x2

    move/from16 v0, v19

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getjar/sdk/logging/RemoteAppender;->_loggingEndPoint:Ljava/lang/String;

    move-object/from16 v21, v0

    aput-object v21, v19, v20

    const/16 v20, 0x1

    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v21

    aput-object v21, v19, v20

    invoke-static/range {v17 .. v19}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, p0

    move/from16 v1, v16

    move-object/from16 v2, v17

    invoke-virtual {v0, v1, v2}, Lcom/getjar/sdk/logging/RemoteAppender;->logInternal(ILjava/lang/String;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 368
    const/16 v16, 0x3

    sget-object v17, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v18, "RemoteAppender: pushLogMessage() finished [thread:%1$d]"

    const/16 v19, 0x1

    move/from16 v0, v19

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v21

    aput-object v21, v19, v20

    invoke-static/range {v17 .. v19}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, p0

    move/from16 v1, v16

    move-object/from16 v2, v17

    invoke-virtual {v0, v1, v2}, Lcom/getjar/sdk/logging/RemoteAppender;->logInternal(ILjava/lang/String;)V

    goto/16 :goto_0

    .line 351
    :cond_5
    const/16 v16, 0x2

    :try_start_5
    sget-object v17, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v18, "RemoteAppender: pushLogMessage() logged [URL:%1$s] [thread:%2$d]"

    const/16 v19, 0x2

    move/from16 v0, v19

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getjar/sdk/logging/RemoteAppender;->_loggingEndPoint:Ljava/lang/String;

    move-object/from16 v21, v0

    aput-object v21, v19, v20

    const/16 v20, 0x1

    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v21

    aput-object v21, v19, v20

    invoke-static/range {v17 .. v19}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, p0

    move/from16 v1, v16

    move-object/from16 v2, v17

    invoke-virtual {v0, v1, v2}, Lcom/getjar/sdk/logging/RemoteAppender;->logInternal(ILjava/lang/String;)V

    .line 355
    const/4 v13, 0x0

    .line 356
    .local v13, "responseCode":Ljava/lang/Integer;
    invoke-interface {v6}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v16

    if-eqz v16, :cond_6

    .line 357
    invoke-interface {v6}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v16

    invoke-interface/range {v16 .. v16}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v16

    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    .line 359
    :cond_6
    if-eqz v13, :cond_7

    .line 360
    const/16 v16, 0x2

    sget-object v17, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v18, "RemoteAppender: pushLogMessage() result code: %1$d [thread:%2$d]"

    const/16 v19, 0x2

    move/from16 v0, v19

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    aput-object v13, v19, v20

    const/16 v20, 0x1

    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v21

    aput-object v21, v19, v20

    invoke-static/range {v17 .. v19}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, p0

    move/from16 v1, v16

    move-object/from16 v2, v17

    invoke-virtual {v0, v1, v2}, Lcom/getjar/sdk/logging/RemoteAppender;->logInternal(ILjava/lang/String;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 368
    :goto_2
    const/16 v16, 0x3

    sget-object v17, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v18, "RemoteAppender: pushLogMessage() finished [thread:%1$d]"

    const/16 v19, 0x1

    move/from16 v0, v19

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v21

    aput-object v21, v19, v20

    invoke-static/range {v17 .. v19}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, p0

    move/from16 v1, v16

    move-object/from16 v2, v17

    invoke-virtual {v0, v1, v2}, Lcom/getjar/sdk/logging/RemoteAppender;->logInternal(ILjava/lang/String;)V

    goto/16 :goto_0

    .line 362
    :cond_7
    const/16 v16, 0x5

    :try_start_6
    sget-object v17, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v18, "RemoteAppender: pushLogMessage() failed to get result code [thread:%1$d]"

    const/16 v19, 0x1

    move/from16 v0, v19

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v21

    aput-object v21, v19, v20

    invoke-static/range {v17 .. v19}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, p0

    move/from16 v1, v16

    move-object/from16 v2, v17

    invoke-virtual {v0, v1, v2}, Lcom/getjar/sdk/logging/RemoteAppender;->logInternal(ILjava/lang/String;)V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_0
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    goto :goto_2
.end method

.method private resolveUserAgent()Ljava/lang/String;
    .locals 9

    .prologue
    .line 378
    :try_start_0
    iget-object v2, p0, Lcom/getjar/sdk/logging/RemoteAppender;->_sdkUserAgent:Ljava/lang/String;

    invoke-static {v2}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 379
    iget-object v2, p0, Lcom/getjar/sdk/logging/RemoteAppender;->_sdkUserAgent:Ljava/lang/String;

    .line 393
    :goto_0
    return-object v2

    .line 381
    :cond_0
    iget-object v2, p0, Lcom/getjar/sdk/logging/RemoteAppender;->_context:Landroid/content/Context;

    if-eqz v2, :cond_1

    .line 382
    iget-object v2, p0, Lcom/getjar/sdk/logging/RemoteAppender;->_context:Landroid/content/Context;

    invoke-static {v2}, Lcom/getjar/sdk/comm/auth/ApplicationKeyDatabase;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/comm/auth/ApplicationKeyDatabase;

    move-result-object v2

    invoke-virtual {v2}, Lcom/getjar/sdk/comm/auth/ApplicationKeyDatabase;->getApplicationKey()Ljava/lang/String;

    move-result-object v0

    .line 383
    .local v0, "applicationKey":Ljava/lang/String;
    invoke-static {v0}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 384
    invoke-static {}, Lcom/getjar/sdk/comm/UserAgentValuesManager;->getInstance()Lcom/getjar/sdk/comm/UserAgentValuesManager;

    move-result-object v2

    iget-object v3, p0, Lcom/getjar/sdk/logging/RemoteAppender;->_context:Landroid/content/Context;

    invoke-virtual {v2, v3, v0}, Lcom/getjar/sdk/comm/UserAgentValuesManager;->getSdkUserAgent(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/getjar/sdk/logging/RemoteAppender;->_sdkUserAgent:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 390
    .end local v0    # "applicationKey":Ljava/lang/String;
    :cond_1
    :goto_1
    iget-object v2, p0, Lcom/getjar/sdk/logging/RemoteAppender;->_sdkUserAgent:Ljava/lang/String;

    invoke-static {v2}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 391
    iget-object v2, p0, Lcom/getjar/sdk/logging/RemoteAppender;->_sdkUserAgent:Ljava/lang/String;

    goto :goto_0

    .line 387
    :catch_0
    move-exception v1

    .line 388
    .local v1, "e":Ljava/lang/Exception;
    const/4 v2, 0x5

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "RemoteAppender: resolveUserAgent() failed [thread:%1$d]"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Thread;->getId()J

    move-result-wide v7

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v2, v3, v1}, Lcom/getjar/sdk/logging/RemoteAppender;->logInternal(ILjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 393
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_2
    const-string v2, "UNRESOLVED"

    goto :goto_0
.end method


# virtual methods
.method public configureAppender(Landroid/content/Context;)V
    .locals 13
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v10, 0x1

    const/4 v8, 0x0

    const/4 v9, 0x2

    .line 117
    if-nez p1, :cond_0

    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "\'context\' cannot be NULL or empty"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 119
    :cond_0
    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "RemoteAppender: configureAppender() START [state:%1$s] [thread:%2$d]"

    new-array v6, v9, [Ljava/lang/Object;

    iget-object v7, p0, Lcom/getjar/sdk/logging/RemoteAppender;->_threadState:Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;->name()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v8

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Thread;->getId()J

    move-result-wide v7

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    aput-object v7, v6, v10

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v9, v4}, Lcom/getjar/sdk/logging/RemoteAppender;->logInternal(ILjava/lang/String;)V

    .line 120
    sget-object v5, Lcom/getjar/sdk/logging/RemoteAppender;->_ConfigurationLock:Ljava/lang/Object;

    monitor-enter v5

    .line 125
    :try_start_0
    iput-object p1, p0, Lcom/getjar/sdk/logging/RemoteAppender;->_context:Landroid/content/Context;

    .line 126
    iget-object v4, p0, Lcom/getjar/sdk/logging/RemoteAppender;->_context:Landroid/content/Context;

    invoke-static {v4}, Lcom/getjar/sdk/comm/GetJarConfig;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/comm/GetJarConfig;

    move-result-object v4

    const-string v6, "service.logging.endpoint"

    invoke-virtual {v4, v6}, Lcom/getjar/sdk/comm/GetJarConfig;->getDirectiveValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/getjar/sdk/logging/RemoteAppender;->_loggingEndPoint:Ljava/lang/String;

    .line 129
    iget-object v4, p0, Lcom/getjar/sdk/logging/RemoteAppender;->_context:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Lcom/getjar/sdk/comm/GetJarConfig;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/comm/GetJarConfig;

    move-result-object v2

    .line 130
    .local v2, "getJarConfig":Lcom/getjar/sdk/comm/GetJarConfig;
    const-string v4, "logging.remote.enabled"

    const/4 v6, 0x0

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    invoke-virtual {v2, v4, v6}, Lcom/getjar/sdk/comm/GetJarConfig;->getBooleanValue(Ljava/lang/String;Ljava/lang/Boolean;)Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    .line 131
    .local v1, "enabled":Z
    const-string v4, "logging.remote.level"

    const-string v6, "ERROR"

    invoke-virtual {v2, v4, v6}, Lcom/getjar/sdk/comm/GetJarConfig;->getDirectiveValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 132
    .local v3, "levelStr":Ljava/lang/String;
    const-string v4, "logging.remote.areas"

    sget-object v6, Lcom/getjar/sdk/logging/Area;->ALL:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->name()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v4, v6}, Lcom/getjar/sdk/comm/GetJarConfig;->getDirectiveValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 135
    .local v0, "areasStr":Ljava/lang/String;
    invoke-super {p0, v1, v3, v0}, Lcom/getjar/sdk/logging/AppenderBase;->configureAppender(ZLjava/lang/String;Ljava/lang/String;)V

    .line 136
    const-string v4, "logging.remote.max_batch_count"

    const/16 v6, 0x64

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v2, v4, v6}, Lcom/getjar/sdk/comm/GetJarConfig;->getIntegerValue(Ljava/lang/String;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    iput v4, p0, Lcom/getjar/sdk/logging/RemoteAppender;->_maxBatchCount:I

    .line 137
    const-string v4, "logging.remote.max_wait_interval"

    const/16 v6, 0x3c

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v2, v4, v6}, Lcom/getjar/sdk/comm/GetJarConfig;->getIntegerValue(Ljava/lang/String;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    mul-int/lit16 v4, v4, 0x3e8

    int-to-long v6, v4

    iput-wide v6, p0, Lcom/getjar/sdk/logging/RemoteAppender;->_maxWaitIntervalInMilliseconds:J

    .line 139
    invoke-virtual {p0}, Lcom/getjar/sdk/logging/RemoteAppender;->isEnabled()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 140
    invoke-virtual {p0}, Lcom/getjar/sdk/logging/RemoteAppender;->startLogging()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 144
    :cond_1
    const/4 v4, 0x2

    :try_start_1
    sget-object v6, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v7, "RemoteAppender: configureAppender() FINISHED [state:%1$s] [thread:%2$d]"

    const/4 v8, 0x2

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    iget-object v10, p0, Lcom/getjar/sdk/logging/RemoteAppender;->_threadState:Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;

    invoke-virtual {v10}, Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;->name()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    const/4 v9, 0x1

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Thread;->getId()J

    move-result-wide v10

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-static {v6, v7, v8}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v4, v6}, Lcom/getjar/sdk/logging/RemoteAppender;->logInternal(ILjava/lang/String;)V

    .line 147
    monitor-exit v5

    .line 148
    return-void

    .line 144
    .end local v0    # "areasStr":Ljava/lang/String;
    .end local v1    # "enabled":Z
    .end local v2    # "getJarConfig":Lcom/getjar/sdk/comm/GetJarConfig;
    .end local v3    # "levelStr":Ljava/lang/String;
    :catchall_0
    move-exception v4

    const/4 v6, 0x2

    sget-object v7, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v8, "RemoteAppender: configureAppender() FINISHED [state:%1$s] [thread:%2$d]"

    const/4 v9, 0x2

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    iget-object v11, p0, Lcom/getjar/sdk/logging/RemoteAppender;->_threadState:Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;

    invoke-virtual {v11}, Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;->name()Ljava/lang/String;

    move-result-object v11

    aput-object v11, v9, v10

    const/4 v10, 0x1

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/Thread;->getId()J

    move-result-wide v11

    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    aput-object v11, v9, v10

    invoke-static {v7, v8, v9}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v6, v7}, Lcom/getjar/sdk/logging/RemoteAppender;->logInternal(ILjava/lang/String;)V

    throw v4

    .line 147
    :catchall_1
    move-exception v4

    monitor-exit v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    throw v4
.end method

.method public isEnabled()Z
    .locals 1

    .prologue
    .line 106
    invoke-super {p0}, Lcom/getjar/sdk/logging/AppenderBase;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/getjar/sdk/logging/RemoteAppender;->_loggingEndPoint:Ljava/lang/String;

    invoke-static {v0}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 107
    const/4 v0, 0x1

    .line 109
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public log(Lcom/getjar/sdk/logging/LogMessage;)V
    .locals 2
    .param p1, "logMessage"    # Lcom/getjar/sdk/logging/LogMessage;

    .prologue
    .line 155
    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'logMessage\' cannot be NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 158
    :cond_0
    invoke-virtual {p1}, Lcom/getjar/sdk/logging/LogMessage;->getLevel()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/getjar/sdk/logging/RemoteAppender;->isLevelActive(I)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Lcom/getjar/sdk/logging/LogMessage;->getAreas()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lcom/getjar/sdk/logging/RemoteAppender;->isAreaActive(J)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 160
    invoke-virtual {p0}, Lcom/getjar/sdk/logging/RemoteAppender;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 163
    iget-object v0, p0, Lcom/getjar/sdk/logging/RemoteAppender;->_logBuffer:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->add(Ljava/lang/Object;)Z

    .line 164
    iget v0, p0, Lcom/getjar/sdk/logging/RemoteAppender;->_approximateBufferSize:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/getjar/sdk/logging/RemoteAppender;->_approximateBufferSize:I

    .line 167
    iget v0, p0, Lcom/getjar/sdk/logging/RemoteAppender;->_approximateBufferSize:I

    iget v1, p0, Lcom/getjar/sdk/logging/RemoteAppender;->_maxBatchCount:I

    if-lt v0, v1, :cond_1

    .line 168
    iget-object v1, p0, Lcom/getjar/sdk/logging/RemoteAppender;->_waitMonitor:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/getjar/sdk/logging/RemoteAppender;->_waitMonitor:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notify()V

    monitor-exit v1

    .line 172
    :cond_1
    return-void

    .line 168
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public startLogging()V
    .locals 8

    .prologue
    .line 176
    iget-object v1, p0, Lcom/getjar/sdk/logging/RemoteAppender;->_startStopLock:Ljava/lang/Object;

    monitor-enter v1

    .line 177
    const/4 v0, 0x2

    :try_start_0
    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "RemoteAppender: Attempting to start remote logging [state:%1$s] [thread:%2$d]"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    iget-object v6, p0, Lcom/getjar/sdk/logging/RemoteAppender;->_threadState:Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;->name()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x1

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Thread;->getId()J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v0, v2}, Lcom/getjar/sdk/logging/RemoteAppender;->logInternal(ILjava/lang/String;)V

    .line 179
    iget-object v0, p0, Lcom/getjar/sdk/logging/RemoteAppender;->_threadState:Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;

    sget-object v2, Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;->STOPPED:Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;

    if-ne v0, v2, :cond_0

    .line 180
    sget-object v0, Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;->STARTING:Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;

    iput-object v0, p0, Lcom/getjar/sdk/logging/RemoteAppender;->_threadState:Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;

    .line 181
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/getjar/sdk/logging/RemoteAppender;->_requestThreadExit:Z

    .line 182
    new-instance v0, Lcom/getjar/sdk/logging/RemoteAppender$RemoteLoggingThread;

    const/4 v2, 0x0

    invoke-direct {v0, p0, v2}, Lcom/getjar/sdk/logging/RemoteAppender$RemoteLoggingThread;-><init>(Lcom/getjar/sdk/logging/RemoteAppender;Lcom/getjar/sdk/logging/RemoteAppender$1;)V

    iput-object v0, p0, Lcom/getjar/sdk/logging/RemoteAppender;->_remoteLoggingThread:Lcom/getjar/sdk/logging/RemoteAppender$RemoteLoggingThread;

    .line 183
    iget-object v0, p0, Lcom/getjar/sdk/logging/RemoteAppender;->_remoteLoggingThread:Lcom/getjar/sdk/logging/RemoteAppender$RemoteLoggingThread;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/RemoteAppender$RemoteLoggingThread;->start()V

    .line 185
    const/4 v0, 0x2

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "RemoteAppender: Remote logging started [thread:%1$d] [logging_thread:%2$d]"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Thread;->getId()J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x1

    iget-object v6, p0, Lcom/getjar/sdk/logging/RemoteAppender;->_remoteLoggingThread:Lcom/getjar/sdk/logging/RemoteAppender$RemoteLoggingThread;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/RemoteAppender$RemoteLoggingThread;->getId()J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v0, v2}, Lcom/getjar/sdk/logging/RemoteAppender;->logInternal(ILjava/lang/String;)V

    .line 189
    :goto_0
    monitor-exit v1

    .line 190
    return-void

    .line 187
    :cond_0
    const/4 v0, 0x2

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "RemoteAppender: Remote logging found already running [thread:%1$d]"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Thread;->getId()J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v0, v2}, Lcom/getjar/sdk/logging/RemoteAppender;->logInternal(ILjava/lang/String;)V

    goto :goto_0

    .line 189
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public stopLogging()V
    .locals 11

    .prologue
    .line 194
    iget-object v4, p0, Lcom/getjar/sdk/logging/RemoteAppender;->_startStopLock:Ljava/lang/Object;

    monitor-enter v4

    .line 195
    const/4 v3, 0x2

    :try_start_0
    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "RemoteAppender: Attempting to stop remote logging [state:%1$s] [thread:%2$d]"

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    iget-object v9, p0, Lcom/getjar/sdk/logging/RemoteAppender;->_threadState:Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;

    invoke-virtual {v9}, Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;->name()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v7, v8

    const/4 v8, 0x1

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Thread;->getId()J

    move-result-wide v9

    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v3, v5}, Lcom/getjar/sdk/logging/RemoteAppender;->logInternal(ILjava/lang/String;)V

    .line 197
    iget-object v3, p0, Lcom/getjar/sdk/logging/RemoteAppender;->_threadState:Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;

    sget-object v5, Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;->STARTED:Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;

    if-ne v3, v5, :cond_0

    .line 200
    sget-object v3, Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;->STOPPING:Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;

    iput-object v3, p0, Lcom/getjar/sdk/logging/RemoteAppender;->_threadState:Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;

    .line 201
    const/4 v3, 0x1

    iput-boolean v3, p0, Lcom/getjar/sdk/logging/RemoteAppender;->_requestThreadExit:Z

    .line 204
    iget-object v5, p0, Lcom/getjar/sdk/logging/RemoteAppender;->_waitMonitor:Ljava/lang/Object;

    monitor-enter v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    iget-object v3, p0, Lcom/getjar/sdk/logging/RemoteAppender;->_waitMonitor:Ljava/lang/Object;

    invoke-virtual {v3}, Ljava/lang/Object;->notify()V

    monitor-exit v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 207
    :try_start_2
    iget-object v3, p0, Lcom/getjar/sdk/logging/RemoteAppender;->_remoteLoggingThread:Lcom/getjar/sdk/logging/RemoteAppender$RemoteLoggingThread;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/RemoteAppender$RemoteLoggingThread;->getId()J
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    move-result-wide v1

    .line 209
    .local v1, "loggingThreadId":J
    :try_start_3
    iget-object v3, p0, Lcom/getjar/sdk/logging/RemoteAppender;->_remoteLoggingThread:Lcom/getjar/sdk/logging/RemoteAppender$RemoteLoggingThread;

    const-wide/16 v5, 0x7d0

    invoke-virtual {v3, v5, v6}, Lcom/getjar/sdk/logging/RemoteAppender$RemoteLoggingThread;->join(J)V

    .line 210
    iget-object v3, p0, Lcom/getjar/sdk/logging/RemoteAppender;->_remoteLoggingThread:Lcom/getjar/sdk/logging/RemoteAppender$RemoteLoggingThread;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/RemoteAppender$RemoteLoggingThread;->interrupt()V

    .line 211
    iget-object v3, p0, Lcom/getjar/sdk/logging/RemoteAppender;->_remoteLoggingThread:Lcom/getjar/sdk/logging/RemoteAppender$RemoteLoggingThread;

    const-wide/16 v5, 0x7d0

    invoke-virtual {v3, v5, v6}, Lcom/getjar/sdk/logging/RemoteAppender$RemoteLoggingThread;->join(J)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 217
    :goto_0
    const/4 v3, 0x0

    :try_start_4
    iput-object v3, p0, Lcom/getjar/sdk/logging/RemoteAppender;->_remoteLoggingThread:Lcom/getjar/sdk/logging/RemoteAppender$RemoteLoggingThread;

    .line 219
    const/4 v3, 0x2

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "RemoteAppender: Remote logging stopped [thread:%1$d] [logging_thread:%2$d]"

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Thread;->getId()J

    move-result-wide v9

    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    aput-object v9, v7, v8

    const/4 v8, 0x1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v3, v5}, Lcom/getjar/sdk/logging/RemoteAppender;->logInternal(ILjava/lang/String;)V

    .line 223
    .end local v1    # "loggingThreadId":J
    :goto_1
    monitor-exit v4
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 224
    return-void

    .line 204
    :catchall_0
    move-exception v3

    :try_start_5
    monitor-exit v5
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    :try_start_6
    throw v3

    .line 223
    :catchall_1
    move-exception v3

    monitor-exit v4
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    throw v3

    .line 212
    .restart local v1    # "loggingThreadId":J
    :catch_0
    move-exception v0

    .line 213
    .local v0, "e":Ljava/lang/Exception;
    :try_start_7
    sget-object v3, Lcom/getjar/sdk/logging/RemoteAppender;->_TAG:Ljava/lang/String;

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "%1$s: RemoteAppender: join()/interrupt()/join() failed [thread:%2$d]"

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    sget-object v9, Lcom/getjar/sdk/logging/Area;->LOGGING:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v9}, Lcom/getjar/sdk/logging/Area;->name()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v7, v8

    const/4 v8, 0x1

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Thread;->getId()J

    move-result-wide v9

    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v5, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 221
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v1    # "loggingThreadId":J
    :cond_0
    const/4 v3, 0x2

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "RemoteAppender: Remote logging found already stopped [thread:%1$d]"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Thread;->getId()J

    move-result-wide v9

    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v3, v5}, Lcom/getjar/sdk/logging/RemoteAppender;->logInternal(ILjava/lang/String;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    goto :goto_1
.end method
