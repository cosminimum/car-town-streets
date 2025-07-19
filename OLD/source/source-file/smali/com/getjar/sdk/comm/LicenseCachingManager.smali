.class public Lcom/getjar/sdk/comm/LicenseCachingManager;
.super Ljava/lang/Object;
.source "LicenseCachingManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/getjar/sdk/comm/LicenseCachingManager$LicensesWithETag;
    }
.end annotation


# static fields
.field private static final _LRUCapMaximum:I = 0xc8


# instance fields
.field private final _cachingManager:Lcom/getjar/sdk/data/CachingManager;

.field private cacheNamespace:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/getjar/sdk/comm/CommContext;)V
    .locals 2
    .param p1, "commContext"    # Lcom/getjar/sdk/comm/CommContext;

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    const-string v0, "commLicenseCache"

    iput-object v0, p0, Lcom/getjar/sdk/comm/LicenseCachingManager;->cacheNamespace:Ljava/lang/String;

    .line 36
    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'androidContext\' can not be NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 37
    :cond_0
    new-instance v0, Lcom/getjar/sdk/data/CachingManager;

    iget-object v1, p0, Lcom/getjar/sdk/comm/LicenseCachingManager;->cacheNamespace:Ljava/lang/String;

    invoke-direct {v0, p1, v1}, Lcom/getjar/sdk/data/CachingManager;-><init>(Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/getjar/sdk/comm/LicenseCachingManager;->_cachingManager:Lcom/getjar/sdk/data/CachingManager;

    .line 38
    return-void
.end method

.method private static getCacheKey(Lcom/getjar/sdk/data/LicenseInternal;)Ljava/lang/String;
    .locals 2
    .param p0, "license"    # Lcom/getjar/sdk/data/LicenseInternal;

    .prologue
    .line 62
    if-nez p0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "internalLicense cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 64
    :cond_0
    invoke-virtual {p0}, Lcom/getjar/sdk/data/LicenseInternal;->getItemId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lcom/getjar/sdk/data/LicenseInternal;->getLicenseScope()Lcom/getjar/sdk/License$LicenseScope;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/getjar/sdk/comm/LicenseCachingManager;->getCacheKey(Ljava/lang/String;Lcom/getjar/sdk/License$LicenseScope;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static getCacheKey(Ljava/lang/String;Lcom/getjar/sdk/License$LicenseScope;)Ljava/lang/String;
    .locals 5
    .param p0, "itemId"    # Ljava/lang/String;
    .param p1, "licenseScope"    # Lcom/getjar/sdk/License$LicenseScope;

    .prologue
    .line 48
    invoke-static {p0}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'itemId\' cannot be null or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 49
    :cond_0
    if-nez p1, :cond_1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "licenseScope cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 51
    :cond_1
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "%s%s"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p0, v2, v3

    const/4 v3, 0x1

    invoke-virtual {p1}, Lcom/getjar/sdk/License$LicenseScope;->toString()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public addLicenseToCache(Lcom/getjar/sdk/data/LicenseInternal;Ljava/lang/Long;Ljava/lang/String;)V
    .locals 8
    .param p1, "license"    # Lcom/getjar/sdk/data/LicenseInternal;
    .param p2, "ttl"    # Ljava/lang/Long;
    .param p3, "eTag"    # Ljava/lang/String;

    .prologue
    .line 75
    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "license cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 77
    :cond_0
    sget-object v0, Lcom/getjar/sdk/logging/Area;->LICENSING:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "LicenseCachingManager -- addLicenseToCache -- started "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Lcom/getjar/sdk/data/LicenseInternal;->getLicenseId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 79
    invoke-virtual {p1}, Lcom/getjar/sdk/data/LicenseInternal;->getItemId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lcom/getjar/sdk/data/LicenseInternal;->getLicenseScope()Lcom/getjar/sdk/License$LicenseScope;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/getjar/sdk/comm/LicenseCachingManager;->getCachedLicense(Ljava/lang/String;Lcom/getjar/sdk/License$LicenseScope;)Lcom/getjar/sdk/data/LicenseInternal;

    move-result-object v7

    .line 81
    .local v7, "internalLicense":Lcom/getjar/sdk/data/LicenseInternal;
    if-eqz v7, :cond_1

    .line 83
    invoke-virtual {v7}, Lcom/getjar/sdk/data/LicenseInternal;->getModificationTime()Ljava/util/Date;

    move-result-object v0

    invoke-virtual {p1}, Lcom/getjar/sdk/data/LicenseInternal;->getModificationTime()Ljava/util/Date;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/Date;->after(Ljava/util/Date;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 85
    sget-object v0, Lcom/getjar/sdk/logging/Area;->LICENSING:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    const-string v2, "LicenseCachingManager -- addLicenseToCache New license already in cache"

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 112
    :goto_0
    return-void

    .line 91
    :cond_1
    if-nez p2, :cond_2

    .line 93
    sget-object v0, Lcom/getjar/sdk/logging/Area;->LICENSING:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    const-string v2, "LicenseCachingManager -- addLicenseToCache ttl is null, using default"

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;)V

    .line 94
    const-wide/32 v0, 0x5265c00

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    .line 97
    :cond_2
    sget-object v0, Lcom/getjar/sdk/logging/Area;->LICENSING:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, " LicenseCachingManager -- addLicenseToCache TTL"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 101
    :try_start_0
    iget-object v0, p0, Lcom/getjar/sdk/comm/LicenseCachingManager;->_cachingManager:Lcom/getjar/sdk/data/CachingManager;

    invoke-static {p1}, Lcom/getjar/sdk/comm/LicenseCachingManager;->getCacheKey(Lcom/getjar/sdk/data/LicenseInternal;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p1}, Lcom/getjar/sdk/utilities/Base64;->encodeObject(Ljava/io/Serializable;)Ljava/lang/String;

    move-result-object v2

    const/4 v5, 0x0

    move-object v3, p2

    move-object v4, p3

    invoke-virtual/range {v0 .. v5}, Lcom/getjar/sdk/data/CachingManager;->updateCache(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/String;Ljava/net/URI;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 108
    :catch_0
    move-exception v6

    .line 109
    .local v6, "e":Ljava/io/IOException;
    sget-object v0, Lcom/getjar/sdk/logging/Area;->LICENSING:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    const-string v2, "LicenseCachingManager -- addLicenseToCache -- Error"

    invoke-static {v0, v1, v2, v6}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 110
    new-instance v0, Lcom/getjar/sdk/exceptions/CachingException;

    invoke-direct {v0, v6}, Lcom/getjar/sdk/exceptions/CachingException;-><init>(Ljava/lang/Throwable;)V

    throw v0
.end method

.method public getAllLicenses()Lcom/getjar/sdk/comm/LicenseCachingManager$LicensesWithETag;
    .locals 8

    .prologue
    .line 167
    const/4 v3, 0x0

    .line 168
    .local v3, "eTag":Ljava/lang/String;
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 170
    .local v6, "licenses":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/getjar/sdk/data/LicenseInternal;>;"
    :try_start_0
    iget-object v7, p0, Lcom/getjar/sdk/comm/LicenseCachingManager;->_cachingManager:Lcom/getjar/sdk/data/CachingManager;

    invoke-virtual {v7}, Lcom/getjar/sdk/data/CachingManager;->getAllCacheEntries()Ljava/util/ArrayList;

    move-result-object v0

    .line 171
    .local v0, "cacheEntries":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/getjar/sdk/data/CacheEntry;>;"
    if-eqz v0, :cond_2

    .line 173
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-ge v4, v7, :cond_2

    .line 175
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/getjar/sdk/data/CacheEntry;

    .line 176
    .local v1, "cacheEntry":Lcom/getjar/sdk/data/CacheEntry;
    invoke-static {v3}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 178
    invoke-virtual {v1}, Lcom/getjar/sdk/data/CacheEntry;->getEtag()Ljava/lang/String;

    move-result-object v3

    .line 181
    :cond_0
    if-eqz v1, :cond_1

    .line 183
    invoke-virtual {v1}, Lcom/getjar/sdk/data/CacheEntry;->getValue()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/getjar/sdk/utilities/Base64;->decodeToObject(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/getjar/sdk/data/LicenseInternal;

    .line 184
    .local v5, "license":Lcom/getjar/sdk/data/LicenseInternal;
    const/4 v7, 0x0

    invoke-virtual {v5, v7}, Lcom/getjar/sdk/data/LicenseInternal;->setLicenseStale(Z)V

    .line 185
    invoke-virtual {v6, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 173
    .end local v5    # "license":Lcom/getjar/sdk/data/LicenseInternal;
    :cond_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 190
    .end local v0    # "cacheEntries":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/getjar/sdk/data/CacheEntry;>;"
    .end local v1    # "cacheEntry":Lcom/getjar/sdk/data/CacheEntry;
    .end local v4    # "i":I
    :catch_0
    move-exception v2

    .line 191
    .local v2, "e":Ljava/lang/Exception;
    new-instance v7, Lcom/getjar/sdk/exceptions/CachingException;

    invoke-direct {v7, v2}, Lcom/getjar/sdk/exceptions/CachingException;-><init>(Ljava/lang/Throwable;)V

    throw v7

    .line 194
    .end local v2    # "e":Ljava/lang/Exception;
    .restart local v0    # "cacheEntries":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/getjar/sdk/data/CacheEntry;>;"
    :cond_2
    new-instance v7, Lcom/getjar/sdk/comm/LicenseCachingManager$LicensesWithETag;

    invoke-direct {v7, p0, v6, v3}, Lcom/getjar/sdk/comm/LicenseCachingManager$LicensesWithETag;-><init>(Lcom/getjar/sdk/comm/LicenseCachingManager;Ljava/util/List;Ljava/lang/String;)V

    return-object v7
.end method

.method public getCachedLicense(Ljava/lang/String;Lcom/getjar/sdk/License$LicenseScope;)Lcom/getjar/sdk/data/LicenseInternal;
    .locals 7
    .param p1, "itemId"    # Ljava/lang/String;
    .param p2, "licenseScope"    # Lcom/getjar/sdk/License$LicenseScope;

    .prologue
    .line 124
    :try_start_0
    iget-object v3, p0, Lcom/getjar/sdk/comm/LicenseCachingManager;->_cachingManager:Lcom/getjar/sdk/data/CachingManager;

    invoke-static {p1, p2}, Lcom/getjar/sdk/comm/LicenseCachingManager;->getCacheKey(Ljava/lang/String;Lcom/getjar/sdk/License$LicenseScope;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/getjar/sdk/data/CachingManager;->getCacheEntry(Ljava/lang/String;)Lcom/getjar/sdk/data/CacheEntry;

    move-result-object v0

    .line 125
    .local v0, "cacheEntry":Lcom/getjar/sdk/data/CacheEntry;
    if-eqz v0, :cond_0

    .line 127
    invoke-virtual {v0}, Lcom/getjar/sdk/data/CacheEntry;->getValue()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/getjar/sdk/utilities/Base64;->decodeToObject(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/getjar/sdk/data/LicenseInternal;

    .line 128
    .local v2, "license":Lcom/getjar/sdk/data/LicenseInternal;
    invoke-virtual {v0}, Lcom/getjar/sdk/data/CacheEntry;->hasTtlExpired()Z

    move-result v3

    invoke-virtual {v2, v3}, Lcom/getjar/sdk/data/LicenseInternal;->setLicenseStale(Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 134
    .end local v0    # "cacheEntry":Lcom/getjar/sdk/data/CacheEntry;
    .end local v2    # "license":Lcom/getjar/sdk/data/LicenseInternal;
    :goto_0
    return-object v2

    .line 131
    :catch_0
    move-exception v1

    .line 132
    .local v1, "e":Ljava/lang/Exception;
    sget-object v3, Lcom/getjar/sdk/logging/Area;->LICENSING:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    const-string v5, "LicenseCachingManager: getCachedLicense() failed"

    invoke-static {v3, v4, v5, v1}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 134
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public getValidCachedLicense(Ljava/lang/String;Lcom/getjar/sdk/License$LicenseScope;)Lcom/getjar/sdk/data/LicenseInternal;
    .locals 9
    .param p1, "itemId"    # Ljava/lang/String;
    .param p2, "licenseScope"    # Lcom/getjar/sdk/License$LicenseScope;

    .prologue
    .line 145
    sget-object v3, Lcom/getjar/sdk/logging/Area;->LICENSING:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "LicenseCachingManager -- getCachedLicense started for "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 148
    :try_start_0
    iget-object v3, p0, Lcom/getjar/sdk/comm/LicenseCachingManager;->_cachingManager:Lcom/getjar/sdk/data/CachingManager;

    invoke-static {p1, p2}, Lcom/getjar/sdk/comm/LicenseCachingManager;->getCacheKey(Ljava/lang/String;Lcom/getjar/sdk/License$LicenseScope;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/getjar/sdk/data/CachingManager;->getCacheEntry(Ljava/lang/String;)Lcom/getjar/sdk/data/CacheEntry;

    move-result-object v0

    .line 149
    .local v0, "cacheEntry":Lcom/getjar/sdk/data/CacheEntry;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/getjar/sdk/data/CacheEntry;->hasTtlExpired()Z

    move-result v3

    if-nez v3, :cond_0

    .line 151
    sget-object v3, Lcom/getjar/sdk/logging/Area;->LICENSING:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "LicenseCachingManager: getValidCachedLicense() Found a cached result for itemId %1$s"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object p1, v7, v8

    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 152
    invoke-virtual {v0}, Lcom/getjar/sdk/data/CacheEntry;->getValue()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/getjar/sdk/utilities/Base64;->decodeToObject(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/getjar/sdk/data/LicenseInternal;

    .line 153
    .local v2, "license":Lcom/getjar/sdk/data/LicenseInternal;
    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/getjar/sdk/data/LicenseInternal;->setLicenseStale(Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 159
    .end local v0    # "cacheEntry":Lcom/getjar/sdk/data/CacheEntry;
    .end local v2    # "license":Lcom/getjar/sdk/data/LicenseInternal;
    :goto_0
    return-object v2

    .line 156
    :catch_0
    move-exception v1

    .line 157
    .local v1, "e":Ljava/lang/Exception;
    sget-object v3, Lcom/getjar/sdk/logging/Area;->LICENSING:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    const-string v5, "LicenseCachingManager: getCachedLicense() failed"

    invoke-static {v3, v4, v5, v1}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 159
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public hasExpiredEntry()Z
    .locals 5

    .prologue
    .line 203
    :try_start_0
    iget-object v4, p0, Lcom/getjar/sdk/comm/LicenseCachingManager;->_cachingManager:Lcom/getjar/sdk/data/CachingManager;

    invoke-virtual {v4}, Lcom/getjar/sdk/data/CachingManager;->getAllCacheEntries()Ljava/util/ArrayList;

    move-result-object v0

    .line 204
    .local v0, "cacheEntries":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/getjar/sdk/data/CacheEntry;>;"
    if-eqz v0, :cond_1

    .line 206
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v3, v4, :cond_1

    .line 208
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/getjar/sdk/data/CacheEntry;

    .line 209
    .local v1, "cacheEntry":Lcom/getjar/sdk/data/CacheEntry;
    invoke-virtual {v1}, Lcom/getjar/sdk/data/CacheEntry;->hasTtlExpired()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v4

    if-eqz v4, :cond_0

    .line 210
    const/4 v4, 0x1

    .line 219
    .end local v1    # "cacheEntry":Lcom/getjar/sdk/data/CacheEntry;
    .end local v3    # "i":I
    :goto_1
    return v4

    .line 206
    .restart local v1    # "cacheEntry":Lcom/getjar/sdk/data/CacheEntry;
    .restart local v3    # "i":I
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 215
    .end local v0    # "cacheEntries":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/getjar/sdk/data/CacheEntry;>;"
    .end local v1    # "cacheEntry":Lcom/getjar/sdk/data/CacheEntry;
    .end local v3    # "i":I
    :catch_0
    move-exception v2

    .line 216
    .local v2, "e":Ljava/lang/Exception;
    new-instance v4, Lcom/getjar/sdk/exceptions/CachingException;

    invoke-direct {v4, v2}, Lcom/getjar/sdk/exceptions/CachingException;-><init>(Ljava/lang/Throwable;)V

    throw v4

    .line 219
    .end local v2    # "e":Ljava/lang/Exception;
    .restart local v0    # "cacheEntries":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/getjar/sdk/data/CacheEntry;>;"
    :cond_1
    const/4 v4, 0x0

    goto :goto_1
.end method

.method public removeCachedLicense(Lcom/getjar/sdk/data/LicenseInternal;)V
    .locals 2
    .param p1, "license"    # Lcom/getjar/sdk/data/LicenseInternal;

    .prologue
    .line 242
    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "license cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 244
    :cond_0
    iget-object v0, p0, Lcom/getjar/sdk/comm/LicenseCachingManager;->_cachingManager:Lcom/getjar/sdk/data/CachingManager;

    invoke-static {p1}, Lcom/getjar/sdk/comm/LicenseCachingManager;->getCacheKey(Lcom/getjar/sdk/data/LicenseInternal;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/getjar/sdk/data/CachingManager;->removeCacheEntry(Ljava/lang/String;)V

    .line 245
    return-void
.end method

.method public trimLruEntries()V
    .locals 2

    .prologue
    .line 252
    iget-object v0, p0, Lcom/getjar/sdk/comm/LicenseCachingManager;->_cachingManager:Lcom/getjar/sdk/data/CachingManager;

    const/16 v1, 0xc8

    invoke-virtual {v0, v1}, Lcom/getjar/sdk/data/CachingManager;->trimLruEntries(I)V

    .line 253
    return-void
.end method
