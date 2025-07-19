.class public Lcom/getjar/sdk/comm/auth/ClaimsManager;
.super Ljava/lang/Object;
.source "ClaimsManager.java"


# static fields
.field public static final KeyClaimsUserAccessID:Ljava/lang/String; = "claims.user.user_access_id"

.field public static final KeyClaimsUserDeviceID:Ljava/lang/String; = "claims.user.device.id"

.field private static final _BillingPermission:Ljava/lang/String; = "com.android.vending.BILLING"

.field private static volatile _Instance:Lcom/getjar/sdk/comm/auth/ClaimsManager;


# instance fields
.field private final _context:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 25
    const/4 v0, 0x0

    sput-object v0, Lcom/getjar/sdk/comm/auth/ClaimsManager;->_Instance:Lcom/getjar/sdk/comm/auth/ClaimsManager;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'context\' can not be NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 23
    :cond_0
    iput-object p1, p0, Lcom/getjar/sdk/comm/auth/ClaimsManager;->_context:Landroid/content/Context;

    .line 24
    return-void
.end method

.method private checkBooleanClaim(Ljava/util/Map;Ljava/lang/String;)Z
    .locals 13
    .param p2, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")Z"
        }
    .end annotation

    .prologue
    .local p1, "claims":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v12, 0x1

    const/4 v5, 0x0

    .line 270
    if-nez p1, :cond_0

    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "\'claims\' cannot be NULL"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 271
    :cond_0
    invoke-static {p2}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "\'key\' cannot be NULL or empty"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 275
    :cond_1
    :try_start_0
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 276
    .local v0, "cap":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {p2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 277
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-static {v4}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v3

    .line 278
    .local v3, "result":Z
    sget-object v4, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v8, "Auth: ClaimsManager: checkBooleanClaim() returning %1$s for %2$s"

    const/4 v9, 0x2

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v11

    aput-object v11, v9, v10

    const/4 v10, 0x1

    aput-object p2, v9, v10

    invoke-static {v4, v8, v9}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v6, v7, v4}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 286
    .end local v0    # "cap":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v3    # "result":Z
    :goto_0
    return v3

    .line 282
    :catch_0
    move-exception v1

    .line 283
    .local v1, "e":Ljava/lang/Exception;
    sget-object v4, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    const-string v4, "Auth: ClaimsManager: checkBooleanClaim() failed"

    invoke-static {v6, v7, v4, v1}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 285
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_3
    sget-object v4, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v8, "Auth: ClaimsManager: checkBooleanClaim() returning false for %1$s"

    new-array v9, v12, [Ljava/lang/Object;

    aput-object p2, v9, v5

    invoke-static {v4, v8, v9}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v6, v7, v4}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    move v3, v5

    .line 286
    goto :goto_0
.end method

.method protected static getInstance()Lcom/getjar/sdk/comm/auth/ClaimsManager;
    .locals 2

    .prologue
    .line 38
    sget-object v0, Lcom/getjar/sdk/comm/auth/ClaimsManager;->_Instance:Lcom/getjar/sdk/comm/auth/ClaimsManager;

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "ClaimsManager.initialize() must be called first"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 39
    :cond_0
    sget-object v0, Lcom/getjar/sdk/comm/auth/ClaimsManager;->_Instance:Lcom/getjar/sdk/comm/auth/ClaimsManager;

    return-object v0
.end method

