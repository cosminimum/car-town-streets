.class Lcom/getjar/sdk/comm/TransactionManager$EarnCallback;
.super Ljava/lang/Object;
.source "TransactionManager.java"

# interfaces
.implements Lcom/getjar/sdk/comm/CallbackInterface;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getjar/sdk/comm/TransactionManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "EarnCallback"
.end annotation


# instance fields
.field private _earnBucket:Lcom/getjar/sdk/comm/persistence/EarnBucket;

.field private _earnData:Lcom/getjar/sdk/comm/persistence/RelatedEarnData;

.field final synthetic this$0:Lcom/getjar/sdk/comm/TransactionManager;


# direct methods
.method public constructor <init>(Lcom/getjar/sdk/comm/TransactionManager;Lcom/getjar/sdk/comm/persistence/EarnBucket;Lcom/getjar/sdk/comm/persistence/RelatedEarnData;)V
    .locals 2
    .param p2, "earnBucket"    # Lcom/getjar/sdk/comm/persistence/EarnBucket;
    .param p3, "earn"    # Lcom/getjar/sdk/comm/persistence/RelatedEarnData;

    .prologue
    const/4 v0, 0x0

    .line 1742
    iput-object p1, p0, Lcom/getjar/sdk/comm/TransactionManager$EarnCallback;->this$0:Lcom/getjar/sdk/comm/TransactionManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1739
    iput-object v0, p0, Lcom/getjar/sdk/comm/TransactionManager$EarnCallback;->_earnData:Lcom/getjar/sdk/comm/persistence/RelatedEarnData;

    .line 1740
    iput-object v0, p0, Lcom/getjar/sdk/comm/TransactionManager$EarnCallback;->_earnBucket:Lcom/getjar/sdk/comm/persistence/EarnBucket;

    .line 1743
    if-nez p3, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'earn\' can not be NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1744
    :cond_0
    if-nez p2, :cond_1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'earnBucket\' can not be NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1745
    :cond_1
    invoke-virtual {p2}, Lcom/getjar/sdk/comm/persistence/EarnBucket;->getClientTransactionId()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'earnBucket.getClientTransactionId()\' can not be NULL or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1746
    :cond_2
    iput-object p3, p0, Lcom/getjar/sdk/comm/TransactionManager$EarnCallback;->_earnData:Lcom/getjar/sdk/comm/persistence/RelatedEarnData;

    .line 1747
    iput-object p2, p0, Lcom/getjar/sdk/comm/TransactionManager$EarnCallback;->_earnBucket:Lcom/getjar/sdk/comm/persistence/EarnBucket;

    .line 1748
    return-void
.end method

