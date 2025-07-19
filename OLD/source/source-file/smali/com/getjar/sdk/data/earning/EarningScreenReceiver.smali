.class public Lcom/getjar/sdk/data/earning/EarningScreenReceiver;
.super Landroid/content/BroadcastReceiver;
.source "EarningScreenReceiver.java"


# static fields
.field private static volatile _Instance:Lcom/getjar/sdk/data/earning/EarningScreenReceiver;


# instance fields
.field private _isRegistered:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 22
    const/4 v0, 0x0

    sput-object v0, Lcom/getjar/sdk/data/earning/EarningScreenReceiver;->_Instance:Lcom/getjar/sdk/data/earning/EarningScreenReceiver;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .prologue
    .line 21
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 30
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/getjar/sdk/data/earning/EarningScreenReceiver;->_isRegistered:Z

    .line 21
    return-void
.end method

.method protected static declared-synchronized getInstance()Lcom/getjar/sdk/data/earning/EarningScreenReceiver;
    .locals 2

    .prologue
    .line 24
    const-class v1, Lcom/getjar/sdk/data/earning/EarningScreenReceiver;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/getjar/sdk/data/earning/EarningScreenReceiver;->_Instance:Lcom/getjar/sdk/data/earning/EarningScreenReceiver;

    if-nez v0, :cond_0

    .line 25
    new-instance v0, Lcom/getjar/sdk/data/earning/EarningScreenReceiver;

    invoke-direct {v0}, Lcom/getjar/sdk/data/earning/EarningScreenReceiver;-><init>()V

    sput-object v0, Lcom/getjar/sdk/data/earning/EarningScreenReceiver;->_Instance:Lcom/getjar/sdk/data/earning/EarningScreenReceiver;

    .line 27
    :cond_0
    sget-object v0, Lcom/getjar/sdk/data/earning/EarningScreenReceiver;->_Instance:Lcom/getjar/sdk/data/earning/EarningScreenReceiver;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 24
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method public doOnReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 64
    :try_start_0
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    const-string v2, "android.intent.action.SCREEN_OFF"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 66
    sget-object v1, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "Earning: EarningScreenReceiver: screen off"

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    .line 67
    invoke-static {p1}, Lcom/getjar/sdk/data/earning/EarningMonitor;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/earning/EarningMonitor;

    move-result-object v1

    invoke-virtual {v1}, Lcom/getjar/sdk/data/earning/EarningMonitor;->stopMonitoring()V

    .line 78
    :cond_0
    :goto_0
    return-void

    .line 68
    :cond_1
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    const-string v2, "android.intent.action.SCREEN_ON"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 70
    sget-object v1, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "Earning: EarningScreenReceiver: screen on"

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    .line 71
    invoke-static {p1}, Lcom/getjar/sdk/data/earning/EarningMonitor;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/earning/EarningMonitor;

    move-result-object v1

    invoke-virtual {v1}, Lcom/getjar/sdk/data/earning/EarningMonitor;->startMonitoring()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 74
    :catch_0
    move-exception v0

    .line 76
    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "EarningScreenReceiver: doOnReceive() failed"

    invoke-static {v1, v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 37
    move-object v1, p1

    .line 38
    .local v1, "finalContext":Landroid/content/Context;
    move-object v2, p2

    .line 39
    .local v2, "finalIntent":Landroid/content/Intent;
    :try_start_0
    new-instance v3, Ljava/lang/Thread;

    new-instance v4, Lcom/getjar/sdk/data/earning/EarningScreenReceiver$1;

    invoke-direct {v4, p0, v1, v2}, Lcom/getjar/sdk/data/earning/EarningScreenReceiver$1;-><init>(Lcom/getjar/sdk/data/earning/EarningScreenReceiver;Landroid/content/Context;Landroid/content/Intent;)V

    const-string v5, "EarningScreenReceiver Worker Thread"

    invoke-direct {v3, v4, v5}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/lang/Thread;->start()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 59
    :goto_0
    return-void

    .line 55
    :catch_0
    move-exception v0

    .line 57
    .local v0, "e":Ljava/lang/Exception;
    sget-object v3, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    const-string v5, "EarningScreenReceiver: onReceive() failed"

    invoke-static {v3, v4, v5, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method protected declared-synchronized registerReceiver(Landroid/content/Context;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 82
    monitor-enter p0

    :try_start_0
    iget-boolean v1, p0, Lcom/getjar/sdk/data/earning/EarningScreenReceiver;->_isRegistered:Z

    if-nez v1, :cond_0

    .line 85
    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "android.intent.action.SCREEN_ON"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 86
    .local v0, "filter":Landroid/content/IntentFilter;
    const-string v1, "android.intent.action.SCREEN_OFF"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 87
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, p0, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 90
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/getjar/sdk/data/earning/EarningScreenReceiver;->_isRegistered:Z

    .line 91
    sget-object v1, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "Earning: EarningScreenReceiver: screen monitor registered"

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 93
    .end local v0    # "filter":Landroid/content/IntentFilter;
    :cond_0
    monitor-exit p0

    return-void

    .line 82
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method protected declared-synchronized unregisterReceiver(Landroid/content/Context;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 97
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/getjar/sdk/data/earning/EarningScreenReceiver;->_isRegistered:Z

    if-eqz v0, :cond_0

    .line 100
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 101
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/getjar/sdk/data/earning/EarningScreenReceiver;->_isRegistered:Z

    .line 102
    sget-object v0, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    const-string v2, "Earning: EarningScreenReceiver: screen monitor unregistered"

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 104
    :cond_0
    monitor-exit p0

    return-void

    .line 97
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
