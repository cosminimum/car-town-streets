.class public Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;
.super Ljava/lang/Object;
.source "AndroidAccountUserAuthProvider.java"

# interfaces
.implements Lcom/getjar/sdk/comm/auth/UserAuthProvider;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$1;,
        Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;
    }
.end annotation


# static fields
.field public static final KeyProviderHintUsernameDataHash:Ljava/lang/String; = "android_account.username_data_hash"

.field public static final KeySkipCacheFlag:Ljava/lang/String; = "provider.skip_cache"

.field private static final _CacheName:Ljava/lang/String; = "androidAccountUserAuthCache"

.field private static final _KeyProviderDataName:Ljava/lang/String; = "android.account.name"

.field private static final _KeyProviderDataType:Ljava/lang/String; = "android.account.type"

.field private static final _KeyUserAuthProviderAndData:Ljava/lang/String; = "userAuthProviderAndData"


# instance fields
.field private final _accountResolver:Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    new-instance v0, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;-><init>(Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$1;)V

    iput-object v0, p0, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;->_accountResolver:Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;

    .line 553
    return-void
.end method

.method static synthetic access$600(Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;Landroid/content/Context;)Lcom/getjar/sdk/comm/auth/UserAuthProviderAndDataCacheEntry;
    .locals 1
    .param p0, "x0"    # Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;
    .param p1, "x1"    # Landroid/content/Context;

    .prologue
    .line 48
    invoke-direct {p0, p1}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;->getUserAuthProviderAndData(Landroid/content/Context;)Lcom/getjar/sdk/comm/auth/UserAuthProviderAndDataCacheEntry;

    move-result-object v0

    return-object v0
.end method

