.class public Lcom/getjar/sdk/comm/LocalizationCachingManager;
.super Ljava/lang/Object;
.source "LocalizationCachingManager.java"


# static fields
.field private static final _LRUCapMaximum:I = 0x1f4


# instance fields
.field private final _cachingManager:Lcom/getjar/sdk/data/CachingManager;

.field private cacheNamespace:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/getjar/sdk/comm/CommContext;)V
    .locals 3
    .param p1, "commContext"    # Lcom/getjar/sdk/comm/CommContext;

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    const-string v0, "commLocalizationCache"

    iput-object v0, p0, Lcom/getjar/sdk/comm/LocalizationCachingManager;->cacheNamespace:Ljava/lang/String;

    .line 29
    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'androidContext\' can not be NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 30
    :cond_0
    new-instance v0, Lcom/getjar/sdk/data/CachingManager;

    invoke-virtual {p1}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/getjar/sdk/comm/LocalizationCachingManager;->cacheNamespace:Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Lcom/getjar/sdk/data/CachingManager;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/getjar/sdk/comm/LocalizationCachingManager;->_cachingManager:Lcom/getjar/sdk/data/CachingManager;

    .line 31
    return-void
.end method


# virtual methods
.method public addPricingToCache(Ljava/lang/String;ILjava/lang/Long;Ljava/lang/String;)V
    .locals 2
    .param p1, "theLookup"    # Ljava/lang/String;
    .param p2, "recommendedPrice"    # I
    .param p3, "ttl"    # Ljava/lang/Long;
    .param p4, "eTag"    # Ljava/lang/String;

    .prologue
    .line 42
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "theLookup cannot be null or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 43
    :cond_0
    if-gez p2, :cond_1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "recommendedPrice cannot be less than 0"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 45
    :cond_1
    invoke-static {p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0, p3, p4}, Lcom/getjar/sdk/comm/LocalizationCachingManager;->addPricingToCache(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/String;)V

    .line 46
    return-void
.end method

.method public addPricingToCache(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/String;)V
    .locals 6
    .param p1, "theLookup"    # Ljava/lang/String;
    .param p2, "price"    # Ljava/lang/String;
    .param p3, "ttl"    # Ljava/lang/Long;
    .param p4, "eTag"    # Ljava/lang/String;

    .prologue
    .line 57
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "theLookup cannot be null or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 58
    :cond_0
    invoke-static {p2}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "recommendedPrice cannot be null or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 60
    :cond_1
    sget-object v0, Lcom/getjar/sdk/logging/Area;->LOCALIZATION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    const-string v2, "LocalizationCachingManager -- addPricingToCache -- started "

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 63
    if-nez p3, :cond_2

    .line 65
    sget-object v0, Lcom/getjar/sdk/logging/Area;->LOCALIZATION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    const-string v2, "LocalizationCachingManager -- addLicenseToCache ttl cannot be null"

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;)V

    .line 66
    const-wide/32 v0, 0x5265c00

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p3

    .line 69
    :cond_2
    iget-object v0, p0, Lcom/getjar/sdk/comm/LocalizationCachingManager;->_cachingManager:Lcom/getjar/sdk/data/CachingManager;

    const/4 v5, 0x0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-virtual/range {v0 .. v5}, Lcom/getjar/sdk/data/CachingManager;->updateCache(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/String;Ljava/net/URI;)V

    .line 75
    return-void
.end method

