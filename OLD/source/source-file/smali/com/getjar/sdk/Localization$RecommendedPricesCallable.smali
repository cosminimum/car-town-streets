.class Lcom/getjar/sdk/Localization$RecommendedPricesCallable;
.super Ljava/lang/Object;
.source "Localization.java"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getjar/sdk/Localization;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RecommendedPricesCallable"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable",
        "<",
        "Lcom/getjar/sdk/RecommendedPrices;",
        ">;"
    }
.end annotation


# instance fields
.field private listener:Lcom/getjar/sdk/listener/RecommendedPricesListener;

.field private prices:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<",
            "Lcom/getjar/sdk/Pricing;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/getjar/sdk/Localization;


# direct methods
.method public constructor <init>(Lcom/getjar/sdk/Localization;Ljava/util/Collection;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lcom/getjar/sdk/Pricing;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 119
    .local p2, "prices":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/getjar/sdk/Pricing;>;"
    iput-object p1, p0, Lcom/getjar/sdk/Localization$RecommendedPricesCallable;->this$0:Lcom/getjar/sdk/Localization;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 121
    if-eqz p2, :cond_0

    invoke-interface {p2}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'prices\' cannot be null or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 123
    :cond_1
    iput-object p2, p0, Lcom/getjar/sdk/Localization$RecommendedPricesCallable;->prices:Ljava/util/Collection;

    .line 124
    return-void
.end method

.method public constructor <init>(Lcom/getjar/sdk/Localization;Ljava/util/Collection;Lcom/getjar/sdk/listener/RecommendedPricesListener;)V
    .locals 2
    .param p3, "recommendedPricesListener"    # Lcom/getjar/sdk/listener/RecommendedPricesListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lcom/getjar/sdk/Pricing;",
            ">;",
            "Lcom/getjar/sdk/listener/RecommendedPricesListener;",
            ")V"
        }
    .end annotation

    .prologue
    .line 129
    .local p2, "prices":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/getjar/sdk/Pricing;>;"
    invoke-direct {p0, p1, p2}, Lcom/getjar/sdk/Localization$RecommendedPricesCallable;-><init>(Lcom/getjar/sdk/Localization;Ljava/util/Collection;)V

    .line 131
    if-nez p3, :cond_0

    .line 132
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "recommendedPricesListener cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 134
    :cond_0
    iput-object p3, p0, Lcom/getjar/sdk/Localization$RecommendedPricesCallable;->listener:Lcom/getjar/sdk/listener/RecommendedPricesListener;

    .line 135
    return-void
.end method


# virtual methods
.method public call()Lcom/getjar/sdk/RecommendedPrices;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/ExecutionException;
        }
    .end annotation

    .prologue
    .line 138
    const/4 v1, 0x0

    .line 140
    .local v1, "recPrices":Lcom/getjar/sdk/RecommendedPrices;
    :try_start_0
    iget-object v2, p0, Lcom/getjar/sdk/Localization$RecommendedPricesCallable;->this$0:Lcom/getjar/sdk/Localization;

    invoke-static {v2}, Lcom/getjar/sdk/Localization;->access$000(Lcom/getjar/sdk/Localization;)Lcom/getjar/sdk/data/LocalizationEngine;

    move-result-object v2

    iget-object v3, p0, Lcom/getjar/sdk/Localization$RecommendedPricesCallable;->prices:Ljava/util/Collection;

    invoke-virtual {v2, v3}, Lcom/getjar/sdk/data/LocalizationEngine;->getRecommendedPrices(Ljava/util/Collection;)Lcom/getjar/sdk/RecommendedPrices;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    .line 143
    iget-object v2, p0, Lcom/getjar/sdk/Localization$RecommendedPricesCallable;->listener:Lcom/getjar/sdk/listener/RecommendedPricesListener;

    if-eqz v2, :cond_0

    .line 146
    :try_start_1
    iget-object v2, p0, Lcom/getjar/sdk/Localization$RecommendedPricesCallable;->listener:Lcom/getjar/sdk/listener/RecommendedPricesListener;

    invoke-interface {v2, v1}, Lcom/getjar/sdk/listener/RecommendedPricesListener;->recommendedPricesEvent(Lcom/getjar/sdk/RecommendedPrices;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 152
    :cond_0
    :goto_0
    return-object v1

    .line 147
    :catch_0
    move-exception v0

    .line 148
    .local v0, "e":Ljava/lang/Exception;
    sget-object v2, Lcom/getjar/sdk/logging/Area;->LOCALIZATION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    const-string v4, "RecommendedPricesCallable call() Callback failed!"

    invoke-static {v2, v3, v4, v0}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 143
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v2

    iget-object v3, p0, Lcom/getjar/sdk/Localization$RecommendedPricesCallable;->listener:Lcom/getjar/sdk/listener/RecommendedPricesListener;

    if-eqz v3, :cond_1

    .line 146
    :try_start_2
    iget-object v3, p0, Lcom/getjar/sdk/Localization$RecommendedPricesCallable;->listener:Lcom/getjar/sdk/listener/RecommendedPricesListener;

    invoke-interface {v3, v1}, Lcom/getjar/sdk/listener/RecommendedPricesListener;->recommendedPricesEvent(Lcom/getjar/sdk/RecommendedPrices;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 149
    :cond_1
    :goto_1
    throw v2

    .line 147
    :catch_1
    move-exception v0

    .line 148
    .restart local v0    # "e":Ljava/lang/Exception;
    sget-object v3, Lcom/getjar/sdk/logging/Area;->LOCALIZATION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    const-string v5, "RecommendedPricesCallable call() Callback failed!"

    invoke-static {v3, v4, v5, v0}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1
.end method

.method public bridge synthetic call()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 114
    invoke-virtual {p0}, Lcom/getjar/sdk/Localization$RecommendedPricesCallable;->call()Lcom/getjar/sdk/RecommendedPrices;

    move-result-object v0

    return-object v0
.end method
