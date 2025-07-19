.class public Lcom/getjar/sdk/data/CachingManager;
.super Ljava/lang/Object;
.source "CachingManager.java"


# instance fields
.field private final _dbCache:Lcom/getjar/sdk/data/DBCache;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2
    .param p1, "androidContext"    # Landroid/content/Context;
    .param p2, "namespace"    # Ljava/lang/String;

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'androidContext\' cannot be NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 32
    :cond_0
    invoke-static {p2}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'namespace\' cannot be NULL or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 33
    :cond_1
    invoke-static {p1, p2}, Lcom/getjar/sdk/data/DBCache;->getInstanceAllUsers(Landroid/content/Context;Ljava/lang/String;)Lcom/getjar/sdk/data/DBCache;

    move-result-object v0

    iput-object v0, p0, Lcom/getjar/sdk/data/CachingManager;->_dbCache:Lcom/getjar/sdk/data/DBCache;

    .line 34
    return-void
.end method

.method public constructor <init>(Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;)V
    .locals 2
    .param p1, "commContext"    # Lcom/getjar/sdk/comm/CommContext;
    .param p2, "namespace"    # Ljava/lang/String;

    .prologue
    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'commContext\' cannot be NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 44
    :cond_0
    invoke-static {p2}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'namespace\' cannot be NULL or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 45
    :cond_1
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p2}, Lcom/getjar/sdk/data/DBCache;->getInstanceUserSpecific(Landroid/content/Context;Ljava/lang/String;)Lcom/getjar/sdk/data/DBCache;

    move-result-object v0

    iput-object v0, p0, Lcom/getjar/sdk/data/CachingManager;->_dbCache:Lcom/getjar/sdk/data/DBCache;

    .line 46
    return-void
.end method

.method private getCacheEntryInternal(Ljava/lang/String;)Lcom/getjar/sdk/data/CacheEntry;
    .locals 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 139
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "\'name\' cannot be NULL or empty"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 140
    :cond_0
    const/4 v0, 0x0

    .line 142
    .local v0, "cacheEntry":Lcom/getjar/sdk/data/CacheEntry;
    :try_start_0
    iget-object v2, p0, Lcom/getjar/sdk/data/CachingManager;->_dbCache:Lcom/getjar/sdk/data/DBCache;

    invoke-virtual {v2, p1}, Lcom/getjar/sdk/data/DBCache;->loadCacheEntry(Ljava/lang/String;)Lcom/getjar/sdk/data/CacheEntry;
    :try_end_0
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 148
    :goto_0
    return-object v0

    .line 143
    :catch_0
    move-exception v1

    .line 146
    .local v1, "e":Ljava/net/URISyntaxException;
    iget-object v2, p0, Lcom/getjar/sdk/data/CachingManager;->_dbCache:Lcom/getjar/sdk/data/DBCache;

    invoke-virtual {v2, p1}, Lcom/getjar/sdk/data/DBCache;->deleteCacheEntry(Ljava/lang/String;)Z

    goto :goto_0
.end method


# virtual methods
.method public getAllCacheEntries()Ljava/util/ArrayList;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/getjar/sdk/data/CacheEntry;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/URISyntaxException;
        }
    .end annotation

    .prologue
    .line 172
    iget-object v1, p0, Lcom/getjar/sdk/data/CachingManager;->_dbCache:Lcom/getjar/sdk/data/DBCache;

    invoke-virtual {v1}, Lcom/getjar/sdk/data/DBCache;->loadAllCacheEntries()Ljava/util/ArrayList;

    move-result-object v0

    .line 173
    .local v0, "entries":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/getjar/sdk/data/CacheEntry;>;"
    if-nez v0, :cond_0

    .line 174
    new-instance v0, Ljava/util/ArrayList;

    .end local v0    # "entries":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/getjar/sdk/data/CacheEntry;>;"
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 176
    :cond_0
    return-object v0
.end method

