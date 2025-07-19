.class Lcom/getjar/sdk/comm/TransactionManager$5;
.super Ljava/lang/Object;
.source "TransactionManager.java"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/getjar/sdk/comm/TransactionManager;->runEarnTransaction(Ljava/lang/String;Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;Ljava/util/HashMap;)Ljava/util/concurrent/Future;
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
        "Lcom/getjar/sdk/comm/Operation;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/getjar/sdk/comm/TransactionManager;

.field final synthetic val$commContext:Lcom/getjar/sdk/comm/CommContext;

.field final synthetic val$transaction:Lcom/getjar/sdk/comm/persistence/TransactionBucket;


# direct methods
.method constructor <init>(Lcom/getjar/sdk/comm/TransactionManager;Lcom/getjar/sdk/comm/persistence/TransactionBucket;Lcom/getjar/sdk/comm/CommContext;)V
    .locals 0

    .prologue
    .line 301
    iput-object p1, p0, Lcom/getjar/sdk/comm/TransactionManager$5;->this$0:Lcom/getjar/sdk/comm/TransactionManager;

    iput-object p2, p0, Lcom/getjar/sdk/comm/TransactionManager$5;->val$transaction:Lcom/getjar/sdk/comm/persistence/TransactionBucket;

    iput-object p3, p0, Lcom/getjar/sdk/comm/TransactionManager$5;->val$commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call()Lcom/getjar/sdk/comm/Operation;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 305
    :try_start_0
    new-instance v0, Lcom/getjar/sdk/comm/TransactionManager$EarnCallback;

    iget-object v4, p0, Lcom/getjar/sdk/comm/TransactionManager$5;->this$0:Lcom/getjar/sdk/comm/TransactionManager;

    iget-object v2, p0, Lcom/getjar/sdk/comm/TransactionManager$5;->val$transaction:Lcom/getjar/sdk/comm/persistence/TransactionBucket;

    check-cast v2, Lcom/getjar/sdk/comm/persistence/EarnBucket;

    iget-object v3, p0, Lcom/getjar/sdk/comm/TransactionManager$5;->val$transaction:Lcom/getjar/sdk/comm/persistence/TransactionBucket;

    invoke-virtual {v3}, Lcom/getjar/sdk/comm/persistence/TransactionBucket;->getRelatedObject()Ljava/io/Serializable;

    move-result-object v3

    check-cast v3, Lcom/getjar/sdk/comm/persistence/RelatedEarnData;

    invoke-direct {v0, v4, v2, v3}, Lcom/getjar/sdk/comm/TransactionManager$EarnCallback;-><init>(Lcom/getjar/sdk/comm/TransactionManager;Lcom/getjar/sdk/comm/persistence/EarnBucket;Lcom/getjar/sdk/comm/persistence/RelatedEarnData;)V

    .line 306
    .local v0, "callback":Lcom/getjar/sdk/comm/CallbackInterface;
    iget-object v3, p0, Lcom/getjar/sdk/comm/TransactionManager$5;->this$0:Lcom/getjar/sdk/comm/TransactionManager;

    iget-object v2, p0, Lcom/getjar/sdk/comm/TransactionManager$5;->val$transaction:Lcom/getjar/sdk/comm/persistence/TransactionBucket;

    check-cast v2, Lcom/getjar/sdk/comm/persistence/EarnBucket;

    iget-object v4, p0, Lcom/getjar/sdk/comm/TransactionManager$5;->val$commContext:Lcom/getjar/sdk/comm/CommContext;

    const/4 v5, 0x0

    invoke-static {v3, v2, v4, v0, v5}, Lcom/getjar/sdk/comm/TransactionManager;->access$300(Lcom/getjar/sdk/comm/TransactionManager;Lcom/getjar/sdk/comm/persistence/EarnBucket;Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/comm/CallbackInterface;Z)Lcom/getjar/sdk/comm/Operation;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 309
    .end local v0    # "callback":Lcom/getjar/sdk/comm/CallbackInterface;
    :goto_0
    return-object v2

    .line 307
    :catch_0
    move-exception v1

    .line 308
    .local v1, "e":Ljava/lang/Exception;
    sget-object v2, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    const-string v4, "TransactionManager: runEarnTransactions() failed"

    invoke-static {v2, v3, v4, v1}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 309
    const/4 v2, 0x0

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
    .line 301
    invoke-virtual {p0}, Lcom/getjar/sdk/comm/TransactionManager$5;->call()Lcom/getjar/sdk/comm/Operation;

    move-result-object v0

    return-object v0
.end method
