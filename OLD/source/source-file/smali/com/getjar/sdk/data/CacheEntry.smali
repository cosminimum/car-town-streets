.class public Lcom/getjar/sdk/data/CacheEntry;
.super Ljava/lang/Object;
.source "CacheEntry.java"


# instance fields
.field private final _createTimestamp:Ljava/lang/Long;

.field private final _etag:Ljava/lang/String;

.field private _id:I

.field private final _lastUpdated:Ljava/lang/Long;

.field private final _name:Ljava/lang/String;

.field private final _ttl:Ljava/lang/Long;

.field private final _uri:Ljava/net/URI;

.field private final _value:Ljava/lang/String;


# direct methods
.method protected constructor <init>(Landroid/database/Cursor;)V
    .locals 6
    .param p1, "dbCursor"    # Landroid/database/Cursor;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/URISyntaxException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x7

    const/4 v4, 0x6

    const/4 v2, 0x2

    const/4 v3, 0x0

    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 70
    if-nez p1, :cond_0

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\'dbCursor\' can not be NULL"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 71
    :cond_0
    invoke-interface {p1}, Landroid/database/Cursor;->isBeforeFirst()Z

    move-result v1

    if-nez v1, :cond_1

    invoke-interface {p1}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v1

    if-eqz v1, :cond_2

    :cond_1
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\'dbCursor\' must already be pointing to a valid record"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 73
    :cond_2
    const/4 v1, 0x0

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    iput v1, p0, Lcom/getjar/sdk/data/CacheEntry;->_id:I

    .line 74
    const/4 v1, 0x1

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/getjar/sdk/data/CacheEntry;->_name:Ljava/lang/String;

    .line 75
    invoke-interface {p1, v2}, Landroid/database/Cursor;->isNull(I)Z

    move-result v1

    if-nez v1, :cond_3

    .line 76
    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/getjar/sdk/data/CacheEntry;->_value:Ljava/lang/String;

    .line 80
    :goto_0
    const/4 v1, 0x3

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    iput-object v1, p0, Lcom/getjar/sdk/data/CacheEntry;->_createTimestamp:Ljava/lang/Long;

    .line 81
    const/4 v1, 0x4

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    iput-object v1, p0, Lcom/getjar/sdk/data/CacheEntry;->_lastUpdated:Ljava/lang/Long;

    .line 82
    const/4 v1, 0x5

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    iput-object v1, p0, Lcom/getjar/sdk/data/CacheEntry;->_ttl:Ljava/lang/Long;

    .line 83
    invoke-interface {p1, v4}, Landroid/database/Cursor;->isNull(I)Z

    move-result v1

    if-nez v1, :cond_5

    .line 84
    invoke-interface {p1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 85
    .local v0, "uriStr":Ljava/lang/String;
    invoke-static {v0}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_4

    .line 86
    new-instance v1, Ljava/net/URI;

    invoke-direct {v1, v0}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    iput-object v1, p0, Lcom/getjar/sdk/data/CacheEntry;->_uri:Ljava/net/URI;

    .line 93
    .end local v0    # "uriStr":Ljava/lang/String;
    :goto_1
    invoke-interface {p1, v5}, Landroid/database/Cursor;->isNull(I)Z

    move-result v1

    if-nez v1, :cond_6

    .line 94
    invoke-interface {p1, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/getjar/sdk/data/CacheEntry;->_etag:Ljava/lang/String;

    .line 98
    :goto_2
    return-void

    .line 78
    :cond_3
    iput-object v3, p0, Lcom/getjar/sdk/data/CacheEntry;->_value:Ljava/lang/String;

    goto :goto_0

    .line 88
    .restart local v0    # "uriStr":Ljava/lang/String;
    :cond_4
    iput-object v3, p0, Lcom/getjar/sdk/data/CacheEntry;->_uri:Ljava/net/URI;

    goto :goto_1

    .line 91
    .end local v0    # "uriStr":Ljava/lang/String;
    :cond_5
    iput-object v3, p0, Lcom/getjar/sdk/data/CacheEntry;->_uri:Ljava/net/URI;

    goto :goto_1

    .line 96
    :cond_6
    iput-object v3, p0, Lcom/getjar/sdk/data/CacheEntry;->_etag:Ljava/lang/String;

    goto :goto_2
.end method

.method protected constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/String;Ljava/net/URI;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .param p3, "ttl"    # Ljava/lang/Long;
    .param p4, "eTag"    # Ljava/lang/String;
    .param p5, "uri"    # Ljava/net/URI;

    .prologue
    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'name\' can not be NULL or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 54
    :cond_0
    if-nez p3, :cond_1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'ttl\' can not be NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 56
    :cond_1
    iput-object p1, p0, Lcom/getjar/sdk/data/CacheEntry;->_name:Ljava/lang/String;

    .line 57
    iput-object p2, p0, Lcom/getjar/sdk/data/CacheEntry;->_value:Ljava/lang/String;

    .line 58
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    iput-object v0, p0, Lcom/getjar/sdk/data/CacheEntry;->_createTimestamp:Ljava/lang/Long;

    .line 59
    iget-object v0, p0, Lcom/getjar/sdk/data/CacheEntry;->_createTimestamp:Ljava/lang/Long;

    iput-object v0, p0, Lcom/getjar/sdk/data/CacheEntry;->_lastUpdated:Ljava/lang/Long;

    .line 60
    iput-object p3, p0, Lcom/getjar/sdk/data/CacheEntry;->_ttl:Ljava/lang/Long;

    .line 61
    iput-object p5, p0, Lcom/getjar/sdk/data/CacheEntry;->_uri:Ljava/net/URI;

    .line 62
    iput-object p4, p0, Lcom/getjar/sdk/data/CacheEntry;->_etag:Ljava/lang/String;

    .line 63
    return-void
.end method


# virtual methods
.method public getCreateTimestamp()Ljava/lang/Long;
    .locals 1

    .prologue
    .line 44
    iget-object v0, p0, Lcom/getjar/sdk/data/CacheEntry;->_createTimestamp:Ljava/lang/Long;

    return-object v0
.end method

.method public getEtag()Ljava/lang/String;
    .locals 1

    .prologue
    .line 41
    iget-object v0, p0, Lcom/getjar/sdk/data/CacheEntry;->_etag:Ljava/lang/String;

    return-object v0
.end method

.method protected getId()I
    .locals 1

    .prologue
    .line 26
    iget v0, p0, Lcom/getjar/sdk/data/CacheEntry;->_id:I

    return v0
.end method

.method public getLastUpdated()Ljava/lang/Long;
    .locals 1

    .prologue
    .line 47
    iget-object v0, p0, Lcom/getjar/sdk/data/CacheEntry;->_lastUpdated:Ljava/lang/Long;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/getjar/sdk/data/CacheEntry;->_name:Ljava/lang/String;

    return-object v0
.end method

.method public getTtl()Ljava/lang/Long;
    .locals 1

    .prologue
    .line 35
    iget-object v0, p0, Lcom/getjar/sdk/data/CacheEntry;->_ttl:Ljava/lang/Long;

    return-object v0
.end method

.method public getUri()Ljava/net/URI;
    .locals 1

    .prologue
    .line 38
    iget-object v0, p0, Lcom/getjar/sdk/data/CacheEntry;->_uri:Ljava/net/URI;

    return-object v0
.end method

.method public getValue()Ljava/lang/String;
    .locals 1

    .prologue
    .line 32
    iget-object v0, p0, Lcom/getjar/sdk/data/CacheEntry;->_value:Ljava/lang/String;

    return-object v0
.end method

.method public hasTtlExpired()Z
    .locals 8

    .prologue
    .line 102
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 103
    .local v0, "now":J
    invoke-virtual {p0}, Lcom/getjar/sdk/data/CacheEntry;->getLastUpdated()Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    invoke-virtual {p0}, Lcom/getjar/sdk/data/CacheEntry;->getTtl()Ljava/lang/Long;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    add-long v2, v4, v6

    .line 104
    .local v2, "ttlExpiration":J
    cmp-long v4, v2, v0

    if-gez v4, :cond_0

    const/4 v4, 0x1

    :goto_0
    return v4

    :cond_0
    const/4 v4, 0x0

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .prologue
    .line 110
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "%1$s = %2$s [lastUpdated:%3$d ttl:%4$d etag:%5$s uri:%6$s]"

    const/4 v2, 0x6

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/getjar/sdk/data/CacheEntry;->_name:Ljava/lang/String;

    aput-object v4, v2, v3

    const/4 v3, 0x1

    iget-object v4, p0, Lcom/getjar/sdk/data/CacheEntry;->_value:Ljava/lang/String;

    aput-object v4, v2, v3

    const/4 v3, 0x2

    iget-object v4, p0, Lcom/getjar/sdk/data/CacheEntry;->_lastUpdated:Ljava/lang/Long;

    aput-object v4, v2, v3

    const/4 v3, 0x3

    iget-object v4, p0, Lcom/getjar/sdk/data/CacheEntry;->_ttl:Ljava/lang/Long;

    aput-object v4, v2, v3

    const/4 v3, 0x4

    iget-object v4, p0, Lcom/getjar/sdk/data/CacheEntry;->_etag:Ljava/lang/String;

    aput-object v4, v2, v3

    const/4 v3, 0x5

    iget-object v4, p0, Lcom/getjar/sdk/data/CacheEntry;->_uri:Ljava/net/URI;

    aput-object v4, v2, v3

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
