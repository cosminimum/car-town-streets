.class public Lcom/getjar/sdk/data/earning/EarningMonitor;
.super Ljava/lang/Object;
.source "EarningMonitor.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/getjar/sdk/data/earning/EarningMonitor$EarningMonitoringThread;
    }
.end annotation


# static fields
.field private static final _EARNING_APP_INSTALL_NOTIFY_MILLISECONDS:J = 0x493e0L

.field private static final _EARNING_APP_OPEN_NOTIFY_MILLISECONDS:J = 0xea60L

.field private static final _EARNING_APP_OPEN_TIMEOUT_MILLISECONDS:J = 0x5265c00L

.field private static volatile _Instance:Lcom/getjar/sdk/data/earning/EarningMonitor;


# instance fields
.field private final _commContext:Lcom/getjar/sdk/comm/CommContext;

.field private final _context:Landroid/content/Context;

.field private volatile _exitMonitoringThread:Z

.field private final _intervalWaitMonitor:Ljava/lang/Object;

.field private final _monitorIntervalInMilliseconds:J

.field private volatile _monitoringThread:Lcom/getjar/sdk/data/earning/EarningMonitor$EarningMonitoringThread;

.field private volatile _monitoringThreadLock:Ljava/lang/Object;

.field private volatile _startStopLock:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 62
    const/4 v0, 0x0

    sput-object v0, Lcom/getjar/sdk/data/earning/EarningMonitor;->_Instance:Lcom/getjar/sdk/data/earning/EarningMonitor;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 74
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/getjar/sdk/data/earning/EarningMonitor;->_monitoringThread:Lcom/getjar/sdk/data/earning/EarningMonitor$EarningMonitoringThread;

    .line 75
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/getjar/sdk/data/earning/EarningMonitor;->_exitMonitoringThread:Z

    .line 76
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/getjar/sdk/data/earning/EarningMonitor;->_monitoringThreadLock:Ljava/lang/Object;

    .line 77
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/getjar/sdk/data/earning/EarningMonitor;->_startStopLock:Ljava/lang/Object;

    .line 79
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/getjar/sdk/data/earning/EarningMonitor;->_intervalWaitMonitor:Ljava/lang/Object;

    .line 51
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/getjar/sdk/data/earning/EarningMonitor;->_context:Landroid/content/Context;

    .line 54
    invoke-direct {p0, p1}, Lcom/getjar/sdk/data/earning/EarningMonitor;->getCommContext(Landroid/content/Context;)Lcom/getjar/sdk/comm/CommContext;

    move-result-object v0

    iput-object v0, p0, Lcom/getjar/sdk/data/earning/EarningMonitor;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    .line 57
    iget-object v0, p0, Lcom/getjar/sdk/data/earning/EarningMonitor;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/getjar/sdk/comm/GetJarConfig;->getInstance(Lcom/getjar/sdk/comm/CommContext;Z)Lcom/getjar/sdk/comm/GetJarConfig;

    move-result-object v0

    const-string v1, "earn.on.open.monitoring.interval"

    invoke-virtual {v0, v1}, Lcom/getjar/sdk/comm/GetJarConfig;->getDirectiveValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/getjar/sdk/utilities/Utility;->convertMillSec(J)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/getjar/sdk/data/earning/EarningMonitor;->_monitorIntervalInMilliseconds:J

    .line 61
    return-void
.end method