.method public static getAccountNameFromHash(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .locals 13
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "accountNameHash"    # Ljava/lang/String;

    .prologue
    const/4 v11, 0x1

    const/4 v12, 0x0

    .line 65
    sget-object v6, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    const-string v8, "AuthFlow: AndroidAccountUserAuthProvider: getAccountNameFromHash() START"

    invoke-static {v6, v7, v8}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 66
    if-nez p0, :cond_0

    new-instance v6, Ljava/lang/IllegalArgumentException;

    const-string v7, "\'commContext\' cannot be NULL"

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 68
    :cond_0
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 69
    sget-object v6, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    const-string v8, "AuthFlow: AndroidAccountUserAuthProvider: getAccountNameFromHash() null or empty \'accountNameHash\' provided"

    invoke-static {v6, v7, v8}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;)V

    .line 70
    const/4 v2, 0x0

    .line 98
    :goto_0
    return-object v2

    .line 74
    :cond_1
    const/4 v2, 0x0

    .line 78
    .local v2, "accountName":Ljava/lang/String;
    :try_start_0
    invoke-static {p0}, Landroid/accounts/AccountManager;->get(Landroid/content/Context;)Landroid/accounts/AccountManager;

    move-result-object v1

    .line 79
    .local v1, "accountManager":Landroid/accounts/AccountManager;
    const-string v6, "com.google"

    invoke-virtual {v1, v6}, Landroid/accounts/AccountManager;->getAccountsByType(Ljava/lang/String;)[Landroid/accounts/Account;

    move-result-object v3

    .line 82
    .local v3, "accounts":[Landroid/accounts/Account;
    if-eqz v3, :cond_4

    .line 83
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_1
    array-length v6, v3

    if-ge v5, v6, :cond_4

    .line 84
    aget-object v6, v3, v5

    if-eqz v6, :cond_2

    aget-object v6, v3, v5

    iget-object v6, v6, Landroid/accounts/Account;->name:Ljava/lang/String;

    invoke-static {v6}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 83
    :cond_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 85
    :cond_3
    aget-object v6, v3, v5

    iget-object v6, v6, Landroid/accounts/Account;->name:Ljava/lang/String;

    sget-object v7, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v6, v7}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    .line 86
    .local v0, "accNameStr":Ljava/lang/String;
    invoke-static {v0}, Lcom/getjar/sdk/utilities/CryptoUtility;->getSHA256(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v6

    if-eqz v6, :cond_2

    .line 87
    move-object v2, v0

    .line 96
    .end local v0    # "accNameStr":Ljava/lang/String;
    .end local v5    # "i":I
    :cond_4
    sget-object v6, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    sget-object v8, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v9, "AuthFlow: AndroidAccountUserAuthProvider: getAccountNameFromHash() FINISHED Returning %1$s"

    new-array v10, v11, [Ljava/lang/Object;

    aput-object v2, v10, v12

    invoke-static {v8, v9, v10}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v6, v7, v8}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    goto :goto_0

    .line 93
    .end local v1    # "accountManager":Landroid/accounts/AccountManager;
    .end local v3    # "accounts":[Landroid/accounts/Account;
    :catch_0
    move-exception v4

    .line 94
    .local v4, "e":Ljava/lang/Exception;
    :try_start_1
    sget-object v6, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    const-string v8, "AuthFlow: AndroidAccountUserAuthProvider: getAccountNameFromHash() FAILED"

    invoke-static {v6, v7, v8, v4}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 96
    sget-object v6, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    sget-object v8, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v9, "AuthFlow: AndroidAccountUserAuthProvider: getAccountNameFromHash() FINISHED Returning %1$s"

    new-array v10, v11, [Ljava/lang/Object;

    aput-object v2, v10, v12

    invoke-static {v8, v9, v10}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v6, v7, v8}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    goto :goto_0

    .end local v4    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v6

    sget-object v7, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    sget-object v9, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v10, "AuthFlow: AndroidAccountUserAuthProvider: getAccountNameFromHash() FINISHED Returning %1$s"

    new-array v11, v11, [Ljava/lang/Object;

    aput-object v2, v11, v12

    invoke-static {v9, v10, v11}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v7, v8, v9}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    throw v6
.end method

.method public static getAndroidAccountNames(Landroid/content/Context;)[Ljava/lang/CharSequence;
    .locals 4
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 536
    invoke-static {p0}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;->getAndroidAccounts(Landroid/content/Context;)[Landroid/accounts/Account;

    move-result-object v0

    .line 539
    .local v0, "accounts":[Landroid/accounts/Account;
    const/4 v2, 0x0

    .line 540
    .local v2, "selectionItems":[Ljava/lang/CharSequence;
    if-eqz v0, :cond_2

    .line 541
    array-length v3, v0

    new-array v2, v3, [Ljava/lang/CharSequence;

    .line 542
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v3, v0

    if-ge v1, v3, :cond_2

    .line 543
    aget-object v3, v0, v1

    if-eqz v3, :cond_0

    aget-object v3, v0, v1

    iget-object v3, v3, Landroid/accounts/Account;->name:Ljava/lang/String;

    invoke-static {v3}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 542
    :cond_0
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 544
    :cond_1
    aget-object v3, v0, v1

    iget-object v3, v3, Landroid/accounts/Account;->name:Ljava/lang/String;

    aput-object v3, v2, v1

    goto :goto_1

    .line 547
    .end local v1    # "i":I
    :cond_2
    return-object v2
.end method

.method public static getAndroidAccounts(Landroid/content/Context;)[Landroid/accounts/Account;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 527
    invoke-static {p0}, Landroid/accounts/AccountManager;->get(Landroid/content/Context;)Landroid/accounts/AccountManager;

    move-result-object v0

    .line 528
    .local v0, "accountManager":Landroid/accounts/AccountManager;
    const-string v2, "com.google"

    invoke-virtual {v0, v2}, Landroid/accounts/AccountManager;->getAccountsByType(Ljava/lang/String;)[Landroid/accounts/Account;

    move-result-object v1

    .line 529
    .local v1, "accounts":[Landroid/accounts/Account;
    return-object v1
.end method

.method private getProviderData(Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/comm/auth/AuthUIParentInterface;Lcom/getjar/sdk/comm/auth/ProviderHint;)Ljava/util/Map;
    .locals 11
    .param p1, "commContext"    # Lcom/getjar/sdk/comm/CommContext;
    .param p2, "uiParent"    # Lcom/getjar/sdk/comm/auth/AuthUIParentInterface;
    .param p3, "providerHint"    # Lcom/getjar/sdk/comm/auth/ProviderHint;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/getjar/sdk/comm/CommContext;",
            "Lcom/getjar/sdk/comm/auth/AuthUIParentInterface;",
            "Lcom/getjar/sdk/comm/auth/ProviderHint;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/getjar/sdk/data/MetadataValue;",
            ">;"
        }
    .end annotation

    .prologue
    .line 326
    if-nez p1, :cond_0

    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "\'commContext\' cannot be NULL"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 327
    :cond_0
    invoke-direct {p0, p3}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;->validateProviderHint(Lcom/getjar/sdk/comm/auth/ProviderHint;)V

    .line 330
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/CommContext;->getDeviceMetadata()Lcom/getjar/sdk/data/DeviceMetadata;

    move-result-object v5

    invoke-virtual {v5}, Lcom/getjar/sdk/data/DeviceMetadata;->getMetadataWithReliability()Ljava/util/Map;

    move-result-object v2

    .line 331
    .local v2, "deviceMetadata":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/getjar/sdk/data/MetadataValue;>;"
    if-eqz v2, :cond_1

    invoke-interface {v2}, Ljava/util/Map;->size()I

    move-result v5

    if-gtz v5, :cond_2

    .line 332
    :cond_1
    sget-object v5, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    const-string v7, "AuthFlow: AndroidAccountUserAuthProvider: getProviderData() failed to get device metadata"

    invoke-static {v5, v6, v7}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;)V

    .line 333
    const/4 v4, 0x0

    .line 414
    :goto_0
    return-object v4

    .line 337
    :cond_2
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 338
    .local v4, "providerData":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/getjar/sdk/data/MetadataValue;>;"
    invoke-interface {v4, v2}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 341
    const/4 v1, 0x0

    .line 342
    .local v1, "androidAccountName":Ljava/lang/String;
    if-eqz p3, :cond_3

    invoke-direct {p0, p3}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;->isProviderHintForMe(Lcom/getjar/sdk/comm/auth/ProviderHint;)Z

    move-result v5

    if-eqz v5, :cond_4

    invoke-virtual {p3}, Lcom/getjar/sdk/comm/auth/ProviderHint;->getData()Ljava/util/HashMap;

    move-result-object v5

    const-string v6, "provider.skip_cache"

    invoke-virtual {v5, v6}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_4

    .line 345
    :cond_3
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;->getUserAuthProviderAndData(Landroid/content/Context;)Lcom/getjar/sdk/comm/auth/UserAuthProviderAndDataCacheEntry;

    move-result-object v3

    .line 346
    .local v3, "providerAndData":Lcom/getjar/sdk/comm/auth/UserAuthProviderAndDataCacheEntry;
    invoke-direct {p0, v3}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;->validateUserAuthProviderAndDataCacheEntry(Lcom/getjar/sdk/comm/auth/UserAuthProviderAndDataCacheEntry;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 347
    invoke-virtual {v3}, Lcom/getjar/sdk/comm/auth/UserAuthProviderAndDataCacheEntry;->getCachedProviderData()Ljava/util/HashMap;

    move-result-object v5

    const-string v6, "android.account.name"

    invoke-virtual {v5, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "androidAccountName":Ljava/lang/String;
    check-cast v1, Ljava/lang/String;

    .line 352
    .end local v3    # "providerAndData":Lcom/getjar/sdk/comm/auth/UserAuthProviderAndDataCacheEntry;
    .restart local v1    # "androidAccountName":Ljava/lang/String;
    :cond_4
    const/4 v0, 0x0

    .line 353
    .local v0, "androidAccount":Landroid/accounts/Account;
    invoke-static {v1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_5

    .line 354
    iget-object v5, p0, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;->_accountResolver:Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;

    invoke-static {v5, v1, p1}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;->access$400(Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;Ljava/lang/String;Lcom/getjar/sdk/comm/CommContext;)Landroid/accounts/Account;

    move-result-object v0

    .line 355
    if-eqz v0, :cond_5

    .line 356
    sget-object v5, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    sget-object v7, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v8, "AuthFlow: AndroidAccountUserAuthProvider: getProviderData() [account:\'%1$s\'] [source:cache]"

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    aput-object v1, v9, v10

    invoke-static {v7, v8, v9}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v6, v7}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 360
    :cond_5
    if-nez v0, :cond_8

    .line 363
    invoke-direct {p0, p3}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;->isProviderHintForMe(Lcom/getjar/sdk/comm/auth/ProviderHint;)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 364
    iget-object v5, p0, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;->_accountResolver:Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;

    invoke-static {v5, p1, p3}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;->access$300(Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/comm/auth/ProviderHint;)Ljava/lang/String;

    move-result-object v1

    .line 365
    invoke-static {v1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_6

    .line 366
    iget-object v5, p0, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;->_accountResolver:Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;

    invoke-static {v5, v1, p1}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;->access$400(Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;Ljava/lang/String;Lcom/getjar/sdk/comm/CommContext;)Landroid/accounts/Account;

    move-result-object v0

    .line 367
    if-eqz v0, :cond_6

    .line 368
    sget-object v5, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    sget-object v7, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v8, "AuthFlow: AndroidAccountUserAuthProvider: getProviderData() [account:\'%1$s\'] [source:hint]"

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    aput-object v1, v9, v10

    invoke-static {v7, v8, v9}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v6, v7}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 369
    invoke-direct {p0, p1, v1}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;->setUserAuthProviderAndData(Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;)V

    .line 375
    :cond_6
    if-nez v0, :cond_7

    .line 376
    iget-object v5, p0, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;->_accountResolver:Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;

    invoke-static {v5, p1, p2}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;->access$500(Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/comm/auth/AuthUIParentInterface;)Ljava/lang/String;

    move-result-object v1

    .line 377
    invoke-static {v1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_7

    .line 378
    iget-object v5, p0, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;->_accountResolver:Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;

    invoke-static {v5, v1, p1}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;->access$400(Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;Ljava/lang/String;Lcom/getjar/sdk/comm/CommContext;)Landroid/accounts/Account;

    move-result-object v0

    .line 379
    if-eqz v0, :cond_7

    .line 380
    sget-object v5, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    sget-object v7, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v8, "AuthFlow: AndroidAccountUserAuthProvider: getProviderData() [account:\'%1$s\'] [source:ui]"

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    aput-object v1, v9, v10

    invoke-static {v7, v8, v9}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v6, v7}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 381
    invoke-direct {p0, p1, v1}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;->setUserAuthProviderAndData(Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;)V

    .line 387
    :cond_7
    if-nez v0, :cond_8

    .line 388
    const/4 v5, 0x0

    check-cast v5, Ljava/lang/String;

    invoke-direct {p0, p1, v5}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;->setUserAuthProviderAndData(Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;)V

    .line 389
    sget-object v5, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    const-string v7, "AuthFlow: AndroidAccountUserAuthProvider: getProviderData() failed to get android account name"

    invoke-static {v5, v6, v7}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;)V

    .line 390
    const/4 v4, 0x0

    goto/16 :goto_0

    .line 395
    :cond_8
    iget-object v5, v0, Landroid/accounts/Account;->name:Ljava/lang/String;

    invoke-static {v5}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_9

    .line 396
    const-string v5, "android.account.name"

    new-instance v6, Lcom/getjar/sdk/data/MetadataValue;

    iget-object v7, v0, Landroid/accounts/Account;->name:Ljava/lang/String;

    sget-object v8, Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;->NOT_AVAILABLE:Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;

    invoke-direct {v6, v7, v8}, Lcom/getjar/sdk/data/MetadataValue;-><init>(Ljava/lang/String;Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;)V

    invoke-interface {v4, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 402
    :goto_1
    iget-object v5, v0, Landroid/accounts/Account;->type:Ljava/lang/String;

    invoke-static {v5}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_a

    .line 403
    const-string v5, "android.account.type"

    new-instance v6, Lcom/getjar/sdk/data/MetadataValue;

    iget-object v7, v0, Landroid/accounts/Account;->type:Ljava/lang/String;

    sget-object v8, Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;->NOT_AVAILABLE:Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;

    invoke-direct {v6, v7, v8}, Lcom/getjar/sdk/data/MetadataValue;-><init>(Ljava/lang/String;Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;)V

    invoke-interface {v4, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 409
    :goto_2
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5}, Lcom/getjar/sdk/utilities/ScreenUtility;->getDisplayDetails(Landroid/content/Context;)Ljava/util/HashMap;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 412
    invoke-static {v4}, Lcom/getjar/sdk/comm/auth/AuthMetadataUtility;->addSDKMetadataValues(Ljava/util/Map;)V

    goto/16 :goto_0

    .line 398
    :cond_9
    const-string v5, "android.account.name"

    new-instance v6, Lcom/getjar/sdk/data/MetadataValue;

    iget-object v7, v0, Landroid/accounts/Account;->name:Ljava/lang/String;

    sget-object v8, Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;->AVAILABLE:Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;

    invoke-direct {v6, v7, v8}, Lcom/getjar/sdk/data/MetadataValue;-><init>(Ljava/lang/String;Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;)V

    invoke-interface {v4, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 405
    :cond_a
    const-string v5, "android.account.type"

    new-instance v6, Lcom/getjar/sdk/data/MetadataValue;

    iget-object v7, v0, Landroid/accounts/Account;->type:Ljava/lang/String;

    sget-object v8, Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;->AVAILABLE:Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;

    invoke-direct {v6, v7, v8}, Lcom/getjar/sdk/data/MetadataValue;-><init>(Ljava/lang/String;Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;)V

    invoke-interface {v4, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2
.end method

.method private getUserAuthProviderAndData(Landroid/content/Context;)Lcom/getjar/sdk/comm/auth/UserAuthProviderAndDataCacheEntry;
    .locals 13
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v5, 0x0

    .line 459
    new-instance v1, Lcom/getjar/sdk/data/CachingManager;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v6

    const-string v7, "androidAccountUserAuthCache"

    invoke-direct {v1, v6, v7}, Lcom/getjar/sdk/data/CachingManager;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 461
    .local v1, "cachingManager":Lcom/getjar/sdk/data/CachingManager;
    const-string v6, "userAuthProviderAndData"

    invoke-virtual {v1, v6}, Lcom/getjar/sdk/data/CachingManager;->getCacheEntry(Ljava/lang/String;)Lcom/getjar/sdk/data/CacheEntry;

    move-result-object v3

    .line 462
    .local v3, "entry":Lcom/getjar/sdk/data/CacheEntry;
    if-nez v3, :cond_1

    .line 476
    :cond_0
    :goto_0
    return-object v5

    .line 465
    :cond_1
    invoke-virtual {v3}, Lcom/getjar/sdk/data/CacheEntry;->getValue()Ljava/lang/String;

    move-result-object v4

    .line 466
    .local v4, "entryValue":Ljava/lang/String;
    invoke-static {v4}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 469
    const/4 v5, 0x0

    .line 471
    .local v5, "retObj":Lcom/getjar/sdk/comm/auth/UserAuthProviderAndDataCacheEntry;
    :try_start_0
    invoke-static {v4}, Lcom/getjar/sdk/utilities/Base64;->decodeToObject(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    move-object v0, v6

    check-cast v0, Lcom/getjar/sdk/comm/auth/UserAuthProviderAndDataCacheEntry;

    move-object v5, v0

    .line 472
    sget-object v6, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    sget-object v8, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v8}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v8

    or-long/2addr v6, v8

    sget-object v8, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v9, "AuthFlow: AndroidAccountUserAuthProvider: Using cached UserAuthProviderAndDataCacheEntry [%1$s]"

    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    invoke-virtual {v5}, Lcom/getjar/sdk/comm/auth/UserAuthProviderAndDataCacheEntry;->getUserAuthProviderType()Ljava/lang/Class;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v12

    aput-object v12, v10, v11

    invoke-static {v8, v9, v10}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v6, v7, v8}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 473
    :catch_0
    move-exception v2

    .line 474
    .local v2, "e":Ljava/lang/Exception;
    sget-object v6, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    sget-object v8, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v8}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v8

    or-long/2addr v6, v8

    const-string v8, "AuthFlow: AndroidAccountUserAuthProvider: Deserialization of UserAuthProviderAndDataCacheEntry failed"

    invoke-static {v6, v7, v8, v2}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method private isProviderHintForMe(Lcom/getjar/sdk/comm/auth/ProviderHint;)Z
    .locals 2
    .param p1, "providerHint"    # Lcom/getjar/sdk/comm/auth/ProviderHint;

    .prologue
    .line 520
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/getjar/sdk/comm/auth/ProviderHint;->getFilter()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;->getProviderFilter()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private setUserAuthProviderAndData(Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;)V
    .locals 12
    .param p1, "commContext"    # Lcom/getjar/sdk/comm/CommContext;
    .param p2, "accountName"    # Ljava/lang/String;

    .prologue
    .line 482
    sget-object v1, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v1, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v9

    or-long/2addr v3, v9

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "AuthFlow: AndroidAccountUserAuthProvider: Updating cached UserAuthProviderAndDataCacheEntry [type:%1$s data:%2$s]"

    const/4 v9, 0x2

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    const-class v11, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;

    invoke-virtual {v11}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v11

    aput-object v11, v9, v10

    const/4 v10, 0x1

    aput-object p2, v9, v10

    invoke-static {v1, v5, v9}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v4, v1}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 488
    new-instance v8, Ljava/util/HashMap;

    const/4 v1, 0x1

    invoke-direct {v8, v1}, Ljava/util/HashMap;-><init>(I)V

    .line 489
    .local v8, "providerDataToCache":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v1, "android.account.name"

    invoke-virtual {v8, v1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 490
    new-instance v7, Lcom/getjar/sdk/comm/auth/UserAuthProviderAndDataCacheEntry;

    const-class v1, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;

    invoke-direct {v7, v1, v8}, Lcom/getjar/sdk/comm/auth/UserAuthProviderAndDataCacheEntry;-><init>(Ljava/lang/Class;Ljava/util/HashMap;)V

    .line 495
    .local v7, "providerAndData":Lcom/getjar/sdk/comm/auth/UserAuthProviderAndDataCacheEntry;
    :try_start_0
    invoke-static {v7}, Lcom/getjar/sdk/utilities/Base64;->encodeObject(Ljava/io/Serializable;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 501
    .local v2, "serializedObject":Ljava/lang/String;
    new-instance v0, Lcom/getjar/sdk/data/CachingManager;

    invoke-virtual {p1}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-string v3, "androidAccountUserAuthCache"

    invoke-direct {v0, v1, v3}, Lcom/getjar/sdk/data/CachingManager;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 502
    .local v0, "cachingManager":Lcom/getjar/sdk/data/CachingManager;
    const-string v1, "userAuthProviderAndData"

    const-wide v3, 0x7fffffffffffffffL

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Lcom/getjar/sdk/data/CachingManager;->updateCache(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/String;Ljava/net/URI;)V

    .line 503
    return-void

    .line 496
    .end local v0    # "cachingManager":Lcom/getjar/sdk/data/CachingManager;
    .end local v2    # "serializedObject":Ljava/lang/String;
    :catch_0
    move-exception v6

    .line 497
    .local v6, "e":Ljava/io/IOException;
    new-instance v1, Lcom/getjar/sdk/exceptions/CachingException;

    invoke-direct {v1, v6}, Lcom/getjar/sdk/exceptions/CachingException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method private validateProviderHint(Lcom/getjar/sdk/comm/auth/ProviderHint;)V
    .locals 2
    .param p1, "providerHint"    # Lcom/getjar/sdk/comm/auth/ProviderHint;

    .prologue
    .line 510
    invoke-direct {p0, p1}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;->isProviderHintForMe(Lcom/getjar/sdk/comm/auth/ProviderHint;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Lcom/getjar/sdk/comm/auth/ProviderHint;->getData()Ljava/util/HashMap;

    move-result-object v0

    const-string v1, "android_account.username_data_hash"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/getjar/sdk/comm/auth/ProviderHint;->getData()Ljava/util/HashMap;

    move-result-object v0

    const-string v1, "android_account.username_data_hash"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 514
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'providerHint\' does not contain required data"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 516
    :cond_1
    return-void
.end method

.method private validateUserAuthProviderAndDataCacheEntry(Lcom/getjar/sdk/comm/auth/UserAuthProviderAndDataCacheEntry;)Z
    .locals 8
    .param p1, "providerAndData"    # Lcom/getjar/sdk/comm/auth/UserAuthProviderAndDataCacheEntry;

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 424
    if-nez p1, :cond_0

    .line 425
    sget-object v0, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v0, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    const-string v0, "AuthFlow: AndroidAccountUserAuthProvider: validateUserAuthProviderAndDataCacheEntry(): No cached provider data found"

    invoke-static {v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    move v0, v1

    .line 449
    :goto_0
    return v0

    .line 430
    :cond_0
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/auth/UserAuthProviderAndDataCacheEntry;->getUserAuthProviderType()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 431
    sget-object v0, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v0, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "AuthFlow: AndroidAccountUserAuthProvider: validateUserAuthProviderAndDataCacheEntry(): Cached provider data is for \'%1$s\' and is not usable by \'%2$s\'"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    invoke-virtual {p1}, Lcom/getjar/sdk/comm/auth/UserAuthProviderAndDataCacheEntry;->getUserAuthProviderType()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v2

    invoke-static {v0, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v4, v0}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    move v0, v1

    .line 435
    goto :goto_0

    .line 439
    :cond_1
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/auth/UserAuthProviderAndDataCacheEntry;->getCachedProviderData()Ljava/util/HashMap;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-virtual {p1}, Lcom/getjar/sdk/comm/auth/UserAuthProviderAndDataCacheEntry;->getCachedProviderData()Ljava/util/HashMap;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    move-result v0

    if-lez v0, :cond_2

    invoke-virtual {p1}, Lcom/getjar/sdk/comm/auth/UserAuthProviderAndDataCacheEntry;->getCachedProviderData()Ljava/util/HashMap;

    move-result-object v0

    const-string v3, "android.account.name"

    invoke-virtual {v0, v3}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p1}, Lcom/getjar/sdk/comm/auth/UserAuthProviderAndDataCacheEntry;->getCachedProviderData()Ljava/util/HashMap;

    move-result-object v0

    const-string v3, "android.account.name"

    invoke-virtual {v0, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 444
    :cond_2
    sget-object v0, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v0, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    const-string v0, "AuthFlow: AndroidAccountUserAuthProvider: validateUserAuthProviderAndDataCacheEntry(): Cached provider data found without required content"

    invoke-static {v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    move v0, v1

    .line 445
    goto :goto_0

    :cond_3
    move v0, v2

    .line 449
    goto :goto_0
.end method


# virtual methods
.method public ensureUser(Ljava/lang/String;Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Lcom/getjar/sdk/comm/auth/AuthUIParentInterface;Lcom/getjar/sdk/comm/auth/ProviderHint;)Lcom/getjar/sdk/comm/auth/UserAuthResult;
    .locals 25
    .param p1, "currentAuthToken"    # Ljava/lang/String;
    .param p2, "commContext"    # Lcom/getjar/sdk/comm/CommContext;
    .param p3, "authFlowId"    # Ljava/lang/String;
    .param p4, "uiParent"    # Lcom/getjar/sdk/comm/auth/AuthUIParentInterface;
    .param p5, "providerHint"    # Lcom/getjar/sdk/comm/auth/ProviderHint;

    .prologue
    .line 149
    invoke-static/range {p1 .. p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v8, "\'currentAuthToken\' cannot be NULL or empty"

    invoke-direct {v5, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 150
    :cond_0
    if-nez p2, :cond_1

    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v8, "\'commContext\' cannot be NULL"

    invoke-direct {v5, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 151
    :cond_1
    invoke-static/range {p3 .. p3}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2

    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v8, "\'authFlowId\' cannot be NULL or empty"

    invoke-direct {v5, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 153
    :cond_2
    sget-object v5, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v19

    const-string v5, "AuthFlow: AndroidAccountUserAuthProvider: ensureUser() START"

    move-wide/from16 v0, v19

    invoke-static {v0, v1, v5}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 157
    :try_start_0
    sget-object v5, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v19

    const-string v5, "AuthFlow: AndroidAccountUserAuthProvider: ensureUser() Calling userAccessEnsure()"

    move-wide/from16 v0, v19

    invoke-static {v0, v1, v5}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 158
    invoke-static {}, Lcom/getjar/sdk/comm/AuthorizationServiceProxy;->getInstance()Lcom/getjar/sdk/comm/AuthorizationServiceProxy;

    move-result-object v4

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p4

    move-object/from16 v3, p5

    invoke-direct {v0, v1, v2, v3}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;->getProviderData(Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/comm/auth/AuthUIParentInterface;Lcom/getjar/sdk/comm/auth/ProviderHint;)Ljava/util/Map;

    move-result-object v8

    invoke-virtual/range {p0 .. p0}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;->getProviderFilter()Ljava/lang/String;

    move-result-object v9

    move-object/from16 v5, p2

    move-object/from16 v6, p3

    move-object/from16 v7, p1

    invoke-virtual/range {v4 .. v9}, Lcom/getjar/sdk/comm/AuthorizationServiceProxy;->userAccessEnsure(Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;)Lcom/getjar/sdk/comm/Operation;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v16

    .line 164
    .local v16, "operation":Lcom/getjar/sdk/comm/Operation;
    const/16 v17, 0x0

    .line 166
    .local v17, "result":Lcom/getjar/sdk/comm/Result;
    :try_start_1
    invoke-virtual/range {v16 .. v16}, Lcom/getjar/sdk/comm/Operation;->get()Lcom/getjar/sdk/comm/Result;
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_3
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v17

    .line 176
    if-nez v17, :cond_3

    .line 177
    :try_start_2
    sget-object v5, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v19

    const-string v5, "AuthFlow: AndroidAccountUserAuthProvider: ensureUser() failed to get results"

    move-wide/from16 v0, v19

    invoke-static {v0, v1, v5}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;)V

    .line 178
    new-instance v4, Lcom/getjar/sdk/comm/auth/UserAuthResult;

    invoke-virtual/range {p0 .. p0}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;->getProviderFilter()Ljava/lang/String;

    move-result-object v5

    sget-object v8, Lcom/getjar/sdk/comm/auth/AuthResult$State;->UNKNOWN_FAILURE:Lcom/getjar/sdk/comm/auth/AuthResult$State;

    invoke-direct {v4, v5, v8}, Lcom/getjar/sdk/comm/auth/UserAuthResult;-><init>(Ljava/lang/String;Lcom/getjar/sdk/comm/auth/AuthResult$State;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_3
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 258
    sget-object v5, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v19

    const-string v5, "AuthFlow: AndroidAccountUserAuthProvider: ensureUser() DONE"

    move-wide/from16 v0, v19

    invoke-static {v0, v1, v5}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 260
    .end local v16    # "operation":Lcom/getjar/sdk/comm/Operation;
    .end local v17    # "result":Lcom/getjar/sdk/comm/Result;
    :goto_0
    return-object v4

    .line 167
    .restart local v16    # "operation":Lcom/getjar/sdk/comm/Operation;
    .restart local v17    # "result":Lcom/getjar/sdk/comm/Result;
    :catch_0
    move-exception v15

    .line 168
    .local v15, "e":Ljava/lang/InterruptedException;
    :try_start_3
    sget-object v5, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v19

    const-string v5, "AuthFlow: AndroidAccountUserAuthProvider: ensureUser() operation.get() failed"

    move-wide/from16 v0, v19

    invoke-static {v0, v1, v5, v15}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 169
    new-instance v4, Lcom/getjar/sdk/comm/auth/UserAuthResult;

    invoke-virtual/range {p0 .. p0}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;->getProviderFilter()Ljava/lang/String;

    move-result-object v5

    sget-object v8, Lcom/getjar/sdk/comm/auth/AuthResult$State;->UNKNOWN_FAILURE:Lcom/getjar/sdk/comm/auth/AuthResult$State;

    invoke-direct {v4, v5, v8}, Lcom/getjar/sdk/comm/auth/UserAuthResult;-><init>(Ljava/lang/String;Lcom/getjar/sdk/comm/auth/AuthResult$State;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 258
    sget-object v5, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v19

    const-string v5, "AuthFlow: AndroidAccountUserAuthProvider: ensureUser() DONE"

    move-wide/from16 v0, v19

    invoke-static {v0, v1, v5}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    goto :goto_0

    .line 170
    .end local v15    # "e":Ljava/lang/InterruptedException;
    :catch_1
    move-exception v15

    .line 171
    .local v15, "e":Ljava/util/concurrent/ExecutionException;
    :try_start_4
    sget-object v5, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v19

    const-string v5, "AuthFlow: AndroidAccountUserAuthProvider: ensureUser() operation.get() failed"

    move-wide/from16 v0, v19

    invoke-static {v0, v1, v5, v15}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 172
    new-instance v4, Lcom/getjar/sdk/comm/auth/UserAuthResult;

    invoke-virtual/range {p0 .. p0}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;->getProviderFilter()Ljava/lang/String;

    move-result-object v5

    sget-object v8, Lcom/getjar/sdk/comm/auth/AuthResult$State;->UNKNOWN_FAILURE:Lcom/getjar/sdk/comm/auth/AuthResult$State;

    invoke-direct {v4, v5, v8}, Lcom/getjar/sdk/comm/auth/UserAuthResult;-><init>(Ljava/lang/String;Lcom/getjar/sdk/comm/auth/AuthResult$State;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 258
    sget-object v5, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v19

    const-string v5, "AuthFlow: AndroidAccountUserAuthProvider: ensureUser() DONE"

    move-wide/from16 v0, v19

    invoke-static {v0, v1, v5}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    goto :goto_0

    .line 181
    .end local v15    # "e":Ljava/util/concurrent/ExecutionException;
    :cond_3
    :try_start_5
    invoke-virtual/range {v17 .. v17}, Lcom/getjar/sdk/comm/Result;->isSuccessfulResponse()Z

    move-result v5

    if-eqz v5, :cond_6

    .line 182
    sget-object v5, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v19

    const-string v5, "AuthFlow: AndroidAccountUserAuthProvider: ensureUser() got successful results"

    move-wide/from16 v0, v19

    invoke-static {v0, v1, v5}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 185
    invoke-static/range {v17 .. v17}, Lcom/getjar/sdk/comm/auth/AuthUtilities;->getClaimsFromResult(Lcom/getjar/sdk/comm/Result;)Ljava/util/Map;

    move-result-object v10

    .line 186
    .local v10, "claims":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-static/range {v17 .. v17}, Lcom/getjar/sdk/comm/auth/AuthUtilities;->getSettingsFromResult(Lcom/getjar/sdk/comm/Result;)Ljava/util/Map;

    move-result-object v11

    .line 187
    .local v11, "settings":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/getjar/sdk/comm/auth/SettingsValue;>;"
    invoke-static/range {v17 .. v17}, Lcom/getjar/sdk/comm/auth/AuthUtilities;->getAuthTokenFromHeaders(Lcom/getjar/sdk/comm/Result;)Ljava/lang/String;

    move-result-object v9

    .line 188
    .local v9, "newAuthToken":Ljava/lang/String;
    const-wide/32 v19, 0xa4cb800

    move-wide/from16 v0, v19

    invoke-static {v10, v0, v1}, Lcom/getjar/sdk/comm/auth/AuthUtilities;->getTTLFromClaims(Ljava/util/Map;J)J

    move-result-wide v12

    .line 191
    .local v12, "ttl":J
    const/4 v6, 0x0

    .line 192
    .local v6, "userAccessId":Ljava/lang/String;
    const/4 v7, 0x0

    .line 193
    .local v7, "userDeviceId":Ljava/lang/String;
    if-eqz v10, :cond_4

    .line 194
    const-string v5, "claims.user.user_access_id"

    invoke-interface {v10, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    .end local v6    # "userAccessId":Ljava/lang/String;
    check-cast v6, Ljava/lang/String;

    .line 195
    .restart local v6    # "userAccessId":Ljava/lang/String;
    const-string v5, "claims.user.device.id"

    invoke-interface {v10, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    .end local v7    # "userDeviceId":Ljava/lang/String;
    check-cast v7, Ljava/lang/String;
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 201
    .restart local v7    # "userDeviceId":Ljava/lang/String;
    :cond_4
    :try_start_6
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;->_accountResolver:Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;

    invoke-virtual/range {p2 .. p2}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v8

    invoke-static {v5, v8}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;->access$100(Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;Landroid/content/Context;)Ljava/lang/String;

    move-result-object v14

    .line 202
    .local v14, "accountName":Ljava/lang/String;
    invoke-virtual/range {p2 .. p2}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5}, Lcom/getjar/sdk/comm/auth/AccountHistoryManager;->initialize(Landroid/content/Context;)V

    .line 203
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AccountHistoryManager;->getInstance()Lcom/getjar/sdk/comm/auth/AccountHistoryManager;

    move-result-object v5

    invoke-virtual/range {p0 .. p0}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;->getProviderFilter()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v6, v7, v14, v8}, Lcom/getjar/sdk/comm/auth/AccountHistoryManager;->ensureAccountEntry(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 206
    invoke-virtual/range {v17 .. v17}, Lcom/getjar/sdk/comm/Result;->isSuccessfulCreationResponse()Z

    move-result v5

    if-eqz v5, :cond_5

    .line 207
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AccountHistoryManager;->getInstance()Lcom/getjar/sdk/comm/auth/AccountHistoryManager;

    move-result-object v5

    sget-object v8, Lcom/getjar/sdk/comm/auth/AccountEventType;->AUTH_FIRST_TIME:Lcom/getjar/sdk/comm/auth/AccountEventType;

    invoke-virtual {v5, v6, v8}, Lcom/getjar/sdk/comm/auth/AccountHistoryManager;->addEvent(Ljava/lang/String;Lcom/getjar/sdk/comm/auth/AccountEventType;)V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_2
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 219
    .end local v14    # "accountName":Ljava/lang/String;
    :goto_1
    :try_start_7
    new-instance v4, Lcom/getjar/sdk/comm/auth/UserAuthResult;

    invoke-virtual/range {p0 .. p0}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;->getProviderFilter()Ljava/lang/String;

    move-result-object v5

    invoke-virtual/range {v17 .. v17}, Lcom/getjar/sdk/comm/Result;->isSuccessfulCreationResponse()Z

    move-result v8

    invoke-direct/range {v4 .. v13}, Lcom/getjar/sdk/comm/auth/UserAuthResult;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Ljava/util/Map;Ljava/util/Map;J)V

    .line 228
    .local v4, "authResult":Lcom/getjar/sdk/comm/auth/UserAuthResult;
    sget-object v5, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v19

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v8, "AuthFlow: AndroidAccountUserAuthProvider: ensureUser() DONE [userAccessId:%1$s, userDeviceId%2$s, authToken:%3$s, claimsCount:%4$d, ttl:%5$d]"

    const/16 v21, 0x5

    move/from16 v0, v21

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    invoke-virtual {v4}, Lcom/getjar/sdk/comm/auth/UserAuthResult;->getUserAccessId()Ljava/lang/String;

    move-result-object v23

    aput-object v23, v21, v22

    const/16 v22, 0x1

    invoke-virtual {v4}, Lcom/getjar/sdk/comm/auth/UserAuthResult;->getUserDeviceId()Ljava/lang/String;

    move-result-object v23

    aput-object v23, v21, v22

    const/16 v22, 0x2

    invoke-virtual {v4}, Lcom/getjar/sdk/comm/auth/UserAuthResult;->getAuthToken()Ljava/lang/String;

    move-result-object v23

    aput-object v23, v21, v22

    const/16 v22, 0x3

    invoke-virtual {v4}, Lcom/getjar/sdk/comm/auth/UserAuthResult;->getClaims()Ljava/util/Map;

    move-result-object v23

    invoke-interface/range {v23 .. v23}, Ljava/util/Map;->size()I

    move-result v23

    invoke-static/range {v23 .. v23}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v23

    aput-object v23, v21, v22

    const/16 v22, 0x4

    invoke-virtual {v4}, Lcom/getjar/sdk/comm/auth/UserAuthResult;->getTTL()J

    move-result-wide v23

    invoke-static/range {v23 .. v24}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v23

    aput-object v23, v21, v22

    move-object/from16 v0, v21

    invoke-static {v5, v8, v0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    move-wide/from16 v0, v19

    invoke-static {v0, v1, v5}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_3
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 258
    sget-object v5, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v19

    const-string v5, "AuthFlow: AndroidAccountUserAuthProvider: ensureUser() DONE"

    move-wide/from16 v0, v19

    invoke-static {v0, v1, v5}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    goto/16 :goto_0

    .line 209
    .end local v4    # "authResult":Lcom/getjar/sdk/comm/auth/UserAuthResult;
    .restart local v14    # "accountName":Ljava/lang/String;
    :cond_5
    :try_start_8
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AccountHistoryManager;->getInstance()Lcom/getjar/sdk/comm/auth/AccountHistoryManager;

    move-result-object v5

    sget-object v8, Lcom/getjar/sdk/comm/auth/AccountEventType;->AUTH:Lcom/getjar/sdk/comm/auth/AccountEventType;

    invoke-virtual {v5, v6, v8}, Lcom/getjar/sdk/comm/auth/AccountHistoryManager;->addEvent(Ljava/lang/String;Lcom/getjar/sdk/comm/auth/AccountEventType;)V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_2
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    goto :goto_1

    .line 212
    .end local v14    # "accountName":Ljava/lang/String;
    :catch_2
    move-exception v15

    .line 215
    .local v15, "e":Ljava/lang/Exception;
    :try_start_9
    sget-object v5, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v19

    const-string v5, "AccountHistoryManager work failed"

    move-wide/from16 v0, v19

    invoke-static {v0, v1, v5, v15}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_3
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    goto/16 :goto_1

    .line 255
    .end local v6    # "userAccessId":Ljava/lang/String;
    .end local v7    # "userDeviceId":Ljava/lang/String;
    .end local v9    # "newAuthToken":Ljava/lang/String;
    .end local v10    # "claims":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v11    # "settings":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/getjar/sdk/comm/auth/SettingsValue;>;"
    .end local v12    # "ttl":J
    .end local v15    # "e":Ljava/lang/Exception;
    .end local v16    # "operation":Lcom/getjar/sdk/comm/Operation;
    .end local v17    # "result":Lcom/getjar/sdk/comm/Result;
    :catch_3
    move-exception v15

    .line 256
    .restart local v15    # "e":Ljava/lang/Exception;
    :try_start_a
    sget-object v5, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v19

    const-string v5, "AuthFlow: AndroidAccountUserAuthProvider: ensureUser() failed"

    move-wide/from16 v0, v19

    invoke-static {v0, v1, v5, v15}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    .line 258
    sget-object v5, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v19

    const-string v5, "AuthFlow: AndroidAccountUserAuthProvider: ensureUser() DONE"

    move-wide/from16 v0, v19

    invoke-static {v0, v1, v5}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 260
    new-instance v4, Lcom/getjar/sdk/comm/auth/UserAuthResult;

    invoke-virtual/range {p0 .. p0}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;->getProviderFilter()Ljava/lang/String;

    move-result-object v5

    sget-object v8, Lcom/getjar/sdk/comm/auth/AuthResult$State;->UNKNOWN_FAILURE:Lcom/getjar/sdk/comm/auth/AuthResult$State;

    invoke-direct {v4, v5, v8}, Lcom/getjar/sdk/comm/auth/UserAuthResult;-><init>(Ljava/lang/String;Lcom/getjar/sdk/comm/auth/AuthResult$State;)V

    goto/16 :goto_0

    .line 237
    .end local v15    # "e":Ljava/lang/Exception;
    .restart local v16    # "operation":Lcom/getjar/sdk/comm/Operation;
    .restart local v17    # "result":Lcom/getjar/sdk/comm/Result;
    :cond_6
    :try_start_b
    sget-object v5, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v19

    const-string v5, "AuthFlow: AndroidAccountUserAuthProvider: ensureUser() got failure results"

    move-wide/from16 v0, v19

    invoke-static {v0, v1, v5}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;)V

    .line 240
    invoke-static/range {v17 .. v17}, Lcom/getjar/sdk/comm/RequestUtilities;->getServicesException(Lcom/getjar/sdk/comm/Result;)Lcom/getjar/sdk/exceptions/ServiceException;

    move-result-object v18

    .line 241
    .local v18, "servicesException":Lcom/getjar/sdk/exceptions/ServiceException;
    if-eqz v18, :cond_7

    .line 242
    move-object/from16 v0, p2

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/getjar/sdk/comm/CommContext;->addException(Ljava/lang/Throwable;)V

    .line 246
    :cond_7
    move-object/from16 v0, v17

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lcom/getjar/sdk/comm/Result;->checkForBlacklistedOrUnsupported(Lcom/getjar/sdk/comm/CommContext;)Z

    move-result v5

    if-eqz v5, :cond_8

    .line 247
    sget-object v5, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v19

    const-string v5, "AuthFlow: AndroidAccountUserAuthProvider: ensureUser() We are blacklisted or unsupported"

    move-wide/from16 v0, v19

    invoke-static {v0, v1, v5}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 248
    new-instance v4, Lcom/getjar/sdk/comm/auth/UserAuthResult;

    invoke-virtual/range {p0 .. p0}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;->getProviderFilter()Ljava/lang/String;

    move-result-object v5

    sget-object v8, Lcom/getjar/sdk/comm/auth/AuthResult$State;->UNSUPPORTED:Lcom/getjar/sdk/comm/auth/AuthResult$State;

    invoke-direct {v4, v5, v8}, Lcom/getjar/sdk/comm/auth/UserAuthResult;-><init>(Ljava/lang/String;Lcom/getjar/sdk/comm/auth/AuthResult$State;)V
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_3
    .catchall {:try_start_b .. :try_end_b} :catchall_0

    .line 258
    sget-object v5, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v19

    const-string v5, "AuthFlow: AndroidAccountUserAuthProvider: ensureUser() DONE"

    move-wide/from16 v0, v19

    invoke-static {v0, v1, v5}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    goto/16 :goto_0

    .line 250
    :cond_8
    :try_start_c
    new-instance v4, Lcom/getjar/sdk/comm/auth/UserAuthResult;

    invoke-virtual/range {p0 .. p0}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;->getProviderFilter()Ljava/lang/String;

    move-result-object v5

    sget-object v8, Lcom/getjar/sdk/comm/auth/AuthResult$State;->UNKNOWN_FAILURE:Lcom/getjar/sdk/comm/auth/AuthResult$State;

    invoke-direct {v4, v5, v8}, Lcom/getjar/sdk/comm/auth/UserAuthResult;-><init>(Ljava/lang/String;Lcom/getjar/sdk/comm/auth/AuthResult$State;)V
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_3
    .catchall {:try_start_c .. :try_end_c} :catchall_0

    .line 258
    sget-object v5, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v19

    const-string v5, "AuthFlow: AndroidAccountUserAuthProvider: ensureUser() DONE"

    move-wide/from16 v0, v19

    invoke-static {v0, v1, v5}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    goto/16 :goto_0

    .end local v16    # "operation":Lcom/getjar/sdk/comm/Operation;
    .end local v17    # "result":Lcom/getjar/sdk/comm/Result;
    .end local v18    # "servicesException":Lcom/getjar/sdk/exceptions/ServiceException;
    :catchall_0
    move-exception v5

    sget-object v8, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v8}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v19

    const-string v8, "AuthFlow: AndroidAccountUserAuthProvider: ensureUser() DONE"

    move-wide/from16 v0, v19

    invoke-static {v0, v1, v8}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    throw v5
.end method

.method public getCachedAccountName(Landroid/content/Context;)Ljava/lang/String;
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 315
    iget-object v0, p0, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;->_accountResolver:Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    .line 316
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;->_accountResolver:Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;

    invoke-static {v0, p1}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;->access$100(Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public getProviderFilter()Ljava/lang/String;
    .locals 1

    .prologue
    .line 103
    const-string v0, "android_account"

    return-object v0
.end method

.method public getProxiableAuthData(Landroid/content/Context;)Ljava/util/Map;
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 120
    if-nez p1, :cond_0

    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "\'context\' cannot be NULL"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 121
    :cond_0
    iget-object v3, p0, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;->_accountResolver:Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;

    invoke-static {v3, p1}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;->access$100(Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 122
    .local v0, "cachedAccountName":Ljava/lang/String;
    invoke-static {v0}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 123
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v4, "The provider does not currently have the data needed"

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 127
    :cond_1
    new-instance v2, Ljava/util/HashMap;

    const/4 v3, 0x2

    invoke-direct {v2, v3}, Ljava/util/HashMap;-><init>(I)V

    .line 128
    .local v2, "resultMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v3, "provider_filter"

    invoke-virtual {p0}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;->getProviderFilter()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 130
    :try_start_0
    const-string v3, "android_account.username_data_hash"

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v0, v4}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/getjar/sdk/utilities/CryptoUtility;->getSHA256(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_1

    .line 137
    return-object v2

    .line 131
    :catch_0
    move-exception v1

    .line 132
    .local v1, "e":Ljava/security/NoSuchAlgorithmException;
    new-instance v3, Lcom/getjar/sdk/exceptions/AuthException;

    invoke-direct {v3, v1}, Lcom/getjar/sdk/exceptions/AuthException;-><init>(Ljava/lang/Throwable;)V

    throw v3

    .line 133
    .end local v1    # "e":Ljava/security/NoSuchAlgorithmException;
    :catch_1
    move-exception v1

    .line 134
    .local v1, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v3, Lcom/getjar/sdk/exceptions/AuthException;

    invoke-direct {v3, v1}, Lcom/getjar/sdk/exceptions/AuthException;-><init>(Ljava/lang/Throwable;)V

    throw v3
.end method

.method public isUINeeded(Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Lcom/getjar/sdk/comm/auth/ProviderHint;)Z
    .locals 11
    .param p1, "commContext"    # Lcom/getjar/sdk/comm/CommContext;
    .param p2, "authFlowId"    # Ljava/lang/String;
    .param p3, "providerHint"    # Lcom/getjar/sdk/comm/auth/ProviderHint;

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 266
    if-nez p1, :cond_0

    new-instance v7, Ljava/lang/IllegalArgumentException;

    const-string v8, "\'commContext\' cannot be NULL"

    invoke-direct {v7, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 267
    :cond_0
    invoke-direct {p0, p3}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;->validateProviderHint(Lcom/getjar/sdk/comm/auth/ProviderHint;)V

    .line 270
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v9

    invoke-static {v9}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;->getAndroidAccountNames(Landroid/content/Context;)[Ljava/lang/CharSequence;

    move-result-object v0

    .line 271
    .local v0, "accountNames":[Ljava/lang/CharSequence;
    if-eqz v0, :cond_1

    array-length v9, v0

    if-gtz v9, :cond_3

    :cond_1
    move v7, v8

    .line 309
    :cond_2
    :goto_0
    return v7

    .line 278
    :cond_3
    const/4 v1, 0x0

    .line 279
    .local v1, "androidAccountName":Ljava/lang/String;
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v9

    invoke-direct {p0, v9}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;->getUserAuthProviderAndData(Landroid/content/Context;)Lcom/getjar/sdk/comm/auth/UserAuthProviderAndDataCacheEntry;

    move-result-object v6

    .line 280
    .local v6, "providerAndData":Lcom/getjar/sdk/comm/auth/UserAuthProviderAndDataCacheEntry;
    invoke-direct {p0, v6}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;->validateUserAuthProviderAndDataCacheEntry(Lcom/getjar/sdk/comm/auth/UserAuthProviderAndDataCacheEntry;)Z

    move-result v9

    if-eqz v9, :cond_4

    .line 281
    invoke-virtual {v6}, Lcom/getjar/sdk/comm/auth/UserAuthProviderAndDataCacheEntry;->getCachedProviderData()Ljava/util/HashMap;

    move-result-object v9

    const-string v10, "android.account.name"

    invoke-virtual {v9, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "androidAccountName":Ljava/lang/String;
    check-cast v1, Ljava/lang/String;

    .line 285
    .restart local v1    # "androidAccountName":Ljava/lang/String;
    :cond_4
    invoke-static {v1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_5

    .line 286
    move-object v2, v0

    .local v2, "arr$":[Ljava/lang/CharSequence;
    array-length v4, v2

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_1
    if-ge v3, v4, :cond_5

    aget-object v5, v2, v3

    .line 287
    .local v5, "name":Ljava/lang/CharSequence;
    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_2

    .line 286
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 295
    .end local v2    # "arr$":[Ljava/lang/CharSequence;
    .end local v3    # "i$":I
    .end local v4    # "len$":I
    .end local v5    # "name":Ljava/lang/CharSequence;
    :cond_5
    array-length v9, v0

    if-ne v9, v8, :cond_6

    iget-object v9, p0, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;->_accountResolver:Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;

    aget-object v10, v0, v7

    invoke-static {v9, p1, v10}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;->access$200(Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;Lcom/getjar/sdk/comm/CommContext;Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_2

    .line 302
    :cond_6
    invoke-direct {p0, p3}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;->isProviderHintForMe(Lcom/getjar/sdk/comm/auth/ProviderHint;)Z

    move-result v9

    if-eqz v9, :cond_7

    .line 303
    iget-object v9, p0, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;->_accountResolver:Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;

    invoke-static {v9, p1, p3}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;->access$300(Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/comm/auth/ProviderHint;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_2

    :cond_7
    move v7, v8

    .line 309
    goto :goto_0
.end method
