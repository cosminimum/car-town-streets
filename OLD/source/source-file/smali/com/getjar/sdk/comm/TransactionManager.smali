.class public final Lcom/getjar/sdk/comm/TransactionManager;
.super Ljava/lang/Object;
.source "TransactionManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/getjar/sdk/comm/TransactionManager$EarnCallback;
    }
.end annotation


# static fields
.field private static _CanceledClientTransactionIDs:Ljava/util/concurrent/ConcurrentLinkedQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentLinkedQueue",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final _ExecutorService:Ljava/util/concurrent/ExecutorService;

.field private static final _ExecutorServiceInternal:Ljava/util/concurrent/ExecutorService;

.field private static final _ManagedOfferTransactionStateLock:Ljava/lang/Object;

.field private static final _PurchaseTransactionStateLock:Ljava/lang/Object;

.field private static final _TransactionFlowLock:Ljava/lang/Object;

.field private static final _UploadBuyGoldLock:Ljava/lang/Object;


# instance fields
.field private _applicationContext:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 70
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lcom/getjar/sdk/comm/TransactionManager;->_ExecutorService:Ljava/util/concurrent/ExecutorService;

    .line 77
    invoke-static {}, Ljava/util/concurrent/Executors;->newCachedThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lcom/getjar/sdk/comm/TransactionManager;->_ExecutorServiceInternal:Ljava/util/concurrent/ExecutorService;

    .line 80
    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    sput-object v0, Lcom/getjar/sdk/comm/TransactionManager;->_CanceledClientTransactionIDs:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 81
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/getjar/sdk/comm/TransactionManager;->_UploadBuyGoldLock:Ljava/lang/Object;

    .line 82
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/getjar/sdk/comm/TransactionManager;->_TransactionFlowLock:Ljava/lang/Object;

    .line 83
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/getjar/sdk/comm/TransactionManager;->_PurchaseTransactionStateLock:Ljava/lang/Object;

    .line 84
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/getjar/sdk/comm/TransactionManager;->_ManagedOfferTransactionStateLock:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "applicationContext"    # Landroid/content/Context;

    .prologue
    .line 90
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 91
    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'applicationContext\' can not be NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 92
    :cond_0
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/getjar/sdk/comm/TransactionManager;->_applicationContext:Landroid/content/Context;

    .line 93
    return-void
.end method

