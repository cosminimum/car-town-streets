.class Lcom/getjar/sdk/comm/TransactionManager$1;
.super Ljava/lang/Object;
.source "TransactionManager.java"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/getjar/sdk/comm/TransactionManager;->startPurchaseTransaction(Ljava/lang/String;Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;Lcom/getjar/sdk/License$LicenseScope;Ljava/util/HashMap;)Ljava/util/concurrent/Future;
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
    .line 145
    iput-object p1, p0, Lcom/getjar/sdk/comm/TransactionManager$1;->this$0:Lcom/getjar/sdk/comm/TransactionManager;

    iput-object p2, p0, Lcom/getjar/sdk/comm/TransactionManager$1;->val$transaction:Lcom/getjar/sdk/comm/persistence/TransactionBucket;

    iput-object p3, p0, Lcom/getjar/sdk/comm/TransactionManager$1;->val$commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call()Lcom/getjar/sdk/comm/Operation;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 149
    :try_start_0
    iget-object v2, p0, Lcom/getjar/sdk/comm/TransactionManager$1;->this$0:Lcom/getjar/sdk/comm/TransactionManager;

    iget-object v1, p0, Lcom/getjar/sdk/comm/TransactionManager$1;->val$transaction:Lcom/getjar/sdk/comm/persistence/TransactionBucket;

    check-cast v1, Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;

    iget-object v3, p0, Lcom/getjar/sdk/comm/TransactionManager$1;->val$commContext:Lcom/getjar/sdk/comm/CommContext;

    const/4 v4, 0x0

    invoke-static {v2, v1, v3, v4}, Lcom/getjar/sdk/comm/TransactionManager;->access$000(Lcom/getjar/sdk/comm/TransactionManager;Lcom/getjar/sdk/comm/persistence/PurchaseUnmanagedBucket;Lcom/getjar/sdk/comm/CommContext;Z)Lcom/getjar/sdk/comm/Operation;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 152
    :goto_0
    return-object v1

    .line 150
    :catch_0
    move-exception v0

    .line 151
    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Lcom/getjar/sdk/logging/Area;->PURCHASE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "TransactionManager: runPurchaseTransaction() failed"

    invoke-static {v1, v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 152
    const/4 v1, 0x0

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
    .line 145
    invoke-virtual {p0}, Lcom/getjar/sdk/comm/TransactionManager$1;->call()Lcom/getjar/sdk/comm/Operation;

    move-result-object v0

    return-object v0
.end method
