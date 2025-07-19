.class public Lcom/getjar/sdk/rewards/InAppPurchaseManager;
.super Ljava/lang/Object;
.source "InAppPurchaseManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/getjar/sdk/rewards/InAppPurchaseManager$GooglePlayServiceConnection;,
        Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;,
        Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;
    }
.end annotation


# static fields
.field private static final GOOGLE_ORPHANED_PURCHASE_DELAY:I = 0x5265c00

.field private static final RESPONSE_CODE:Ljava/lang/String; = "RESPONSE_CODE"

.field private static final _BuyingGoldLRUCap:I = 0x1f4

.field private static final _CacheNamespace:Ljava/lang/String; = "buyingGoldGoogleResponse"

.field private static final _IABIntentFilter:Ljava/lang/String; = "com.android.vending.billing.InAppBillingService.BIND"

.field private static volatile _Instance:Lcom/getjar/sdk/rewards/InAppPurchaseManager;


# instance fields
.field private _applicationContext:Landroid/content/Context;

.field private _billingService:Lcom/getjar/sdk/rewards/GetJarService;

.field private _cachingManager:Lcom/getjar/sdk/data/CachingManager;

.field private _commContext:Lcom/getjar/sdk/comm/CommContext;

.field private _currentClientTransactionId:Ljava/lang/String;

.field private final _googlePlayBindLock:Ljava/lang/Object;

.field private _isBillingSupported:Z

.field private final _processOutstandingPurchasesLock:Ljava/lang/Object;

.field private volatile googlePlayService:Lcom/getjar/sdk/vending/billing/IInAppBillingService;

.field private googlePlayServiceConnection:Lcom/getjar/sdk/rewards/InAppPurchaseManager$GooglePlayServiceConnection;

.field private volatile isGooglePlayConnected:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 76
    const/4 v0, 0x0

    sput-object v0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_Instance:Lcom/getjar/sdk/rewards/InAppPurchaseManager;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 3
    .param p1, "applicationContext"    # Landroid/content/Context;

    .prologue
    const/4 v2, 0x0

    .line 98
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 80
    iput-boolean v2, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_isBillingSupported:Z

    .line 83
    new-instance v0, Lcom/getjar/sdk/rewards/InAppPurchaseManager$GooglePlayServiceConnection;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/getjar/sdk/rewards/InAppPurchaseManager$GooglePlayServiceConnection;-><init>(Lcom/getjar/sdk/rewards/InAppPurchaseManager;Lcom/getjar/sdk/rewards/InAppPurchaseManager$1;)V

    iput-object v0, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->googlePlayServiceConnection:Lcom/getjar/sdk/rewards/InAppPurchaseManager$GooglePlayServiceConnection;

    .line 85
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_googlePlayBindLock:Ljava/lang/Object;

    .line 86
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_processOutstandingPurchasesLock:Ljava/lang/Object;

    .line 87
    iput-boolean v2, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->isGooglePlayConnected:Z

    .line 99
    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'applicationContext\' cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 101
    :cond_0
    iput-object p1, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_applicationContext:Landroid/content/Context;

    .line 102
    return-void
.end method

.method private constructor <init>(Lcom/getjar/sdk/comm/CommContext;)V
    .locals 2
    .param p1, "commContext"    # Lcom/getjar/sdk/comm/CommContext;

    .prologue
    .line 93
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;-><init>(Landroid/content/Context;)V

    .line 94
    iput-object p1, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    .line 95
    new-instance v0, Lcom/getjar/sdk/data/CachingManager;

    const-string v1, "buyingGoldGoogleResponse"

    invoke-direct {v0, p1, v1}, Lcom/getjar/sdk/data/CachingManager;-><init>(Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_cachingManager:Lcom/getjar/sdk/data/CachingManager;

    .line 96
    return-void
.end method

.method static synthetic access$102(Lcom/getjar/sdk/rewards/InAppPurchaseManager;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/getjar/sdk/rewards/InAppPurchaseManager;
    .param p1, "x1"    # Z

    .prologue
    .line 68
    iput-boolean p1, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->isGooglePlayConnected:Z

    return p1
.end method

.method static synthetic access$200(Lcom/getjar/sdk/rewards/InAppPurchaseManager;)Ljava/lang/Object;
    .locals 1
    .param p0, "x0"    # Lcom/getjar/sdk/rewards/InAppPurchaseManager;

    .prologue
    .line 68
    iget-object v0, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_googlePlayBindLock:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$302(Lcom/getjar/sdk/rewards/InAppPurchaseManager;Lcom/getjar/sdk/vending/billing/IInAppBillingService;)Lcom/getjar/sdk/vending/billing/IInAppBillingService;
    .locals 0
    .param p0, "x0"    # Lcom/getjar/sdk/rewards/InAppPurchaseManager;
    .param p1, "x1"    # Lcom/getjar/sdk/vending/billing/IInAppBillingService;

    .prologue
    .line 68
    iput-object p1, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->googlePlayService:Lcom/getjar/sdk/vending/billing/IInAppBillingService;

    return-object p1
.end method

.method protected static getBasicInstance(Landroid/content/Context;)Lcom/getjar/sdk/rewards/InAppPurchaseManager;
    .locals 1
    .param p0, "applicationContext"    # Landroid/content/Context;

    .prologue
    .line 176
    new-instance v0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;

    invoke-direct {v0, p0}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;-><init>(Landroid/content/Context;)V

    return-object v0
.end method

.method private static getCommContextInternal(Landroid/content/Context;)Lcom/getjar/sdk/comm/CommContext;
    .locals 4
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 125
    invoke-static {p0}, Lcom/getjar/sdk/comm/auth/ApplicationKeyDatabase;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/comm/auth/ApplicationKeyDatabase;

    move-result-object v2

    invoke-virtual {v2}, Lcom/getjar/sdk/comm/auth/ApplicationKeyDatabase;->getApplicationKey()Ljava/lang/String;

    move-result-object v0

    .line 126
    .local v0, "applicationKey":Ljava/lang/String;
    invoke-static {v0}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "Unable to access the application key"

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 133
    :cond_0
    new-instance v2, Lcom/getjar/sdk/rewards/InAppPurchaseManager$1;

    const/4 v3, 0x0

    invoke-direct {v2, v3}, Lcom/getjar/sdk/rewards/InAppPurchaseManager$1;-><init>(Landroid/os/Handler;)V

    sget-object v3, Lcom/getjar/sdk/comm/CommManager$LaunchWork;->NONE:Lcom/getjar/sdk/comm/CommManager$LaunchWork;

    invoke-static {v0, p0, v2, v3}, Lcom/getjar/sdk/comm/CommManager;->createContext(Ljava/lang/String;Landroid/content/Context;Landroid/os/ResultReceiver;Lcom/getjar/sdk/comm/CommManager$LaunchWork;)Lcom/getjar/sdk/comm/CommContext;

    move-result-object v1

    .line 147
    .local v1, "commContext":Lcom/getjar/sdk/comm/CommContext;
    invoke-static {p0}, Lcom/getjar/sdk/comm/auth/AuthManager;->initialize(Landroid/content/Context;)V

    .line 148
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/getjar/sdk/comm/auth/AuthManager;->waitOnAuth()V

    .line 150
    return-object v1
.end method

.method public static getGoldBucketDetails(Ljava/lang/String;Landroid/content/Context;)Ljava/util/HashMap;
    .locals 9
    .param p0, "platformItemId"    # Ljava/lang/String;
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 289
    invoke-static {p0}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "\'platformItemId\' cannot be null or empty"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 290
    :cond_0
    if-nez p1, :cond_1

    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "\'context\' cannot be null"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 292
    :cond_1
    new-instance v1, Ljava/util/HashMap;

    const/4 v5, 0x3

    invoke-direct {v1, v5}, Ljava/util/HashMap;-><init>(I)V

    .line 294
    .local v1, "detailsMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :try_start_0
    new-instance v5, Lorg/json/JSONObject;

    invoke-static {p1}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/rewards/InAppPurchaseManager;

    move-result-object v6

    invoke-virtual {v6}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->getGoldOffers()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v6, "results"

    invoke-virtual {v5, v6}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    .line 295
    .local v0, "arr":Lorg/json/JSONArray;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v5

    if-ge v3, v5, :cond_2

    .line 297
    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    .line 298
    .local v4, "obj":Lorg/json/JSONObject;
    sget-object v5, Lcom/getjar/sdk/logging/Area;->BUY_GOLD:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "GooglePurchaseResponse getResponseAsMap "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v4}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v6, v7}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 299
    const-string v5, "platform_item_id"

    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 301
    const-string v5, "order.price"

    const-string v6, "pricing_amount"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 302
    const-string v5, "order.currency"

    const-string v6, "currency"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 303
    const-string v5, "order.gold_value"

    const-string v6, "gold_amount"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 310
    .end local v0    # "arr":Lorg/json/JSONArray;
    .end local v3    # "i":I
    .end local v4    # "obj":Lorg/json/JSONObject;
    :cond_2
    :goto_1
    return-object v1

    .line 295
    .restart local v0    # "arr":Lorg/json/JSONArray;
    .restart local v3    # "i":I
    .restart local v4    # "obj":Lorg/json/JSONObject;
    :cond_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 307
    .end local v0    # "arr":Lorg/json/JSONArray;
    .end local v3    # "i":I
    .end local v4    # "obj":Lorg/json/JSONObject;
    :catch_0
    move-exception v2

    .line 308
    .local v2, "e":Lorg/json/JSONException;
    sget-object v5, Lcom/getjar/sdk/logging/Area;->BUY_GOLD:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    const-string v7, "GooglePurchaseReponse getResponseAsMap"

    invoke-static {v5, v6, v7, v2}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1
.end method

.method public static getInstance(Landroid/content/Context;)Lcom/getjar/sdk/rewards/InAppPurchaseManager;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 160
    if-nez p0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "context cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 162
    :cond_0
    sget-object v0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_Instance:Lcom/getjar/sdk/rewards/InAppPurchaseManager;

    if-nez v0, :cond_1

    .line 164
    invoke-static {p0}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->getCommContextInternal(Landroid/content/Context;)Lcom/getjar/sdk/comm/CommContext;

    move-result-object v0

    invoke-static {v0}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->makeTheInstance(Lcom/getjar/sdk/comm/CommContext;)V

    .line 166
    :cond_1
    sget-object v0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_Instance:Lcom/getjar/sdk/rewards/InAppPurchaseManager;

    return-object v0
.end method

.method private getJSONArrayFromPriceMap(Ljava/util/HashMap;)Lorg/json/JSONArray;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lorg/json/JSONArray;"
        }
    .end annotation

    .prologue
    .line 1022
    .local p1, "prices":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    if-nez p1, :cond_0

    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "\'prices\' cannot be null"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 1024
    :cond_0
    new-instance v3, Lorg/json/JSONArray;

    invoke-direct {v3}, Lorg/json/JSONArray;-><init>()V

    .line 1025
    .local v3, "localizedPrices":Lorg/json/JSONArray;
    invoke-virtual {p1}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 1026
    .local v1, "entries":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;>;"
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 1027
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 1029
    .local v2, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :try_start_0
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    .line 1030
    .local v4, "obj":Lorg/json/JSONObject;
    const-string v5, "marketplace"

    const-string v6, "marketplace.google_play"

    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1031
    const-string v5, "marketplace_product_id"

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1032
    const-string v5, "display_amount"

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1033
    invoke-virtual {v3, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1034
    .end local v4    # "obj":Lorg/json/JSONObject;
    :catch_0
    move-exception v0

    .line 1035
    .local v0, "e":Lorg/json/JSONException;
    sget-object v5, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    sget-object v7, Lcom/getjar/sdk/logging/Area;->LOCALIZATION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    or-long/2addr v5, v7

    const-string v7, "Invalid JSON"

    invoke-static {v5, v6, v7, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 1038
    .end local v0    # "e":Lorg/json/JSONException;
    .end local v2    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_1
    return-object v3
.end method

.method private static declared-synchronized makeTheInstance(Lcom/getjar/sdk/comm/CommContext;)V
    .locals 2
    .param p0, "commContext"    # Lcom/getjar/sdk/comm/CommContext;

    .prologue
    .line 110
    const-class v1, Lcom/getjar/sdk/rewards/InAppPurchaseManager;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_Instance:Lcom/getjar/sdk/rewards/InAppPurchaseManager;

    if-nez v0, :cond_0

    .line 111
    new-instance v0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;

    invoke-direct {v0, p0}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;-><init>(Lcom/getjar/sdk/comm/CommContext;)V

    sput-object v0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_Instance:Lcom/getjar/sdk/rewards/InAppPurchaseManager;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 113
    :cond_0
    monitor-exit v1

    return-void

    .line 110
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method public buyGoldOffer(Ljava/lang/String;Ljava/util/HashMap;Landroid/app/Activity;)V
    .locals 4
    .param p1, "platformItemId"    # Ljava/lang/String;
    .param p3, "activity"    # Landroid/app/Activity;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Landroid/app/Activity;",
            ")V"
        }
    .end annotation

    .prologue
    .local p2, "trackingMetadataMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v3, 0x0

    .line 197
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "platformItemId cannot be null or empty"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 198
    :cond_0
    if-nez p2, :cond_1

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "trackingMetadataMap cannot be null or empty"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 199
    :cond_1
    if-nez p3, :cond_2

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "activity cannot be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 201
    :cond_2
    iget-boolean v1, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_isBillingSupported:Z

    if-nez v1, :cond_4

    .line 203
    iget-object v1, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v1}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "GetJarClientPrefs"

    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 204
    .local v0, "prefs":Landroid/content/SharedPreferences;
    const-string v1, "billing_supported"

    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_isBillingSupported:Z

    .line 206
    iget-boolean v1, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_isBillingSupported:Z

    if-nez v1, :cond_4

    .line 208
    sget-object v1, Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;->BILLING_NOT_SUPPORTED:Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;

    invoke-virtual {p0, p1, v1, p3}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->handleFailure(Ljava/lang/String;Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;Landroid/content/Context;)V

    .line 227
    .end local v0    # "prefs":Landroid/content/SharedPreferences;
    :cond_3
    :goto_0
    return-void

    .line 213
    :cond_4
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v1

    iget-object v2, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v2}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/getjar/sdk/comm/auth/AuthManager;->getClaimsManager(Landroid/content/Context;)Lcom/getjar/sdk/comm/auth/ClaimsManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/getjar/sdk/comm/auth/ClaimsManager;->canBuy()Z

    move-result v1

    if-eqz v1, :cond_5

    .line 215
    new-instance v1, Lcom/getjar/sdk/rewards/GetJarService;

    invoke-direct {v1}, Lcom/getjar/sdk/rewards/GetJarService;-><init>()V

    iput-object v1, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_billingService:Lcom/getjar/sdk/rewards/GetJarService;

    .line 216
    iget-object v1, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_billingService:Lcom/getjar/sdk/rewards/GetJarService;

    iget-object v2, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v2}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/getjar/sdk/rewards/GetJarService;->setContext(Landroid/content/Context;)V

    .line 218
    iget-object v1, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_billingService:Lcom/getjar/sdk/rewards/GetJarService;

    invoke-virtual {v1, p1}, Lcom/getjar/sdk/rewards/GetJarService;->requestPurchase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_3

    .line 220
    sget-object v1, Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;->GOOGLE_PLAY_BIND_FAILURE:Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;

    invoke-virtual {p0, p1, v1, p3}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->handleFailure(Ljava/lang/String;Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;Landroid/content/Context;)V

    goto :goto_0

    .line 225
    :cond_5
    sget-object v1, Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;->UNAUTHORIZED:Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;

    invoke-virtual {p0, p1, v1, p3}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->handleFailure(Ljava/lang/String;Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;Landroid/content/Context;)V

    goto :goto_0
