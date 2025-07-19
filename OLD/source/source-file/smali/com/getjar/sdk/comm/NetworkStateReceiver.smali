.class public Lcom/getjar/sdk/comm/NetworkStateReceiver;
.super Landroid/content/BroadcastReceiver;
.source "NetworkStateReceiver.java"


# static fields
.field private static volatile _Instance:Lcom/getjar/sdk/comm/NetworkStateReceiver;


# instance fields
.field private volatile _isRegistered:Z

.field private volatile _registrationLock:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 26
    const/4 v0, 0x0

    sput-object v0, Lcom/getjar/sdk/comm/NetworkStateReceiver;->_Instance:Lcom/getjar/sdk/comm/NetworkStateReceiver;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .prologue
    .line 25
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 34
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/getjar/sdk/comm/NetworkStateReceiver;->_registrationLock:Ljava/lang/Object;

    .line 35
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/getjar/sdk/comm/NetworkStateReceiver;->_isRegistered:Z

    .line 25
    return-void
.end method

.method protected static declared-synchronized getInstance()Lcom/getjar/sdk/comm/NetworkStateReceiver;
    .locals 2

    .prologue
    .line 28
    const-class v1, Lcom/getjar/sdk/comm/NetworkStateReceiver;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/getjar/sdk/comm/NetworkStateReceiver;->_Instance:Lcom/getjar/sdk/comm/NetworkStateReceiver;

    if-nez v0, :cond_0

    .line 29
    new-instance v0, Lcom/getjar/sdk/comm/NetworkStateReceiver;

    invoke-direct {v0}, Lcom/getjar/sdk/comm/NetworkStateReceiver;-><init>()V

    sput-object v0, Lcom/getjar/sdk/comm/NetworkStateReceiver;->_Instance:Lcom/getjar/sdk/comm/NetworkStateReceiver;

    .line 31
    :cond_0
    sget-object v0, Lcom/getjar/sdk/comm/NetworkStateReceiver;->_Instance:Lcom/getjar/sdk/comm/NetworkStateReceiver;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 28
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method public doOnReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 13
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v12, 0x0

    .line 72
    :try_start_0
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 73
    .local v0, "action":Ljava/lang/String;
    invoke-static {v0}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 126
    .end local v0    # "action":Ljava/lang/String;
    :cond_0
    :goto_0
    return-void

    .line 75
    .restart local v0    # "action":Ljava/lang/String;
    :cond_1
    const-string v6, "android.net.conn.CONNECTIVITY_CHANGE"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 76
    const-string v6, "noConnectivity"

    const/4 v7, 0x0

    invoke-virtual {p2, v6, v7}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v4

    .line 77
    .local v4, "noConnectivity":Z
    if-eqz v4, :cond_2

    .line 80
    sget-object v6, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    sget-object v8, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v8}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v8

    or-long/2addr v6, v8

    sget-object v8, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v8}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v8

    or-long/2addr v6, v8

    const-string v8, "NetworkStateReceiver: onReceive() network connection lost"

    invoke-static {v6, v7, v8}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V
    :try_end_0
    .catch Lcom/getjar/sdk/exceptions/AuthException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 118
    .end local v0    # "action":Ljava/lang/String;
    .end local v4    # "noConnectivity":Z
    :catch_0
    move-exception v3

    .line 120
    .local v3, "e":Lcom/getjar/sdk/exceptions/AuthException;
    sget-object v6, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    sget-object v8, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v8}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v8

    or-long/2addr v6, v8

    sget-object v8, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v8}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v8

    or-long/2addr v6, v8

    sget-object v8, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v9, "NetworkStateReceiver: onReceive() not yet authed [%1$s]"

    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/Object;

    invoke-virtual {v3}, Lcom/getjar/sdk/exceptions/AuthException;->getMessage()Ljava/lang/String;

    move-result-object v11

    aput-object v11, v10, v12

    invoke-static {v8, v9, v10}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v6, v7, v8}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;)V

    goto :goto_0

    .line 84
    .end local v3    # "e":Lcom/getjar/sdk/exceptions/AuthException;
    .restart local v0    # "action":Ljava/lang/String;
    .restart local v4    # "noConnectivity":Z
    :cond_2
    :try_start_1
    sget-object v6, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    sget-object v8, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v8}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v8

    or-long/2addr v6, v8

    sget-object v8, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v8}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v8

    or-long/2addr v6, v8

    const-string v8, "NetworkStateReceiver: onReceive() network connection restored"

    invoke-static {v6, v7, v8}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    .line 93
    invoke-static {p1}, Lcom/getjar/sdk/comm/auth/ApplicationKeyDatabase;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/comm/auth/ApplicationKeyDatabase;

    move-result-object v6

    invoke-virtual {v6}, Lcom/getjar/sdk/comm/auth/ApplicationKeyDatabase;->getApplicationKey()Ljava/lang/String;

    move-result-object v1

    .line 94
    .local v1, "applicationKey":Ljava/lang/String;
    invoke-static {v1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_3

    new-instance v6, Ljava/lang/IllegalStateException;

    const-string v7, "Unable to access the application key"

    invoke-direct {v6, v7}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v6
    :try_end_1
    .catch Lcom/getjar/sdk/exceptions/AuthException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 121
    .end local v0    # "action":Ljava/lang/String;
    .end local v1    # "applicationKey":Ljava/lang/String;
    .end local v4    # "noConnectivity":Z
    :catch_1
    move-exception v3

    .line 124
    .local v3, "e":Ljava/lang/Exception;
    sget-object v6, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    sget-object v8, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v8}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v8

    or-long/2addr v6, v8

    sget-object v8, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v8}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v8

    or-long/2addr v6, v8

    const-string v8, "NetworkStateReceiver: onReceive() failed"

    invoke-static {v6, v7, v8, v3}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_0

    .line 95
    .end local v3    # "e":Ljava/lang/Exception;
    .restart local v0    # "action":Ljava/lang/String;
    .restart local v1    # "applicationKey":Ljava/lang/String;
    .restart local v4    # "noConnectivity":Z
    :cond_3
    :try_start_2
    new-instance v6, Lcom/getjar/sdk/comm/NetworkStateReceiver$2;

    const/4 v7, 0x0

    invoke-direct {v6, p0, v7}, Lcom/getjar/sdk/comm/NetworkStateReceiver$2;-><init>(Lcom/getjar/sdk/comm/NetworkStateReceiver;Landroid/os/Handler;)V

    sget-object v7, Lcom/getjar/sdk/comm/CommManager$LaunchWork;->NONE:Lcom/getjar/sdk/comm/CommManager$LaunchWork;

    invoke-static {v1, p1, v6, v7}, Lcom/getjar/sdk/comm/CommManager;->createContext(Ljava/lang/String;Landroid/content/Context;Landroid/os/ResultReceiver;Lcom/getjar/sdk/comm/CommManager$LaunchWork;)Lcom/getjar/sdk/comm/CommContext;

    move-result-object v2

    .line 109
    .local v2, "commContext":Lcom/getjar/sdk/comm/CommContext;
    invoke-static {p1}, Lcom/getjar/sdk/comm/auth/AuthManager;->initialize(Landroid/content/Context;)V

    .line 110
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v6

    invoke-virtual {v6}, Lcom/getjar/sdk/comm/auth/AuthManager;->waitOnAuth()V

    .line 113
    new-instance v5, Lcom/getjar/sdk/comm/TransactionManager;

    invoke-direct {v5, p1}, Lcom/getjar/sdk/comm/TransactionManager;-><init>(Landroid/content/Context;)V

    .line 114
    .local v5, "transactionManager":Lcom/getjar/sdk/comm/TransactionManager;
    invoke-virtual {v5, v2}, Lcom/getjar/sdk/comm/TransactionManager;->recoverOrphanedTransactions(Lcom/getjar/sdk/comm/CommContext;)V
    :try_end_2
    .catch Lcom/getjar/sdk/exceptions/AuthException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto/16 :goto_0
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 40
    sget-object v3, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    const-string v5, "NetworkStateReceiver: onReceive(): START"

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 44
    move-object v1, p1

    .line 45
    .local v1, "finalContext":Landroid/content/Context;
    move-object v2, p2

    .line 46
    .local v2, "finalIntent":Landroid/content/Intent;
    :try_start_0
    new-instance v3, Ljava/lang/Thread;

    new-instance v4, Lcom/getjar/sdk/comm/NetworkStateReceiver$1;

    invoke-direct {v4, p0, v1, v2}, Lcom/getjar/sdk/comm/NetworkStateReceiver$1;-><init>(Lcom/getjar/sdk/comm/NetworkStateReceiver;Landroid/content/Context;Landroid/content/Intent;)V

    const-string v5, "NetworkStateReceiver Worker Thread"

    invoke-direct {v3, v4, v5}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/lang/Thread;->start()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 67
    :goto_0
    return-void

    .line 62
    :catch_0
    move-exception v0

    .line 65
    .local v0, "e":Ljava/lang/Exception;
    sget-object v3, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    const-string v5, "PackageMonitor: onReceive() failed"

    invoke-static {v3, v4, v5, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method protected registerReceiver(Landroid/content/Context;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 130
    iget-object v2, p0, Lcom/getjar/sdk/comm/NetworkStateReceiver;->_registrationLock:Ljava/lang/Object;

    monitor-enter v2

    .line 131
    :try_start_0
    iget-boolean v1, p0, Lcom/getjar/sdk/comm/NetworkStateReceiver;->_isRegistered:Z

    if-nez v1, :cond_0

    .line 134
    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "android.net.conn.CONNECTIVITY_CHANGE"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 135
    .local v0, "filter":Landroid/content/IntentFilter;
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, p0, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 138
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/getjar/sdk/comm/NetworkStateReceiver;->_isRegistered:Z

    .line 139
    sget-object v1, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    const-string v1, "NetworkStateReceiver: registered"

    invoke-static {v3, v4, v1}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 141
    .end local v0    # "filter":Landroid/content/IntentFilter;
    :cond_0
    monitor-exit v2

    .line 142
    return-void

    .line 141
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method protected unregisterReceiver(Landroid/content/Context;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 145
    iget-object v1, p0, Lcom/getjar/sdk/comm/NetworkStateReceiver;->_registrationLock:Ljava/lang/Object;

    monitor-enter v1

    .line 146
    :try_start_0
    iget-boolean v0, p0, Lcom/getjar/sdk/comm/NetworkStateReceiver;->_isRegistered:Z

    if-eqz v0, :cond_0

    .line 149
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 150
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/getjar/sdk/comm/NetworkStateReceiver;->_isRegistered:Z

    .line 151
    sget-object v0, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    const-string v0, "NetworkStateReceiver: unregistered"

    invoke-static {v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 153
    :cond_0
    monitor-exit v1

    .line 154
    return-void

    .line 153
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
