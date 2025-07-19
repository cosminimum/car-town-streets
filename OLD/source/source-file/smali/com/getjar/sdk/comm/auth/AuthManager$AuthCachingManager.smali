.class Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;
.super Ljava/lang/Object;
.source "AuthManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getjar/sdk/comm/auth/AuthManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AuthCachingManager"
.end annotation


# static fields
.field private static final _KeyAuthenticationToken:Ljava/lang/String; = "authenticationToken"

.field private static final _KeyUserAccessID:Ljava/lang/String; = "userAccessId"

.field private static final _KeyUserAuthProviderFilter:Ljava/lang/String; = "userAuthProviderFilter"

.field private static final _KeyUserDeviceID:Ljava/lang/String; = "userDeviceId"


# instance fields
.field private final _authCachingManager:Lcom/getjar/sdk/data/CachingManager;

.field private final _claimsAndCapsCachingManager:Lcom/getjar/sdk/data/CachingManager;

.field private final _settingsCachingManager:Lcom/getjar/sdk/data/CachingManager;

.field final synthetic this$0:Lcom/getjar/sdk/comm/auth/AuthManager;


# direct methods
.method private constructor <init>(Lcom/getjar/sdk/comm/auth/AuthManager;)V
    .locals 3

    .prologue
    .line 955
    iput-object p1, p0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;->this$0:Lcom/getjar/sdk/comm/auth/AuthManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 956
    new-instance v0, Lcom/getjar/sdk/data/CachingManager;

    invoke-static {p1}, Lcom/getjar/sdk/comm/auth/AuthManager;->access$1900(Lcom/getjar/sdk/comm/auth/AuthManager;)Lcom/getjar/sdk/comm/CommContext;

    move-result-object v1

    invoke-virtual {v1}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "authCache"

    invoke-direct {v0, v1, v2}, Lcom/getjar/sdk/data/CachingManager;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;->_authCachingManager:Lcom/getjar/sdk/data/CachingManager;

    .line 957
    new-instance v0, Lcom/getjar/sdk/data/CachingManager;

    invoke-static {p1}, Lcom/getjar/sdk/comm/auth/AuthManager;->access$1900(Lcom/getjar/sdk/comm/auth/AuthManager;)Lcom/getjar/sdk/comm/CommContext;

    move-result-object v1

    invoke-virtual {v1}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "claimsAndCapsCache"

    invoke-direct {v0, v1, v2}, Lcom/getjar/sdk/data/CachingManager;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;->_claimsAndCapsCachingManager:Lcom/getjar/sdk/data/CachingManager;

    .line 958
    new-instance v0, Lcom/getjar/sdk/data/CachingManager;

    invoke-static {p1}, Lcom/getjar/sdk/comm/auth/AuthManager;->access$1900(Lcom/getjar/sdk/comm/auth/AuthManager;)Lcom/getjar/sdk/comm/CommContext;

    move-result-object v1

    invoke-virtual {v1}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "settings"

    invoke-direct {v0, v1, v2}, Lcom/getjar/sdk/data/CachingManager;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;->_settingsCachingManager:Lcom/getjar/sdk/data/CachingManager;

    .line 959
    return-void
.end method