.end method

.method public cancelOrphanedManagedOffers()V
    .locals 24

    .prologue
    .line 737
    sget-object v17, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v17 .. v17}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v17

    sget-object v19, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v19 .. v19}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v19

    or-long v17, v17, v19

    const-string v19, "InAppPurchaseManager cancelOrphanedManagedOffers started"

    invoke-static/range {v17 .. v19}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 738
    invoke-virtual/range {p0 .. p0}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->ensureBoundToGooglePlaySvc()Z

    .line 740
    invoke-virtual/range {p0 .. p0}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->getCurrentClientTransactionId()Ljava/lang/String;

    move-result-object v4

    .line 742
    .local v4, "currentClientTransactionId":Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->isGooglePlayConnected()Z

    move-result v17

    if-eqz v17, :cond_2

    .line 743
    sget-object v17, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v17 .. v17}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v17

    sget-object v19, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v19 .. v19}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v19

    or-long v17, v17, v19

    const-string v19, "InAppPurchaseManager cancelOrphanedManagedOffers connectedToGooglePlay"

    invoke-static/range {v17 .. v19}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 744
    const/4 v3, 0x0

    .line 745
    .local v3, "continuationToken":Ljava/lang/String;
    new-instance v7, Ljava/util/HashSet;

    invoke-direct {v7}, Ljava/util/HashSet;-><init>()V

    .line 750
    .local v7, "googlePendingClientTransactionIds":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    :cond_0
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->googlePlayService:Lcom/getjar/sdk/vending/billing/IInAppBillingService;

    move-object/from16 v17, v0

    const/16 v18, 0x3

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v19

    const-string v20, "inapp"

    const/16 v21, 0x0

    invoke-interface/range {v17 .. v21}, Lcom/getjar/sdk/vending/billing/IInAppBillingService;->getPurchases(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v11

    .line 751
    .local v11, "ownedItems":Landroid/os/Bundle;
    const-string v17, "RESPONSE_CODE"

    move-object/from16 v0, v17

    invoke-virtual {v11, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v14

    .line 752
    .local v14, "response":I
    const-string v17, "RESPONSE_CODE"

    move-object/from16 v0, v17

    invoke-virtual {v11, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v17

    if-eqz v17, :cond_2

    invoke-static {v14}, Lcom/getjar/sdk/utilities/Constants$ResponseCode;->valueOf(I)Lcom/getjar/sdk/utilities/Constants$ResponseCode;

    move-result-object v17

    sget-object v18, Lcom/getjar/sdk/utilities/Constants$ResponseCode;->RESULT_OK:Lcom/getjar/sdk/utilities/Constants$ResponseCode;

    invoke-virtual/range {v17 .. v18}, Lcom/getjar/sdk/utilities/Constants$ResponseCode;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_2

    .line 753
    const-string v17, "INAPP_PURCHASE_DATA_LIST"

    move-object/from16 v0, v17

    invoke-virtual {v11, v0}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v13

    .line 754
    .local v13, "purchaseDataList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    sget-object v17, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v17 .. v17}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v17

    sget-object v19, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v19 .. v19}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v19

    or-long v17, v17, v19

    sget-object v19, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v20, "InAppPurchaseManager cancelOrphanedManagedOffers Got %1$d items"

    const/16 v21, 0x1

    move/from16 v0, v21

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    invoke-virtual {v13}, Ljava/util/ArrayList;->size()I

    move-result v23

    invoke-static/range {v23 .. v23}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v23

    aput-object v23, v21, v22

    invoke-static/range {v19 .. v21}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v17 .. v19}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 756
    const-string v17, "INAPP_CONTINUATION_TOKEN"

    move-object/from16 v0, v17

    invoke-virtual {v11, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 757
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_0
    invoke-virtual {v13}, Ljava/util/ArrayList;->size()I

    move-result v17

    move/from16 v0, v17

    if-ge v8, v0, :cond_3

    .line 758
    invoke-virtual {v13, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    .line 759
    .local v12, "purchaseData":Ljava/lang/String;
    invoke-static {v12}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v17

    if-nez v17, :cond_1

    .line 760
    new-instance v17, Lorg/json/JSONObject;

    move-object/from16 v0, v17

    invoke-direct {v0, v12}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v18, "developerPayload"

    invoke-virtual/range {v17 .. v18}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 761
    .local v5, "developerPayload":Ljava/lang/String;
    const-string v17, ","

    move-object/from16 v0, v17

    invoke-virtual {v5, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v17

    const/16 v18, 0x0

    aget-object v17, v17, v18

    move-object/from16 v0, v17

    invoke-virtual {v7, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1

    .line 757
    .end local v5    # "developerPayload":Ljava/lang/String;
    :cond_1
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 771
    .end local v8    # "i":I
    .end local v11    # "ownedItems":Landroid/os/Bundle;
    .end local v12    # "purchaseData":Ljava/lang/String;
    .end local v13    # "purchaseDataList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v14    # "response":I
    :catch_0
    move-exception v6

    .line 772
    .local v6, "e":Landroid/os/RemoteException;
    const/16 v17, 0x0

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->isGooglePlayConnected:Z

    .line 773
    sget-object v17, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v17 .. v17}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v17

    sget-object v19, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v19 .. v19}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v19

    or-long v17, v17, v19

    const-string v19, "Error canceling orphaned managed offers"

    move-wide/from16 v0, v17

    move-object/from16 v2, v19

    invoke-static {v0, v1, v2, v6}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 809
    .end local v3    # "continuationToken":Ljava/lang/String;
    .end local v6    # "e":Landroid/os/RemoteException;
    .end local v7    # "googlePendingClientTransactionIds":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    :cond_2
    :goto_1
    return-void

    .line 775
    .restart local v3    # "continuationToken":Ljava/lang/String;
    .restart local v7    # "googlePendingClientTransactionIds":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    :catch_1
    move-exception v6

    .line 776
    .local v6, "e":Lorg/json/JSONException;
    sget-object v17, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v17 .. v17}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v17

    sget-object v19, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v19 .. v19}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v19

    or-long v17, v17, v19

    const-string v19, "Error canceling orphaned managed offers"

    move-wide/from16 v0, v17

    move-object/from16 v2, v19

    invoke-static {v0, v1, v2, v6}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 780
    .end local v6    # "e":Lorg/json/JSONException;
    .restart local v8    # "i":I
    .restart local v11    # "ownedItems":Landroid/os/Bundle;
    .restart local v13    # "purchaseDataList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .restart local v14    # "response":I
    :cond_3
    if-nez v3, :cond_0

    .line 783
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v17

    invoke-static/range {v17 .. v17}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/comm/persistence/DBTransactions;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->loadAllTransactions()Ljava/util/List;

    move-result-object v16

    .line 784
    .local v16, "transactions":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/comm/persistence/TransactionBucket;>;"
    invoke-interface/range {v16 .. v16}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .local v9, "i$":Ljava/util/Iterator;
    :cond_4
    :goto_2
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v17

    if-eqz v17, :cond_2

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lcom/getjar/sdk/comm/persistence/TransactionBucket;

    .line 785
    .local v15, "transaction":Lcom/getjar/sdk/comm/persistence/TransactionBucket;
    invoke-virtual {v15}, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->getType()Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;

    move-result-object v17

    sget-object v18, Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;->MANAGED_OFFER:Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;

    invoke-virtual/range {v17 .. v18}, Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_4

    .line 786
    invoke-virtual {v15}, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->getClientTransactionId()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-nez v17, :cond_4

    move-object v10, v15

    .line 787
    check-cast v10, Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;

    .line 788
    .local v10, "managedOfferBucket":Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;
    invoke-virtual {v15}, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->getClientTransactionId()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v7, v0}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v17

    if-nez v17, :cond_7

    .line 789
    invoke-virtual {v10}, Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;->getState()Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    move-result-object v17

    sget-object v18, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->CREATED:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    invoke-virtual/range {v17 .. v18}, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-nez v17, :cond_5

    invoke-virtual {v10}, Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;->getState()Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    move-result-object v17

    sget-object v18, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->RESERVING:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    invoke-virtual/range {v17 .. v18}, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-nez v17, :cond_5

    invoke-virtual {v10}, Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;->getState()Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    move-result-object v17

    sget-object v18, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->RESERVED:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    invoke-virtual/range {v17 .. v18}, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-nez v17, :cond_5

    invoke-virtual {v10}, Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;->getState()Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    move-result-object v17

    sget-object v18, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->PURCHASING:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    invoke-virtual/range {v17 .. v18}, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_6

    .line 793
    :cond_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    move-object/from16 v17, v0

    sget-object v18, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->CANCELING:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-static {v0, v10, v1}, Lcom/getjar/sdk/comm/TransactionManager;->updateOfferTransactionState(Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;)V

    .line 794
    sget-object v17, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v17 .. v17}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v17

    sget-object v19, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v19 .. v19}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v19

    or-long v17, v17, v19

    sget-object v19, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v20, "InAppPurchaseManager cancelOrphanedManagedOffers CANCELING [clientTransactionId: %1$s]"

    const/16 v21, 0x1

    move/from16 v0, v21

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    invoke-virtual {v15}, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->getClientTransactionId()Ljava/lang/String;

    move-result-object v23

    aput-object v23, v21, v22

    invoke-static/range {v19 .. v21}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v17 .. v19}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    goto/16 :goto_2

    .line 797
    :cond_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    move-object/from16 v17, v0

    sget-object v18, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->DONE:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-static {v0, v10, v1}, Lcom/getjar/sdk/comm/TransactionManager;->updateOfferTransactionState(Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;)V

    .line 798
    sget-object v17, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v17 .. v17}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v17

    sget-object v19, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v19 .. v19}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v19

    or-long v17, v17, v19

    sget-object v19, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v20, "InAppPurchaseManager cancelOrphanedManagedOffers DONE [clientTransactionId: %1$s]"

    const/16 v21, 0x1

    move/from16 v0, v21

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    invoke-virtual {v15}, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->getClientTransactionId()Ljava/lang/String;

    move-result-object v23

    aput-object v23, v21, v22

    invoke-static/range {v19 .. v21}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v17 .. v19}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    goto/16 :goto_2

    .line 802
    :cond_7
    sget-object v17, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v17 .. v17}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v17

    sget-object v19, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v19 .. v19}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v19

    or-long v17, v17, v19

    sget-object v19, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v20, "InAppPurchaseManager cancelOrphanedManagedOffers skipped [clientTransactionId: %1$s]"

    const/16 v21, 0x1

    move/from16 v0, v21

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    invoke-virtual {v15}, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->getClientTransactionId()Ljava/lang/String;

    move-result-object v23

    aput-object v23, v21, v22

    invoke-static/range {v19 .. v21}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v17 .. v19}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    goto/16 :goto_2
.end method