.method static synthetic access$000(Lcom/getjar/sdk/comm/TransactionManager;Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;Lcom/getjar/sdk/comm/CommContext;Z)Lcom/getjar/sdk/comm/Operation;
    .locals 1
    .param p0, "x0"    # Lcom/getjar/sdk/comm/TransactionManager;
    .param p1, "x1"    # Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;
    .param p2, "x2"    # Lcom/getjar/sdk/comm/CommContext;
    .param p3, "x3"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 63
    invoke-direct {p0, p1, p2, p3}, Lcom/getjar/sdk/comm/TransactionManager;->runPurchaseTransaction(Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;Lcom/getjar/sdk/comm/CommContext;Z)Lcom/getjar/sdk/comm/Operation;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100(Lcom/getjar/sdk/comm/TransactionManager;Lcom/getjar/sdk/comm/CommContext;ZZ)Ljava/util/concurrent/Future;
    .locals 1
    .param p0, "x0"    # Lcom/getjar/sdk/comm/TransactionManager;
    .param p1, "x1"    # Lcom/getjar/sdk/comm/CommContext;
    .param p2, "x2"    # Z
    .param p3, "x3"    # Z

    .prologue
    .line 63
    invoke-direct {p0, p1, p2, p3}, Lcom/getjar/sdk/comm/TransactionManager;->runTransactions(Lcom/getjar/sdk/comm/CommContext;ZZ)Ljava/util/concurrent/Future;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200(Lcom/getjar/sdk/comm/TransactionManager;Ljava/lang/String;Lcom/getjar/sdk/comm/CommContext;Z)Lcom/getjar/sdk/comm/Operation;
    .locals 1
    .param p0, "x0"    # Lcom/getjar/sdk/comm/TransactionManager;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Lcom/getjar/sdk/comm/CommContext;
    .param p3, "x3"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 63
    invoke-direct {p0, p1, p2, p3}, Lcom/getjar/sdk/comm/TransactionManager;->runManagedOfferTransaction(Ljava/lang/String;Lcom/getjar/sdk/comm/CommContext;Z)Lcom/getjar/sdk/comm/Operation;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$300(Lcom/getjar/sdk/comm/TransactionManager;Lcom/getjar/sdk/comm/persistence/EarnBucket;Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/comm/CallbackInterface;Z)Lcom/getjar/sdk/comm/Operation;
    .locals 1
    .param p0, "x0"    # Lcom/getjar/sdk/comm/TransactionManager;
    .param p1, "x1"    # Lcom/getjar/sdk/comm/persistence/EarnBucket;
    .param p2, "x2"    # Lcom/getjar/sdk/comm/CommContext;
    .param p3, "x3"    # Lcom/getjar/sdk/comm/CallbackInterface;
    .param p4, "x4"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 63
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/getjar/sdk/comm/TransactionManager;->runEarnTransaction(Lcom/getjar/sdk/comm/persistence/EarnBucket;Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/comm/CallbackInterface;Z)Lcom/getjar/sdk/comm/Operation;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$400(Lcom/getjar/sdk/comm/TransactionManager;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/getjar/sdk/comm/TransactionManager;

    .prologue
    .line 63
    iget-object v0, p0, Lcom/getjar/sdk/comm/TransactionManager;->_applicationContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$500(Lcom/getjar/sdk/comm/TransactionManager;Lcom/getjar/sdk/comm/CommContext;ZZ)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/getjar/sdk/comm/TransactionManager;
    .param p1, "x1"    # Lcom/getjar/sdk/comm/CommContext;
    .param p2, "x2"    # Z
    .param p3, "x3"    # Z

    .prologue
    .line 63
    invoke-direct {p0, p1, p2, p3}, Lcom/getjar/sdk/comm/TransactionManager;->runTransactionsInternal(Lcom/getjar/sdk/comm/CommContext;ZZ)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$600()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 63
    sget-object v0, Lcom/getjar/sdk/comm/TransactionManager;->_UploadBuyGoldLock:Ljava/lang/Object;

    return-object v0
.end method

.method private checkAndCancelManagedOffer(Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;Z)V
    .locals 11
    .param p1, "commContext"    # Lcom/getjar/sdk/comm/CommContext;
    .param p2, "transaction"    # Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;
    .param p3, "suppressInternalCallbacks"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v10, 0x0

    const/4 v9, 0x1

    .line 801
    invoke-virtual {p2}, Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;->getClientTransactionId()Ljava/lang/String;

    move-result-object v0

    .line 804
    .local v0, "clientTransactionId":Ljava/lang/String;
    sget-object v5, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->CANCELING:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    invoke-virtual {p2}, Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;->getState()Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 806
    const/4 v4, 0x1

    .line 807
    .local v4, "shouldTryCanceling":Z
    invoke-virtual {p2}, Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;->getRelatedObject()Lcom/getjar/sdk/comm/persistence/RelatedManagedOfferData;

    move-result-object v5

    invoke-virtual {v5}, Lcom/getjar/sdk/comm/persistence/RelatedManagedOfferData;->getPurchaseMetadata()Ljava/util/HashMap;

    move-result-object v2

    .line 808
    .local v2, "purchaseMetadata":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz v2, :cond_0

    const-string v5, "order.google_play.signed_data"

    invoke-virtual {v2, v5}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 809
    iget-object v5, p0, Lcom/getjar/sdk/comm/TransactionManager;->_applicationContext:Landroid/content/Context;

    invoke-static {v5}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/rewards/InAppPurchaseManager;

    move-result-object v5

    invoke-virtual {v5, p2, v9}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->consumeManagedOffer(Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;Z)Z

    move-result v4

    .line 812
    :cond_0
    if-eqz v4, :cond_1

    .line 816
    invoke-static {}, Lcom/getjar/sdk/comm/TransactionServiceProxy;->getInstance()Lcom/getjar/sdk/comm/TransactionServiceProxy;

    move-result-object v5

    invoke-virtual {v5, p1, v0, p3}, Lcom/getjar/sdk/comm/TransactionServiceProxy;->cancelTransaction(Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Z)Lcom/getjar/sdk/comm/Operation;

    move-result-object v1

    .line 817
    .local v1, "operation":Lcom/getjar/sdk/comm/Operation;
    invoke-virtual {v1}, Lcom/getjar/sdk/comm/Operation;->get()Lcom/getjar/sdk/comm/Result;

    move-result-object v3

    .line 818
    .local v3, "result":Lcom/getjar/sdk/comm/Result;
    if-eqz v3, :cond_4

    invoke-virtual {v3}, Lcom/getjar/sdk/comm/Result;->isSuccessfulResponse()Z

    move-result v5

    if-eqz v5, :cond_4

    .line 819
    sget-object v5, Lcom/getjar/sdk/comm/TransactionManager;->_CanceledClientTransactionIDs:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v5, v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;->remove(Ljava/lang/Object;)Z

    .line 821
    sget-object v6, Lcom/getjar/sdk/comm/TransactionManager;->_ManagedOfferTransactionStateLock:Ljava/lang/Object;

    monitor-enter v6

    .line 822
    :try_start_0
    sget-object v5, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->CANCELLED:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    invoke-direct {p0, p1, v3, p2, v5}, Lcom/getjar/sdk/comm/TransactionManager;->updateOfferStateFromResponseState(Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/comm/Result;Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;)Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    .line 823
    monitor-exit v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 833
    .end local v1    # "operation":Lcom/getjar/sdk/comm/Operation;
    .end local v2    # "purchaseMetadata":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v3    # "result":Lcom/getjar/sdk/comm/Result;
    .end local v4    # "shouldTryCanceling":Z
    :cond_1
    :goto_0
    sget-object v5, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->CANCELLED:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    invoke-virtual {p2}, Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;->getState()Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 834
    sget-object v6, Lcom/getjar/sdk/comm/TransactionManager;->_ManagedOfferTransactionStateLock:Ljava/lang/Object;

    monitor-enter v6

    .line 835
    :try_start_1
    sget-object v5, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->DONE:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    invoke-static {p1, p2, v5}, Lcom/getjar/sdk/comm/TransactionManager;->updateOfferTransactionState(Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;)V

    .line 836
    monitor-exit v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 840
    :cond_2
    sget-object v5, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->DONE:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    invoke-virtual {p2}, Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;->getState()Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 841
    iget-object v5, p0, Lcom/getjar/sdk/comm/TransactionManager;->_applicationContext:Landroid/content/Context;

    invoke-static {v5}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/comm/persistence/DBTransactions;

    move-result-object v5

    invoke-virtual {v5, v0}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->deleteTransaction(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_5

    .line 842
    sget-object v5, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    sget-object v7, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    or-long/2addr v5, v7

    sget-object v7, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    or-long/2addr v5, v7

    sget-object v7, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v8, "TransactionManager: checkAndCancelManagedOffer() failed to delete a Managed Offer transaction in the DONE state [clientTransactionId: %1$s]"

    new-array v9, v9, [Ljava/lang/Object;

    aput-object v0, v9, v10

    invoke-static {v7, v8, v9}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v6, v7}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;)V

    .line 852
    :cond_3
    :goto_1
    return-void

    .line 823
    .restart local v1    # "operation":Lcom/getjar/sdk/comm/Operation;
    .restart local v2    # "purchaseMetadata":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v3    # "result":Lcom/getjar/sdk/comm/Result;
    .restart local v4    # "shouldTryCanceling":Z
    :catchall_0
    move-exception v5

    :try_start_2
    monitor-exit v6
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v5

    .line 824
    :cond_4
    if-eqz v3, :cond_1

    const-string v5, "TRANSACTION_NOT_FOUND"

    invoke-virtual {v3}, Lcom/getjar/sdk/comm/Result;->getErrorResponseSubcode()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 825
    sget-object v5, Lcom/getjar/sdk/comm/TransactionManager;->_CanceledClientTransactionIDs:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v5, v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;->remove(Ljava/lang/Object;)Z

    .line 826
    sget-object v6, Lcom/getjar/sdk/comm/TransactionManager;->_ManagedOfferTransactionStateLock:Ljava/lang/Object;

    monitor-enter v6

    .line 827
    :try_start_3
    sget-object v5, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->DONE:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    invoke-static {p1, p2, v5}, Lcom/getjar/sdk/comm/TransactionManager;->updateOfferTransactionState(Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;)V

    .line 828
    monitor-exit v6

    goto :goto_0

    :catchall_1
    move-exception v5

    monitor-exit v6
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw v5

    .line 836
    .end local v1    # "operation":Lcom/getjar/sdk/comm/Operation;
    .end local v2    # "purchaseMetadata":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v3    # "result":Lcom/getjar/sdk/comm/Result;
    .end local v4    # "shouldTryCanceling":Z
    :catchall_2
    move-exception v5

    :try_start_4
    monitor-exit v6
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    throw v5

    .line 846
    :cond_5
    sget-object v5, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    sget-object v7, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    or-long/2addr v5, v7

    sget-object v7, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    or-long/2addr v5, v7

    sget-object v7, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v8, "TransactionManager: checkAndCancelManagedOffer() deleted a Managed Offer transaction in the DONE state [clientTransactionId: %1$s]"

    new-array v9, v9, [Ljava/lang/Object;

    aput-object v0, v9, v10

    invoke-static {v7, v8, v9}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v6, v7}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    goto :goto_1
.end method

.method private checkCancelling(Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;)Z
    .locals 9
    .param p1, "transaction"    # Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;

    .prologue
    const/4 v8, 0x2

    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 1451
    sget-object v2, Lcom/getjar/sdk/comm/TransactionManager;->_CanceledClientTransactionIDs:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {p1}, Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;->getClientTransactionId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/concurrent/ConcurrentLinkedQueue;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1453
    sget-object v2, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "TransactionManager: checkCancelling() CANCELING [clientTransactionId: %1$s] [%2$s]"

    new-array v6, v8, [Ljava/lang/Object;

    invoke-virtual {p1}, Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;->getClientTransactionId()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v1

    invoke-static {}, Lcom/getjar/sdk/logging/Logger;->getShortStack()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v0

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 1459
    sget-object v2, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->CANCELING:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    invoke-virtual {p1, v2}, Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;->setState(Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;)V

    .line 1460
    sget-object v2, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "TransactionManager: checkCancelling() returning TRUE [clientTransactionId: %1$s] [thread: %2$d]"

    new-array v6, v8, [Ljava/lang/Object;

    invoke-virtual {p1}, Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;->getClientTransactionId()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v1

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->getId()J

    move-result-wide v7

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    aput-object v1, v6, v0

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v3, v1}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 1472
    :goto_0
    return v0

    .line 1468
    :cond_0
    sget-object v2, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "TransactionManager: checkCancelling() returning FALSE [clientTransactionId: %1$s] [thread: %2$d]"

    new-array v6, v8, [Ljava/lang/Object;

    invoke-virtual {p1}, Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;->getClientTransactionId()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v1

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Thread;->getId()J

    move-result-wide v7

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    aput-object v7, v6, v0

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    move v0, v1

    .line 1472
    goto :goto_0
.end method

.method private checkCancelling(Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;)Z
    .locals 9
    .param p1, "transaction"    # Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;

    .prologue
    const/4 v6, 0x2

    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 1427
    sget-object v2, Lcom/getjar/sdk/comm/TransactionManager;->_CanceledClientTransactionIDs:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {p1}, Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;->getClientTransactionId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/concurrent/ConcurrentLinkedQueue;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1430
    sget-object v2, Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;->CANCELING:Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;

    invoke-virtual {p1, v2}, Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;->setState(Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;)V

    .line 1431
    sget-object v2, Lcom/getjar/sdk/logging/Area;->PURCHASE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "TransactionManager: checkCancelling() returning TRUE [clientTransactionId: %1$s] [thread: %2$d]"

    new-array v6, v6, [Ljava/lang/Object;

    invoke-virtual {p1}, Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;->getClientTransactionId()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v1

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->getId()J

    move-result-wide v7

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    aput-object v1, v6, v0

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v3, v1}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 1443
    :goto_0
    return v0

    .line 1439
    :cond_0
    sget-object v2, Lcom/getjar/sdk/logging/Area;->PURCHASE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "TransactionManager: checkCancelling() returning FALSE [clientTransactionId: %1$s] [thread: %2$d]"

    new-array v6, v6, [Ljava/lang/Object;

    invoke-virtual {p1}, Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;->getClientTransactionId()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v1

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Thread;->getId()J

    move-result-wide v7

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    aput-object v7, v6, v0

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    move v0, v1

    .line 1443
    goto :goto_0
.end method

.method private getEarnOnPurchaseAmount(Lcom/getjar/sdk/comm/Result;)Ljava/lang/Long;
    .locals 10
    .param p1, "result"    # Lcom/getjar/sdk/comm/Result;

    .prologue
    .line 1044
    if-eqz p1, :cond_1

    :try_start_0
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/Result;->getResponseJson()Lorg/json/JSONObject;

    move-result-object v6

    if-eqz v6, :cond_1

    invoke-virtual {p1}, Lcom/getjar/sdk/comm/Result;->getResponseJson()Lorg/json/JSONObject;

    move-result-object v6

    const-string v7, "return"

    invoke-virtual {v6, v7}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 1045
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/Result;->getResponseJson()Lorg/json/JSONObject;

    move-result-object v6

    const-string v7, "return"

    invoke-virtual {v6, v7}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    .line 1046
    .local v4, "root":Lorg/json/JSONObject;
    if-eqz v4, :cond_1

    const-string v6, "lines"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 1047
    const-string v6, "lines"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    .line 1048
    .local v3, "lines":Lorg/json/JSONArray;
    if-eqz v3, :cond_1

    .line 1049
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v6

    if-ge v1, v6, :cond_1

    .line 1050
    invoke-virtual {v3, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    .line 1051
    .local v2, "line":Lorg/json/JSONObject;
    if-eqz v2, :cond_0

    const-string v6, "type"

    invoke-virtual {v2, v6}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_0

    const-string v6, "amount"

    invoke-virtual {v2, v6}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 1052
    const-string v6, "type"

    invoke-virtual {v2, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 1053
    .local v5, "type":Ljava/lang/String;
    const-string v6, "BUY_CURRENCY"

    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 1054
    const-string v6, "amount"

    invoke-virtual {v2, v6}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v6

    .line 1066
    .end local v1    # "i":I
    .end local v2    # "line":Lorg/json/JSONObject;
    .end local v3    # "lines":Lorg/json/JSONArray;
    .end local v4    # "root":Lorg/json/JSONObject;
    .end local v5    # "type":Ljava/lang/String;
    :goto_1
    return-object v6

    .line 1049
    .restart local v1    # "i":I
    .restart local v2    # "line":Lorg/json/JSONObject;
    .restart local v3    # "lines":Lorg/json/JSONArray;
    .restart local v4    # "root":Lorg/json/JSONObject;
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1062
    .end local v1    # "i":I
    .end local v2    # "line":Lorg/json/JSONObject;
    .end local v3    # "lines":Lorg/json/JSONArray;
    .end local v4    # "root":Lorg/json/JSONObject;
    :catch_0
    move-exception v0

    .line 1063
    .local v0, "e":Ljava/lang/Exception;
    sget-object v6, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    sget-object v8, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v8}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v8

    or-long/2addr v6, v8

    sget-object v8, Lcom/getjar/sdk/logging/Area;->PURCHASE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v8}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v8

    or-long/2addr v6, v8

    const-string v8, "getEarnOnPurchaseAmount() failed"

    invoke-static {v6, v7, v8, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 1066
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_1
    const/4 v6, 0x0

    goto :goto_1
.end method

.method public static getTransactionState(Lcom/getjar/sdk/comm/Result;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "result"    # Lcom/getjar/sdk/comm/Result;
    .param p1, "defaultValue"    # Ljava/lang/String;

    .prologue
    .line 609
    const-string v0, "state"

    invoke-static {p0, p1, v0}, Lcom/getjar/sdk/comm/TransactionManager;->getTransactionValue(Lcom/getjar/sdk/comm/Result;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getTransactionSubstate(Lcom/getjar/sdk/comm/Result;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "result"    # Lcom/getjar/sdk/comm/Result;
    .param p1, "defaultValue"    # Ljava/lang/String;

    .prologue
    .line 619
    const-string v0, "substate"

    invoke-static {p0, p1, v0}, Lcom/getjar/sdk/comm/TransactionManager;->getTransactionValue(Lcom/getjar/sdk/comm/Result;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static getTransactionValue(Lcom/getjar/sdk/comm/Result;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 9
    .param p0, "result"    # Lcom/getjar/sdk/comm/Result;
    .param p1, "defaultValue"    # Ljava/lang/String;
    .param p2, "key"    # Ljava/lang/String;

    .prologue
    .line 630
    move-object v3, p1

    .line 633
    .local v3, "state":Ljava/lang/String;
    if-eqz p0, :cond_1

    .line 634
    :try_start_0
    invoke-virtual {p0}, Lcom/getjar/sdk/comm/Result;->getResponseJson()Lorg/json/JSONObject;

    move-result-object v1

    .line 636
    .local v1, "responseJson":Lorg/json/JSONObject;
    if-eqz v1, :cond_1

    invoke-virtual {v1}, Lorg/json/JSONObject;->length()I

    move-result v5

    if-lez v5, :cond_1

    .line 637
    const/4 v4, 0x0

    .line 639
    .local v4, "temp":Ljava/lang/String;
    const-string v5, "return"

    invoke-virtual {v1, v5}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 640
    const-string v5, "return"

    invoke-virtual {v1, v5}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    .line 642
    .local v2, "root":Lorg/json/JSONObject;
    invoke-virtual {v2, p2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 643
    invoke-virtual {v2, p2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 652
    .end local v2    # "root":Lorg/json/JSONObject;
    :cond_0
    :goto_0
    invoke-static {v4}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_1

    .line 653
    move-object v3, v4

    .line 661
    .end local v1    # "responseJson":Lorg/json/JSONObject;
    .end local v4    # "temp":Ljava/lang/String;
    :cond_1
    :goto_1
    return-object v3

    .line 644
    .restart local v1    # "responseJson":Lorg/json/JSONObject;
    .restart local v2    # "root":Lorg/json/JSONObject;
    .restart local v4    # "temp":Ljava/lang/String;
    :cond_2
    const-string v5, "transaction"

    invoke-virtual {v2, v5}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 645
    const-string v5, "transaction"

    invoke-virtual {v2, v5}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    .line 646
    invoke-virtual {v2, p2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 647
    invoke-virtual {v2, p2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    goto :goto_0

    .line 658
    .end local v1    # "responseJson":Lorg/json/JSONObject;
    .end local v2    # "root":Lorg/json/JSONObject;
    .end local v4    # "temp":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 659
    .local v0, "e":Lorg/json/JSONException;
    sget-object v5, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    sget-object v7, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    or-long/2addr v5, v7

    const-string v7, "getTransactionState() failed"

    invoke-static {v5, v6, v7, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1
.end method

.method private handleSuccessfulReserveResult(Lcom/getjar/sdk/comm/Result;Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;)V
    .locals 12
    .param p1, "result"    # Lcom/getjar/sdk/comm/Result;
    .param p2, "commContext"    # Lcom/getjar/sdk/comm/CommContext;
    .param p3, "transactionBucket"    # Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;

    .prologue
    .line 1549
    const/4 v11, 0x0

    .line 1553
    .local v11, "wasReserving":Z
    :try_start_0
    sget-object v1, Lcom/getjar/sdk/comm/TransactionManager;->_PurchaseTransactionStateLock:Ljava/lang/Object;

    monitor-enter v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1557
    :try_start_1
    iget-object v0, p0, Lcom/getjar/sdk/comm/TransactionManager;->_applicationContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/comm/persistence/DBTransactions;

    move-result-object v0

    invoke-virtual {p3}, Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;->getClientTransactionId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->loadTransaction(Ljava/lang/String;)Lcom/getjar/sdk/comm/persistence/TransactionBucket;

    move-result-object v10

    .line 1560
    .local v10, "transaction":Lcom/getjar/sdk/comm/persistence/TransactionBucket;
    if-eqz v10, :cond_0

    sget-object v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;->RESERVING:Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;

    check-cast v10, Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;

    .end local v10    # "transaction":Lcom/getjar/sdk/comm/persistence/TransactionBucket;
    invoke-virtual {v10}, Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;->getState()Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1563
    const/4 v11, 0x1

    .line 1567
    sget-object v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;->CONFIRMING:Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;

    invoke-direct {p0, p2, p1, p3, v0}, Lcom/getjar/sdk/comm/TransactionManager;->updatePurchaseStateFromResponseState(Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/comm/Result;Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;)Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;

    .line 1570
    invoke-virtual {p3}, Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;->getRelatedObject()Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;

    move-result-object v0

    invoke-virtual {v0}, Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;->getLicenseScope()Lcom/getjar/sdk/License$LicenseScope;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1572
    new-instance v0, Lcom/getjar/sdk/data/LicenseEngine;

    invoke-direct {v0, p2}, Lcom/getjar/sdk/data/LicenseEngine;-><init>(Lcom/getjar/sdk/comm/CommContext;)V

    invoke-virtual {p3}, Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;->getRelatedObject()Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;

    move-result-object v2

    invoke-virtual {v2}, Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;->getProductId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p3}, Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;->getRelatedObject()Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;

    move-result-object v3

    invoke-virtual {v3}, Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;->getLicenseScope()Lcom/getjar/sdk/License$LicenseScope;

    move-result-object v3

    sget-object v4, Lcom/getjar/sdk/data/LicenseInternal$InternalLicenseState;->UNSYNCED:Lcom/getjar/sdk/data/LicenseInternal$InternalLicenseState;

    invoke-virtual {v0, v2, v3, v4, p1}, Lcom/getjar/sdk/data/LicenseEngine;->updateLicenseState(Ljava/lang/String;Lcom/getjar/sdk/License$LicenseScope;Lcom/getjar/sdk/data/LicenseInternal$InternalLicenseState;Lcom/getjar/sdk/comm/Result;)Lcom/getjar/sdk/data/LicenseInternal;

    .line 1578
    :cond_0
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1586
    :goto_0
    if-eqz v11, :cond_1

    .line 1587
    :try_start_2
    sget-object v0, Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;->NONE:Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;

    invoke-virtual {v0}, Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;->name()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/getjar/sdk/comm/TransactionManager;->getTransactionSubstate(Lcom/getjar/sdk/comm/Result;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 1589
    .local v9, "successSubState":Ljava/lang/String;
    sget-object v0, Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;->FUNDS_INSUFFICIENT_FAILURE:Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;

    invoke-virtual {v0}, Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;->name()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    move-result v0

    if-nez v0, :cond_1

    .line 1594
    :try_start_3
    new-instance v0, Lcom/getjar/sdk/response/PurchaseSucceededResponse;

    invoke-virtual {p3}, Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;->getRelatedObject()Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;

    move-result-object v1

    invoke-virtual {v1}, Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;->getProductId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p3}, Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;->getRelatedObject()Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;

    move-result-object v2

    invoke-virtual {v2}, Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;->getAmount()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    int-to-long v2, v2

    invoke-virtual {p3}, Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;->getRelatedObject()Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;

    move-result-object v4

    invoke-virtual {v4}, Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;->getProductName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p3}, Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;->getClientTransactionId()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1}, Lcom/getjar/sdk/comm/Result;->getSignedPayload()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p1}, Lcom/getjar/sdk/comm/Result;->getSignature()Ljava/lang/String;

    move-result-object v7

    invoke-direct/range {v0 .. v7}, Lcom/getjar/sdk/response/PurchaseSucceededResponse;-><init>(Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p2, v0}, Lcom/getjar/sdk/comm/CommContext;->postResponse(Lcom/getjar/sdk/response/Response;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    .line 1612
    .end local v9    # "successSubState":Ljava/lang/String;
    :cond_1
    :goto_1
    return-void

    .line 1578
    :catchall_0
    move-exception v0

    :try_start_4
    monitor-exit v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :try_start_5
    throw v0
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0

    .line 1580
    :catch_0
    move-exception v8

    .line 1581
    .local v8, "e":Ljava/lang/Exception;
    :try_start_6
    sget-object v0, Lcom/getjar/sdk/logging/Area;->PURCHASE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    sget-object v2, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    const-string v2, "TransactionManager: failure"

    invoke-static {v0, v1, v2, v8}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 1582
    invoke-virtual {p2, v8}, Lcom/getjar/sdk/comm/CommContext;->addException(Ljava/lang/Throwable;)V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_1

    goto :goto_0

    .line 1608
    .end local v8    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v8

    .line 1609
    .restart local v8    # "e":Ljava/lang/Exception;
    sget-object v0, Lcom/getjar/sdk/logging/Area;->PURCHASE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    const-string v2, "TransactionManager: failure"

    invoke-static {v0, v1, v2, v8}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 1610
    invoke-virtual {p2, v8}, Lcom/getjar/sdk/comm/CommContext;->addException(Ljava/lang/Throwable;)V

    goto :goto_1

    .line 1601
    .end local v8    # "e":Ljava/lang/Exception;
    .restart local v9    # "successSubState":Ljava/lang/String;
    :catch_2
    move-exception v8

    .line 1602
    .restart local v8    # "e":Ljava/lang/Exception;
    :try_start_7
    sget-object v0, Lcom/getjar/sdk/logging/Area;->PURCHASE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    const-string v2, "TransactionManager: failure"

    invoke-static {v0, v1, v2, v8}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 1603
    invoke-virtual {p2, v8}, Lcom/getjar/sdk/comm/CommContext;->addException(Ljava/lang/Throwable;)V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_1

    goto :goto_1
.end method

.method private runEarnTransaction(Lcom/getjar/sdk/comm/persistence/EarnBucket;Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/comm/CallbackInterface;Z)Lcom/getjar/sdk/comm/Operation;
    .locals 18
    .param p1, "transaction"    # Lcom/getjar/sdk/comm/persistence/EarnBucket;
    .param p2, "commContext"    # Lcom/getjar/sdk/comm/CommContext;
    .param p3, "callbacks"    # Lcom/getjar/sdk/comm/CallbackInterface;
    .param p4, "suppressInternalCallbacks"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 1264
    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/persistence/EarnBucket;->getClientTransactionId()Ljava/lang/String;

    move-result-object v6

    .line 1265
    .local v6, "clientTransactionId":Ljava/lang/String;
    sget-object v2, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "TransactionManager: runEarnTransaction() [clientTransactionId: %1$s] [state: %2$s] [callback: %3$s] [thread: %4$d]"

    const/4 v7, 0x4

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object v6, v7, v8

    const/4 v8, 0x1

    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/persistence/EarnBucket;->getState()Lcom/getjar/sdk/comm/persistence/DBTransactions$EarnState;

    move-result-object v9

    invoke-virtual {v9}, Lcom/getjar/sdk/comm/persistence/DBTransactions$EarnState;->name()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v7, v8

    const/4 v8, 0x2

    invoke-virtual/range {p3 .. p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v7, v8

    const/4 v8, 0x3

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Thread;->getId()J

    move-result-wide v16

    invoke-static/range {v16 .. v17}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-static {v4, v5, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 1273
    const/4 v13, 0x0

    .line 1274
    .local v13, "operation":Lcom/getjar/sdk/comm/Operation;
    sget-object v2, Lcom/getjar/sdk/comm/persistence/DBTransactions$EarnState;->CREATED:Lcom/getjar/sdk/comm/persistence/DBTransactions$EarnState;

    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/persistence/EarnBucket;->getState()Lcom/getjar/sdk/comm/persistence/DBTransactions$EarnState;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/getjar/sdk/comm/persistence/DBTransactions$EarnState;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    sget-object v2, Lcom/getjar/sdk/comm/persistence/DBTransactions$EarnState;->EARNING:Lcom/getjar/sdk/comm/persistence/DBTransactions$EarnState;

    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/persistence/EarnBucket;->getState()Lcom/getjar/sdk/comm/persistence/DBTransactions$EarnState;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/getjar/sdk/comm/persistence/DBTransactions$EarnState;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 1275
    :cond_0
    sget-object v2, Lcom/getjar/sdk/comm/persistence/DBTransactions$EarnState;->CREATED:Lcom/getjar/sdk/comm/persistence/DBTransactions$EarnState;

    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/persistence/EarnBucket;->getState()Lcom/getjar/sdk/comm/persistence/DBTransactions$EarnState;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/getjar/sdk/comm/persistence/DBTransactions$EarnState;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1278
    sget-object v2, Lcom/getjar/sdk/comm/persistence/DBTransactions$EarnState;->EARNING:Lcom/getjar/sdk/comm/persistence/DBTransactions$EarnState;

    move-object/from16 v0, p2

    move-object/from16 v1, p1

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/comm/TransactionManager;->updateEarnTransactionState(Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/comm/persistence/EarnBucket;Lcom/getjar/sdk/comm/persistence/DBTransactions$EarnState;)V

    .line 1282
    :cond_1
    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/persistence/EarnBucket;->getRelatedObject()Lcom/getjar/sdk/comm/persistence/RelatedEarnData;

    move-result-object v11

    .line 1283
    .local v11, "earnData":Lcom/getjar/sdk/comm/persistence/RelatedEarnData;
    invoke-static {}, Lcom/getjar/sdk/comm/TransactionServiceProxy;->getInstance()Lcom/getjar/sdk/comm/TransactionServiceProxy;

    move-result-object v2

    invoke-virtual {v11}, Lcom/getjar/sdk/comm/persistence/RelatedEarnData;->getItemId()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v11}, Lcom/getjar/sdk/comm/persistence/RelatedEarnData;->getPackageName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v11}, Lcom/getjar/sdk/comm/persistence/RelatedEarnData;->getItemMetadata()Ljava/util/HashMap;

    move-result-object v7

    invoke-virtual {v11}, Lcom/getjar/sdk/comm/persistence/RelatedEarnData;->getTrackingMetadata()Ljava/util/HashMap;

    move-result-object v8

    move-object/from16 v3, p2

    move/from16 v9, p4

    invoke-virtual/range {v2 .. v9}, Lcom/getjar/sdk/comm/TransactionServiceProxy;->earn(Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;Ljava/util/HashMap;Z)Lcom/getjar/sdk/comm/Operation;

    move-result-object v13

    .line 1294
    :try_start_0
    move-object/from16 v0, p3

    invoke-virtual {v13, v0}, Lcom/getjar/sdk/comm/Operation;->mapResultToCallbacks(Lcom/getjar/sdk/comm/CallbackInterface;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1300
    :goto_0
    invoke-virtual {v13}, Lcom/getjar/sdk/comm/Operation;->get()Lcom/getjar/sdk/comm/Result;

    move-result-object v12

    .line 1301
    .local v12, "earnResult":Lcom/getjar/sdk/comm/Result;
    if-eqz v12, :cond_6

    .line 1302
    sget-object v2, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    sget-object v4, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "TransactionManager: runEarnTransaction() Earn received a %1$d result"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    invoke-virtual {v12}, Lcom/getjar/sdk/comm/Result;->getResponseCode()I

    move-result v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-static {v4, v5, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 1303
    invoke-virtual {v12}, Lcom/getjar/sdk/comm/Result;->isSuccessfulResponse()Z

    move-result v2

    if-eqz v2, :cond_5

    .line 1311
    sget-object v2, Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;->NONE:Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;

    invoke-virtual {v2}, Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v12, v2}, Lcom/getjar/sdk/comm/TransactionManager;->getTransactionSubstate(Lcom/getjar/sdk/comm/Result;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    .line 1312
    .local v15, "substate":Ljava/lang/String;
    const-string v2, "INCOMPLETE_RECONCILE_WARNING"

    invoke-virtual {v2, v15}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    const-string v2, "DEPENDENT_SERVICE_FAILURE"

    invoke-virtual {v2, v15}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    const-string v2, "UNKNOWN_RETRY_WARNING"

    invoke-virtual {v2, v15}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 1348
    .end local v11    # "earnData":Lcom/getjar/sdk/comm/persistence/RelatedEarnData;
    .end local v12    # "earnResult":Lcom/getjar/sdk/comm/Result;
    .end local v15    # "substate":Ljava/lang/String;
    :cond_2
    :goto_1
    sget-object v2, Lcom/getjar/sdk/comm/persistence/DBTransactions$EarnState;->DONE:Lcom/getjar/sdk/comm/persistence/DBTransactions$EarnState;

    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/persistence/EarnBucket;->getState()Lcom/getjar/sdk/comm/persistence/DBTransactions$EarnState;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/getjar/sdk/comm/persistence/DBTransactions$EarnState;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 1349
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/getjar/sdk/comm/TransactionManager;->_applicationContext:Landroid/content/Context;

    invoke-static {v2}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/comm/persistence/DBTransactions;

    move-result-object v2

    invoke-virtual {v2, v6}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->deleteTransaction(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_7

    .line 1350
    sget-object v2, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    sget-object v4, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "TransactionManager: runEarnTransaction() failed to delete a Earn transaction in the DONE state [clientTransactionId: %1$s]"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object v6, v7, v8

    invoke-static {v4, v5, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;)V

    .line 1360
    :cond_3
    :goto_2
    return-object v13

    .line 1295
    .restart local v11    # "earnData":Lcom/getjar/sdk/comm/persistence/RelatedEarnData;
    :catch_0
    move-exception v10

    .line 1296
    .local v10, "e":Ljava/lang/Exception;
    sget-object v2, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    const-string v4, "TransactionManager: runEarnTransaction() Result to callback mapping failed"

    invoke-static {v2, v3, v4, v10}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_0

    .line 1323
    .end local v10    # "e":Ljava/lang/Exception;
    .restart local v12    # "earnResult":Lcom/getjar/sdk/comm/Result;
    .restart local v15    # "substate":Ljava/lang/String;
    :cond_4
    sget-object v2, Lcom/getjar/sdk/comm/persistence/DBTransactions$EarnState;->DONE:Lcom/getjar/sdk/comm/persistence/DBTransactions$EarnState;

    move-object/from16 v0, p2

    move-object/from16 v1, p1

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/comm/TransactionManager;->updateEarnTransactionState(Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/comm/persistence/EarnBucket;Lcom/getjar/sdk/comm/persistence/DBTransactions$EarnState;)V

    goto :goto_1

    .line 1326
    .end local v15    # "substate":Ljava/lang/String;
    :cond_5
    invoke-virtual {v12}, Lcom/getjar/sdk/comm/Result;->getResponseCode()I

    move-result v2

    const/16 v3, 0xca

    if-eq v2, v3, :cond_2

    .line 1336
    invoke-static {v12}, Lcom/getjar/sdk/comm/RequestUtilities;->getServicesException(Lcom/getjar/sdk/comm/Result;)Lcom/getjar/sdk/exceptions/ServiceException;

    move-result-object v14

    .line 1337
    .local v14, "servicesException":Lcom/getjar/sdk/exceptions/ServiceException;
    if-eqz v14, :cond_2

    .line 1338
    sget-object v2, Lcom/getjar/sdk/comm/persistence/DBTransactions$EarnState;->DONE:Lcom/getjar/sdk/comm/persistence/DBTransactions$EarnState;

    move-object/from16 v0, p2

    move-object/from16 v1, p1

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/comm/TransactionManager;->updateEarnTransactionState(Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/comm/persistence/EarnBucket;Lcom/getjar/sdk/comm/persistence/DBTransactions$EarnState;)V

    goto :goto_1

    .line 1343
    .end local v14    # "servicesException":Lcom/getjar/sdk/exceptions/ServiceException;
    :cond_6
    sget-object v2, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    sget-object v4, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "TransactionManager: runEarnTransaction() Earn operation %1$d failed to get results"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    invoke-virtual {v13}, Lcom/getjar/sdk/comm/Operation;->getId()I

    move-result v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-static {v4, v5, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;)V

    goto/16 :goto_1

    .line 1354
    .end local v11    # "earnData":Lcom/getjar/sdk/comm/persistence/RelatedEarnData;
    .end local v12    # "earnResult":Lcom/getjar/sdk/comm/Result;
    :cond_7
    sget-object v2, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    sget-object v4, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "TransactionManager: runEarnTransaction() deleted a Earn transaction in the DONE state [clientTransactionId: %1$s]"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object v6, v7, v8

    invoke-static {v4, v5, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    goto/16 :goto_2
.end method

.method private runManagedOfferTransaction(Ljava/lang/String;Lcom/getjar/sdk/comm/CommContext;Z)Lcom/getjar/sdk/comm/Operation;
    .locals 23
    .param p1, "clientTransactionId"    # Ljava/lang/String;
    .param p2, "commContext"    # Lcom/getjar/sdk/comm/CommContext;
    .param p3, "suppressInternalCallbacks"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 865
    sget-object v4, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    sget-object v6, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    or-long/2addr v4, v6

    sget-object v6, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v7, "TransactionManager: runManagedPurchaseTransaction() [clientTransactionId: %1$s] [thread: %2$d]"

    const/4 v8, 0x2

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    aput-object p1, v8, v9

    const/4 v9, 0x1

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Thread;->getId()J

    move-result-wide v21

    invoke-static/range {v21 .. v22}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-static {v6, v7, v8}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v5, v6}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 870
    const/16 v16, 0x0

    .line 871
    .local v16, "operation":Lcom/getjar/sdk/comm/Operation;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/getjar/sdk/comm/TransactionManager;->_applicationContext:Landroid/content/Context;

    invoke-static {v4}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/comm/persistence/DBTransactions;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-virtual {v4, v0}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->loadTransaction(Ljava/lang/String;)Lcom/getjar/sdk/comm/persistence/TransactionBucket;

    move-result-object v12

    .line 872
    .local v12, "baseTransaction":Lcom/getjar/sdk/comm/persistence/TransactionBucket;
    if-eqz v12, :cond_c

    move-object/from16 v19, v12

    .line 873
    check-cast v19, Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;

    .line 875
    .local v19, "transaction":Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;
    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Lcom/getjar/sdk/comm/TransactionManager;->checkCancelling(Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;)Z

    .line 878
    sget-object v4, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->CREATED:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    invoke-virtual/range {v19 .. v19}, Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;->getState()Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    sget-object v4, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->RESERVING:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    invoke-virtual/range {v19 .. v19}, Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;->getState()Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 881
    :cond_0
    sget-object v4, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->CREATED:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    invoke-virtual/range {v19 .. v19}, Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;->getState()Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 882
    sget-object v5, Lcom/getjar/sdk/comm/TransactionManager;->_ManagedOfferTransactionStateLock:Ljava/lang/Object;

    monitor-enter v5

    .line 883
    :try_start_0
    sget-object v4, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->RESERVING:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    move-object/from16 v0, p2

    move-object/from16 v1, v19

    invoke-static {v0, v1, v4}, Lcom/getjar/sdk/comm/TransactionManager;->updateOfferTransactionState(Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;)V

    .line 884
    monitor-exit v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 887
    :cond_1
    sget-object v4, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    sget-object v6, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    or-long/2addr v4, v6

    sget-object v6, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v7, "TransactionManager: RESERVING [clientTransactionId: %1$s] [state: %2$s] [thread: %3$d]"

    const/4 v8, 0x3

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    aput-object p1, v8, v9

    const/4 v9, 0x1

    invoke-virtual/range {v19 .. v19}, Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;->getState()Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    move-result-object v10

    invoke-virtual {v10}, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->name()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    const/4 v9, 0x2

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Thread;->getId()J

    move-result-wide v21

    invoke-static/range {v21 .. v22}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-static {v6, v7, v8}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v5, v6}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 893
    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Lcom/getjar/sdk/comm/TransactionManager;->checkCancelling(Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;)Z

    move-result v4

    if-nez v4, :cond_3

    .line 895
    invoke-static {}, Lcom/getjar/sdk/comm/TransactionServiceProxy;->getInstance()Lcom/getjar/sdk/comm/TransactionServiceProxy;

    move-result-object v4

    invoke-virtual/range {v19 .. v19}, Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;->getRelatedObject()Lcom/getjar/sdk/comm/persistence/RelatedManagedOfferData;

    move-result-object v5

    invoke-virtual {v5}, Lcom/getjar/sdk/comm/persistence/RelatedManagedOfferData;->getOfferToken()Ljava/lang/String;

    move-result-object v6

    invoke-virtual/range {v19 .. v19}, Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;->getRelatedObject()Lcom/getjar/sdk/comm/persistence/RelatedManagedOfferData;

    move-result-object v5

    invoke-virtual {v5}, Lcom/getjar/sdk/comm/persistence/RelatedManagedOfferData;->getPurchaseMetadata()Ljava/util/HashMap;

    move-result-object v8

    invoke-virtual/range {v19 .. v19}, Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;->getRelatedObject()Lcom/getjar/sdk/comm/persistence/RelatedManagedOfferData;

    move-result-object v5

    invoke-virtual {v5}, Lcom/getjar/sdk/comm/persistence/RelatedManagedOfferData;->getTrackingMetadata()Ljava/util/HashMap;

    move-result-object v9

    move-object/from16 v5, p2

    move-object/from16 v7, p1

    move/from16 v10, p3

    invoke-virtual/range {v4 .. v10}, Lcom/getjar/sdk/comm/TransactionServiceProxy;->reserveManagedOffer(Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;Ljava/util/HashMap;Z)Lcom/getjar/sdk/comm/Operation;

    move-result-object v16

    .line 903
    invoke-virtual/range {v16 .. v16}, Lcom/getjar/sdk/comm/Operation;->get()Lcom/getjar/sdk/comm/Result;

    move-result-object v18

    .line 904
    .local v18, "result":Lcom/getjar/sdk/comm/Result;
    if-eqz v18, :cond_d

    invoke-virtual/range {v18 .. v18}, Lcom/getjar/sdk/comm/Result;->isSuccessfulResponse()Z

    move-result v4

    if-eqz v4, :cond_d

    .line 907
    :try_start_1
    sget-object v5, Lcom/getjar/sdk/comm/TransactionManager;->_ManagedOfferTransactionStateLock:Ljava/lang/Object;

    monitor-enter v5
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 908
    if-eqz v19, :cond_2

    :try_start_2
    sget-object v4, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->RESERVING:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    invoke-virtual/range {v19 .. v19}, Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;->getState()Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    move-result-object v6

    invoke-virtual {v4, v6}, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 909
    sget-object v4, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->RESERVED:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, v18

    move-object/from16 v3, v19

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/getjar/sdk/comm/TransactionManager;->updateOfferStateFromResponseState(Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/comm/Result;Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;)Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    .line 911
    :cond_2
    monitor-exit v5
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 927
    .end local v18    # "result":Lcom/getjar/sdk/comm/Result;
    :cond_3
    :goto_0
    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Lcom/getjar/sdk/comm/TransactionManager;->checkCancelling(Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;)Z

    .line 930
    sget-object v4, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->PURCHASED:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    invoke-virtual/range {v19 .. v19}, Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;->getState()Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_4

    sget-object v4, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->CONFIRMING:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    invoke-virtual/range {v19 .. v19}, Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;->getState()Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_9

    .line 932
    :cond_4
    sget-object v4, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    sget-object v6, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    or-long/2addr v4, v6

    sget-object v6, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v7, "TransactionManager: CONFIRMING [clientTransactionId: %1$s] [thread: %2$d]"

    const/4 v8, 0x2

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    aput-object p1, v8, v9

    const/4 v9, 0x1

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Thread;->getId()J

    move-result-wide v21

    invoke-static/range {v21 .. v22}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-static {v6, v7, v8}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v5, v6}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 937
    invoke-virtual/range {v19 .. v19}, Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;->getRelatedObject()Lcom/getjar/sdk/comm/persistence/RelatedManagedOfferData;

    move-result-object v4

    invoke-virtual {v4}, Lcom/getjar/sdk/comm/persistence/RelatedManagedOfferData;->getPurchaseMetadata()Ljava/util/HashMap;

    move-result-object v17

    .line 938
    .local v17, "purchaseMetadata":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    sget-object v4, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    sget-object v6, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    or-long/2addr v4, v6

    const-string v6, "TransactionManager runManagedPurchaseTransaction starting runManagedPurchaseTransaction()"

    invoke-static {v4, v5, v6}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 940
    sget-object v4, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->CONFIRMING:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    invoke-virtual/range {v19 .. v19}, Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;->getState()Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_5

    .line 941
    sget-object v5, Lcom/getjar/sdk/comm/TransactionManager;->_ManagedOfferTransactionStateLock:Ljava/lang/Object;

    monitor-enter v5

    .line 942
    :try_start_3
    sget-object v4, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->CONFIRMING:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    move-object/from16 v0, p2

    move-object/from16 v1, v19

    invoke-static {v0, v1, v4}, Lcom/getjar/sdk/comm/TransactionManager;->updateOfferTransactionState(Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;)V

    .line 944
    monitor-exit v5
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    .line 947
    :cond_5
    invoke-static {}, Lcom/getjar/sdk/comm/TransactionServiceProxy;->getInstance()Lcom/getjar/sdk/comm/TransactionServiceProxy;

    move-result-object v4

    move-object/from16 v0, p2

    move-object/from16 v1, p1

    move-object/from16 v2, v17

    move/from16 v3, p3

    invoke-virtual {v4, v0, v1, v2, v3}, Lcom/getjar/sdk/comm/TransactionServiceProxy;->confirmManagedOffer(Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Ljava/util/HashMap;Z)Lcom/getjar/sdk/comm/Operation;

    move-result-object v16

    .line 953
    invoke-virtual/range {v16 .. v16}, Lcom/getjar/sdk/comm/Operation;->get()Lcom/getjar/sdk/comm/Result;

    move-result-object v18

    .line 954
    .restart local v18    # "result":Lcom/getjar/sdk/comm/Result;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/getjar/sdk/comm/TransactionManager;->_applicationContext:Landroid/content/Context;

    invoke-static {v4}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/rewards/InAppPurchaseManager;

    move-result-object v4

    invoke-virtual {v4}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->getCurrentClientTransactionId()Ljava/lang/String;

    move-result-object v13

    .line 955
    .local v13, "currentClientTransactionId":Ljava/lang/String;
    if-eqz v18, :cond_e

    invoke-virtual/range {v18 .. v18}, Lcom/getjar/sdk/comm/Result;->isSuccessfulResponse()Z

    move-result v4

    if-eqz v4, :cond_e

    .line 958
    sget-object v5, Lcom/getjar/sdk/comm/TransactionManager;->_ManagedOfferTransactionStateLock:Ljava/lang/Object;

    monitor-enter v5

    .line 959
    :try_start_4
    sget-object v4, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->CONFIRMED:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, v18

    move-object/from16 v3, v19

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/getjar/sdk/comm/TransactionManager;->updateOfferStateFromResponseState(Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/comm/Result;Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;)Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    .line 961
    monitor-exit v5
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_4

    .line 964
    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v1}, Lcom/getjar/sdk/comm/TransactionManager;->getEarnOnPurchaseAmount(Lcom/getjar/sdk/comm/Result;)Ljava/lang/Long;

    move-result-object v11

    .line 965
    .local v11, "amount":Ljava/lang/Long;
    if-eqz v11, :cond_6

    invoke-virtual {v11}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    const-wide/16 v6, 0x0

    cmp-long v4, v4, v6

    if-lez v4, :cond_6

    .line 966
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/getjar/sdk/comm/TransactionManager;->_applicationContext:Landroid/content/Context;

    const/4 v5, 0x0

    invoke-virtual {v11}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    invoke-static {v4, v5, v6, v7}, Lcom/getjar/sdk/utilities/NotificationsUtility;->showEarnedFromPurchaseNotification(Landroid/content/Context;Ljava/lang/String;J)V

    .line 971
    :cond_6
    const/16 v20, 0x0

    .line 973
    .local v20, "userDeviceIdFromGooglePlay":Ljava/lang/String;
    :try_start_5
    new-instance v5, Lorg/json/JSONObject;

    const-string v4, "order.google_play.signed_data"

    move-object/from16 v0, v17

    invoke-virtual {v0, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-direct {v5, v4}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v4, "developerPayload"

    invoke-virtual {v5, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 974
    .local v14, "developerPayload":Ljava/lang/String;
    const-string v4, ","

    invoke-virtual {v14, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x2

    aget-object v20, v4, v5
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1

    .line 976
    .end local v14    # "developerPayload":Ljava/lang/String;
    :goto_1
    :try_start_6
    invoke-static/range {v20 .. v20}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_7

    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v4

    invoke-virtual {v4}, Lcom/getjar/sdk/comm/auth/AuthManager;->getUserDeviceId()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, v20

    invoke-virtual {v0, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_8

    .line 977
    :cond_7
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/getjar/sdk/comm/TransactionManager;->_applicationContext:Landroid/content/Context;

    invoke-static {v4}, Lcom/getjar/sdk/utilities/NotificationsUtility;->showRedeemReminderNotification(Landroid/content/Context;)V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_2

    .line 982
    :cond_8
    :goto_2
    invoke-static {v13}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_9

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_9

    .line 983
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/getjar/sdk/comm/TransactionManager;->_applicationContext:Landroid/content/Context;

    sget-object v5, Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;->SUCCESS:Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;

    invoke-virtual/range {v18 .. v18}, Lcom/getjar/sdk/comm/Result;->getResponseJson()Lorg/json/JSONObject;

    move-result-object v6

    const-string v7, "return"

    invoke-virtual {v6, v7}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v6

    invoke-static {v4, v5, v6}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->updateUIwithOfferResults(Landroid/content/Context;Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;Lorg/json/JSONObject;)V

    .line 1012
    .end local v11    # "amount":Ljava/lang/Long;
    .end local v13    # "currentClientTransactionId":Ljava/lang/String;
    .end local v17    # "purchaseMetadata":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v18    # "result":Lcom/getjar/sdk/comm/Result;
    .end local v20    # "userDeviceIdFromGooglePlay":Ljava/lang/String;
    :cond_9
    :goto_3
    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Lcom/getjar/sdk/comm/TransactionManager;->checkCancelling(Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;)Z

    .line 1014
    sget-object v4, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->CONFIRMED:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    invoke-virtual/range {v19 .. v19}, Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;->getState()Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_a

    .line 1018
    sget-object v4, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->CONSUMING:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    move-object/from16 v0, p2

    move-object/from16 v1, v19

    invoke-static {v0, v1, v4}, Lcom/getjar/sdk/comm/TransactionManager;->updateOfferTransactionState(Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;)V

    .line 1021
    :cond_a
    sget-object v4, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->CONSUMING:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    invoke-virtual/range {v19 .. v19}, Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;->getState()Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_b

    .line 1022
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/getjar/sdk/comm/TransactionManager;->_applicationContext:Landroid/content/Context;

    invoke-static {v4}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/rewards/InAppPurchaseManager;

    move-result-object v4

    const/4 v5, 0x0

    move-object/from16 v0, v19

    invoke-virtual {v4, v0, v5}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->consumeManagedOffer(Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;Z)Z

    .line 1025
    :cond_b
    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Lcom/getjar/sdk/comm/TransactionManager;->checkCancelling(Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;)Z

    .line 1028
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, v19

    move/from16 v3, p3

    invoke-direct {v0, v1, v2, v3}, Lcom/getjar/sdk/comm/TransactionManager;->checkAndCancelManagedOffer(Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;Z)V

    .line 1030
    .end local v19    # "transaction":Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;
    :cond_c
    return-object v16

    .line 884
    .restart local v19    # "transaction":Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;
    :catchall_0
    move-exception v4

    :try_start_7
    monitor-exit v5
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    throw v4

    .line 911
    .restart local v18    # "result":Lcom/getjar/sdk/comm/Result;
    :catchall_1
    move-exception v4

    :try_start_8
    monitor-exit v5
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    :try_start_9
    throw v4
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_0

    .line 912
    :catch_0
    move-exception v15

    .line 913
    .local v15, "e":Ljava/lang/Exception;
    sget-object v4, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    sget-object v6, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    or-long/2addr v4, v6

    sget-object v6, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    or-long/2addr v4, v6

    const-string v6, "TransactionManager: failure"

    invoke-static {v4, v5, v6, v15}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 914
    move-object/from16 v0, p2

    invoke-virtual {v0, v15}, Lcom/getjar/sdk/comm/CommContext;->addException(Ljava/lang/Throwable;)V

    goto/16 :goto_0

    .line 919
    .end local v15    # "e":Ljava/lang/Exception;
    :cond_d
    sget-object v4, Lcom/getjar/sdk/comm/TransactionManager;->_CanceledClientTransactionIDs:Ljava/util/concurrent/ConcurrentLinkedQueue;

    move-object/from16 v0, p1

    invoke-virtual {v4, v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;->add(Ljava/lang/Object;)Z

    .line 920
    sget-object v5, Lcom/getjar/sdk/comm/TransactionManager;->_ManagedOfferTransactionStateLock:Ljava/lang/Object;

    monitor-enter v5

    .line 921
    :try_start_a
    sget-object v4, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->CANCELING:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    move-object/from16 v0, p2

    move-object/from16 v1, v19

    invoke-static {v0, v1, v4}, Lcom/getjar/sdk/comm/TransactionManager;->updateOfferTransactionState(Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;)V

    .line 922
    monitor-exit v5

    goto/16 :goto_0

    :catchall_2
    move-exception v4

    monitor-exit v5
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_2

    throw v4

    .line 944
    .end local v18    # "result":Lcom/getjar/sdk/comm/Result;
    .restart local v17    # "purchaseMetadata":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :catchall_3
    move-exception v4

    :try_start_b
    monitor-exit v5
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_3

    throw v4

    .line 961
    .restart local v13    # "currentClientTransactionId":Ljava/lang/String;
    .restart local v18    # "result":Lcom/getjar/sdk/comm/Result;
    :catchall_4
    move-exception v4

    :try_start_c
    monitor-exit v5
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_4

    throw v4

    .line 975
    .restart local v11    # "amount":Ljava/lang/Long;
    .restart local v20    # "userDeviceIdFromGooglePlay":Ljava/lang/String;
    :catch_1
    move-exception v15

    .restart local v15    # "e":Ljava/lang/Exception;
    :try_start_d
    sget-object v4, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    sget-object v6, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    or-long/2addr v4, v6

    const-string v6, "Failed to get User Device ID from Google Play data"

    invoke-static {v4, v5, v6, v15}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;Ljava/lang/Throwable;)V
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_2

    goto/16 :goto_1

    .line 979
    .end local v15    # "e":Ljava/lang/Exception;
    :catch_2
    move-exception v15

    .restart local v15    # "e":Ljava/lang/Exception;
    sget-object v4, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    sget-object v6, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    or-long/2addr v4, v6

    const-string v6, "Failed to send redeem reminder notification"

    invoke-static {v4, v5, v6, v15}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_2

    .line 989
    .end local v11    # "amount":Ljava/lang/Long;
    .end local v15    # "e":Ljava/lang/Exception;
    .end local v20    # "userDeviceIdFromGooglePlay":Ljava/lang/String;
    :cond_e
    if-eqz v18, :cond_10

    invoke-static/range {v18 .. v18}, Lcom/getjar/sdk/comm/RequestUtilities;->getServicesException(Lcom/getjar/sdk/comm/Result;)Lcom/getjar/sdk/exceptions/ServiceException;

    move-result-object v4

    if-eqz v4, :cond_10

    invoke-virtual/range {v18 .. v18}, Lcom/getjar/sdk/comm/Result;->getResponseCode()I

    move-result v4

    const/16 v5, 0x1f4

    if-eq v4, v5, :cond_10

    .line 991
    sget-object v4, Lcom/getjar/sdk/comm/TransactionManager;->_CanceledClientTransactionIDs:Ljava/util/concurrent/ConcurrentLinkedQueue;

    move-object/from16 v0, p1

    invoke-virtual {v4, v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;->add(Ljava/lang/Object;)Z

    .line 993
    sget-object v5, Lcom/getjar/sdk/comm/TransactionManager;->_ManagedOfferTransactionStateLock:Ljava/lang/Object;

    monitor-enter v5

    .line 994
    :try_start_e
    sget-object v4, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->CANCELING:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    move-object/from16 v0, p2

    move-object/from16 v1, v19

    invoke-static {v0, v1, v4}, Lcom/getjar/sdk/comm/TransactionManager;->updateOfferTransactionState(Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;)V

    .line 995
    monitor-exit v5
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_5

    .line 997
    invoke-static {v13}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_f

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_f

    .line 998
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/getjar/sdk/comm/TransactionManager;->_applicationContext:Landroid/content/Context;

    sget-object v5, Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;->SERVER_ERROR:Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;

    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    invoke-static {v4, v5, v6}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->updateUIwithOfferResults(Landroid/content/Context;Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;Lorg/json/JSONObject;)V

    .line 1008
    :cond_f
    :goto_4
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/getjar/sdk/comm/TransactionManager;->_applicationContext:Landroid/content/Context;

    invoke-static {v4}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/rewards/InAppPurchaseManager;

    move-result-object v4

    invoke-virtual {v4}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->removeLastClientTransactionId()V

    goto/16 :goto_3

    .line 995
    :catchall_5
    move-exception v4

    :try_start_f
    monitor-exit v5
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_5

    throw v4

    .line 1004
    :cond_10
    invoke-static {v13}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_f

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_f

    .line 1005
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/getjar/sdk/comm/TransactionManager;->_applicationContext:Landroid/content/Context;

    sget-object v5, Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;->SERVER_ERROR_RECOVERABLE:Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;

    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    invoke-static {v4, v5, v6}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->updateUIwithOfferResults(Landroid/content/Context;Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;Lorg/json/JSONObject;)V

    goto :goto_4
.end method

.method private runPurchaseTransaction(Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;Lcom/getjar/sdk/comm/CommContext;Z)Lcom/getjar/sdk/comm/Operation;
    .locals 17
    .param p1, "transaction"    # Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;
    .param p2, "commContext"    # Lcom/getjar/sdk/comm/CommContext;
    .param p3, "suppressInternalCallbacks"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 1105
    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;->getClientTransactionId()Ljava/lang/String;

    move-result-object v10

    .line 1106
    .local v10, "clientTransactionId":Ljava/lang/String;
    sget-object v3, Lcom/getjar/sdk/logging/Area;->PURCHASE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "TransactionManager: runPurchaseTransaction() [clientTransactionId: %1$s] [state: %2$s] [thread: %3$d]"

    const/4 v7, 0x3

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object v10, v7, v8

    const/4 v8, 0x1

    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;->getState()Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;

    move-result-object v9

    invoke-virtual {v9}, Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;->name()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v7, v8

    const/4 v8, 0x2

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Thread;->getId()J

    move-result-wide v11

    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 1112
    const/4 v14, 0x0

    .line 1114
    .local v14, "reserveOperation":Lcom/getjar/sdk/comm/Operation;
    invoke-direct/range {p0 .. p1}, Lcom/getjar/sdk/comm/TransactionManager;->checkCancelling(Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;)Z

    .line 1117
    sget-object v3, Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;->CREATED:Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;

    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;->getState()Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    sget-object v3, Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;->RESERVING:Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;

    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;->getState()Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 1120
    :cond_0
    sget-object v3, Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;->CREATED:Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;

    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;->getState()Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 1121
    sget-object v4, Lcom/getjar/sdk/comm/TransactionManager;->_PurchaseTransactionStateLock:Ljava/lang/Object;

    monitor-enter v4

    .line 1122
    :try_start_0
    sget-object v3, Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;->RESERVING:Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;

    move-object/from16 v0, p2

    move-object/from16 v1, p1

    invoke-static {v0, v1, v3}, Lcom/getjar/sdk/comm/TransactionManager;->updatePurchaseTransactionState(Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;)V

    .line 1123
    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1126
    :cond_1
    invoke-direct/range {p0 .. p1}, Lcom/getjar/sdk/comm/TransactionManager;->checkCancelling(Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 1131
    invoke-static {}, Lcom/getjar/sdk/comm/TransactionServiceProxy;->getInstance()Lcom/getjar/sdk/comm/TransactionServiceProxy;

    move-result-object v3

    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;->getRelatedObject()Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;

    move-result-object v4

    invoke-virtual {v4}, Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;->getProductId()Ljava/lang/String;

    move-result-object v5

    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;->getRelatedObject()Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;

    move-result-object v4

    invoke-virtual {v4}, Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;->getProductName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;->getRelatedObject()Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;

    move-result-object v4

    invoke-virtual {v4}, Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;->getProductDescription()Ljava/lang/String;

    move-result-object v7

    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;->getRelatedObject()Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;

    move-result-object v4

    invoke-virtual {v4}, Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;->getAmount()Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;->getRelatedObject()Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;

    move-result-object v4

    invoke-virtual {v4}, Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;->getDeveloperPayload()Ljava/lang/String;

    move-result-object v9

    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;->getRelatedObject()Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;

    move-result-object v4

    invoke-virtual {v4}, Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;->getTrackingMetadata()Ljava/util/HashMap;

    move-result-object v11

    move-object/from16 v4, p2

    move/from16 v12, p3

    invoke-virtual/range {v3 .. v12}, Lcom/getjar/sdk/comm/TransactionServiceProxy;->reserveUnmanagedPurchase(Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;Z)Lcom/getjar/sdk/comm/Operation;

    move-result-object v14

    .line 1143
    invoke-virtual {v14}, Lcom/getjar/sdk/comm/Operation;->get()Lcom/getjar/sdk/comm/Result;

    move-result-object v15

    .line 1144
    .local v15, "result":Lcom/getjar/sdk/comm/Result;
    if-eqz v15, :cond_2

    .line 1145
    invoke-virtual {v15}, Lcom/getjar/sdk/comm/Result;->isSuccessfulResponse()Z

    move-result v3

    if-eqz v3, :cond_7

    .line 1148
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p1

    invoke-direct {v0, v15, v1, v2}, Lcom/getjar/sdk/comm/TransactionManager;->handleSuccessfulReserveResult(Lcom/getjar/sdk/comm/Result;Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;)V

    .line 1163
    .end local v15    # "result":Lcom/getjar/sdk/comm/Result;
    :cond_2
    :goto_0
    invoke-direct/range {p0 .. p1}, Lcom/getjar/sdk/comm/TransactionManager;->checkCancelling(Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;)Z

    .line 1166
    sget-object v3, Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;->CONFIRMING:Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;

    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;->getState()Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 1168
    const/4 v13, 0x0

    .line 1169
    .local v13, "operation":Lcom/getjar/sdk/comm/Operation;
    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;->getRelatedObject()Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;

    move-result-object v3

    invoke-virtual {v3}, Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;->getLicenseScope()Lcom/getjar/sdk/License$LicenseScope;

    move-result-object v3

    if-nez v3, :cond_8

    .line 1171
    sget-object v3, Lcom/getjar/sdk/logging/Area;->PURCHASE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    const-string v5, "TransactionManager runPurchaseTransaction starting confirmUnmanagedPurchase()"

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 1172
    invoke-static {}, Lcom/getjar/sdk/comm/TransactionServiceProxy;->getInstance()Lcom/getjar/sdk/comm/TransactionServiceProxy;

    move-result-object v3

    move-object/from16 v0, p2

    move/from16 v1, p3

    invoke-virtual {v3, v0, v10, v1}, Lcom/getjar/sdk/comm/TransactionServiceProxy;->confirmUnmanagedPurchase(Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Z)Lcom/getjar/sdk/comm/Operation;

    move-result-object v13

    .line 1182
    :goto_1
    invoke-virtual {v13}, Lcom/getjar/sdk/comm/Operation;->get()Lcom/getjar/sdk/comm/Result;

    move-result-object v15

    .line 1183
    .restart local v15    # "result":Lcom/getjar/sdk/comm/Result;
    if-eqz v15, :cond_4

    .line 1184
    sget-object v3, Lcom/getjar/sdk/logging/Area;->PURCHASE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "TransactionManager runPurchaseTransaction -- Response "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v15}, Lcom/getjar/sdk/comm/Result;->getResponseBody()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 1185
    invoke-virtual {v15}, Lcom/getjar/sdk/comm/Result;->isSuccessfulResponse()Z

    move-result v3

    if-eqz v3, :cond_9

    .line 1187
    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;->getRelatedObject()Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;

    move-result-object v3

    invoke-virtual {v3}, Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;->getLicenseScope()Lcom/getjar/sdk/License$LicenseScope;

    move-result-object v3

    if-eqz v3, :cond_3

    .line 1190
    new-instance v3, Lcom/getjar/sdk/data/LicenseEngine;

    move-object/from16 v0, p2

    invoke-direct {v3, v0}, Lcom/getjar/sdk/data/LicenseEngine;-><init>(Lcom/getjar/sdk/comm/CommContext;)V

    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;->getRelatedObject()Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;

    move-result-object v4

    invoke-virtual {v4}, Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;->getProductId()Ljava/lang/String;

    move-result-object v4

    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;->getRelatedObject()Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;

    move-result-object v5

    invoke-virtual {v5}, Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;->getLicenseScope()Lcom/getjar/sdk/License$LicenseScope;

    move-result-object v5

    sget-object v6, Lcom/getjar/sdk/data/LicenseInternal$InternalLicenseState;->SYNCED:Lcom/getjar/sdk/data/LicenseInternal$InternalLicenseState;

    invoke-virtual {v3, v4, v5, v6, v15}, Lcom/getjar/sdk/data/LicenseEngine;->updateLicenseState(Ljava/lang/String;Lcom/getjar/sdk/License$LicenseScope;Lcom/getjar/sdk/data/LicenseInternal$InternalLicenseState;Lcom/getjar/sdk/comm/Result;)Lcom/getjar/sdk/data/LicenseInternal;

    .line 1194
    :cond_3
    sget-object v4, Lcom/getjar/sdk/comm/TransactionManager;->_PurchaseTransactionStateLock:Ljava/lang/Object;

    monitor-enter v4

    .line 1195
    :try_start_1
    sget-object v3, Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;->DONE:Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p1

    invoke-direct {v0, v1, v15, v2, v3}, Lcom/getjar/sdk/comm/TransactionManager;->updatePurchaseStateFromResponseState(Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/comm/Result;Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;)Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;

    .line 1196
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 1211
    .end local v13    # "operation":Lcom/getjar/sdk/comm/Operation;
    .end local v15    # "result":Lcom/getjar/sdk/comm/Result;
    :cond_4
    :goto_2
    sget-object v3, Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;->CANCELING:Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;

    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;->getState()Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 1216
    invoke-static {}, Lcom/getjar/sdk/comm/TransactionServiceProxy;->getInstance()Lcom/getjar/sdk/comm/TransactionServiceProxy;

    move-result-object v3

    move-object/from16 v0, p2

    move/from16 v1, p3

    invoke-virtual {v3, v0, v10, v1}, Lcom/getjar/sdk/comm/TransactionServiceProxy;->cancelTransaction(Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Z)Lcom/getjar/sdk/comm/Operation;

    move-result-object v13

    .line 1217
    .restart local v13    # "operation":Lcom/getjar/sdk/comm/Operation;
    invoke-virtual {v13}, Lcom/getjar/sdk/comm/Operation;->get()Lcom/getjar/sdk/comm/Result;

    move-result-object v15

    .line 1218
    .restart local v15    # "result":Lcom/getjar/sdk/comm/Result;
    if-eqz v15, :cond_5

    .line 1219
    invoke-virtual {v15}, Lcom/getjar/sdk/comm/Result;->isSuccessfulResponse()Z

    move-result v3

    if-eqz v3, :cond_a

    .line 1222
    sget-object v4, Lcom/getjar/sdk/comm/TransactionManager;->_PurchaseTransactionStateLock:Ljava/lang/Object;

    monitor-enter v4

    .line 1223
    :try_start_2
    sget-object v3, Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;->DONE:Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p1

    invoke-direct {v0, v1, v15, v2, v3}, Lcom/getjar/sdk/comm/TransactionManager;->updatePurchaseStateFromResponseState(Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/comm/Result;Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;)Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;

    .line 1224
    monitor-exit v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_4

    .line 1225
    sget-object v3, Lcom/getjar/sdk/comm/TransactionManager;->_CanceledClientTransactionIDs:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual/range {p1 .. p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/concurrent/ConcurrentLinkedQueue;->remove(Ljava/lang/Object;)Z

    .line 1241
    .end local v13    # "operation":Lcom/getjar/sdk/comm/Operation;
    .end local v15    # "result":Lcom/getjar/sdk/comm/Result;
    :cond_5
    :goto_3
    sget-object v3, Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;->DONE:Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;

    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;->getState()Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 1242
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/getjar/sdk/comm/TransactionManager;->_applicationContext:Landroid/content/Context;

    invoke-static {v3}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/comm/persistence/DBTransactions;

    move-result-object v3

    invoke-virtual {v3, v10}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->deleteTransaction(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_b

    .line 1243
    sget-object v3, Lcom/getjar/sdk/logging/Area;->PURCHASE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "TransactionManager: runPurchaseTransaction() failed to delete a Purchase transaction in the DONE state [clientTransactionId: %1$s]"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object v10, v7, v8

    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;)V

    .line 1253
    :cond_6
    :goto_4
    return-object v14

    .line 1123
    :catchall_0
    move-exception v3

    :try_start_3
    monitor-exit v4
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v3

    .line 1152
    .restart local v15    # "result":Lcom/getjar/sdk/comm/Result;
    :cond_7
    invoke-static {v15}, Lcom/getjar/sdk/comm/RequestUtilities;->getServicesException(Lcom/getjar/sdk/comm/Result;)Lcom/getjar/sdk/exceptions/ServiceException;

    move-result-object v16

    .line 1153
    .local v16, "servicesException":Lcom/getjar/sdk/exceptions/ServiceException;
    if-eqz v16, :cond_2

    .line 1154
    sget-object v4, Lcom/getjar/sdk/comm/TransactionManager;->_PurchaseTransactionStateLock:Ljava/lang/Object;

    monitor-enter v4

    .line 1155
    :try_start_4
    sget-object v3, Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;->DONE:Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;

    move-object/from16 v0, p2

    move-object/from16 v1, p1

    invoke-static {v0, v1, v3}, Lcom/getjar/sdk/comm/TransactionManager;->updatePurchaseTransactionState(Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;)V

    .line 1156
    monitor-exit v4

    goto/16 :goto_0

    :catchall_1
    move-exception v3

    monitor-exit v4
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    throw v3

    .line 1176
    .end local v15    # "result":Lcom/getjar/sdk/comm/Result;
    .end local v16    # "servicesException":Lcom/getjar/sdk/exceptions/ServiceException;
    .restart local v13    # "operation":Lcom/getjar/sdk/comm/Operation;
    :cond_8
    sget-object v3, Lcom/getjar/sdk/logging/Area;->PURCHASE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    const-string v5, "TransactionManager runPurchaseTransaction starting confirmAndLicense()"

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 1177
    invoke-static {}, Lcom/getjar/sdk/comm/TransactionServiceProxy;->getInstance()Lcom/getjar/sdk/comm/TransactionServiceProxy;

    move-result-object v3

    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;->getClientTransactionId()Ljava/lang/String;

    move-result-object v5

    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;->getRelatedObject()Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;

    move-result-object v4

    invoke-virtual {v4}, Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;->getProductId()Ljava/lang/String;

    move-result-object v6

    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;->getRelatedObject()Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;

    move-result-object v4

    invoke-virtual {v4}, Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;->getLicenseScope()Lcom/getjar/sdk/License$LicenseScope;

    move-result-object v7

    move-object/from16 v4, p2

    move/from16 v8, p3

    invoke-virtual/range {v3 .. v8}, Lcom/getjar/sdk/comm/TransactionServiceProxy;->confirmAndLicense(Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Ljava/lang/String;Lcom/getjar/sdk/License$LicenseScope;Z)Lcom/getjar/sdk/comm/Operation;

    move-result-object v13

    goto/16 :goto_1

    .line 1196
    .restart local v15    # "result":Lcom/getjar/sdk/comm/Result;
    :catchall_2
    move-exception v3

    :try_start_5
    monitor-exit v4
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    throw v3

    .line 1200
    :cond_9
    invoke-static {v15}, Lcom/getjar/sdk/comm/RequestUtilities;->getServicesException(Lcom/getjar/sdk/comm/Result;)Lcom/getjar/sdk/exceptions/ServiceException;

    move-result-object v16

    .line 1201
    .restart local v16    # "servicesException":Lcom/getjar/sdk/exceptions/ServiceException;
    if-eqz v16, :cond_4

    .line 1202
    sget-object v4, Lcom/getjar/sdk/comm/TransactionManager;->_PurchaseTransactionStateLock:Ljava/lang/Object;

    monitor-enter v4

    .line 1203
    :try_start_6
    sget-object v3, Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;->DONE:Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;

    move-object/from16 v0, p2

    move-object/from16 v1, p1

    invoke-static {v0, v1, v3}, Lcom/getjar/sdk/comm/TransactionManager;->updatePurchaseTransactionState(Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;)V

    .line 1204
    monitor-exit v4

    goto/16 :goto_2

    :catchall_3
    move-exception v3

    monitor-exit v4
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    throw v3

    .line 1224
    .end local v16    # "servicesException":Lcom/getjar/sdk/exceptions/ServiceException;
    :catchall_4
    move-exception v3

    :try_start_7
    monitor-exit v4
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_4

    throw v3

    .line 1229
    :cond_a
    invoke-static {v15}, Lcom/getjar/sdk/comm/RequestUtilities;->getServicesException(Lcom/getjar/sdk/comm/Result;)Lcom/getjar/sdk/exceptions/ServiceException;

    move-result-object v16

    .line 1230
    .restart local v16    # "servicesException":Lcom/getjar/sdk/exceptions/ServiceException;
    if-eqz v16, :cond_5

    .line 1231
    sget-object v4, Lcom/getjar/sdk/comm/TransactionManager;->_PurchaseTransactionStateLock:Ljava/lang/Object;

    monitor-enter v4

    .line 1232
    :try_start_8
    sget-object v3, Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;->DONE:Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;

    move-object/from16 v0, p2

    move-object/from16 v1, p1

    invoke-static {v0, v1, v3}, Lcom/getjar/sdk/comm/TransactionManager;->updatePurchaseTransactionState(Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;)V

    .line 1233
    monitor-exit v4
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_5

    .line 1234
    sget-object v3, Lcom/getjar/sdk/comm/TransactionManager;->_CanceledClientTransactionIDs:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual/range {p1 .. p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/concurrent/ConcurrentLinkedQueue;->remove(Ljava/lang/Object;)Z

    goto/16 :goto_3

    .line 1233
    :catchall_5
    move-exception v3

    :try_start_9
    monitor-exit v4
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_5

    throw v3

    .line 1247
    .end local v13    # "operation":Lcom/getjar/sdk/comm/Operation;
    .end local v15    # "result":Lcom/getjar/sdk/comm/Result;
    .end local v16    # "servicesException":Lcom/getjar/sdk/exceptions/ServiceException;
    :cond_b
    sget-object v3, Lcom/getjar/sdk/logging/Area;->PURCHASE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "TransactionManager: runPurchaseTransaction() deleted a Purchase transaction in the DONE state [clientTransactionId: %1$s]"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object v10, v7, v8

    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    goto/16 :goto_4
.end method

.method private runTransactions(Lcom/getjar/sdk/comm/CommContext;ZZ)Ljava/util/concurrent/Future;
    .locals 9
    .param p1, "commContext"    # Lcom/getjar/sdk/comm/CommContext;
    .param p2, "earnAndManagedPurchaseOnly"    # Z
    .param p3, "suppressInternalCallbacks"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/getjar/sdk/comm/CommContext;",
            "ZZ)",
            "Ljava/util/concurrent/Future",
            "<",
            "Ljava/util/List",
            "<",
            "Lcom/getjar/sdk/comm/persistence/TransactionBucket;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 666
    sget-object v1, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "TransactionManager: runTransactions() [thread: %1$d]"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Thread;->getId()J

    move-result-wide v7

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 669
    new-instance v0, Lcom/getjar/sdk/utilities/SetExceptionFutureTask;

    new-instance v1, Lcom/getjar/sdk/comm/TransactionManager$8;

    invoke-direct {v1, p0, p1, p2, p3}, Lcom/getjar/sdk/comm/TransactionManager$8;-><init>(Lcom/getjar/sdk/comm/TransactionManager;Lcom/getjar/sdk/comm/CommContext;ZZ)V

    invoke-direct {v0, v1}, Lcom/getjar/sdk/utilities/SetExceptionFutureTask;-><init>(Ljava/util/concurrent/Callable;)V

    .line 682
    .local v0, "future":Lcom/getjar/sdk/utilities/SetExceptionFutureTask;, "Lcom/getjar/sdk/utilities/SetExceptionFutureTask<Ljava/util/List<Lcom/getjar/sdk/comm/persistence/TransactionBucket;>;>;"
    sget-object v1, Lcom/getjar/sdk/comm/TransactionManager;->_ExecutorServiceInternal:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v1, v0}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 683
    return-object v0
.end method

.method private runTransactionsInternal(Lcom/getjar/sdk/comm/CommContext;ZZ)Ljava/util/List;
    .locals 22
    .param p1, "commContext"    # Lcom/getjar/sdk/comm/CommContext;
    .param p2, "earnAndManagedPurchaseOnly"    # Z
    .param p3, "suppressInternalCallbacks"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/getjar/sdk/comm/CommContext;",
            "ZZ)",
            "Ljava/util/List",
            "<",
            "Lcom/getjar/sdk/comm/persistence/TransactionBucket;",
            ">;"
        }
    .end annotation

    .prologue
    .line 700
    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    .line 702
    .local v12, "transactions":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/comm/persistence/TransactionBucket;>;"
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 704
    .local v9, "returnTransactions":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/comm/persistence/TransactionBucket;>;"
    sget-object v15, Lcom/getjar/sdk/comm/TransactionManager;->_TransactionFlowLock:Ljava/lang/Object;

    monitor-enter v15

    .line 707
    :try_start_0
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/getjar/sdk/comm/TransactionManager;->_applicationContext:Landroid/content/Context;

    invoke-static {v13}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/comm/persistence/DBTransactions;

    move-result-object v13

    invoke-virtual {v13}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->loadAllTransactions()Ljava/util/List;

    move-result-object v12

    .line 709
    sget-object v13, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v13}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v13

    sget-object v16, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v16 .. v16}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v16

    or-long v13, v13, v16

    sget-object v16, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v17, "TransactionManager: runTransactionsInternal() loaded %1$d persisted transactions [thread: %2$d]"

    const/16 v18, 0x2

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    invoke-interface {v12}, Ljava/util/List;->size()I

    move-result v20

    invoke-static/range {v20 .. v20}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v20

    aput-object v20, v18, v19

    const/16 v19, 0x1

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Thread;->getId()J

    move-result-wide v20

    invoke-static/range {v20 .. v21}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v20

    aput-object v20, v18, v19

    invoke-static/range {v16 .. v18}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-static {v13, v14, v0}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 715
    const/4 v11, 0x0

    .line 717
    .local v11, "transactionTTL":Ljava/lang/Long;
    const/4 v13, 0x1

    :try_start_1
    move-object/from16 v0, p1

    invoke-static {v0, v13}, Lcom/getjar/sdk/comm/GetJarConfig;->getInstance(Lcom/getjar/sdk/comm/CommContext;Z)Lcom/getjar/sdk/comm/GetJarConfig;

    move-result-object v13

    const-string v14, "transaction.fail.abandon.time"

    invoke-virtual {v13, v14}, Lcom/getjar/sdk/comm/GetJarConfig;->getDirectiveValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v13

    invoke-static {v13, v14}, Lcom/getjar/sdk/utilities/Utility;->convertMillSec(J)J

    move-result-wide v13

    invoke-static {v13, v14}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    .line 719
    sget-object v13, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v13}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v13

    sget-object v16, Lcom/getjar/sdk/logging/Area;->CONFIG:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v16 .. v16}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v16

    or-long v13, v13, v16

    sget-object v16, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v17, "TransactionManager: Loaded a transaction TTL of %1$d milliseconds"

    const/16 v18, 0x1

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    aput-object v11, v18, v19

    invoke-static/range {v16 .. v18}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-static {v13, v14, v0}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 725
    :goto_0
    :try_start_2
    invoke-interface {v12}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .local v5, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_7

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/getjar/sdk/comm/persistence/TransactionBucket;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 729
    .local v10, "transaction":Lcom/getjar/sdk/comm/persistence/TransactionBucket;
    const/4 v8, 0x0

    .line 730
    .local v8, "removeDueToTTLTimeout":Z
    :try_start_3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    .line 731
    .local v6, "now":J
    if-eqz v11, :cond_1

    invoke-virtual {v10}, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->getTimestampCreated()J

    move-result-wide v13

    invoke-virtual {v11}, Ljava/lang/Long;->longValue()J

    move-result-wide v16

    add-long v13, v13, v16

    cmp-long v13, v13, v6

    if-gez v13, :cond_1

    .line 734
    sget-object v13, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v13}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v13

    sget-object v16, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v16 .. v16}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v16

    or-long v13, v13, v16

    sget-object v16, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v17, "TransactionManager: Transaction %1$s has exceeded the TTL [created:%2$d + ttl:%3$d < now:%4$d]"

    const/16 v18, 0x4

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    invoke-virtual {v10}, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->getClientTransactionId()Ljava/lang/String;

    move-result-object v20

    aput-object v20, v18, v19

    const/16 v19, 0x1

    invoke-virtual {v10}, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->getTimestampCreated()J

    move-result-wide v20

    invoke-static/range {v20 .. v21}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v20

    aput-object v20, v18, v19

    const/16 v19, 0x2

    aput-object v11, v18, v19

    const/16 v19, 0x3

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v20

    aput-object v20, v18, v19

    invoke-static/range {v16 .. v18}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-static {v13, v14, v0}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 740
    const/4 v8, 0x1

    .line 743
    :cond_1
    sget-object v13, Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;->PURCHASE:Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;

    invoke-virtual {v10}, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->getType()Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;

    move-result-object v14

    invoke-virtual {v13, v14}, Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_3

    .line 744
    if-nez p2, :cond_0

    .line 747
    if-eqz v8, :cond_2

    .line 748
    sget-object v13, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v13}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v13

    sget-object v16, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v16 .. v16}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v16

    or-long v13, v13, v16

    sget-object v16, Lcom/getjar/sdk/logging/Area;->PURCHASE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v16 .. v16}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v16

    or-long v13, v13, v16

    sget-object v16, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v17, "TransactionManager: Transaction %1$s has exceeded the TTL and timed out, removing it..."

    const/16 v18, 0x1

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    invoke-virtual {v10}, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->getClientTransactionId()Ljava/lang/String;

    move-result-object v20

    aput-object v20, v18, v19

    invoke-static/range {v16 .. v18}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-static {v13, v14, v0}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 749
    sget-object v14, Lcom/getjar/sdk/comm/TransactionManager;->_PurchaseTransactionStateLock:Ljava/lang/Object;

    monitor-enter v14
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 750
    :try_start_4
    move-object v0, v10

    check-cast v0, Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;

    move-object v13, v0

    sget-object v16, Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;->DONE:Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;

    move-object/from16 v0, p1

    move-object/from16 v1, v16

    invoke-static {v0, v13, v1}, Lcom/getjar/sdk/comm/TransactionManager;->updatePurchaseTransactionState(Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;)V

    .line 751
    monitor-exit v14
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 755
    :cond_2
    :try_start_5
    move-object v0, v10

    check-cast v0, Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;

    move-object v13, v0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p3

    invoke-direct {v0, v13, v1, v2}, Lcom/getjar/sdk/comm/TransactionManager;->runPurchaseTransaction(Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;Lcom/getjar/sdk/comm/CommContext;Z)Lcom/getjar/sdk/comm/Operation;

    .line 777
    :goto_2
    invoke-interface {v9, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto/16 :goto_1

    .line 778
    .end local v6    # "now":J
    :catch_0
    move-exception v4

    .line 781
    .local v4, "e":Ljava/lang/Exception;
    :try_start_6
    sget-object v13, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v13}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v13

    sget-object v16, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v16 .. v16}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v16

    or-long v13, v13, v16

    sget-object v16, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v17, "TransactionManager: A persisted \'%1$s\' transaction failed [ClientTransactionId: %2$s]"

    const/16 v18, 0x2

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    invoke-virtual {v10}, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->getType()Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;->name()Ljava/lang/String;

    move-result-object v20

    aput-object v20, v18, v19

    const/16 v19, 0x1

    invoke-virtual {v10}, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->getClientTransactionId()Ljava/lang/String;

    move-result-object v20

    aput-object v20, v18, v19

    invoke-static/range {v16 .. v18}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-static {v13, v14, v0, v4}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_1

    .line 787
    .end local v4    # "e":Ljava/lang/Exception;
    .end local v5    # "i$":Ljava/util/Iterator;
    .end local v8    # "removeDueToTTLTimeout":Z
    .end local v10    # "transaction":Lcom/getjar/sdk/comm/persistence/TransactionBucket;
    .end local v11    # "transactionTTL":Ljava/lang/Long;
    :catchall_0
    move-exception v13

    monitor-exit v15
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    throw v13

    .line 720
    .restart local v11    # "transactionTTL":Ljava/lang/Long;
    :catch_1
    move-exception v4

    .line 721
    .restart local v4    # "e":Ljava/lang/Exception;
    :try_start_7
    sget-object v13, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v13}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v13

    sget-object v16, Lcom/getjar/sdk/logging/Area;->CONFIG:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v16 .. v16}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v16

    or-long v13, v13, v16

    const-string v16, "TransactionManager: Failed to get transaction TTL from config"

    move-object/from16 v0, v16

    invoke-static {v13, v14, v0, v4}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    goto/16 :goto_0

    .line 751
    .end local v4    # "e":Ljava/lang/Exception;
    .restart local v5    # "i$":Ljava/util/Iterator;
    .restart local v6    # "now":J
    .restart local v8    # "removeDueToTTLTimeout":Z
    .restart local v10    # "transaction":Lcom/getjar/sdk/comm/persistence/TransactionBucket;
    :catchall_1
    move-exception v13

    :try_start_8
    monitor-exit v14
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    :try_start_9
    throw v13

    .line 756
    :cond_3
    sget-object v13, Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;->EARN:Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;

    invoke-virtual {v10}, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->getType()Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;

    move-result-object v14

    invoke-virtual {v13, v14}, Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_5

    .line 759
    if-eqz v8, :cond_4

    .line 760
    sget-object v13, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v13}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v13

    sget-object v16, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v16 .. v16}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v16

    or-long v13, v13, v16

    sget-object v16, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v16 .. v16}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v16

    or-long v13, v13, v16

    sget-object v16, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v17, "TransactionManager: Transaction %1$s has exceeded the TTL and timed out, removing it..."

    const/16 v18, 0x1

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    invoke-virtual {v10}, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->getClientTransactionId()Ljava/lang/String;

    move-result-object v20

    aput-object v20, v18, v19

    invoke-static/range {v16 .. v18}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-static {v13, v14, v0}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 761
    move-object v0, v10

    check-cast v0, Lcom/getjar/sdk/comm/persistence/EarnBucket;

    move-object v13, v0

    sget-object v14, Lcom/getjar/sdk/comm/persistence/DBTransactions$EarnState;->DONE:Lcom/getjar/sdk/comm/persistence/DBTransactions$EarnState;

    move-object/from16 v0, p1

    invoke-static {v0, v13, v14}, Lcom/getjar/sdk/comm/TransactionManager;->updateEarnTransactionState(Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/comm/persistence/EarnBucket;Lcom/getjar/sdk/comm/persistence/DBTransactions$EarnState;)V

    .line 765
    :cond_4
    new-instance v3, Lcom/getjar/sdk/comm/TransactionManager$EarnCallback;

    move-object v0, v10

    check-cast v0, Lcom/getjar/sdk/comm/persistence/EarnBucket;

    move-object v13, v0

    invoke-virtual {v10}, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->getRelatedObject()Ljava/io/Serializable;

    move-result-object v14

    check-cast v14, Lcom/getjar/sdk/comm/persistence/RelatedEarnData;

    move-object/from16 v0, p0

    invoke-direct {v3, v0, v13, v14}, Lcom/getjar/sdk/comm/TransactionManager$EarnCallback;-><init>(Lcom/getjar/sdk/comm/TransactionManager;Lcom/getjar/sdk/comm/persistence/EarnBucket;Lcom/getjar/sdk/comm/persistence/RelatedEarnData;)V

    .line 766
    .local v3, "callback":Lcom/getjar/sdk/comm/CallbackInterface;
    move-object v0, v10

    check-cast v0, Lcom/getjar/sdk/comm/persistence/EarnBucket;

    move-object v13, v0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p3

    invoke-direct {v0, v13, v1, v3, v2}, Lcom/getjar/sdk/comm/TransactionManager;->runEarnTransaction(Lcom/getjar/sdk/comm/persistence/EarnBucket;Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/comm/CallbackInterface;Z)Lcom/getjar/sdk/comm/Operation;

    goto/16 :goto_2

    .line 767
    .end local v3    # "callback":Lcom/getjar/sdk/comm/CallbackInterface;
    :cond_5
    sget-object v13, Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;->MANAGED_OFFER:Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;

    invoke-virtual {v10}, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->getType()Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;

    move-result-object v14

    invoke-virtual {v13, v14}, Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_6

    .line 770
    invoke-virtual {v10}, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->getClientTransactionId()Ljava/lang/String;

    move-result-object v13

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p3

    invoke-direct {v0, v13, v1, v2}, Lcom/getjar/sdk/comm/TransactionManager;->runManagedOfferTransaction(Ljava/lang/String;Lcom/getjar/sdk/comm/CommContext;Z)Lcom/getjar/sdk/comm/Operation;

    goto/16 :goto_2

    .line 775
    :cond_6
    new-instance v13, Ljava/lang/IllegalStateException;

    sget-object v14, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v16, "Unrecognized trnasaction type: %1$s"

    const/16 v17, 0x1

    move/from16 v0, v17

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    invoke-virtual {v10}, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->getType()Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;->name()Ljava/lang/String;

    move-result-object v19

    aput-object v19, v17, v18

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    invoke-static {v14, v0, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    invoke-direct {v13, v14}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v13
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_0
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    .line 787
    .end local v6    # "now":J
    .end local v8    # "removeDueToTTLTimeout":Z
    .end local v10    # "transaction":Lcom/getjar/sdk/comm/persistence/TransactionBucket;
    :cond_7
    :try_start_a
    monitor-exit v15
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    .line 788
    return-object v9
.end method

.method private static updateEarnTransactionState(Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/comm/persistence/EarnBucket;Lcom/getjar/sdk/comm/persistence/DBTransactions$EarnState;)V
    .locals 8
    .param p0, "commContext"    # Lcom/getjar/sdk/comm/CommContext;
    .param p1, "transaction"    # Lcom/getjar/sdk/comm/persistence/EarnBucket;
    .param p2, "newState"    # Lcom/getjar/sdk/comm/persistence/DBTransactions$EarnState;

    .prologue
    .line 1411
    sget-object v0, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    sget-object v2, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "TransactionManager: updateEarnTransactionState() [clientTransactionId: %1$s] [old: %2$s] [new: %3$s] [thread: %4$d]"

    const/4 v4, 0x4

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-virtual {p1}, Lcom/getjar/sdk/comm/persistence/EarnBucket;->getClientTransactionId()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x1

    invoke-virtual {p1}, Lcom/getjar/sdk/comm/persistence/EarnBucket;->getState()Lcom/getjar/sdk/comm/persistence/DBTransactions$EarnState;

    move-result-object v6

    invoke-virtual {v6}, Lcom/getjar/sdk/comm/persistence/DBTransactions$EarnState;->name()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x2

    invoke-virtual {p2}, Lcom/getjar/sdk/comm/persistence/DBTransactions$EarnState;->name()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x3

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Thread;->getId()J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 1418
    invoke-virtual {p0}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/comm/persistence/DBTransactions;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->updateEarnTransaction(Lcom/getjar/sdk/comm/persistence/EarnBucket;Lcom/getjar/sdk/comm/persistence/DBTransactions$EarnState;)Z

    .line 1419
    invoke-virtual {p1, p2}, Lcom/getjar/sdk/comm/persistence/EarnBucket;->setState(Lcom/getjar/sdk/comm/persistence/DBTransactions$EarnState;)V

    .line 1420
    return-void
.end method

.method private updateOfferStateFromResponseState(Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/comm/Result;Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;)Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;
    .locals 10
    .param p1, "commContext"    # Lcom/getjar/sdk/comm/CommContext;
    .param p2, "result"    # Lcom/getjar/sdk/comm/Result;
    .param p3, "purchaseBucket"    # Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;
    .param p4, "failureDefault"    # Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    .prologue
    .line 1515
    move-object v1, p4

    .line 1519
    .local v1, "newState":Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;
    :try_start_0
    const-string v3, ""

    invoke-static {p2, v3}, Lcom/getjar/sdk/comm/TransactionManager;->getTransactionState(Lcom/getjar/sdk/comm/Result;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1520
    .local v2, "state":Ljava/lang/String;
    const-string v3, "SUCCESS"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 1521
    sget-object v1, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->DONE:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1540
    .end local v2    # "state":Ljava/lang/String;
    :cond_0
    :goto_0
    invoke-static {p1, p3, v1}, Lcom/getjar/sdk/comm/TransactionManager;->updateOfferTransactionState(Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;)V

    .line 1542
    return-object v1

    .line 1522
    .restart local v2    # "state":Ljava/lang/String;
    :cond_1
    :try_start_1
    const-string v3, "FAIL"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 1523
    sget-object v1, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->DONE:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    goto :goto_0

    .line 1524
    :cond_2
    const-string v3, "CANCELED"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 1525
    sget-object v1, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->DONE:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    goto :goto_0

    .line 1527
    :cond_3
    const-string v3, "CREATED"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 1528
    sget-object v1, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->RESERVING:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    goto :goto_0

    .line 1529
    :cond_4
    const-string v3, "RESERVED"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 1530
    sget-object v1, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->RESERVED:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    goto :goto_0

    .line 1531
    :cond_5
    const-string v3, "CONFIRMED"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 1532
    sget-object v1, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->CONSUMING:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 1535
    .end local v2    # "state":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 1536
    .local v0, "e":Ljava/lang/Exception;
    sget-object v3, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    sget-object v5, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "updateOfferStateFromResponseState() failed, setting state to: %1$s"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    invoke-virtual {v1}, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->name()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public static updateOfferTransactionState(Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;)V
    .locals 11
    .param p0, "commContext"    # Lcom/getjar/sdk/comm/CommContext;
    .param p1, "transaction"    # Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;
    .param p2, "newState"    # Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    .prologue
    const/4 v10, 0x2

    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 1383
    sget-object v0, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    sget-object v2, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "TransactionManager: updateOfferTransactionState() [clientTransactionId: %1$s] [old: %2$s] [new: %3$s] [thread: %4$d]"

    const/4 v4, 0x4

    new-array v4, v4, [Ljava/lang/Object;

    invoke-virtual {p1}, Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;->getClientTransactionId()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v8

    invoke-virtual {p1}, Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;->getState()Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    move-result-object v5

    invoke-virtual {v5}, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->name()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v9

    invoke-virtual {p2}, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->name()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v10

    const/4 v5, 0x3

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Thread;->getId()J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 1390
    sget-object v0, Lcom/getjar/sdk/comm/TransactionManager;->_CanceledClientTransactionIDs:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {p1}, Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;->getClientTransactionId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->CANCELING:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    invoke-virtual {v0, p2}, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1392
    sget-object v0, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    sget-object v2, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "TransactionManager: updateOfferTransactionState() [clientTransactionId: %1$s] CANCELING [%2$s]"

    new-array v4, v10, [Ljava/lang/Object;

    invoke-virtual {p1}, Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;->getClientTransactionId()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v8

    invoke-static {}, Lcom/getjar/sdk/logging/Logger;->getShortStack()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v9

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 1397
    sget-object v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->CANCELING:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    invoke-virtual {p1, v0}, Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;->setState(Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;)V

    .line 1407
    :goto_0
    return-void

    .line 1401
    :cond_0
    sget-object v0, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    sget-object v2, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "TransactionManager: updateOfferTransactionState() [clientTransactionId: %1$s] [new: %2$s]"

    new-array v4, v10, [Ljava/lang/Object;

    invoke-virtual {p1}, Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;->getClientTransactionId()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v8

    invoke-virtual {p2}, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->name()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v9

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 1406
    invoke-virtual {p0}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/comm/persistence/DBTransactions;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->updateManagedOfferTransaction(Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;)Z

    goto :goto_0
.end method

.method private updatePurchaseStateFromResponseState(Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/comm/Result;Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;)Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;
    .locals 10
    .param p1, "commContext"    # Lcom/getjar/sdk/comm/CommContext;
    .param p2, "result"    # Lcom/getjar/sdk/comm/Result;
    .param p3, "purchaseBucket"    # Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;
    .param p4, "failureDefault"    # Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;

    .prologue
    .line 1480
    move-object v1, p4

    .line 1484
    .local v1, "newState":Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;
    :try_start_0
    const-string v3, ""

    invoke-static {p2, v3}, Lcom/getjar/sdk/comm/TransactionManager;->getTransactionState(Lcom/getjar/sdk/comm/Result;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1485
    .local v2, "state":Ljava/lang/String;
    const-string v3, "SUCCESS"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 1486
    sget-object v1, Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;->DONE:Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1505
    .end local v2    # "state":Ljava/lang/String;
    :cond_0
    :goto_0
    invoke-static {p1, p3, v1}, Lcom/getjar/sdk/comm/TransactionManager;->updatePurchaseTransactionState(Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;)V

    .line 1507
    return-object v1

    .line 1487
    .restart local v2    # "state":Ljava/lang/String;
    :cond_1
    :try_start_1
    const-string v3, "FAIL"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 1488
    sget-object v1, Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;->DONE:Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;

    goto :goto_0

    .line 1489
    :cond_2
    const-string v3, "CANCELED"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 1490
    sget-object v1, Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;->DONE:Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;

    goto :goto_0

    .line 1492
    :cond_3
    const-string v3, "CREATED"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 1493
    sget-object v1, Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;->RESERVING:Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;

    goto :goto_0

    .line 1494
    :cond_4
    const-string v3, "RESERVED"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 1495
    sget-object v1, Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;->CONFIRMING:Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;

    goto :goto_0

    .line 1496
    :cond_5
    const-string v3, "CONFIRMED"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 1497
    sget-object v1, Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;->CONFIRMING:Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 1500
    .end local v2    # "state":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 1501
    .local v0, "e":Ljava/lang/Exception;
    sget-object v3, Lcom/getjar/sdk/logging/Area;->PURCHASE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    sget-object v5, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "updatePurchaseStateFromResponseState() failed, setting state to: %1$s"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    invoke-virtual {v1}, Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;->name()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method private static updatePurchaseTransactionState(Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;)V
    .locals 8
    .param p0, "commContext"    # Lcom/getjar/sdk/comm/CommContext;
    .param p1, "transaction"    # Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;
    .param p2, "newState"    # Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;

    .prologue
    .line 1365
    sget-object v0, Lcom/getjar/sdk/logging/Area;->PURCHASE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    sget-object v2, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "TransactionManager: updatePurchaseTransactionState() [clientTransactionId: %1$s] [old: %2$s] [new: %3$s] [thread: %4$d]"

    const/4 v4, 0x4

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-virtual {p1}, Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;->getClientTransactionId()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x1

    invoke-virtual {p1}, Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;->getState()Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;

    move-result-object v6

    invoke-virtual {v6}, Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;->name()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x2

    invoke-virtual {p2}, Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;->name()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x3

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Thread;->getId()J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 1372
    sget-object v0, Lcom/getjar/sdk/comm/TransactionManager;->_CanceledClientTransactionIDs:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {p1}, Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;->getClientTransactionId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;->CANCELING:Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;

    invoke-virtual {v0, p2}, Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1375
    sget-object v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;->CANCELING:Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;

    invoke-virtual {p1, v0}, Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;->setState(Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;)V

    .line 1379
    :goto_0
    return-void

    .line 1378
    :cond_0
    invoke-virtual {p0}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/comm/persistence/DBTransactions;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->updatePurchaseTransaction(Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;)Z

    goto :goto_0
.end method


# virtual methods
.method public buyCurrencyForGoogleTransactions(Lcom/getjar/sdk/comm/CommContext;)V
    .locals 2
    .param p1, "commContext"    # Lcom/getjar/sdk/comm/CommContext;

    .prologue
    .line 1621
    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "commContext cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1623
    :cond_0
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/getjar/sdk/comm/TransactionManager$9;

    invoke-direct {v1, p0, p1}, Lcom/getjar/sdk/comm/TransactionManager$9;-><init>(Lcom/getjar/sdk/comm/TransactionManager;Lcom/getjar/sdk/comm/CommContext;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 1731
    return-void
.end method

.method public cancelManagedOfferTransaction(Ljava/lang/String;Lcom/getjar/sdk/comm/CommContext;)V
    .locals 12
    .param p1, "clientTransactionId"    # Ljava/lang/String;
    .param p2, "commContext"    # Lcom/getjar/sdk/comm/CommContext;

    .prologue
    .line 425
    sget-object v4, Lcom/getjar/sdk/comm/TransactionManager;->_ManagedOfferTransactionStateLock:Ljava/lang/Object;

    monitor-enter v4

    .line 427
    :try_start_0
    sget-object v3, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    sget-object v3, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    or-long/2addr v5, v7

    sget-object v3, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    or-long/2addr v5, v7

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v7, "TransactionManager: cancelManagedPurchaseTransaction() [clientTransactionId: %1$s] [thread: %2$d]"

    const/4 v8, 0x2

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    aput-object p1, v8, v9

    const/4 v9, 0x1

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Thread;->getId()J

    move-result-wide v10

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-static {v3, v7, v8}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v5, v6, v3}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 433
    iget-object v3, p0, Lcom/getjar/sdk/comm/TransactionManager;->_applicationContext:Landroid/content/Context;

    invoke-static {v3}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/comm/persistence/DBTransactions;

    move-result-object v3

    invoke-virtual {v3, p1}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->loadTransaction(Ljava/lang/String;)Lcom/getjar/sdk/comm/persistence/TransactionBucket;

    move-result-object v2

    .line 434
    .local v2, "transaction":Lcom/getjar/sdk/comm/persistence/TransactionBucket;
    if-eqz v2, :cond_2

    sget-object v3, Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;->MANAGED_OFFER:Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;

    invoke-virtual {v2}, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->getType()Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;

    move-result-object v5

    invoke-virtual {v3, v5}, Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 435
    move-object v0, v2

    check-cast v0, Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;

    move-object v3, v0

    invoke-virtual {v3}, Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;->getState()Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    move-result-object v1

    .line 436
    .local v1, "state":Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;
    sget-object v3, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->CREATED:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    invoke-virtual {v3, v1}, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    sget-object v3, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->RESERVING:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    invoke-virtual {v3, v1}, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    sget-object v3, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->RESERVED:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    invoke-virtual {v3, v1}, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    sget-object v3, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->PURCHASING:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    invoke-virtual {v3, v1}, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 439
    :cond_0
    sget-object v3, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    sget-object v3, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    or-long/2addr v5, v7

    sget-object v3, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    or-long/2addr v5, v7

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v7, "TransactionManager: Transaction %1$s was found and is in the %2$s state, cancelling..."

    const/4 v8, 0x2

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    aput-object p1, v8, v9

    const/4 v9, 0x1

    invoke-virtual {v1}, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->name()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-static {v3, v7, v8}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v5, v6, v3}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 445
    sget-object v3, Lcom/getjar/sdk/comm/TransactionManager;->_CanceledClientTransactionIDs:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v3, p1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 446
    sget-object v3, Lcom/getjar/sdk/comm/TransactionManager;->_CanceledClientTransactionIDs:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v3, p1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->add(Ljava/lang/Object;)Z

    .line 449
    :cond_1
    sget-object v3, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    sget-object v3, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    or-long/2addr v5, v7

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v7, "TransactionManager: cancelManagedOfferTransaction() CANCELING [clientTransactionId: %1$s] [%2$s]"

    const/4 v8, 0x2

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    invoke-virtual {v2}, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->getClientTransactionId()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    const/4 v9, 0x1

    invoke-static {}, Lcom/getjar/sdk/logging/Logger;->getShortStack()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-static {v3, v7, v8}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v5, v6, v3}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 455
    iget-object v3, p0, Lcom/getjar/sdk/comm/TransactionManager;->_applicationContext:Landroid/content/Context;

    invoke-static {v3}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/comm/persistence/DBTransactions;

    move-result-object v3

    check-cast v2, Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;

    .end local v2    # "transaction":Lcom/getjar/sdk/comm/persistence/TransactionBucket;
    sget-object v5, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->CANCELING:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    invoke-virtual {v3, v2, v5}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->updateManagedOfferTransaction(Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;)Z

    .line 459
    const/4 v3, 0x0

    const/4 v5, 0x0

    invoke-direct {p0, p2, v3, v5}, Lcom/getjar/sdk/comm/TransactionManager;->runTransactions(Lcom/getjar/sdk/comm/CommContext;ZZ)Ljava/util/concurrent/Future;

    .line 463
    .end local v1    # "state":Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;
    :cond_2
    monitor-exit v4

    .line 464
    return-void

    .line 463
    :catchall_0
    move-exception v3

    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v3
.end method

.method public cancelPurchaseTransaction(Ljava/lang/String;Lcom/getjar/sdk/comm/CommContext;)V
    .locals 12
    .param p1, "clientTransactionId"    # Ljava/lang/String;
    .param p2, "commContext"    # Lcom/getjar/sdk/comm/CommContext;

    .prologue
    .line 382
    sget-object v4, Lcom/getjar/sdk/comm/TransactionManager;->_PurchaseTransactionStateLock:Ljava/lang/Object;

    monitor-enter v4

    .line 384
    :try_start_0
    sget-object v3, Lcom/getjar/sdk/logging/Area;->PURCHASE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    sget-object v3, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    or-long/2addr v5, v7

    sget-object v3, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    or-long/2addr v5, v7

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v7, "TransactionManager: cancelPurchaseTransaction() [clientTransactionId: %1$s] [thread: %2$d]"

    const/4 v8, 0x2

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    aput-object p1, v8, v9

    const/4 v9, 0x1

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Thread;->getId()J

    move-result-wide v10

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-static {v3, v7, v8}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v5, v6, v3}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 390
    iget-object v3, p0, Lcom/getjar/sdk/comm/TransactionManager;->_applicationContext:Landroid/content/Context;

    invoke-static {v3}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/comm/persistence/DBTransactions;

    move-result-object v3

    invoke-virtual {v3, p1}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->loadTransaction(Ljava/lang/String;)Lcom/getjar/sdk/comm/persistence/TransactionBucket;

    move-result-object v2

    .line 391
    .local v2, "transaction":Lcom/getjar/sdk/comm/persistence/TransactionBucket;
    if-eqz v2, :cond_2

    sget-object v3, Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;->PURCHASE:Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;

    invoke-virtual {v2}, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->getType()Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;

    move-result-object v5

    invoke-virtual {v3, v5}, Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 392
    move-object v0, v2

    check-cast v0, Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;

    move-object v3, v0

    invoke-virtual {v3}, Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;->getState()Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;

    move-result-object v1

    .line 393
    .local v1, "state":Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;
    sget-object v3, Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;->CREATED:Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;

    invoke-virtual {v3, v1}, Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    sget-object v3, Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;->RESERVING:Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;

    invoke-virtual {v3, v1}, Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    sget-object v3, Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;->CANCELING:Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;

    invoke-virtual {v3, v1}, Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 395
    :cond_0
    sget-object v3, Lcom/getjar/sdk/logging/Area;->PURCHASE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    sget-object v3, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    or-long/2addr v5, v7

    sget-object v3, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    or-long/2addr v5, v7

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v7, "TransactionManager: Transaction %1$s was found and is in the %2$s state, cancelling..."

    const/4 v8, 0x2

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    aput-object p1, v8, v9

    const/4 v9, 0x1

    invoke-virtual {v1}, Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;->name()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-static {v3, v7, v8}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v5, v6, v3}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 401
    sget-object v3, Lcom/getjar/sdk/comm/TransactionManager;->_CanceledClientTransactionIDs:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v3, p1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 402
    sget-object v3, Lcom/getjar/sdk/comm/TransactionManager;->_CanceledClientTransactionIDs:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v3, p1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->add(Ljava/lang/Object;)Z

    .line 406
    :cond_1
    iget-object v3, p0, Lcom/getjar/sdk/comm/TransactionManager;->_applicationContext:Landroid/content/Context;

    invoke-static {v3}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/comm/persistence/DBTransactions;

    move-result-object v3

    check-cast v2, Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;

    .end local v2    # "transaction":Lcom/getjar/sdk/comm/persistence/TransactionBucket;
    sget-object v5, Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;->CANCELING:Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;

    invoke-virtual {v3, v2, v5}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->updatePurchaseTransaction(Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;)Z

    .line 410
    const/4 v3, 0x0

    const/4 v5, 0x0

    invoke-direct {p0, p2, v3, v5}, Lcom/getjar/sdk/comm/TransactionManager;->runTransactions(Lcom/getjar/sdk/comm/CommContext;ZZ)Ljava/util/concurrent/Future;

    .line 414
    .end local v1    # "state":Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;
    :cond_2
    monitor-exit v4

    .line 415
    return-void

    .line 414
    :catchall_0
    move-exception v3

    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v3
.end method

.method public declared-synchronized recoverOrphanedTransactions(Lcom/getjar/sdk/comm/CommContext;)V
    .locals 26
    .param p1, "commContext"    # Lcom/getjar/sdk/comm/CommContext;

    .prologue
    .line 482
    monitor-enter p0

    :try_start_0
    sget-object v18, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v18 .. v18}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v18

    sget-object v20, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v21, "TransactionManager: recoverOrphanedTransactions() [thread: %1$d]"

    const/16 v22, 0x1

    move/from16 v0, v22

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v22, v0

    const/16 v23, 0x0

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/Thread;->getId()J

    move-result-wide v24

    invoke-static/range {v24 .. v25}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v24

    aput-object v24, v22, v23

    invoke-static/range {v20 .. v22}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v18 .. v20}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 486
    :try_start_1
    invoke-virtual/range {p0 .. p1}, Lcom/getjar/sdk/comm/TransactionManager;->buyCurrencyForGoogleTransactions(Lcom/getjar/sdk/comm/CommContext;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 493
    :goto_0
    const/4 v12, 0x0

    .line 494
    .local v12, "orphanedPurchaseCount":I
    const/16 v17, 0x0

    .line 495
    .local v17, "transactions":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/comm/persistence/TransactionBucket;>;"
    const/4 v5, 0x0

    .line 497
    .local v5, "cachingManager":Lcom/getjar/sdk/comm/LicenseCachingManager;
    :try_start_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getjar/sdk/comm/TransactionManager;->_applicationContext:Landroid/content/Context;

    move-object/from16 v18, v0

    invoke-static/range {v18 .. v18}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/comm/persistence/DBTransactions;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->loadAllTransactions()Ljava/util/List;

    move-result-object v17

    .line 498
    invoke-interface/range {v17 .. v17}, Ljava/util/List;->size()I

    move-result v13

    .line 499
    .local v13, "totalTransactionCount":I
    invoke-interface/range {v17 .. v17}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .local v8, "i$":Ljava/util/Iterator;
    move-object v6, v5

    .end local v5    # "cachingManager":Lcom/getjar/sdk/comm/LicenseCachingManager;
    .local v6, "cachingManager":Lcom/getjar/sdk/comm/LicenseCachingManager;
    :goto_1
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_4

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/getjar/sdk/comm/persistence/TransactionBucket;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 503
    .local v14, "transaction":Lcom/getjar/sdk/comm/persistence/TransactionBucket;
    :try_start_3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    .line 504
    .local v10, "now":J
    invoke-virtual {v14}, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->getTimestampLastUpdated()J

    move-result-wide v18

    sub-long v15, v10, v18

    .line 505
    .local v15, "transactionAge":J
    sget-object v18, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v18 .. v18}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v18

    sget-object v20, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v20 .. v20}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v20

    or-long v18, v18, v20

    sget-object v20, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v21, "TransactionManager: recoverOrphanedTransactions() Transaction found in persistence [now:%1$d - lastUpdate:%2$d = age:%3$d]"

    const/16 v22, 0x3

    move/from16 v0, v22

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v22, v0

    const/16 v23, 0x0

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v24

    aput-object v24, v22, v23

    const/16 v23, 0x1

    invoke-virtual {v14}, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->getTimestampLastUpdated()J

    move-result-wide v24

    invoke-static/range {v24 .. v25}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v24

    aput-object v24, v22, v23

    const/16 v23, 0x2

    invoke-static/range {v15 .. v16}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v24

    aput-object v24, v22, v23

    invoke-static/range {v20 .. v22}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v18 .. v20}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 510
    const-wide/32 v18, 0x493e0

    cmp-long v18, v15, v18

    if-lez v18, :cond_2

    .line 511
    add-int/lit8 v12, v12, 0x1

    .line 512
    sget-object v18, Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;->PURCHASE:Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;

    invoke-virtual {v14}, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->getType()Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_2

    .line 513
    sget-object v19, Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;->CREATED:Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;

    move-object v0, v14

    check-cast v0, Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;->getState()Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;

    move-result-object v18

    move-object/from16 v0, v19

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_1

    .line 516
    sget-object v18, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v18 .. v18}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v18

    sget-object v20, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v20 .. v20}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v20

    or-long v18, v18, v20

    sget-object v20, Lcom/getjar/sdk/logging/Area;->PURCHASE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v20 .. v20}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v20

    or-long v18, v18, v20

    sget-object v20, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v21, "TransactionManager: Orphaned purchase found in the CREATED state, deleting [clientTransactionId: %1$s]"

    const/16 v22, 0x1

    move/from16 v0, v22

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v22, v0

    const/16 v23, 0x0

    invoke-virtual {v14}, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->getClientTransactionId()Ljava/lang/String;

    move-result-object v24

    aput-object v24, v22, v23

    invoke-static/range {v20 .. v22}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v18 .. v20}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 519
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getjar/sdk/comm/TransactionManager;->_applicationContext:Landroid/content/Context;

    move-object/from16 v18, v0

    invoke-static/range {v18 .. v18}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/comm/persistence/DBTransactions;

    move-result-object v18

    invoke-virtual {v14}, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->getClientTransactionId()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->deleteTransaction(Ljava/lang/String;)Z

    .line 522
    const-class v18, Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;

    invoke-virtual {v14}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v18

    if-eqz v18, :cond_2

    .line 523
    move-object v0, v14

    check-cast v0, Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;

    move-object v4, v0

    .line 525
    .local v4, "bucket":Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;
    invoke-virtual {v4}, Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;->getRelatedObject()Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;

    move-result-object v18

    if-eqz v18, :cond_2

    invoke-virtual {v4}, Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;->getRelatedObject()Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;->getLicenseScope()Lcom/getjar/sdk/License$LicenseScope;

    move-result-object v18

    if-eqz v18, :cond_2

    .line 526
    if-nez v6, :cond_7

    .line 527
    new-instance v5, Lcom/getjar/sdk/comm/LicenseCachingManager;

    move-object/from16 v0, p1

    invoke-direct {v5, v0}, Lcom/getjar/sdk/comm/LicenseCachingManager;-><init>(Lcom/getjar/sdk/comm/CommContext;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 529
    .end local v6    # "cachingManager":Lcom/getjar/sdk/comm/LicenseCachingManager;
    .restart local v5    # "cachingManager":Lcom/getjar/sdk/comm/LicenseCachingManager;
    :goto_2
    :try_start_4
    invoke-virtual {v4}, Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;->getRelatedObject()Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;->getProductId()Ljava/lang/String;

    move-result-object v18

    invoke-virtual {v4}, Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;->getRelatedObject()Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;->getLicenseScope()Lcom/getjar/sdk/License$LicenseScope;

    move-result-object v19

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v5, v0, v1}, Lcom/getjar/sdk/comm/LicenseCachingManager;->getCachedLicense(Ljava/lang/String;Lcom/getjar/sdk/License$LicenseScope;)Lcom/getjar/sdk/data/LicenseInternal;

    move-result-object v9

    .line 533
    .local v9, "license":Lcom/getjar/sdk/data/LicenseInternal;
    if-eqz v9, :cond_0

    invoke-virtual {v9}, Lcom/getjar/sdk/data/LicenseInternal;->getInternalLicenseState()Lcom/getjar/sdk/data/LicenseInternal$InternalLicenseState;

    move-result-object v18

    sget-object v19, Lcom/getjar/sdk/data/LicenseInternal$InternalLicenseState;->UNSYNCED:Lcom/getjar/sdk/data/LicenseInternal$InternalLicenseState;

    invoke-virtual/range {v18 .. v19}, Lcom/getjar/sdk/data/LicenseInternal$InternalLicenseState;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_0

    .line 534
    sget-object v18, Lcom/getjar/sdk/logging/Area;->LICENSING:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v18 .. v18}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v18

    sget-object v20, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v20 .. v20}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v20

    or-long v18, v18, v20

    sget-object v20, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v20 .. v20}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v20

    or-long v18, v18, v20

    sget-object v20, Lcom/getjar/sdk/logging/Area;->PURCHASE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v20 .. v20}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v20

    or-long v18, v18, v20

    sget-object v20, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v21, "TransactionManager: Deleting UNSYNCED license for expired purchase transaction [clientTransactionId: %1$s]"

    const/16 v22, 0x1

    move/from16 v0, v22

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v22, v0

    const/16 v23, 0x0

    invoke-virtual {v14}, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->getClientTransactionId()Ljava/lang/String;

    move-result-object v24

    aput-object v24, v22, v23

    invoke-static/range {v20 .. v22}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v18 .. v20}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 537
    invoke-virtual {v5, v9}, Lcom/getjar/sdk/comm/LicenseCachingManager;->removeCachedLicense(Lcom/getjar/sdk/data/LicenseInternal;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .end local v4    # "bucket":Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;
    .end local v9    # "license":Lcom/getjar/sdk/data/LicenseInternal;
    .end local v10    # "now":J
    .end local v15    # "transactionAge":J
    :cond_0
    :goto_3
    move-object v6, v5

    .line 564
    .end local v5    # "cachingManager":Lcom/getjar/sdk/comm/LicenseCachingManager;
    .restart local v6    # "cachingManager":Lcom/getjar/sdk/comm/LicenseCachingManager;
    goto/16 :goto_1

    .line 487
    .end local v6    # "cachingManager":Lcom/getjar/sdk/comm/LicenseCachingManager;
    .end local v8    # "i$":Ljava/util/Iterator;
    .end local v12    # "orphanedPurchaseCount":I
    .end local v13    # "totalTransactionCount":I
    .end local v14    # "transaction":Lcom/getjar/sdk/comm/persistence/TransactionBucket;
    .end local v17    # "transactions":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/comm/persistence/TransactionBucket;>;"
    :catch_0
    move-exception v7

    .line 489
    .local v7, "e":Ljava/lang/Exception;
    :try_start_5
    sget-object v18, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v18 .. v18}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v18

    const-string v20, "TransactionManager: recoverOrphanedTransactions() buyCurrencyForGoogleTransactions() failed"

    move-wide/from16 v0, v18

    move-object/from16 v2, v20

    invoke-static {v0, v1, v2, v7}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto/16 :goto_0

    .line 482
    .end local v7    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v18

    monitor-exit p0

    throw v18

    .line 542
    .restart local v6    # "cachingManager":Lcom/getjar/sdk/comm/LicenseCachingManager;
    .restart local v8    # "i$":Ljava/util/Iterator;
    .restart local v10    # "now":J
    .restart local v12    # "orphanedPurchaseCount":I
    .restart local v13    # "totalTransactionCount":I
    .restart local v14    # "transaction":Lcom/getjar/sdk/comm/persistence/TransactionBucket;
    .restart local v15    # "transactionAge":J
    .restart local v17    # "transactions":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/comm/persistence/TransactionBucket;>;"
    :cond_1
    :try_start_6
    sget-object v19, Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;->RESERVING:Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;

    move-object v0, v14

    check-cast v0, Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;->getState()Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;

    move-result-object v18

    move-object/from16 v0, v19

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_2

    .line 545
    sget-object v18, Lcom/getjar/sdk/logging/Area;->LICENSING:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v18 .. v18}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v18

    sget-object v20, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v20 .. v20}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v20

    or-long v18, v18, v20

    sget-object v20, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v20 .. v20}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v20

    or-long v18, v18, v20

    sget-object v20, Lcom/getjar/sdk/logging/Area;->PURCHASE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v20 .. v20}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v20

    or-long v18, v18, v20

    sget-object v20, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v21, "TransactionManager: Orphaned purchase found in the RESERVING state, updating to CANCELING [clientTransactionId: %1$s]"

    const/16 v22, 0x1

    move/from16 v0, v22

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v22, v0

    const/16 v23, 0x0

    invoke-virtual {v14}, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->getClientTransactionId()Ljava/lang/String;

    move-result-object v24

    aput-object v24, v22, v23

    invoke-static/range {v20 .. v22}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v18 .. v20}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 546
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getjar/sdk/comm/TransactionManager;->_applicationContext:Landroid/content/Context;

    move-object/from16 v18, v0

    invoke-static/range {v18 .. v18}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/comm/persistence/DBTransactions;

    move-result-object v19

    move-object v0, v14

    check-cast v0, Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;

    move-object/from16 v18, v0

    sget-object v20, Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;->CANCELING:Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;

    move-object/from16 v0, v19

    move-object/from16 v1, v18

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->updatePurchaseTransaction(Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;)Z
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_1
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    :cond_2
    move-object v5, v6

    .end local v6    # "cachingManager":Lcom/getjar/sdk/comm/LicenseCachingManager;
    .restart local v5    # "cachingManager":Lcom/getjar/sdk/comm/LicenseCachingManager;
    goto/16 :goto_3

    .line 551
    .end local v5    # "cachingManager":Lcom/getjar/sdk/comm/LicenseCachingManager;
    .end local v10    # "now":J
    .end local v15    # "transactionAge":J
    .restart local v6    # "cachingManager":Lcom/getjar/sdk/comm/LicenseCachingManager;
    :catch_1
    move-exception v7

    move-object v5, v6

    .line 553
    .end local v6    # "cachingManager":Lcom/getjar/sdk/comm/LicenseCachingManager;
    .restart local v5    # "cachingManager":Lcom/getjar/sdk/comm/LicenseCachingManager;
    .restart local v7    # "e":Ljava/lang/Exception;
    :goto_4
    if-eqz v14, :cond_3

    .line 555
    :try_start_7
    sget-object v18, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v18 .. v18}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v18

    sget-object v20, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v20 .. v20}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v20

    or-long v18, v18, v20

    sget-object v20, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v21, "TransactionManager persistence cleanup failed for transaction %1$s [created:%2$d updated:%3$d]"

    const/16 v22, 0x3

    move/from16 v0, v22

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v22, v0

    const/16 v23, 0x0

    invoke-virtual {v14}, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->getClientTransactionId()Ljava/lang/String;

    move-result-object v24

    aput-object v24, v22, v23

    const/16 v23, 0x1

    invoke-virtual {v14}, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->getTimestampCreated()J

    move-result-wide v24

    invoke-static/range {v24 .. v25}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v24

    aput-object v24, v22, v23

    const/16 v23, 0x2

    invoke-virtual {v14}, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->getTimestampLastUpdated()J

    move-result-wide v24

    invoke-static/range {v24 .. v25}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v24

    aput-object v24, v22, v23

    invoke-static/range {v20 .. v22}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v20

    move-wide/from16 v0, v18

    move-object/from16 v2, v20

    invoke-static {v0, v1, v2, v7}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_2
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    goto/16 :goto_3

    .line 560
    :catch_2
    move-exception v18

    goto/16 :goto_3

    .line 562
    :cond_3
    :try_start_8
    sget-object v18, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v18 .. v18}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v18

    sget-object v20, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v20 .. v20}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v20

    or-long v18, v18, v20

    const-string v20, "TransactionManager persistence cleanup failed for a transaction"

    move-wide/from16 v0, v18

    move-object/from16 v2, v20

    invoke-static {v0, v1, v2, v7}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_3

    .line 566
    .end local v5    # "cachingManager":Lcom/getjar/sdk/comm/LicenseCachingManager;
    .end local v7    # "e":Ljava/lang/Exception;
    .end local v14    # "transaction":Lcom/getjar/sdk/comm/persistence/TransactionBucket;
    .restart local v6    # "cachingManager":Lcom/getjar/sdk/comm/LicenseCachingManager;
    :cond_4
    sget-object v18, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v18 .. v18}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v18

    sget-object v20, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual/range {v20 .. v20}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v20

    or-long v18, v18, v20

    sget-object v20, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v21, "TransactionManager: Found %1$d total transactions and %2$d orphaned purchase transactions"

    const/16 v22, 0x2

    move/from16 v0, v22

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v22, v0

    const/16 v23, 0x0

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v24

    aput-object v24, v22, v23

    const/16 v23, 0x1

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v24

    aput-object v24, v22, v23

    invoke-static/range {v20 .. v22}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v18 .. v20}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 572
    if-lez v12, :cond_6

    .line 575
    const/16 v18, 0x0

    const/16 v19, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, v18

    move/from16 v3, v19

    invoke-direct {v0, v1, v2, v3}, Lcom/getjar/sdk/comm/TransactionManager;->runTransactions(Lcom/getjar/sdk/comm/CommContext;ZZ)Ljava/util/concurrent/Future;
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 581
    :cond_5
    :goto_5
    monitor-exit p0

    return-void

    .line 576
    :cond_6
    if-lez v13, :cond_5

    .line 579
    const/16 v18, 0x1

    const/16 v19, 0x1

    :try_start_9
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, v18

    move/from16 v3, v19

    invoke-direct {v0, v1, v2, v3}, Lcom/getjar/sdk/comm/TransactionManager;->runTransactions(Lcom/getjar/sdk/comm/CommContext;ZZ)Ljava/util/concurrent/Future;
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    goto :goto_5

    .line 551
    .end local v6    # "cachingManager":Lcom/getjar/sdk/comm/LicenseCachingManager;
    .restart local v4    # "bucket":Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;
    .restart local v5    # "cachingManager":Lcom/getjar/sdk/comm/LicenseCachingManager;
    .restart local v10    # "now":J
    .restart local v14    # "transaction":Lcom/getjar/sdk/comm/persistence/TransactionBucket;
    .restart local v15    # "transactionAge":J
    :catch_3
    move-exception v7

    goto/16 :goto_4

    .end local v5    # "cachingManager":Lcom/getjar/sdk/comm/LicenseCachingManager;
    .restart local v6    # "cachingManager":Lcom/getjar/sdk/comm/LicenseCachingManager;
    :cond_7
    move-object v5, v6

    .end local v6    # "cachingManager":Lcom/getjar/sdk/comm/LicenseCachingManager;
    .restart local v5    # "cachingManager":Lcom/getjar/sdk/comm/LicenseCachingManager;
    goto/16 :goto_2
