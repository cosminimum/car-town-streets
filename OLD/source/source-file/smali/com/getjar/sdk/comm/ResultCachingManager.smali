.class public Lcom/getjar/sdk/comm/ResultCachingManager;
.super Ljava/lang/Object;
.source "ResultCachingManager.java"


# static fields
.field private static final _LRUCapMaximum:I = 0x12c


# instance fields
.field private final _cachingManager:Lcom/getjar/sdk/data/CachingManager;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2
    .param p1, "androidContext"    # Landroid/content/Context;
    .param p2, "cacheNamespace"    # Ljava/lang/String;

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'androidContext\' can not be NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 32
    :cond_0
    new-instance v0, Lcom/getjar/sdk/data/CachingManager;

    invoke-direct {v0, p1, p2}, Lcom/getjar/sdk/data/CachingManager;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/getjar/sdk/comm/ResultCachingManager;->_cachingManager:Lcom/getjar/sdk/data/CachingManager;

    .line 33
    return-void
.end method

.method private getCacheEntry(Lcom/getjar/sdk/comm/Request;)Lcom/getjar/sdk/data/CacheEntry;
    .locals 2
    .param p1, "request"    # Lcom/getjar/sdk/comm/Request;

    .prologue
    .line 264
    iget-object v0, p0, Lcom/getjar/sdk/comm/ResultCachingManager;->_cachingManager:Lcom/getjar/sdk/data/CachingManager;

    invoke-direct {p0, p1}, Lcom/getjar/sdk/comm/ResultCachingManager;->getCacheKey(Lcom/getjar/sdk/comm/Request;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/getjar/sdk/data/CachingManager;->getCacheEntry(Ljava/lang/String;)Lcom/getjar/sdk/data/CacheEntry;

    move-result-object v0

    return-object v0
.end method

.method private getCacheKey(Lcom/getjar/sdk/comm/Request;)Ljava/lang/String;
    .locals 5
    .param p1, "request"    # Lcom/getjar/sdk/comm/Request;

    .prologue
    .line 269
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "%1$d"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-virtual {p1}, Lcom/getjar/sdk/comm/Request;->getId()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getETagFromResult(Lcom/getjar/sdk/comm/Operation;)Ljava/lang/String;
    .locals 3
    .param p0, "operation"    # Lcom/getjar/sdk/comm/Operation;

    .prologue
    .line 243
    if-nez p0, :cond_0

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\'operation\' can not be NULL"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 245
    :cond_0
    invoke-virtual {p0}, Lcom/getjar/sdk/comm/Operation;->getResult()Lcom/getjar/sdk/comm/Result;

    move-result-object v0

    .line 246
    .local v0, "result":Lcom/getjar/sdk/comm/Result;
    invoke-static {v0}, Lcom/getjar/sdk/comm/ResultCachingManager;->getETagFromResult(Lcom/getjar/sdk/comm/Result;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static getETagFromResult(Lcom/getjar/sdk/comm/Result;)Ljava/lang/String;
    .locals 3
    .param p0, "result"    # Lcom/getjar/sdk/comm/Result;

    .prologue
    .line 251
    const/4 v0, 0x0

    .line 252
    .local v0, "eTag":Ljava/lang/String;
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Lcom/getjar/sdk/comm/Result;->getHeaders()Ljava/util/Map;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 255
    invoke-virtual {p0}, Lcom/getjar/sdk/comm/Result;->getHeaders()Ljava/util/Map;

    move-result-object v1

    const-string v2, "ETag"

    invoke-interface {v1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Lcom/getjar/sdk/comm/Result;->getHeaders()Ljava/util/Map;

    move-result-object v1

    const-string v2, "ETag"

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Lcom/getjar/sdk/comm/Result;->getHeaders()Ljava/util/Map;

    move-result-object v1

    const-string v2, "ETag"

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_0

    .line 256
    invoke-virtual {p0}, Lcom/getjar/sdk/comm/Result;->getHeaders()Ljava/util/Map;

    move-result-object v1

    const-string v2, "ETag"

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "eTag":Ljava/lang/String;
    check-cast v0, Ljava/lang/String;

    .line 259
    .restart local v0    # "eTag":Ljava/lang/String;
    :cond_0
    return-object v0
.end method

.method public static getTtlFromResult(Lcom/getjar/sdk/comm/Operation;)Ljava/lang/Long;
    .locals 3
    .param p0, "operation"    # Lcom/getjar/sdk/comm/Operation;

    .prologue
    .line 232
    if-nez p0, :cond_0

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\'operation\' can not be NULL"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 234
    :cond_0
    invoke-virtual {p0}, Lcom/getjar/sdk/comm/Operation;->getResult()Lcom/getjar/sdk/comm/Result;

    move-result-object v0

    .line 235
    .local v0, "result":Lcom/getjar/sdk/comm/Result;
    invoke-static {v0}, Lcom/getjar/sdk/comm/ResultCachingManager;->getTtlFromResult(Lcom/getjar/sdk/comm/Result;)Ljava/lang/Long;

    move-result-object v1

    return-object v1
.end method

.method public static getTtlFromResult(Lcom/getjar/sdk/comm/Result;)Ljava/lang/Long;
    .locals 15
    .param p0, "result"    # Lcom/getjar/sdk/comm/Result;

    .prologue
    .line 185
    const/4 v7, 0x0

    .line 186
    .local v7, "ttl":Ljava/lang/Long;
    if-eqz p0, :cond_4

    invoke-virtual {p0}, Lcom/getjar/sdk/comm/Result;->getHeaders()Ljava/util/Map;

    move-result-object v11

    if-eqz v11, :cond_4

    .line 191
    invoke-virtual {p0}, Lcom/getjar/sdk/comm/Result;->getHeaders()Ljava/util/Map;

    move-result-object v11

    const-string v12, "Cache-Control"

    invoke-interface {v11, v12}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_4

    invoke-virtual {p0}, Lcom/getjar/sdk/comm/Result;->getHeaders()Ljava/util/Map;

    move-result-object v11

    const-string v12, "Cache-Control"

    invoke-interface {v11, v12}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    if-eqz v11, :cond_4

    invoke-virtual {p0}, Lcom/getjar/sdk/comm/Result;->getHeaders()Ljava/util/Map;

    move-result-object v11

    const-string v12, "Cache-Control"

    invoke-interface {v11, v12}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/util/List;

    invoke-interface {v11}, Ljava/util/List;->size()I

    move-result v11

    if-lez v11, :cond_4

    .line 192
    const/4 v1, 0x0

    .line 193
    .local v1, "cacheControlStr":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/getjar/sdk/comm/Result;->getHeaders()Ljava/util/Map;

    move-result-object v11

    const-string v12, "Cache-Control"

    invoke-interface {v11, v12}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/util/List;

    invoke-interface {v11}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "i$":Ljava/util/Iterator;
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    .line 194
    .local v10, "value":Ljava/lang/String;
    move-object v1, v10

    .line 197
    .end local v10    # "value":Ljava/lang/String;
    :cond_0
    invoke-static {v1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v11

    if-nez v11, :cond_4

    .line 198
    const-string v11, ","

    invoke-virtual {v1, v11}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .local v0, "arr$":[Ljava/lang/String;
    array-length v5, v0

    .local v5, "len$":I
    const/4 v4, 0x0

    .local v4, "i$":I
    :goto_0
    if-ge v4, v5, :cond_4

    aget-object v2, v0, v4

    .line 199
    .local v2, "cacheRequestDirective":Ljava/lang/String;
    if-nez v2, :cond_2

    .line 198
    :cond_1
    :goto_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 200
    :cond_2
    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    .line 203
    const-string v11, "no-cache"

    invoke-virtual {v11, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_3

    const/4 v11, 0x0

    .line 223
    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v1    # "cacheControlStr":Ljava/lang/String;
    .end local v2    # "cacheRequestDirective":Ljava/lang/String;
    .end local v4    # "i$":I
    .end local v5    # "len$":I
    :goto_2
    return-object v11

    .line 206
    .restart local v0    # "arr$":[Ljava/lang/String;
    .restart local v1    # "cacheControlStr":Ljava/lang/String;
    .restart local v2    # "cacheRequestDirective":Ljava/lang/String;
    .restart local v4    # "i$":I
    .restart local v5    # "len$":I
    :cond_3
    const-string v11, "="

    invoke-virtual {v2, v11}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v6

    .line 207
    .local v6, "nameValue":[Ljava/lang/String;
    array-length v11, v6

    const/4 v12, 0x1

    if-le v11, v12, :cond_1

    const/4 v11, 0x0

    aget-object v11, v6, v11

    if-eqz v11, :cond_1

    const/4 v11, 0x1

    aget-object v11, v6, v11

    if-eqz v11, :cond_1

    const-string v11, "max-age"

    const/4 v12, 0x0

    aget-object v12, v6, v12

    invoke-virtual {v12}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_1

    .line 213
    const/4 v11, 0x1

    :try_start_0
    aget-object v11, v6, v11

    invoke-virtual {v11}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v8

    .line 214
    .local v8, "ttlInSeconds":J
    const-wide/16 v11, 0x0

    cmp-long v11, v8, v11

    if-ltz v11, :cond_1

    const-wide/16 v11, 0x3e8

    mul-long/2addr v11, v8

    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v7

    goto :goto_1

    .line 215
    .end local v8    # "ttlInSeconds":J
    :catch_0
    move-exception v3

    .line 216
    .local v3, "e":Ljava/lang/NumberFormatException;
    sget-object v11, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v11}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v11

    sget-object v13, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v13}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v13

    or-long/2addr v11, v13

    const-string v13, "ResultCachingManager: getTtl() Parsing max-age failed"

    invoke-static {v11, v12, v13, v3}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v1    # "cacheControlStr":Ljava/lang/String;
    .end local v2    # "cacheRequestDirective":Ljava/lang/String;
    .end local v3    # "e":Ljava/lang/NumberFormatException;
    .end local v4    # "i$":I
    .end local v5    # "len$":I
    .end local v6    # "nameValue":[Ljava/lang/String;
    :cond_4
    move-object v11, v7

    .line 223
    goto :goto_2
.end method


# virtual methods
.method public addResultToCache(Lcom/getjar/sdk/comm/Operation;)V
    .locals 9
    .param p1, "operation"    # Lcom/getjar/sdk/comm/Operation;

    .prologue
    .line 40
    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'operation\' can not be NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 41
    :cond_0
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/Operation;->getRequest()Lcom/getjar/sdk/comm/Request;

    move-result-object v0

    if-nez v0, :cond_1

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Operation must have a Request"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 42
    :cond_1
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/Operation;->getResult()Lcom/getjar/sdk/comm/Result;

    move-result-object v0

    if-nez v0, :cond_2

    new-instance v0, Ljava/lang/IllegalStateException;

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v2, "Operation %1$d does not yet have a Result"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-virtual {p1}, Lcom/getjar/sdk/comm/Operation;->getId()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v5, v7

    invoke-static {v1, v2, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 45
    :cond_2
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/Operation;->getResult()Lcom/getjar/sdk/comm/Result;

    move-result-object v0

    invoke-virtual {v0}, Lcom/getjar/sdk/comm/Result;->isSuccessfulResponse()Z

    move-result v0

    if-nez v0, :cond_4

    .line 68
    :cond_3
    :goto_0
    return-void

    .line 48
    :cond_4
    invoke-static {p1}, Lcom/getjar/sdk/comm/ResultCachingManager;->getTtlFromResult(Lcom/getjar/sdk/comm/Operation;)Ljava/lang/Long;

    move-result-object v3

    .line 51
    .local v3, "ttl":Ljava/lang/Long;
    if-eqz v3, :cond_3

    .line 54
    invoke-static {p1}, Lcom/getjar/sdk/comm/ResultCachingManager;->getETagFromResult(Lcom/getjar/sdk/comm/Operation;)Ljava/lang/String;

    move-result-object v4

    .line 57
    .local v4, "eTag":Ljava/lang/String;
    :try_start_0
    iget-object v0, p0, Lcom/getjar/sdk/comm/ResultCachingManager;->_cachingManager:Lcom/getjar/sdk/data/CachingManager;

    invoke-virtual {p1}, Lcom/getjar/sdk/comm/Operation;->getRequest()Lcom/getjar/sdk/comm/Request;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/getjar/sdk/comm/ResultCachingManager;->getCacheKey(Lcom/getjar/sdk/comm/Request;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/getjar/sdk/comm/Operation;->getResult()Lcom/getjar/sdk/comm/Result;

    move-result-object v2

    invoke-static {v2}, Lcom/getjar/sdk/utilities/Base64;->encodeObject(Ljava/io/Serializable;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lcom/getjar/sdk/comm/Operation;->getRequest()Lcom/getjar/sdk/comm/Request;

    move-result-object v5

    invoke-virtual {v5}, Lcom/getjar/sdk/comm/Request;->getUriForRequest()Ljava/net/URI;

    move-result-object v5

    invoke-virtual/range {v0 .. v5}, Lcom/getjar/sdk/data/CachingManager;->updateCache(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/String;Ljava/net/URI;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 63
    :catch_0
    move-exception v6

    .line 64
    .local v6, "e":Ljava/io/IOException;
    new-instance v0, Lcom/getjar/sdk/exceptions/CachingException;

    invoke-direct {v0, v6}, Lcom/getjar/sdk/exceptions/CachingException;-><init>(Ljava/lang/Throwable;)V

    throw v0

    .line 65
    .end local v6    # "e":Ljava/io/IOException;
    :catch_1
    move-exception v6

    .line 66
    .local v6, "e":Ljava/net/URISyntaxException;
    new-instance v0, Lcom/getjar/sdk/exceptions/CachingException;

    invoke-direct {v0, v6}, Lcom/getjar/sdk/exceptions/CachingException;-><init>(Ljava/lang/Throwable;)V

    throw v0
.end method

.method public getETagFromCache(Lcom/getjar/sdk/comm/Operation;)Ljava/lang/String;
    .locals 6
    .param p1, "operation"    # Lcom/getjar/sdk/comm/Operation;

    .prologue
    .line 97
    :try_start_0
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/Operation;->getRequest()Lcom/getjar/sdk/comm/Request;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/getjar/sdk/comm/ResultCachingManager;->getCacheEntry(Lcom/getjar/sdk/comm/Request;)Lcom/getjar/sdk/data/CacheEntry;

    move-result-object v0

    .line 98
    .local v0, "cacheEntry":Lcom/getjar/sdk/data/CacheEntry;
    if-eqz v0, :cond_0

    .line 101
    invoke-virtual {v0}, Lcom/getjar/sdk/data/CacheEntry;->getEtag()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 107
    .end local v0    # "cacheEntry":Lcom/getjar/sdk/data/CacheEntry;
    :goto_0
    return-object v2

    .line 104
    :catch_0
    move-exception v1

    .line 105
    .local v1, "e":Ljava/lang/Exception;
    sget-object v2, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    const-string v4, "ResultCachingManager: getETag() failed"

    invoke-static {v2, v3, v4, v1}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 107
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public getRequestResult(Lcom/getjar/sdk/comm/Operation;)Lcom/getjar/sdk/comm/Result;
    .locals 9
    .param p1, "operation"    # Lcom/getjar/sdk/comm/Operation;

    .prologue
    .line 78
    :try_start_0
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/Operation;->getRequest()Lcom/getjar/sdk/comm/Request;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/getjar/sdk/comm/ResultCachingManager;->getCacheEntry(Lcom/getjar/sdk/comm/Request;)Lcom/getjar/sdk/data/CacheEntry;

    move-result-object v0

    .line 79
    .local v0, "cacheEntry":Lcom/getjar/sdk/data/CacheEntry;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/getjar/sdk/data/CacheEntry;->hasTtlExpired()Z

    move-result v2

    if-nez v2, :cond_0

    .line 82
    sget-object v2, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "ResultCachingManager: getRequestResult() Found a cached result for Request %1$d"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-virtual {p1}, Lcom/getjar/sdk/comm/Operation;->getRequest()Lcom/getjar/sdk/comm/Request;

    move-result-object v8

    invoke-virtual {v8}, Lcom/getjar/sdk/comm/Request;->getId()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 83
    invoke-virtual {v0}, Lcom/getjar/sdk/data/CacheEntry;->getValue()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/getjar/sdk/utilities/Base64;->decodeToObject(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/getjar/sdk/comm/Result;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 89
    .end local v0    # "cacheEntry":Lcom/getjar/sdk/data/CacheEntry;
    :goto_0
    return-object v2

    .line 86
    :catch_0
    move-exception v1

    .line 87
    .local v1, "e":Ljava/lang/Exception;
    sget-object v2, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    const-string v4, "ResultCachingManager: getRequestResult() failed"

    invoke-static {v2, v3, v4, v1}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 89
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method protected refreshCacheEntry(Lcom/getjar/sdk/comm/Operation;)V
    .locals 12
    .param p1, "operation"    # Lcom/getjar/sdk/comm/Operation;

    .prologue
    const/4 v11, 0x1

    const/4 v10, 0x0

    .line 134
    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'operation\' can not be NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 135
    :cond_0
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/Operation;->getRequest()Lcom/getjar/sdk/comm/Request;

    move-result-object v0

    if-nez v0, :cond_1

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Operation must have a Request"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 136
    :cond_1
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/Operation;->getResult()Lcom/getjar/sdk/comm/Result;

    move-result-object v0

    if-nez v0, :cond_2

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "refreshCacheEntry() can only be called for operations with a result"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 137
    :cond_2
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/Operation;->getResult()Lcom/getjar/sdk/comm/Result;

    move-result-object v0

    invoke-virtual {v0}, Lcom/getjar/sdk/comm/Result;->getResponseCode()I

    move-result v0

    const/16 v1, 0x130

    if-eq v0, v1, :cond_3

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "refreshCacheEntry() can only be called for operations with a 304 result"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 140
    :cond_3
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/Operation;->getRequest()Lcom/getjar/sdk/comm/Request;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/getjar/sdk/comm/ResultCachingManager;->getCacheEntry(Lcom/getjar/sdk/comm/Request;)Lcom/getjar/sdk/data/CacheEntry;

    move-result-object v6

    .line 141
    .local v6, "cacheEntry":Lcom/getjar/sdk/data/CacheEntry;
    if-nez v6, :cond_4

    .line 144
    new-instance v0, Ljava/lang/IllegalStateException;

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v2, "Request %1$d received a 304, but no stale cache entry was found"

    new-array v4, v11, [Ljava/lang/Object;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v10

    invoke-static {v1, v2, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 149
    :cond_4
    :try_start_0
    invoke-static {p1}, Lcom/getjar/sdk/comm/ResultCachingManager;->getTtlFromResult(Lcom/getjar/sdk/comm/Operation;)Ljava/lang/Long;

    move-result-object v3

    .line 150
    .local v3, "ttl":Ljava/lang/Long;
    iget-object v0, p0, Lcom/getjar/sdk/comm/ResultCachingManager;->_cachingManager:Lcom/getjar/sdk/data/CachingManager;

    invoke-virtual {v6}, Lcom/getjar/sdk/data/CacheEntry;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v6}, Lcom/getjar/sdk/data/CacheEntry;->getValue()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v6}, Lcom/getjar/sdk/data/CacheEntry;->getEtag()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v6}, Lcom/getjar/sdk/data/CacheEntry;->getUri()Ljava/net/URI;

    move-result-object v5

    invoke-virtual/range {v0 .. v5}, Lcom/getjar/sdk/data/CachingManager;->updateCache(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/String;Ljava/net/URI;)V

    .line 156
    sget-object v0, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v0, v4

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "ResultCachingManager: refreshCacheEntry() Cache entry updated: %1$s"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v8, 0x0

    invoke-virtual {v6}, Lcom/getjar/sdk/data/CacheEntry;->toString()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v5, v8

    invoke-static {v2, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 163
    .end local v3    # "ttl":Ljava/lang/Long;
    :goto_0
    :try_start_1
    invoke-virtual {v6}, Lcom/getjar/sdk/data/CacheEntry;->getValue()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/getjar/sdk/utilities/Base64;->decodeToObject(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/getjar/sdk/comm/Result;

    invoke-virtual {p1, v0}, Lcom/getjar/sdk/comm/Operation;->setResult(Lcom/getjar/sdk/comm/Result;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_1} :catch_2

    .line 169
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/Operation;->getResult()Lcom/getjar/sdk/comm/Result;

    move-result-object v0

    if-nez v0, :cond_5

    .line 170
    new-instance v0, Ljava/lang/IllegalStateException;

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v2, "Found a NULL result in cache for operation %1$d"

    new-array v4, v11, [Ljava/lang/Object;

    invoke-virtual {p1}, Lcom/getjar/sdk/comm/Operation;->getId()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v10

    invoke-static {v1, v2, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 157
    :catch_0
    move-exception v7

    .line 158
    .local v7, "e":Ljava/lang/Exception;
    sget-object v0, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v0, v4

    const-string v2, "ResultCachingManager: refreshCacheEntry() Updating the cache entry TTL failed"

    invoke-static {v0, v1, v2, v7}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 164
    .end local v7    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v7

    .line 165
    .local v7, "e":Ljava/io/IOException;
    new-instance v0, Lcom/getjar/sdk/exceptions/CachingException;

    invoke-direct {v0, v7}, Lcom/getjar/sdk/exceptions/CachingException;-><init>(Ljava/lang/Throwable;)V

    throw v0

    .line 166
    .end local v7    # "e":Ljava/io/IOException;
    :catch_2
    move-exception v7

    .line 167
    .local v7, "e":Ljava/lang/ClassNotFoundException;
    new-instance v0, Lcom/getjar/sdk/exceptions/CachingException;

    invoke-direct {v0, v7}, Lcom/getjar/sdk/exceptions/CachingException;-><init>(Ljava/lang/Throwable;)V

    throw v0

    .line 172
    .end local v7    # "e":Ljava/lang/ClassNotFoundException;
    :cond_5
    sget-object v0, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v0, v4

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "Operation %1$d received a 304 and has been updated to a cached result with %2$d"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    invoke-virtual {p1}, Lcom/getjar/sdk/comm/Operation;->getId()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v5, v10

    invoke-virtual {p1}, Lcom/getjar/sdk/comm/Operation;->getResult()Lcom/getjar/sdk/comm/Result;

    move-result-object v8

    invoke-virtual {v8}, Lcom/getjar/sdk/comm/Result;->getResponseCode()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v5, v11

    invoke-static {v2, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 176
    return-void
.end method

.method public trimLruEntries()V
    .locals 2

    .prologue
    .line 116
    iget-object v0, p0, Lcom/getjar/sdk/comm/ResultCachingManager;->_cachingManager:Lcom/getjar/sdk/data/CachingManager;

    const/16 v1, 0x12c

    invoke-virtual {v0, v1}, Lcom/getjar/sdk/data/CachingManager;->trimLruEntries(I)V

    .line 117
    return-void
.end method