.method public consumeManagedOffer(Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;Z)Z
    .locals 14
    .param p1, "transaction"    # Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;
    .param p2, "isCancelling"    # Z

    .prologue
    .line 944
    if-nez p1, :cond_0

    new-instance v7, Ljava/lang/IllegalArgumentException;

    const-string v8, "\'transaction\' cannot be null"

    invoke-direct {v7, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 946
    :cond_0
    invoke-virtual {p0}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->ensureBoundToGooglePlaySvc()Z

    .line 947
    invoke-virtual {p0}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->getCurrentClientTransactionId()Ljava/lang/String;

    move-result-object v0

    .line 948
    .local v0, "currentClientTransactionId":Ljava/lang/String;
    const/4 v6, 0x0

    .line 950
    .local v6, "result":Z
    :try_start_0
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;->getRelatedObject()Lcom/getjar/sdk/comm/persistence/RelatedManagedOfferData;

    move-result-object v7

    invoke-virtual {v7}, Lcom/getjar/sdk/comm/persistence/RelatedManagedOfferData;->getPurchaseMetadata()Ljava/util/HashMap;

    move-result-object v7

    const-string v8, "order.google_play.signed_data"

    invoke-virtual {v7, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 951
    .local v3, "purchaseData":Ljava/lang/String;
    sget-object v7, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    sget-object v9, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v9}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v9

    or-long/2addr v7, v9

    sget-object v9, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v10, "Consuming product: %1$s"

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    aput-object v3, v11, v12

    invoke-static {v9, v10, v11}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v7, v8, v9}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 952
    invoke-static {v3}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_6

    .line 953
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, v3}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 954
    .local v2, "obj":Lorg/json/JSONObject;
    const-string v7, "purchaseToken"

    invoke-virtual {v2, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 956
    .local v4, "purchaseToken":Ljava/lang/String;
    iget-boolean v7, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->isGooglePlayConnected:Z

    if-eqz v7, :cond_2

    .line 957
    iget-object v7, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->googlePlayService:Lcom/getjar/sdk/vending/billing/IInAppBillingService;

    const/4 v8, 0x3

    iget-object v9, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v9}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v9

    invoke-virtual {v9}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v7, v8, v9, v4}, Lcom/getjar/sdk/vending/billing/IInAppBillingService;->consumePurchase(ILjava/lang/String;Ljava/lang/String;)I

    move-result v7

    invoke-static {v7}, Lcom/getjar/sdk/utilities/Constants$ResponseCode;->valueOf(I)Lcom/getjar/sdk/utilities/Constants$ResponseCode;

    move-result-object v5

    .line 958
    .local v5, "response":Lcom/getjar/sdk/utilities/Constants$ResponseCode;
    sget-object v7, Lcom/getjar/sdk/utilities/Constants$ResponseCode;->RESULT_OK:Lcom/getjar/sdk/utilities/Constants$ResponseCode;

    invoke-virtual {v5, v7}, Lcom/getjar/sdk/utilities/Constants$ResponseCode;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 959
    if-nez p2, :cond_1

    .line 960
    iget-object v7, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    sget-object v8, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->CONSUMED:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    invoke-static {v7, p1, v8}, Lcom/getjar/sdk/comm/TransactionManager;->updateOfferTransactionState(Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;)V

    .line 964
    iget-object v7, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    sget-object v8, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->DONE:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    invoke-static {v7, p1, v8}, Lcom/getjar/sdk/comm/TransactionManager;->updateOfferTransactionState(Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 966
    :cond_1
    const/4 v6, 0x1

    .line 980
    .end local v2    # "obj":Lorg/json/JSONObject;
    .end local v4    # "purchaseToken":Ljava/lang/String;
    .end local v5    # "response":Lcom/getjar/sdk/utilities/Constants$ResponseCode;
    :cond_2
    :goto_0
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;->getClientTransactionId()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 981
    invoke-virtual {p0}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->removeLastClientTransactionId()V

    .line 984
    :cond_3
    return v6

    .line 967
    .restart local v2    # "obj":Lorg/json/JSONObject;
    .restart local v4    # "purchaseToken":Ljava/lang/String;
    .restart local v5    # "response":Lcom/getjar/sdk/utilities/Constants$ResponseCode;
    :cond_4
    :try_start_1
    sget-object v7, Lcom/getjar/sdk/utilities/Constants$ResponseCode;->RESULT_ERROR:Lcom/getjar/sdk/utilities/Constants$ResponseCode;

    invoke-virtual {v5, v7}, Lcom/getjar/sdk/utilities/Constants$ResponseCode;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_2

    .line 968
    iget-object v7, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    sget-object v8, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->DONE:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    invoke-static {v7, p1, v8}, Lcom/getjar/sdk/comm/TransactionManager;->updateOfferTransactionState(Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;)V

    .line 969
    const/4 v6, 0x1

    .line 970
    sget-object v7, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    sget-object v9, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v9}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v9

    or-long/2addr v7, v9

    sget-object v9, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v10, "Unable to consume [marketplaceItemId:%1$s] [reason:%2$s]"

    const/4 v11, 0x2

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    invoke-virtual {p1}, Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;->getRelatedObject()Lcom/getjar/sdk/comm/persistence/RelatedManagedOfferData;

    move-result-object v13

    invoke-virtual {v13}, Lcom/getjar/sdk/comm/persistence/RelatedManagedOfferData;->getOfferToken()Ljava/lang/String;

    move-result-object v13

    aput-object v13, v11, v12

    const/4 v12, 0x1

    aput-object v5, v11, v12

    invoke-static {v9, v10, v11}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v7, v8, v9}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 977
    .end local v2    # "obj":Lorg/json/JSONObject;
    .end local v3    # "purchaseData":Ljava/lang/String;
    .end local v4    # "purchaseToken":Ljava/lang/String;
    .end local v5    # "response":Lcom/getjar/sdk/utilities/Constants$ResponseCode;
    :catch_0
    move-exception v1

    .line 978
    .local v1, "e":Ljava/lang/Exception;
    :try_start_2
    new-instance v7, Lcom/getjar/sdk/GetJarException;

    invoke-direct {v7, v1}, Lcom/getjar/sdk/GetJarException;-><init>(Ljava/lang/Throwable;)V

    throw v7
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 980
    .end local v1    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v7

    invoke-virtual {p1}, Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;->getClientTransactionId()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_5

    .line 981
    invoke-virtual {p0}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->removeLastClientTransactionId()V

    :cond_5
    throw v7

    .line 975
    .restart local v3    # "purchaseData":Ljava/lang/String;
    :cond_6
    :try_start_3
    sget-object v7, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    sget-object v9, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v9}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v9

    or-long/2addr v7, v9

    const-string v9, "Unable to consume as no purchase data found!"

    invoke-static {v7, v8, v9}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0
.end method

.method protected ensureBoundToGooglePlaySvc()Z
    .locals 11

    .prologue
    const/4 v10, 0x1

    .line 467
    sget-object v4, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    sget-object v6, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    or-long/2addr v4, v6

    const-string v6, "Binding to google play"

    invoke-static {v4, v5, v6}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    .line 468
    const/4 v2, 0x1

    .line 469
    .local v2, "result":Z
    iget-object v5, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_googlePlayBindLock:Ljava/lang/Object;

    monitor-enter v5

    .line 470
    :try_start_0
    iget-boolean v4, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->isGooglePlayConnected:Z

    if-nez v4, :cond_0

    .line 471
    iget-object v4, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v4}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    new-instance v6, Landroid/content/Intent;

    const-string v7, "com.android.vending.billing.InAppBillingService.BIND"

    invoke-direct {v6, v7}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iget-object v7, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->googlePlayServiceConnection:Lcom/getjar/sdk/rewards/InAppPurchaseManager$GooglePlayServiceConnection;

    const/4 v8, 0x1

    invoke-virtual {v4, v6, v7, v8}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v2

    .line 472
    if-eqz v2, :cond_0

    .line 473
    const/4 v3, 0x3

    .line 474
    .local v3, "retryLimit":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v3, :cond_0

    .line 476
    :try_start_1
    iget-object v4, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_googlePlayBindLock:Ljava/lang/Object;

    const-wide/16 v6, 0x3e8

    invoke-virtual {v4, v6, v7}, Ljava/lang/Object;->wait(J)V

    .line 477
    iget-boolean v4, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->isGooglePlayConnected:Z
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v4, :cond_1

    .line 478
    const/4 v2, 0x1

    .line 488
    .end local v1    # "i":I
    .end local v3    # "retryLimit":I
    :cond_0
    :try_start_2
    monitor-exit v5
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 489
    sget-object v4, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    sget-object v6, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    or-long/2addr v4, v6

    sget-object v6, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v7, "Binding result to google play: %1$b"

    new-array v8, v10, [Ljava/lang/Object;

    const/4 v9, 0x0

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-static {v6, v7, v8}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v5, v6}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    .line 490
    return v2

    .line 481
    .restart local v1    # "i":I
    .restart local v3    # "retryLimit":I
    :catch_0
    move-exception v0

    .line 482
    .local v0, "e":Ljava/lang/InterruptedException;
    :try_start_3
    sget-object v4, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    sget-object v4, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v8

    or-long/2addr v6, v8

    const-string v4, "isApi3BillingSuported Interrupted"

    invoke-static {v6, v7, v4, v0}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 483
    const/4 v2, 0x0

    .line 474
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 488
    .end local v1    # "i":I
    .end local v3    # "retryLimit":I
    :catchall_0
    move-exception v4

    monitor-exit v5
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v4
.end method