.end method

.method public runEarnAndManagedOfferTransactions(Lcom/getjar/sdk/comm/CommContext;)Ljava/util/List;
    .locals 4
    .param p1, "commContext"    # Lcom/getjar/sdk/comm/CommContext;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/getjar/sdk/comm/CommContext;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/getjar/sdk/comm/persistence/TransactionBucket;",
            ">;"
        }
    .end annotation

    .prologue
    .line 592
    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-direct {p0, p1, v2, v3}, Lcom/getjar/sdk/comm/TransactionManager;->runTransactions(Lcom/getjar/sdk/comm/CommContext;ZZ)Ljava/util/concurrent/Future;

    move-result-object v1

    .line 594
    .local v1, "future":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<Ljava/util/List<Lcom/getjar/sdk/comm/persistence/TransactionBucket;>;>;"
    :try_start_0
    invoke-interface {v1}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_1

    return-object v2

    .line 595
    :catch_0
    move-exception v0

    .line 596
    .local v0, "e":Ljava/lang/InterruptedException;
    new-instance v2, Lcom/getjar/sdk/exceptions/TransactionException;

    invoke-direct {v2, v0}, Lcom/getjar/sdk/exceptions/TransactionException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 597
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :catch_1
    move-exception v0

    .line 598
    .local v0, "e":Ljava/util/concurrent/ExecutionException;
    new-instance v2, Lcom/getjar/sdk/exceptions/TransactionException;

    invoke-direct {v2, v0}, Lcom/getjar/sdk/exceptions/TransactionException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method public runEarnTransaction(Ljava/lang/String;Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;Ljava/util/HashMap;)Ljava/util/concurrent/Future;
    .locals 15
    .param p1, "clientTransactionId"    # Ljava/lang/String;
    .param p2, "commContext"    # Lcom/getjar/sdk/comm/CommContext;
    .param p3, "itemId"    # Ljava/lang/String;
    .param p4, "packageName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/getjar/sdk/comm/CommContext;",
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
            ">;)",
            "Ljava/util/concurrent/Future",
            "<",
            "Lcom/getjar/sdk/comm/Operation;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 278
    .local p5, "itemMetadata":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .local p6, "trackingMetadata":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-static/range {p1 .. p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_0

    new-instance v7, Ljava/lang/IllegalArgumentException;

    const-string v8, "\'clientTransactionId\' can not be NULL or empty"

    invoke-direct {v7, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 279
    :cond_0
    if-nez p2, :cond_1

    new-instance v7, Ljava/lang/IllegalArgumentException;

    const-string v8, "\'commContext\' can not be NULL"

    invoke-direct {v7, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 280
    :cond_1
    invoke-static/range {p3 .. p3}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_2

    new-instance v7, Ljava/lang/IllegalArgumentException;

    const-string v8, "\'itemId\' can not be NULL or empty"

    invoke-direct {v7, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 281
    :cond_2
    invoke-static/range {p4 .. p4}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_3

    new-instance v7, Ljava/lang/IllegalArgumentException;

    const-string v8, "\'packageName\' can not be NULL or empty"

    invoke-direct {v7, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 282
    :cond_3
    if-eqz p5, :cond_4

    invoke-virtual/range {p5 .. p5}, Ljava/util/HashMap;->size()I

    move-result v7

    if-gtz v7, :cond_5

    :cond_4
    new-instance v7, Ljava/lang/IllegalArgumentException;

    const-string v8, "\'itemMetadata\' can not be NULL or empty"

    invoke-direct {v7, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 284
    :cond_5
    sget-object v7, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    sget-object v9, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v9}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v9

    or-long/2addr v7, v9

    sget-object v9, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v9}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v9

    or-long/2addr v7, v9

    sget-object v9, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v10, "TransactionManager: startEarnTransaction() [clientTransactionId: %1$s] [thread: %2$d]"

    const/4 v11, 0x2

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    aput-object p1, v11, v12

    const/4 v12, 0x1

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Thread;->getId()J

    move-result-wide v13

    invoke-static {v13, v14}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v13

    aput-object v13, v11, v12

    invoke-static {v9, v10, v11}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v7, v8, v9}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 290
    new-instance v4, Lcom/getjar/sdk/comm/persistence/RelatedEarnData;

    move-object/from16 v0, p3

    move-object/from16 v1, p4

    move-object/from16 v2, p5

    move-object/from16 v3, p6

    invoke-direct {v4, v0, v1, v2, v3}, Lcom/getjar/sdk/comm/persistence/RelatedEarnData;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;Ljava/util/HashMap;)V

    .line 293
    .local v4, "earn":Lcom/getjar/sdk/comm/persistence/RelatedEarnData;
    :try_start_0
    iget-object v7, p0, Lcom/getjar/sdk/comm/TransactionManager;->_applicationContext:Landroid/content/Context;

    invoke-static {v7}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/comm/persistence/DBTransactions;

    move-result-object v7

    move-object/from16 v0, p1

    invoke-virtual {v7, v0, v4}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->insertEarnTransaction(Ljava/lang/String;Ljava/io/Serializable;)Z
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 297
    :goto_0
    iget-object v7, p0, Lcom/getjar/sdk/comm/TransactionManager;->_applicationContext:Landroid/content/Context;

    invoke-static {v7}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/comm/persistence/DBTransactions;

    move-result-object v7

    move-object/from16 v0, p1

    invoke-virtual {v7, v0}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->loadTransaction(Ljava/lang/String;)Lcom/getjar/sdk/comm/persistence/TransactionBucket;

    move-result-object v6

    .line 300
    .local v6, "transaction":Lcom/getjar/sdk/comm/persistence/TransactionBucket;
    new-instance v5, Lcom/getjar/sdk/utilities/SetExceptionFutureTask;

    new-instance v7, Lcom/getjar/sdk/comm/TransactionManager$5;

    move-object/from16 v0, p2

    invoke-direct {v7, p0, v6, v0}, Lcom/getjar/sdk/comm/TransactionManager$5;-><init>(Lcom/getjar/sdk/comm/TransactionManager;Lcom/getjar/sdk/comm/persistence/TransactionBucket;Lcom/getjar/sdk/comm/CommContext;)V

    invoke-direct {v5, v7}, Lcom/getjar/sdk/utilities/SetExceptionFutureTask;-><init>(Ljava/util/concurrent/Callable;)V

    .line 314
    .local v5, "future":Lcom/getjar/sdk/utilities/SetExceptionFutureTask;, "Lcom/getjar/sdk/utilities/SetExceptionFutureTask<Lcom/getjar/sdk/comm/Operation;>;"
    sget-object v7, Lcom/getjar/sdk/comm/TransactionManager;->_ExecutorService:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v7, v5}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 317
    sget-object v7, Lcom/getjar/sdk/comm/TransactionManager;->_ExecutorService:Ljava/util/concurrent/ExecutorService;

    new-instance v8, Lcom/getjar/sdk/comm/TransactionManager$6;

    move-object/from16 v0, p2

    invoke-direct {v8, p0, v0}, Lcom/getjar/sdk/comm/TransactionManager$6;-><init>(Lcom/getjar/sdk/comm/TransactionManager;Lcom/getjar/sdk/comm/CommContext;)V

    invoke-interface {v7, v8}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    .line 331
    return-object v5

    .line 294
    .end local v5    # "future":Lcom/getjar/sdk/utilities/SetExceptionFutureTask;, "Lcom/getjar/sdk/utilities/SetExceptionFutureTask<Lcom/getjar/sdk/comm/Operation;>;"
    .end local v6    # "transaction":Lcom/getjar/sdk/comm/persistence/TransactionBucket;
    :catch_0
    move-exception v7

    goto :goto_0
.end method

.method public runManagedOfferTransaction(Ljava/lang/String;Lcom/getjar/sdk/comm/CommContext;)Ljava/util/concurrent/Future;
    .locals 9
    .param p1, "clientTransactionId"    # Ljava/lang/String;
    .param p2, "commContext"    # Lcom/getjar/sdk/comm/CommContext;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/getjar/sdk/comm/CommContext;",
            ")",
            "Ljava/util/concurrent/Future",
            "<",
            "Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;",
            ">;"
        }
    .end annotation

    .prologue
    .line 340
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\'clientTransactionId\' can not be NULL or empty"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 341
    :cond_0
    if-nez p2, :cond_1

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\'commContext\' can not be NULL"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 343
    :cond_1
    sget-object v1, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    sget-object v3, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "TransactionManager: runManagedOfferTransaction() [clientTransactionId: %1$s] [thread: %2$d]"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    const/4 v6, 0x1

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Thread;->getId()J

    move-result-wide v7

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 349
    new-instance v0, Lcom/getjar/sdk/utilities/SetExceptionFutureTask;

    new-instance v1, Lcom/getjar/sdk/comm/TransactionManager$7;

    invoke-direct {v1, p0, p1, p2}, Lcom/getjar/sdk/comm/TransactionManager$7;-><init>(Lcom/getjar/sdk/comm/TransactionManager;Ljava/lang/String;Lcom/getjar/sdk/comm/CommContext;)V

    invoke-direct {v0, v1}, Lcom/getjar/sdk/utilities/SetExceptionFutureTask;-><init>(Ljava/util/concurrent/Callable;)V

    .line 369
    .local v0, "future":Lcom/getjar/sdk/utilities/SetExceptionFutureTask;, "Lcom/getjar/sdk/utilities/SetExceptionFutureTask<Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;>;"
    sget-object v1, Lcom/getjar/sdk/comm/TransactionManager;->_ExecutorService:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v1, v0}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 371
    return-object v0