.method synthetic constructor <init>(Lcom/getjar/sdk/comm/auth/AuthManager;Lcom/getjar/sdk/comm/auth/AuthManager$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/getjar/sdk/comm/auth/AuthManager;
    .param p2, "x1"    # Lcom/getjar/sdk/comm/auth/AuthManager$1;

    .prologue
    .line 944
    invoke-direct {p0, p1}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;-><init>(Lcom/getjar/sdk/comm/auth/AuthManager;)V

    return-void
.end method

.method static synthetic access$100(Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;

    .prologue
    .line 944
    invoke-direct {p0}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;->getUserAuthProviderFilter()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1000(Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;)V
    .locals 0
    .param p0, "x0"    # Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;

    .prologue
    .line 944
    invoke-direct {p0}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;->clearCache()V

    return-void
.end method

.method static synthetic access$1100(Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;)Z
    .locals 1
    .param p0, "x0"    # Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;

    .prologue
    .line 944
    invoke-direct {p0}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;->isAuthExpired()Z

    move-result v0

    return v0
.end method

.method static synthetic access$1300(Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;Ljava/lang/String;Ljava/lang/Long;)V
    .locals 0
    .param p0, "x0"    # Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Ljava/lang/Long;

    .prologue
    .line 944
    invoke-direct {p0, p1, p2}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;->setAuthToken(Ljava/lang/String;Ljava/lang/Long;)V

    return-void
.end method

.method static synthetic access$1400(Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;Ljava/lang/String;J)V
    .locals 0
    .param p0, "x0"    # Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # J

    .prologue
    .line 944
    invoke-direct {p0, p1, p2, p3}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;->setUserAccessId(Ljava/lang/String;J)V

    return-void
.end method

.method static synthetic access$1500(Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 944
    invoke-direct {p0, p1}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;->setUserDeviceId(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$200(Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;

    .prologue
    .line 944
    invoke-direct {p0}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;->getAuthToken()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$2000(Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;)Ljava/util/Map;
    .locals 1
    .param p0, "x0"    # Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;

    .prologue
    .line 944
    invoke-direct {p0}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;->getCapabilities()Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$2100(Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;)Ljava/util/Map;
    .locals 1
    .param p0, "x0"    # Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;

    .prologue
    .line 944
    invoke-direct {p0}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;->getSettings()Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$300(Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;

    .prologue
    .line 944
    invoke-direct {p0}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;->getUserAccessId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$400(Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;

    .prologue
    .line 944
    invoke-direct {p0}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;->getUserDeviceId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$500(Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;)Ljava/lang/Long;
    .locals 1
    .param p0, "x0"    # Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;

    .prologue
    .line 944
    invoke-direct {p0}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;->getAuthTTL()Ljava/lang/Long;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$600(Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;)Ljava/lang/Long;
    .locals 1
    .param p0, "x0"    # Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;

    .prologue
    .line 944
    invoke-direct {p0}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;->getAuthTimestamp()Ljava/lang/Long;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$700(Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;Ljava/lang/String;Ljava/lang/Long;)V
    .locals 0
    .param p0, "x0"    # Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Ljava/lang/Long;

    .prologue
    .line 944
    invoke-direct {p0, p1, p2}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;->setUserAuthProviderFilter(Ljava/lang/String;Ljava/lang/Long;)V

    return-void
.end method

.method private clearCache()V
    .locals 2

    .prologue
    .line 1112
    iget-object v0, p0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;->_authCachingManager:Lcom/getjar/sdk/data/CachingManager;

    const-string v1, "userAuthProviderFilter"

    invoke-virtual {v0, v1}, Lcom/getjar/sdk/data/CachingManager;->removeCacheEntry(Ljava/lang/String;)V

    .line 1113
    iget-object v0, p0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;->_authCachingManager:Lcom/getjar/sdk/data/CachingManager;

    const-string v1, "authenticationToken"

    invoke-virtual {v0, v1}, Lcom/getjar/sdk/data/CachingManager;->removeCacheEntry(Ljava/lang/String;)V

    .line 1114
    iget-object v0, p0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;->_authCachingManager:Lcom/getjar/sdk/data/CachingManager;

    const-string v1, "userAccessId"

    invoke-virtual {v0, v1}, Lcom/getjar/sdk/data/CachingManager;->removeCacheEntry(Ljava/lang/String;)V

    .line 1115
    iget-object v0, p0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;->_authCachingManager:Lcom/getjar/sdk/data/CachingManager;

    const-string v1, "userDeviceId"

    invoke-virtual {v0, v1}, Lcom/getjar/sdk/data/CachingManager;->removeCacheEntry(Ljava/lang/String;)V

    .line 1116
    return-void
.end method

.method private getAuthTTL()Ljava/lang/Long;
    .locals 3

    .prologue
    .line 986
    iget-object v1, p0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;->_authCachingManager:Lcom/getjar/sdk/data/CachingManager;

    const-string v2, "authenticationToken"

    invoke-virtual {v1, v2}, Lcom/getjar/sdk/data/CachingManager;->getCacheEntry(Ljava/lang/String;)Lcom/getjar/sdk/data/CacheEntry;

    move-result-object v0

    .line 987
    .local v0, "entry":Lcom/getjar/sdk/data/CacheEntry;
    if-eqz v0, :cond_0

    .line 988
    invoke-virtual {v0}, Lcom/getjar/sdk/data/CacheEntry;->getTtl()Ljava/lang/Long;

    move-result-object v1

    .line 990
    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private getAuthTimestamp()Ljava/lang/Long;
    .locals 3

    .prologue
    .line 996
    iget-object v1, p0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;->_authCachingManager:Lcom/getjar/sdk/data/CachingManager;

    const-string v2, "authenticationToken"

    invoke-virtual {v1, v2}, Lcom/getjar/sdk/data/CachingManager;->getCacheEntry(Ljava/lang/String;)Lcom/getjar/sdk/data/CacheEntry;

    move-result-object v0

    .line 997
    .local v0, "entry":Lcom/getjar/sdk/data/CacheEntry;
    if-eqz v0, :cond_0

    .line 998
    invoke-virtual {v0}, Lcom/getjar/sdk/data/CacheEntry;->getLastUpdated()Ljava/lang/Long;

    move-result-object v1

    .line 1000
    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private getAuthToken()Ljava/lang/String;
    .locals 8

    .prologue
    const/4 v2, 0x0

    .line 968
    iget-object v3, p0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;->_authCachingManager:Lcom/getjar/sdk/data/CachingManager;

    const-string v4, "authenticationToken"

    invoke-virtual {v3, v4}, Lcom/getjar/sdk/data/CachingManager;->getCacheEntry(Ljava/lang/String;)Lcom/getjar/sdk/data/CacheEntry;

    move-result-object v0

    .line 969
    .local v0, "entry":Lcom/getjar/sdk/data/CacheEntry;
    if-nez v0, :cond_0

    move-object v1, v2

    .line 981
    :goto_0
    return-object v1

    .line 974
    :cond_0
    invoke-virtual {v0}, Lcom/getjar/sdk/data/CacheEntry;->getValue()Ljava/lang/String;

    move-result-object v1

    .line 975
    .local v1, "entryValue":Ljava/lang/String;
    invoke-static {v1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    move-object v1, v2

    .line 976
    goto :goto_0

    .line 980
    :cond_1
    sget-object v2, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "AuthFlow: Found cached authentication token value [%1$s]"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object v1, v6, v7

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    goto :goto_0
.end method

.method private getCapabilities()Ljava/util/Map;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1193
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 1198
    .local v4, "resultMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :try_start_0
    iget-object v5, p0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;->_claimsAndCapsCachingManager:Lcom/getjar/sdk/data/CachingManager;

    invoke-virtual {v5}, Lcom/getjar/sdk/data/CachingManager;->getAllCacheEntries()Ljava/util/ArrayList;
    :try_end_0
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 1204
    .local v1, "entries":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/data/CacheEntry;>;"
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/getjar/sdk/data/CacheEntry;

    .line 1205
    .local v2, "entry":Lcom/getjar/sdk/data/CacheEntry;
    invoke-virtual {v2}, Lcom/getjar/sdk/data/CacheEntry;->getName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "capabilities."

    invoke-virtual {v5, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 1206
    invoke-virtual {v2}, Lcom/getjar/sdk/data/CacheEntry;->getName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "capabilities."

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2}, Lcom/getjar/sdk/data/CacheEntry;->getValue()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 1199
    .end local v1    # "entries":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/data/CacheEntry;>;"
    .end local v2    # "entry":Lcom/getjar/sdk/data/CacheEntry;
    .end local v3    # "i$":Ljava/util/Iterator;
    :catch_0
    move-exception v0

    .line 1200
    .local v0, "e":Ljava/net/URISyntaxException;
    new-instance v5, Lcom/getjar/sdk/exceptions/CachingException;

    invoke-direct {v5, v0}, Lcom/getjar/sdk/exceptions/CachingException;-><init>(Ljava/lang/Throwable;)V

    throw v5

    .line 1211
    .end local v0    # "e":Ljava/net/URISyntaxException;
    .restart local v1    # "entries":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/data/CacheEntry;>;"
    .restart local v3    # "i$":Ljava/util/Iterator;
    :cond_1
    invoke-static {v4}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v5

    return-object v5
.end method

.method private getClaims()Ljava/util/Map;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1221
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 1226
    .local v4, "resultMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :try_start_0
    iget-object v5, p0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;->_claimsAndCapsCachingManager:Lcom/getjar/sdk/data/CachingManager;

    invoke-virtual {v5}, Lcom/getjar/sdk/data/CachingManager;->getAllCacheEntries()Ljava/util/ArrayList;
    :try_end_0
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 1232
    .local v1, "entries":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/data/CacheEntry;>;"
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/getjar/sdk/data/CacheEntry;

    .line 1233
    .local v2, "entry":Lcom/getjar/sdk/data/CacheEntry;
    invoke-virtual {v2}, Lcom/getjar/sdk/data/CacheEntry;->getName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "claims."

    invoke-virtual {v5, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 1234
    invoke-virtual {v2}, Lcom/getjar/sdk/data/CacheEntry;->getName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "claims."

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2}, Lcom/getjar/sdk/data/CacheEntry;->getValue()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 1227
    .end local v1    # "entries":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/data/CacheEntry;>;"
    .end local v2    # "entry":Lcom/getjar/sdk/data/CacheEntry;
    .end local v3    # "i$":Ljava/util/Iterator;
    :catch_0
    move-exception v0

    .line 1228
    .local v0, "e":Ljava/net/URISyntaxException;
    new-instance v5, Lcom/getjar/sdk/exceptions/CachingException;

    invoke-direct {v5, v0}, Lcom/getjar/sdk/exceptions/CachingException;-><init>(Ljava/lang/Throwable;)V

    throw v5

    .line 1239
    .end local v0    # "e":Ljava/net/URISyntaxException;
    .restart local v1    # "entries":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/data/CacheEntry;>;"
    .restart local v3    # "i$":Ljava/util/Iterator;
    :cond_1
    invoke-static {v4}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v5

    return-object v5
.end method

.method private getSettings()Ljava/util/Map;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/getjar/sdk/comm/auth/SettingsValue;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1248
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 1253
    .local v4, "resultMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/getjar/sdk/comm/auth/SettingsValue;>;"
    :try_start_0
    iget-object v5, p0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;->_settingsCachingManager:Lcom/getjar/sdk/data/CachingManager;

    invoke-virtual {v5}, Lcom/getjar/sdk/data/CachingManager;->getAllCacheEntries()Ljava/util/ArrayList;
    :try_end_0
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v1

    .line 1259
    .local v1, "entries":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/data/CacheEntry;>;"
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/getjar/sdk/data/CacheEntry;

    .line 1261
    .local v2, "entry":Lcom/getjar/sdk/data/CacheEntry;
    :try_start_1
    invoke-virtual {v2}, Lcom/getjar/sdk/data/CacheEntry;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2}, Lcom/getjar/sdk/data/CacheEntry;->getValue()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/getjar/sdk/utilities/Base64;->decodeToObject(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/getjar/sdk/comm/auth/SettingsValue;

    invoke-virtual {v4, v6, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_1} :catch_2

    goto :goto_0

    .line 1263
    :catch_0
    move-exception v0

    .line 1264
    .local v0, "e":Ljava/io/IOException;
    sget-object v5, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    sget-object v7, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    or-long/2addr v5, v7

    sget-object v7, Lcom/getjar/sdk/logging/Area;->CONFIG:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    or-long/2addr v5, v7

    const-string v7, "AuthFlow: getSettings() failed"

    invoke-static {v5, v6, v7, v0}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 1254
    .end local v0    # "e":Ljava/io/IOException;
    .end local v1    # "entries":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/data/CacheEntry;>;"
    .end local v2    # "entry":Lcom/getjar/sdk/data/CacheEntry;
    .end local v3    # "i$":Ljava/util/Iterator;
    :catch_1
    move-exception v0

    .line 1255
    .local v0, "e":Ljava/net/URISyntaxException;
    new-instance v5, Lcom/getjar/sdk/exceptions/CachingException;

    invoke-direct {v5, v0}, Lcom/getjar/sdk/exceptions/CachingException;-><init>(Ljava/lang/Throwable;)V

    throw v5

    .line 1265
    .end local v0    # "e":Ljava/net/URISyntaxException;
    .restart local v1    # "entries":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/data/CacheEntry;>;"
    .restart local v2    # "entry":Lcom/getjar/sdk/data/CacheEntry;
    .restart local v3    # "i$":Ljava/util/Iterator;
    :catch_2
    move-exception v0

    .line 1266
    .local v0, "e":Ljava/lang/ClassNotFoundException;
    sget-object v5, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    sget-object v7, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    or-long/2addr v5, v7

    sget-object v7, Lcom/getjar/sdk/logging/Area;->CONFIG:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    or-long/2addr v5, v7

    const-string v7, "AuthFlow: getSettings() failed"

    invoke-static {v5, v6, v7, v0}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 1270
    .end local v0    # "e":Ljava/lang/ClassNotFoundException;
    .end local v2    # "entry":Lcom/getjar/sdk/data/CacheEntry;
    :cond_0
    invoke-static {v4}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v5

    return-object v5
.end method

.method private getUserAccessId()Ljava/lang/String;
    .locals 8

    .prologue
    const/4 v2, 0x0

    .line 1059
    iget-object v3, p0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;->_authCachingManager:Lcom/getjar/sdk/data/CachingManager;

    const-string v4, "userAccessId"

    invoke-virtual {v3, v4}, Lcom/getjar/sdk/data/CachingManager;->getCacheEntry(Ljava/lang/String;)Lcom/getjar/sdk/data/CacheEntry;

    move-result-object v0

    .line 1060
    .local v0, "entry":Lcom/getjar/sdk/data/CacheEntry;
    if-nez v0, :cond_0

    move-object v1, v2

    .line 1072
    :goto_0
    return-object v1

    .line 1065
    :cond_0
    invoke-virtual {v0}, Lcom/getjar/sdk/data/CacheEntry;->getValue()Ljava/lang/String;

    move-result-object v1

    .line 1066
    .local v1, "entryValue":Ljava/lang/String;
    invoke-static {v1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    move-object v1, v2

    .line 1067
    goto :goto_0

    .line 1071
    :cond_1
    sget-object v2, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "AuthFlow: Found cached user access ID value [%1$s]"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object v1, v6, v7

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    goto :goto_0
.end method

.method private getUserAuthProviderFilter()Ljava/lang/String;
    .locals 8

    .prologue
    const/4 v2, 0x0

    .line 1032
    iget-object v3, p0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;->_authCachingManager:Lcom/getjar/sdk/data/CachingManager;

    const-string v4, "userAuthProviderFilter"

    invoke-virtual {v3, v4}, Lcom/getjar/sdk/data/CachingManager;->getCacheEntry(Ljava/lang/String;)Lcom/getjar/sdk/data/CacheEntry;

    move-result-object v0

    .line 1033
    .local v0, "entry":Lcom/getjar/sdk/data/CacheEntry;
    if-nez v0, :cond_0

    move-object v1, v2

    .line 1045
    :goto_0
    return-object v1

    .line 1038
    :cond_0
    invoke-virtual {v0}, Lcom/getjar/sdk/data/CacheEntry;->getValue()Ljava/lang/String;

    move-result-object v1

    .line 1039
    .local v1, "entryValue":Ljava/lang/String;
    invoke-static {v1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    move-object v1, v2

    .line 1040
    goto :goto_0

    .line 1044
    :cond_1
    sget-object v2, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "AuthFlow: Found cached user auth provider filter value [%1$s]"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object v1, v6, v7

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    goto :goto_0
.end method

.method private getUserDeviceId()Ljava/lang/String;
    .locals 8

    .prologue
    const/4 v2, 0x0

    .line 1084
    iget-object v3, p0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;->_authCachingManager:Lcom/getjar/sdk/data/CachingManager;

    const-string v4, "userDeviceId"

    invoke-virtual {v3, v4}, Lcom/getjar/sdk/data/CachingManager;->getCacheEntry(Ljava/lang/String;)Lcom/getjar/sdk/data/CacheEntry;

    move-result-object v0

    .line 1085
    .local v0, "entry":Lcom/getjar/sdk/data/CacheEntry;
    if-nez v0, :cond_0

    move-object v1, v2

    .line 1097
    :goto_0
    return-object v1

    .line 1090
    :cond_0
    invoke-virtual {v0}, Lcom/getjar/sdk/data/CacheEntry;->getValue()Ljava/lang/String;

    move-result-object v1

    .line 1091
    .local v1, "entryValue":Ljava/lang/String;
    invoke-static {v1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    move-object v1, v2

    .line 1092
    goto :goto_0

    .line 1096
    :cond_1
    sget-object v2, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "AuthFlow: Found cached user device ID value [%1$s]"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object v1, v6, v7

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    goto :goto_0
.end method

.method private isAuthExpired()Z
    .locals 11

    .prologue
    const/4 v0, 0x1

    .line 1006
    invoke-direct {p0}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;->getAuthTTL()Ljava/lang/Long;

    move-result-object v1

    .line 1007
    .local v1, "authTTL":Ljava/lang/Long;
    invoke-direct {p0}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;->getAuthTimestamp()Ljava/lang/Long;

    move-result-object v2

    .line 1008
    .local v2, "authTimestamp":Ljava/lang/Long;
    if-eqz v1, :cond_0

    if-nez v2, :cond_1

    .line 1015
    :cond_0
    :goto_0
    return v0

    .line 1012
    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    .line 1013
    .local v5, "now":J
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v7

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v9

    add-long/2addr v7, v9

    const-wide/32 v9, 0x36ee80

    sub-long v3, v7, v9

    .line 1014
    .local v3, "expiresOn":J
    cmp-long v7, v3, v5

    if-gez v7, :cond_2

    .line 1015
    .local v0, "authExpired":Z
    :goto_1
    goto :goto_0

    .line 1014
    .end local v0    # "authExpired":Z
    :cond_2
    const/4 v0, 0x0

    goto :goto_1
.end method

.method private setAuthToken(Ljava/lang/String;Ljava/lang/Long;)V
    .locals 6
    .param p1, "authToken"    # Ljava/lang/String;
    .param p2, "ttl"    # Ljava/lang/Long;

    .prologue
    const/4 v4, 0x0

    .line 1022
    iget-object v0, p0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;->_authCachingManager:Lcom/getjar/sdk/data/CachingManager;

    const-string v1, "authenticationToken"

    move-object v2, p1

    move-object v3, p2

    move-object v5, v4

    invoke-virtual/range {v0 .. v5}, Lcom/getjar/sdk/data/CachingManager;->updateCache(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/String;Ljava/net/URI;)V

    .line 1023
    return-void
.end method

.method private setUserAccessId(Ljava/lang/String;J)V
    .locals 6
    .param p1, "userAccessId"    # Ljava/lang/String;
    .param p2, "ttl"    # J

    .prologue
    const/4 v4, 0x0

    .line 1077
    iget-object v0, p0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;->_authCachingManager:Lcom/getjar/sdk/data/CachingManager;

    const-string v1, "userAccessId"

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    move-object v2, p1

    move-object v5, v4

    invoke-virtual/range {v0 .. v5}, Lcom/getjar/sdk/data/CachingManager;->updateCache(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/String;Ljava/net/URI;)V

    .line 1078
    return-void
.end method

.method private setUserAuthProviderFilter(Ljava/lang/String;Ljava/lang/Long;)V
    .locals 6
    .param p1, "userAuthProviderFilter"    # Ljava/lang/String;
    .param p2, "ttl"    # Ljava/lang/Long;

    .prologue
    const/4 v4, 0x0

    .line 1052
    iget-object v0, p0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;->_authCachingManager:Lcom/getjar/sdk/data/CachingManager;

    const-string v1, "userAuthProviderFilter"

    move-object v2, p1

    move-object v3, p2

    move-object v5, v4

    invoke-virtual/range {v0 .. v5}, Lcom/getjar/sdk/data/CachingManager;->updateCache(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/String;Ljava/net/URI;)V

    .line 1053
    return-void
.end method

.method private setUserDeviceId(Ljava/lang/String;)V
    .locals 6
    .param p1, "userDeviceId"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 1104
    iget-object v0, p0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;->_authCachingManager:Lcom/getjar/sdk/data/CachingManager;

    const-string v1, "userDeviceId"

    const-wide v2, 0x7fffffffffffffffL

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    move-object v2, p1

    move-object v5, v4

    invoke-virtual/range {v0 .. v5}, Lcom/getjar/sdk/data/CachingManager;->updateCache(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/String;Ljava/net/URI;)V

    .line 1105
    return-void
.end method


# virtual methods
.method public setClaims(Ljava/util/Map;J)V
    .locals 11
    .param p2, "ttl"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;J)V"
        }
    .end annotation

    .prologue
    .local p1, "claims":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v4, 0x0

    .line 1134
    if-nez p1, :cond_0

    .line 1135
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v3, "\'claims\' cannot be NULL"

    invoke-direct {v0, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1137
    :cond_0
    const-wide/16 v7, 0x0

    cmp-long v0, p2, v7

    if-gez v0, :cond_1

    .line 1138
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v3, "\'ttl\' cannot be less than zero"

    invoke-direct {v0, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1142
    :cond_1
    iget-object v0, p0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;->_claimsAndCapsCachingManager:Lcom/getjar/sdk/data/CachingManager;

    invoke-virtual {v0}, Lcom/getjar/sdk/data/CachingManager;->removeCacheEntries()V

    .line 1146
    invoke-interface {p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .local v6, "i$":Ljava/util/Iterator;
    :cond_2
    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 1147
    .local v1, "key":Ljava/lang/String;
    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 1148
    .local v2, "value":Ljava/lang/String;
    invoke-static {v1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    invoke-static {v2}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 1151
    iget-object v0, p0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;->_claimsAndCapsCachingManager:Lcom/getjar/sdk/data/CachingManager;

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    move-object v5, v4

    invoke-virtual/range {v0 .. v5}, Lcom/getjar/sdk/data/CachingManager;->updateCache(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/String;Ljava/net/URI;)V

    .line 1152
    sget-object v0, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    sget-object v0, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v9

    or-long/2addr v7, v9

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "AuthFlow: claim added to cache [key:%1$s  value:%2$s  ttl:%3$d]"

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v9, 0x0

    aput-object v1, v5, v9

    const/4 v9, 0x1

    aput-object v2, v5, v9

    const/4 v9, 0x2

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    aput-object v10, v5, v9

    invoke-static {v0, v3, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v7, v8, v0}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    goto :goto_0

    .line 1154
    .end local v1    # "key":Ljava/lang/String;
    .end local v2    # "value":Ljava/lang/String;
    :cond_3
    return-void
.end method

.method public setSettings(Ljava/util/Map;J)V
    .locals 11
    .param p2, "ttl"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/getjar/sdk/comm/auth/SettingsValue;",
            ">;J)V"
        }
    .end annotation

    .prologue
    .line 1159
    .local p1, "settingsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/getjar/sdk/comm/auth/SettingsValue;>;"
    if-nez p1, :cond_0

    .line 1160
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v2, "\'settingsMap\' cannot be NULL"

    invoke-direct {v0, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1162
    :cond_0
    const-wide/16 v2, 0x0

    cmp-long v0, p2, v2

    if-gez v0, :cond_1

    .line 1163
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v2, "\'ttl\' cannot be less than zero"

    invoke-direct {v0, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1166
    :cond_1
    invoke-interface {p1}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 1185
    :cond_2
    return-void

    .line 1171
    :cond_3
    iget-object v0, p0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;->_settingsCachingManager:Lcom/getjar/sdk/data/CachingManager;

    invoke-virtual {v0}, Lcom/getjar/sdk/data/CachingManager;->removeCacheEntries()V

    .line 1173
    invoke-interface {p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .local v7, "i$":Ljava/util/Iterator;
    :cond_4
    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 1174
    .local v1, "key":Ljava/lang/String;
    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/getjar/sdk/comm/auth/SettingsValue;

    .line 1175
    .local v8, "value":Lcom/getjar/sdk/comm/auth/SettingsValue;
    invoke-static {v1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_4

    .line 1179
    :try_start_0
    iget-object v0, p0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;->_settingsCachingManager:Lcom/getjar/sdk/data/CachingManager;

    invoke-static {v8}, Lcom/getjar/sdk/utilities/Base64;->encodeObject(Ljava/io/Serializable;)Ljava/lang/String;

    move-result-object v2

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Lcom/getjar/sdk/data/CachingManager;->updateCache(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/String;Ljava/net/URI;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1183
    :goto_1
    sget-object v0, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v0, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "AuthFlow: setting added to cache [key:%1$s  value:%2$s  ttl:%3$d]"

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v9, 0x0

    aput-object v1, v5, v9

    const/4 v9, 0x1

    aput-object v8, v5, v9

    const/4 v9, 0x2

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    aput-object v10, v5, v9

    invoke-static {v0, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    goto :goto_0

    .line 1180
    :catch_0
    move-exception v6

    .line 1181
    .local v6, "e":Ljava/io/IOException;
    sget-object v0, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v0, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    const-string v0, "Error adding setting to cache"

    invoke-static {v2, v3, v0, v6}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1
.end method