.method public getAllPurchaseResponses()Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/getjar/sdk/data/GooglePurchaseResponse;",
            ">;"
        }
    .end annotation

    .prologue
    .line 413
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 416
    .local v4, "responseItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/getjar/sdk/data/GooglePurchaseResponse;>;"
    :try_start_0
    iget-object v5, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_cachingManager:Lcom/getjar/sdk/data/CachingManager;

    invoke-virtual {v5}, Lcom/getjar/sdk/data/CachingManager;->getAllCacheEntries()Ljava/util/ArrayList;

    move-result-object v0

    .line 417
    .local v0, "cacheEntries":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/getjar/sdk/data/CacheEntry;>;"
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/getjar/sdk/data/CacheEntry;
    :try_end_0
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_1

    .line 421
    .local v1, "cacheEntry":Lcom/getjar/sdk/data/CacheEntry;
    :try_start_1
    invoke-virtual {v1}, Lcom/getjar/sdk/data/CacheEntry;->getValue()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/getjar/sdk/utilities/Base64;->decodeToObject(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/getjar/sdk/data/GooglePurchaseResponse;

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/net/URISyntaxException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 422
    :catch_0
    move-exception v2

    .line 425
    .local v2, "e":Ljava/io/IOException;
    :try_start_2
    iget-object v5, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_cachingManager:Lcom/getjar/sdk/data/CachingManager;

    invoke-virtual {v1}, Lcom/getjar/sdk/data/CacheEntry;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/getjar/sdk/data/CachingManager;->removeCacheEntry(Ljava/lang/String;)V

    .line 427
    sget-object v5, Lcom/getjar/sdk/logging/Area;->BUY_GOLD:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    const-string v7, "InAppPurchaseManager getAllPurchaseResponses"

    invoke-static {v5, v6, v7, v2}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2
    .catch Ljava/net/URISyntaxException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    .line 434
    .end local v0    # "cacheEntries":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/getjar/sdk/data/CacheEntry;>;"
    .end local v1    # "cacheEntry":Lcom/getjar/sdk/data/CacheEntry;
    .end local v2    # "e":Ljava/io/IOException;
    .end local v3    # "i$":Ljava/util/Iterator;
    :catch_1
    move-exception v2

    .line 436
    .local v2, "e":Ljava/net/URISyntaxException;
    sget-object v5, Lcom/getjar/sdk/logging/Area;->BUY_GOLD:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    const-string v7, "URI exception"

    invoke-static {v5, v6, v7, v2}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 439
    .end local v2    # "e":Ljava/net/URISyntaxException;
    :cond_0
    return-object v4

    .line 429
    .restart local v0    # "cacheEntries":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/getjar/sdk/data/CacheEntry;>;"
    .restart local v1    # "cacheEntry":Lcom/getjar/sdk/data/CacheEntry;
    .restart local v3    # "i$":Ljava/util/Iterator;
    :catch_2
    move-exception v2

    .line 430
    .local v2, "e":Ljava/lang/ClassNotFoundException;
    :try_start_3
    sget-object v5, Lcom/getjar/sdk/logging/Area;->BUY_GOLD:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    const-string v7, "InAppPurchaseManager getAllPurchaseResponses"

    invoke-static {v5, v6, v7, v2}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V
    :try_end_3
    .catch Ljava/net/URISyntaxException; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_0
.end method

.method public getCommContext()Lcom/getjar/sdk/comm/CommContext;
    .locals 1

    .prologue
    .line 185
    iget-object v0, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    return-object v0
.end method

.method public getCurrentClientTransactionId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1012
    iget-object v0, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_currentClientTransactionId:Ljava/lang/String;

    return-object v0
.end method

.method public getGoldOffers()Ljava/lang/String;
    .locals 9

    .prologue
    const/4 v7, 0x0

    .line 237
    iget-object v5, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v5}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    const-string v6, "GetJarClientPrefs"

    invoke-virtual {v5, v6, v7}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v3

    .line 238
    .local v3, "prefs":Landroid/content/SharedPreferences;
    const-string v5, "billing_supported"

    invoke-interface {v3, v5, v7}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5

    iput-boolean v5, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_isBillingSupported:Z

    .line 240
    new-instance v5, Lcom/getjar/sdk/rewards/GetJarService;

    invoke-direct {v5}, Lcom/getjar/sdk/rewards/GetJarService;-><init>()V

    iput-object v5, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_billingService:Lcom/getjar/sdk/rewards/GetJarService;

    .line 241
    iget-object v5, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_billingService:Lcom/getjar/sdk/rewards/GetJarService;

    iget-object v6, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v6}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/getjar/sdk/rewards/GetJarService;->setContext(Landroid/content/Context;)V

    .line 242
    iget-object v5, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_billingService:Lcom/getjar/sdk/rewards/GetJarService;

    invoke-virtual {v5}, Lcom/getjar/sdk/rewards/GetJarService;->checkBillingSupported()Z

    move-result v0

    .line 243
    .local v0, "billingSupport":Z
    sget-object v5, Lcom/getjar/sdk/logging/Area;->BUY_GOLD:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "InAppPurchaseManager getGoldOffers -- billingCheckRequestSuccess "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v6, v7}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 245
    invoke-static {}, Lcom/getjar/sdk/comm/LocalizationServiceProxy;->getInstance()Lcom/getjar/sdk/comm/LocalizationServiceProxy;

    move-result-object v5

    iget-object v6, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v5, v6}, Lcom/getjar/sdk/comm/LocalizationServiceProxy;->getGoldOffers(Lcom/getjar/sdk/comm/CommContext;)Lcom/getjar/sdk/comm/Operation;

    move-result-object v2

    .line 248
    .local v2, "operation":Lcom/getjar/sdk/comm/Operation;
    :try_start_0
    invoke-virtual {v2}, Lcom/getjar/sdk/comm/Operation;->get()Lcom/getjar/sdk/comm/Result;

    move-result-object v4

    .line 249
    .local v4, "result":Lcom/getjar/sdk/comm/Result;
    if-eqz v4, :cond_0

    invoke-virtual {v4}, Lcom/getjar/sdk/comm/Result;->isSuccessfulResponse()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 251
    invoke-virtual {v4}, Lcom/getjar/sdk/comm/Result;->getResponseJson()Lorg/json/JSONObject;

    move-result-object v5

    const-string v6, "return"

    invoke-virtual {v5, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_2

    move-result-object v5

    .line 275
    .end local v4    # "result":Lcom/getjar/sdk/comm/Result;
    :goto_0
    return-object v5

    .line 254
    :catch_0
    move-exception v1

    .line 257
    .local v1, "e":Ljava/lang/InterruptedException;
    sget-object v5, Lcom/getjar/sdk/logging/Area;->BUY_GOLD:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    const-string v7, "InAppPurchaseManager getGoldOffers"

    invoke-static {v5, v6, v7, v1}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 271
    .end local v1    # "e":Ljava/lang/InterruptedException;
    :cond_0
    :goto_1
    :try_start_1
    new-instance v5, Lorg/json/JSONObject;

    invoke-direct {v5}, Lorg/json/JSONObject;-><init>()V

    const-string v6, "results"

    new-instance v7, Lorg/json/JSONArray;

    invoke-direct {v7}, Lorg/json/JSONArray;-><init>()V

    invoke-virtual {v5, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v5

    invoke-virtual {v5}, Lorg/json/JSONObject;->toString()Ljava/lang/String;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_3

    move-result-object v5

    goto :goto_0

    .line 259
    :catch_1
    move-exception v1

    .line 262
    .local v1, "e":Ljava/util/concurrent/ExecutionException;
    sget-object v5, Lcom/getjar/sdk/logging/Area;->BUY_GOLD:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    const-string v7, "InAppPurchaseManager getGoldOffers"

    invoke-static {v5, v6, v7, v1}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 264
    .end local v1    # "e":Ljava/util/concurrent/ExecutionException;
    :catch_2
    move-exception v1

    .line 267
    .local v1, "e":Lorg/json/JSONException;
    sget-object v5, Lcom/getjar/sdk/logging/Area;->BUY_GOLD:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    const-string v7, "InAppPurchaseManager getGoldOffers"

    invoke-static {v5, v6, v7, v1}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 272
    .end local v1    # "e":Lorg/json/JSONException;
    :catch_3
    move-exception v1

    .line 274
    .restart local v1    # "e":Lorg/json/JSONException;
    sget-object v5, Lcom/getjar/sdk/logging/Area;->BUY_GOLD:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    const-string v7, "InAppPurchaseManager getGoldOffers"

    invoke-static {v5, v6, v7, v1}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 275
    const-string v5, "{\"results\":[]}"

    goto :goto_0
.end method

.method protected getLocalizedPrices([Ljava/lang/String;)Lorg/json/JSONArray;
    .locals 24
    .param p1, "productIds"    # [Ljava/lang/String;

    .prologue
    .line 514
    if-eqz p1, :cond_0

    move-object/from16 v0, p1

    array-length v0, v0

    move/from16 v20, v0

    if-gtz v20, :cond_1

    :cond_0
    new-instance v20, Ljava/lang/IllegalArgumentException;

    const-string v21, "\'productIds\' cannot be null or empty"

    invoke-direct/range {v20 .. v21}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v20

    .line 516
    :cond_1
    invoke-virtual/range {p0 .. p0}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->ensureBoundToGooglePlaySvc()Z

    .line 518
    new-instance v9, Ljava/util/HashMap;

    move-object/from16 v0, p1

    array-length v0, v0

    move/from16 v20, v0

    move/from16 v0, v20

    invoke-direct {v9, v0}, Ljava/util/HashMap;-><init>(I)V

    .line 519
    .local v9, "localizedPrices":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->googlePlayService:Lcom/getjar/sdk/vending/billing/IInAppBillingService;

    move-object/from16 v20, v0

    if-eqz v20, :cond_3

    .line 521
    new-instance v13, Ljava/util/ArrayList;

    move-object/from16 v0, p1

    array-length v0, v0

    move/from16 v20, v0

    move/from16 v0, v20

    invoke-direct {v13, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 522
    .local v13, "productIdList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    move-object/from16 v4, p1

    .local v4, "arr$":[Ljava/lang/String;
    array-length v8, v4

    .local v8, "len$":I
    const/4 v7, 0x0

    .local v7, "i$":I
    :goto_0
    if-ge v7, v8, :cond_2

    aget-object v12, v4, v7

    .line 523
    .local v12, "productId":Ljava/lang/String;
    invoke-virtual {v13, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 522
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 526
    .end local v12    # "productId":Ljava/lang/String;
    :cond_2
    new-instance v14, Landroid/os/Bundle;

    invoke-direct {v14}, Landroid/os/Bundle;-><init>()V

    .line 527
    .local v14, "querySkus":Landroid/os/Bundle;
    const-string v20, "ITEM_ID_LIST"

    move-object/from16 v0, v20

    invoke-virtual {v14, v0, v13}, Landroid/os/Bundle;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 531
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->googlePlayService:Lcom/getjar/sdk/vending/billing/IInAppBillingService;

    move-object/from16 v20, v0

    const/16 v21, 0x3

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v22

    const-string v23, "inapp"

    move-object/from16 v0, v20

    move/from16 v1, v21

    move-object/from16 v2, v22

    move-object/from16 v3, v23

    invoke-interface {v0, v1, v2, v3, v14}, Lcom/getjar/sdk/vending/billing/IInAppBillingService;->getSkuDetails(ILjava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/os/Bundle;

    move-result-object v18

    .line 532
    .local v18, "skuDetails":Landroid/os/Bundle;
    const-string v20, "RESPONSE_CODE"

    move-object/from16 v0, v18

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v15

    .line 533
    .local v15, "response":I
    const-string v20, "RESPONSE_CODE"

    move-object/from16 v0, v18

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v20

    if-eqz v20, :cond_3

    if-nez v15, :cond_3

    .line 534
    const-string v20, "DETAILS_LIST"

    move-object/from16 v0, v18

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v16

    .line 535
    .local v16, "responseList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual/range {v16 .. v16}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .local v7, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v20

    if-eqz v20, :cond_3

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Ljava/lang/String;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_1

    .line 537
    .local v19, "thisResponse":Ljava/lang/String;
    :try_start_1
    new-instance v10, Lorg/json/JSONObject;

    move-object/from16 v0, v19

    invoke-direct {v10, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 538
    .local v10, "object":Lorg/json/JSONObject;
    const-string v20, "productId"

    move-object/from16 v0, v20

    invoke-virtual {v10, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 539
    .local v17, "sku":Ljava/lang/String;
    const-string v20, "price"

    move-object/from16 v0, v20

    invoke-virtual {v10, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 540
    .local v11, "price":Ljava/lang/String;
    move-object/from16 v0, v17

    invoke-virtual {v9, v0, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    .line 543
    .end local v10    # "object":Lorg/json/JSONObject;
    .end local v11    # "price":Ljava/lang/String;
    .end local v17    # "sku":Ljava/lang/String;
    :catch_0
    move-exception v5

    .line 544
    .local v5, "e":Ljava/lang/Exception;
    :try_start_2
    sget-object v20, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v20 .. v20}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v20

    sget-object v22, Lcom/getjar/sdk/logging/Area;->LOCALIZATION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v22 .. v22}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v22

    or-long v20, v20, v22

    const-string v22, "Invalid JSON from Google Play"

    move-wide/from16 v0, v20

    move-object/from16 v2, v22

    invoke-static {v0, v1, v2, v5}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2
    .catch Landroid/os/RemoteException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_1

    .line 548
    .end local v5    # "e":Ljava/lang/Exception;
    .end local v7    # "i$":Ljava/util/Iterator;
    .end local v15    # "response":I
    .end local v16    # "responseList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v18    # "skuDetails":Landroid/os/Bundle;
    .end local v19    # "thisResponse":Ljava/lang/String;
    :catch_1
    move-exception v6

    .line 549
    .local v6, "e1":Landroid/os/RemoteException;
    const/16 v20, 0x0

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->isGooglePlayConnected:Z

    .line 550
    sget-object v20, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v20 .. v20}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v20

    sget-object v22, Lcom/getjar/sdk/logging/Area;->LOCALIZATION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v22 .. v22}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v22

    or-long v20, v20, v22

    const-string v22, "Error connecting to google play service"

    move-wide/from16 v0, v20

    move-object/from16 v2, v22

    invoke-static {v0, v1, v2, v6}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 554
    .end local v4    # "arr$":[Ljava/lang/String;
    .end local v6    # "e1":Landroid/os/RemoteException;
    .end local v8    # "len$":I
    .end local v13    # "productIdList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v14    # "querySkus":Landroid/os/Bundle;
    :cond_3
    move-object/from16 v0, p0

    invoke-direct {v0, v9}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->getJSONArrayFromPriceMap(Ljava/util/HashMap;)Lorg/json/JSONArray;

    move-result-object v20

    return-object v20
.end method

.method public handleFailure(Ljava/lang/String;Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;Landroid/content/Context;)V
    .locals 7
    .param p1, "platformItemId"    # Ljava/lang/String;
    .param p2, "reason"    # Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;
    .param p3, "context"    # Landroid/content/Context;

    .prologue
    .line 321
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "platformItemId cannot be null"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 322
    :cond_0
    if-nez p2, :cond_1

    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "reason cannot be null"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 323
    :cond_1
    if-nez p3, :cond_2

    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "context cannot be null"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 325
    :cond_2
    sget-object v3, Lcom/getjar/sdk/logging/Area;->BUY_GOLD:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "InAppPurchaseManager handleFailure Failed: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p2}, Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;->name()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;)V

    .line 332
    sget-object v3, Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;->GETJAR_SERVICE_FAILURE:Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;

    invoke-virtual {p2, v3}, Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    sget-object v3, Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;->NETWORK_ERROR:Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;

    invoke-virtual {p2, v3}, Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 334
    :cond_3
    const-string v2, "Gold purchase successful, your balance will be updated shortly. Thanks for your patience!"

    .line 335
    .local v2, "notificationMsg":Ljava/lang/String;
    iget-object v3, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-static {v3, v2}, Lcom/getjar/sdk/utilities/NotificationsUtility;->pushFailNotification(Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;)V

    .line 343
    .end local v2    # "notificationMsg":Ljava/lang/String;
    :cond_4
    :goto_0
    invoke-static {p1, p3}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->getGoldBucketDetails(Ljava/lang/String;Landroid/content/Context;)Ljava/util/HashMap;

    move-result-object v1

    .line 345
    .local v1, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v0, Landroid/content/Intent;

    const-string v3, "com.getjar.sdk.NOTIFY_BUY_GOLD"

    invoke-direct {v0, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 346
    .local v0, "intent":Landroid/content/Intent;
    const-string v3, "FAILURE_REASON"

    invoke-virtual {p2}, Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;->name()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 347
    const-string v4, "order.gold_value"

    const-string v3, "order.gold_value"

    invoke-virtual {v1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v0, v4, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 348
    const-string v4, "order.price"

    const-string v3, "order.price"

    invoke-virtual {v1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v0, v4, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 349
    invoke-virtual {p3, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 350
    return-void

    .line 337
    .end local v0    # "intent":Landroid/content/Intent;
    .end local v1    # "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_5
    sget-object v3, Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;->UNAUTHORIZED:Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;

    invoke-virtual {p2, v3}, Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 339
    const-string v2, "Your Google purchase could not be verified by Getjar."

    .line 340
    .restart local v2    # "notificationMsg":Ljava/lang/String;
    iget-object v3, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-static {v3, v2}, Lcom/getjar/sdk/utilities/NotificationsUtility;->pushFailNotification(Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public isApi3BillingSupported()Z
    .locals 12

    .prologue
    const/4 v11, 0x0

    .line 563
    const/4 v3, 0x0

    .line 565
    .local v3, "result":Z
    invoke-virtual {p0}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->ensureBoundToGooglePlaySvc()Z

    .line 567
    iget-object v5, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->googlePlayService:Lcom/getjar/sdk/vending/billing/IInAppBillingService;

    if-eqz v5, :cond_0

    .line 569
    :try_start_0
    iget-object v5, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->googlePlayService:Lcom/getjar/sdk/vending/billing/IInAppBillingService;

    const/4 v6, 0x3

    iget-object v7, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v7}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v7

    invoke-virtual {v7}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v7

    const-string v8, "inapp"

    invoke-interface {v5, v6, v7, v8}, Lcom/getjar/sdk/vending/billing/IInAppBillingService;->isBillingSupported(ILjava/lang/String;Ljava/lang/String;)I

    move-result v4

    .line 570
    .local v4, "resultCode":I
    invoke-static {v4}, Lcom/getjar/sdk/utilities/Constants$ResponseCode;->valueOf(I)Lcom/getjar/sdk/utilities/Constants$ResponseCode;

    move-result-object v5

    sget-object v6, Lcom/getjar/sdk/utilities/Constants$ResponseCode;->RESULT_OK:Lcom/getjar/sdk/utilities/Constants$ResponseCode;

    invoke-virtual {v5, v6}, Lcom/getjar/sdk/utilities/Constants$ResponseCode;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v5

    if-eqz v5, :cond_0

    .line 571
    const/4 v3, 0x1

    .line 578
    .end local v4    # "resultCode":I
    :cond_0
    :goto_0
    iget-object v5, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v5}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    const-string v6, "GetJarClientPrefs"

    invoke-virtual {v5, v6, v11}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 579
    .local v2, "prefs":Landroid/content/SharedPreferences;
    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 580
    .local v1, "editor":Landroid/content/SharedPreferences$Editor;
    const-string v5, "billing_api3_supported"

    invoke-interface {v1, v5, v3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 581
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 583
    sget-object v5, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    sget-object v7, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v8, "InAppPurchaseManager isApi3BillingSupported returning %1$b"

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v10

    aput-object v10, v9, v11

    invoke-static {v7, v8, v9}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v6, v7}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    .line 584
    return v3

    .line 573
    .end local v1    # "editor":Landroid/content/SharedPreferences$Editor;
    .end local v2    # "prefs":Landroid/content/SharedPreferences;
    :catch_0
    move-exception v0

    .line 574
    .local v0, "e":Landroid/os/RemoteException;
    iput-boolean v11, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->isGooglePlayConnected:Z

    .line 575
    sget-object v5, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    sget-object v7, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    or-long/2addr v5, v7

    const-string v7, "isApi3BillingSuported Remote Exception"

    invoke-static {v5, v6, v7, v0}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method protected isGooglePlayConnected()Z
    .locals 1

    .prologue
    .line 1067
    iget-boolean v0, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->isGooglePlayConnected:Z

    return v0
.end method

.method protected managedOfferGooglePlayResponse(IILandroid/content/Intent;)V
    .locals 12
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    const/4 v11, -0x1

    .line 675
    sget-object v7, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    sget-object v9, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v9}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v9

    or-long/2addr v7, v9

    const-string v9, "Got callback from google"

    invoke-static {v7, v8, v9}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 676
    if-nez p3, :cond_0

    new-instance v7, Ljava/lang/IllegalArgumentException;

    const-string v8, "\'data\' cannot be null"

    invoke-direct {v7, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 678
    :cond_0
    if-ne p2, v11, :cond_3

    const-string v7, "RESPONSE_CODE"

    invoke-virtual {p3, v7, v11}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v7

    if-nez v7, :cond_3

    .line 679
    const-string v7, "INAPP_PURCHASE_DATA"

    invoke-virtual {p3, v7}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 680
    .local v4, "purchaseData":Ljava/lang/String;
    const-string v7, "INAPP_DATA_SIGNATURE"

    invoke-virtual {p3, v7}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 683
    .local v1, "dataSignature":Ljava/lang/String;
    const/4 v0, 0x0

    .line 686
    .local v0, "clientTransactionId":Ljava/lang/String;
    :try_start_0
    invoke-static {v4}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_2

    .line 687
    new-instance v7, Lorg/json/JSONObject;

    invoke-direct {v7, v4}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v8, "developerPayload"

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 688
    .local v2, "developerPayload":Ljava/lang/String;
    invoke-static {v2}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_1

    const-string v7, ","

    invoke-virtual {v2, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v7

    array-length v7, v7

    const/4 v8, 0x3

    if-ne v7, v8, :cond_1

    .line 689
    const-string v7, ","

    invoke-virtual {v2, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x0

    aget-object v0, v7, v8

    .line 691
    invoke-static {v0}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_1

    .line 692
    iget-object v7, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v7}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v7

    invoke-static {v7}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/comm/persistence/DBTransactions;

    move-result-object v7

    invoke-virtual {v7, v0}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->loadTransaction(Ljava/lang/String;)Lcom/getjar/sdk/comm/persistence/TransactionBucket;

    move-result-object v6

    check-cast v6, Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;

    .line 693
    .local v6, "transaction":Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;
    invoke-virtual {v6}, Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;->getRelatedObject()Lcom/getjar/sdk/comm/persistence/RelatedManagedOfferData;

    move-result-object v5

    .line 694
    .local v5, "relatedData":Lcom/getjar/sdk/comm/persistence/RelatedManagedOfferData;
    invoke-virtual {v5, v4, v1}, Lcom/getjar/sdk/comm/persistence/RelatedManagedOfferData;->addGooglePlayTransactionData(Ljava/lang/String;Ljava/lang/String;)V

    .line 695
    iget-object v7, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v7}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v7

    invoke-static {v7}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/comm/persistence/DBTransactions;

    move-result-object v7

    invoke-virtual {v7, v0, v5}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->updateManagedOfferTransaction(Ljava/lang/String;Lcom/getjar/sdk/comm/persistence/RelatedManagedOfferData;)Z

    .line 696
    iget-object v7, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    sget-object v8, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->PURCHASED:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    invoke-static {v7, v6, v8}, Lcom/getjar/sdk/comm/TransactionManager;->updateOfferTransactionState(Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 717
    .end local v2    # "developerPayload":Ljava/lang/String;
    .end local v5    # "relatedData":Lcom/getjar/sdk/comm/persistence/RelatedManagedOfferData;
    .end local v6    # "transaction":Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;
    :cond_1
    :goto_0
    new-instance v7, Lcom/getjar/sdk/comm/TransactionManager;

    iget-object v8, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v8}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v8

    invoke-direct {v7, v8}, Lcom/getjar/sdk/comm/TransactionManager;-><init>(Landroid/content/Context;)V

    iget-object v8, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v7, v8}, Lcom/getjar/sdk/comm/TransactionManager;->runEarnAndManagedOfferTransactions(Lcom/getjar/sdk/comm/CommContext;)Ljava/util/List;

    .line 730
    .end local v1    # "dataSignature":Ljava/lang/String;
    .end local v4    # "purchaseData":Ljava/lang/String;
    :goto_1
    return-void

    .line 702
    .restart local v1    # "dataSignature":Ljava/lang/String;
    .restart local v4    # "purchaseData":Ljava/lang/String;
    :cond_2
    const-wide/16 v7, 0x3e8

    :try_start_1
    invoke-static {v7, v8}, Ljava/lang/Thread;->sleep(J)V

    .line 704
    const/4 v7, 0x1

    invoke-virtual {p0, v7}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->processOutstandingPurchases(Z)Z

    move-result v7

    if-nez v7, :cond_1

    .line 705
    iget-object v7, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v7}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v7

    invoke-static {v7}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/comm/persistence/DBTransactions;

    move-result-object v7

    invoke-virtual {p0}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->getCurrentClientTransactionId()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->loadTransaction(Ljava/lang/String;)Lcom/getjar/sdk/comm/persistence/TransactionBucket;

    move-result-object v6

    check-cast v6, Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;

    .line 706
    .restart local v6    # "transaction":Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;
    iget-object v7, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    sget-object v8, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->CANCELING:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    invoke-static {v7, v6, v8}, Lcom/getjar/sdk/comm/TransactionManager;->updateOfferTransactionState(Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;)V

    .line 707
    iget-object v7, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v7}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v7

    sget-object v8, Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;->GOOGLE_FAILURE_AFTER_PURCHASE:Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;

    new-instance v9, Lorg/json/JSONObject;

    invoke-direct {v9}, Lorg/json/JSONObject;-><init>()V

    invoke-static {v7, v8, v9}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->updateUIwithOfferResults(Landroid/content/Context;Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;Lorg/json/JSONObject;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 713
    .end local v6    # "transaction":Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;
    :catch_0
    move-exception v3

    .line 714
    .local v3, "e":Ljava/lang/Exception;
    :try_start_2
    sget-object v7, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    sget-object v9, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v9}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v9

    or-long/2addr v7, v9

    const-string v9, "InAppPurchaseManager managedOfferGooglePlayResponse: Google Play Error"

    invoke-static {v7, v8, v9, v3}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 715
    iget-object v7, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v7}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v7

    sget-object v8, Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;->GOOGLE_FAILURE_AFTER_PURCHASE:Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;

    new-instance v9, Lorg/json/JSONObject;

    invoke-direct {v9}, Lorg/json/JSONObject;-><init>()V

    invoke-static {v7, v8, v9}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->updateUIwithOfferResults(Landroid/content/Context;Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;Lorg/json/JSONObject;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 717
    new-instance v7, Lcom/getjar/sdk/comm/TransactionManager;

    iget-object v8, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v8}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v8

    invoke-direct {v7, v8}, Lcom/getjar/sdk/comm/TransactionManager;-><init>(Landroid/content/Context;)V

    iget-object v8, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v7, v8}, Lcom/getjar/sdk/comm/TransactionManager;->runEarnAndManagedOfferTransactions(Lcom/getjar/sdk/comm/CommContext;)Ljava/util/List;

    goto :goto_1

    .end local v3    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v7

    new-instance v8, Lcom/getjar/sdk/comm/TransactionManager;

    iget-object v9, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v9}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v9

    invoke-direct {v8, v9}, Lcom/getjar/sdk/comm/TransactionManager;-><init>(Landroid/content/Context;)V

    iget-object v9, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v8, v9}, Lcom/getjar/sdk/comm/TransactionManager;->runEarnAndManagedOfferTransactions(Lcom/getjar/sdk/comm/CommContext;)Ljava/util/List;

    throw v7

    .line 722
    .end local v0    # "clientTransactionId":Ljava/lang/String;
    .end local v1    # "dataSignature":Ljava/lang/String;
    .end local v4    # "purchaseData":Ljava/lang/String;
    :cond_3
    iget-object v7, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v7}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v7

    sget-object v8, Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;->GOOGLE_RELATED_FAILURE:Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;

    new-instance v9, Lorg/json/JSONObject;

    invoke-direct {v9}, Lorg/json/JSONObject;-><init>()V

    invoke-static {v7, v8, v9}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->updateUIwithOfferResults(Landroid/content/Context;Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;Lorg/json/JSONObject;)V

    .line 723
    invoke-virtual {p0}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->getCurrentClientTransactionId()Ljava/lang/String;

    move-result-object v0

    .line 724
    .restart local v0    # "clientTransactionId":Ljava/lang/String;
    invoke-static {v0}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_4

    .line 725
    new-instance v7, Lcom/getjar/sdk/comm/TransactionManager;

    iget-object v8, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v8}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v8

    invoke-direct {v7, v8}, Lcom/getjar/sdk/comm/TransactionManager;-><init>(Landroid/content/Context;)V

    iget-object v8, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v7, v0, v8}, Lcom/getjar/sdk/comm/TransactionManager;->cancelManagedOfferTransaction(Ljava/lang/String;Lcom/getjar/sdk/comm/CommContext;)V

    goto/16 :goto_1

    .line 727
    :cond_4
    sget-object v7, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    sget-object v9, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v9}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v9

    or-long/2addr v7, v9

    const-string v9, "InAppPurchaseManager managedOfferGooglePlayResponse: Unable to Cancel. Could not find current transaction ID."

    invoke-static {v7, v8, v9}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;)V

    goto/16 :goto_1
