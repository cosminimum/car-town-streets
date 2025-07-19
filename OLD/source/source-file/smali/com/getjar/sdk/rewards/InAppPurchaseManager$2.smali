.class Lcom/getjar/sdk/rewards/InAppPurchaseManager$2;
.super Ljava/lang/Object;
.source "InAppPurchaseManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/getjar/sdk/rewards/InAppPurchaseManager;->processOutstandingPurchases(Z)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/getjar/sdk/rewards/InAppPurchaseManager;


# direct methods
.method constructor <init>(Lcom/getjar/sdk/rewards/InAppPurchaseManager;)V
    .locals 0

    .prologue
    .line 835
    iput-object p1, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager$2;->this$0:Lcom/getjar/sdk/rewards/InAppPurchaseManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 838
    iget-object v0, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager$2;->this$0:Lcom/getjar/sdk/rewards/InAppPurchaseManager;

    invoke-virtual {v0}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->isApi3BillingSupported()Z

    .line 839
    return-void
.end method