.method protected static declared-synchronized initialize(Landroid/content/Context;)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 31
    const-class v1, Lcom/getjar/sdk/comm/auth/ClaimsManager;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/getjar/sdk/comm/auth/ClaimsManager;->_Instance:Lcom/getjar/sdk/comm/auth/ClaimsManager;

    if-nez v0, :cond_0

    new-instance v0, Lcom/getjar/sdk/comm/auth/ClaimsManager;

    invoke-direct {v0, p0}, Lcom/getjar/sdk/comm/auth/ClaimsManager;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/getjar/sdk/comm/auth/ClaimsManager;->_Instance:Lcom/getjar/sdk/comm/auth/ClaimsManager;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 32
    :cond_0
    monitor-exit v1

    return-void

    .line 31
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method public canBuy()Z
    .locals 9

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 81
    iget-object v5, p0, Lcom/getjar/sdk/comm/auth/ClaimsManager;->_context:Landroid/content/Context;

    const-string v6, "com.android.vending.BILLING"

    invoke-static {v5, v6}, Lcom/getjar/sdk/utilities/RewardUtility;->checkPermission(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 82
    sget-object v4, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    sget-object v6, Lcom/getjar/sdk/logging/Area;->BUY_GOLD:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    or-long/2addr v4, v6

    const-string v6, "Auth: ClaimsManager: canBuy() returning FALSE"

    invoke-static {v4, v5, v6}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    .line 114
    :goto_0
    return v3

    .line 87
    :cond_0
    invoke-virtual {p0}, Lcom/getjar/sdk/comm/auth/ClaimsManager;->getCapabilities()Ljava/util/Map;

    move-result-object v0

    .line 88
    .local v0, "caps":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v5, "user.currency.buy"

    invoke-direct {p0, v0, v5}, Lcom/getjar/sdk/comm/auth/ClaimsManager;->checkBooleanClaim(Ljava/util/Map;Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_1

    .line 89
    sget-object v4, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    sget-object v6, Lcom/getjar/sdk/logging/Area;->BUY_GOLD:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    or-long/2addr v4, v6

    const-string v6, "Auth: ClaimsManager: canBuy() returning FALSE"

    invoke-static {v4, v5, v6}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    goto :goto_0

    .line 94
    :cond_1
    const-string v5, "app.currency.buy"

    invoke-direct {p0, v0, v5}, Lcom/getjar/sdk/comm/auth/ClaimsManager;->checkBooleanClaim(Ljava/util/Map;Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_2

    .line 95
    sget-object v4, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    sget-object v6, Lcom/getjar/sdk/logging/Area;->BUY_GOLD:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    or-long/2addr v4, v6

    const-string v6, "Auth: ClaimsManager: canBuy() returning FALSE"

    invoke-static {v4, v5, v6}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    goto :goto_0

    .line 98
    :cond_2
    const-string v5, "app.currency.buy_as_merchant"

    invoke-direct {p0, v0, v5}, Lcom/getjar/sdk/comm/auth/ClaimsManager;->checkBooleanClaim(Ljava/util/Map;Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_3

    .line 99
    sget-object v4, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    sget-object v6, Lcom/getjar/sdk/logging/Area;->BUY_GOLD:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    or-long/2addr v4, v6

    const-string v6, "Auth: ClaimsManager: canBuy() returning FALSE"

    invoke-static {v4, v5, v6}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    goto :goto_0

    .line 104
    :cond_3
    iget-object v5, p0, Lcom/getjar/sdk/comm/auth/ClaimsManager;->_context:Landroid/content/Context;

    const-string v6, "GetJarClientPrefs"

    invoke-virtual {v5, v6, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 105
    .local v2, "prefs":Landroid/content/SharedPreferences;
    const-string v5, "billing_supported"

    invoke-interface {v2, v5, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    .line 106
    .local v1, "isBillingSupported":Z
    if-nez v1, :cond_4

    .line 107
    sget-object v4, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    sget-object v6, Lcom/getjar/sdk/logging/Area;->BUY_GOLD:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    or-long/2addr v4, v6

    const-string v6, "Auth: ClaimsManager: canBuy() returning FALSE [isBillingSupported]"

    invoke-static {v4, v5, v6}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    goto :goto_0

    .line 113
    :cond_4
    sget-object v3, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    sget-object v3, Lcom/getjar/sdk/logging/Area;->BUY_GOLD:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    or-long/2addr v5, v7

    const-string v3, "Auth: ClaimsManager: canBuy() returning TRUE"

    invoke-static {v5, v6, v3}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    move v3, v4

    .line 114
    goto/16 :goto_0
.end method

.method public canEarn()Z
    .locals 6

    .prologue
    const/4 v1, 0x0

    .line 127
    invoke-virtual {p0}, Lcom/getjar/sdk/comm/auth/ClaimsManager;->getCapabilities()Ljava/util/Map;

    move-result-object v0

    .line 128
    .local v0, "caps":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v2, "user.currency.earn"

    invoke-direct {p0, v0, v2}, Lcom/getjar/sdk/comm/auth/ClaimsManager;->checkBooleanClaim(Ljava/util/Map;Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 129
    sget-object v2, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    const-string v4, "Auth: ClaimsManager: canEarn() returning FALSE"

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    .line 137
    :goto_0
    return v1

    .line 132
    :cond_0
    const-string v2, "app.currency.earn"

    invoke-direct {p0, v0, v2}, Lcom/getjar/sdk/comm/auth/ClaimsManager;->checkBooleanClaim(Ljava/util/Map;Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 133
    sget-object v2, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    const-string v4, "Auth: ClaimsManager: canEarn() returning FALSE"

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    goto :goto_0

    .line 136
    :cond_1
    sget-object v1, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "Auth: ClaimsManager: canEarn() returning TRUE"

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    .line 137
    const/4 v1, 0x1

    goto :goto_0
.end method

.method public canModifyUnmanagedLicenses()Z
    .locals 6

    .prologue
    const/4 v1, 0x0

    .line 228
    invoke-virtual {p0}, Lcom/getjar/sdk/comm/auth/ClaimsManager;->getCapabilities()Ljava/util/Map;

    move-result-object v0

    .line 229
    .local v0, "caps":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v2, "user.product_licenses.modify"

    invoke-direct {p0, v0, v2}, Lcom/getjar/sdk/comm/auth/ClaimsManager;->checkBooleanClaim(Ljava/util/Map;Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 230
    sget-object v2, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Lcom/getjar/sdk/logging/Area;->LICENSING:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    const-string v4, "Auth: ClaimsManager: canModifyUnmanagedLicenses() returning FALSE"

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    .line 238
    :goto_0
    return v1

    .line 233
    :cond_0
    const-string v2, "app.unmanaged_product_licenses.modify"

    invoke-direct {p0, v0, v2}, Lcom/getjar/sdk/comm/auth/ClaimsManager;->checkBooleanClaim(Ljava/util/Map;Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 234
    sget-object v2, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Lcom/getjar/sdk/logging/Area;->LICENSING:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    const-string v4, "Auth: ClaimsManager: canModifyUnmanagedLicenses() returning FALSE"

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    goto :goto_0

    .line 237
    :cond_1
    sget-object v1, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->LICENSING:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "Auth: ClaimsManager: canModifyUnmanagedLicenses() returning TRUE"

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    .line 238
    const/4 v1, 0x1

    goto :goto_0
.end method

.method public canPurchaseManagedProducts()Z
    .locals 8

    .prologue
    const/4 v3, 0x0

    .line 148
    invoke-virtual {p0}, Lcom/getjar/sdk/comm/auth/ClaimsManager;->getCapabilities()Ljava/util/Map;

    move-result-object v0

    .line 150
    .local v0, "caps":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v4, "user.products.purchase"

    invoke-direct {p0, v0, v4}, Lcom/getjar/sdk/comm/auth/ClaimsManager;->checkBooleanClaim(Ljava/util/Map;Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 151
    sget-object v4, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    sget-object v6, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    or-long/2addr v4, v6

    const-string v6, "Auth: ClaimsManager: canPurchaseManagedProducts() returning FALSE"

    invoke-static {v4, v5, v6}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    .line 176
    :goto_0
    return v3

    .line 156
    :cond_0
    const-string v4, "app.managed_products.purchase"

    invoke-direct {p0, v0, v4}, Lcom/getjar/sdk/comm/auth/ClaimsManager;->checkBooleanClaim(Ljava/util/Map;Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 157
    sget-object v4, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    sget-object v6, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    or-long/2addr v4, v6

    const-string v6, "Auth: ClaimsManager: canPurchaseManagedProducts() returning FALSE"

    invoke-static {v4, v5, v6}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    goto :goto_0

    .line 162
    :cond_1
    iget-object v4, p0, Lcom/getjar/sdk/comm/auth/ClaimsManager;->_context:Landroid/content/Context;

    const-string v5, "com.android.vending.BILLING"

    invoke-static {v4, v5}, Lcom/getjar/sdk/utilities/RewardUtility;->checkPermission(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_2

    .line 163
    sget-object v4, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    sget-object v6, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    or-long/2addr v4, v6

    const-string v6, "Auth: ClaimsManager: canPurchaseManagedProducts() returning FALSE"

    invoke-static {v4, v5, v6}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    goto :goto_0

    .line 168
    :cond_2
    iget-object v4, p0, Lcom/getjar/sdk/comm/auth/ClaimsManager;->_context:Landroid/content/Context;

    const-string v5, "GetJarClientPrefs"

    invoke-virtual {v4, v5, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 169
    .local v2, "prefs":Landroid/content/SharedPreferences;
    const-string v4, "billing_api3_supported"

    invoke-interface {v2, v4}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_3

    .line 170
    iget-object v4, p0, Lcom/getjar/sdk/comm/auth/ClaimsManager;->_context:Landroid/content/Context;

    invoke-static {v4}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/rewards/InAppPurchaseManager;

    move-result-object v4

    invoke-virtual {v4}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->isApi3BillingSupported()Z

    move-result v1

    .line 171
    .local v1, "isBillingSupported":Z
    if-nez v1, :cond_3

    .line 172
    sget-object v4, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    sget-object v6, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    or-long/2addr v4, v6

    const-string v6, "Auth: ClaimsManager: canPurchaseManagedProducts() returning FALSE [isBillingSupported]"

    invoke-static {v4, v5, v6}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    goto :goto_0

    .line 176
    .end local v1    # "isBillingSupported":Z
    :cond_3
    const/4 v3, 0x1

    goto :goto_0
.end method

.method public canPurchaseUnmanagedProducts()Z
    .locals 6

    .prologue
    const/4 v1, 0x0

    .line 250
    invoke-virtual {p0}, Lcom/getjar/sdk/comm/auth/ClaimsManager;->getCapabilities()Ljava/util/Map;

    move-result-object v0

    .line 251
    .local v0, "caps":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v2, "app.unmanaged_products.purchase"

    invoke-direct {p0, v0, v2}, Lcom/getjar/sdk/comm/auth/ClaimsManager;->checkBooleanClaim(Ljava/util/Map;Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 252
    sget-object v2, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Lcom/getjar/sdk/logging/Area;->PURCHASE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    const-string v4, "Auth: ClaimsManager: canPurchaseUnmanagedProducts() returning FALSE"

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    .line 260
    :goto_0
    return v1

    .line 255
    :cond_0
    const-string v2, "user.products.purchase"

    invoke-direct {p0, v0, v2}, Lcom/getjar/sdk/comm/auth/ClaimsManager;->checkBooleanClaim(Ljava/util/Map;Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 256
    sget-object v2, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Lcom/getjar/sdk/logging/Area;->PURCHASE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    const-string v4, "Auth: ClaimsManager: canPurchaseUnmanagedProducts() returning FALSE"

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    goto :goto_0

    .line 259
    :cond_1
    sget-object v1, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->PURCHASE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "Auth: ClaimsManager: canPurchaseUnmanagedProducts() returning TRUE"

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    .line 260
    const/4 v1, 0x1

    goto :goto_0
.end method

.method public canUseUnmanagedLicenses()Z
    .locals 6

    .prologue
    const/4 v1, 0x0

    .line 205
    invoke-virtual {p0}, Lcom/getjar/sdk/comm/auth/ClaimsManager;->getCapabilities()Ljava/util/Map;

    move-result-object v0

    .line 206
    .local v0, "caps":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v2, "user.product_licenses.use"

    invoke-direct {p0, v0, v2}, Lcom/getjar/sdk/comm/auth/ClaimsManager;->checkBooleanClaim(Ljava/util/Map;Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 207
    sget-object v2, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Lcom/getjar/sdk/logging/Area;->LICENSING:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    const-string v4, "Auth: ClaimsManager: canUseUnmanagedLicenses() returning FALSE"

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    .line 215
    :goto_0
    return v1

    .line 210
    :cond_0
    const-string v2, "app.unmanaged_product_licenses.use"

    invoke-direct {p0, v0, v2}, Lcom/getjar/sdk/comm/auth/ClaimsManager;->checkBooleanClaim(Ljava/util/Map;Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 211
    sget-object v2, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Lcom/getjar/sdk/logging/Area;->LICENSING:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    const-string v4, "Auth: ClaimsManager: canUseUnmanagedLicenses() returning FALSE"

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    goto :goto_0

    .line 214
    :cond_1
    sget-object v1, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->LICENSING:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "Auth: ClaimsManager: canUseUnmanagedLicenses() returning TRUE"

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    .line 215
    const/4 v1, 0x1

    goto :goto_0
.end method

.method public canViewManagedProducts()Z
    .locals 5

    .prologue
    .line 187
    invoke-virtual {p0}, Lcom/getjar/sdk/comm/auth/ClaimsManager;->getCapabilities()Ljava/util/Map;

    move-result-object v0

    .line 188
    .local v0, "caps":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v1, "app.managed_products.view"

    invoke-direct {p0, v0, v1}, Lcom/getjar/sdk/comm/auth/ClaimsManager;->checkBooleanClaim(Ljava/util/Map;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 189
    sget-object v1, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "Auth: ClaimsManager: canViewManagedProducts() returning FALSE"

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    .line 190
    const/4 v1, 0x0

    .line 192
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x1

    goto :goto_0
.end method

.method public getCapabilities()Ljava/util/Map;
    .locals 1
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
    .line 59
    iget-object v0, p0, Lcom/getjar/sdk/comm/auth/ClaimsManager;->_context:Landroid/content/Context;

    invoke-static {v0}, Lcom/getjar/sdk/comm/auth/AuthManager;->initialize(Landroid/content/Context;)V

    .line 60
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/getjar/sdk/comm/auth/AuthManager;->waitOnAuth()V

    .line 63
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/getjar/sdk/comm/auth/AuthManager;->getCapabilities()Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method