.end method

.method public processOutstandingPurchases(Z)Z
    .locals 36
    .param p1, "currentOnly"    # Z

    .prologue
    .line 820
    invoke-virtual/range {p0 .. p0}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->ensureBoundToGooglePlaySvc()Z

    .line 821
    const/4 v8, 0x0

    .line 822
    .local v8, "currentTransactionSucceeded":Z
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->googlePlayService:Lcom/getjar/sdk/vending/billing/IInAppBillingService;

    move-object/from16 v28, v0

    if-eqz v28, :cond_11

    .line 824
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_processOutstandingPurchasesLock:Ljava/lang/Object;

    move-object/from16 v29, v0

    monitor-enter v29
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 826
    const/4 v6, 0x0

    .line 828
    .local v6, "continuationToken":Ljava/lang/String;
    :cond_0
    :try_start_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->googlePlayService:Lcom/getjar/sdk/vending/billing/IInAppBillingService;

    move-object/from16 v28, v0

    const/16 v30, 0x3

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    move-object/from16 v31, v0

    invoke-virtual/range {v31 .. v31}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v31

    invoke-virtual/range {v31 .. v31}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v31

    const-string v32, "inapp"

    const/16 v33, 0x0

    move-object/from16 v0, v28

    move/from16 v1, v30

    move-object/from16 v2, v31

    move-object/from16 v3, v32

    move-object/from16 v4, v33

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/getjar/sdk/vending/billing/IInAppBillingService;->getPurchases(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v15

    .line 835
    .local v15, "ownedItems":Landroid/os/Bundle;
    new-instance v28, Ljava/lang/Thread;

    new-instance v30, Lcom/getjar/sdk/rewards/InAppPurchaseManager$2;

    move-object/from16 v0, v30

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/getjar/sdk/rewards/InAppPurchaseManager$2;-><init>(Lcom/getjar/sdk/rewards/InAppPurchaseManager;)V

    move-object/from16 v0, v28

    move-object/from16 v1, v30

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual/range {v28 .. v28}, Ljava/lang/Thread;->start()V

    .line 842
    const-string v28, "RESPONSE_CODE"

    move-object/from16 v0, v28

    invoke-virtual {v15, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v24

    .line 843
    .local v24, "response":I
    const-string v28, "RESPONSE_CODE"

    move-object/from16 v0, v28

    invoke-virtual {v15, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v28

    if-eqz v28, :cond_6

    invoke-static/range {v24 .. v24}, Lcom/getjar/sdk/utilities/Constants$ResponseCode;->valueOf(I)Lcom/getjar/sdk/utilities/Constants$ResponseCode;

    move-result-object v28

    sget-object v30, Lcom/getjar/sdk/utilities/Constants$ResponseCode;->RESULT_OK:Lcom/getjar/sdk/utilities/Constants$ResponseCode;

    move-object/from16 v0, v28

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lcom/getjar/sdk/utilities/Constants$ResponseCode;->equals(Ljava/lang/Object;)Z

    move-result v28

    if-eqz v28, :cond_6

    .line 844
    const-string v28, "INAPP_PURCHASE_DATA_LIST"

    move-object/from16 v0, v28

    invoke-virtual {v15, v0}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v18

    .line 845
    .local v18, "purchaseDataList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const-string v28, "INAPP_DATA_SIGNATURE_LIST"

    move-object/from16 v0, v28

    invoke-virtual {v15, v0}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v26

    .line 846
    .local v26, "signatureList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const-string v28, "INAPP_CONTINUATION_TOKEN"

    move-object/from16 v0, v28

    invoke-virtual {v15, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 848
    sget-object v28, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v28 .. v28}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v30

    sget-object v28, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v28 .. v28}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v32

    or-long v30, v30, v32

    sget-object v28, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v32, "Got %s items"

    const/16 v33, 0x1

    move/from16 v0, v33

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v33, v0

    const/16 v34, 0x0

    invoke-virtual/range {v18 .. v18}, Ljava/util/ArrayList;->size()I

    move-result v35

    invoke-static/range {v35 .. v35}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v35

    aput-object v35, v33, v34

    move-object/from16 v0, v28

    move-object/from16 v1, v32

    move-object/from16 v2, v33

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v28

    move-wide/from16 v0, v30

    move-object/from16 v2, v28

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 849
    if-eqz v18, :cond_6

    .line 851
    const/4 v13, 0x0

    .local v13, "i":I
    :goto_0
    invoke-virtual/range {v18 .. v18}, Ljava/util/ArrayList;->size()I

    move-result v28

    move/from16 v0, v28

    if-ge v13, v0, :cond_6

    .line 852
    move-object/from16 v0, v18

    invoke-virtual {v0, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Ljava/lang/String;

    .line 853
    .local v17, "purchaseData":Ljava/lang/String;
    move-object/from16 v0, v26

    invoke-virtual {v0, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v25

    check-cast v25, Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 856
    .local v25, "signature":Ljava/lang/String;
    :try_start_2
    new-instance v19, Lorg/json/JSONObject;

    move-object/from16 v0, v19

    move-object/from16 v1, v17

    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 857
    .local v19, "purchaseJson":Lorg/json/JSONObject;
    const-string v28, "developerPayload"

    move-object/from16 v0, v19

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 858
    .local v9, "developerPayload":Ljava/lang/String;
    invoke-static {v9}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v28

    if-nez v28, :cond_5

    const-string v28, ","

    move-object/from16 v0, v28

    invoke-virtual {v9, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v28

    move-object/from16 v0, v28

    array-length v0, v0

    move/from16 v28, v0

    const/16 v30, 0x3

    move/from16 v0, v28

    move/from16 v1, v30

    if-ne v0, v1, :cond_5

    .line 859
    const-string v28, ","

    move-object/from16 v0, v28

    invoke-virtual {v9, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v28

    const/16 v30, 0x0

    aget-object v5, v28, v30

    .line 860
    .local v5, "clientTransactionId":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    move-object/from16 v28, v0

    invoke-virtual/range {v28 .. v28}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v28

    invoke-static/range {v28 .. v28}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/comm/persistence/DBTransactions;

    move-result-object v28

    move-object/from16 v0, v28

    invoke-virtual {v0, v5}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->loadTransaction(Ljava/lang/String;)Lcom/getjar/sdk/comm/persistence/TransactionBucket;

    move-result-object v27

    .line 861
    .local v27, "transaction":Lcom/getjar/sdk/comm/persistence/TransactionBucket;
    if-nez v27, :cond_3

    .line 862
    const-string v28, "purchaseTime"

    move-object/from16 v0, v19

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v21

    .line 863
    .local v21, "purchaseTime":J
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Lcom/getjar/sdk/comm/auth/AuthManager;->getUserDeviceId()Ljava/lang/String;

    move-result-object v10

    .line 865
    .local v10, "deviceId":Ljava/lang/String;
    const-string v28, ","

    move-object/from16 v0, v28

    invoke-virtual {v9, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v28

    const/16 v30, 0x2

    aget-object v28, v28, v30

    move-object/from16 v0, v28

    invoke-virtual {v10, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v28

    if-nez v28, :cond_1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v30

    sub-long v30, v30, v21

    const-wide/32 v32, 0x5265c00

    cmp-long v28, v30, v32

    if-lez v28, :cond_2

    .line 866
    :cond_1
    new-instance v20, Ljava/util/HashMap;

    invoke-direct/range {v20 .. v20}, Ljava/util/HashMap;-><init>()V

    .line 867
    .local v20, "purchaseMetadata":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v28, "marketplace_product_id"

    const-string v30, "productId"

    move-object/from16 v0, v19

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v30

    move-object/from16 v0, v20

    move-object/from16 v1, v28

    move-object/from16 v2, v30

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 868
    const-string v28, "order.google_play.signed_data"

    move-object/from16 v0, v20

    move-object/from16 v1, v28

    move-object/from16 v2, v17

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 869
    const-string v28, "order.google_play.signature"

    move-object/from16 v0, v20

    move-object/from16 v1, v28

    move-object/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 870
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    move-object/from16 v28, v0

    invoke-virtual/range {v28 .. v28}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v28

    invoke-static/range {v28 .. v28}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/comm/persistence/DBTransactions;

    move-result-object v28

    new-instance v30, Lcom/getjar/sdk/comm/persistence/RelatedManagedOfferData;

    move-object/from16 v0, v30

    move-object/from16 v1, v20

    invoke-direct {v0, v1}, Lcom/getjar/sdk/comm/persistence/RelatedManagedOfferData;-><init>(Ljava/util/HashMap;)V

    sget-object v31, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->PURCHASED:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    move-object/from16 v0, v28

    move-object/from16 v1, v30

    move-object/from16 v2, v31

    invoke-virtual {v0, v5, v1, v2}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->insertManagedOfferTransaction(Ljava/lang/String;Ljava/io/Serializable;Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;)Z

    .line 851
    .end local v5    # "clientTransactionId":Ljava/lang/String;
    .end local v9    # "developerPayload":Ljava/lang/String;
    .end local v10    # "deviceId":Ljava/lang/String;
    .end local v19    # "purchaseJson":Lorg/json/JSONObject;
    .end local v20    # "purchaseMetadata":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v21    # "purchaseTime":J
    .end local v27    # "transaction":Lcom/getjar/sdk/comm/persistence/TransactionBucket;
    :cond_2
    :goto_1
    add-int/lit8 v13, v13, 0x1

    goto/16 :goto_0

    .line 875
    .restart local v5    # "clientTransactionId":Ljava/lang/String;
    .restart local v9    # "developerPayload":Ljava/lang/String;
    .restart local v19    # "purchaseJson":Lorg/json/JSONObject;
    .restart local v27    # "transaction":Lcom/getjar/sdk/comm/persistence/TransactionBucket;
    :cond_3
    move-object/from16 v0, v27

    check-cast v0, Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;

    move-object/from16 v28, v0

    invoke-virtual/range {v28 .. v28}, Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;->getRelatedObject()Lcom/getjar/sdk/comm/persistence/RelatedManagedOfferData;

    move-result-object v23

    .line 876
    .local v23, "relatedData":Lcom/getjar/sdk/comm/persistence/RelatedManagedOfferData;
    move-object/from16 v0, v23

    move-object/from16 v1, v17

    move-object/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Lcom/getjar/sdk/comm/persistence/RelatedManagedOfferData;->addGooglePlayTransactionData(Ljava/lang/String;Ljava/lang/String;)V

    .line 877
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    move-object/from16 v28, v0

    invoke-virtual/range {v28 .. v28}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v28

    invoke-static/range {v28 .. v28}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/comm/persistence/DBTransactions;

    move-result-object v28

    move-object/from16 v0, v28

    move-object/from16 v1, v23

    invoke-virtual {v0, v5, v1}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->updateManagedOfferTransaction(Ljava/lang/String;Lcom/getjar/sdk/comm/persistence/RelatedManagedOfferData;)Z

    .line 878
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    move-object/from16 v28, v0

    check-cast v27, Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;

    .end local v27    # "transaction":Lcom/getjar/sdk/comm/persistence/TransactionBucket;
    sget-object v30, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->PURCHASED:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    move-object/from16 v0, v28

    move-object/from16 v1, v27

    move-object/from16 v2, v30

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/comm/TransactionManager;->updateOfferTransactionState(Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;)V
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/lang/ClassNotFoundException; {:try_start_2 .. :try_end_2} :catch_3
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    .line 887
    .end local v5    # "clientTransactionId":Ljava/lang/String;
    .end local v9    # "developerPayload":Ljava/lang/String;
    .end local v19    # "purchaseJson":Lorg/json/JSONObject;
    .end local v23    # "relatedData":Lcom/getjar/sdk/comm/persistence/RelatedManagedOfferData;
    :catch_0
    move-exception v11

    .line 888
    .local v11, "e":Lorg/json/JSONException;
    :try_start_3
    sget-object v28, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v28 .. v28}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v30

    sget-object v28, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v28 .. v28}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v32

    or-long v30, v30, v32

    const-string v28, "Invalid json"

    move-wide/from16 v0, v30

    move-object/from16 v2, v28

    invoke-static {v0, v1, v2, v11}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 898
    .end local v11    # "e":Lorg/json/JSONException;
    .end local v13    # "i":I
    .end local v15    # "ownedItems":Landroid/os/Bundle;
    .end local v17    # "purchaseData":Ljava/lang/String;
    .end local v18    # "purchaseDataList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v24    # "response":I
    .end local v25    # "signature":Ljava/lang/String;
    .end local v26    # "signatureList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :catchall_0
    move-exception v28

    monitor-exit v29
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    throw v28
    :try_end_4
    .catch Landroid/os/RemoteException; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 899
    .end local v6    # "continuationToken":Ljava/lang/String;
    :catch_1
    move-exception v11

    .line 900
    .local v11, "e":Landroid/os/RemoteException;
    const/16 v28, 0x0

    :try_start_5
    move/from16 v0, v28

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->isGooglePlayConnected:Z

    .line 901
    sget-object v28, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v28 .. v28}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v28

    sget-object v30, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v30 .. v30}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v30

    or-long v28, v28, v30

    const-string v30, "Error processing outstanding purchases"

    move-wide/from16 v0, v28

    move-object/from16 v2, v30

    invoke-static {v0, v1, v2, v11}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;Ljava/lang/Throwable;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 904
    invoke-virtual/range {p0 .. p0}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->getCurrentClientTransactionId()Ljava/lang/String;

    move-result-object v7

    .line 906
    .local v7, "currentClientTransactionId":Ljava/lang/String;
    if-eqz p1, :cond_b

    .line 907
    invoke-static {v7}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v28

    if-nez v28, :cond_4

    .line 908
    new-instance v28, Lcom/getjar/sdk/comm/TransactionManager;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    move-object/from16 v29, v0

    invoke-virtual/range {v29 .. v29}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v29

    invoke-direct/range {v28 .. v29}, Lcom/getjar/sdk/comm/TransactionManager;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    move-object/from16 v29, v0

    move-object/from16 v0, v28

    move-object/from16 v1, v29

    invoke-virtual {v0, v7, v1}, Lcom/getjar/sdk/comm/TransactionManager;->runManagedOfferTransaction(Ljava/lang/String;Lcom/getjar/sdk/comm/CommContext;)Ljava/util/concurrent/Future;

    move-result-object v12

    .line 910
    .local v12, "futureState":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;>;"
    :try_start_6
    invoke-interface {v12}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    move-result-object v28

    if-eqz v28, :cond_a

    .line 911
    sget-object v28, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->DONE:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    invoke-interface {v12}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    move-result-object v29

    invoke-virtual/range {v28 .. v29}, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->equals(Ljava/lang/Object;)Z
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_5

    move-result v8

    .line 934
    .end local v7    # "currentClientTransactionId":Ljava/lang/String;
    .end local v11    # "e":Landroid/os/RemoteException;
    .end local v12    # "futureState":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;>;"
    :cond_4
    :goto_2
    return v8

    .line 881
    .restart local v6    # "continuationToken":Ljava/lang/String;
    .restart local v9    # "developerPayload":Ljava/lang/String;
    .restart local v13    # "i":I
    .restart local v15    # "ownedItems":Landroid/os/Bundle;
    .restart local v17    # "purchaseData":Ljava/lang/String;
    .restart local v18    # "purchaseDataList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .restart local v19    # "purchaseJson":Lorg/json/JSONObject;
    .restart local v24    # "response":I
    .restart local v25    # "signature":Ljava/lang/String;
    .restart local v26    # "signatureList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_5
    :try_start_7
    new-instance v20, Ljava/util/HashMap;

    invoke-direct/range {v20 .. v20}, Ljava/util/HashMap;-><init>()V

    .line 882
    .restart local v20    # "purchaseMetadata":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v28, "order.google_play.signed_data"

    move-object/from16 v0, v20

    move-object/from16 v1, v28

    move-object/from16 v2, v17

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 883
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    move-object/from16 v28, v0

    invoke-virtual/range {v28 .. v28}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v28

    invoke-static/range {v28 .. v28}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/comm/persistence/DBTransactions;

    move-result-object v28

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v30

    new-instance v31, Lcom/getjar/sdk/comm/persistence/RelatedManagedOfferData;

    move-object/from16 v0, v31

    move-object/from16 v1, v20

    invoke-direct {v0, v1}, Lcom/getjar/sdk/comm/persistence/RelatedManagedOfferData;-><init>(Ljava/util/HashMap;)V

    sget-object v32, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->CONSUMING:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    move-object/from16 v0, v28

    move-object/from16 v1, v30

    move-object/from16 v2, v31

    move-object/from16 v3, v32

    invoke-virtual {v0, v1, v2, v3}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->insertManagedOfferTransaction(Ljava/lang/String;Ljava/io/Serializable;Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;)Z
    :try_end_7
    .catch Lorg/json/JSONException; {:try_start_7 .. :try_end_7} :catch_0
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_2
    .catch Ljava/lang/ClassNotFoundException; {:try_start_7 .. :try_end_7} :catch_3
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    goto/16 :goto_1

    .line 889
    .end local v9    # "developerPayload":Ljava/lang/String;
    .end local v19    # "purchaseJson":Lorg/json/JSONObject;
    .end local v20    # "purchaseMetadata":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :catch_2
    move-exception v11

    .line 890
    .local v11, "e":Ljava/io/IOException;
    :try_start_8
    sget-object v28, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v28 .. v28}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v30

    sget-object v28, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v28 .. v28}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v32

    or-long v30, v30, v32

    const-string v28, "IOException occured"

    move-wide/from16 v0, v30

    move-object/from16 v2, v28

    invoke-static {v0, v1, v2, v11}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_1

    .line 891
    .end local v11    # "e":Ljava/io/IOException;
    :catch_3
    move-exception v11

    .line 892
    .local v11, "e":Ljava/lang/ClassNotFoundException;
    sget-object v28, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v28 .. v28}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v30

    sget-object v28, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v28 .. v28}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v32

    or-long v30, v30, v32

    const-string v28, "Invalid class cast"

    move-wide/from16 v0, v30

    move-object/from16 v2, v28

    invoke-static {v0, v1, v2, v11}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_1

    .line 897
    .end local v11    # "e":Ljava/lang/ClassNotFoundException;
    .end local v13    # "i":I
    .end local v17    # "purchaseData":Ljava/lang/String;
    .end local v18    # "purchaseDataList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v25    # "signature":Ljava/lang/String;
    .end local v26    # "signatureList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_6
    if-nez v6, :cond_0

    .line 898
    monitor-exit v29
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 904
    invoke-virtual/range {p0 .. p0}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->getCurrentClientTransactionId()Ljava/lang/String;

    move-result-object v7

    .line 906
    .restart local v7    # "currentClientTransactionId":Ljava/lang/String;
    if-eqz p1, :cond_8

    .line 907
    invoke-static {v7}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v28

    if-nez v28, :cond_4

    .line 908
    new-instance v28, Lcom/getjar/sdk/comm/TransactionManager;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    move-object/from16 v29, v0

    invoke-virtual/range {v29 .. v29}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v29

    invoke-direct/range {v28 .. v29}, Lcom/getjar/sdk/comm/TransactionManager;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    move-object/from16 v29, v0

    move-object/from16 v0, v28

    move-object/from16 v1, v29

    invoke-virtual {v0, v7, v1}, Lcom/getjar/sdk/comm/TransactionManager;->runManagedOfferTransaction(Ljava/lang/String;Lcom/getjar/sdk/comm/CommContext;)Ljava/util/concurrent/Future;

    move-result-object v12

    .line 910
    .restart local v12    # "futureState":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;>;"
    :try_start_9
    invoke-interface {v12}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    move-result-object v28

    if-eqz v28, :cond_7

    .line 911
    sget-object v28, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->DONE:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    invoke-interface {v12}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    move-result-object v29

    invoke-virtual/range {v28 .. v29}, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->equals(Ljava/lang/Object;)Z
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_4

    move-result v8

    goto/16 :goto_2

    .line 913
    :cond_7
    const/4 v8, 0x0

    goto/16 :goto_2

    .line 915
    :catch_4
    move-exception v11

    .line 916
    .local v11, "e":Ljava/lang/Exception;
    sget-object v28, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v28 .. v28}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v28

    sget-object v30, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v30 .. v30}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v30

    or-long v28, v28, v30

    const-string v30, "Error getting current transaction state"

    move-wide/from16 v0, v28

    move-object/from16 v2, v30

    invoke-static {v0, v1, v2, v11}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_2

    .line 920
    .end local v11    # "e":Ljava/lang/Exception;
    .end local v12    # "futureState":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;>;"
    :cond_8
    new-instance v28, Lcom/getjar/sdk/comm/TransactionManager;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    move-object/from16 v29, v0

    invoke-virtual/range {v29 .. v29}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v29

    invoke-direct/range {v28 .. v29}, Lcom/getjar/sdk/comm/TransactionManager;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    move-object/from16 v29, v0

    invoke-virtual/range {v28 .. v29}, Lcom/getjar/sdk/comm/TransactionManager;->runEarnAndManagedOfferTransactions(Lcom/getjar/sdk/comm/CommContext;)Ljava/util/List;

    move-result-object v16

    .line 921
    .local v16, "processedTransactions":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/comm/persistence/TransactionBucket;>;"
    invoke-static {v7}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v28

    if-nez v28, :cond_4

    .line 922
    invoke-interface/range {v16 .. v16}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v14

    .local v14, "i$":Ljava/util/Iterator;
    :cond_9
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v28

    if-eqz v28, :cond_4

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v27

    check-cast v27, Lcom/getjar/sdk/comm/persistence/TransactionBucket;

    .line 923
    .restart local v27    # "transaction":Lcom/getjar/sdk/comm/persistence/TransactionBucket;
    invoke-virtual/range {v27 .. v27}, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->getClientTransactionId()Ljava/lang/String;

    move-result-object v28

    move-object/from16 v0, v28

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v28

    if-eqz v28, :cond_9

    .line 924
    check-cast v27, Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;

    .end local v27    # "transaction":Lcom/getjar/sdk/comm/persistence/TransactionBucket;
    invoke-virtual/range {v27 .. v27}, Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;->getState()Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    move-result-object v28

    sget-object v29, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->DONE:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    invoke-virtual/range {v28 .. v29}, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->equals(Ljava/lang/Object;)Z

    move-result v8

    .line 925
    goto/16 :goto_2

    .line 913
    .end local v6    # "continuationToken":Ljava/lang/String;
    .end local v14    # "i$":Ljava/util/Iterator;
    .end local v15    # "ownedItems":Landroid/os/Bundle;
    .end local v16    # "processedTransactions":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/comm/persistence/TransactionBucket;>;"
    .end local v24    # "response":I
    .local v11, "e":Landroid/os/RemoteException;
    .restart local v12    # "futureState":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;>;"
    :cond_a
    const/4 v8, 0x0

    goto/16 :goto_2

    .line 915
    :catch_5
    move-exception v11

    .line 916
    .local v11, "e":Ljava/lang/Exception;
    sget-object v28, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v28 .. v28}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v28

    sget-object v30, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v30 .. v30}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v30

    or-long v28, v28, v30

    const-string v30, "Error getting current transaction state"

    move-wide/from16 v0, v28

    move-object/from16 v2, v30

    invoke-static {v0, v1, v2, v11}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_2

    .line 920
    .end local v12    # "futureState":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;>;"
    .local v11, "e":Landroid/os/RemoteException;
    :cond_b
    new-instance v28, Lcom/getjar/sdk/comm/TransactionManager;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    move-object/from16 v29, v0

    invoke-virtual/range {v29 .. v29}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v29

    invoke-direct/range {v28 .. v29}, Lcom/getjar/sdk/comm/TransactionManager;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    move-object/from16 v29, v0

    invoke-virtual/range {v28 .. v29}, Lcom/getjar/sdk/comm/TransactionManager;->runEarnAndManagedOfferTransactions(Lcom/getjar/sdk/comm/CommContext;)Ljava/util/List;

    move-result-object v16

    .line 921
    .restart local v16    # "processedTransactions":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/comm/persistence/TransactionBucket;>;"
    invoke-static {v7}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v28

    if-nez v28, :cond_4

    .line 922
    invoke-interface/range {v16 .. v16}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v14

    .restart local v14    # "i$":Ljava/util/Iterator;
    :cond_c
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v28

    if-eqz v28, :cond_4

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v27

    check-cast v27, Lcom/getjar/sdk/comm/persistence/TransactionBucket;

    .line 923
    .restart local v27    # "transaction":Lcom/getjar/sdk/comm/persistence/TransactionBucket;
    invoke-virtual/range {v27 .. v27}, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->getClientTransactionId()Ljava/lang/String;

    move-result-object v28

    move-object/from16 v0, v28

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v28

    if-eqz v28, :cond_c

    .line 924
    check-cast v27, Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;

    .end local v27    # "transaction":Lcom/getjar/sdk/comm/persistence/TransactionBucket;
    invoke-virtual/range {v27 .. v27}, Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;->getState()Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    move-result-object v28

    sget-object v29, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->DONE:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    invoke-virtual/range {v28 .. v29}, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->equals(Ljava/lang/Object;)Z

    move-result v8

    .line 925
    goto/16 :goto_2

    .line 904
    .end local v7    # "currentClientTransactionId":Ljava/lang/String;
    .end local v11    # "e":Landroid/os/RemoteException;
    .end local v14    # "i$":Ljava/util/Iterator;
    .end local v16    # "processedTransactions":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/comm/persistence/TransactionBucket;>;"
    :catchall_1
    move-exception v28

    invoke-virtual/range {p0 .. p0}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->getCurrentClientTransactionId()Ljava/lang/String;

    move-result-object v7

    .line 906
    .restart local v7    # "currentClientTransactionId":Ljava/lang/String;
    if-eqz p1, :cond_f

    .line 907
    invoke-static {v7}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v29

    if-nez v29, :cond_d

    .line 908
    new-instance v29, Lcom/getjar/sdk/comm/TransactionManager;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    move-object/from16 v30, v0

    invoke-virtual/range {v30 .. v30}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v30

    invoke-direct/range {v29 .. v30}, Lcom/getjar/sdk/comm/TransactionManager;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    move-object/from16 v30, v0

    move-object/from16 v0, v29

    move-object/from16 v1, v30

    invoke-virtual {v0, v7, v1}, Lcom/getjar/sdk/comm/TransactionManager;->runManagedOfferTransaction(Ljava/lang/String;Lcom/getjar/sdk/comm/CommContext;)Ljava/util/concurrent/Future;

    move-result-object v12

    .line 910
    .restart local v12    # "futureState":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;>;"
    :try_start_a
    invoke-interface {v12}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    move-result-object v29

    if-eqz v29, :cond_e

    .line 911
    sget-object v29, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->DONE:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    invoke-interface {v12}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    move-result-object v30

    invoke-virtual/range {v29 .. v30}, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->equals(Ljava/lang/Object;)Z
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_6

    move-result v8

    .line 930
    .end local v12    # "futureState":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;>;"
    :cond_d
    :goto_3
    throw v28

    .line 913
    .restart local v12    # "futureState":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;>;"
    :cond_e
    const/4 v8, 0x0

    goto :goto_3

    .line 915
    :catch_6
    move-exception v11

    .line 916
    .local v11, "e":Ljava/lang/Exception;
    sget-object v29, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v29 .. v29}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v29

    sget-object v31, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v31 .. v31}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v31

    or-long v29, v29, v31

    const-string v31, "Error getting current transaction state"

    move-wide/from16 v0, v29

    move-object/from16 v2, v31

    invoke-static {v0, v1, v2, v11}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_3

    .line 920
    .end local v11    # "e":Ljava/lang/Exception;
    .end local v12    # "futureState":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;>;"
    :cond_f
    new-instance v29, Lcom/getjar/sdk/comm/TransactionManager;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    move-object/from16 v30, v0

    invoke-virtual/range {v30 .. v30}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v30

    invoke-direct/range {v29 .. v30}, Lcom/getjar/sdk/comm/TransactionManager;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    move-object/from16 v30, v0

    invoke-virtual/range {v29 .. v30}, Lcom/getjar/sdk/comm/TransactionManager;->runEarnAndManagedOfferTransactions(Lcom/getjar/sdk/comm/CommContext;)Ljava/util/List;

    move-result-object v16

    .line 921
    .restart local v16    # "processedTransactions":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/comm/persistence/TransactionBucket;>;"
    invoke-static {v7}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v29

    if-nez v29, :cond_d

    .line 922
    invoke-interface/range {v16 .. v16}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v14

    .restart local v14    # "i$":Ljava/util/Iterator;
    :cond_10
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v29

    if-eqz v29, :cond_d

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v27

    check-cast v27, Lcom/getjar/sdk/comm/persistence/TransactionBucket;

    .line 923
    .restart local v27    # "transaction":Lcom/getjar/sdk/comm/persistence/TransactionBucket;
    invoke-virtual/range {v27 .. v27}, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->getClientTransactionId()Ljava/lang/String;

    move-result-object v29

    move-object/from16 v0, v29

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v29

    if-eqz v29, :cond_10

    .line 924
    check-cast v27, Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;

    .end local v27    # "transaction":Lcom/getjar/sdk/comm/persistence/TransactionBucket;
    invoke-virtual/range {v27 .. v27}, Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;->getState()Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    move-result-object v29

    sget-object v30, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->DONE:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    invoke-virtual/range {v29 .. v30}, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->equals(Ljava/lang/Object;)Z

    move-result v8

    .line 925
    goto :goto_3

    .line 932
    .end local v7    # "currentClientTransactionId":Ljava/lang/String;
    .end local v14    # "i$":Ljava/util/Iterator;
    .end local v16    # "processedTransactions":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/comm/persistence/TransactionBucket;>;"
    :cond_11
    sget-object v28, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v28 .. v28}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v28

    sget-object v30, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v30 .. v30}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v30

    or-long v28, v28, v30

    const-string v30, "Error processing outstanding purchases"

    invoke-static/range {v28 .. v30}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;)V

    goto/16 :goto_2
