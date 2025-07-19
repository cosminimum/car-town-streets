.class Lcom/getjar/sdk/comm/TransactionManager$7;
.super Ljava/lang/Object;
.source "TransactionManager.java"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/getjar/sdk/comm/TransactionManager;->runManagedOfferTransaction(Ljava/lang/String;Lcom/getjar/sdk/comm/CommContext;)Ljava/util/concurrent/Future;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable",
        "<",
        "Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/getjar/sdk/comm/TransactionManager;

.field final synthetic val$clientTransactionId:Ljava/lang/String;

.field final synthetic val$commContext:Lcom/getjar/sdk/comm/CommContext;


# direct methods
.method constructor <init>(Lcom/getjar/sdk/comm/TransactionManager;Ljava/lang/String;Lcom/getjar/sdk/comm/CommContext;)V
    .locals 0

    .prologue
    .line 350
    iput-object p1, p0, Lcom/getjar/sdk/comm/TransactionManager$7;->this$0:Lcom/getjar/sdk/comm/TransactionManager;

    iput-object p2, p0, Lcom/getjar/sdk/comm/TransactionManager$7;->val$clientTransactionId:Ljava/lang/String;

    iput-object p3, p0, Lcom/getjar/sdk/comm/TransactionManager$7;->val$commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call()Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 354
    :try_start_0
    iget-object v3, p0, Lcom/getjar/sdk/comm/TransactionManager$7;->this$0:Lcom/getjar/sdk/comm/TransactionManager;

    iget-object v4, p0, Lcom/getjar/sdk/comm/TransactionManager$7;->val$clientTransactionId:Ljava/lang/String;

    iget-object v5, p0, Lcom/getjar/sdk/comm/TransactionManager$7;->val$commContext:Lcom/getjar/sdk/comm/CommContext;

    const/4 v6, 0x0

    invoke-static {v3, v4, v5, v6}, Lcom/getjar/sdk/comm/TransactionManager;->access$200(Lcom/getjar/sdk/comm/TransactionManager;Ljava/lang/String;Lcom/getjar/sdk/comm/CommContext;Z)Lcom/getjar/sdk/comm/Operation;

    .line 355
    iget-object v3, p0, Lcom/getjar/sdk/comm/TransactionManager$7;->this$0:Lcom/getjar/sdk/comm/TransactionManager;

    invoke-static {v3}, Lcom/getjar/sdk/comm/TransactionManager;->access$400(Lcom/getjar/sdk/comm/TransactionManager;)Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/comm/persistence/DBTransactions;

    move-result-object v3

    iget-object v4, p0, Lcom/getjar/sdk/comm/TransactionManager$7;->val$clientTransactionId:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/getjar/sdk/comm/persistence/DBTransactions;->loadTransaction(Ljava/lang/String;)Lcom/getjar/sdk/comm/persistence/TransactionBucket;

    move-result-object v1

    .line 356
    .local v1, "transaction":Lcom/getjar/sdk/comm/persistence/TransactionBucket;
    if-eqz v1, :cond_0

    .line 357
    check-cast v1, Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;

    .end local v1    # "transaction":Lcom/getjar/sdk/comm/persistence/TransactionBucket;
    invoke-virtual {v1}, Lcom/getjar/sdk/comm/persistence/ManagedOfferBucket;->getState()Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 364
    :cond_0
    :goto_0
    return-object v2

    .line 362
    :catch_0
    move-exception v0

    .line 363
    .local v0, "e":Ljava/lang/Exception;
    sget-object v3, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    const-string v5, "TransactionManager: runManagedOfferTransaction() failed"

    invoke-static {v3, v4, v5, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public bridge synthetic call()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 350
    invoke-virtual {p0}, Lcom/getjar/sdk/comm/TransactionManager$7;->call()Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    move-result-object v0

    return-object v0
.end method