.end method

.method public startManagedOfferTransaction(Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;Ljava/util/HashMap;)Ljava/util/concurrent/Future;
    .locals 14
    .param p1, "commContext"    # Lcom/getjar/sdk/comm/CommContext;
    .param p2, "clientTransactionId"    # Ljava/lang/String;
    .param p3, "offerId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/getjar/sdk/comm/CommContext;",
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
            ">;)",
            "Ljava/util/concurrent/Future",
            "<",
            "Lcom/getjar/sdk/comm/Operation;",
            ">;"
        }
    .end annotation

    .prologue
    .line 201
    .local p4, "purchaseMetadata":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .local p5, "trackingMetadata":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v6

    invoke-static {v6}, Lcom/getjar/sdk/comm/auth/AuthManager;->initialize(Landroid/content/Context;)V

    .line 202
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v6

    invoke-virtual {p1}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/getjar/sdk/comm/auth/AuthManager;->getClaimsManager(Landroid/content/Context;)Lcom/getjar/sdk/comm/auth/ClaimsManager;

    move-result-object v6

    invoke-virtual {v6}, Lcom/getjar/sdk/comm/auth/ClaimsManager;->canPurchaseManagedProducts()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 205
    new-instance v5, Lcom/getjar/sdk/comm/persistence/RelatedManagedOfferData;

    move-object/from16 v0, p3

    move-object/from16 v1, p4

    move-object/from16 v2, p5

    invoke-direct {v5, v0, v1, v2}, Lcom/getjar/sdk/comm/persistence/RelatedManagedOfferData;-><init>(Ljava/lang/String;Ljava/util/HashMap;Ljava/util/HashMap;)V

    .line 207
    .local v5, "purchaseData":Lcom/getjar/sdk/comm/persistence/RelatedManagedOfferData;
    :try_start_0
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v6

    invoke-static {v6}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/comm/persistence/DBTransactions;

    move-result-object v6

    sget-object v7, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->CREATED:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    move-object/from16 v0, p2

    invoke-virtual {v6, v0, v5, v7}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->insertManagedOfferTransaction(Ljava/lang/String;Ljava/io/Serializable;Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;)Z
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 220
    :goto_0
    new-instance v4, Lcom/getjar/sdk/utilities/SetExceptionFutureTask;

    new-instance v6, Lcom/getjar/sdk/comm/TransactionManager$3;

    move-object/from16 v0, p2

    invoke-direct {v6, p0, v0, p1}, Lcom/getjar/sdk/comm/TransactionManager$3;-><init>(Lcom/getjar/sdk/comm/TransactionManager;Ljava/lang/String;Lcom/getjar/sdk/comm/CommContext;)V

    invoke-direct {v4, v6}, Lcom/getjar/sdk/utilities/SetExceptionFutureTask;-><init>(Ljava/util/concurrent/Callable;)V

    .line 233
    .local v4, "future":Lcom/getjar/sdk/utilities/SetExceptionFutureTask;, "Lcom/getjar/sdk/utilities/SetExceptionFutureTask<Lcom/getjar/sdk/comm/Operation;>;"
    sget-object v6, Lcom/getjar/sdk/comm/TransactionManager;->_ExecutorService:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v6, v4}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 236
    sget-object v6, Lcom/getjar/sdk/comm/TransactionManager;->_ExecutorService:Ljava/util/concurrent/ExecutorService;

    new-instance v7, Lcom/getjar/sdk/comm/TransactionManager$4;

    invoke-direct {v7, p0, p1}, Lcom/getjar/sdk/comm/TransactionManager$4;-><init>(Lcom/getjar/sdk/comm/TransactionManager;Lcom/getjar/sdk/comm/CommContext;)V

    invoke-interface {v6, v7}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    .line 250
    sget-object v6, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    sget-object v8, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v8}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v8

    or-long/2addr v6, v8

    sget-object v8, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v9, "TransactionManager: startManagedOfferTransaction() [clientTransactionId: %1$s] [thread: %2$d] finished"

    const/4 v10, 0x2

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    aput-object p2, v10, v11

    const/4 v11, 0x1

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/Thread;->getId()J

    move-result-wide v12

    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v12

    aput-object v12, v10, v11

    invoke-static {v8, v9, v10}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v6, v7, v8}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 254
    .end local v4    # "future":Lcom/getjar/sdk/utilities/SetExceptionFutureTask;, "Lcom/getjar/sdk/utilities/SetExceptionFutureTask<Lcom/getjar/sdk/comm/Operation;>;"
    .end local v5    # "purchaseData":Lcom/getjar/sdk/comm/persistence/RelatedManagedOfferData;
    :goto_1
    return-object v4

    .line 210
    .restart local v5    # "purchaseData":Lcom/getjar/sdk/comm/persistence/RelatedManagedOfferData;
    :catch_0
    move-exception v3

    .line 211
    .local v3, "e":Ljava/io/IOException;
    sget-object v6, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    sget-object v8, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v8}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v8

    or-long/2addr v6, v8

    const-string v8, "Error occured while creating transaction"

    invoke-static {v6, v7, v8, v3}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 212
    const/4 v4, 0x0

    goto :goto_1

    .line 215
    .end local v3    # "e":Ljava/io/IOException;
    .end local v5    # "purchaseData":Lcom/getjar/sdk/comm/persistence/RelatedManagedOfferData;
    :cond_0
    sget-object v6, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    sget-object v8, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v8}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v8

    or-long/2addr v6, v8

    const-string v8, "TransactionManager startManagedOfferTransaction: Does not have valid claim(s) to purchase managed offer"

    invoke-static {v6, v7, v8}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;)V

    .line 216
    const/4 v4, 0x0

    goto :goto_1

    .line 208
    .restart local v5    # "purchaseData":Lcom/getjar/sdk/comm/persistence/RelatedManagedOfferData;
    :catch_1
    move-exception v6

    goto :goto_0