.method private updateEarnStateInAppStatePersistence(Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Lcom/getjar/sdk/comm/Result;Lcom/getjar/sdk/data/earning/EarnStateDatabase$EarnState;)V
    .locals 2
    .param p1, "commContext"    # Lcom/getjar/sdk/comm/CommContext;
    .param p2, "packageName"    # Ljava/lang/String;
    .param p3, "result"    # Lcom/getjar/sdk/comm/Result;
    .param p4, "state"    # Lcom/getjar/sdk/data/earning/EarnStateDatabase$EarnState;

    .prologue
    .line 1884
    if-nez p3, :cond_0

    .line 1887
    :goto_0
    return-void

    .line 1885
    :cond_0
    const-string v1, "NONE"

    invoke-static {p3, v1}, Lcom/getjar/sdk/comm/TransactionManager;->getTransactionSubstate(Lcom/getjar/sdk/comm/Result;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1886
    .local v0, "substate":Ljava/lang/String;
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/getjar/sdk/data/earning/EarnStateDatabase;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/earning/EarnStateDatabase;

    move-result-object v1

    invoke-virtual {v1, p2, p4, v0}, Lcom/getjar/sdk/data/earning/EarnStateDatabase;->updateEarnState(Ljava/lang/String;Lcom/getjar/sdk/data/earning/EarnStateDatabase$EarnState;Ljava/lang/String;)V

    goto :goto_0
.end method


# virtual methods
.method public serviceRequestFailed(Lcom/getjar/sdk/comm/Result;Ljava/lang/Exception;Ljava/lang/String;Lcom/getjar/sdk/comm/CommContext;)V
    .locals 12
    .param p1, "result"    # Lcom/getjar/sdk/comm/Result;
    .param p2, "cause"    # Ljava/lang/Exception;
    .param p3, "requestId"    # Ljava/lang/String;
    .param p4, "commContext"    # Lcom/getjar/sdk/comm/CommContext;

    .prologue
    .line 1841
    sget-object v5, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    sget-object v7, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    or-long/2addr v5, v7

    sget-object v7, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v8, "TransactionManager: EarnCallback: request failed [clientTransactionId: %1$s]"

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    iget-object v11, p0, Lcom/getjar/sdk/comm/TransactionManager$EarnCallback;->_earnBucket:Lcom/getjar/sdk/comm/persistence/EarnBucket;

    invoke-virtual {v11}, Lcom/getjar/sdk/comm/persistence/EarnBucket;->getClientTransactionId()Ljava/lang/String;

    move-result-object v11

    aput-object v11, v9, v10

    invoke-static {v7, v8, v9}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v6, v7}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 1846
    invoke-virtual/range {p4 .. p4}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    .line 1848
    .local v4, "packageManager":Landroid/content/pm/PackageManager;
    iget-object v5, p0, Lcom/getjar/sdk/comm/TransactionManager$EarnCallback;->_earnData:Lcom/getjar/sdk/comm/persistence/RelatedEarnData;

    invoke-virtual {v5}, Lcom/getjar/sdk/comm/persistence/RelatedEarnData;->getPackageName()Ljava/lang/String;

    move-result-object v2

    .line 1850
    .local v2, "hostApplicationName":Ljava/lang/String;
    :try_start_0
    iget-object v5, p0, Lcom/getjar/sdk/comm/TransactionManager$EarnCallback;->_earnData:Lcom/getjar/sdk/comm/persistence/RelatedEarnData;

    invoke-virtual {v5}, Lcom/getjar/sdk/comm/persistence/RelatedEarnData;->getPackageName()Ljava/lang/String;

    move-result-object v5

    const/16 v6, 0x80

    invoke-virtual {v4, v5, v6}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v3

    .line 1851
    .local v3, "packageInfo":Landroid/content/pm/PackageInfo;
    iget-object v5, v3, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    invoke-virtual {v5, v4}, Landroid/content/pm/ApplicationInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object v5

    move-object v0, v5

    check-cast v0, Ljava/lang/String;

    move-object v2, v0
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1857
    .end local v3    # "packageInfo":Landroid/content/pm/PackageInfo;
    :goto_0
    sget-object v5, Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;->NONE:Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;

    iget-object v6, p0, Lcom/getjar/sdk/comm/TransactionManager$EarnCallback;->_earnBucket:Lcom/getjar/sdk/comm/persistence/EarnBucket;

    invoke-virtual {v6}, Lcom/getjar/sdk/comm/persistence/EarnBucket;->getNotificationState()Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    iget-object v5, p0, Lcom/getjar/sdk/comm/TransactionManager$EarnCallback;->_earnData:Lcom/getjar/sdk/comm/persistence/RelatedEarnData;

    invoke-virtual {v5}, Lcom/getjar/sdk/comm/persistence/RelatedEarnData;->getPackageName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "com.getjar.rewards"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 1858
    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "Thank you for installing %1$s! No gold was earned."

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object v2, v7, v8

    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, p4

    invoke-static {v0, v5}, Lcom/getjar/sdk/utilities/NotificationsUtility;->pushFailNotification(Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;)V

    .line 1859
    invoke-virtual/range {p4 .. p4}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/comm/persistence/DBTransactions;

    move-result-object v5

    iget-object v6, p0, Lcom/getjar/sdk/comm/TransactionManager$EarnCallback;->_earnBucket:Lcom/getjar/sdk/comm/persistence/EarnBucket;

    sget-object v7, Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;->NO_GOLD:Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;

    invoke-virtual {v5, v6, v7}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->updateEarnTransactionNotificationState(Lcom/getjar/sdk/comm/persistence/EarnBucket;Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;)Z

    .line 1863
    :cond_0
    if-eqz p2, :cond_1

    const-class v5, Lcom/getjar/sdk/exceptions/ServiceException;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 1864
    iget-object v5, p0, Lcom/getjar/sdk/comm/TransactionManager$EarnCallback;->_earnData:Lcom/getjar/sdk/comm/persistence/RelatedEarnData;

    invoke-virtual {v5}, Lcom/getjar/sdk/comm/persistence/RelatedEarnData;->getPackageName()Ljava/lang/String;

    move-result-object v5

    check-cast p2, Lcom/getjar/sdk/exceptions/ServiceException;

    .end local p2    # "cause":Ljava/lang/Exception;
    invoke-virtual {p2}, Lcom/getjar/sdk/exceptions/ServiceException;->getRequestResult()Lcom/getjar/sdk/comm/Result;

    move-result-object v6

    sget-object v7, Lcom/getjar/sdk/data/earning/EarnStateDatabase$EarnState;->FAIL:Lcom/getjar/sdk/data/earning/EarnStateDatabase$EarnState;

    move-object/from16 v0, p4

    invoke-direct {p0, v0, v5, v6, v7}, Lcom/getjar/sdk/comm/TransactionManager$EarnCallback;->updateEarnStateInAppStatePersistence(Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Lcom/getjar/sdk/comm/Result;Lcom/getjar/sdk/data/earning/EarnStateDatabase$EarnState;)V

    .line 1870
    :cond_1
    return-void

    .line 1852
    .restart local p2    # "cause":Ljava/lang/Exception;
    :catch_0
    move-exception v1

    .line 1853
    .local v1, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    sget-object v5, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    sget-object v7, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    or-long/2addr v5, v7

    const-string v7, "Package info not found"

    invoke-static {v5, v6, v7, v1}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public serviceRequestRetry(Ljava/lang/Exception;Ljava/lang/String;Lcom/getjar/sdk/comm/CommContext;I)V
    .locals 7
    .param p1, "cause"    # Ljava/lang/Exception;
    .param p2, "requestId"    # Ljava/lang/String;
    .param p3, "commContext"    # Lcom/getjar/sdk/comm/CommContext;
    .param p4, "retryCount"    # I

    .prologue
    .line 1874
    sget-object v0, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "TransactionManager: EarnCallback: retrying request [clientTransactionId: %1$s]"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    iget-object v6, p0, Lcom/getjar/sdk/comm/TransactionManager$EarnCallback;->_earnBucket:Lcom/getjar/sdk/comm/persistence/EarnBucket;

    invoke-virtual {v6}, Lcom/getjar/sdk/comm/persistence/EarnBucket;->getClientTransactionId()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 1877
    return-void
