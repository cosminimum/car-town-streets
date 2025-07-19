.class Lcom/getjar/sdk/comm/CommManager$DoLaunchWork;
.super Ljava/lang/Object;
.source "CommManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getjar/sdk/comm/CommManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DoLaunchWork"
.end annotation


# instance fields
.field private final _androidContext:Landroid/content/Context;

.field private final _applicationToken:Ljava/lang/String;

.field private final _encryptionKey:Ljava/lang/String;

.field private final _launchWork:Lcom/getjar/sdk/comm/CommManager$LaunchWork;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;Lcom/getjar/sdk/comm/CommManager$LaunchWork;)V
    .locals 2
    .param p1, "applicationToken"    # Ljava/lang/String;
    .param p2, "encryptionKey"    # Ljava/lang/String;
    .param p3, "androidContext"    # Landroid/content/Context;
    .param p4, "launchWork"    # Lcom/getjar/sdk/comm/CommManager$LaunchWork;

    .prologue
    .line 1213
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1215
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'applicationToken\' cannot be NULL or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1216
    :cond_0
    if-nez p3, :cond_1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'androidContext\' cannot be NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1217
    :cond_1
    if-nez p4, :cond_2

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'launchWork\' cannot be NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1218
    :cond_2
    sget-object v0, Lcom/getjar/sdk/comm/CommManager$LaunchWork;->NONE:Lcom/getjar/sdk/comm/CommManager$LaunchWork;

    invoke-virtual {v0, p4}, Lcom/getjar/sdk/comm/CommManager$LaunchWork;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'launchWork\' cannot be NONE"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1220
    :cond_3
    iput-object p1, p0, Lcom/getjar/sdk/comm/CommManager$DoLaunchWork;->_applicationToken:Ljava/lang/String;

    .line 1221
    iput-object p2, p0, Lcom/getjar/sdk/comm/CommManager$DoLaunchWork;->_encryptionKey:Ljava/lang/String;

    .line 1222
    iput-object p3, p0, Lcom/getjar/sdk/comm/CommManager$DoLaunchWork;->_androidContext:Landroid/content/Context;

    .line 1223
    iput-object p4, p0, Lcom/getjar/sdk/comm/CommManager$DoLaunchWork;->_launchWork:Lcom/getjar/sdk/comm/CommManager$LaunchWork;

    .line 1224
    return-void
.end method