.method public getCachedPrice(Ljava/lang/String;)Ljava/lang/Integer;
    .locals 3
    .param p1, "theLookup"    # Ljava/lang/String;

    .prologue
    .line 86
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\'theLookup\' cannot be null or empty"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 88
    :cond_0
    const/4 v1, 0x0

    invoke-virtual {p0, p1, v1}, Lcom/getjar/sdk/comm/LocalizationCachingManager;->getCachedPriceInternal(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    .line 89
    .local v0, "price":Ljava/lang/String;
    if-eqz v0, :cond_1

    .line 90
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 93
    :goto_0
    return-object v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getCachedPriceInternal(Ljava/lang/String;Z)Ljava/lang/String;
    .locals 9
    .param p1, "theLookup"    # Ljava/lang/String;
    .param p2, "onlyValid"    # Z

    .prologue
    .line 123
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "\'theLookup\' cannot be null or empty"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 125
    :cond_0
    const/4 v0, 0x0

    .line 128
    .local v0, "cacheEntry":Lcom/getjar/sdk/data/CacheEntry;
    :try_start_0
    iget-object v3, p0, Lcom/getjar/sdk/comm/LocalizationCachingManager;->_cachingManager:Lcom/getjar/sdk/data/CachingManager;

    invoke-virtual {v3, p1}, Lcom/getjar/sdk/data/CachingManager;->getCacheEntry(Ljava/lang/String;)Lcom/getjar/sdk/data/CacheEntry;

    move-result-object v0

    .line 129
    if-eqz v0, :cond_3

    if-eqz p2, :cond_1

    if-eqz p2, :cond_3

    invoke-virtual {v0}, Lcom/getjar/sdk/data/CacheEntry;->hasTtlExpired()Z

    move-result v3

    if-nez v3, :cond_3

    .line 130
    :cond_1
    invoke-virtual {v0}, Lcom/getjar/sdk/data/CacheEntry;->getValue()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 140
    :goto_0
    return-object v3

    .line 132
    :catch_0
    move-exception v2

    .line 133
    .local v2, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    .line 134
    .local v1, "cacheValue":Ljava/lang/String;
    if-eqz v0, :cond_2

    .line 136
    invoke-virtual {v0}, Lcom/getjar/sdk/data/CacheEntry;->getValue()Ljava/lang/String;

    move-result-object v1

    .line 138
    :cond_2
    sget-object v3, Lcom/getjar/sdk/logging/Area;->LOCALIZATION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "LocalizationCachingManager: getCachedPrice() failed for key[=%s] value[=%s]. Returning default value[null]"

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object p1, v7, v8

    const/4 v8, 0x1

    aput-object v1, v7, v8

    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5, v2}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 140
    .end local v1    # "cacheValue":Ljava/lang/String;
    .end local v2    # "e":Ljava/lang/Exception;
    :cond_3
    const/4 v3, 0x0

    goto :goto_0
.end method

.method public getValidCachedPrice(Ljava/lang/String;)Ljava/lang/Integer;
    .locals 3
    .param p1, "theLookup"    # Ljava/lang/String;

    .prologue
    .line 105
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\'theLookup\' cannot be null or empty"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 107
    :cond_0
    const/4 v1, 0x1

    invoke-virtual {p0, p1, v1}, Lcom/getjar/sdk/comm/LocalizationCachingManager;->getCachedPriceInternal(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    .line 108
    .local v0, "price":Ljava/lang/String;
    if-eqz v0, :cond_1

    .line 109
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 112
    :goto_0
    return-object v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public removeCachedPricing(Ljava/lang/String;)V
    .locals 2
    .param p1, "pricing"    # Ljava/lang/String;

    .prologue
    .line 148
    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "pricing cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 150
    :cond_0
    iget-object v0, p0, Lcom/getjar/sdk/comm/LocalizationCachingManager;->_cachingManager:Lcom/getjar/sdk/data/CachingManager;

    invoke-virtual {v0, p1}, Lcom/getjar/sdk/data/CachingManager;->removeCacheEntry(Ljava/lang/String;)V

    .line 151
    return-void
.end method

.method public trimLruEntries()V
    .locals 2

    .prologue
    .line 158
    iget-object v0, p0, Lcom/getjar/sdk/comm/LocalizationCachingManager;->_cachingManager:Lcom/getjar/sdk/data/CachingManager;

    const/16 v1, 0x1f4

    invoke-virtual {v0, v1}, Lcom/getjar/sdk/data/CachingManager;->trimLruEntries(I)V

    .line 159
    return-void
.end method
