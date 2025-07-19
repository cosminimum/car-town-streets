.class Lcom/getjar/sdk/comm/TransactionManager$8;
.super Ljava/lang/Object;
.source "TransactionManager.java"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/getjar/sdk/comm/TransactionManager;->runTransactions(Lcom/getjar/sdk/comm/CommContext;ZZ)Ljava/util/concurrent/Future;
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
        "Ljava/util/List",
        "<",
        "Lcom/getjar/sdk/comm/persistence/TransactionBucket;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/getjar/sdk/comm/TransactionManager;

.field final synthetic val$commContext:Lcom/getjar/sdk/comm/CommContext;

.field final synthetic val$earnAndManagedPurchaseOnly:Z

.field final synthetic val$suppressInternalCallbacks:Z


# direct methods
.method constructor <init>(Lcom/getjar/sdk/comm/TransactionManager;Lcom/getjar/sdk/comm/CommContext;ZZ)V
    .locals 0

    .prologue
    .line 670
    iput-object p1, p0, Lcom/getjar/sdk/comm/TransactionManager$8;->this$0:Lcom/getjar/sdk/comm/TransactionManager;

    iput-object p2, p0, Lcom/getjar/sdk/comm/TransactionManager$8;->val$commContext:Lcom/getjar/sdk/comm/CommContext;

    iput-boolean p3, p0, Lcom/getjar/sdk/comm/TransactionManager$8;->val$earnAndManagedPurchaseOnly:Z

    iput-boolean p4, p0, Lcom/getjar/sdk/comm/TransactionManager$8;->val$suppressInternalCallbacks:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic call()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 670
    invoke-virtual {p0}, Lcom/getjar/sdk/comm/TransactionManager$8;->call()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public call()Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/getjar/sdk/comm/persistence/TransactionBucket;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 674
    :try_start_0
    iget-object v1, p0, Lcom/getjar/sdk/comm/TransactionManager$8;->this$0:Lcom/getjar/sdk/comm/TransactionManager;

    iget-object v2, p0, Lcom/getjar/sdk/comm/TransactionManager$8;->val$commContext:Lcom/getjar/sdk/comm/CommContext;

    iget-boolean v3, p0, Lcom/getjar/sdk/comm/TransactionManager$8;->val$earnAndManagedPurchaseOnly:Z

    iget-boolean v4, p0, Lcom/getjar/sdk/comm/TransactionManager$8;->val$suppressInternalCallbacks:Z

    invoke-static {v1, v2, v3, v4}, Lcom/getjar/sdk/comm/TransactionManager;->access$500(Lcom/getjar/sdk/comm/TransactionManager;Lcom/getjar/sdk/comm/CommContext;ZZ)Ljava/util/List;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 677
    :goto_0
    return-object v1

    .line 675
    :catch_0
    move-exception v0

    .line 676
    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    const-string v3, "TransactionManager: Worker Thread failed"

    invoke-static {v1, v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 677
    const/4 v1, 0x0

    goto :goto_0
.end method
