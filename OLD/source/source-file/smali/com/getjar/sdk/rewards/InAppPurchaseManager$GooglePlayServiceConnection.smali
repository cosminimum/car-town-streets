.class Lcom/getjar/sdk/rewards/InAppPurchaseManager$GooglePlayServiceConnection;
.super Ljava/lang/Object;
.source "InAppPurchaseManager.java"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getjar/sdk/rewards/InAppPurchaseManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "GooglePlayServiceConnection"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/getjar/sdk/rewards/InAppPurchaseManager;


# direct methods
.method private constructor <init>(Lcom/getjar/sdk/rewards/InAppPurchaseManager;)V
    .locals 0

    .prologue
    .line 1044
    iput-object p1, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager$GooglePlayServiceConnection;->this$0:Lcom/getjar/sdk/rewards/InAppPurchaseManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/getjar/sdk/rewards/InAppPurchaseManager;Lcom/getjar/sdk/rewards/InAppPurchaseManager$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/getjar/sdk/rewards/InAppPurchaseManager;
    .param p2, "x1"    # Lcom/getjar/sdk/rewards/InAppPurchaseManager$1;

    .prologue
    .line 1044
    invoke-direct {p0, p1}, Lcom/getjar/sdk/rewards/InAppPurchaseManager$GooglePlayServiceConnection;-><init>(Lcom/getjar/sdk/rewards/InAppPurchaseManager;)V

    return-void
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 3
    .param p1, "name"    # Landroid/content/ComponentName;
    .param p2, "service"    # Landroid/os/IBinder;

    .prologue
    .line 1055
    iget-object v0, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager$GooglePlayServiceConnection;->this$0:Lcom/getjar/sdk/rewards/InAppPurchaseManager;

    invoke-static {v0}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->access$200(Lcom/getjar/sdk/rewards/InAppPurchaseManager;)Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1

    .line 1056
    :try_start_0
    iget-object v0, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager$GooglePlayServiceConnection;->this$0:Lcom/getjar/sdk/rewards/InAppPurchaseManager;

    invoke-static {p2}, Lcom/getjar/sdk/vending/billing/IInAppBillingService$Stub;->asInterface(Landroid/os/IBinder;)Lcom/getjar/sdk/vending/billing/IInAppBillingService;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->access$302(Lcom/getjar/sdk/rewards/InAppPurchaseManager;Lcom/getjar/sdk/vending/billing/IInAppBillingService;)Lcom/getjar/sdk/vending/billing/IInAppBillingService;

    .line 1057
    iget-object v0, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager$GooglePlayServiceConnection;->this$0:Lcom/getjar/sdk/rewards/InAppPurchaseManager;

    const/4 v2, 0x1

    invoke-static {v0, v2}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->access$102(Lcom/getjar/sdk/rewards/InAppPurchaseManager;Z)Z

    .line 1058
    iget-object v0, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager$GooglePlayServiceConnection;->this$0:Lcom/getjar/sdk/rewards/InAppPurchaseManager;

    invoke-static {v0}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->access$200(Lcom/getjar/sdk/rewards/InAppPurchaseManager;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 1059
    monitor-exit v1

    .line 1060
    return-void

    .line 1059
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 2
    .param p1, "name"    # Landroid/content/ComponentName;

    .prologue
    .line 1048
    iget-object v0, p0, Lcom/getjar/sdk/rewards/InAppPurchaseManager$GooglePlayServiceConnection;->this$0:Lcom/getjar/sdk/rewards/InAppPurchaseManager;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->access$102(Lcom/getjar/sdk/rewards/InAppPurchaseManager;Z)Z

    .line 1049
    return-void
.end method
