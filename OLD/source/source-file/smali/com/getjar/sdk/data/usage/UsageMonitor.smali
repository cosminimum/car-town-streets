.class public Lcom/getjar/sdk/data/usage/UsageMonitor;
.super Ljava/lang/Object;
.source "UsageMonitor.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/getjar/sdk/data/usage/UsageMonitor$UsageMonitoringThread;,
        Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;
    }
.end annotation


# static fields
.field private static _DebugHookSuppressMonitoring:Z = false

.field private static volatile _Instance:Lcom/getjar/sdk/data/usage/UsageMonitor; = null

.field private static final _LAST_CHECK_TIME_FILE:Ljava/lang/String; = "lastUsageCheckFile"

.field private static final _LAST_CHECK_TIME_KEY:Ljava/lang/String; = "lastUsageCheckTime"


# instance fields
.field private final _commContext:Lcom/getjar/sdk/comm/CommContext;

.field private final _context:Landroid/content/Context;

.field private final _intervalWaitMonitor:Ljava/lang/Object;

.field private final _monitorIntervalInMilliseconds:J

.field private final _monitorTrackingIntervalInMilliseconds:J

.field private volatile _monitoringState:Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;

.field private volatile _monitoringThread:Lcom/getjar/sdk/data/usage/UsageMonitor$UsageMonitoringThread;

.field private final _monitoringThreadLock:Ljava/lang/Object;

.field private final _pausingMonitor:Ljava/lang/Object;

.field private volatile _requestThreadExit:Z

.field private final _startStopLock:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 53
    const/4 v0, 0x0

    sput-object v0, Lcom/getjar/sdk/data/usage/UsageMonitor;->_Instance:Lcom/getjar/sdk/data/usage/UsageMonitor;

    .line 62
    const/4 v0, 0x0

    sput-boolean v0, Lcom/getjar/sdk/data/usage/UsageMonitor;->_DebugHookSuppressMonitoring:Z

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 11
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const-wide/16 v4, 0x1

    const-wide/16 v9, 0x0

    const/4 v8, 0x1

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 80
    const/4 v6, 0x0

    iput-object v6, p0, Lcom/getjar/sdk/data/usage/UsageMonitor;->_monitoringThread:Lcom/getjar/sdk/data/usage/UsageMonitor$UsageMonitoringThread;

    .line 81
    sget-object v6, Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;->STOPPED:Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;

    iput-object v6, p0, Lcom/getjar/sdk/data/usage/UsageMonitor;->_monitoringState:Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;

    .line 84
    const/4 v6, 0x0

    iput-boolean v6, p0, Lcom/getjar/sdk/data/usage/UsageMonitor;->_requestThreadExit:Z

    .line 86
    new-instance v6, Ljava/lang/Object;

    invoke-direct {v6}, Ljava/lang/Object;-><init>()V

    iput-object v6, p0, Lcom/getjar/sdk/data/usage/UsageMonitor;->_monitoringThreadLock:Ljava/lang/Object;

    .line 87
    new-instance v6, Ljava/lang/Object;

    invoke-direct {v6}, Ljava/lang/Object;-><init>()V

    iput-object v6, p0, Lcom/getjar/sdk/data/usage/UsageMonitor;->_startStopLock:Ljava/lang/Object;

    .line 88
    new-instance v6, Ljava/lang/Object;

    invoke-direct {v6}, Ljava/lang/Object;-><init>()V

    iput-object v6, p0, Lcom/getjar/sdk/data/usage/UsageMonitor;->_intervalWaitMonitor:Ljava/lang/Object;

    .line 89
    new-instance v6, Ljava/lang/Object;

    invoke-direct {v6}, Ljava/lang/Object;-><init>()V

    iput-object v6, p0, Lcom/getjar/sdk/data/usage/UsageMonitor;->_pausingMonitor:Ljava/lang/Object;

    .line 34
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v6

    iput-object v6, p0, Lcom/getjar/sdk/data/usage/UsageMonitor;->_context:Landroid/content/Context;

    .line 37
    invoke-direct {p0, p1}, Lcom/getjar/sdk/data/usage/UsageMonitor;->getCommContext(Landroid/content/Context;)Lcom/getjar/sdk/comm/CommContext;

    move-result-object v6

    iput-object v6, p0, Lcom/getjar/sdk/data/usage/UsageMonitor;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    .line 40
    iget-object v6, p0, Lcom/getjar/sdk/data/usage/UsageMonitor;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-static {v6, v8}, Lcom/getjar/sdk/comm/GetJarConfig;->getInstance(Lcom/getjar/sdk/comm/CommContext;Z)Lcom/getjar/sdk/comm/GetJarConfig;

    move-result-object v6

    const-string v7, "usage.monitoring.interval"

    invoke-virtual {v6, v7}, Lcom/getjar/sdk/comm/GetJarConfig;->getDirectiveValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v6

    invoke-static {v6, v7}, Lcom/getjar/sdk/utilities/Utility;->convertMillSec(J)J

    move-result-wide v0

    .line 44
    .local v0, "monitorInterval":J
    cmp-long v6, v0, v9

    if-gtz v6, :cond_0

    move-wide v0, v4

    .end local v0    # "monitorInterval":J
    :cond_0
    iput-wide v0, p0, Lcom/getjar/sdk/data/usage/UsageMonitor;->_monitorIntervalInMilliseconds:J

    .line 47
    iget-object v6, p0, Lcom/getjar/sdk/data/usage/UsageMonitor;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-static {v6, v8}, Lcom/getjar/sdk/comm/GetJarConfig;->getInstance(Lcom/getjar/sdk/comm/CommContext;Z)Lcom/getjar/sdk/comm/GetJarConfig;

    move-result-object v6

    const-string v7, "usage.monitoring.tracking_interval"

    invoke-virtual {v6, v7}, Lcom/getjar/sdk/comm/GetJarConfig;->getDirectiveValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v6

    invoke-static {v6, v7}, Lcom/getjar/sdk/utilities/Utility;->convertMillSec(J)J

    move-result-wide v2

    .line 51
    .local v2, "monitorTrackingInterval":J
    cmp-long v6, v2, v9

    if-gtz v6, :cond_1

    :goto_0
    iput-wide v4, p0, Lcom/getjar/sdk/data/usage/UsageMonitor;->_monitorTrackingIntervalInMilliseconds:J

    .line 52
    return-void

    :cond_1
    move-wide v4, v2

    .line 51
    goto :goto_0
