.class public Lcom/getjar/sdk/Localization;
.super Ljava/lang/Object;
.source "Localization.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/getjar/sdk/Localization$RecommendedPricesCallable;
    }
.end annotation


# static fields
.field private static final _ExecutorService:Ljava/util/concurrent/ExecutorService;


# instance fields
.field private _localizationEngine:Lcom/getjar/sdk/data/LocalizationEngine;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 23
    invoke-static {}, Ljava/util/concurrent/Executors;->newCachedThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lcom/getjar/sdk/Localization;->_ExecutorService:Ljava/util/concurrent/ExecutorService;

    return-void
.end method

.method public constructor <init>(Lcom/getjar/sdk/GetJarContext;)V
    .locals 2
    .param p1, "getJarContext"    # Lcom/getjar/sdk/GetJarContext;

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/getjar/sdk/Localization;->_localizationEngine:Lcom/getjar/sdk/data/LocalizationEngine;

    .line 30
    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'getJarContext\' can not be NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 31
    :cond_0
    new-instance v0, Lcom/getjar/sdk/data/LocalizationEngine;

    invoke-virtual {p1}, Lcom/getjar/sdk/GetJarContext;->getCommContext()Lcom/getjar/sdk/comm/CommContext;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/getjar/sdk/data/LocalizationEngine;-><init>(Lcom/getjar/sdk/comm/CommContext;)V

    iput-object v0, p0, Lcom/getjar/sdk/Localization;->_localizationEngine:Lcom/getjar/sdk/data/LocalizationEngine;

    .line 32
    return-void
.end method

.method static synthetic access$000(Lcom/getjar/sdk/Localization;)Lcom/getjar/sdk/data/LocalizationEngine;
    .locals 1
    .param p0, "x0"    # Lcom/getjar/sdk/Localization;

    .prologue
    .line 21
    iget-object v0, p0, Lcom/getjar/sdk/Localization;->_localizationEngine:Lcom/getjar/sdk/data/LocalizationEngine;

    return-object v0
.end method


# virtual methods
.method public getRecommendedPrices(Ljava/util/Collection;)Lcom/getjar/sdk/RecommendedPrices;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lcom/getjar/sdk/Pricing;",
            ">;)",
            "Lcom/getjar/sdk/RecommendedPrices;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/ExecutionException;
        }
    .end annotation

    .prologue
    .line 51
    .local p1, "prices":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/getjar/sdk/Pricing;>;"
    if-eqz p1, :cond_0

    invoke-interface {p1}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'prices\' cannot be null or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 53
    :cond_1
    invoke-virtual {p0, p1}, Lcom/getjar/sdk/Localization;->getRecommendedPricesAsync(Ljava/util/Collection;)Ljava/util/concurrent/Future;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/getjar/sdk/RecommendedPrices;

    return-object v0
.end method

.method public getRecommendedPricesAsync(Ljava/util/Collection;)Ljava/util/concurrent/Future;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lcom/getjar/sdk/Pricing;",
            ">;)",
            "Ljava/util/concurrent/Future",
            "<",
            "Lcom/getjar/sdk/RecommendedPrices;",
            ">;"
        }
    .end annotation

    .prologue
    .line 70
    .local p1, "prices":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/getjar/sdk/Pricing;>;"
    if-eqz p1, :cond_0

    invoke-interface {p1}, Ljava/util/Collection;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\'prices\' cannot be null or empty"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 75
    :cond_1
    new-instance v0, Lcom/getjar/sdk/utilities/SetExceptionFutureTask;

    new-instance v1, Lcom/getjar/sdk/Localization$RecommendedPricesCallable;

    invoke-direct {v1, p0, p1}, Lcom/getjar/sdk/Localization$RecommendedPricesCallable;-><init>(Lcom/getjar/sdk/Localization;Ljava/util/Collection;)V

    invoke-direct {v0, v1}, Lcom/getjar/sdk/utilities/SetExceptionFutureTask;-><init>(Ljava/util/concurrent/Callable;)V

    .line 78
    .local v0, "future":Lcom/getjar/sdk/utilities/SetExceptionFutureTask;, "Lcom/getjar/sdk/utilities/SetExceptionFutureTask<Lcom/getjar/sdk/RecommendedPrices;>;"
    sget-object v1, Lcom/getjar/sdk/Localization;->_ExecutorService:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v1, v0}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 79
    return-object v0
.end method

.method public getRecommendedPricesAsync(Ljava/util/Collection;Lcom/getjar/sdk/listener/RecommendedPricesListener;)Ljava/util/concurrent/Future;
    .locals 3
    .param p2, "recommendedPricesListener"    # Lcom/getjar/sdk/listener/RecommendedPricesListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lcom/getjar/sdk/Pricing;",
            ">;",
            "Lcom/getjar/sdk/listener/RecommendedPricesListener;",
            ")",
            "Ljava/util/concurrent/Future",
            "<",
            "Lcom/getjar/sdk/RecommendedPrices;",
            ">;"
        }
    .end annotation

    .prologue
    .line 98
    .local p1, "prices":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/getjar/sdk/Pricing;>;"
    if-eqz p1, :cond_0

    invoke-interface {p1}, Ljava/util/Collection;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\'prices\' cannot be null or empty"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 99
    :cond_1
    if-nez p2, :cond_2

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "recommendedPricesListener cannot be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 104
    :cond_2
    new-instance v0, Lcom/getjar/sdk/utilities/SetExceptionFutureTask;

    new-instance v1, Lcom/getjar/sdk/Localization$RecommendedPricesCallable;

    invoke-direct {v1, p0, p1, p2}, Lcom/getjar/sdk/Localization$RecommendedPricesCallable;-><init>(Lcom/getjar/sdk/Localization;Ljava/util/Collection;Lcom/getjar/sdk/listener/RecommendedPricesListener;)V

    invoke-direct {v0, v1}, Lcom/getjar/sdk/utilities/SetExceptionFutureTask;-><init>(Ljava/util/concurrent/Callable;)V

    .line 107
    .local v0, "future":Lcom/getjar/sdk/utilities/SetExceptionFutureTask;, "Lcom/getjar/sdk/utilities/SetExceptionFutureTask<Lcom/getjar/sdk/RecommendedPrices;>;"
    sget-object v1, Lcom/getjar/sdk/Localization;->_ExecutorService:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v1, v0}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 108
    return-object v0
.end method