.end method

.method public removeLastClientTransactionId()V
    .locals 1

    .prologue
    .line 1005
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_currentClientTransactionId:Ljava/lang/String;

    .line 1006
    return-void
.end method

.method public removePurchaseResponse(Ljava/lang/String;)V
    .locals 2
    .param p1, "orderId"    # Ljava/lang/String;

    .prologue
    .line 403
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "orderId cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 405
    :cond_0
    iget-object v0, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_cachingManager:Lcom/getjar/sdk/data/CachingManager;

    invoke-virtual {v0, p1}, Lcom/getjar/sdk/data/CachingManager;->removeCacheEntry(Ljava/lang/String;)V

    .line 406
    return-void
.end method

.method protected requestPurchaseIntent(Ljava/lang/String;Ljava/lang/String;Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;)Landroid/app/PendingIntent;
    .locals 12
    .param p1, "marketplaceItemId"    # Ljava/lang/String;
    .param p2, "clientTransactionId"    # Ljava/lang/String;
    .param p3, "activity"    # Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    .prologue
    .line 597
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'marketplaceItemId\' cannot be null or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 598
    :cond_0
    invoke-static {p2}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'clientTransactionId\' cannot be null or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 599
    :cond_1
    if-nez p3, :cond_2

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Please set the activityContext first using setActivityContext"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 601
    :cond_2
    iget-object v0, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->googlePlayService:Lcom/getjar/sdk/vending/billing/IInAppBillingService;

    if-eqz v0, :cond_3

    iget-boolean v0, p3, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->_isForeground:Z

    if-eqz v0, :cond_3

    .line 603
    :try_start_0
    iget-object v0, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v0}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/getjar/sdk/comm/auth/ApplicationKeyDatabase;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/comm/auth/ApplicationKeyDatabase;

    move-result-object v0

    invoke-virtual {v0}, Lcom/getjar/sdk/comm/auth/ApplicationKeyDatabase;->getApplicationKey()Ljava/lang/String;

    move-result-object v6

    .line 604
    .local v6, "applicationKey":Ljava/lang/String;
    iget-object v0, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v0}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/getjar/sdk/comm/auth/AuthManager;->initialize(Landroid/content/Context;)V

    .line 605
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/getjar/sdk/comm/auth/AuthManager;->getUserDeviceId()Ljava/lang/String;

    move-result-object v8

    .line 606
    .local v8, "deviceId":Ljava/lang/String;
    iget-object v0, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->googlePlayService:Lcom/getjar/sdk/vending/billing/IInAppBillingService;

    const/4 v1, 0x3

    invoke-virtual {p3}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->getParentActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    const-string v4, "inapp"

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "%1$s,%2$s,%3$s"

    const/4 v10, 0x3

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    aput-object p2, v10, v11

    const/4 v11, 0x1

    aput-object v6, v10, v11

    const/4 v11, 0x2

    aput-object v8, v10, v11

    invoke-static {v3, v5, v10}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    move-object v3, p1

    invoke-interface/range {v0 .. v5}, Lcom/getjar/sdk/vending/billing/IInAppBillingService;->getBuyIntent(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v7

    .line 613
    .local v7, "buyIntentBundle":Landroid/os/Bundle;
    const-string v0, "BUY_INTENT"

    invoke-virtual {v7, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/app/PendingIntent;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 622
    .end local v6    # "applicationKey":Ljava/lang/String;
    .end local v7    # "buyIntentBundle":Landroid/os/Bundle;
    .end local v8    # "deviceId":Ljava/lang/String;
    :goto_0
    return-object v0

    .line 615
    :catch_0
    move-exception v9

    .line 616
    .local v9, "e":Landroid/os/RemoteException;
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->isGooglePlayConnected:Z

    .line 617
    sget-object v0, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    const-string v2, "Purchase failed"

    invoke-static {v0, v1, v2, v9}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 622
    .end local v9    # "e":Landroid/os/RemoteException;
    :goto_1
    const/4 v0, 0x0

    goto :goto_0

    .line 620
    :cond_3
    new-instance v0, Lcom/getjar/sdk/comm/TransactionManager;

    iget-object v1, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v1}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/getjar/sdk/comm/TransactionManager;-><init>(Landroid/content/Context;)V

    iget-object v1, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v0, p2, v1}, Lcom/getjar/sdk/comm/TransactionManager;->cancelManagedOfferTransaction(Ljava/lang/String;Lcom/getjar/sdk/comm/CommContext;)V

    goto :goto_1
