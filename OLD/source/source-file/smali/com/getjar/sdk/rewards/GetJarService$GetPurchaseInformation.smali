.class Lcom/getjar/sdk/rewards/GetJarService$GetPurchaseInformation;
.super Lcom/getjar/sdk/rewards/GetJarService$BillingRequest;
.source "GetJarService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getjar/sdk/rewards/GetJarService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "GetPurchaseInformation"
.end annotation


# instance fields
.field mNonce:J

.field final mNotifyIds:[Ljava/lang/String;

.field final synthetic this$0:Lcom/getjar/sdk/rewards/GetJarService;


# direct methods
.method public constructor <init>(Lcom/getjar/sdk/rewards/GetJarService;I[Ljava/lang/String;)V
    .locals 0
    .param p2, "startId"    # I
    .param p3, "notifyIds"    # [Ljava/lang/String;

    .prologue
    .line 378
    iput-object p1, p0, Lcom/getjar/sdk/rewards/GetJarService$GetPurchaseInformation;->this$0:Lcom/getjar/sdk/rewards/GetJarService;

    .line 379
    invoke-direct {p0, p1, p2}, Lcom/getjar/sdk/rewards/GetJarService$BillingRequest;-><init>(Lcom/getjar/sdk/rewards/GetJarService;I)V

    .line 380
    iput-object p3, p0, Lcom/getjar/sdk/rewards/GetJarService$GetPurchaseInformation;->mNotifyIds:[Ljava/lang/String;

    .line 381
    return-void
.end method


# virtual methods
.method protected onRemoteException(Landroid/os/RemoteException;)V
    .locals 0
    .param p1, "e"    # Landroid/os/RemoteException;

    .prologue
    .line 403
    invoke-super {p0, p1}, Lcom/getjar/sdk/rewards/GetJarService$BillingRequest;->onRemoteException(Landroid/os/RemoteException;)V

    .line 404
    return-void
.end method

.method protected run()J
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 385
    invoke-static {}, Lcom/getjar/sdk/utilities/Security;->generateNonce()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/getjar/sdk/rewards/GetJarService$GetPurchaseInformation;->mNonce:J

    .line 387
    const-string v2, "GET_PURCHASE_INFORMATION"

    invoke-virtual {p0, v2}, Lcom/getjar/sdk/rewards/GetJarService$GetPurchaseInformation;->makeRequestBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    .line 388
    .local v0, "request":Landroid/os/Bundle;
    const-string v2, "NONCE"

    iget-wide v3, p0, Lcom/getjar/sdk/rewards/GetJarService$GetPurchaseInformation;->mNonce:J

    invoke-virtual {v0, v2, v3, v4}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 389
    const-string v2, "NOTIFY_IDS"

    iget-object v3, p0, Lcom/getjar/sdk/rewards/GetJarService$GetPurchaseInformation;->mNotifyIds:[Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putStringArray(Ljava/lang/String;[Ljava/lang/String;)V

    .line 391
    :try_start_0
    invoke-static {}, Lcom/getjar/sdk/rewards/GetJarService;->access$200()Lcom/getjar/sdk/vending/billing/IMarketBillingService;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 393
    invoke-static {}, Lcom/getjar/sdk/rewards/GetJarService;->access$200()Lcom/getjar/sdk/vending/billing/IMarketBillingService;

    move-result-object v2

    invoke-interface {v2, v0}, Lcom/getjar/sdk/vending/billing/IMarketBillingService;->sendBillingRequest(Landroid/os/Bundle;)Landroid/os/Bundle;

    move-result-object v1

    .line 394
    .local v1, "response":Landroid/os/Bundle;
    const-string v2, "REQUEST_ID"

    sget-wide v3, Lcom/getjar/sdk/utilities/Constants;->BILLING_RESPONSE_INVALID_REQUEST_ID:J

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Bundle;->getLong(Ljava/lang/String;J)J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v2

    .line 398
    .end local v1    # "response":Landroid/os/Bundle;
    :goto_0
    return-wide v2

    .line 397
    :catch_0
    move-exception v2

    .line 398
    :cond_0
    sget-wide v2, Lcom/getjar/sdk/utilities/Constants;->BILLING_RESPONSE_INVALID_REQUEST_ID:J

    goto :goto_0
.end method
