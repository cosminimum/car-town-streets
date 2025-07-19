.class Lcom/apsalar/sdk/ApsalarRetryThread;
.super Ljava/lang/Thread;
.source "ApThread.java"


# static fields
.field private static singleton:Lcom/apsalar/sdk/ApsalarRetryThread;


# instance fields
.field protected events:Ljava/util/concurrent/ArrayBlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ArrayBlockingQueue",
            "<",
            "Lcom/apsalar/sdk/ApsalarAPI;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 514
    const/4 v0, 0x0

    sput-object v0, Lcom/apsalar/sdk/ApsalarRetryThread;->singleton:Lcom/apsalar/sdk/ApsalarRetryThread;

    return-void
.end method

.method private constructor <init>()V
    .locals 2

    .prologue
    .line 529
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 516
    new-instance v0, Ljava/util/concurrent/ArrayBlockingQueue;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/ArrayBlockingQueue;-><init>(I)V

    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarRetryThread;->events:Ljava/util/concurrent/ArrayBlockingQueue;

    .line 529
    return-void
.end method

.method protected static getInstance()Lcom/apsalar/sdk/ApsalarRetryThread;
    .locals 1

    .prologue
    .line 520
    sget-object v0, Lcom/apsalar/sdk/ApsalarRetryThread;->singleton:Lcom/apsalar/sdk/ApsalarRetryThread;

    if-nez v0, :cond_0

    .line 521
    new-instance v0, Lcom/apsalar/sdk/ApsalarRetryThread;

    invoke-direct {v0}, Lcom/apsalar/sdk/ApsalarRetryThread;-><init>()V

    sput-object v0, Lcom/apsalar/sdk/ApsalarRetryThread;->singleton:Lcom/apsalar/sdk/ApsalarRetryThread;

    .line 523
    :cond_0
    sget-object v0, Lcom/apsalar/sdk/ApsalarRetryThread;->singleton:Lcom/apsalar/sdk/ApsalarRetryThread;

    invoke-virtual {v0}, Lcom/apsalar/sdk/ApsalarRetryThread;->isAlive()Z

    move-result v0

    if-nez v0, :cond_1

    .line 524
    sget-object v0, Lcom/apsalar/sdk/ApsalarRetryThread;->singleton:Lcom/apsalar/sdk/ApsalarRetryThread;

    invoke-virtual {v0}, Lcom/apsalar/sdk/ApsalarRetryThread;->start()V

    .line 526
    :cond_1
    sget-object v0, Lcom/apsalar/sdk/ApsalarRetryThread;->singleton:Lcom/apsalar/sdk/ApsalarRetryThread;

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 538
    :cond_0
    :goto_0
    :try_start_0
    iget-object v0, p0, Lcom/apsalar/sdk/ApsalarRetryThread;->events:Ljava/util/concurrent/ArrayBlockingQueue;

    const-wide v1, 0x7fffffffffffffffL

    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v1, v2, v3}, Ljava/util/concurrent/ArrayBlockingQueue;->poll(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/apsalar/sdk/ApsalarAPI;

    .line 540
    if-eqz v0, :cond_1

    .line 542
    invoke-interface {v0}, Lcom/apsalar/sdk/ApsalarAPI;->REST()I

    move-result v1

    .line 546
    :goto_1
    packed-switch v1, :pswitch_data_0

    goto :goto_0

    .line 548
    :pswitch_0
    invoke-static {}, Lcom/apsalar/sdk/ApsalarThread;->getInstance()Lcom/apsalar/sdk/ApsalarThread;

    move-result-object v1

    .line 549
    if-eqz v1, :cond_0

    .line 550
    iget-object v1, v1, Lcom/apsalar/sdk/ApsalarThread;->events:Ljava/util/concurrent/ArrayBlockingQueue;

    invoke-virtual {v1, v0}, Ljava/util/concurrent/ArrayBlockingQueue;->offer(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 554
    :catch_0
    move-exception v0

    goto :goto_0

    .line 544
    :cond_1
    const/4 v1, -0x1

    goto :goto_1

    .line 546
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method
