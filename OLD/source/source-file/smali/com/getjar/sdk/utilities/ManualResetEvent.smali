.class public Lcom/getjar/sdk/utilities/ManualResetEvent;
.super Ljava/lang/Object;
.source "ManualResetEvent.java"


# instance fields
.field private final monitor:Ljava/lang/Object;

.field private volatile open:Z


# direct methods
.method public constructor <init>(Z)V
    .locals 1
    .param p1, "open"    # Z

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/getjar/sdk/utilities/ManualResetEvent;->monitor:Ljava/lang/Object;

    .line 8
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/getjar/sdk/utilities/ManualResetEvent;->open:Z

    .line 17
    iput-boolean p1, p0, Lcom/getjar/sdk/utilities/ManualResetEvent;->open:Z

    .line 18
    return-void
.end method


# virtual methods
.method public close()V
    .locals 1

    .prologue
    .line 46
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/getjar/sdk/utilities/ManualResetEvent;->open:Z

    .line 47
    return-void
.end method

.method public open()V
    .locals 2

    .prologue
    .line 38
    iget-object v1, p0, Lcom/getjar/sdk/utilities/ManualResetEvent;->monitor:Ljava/lang/Object;

    monitor-enter v1

    .line 39
    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lcom/getjar/sdk/utilities/ManualResetEvent;->open:Z

    .line 40
    iget-object v0, p0, Lcom/getjar/sdk/utilities/ManualResetEvent;->monitor:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 41
    monitor-exit v1

    .line 42
    return-void

    .line 41
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public waitForOpen()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 22
    iget-object v1, p0, Lcom/getjar/sdk/utilities/ManualResetEvent;->monitor:Ljava/lang/Object;

    monitor-enter v1

    .line 23
    :goto_0
    :try_start_0
    iget-boolean v0, p0, Lcom/getjar/sdk/utilities/ManualResetEvent;->open:Z

    if-nez v0, :cond_0

    .line 24
    iget-object v0, p0, Lcom/getjar/sdk/utilities/ManualResetEvent;->monitor:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->wait()V

    goto :goto_0

    .line 26
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    :cond_0
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 27
    return-void
.end method

.method public waitForOpen(J)V
    .locals 2
    .param p1, "maxWaitInMilliseconds"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 31
    iget-object v1, p0, Lcom/getjar/sdk/utilities/ManualResetEvent;->monitor:Ljava/lang/Object;

    monitor-enter v1

    .line 32
    :try_start_0
    iget-object v0, p0, Lcom/getjar/sdk/utilities/ManualResetEvent;->monitor:Ljava/lang/Object;

    invoke-virtual {v0, p1, p2}, Ljava/lang/Object;->wait(J)V

    .line 33
    monitor-exit v1

    .line 34
    return-void

    .line 33
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