.end method

.method static synthetic access$102(Lcom/getjar/sdk/data/usage/UsageMonitor;Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;)Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;
    .locals 0
    .param p0, "x0"    # Lcom/getjar/sdk/data/usage/UsageMonitor;
    .param p1, "x1"    # Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;

    .prologue
    .line 30
    iput-object p1, p0, Lcom/getjar/sdk/data/usage/UsageMonitor;->_monitoringState:Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;

    return-object p1
.end method

.method static synthetic access$200(Lcom/getjar/sdk/data/usage/UsageMonitor;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/getjar/sdk/data/usage/UsageMonitor;

    .prologue
    .line 30
    iget-object v0, p0, Lcom/getjar/sdk/data/usage/UsageMonitor;->_context:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$300(Lcom/getjar/sdk/data/usage/UsageMonitor;)Z
    .locals 1
    .param p0, "x0"    # Lcom/getjar/sdk/data/usage/UsageMonitor;

    .prologue
    .line 30
    iget-boolean v0, p0, Lcom/getjar/sdk/data/usage/UsageMonitor;->_requestThreadExit:Z

    return v0
.end method

.method static synthetic access$302(Lcom/getjar/sdk/data/usage/UsageMonitor;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/getjar/sdk/data/usage/UsageMonitor;
    .param p1, "x1"    # Z

    .prologue
    .line 30
    iput-boolean p1, p0, Lcom/getjar/sdk/data/usage/UsageMonitor;->_requestThreadExit:Z

    return p1
.end method

.method static synthetic access$400(Lcom/getjar/sdk/data/usage/UsageMonitor;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/getjar/sdk/data/usage/UsageMonitor;

    .prologue
    .line 30
    invoke-direct {p0}, Lcom/getjar/sdk/data/usage/UsageMonitor;->getRunningPackageNames()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$500(Lcom/getjar/sdk/data/usage/UsageMonitor;)Ljava/lang/Object;
    .locals 1
    .param p0, "x0"    # Lcom/getjar/sdk/data/usage/UsageMonitor;

    .prologue
    .line 30
    iget-object v0, p0, Lcom/getjar/sdk/data/usage/UsageMonitor;->_intervalWaitMonitor:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$600(Lcom/getjar/sdk/data/usage/UsageMonitor;)J
    .locals 2
    .param p0, "x0"    # Lcom/getjar/sdk/data/usage/UsageMonitor;

    .prologue
    .line 30
    iget-wide v0, p0, Lcom/getjar/sdk/data/usage/UsageMonitor;->_monitorIntervalInMilliseconds:J

    return-wide v0
.end method

.method static synthetic access$700(Lcom/getjar/sdk/data/usage/UsageMonitor;)J
    .locals 2
    .param p0, "x0"    # Lcom/getjar/sdk/data/usage/UsageMonitor;

    .prologue
    .line 30
    iget-wide v0, p0, Lcom/getjar/sdk/data/usage/UsageMonitor;->_monitorTrackingIntervalInMilliseconds:J

    return-wide v0
.end method

.method static synthetic access$800(Lcom/getjar/sdk/data/usage/UsageMonitor;)Lcom/getjar/sdk/comm/CommContext;
    .locals 1
    .param p0, "x0"    # Lcom/getjar/sdk/data/usage/UsageMonitor;

    .prologue
    .line 30
    iget-object v0, p0, Lcom/getjar/sdk/data/usage/UsageMonitor;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    return-object v0
.end method

.method static synthetic access$900(Lcom/getjar/sdk/data/usage/UsageMonitor;)Ljava/lang/Object;
    .locals 1
    .param p0, "x0"    # Lcom/getjar/sdk/data/usage/UsageMonitor;

    .prologue
    .line 30
    iget-object v0, p0, Lcom/getjar/sdk/data/usage/UsageMonitor;->_monitoringThreadLock:Ljava/lang/Object;

    return-object v0
.end method

.method private getCommContext(Landroid/content/Context;)Lcom/getjar/sdk/comm/CommContext;
    .locals 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 467
    if-nez p1, :cond_0

    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "context cannot be null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 469
    :cond_0
    invoke-static {p1}, Lcom/getjar/sdk/comm/auth/ApplicationKeyDatabase;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/comm/auth/ApplicationKeyDatabase;

    move-result-object v2

    invoke-virtual {v2}, Lcom/getjar/sdk/comm/auth/ApplicationKeyDatabase;->getApplicationKey()Ljava/lang/String;

    move-result-object v0

    .line 470
    .local v0, "applicationKey":Ljava/lang/String;
    invoke-static {v0}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "Unable to access the application key"

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 472
    :cond_1
    new-instance v2, Lcom/getjar/sdk/data/usage/UsageMonitor$1;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v3}, Lcom/getjar/sdk/data/usage/UsageMonitor$1;-><init>(Lcom/getjar/sdk/data/usage/UsageMonitor;Landroid/os/Handler;)V

    sget-object v3, Lcom/getjar/sdk/comm/CommManager$LaunchWork;->NONE:Lcom/getjar/sdk/comm/CommManager$LaunchWork;

    invoke-static {v0, p1, v2, v3}, Lcom/getjar/sdk/comm/CommManager;->createContext(Ljava/lang/String;Landroid/content/Context;Landroid/os/ResultReceiver;Lcom/getjar/sdk/comm/CommManager$LaunchWork;)Lcom/getjar/sdk/comm/CommContext;

    move-result-object v1

    .line 486
    .local v1, "commContext":Lcom/getjar/sdk/comm/CommContext;
    return-object v1
.end method

.method public static declared-synchronized getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/usage/UsageMonitor;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 55
    const-class v1, Lcom/getjar/sdk/data/usage/UsageMonitor;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/getjar/sdk/data/usage/UsageMonitor;->_Instance:Lcom/getjar/sdk/data/usage/UsageMonitor;

    if-nez v0, :cond_0

    .line 56
    new-instance v0, Lcom/getjar/sdk/data/usage/UsageMonitor;

    invoke-direct {v0, p0}, Lcom/getjar/sdk/data/usage/UsageMonitor;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/getjar/sdk/data/usage/UsageMonitor;->_Instance:Lcom/getjar/sdk/data/usage/UsageMonitor;

    .line 58
    :cond_0
    sget-object v0, Lcom/getjar/sdk/data/usage/UsageMonitor;->_Instance:Lcom/getjar/sdk/data/usage/UsageMonitor;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 55
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private getRunningPackageNames()Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 440
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 441
    .local v1, "runningPackageNames":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iget-object v4, p0, Lcom/getjar/sdk/data/usage/UsageMonitor;->_context:Landroid/content/Context;

    const-string v5, "android.permission.GET_TASKS"

    invoke-static {v4, v5}, Lcom/getjar/sdk/utilities/RewardUtility;->checkPermission(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 442
    iget-object v4, p0, Lcom/getjar/sdk/data/usage/UsageMonitor;->_context:Landroid/content/Context;

    const-string v5, "activity"

    invoke-virtual {v4, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/app/ActivityManager;

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Landroid/app/ActivityManager;->getRunningTasks(I)Ljava/util/List;

    move-result-object v2

    .line 445
    .local v2, "runningTasks":Ljava/util/List;, "Ljava/util/List<Landroid/app/ActivityManager$RunningTaskInfo;>;"
    if-eqz v2, :cond_1

    .line 446
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/app/ActivityManager$RunningTaskInfo;

    .line 447
    .local v3, "task":Landroid/app/ActivityManager$RunningTaskInfo;
    iget-object v4, v3, Landroid/app/ActivityManager$RunningTaskInfo;->topActivity:Landroid/content/ComponentName;

    invoke-virtual {v4}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 448
    iget-object v4, v3, Landroid/app/ActivityManager$RunningTaskInfo;->topActivity:Landroid/content/ComponentName;

    invoke-virtual {v4}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 455
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v2    # "runningTasks":Ljava/util/List;, "Ljava/util/List<Landroid/app/ActivityManager$RunningTaskInfo;>;"
    .end local v3    # "task":Landroid/app/ActivityManager$RunningTaskInfo;
    :cond_1
    return-object v1
.end method


# virtual methods
.method public isMonitoring()Z
    .locals 2

    .prologue
    .line 93
    iget-object v0, p0, Lcom/getjar/sdk/data/usage/UsageMonitor;->_monitoringState:Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;

    sget-object v1, Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;->STOPPED:Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/getjar/sdk/data/usage/UsageMonitor;->_monitoringState:Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;

    sget-object v1, Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;->STOPPING:Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public startMonitoring()V
    .locals 10

    .prologue
    .line 101
    iget-object v1, p0, Lcom/getjar/sdk/data/usage/UsageMonitor;->_startStopLock:Ljava/lang/Object;

    monitor-enter v1

    .line 104
    :try_start_0
    iget-object v0, p0, Lcom/getjar/sdk/data/usage/UsageMonitor;->_context:Landroid/content/Context;

    invoke-static {v0}, Lcom/getjar/sdk/data/usage/UsageManager;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/usage/UsageManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/getjar/sdk/data/usage/UsageManager;->isMonitoringEnabled()Z

    move-result v0

    if-nez v0, :cond_0

    monitor-exit v1

    .line 138
    :goto_0
    return-void

    .line 107
    :cond_0
    invoke-static {}, Lcom/getjar/sdk/data/usage/UsageScreenReceiver;->getInstance()Lcom/getjar/sdk/data/usage/UsageScreenReceiver;

    move-result-object v0

    iget-object v2, p0, Lcom/getjar/sdk/data/usage/UsageMonitor;->_context:Landroid/content/Context;

    invoke-virtual {v0, v2}, Lcom/getjar/sdk/data/usage/UsageScreenReceiver;->isScreenOn(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_1

    monitor-exit v1

    goto :goto_0

    .line 137
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    .line 110
    :cond_1
    :try_start_1
    sget-boolean v0, Lcom/getjar/sdk/data/usage/UsageMonitor;->_DebugHookSuppressMonitoring:Z

    if-eqz v0, :cond_2

    monitor-exit v1

    goto :goto_0

    .line 112
    :cond_2
    iget-object v2, p0, Lcom/getjar/sdk/data/usage/UsageMonitor;->_monitoringThreadLock:Ljava/lang/Object;

    monitor-enter v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 113
    :try_start_2
    sget-object v0, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    const-string v5, "Start monitoring being attempted while in monitoring state \'%1$s\'"

    const/4 v0, 0x1

    new-array v6, v0, [Ljava/lang/Object;

    const/4 v7, 0x0

    iget-object v0, p0, Lcom/getjar/sdk/data/usage/UsageMonitor;->_monitoringThread:Lcom/getjar/sdk/data/usage/UsageMonitor$UsageMonitoringThread;

    if-nez v0, :cond_3

    const-string v0, "STOPPED"

    :goto_1
    aput-object v0, v6, v7

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v4, v0}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 116
    iget-object v0, p0, Lcom/getjar/sdk/data/usage/UsageMonitor;->_monitoringState:Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;

    sget-object v3, Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;->STOPPED:Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;

    if-ne v0, v3, :cond_4

    .line 117
    sget-object v0, Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;->STARTING:Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;

    iput-object v0, p0, Lcom/getjar/sdk/data/usage/UsageMonitor;->_monitoringState:Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;

    .line 118
    new-instance v0, Lcom/getjar/sdk/data/usage/UsageMonitor$UsageMonitoringThread;

    const/4 v3, 0x0

    invoke-direct {v0, p0, v3}, Lcom/getjar/sdk/data/usage/UsageMonitor$UsageMonitoringThread;-><init>(Lcom/getjar/sdk/data/usage/UsageMonitor;Lcom/getjar/sdk/data/usage/UsageMonitor$1;)V

    iput-object v0, p0, Lcom/getjar/sdk/data/usage/UsageMonitor;->_monitoringThread:Lcom/getjar/sdk/data/usage/UsageMonitor$UsageMonitoringThread;

    .line 119
    sget-object v0, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    const-string v0, "UsageMonitor: usage monitoring thread [instantiated]"

    invoke-static {v3, v4, v0}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 121
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/getjar/sdk/data/usage/UsageMonitor;->_requestThreadExit:Z

    .line 124
    iget-object v0, p0, Lcom/getjar/sdk/data/usage/UsageMonitor;->_monitoringThread:Lcom/getjar/sdk/data/usage/UsageMonitor$UsageMonitoringThread;

    invoke-virtual {v0}, Lcom/getjar/sdk/data/usage/UsageMonitor$UsageMonitoringThread;->start()V

    .line 125
    sget-object v0, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    const-string v0, "UsageMonitor: usage monitoring thread [start() called]"

    invoke-static {v3, v4, v0}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 131
    :goto_2
    invoke-static {}, Lcom/getjar/sdk/data/usage/UsageScreenReceiver;->getInstance()Lcom/getjar/sdk/data/usage/UsageScreenReceiver;

    move-result-object v0

    iget-object v3, p0, Lcom/getjar/sdk/data/usage/UsageMonitor;->_context:Landroid/content/Context;

    invoke-virtual {v0, v3}, Lcom/getjar/sdk/data/usage/UsageScreenReceiver;->registerReceiver(Landroid/content/Context;)V

    .line 134
    iget-object v0, p0, Lcom/getjar/sdk/data/usage/UsageMonitor;->_context:Landroid/content/Context;

    new-instance v3, Landroid/content/Intent;

    iget-object v4, p0, Lcom/getjar/sdk/data/usage/UsageMonitor;->_context:Landroid/content/Context;

    const-class v5, Lcom/getjar/sdk/rewards/GetJarService;

    invoke-direct {v3, v4, v5}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, v3}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 135
    sget-object v0, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "UsageMonitor: usage monitoring thread started [thread id: %1$d]"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    iget-object v8, p0, Lcom/getjar/sdk/data/usage/UsageMonitor;->_monitoringThread:Lcom/getjar/sdk/data/usage/UsageMonitor$UsageMonitoringThread;

    invoke-virtual {v8}, Lcom/getjar/sdk/data/usage/UsageMonitor$UsageMonitoringThread;->getId()J

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v0, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v4, v0}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 136
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 137
    :try_start_3
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto/16 :goto_0

    .line 113
    :cond_3
    :try_start_4
    const-string v0, "STARTED"

    goto :goto_1

    .line 127
    :cond_4
    sget-object v0, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    const-string v0, "Start monitoring found monitoring already running on thread \'%1$d\'"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    iget-object v7, p0, Lcom/getjar/sdk/data/usage/UsageMonitor;->_monitoringThread:Lcom/getjar/sdk/data/usage/UsageMonitor$UsageMonitoringThread;

    invoke-virtual {v7}, Lcom/getjar/sdk/data/usage/UsageMonitor$UsageMonitoringThread;->getId()J

    move-result-wide v7

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v0, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v4, v0}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    goto :goto_2

    .line 136
    :catchall_1
    move-exception v0

    monitor-exit v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    :try_start_5
    throw v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0
.end method

.method public stopMonitoring()V
    .locals 15

    .prologue
    .line 145
    iget-object v6, p0, Lcom/getjar/sdk/data/usage/UsageMonitor;->_startStopLock:Ljava/lang/Object;

    monitor-enter v6

    .line 146
    const/4 v1, 0x0

    .line 150
    .local v1, "monitoringThreadRef":Lcom/getjar/sdk/data/usage/UsageMonitor$UsageMonitoringThread;
    :try_start_0
    iget-object v5, p0, Lcom/getjar/sdk/data/usage/UsageMonitor;->_monitoringThreadLock:Ljava/lang/Object;

    monitor-enter v5
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    .line 151
    :try_start_1
    sget-object v4, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    const-string v9, "Stop monitoring being attempted while inmonitoring state \'%1$s\'"

    const/4 v4, 0x1

    new-array v10, v4, [Ljava/lang/Object;

    const/4 v11, 0x0

    iget-object v4, p0, Lcom/getjar/sdk/data/usage/UsageMonitor;->_monitoringThread:Lcom/getjar/sdk/data/usage/UsageMonitor$UsageMonitoringThread;

    if-nez v4, :cond_2

    const-string v4, "STOPPED"

    :goto_0
    aput-object v4, v10, v11

    invoke-static {v9, v10}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v7, v8, v4}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 152
    iget-object v4, p0, Lcom/getjar/sdk/data/usage/UsageMonitor;->_monitoringState:Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;

    sget-object v7, Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;->STARTED:Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;

    if-eq v4, v7, :cond_0

    iget-object v4, p0, Lcom/getjar/sdk/data/usage/UsageMonitor;->_monitoringState:Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;

    sget-object v7, Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;->PAUSED:Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;

    if-ne v4, v7, :cond_3

    .line 153
    :cond_0
    sget-object v4, Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;->STOPPING:Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;

    iput-object v4, p0, Lcom/getjar/sdk/data/usage/UsageMonitor;->_monitoringState:Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;

    .line 154
    iget-object v1, p0, Lcom/getjar/sdk/data/usage/UsageMonitor;->_monitoringThread:Lcom/getjar/sdk/data/usage/UsageMonitor$UsageMonitoringThread;

    .line 155
    const/4 v4, 0x1

    iput-boolean v4, p0, Lcom/getjar/sdk/data/usage/UsageMonitor;->_requestThreadExit:Z

    .line 156
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/getjar/sdk/data/usage/UsageMonitor;->_monitoringThread:Lcom/getjar/sdk/data/usage/UsageMonitor$UsageMonitoringThread;

    .line 161
    iget-object v7, p0, Lcom/getjar/sdk/data/usage/UsageMonitor;->_intervalWaitMonitor:Ljava/lang/Object;

    monitor-enter v7
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 162
    :try_start_2
    iget-object v4, p0, Lcom/getjar/sdk/data/usage/UsageMonitor;->_intervalWaitMonitor:Ljava/lang/Object;

    invoke-virtual {v4}, Ljava/lang/Object;->notify()V

    .line 163
    monitor-exit v7
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 164
    :try_start_3
    iget-object v7, p0, Lcom/getjar/sdk/data/usage/UsageMonitor;->_pausingMonitor:Ljava/lang/Object;

    monitor-enter v7
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 165
    :try_start_4
    iget-object v4, p0, Lcom/getjar/sdk/data/usage/UsageMonitor;->_pausingMonitor:Ljava/lang/Object;

    invoke-virtual {v4}, Ljava/lang/Object;->notify()V

    .line 166
    monitor-exit v7
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 167
    :try_start_5
    sget-object v4, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    const-string v4, "Stop monitoring stopping monitoring on thread \'%1$d\'"

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    invoke-virtual {v1}, Lcom/getjar/sdk/data/usage/UsageMonitor$UsageMonitoringThread;->getId()J

    move-result-wide v11

    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    aput-object v11, v9, v10

    invoke-static {v4, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v7, v8, v4}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 171
    :goto_1
    monitor-exit v5
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 173
    if-eqz v1, :cond_1

    .line 174
    :try_start_6
    invoke-static {}, Ljava/lang/System;->nanoTime()J
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_0
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    move-result-wide v2

    .line 176
    .local v2, "startTime":J
    const-wide/16 v4, 0x7d0

    :try_start_7
    invoke-virtual {v1, v4, v5}, Lcom/getjar/sdk/data/usage/UsageMonitor$UsageMonitoringThread;->join(J)V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_1
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    .line 180
    :goto_2
    :try_start_8
    sget-object v4, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    sget-object v7, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v8, "UsageMonitor: stopMonitoring() join on monitoring thread took %1$,.2f ms."

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v11

    sub-long/2addr v11, v2

    long-to-double v11, v11

    const-wide v13, 0x412e848000000000L    # 1000000.0

    div-double/2addr v11, v13

    invoke-static {v11, v12}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v11

    aput-object v11, v9, v10

    invoke-static {v7, v8, v9}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v4, v5, v7}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 181
    invoke-virtual {v1}, Lcom/getjar/sdk/data/usage/UsageMonitor$UsageMonitoringThread;->interrupt()V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_0
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    .line 184
    const-wide/16 v4, 0x7d0

    :try_start_9
    invoke-virtual {v1, v4, v5}, Lcom/getjar/sdk/data/usage/UsageMonitor$UsageMonitoringThread;->join(J)V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_2
    .catchall {:try_start_9 .. :try_end_9} :catchall_3

    .line 193
    .end local v2    # "startTime":J
    :cond_1
    :goto_3
    :try_start_a
    sget-object v4, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v9, "UsageMonitor: usage monitoring thread stopped [thread id: %1$s]"

    const/4 v4, 0x1

    new-array v10, v4, [Ljava/lang/Object;

    const/4 v11, 0x0

    if-eqz v1, :cond_4

    invoke-virtual {v1}, Lcom/getjar/sdk/data/usage/UsageMonitor$UsageMonitoringThread;->getId()J

    move-result-wide v12

    invoke-static {v12, v13}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v4

    :goto_4
    aput-object v4, v10, v11

    invoke-static {v5, v9, v10}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v7, v8, v4}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 196
    const/4 v1, 0x0

    .line 198
    :goto_5
    monitor-exit v6
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_4

    .line 199
    return-void

    .line 151
    :cond_2
    :try_start_b
    const-string v4, "STARTED"
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_1

    goto/16 :goto_0

    .line 163
    :catchall_0
    move-exception v4

    :try_start_c
    monitor-exit v7
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_0

    :try_start_d
    throw v4

    .line 171
    :catchall_1
    move-exception v4

    monitor-exit v5
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_1

    :try_start_e
    throw v4
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_0
    .catchall {:try_start_e .. :try_end_e} :catchall_3

    .line 190
    :catch_0
    move-exception v0

    .line 191
    .local v0, "e":Ljava/lang/Exception;
    :try_start_f
    sget-object v4, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    const-string v7, "UsageMonitor: stopMonitoring() failed"

    invoke-static {v4, v5, v7, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_3

    .line 193
    :try_start_10
    sget-object v4, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v9, "UsageMonitor: usage monitoring thread stopped [thread id: %1$s]"

    const/4 v4, 0x1

    new-array v10, v4, [Ljava/lang/Object;

    const/4 v11, 0x0

    if-eqz v1, :cond_5

    invoke-virtual {v1}, Lcom/getjar/sdk/data/usage/UsageMonitor$UsageMonitoringThread;->getId()J

    move-result-wide v12

    invoke-static {v12, v13}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v4

    :goto_6
    aput-object v4, v10, v11

    invoke-static {v5, v9, v10}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v7, v8, v4}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_4

    .line 196
    const/4 v1, 0x0

    .line 197
    goto :goto_5

    .line 166
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_2
    move-exception v4

    :try_start_11
    monitor-exit v7
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_2

    :try_start_12
    throw v4

    .line 169
    :cond_3
    sget-object v4, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    const-string v4, "Stop monitoring found monitoring already stopped"

    invoke-static {v7, v8, v4}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_1

    goto/16 :goto_1

    .line 177
    .restart local v2    # "startTime":J
    :catch_1
    move-exception v0

    .line 178
    .restart local v0    # "e":Ljava/lang/Exception;
    :try_start_13
    sget-object v4, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    const-string v7, "UsageMonitor: join() failed"

    invoke-static {v4, v5, v7, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V
    :try_end_13
    .catch Ljava/lang/Exception; {:try_start_13 .. :try_end_13} :catch_0
    .catchall {:try_start_13 .. :try_end_13} :catchall_3

    goto/16 :goto_2

    .line 193
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v2    # "startTime":J
    :catchall_3
    move-exception v4

    :try_start_14
    sget-object v5, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    sget-object v9, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v10, "UsageMonitor: usage monitoring thread stopped [thread id: %1$s]"

    const/4 v5, 0x1

    new-array v11, v5, [Ljava/lang/Object;

    const/4 v12, 0x0

    if-eqz v1, :cond_6

    invoke-virtual {v1}, Lcom/getjar/sdk/data/usage/UsageMonitor$UsageMonitoringThread;->getId()J

    move-result-wide v13

    invoke-static {v13, v14}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v5

    :goto_7
    aput-object v5, v11, v12

    invoke-static {v9, v10, v11}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v7, v8, v5}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 196
    const/4 v1, 0x0

    throw v4

    .line 198
    :catchall_4
    move-exception v4

    monitor-exit v6
    :try_end_14
    .catchall {:try_start_14 .. :try_end_14} :catchall_4

    throw v4

    .line 185
    .restart local v2    # "startTime":J
    :catch_2
    move-exception v0

    .line 186
    .restart local v0    # "e":Ljava/lang/Exception;
    :try_start_15
    sget-object v4, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    const-string v7, "UsageMonitor: join() failed yet again"

    invoke-static {v4, v5, v7, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V
    :try_end_15
    .catch Ljava/lang/Exception; {:try_start_15 .. :try_end_15} :catch_0
    .catchall {:try_start_15 .. :try_end_15} :catchall_3

    goto/16 :goto_3

    .line 193
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v2    # "startTime":J
    :cond_4
    :try_start_16
    const-string v4, "null"

    goto/16 :goto_4

    .restart local v0    # "e":Ljava/lang/Exception;
    :cond_5
    const-string v4, "null"

    goto :goto_6

    .end local v0    # "e":Ljava/lang/Exception;
    :cond_6
    const-string v5, "null"
    :try_end_16
    .catchall {:try_start_16 .. :try_end_16} :catchall_4

    goto :goto_7
.end method
