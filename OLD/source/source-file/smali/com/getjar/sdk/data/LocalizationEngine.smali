.class public Lcom/getjar/sdk/data/LocalizationEngine;
.super Ljava/lang/Object;
.source "LocalizationEngine.java"


# static fields
.field private static final _ExecutorService:Ljava/util/concurrent/ExecutorService;


# instance fields
.field private _commContext:Lcom/getjar/sdk/comm/CommContext;

.field private _localizationCachingManager:Lcom/getjar/sdk/comm/LocalizationCachingManager;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 29
    invoke-static {}, Ljava/util/concurrent/Executors;->newCachedThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lcom/getjar/sdk/data/LocalizationEngine;->_ExecutorService:Ljava/util/concurrent/ExecutorService;

    return-void
.end method

.method public constructor <init>(Lcom/getjar/sdk/comm/CommContext;)V
    .locals 2
    .param p1, "commContext"    # Lcom/getjar/sdk/comm/CommContext;

    .prologue
    const/4 v0, 0x0

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    iput-object v0, p0, Lcom/getjar/sdk/data/LocalizationEngine;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    .line 31
    iput-object v0, p0, Lcom/getjar/sdk/data/LocalizationEngine;->_localizationCachingManager:Lcom/getjar/sdk/comm/LocalizationCachingManager;

    .line 38
    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'commContext\' can not be NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 39
    :cond_0
    iput-object p1, p0, Lcom/getjar/sdk/data/LocalizationEngine;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    .line 40
    new-instance v0, Lcom/getjar/sdk/comm/LocalizationCachingManager;

    iget-object v1, p0, Lcom/getjar/sdk/data/LocalizationEngine;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-direct {v0, v1}, Lcom/getjar/sdk/comm/LocalizationCachingManager;-><init>(Lcom/getjar/sdk/comm/CommContext;)V

    iput-object v0, p0, Lcom/getjar/sdk/data/LocalizationEngine;->_localizationCachingManager:Lcom/getjar/sdk/comm/LocalizationCachingManager;

    .line 41
    return-void
.end method

.method static synthetic access$000(Lcom/getjar/sdk/data/LocalizationEngine;Ljava/util/Collection;)V
    .locals 0
    .param p0, "x0"    # Lcom/getjar/sdk/data/LocalizationEngine;
    .param p1, "x1"    # Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/ExecutionException;
        }
    .end annotation

    .prologue
    .line 27
    invoke-direct {p0, p1}, Lcom/getjar/sdk/data/LocalizationEngine;->refreshRecommendedPricesCache(Ljava/util/Collection;)V

    return-void
.end method

