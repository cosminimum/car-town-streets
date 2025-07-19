.class abstract Lcom/getjar/sdk/rewards/GetJarService$BillingRequest;
.super Ljava/lang/Object;
.source "GetJarService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getjar/sdk/rewards/GetJarService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x400
    name = "BillingRequest"
.end annotation


# instance fields
.field protected mRequestId:J

.field private final mStartId:I

.field final synthetic this$0:Lcom/getjar/sdk/rewards/GetJarService;


# direct methods
.method public constructor <init>(Lcom/getjar/sdk/rewards/GetJarService;I)V
    .locals 0
    .param p2, "startId"    # I

    .prologue
    .line 105
    iput-object p1, p0, Lcom/getjar/sdk/rewards/GetJarService$BillingRequest;->this$0:Lcom/getjar/sdk/rewards/GetJarService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 106
    iput p2, p0, Lcom/getjar/sdk/rewards/GetJarService$BillingRequest;->mStartId:I

    .line 107
    return-void
.end method


# virtual methods
.method public getStartId()I
    .locals 1

    .prologue
    .line 110
    iget v0, p0, Lcom/getjar/sdk/rewards/GetJarService$BillingRequest;->mStartId:I

    return v0
.end method

.method protected makeRequestBundle(Ljava/lang/String;)Landroid/os/Bundle;
    .locals 3
    .param p1, "method"    # Ljava/lang/String;

    .prologue
    .line 179
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 180
    .local v0, "request":Landroid/os/Bundle;
    const-string v1, "BILLING_REQUEST"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 181
    const-string v1, "API_VERSION"

    const/4 v2, 0x2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 182
    const-string v1, "PACKAGE_NAME"

    iget-object v2, p0, Lcom/getjar/sdk/rewards/GetJarService$BillingRequest;->this$0:Lcom/getjar/sdk/rewards/GetJarService;

    invoke-virtual {v2}, Lcom/getjar/sdk/rewards/GetJarService;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 183
    return-object v0
.end method

.method protected onRemoteException(Landroid/os/RemoteException;)V
    .locals 3
    .param p1, "e"    # Landroid/os/RemoteException;

    .prologue
    .line 160
    sget-object v0, Lcom/getjar/sdk/logging/Area;->BUY_GOLD:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    const-string v2, "remote billing service crashed"

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;)V

    .line 161
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/getjar/sdk/rewards/GetJarService;->access$202(Lcom/getjar/sdk/vending/billing/IMarketBillingService;)Lcom/getjar/sdk/vending/billing/IMarketBillingService;

    .line 162
    return-void
.end method

.method protected responseCodeReceived(Lcom/getjar/sdk/utilities/Constants$ResponseCode;)V
    .locals 0
    .param p1, "responseCode"    # Lcom/getjar/sdk/utilities/Constants$ResponseCode;

    .prologue
    .line 176
    return-void
.end method

.method protected abstract run()J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation
.end method

.method public runIfConnected()Z
    .locals 5

    .prologue
    .line 138
    invoke-static {}, Lcom/getjar/sdk/rewards/GetJarService;->access$200()Lcom/getjar/sdk/vending/billing/IMarketBillingService;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 140
    :try_start_0
    sget-object v1, Lcom/getjar/sdk/logging/Area;->BUY_GOLD:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    const-string v3, "GooglePlayBillingService runIfConnected"

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 141
    invoke-virtual {p0}, Lcom/getjar/sdk/rewards/GetJarService$BillingRequest;->run()J

    move-result-wide v1

    iput-wide v1, p0, Lcom/getjar/sdk/rewards/GetJarService$BillingRequest;->mRequestId:J

    .line 142
    iget-wide v1, p0, Lcom/getjar/sdk/rewards/GetJarService$BillingRequest;->mRequestId:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-ltz v1, :cond_0

    .line 143
    invoke-static {}, Lcom/getjar/sdk/rewards/GetJarService;->access$300()Ljava/util/HashMap;

    move-result-object v1

    iget-wide v2, p0, Lcom/getjar/sdk/rewards/GetJarService$BillingRequest;->mRequestId:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v1, v2, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 145
    :cond_0
    const/4 v1, 0x1

    .line 150
    :goto_0
    return v1

    .line 146
    :catch_0
    move-exception v0

    .line 147
    .local v0, "e":Landroid/os/RemoteException;
    invoke-virtual {p0, v0}, Lcom/getjar/sdk/rewards/GetJarService$BillingRequest;->onRemoteException(Landroid/os/RemoteException;)V

    .line 150
    .end local v0    # "e":Landroid/os/RemoteException;
    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public runRequest()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 119
    invoke-virtual {p0}, Lcom/getjar/sdk/rewards/GetJarService$BillingRequest;->runIfConnected()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 128
    :goto_0
    return v0

    .line 123
    :cond_0
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarService$BillingRequest;->this$0:Lcom/getjar/sdk/rewards/GetJarService;

    invoke-static {v1}, Lcom/getjar/sdk/rewards/GetJarService;->access$000(Lcom/getjar/sdk/rewards/GetJarService;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 125
    invoke-static {}, Lcom/getjar/sdk/rewards/GetJarService;->access$100()Ljava/util/LinkedList;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 128
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method