.method private doTransactionRelatedLaunchWork(Lcom/getjar/sdk/comm/CommContext;)V
    .locals 11
    .param p1, "launchWorkContext"    # Lcom/getjar/sdk/comm/CommContext;

    .prologue
    const/4 v10, 0x1

    const/4 v9, 0x0

    .line 1303
    :try_start_0
    new-instance v1, Lcom/getjar/sdk/comm/TransactionManager;

    invoke-virtual {p1}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/getjar/sdk/comm/TransactionManager;-><init>(Landroid/content/Context;)V

    .line 1304
    .local v1, "transactionManager":Lcom/getjar/sdk/comm/TransactionManager;
    invoke-virtual {v1, p1}, Lcom/getjar/sdk/comm/TransactionManager;->recoverOrphanedTransactions(Lcom/getjar/sdk/comm/CommContext;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1309
    .end local v1    # "transactionManager":Lcom/getjar/sdk/comm/TransactionManager;
    :goto_0
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v2

    invoke-virtual {p1}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/getjar/sdk/comm/auth/AuthManager;->getClaimsManager(Landroid/content/Context;)Lcom/getjar/sdk/comm/auth/ClaimsManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/getjar/sdk/comm/auth/ClaimsManager;->canPurchaseManagedProducts()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1314
    :try_start_1
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/rewards/InAppPurchaseManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->cancelOrphanedManagedOffers()V

    .line 1315
    sget-object v2, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "%1$s cancelOrphanedManagedOffers() success"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-static {}, Lcom/getjar/sdk/comm/CommManager;->access$300()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 1322
    :goto_1
    :try_start_2
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/rewards/InAppPurchaseManager;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->processOutstandingPurchases(Z)Z

    .line 1323
    sget-object v2, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "%1$s processOutstandingPurchases() success"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-static {}, Lcom/getjar/sdk/comm/CommManager;->access$300()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 1328
    :cond_0
    :goto_2
    return-void

    .line 1305
    :catch_0
    move-exception v0

    .line 1306
    .local v0, "e":Ljava/lang/Exception;
    sget-object v2, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "%1$s Recovering orphaned transactions failed"

    new-array v6, v10, [Ljava/lang/Object;

    invoke-static {}, Lcom/getjar/sdk/comm/CommManager;->access$300()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v9

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_0

    .line 1316
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v0

    .line 1317
    .restart local v0    # "e":Ljava/lang/Exception;
    sget-object v2, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "%1$s cancelOrphanedManagedOffers() failed"

    new-array v6, v10, [Ljava/lang/Object;

    invoke-static {}, Lcom/getjar/sdk/comm/CommManager;->access$300()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v9

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 1324
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_2
    move-exception v0

    .line 1325
    .restart local v0    # "e":Ljava/lang/Exception;
    sget-object v2, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "%1$s processOutstandingPurchases() failed"

    new-array v6, v10, [Ljava/lang/Object;

    invoke-static {}, Lcom/getjar/sdk/comm/CommManager;->access$300()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v9

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_2
.end method


# virtual methods
.method public run()V
    .locals 12

    .prologue
    const/4 v11, 0x1

    const/4 v10, 0x0

    .line 1230
    :try_start_0
    sget-object v3, Lcom/getjar/sdk/comm/CommManager$LaunchWork;->NONE:Lcom/getjar/sdk/comm/CommManager$LaunchWork;

    iget-object v4, p0, Lcom/getjar/sdk/comm/CommManager$DoLaunchWork;->_launchWork:Lcom/getjar/sdk/comm/CommManager$LaunchWork;

    invoke-virtual {v3, v4}, Lcom/getjar/sdk/comm/CommManager$LaunchWork;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 1231
    sget-object v3, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    const-string v5, "DoLaunchWork thread started with a LaunchWork value of NONE"

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;)V

    .line 1297
    :cond_0
    :goto_0
    return-void

    .line 1240
    :cond_1
    const/4 v1, 0x0

    .line 1241
    .local v1, "launchWorkContext":Lcom/getjar/sdk/comm/CommContext;
    iget-object v3, p0, Lcom/getjar/sdk/comm/CommManager$DoLaunchWork;->_encryptionKey:Ljava/lang/String;

    invoke-static {v3}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 1242
    new-instance v1, Lcom/getjar/sdk/comm/CommContext;

    .end local v1    # "launchWorkContext":Lcom/getjar/sdk/comm/CommContext;
    iget-object v3, p0, Lcom/getjar/sdk/comm/CommManager$DoLaunchWork;->_applicationToken:Ljava/lang/String;

    iget-object v4, p0, Lcom/getjar/sdk/comm/CommManager$DoLaunchWork;->_androidContext:Landroid/content/Context;

    const/4 v5, 0x0

    invoke-direct {v1, v3, v4, v5}, Lcom/getjar/sdk/comm/CommContext;-><init>(Ljava/lang/String;Landroid/content/Context;Landroid/os/ResultReceiver;)V

    .line 1246
    .restart local v1    # "launchWorkContext":Lcom/getjar/sdk/comm/CommContext;
    :goto_1
    invoke-static {}, Lcom/getjar/sdk/comm/CommManager;->access$200()Ljava/util/concurrent/ConcurrentHashMap;

    move-result-object v3

    invoke-virtual {v1}, Lcom/getjar/sdk/comm/CommContext;->getCommContextId()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4, v1}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1249
    sget-object v3, Lcom/getjar/sdk/comm/CommManager$LaunchWork;->DEALS:Lcom/getjar/sdk/comm/CommManager$LaunchWork;

    iget-object v4, p0, Lcom/getjar/sdk/comm/CommManager$DoLaunchWork;->_launchWork:Lcom/getjar/sdk/comm/CommManager$LaunchWork;

    invoke-virtual {v3, v4}, Lcom/getjar/sdk/comm/CommManager$LaunchWork;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 1252
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/getjar/sdk/comm/auth/AuthManager;->isNewUser()Z

    move-result v3

    if-nez v3, :cond_0

    .line 1255
    invoke-direct {p0, v1}, Lcom/getjar/sdk/comm/CommManager$DoLaunchWork;->doTransactionRelatedLaunchWork(Lcom/getjar/sdk/comm/CommContext;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1292
    .end local v1    # "launchWorkContext":Lcom/getjar/sdk/comm/CommContext;
    :catch_0
    move-exception v0

    .line 1295
    .local v0, "e":Ljava/lang/Exception;
    sget-object v3, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "%1$s DoLaunchWork.run() failed"

    new-array v7, v11, [Ljava/lang/Object;

    invoke-static {}, Lcom/getjar/sdk/comm/CommManager;->access$300()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v7, v10

    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 1244
    .end local v0    # "e":Ljava/lang/Exception;
    .restart local v1    # "launchWorkContext":Lcom/getjar/sdk/comm/CommContext;
    :cond_2
    :try_start_1
    new-instance v1, Lcom/getjar/sdk/comm/CommContext;

    .end local v1    # "launchWorkContext":Lcom/getjar/sdk/comm/CommContext;
    iget-object v3, p0, Lcom/getjar/sdk/comm/CommManager$DoLaunchWork;->_applicationToken:Ljava/lang/String;

    iget-object v4, p0, Lcom/getjar/sdk/comm/CommManager$DoLaunchWork;->_encryptionKey:Ljava/lang/String;

    iget-object v5, p0, Lcom/getjar/sdk/comm/CommManager$DoLaunchWork;->_androidContext:Landroid/content/Context;

    const/4 v6, 0x0

    invoke-direct {v1, v3, v4, v5, v6}, Lcom/getjar/sdk/comm/CommContext;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;Landroid/os/ResultReceiver;)V

    .restart local v1    # "launchWorkContext":Lcom/getjar/sdk/comm/CommContext;
    goto :goto_1

    .line 1258
    :cond_3
    sget-object v3, Lcom/getjar/sdk/comm/CommManager$LaunchWork;->ALL:Lcom/getjar/sdk/comm/CommManager$LaunchWork;

    iget-object v4, p0, Lcom/getjar/sdk/comm/CommManager$DoLaunchWork;->_launchWork:Lcom/getjar/sdk/comm/CommManager$LaunchWork;

    invoke-virtual {v3, v4}, Lcom/getjar/sdk/comm/CommManager$LaunchWork;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 1261
    invoke-virtual {v1}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/getjar/sdk/data/usage/UsageManager;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/usage/UsageManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/getjar/sdk/data/usage/UsageManager;->startPhoneSession()V

    .line 1264
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/getjar/sdk/comm/auth/AuthManager;->isNewUser()Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result v3

    if-nez v3, :cond_4

    .line 1268
    :try_start_2
    new-instance v2, Lcom/getjar/sdk/data/LicenseEngine;

    invoke-direct {v2, v1}, Lcom/getjar/sdk/data/LicenseEngine;-><init>(Lcom/getjar/sdk/comm/CommContext;)V

    .line 1269
    .local v2, "licenseEngine":Lcom/getjar/sdk/data/LicenseEngine;
    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/getjar/sdk/data/LicenseEngine;->retrieveServerProductLicenses(Z)V

    .line 1270
    sget-object v3, Lcom/getjar/sdk/logging/Area;->LICENSING:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "%1$s Updating License cache success"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    invoke-static {}, Lcom/getjar/sdk/comm/CommManager;->access$300()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 1276
    .end local v2    # "licenseEngine":Lcom/getjar/sdk/data/LicenseEngine;
    :goto_2
    :try_start_3
    invoke-direct {p0, v1}, Lcom/getjar/sdk/comm/CommManager$DoLaunchWork;->doTransactionRelatedLaunchWork(Lcom/getjar/sdk/comm/CommContext;)V

    .line 1279
    :cond_4
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v3

    invoke-virtual {v1}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/getjar/sdk/comm/auth/AuthManager;->getClaimsManager(Landroid/content/Context;)Lcom/getjar/sdk/comm/auth/ClaimsManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/getjar/sdk/comm/auth/ClaimsManager;->canBuy()Z
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    move-result v3

    if-eqz v3, :cond_0

    .line 1282
    :try_start_4
    invoke-virtual {v1}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/rewards/InAppPurchaseManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->getGoldOffers()Ljava/lang/String;
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    goto/16 :goto_0

    .line 1283
    :catch_1
    move-exception v0

    .line 1284
    .restart local v0    # "e":Ljava/lang/Exception;
    :try_start_5
    sget-object v3, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "%1$s getGoldOffers() failed"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    invoke-static {}, Lcom/getjar/sdk/comm/CommManager;->access$300()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_0

    .line 1271
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_2
    move-exception v0

    .line 1272
    .restart local v0    # "e":Ljava/lang/Exception;
    sget-object v3, Lcom/getjar/sdk/logging/Area;->LICENSING:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "%1$s Updating License cache failed"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    invoke-static {}, Lcom/getjar/sdk/comm/CommManager;->access$300()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_2

    .line 1289
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_5
    new-instance v3, Ljava/lang/IllegalStateException;

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "Unsupported LaunchWork value [%1$s]"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    iget-object v8, p0, Lcom/getjar/sdk/comm/CommManager$DoLaunchWork;->_launchWork:Lcom/getjar/sdk/comm/CommManager$LaunchWork;

    invoke-virtual {v8}, Lcom/getjar/sdk/comm/CommManager$LaunchWork;->name()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0
.end method