.method private getRecommendedPricesInternal(Ljava/util/Collection;Z)Lcom/getjar/sdk/RecommendedPrices;
    .locals 7
    .param p2, "allowStale"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lcom/getjar/sdk/Pricing;",
            ">;Z)",
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
    .line 93
    .local p1, "prices":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/getjar/sdk/Pricing;>;"
    if-eqz p1, :cond_0

    invoke-interface {p1}, Ljava/util/Collection;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_1

    :cond_0
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "prices cannot be null or empty"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 95
    :cond_1
    sget-object v4, Lcom/getjar/sdk/logging/Area;->LOCALIZATION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    const-string v6, "LocalizationEngine getRecommendedPricesInternal() start"

    invoke-static {v4, v5, v6}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 97
    new-instance v3, Ljava/util/HashMap;

    invoke-interface {p1}, Ljava/util/Collection;->size()I

    move-result v4

    invoke-direct {v3, v4}, Ljava/util/HashMap;-><init>(I)V

    .line 100
    .local v3, "recommendedPrices":Ljava/util/HashMap;, "Ljava/util/HashMap<Lcom/getjar/sdk/Pricing;Ljava/lang/Integer;>;"
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/getjar/sdk/Pricing;

    .line 102
    .local v1, "price":Lcom/getjar/sdk/Pricing;
    if-nez p2, :cond_2

    .line 104
    iget-object v4, p0, Lcom/getjar/sdk/data/LocalizationEngine;->_localizationCachingManager:Lcom/getjar/sdk/comm/LocalizationCachingManager;

    invoke-virtual {v1}, Lcom/getjar/sdk/Pricing;->hashCode()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/getjar/sdk/comm/LocalizationCachingManager;->getValidCachedPrice(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v2

    .line 111
    .local v2, "recommendedPrice":Ljava/lang/Integer;
    :goto_1
    if-eqz v2, :cond_3

    .line 113
    invoke-virtual {v3, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 108
    .end local v2    # "recommendedPrice":Ljava/lang/Integer;
    :cond_2
    iget-object v4, p0, Lcom/getjar/sdk/data/LocalizationEngine;->_localizationCachingManager:Lcom/getjar/sdk/comm/LocalizationCachingManager;

    invoke-virtual {v1}, Lcom/getjar/sdk/Pricing;->hashCode()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/getjar/sdk/comm/LocalizationCachingManager;->getCachedPrice(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v2

    .restart local v2    # "recommendedPrice":Ljava/lang/Integer;
    goto :goto_1

    .line 117
    :cond_3
    sget-object v4, Lcom/getjar/sdk/logging/Area;->LOCALIZATION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    const-string v6, "LocalizationEngine getRecommendedPricesInternal() returning null"

    invoke-static {v4, v5, v6}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 118
    const/4 v4, 0x0

    .line 122
    .end local v1    # "price":Lcom/getjar/sdk/Pricing;
    .end local v2    # "recommendedPrice":Ljava/lang/Integer;
    :goto_2
    return-object v4

    :cond_4
    new-instance v4, Lcom/getjar/sdk/RecommendedPrices;

    invoke-direct {v4, v3}, Lcom/getjar/sdk/RecommendedPrices;-><init>(Ljava/util/Map;)V

    goto :goto_2
.end method

.method private refreshRecommendedPricesCache(Ljava/util/Collection;)V
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lcom/getjar/sdk/Pricing;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/ExecutionException;
        }
    .end annotation

    .prologue
    .line 137
    .local p1, "prices":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/getjar/sdk/Pricing;>;"
    if-eqz p1, :cond_0

    invoke-interface {p1}, Ljava/util/Collection;->isEmpty()Z

    move-result v8

    if-eqz v8, :cond_1

    :cond_0
    new-instance v8, Ljava/lang/IllegalArgumentException;

    const-string v9, "prices cannot be null or empty"

    invoke-direct {v8, v9}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 139
    :cond_1
    invoke-static {}, Lcom/getjar/sdk/comm/LocalizationServiceProxy;->getInstance()Lcom/getjar/sdk/comm/LocalizationServiceProxy;

    move-result-object v8

    iget-object v9, p0, Lcom/getjar/sdk/data/LocalizationEngine;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v8, v9, p1}, Lcom/getjar/sdk/comm/LocalizationServiceProxy;->getRecommendedPrices(Lcom/getjar/sdk/comm/CommContext;Ljava/util/Collection;)Lcom/getjar/sdk/comm/Operation;

    move-result-object v5

    .line 140
    .local v5, "operation":Lcom/getjar/sdk/comm/Operation;
    invoke-virtual {v5}, Lcom/getjar/sdk/comm/Operation;->get()Lcom/getjar/sdk/comm/Result;

    move-result-object v6

    .line 141
    .local v6, "result":Lcom/getjar/sdk/comm/Result;
    invoke-virtual {v6}, Lcom/getjar/sdk/comm/Result;->isSuccessfulResponse()Z

    move-result v8

    if-eqz v8, :cond_2

    .line 147
    :try_start_0
    invoke-virtual {v6}, Lcom/getjar/sdk/comm/Result;->getResponseJson()Lorg/json/JSONObject;

    move-result-object v8

    const-string v9, "return"

    invoke-virtual {v8, v9}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    .line 148
    .local v0, "arr":Lorg/json/JSONArray;
    invoke-static {v6}, Lcom/getjar/sdk/comm/ResultCachingManager;->getTtlFromResult(Lcom/getjar/sdk/comm/Result;)Ljava/lang/Long;

    move-result-object v7

    .line 149
    .local v7, "ttl":Ljava/lang/Long;
    invoke-static {v6}, Lcom/getjar/sdk/comm/ResultCachingManager;->getETagFromResult(Lcom/getjar/sdk/comm/Result;)Ljava/lang/String;

    move-result-object v2

    .line 151
    .local v2, "eTag":Ljava/lang/String;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v8

    if-ge v3, v8, :cond_2

    .line 153
    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    .line 155
    .local v4, "obj":Lorg/json/JSONObject;
    iget-object v8, p0, Lcom/getjar/sdk/data/LocalizationEngine;->_localizationCachingManager:Lcom/getjar/sdk/comm/LocalizationCachingManager;

    const-string v9, "key"

    invoke-virtual {v4, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    const-string v10, "value"

    invoke-virtual {v4, v10}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v10

    invoke-virtual {v8, v9, v10, v7, v2}, Lcom/getjar/sdk/comm/LocalizationCachingManager;->addPricingToCache(Ljava/lang/String;ILjava/lang/Long;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 151
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 157
    .end local v0    # "arr":Lorg/json/JSONArray;
    .end local v2    # "eTag":Ljava/lang/String;
    .end local v3    # "i":I
    .end local v4    # "obj":Lorg/json/JSONObject;
    .end local v7    # "ttl":Ljava/lang/Long;
    :catch_0
    move-exception v1

    .line 158
    .local v1, "e":Lorg/json/JSONException;
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    .line 162
    .end local v1    # "e":Lorg/json/JSONException;
    :cond_2
    return-void
.end method

.method private retrieveRecommendedPricesAsync(Ljava/util/Collection;)V
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
    .line 171
    .local p1, "prices":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/getjar/sdk/Pricing;>;"
    if-eqz p1, :cond_0

    invoke-interface {p1}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "prices cannot be null or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 173
    :cond_1
    sget-object v0, Lcom/getjar/sdk/data/LocalizationEngine;->_ExecutorService:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lcom/getjar/sdk/data/LocalizationEngine$1;

    invoke-direct {v1, p0, p1}, Lcom/getjar/sdk/data/LocalizationEngine$1;-><init>(Lcom/getjar/sdk/data/LocalizationEngine;Ljava/util/Collection;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 184
    return-void
.end method


# virtual methods
.method public getRecommendedPrices(Ljava/util/Collection;)Lcom/getjar/sdk/RecommendedPrices;
    .locals 3
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
    .local p1, "prices":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/getjar/sdk/Pricing;>;"
    const/4 v2, 0x1

    .line 55
    const/4 v0, 0x0

    .line 57
    .local v0, "recommendedPrices":Lcom/getjar/sdk/RecommendedPrices;
    const/4 v1, 0x0

    invoke-direct {p0, p1, v1}, Lcom/getjar/sdk/data/LocalizationEngine;->getRecommendedPricesInternal(Ljava/util/Collection;Z)Lcom/getjar/sdk/RecommendedPrices;

    move-result-object v0

    .line 58
    if-eqz v0, :cond_0

    move-object v1, v0

    .line 76
    :goto_0
    return-object v1

    .line 64
    :cond_0
    invoke-direct {p0, p1, v2}, Lcom/getjar/sdk/data/LocalizationEngine;->getRecommendedPricesInternal(Ljava/util/Collection;Z)Lcom/getjar/sdk/RecommendedPrices;

    move-result-object v0

    .line 65
    if-eqz v0, :cond_1

    .line 67
    invoke-direct {p0, p1}, Lcom/getjar/sdk/data/LocalizationEngine;->retrieveRecommendedPricesAsync(Ljava/util/Collection;)V

    move-object v1, v0

    .line 68
    goto :goto_0

    .line 72
    :cond_1
    invoke-direct {p0, p1}, Lcom/getjar/sdk/data/LocalizationEngine;->refreshRecommendedPricesCache(Ljava/util/Collection;)V

    .line 76
    invoke-direct {p0, p1, v2}, Lcom/getjar/sdk/data/LocalizationEngine;->getRecommendedPricesInternal(Ljava/util/Collection;Z)Lcom/getjar/sdk/RecommendedPrices;

    move-result-object v1

    goto :goto_0
.end method
