.class public Lcom/getjar/sdk/comm/LicenseServiceProxy;
.super Lcom/getjar/sdk/comm/ServiceProxyBase;
.source "LicenseServiceProxy.java"


# static fields
.field private static final _CONTRACT_VERSION:Ljava/lang/String; = "20120831"

.field private static volatile _Instance:Lcom/getjar/sdk/comm/LicenseServiceProxy;

.field private static final _URL_TEMPLATE_ACQUIRE_LICENSE:Ljava/lang/String;

.field private static final _URL_TEMPLATE_GET_LICENSES:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 33
    const/4 v0, 0x0

    sput-object v0, Lcom/getjar/sdk/comm/LicenseServiceProxy;->_Instance:Lcom/getjar/sdk/comm/LicenseServiceProxy;

    .line 54
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "%1$s%2$s%3$s"

    new-array v2, v7, [Ljava/lang/Object;

    const-string v3, "%1$slicense/licenses/acquire?version="

    aput-object v3, v2, v4

    const-string v3, "20120831"

    aput-object v3, v2, v5

    const-string v3, "&signature=%2$s"

    aput-object v3, v2, v6

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/getjar/sdk/comm/LicenseServiceProxy;->_URL_TEMPLATE_ACQUIRE_LICENSE:Ljava/lang/String;

    .line 61
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "%1$s%2$s%3$s"

    new-array v2, v7, [Ljava/lang/Object;

    const-string v3, "%1$slicense/licenses?version="

    aput-object v3, v2, v4

    const-string v3, "20120831"

    aput-object v3, v2, v5

    const-string v3, "&user_lookup_id=%2$s&user_device_id=%3$s&scope=%4$s&state=%5$s&ct=%6$s&l=%7$s&nonce=%8$s&type=%9$s&signature=%10$s"

    aput-object v3, v2, v6

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/getjar/sdk/comm/LicenseServiceProxy;->_URL_TEMPLATE_GET_LICENSES:Ljava/lang/String;

    .line 67
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 31
    invoke-direct {p0}, Lcom/getjar/sdk/comm/ServiceProxyBase;-><init>()V

    return-void
.end method

.method public static generateNonce()Ljava/lang/String;
    .locals 1

    .prologue
    .line 212
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static generateSignDataForAcquire(Ljava/lang/String;Ljava/lang/String;Lcom/getjar/sdk/License$LicenseScope;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p0, "userDeviceId"    # Ljava/lang/String;
    .param p1, "itemId"    # Ljava/lang/String;
    .param p2, "licenseScope"    # Lcom/getjar/sdk/License$LicenseScope;
    .param p3, "nonce"    # Ljava/lang/String;
    .param p4, "authHeader"    # Ljava/lang/String;

    .prologue
    .line 232
    invoke-static {p0}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "userDeviceId cannot be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 233
    :cond_0
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "itemId cannot be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 234
    :cond_1
    if-nez p2, :cond_2

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "licenseScope cannot be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 235
    :cond_2
    invoke-static {p3}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "nonce cannot be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 236
    :cond_3
    invoke-static {p4}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "authHeader cannot be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 238
    :cond_4
    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v2, "%s%s%s%s%s"

    const/4 v3, 0x5

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p0, v3, v4

    const/4 v4, 0x1

    aput-object p1, v3, v4

    const/4 v4, 0x2

    invoke-virtual {p2}, Lcom/getjar/sdk/License$LicenseScope;->name()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x3

    aput-object p3, v3, v4

    const/4 v4, 0x4

    aput-object p4, v3, v4

    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 239
    .local v0, "data":Ljava/lang/String;
    return-object v0
.end method

.method public static generateSignDataForGet(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p0, "userDeviceId"    # Ljava/lang/String;
    .param p1, "nonce"    # Ljava/lang/String;
    .param p2, "authHeader"    # Ljava/lang/String;

    .prologue
    .line 255
    invoke-static {p0}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "userDeviceId cannot be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 256
    :cond_0
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "nonce cannot be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 257
    :cond_1
    invoke-static {p2}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "authHeader cannot be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 259
    :cond_2
    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v2, "%s%s%s"

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p0, v3, v4

    const/4 v4, 0x1

    aput-object p1, v3, v4

    const/4 v4, 0x2

    aput-object p2, v3, v4

    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 260
    .local v0, "data":Ljava/lang/String;
    return-object v0
.end method

.method public static generateSignature(Ljava/lang/String;Ljava/security/PublicKey;Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p0, "keyIndex"    # Ljava/lang/String;
    .param p1, "publicKey"    # Ljava/security/PublicKey;
    .param p2, "data"    # Ljava/lang/String;

    .prologue
    .line 315
    invoke-static {p0}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "keyIndex cannot be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 316
    :cond_0
    if-nez p1, :cond_1

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "publicKey cannot be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 317
    :cond_1
    invoke-static {p2}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "data cannot be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 319
    :cond_2
    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v2, "%s%s"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p0, v3, v4

    const/4 v4, 0x1

    invoke-static {p1, p2}, Lcom/getjar/sdk/utilities/Security;->generateSignature(Ljava/security/PublicKey;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 320
    .local v0, "signature":Ljava/lang/String;
    return-object v0
.end method

.method public static generateSignatureForAcquire(Ljava/lang/String;Ljava/lang/String;Lcom/getjar/sdk/License$LicenseScope;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/security/PublicKey;)Ljava/lang/String;
    .locals 4
    .param p0, "userDeviceId"    # Ljava/lang/String;
    .param p1, "itemId"    # Ljava/lang/String;
    .param p2, "licenseScope"    # Lcom/getjar/sdk/License$LicenseScope;
    .param p3, "nonce"    # Ljava/lang/String;
    .param p4, "authHeader"    # Ljava/lang/String;
    .param p5, "keyIndex"    # Ljava/lang/String;
    .param p6, "publicKey"    # Ljava/security/PublicKey;

    .prologue
    .line 275
    invoke-static {p0}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "userDeviceId cannot be null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 276
    :cond_0
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "itemId cannot be null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 277
    :cond_1
    if-nez p2, :cond_2

    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "licenseScope cannot be null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 278
    :cond_2
    invoke-static {p3}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "nonce cannot be null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 279
    :cond_3
    invoke-static {p4}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4

    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "authHeader cannot be null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 280
    :cond_4
    invoke-static {p5}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_5

    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "keyIndex cannot be null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 281
    :cond_5
    if-nez p6, :cond_6

    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "publicKey cannot be null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 283
    :cond_6
    invoke-static {p0, p1, p2, p3, p4}, Lcom/getjar/sdk/comm/LicenseServiceProxy;->generateSignDataForAcquire(Ljava/lang/String;Ljava/lang/String;Lcom/getjar/sdk/License$LicenseScope;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 284
    .local v0, "data":Ljava/lang/String;
    invoke-static {p5, p6, v0}, Lcom/getjar/sdk/comm/LicenseServiceProxy;->generateSignature(Ljava/lang/String;Ljava/security/PublicKey;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 285
    .local v1, "signature":Ljava/lang/String;
    return-object v1
.end method

.method public static generateSignatureForGet(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/security/PublicKey;)Ljava/lang/String;
    .locals 4
    .param p0, "userDeviceId"    # Ljava/lang/String;
    .param p1, "nonce"    # Ljava/lang/String;
    .param p2, "authHeader"    # Ljava/lang/String;
    .param p3, "keyIndex"    # Ljava/lang/String;
    .param p4, "publicKey"    # Ljava/security/PublicKey;

    .prologue
    .line 298
    invoke-static {p0}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "userDeviceId cannot be null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 299
    :cond_0
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "nonce cannot be null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 300
    :cond_1
    invoke-static {p2}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "authHeader cannot be null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 301
    :cond_2
    invoke-static {p3}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "keyIndex cannot be null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 302
    :cond_3
    if-nez p4, :cond_4

    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "publicKey cannot be null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 304
    :cond_4
    invoke-static {p0, p1, p2}, Lcom/getjar/sdk/comm/LicenseServiceProxy;->generateSignDataForGet(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 305
    .local v0, "data":Ljava/lang/String;
    invoke-static {p3, p4, v0}, Lcom/getjar/sdk/comm/LicenseServiceProxy;->generateSignature(Ljava/lang/String;Ljava/security/PublicKey;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 306
    .local v1, "signature":Ljava/lang/String;
    return-object v1
.end method

.method public static getInstance()Lcom/getjar/sdk/comm/LicenseServiceProxy;
    .locals 1

    .prologue
    .line 40
    sget-object v0, Lcom/getjar/sdk/comm/LicenseServiceProxy;->_Instance:Lcom/getjar/sdk/comm/LicenseServiceProxy;

    if-nez v0, :cond_0

    invoke-static {}, Lcom/getjar/sdk/comm/LicenseServiceProxy;->makeTheInstance()V

    .line 41
    :cond_0
    sget-object v0, Lcom/getjar/sdk/comm/LicenseServiceProxy;->_Instance:Lcom/getjar/sdk/comm/LicenseServiceProxy;

    return-object v0
.end method

.method private static declared-synchronized makeTheInstance()V
    .locals 2

    .prologue
    .line 35
    const-class v1, Lcom/getjar/sdk/comm/LicenseServiceProxy;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/getjar/sdk/comm/LicenseServiceProxy;->_Instance:Lcom/getjar/sdk/comm/LicenseServiceProxy;

    if-nez v0, :cond_0

    new-instance v0, Lcom/getjar/sdk/comm/LicenseServiceProxy;

    invoke-direct {v0}, Lcom/getjar/sdk/comm/LicenseServiceProxy;-><init>()V

    sput-object v0, Lcom/getjar/sdk/comm/LicenseServiceProxy;->_Instance:Lcom/getjar/sdk/comm/LicenseServiceProxy;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 36
    :cond_0
    monitor-exit v1

    return-void

    .line 35
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method public acquireUnmanagedProductLicense(Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Lcom/getjar/sdk/License$LicenseScope;Ljava/util/HashMap;)Lcom/getjar/sdk/comm/Operation;
    .locals 21
    .param p1, "commContext"    # Lcom/getjar/sdk/comm/CommContext;
    .param p2, "itemId"    # Ljava/lang/String;
    .param p3, "licenseScope"    # Lcom/getjar/sdk/License$LicenseScope;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/getjar/sdk/comm/CommContext;",
            "Ljava/lang/String;",
            "Lcom/getjar/sdk/License$LicenseScope;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/getjar/sdk/comm/Operation;"
        }
    .end annotation

    .prologue
    .line 88
    .local p4, "trackingMetadata":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    if-nez p1, :cond_0

    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "The required parameter \'commContext\' was not provided"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 89
    :cond_0
    invoke-static/range {p2 .. p2}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "itemId cannot be empty or null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 90
    :cond_1
    if-nez p3, :cond_2

    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "licenseScope cannot be null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 91
    :cond_2
    if-nez p4, :cond_3

    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "trackingMetadata cannot be null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 93
    :cond_3
    invoke-static {}, Lcom/getjar/sdk/comm/LicenseServiceProxy;->generateNonce()Ljava/lang/String;

    move-result-object v5

    .line 94
    .local v5, "nonce":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/getjar/sdk/comm/auth/AuthManager;->initialize(Landroid/content/Context;)V

    .line 95
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/getjar/sdk/comm/auth/AuthManager;->waitOnAuth()V

    .line 98
    new-instance v12, Ljava/util/HashMap;

    const/4 v2, 0x6

    invoke-direct {v12, v2}, Ljava/util/HashMap;-><init>(I)V

    .line 99
    .local v12, "postData":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v2, "item_id"

    move-object/from16 v0, p2

    invoke-virtual {v12, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 100
    const-string v2, "scope"

    invoke-virtual/range {p3 .. p3}, Lcom/getjar/sdk/License$LicenseScope;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v12, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 101
    const-string v2, "user_lookup_id"

    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/getjar/sdk/comm/auth/AuthManager;->getUserAccessId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v12, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 102
    const-string v2, "user_device_id"

    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/getjar/sdk/comm/auth/AuthManager;->getUserDeviceId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v12, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 105
    :try_start_0
    const-string v2, "tracking_metadata"

    invoke-static/range {p4 .. p4}, Lcom/getjar/sdk/utilities/Utility;->mapToJsonString(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v12, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 110
    const-string v2, "type"

    sget-object v3, Lcom/getjar/sdk/data/LicenseInternal$LicenseType;->UNMANAGED:Lcom/getjar/sdk/data/LicenseInternal$LicenseType;

    invoke-virtual {v3}, Lcom/getjar/sdk/data/LicenseInternal$LicenseType;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v12, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 111
    const-string v2, "nonce"

    invoke-virtual {v12, v2, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 113
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/getjar/sdk/comm/auth/AuthManager;->getAuthToken()Ljava/lang/String;

    move-result-object v6

    .line 114
    .local v6, "authToken":Ljava/lang/String;
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/getjar/sdk/comm/auth/AuthManager;->getUserDeviceId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/CommContext;->getAppEncryptionKeyIndex()Ljava/lang/String;

    move-result-object v7

    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/CommContext;->getAppEncryptionPublicKey()Ljava/security/PublicKey;

    move-result-object v8

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    invoke-static/range {v2 .. v8}, Lcom/getjar/sdk/comm/LicenseServiceProxy;->generateSignatureForAcquire(Ljava/lang/String;Ljava/lang/String;Lcom/getjar/sdk/License$LicenseScope;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/security/PublicKey;)Ljava/lang/String;

    move-result-object v19

    .line 123
    .local v19, "signature":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual/range {p3 .. p3}, Lcom/getjar/sdk/License$LicenseScope;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    .line 124
    .local v20, "signatureKey":Ljava/lang/String;
    const/4 v2, 0x4

    move-object/from16 v0, v19

    invoke-virtual {v0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p1

    move-object/from16 v1, v20

    invoke-virtual {v0, v1, v2}, Lcom/getjar/sdk/comm/CommContext;->putSignature(Ljava/lang/String;Ljava/lang/String;)V

    .line 125
    move-object/from16 v0, p1

    move-object/from16 v1, v20

    invoke-virtual {v0, v1, v5}, Lcom/getjar/sdk/comm/CommContext;->putNonce(Ljava/lang/String;Ljava/lang/String;)V

    .line 129
    :try_start_1
    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    sget-object v3, Lcom/getjar/sdk/comm/LicenseServiceProxy;->_URL_TEMPLATE_ACQUIRE_LICENSE:Ljava/lang/String;

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v7, 0x0

    const/4 v8, 0x1

    move-object/from16 v0, p1

    invoke-static {v0, v8}, Lcom/getjar/sdk/comm/GetJarConfig;->getInstance(Lcom/getjar/sdk/comm/CommContext;Z)Lcom/getjar/sdk/comm/GetJarConfig;

    move-result-object v8

    const-string v9, "service.license_service.endpoint"

    invoke-virtual {v8, v9}, Lcom/getjar/sdk/comm/GetJarConfig;->getDirectiveValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v4, v7

    const/4 v7, 0x1

    const-string v8, "UTF-8"

    move-object/from16 v0, v19

    invoke-static {v0, v8}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v4, v7

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    :try_end_1
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v11

    .line 136
    .local v11, "url":Ljava/lang/String;
    const-string v8, "acquireUnmanagedProductLicense"

    sget-object v9, Lcom/getjar/sdk/comm/Operation$Priority;->HIGH:Lcom/getjar/sdk/comm/Operation$Priority;

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x1

    const/16 v16, 0x1

    const/16 v17, 0x1

    move-object/from16 v7, p0

    move-object/from16 v10, p1

    invoke-virtual/range {v7 .. v17}, Lcom/getjar/sdk/comm/LicenseServiceProxy;->makeAsyncPOSTRequestForJson(Ljava/lang/String;Lcom/getjar/sdk/comm/Operation$Priority;Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;Lcom/getjar/sdk/comm/CallbackInterface;ZZZ)Lcom/getjar/sdk/comm/Operation;

    move-result-object v2

    return-object v2

    .line 106
    .end local v6    # "authToken":Ljava/lang/String;
    .end local v11    # "url":Ljava/lang/String;
    .end local v19    # "signature":Ljava/lang/String;
    .end local v20    # "signatureKey":Ljava/lang/String;
    :catch_0
    move-exception v18

    .line 107
    .local v18, "e":Lorg/json/JSONException;
    new-instance v2, Lcom/getjar/sdk/exceptions/CommunicationException;

    move-object/from16 v0, v18

    invoke-direct {v2, v0}, Lcom/getjar/sdk/exceptions/CommunicationException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 132
    .end local v18    # "e":Lorg/json/JSONException;
    .restart local v6    # "authToken":Ljava/lang/String;
    .restart local v19    # "signature":Ljava/lang/String;
    .restart local v20    # "signatureKey":Ljava/lang/String;
    :catch_1
    move-exception v18

    .line 133
    .local v18, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v2, Lcom/getjar/sdk/exceptions/CommunicationException;

    move-object/from16 v0, v18

    invoke-direct {v2, v0}, Lcom/getjar/sdk/exceptions/CommunicationException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method protected getServiceName()Lcom/getjar/sdk/comm/Request$ServiceName;
    .locals 1

    .prologue
    .line 70
    sget-object v0, Lcom/getjar/sdk/comm/Request$ServiceName;->LICENSE:Lcom/getjar/sdk/comm/Request$ServiceName;

    return-object v0
.end method

.method public getUnmanagedProductLicenses(Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/License$LicenseScope;Lcom/getjar/sdk/data/LicenseInternal$ExternalLicenseState;Ljava/lang/String;ILjava/lang/String;)Lcom/getjar/sdk/comm/Operation;
    .locals 15
    .param p1, "commContext"    # Lcom/getjar/sdk/comm/CommContext;
    .param p2, "licenseScope"    # Lcom/getjar/sdk/License$LicenseScope;
    .param p3, "licenseState"    # Lcom/getjar/sdk/data/LicenseInternal$ExternalLicenseState;
    .param p4, "continuationToken"    # Ljava/lang/String;
    .param p5, "limit"    # I
    .param p6, "eTag"    # Ljava/lang/String;

    .prologue
    .line 159
    if-nez p1, :cond_0

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "The required parameter \'commContext\' was not provided"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 160
    :cond_0
    invoke-static/range {p4 .. p4}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    const-string p4, ""

    .line 161
    :cond_1
    const/4 v1, 0x1

    move/from16 v0, p5

    if-ge v0, v1, :cond_2

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "limit must be greater than 0"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 163
    :cond_2
    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/getjar/sdk/comm/auth/AuthManager;->initialize(Landroid/content/Context;)V

    .line 164
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/getjar/sdk/comm/auth/AuthManager;->waitOnAuth()V

    .line 167
    invoke-static {}, Lcom/getjar/sdk/comm/LicenseServiceProxy;->generateNonce()Ljava/lang/String;

    move-result-object v13

    .line 170
    .local v13, "nonce":Ljava/lang/String;
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/getjar/sdk/comm/auth/AuthManager;->getAuthToken()Ljava/lang/String;

    move-result-object v11

    .line 171
    .local v11, "authToken":Ljava/lang/String;
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/getjar/sdk/comm/auth/AuthManager;->getUserDeviceId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/CommContext;->getAppEncryptionKeyIndex()Ljava/lang/String;

    move-result-object v2

    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/CommContext;->getAppEncryptionPublicKey()Ljava/security/PublicKey;

    move-result-object v3

    invoke-static {v1, v13, v11, v2, v3}, Lcom/getjar/sdk/comm/LicenseServiceProxy;->generateSignatureForGet(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/security/PublicKey;)Ljava/lang/String;

    move-result-object v14

    .line 178
    .local v14, "signature":Ljava/lang/String;
    const/4 v1, 0x4

    invoke-virtual {v14, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    move-object/from16 v0, p1

    invoke-virtual {v0, v13, v1}, Lcom/getjar/sdk/comm/CommContext;->putSignature(Ljava/lang/String;Ljava/lang/String;)V

    .line 181
    :try_start_0
    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    sget-object v3, Lcom/getjar/sdk/comm/LicenseServiceProxy;->_URL_TEMPLATE_GET_LICENSES:Ljava/lang/String;

    const/16 v1, 0xa

    new-array v4, v1, [Ljava/lang/Object;

    const/4 v1, 0x0

    const/4 v7, 0x1

    move-object/from16 v0, p1

    invoke-static {v0, v7}, Lcom/getjar/sdk/comm/GetJarConfig;->getInstance(Lcom/getjar/sdk/comm/CommContext;Z)Lcom/getjar/sdk/comm/GetJarConfig;

    move-result-object v7

    const-string v8, "service.license_service.endpoint"

    invoke-virtual {v7, v8}, Lcom/getjar/sdk/comm/GetJarConfig;->getDirectiveValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v4, v1

    const/4 v1, 0x1

    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v7

    invoke-virtual {v7}, Lcom/getjar/sdk/comm/auth/AuthManager;->getUserAccessId()Ljava/lang/String;

    move-result-object v7

    const-string v8, "UTF-8"

    invoke-static {v7, v8}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v4, v1

    const/4 v1, 0x2

    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v7

    invoke-virtual {v7}, Lcom/getjar/sdk/comm/auth/AuthManager;->getUserDeviceId()Ljava/lang/String;

    move-result-object v7

    const-string v8, "UTF-8"

    invoke-static {v7, v8}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v4, v1

    const/4 v7, 0x3

    if-eqz p2, :cond_4

    invoke-virtual/range {p2 .. p2}, Lcom/getjar/sdk/License$LicenseScope;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_0
    const-string v8, "UTF-8"

    invoke-static {v1, v8}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v4, v7

    const/4 v7, 0x4

    if-eqz p3, :cond_5

    invoke-virtual/range {p3 .. p3}, Lcom/getjar/sdk/data/LicenseInternal$ExternalLicenseState;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_1
    const-string v8, "UTF-8"

    invoke-static {v1, v8}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v4, v7

    const/4 v1, 0x5

    const-string v7, "UTF-8"

    move-object/from16 v0, p4

    invoke-static {v0, v7}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v4, v1

    const/4 v1, 0x6

    invoke-static/range {p5 .. p5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v7

    const-string v8, "UTF-8"

    invoke-static {v7, v8}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v4, v1

    const/4 v1, 0x7

    const-string v7, "UTF-8"

    invoke-static {v13, v7}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v4, v1

    const/16 v1, 0x8

    sget-object v7, Lcom/getjar/sdk/data/LicenseInternal$LicenseType;->UNMANAGED:Lcom/getjar/sdk/data/LicenseInternal$LicenseType;

    invoke-virtual {v7}, Lcom/getjar/sdk/data/LicenseInternal$LicenseType;->name()Ljava/lang/String;

    move-result-object v7

    const-string v8, "UTF-8"

    invoke-static {v7, v8}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v4, v1

    const/16 v1, 0x9

    const-string v7, "UTF-8"

    invoke-static {v14, v7}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v4, v1

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v5

    .line 196
    .local v5, "url":Ljava/lang/String;
    const/4 v6, 0x0

    .line 198
    .local v6, "requestHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz p6, :cond_3

    .line 200
    new-instance v6, Ljava/util/HashMap;

    .end local v6    # "requestHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 201
    .restart local v6    # "requestHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v1, "If-None-Match"

    move-object/from16 v0, p6

    invoke-interface {v6, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 204
    :cond_3
    const-string v2, "getUnmanagedProductLicenses"

    sget-object v3, Lcom/getjar/sdk/comm/Operation$Priority;->HIGH:Lcom/getjar/sdk/comm/Operation$Priority;

    const/4 v7, 0x0

    const/4 v8, 0x1

    const/4 v9, 0x1

    const/4 v10, 0x1

    move-object v1, p0

    move-object/from16 v4, p1

    invoke-virtual/range {v1 .. v10}, Lcom/getjar/sdk/comm/LicenseServiceProxy;->makeAsyncGETRequestForJson(Ljava/lang/String;Lcom/getjar/sdk/comm/Operation$Priority;Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Ljava/util/Map;Lcom/getjar/sdk/comm/CallbackInterface;ZZZ)Lcom/getjar/sdk/comm/Operation;

    move-result-object v1

    return-object v1

    .line 181
    .end local v5    # "url":Ljava/lang/String;
    .end local v6    # "requestHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_4
    :try_start_1
    const-string v1, ""

    goto :goto_0

    :cond_5
    const-string v1, ""
    :try_end_1
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 192
    :catch_0
    move-exception v12

    .line 193
    .local v12, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v1, Lcom/getjar/sdk/exceptions/CommunicationException;

    invoke-direct {v1, v12}, Lcom/getjar/sdk/exceptions/CommunicationException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method
