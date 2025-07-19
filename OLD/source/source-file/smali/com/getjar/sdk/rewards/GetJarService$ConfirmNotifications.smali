.class Lcom/getjar/sdk/rewards/GetJarService$ConfirmNotifications;
.super Lcom/getjar/sdk/rewards/GetJarService$BillingRequest;
.source "GetJarService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getjar/sdk/rewards/GetJarService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ConfirmNotifications"
.end annotation


# instance fields
.field final mNotifyIds:[Ljava/lang/String;

.field final synthetic this$0:Lcom/getjar/sdk/rewards/GetJarService;


# direct methods
.method public constructor <init>(Lcom/getjar/sdk/rewards/GetJarService;I[Ljava/lang/String;)V
    .locals 0
    .param p2, "startId"    # I
    .param p3, "notifyIds"    # [Ljava/lang/String;

    .prologue
    .line 351
    iput-object p1, p0, Lcom/getjar/sdk/rewards/GetJarService$ConfirmNotifications;->this$0:Lcom/getjar/sdk/rewards/GetJarService;

    .line 352
    invoke-direct {p0, p1, p2}, Lcom/getjar/sdk/rewards/GetJarService$BillingRequest;-><init>(Lcom/getjar/sdk/rewards/GetJarService;I)V

    .line 353
    iput-object p3, p0, Lcom/getjar/sdk/rewards/GetJarService$ConfirmNotifications;->mNotifyIds:[Ljava/lang/String;

    .line 354
    return-void
.end method


# virtual methods
.method protected run()J
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 358
    sget-object v2, Lcom/getjar/sdk/logging/Area;->BUY_GOLD:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    const-string v4, "GooglePlayBillingService ConfirmNotifications"

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 359
    const-string v2, "CONFIRM_NOTIFICATIONS"

    invoke-virtual {p0, v2}, Lcom/getjar/sdk/rewards/GetJarService$ConfirmNotifications;->makeRequestBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    .line 360
    .local v0, "request":Landroid/os/Bundle;
    const-string v2, "NOTIFY_IDS"

    iget-object v3, p0, Lcom/getjar/sdk/rewards/GetJarService$ConfirmNotifications;->mNotifyIds:[Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putStringArray(Ljava/lang/String;[Ljava/lang/String;)V

    .line 361
    invoke-static {}, Lcom/getjar/sdk/rewards/GetJarService;->access$200()Lcom/getjar/sdk/vending/billing/IMarketBillingService;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 362
    invoke-static {}, Lcom/getjar/sdk/rewards/GetJarService;->access$200()Lcom/getjar/sdk/vending/billing/IMarketBillingService;

    move-result-object v2

    invoke-interface {v2, v0}, Lcom/getjar/sdk/vending/billing/IMarketBillingService;->sendBillingRequest(Landroid/os/Bundle;)Landroid/os/Bundle;

    move-result-object v1

    .line 363
    .local v1, "response":Landroid/os/Bundle;
    const-string v2, "REQUEST_ID"

    sget-wide v3, Lcom/getjar/sdk/utilities/Constants;->BILLING_RESPONSE_INVALID_REQUEST_ID:J

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Bundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v2

    .line 366
    .end local v1    # "response":Landroid/os/Bundle;
    :goto_0
    return-wide v2

    :cond_0
    sget-wide v2, Lcom/getjar/sdk/utilities/Constants;->BILLING_RESPONSE_INVALID_REQUEST_ID:J

    goto :goto_0
.end method
