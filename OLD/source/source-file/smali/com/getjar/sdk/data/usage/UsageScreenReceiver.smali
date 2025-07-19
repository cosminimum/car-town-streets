.class public Lcom/getjar/sdk/data/usage/UsageScreenReceiver;
.super Landroid/content/BroadcastReceiver;
.source "UsageScreenReceiver.java"


# static fields
.field private static volatile _Instance:Lcom/getjar/sdk/data/usage/UsageScreenReceiver;


# instance fields
.field private _isRegistered:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 23
    const/4 v0, 0x0

    sput-object v0, Lcom/getjar/sdk/data/usage/UsageScreenReceiver;->_Instance:Lcom/getjar/sdk/data/usage/UsageScreenReceiver;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .prologue
    .line 22
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 31
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/getjar/sdk/data/usage/UsageScreenReceiver;->_isRegistered:Z

    .line 22
    return-void
.end method

.method protected static declared-synchronized getInstance()Lcom/getjar/sdk/data/usage/UsageScreenReceiver;
    .locals 2

    .prologue
    .line 25
    const-class v1, Lcom/getjar/sdk/data/usage/UsageScreenReceiver;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/getjar/sdk/data/usage/UsageScreenReceiver;->_Instance:Lcom/getjar/sdk/data/usage/UsageScreenReceiver;

    if-nez v0, :cond_0

    .line 26
    new-instance v0, Lcom/getjar/sdk/data/usage/UsageScreenReceiver;

    invoke-direct {v0}, Lcom/getjar/sdk/data/usage/UsageScreenReceiver;-><init>()V

    sput-object v0, Lcom/getjar/sdk/data/usage/UsageScreenReceiver;->_Instance:Lcom/getjar/sdk/data/usage/UsageScreenReceiver;

    .line 28
    :cond_0
    sget-object v0, Lcom/getjar/sdk/data/usage/UsageScreenReceiver;->_Instance:Lcom/getjar/sdk/data/usage/UsageScreenReceiver;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 25
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method public doOnReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 64
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "android.intent.action.SCREEN_OFF"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 66
    sget-object v0, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    const-string v2, "Usage: UsageScreenReceiver: screen off"

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    .line 67
    invoke-static {p1}, Lcom/getjar/sdk/data/usage/UsageManager;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/usage/UsageManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/getjar/sdk/data/usage/UsageManager;->stopPhoneSession()V

    .line 73
    :cond_0
    :goto_0
    return-void

    .line 68
    :cond_1
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "android.intent.action.SCREEN_ON"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 70
    sget-object v0, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    const-string v2, "Usage: UsageScreenReceiver: screen on"

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    .line 71
    invoke-static {p1}, Lcom/getjar/sdk/data/usage/UsageManager;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/usage/UsageManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/getjar/sdk/data/usage/UsageManager;->startPhoneSession()V

    goto :goto_0
.end method

.method public isScreenOn(Landroid/content/Context;)Z
    .locals 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 78
    :try_start_0
    const-string v1, "power"

    invoke-virtual {p1, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/PowerManager;

    invoke-virtual {v1}, Landroid/os/PowerManager;->isScreenOn()Z
    :try_end_0
    .catch Ljava/lang/NoSuchMethodError; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 85
    :goto_0
    return v1

    .line 79
    :catch_0
    move-exception v0

    .line 84
    .local v0, "e":Ljava/lang/NoSuchMethodError;
    sget-object v1, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    const-string v3, "Usage: UsageScreenReceiver: isScreenOn() failed"

    invoke-static {v1, v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 85
    const/4 v1, 0x1

    goto :goto_0
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 36
    :try_start_0
    sget-object v3, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    const-string v5, "UsageScreenReceiver onReceive start()"

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 38
    move-object v1, p1

    .line 39
    .local v1, "finalContext":Landroid/content/Context;
    move-object v2, p2

    .line 40
    .local v2, "finalIntent":Landroid/content/Intent;
    new-instance v3, Ljava/lang/Thread;

    new-instance v4, Lcom/getjar/sdk/data/usage/UsageScreenReceiver$1;

    invoke-direct {v4, p0, v1, v2}, Lcom/getjar/sdk/data/usage/UsageScreenReceiver$1;-><init>(Lcom/getjar/sdk/data/usage/UsageScreenReceiver;Landroid/content/Context;Landroid/content/Intent;)V

    const-string v5, "UsageScreenReceiver Worker Thread"

    invoke-direct {v3, v4, v5}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/lang/Thread;->start()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 61
    .end local v1    # "finalContext":Landroid/content/Context;
    .end local v2    # "finalIntent":Landroid/content/Intent;
    :goto_0
    return-void

    .line 56
    :catch_0
    move-exception v0

    .line 59
    .local v0, "e":Ljava/lang/Exception;
    sget-object v3, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    const-string v5, "UsageScreenReceiver: onReceive() failed"

    invoke-static {v3, v4, v5, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method protected declared-synchronized registerReceiver(Landroid/content/Context;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 91
    monitor-enter p0

    :try_start_0
    iget-boolean v1, p0, Lcom/getjar/sdk/data/usage/UsageScreenReceiver;->_isRegistered:Z

    if-nez v1, :cond_0

    .line 94
    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "android.intent.action.SCREEN_ON"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 95
    .local v0, "filter":Landroid/content/IntentFilter;
    const-string v1, "android.intent.action.SCREEN_OFF"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 96
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, p0, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 99
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/getjar/sdk/data/usage/UsageScreenReceiver;->_isRegistered:Z

    .line 100
    sget-object v1, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    const-string v3, "Usage: UsageScreenReceiver: screen monitor registered"

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 102
    .end local v0    # "filter":Landroid/content/IntentFilter;
    :cond_0
    monitor-exit p0

    return-void

    .line 91
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method protected declared-synchronized unregisterReceiver(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 106
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/getjar/sdk/data/usage/UsageScreenReceiver;->_isRegistered:Z

    if-eqz v0, :cond_0

    .line 109
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 110
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/getjar/sdk/data/usage/UsageScreenReceiver;->_isRegistered:Z

    .line 111
    sget-object v0, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    const-string v2, "Usage: UsageScreenReceiver: screen monitor unregistered"

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 113
    :cond_0
    monitor-exit p0

    return-void

    .line 106
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
