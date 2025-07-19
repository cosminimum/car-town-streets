.class public Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ProductWithClientTransactionID;
.super Ljava/lang/Object;
.source "GetJarWebViewSubActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "ProductWithClientTransactionID"
.end annotation


# instance fields
.field private _clientTransactionId:Ljava/lang/String;

.field private final _product:Lcom/getjar/sdk/Product;

.field final synthetic this$0:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;


# direct methods
.method protected constructor <init>(Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;Lcom/getjar/sdk/Product;)V
    .locals 8
    .param p2, "product"    # Lcom/getjar/sdk/Product;

    .prologue
    .line 1434
    iput-object p1, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ProductWithClientTransactionID;->this$0:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1426
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ProductWithClientTransactionID;->_clientTransactionId:Ljava/lang/String;

    .line 1435
    if-nez p2, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "product cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1437
    :cond_0
    iput-object p2, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ProductWithClientTransactionID;->_product:Lcom/getjar/sdk/Product;

    .line 1438
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ProductWithClientTransactionID;->_clientTransactionId:Ljava/lang/String;

    .line 1439
    sget-object v0, Lcom/getjar/sdk/logging/Area;->PURCHASE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "Generated a new client transaction ID: \'%1$s\' [thread:%2$d]"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    iget-object v6, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ProductWithClientTransactionID;->_clientTransactionId:Ljava/lang/String;

    aput-object v6, v4, v5

    const/4 v5, 0x1

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

    .line 1443
    return-void
.end method


# virtual methods
.method public getClientTransactionId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1431
    iget-object v0, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ProductWithClientTransactionID;->_clientTransactionId:Ljava/lang/String;

    return-object v0
.end method

.method public getProduct()Lcom/getjar/sdk/Product;
    .locals 1

    .prologue
    .line 1429
    iget-object v0, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ProductWithClientTransactionID;->_product:Lcom/getjar/sdk/Product;

    return-object v0
.end method