.method public getCacheEntry(Ljava/lang/String;)Lcom/getjar/sdk/data/CacheEntry;
    .locals 8
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 111
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\'name\' cannot be NULL or empty"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 114
    :cond_0
    invoke-direct {p0, p1}, Lcom/getjar/sdk/data/CachingManager;->getCacheEntryInternal(Ljava/lang/String;)Lcom/getjar/sdk/data/CacheEntry;

    move-result-object v0

    .line 115
    .local v0, "cacheEntry":Lcom/getjar/sdk/data/CacheEntry;
    if-eqz v0, :cond_1

    .line 118
    sget-object v1, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "CachingManager: getCacheEntry() Found a cache entry for %1$s.%2$s"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    iget-object v7, p0, Lcom/getjar/sdk/data/CachingManager;->_dbCache:Lcom/getjar/sdk/data/DBCache;

    invoke-virtual {v7}, Lcom/getjar/sdk/data/DBCache;->getDatabaseName()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x1

    aput-object p1, v5, v6

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 121
    .end local v0    # "cacheEntry":Lcom/getjar/sdk/data/CacheEntry;
    :goto_0
    return-object v0

    .restart local v0    # "cacheEntry":Lcom/getjar/sdk/data/CacheEntry;
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getUnexpiredCacheEntry(Ljava/lang/String;)Lcom/getjar/sdk/data/CacheEntry;
    .locals 8
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 86
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\'name\' cannot be NULL or empty"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 89
    :cond_0
    invoke-direct {p0, p1}, Lcom/getjar/sdk/data/CachingManager;->getCacheEntryInternal(Ljava/lang/String;)Lcom/getjar/sdk/data/CacheEntry;

    move-result-object v0

    .line 90
    .local v0, "cacheEntry":Lcom/getjar/sdk/data/CacheEntry;
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/getjar/sdk/data/CacheEntry;->hasTtlExpired()Z

    move-result v1

    if-nez v1, :cond_1

    .line 93
    sget-object v1, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "CachingManager: getCurrentCacheEntry() Found a cache entry for %1$s.%2$s"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    iget-object v7, p0, Lcom/getjar/sdk/data/CachingManager;->_dbCache:Lcom/getjar/sdk/data/DBCache;

    invoke-virtual {v7}, Lcom/getjar/sdk/data/DBCache;->getDatabaseName()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x1

    aput-object p1, v5, v6

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 97
    .end local v0    # "cacheEntry":Lcom/getjar/sdk/data/CacheEntry;
    :goto_0
    return-object v0

    .restart local v0    # "cacheEntry":Lcom/getjar/sdk/data/CacheEntry;
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public removeCacheEntries()V
    .locals 8

    .prologue
    .line 163
    iget-object v1, p0, Lcom/getjar/sdk/data/CachingManager;->_dbCache:Lcom/getjar/sdk/data/DBCache;

    invoke-virtual {v1}, Lcom/getjar/sdk/data/DBCache;->deleteCacheEntries()I

    move-result v0

    .line 164
    .local v0, "deleteCount":I
    sget-object v1, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "CachingManager: removeCacheEntries() deleted %1$d entries"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 165
    return-void
.end method

.method public removeCacheEntry(Ljava/lang/String;)V
    .locals 6
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 156
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "name cannot be empty or null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 157
    :cond_0
    iget-object v0, p0, Lcom/getjar/sdk/data/CachingManager;->_dbCache:Lcom/getjar/sdk/data/DBCache;

    invoke-virtual {v0, p1}, Lcom/getjar/sdk/data/DBCache;->deleteCacheEntry(Ljava/lang/String;)Z

    .line 158
    sget-object v0, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "CachingManager: removeCacheEntry() CacheEntry \"%1$s\" removed"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object p1, v4, v5

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 159
    return-void
.end method

.method public trimLruEntries(I)V
    .locals 2
    .param p1, "maxRecordsCap"    # I

    .prologue
    .line 133
    if-gez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'maxRecordsCap\' cannot be negative"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 134
    :cond_0
    iget-object v0, p0, Lcom/getjar/sdk/data/CachingManager;->_dbCache:Lcom/getjar/sdk/data/DBCache;

    invoke-virtual {v0, p1}, Lcom/getjar/sdk/data/DBCache;->trimLruEntries(I)V

    .line 135
    return-void
.end method

.method public updateCache(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/String;Ljava/net/URI;)V
    .locals 9
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .param p3, "ttl"    # Ljava/lang/Long;
    .param p4, "eTag"    # Ljava/lang/String;
    .param p5, "uri"    # Ljava/net/URI;

    .prologue
    const/4 v6, 0x2

    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 61
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\'name\' cannot be NULL or empty"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 62
    :cond_0
    if-nez p3, :cond_1

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\'ttl\' cannot be NULL"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 65
    :cond_1
    new-instance v0, Lcom/getjar/sdk/data/CacheEntry;

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-direct/range {v0 .. v5}, Lcom/getjar/sdk/data/CacheEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/String;Ljava/net/URI;)V

    .line 68
    .local v0, "cacheEntry":Lcom/getjar/sdk/data/CacheEntry;
    iget-object v1, p0, Lcom/getjar/sdk/data/CachingManager;->_dbCache:Lcom/getjar/sdk/data/DBCache;

    invoke-virtual {v1, v0}, Lcom/getjar/sdk/data/DBCache;->upsertCacheEntry(Lcom/getjar/sdk/data/CacheEntry;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 69
    sget-object v1, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "CachingManager: updateCache() Cache entry update failed: %1$s.%2$s"

    new-array v5, v6, [Ljava/lang/Object;

    iget-object v6, p0, Lcom/getjar/sdk/data/CachingManager;->_dbCache:Lcom/getjar/sdk/data/DBCache;

    invoke-virtual {v6}, Lcom/getjar/sdk/data/DBCache;->getDatabaseName()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v7

    aput-object p1, v5, v8

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;)V

    .line 73
    :goto_0
    return-void

    .line 71
    :cond_2
    sget-object v1, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "CachingManager: updateCache() Cache entry updated: %1$s.%2$s"

    new-array v5, v6, [Ljava/lang/Object;

    iget-object v6, p0, Lcom/getjar/sdk/data/CachingManager;->_dbCache:Lcom/getjar/sdk/data/DBCache;

    invoke-virtual {v6}, Lcom/getjar/sdk/data/DBCache;->getDatabaseName()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v7

    aput-object p1, v5, v8

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    goto :goto_0
.end method
