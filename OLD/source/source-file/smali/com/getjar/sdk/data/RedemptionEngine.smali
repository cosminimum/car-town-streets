.class public Lcom/getjar/sdk/data/RedemptionEngine;
.super Ljava/lang/Object;
.source "RedemptionEngine.java"


# static fields
.field public static final IntentTypeDealRedemption:Ljava/lang/String; = "redeemDeal"

.field public static final IntentTypeKey:Ljava/lang/String; = "getjarIntentType"

.field public static final IntentTypeShowCheckout:Ljava/lang/String; = "showCheckout"

.field public static final IntentTypeShowWallet:Ljava/lang/String; = "showWallet"

.field public static final IntentVoucherTokenKey:Ljava/lang/String; = "voucherToken"

.field public static final TestVoucherConsumableSuccess:Ljava/lang/String; = "00000000-0000-0000-0000-000000000001"

.field public static final TestVoucherGeneralFailure:Ljava/lang/String; = "00000000-0000-0000-0000-000000000003"

.field public static final TestVoucherInvalidVoucherFailure:Ljava/lang/String; = "00000000-0000-0000-0000-000000000004"

.field public static final TestVoucherLicensableSuccess:Ljava/lang/String; = "00000000-0000-0000-0000-000000000002"

.field public static final TestVoucherNetworkFailure:Ljava/lang/String; = "00000000-0000-0000-0000-000000000005"

.field private static final _ExecutorService:Ljava/util/concurrent/ExecutorService;


# instance fields
.field private final _applicationToken:Ljava/lang/String;

.field private final _context:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 65
    invoke-static {}, Ljava/util/concurrent/Executors;->newCachedThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lcom/getjar/sdk/data/RedemptionEngine;->_ExecutorService:Ljava/util/concurrent/ExecutorService;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Landroid/content/Context;)V
    .locals 2
    .param p1, "applicationToken"    # Ljava/lang/String;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 75
    if-nez p2, :cond_0

    .line 76
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'context\' cannot be NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 78
    :cond_0
    iput-object p1, p0, Lcom/getjar/sdk/data/RedemptionEngine;->_applicationToken:Ljava/lang/String;

    .line 79
    iput-object p2, p0, Lcom/getjar/sdk/data/RedemptionEngine;->_context:Landroid/content/Context;

    .line 80
    return-void
.end method

