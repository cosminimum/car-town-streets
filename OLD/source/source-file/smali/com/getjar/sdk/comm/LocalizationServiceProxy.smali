.class public Lcom/getjar/sdk/comm/LocalizationServiceProxy;
.super Lcom/getjar/sdk/comm/ServiceProxyBase;
.source "LocalizationServiceProxy.java"


# static fields
.field private static final _CONTRACT_VERSION:Ljava/lang/String; = "20121130"

.field private static volatile _Instance:Lcom/getjar/sdk/comm/LocalizationServiceProxy;

.field private static final _URL_TEMPLATE_GOLD_BUCKETS:Ljava/lang/String;

.field private static final _URL_TEMPLATE_RECOMMENDED_PRICES:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 29
    const/4 v0, 0x0

    sput-object v0, Lcom/getjar/sdk/comm/LocalizationServiceProxy;->_Instance:Lcom/getjar/sdk/comm/LocalizationServiceProxy;

    .line 50
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "%1$s%2$s"

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "%1$slocalization/platforms/android/gold_offers/?country_code=%2$s&version="

    aput-object v3, v2, v4

    const-string v3, "20121130"

    aput-object v3, v2, v5

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/getjar/sdk/comm/LocalizationServiceProxy;->_URL_TEMPLATE_GOLD_BUCKETS:Ljava/lang/String;

    .line 55
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "%1$s%2$s"

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "%1$slocalization/recommended_prices/generate?version="

    aput-object v3, v2, v4

    const-string v3, "20121130"

    aput-object v3, v2, v5

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/getjar/sdk/comm/LocalizationServiceProxy;->_URL_TEMPLATE_RECOMMENDED_PRICES:Ljava/lang/String;

    .line 59
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Lcom/getjar/sdk/comm/ServiceProxyBase;-><init>()V

    return-void
.end method

.method public static getInstance()Lcom/getjar/sdk/comm/LocalizationServiceProxy;
    .locals 1

    .prologue
    .line 35
    sget-object v0, Lcom/getjar/sdk/comm/LocalizationServiceProxy;->_Instance:Lcom/getjar/sdk/comm/LocalizationServiceProxy;

    if-nez v0, :cond_0

    invoke-static {}, Lcom/getjar/sdk/comm/LocalizationServiceProxy;->makeTheInstance()V

    .line 36
    :cond_0
    sget-object v0, Lcom/getjar/sdk/comm/LocalizationServiceProxy;->_Instance:Lcom/getjar/sdk/comm/LocalizationServiceProxy;

    return-object v0
.end method

