.class public Lcom/getjar/sdk/rewards/GooglePlayLaunchCachingManager;
.super Ljava/lang/Object;
.source "GooglePlayLaunchCachingManager.java"


# static fields
.field private static final _CacheLRUCap:I = 0xa

.field private static final _CacheNamespace:Ljava/lang/String; = "google.play.launch.cache"

.field private static final _CacheTTL:J = 0x48190800L


# instance fields
.field private final _cachingManager:Lcom/getjar/sdk/data/CachingManager;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "androidContext"    # Landroid/content/Context;

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    new-instance v0, Lcom/getjar/sdk/data/CachingManager;

    const-string v1, "google.play.launch.cache"

    invoke-direct {v0, p1, v1}, Lcom/getjar/sdk/data/CachingManager;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/getjar/sdk/rewards/GooglePlayLaunchCachingManager;->_cachingManager:Lcom/getjar/sdk/data/CachingManager;

    .line 19
    return-void
.end method


# virtual methods
.method public get(Ljava/lang/String;)Lcom/getjar/sdk/rewards/GooglePlayLaunchReason;
    .locals 3
    .param p1, "packageName"    # Ljava/lang/String;

    .prologue
    .line 36
    const/4 v1, 0x0

    .line 37
    .local v1, "reason":Lcom/getjar/sdk/rewards/GooglePlayLaunchReason;
    iget-object v2, p0, Lcom/getjar/sdk/rewards/GooglePlayLaunchCachingManager;->_cachingManager:Lcom/getjar/sdk/data/CachingManager;

    invoke-virtual {v2, p1}, Lcom/getjar/sdk/data/CachingManager;->getCacheEntry(Ljava/lang/String;)Lcom/getjar/sdk/data/CacheEntry;

    move-result-object v0

    .line 38
    .local v0, "cacheEntry":Lcom/getjar/sdk/data/CacheEntry;
    if-eqz v0, :cond_0

    .line 39
    invoke-virtual {v0}, Lcom/getjar/sdk/data/CacheEntry;->getValue()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/getjar/sdk/rewards/GooglePlayLaunchReason;->valueOf(Ljava/lang/String;)Lcom/getjar/sdk/rewards/GooglePlayLaunchReason;

    move-result-object v1

    .line 41
    :cond_0
    return-object v1
.end method

.method public remove(Ljava/lang/String;)V
    .locals 1
    .param p1, "packageName"    # Ljava/lang/String;

    .prologue
    .line 46
    iget-object v0, p0, Lcom/getjar/sdk/rewards/GooglePlayLaunchCachingManager;->_cachingManager:Lcom/getjar/sdk/data/CachingManager;

    invoke-virtual {v0, p1}, Lcom/getjar/sdk/data/CachingManager;->removeCacheEntry(Ljava/lang/String;)V

    .line 47
    return-void
.end method

.method public update(Ljava/lang/String;Lcom/getjar/sdk/rewards/GooglePlayLaunchReason;)V
    .locals 7
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "reason"    # Lcom/getjar/sdk/rewards/GooglePlayLaunchReason;

    .prologue
    const/4 v4, 0x0

    .line 28
    iget-object v0, p0, Lcom/getjar/sdk/rewards/GooglePlayLaunchCachingManager;->_cachingManager:Lcom/getjar/sdk/data/CachingManager;

    invoke-virtual {p2}, Lcom/getjar/sdk/rewards/GooglePlayLaunchReason;->name()Ljava/lang/String;

    move-result-object v2

    const-wide/32 v5, 0x48190800

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    move-object v1, p1

    move-object v5, v4

    invoke-virtual/range {v0 .. v5}, Lcom/getjar/sdk/data/CachingManager;->updateCache(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/String;Ljava/net/URI;)V

    .line 31
    iget-object v0, p0, Lcom/getjar/sdk/rewards/GooglePlayLaunchCachingManager;->_cachingManager:Lcom/getjar/sdk/data/CachingManager;

    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Lcom/getjar/sdk/data/CachingManager;->trimLruEntries(I)V

    .line 32
    return-void
.end method