.end method

.method protected reserveManagedOffer(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;Ljava/util/HashMap;Lcom/getjar/sdk/rewards/GetJarSubActivityBase;)Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;
    .locals 11
    .param p1, "clientTransactionId"    # Ljava/lang/String;
    .param p2, "offerId"    # Ljava/lang/String;
    .param p5, "activity"    # Lcom/getjar/sdk/rewards/GetJarSubActivityBase;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lcom/getjar/sdk/rewards/GetJarSubActivityBase;",
            ")",
            "Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;"
        }
    .end annotation

    .prologue
    .line 629
    .local p3, "purchaseMetadata":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .local p4, "trackingMetadata":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'clientTransactionId\' cannot be null or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 630
    :cond_0
    invoke-static {p2}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'offerId\' cannot be null or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 631
    :cond_1
    if-eqz p3, :cond_2

    invoke-virtual {p3}, Ljava/util/HashMap;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_3

    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'purchaseMetadata\' cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 632
    :cond_3
    if-eqz p4, :cond_4

    invoke-virtual {p4}, Ljava/util/HashMap;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_5

    :cond_4
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'trackingMetadata\' cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 634
    :cond_5
    if-nez p5, :cond_6

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'activity\' cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 636
    :cond_6
    sget-object v10, Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;->SUCCESS:Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;

    .line 638
    .local v10, "result":Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;
    new-instance v0, Lcom/getjar/sdk/comm/TransactionManager;

    iget-object v1, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v1}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/getjar/sdk/comm/TransactionManager;-><init>(Landroid/content/Context;)V

    iget-object v1, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-virtual/range {v0 .. v5}, Lcom/getjar/sdk/comm/TransactionManager;->startManagedOfferTransaction(Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;Ljava/util/HashMap;)Ljava/util/concurrent/Future;

    move-result-object v7

    .line 640
    .local v7, "futureOperation":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<Lcom/getjar/sdk/comm/Operation;>;"
    if-eqz v7, :cond_a

    .line 641
    :try_start_0
    invoke-interface {v7}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/getjar/sdk/comm/Operation;

    .line 642
    .local v8, "operation":Lcom/getjar/sdk/comm/Operation;
    if-eqz v8, :cond_9

    .line 643
    invoke-virtual {v8}, Lcom/getjar/sdk/comm/Operation;->get()Lcom/getjar/sdk/comm/Result;

    move-result-object v9

    .line 644
    .local v9, "operationResult":Lcom/getjar/sdk/comm/Result;
    if-nez v9, :cond_8

    .line 645
    sget-object v10, Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;->SERVER_ERROR:Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;

    .line 667
    .end local v8    # "operation":Lcom/getjar/sdk/comm/Operation;
    .end local v9    # "operationResult":Lcom/getjar/sdk/comm/Result;
    :cond_7
    :goto_0
    return-object v10

    .line 646
    .restart local v8    # "operation":Lcom/getjar/sdk/comm/Operation;
    .restart local v9    # "operationResult":Lcom/getjar/sdk/comm/Result;
    :cond_8
    invoke-virtual {v9}, Lcom/getjar/sdk/comm/Result;->isSuccessfulResponse()Z
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_2

    move-result v0

    if-nez v0, :cond_7

    .line 648
    :try_start_1
    invoke-virtual {v9}, Lcom/getjar/sdk/comm/Result;->getErrorResponseSubcode()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;->valueOf(Ljava/lang/String;)Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_1 .. :try_end_1} :catch_2

    move-result-object v10

    goto :goto_0

    .line 649
    :catch_0
    move-exception v6

    .line 650
    .local v6, "e":Ljava/lang/Exception;
    :try_start_2
    sget-object v10, Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;->SERVER_ERROR:Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;

    goto :goto_0

    .line 654
    .end local v6    # "e":Ljava/lang/Exception;
    .end local v9    # "operationResult":Lcom/getjar/sdk/comm/Result;
    :cond_9
    sget-object v10, Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;->SDK_INTERNAL_ERROR:Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;

    goto :goto_0

    .line 657
    .end local v8    # "operation":Lcom/getjar/sdk/comm/Operation;
    :cond_a
    sget-object v10, Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;->NOT_AUTHORIZED:Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_0

    .line 659
    :catch_1
    move-exception v6

    .line 660
    .local v6, "e":Ljava/lang/InterruptedException;
    sget-object v0, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    const-string v2, "Interrupted exception occured"

    invoke-static {v0, v1, v2, v6}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 661
    sget-object v10, Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;->SDK_INTERNAL_ERROR:Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;

    .line 665
    goto :goto_0

    .line 662
    .end local v6    # "e":Ljava/lang/InterruptedException;
    :catch_2
    move-exception v6

    .line 663
    .local v6, "e":Ljava/util/concurrent/ExecutionException;
    sget-object v0, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    const-string v2, "Execution exception occured"

    invoke-static {v0, v1, v2, v6}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 664
    sget-object v10, Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;->SDK_INTERNAL_ERROR:Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;

    goto :goto_0
