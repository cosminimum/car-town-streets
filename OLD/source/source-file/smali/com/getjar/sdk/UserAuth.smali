.class public Lcom/getjar/sdk/UserAuth;
.super Ljava/lang/Object;
.source "UserAuth.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/getjar/sdk/UserAuth$EnsureUserAuthCallable;
    }
.end annotation


# static fields
.field private static final _ExecutorService:Ljava/util/concurrent/ExecutorService;


# instance fields
.field private commContext:Lcom/getjar/sdk/comm/CommContext;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 24
    invoke-static {}, Ljava/util/concurrent/Executors;->newCachedThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lcom/getjar/sdk/UserAuth;->_ExecutorService:Ljava/util/concurrent/ExecutorService;

    return-void
.end method

.method public constructor <init>(Lcom/getjar/sdk/GetJarContext;)V
    .locals 2
    .param p1, "getJarContext"    # Lcom/getjar/sdk/GetJarContext;

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'getJarContext\' cannot be NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 34
    :cond_0
    invoke-virtual {p1}, Lcom/getjar/sdk/GetJarContext;->getCommContext()Lcom/getjar/sdk/comm/CommContext;

    move-result-object v0

    iput-object v0, p0, Lcom/getjar/sdk/UserAuth;->commContext:Lcom/getjar/sdk/comm/CommContext;

    .line 35
    return-void
.end method

.method static synthetic access$000(Lcom/getjar/sdk/UserAuth;)Lcom/getjar/sdk/comm/CommContext;
    .locals 1
    .param p0, "x0"    # Lcom/getjar/sdk/UserAuth;

    .prologue
    .line 22
    iget-object v0, p0, Lcom/getjar/sdk/UserAuth;->commContext:Lcom/getjar/sdk/comm/CommContext;

    return-object v0
.end method


# virtual methods
.method public ensureUser(Ljava/lang/String;)Lcom/getjar/sdk/User;
    .locals 1
    .param p1, "theTitle"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/ExecutionException;
        }
    .end annotation

    .prologue
    .line 52
    invoke-virtual {p0, p1}, Lcom/getjar/sdk/UserAuth;->ensureUserAsync(Ljava/lang/String;)Ljava/util/concurrent/Future;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/getjar/sdk/User;

    return-object v0
.end method

.method public ensureUserAsync(Ljava/lang/String;)Ljava/util/concurrent/Future;
    .locals 3
    .param p1, "theTitle"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/concurrent/Future",
            "<",
            "Lcom/getjar/sdk/User;",
            ">;"
        }
    .end annotation

    .prologue
    .line 69
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "theTitle cannot be null or empty"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 71
    :cond_0
    new-instance v0, Lcom/getjar/sdk/utilities/SetExceptionFutureTask;

    new-instance v1, Lcom/getjar/sdk/UserAuth$EnsureUserAuthCallable;

    invoke-direct {v1, p0, p1}, Lcom/getjar/sdk/UserAuth$EnsureUserAuthCallable;-><init>(Lcom/getjar/sdk/UserAuth;Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lcom/getjar/sdk/utilities/SetExceptionFutureTask;-><init>(Ljava/util/concurrent/Callable;)V

    .line 74
    .local v0, "future":Lcom/getjar/sdk/utilities/SetExceptionFutureTask;, "Lcom/getjar/sdk/utilities/SetExceptionFutureTask<Lcom/getjar/sdk/User;>;"
    sget-object v1, Lcom/getjar/sdk/UserAuth;->_ExecutorService:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v1, v0}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 75
    return-object v0
.end method

.method public ensureUserAsync(Ljava/lang/String;Lcom/getjar/sdk/listener/EnsureUserAuthListener;)Ljava/util/concurrent/Future;
    .locals 3
    .param p1, "theTitle"    # Ljava/lang/String;
    .param p2, "userAuthListener"    # Lcom/getjar/sdk/listener/EnsureUserAuthListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/getjar/sdk/listener/EnsureUserAuthListener;",
            ")",
            "Ljava/util/concurrent/Future",
            "<",
            "Lcom/getjar/sdk/User;",
            ">;"
        }
    .end annotation

    .prologue
    .line 93
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "theTitle cannot be null or empty"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 94
    :cond_0
    if-nez p2, :cond_1

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\'userAuthListener\' cannot be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 96
    :cond_1
    new-instance v0, Lcom/getjar/sdk/utilities/SetExceptionFutureTask;

    new-instance v1, Lcom/getjar/sdk/UserAuth$EnsureUserAuthCallable;

    invoke-direct {v1, p0, p1, p2}, Lcom/getjar/sdk/UserAuth$EnsureUserAuthCallable;-><init>(Lcom/getjar/sdk/UserAuth;Ljava/lang/String;Lcom/getjar/sdk/listener/EnsureUserAuthListener;)V

    invoke-direct {v0, v1}, Lcom/getjar/sdk/utilities/SetExceptionFutureTask;-><init>(Ljava/util/concurrent/Callable;)V

    .line 99
    .local v0, "future":Lcom/getjar/sdk/utilities/SetExceptionFutureTask;, "Lcom/getjar/sdk/utilities/SetExceptionFutureTask<Lcom/getjar/sdk/User;>;"
    sget-object v1, Lcom/getjar/sdk/UserAuth;->_ExecutorService:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v1, v0}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 100
    return-object v0
.end method
