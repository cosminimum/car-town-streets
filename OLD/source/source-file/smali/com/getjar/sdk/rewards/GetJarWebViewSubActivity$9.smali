.class Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$9;
.super Ljava/lang/Object;
.source "GetJarWebViewSubActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->onActivityResult(IILandroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

.field final synthetic val$dataFinal:Landroid/content/Intent;

.field final synthetic val$requestCodeFinal:I

.field final synthetic val$resultCodeFinal:I


# direct methods
.method constructor <init>(Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;IILandroid/content/Intent;)V
    .locals 0

    .prologue
    .line 1531
    iput-object p1, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$9;->this$0:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    iput p2, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$9;->val$requestCodeFinal:I

    iput p3, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$9;->val$resultCodeFinal:I

    iput-object p4, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$9;->val$dataFinal:Landroid/content/Intent;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 1535
    :try_start_0
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$9;->this$0:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-virtual {v1}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->getParentActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/rewards/InAppPurchaseManager;

    move-result-object v1

    iget v2, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$9;->val$requestCodeFinal:I

    iget v3, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$9;->val$resultCodeFinal:I

    iget-object v4, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$9;->val$dataFinal:Landroid/content/Intent;

    invoke-virtual {v1, v2, v3, v4}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->managedOfferGooglePlayResponse(IILandroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1539
    :goto_0
    return-void

    .line 1536
    :catch_0
    move-exception v0

    .line 1537
    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "InAppPurchaseManager.managedOfferGooglePlayResponse() failed"

    invoke-static {v1, v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
