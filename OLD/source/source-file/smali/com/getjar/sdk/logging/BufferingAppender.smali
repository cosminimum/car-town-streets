.class Lcom/getjar/sdk/logging/BufferingAppender;
.super Lcom/getjar/sdk/logging/AppenderBase;
.source "BufferingAppender.java"


# static fields
.field private static volatile _ApproximateBufferSize:I = 0x0

.field private static _ConfigurationLock:Ljava/lang/Object; = null

.field private static _Instance:Lcom/getjar/sdk/logging/BufferingAppender; = null

.field private static _InstanceLock:Ljava/lang/Object; = null

.field private static _LogBuffer:Ljava/util/concurrent/ConcurrentLinkedQueue; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentLinkedQueue",
            "<",
            "Lcom/getjar/sdk/logging/LogMessage;",
            ">;"
        }
    .end annotation
.end field

.field private static final _MaxBufferSize:I = 0x400


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 17
    const/4 v0, 0x0

    sput-object v0, Lcom/getjar/sdk/logging/BufferingAppender;->_Instance:Lcom/getjar/sdk/logging/BufferingAppender;

    .line 18
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/getjar/sdk/logging/BufferingAppender;->_InstanceLock:Ljava/lang/Object;

    .line 36
    const/4 v0, 0x0

    sput v0, Lcom/getjar/sdk/logging/BufferingAppender;->_ApproximateBufferSize:I

    .line 37
    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    sput-object v0, Lcom/getjar/sdk/logging/BufferingAppender;->_LogBuffer:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 39
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/getjar/sdk/logging/BufferingAppender;->_ConfigurationLock:Ljava/lang/Object;

    return-void
.end method

.method private constructor <init>()V
    .locals 4

    .prologue
    .line 16
    const/4 v0, 0x0

    const/4 v1, 0x2

    sget-object v2, Lcom/getjar/sdk/logging/Area;->ALL:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/getjar/sdk/logging/AppenderBase;-><init>(ZIJ)V

    return-void
.end method

.method protected static getInstance()Lcom/getjar/sdk/logging/BufferingAppender;
    .locals 2

    .prologue
    .line 20
    sget-object v0, Lcom/getjar/sdk/logging/BufferingAppender;->_Instance:Lcom/getjar/sdk/logging/BufferingAppender;

    if-nez v0, :cond_1

    .line 21
    sget-object v1, Lcom/getjar/sdk/logging/BufferingAppender;->_InstanceLock:Ljava/lang/Object;

    monitor-enter v1

    .line 22
    :try_start_0
    sget-object v0, Lcom/getjar/sdk/logging/BufferingAppender;->_Instance:Lcom/getjar/sdk/logging/BufferingAppender;

    if-nez v0, :cond_0

    .line 23
    new-instance v0, Lcom/getjar/sdk/logging/BufferingAppender;

    invoke-direct {v0}, Lcom/getjar/sdk/logging/BufferingAppender;-><init>()V

    sput-object v0, Lcom/getjar/sdk/logging/BufferingAppender;->_Instance:Lcom/getjar/sdk/logging/BufferingAppender;

    .line 25
    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 27
    :cond_1
    sget-object v0, Lcom/getjar/sdk/logging/BufferingAppender;->_Instance:Lcom/getjar/sdk/logging/BufferingAppender;

    return-object v0

    .line 25
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public static getLogBuffer()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lcom/getjar/sdk/logging/LogMessage;",
            ">;"
        }
    .end annotation

    .prologue
    .line 43
    sget-object v0, Lcom/getjar/sdk/logging/BufferingAppender;->_LogBuffer:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableCollection(Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public configureAppender(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x2

    .line 48
    const-string v0, "BufferingAppender: configureAppender() START"

    invoke-virtual {p0, v1, v0}, Lcom/getjar/sdk/logging/BufferingAppender;->logInternal(ILjava/lang/String;)V

    .line 49
    sget-object v1, Lcom/getjar/sdk/logging/BufferingAppender;->_ConfigurationLock:Ljava/lang/Object;

    monitor-enter v1

    .line 55
    const/4 v0, 0x2

    :try_start_0
    const-string v2, "BufferingAppender: configureAppender() FINISHED"

    invoke-virtual {p0, v0, v2}, Lcom/getjar/sdk/logging/BufferingAppender;->logInternal(ILjava/lang/String;)V

    .line 57
    monitor-exit v1

    .line 58
    return-void

    .line 57
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public log(Lcom/getjar/sdk/logging/LogMessage;)V
    .locals 2
    .param p1, "logMessage"    # Lcom/getjar/sdk/logging/LogMessage;

    .prologue
    .line 64
    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'logMessage\' cannot be NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 67
    :cond_0
    invoke-virtual {p1}, Lcom/getjar/sdk/logging/LogMessage;->getLevel()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/getjar/sdk/logging/BufferingAppender;->isLevelActive(I)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Lcom/getjar/sdk/logging/LogMessage;->getAreas()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lcom/getjar/sdk/logging/BufferingAppender;->isAreaActive(J)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 68
    sget-object v0, Lcom/getjar/sdk/logging/BufferingAppender;->_LogBuffer:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->add(Ljava/lang/Object;)Z

    .line 69
    sget v0, Lcom/getjar/sdk/logging/BufferingAppender;->_ApproximateBufferSize:I

    add-int/lit8 v0, v0, 0x1

    sput v0, Lcom/getjar/sdk/logging/BufferingAppender;->_ApproximateBufferSize:I

    .line 70
    :goto_0
    sget v0, Lcom/getjar/sdk/logging/BufferingAppender;->_ApproximateBufferSize:I

    const/16 v1, 0x400

    if-le v0, v1, :cond_1

    .line 71
    sget-object v0, Lcom/getjar/sdk/logging/BufferingAppender;->_LogBuffer:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;->remove()Ljava/lang/Object;

    .line 72
    sget v0, Lcom/getjar/sdk/logging/BufferingAppender;->_ApproximateBufferSize:I

    add-int/lit8 v0, v0, -0x1

    sput v0, Lcom/getjar/sdk/logging/BufferingAppender;->_ApproximateBufferSize:I

    goto :goto_0

    .line 75
    :cond_1
    return-void
.end method
