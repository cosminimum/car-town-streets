.class Lcom/getjar/sdk/comm/TransactionManager$2;
.super Ljava/lang/Object;
.source "TransactionManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/getjar/sdk/comm/TransactionManager;->startPurchaseTransaction(Ljava/lang/String;Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;Lcom/getjar/sdk/License$LicenseScope;Ljava/util/HashMap;)Ljava/util/concurrent/Future;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/getjar/sdk/comm/TransactionManager;

.field final synthetic val$commContext:Lcom/getjar/sdk/comm/CommContext;


# direct methods
.method constructor <init>(Lcom/getjar/sdk/comm/TransactionManager;Lcom/getjar/sdk/comm/CommContext;)V
    .locals 0

    .prologue
    .line 161
    iput-object p1, p0, Lcom/getjar/sdk/comm/TransactionManager$2;->this$0:Lcom/getjar/sdk/comm/TransactionManager;

    iput-object p2, p0, Lcom/getjar/sdk/comm/TransactionManager$2;->val$commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 165
    :try_start_0
    iget-object v1, p0, Lcom/getjar/sdk/comm/TransactionManager$2;->this$0:Lcom/getjar/sdk/comm/TransactionManager;

    iget-object v2, p0, Lcom/getjar/sdk/comm/TransactionManager$2;->val$commContext:Lcom/getjar/sdk/comm/CommContext;

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-static {v1, v2, v3, v4}, Lcom/getjar/sdk/comm/TransactionManager;->access$100(Lcom/getjar/sdk/comm/TransactionManager;Lcom/getjar/sdk/comm/CommContext;ZZ)Ljava/util/concurrent/Future;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 169
    :goto_0
    return-void

    .line 166
    :catch_0
    move-exception v0

    .line 167
    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Lcom/getjar/sdk/logging/Area;->PURCHASE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "TransactionManager: runTransactions() failed"

    invoke-static {v1, v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