.method static synthetic access$100(Lcom/getjar/sdk/data/earning/EarningMonitor;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/getjar/sdk/data/earning/EarningMonitor;

    .prologue
    .line 42
    iget-object v0, p0, Lcom/getjar/sdk/data/earning/EarningMonitor;->_context:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$200(Lcom/getjar/sdk/data/earning/EarningMonitor;)Z
    .locals 1
    .param p0, "x0"    # Lcom/getjar/sdk/data/earning/EarningMonitor;

    .prologue
    .line 42
    iget-boolean v0, p0, Lcom/getjar/sdk/data/earning/EarningMonitor;->_exitMonitoringThread:Z

    return v0
.end method

.method static synthetic access$202(Lcom/getjar/sdk/data/earning/EarningMonitor;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/getjar/sdk/data/earning/EarningMonitor;
    .param p1, "x1"    # Z

    .prologue
    .line 42
    iput-boolean p1, p0, Lcom/getjar/sdk/data/earning/EarningMonitor;->_exitMonitoringThread:Z

    return p1
.end method

.method static synthetic access$300(Lcom/getjar/sdk/data/earning/EarningMonitor;)Lcom/getjar/sdk/comm/CommContext;
    .locals 1
    .param p0, "x0"    # Lcom/getjar/sdk/data/earning/EarningMonitor;

    .prologue
    .line 42
    iget-object v0, p0, Lcom/getjar/sdk/data/earning/EarningMonitor;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    return-object v0
.end method

.method static synthetic access$400(Lcom/getjar/sdk/data/earning/EarningMonitor;)Ljava/lang/Object;
    .locals 1
    .param p0, "x0"    # Lcom/getjar/sdk/data/earning/EarningMonitor;

    .prologue
    .line 42
    iget-object v0, p0, Lcom/getjar/sdk/data/earning/EarningMonitor;->_intervalWaitMonitor:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$500(Lcom/getjar/sdk/data/earning/EarningMonitor;)J
    .locals 2
    .param p0, "x0"    # Lcom/getjar/sdk/data/earning/EarningMonitor;

    .prologue
    .line 42
    iget-wide v0, p0, Lcom/getjar/sdk/data/earning/EarningMonitor;->_monitorIntervalInMilliseconds:J

    return-wide v0
.end method

.method static synthetic access$600(Lcom/getjar/sdk/data/earning/EarningMonitor;)Ljava/lang/Object;
    .locals 1
    .param p0, "x0"    # Lcom/getjar/sdk/data/earning/EarningMonitor;

    .prologue
    .line 42
    iget-object v0, p0, Lcom/getjar/sdk/data/earning/EarningMonitor;->_monitoringThreadLock:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$702(Lcom/getjar/sdk/data/earning/EarningMonitor;Lcom/getjar/sdk/data/earning/EarningMonitor$EarningMonitoringThread;)Lcom/getjar/sdk/data/earning/EarningMonitor$EarningMonitoringThread;
    .locals 0
    .param p0, "x0"    # Lcom/getjar/sdk/data/earning/EarningMonitor;
    .param p1, "x1"    # Lcom/getjar/sdk/data/earning/EarningMonitor$EarningMonitoringThread;

    .prologue
    .line 42
    iput-object p1, p0, Lcom/getjar/sdk/data/earning/EarningMonitor;->_monitoringThread:Lcom/getjar/sdk/data/earning/EarningMonitor$EarningMonitoringThread;

    return-object p1
.end method

.method static synthetic access$800(Lcom/getjar/sdk/data/earning/EarningMonitor;Landroid/content/Context;Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/data/earning/EarnStateRecord;)Ljava/util/concurrent/Future;
    .locals 1
    .param p0, "x0"    # Lcom/getjar/sdk/data/earning/EarningMonitor;
    .param p1, "x1"    # Landroid/content/Context;
    .param p2, "x2"    # Lcom/getjar/sdk/comm/CommContext;
    .param p3, "x3"    # Lcom/getjar/sdk/data/earning/EarnStateRecord;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 42
    invoke-direct {p0, p1, p2, p3}, Lcom/getjar/sdk/data/earning/EarningMonitor;->earn(Landroid/content/Context;Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/data/earning/EarnStateRecord;)Ljava/util/concurrent/Future;

    move-result-object v0

    return-object v0
.end method

.method private earn(Landroid/content/Context;Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/data/earning/EarnStateRecord;)Ljava/util/concurrent/Future;
    .locals 13
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "commContext"    # Lcom/getjar/sdk/comm/CommContext;
    .param p3, "appState"    # Lcom/getjar/sdk/data/earning/EarnStateRecord;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/getjar/sdk/comm/CommContext;",
            "Lcom/getjar/sdk/data/earning/EarnStateRecord;",
            ")",
            "Ljava/util/concurrent/Future",
            "<",
            "Lcom/getjar/sdk/comm/Operation;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 495
    if-nez p1, :cond_0

    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v4, "\'context\' cannot be NULL"

    invoke-direct {v2, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 496
    :cond_0
    if-nez p2, :cond_1

    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v4, "\'commContext\' cannot be NULL"

    invoke-direct {v2, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 497
    :cond_1
    if-nez p3, :cond_2

    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v4, "\'appState\' cannot be NULL"

    invoke-direct {v2, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 499
    :cond_2
    sget-object v2, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v8

    sget-object v2, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v10

    or-long/2addr v8, v10

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "Earning: EarningMonitor: earn() for: %1$s"

    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    invoke-virtual/range {p3 .. p3}, Lcom/getjar/sdk/data/earning/EarnStateRecord;->toString()Ljava/lang/String;

    move-result-object v12

    aput-object v12, v10, v11

    invoke-static {v2, v4, v10}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v8, v9, v2}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 502
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 503
    .local v6, "trackingMetadata":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 504
    .local v5, "appMetadata":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-virtual/range {p3 .. p3}, Lcom/getjar/sdk/data/earning/EarnStateRecord;->getTrackingMetadata()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_5

    invoke-virtual/range {p3 .. p3}, Lcom/getjar/sdk/data/earning/EarnStateRecord;->getTrackingMetadata()Ljava/lang/String;

    move-result-object v2

    const-string v4, "[{\"key\":"

    invoke-virtual {v2, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_3

    invoke-virtual/range {p3 .. p3}, Lcom/getjar/sdk/data/earning/EarnStateRecord;->getTrackingMetadata()Ljava/lang/String;

    move-result-object v2

    const-string v4, "[{\"value\":"

    invoke-virtual {v2, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 508
    :cond_3
    invoke-virtual/range {p3 .. p3}, Lcom/getjar/sdk/data/earning/EarnStateRecord;->getTrackingMetadata()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/getjar/sdk/utilities/Utility;->jsonArrayStringToMap(Ljava/lang/String;)Ljava/util/HashMap;

    move-result-object v6

    .line 512
    :goto_0
    invoke-virtual/range {p3 .. p3}, Lcom/getjar/sdk/data/earning/EarnStateRecord;->getApplicationMetadata()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_6

    invoke-virtual/range {p3 .. p3}, Lcom/getjar/sdk/data/earning/EarnStateRecord;->getApplicationMetadata()Ljava/lang/String;

    move-result-object v2

    const-string v4, "[{\"key\":"

    invoke-virtual {v2, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_4

    invoke-virtual/range {p3 .. p3}, Lcom/getjar/sdk/data/earning/EarnStateRecord;->getApplicationMetadata()Ljava/lang/String;

    move-result-object v2

    const-string v4, "[{\"value\":"

    invoke-virtual {v2, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 516
    :cond_4
    invoke-virtual/range {p3 .. p3}, Lcom/getjar/sdk/data/earning/EarnStateRecord;->getApplicationMetadata()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/getjar/sdk/utilities/Utility;->jsonArrayStringToMap(Ljava/lang/String;)Ljava/util/HashMap;

    move-result-object v5

    .line 520
    :goto_1
    const-string v2, "app.id"

    invoke-virtual {v5, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 523
    .local v3, "itemId":Ljava/lang/String;
    invoke-virtual/range {p3 .. p3}, Lcom/getjar/sdk/data/earning/EarnStateRecord;->getClientTransactionId()Ljava/lang/String;

    move-result-object v1

    .line 524
    .local v1, "clientTransactionId":Ljava/lang/String;
    sget-object v2, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v8

    sget-object v2, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v10

    or-long/2addr v8, v10

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "Earning: EarningMonitor: earn() Sending Earn transaction for %1$s [clientTransactionId: %2$s]"

    const/4 v10, 0x2

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    invoke-virtual/range {p3 .. p3}, Lcom/getjar/sdk/data/earning/EarnStateRecord;->getPackageName()Ljava/lang/String;

    move-result-object v12

    aput-object v12, v10, v11

    const/4 v11, 0x1

    aput-object v1, v10, v11

    invoke-static {v2, v4, v10}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v8, v9, v2}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 528
    new-instance v0, Lcom/getjar/sdk/comm/TransactionManager;

    invoke-direct {v0, p1}, Lcom/getjar/sdk/comm/TransactionManager;-><init>(Landroid/content/Context;)V

    .line 529
    .local v0, "transactionManager":Lcom/getjar/sdk/comm/TransactionManager;
    invoke-virtual/range {p3 .. p3}, Lcom/getjar/sdk/data/earning/EarnStateRecord;->getPackageName()Ljava/lang/String;

    move-result-object v4

    move-object v2, p2

    invoke-virtual/range {v0 .. v6}, Lcom/getjar/sdk/comm/TransactionManager;->runEarnTransaction(Ljava/lang/String;Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;Ljava/util/HashMap;)Ljava/util/concurrent/Future;

    move-result-object v7

    .line 530
    .local v7, "operation":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<Lcom/getjar/sdk/comm/Operation;>;"
    invoke-interface {v7}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    .line 532
    return-object v7

    .line 510
    .end local v0    # "transactionManager":Lcom/getjar/sdk/comm/TransactionManager;
    .end local v1    # "clientTransactionId":Ljava/lang/String;
    .end local v3    # "itemId":Ljava/lang/String;
    .end local v7    # "operation":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<Lcom/getjar/sdk/comm/Operation;>;"
    :cond_5
    invoke-virtual/range {p3 .. p3}, Lcom/getjar/sdk/data/earning/EarnStateRecord;->getTrackingMetadata()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/getjar/sdk/utilities/Utility;->jsonArrayStringToMapUnchange(Ljava/lang/String;)Ljava/util/HashMap;

    move-result-object v6

    goto :goto_0

    .line 518
    :cond_6
    invoke-virtual/range {p3 .. p3}, Lcom/getjar/sdk/data/earning/EarnStateRecord;->getApplicationMetadata()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/getjar/sdk/utilities/Utility;->jsonArrayStringToMapUnchange(Ljava/lang/String;)Ljava/util/HashMap;

    move-result-object v5

    goto :goto_1
.end method

.method private getCommContext(Landroid/content/Context;)Lcom/getjar/sdk/comm/CommContext;
    .locals 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 544
    if-nez p1, :cond_0

    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "context cannot be null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 546
    :cond_0
    invoke-static {p1}, Lcom/getjar/sdk/comm/auth/ApplicationKeyDatabase;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/comm/auth/ApplicationKeyDatabase;

    move-result-object v2

    invoke-virtual {v2}, Lcom/getjar/sdk/comm/auth/ApplicationKeyDatabase;->getApplicationKey()Ljava/lang/String;

    move-result-object v0

    .line 547
    .local v0, "applicationKey":Ljava/lang/String;
    invoke-static {v0}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "Unable to access the application key"

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 549
    :cond_1
    new-instance v2, Lcom/getjar/sdk/data/earning/EarningMonitor$1;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v3}, Lcom/getjar/sdk/data/earning/EarningMonitor$1;-><init>(Lcom/getjar/sdk/data/earning/EarningMonitor;Landroid/os/Handler;)V

    sget-object v3, Lcom/getjar/sdk/comm/CommManager$LaunchWork;->NONE:Lcom/getjar/sdk/comm/CommManager$LaunchWork;

    invoke-static {v0, p1, v2, v3}, Lcom/getjar/sdk/comm/CommManager;->createContext(Ljava/lang/String;Landroid/content/Context;Landroid/os/ResultReceiver;Lcom/getjar/sdk/comm/CommManager$LaunchWork;)Lcom/getjar/sdk/comm/CommContext;

    move-result-object v1

    .line 567
    .local v1, "commContext":Lcom/getjar/sdk/comm/CommContext;
    return-object v1
.end method

.method public static declared-synchronized getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/earning/EarningMonitor;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 64
    const-class v1, Lcom/getjar/sdk/data/earning/EarningMonitor;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/getjar/sdk/data/earning/EarningMonitor;->_Instance:Lcom/getjar/sdk/data/earning/EarningMonitor;

    if-nez v0, :cond_0

    .line 65
    new-instance v0, Lcom/getjar/sdk/data/earning/EarningMonitor;

    invoke-direct {v0, p0}, Lcom/getjar/sdk/data/earning/EarningMonitor;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/getjar/sdk/data/earning/EarningMonitor;->_Instance:Lcom/getjar/sdk/data/earning/EarningMonitor;

    .line 67
    :cond_0
    sget-object v0, Lcom/getjar/sdk/data/earning/EarningMonitor;->_Instance:Lcom/getjar/sdk/data/earning/EarningMonitor;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 64
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method public ensureAppMetadataOnEarnStateRecord(Lcom/getjar/sdk/data/earning/EarnStateRecord;)Lcom/getjar/sdk/data/earning/EarnStateRecord;
    .locals 18
    .param p1, "appState"    # Lcom/getjar/sdk/data/earning/EarnStateRecord;

    .prologue
    .line 180
    if-nez p1, :cond_0

    new-instance v10, Ljava/lang/IllegalArgumentException;

    const-string v11, "\'appState\' cannot be NULL"

    invoke-direct {v10, v11}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 182
    :cond_0
    const/4 v2, 0x0

    .line 183
    .local v2, "doUpdate":Z
    const/4 v1, 0x0

    .line 184
    .local v1, "appMetaMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    move-object/from16 v7, p1

    .line 189
    .local v7, "returnRecord":Lcom/getjar/sdk/data/earning/EarnStateRecord;
    :try_start_0
    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/data/earning/EarnStateRecord;->getApplicationMetadata()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Lcom/getjar/sdk/utilities/Utility;->jsonArrayStringToMap(Ljava/lang/String;)Ljava/util/HashMap;

    move-result-object v1

    .line 190
    sget-object v10, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v10}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v10

    sget-object v12, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v13, "Earning: EarningMonitor: ensureAppMetadataOnEarnStateRecord() [packageName:\'%1$s\' metadataCount:%2$d]"

    const/4 v14, 0x2

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/data/earning/EarnStateRecord;->getPackageName()Ljava/lang/String;

    move-result-object v16

    aput-object v16, v14, v15

    const/4 v15, 0x1

    invoke-interface {v1}, Ljava/util/Map;->size()I

    move-result v16

    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    aput-object v16, v14, v15

    invoke-static {v12, v13, v14}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    invoke-static {v10, v11, v12}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 197
    const-string v10, "device.platform"

    invoke-interface {v1, v10}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_1

    const-string v10, "device.platform_version"

    invoke-interface {v1, v10}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_2

    .line 200
    :cond_1
    const-string v10, "device.platform"

    const-string v11, "android"

    invoke-interface {v1, v10, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 201
    const-string v10, "device.platform_version"

    sget-object v11, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    invoke-interface {v1, v10, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 202
    const/4 v2, 0x1

    .line 207
    :cond_2
    const-string v10, "android.package.version_code"

    invoke-interface {v1, v10}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_3

    const-string v10, "android.package.version_name"

    invoke-interface {v1, v10}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v10

    if-nez v10, :cond_6

    .line 210
    :cond_3
    const/4 v6, 0x0

    .line 211
    .local v6, "packageInfo":Landroid/content/pm/PackageInfo;
    const/4 v9, 0x0

    .line 212
    .local v9, "tryCount":I
    :cond_4
    :goto_0
    const/4 v10, 0x3

    if-gt v9, v10, :cond_5

    .line 214
    :try_start_1
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/getjar/sdk/data/earning/EarningMonitor;->_context:Landroid/content/Context;

    invoke-virtual {v10}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v10

    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/data/earning/EarnStateRecord;->getPackageName()Ljava/lang/String;

    move-result-object v11

    const/16 v12, 0x80

    invoke-virtual {v10, v11, v12}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    :try_end_1
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v6

    .line 221
    :cond_5
    if-nez v6, :cond_a

    .line 222
    :try_start_2
    sget-object v10, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v10}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v10

    sget-object v12, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v13, "Earning: EarningMonitor: ensureAppMetadataOnEarnStateRecord() [packageName: %1$s] Failed to get PackageInfo"

    const/4 v14, 0x1

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/data/earning/EarnStateRecord;->getPackageName()Ljava/lang/String;

    move-result-object v16

    aput-object v16, v14, v15

    invoke-static {v12, v13, v14}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    invoke-static {v10, v11, v12}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 240
    .end local v6    # "packageInfo":Landroid/content/pm/PackageInfo;
    .end local v9    # "tryCount":I
    :cond_6
    :goto_1
    if-eqz v2, :cond_8

    if-eqz v1, :cond_8

    :try_start_3
    invoke-interface {v1}, Ljava/util/Map;->size()I

    move-result v10

    if-lez v10, :cond_8

    .line 241
    invoke-static {v1}, Lcom/getjar/sdk/utilities/Utility;->mapToJsonString(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v8

    .line 242
    .local v8, "theAppMetadata":Ljava/lang/String;
    invoke-static {v8}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v10

    if-nez v10, :cond_8

    .line 245
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/getjar/sdk/data/earning/EarningMonitor;->_context:Landroid/content/Context;

    invoke-static {v10}, Lcom/getjar/sdk/data/earning/EarnStateDatabase;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/earning/EarnStateDatabase;

    move-result-object v10

    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/data/earning/EarnStateRecord;->getPackageName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11, v8}, Lcom/getjar/sdk/data/earning/EarnStateDatabase;->updateApplicationMetadata(Ljava/lang/String;Ljava/lang/String;)V

    .line 248
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/getjar/sdk/data/earning/EarningMonitor;->_context:Landroid/content/Context;

    invoke-static {v10}, Lcom/getjar/sdk/data/earning/EarnStateDatabase;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/earning/EarnStateDatabase;

    move-result-object v10

    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/data/earning/EarnStateRecord;->getPackageName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Lcom/getjar/sdk/data/earning/EarnStateDatabase;->getAppState(Ljava/lang/String;)Lcom/getjar/sdk/data/earning/EarnStateRecord;

    move-result-object v4

    .line 249
    .local v4, "loadedRecord":Lcom/getjar/sdk/data/earning/EarnStateRecord;
    if-eqz v4, :cond_7

    .line 250
    move-object v7, v4

    .line 253
    :cond_7
    sget-object v10, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v10}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v10

    sget-object v12, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v13, "Earning: EarningMonitor: ensureAppMetadataOnEarnStateRecord() Application metadata update [packageName:\'%1$s\' metadata:\'%2$s\']"

    const/4 v14, 0x2

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/data/earning/EarnStateRecord;->getPackageName()Ljava/lang/String;

    move-result-object v16

    aput-object v16, v14, v15

    const/4 v15, 0x1

    aput-object v8, v14, v15

    invoke-static {v12, v13, v14}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    invoke-static {v10, v11, v12}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    .line 264
    .end local v4    # "loadedRecord":Lcom/getjar/sdk/data/earning/EarnStateRecord;
    .end local v8    # "theAppMetadata":Ljava/lang/String;
    :cond_8
    :goto_2
    return-object v7

    .line 216
    .restart local v6    # "packageInfo":Landroid/content/pm/PackageInfo;
    .restart local v9    # "tryCount":I
    :catch_0
    move-exception v5

    .line 217
    .local v5, "nnfe":Landroid/content/pm/PackageManager$NameNotFoundException;
    add-int/lit8 v9, v9, 0x1

    .line 218
    const/4 v10, 0x3

    if-gt v9, v10, :cond_4

    const-wide/16 v10, 0x14d

    :try_start_4
    invoke-static {v10, v11}, Ljava/lang/Thread;->sleep(J)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto/16 :goto_0

    .line 234
    .end local v5    # "nnfe":Landroid/content/pm/PackageManager$NameNotFoundException;
    .end local v6    # "packageInfo":Landroid/content/pm/PackageInfo;
    .end local v9    # "tryCount":I
    :catch_1
    move-exception v3

    .line 235
    .local v3, "e":Ljava/lang/Exception;
    :try_start_5
    sget-object v10, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v10}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v10

    const-string v12, "Earning: EarningMonitor: ensureAppMetadataOnEarnStateRecord() failed"

    invoke-static {v10, v11, v12, v3}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 240
    if-eqz v2, :cond_8

    if-eqz v1, :cond_8

    :try_start_6
    invoke-interface {v1}, Ljava/util/Map;->size()I

    move-result v10

    if-lez v10, :cond_8

    .line 241
    invoke-static {v1}, Lcom/getjar/sdk/utilities/Utility;->mapToJsonString(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v8

    .line 242
    .restart local v8    # "theAppMetadata":Ljava/lang/String;
    invoke-static {v8}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v10

    if-nez v10, :cond_8

    .line 245
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/getjar/sdk/data/earning/EarningMonitor;->_context:Landroid/content/Context;

    invoke-static {v10}, Lcom/getjar/sdk/data/earning/EarnStateDatabase;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/earning/EarnStateDatabase;

    move-result-object v10

    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/data/earning/EarnStateRecord;->getPackageName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11, v8}, Lcom/getjar/sdk/data/earning/EarnStateDatabase;->updateApplicationMetadata(Ljava/lang/String;Ljava/lang/String;)V

    .line 248
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/getjar/sdk/data/earning/EarningMonitor;->_context:Landroid/content/Context;

    invoke-static {v10}, Lcom/getjar/sdk/data/earning/EarnStateDatabase;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/earning/EarnStateDatabase;

    move-result-object v10

    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/data/earning/EarnStateRecord;->getPackageName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Lcom/getjar/sdk/data/earning/EarnStateDatabase;->getAppState(Ljava/lang/String;)Lcom/getjar/sdk/data/earning/EarnStateRecord;

    move-result-object v4

    .line 249
    .restart local v4    # "loadedRecord":Lcom/getjar/sdk/data/earning/EarnStateRecord;
    if-eqz v4, :cond_9

    .line 250
    move-object v7, v4

    .line 253
    :cond_9
    sget-object v10, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v10}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v10

    sget-object v12, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v13, "Earning: EarningMonitor: ensureAppMetadataOnEarnStateRecord() Application metadata update [packageName:\'%1$s\' metadata:\'%2$s\']"

    const/4 v14, 0x2

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/data/earning/EarnStateRecord;->getPackageName()Ljava/lang/String;

    move-result-object v16

    aput-object v16, v14, v15

    const/4 v15, 0x1

    aput-object v8, v14, v15

    invoke-static {v12, v13, v14}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    invoke-static {v10, v11, v12}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_2

    goto :goto_2

    .line 259
    .end local v4    # "loadedRecord":Lcom/getjar/sdk/data/earning/EarnStateRecord;
    .end local v8    # "theAppMetadata":Ljava/lang/String;
    :catch_2
    move-exception v3

    .line 260
    sget-object v10, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v10}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v10

    const-string v12, "Earning: EarningMonitor: ensureAppMetadataOnEarnStateRecord() failed"

    invoke-static {v10, v11, v12, v3}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_2

    .line 228
    .end local v3    # "e":Ljava/lang/Exception;
    .restart local v6    # "packageInfo":Landroid/content/pm/PackageInfo;
    .restart local v9    # "tryCount":I
    :cond_a
    :try_start_7
    const-string v10, "android.package.version_code"

    iget v11, v6, Landroid/content/pm/PackageInfo;->versionCode:I

    invoke-static {v11}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v11

    invoke-interface {v1, v10, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 229
    const-string v10, "android.package.version_name"

    iget-object v11, v6, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    invoke-interface {v1, v10, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_1
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 230
    const/4 v2, 0x1

    goto/16 :goto_1

    .line 259
    .end local v6    # "packageInfo":Landroid/content/pm/PackageInfo;
    .end local v9    # "tryCount":I
    :catch_3
    move-exception v3

    .line 260
    .restart local v3    # "e":Ljava/lang/Exception;
    sget-object v10, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v10}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v10

    const-string v12, "Earning: EarningMonitor: ensureAppMetadataOnEarnStateRecord() failed"

    invoke-static {v10, v11, v12, v3}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_2

    .line 237
    .end local v3    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v10

    .line 240
    if-eqz v2, :cond_c

    if-eqz v1, :cond_c

    :try_start_8
    invoke-interface {v1}, Ljava/util/Map;->size()I

    move-result v11

    if-lez v11, :cond_c

    .line 241
    invoke-static {v1}, Lcom/getjar/sdk/utilities/Utility;->mapToJsonString(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v8

    .line 242
    .restart local v8    # "theAppMetadata":Ljava/lang/String;
    invoke-static {v8}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v11

    if-nez v11, :cond_c

    .line 245
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/getjar/sdk/data/earning/EarningMonitor;->_context:Landroid/content/Context;

    invoke-static {v11}, Lcom/getjar/sdk/data/earning/EarnStateDatabase;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/earning/EarnStateDatabase;

    move-result-object v11

    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/data/earning/EarnStateRecord;->getPackageName()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12, v8}, Lcom/getjar/sdk/data/earning/EarnStateDatabase;->updateApplicationMetadata(Ljava/lang/String;Ljava/lang/String;)V

    .line 248
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/getjar/sdk/data/earning/EarningMonitor;->_context:Landroid/content/Context;

    invoke-static {v11}, Lcom/getjar/sdk/data/earning/EarnStateDatabase;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/earning/EarnStateDatabase;

    move-result-object v11

    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/data/earning/EarnStateRecord;->getPackageName()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Lcom/getjar/sdk/data/earning/EarnStateDatabase;->getAppState(Ljava/lang/String;)Lcom/getjar/sdk/data/earning/EarnStateRecord;

    move-result-object v4

    .line 249
    .restart local v4    # "loadedRecord":Lcom/getjar/sdk/data/earning/EarnStateRecord;
    if-eqz v4, :cond_b

    .line 250
    move-object v7, v4

    .line 253
    :cond_b
    sget-object v11, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v11}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v11

    sget-object v13, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v14, "Earning: EarningMonitor: ensureAppMetadataOnEarnStateRecord() Application metadata update [packageName:\'%1$s\' metadata:\'%2$s\']"

    const/4 v15, 0x2

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/data/earning/EarnStateRecord;->getPackageName()Ljava/lang/String;

    move-result-object v17

    aput-object v17, v15, v16

    const/16 v16, 0x1

    aput-object v8, v15, v16

    invoke-static {v13, v14, v15}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    invoke-static {v11, v12, v13}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_4

    .line 261
    .end local v4    # "loadedRecord":Lcom/getjar/sdk/data/earning/EarnStateRecord;
    .end local v8    # "theAppMetadata":Ljava/lang/String;
    :cond_c
    :goto_3
    throw v10

    .line 259
    :catch_4
    move-exception v3

    .line 260
    .restart local v3    # "e":Ljava/lang/Exception;
    sget-object v11, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v11}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v11

    const-string v13, "Earning: EarningMonitor: ensureAppMetadataOnEarnStateRecord() failed"

    invoke-static {v11, v12, v13, v3}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_3
.end method

.method public isMonitoring()Z
    .locals 3

    .prologue
    const/4 v0, 0x0

    .line 83
    iget-object v1, p0, Lcom/getjar/sdk/data/earning/EarningMonitor;->_monitoringThreadLock:Ljava/lang/Object;

    monitor-enter v1

    .line 84
    :try_start_0
    iget-object v2, p0, Lcom/getjar/sdk/data/earning/EarningMonitor;->_monitoringThread:Lcom/getjar/sdk/data/earning/EarningMonitor$EarningMonitoringThread;

    if-nez v2, :cond_0

    monitor-exit v1

    .line 86
    :goto_0
    return v0

    .line 85
    :cond_0
    iget-boolean v2, p0, Lcom/getjar/sdk/data/earning/EarningMonitor;->_exitMonitoringThread:Z

    if-eqz v2, :cond_1

    monitor-exit v1

    goto :goto_0

    .line 87
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    .line 86
    :cond_1
    const/4 v0, 0x1

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0
.end method

.method public startMonitoring()V
    .locals 10

    .prologue
    .line 95
    iget-object v1, p0, Lcom/getjar/sdk/data/earning/EarningMonitor;->_startStopLock:Ljava/lang/Object;

    monitor-enter v1

    .line 98
    :try_start_0
    iget-wide v2, p0, Lcom/getjar/sdk/data/earning/EarningMonitor;->_monitorIntervalInMilliseconds:J

    const-wide/16 v4, 0x0

    cmp-long v0, v2, v4

    if-gtz v0, :cond_0

    .line 99
    sget-object v0, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v0, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "Earning: EarningMonitor: skipping earning monitoring thread start due to a monitoring interval of %1$d"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    iget-wide v7, p0, Lcom/getjar/sdk/data/earning/EarningMonitor;->_monitorIntervalInMilliseconds:J

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v0, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 102
    monitor-exit v1

    .line 132
    :goto_0
    return-void

    .line 104
    :cond_0
    sget-object v0, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v0, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "Earning: EarningMonitor: starting earning monitoring thread with a monitoring interval of %1$d"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    iget-wide v7, p0, Lcom/getjar/sdk/data/earning/EarningMonitor;->_monitorIntervalInMilliseconds:J

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v0, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 109
    iget-object v2, p0, Lcom/getjar/sdk/data/earning/EarningMonitor;->_monitoringThreadLock:Ljava/lang/Object;

    monitor-enter v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 112
    :try_start_1
    iget-object v0, p0, Lcom/getjar/sdk/data/earning/EarningMonitor;->_monitoringThread:Lcom/getjar/sdk/data/earning/EarningMonitor$EarningMonitoringThread;

    if-nez v0, :cond_1

    .line 113
    new-instance v0, Lcom/getjar/sdk/data/earning/EarningMonitor$EarningMonitoringThread;

    const/4 v3, 0x0

    invoke-direct {v0, p0, v3}, Lcom/getjar/sdk/data/earning/EarningMonitor$EarningMonitoringThread;-><init>(Lcom/getjar/sdk/data/earning/EarningMonitor;Lcom/getjar/sdk/data/earning/EarningMonitor$1;)V

    iput-object v0, p0, Lcom/getjar/sdk/data/earning/EarningMonitor;->_monitoringThread:Lcom/getjar/sdk/data/earning/EarningMonitor$EarningMonitoringThread;

    .line 114
    sget-object v0, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v0, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    const-string v0, "Earning: EarningMonitor: earning monitoring thread [instantiated]"

    invoke-static {v3, v4, v0}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 118
    :cond_1
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/getjar/sdk/data/earning/EarningMonitor;->_exitMonitoringThread:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 120
    :try_start_2
    iget-object v0, p0, Lcom/getjar/sdk/data/earning/EarningMonitor;->_monitoringThread:Lcom/getjar/sdk/data/earning/EarningMonitor$EarningMonitoringThread;

    invoke-virtual {v0}, Lcom/getjar/sdk/data/earning/EarningMonitor$EarningMonitoringThread;->start()V

    .line 121
    sget-object v0, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v0, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    const-string v0, "Earning: EarningMonitor: earning monitoring thread [start() called]"

    invoke-static {v3, v4, v0}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/IllegalThreadStateException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 125
    :goto_1
    :try_start_3
    invoke-static {}, Lcom/getjar/sdk/data/earning/EarningScreenReceiver;->getInstance()Lcom/getjar/sdk/data/earning/EarningScreenReceiver;

    move-result-object v0

    iget-object v3, p0, Lcom/getjar/sdk/data/earning/EarningMonitor;->_context:Landroid/content/Context;

    invoke-virtual {v0, v3}, Lcom/getjar/sdk/data/earning/EarningScreenReceiver;->registerReceiver(Landroid/content/Context;)V

    .line 128
    iget-object v0, p0, Lcom/getjar/sdk/data/earning/EarningMonitor;->_context:Landroid/content/Context;

    new-instance v3, Landroid/content/Intent;

    iget-object v4, p0, Lcom/getjar/sdk/data/earning/EarningMonitor;->_context:Landroid/content/Context;

    const-class v5, Lcom/getjar/sdk/rewards/GetJarService;

    invoke-direct {v3, v4, v5}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, v3}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 129
    sget-object v0, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v0, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "Earning: EarningMonitor: earning monitoring thread started [thread id: %1$d]"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    iget-object v8, p0, Lcom/getjar/sdk/data/earning/EarningMonitor;->_monitoringThread:Lcom/getjar/sdk/data/earning/EarningMonitor$EarningMonitoringThread;

    invoke-virtual {v8}, Lcom/getjar/sdk/data/earning/EarningMonitor$EarningMonitoringThread;->getId()J

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v0, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v4, v0}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 130
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 131
    :try_start_4
    monitor-exit v1

    goto/16 :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    throw v0

    .line 130
    :catchall_1
    move-exception v0

    :try_start_5
    monitor-exit v2
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    :try_start_6
    throw v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 122
    :catch_0
    move-exception v0

    goto :goto_1