.method private getPricingJson(Lcom/getjar/sdk/Pricing;)Lorg/json/JSONObject;
    .locals 5
    .param p1, "pricing"    # Lcom/getjar/sdk/Pricing;

    .prologue
    .line 149
    if-nez p1, :cond_0

    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "\'pricing\' cannot be null"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 151
    :cond_0
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 153
    .local v2, "obj":Lorg/json/JSONObject;
    :try_start_0
    const-string v3, "base_price"

    invoke-virtual {p1}, Lcom/getjar/sdk/Pricing;->getBasePrice()I

    move-result v4

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 155
    invoke-virtual {p1}, Lcom/getjar/sdk/Pricing;->getMaxDiscountPercent()Ljava/lang/Float;

    move-result-object v1

    .line 156
    .local v1, "maxPercent":Ljava/lang/Float;
    if-eqz v1, :cond_1

    .line 158
    const-string v3, "max_discount_percent"

    invoke-virtual {v2, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 161
    :cond_1
    invoke-virtual {p1}, Lcom/getjar/sdk/Pricing;->getMaxMarkupPercent()Ljava/lang/Float;

    move-result-object v1

    .line 162
    if-eqz v1, :cond_2

    .line 164
    const-string v3, "max_mark_up_percent"

    invoke-virtual {v2, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 171
    :cond_2
    return-object v2

    .line 167
    .end local v1    # "maxPercent":Ljava/lang/Float;
    :catch_0
    move-exception v0

    .line 168
    .local v0, "e":Lorg/json/JSONException;
    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v3
.end method

.method private static declared-synchronized makeTheInstance()V
    .locals 2

    .prologue
    .line 31
    const-class v1, Lcom/getjar/sdk/comm/LocalizationServiceProxy;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/getjar/sdk/comm/LocalizationServiceProxy;->_Instance:Lcom/getjar/sdk/comm/LocalizationServiceProxy;

    if-nez v0, :cond_0

    new-instance v0, Lcom/getjar/sdk/comm/LocalizationServiceProxy;

    invoke-direct {v0}, Lcom/getjar/sdk/comm/LocalizationServiceProxy;-><init>()V

    sput-object v0, Lcom/getjar/sdk/comm/LocalizationServiceProxy;->_Instance:Lcom/getjar/sdk/comm/LocalizationServiceProxy;
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
.method public getGoldOffers(Lcom/getjar/sdk/comm/CommContext;)Lcom/getjar/sdk/comm/Operation;
    .locals 13
    .param p1, "commContext"    # Lcom/getjar/sdk/comm/CommContext;

    .prologue
    .line 117
    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The required parameter \'commContext\' was not provided"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 119
    :cond_0
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/getjar/sdk/comm/auth/AuthManager;->initialize(Landroid/content/Context;)V

    .line 120
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/getjar/sdk/comm/auth/AuthManager;->waitOnAuth()V

    .line 123
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget-object v10, v0, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    .line 124
    .local v10, "currentLocale":Ljava/util/Locale;
    invoke-virtual {v10}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v12

    .line 129
    .local v12, "isoCountryCode":Ljava/lang/String;
    :try_start_0
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    sget-object v1, Lcom/getjar/sdk/comm/LocalizationServiceProxy;->_URL_TEMPLATE_GOLD_BUCKETS:Ljava/lang/String;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    const/4 v5, 0x1

    invoke-static {p1, v5}, Lcom/getjar/sdk/comm/GetJarConfig;->getInstance(Lcom/getjar/sdk/comm/CommContext;Z)Lcom/getjar/sdk/comm/GetJarConfig;

    move-result-object v5

    const-string v6, "service.localization_service.endpoint"

    invoke-virtual {v5, v6}, Lcom/getjar/sdk/comm/GetJarConfig;->getDirectiveValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v2, v3

    const/4 v3, 0x1

    const-string v5, "UTF-8"

    invoke-static {v12, v5}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v2, v3

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 134
    .local v4, "url":Ljava/lang/String;
    const-string v1, "getGoldOffers"

    sget-object v2, Lcom/getjar/sdk/comm/Operation$Priority;->MEDIUM:Lcom/getjar/sdk/comm/Operation$Priority;

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x1

    const/4 v8, 0x0

    const/4 v9, 0x1

    move-object v0, p0

    move-object v3, p1

    invoke-virtual/range {v0 .. v9}, Lcom/getjar/sdk/comm/LocalizationServiceProxy;->makeAsyncGETRequestForJson(Ljava/lang/String;Lcom/getjar/sdk/comm/Operation$Priority;Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Ljava/util/Map;Lcom/getjar/sdk/comm/CallbackInterface;ZZZ)Lcom/getjar/sdk/comm/Operation;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    return-object v0

    .line 136
    .end local v4    # "url":Ljava/lang/String;
    :catch_0
    move-exception v11

    .line 139
    .local v11, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v0, Lcom/getjar/sdk/exceptions/ConfigurationException;

    invoke-direct {v0, v11}, Lcom/getjar/sdk/exceptions/ConfigurationException;-><init>(Ljava/lang/Throwable;)V

    throw v0
.end method

.method public getRecommendedPrices(Lcom/getjar/sdk/comm/CommContext;Ljava/util/Collection;)Lcom/getjar/sdk/comm/Operation;
    .locals 16
    .param p1, "commContext"    # Lcom/getjar/sdk/comm/CommContext;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/getjar/sdk/comm/CommContext;",
            "Ljava/util/Collection",
            "<",
            "Lcom/getjar/sdk/Pricing;",
            ">;)",
            "Lcom/getjar/sdk/comm/Operation;"
        }
    .end annotation

    .prologue
    .line 76
    .local p2, "prices":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/getjar/sdk/Pricing;>;"
    if-nez p1, :cond_0

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "The required parameter \'commContext\' was not provided"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 77
    :cond_0
    if-eqz p2, :cond_1

    invoke-interface/range {p2 .. p2}, Ljava/util/Collection;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_2

    :cond_1
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "The required parameter \'prices\' was not provided"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 79
    :cond_2
    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/getjar/sdk/comm/auth/AuthManager;->initialize(Landroid/content/Context;)V

    .line 80
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/getjar/sdk/comm/auth/AuthManager;->waitOnAuth()V

    .line 84
    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    sget-object v2, Lcom/getjar/sdk/comm/LocalizationServiceProxy;->_URL_TEMPLATE_RECOMMENDED_PRICES:Ljava/lang/String;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    const/4 v7, 0x1

    move-object/from16 v0, p1

    invoke-static {v0, v7}, Lcom/getjar/sdk/comm/GetJarConfig;->getInstance(Lcom/getjar/sdk/comm/CommContext;Z)Lcom/getjar/sdk/comm/GetJarConfig;

    move-result-object v7

    const-string v8, "service.localization_service.endpoint"

    invoke-virtual {v7, v8}, Lcom/getjar/sdk/comm/GetJarConfig;->getDirectiveValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v3, v4

    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    .line 88
    .local v5, "url":Ljava/lang/String;
    new-instance v13, Ljava/util/HashMap;

    invoke-interface/range {p2 .. p2}, Ljava/util/Collection;->size()I

    move-result v1

    invoke-direct {v13, v1}, Ljava/util/HashMap;-><init>(I)V

    .line 89
    .local v13, "hashMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lorg/json/JSONObject;>;"
    invoke-interface/range {p2 .. p2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v14

    .local v14, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lcom/getjar/sdk/Pricing;

    .line 91
    .local v15, "price":Lcom/getjar/sdk/Pricing;
    invoke-virtual {v15}, Lcom/getjar/sdk/Pricing;->hashCode()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    move-object/from16 v0, p0

    invoke-direct {v0, v15}, Lcom/getjar/sdk/comm/LocalizationServiceProxy;->getPricingJson(Lcom/getjar/sdk/Pricing;)Lorg/json/JSONObject;

    move-result-object v2

    invoke-virtual {v13, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 94
    .end local v15    # "price":Lcom/getjar/sdk/Pricing;
    :cond_3
    sget-object v1, Lcom/getjar/sdk/logging/Area;->LOCALIZATION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "LocalizationServiceProxy getRecommendedPrices size:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v13}, Ljava/util/HashMap;->size()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 96
    new-instance v6, Ljava/util/HashMap;

    const/4 v1, 0x1

    invoke-direct {v6, v1}, Ljava/util/HashMap;-><init>(I)V

    .line 98
    .local v6, "postData":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :try_start_0
    const-string v1, "pricings"

    invoke-static {v13}, Lcom/getjar/sdk/utilities/Utility;->jsonObjectMapToJsonString(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v6, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 103
    const-string v2, "getRecommendedPrices"

    sget-object v3, Lcom/getjar/sdk/comm/Operation$Priority;->MEDIUM:Lcom/getjar/sdk/comm/Operation$Priority;

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x1

    const/4 v10, 0x1

    const/4 v11, 0x1

    move-object/from16 v1, p0

    move-object/from16 v4, p1

    invoke-virtual/range {v1 .. v11}, Lcom/getjar/sdk/comm/LocalizationServiceProxy;->makeAsyncPOSTRequestForJson(Ljava/lang/String;Lcom/getjar/sdk/comm/Operation$Priority;Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;Lcom/getjar/sdk/comm/CallbackInterface;ZZZ)Lcom/getjar/sdk/comm/Operation;

    move-result-object v1

    return-object v1

    .line 99
    :catch_0
    move-exception v12

    .line 100
    .local v12, "e":Lorg/json/JSONException;
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1, v12}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method protected getServiceName()Lcom/getjar/sdk/comm/Request$ServiceName;
    .locals 1

    .prologue
    .line 62
    sget-object v0, Lcom/getjar/sdk/comm/Request$ServiceName;->LOCALIZATION:Lcom/getjar/sdk/comm/Request$ServiceName;

    return-object v0
.end method
