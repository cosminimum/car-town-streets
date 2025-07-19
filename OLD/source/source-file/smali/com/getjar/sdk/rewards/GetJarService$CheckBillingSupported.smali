.class Lcom/getjar/sdk/rewards/GetJarService$CheckBillingSupported;
.super Lcom/getjar/sdk/rewards/GetJarService$BillingRequest;
.source "GetJarService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getjar/sdk/rewards/GetJarService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "CheckBillingSupported"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/getjar/sdk/rewards/GetJarService;


# direct methods
.method public constructor <init>(Lcom/getjar/sdk/rewards/GetJarService;)V
    .locals 1

    .prologue
    .line 192
    iput-object p1, p0, Lcom/getjar/sdk/rewards/GetJarService$CheckBillingSupported;->this$0:Lcom/getjar/sdk/rewards/GetJarService;

    .line 193
    const/4 v0, -0x1

    invoke-direct {p0, p1, v0}, Lcom/getjar/sdk/rewards/GetJarService$BillingRequest;-><init>(Lcom/getjar/sdk/rewards/GetJarService;I)V

    .line 194
    return-void
.end method


# virtual methods
.method protected run()J
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 199
    const-string v6, "CHECK_BILLING_SUPPORTED"

    invoke-virtual {p0, v6}, Lcom/getjar/sdk/rewards/GetJarService$CheckBillingSupported;->makeRequestBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v2

    .line 201
    .local v2, "request":Landroid/os/Bundle;
    :try_start_0
    invoke-static {}, Lcom/getjar/sdk/rewards/GetJarService;->access$200()Lcom/getjar/sdk/vending/billing/IMarketBillingService;

    move-result-object v6

    if-eqz v6, :cond_1

    .line 202
    invoke-static {}, Lcom/getjar/sdk/rewards/GetJarService;->access$200()Lcom/getjar/sdk/vending/billing/IMarketBillingService;

    move-result-object v6

    invoke-interface {v6, v2}, Lcom/getjar/sdk/vending/billing/IMarketBillingService;->sendBillingRequest(Landroid/os/Bundle;)Landroid/os/Bundle;

    move-result-object v3

    .line 203
    .local v3, "response":Landroid/os/Bundle;
    const-string v6, "RESPONSE_CODE"

    invoke-virtual {v3, v6}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v4

    .line 205
    .local v4, "responseCode":I
    sget-object v6, Lcom/getjar/sdk/utilities/Constants$ResponseCode;->RESULT_OK:Lcom/getjar/sdk/utilities/Constants$ResponseCode;

    invoke-virtual {v6}, Lcom/getjar/sdk/utilities/Constants$ResponseCode;->ordinal()I

    move-result v6

    if-ne v4, v6, :cond_0

    const/4 v0, 0x1

    .line 206
    .local v0, "billingSupported":Z
    :goto_0
    iget-object v6, p0, Lcom/getjar/sdk/rewards/GetJarService$CheckBillingSupported;->this$0:Lcom/getjar/sdk/rewards/GetJarService;

    invoke-static {v6, v0}, Lcom/getjar/sdk/rewards/GetJarService;->access$400(Lcom/getjar/sdk/rewards/GetJarService;Z)V

    .line 207
    sget-object v6, Lcom/getjar/sdk/logging/Area;->BUY_GOLD:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "GooglePlayBillingService CheckBillingSupported -- isSupported "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v6, v7, v8}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    .line 208
    sget-wide v5, Lcom/getjar/sdk/utilities/Constants;->BILLING_RESPONSE_VALID_REQUEST_ID:J

    .line 218
    .end local v0    # "billingSupported":Z
    .end local v3    # "response":Landroid/os/Bundle;
    .end local v4    # "responseCode":I
    :goto_1
    return-wide v5

    .restart local v3    # "response":Landroid/os/Bundle;
    .restart local v4    # "responseCode":I
    :cond_0
    move v0, v5

    .line 205
    goto :goto_0

    .line 211
    .end local v3    # "response":Landroid/os/Bundle;
    .end local v4    # "responseCode":I
    :cond_1
    iget-object v6, p0, Lcom/getjar/sdk/rewards/GetJarService$CheckBillingSupported;->this$0:Lcom/getjar/sdk/rewards/GetJarService;

    invoke-static {v6}, Lcom/getjar/sdk/rewards/GetJarService;->access$000(Lcom/getjar/sdk/rewards/GetJarService;)Z

    .line 212
    sget-wide v5, Lcom/getjar/sdk/utilities/Constants;->BILLING_RESPONSE_INVALID_REQUEST_ID:J
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 215
    :catch_0
    move-exception v1

    .line 216
    .local v1, "e":Ljava/lang/NullPointerException;
    sget-object v6, Lcom/getjar/sdk/logging/Area;->BUY_GOLD:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    const-string v8, "GetJarService CheckBillingSupported "

    invoke-static {v6, v7, v8, v1}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 217
    iget-object v6, p0, Lcom/getjar/sdk/rewards/GetJarService$CheckBillingSupported;->this$0:Lcom/getjar/sdk/rewards/GetJarService;

    invoke-static {v6, v5}, Lcom/getjar/sdk/rewards/GetJarService;->access$400(Lcom/getjar/sdk/rewards/GetJarService;Z)V

    .line 218
    sget-wide v5, Lcom/getjar/sdk/utilities/Constants;->BILLING_RESPONSE_INVALID_REQUEST_ID:J

    goto :goto_1
.end method