.end method

.method public startPurchaseTransaction(Ljava/lang/String;Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;Lcom/getjar/sdk/License$LicenseScope;Ljava/util/HashMap;)Ljava/util/concurrent/Future;
    .locals 12
    .param p1, "clientTransactionId"    # Ljava/lang/String;
    .param p2, "commContext"    # Lcom/getjar/sdk/comm/CommContext;
    .param p3, "productId"    # Ljava/lang/String;
    .param p4, "productName"    # Ljava/lang/String;
    .param p5, "productDescription"    # Ljava/lang/String;
    .param p6, "amount"    # Ljava/lang/Integer;
    .param p7, "developerPayload"    # Ljava/lang/String;
    .param p8, "licenseScope"    # Lcom/getjar/sdk/License$LicenseScope;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/getjar/sdk/comm/CommContext;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            "Lcom/getjar/sdk/License$LicenseScope;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/concurrent/Future",
            "<",
            "Lcom/getjar/sdk/comm/Operation;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 122
    .local p9, "trackingMetadata":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\'clientTransactionId\' can not be NULL or empty"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 123
    :cond_0
    if-nez p2, :cond_1

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\'commContext\' can not be NULL"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 124
    :cond_1
    invoke-static {p3}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\'productId\' can not be NULL or empty"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 125
    :cond_2
    invoke-static/range {p4 .. p4}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\'productName\' can not be NULL or empty"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 126
    :cond_3
    if-eqz p6, :cond_4

    invoke-virtual/range {p6 .. p6}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-gez v1, :cond_5

    :cond_4
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\'amount\' can not be NULL or less than 0"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 128
    :cond_5
    sget-object v1, Lcom/getjar/sdk/logging/Area;->PURCHASE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    sget-object v3, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "TransactionManager: startPurchaseTransaction() [clientTransactionId: %1$s] [thread: %2$d]"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    const/4 v6, 0x1

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Thread;->getId()J

    move-result-wide v10

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 134
    new-instance v0, Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;

    invoke-virtual/range {p6 .. p6}, Ljava/lang/Integer;->intValue()I

    move-result v4

    move-object v1, p3

    move-object/from16 v2, p4

    move-object/from16 v3, p5

    move-object/from16 v5, p7

    move-object/from16 v6, p8

    move-object/from16 v7, p9

    invoke-direct/range {v0 .. v7}, Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Lcom/getjar/sdk/License$LicenseScope;Ljava/util/HashMap;)V

    .line 137
    .local v0, "purchase":Lcom/getjar/sdk/comm/persistence/RelatedPurchaseData;
    :try_start_0
    iget-object v1, p0, Lcom/getjar/sdk/comm/TransactionManager;->_applicationContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/comm/persistence/DBTransactions;

    move-result-object v1

    invoke-virtual {v1, p1, v0}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->insertPurchaseTransaction(Ljava/lang/String;Ljava/io/Serializable;)Z
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 141
    :goto_0
    iget-object v1, p0, Lcom/getjar/sdk/comm/TransactionManager;->_applicationContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/comm/persistence/DBTransactions;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->loadTransaction(Ljava/lang/String;)Lcom/getjar/sdk/comm/persistence/TransactionBucket;

    move-result-object v9

    .line 144
    .local v9, "transaction":Lcom/getjar/sdk/comm/persistence/TransactionBucket;
    new-instance v8, Lcom/getjar/sdk/utilities/SetExceptionFutureTask;

    new-instance v1, Lcom/getjar/sdk/comm/TransactionManager$1;

    invoke-direct {v1, p0, v9, p2}, Lcom/getjar/sdk/comm/TransactionManager$1;-><init>(Lcom/getjar/sdk/comm/TransactionManager;Lcom/getjar/sdk/comm/persistence/TransactionBucket;Lcom/getjar/sdk/comm/CommContext;)V

    invoke-direct {v8, v1}, Lcom/getjar/sdk/utilities/SetExceptionFutureTask;-><init>(Ljava/util/concurrent/Callable;)V

    .line 157
    .local v8, "future":Lcom/getjar/sdk/utilities/SetExceptionFutureTask;, "Lcom/getjar/sdk/utilities/SetExceptionFutureTask<Lcom/getjar/sdk/comm/Operation;>;"
    sget-object v1, Lcom/getjar/sdk/comm/TransactionManager;->_ExecutorService:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v1, v8}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 160
    sget-object v1, Lcom/getjar/sdk/comm/TransactionManager;->_ExecutorService:Ljava/util/concurrent/ExecutorService;

    new-instance v2, Lcom/getjar/sdk/comm/TransactionManager$2;

    invoke-direct {v2, p0, p2}, Lcom/getjar/sdk/comm/TransactionManager$2;-><init>(Lcom/getjar/sdk/comm/TransactionManager;Lcom/getjar/sdk/comm/CommContext;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    .line 174
    sget-object v1, Lcom/getjar/sdk/logging/Area;->PURCHASE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "TransactionManager: startPurchaseTransaction() [clientTransactionId: %1$s] [thread: %2$d] finished"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    const/4 v6, 0x1

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Thread;->getId()J

    move-result-wide v10

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 178
    return-object v8

    .line 138
    .end local v8    # "future":Lcom/getjar/sdk/utilities/SetExceptionFutureTask;, "Lcom/getjar/sdk/utilities/SetExceptionFutureTask<Lcom/getjar/sdk/comm/Operation;>;"
    .end local v9    # "transaction":Lcom/getjar/sdk/comm/persistence/TransactionBucket;
    :catch_0
    move-exception v1

    goto :goto_0
.end method