.method static synthetic access$000(Lcom/getjar/sdk/data/RedemptionEngine;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/getjar/sdk/data/RedemptionEngine;

    .prologue
    .line 50
    iget-object v0, p0, Lcom/getjar/sdk/data/RedemptionEngine;->_applicationToken:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$100(Lcom/getjar/sdk/data/RedemptionEngine;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/getjar/sdk/data/RedemptionEngine;

    .prologue
    .line 50
    iget-object v0, p0, Lcom/getjar/sdk/data/RedemptionEngine;->_context:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$200(Lcom/getjar/sdk/data/RedemptionEngine;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)Z
    .locals 1
    .param p0, "x0"    # Lcom/getjar/sdk/data/RedemptionEngine;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Ljava/lang/String;
    .param p3, "x3"    # Ljava/util/List;

    .prologue
    .line 50
    invoke-direct {p0, p1, p2, p3}, Lcom/getjar/sdk/data/RedemptionEngine;->handleTestVouchers(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$300(Lcom/getjar/sdk/data/RedemptionEngine;Lcom/getjar/sdk/comm/Result;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/getjar/sdk/data/RedemptionEngine;
    .param p1, "x1"    # Lcom/getjar/sdk/comm/Result;

    .prologue
    .line 50
    invoke-direct {p0, p1}, Lcom/getjar/sdk/data/RedemptionEngine;->getDeveloperProductId(Lcom/getjar/sdk/comm/Result;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$400(Lcom/getjar/sdk/data/RedemptionEngine;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V
    .locals 0
    .param p0, "x0"    # Lcom/getjar/sdk/data/RedemptionEngine;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Ljava/lang/String;
    .param p3, "x3"    # Ljava/lang/String;
    .param p4, "x4"    # Ljava/lang/String;
    .param p5, "x5"    # Ljava/util/List;

    .prologue
    .line 50
    invoke-direct/range {p0 .. p5}, Lcom/getjar/sdk/data/RedemptionEngine;->makeSuccessCallbacks(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V

    return-void
.end method

.method static synthetic access$500(Lcom/getjar/sdk/data/RedemptionEngine;Ljava/lang/String;Lcom/getjar/sdk/listener/VoucherRedemptionListener$FailureReason;Ljava/util/List;)V
    .locals 0
    .param p0, "x0"    # Lcom/getjar/sdk/data/RedemptionEngine;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Lcom/getjar/sdk/listener/VoucherRedemptionListener$FailureReason;
    .param p3, "x3"    # Ljava/util/List;

    .prologue
    .line 50
    invoke-direct {p0, p1, p2, p3}, Lcom/getjar/sdk/data/RedemptionEngine;->makeFailureCallbacks(Ljava/lang/String;Lcom/getjar/sdk/listener/VoucherRedemptionListener$FailureReason;Ljava/util/List;)V

    return-void
.end method

.method public static buildRedeemVoucherIntent(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)Landroid/content/Intent;
    .locals 9
    .param p0, "packageName"    # Ljava/lang/String;
    .param p1, "voucherToken"    # Ljava/lang/String;
    .param p2, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;,
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x0

    const/4 v7, 0x1

    .line 113
    sget-object v2, Lcom/getjar/sdk/logging/Area;->REDEEM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    const-string v4, "RedemptionEngine: buildRedeemVoucherIntent() START"

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 116
    if-nez p2, :cond_0

    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "\'context\' cannot be NULL"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 117
    :cond_0
    invoke-static {p0}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "\'packageName\' cannot be NULL or empty"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 118
    :cond_1
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "\'voucherToken\' cannot be NULL or empty"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 119
    :cond_2
    invoke-static {p1}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    .line 122
    invoke-virtual {p2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    .line 123
    .local v0, "packageManager":Landroid/content/pm/PackageManager;
    invoke-virtual {v0, p0}, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v1

    .line 124
    .local v1, "redeemIntent":Landroid/content/Intent;
    if-nez v1, :cond_3

    .line 127
    new-instance v2, Ljava/lang/IllegalArgumentException;

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "The package name \'%1$s\' is not installed"

    new-array v5, v7, [Ljava/lang/Object;

    aput-object p0, v5, v8

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 130
    :cond_3
    sget-object v2, Lcom/getjar/sdk/logging/Area;->REDEEM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "RedemptionEngine: buildRedeemVoucherIntent() [packageName:%1$s voucherToken:%2$s]"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    aput-object p0, v6, v8

    aput-object p1, v6, v7

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 136
    const-string v2, "getjar"

    invoke-virtual {v1, v2, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 137
    const-string v2, "getjarIntentType"

    const-string v3, "redeemDeal"

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 138
    const-string v2, "voucherToken"

    invoke-virtual {v1, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 139
    const-string v2, "auth.provider_filter.name"

    const-string v3, "android_account"

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 140
    const-string v2, "auth.provider_filter.data"

    invoke-static {p2}, Lcom/getjar/sdk/data/RedemptionEngine;->getProviderFilterJson(Landroid/content/Context;)Lorg/json/JSONArray;

    move-result-object v3

    invoke-virtual {v3}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 141
    const/high16 v2, 0x34a00000

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 143
    sget-object v2, Lcom/getjar/sdk/logging/Area;->REDEEM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    const-string v4, "RedemptionEngine: buildRedeemVoucherIntent() FINISH"

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 144
    return-object v1
.end method

.method public static buildShowWalletIntent(Landroid/content/Context;)Landroid/content/Intent;
    .locals 4
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 84
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    .line 85
    .local v1, "packageManager":Landroid/content/pm/PackageManager;
    const-string v2, "com.getjar.rewards"

    invoke-virtual {v1, v2}, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    .line 86
    .local v0, "launchIntent":Landroid/content/Intent;
    if-nez v0, :cond_0

    .line 89
    const/4 v0, 0x0

    .line 97
    .end local v0    # "launchIntent":Landroid/content/Intent;
    :goto_0
    return-object v0

    .line 93
    .restart local v0    # "launchIntent":Landroid/content/Intent;
    :cond_0
    const-string v2, "getjar"

    const/4 v3, 0x1

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 94
    const-string v2, "getjarIntentType"

    const-string v3, "showWallet"

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 95
    const-string v2, "android.intent.category.LAUNCHER"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 96
    const/high16 v2, 0x34200000

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    goto :goto_0
.end method

.method private getDeveloperProductId(Lcom/getjar/sdk/comm/Result;)Ljava/lang/String;
    .locals 6
    .param p1, "result"    # Lcom/getjar/sdk/comm/Result;

    .prologue
    .line 520
    if-eqz p1, :cond_0

    .line 521
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/Result;->getSignedPayloadObject()Lorg/json/JSONObject;

    move-result-object v1

    .line 522
    .local v1, "signedPayload":Lorg/json/JSONObject;
    if-eqz v1, :cond_0

    const-string v2, "developer_product_id"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 524
    :try_start_0
    const-string v2, "developer_product_id"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 530
    .end local v1    # "signedPayload":Lorg/json/JSONObject;
    :goto_0
    return-object v2

    .line 525
    .restart local v1    # "signedPayload":Lorg/json/JSONObject;
    :catch_0
    move-exception v0

    .line 526
    .local v0, "e":Lorg/json/JSONException;
    sget-object v2, Lcom/getjar/sdk/logging/Area;->REDEEM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    const-string v4, "Unable to get a string value for \'developer_product_id\'"

    invoke-static {v2, v3, v4, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 530
    .end local v0    # "e":Lorg/json/JSONException;
    .end local v1    # "signedPayload":Lorg/json/JSONObject;
    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public static getProviderFilterJson(Landroid/content/Context;)Lorg/json/JSONArray;
    .locals 14
    .param p0, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;,
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .prologue
    .line 150
    invoke-static {p0}, Lcom/getjar/sdk/comm/auth/AuthManager;->initialize(Landroid/content/Context;)V

    .line 151
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v8

    invoke-virtual {v8}, Lcom/getjar/sdk/comm/auth/AuthManager;->isAuthed()Z

    move-result v8

    if-nez v8, :cond_0

    .line 152
    new-instance v8, Lcom/getjar/sdk/exceptions/AuthException;

    const-string v9, "Must already be authed to call \'buildRedeemVoucherIntent()\'"

    invoke-direct {v8, v9}, Lcom/getjar/sdk/exceptions/AuthException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 162
    :cond_0
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v8

    invoke-virtual {v8}, Lcom/getjar/sdk/comm/auth/AuthManager;->getUserAuthProviderFilter()Ljava/lang/String;

    move-result-object v6

    .line 163
    .local v6, "userAuthProviderFilter":Ljava/lang/String;
    const-string v8, "android_account"

    invoke-virtual {v8, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_2

    .line 164
    invoke-static {v6}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_1

    .line 165
    new-instance v8, Lcom/getjar/sdk/exceptions/AuthException;

    const-string v9, "Can only call \'buildRedeemVoucherIntent()\' when authed via the \'android_account\' user auth provider"

    invoke-direct {v8, v9}, Lcom/getjar/sdk/exceptions/AuthException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 167
    :cond_1
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v8

    const-string v9, "android_account"

    invoke-virtual {v8, v9}, Lcom/getjar/sdk/comm/auth/AuthManager;->fixUpgradedMissingUserAuthProviderFilter(Ljava/lang/String;)V

    .line 172
    :cond_2
    const/4 v0, 0x0

    .line 173
    .local v0, "hashedAccountName":Ljava/lang/String;
    new-instance v5, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;

    invoke-direct {v5}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;-><init>()V

    .line 174
    .local v5, "userAuthProvider":Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;
    invoke-virtual {v5, p0}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;->getProxiableAuthData(Landroid/content/Context;)Ljava/util/Map;

    move-result-object v1

    .line 175
    .local v1, "hashedAuthData":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz v1, :cond_3

    .line 176
    const-string v8, "android_account.username_data_hash"

    invoke-interface {v1, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "hashedAccountName":Ljava/lang/String;
    check-cast v0, Ljava/lang/String;

    .line 178
    .restart local v0    # "hashedAccountName":Ljava/lang/String;
    :cond_3
    invoke-static {v0}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_4

    new-instance v8, Lcom/getjar/sdk/exceptions/AuthException;

    const-string v9, "Failed to get hashed provider data"

    invoke-direct {v8, v9}, Lcom/getjar/sdk/exceptions/AuthException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 180
    :cond_4
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v8

    invoke-virtual {v8}, Lcom/getjar/sdk/comm/auth/AuthManager;->getUserDeviceId()Ljava/lang/String;

    move-result-object v7

    .line 181
    .local v7, "userDeviceId":Ljava/lang/String;
    sget-object v8, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v7, v8}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lcom/getjar/sdk/utilities/CryptoUtility;->getSHA256(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 183
    .local v2, "hashedUserDeviceId":Ljava/lang/String;
    sget-object v8, Lcom/getjar/sdk/logging/Area;->REDEEM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v8}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v8

    sget-object v10, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v10}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v10

    or-long/2addr v8, v10

    sget-object v10, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v11, "RedemptionEngine: buildRedeemVoucherIntent() [hashedAccountName:%1$s userDeviceId:%2$s hashedUserDeviceId:%3$s]"

    const/4 v12, 0x3

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    aput-object v0, v12, v13

    const/4 v13, 0x1

    aput-object v7, v12, v13

    const/4 v13, 0x2

    aput-object v2, v12, v13

    invoke-static {v10, v11, v12}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v8, v9, v10}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 190
    new-instance v4, Lorg/json/JSONArray;

    invoke-direct {v4}, Lorg/json/JSONArray;-><init>()V

    .line 192
    .local v4, "providerFilterDataJson":Lorg/json/JSONArray;
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 193
    .local v3, "keyValuePairJson":Lorg/json/JSONObject;
    const-string v8, "key"

    const-string v9, "android_account.username_data_hash"

    invoke-virtual {v3, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 194
    const-string v8, "value"

    invoke-virtual {v3, v8, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 195
    invoke-virtual {v4, v3}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 197
    new-instance v3, Lorg/json/JSONObject;

    .end local v3    # "keyValuePairJson":Lorg/json/JSONObject;
    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 198
    .restart local v3    # "keyValuePairJson":Lorg/json/JSONObject;
    const-string v8, "key"

    const-string v9, "android_account.user_device_hash"

    invoke-virtual {v3, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 199
    const-string v8, "value"

    invoke-virtual {v3, v8, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 200
    invoke-virtual {v4, v3}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 202
    return-object v4
.end method

.method private handleTestVouchers(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)Z
    .locals 7
    .param p1, "workId"    # Ljava/lang/String;
    .param p2, "voucherToken"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lcom/getjar/sdk/listener/VoucherRedemptionListener;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .local p3, "callbacks":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/listener/VoucherRedemptionListener;>;"
    const/4 v6, 0x1

    .line 562
    const-string v0, "00000000-0000-0000-0000-000000000001"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 563
    const-string v2, "getjar.test.consumable"

    const-string v3, "signedPayload"

    const-string v4, "signature"

    move-object v0, p0

    move-object v1, p1

    move-object v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/getjar/sdk/data/RedemptionEngine;->makeSuccessCallbacks(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V

    move v0, v6

    .line 578
    :goto_0
    return v0

    .line 565
    :cond_0
    const-string v0, "00000000-0000-0000-0000-000000000002"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 566
    const-string v2, "getjar.test.licensable"

    const-string v3, "signedPayload"

    const-string v4, "signature"

    move-object v0, p0

    move-object v1, p1

    move-object v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/getjar/sdk/data/RedemptionEngine;->makeSuccessCallbacks(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V

    move v0, v6

    .line 567
    goto :goto_0

    .line 568
    :cond_1
    const-string v0, "00000000-0000-0000-0000-000000000003"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 569
    sget-object v0, Lcom/getjar/sdk/listener/VoucherRedemptionListener$FailureReason;->GENERAL:Lcom/getjar/sdk/listener/VoucherRedemptionListener$FailureReason;

    invoke-direct {p0, p1, v0, p3}, Lcom/getjar/sdk/data/RedemptionEngine;->makeFailureCallbacks(Ljava/lang/String;Lcom/getjar/sdk/listener/VoucherRedemptionListener$FailureReason;Ljava/util/List;)V

    move v0, v6

    .line 570
    goto :goto_0

    .line 571
    :cond_2
    const-string v0, "00000000-0000-0000-0000-000000000004"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 572
    sget-object v0, Lcom/getjar/sdk/listener/VoucherRedemptionListener$FailureReason;->INVALID_VOUCHER:Lcom/getjar/sdk/listener/VoucherRedemptionListener$FailureReason;

    invoke-direct {p0, p1, v0, p3}, Lcom/getjar/sdk/data/RedemptionEngine;->makeFailureCallbacks(Ljava/lang/String;Lcom/getjar/sdk/listener/VoucherRedemptionListener$FailureReason;Ljava/util/List;)V

    move v0, v6

    .line 573
    goto :goto_0

    .line 574
    :cond_3
    const-string v0, "00000000-0000-0000-0000-000000000005"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 575
    sget-object v0, Lcom/getjar/sdk/listener/VoucherRedemptionListener$FailureReason;->NETWORK:Lcom/getjar/sdk/listener/VoucherRedemptionListener$FailureReason;

    invoke-direct {p0, p1, v0, p3}, Lcom/getjar/sdk/data/RedemptionEngine;->makeFailureCallbacks(Ljava/lang/String;Lcom/getjar/sdk/listener/VoucherRedemptionListener$FailureReason;Ljava/util/List;)V

    move v0, v6

    .line 576
    goto :goto_0

    .line 578
    :cond_4
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private makeFailureCallbacks(Ljava/lang/String;Lcom/getjar/sdk/listener/VoucherRedemptionListener$FailureReason;Ljava/util/List;)V
    .locals 11
    .param p1, "workId"    # Ljava/lang/String;
    .param p2, "reason"    # Lcom/getjar/sdk/listener/VoucherRedemptionListener$FailureReason;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/getjar/sdk/listener/VoucherRedemptionListener$FailureReason;",
            "Ljava/util/List",
            "<",
            "Lcom/getjar/sdk/listener/VoucherRedemptionListener;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p3, "callbacks":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/listener/VoucherRedemptionListener;>;"
    const/4 v10, 0x1

    const/4 v9, 0x0

    .line 547
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/getjar/sdk/listener/VoucherRedemptionListener;

    .line 549
    .local v0, "callback":Lcom/getjar/sdk/listener/VoucherRedemptionListener;
    :try_start_0
    sget-object v3, Lcom/getjar/sdk/logging/Area;->REDEEM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "RedemptionEngine: making callback.redeemFailed() [%1$s]"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object p1, v7, v8

    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 550
    invoke-interface {v0, p1, p2}, Lcom/getjar/sdk/listener/VoucherRedemptionListener;->redeemFailed(Ljava/lang/String;Lcom/getjar/sdk/listener/VoucherRedemptionListener$FailureReason;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 551
    :catch_0
    move-exception v1

    .line 552
    .local v1, "ce":Ljava/lang/Exception;
    sget-object v3, Lcom/getjar/sdk/logging/Area;->REDEEM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "RedemptionEngine: callback.redeemFailed() failed [%1$s]"

    new-array v7, v10, [Ljava/lang/Object;

    aput-object p1, v7, v9

    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5, v1}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 555
    .end local v0    # "callback":Lcom/getjar/sdk/listener/VoucherRedemptionListener;
    .end local v1    # "ce":Ljava/lang/Exception;
    :cond_0
    return-void
.end method

.method private makeSuccessCallbacks(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V
    .locals 9
    .param p1, "workId"    # Ljava/lang/String;
    .param p2, "productId"    # Ljava/lang/String;
    .param p3, "signedPayload"    # Ljava/lang/String;
    .param p4, "signature"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lcom/getjar/sdk/listener/VoucherRedemptionListener;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 535
    .local p5, "callbacks":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/listener/VoucherRedemptionListener;>;"
    invoke-interface {p5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/getjar/sdk/listener/VoucherRedemptionListener;

    .line 537
    .local v0, "callback":Lcom/getjar/sdk/listener/VoucherRedemptionListener;
    :try_start_0
    sget-object v3, Lcom/getjar/sdk/logging/Area;->REDEEM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "RedemptionEngine: making callback.redeemSucceeded() [%1$s]"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object p1, v7, v8

    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 538
    invoke-interface {v0, p1, p2, p3, p4}, Lcom/getjar/sdk/listener/VoucherRedemptionListener;->redeemSucceeded(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 539
    :catch_0
    move-exception v1

    .line 540
    .local v1, "ce":Ljava/lang/Exception;
    sget-object v3, Lcom/getjar/sdk/logging/Area;->REDEEM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "RedemptionEngine: callback.redeemSucceeded() failed [%1$s]"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object p1, v7, v8

    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5, v1}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 543
    .end local v0    # "callback":Lcom/getjar/sdk/listener/VoucherRedemptionListener;
    .end local v1    # "ce":Ljava/lang/Exception;
    :cond_0
    return-void
.end method

.method public static showCheckoutPage(Lcom/getjar/sdk/GetJarContext;Landroid/content/Intent;)V
    .locals 12
    .param p0, "getJarContext"    # Lcom/getjar/sdk/GetJarContext;
    .param p1, "receivedIntent"    # Landroid/content/Intent;

    .prologue
    .line 228
    if-nez p0, :cond_0

    new-instance v8, Ljava/lang/IllegalArgumentException;

    const-string v9, "\'getJarContext\' cannot be NULL"

    invoke-direct {v8, v9}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 229
    :cond_0
    if-nez p1, :cond_1

    new-instance v8, Ljava/lang/IllegalArgumentException;

    const-string v9, "\'receivedIntent\' cannot be NULL"

    invoke-direct {v8, v9}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 231
    :cond_1
    const-string v8, "getjar"

    const/4 v9, 0x0

    invoke-virtual {p1, v8, v9}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v8

    if-nez v8, :cond_2

    .line 232
    new-instance v8, Ljava/lang/IllegalArgumentException;

    const-string v9, "showCheckoutPage() called with a non-Getjar Intent"

    invoke-direct {v8, v9}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 234
    :cond_2
    const-string v8, "showCheckout"

    const-string v9, "getjarIntentType"

    invoke-virtual {p1, v9}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_3

    .line 235
    new-instance v8, Ljava/lang/IllegalArgumentException;

    const-string v9, "showCheckoutPage() called with an non-checkout Intent"

    invoke-direct {v8, v9}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 239
    :cond_3
    const-string v8, "EXTRA_MANAGED_CHECKOUT_DATA"

    invoke-virtual {p1, v8}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 240
    .local v3, "managedOfferDetails":Ljava/lang/String;
    invoke-static {v3}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_4

    .line 241
    new-instance v8, Ljava/lang/IllegalArgumentException;

    const-string v9, "showCheckoutPage() called with an Intent that has no checkout data"

    invoke-direct {v8, v9}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 245
    :cond_4
    const/4 v7, 0x0

    .line 247
    .local v7, "tempAccountNameHash":Ljava/lang/String;
    :try_start_0
    const-string v8, "auth.provider_filter.data"

    invoke-virtual {p1, v8}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 248
    .local v5, "providerFilterData":Ljava/lang/String;
    new-instance v4, Lorg/json/JSONArray;

    invoke-direct {v4, v5}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 249
    .local v4, "providerDataJson":Lorg/json/JSONArray;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v8

    if-ge v2, v8, :cond_5

    .line 250
    invoke-virtual {v4, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v0

    .line 251
    .local v0, "currentKeyValueJson":Lorg/json/JSONObject;
    const-string v8, "android_account.username_data_hash"

    const-string v9, "key"

    invoke-virtual {v0, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_6

    .line 252
    const-string v8, "value"

    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v7

    .line 259
    .end local v0    # "currentKeyValueJson":Lorg/json/JSONObject;
    .end local v2    # "i":I
    .end local v4    # "providerDataJson":Lorg/json/JSONArray;
    .end local v5    # "providerFilterData":Ljava/lang/String;
    :cond_5
    :goto_1
    move-object v6, v7

    .line 260
    .local v6, "targetAccountNameHash":Ljava/lang/String;
    invoke-static {v6}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_7

    .line 261
    new-instance v8, Ljava/lang/IllegalArgumentException;

    const-string v9, "showCheckoutPage() called with an Intent that has no account name hash"

    invoke-direct {v8, v9}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 249
    .end local v6    # "targetAccountNameHash":Ljava/lang/String;
    .restart local v0    # "currentKeyValueJson":Lorg/json/JSONObject;
    .restart local v2    # "i":I
    .restart local v4    # "providerDataJson":Lorg/json/JSONArray;
    .restart local v5    # "providerFilterData":Ljava/lang/String;
    :cond_6
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 256
    .end local v0    # "currentKeyValueJson":Lorg/json/JSONObject;
    .end local v2    # "i":I
    .end local v4    # "providerDataJson":Lorg/json/JSONArray;
    .end local v5    # "providerFilterData":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 257
    .local v1, "e":Ljava/lang/Exception;
    sget-object v8, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v8}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v8

    sget-object v10, Lcom/getjar/sdk/logging/Area;->PURCHASE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v10}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v10

    or-long/2addr v8, v10

    sget-object v10, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v10}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v10

    or-long/2addr v8, v10

    const-string v10, "RedemptionEngine: showCheckoutPage() failed"

    invoke-static {v8, v9, v10, v1}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 265
    .end local v1    # "e":Ljava/lang/Exception;
    .restart local v6    # "targetAccountNameHash":Ljava/lang/String;
    :cond_7
    sget-object v8, Lcom/getjar/sdk/data/RedemptionEngine;->_ExecutorService:Ljava/util/concurrent/ExecutorService;

    new-instance v9, Lcom/getjar/sdk/data/RedemptionEngine$1;

    invoke-direct {v9, p0, v6, v3}, Lcom/getjar/sdk/data/RedemptionEngine$1;-><init>(Lcom/getjar/sdk/GetJarContext;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v8, v9}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 317
    return-void
.end method

.method public static showCheckoutPageFor34(Lcom/getjar/sdk/GetJarContext;Landroid/content/Intent;)V
    .locals 7
    .param p0, "getJarContext"    # Lcom/getjar/sdk/GetJarContext;
    .param p1, "receivedIntent"    # Landroid/content/Intent;

    .prologue
    .line 326
    if-nez p0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'getJarContext\' cannot be NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 327
    :cond_0
    if-nez p1, :cond_1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'receivedIntent\' cannot be NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 330
    :cond_1
    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    const-string v1, "sourceAppToken"

    invoke-virtual {v0, v1}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 331
    .local v3, "sourceAppToken":Ljava/lang/String;
    invoke-static {v3}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "showCheckoutPageFor34() called with an Intent that has no \'sourceAppToken\'"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 332
    :cond_2
    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    const-string v1, "sourceUserAccessId"

    invoke-virtual {v0, v1}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 333
    .local v2, "sourceUserAccessId":Ljava/lang/String;
    invoke-static {v2}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "showCheckoutPageFor34() called with an Intent that has no \'sourceUserAccessId\'"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 334
    :cond_3
    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    const-string v1, "sourceUserDeviceId"

    invoke-virtual {v0, v1}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 335
    .local v4, "sourceUserDeviceId":Ljava/lang/String;
    invoke-static {v4}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "showCheckoutPageFor34() called with an Intent that has no \'sourceUserDeviceId\'"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 336
    :cond_4
    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    const-string v1, "managedOfferDetails"

    invoke-virtual {v0, v1}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 337
    .local v5, "managedOfferDetails":Ljava/lang/String;
    invoke-static {v5}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "showCheckoutPageFor34() called with an Intent that has no \'managedOfferDetails\'"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 340
    :cond_5
    sget-object v6, Lcom/getjar/sdk/data/RedemptionEngine;->_ExecutorService:Ljava/util/concurrent/ExecutorService;

    new-instance v0, Lcom/getjar/sdk/data/RedemptionEngine$2;

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/getjar/sdk/data/RedemptionEngine$2;-><init>(Lcom/getjar/sdk/GetJarContext;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v6, v0}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 391
    return-void
.end method

.method public static showWalletPage(Lcom/getjar/sdk/GetJarContext;)V
    .locals 8
    .param p0, "getJarContext"    # Lcom/getjar/sdk/GetJarContext;

    .prologue
    const/4 v7, 0x1

    .line 209
    new-instance v0, Lcom/getjar/sdk/ConsumableProduct;

    const-string v1, "12312"

    const-string v2, "lightning Sword"

    const-string v3, "strike enemy with lightning"

    const-wide/16 v4, 0x2

    invoke-direct/range {v0 .. v5}, Lcom/getjar/sdk/ConsumableProduct;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V

    .line 210
    .local v0, "dummyProduct":Lcom/getjar/sdk/ConsumableProduct;
    new-instance v6, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/getjar/sdk/GetJarContext;->getAndroidContext()Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/getjar/sdk/rewards/GetJarActivity;

    invoke-direct {v6, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 211
    .local v6, "intent":Landroid/content/Intent;
    const-string v1, "productList"

    new-instance v2, Ljava/util/ArrayList;

    new-array v3, v7, [Lcom/getjar/sdk/ConsumableProduct;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v6, v1, v2}, Landroid/content/Intent;->putParcelableArrayListExtra(Ljava/lang/String;Ljava/util/ArrayList;)Landroid/content/Intent;

    .line 212
    const-string v1, "getjarContextId"

    invoke-virtual {p0}, Lcom/getjar/sdk/GetJarContext;->getGetJarContextId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v6, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 213
    const-string v1, "lang"

    const-string v2, "en-us"

    const-string v3, "_"

    const-string v4, "-"

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v6, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 214
    const-string v1, "com.getjar.sdk.rewards.GetJarWebViewSubActivity"

    invoke-virtual {v6, v1, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 215
    const-string v1, "getjarIntentType"

    const-string v2, "showWallet"

    invoke-virtual {v6, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 216
    const/high16 v1, 0x34200000

    invoke-virtual {v6, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 217
    invoke-virtual {p0}, Lcom/getjar/sdk/GetJarContext;->getAndroidContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, v6}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 218
    sget-object v1, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->REDEEM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    sget-object v3, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "RedemptionEngine: showWalletPage() intent sent"

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 219
    return-void
.end method


# virtual methods
.method public redeemVoucherFromIntent(Ljava/lang/String;Landroid/content/Intent;Ljava/util/List;)V
    .locals 8
    .param p1, "developerPayload"    # Ljava/lang/String;
    .param p2, "getjarIntent"    # Landroid/content/Intent;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Landroid/content/Intent;",
            "Ljava/util/List",
            "<",
            "Lcom/getjar/sdk/listener/VoucherRedemptionListener;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 396
    .local p3, "callbacks":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/listener/VoucherRedemptionListener;>;"
    if-nez p2, :cond_0

    .line 397
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'getjarIntent\' cannot be NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 399
    :cond_0
    if-eqz p3, :cond_1

    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result v0

    if-gtz v0, :cond_2

    .line 400
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'callbacks\' cannot be NULL or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 404
    :cond_2
    const-string v0, "voucherToken"

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 405
    .local v4, "voucherToken":Ljava/lang/String;
    invoke-static {v4}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 406
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'getjarIntent\' does not contain a \'voucherToken\' extra"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 409
    :cond_3
    :try_start_0
    invoke-static {v4}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 415
    sget-object v7, Lcom/getjar/sdk/data/RedemptionEngine;->_ExecutorService:Ljava/util/concurrent/ExecutorService;

    new-instance v0, Lcom/getjar/sdk/data/RedemptionEngine$3;

    move-object v1, p0

    move-object v2, p3

    move-object v3, p2

    move-object v5, p1

    invoke-direct/range {v0 .. v5}, Lcom/getjar/sdk/data/RedemptionEngine$3;-><init>(Lcom/getjar/sdk/data/RedemptionEngine;Ljava/util/List;Landroid/content/Intent;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v7, v0}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 513
    return-void

    .line 410
    :catch_0
    move-exception v6

    .line 411
    .local v6, "e":Ljava/lang/IllegalArgumentException;
    new-instance v0, Ljava/lang/IllegalArgumentException;

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v2, "\'getjarIntent\' \'voucherToken\' extra does not contain a valid UUID [%1$s]"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