.end method

.method protected setCurrentClientTransactionId(Ljava/lang/String;)V
    .locals 2
    .param p1, "clientTransactionId"    # Ljava/lang/String;

    .prologue
    .line 995
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "clientTransactionId cannot be null or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 997
    :cond_0
    iput-object p1, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_currentClientTransactionId:Ljava/lang/String;

    .line 998
    return-void
.end method

.method storePurchaseResponse(Lcom/getjar/sdk/data/GooglePurchaseResponse;)V
    .locals 7
    .param p1, "purchaseResponse"    # Lcom/getjar/sdk/data/GooglePurchaseResponse;

    .prologue
    .line 383
    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "purchaseReponse cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 386
    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_cachingManager:Lcom/getjar/sdk/data/CachingManager;

    invoke-virtual {p1}, Lcom/getjar/sdk/data/GooglePurchaseResponse;->getOrderId()Ljava/lang/String;

    move-result-object v1

    invoke-static {p1}, Lcom/getjar/sdk/utilities/Base64;->encodeObject(Ljava/io/Serializable;)Ljava/lang/String;

    move-result-object v2

    const-wide/32 v3, 0x5265c00

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Lcom/getjar/sdk/data/CachingManager;->updateCache(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/String;Ljava/net/URI;)V

    .line 392
    iget-object v0, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_cachingManager:Lcom/getjar/sdk/data/CachingManager;

    const/16 v1, 0x1f4

    invoke-virtual {v0, v1}, Lcom/getjar/sdk/data/CachingManager;->trimLruEntries(I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 396
    :goto_0
    return-void

    .line 393
    :catch_0
    move-exception v6

    .line 394
    .local v6, "e":Ljava/io/IOException;
    sget-object v0, Lcom/getjar/sdk/logging/Area;->BUY_GOLD:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    const-string v2, "InAppPurchaseManager storePurchaseResponse -- Problem serializing purchaseResponse"

    invoke-static {v0, v1, v2, v6}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method protected unBindFromGooglePlaySvc()V
    .locals 5

    .prologue
    .line 498
    iget-object v1, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->googlePlayServiceConnection:Lcom/getjar/sdk/rewards/InAppPurchaseManager$GooglePlayServiceConnection;

    if-eqz v1, :cond_0

    .line 499
    sget-object v1, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "Unbinding from google play"

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    .line 501
    :try_start_0
    iget-object v1, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->_applicationContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->googlePlayServiceConnection:Lcom/getjar/sdk/rewards/InAppPurchaseManager$GooglePlayServiceConnection;

    invoke-virtual {v1, v2}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 506
    :cond_0
    :goto_0
    return-void

    .line 502
    :catch_0
    move-exception v0

    .line 503
    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "Exception while unbinding..."

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;)V

    goto :goto_0
.end method