.end method

.method public stopMonitoring()V
    .locals 13

    .prologue
    .line 139
    iget-object v4, p0, Lcom/getjar/sdk/data/earning/EarningMonitor;->_startStopLock:Ljava/lang/Object;

    monitor-enter v4

    .line 140
    const/4 v1, 0x0

    .line 144
    .local v1, "threadReferenceCache":Lcom/getjar/sdk/data/earning/EarningMonitor$EarningMonitoringThread;
    :try_start_0
    iget-object v3, p0, Lcom/getjar/sdk/data/earning/EarningMonitor;->_monitoringThreadLock:Ljava/lang/Object;

    monitor-enter v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 145
    :try_start_1
    iget-object v1, p0, Lcom/getjar/sdk/data/earning/EarningMonitor;->_monitoringThread:Lcom/getjar/sdk/data/earning/EarningMonitor$EarningMonitoringThread;

    .line 146
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/getjar/sdk/data/earning/EarningMonitor;->_exitMonitoringThread:Z

    .line 147
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/getjar/sdk/data/earning/EarningMonitor;->_monitoringThread:Lcom/getjar/sdk/data/earning/EarningMonitor$EarningMonitoringThread;

    .line 148
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 151
    :try_start_2
    iget-object v3, p0, Lcom/getjar/sdk/data/earning/EarningMonitor;->_intervalWaitMonitor:Ljava/lang/Object;

    monitor-enter v3
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 152
    :try_start_3
    iget-object v2, p0, Lcom/getjar/sdk/data/earning/EarningMonitor;->_intervalWaitMonitor:Ljava/lang/Object;

    invoke-virtual {v2}, Ljava/lang/Object;->notify()V

    .line 153
    monitor-exit v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 154
    if-eqz v1, :cond_0

    .line 156
    const-wide/16 v2, 0x7d0

    :try_start_4
    invoke-virtual {v1, v2, v3}, Lcom/getjar/sdk/data/earning/EarningMonitor$EarningMonitoringThread;->join(J)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 160
    :goto_0
    :try_start_5
    invoke-virtual {v1}, Lcom/getjar/sdk/data/earning/EarningMonitor$EarningMonitoringThread;->interrupt()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 166
    :cond_0
    :try_start_6
    sget-object v2, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v5, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v5, v2

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v7, "Earning: EarningMonitor: earning monitoring thread stopped [thread id: %1$s]"

    const/4 v2, 0x1

    new-array v8, v2, [Ljava/lang/Object;

    const/4 v9, 0x0

    if-eqz v1, :cond_1

    invoke-virtual {v1}, Lcom/getjar/sdk/data/earning/EarningMonitor$EarningMonitoringThread;->getId()J

    move-result-wide v10

    invoke-static {v10, v11}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v2

    :goto_1
    aput-object v2, v8, v9

    invoke-static {v3, v7, v8}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v5, v6, v2}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 169
    const/4 v1, 0x0

    .line 171
    :goto_2
    monitor-exit v4
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    .line 172
    return-void

    .line 148
    :catchall_0
    move-exception v2

    :try_start_7
    monitor-exit v3
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    :try_start_8
    throw v2
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_0
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    .line 163
    :catch_0
    move-exception v0

    .line 164
    .local v0, "e":Ljava/lang/Exception;
    :try_start_9
    sget-object v2, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v5, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v2, v5

    const-string v5, "Earning: EarningMonitor: stopMonitoring() failed"

    invoke-static {v2, v3, v5, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    .line 166
    :try_start_a
    sget-object v2, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v5, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v5, v2

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v7, "Earning: EarningMonitor: earning monitoring thread stopped [thread id: %1$s]"

    const/4 v2, 0x1

    new-array v8, v2, [Ljava/lang/Object;

    const/4 v9, 0x0

    if-eqz v1, :cond_2

    invoke-virtual {v1}, Lcom/getjar/sdk/data/earning/EarningMonitor$EarningMonitoringThread;->getId()J

    move-result-wide v10

    invoke-static {v10, v11}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v2

    :goto_3
    aput-object v2, v8, v9

    invoke-static {v3, v7, v8}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v5, v6, v2}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_3

    .line 169
    const/4 v1, 0x0

    .line 170
    goto :goto_2

    .line 153
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_1
    move-exception v2

    :try_start_b
    monitor-exit v3
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_1

    :try_start_c
    throw v2
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_0
    .catchall {:try_start_c .. :try_end_c} :catchall_2

    .line 166
    :catchall_2
    move-exception v2

    :try_start_d
    sget-object v3, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    sget-object v3, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    or-long/2addr v5, v7

    sget-object v7, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v8, "Earning: EarningMonitor: earning monitoring thread stopped [thread id: %1$s]"

    const/4 v3, 0x1

    new-array v9, v3, [Ljava/lang/Object;

    const/4 v10, 0x0

    if-eqz v1, :cond_3

    invoke-virtual {v1}, Lcom/getjar/sdk/data/earning/EarningMonitor$EarningMonitoringThread;->getId()J

    move-result-wide v11

    invoke-static {v11, v12}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v3

    :goto_4
    aput-object v3, v9, v10

    invoke-static {v7, v8, v9}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v5, v6, v3}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 169
    const/4 v1, 0x0

    throw v2

    .line 171
    :catchall_3
    move-exception v2

    monitor-exit v4
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_3

    throw v2

    .line 157
    :catch_1
    move-exception v0

    .line 158
    .restart local v0    # "e":Ljava/lang/Exception;
    :try_start_e
    sget-object v2, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v5, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v2, v5

    const-string v5, "Earning: EarningMonitor: join() failed"

    invoke-static {v2, v3, v5, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_0
    .catchall {:try_start_e .. :try_end_e} :catchall_2

    goto/16 :goto_0

    .line 166
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_1
    :try_start_f
    const-string v2, "null"

    goto/16 :goto_1

    .restart local v0    # "e":Ljava/lang/Exception;
    :cond_2
    const-string v2, "null"

    goto :goto_3

    .end local v0    # "e":Ljava/lang/Exception;
    :cond_3
    const-string v3, "null"
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_3

    goto :goto_4
.end method
