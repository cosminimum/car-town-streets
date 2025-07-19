.class Lcom/getjar/sdk/comm/CachedResultFuture;
.super Ljava/util/concurrent/FutureTask;
.source "CachedResultFuture.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/concurrent/FutureTask",
        "<",
        "Lcom/getjar/sdk/comm/Result;",
        ">;"
    }
.end annotation


# static fields
.field private static _ReturnCachedResultCallable:Ljava/util/concurrent/Callable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Callable",
            "<",
            "Lcom/getjar/sdk/comm/Result;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private _cachedResult:Lcom/getjar/sdk/comm/Result;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 20
    new-instance v0, Lcom/getjar/sdk/comm/CachedResultFuture$1;

    invoke-direct {v0}, Lcom/getjar/sdk/comm/CachedResultFuture$1;-><init>()V

    sput-object v0, Lcom/getjar/sdk/comm/CachedResultFuture;->_ReturnCachedResultCallable:Ljava/util/concurrent/Callable;

    return-void
.end method

.method protected constructor <init>(Lcom/getjar/sdk/comm/Result;)V
    .locals 2
    .param p1, "cachedResult"    # Lcom/getjar/sdk/comm/Result;

    .prologue
    .line 27
    sget-object v0, Lcom/getjar/sdk/comm/CachedResultFuture;->_ReturnCachedResultCallable:Ljava/util/concurrent/Callable;

    invoke-direct {p0, v0}, Ljava/util/concurrent/FutureTask;-><init>(Ljava/util/concurrent/Callable;)V

    .line 17
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/getjar/sdk/comm/CachedResultFuture;->_cachedResult:Lcom/getjar/sdk/comm/Result;

    .line 28
    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'cachedResult\' can not be NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 29
    :cond_0
    iput-object p1, p0, Lcom/getjar/sdk/comm/CachedResultFuture;->_cachedResult:Lcom/getjar/sdk/comm/Result;

    .line 30
    return-void
.end method


# virtual methods
.method public get()Lcom/getjar/sdk/comm/Result;
    .locals 1

    .prologue
    .line 39
    iget-object v0, p0, Lcom/getjar/sdk/comm/CachedResultFuture;->_cachedResult:Lcom/getjar/sdk/comm/Result;

    return-object v0
.end method

.method public get(JLjava/util/concurrent/TimeUnit;)Lcom/getjar/sdk/comm/Result;
    .locals 1
    .param p1, "timeout"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 49
    iget-object v0, p0, Lcom/getjar/sdk/comm/CachedResultFuture;->_cachedResult:Lcom/getjar/sdk/comm/Result;

    return-object v0
.end method

.method public bridge synthetic get()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/ExecutionException;
        }
    .end annotation

    .prologue
    .line 15
    invoke-virtual {p0}, Lcom/getjar/sdk/comm/CachedResultFuture;->get()Lcom/getjar/sdk/comm/Result;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # J
    .param p3, "x1"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/ExecutionException;,
            Ljava/util/concurrent/TimeoutException;
        }
    .end annotation

    .prologue
    .line 15
    invoke-virtual {p0, p1, p2, p3}, Lcom/getjar/sdk/comm/CachedResultFuture;->get(JLjava/util/concurrent/TimeUnit;)Lcom/getjar/sdk/comm/Result;

    move-result-object v0

    return-object v0
.end method

.method public isCancelled()Z
    .locals 1

    .prologue
    .line 58
    const/4 v0, 0x0

    return v0
.end method

.method public isDone()Z
    .locals 1

    .prologue
    .line 66
    const/4 v0, 0x1

    return v0
.end method

.method public run()V
    .locals 0

    .prologue
    .line 74
    return-void
.end method