.end method

.method public serviceRequestSucceeded(Lcom/getjar/sdk/comm/Result;Ljava/lang/String;Lcom/getjar/sdk/comm/CommContext;)V
    .locals 20
    .param p1, "result"    # Lcom/getjar/sdk/comm/Result;
    .param p2, "requestId"    # Ljava/lang/String;
    .param p3, "commContext"    # Lcom/getjar/sdk/comm/CommContext;

    .prologue
    .line 1752
    sget-object v8, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v8}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v8

    sget-object v15, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v15}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v15

    or-long/2addr v8, v15

    sget-object v15, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v16, "TransactionManager: EarnCallback: request succeeded [clientTransactionId: %1$s]"

    const/16 v17, 0x1

    move/from16 v0, v17

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getjar/sdk/comm/TransactionManager$EarnCallback;->_earnBucket:Lcom/getjar/sdk/comm/persistence/EarnBucket;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/getjar/sdk/comm/persistence/EarnBucket;->getClientTransactionId()Ljava/lang/String;

    move-result-object v19

    aput-object v19, v17, v18

    invoke-static/range {v15 .. v17}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v15

    invoke-static {v8, v9, v15}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 1757
    const-string v8, ""

    move-object/from16 v0, p1

    invoke-static {v0, v8}, Lcom/getjar/sdk/comm/TransactionManager;->getTransactionState(Lcom/getjar/sdk/comm/Result;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 1758
    .local v3, "state":Ljava/lang/String;
    sget-object v8, Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;->NONE:Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;

    invoke-virtual {v8}, Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;->toString()Ljava/lang/String;

    move-result-object v8

    move-object/from16 v0, p1

    invoke-static {v0, v8}, Lcom/getjar/sdk/comm/TransactionManager;->getTransactionSubstate(Lcom/getjar/sdk/comm/Result;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 1759
    .local v4, "substate":Ljava/lang/String;
    const-wide/16 v8, -0x1

    move-object/from16 v0, p1

    invoke-static {v0, v8, v9}, Lcom/getjar/sdk/utilities/Utility;->getResponseAmount(Lcom/getjar/sdk/comm/Result;J)J

    move-result-wide v6

    .line 1762
    .local v6, "amount":J
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/getjar/sdk/comm/TransactionManager$EarnCallback;->_earnData:Lcom/getjar/sdk/comm/persistence/RelatedEarnData;

    invoke-virtual {v8}, Lcom/getjar/sdk/comm/persistence/RelatedEarnData;->getPackageName()Ljava/lang/String;

    move-result-object v5

    .line 1764
    .local v5, "appNameForNotifications":Ljava/lang/String;
    :try_start_0
    invoke-virtual/range {p3 .. p3}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v8

    invoke-virtual {v8}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v13

    .line 1765
    .local v13, "packageManager":Landroid/content/pm/PackageManager;
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/getjar/sdk/comm/TransactionManager$EarnCallback;->_earnData:Lcom/getjar/sdk/comm/persistence/RelatedEarnData;

    invoke-virtual {v8}, Lcom/getjar/sdk/comm/persistence/RelatedEarnData;->getPackageName()Ljava/lang/String;

    move-result-object v8

    const/16 v9, 0x80

    invoke-virtual {v13, v8, v9}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v12

    .line 1766
    .local v12, "packageInfo":Landroid/content/pm/PackageInfo;
    iget-object v8, v12, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    invoke-virtual {v8, v13}, Landroid/content/pm/ApplicationInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object v8

    move-object v0, v8

    check-cast v0, Ljava/lang/String;

    move-object v5, v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 1769
    .end local v12    # "packageInfo":Landroid/content/pm/PackageInfo;
    .end local v13    # "packageManager":Landroid/content/pm/PackageManager;
    :goto_0
    sget-object v8, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v8}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v8

    sget-object v15, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v15}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v15

    or-long/2addr v8, v15

    sget-object v15, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v16, "TransactionManager: Pushing Earn notification [amount: %1$d] [state: %2$s] [substate: %3$s]"

    const/16 v17, 0x3

    move/from16 v0, v17

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v19

    aput-object v19, v17, v18

    const/16 v18, 0x1

    aput-object v3, v17, v18

    const/16 v18, 0x2

    aput-object v4, v17, v18

    invoke-static/range {v15 .. v17}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v15

    invoke-static {v8, v9, v15}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 1770
    const-string v8, "CAP_REACHED_FAILURE"

    invoke-virtual {v8, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_2

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/getjar/sdk/comm/TransactionManager$EarnCallback;->_earnData:Lcom/getjar/sdk/comm/persistence/RelatedEarnData;

    invoke-virtual {v8}, Lcom/getjar/sdk/comm/persistence/RelatedEarnData;->getPackageName()Ljava/lang/String;

    move-result-object v8

    const-string v9, "com.getjar.rewards"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_2

    .line 1773
    sget-object v8, Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;->SUCCEEDED:Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/getjar/sdk/comm/TransactionManager$EarnCallback;->_earnBucket:Lcom/getjar/sdk/comm/persistence/EarnBucket;

    invoke-virtual {v9}, Lcom/getjar/sdk/comm/persistence/EarnBucket;->getNotificationState()Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;

    move-result-object v9

    invoke-virtual {v8, v9}, Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_0

    sget-object v8, Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;->FAILED:Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/getjar/sdk/comm/TransactionManager$EarnCallback;->_earnBucket:Lcom/getjar/sdk/comm/persistence/EarnBucket;

    invoke-virtual {v9}, Lcom/getjar/sdk/comm/persistence/EarnBucket;->getNotificationState()Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;

    move-result-object v9

    invoke-virtual {v8, v9}, Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_0

    .line 1776
    sget-object v8, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v9, "Thank you for installing %1$s. You must spend gold before you can earn more."

    const/4 v15, 0x1

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    aput-object v5, v15, v16

    invoke-static {v8, v9, v15}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    move-object/from16 v0, p3

    invoke-static {v0, v8}, Lcom/getjar/sdk/utilities/NotificationsUtility;->pushFailNotification(Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;)V

    .line 1777
    invoke-virtual/range {p3 .. p3}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v8

    invoke-static {v8}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/comm/persistence/DBTransactions;

    move-result-object v8

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/getjar/sdk/comm/TransactionManager$EarnCallback;->_earnBucket:Lcom/getjar/sdk/comm/persistence/EarnBucket;

    sget-object v15, Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;->FAILED:Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;

    invoke-virtual {v8, v9, v15}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->updateEarnTransactionNotificationState(Lcom/getjar/sdk/comm/persistence/EarnBucket;Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;)Z

    .line 1779
    :cond_0
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/getjar/sdk/comm/TransactionManager$EarnCallback;->_earnData:Lcom/getjar/sdk/comm/persistence/RelatedEarnData;

    invoke-virtual {v8}, Lcom/getjar/sdk/comm/persistence/RelatedEarnData;->getPackageName()Ljava/lang/String;

    move-result-object v8

    sget-object v9, Lcom/getjar/sdk/data/earning/EarnStateDatabase$EarnState;->FAIL:Lcom/getjar/sdk/data/earning/EarnStateDatabase$EarnState;

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    move-object/from16 v2, p1

    invoke-direct {v0, v1, v8, v2, v9}, Lcom/getjar/sdk/comm/TransactionManager$EarnCallback;->updateEarnStateInAppStatePersistence(Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Lcom/getjar/sdk/comm/Result;Lcom/getjar/sdk/data/earning/EarnStateDatabase$EarnState;)V

    .line 1837
    :cond_1
    :goto_1
    return-void

    .line 1780
    :cond_2
    const-string v8, "ALREADY_REDEEMED_FAILURE"

    invoke-virtual {v8, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_3

    const-string v8, "ALREADY_USED_FAILURE"

    invoke-virtual {v8, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_5

    :cond_3
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/getjar/sdk/comm/TransactionManager$EarnCallback;->_earnData:Lcom/getjar/sdk/comm/persistence/RelatedEarnData;

    invoke-virtual {v8}, Lcom/getjar/sdk/comm/persistence/RelatedEarnData;->getPackageName()Ljava/lang/String;

    move-result-object v8

    const-string v9, "com.getjar.rewards"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_5

    .line 1784
    sget-object v8, Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;->SUCCEEDED:Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/getjar/sdk/comm/TransactionManager$EarnCallback;->_earnBucket:Lcom/getjar/sdk/comm/persistence/EarnBucket;

    invoke-virtual {v9}, Lcom/getjar/sdk/comm/persistence/EarnBucket;->getNotificationState()Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;

    move-result-object v9

    invoke-virtual {v8, v9}, Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_4

    sget-object v8, Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;->FAILED:Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/getjar/sdk/comm/TransactionManager$EarnCallback;->_earnBucket:Lcom/getjar/sdk/comm/persistence/EarnBucket;

    invoke-virtual {v9}, Lcom/getjar/sdk/comm/persistence/EarnBucket;->getNotificationState()Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;

    move-result-object v9

    invoke-virtual {v8, v9}, Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_4

    .line 1787
    sget-object v8, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v9, "Thank you for installing %1$s again. No gold was earned."

    const/4 v15, 0x1

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    aput-object v5, v15, v16

    invoke-static {v8, v9, v15}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    move-object/from16 v0, p3

    invoke-static {v0, v8}, Lcom/getjar/sdk/utilities/NotificationsUtility;->pushFailNotification(Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;)V

    .line 1788
    invoke-virtual/range {p3 .. p3}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v8

    invoke-static {v8}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/comm/persistence/DBTransactions;

    move-result-object v8

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/getjar/sdk/comm/TransactionManager$EarnCallback;->_earnBucket:Lcom/getjar/sdk/comm/persistence/EarnBucket;

    sget-object v15, Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;->FAILED:Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;

    invoke-virtual {v8, v9, v15}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->updateEarnTransactionNotificationState(Lcom/getjar/sdk/comm/persistence/EarnBucket;Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;)Z

    .line 1790
    :cond_4
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/getjar/sdk/comm/TransactionManager$EarnCallback;->_earnData:Lcom/getjar/sdk/comm/persistence/RelatedEarnData;

    invoke-virtual {v8}, Lcom/getjar/sdk/comm/persistence/RelatedEarnData;->getPackageName()Ljava/lang/String;

    move-result-object v8

    sget-object v9, Lcom/getjar/sdk/data/earning/EarnStateDatabase$EarnState;->FAIL:Lcom/getjar/sdk/data/earning/EarnStateDatabase$EarnState;

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    move-object/from16 v2, p1

    invoke-direct {v0, v1, v8, v2, v9}, Lcom/getjar/sdk/comm/TransactionManager$EarnCallback;->updateEarnStateInAppStatePersistence(Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Lcom/getjar/sdk/comm/Result;Lcom/getjar/sdk/data/earning/EarnStateDatabase$EarnState;)V

    goto :goto_1

    .line 1791
    :cond_5
    const-wide/16 v8, 0x0

    cmp-long v8, v6, v8

    if-lez v8, :cond_1

    .line 1794
    const/4 v11, 0x0

    .line 1795
    .local v11, "hostApplicationName":Ljava/lang/String;
    const/4 v12, 0x0

    .line 1798
    .restart local v12    # "packageInfo":Landroid/content/pm/PackageInfo;
    :try_start_1
    invoke-virtual/range {p3 .. p3}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v8

    invoke-virtual {v8}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v13

    .line 1799
    .restart local v13    # "packageManager":Landroid/content/pm/PackageManager;
    invoke-virtual/range {p3 .. p3}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v8

    invoke-virtual {v8}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v8

    const/16 v9, 0x80

    invoke-virtual {v13, v8, v9}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v12

    .line 1800
    iget-object v8, v12, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    invoke-virtual {v8, v13}, Landroid/content/pm/ApplicationInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object v8

    move-object v0, v8

    check-cast v0, Ljava/lang/String;

    move-object v11, v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 1806
    .end local v13    # "packageManager":Landroid/content/pm/PackageManager;
    :goto_2
    const/4 v14, 0x0

    .line 1807
    .local v14, "textMsg":Ljava/lang/String;
    invoke-static {v11}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_8

    .line 1808
    sget-object v8, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v9, "You\'ve earned %1$d Gold!"

    const/4 v15, 0x1

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v17

    aput-object v17, v15, v16

    invoke-static {v8, v9, v15}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    .line 1814
    :goto_3
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/getjar/sdk/comm/TransactionManager$EarnCallback;->_earnBucket:Lcom/getjar/sdk/comm/persistence/EarnBucket;

    invoke-virtual {v8}, Lcom/getjar/sdk/comm/persistence/EarnBucket;->getIsNewTransaction()Z

    move-result v8

    if-nez v8, :cond_6

    .line 1815
    sget-object v8, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v9, "%1$s %2$s"

    const/4 v15, 0x2

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    aput-object v14, v15, v16

    const/16 v16, 0x1

    const-string v17, "Thanks for your patience!"

    aput-object v17, v15, v16

    invoke-static {v8, v9, v15}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    .line 1819
    :cond_6
    sget-object v8, Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;->SUCCEEDED:Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/getjar/sdk/comm/TransactionManager$EarnCallback;->_earnBucket:Lcom/getjar/sdk/comm/persistence/EarnBucket;

    invoke-virtual {v9}, Lcom/getjar/sdk/comm/persistence/EarnBucket;->getNotificationState()Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;

    move-result-object v9

    invoke-virtual {v8, v9}, Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_7

    sget-object v8, Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;->FAILED:Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/getjar/sdk/comm/TransactionManager$EarnCallback;->_earnBucket:Lcom/getjar/sdk/comm/persistence/EarnBucket;

    invoke-virtual {v9}, Lcom/getjar/sdk/comm/persistence/EarnBucket;->getNotificationState()Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;

    move-result-object v9

    invoke-virtual {v8, v9}, Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_7

    .line 1822
    move-object/from16 v0, p3

    invoke-static {v0, v14}, Lcom/getjar/sdk/utilities/NotificationsUtility;->pushSuccessNotification(Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;)V

    .line 1823
    invoke-virtual/range {p3 .. p3}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v8

    invoke-static {v8}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/comm/persistence/DBTransactions;

    move-result-object v8

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/getjar/sdk/comm/TransactionManager$EarnCallback;->_earnBucket:Lcom/getjar/sdk/comm/persistence/EarnBucket;

    sget-object v15, Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;->SUCCEEDED:Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;

    invoke-virtual {v8, v9, v15}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->updateEarnTransactionNotificationState(Lcom/getjar/sdk/comm/persistence/EarnBucket;Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;)Z

    .line 1824
    iget-object v8, v12, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    const/4 v9, 0x0

    invoke-static/range {v3 .. v9}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->updateUIWithEarnResults(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;)V

    .line 1834
    :cond_7
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/getjar/sdk/comm/TransactionManager$EarnCallback;->_earnData:Lcom/getjar/sdk/comm/persistence/RelatedEarnData;

    invoke-virtual {v8}, Lcom/getjar/sdk/comm/persistence/RelatedEarnData;->getPackageName()Ljava/lang/String;

    move-result-object v8

    sget-object v9, Lcom/getjar/sdk/data/earning/EarnStateDatabase$EarnState;->SUCCESS:Lcom/getjar/sdk/data/earning/EarnStateDatabase$EarnState;

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    move-object/from16 v2, p1

    invoke-direct {v0, v1, v8, v2, v9}, Lcom/getjar/sdk/comm/TransactionManager$EarnCallback;->updateEarnStateInAppStatePersistence(Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Lcom/getjar/sdk/comm/Result;Lcom/getjar/sdk/data/earning/EarnStateDatabase$EarnState;)V

    .line 1835
    invoke-virtual/range {p3 .. p3}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v8

    invoke-static {v8}, Lcom/getjar/sdk/data/earning/EarnStateDatabase;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/earning/EarnStateDatabase;

    move-result-object v8

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/getjar/sdk/comm/TransactionManager$EarnCallback;->_earnData:Lcom/getjar/sdk/comm/persistence/RelatedEarnData;

    invoke-virtual {v9}, Lcom/getjar/sdk/comm/persistence/RelatedEarnData;->getPackageName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9, v6, v7}, Lcom/getjar/sdk/data/earning/EarnStateDatabase;->updateEarnAmount(Ljava/lang/String;J)V

    goto/16 :goto_1

    .line 1801
    .end local v14    # "textMsg":Ljava/lang/String;
    :catch_0
    move-exception v10

    .line 1802
    .local v10, "e":Ljava/lang/Exception;
    sget-object v8, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v8}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v8

    sget-object v15, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v15}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v15

    or-long/2addr v8, v15

    const-string v15, "TransactionManager: EarnCallback: Failed to get the name of the Hosting Application"

    invoke-static {v8, v9, v15, v10}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_2

    .line 1810
    .end local v10    # "e":Ljava/lang/Exception;
    .restart local v14    # "textMsg":Ljava/lang/String;
    :cond_8
    sget-object v8, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v9, "%1$d Gold earned via %2$s!"

    const/4 v15, 0x2

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v17

    aput-object v17, v15, v16

    const/16 v16, 0x1

    aput-object v11, v15, v16

    invoke-static {v8, v9, v15}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    goto/16 :goto_3

    .line 1767
    .end local v11    # "hostApplicationName":Ljava/lang/String;
    .end local v12    # "packageInfo":Landroid/content/pm/PackageInfo;
    .end local v14    # "textMsg":Ljava/lang/String;
    :catch_1
    move-exception v8

    goto/16 :goto_0
.end method
