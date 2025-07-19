.class public Lcom/getjar/sdk/rewards/GetJarService;
.super Landroid/app/Service;
.source "GetJarService.java"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/getjar/sdk/rewards/GetJarService$GetPurchaseInformation;,
        Lcom/getjar/sdk/rewards/GetJarService$ConfirmNotifications;,
        Lcom/getjar/sdk/rewards/GetJarService$RequestPurchase;,
        Lcom/getjar/sdk/rewards/GetJarService$CheckBillingSupported;,
        Lcom/getjar/sdk/rewards/GetJarService$BillingRequest;
    }
.end annotation


# static fields
.field private static final START_INTENT_SENDER_SIG:[Ljava/lang/Class;

.field private static googlePlayBillingService:Lcom/getjar/sdk/vending/billing/IMarketBillingService;

.field private static mPendingRequests:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Lcom/getjar/sdk/rewards/GetJarService$BillingRequest;",
            ">;"
        }
    .end annotation
.end field

.field private static mSentRequests:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Long;",
            "Lcom/getjar/sdk/rewards/GetJarService$BillingRequest;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mStartIntentSender:Ljava/lang/reflect/Method;

.field private mStartIntentSenderArgs:[Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 75
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    sput-object v0, Lcom/getjar/sdk/rewards/GetJarService;->mPendingRequests:Ljava/util/LinkedList;

    .line 82
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/getjar/sdk/rewards/GetJarService;->mSentRequests:Ljava/util/HashMap;

    .line 97
    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/Class;

    const/4 v1, 0x0

    const-class v2, Landroid/content/IntentSender;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-class v2, Landroid/content/Intent;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    sget-object v2, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v2, v0, v1

    const/4 v1, 0x3

    sget-object v2, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v2, v0, v1

    const/4 v1, 0x4

    sget-object v2, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v2, v0, v1

    sput-object v0, Lcom/getjar/sdk/rewards/GetJarService;->START_INTENT_SENDER_SIG:[Ljava/lang/Class;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 408
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 95
    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/Object;

    iput-object v0, p0, Lcom/getjar/sdk/rewards/GetJarService;->mStartIntentSenderArgs:[Ljava/lang/Object;

    .line 409
    return-void
.end method

.method static synthetic access$000(Lcom/getjar/sdk/rewards/GetJarService;)Z
    .locals 1
    .param p0, "x0"    # Lcom/getjar/sdk/rewards/GetJarService;

    .prologue
    .line 66
    invoke-direct {p0}, Lcom/getjar/sdk/rewards/GetJarService;->bindToMarketBillingService()Z

    move-result v0

    return v0
.end method

.method static synthetic access$100()Ljava/util/LinkedList;
    .locals 1

    .prologue
    .line 66
    sget-object v0, Lcom/getjar/sdk/rewards/GetJarService;->mPendingRequests:Ljava/util/LinkedList;

    return-object v0
.end method

.method static synthetic access$200()Lcom/getjar/sdk/vending/billing/IMarketBillingService;
    .locals 1

    .prologue
    .line 66
    sget-object v0, Lcom/getjar/sdk/rewards/GetJarService;->googlePlayBillingService:Lcom/getjar/sdk/vending/billing/IMarketBillingService;

    return-object v0
.end method

.method static synthetic access$202(Lcom/getjar/sdk/vending/billing/IMarketBillingService;)Lcom/getjar/sdk/vending/billing/IMarketBillingService;
    .locals 0
    .param p0, "x0"    # Lcom/getjar/sdk/vending/billing/IMarketBillingService;

    .prologue
    .line 66
    sput-object p0, Lcom/getjar/sdk/rewards/GetJarService;->googlePlayBillingService:Lcom/getjar/sdk/vending/billing/IMarketBillingService;

    return-object p0
.end method

.method static synthetic access$300()Ljava/util/HashMap;
    .locals 1

    .prologue
    .line 66
    sget-object v0, Lcom/getjar/sdk/rewards/GetJarService;->mSentRequests:Ljava/util/HashMap;

    return-object v0
.end method

.method static synthetic access$400(Lcom/getjar/sdk/rewards/GetJarService;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/getjar/sdk/rewards/GetJarService;
    .param p1, "x1"    # Z

    .prologue
    .line 66
    invoke-direct {p0, p1}, Lcom/getjar/sdk/rewards/GetJarService;->setBillingSupported(Z)V

    return-void
.end method

.method static synthetic access$500(Lcom/getjar/sdk/rewards/GetJarService;)V
    .locals 0
    .param p0, "x0"    # Lcom/getjar/sdk/rewards/GetJarService;

    .prologue
    .line 66
    invoke-direct {p0}, Lcom/getjar/sdk/rewards/GetJarService;->initCompatibilityLayer()V

    return-void
.end method

.method static synthetic access$600(Lcom/getjar/sdk/rewards/GetJarService;)V
    .locals 0
    .param p0, "x0"    # Lcom/getjar/sdk/rewards/GetJarService;

    .prologue
    .line 66
    invoke-direct {p0}, Lcom/getjar/sdk/rewards/GetJarService;->runPendingRequests()V

    return-void
.end method

.method private bindToMarketBillingService()Z
    .locals 6

    .prologue
    const/4 v2, 0x1

    .line 490
    :try_start_0
    new-instance v3, Landroid/content/Intent;

    const-string v4, "com.android.vending.billing.MarketBillingService.BIND"

    invoke-direct {v3, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const/4 v4, 0x1

    invoke-virtual {p0, v3, p0, v4}, Lcom/getjar/sdk/rewards/GetJarService;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    move-result v0

    .line 495
    .local v0, "bindResult":Z
    if-eqz v0, :cond_0

    .line 496
    sget-object v3, Lcom/getjar/sdk/logging/Area;->BUY_GOLD:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    const-string v5, "Bound to Google Play billing service."

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    .line 504
    .end local v0    # "bindResult":Z
    :goto_0
    return v2

    .line 499
    .restart local v0    # "bindResult":Z
    :cond_0
    sget-object v2, Lcom/getjar/sdk/logging/Area;->BUY_GOLD:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    const-string v4, "Could not bind to service."

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 504
    .end local v0    # "bindResult":Z
    :goto_1
    const/4 v2, 0x0

    goto :goto_0

    .line 501
    :catch_0
    move-exception v1

    .line 502
    .local v1, "e":Ljava/lang/SecurityException;
    sget-object v2, Lcom/getjar/sdk/logging/Area;->BUY_GOLD:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Security exception: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;)V

    goto :goto_1
.end method

.method private checkResponseCode(JLcom/getjar/sdk/utilities/Constants$ResponseCode;)V
    .locals 3
    .param p1, "requestId"    # J
    .param p3, "responseCode"    # Lcom/getjar/sdk/utilities/Constants$ResponseCode;

    .prologue
    .line 611
    sget-object v1, Lcom/getjar/sdk/rewards/GetJarService;->mSentRequests:Ljava/util/HashMap;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/getjar/sdk/rewards/GetJarService$BillingRequest;

    .line 612
    .local v0, "request":Lcom/getjar/sdk/rewards/GetJarService$BillingRequest;
    if-eqz v0, :cond_0

    .line 613
    invoke-virtual {v0, p3}, Lcom/getjar/sdk/rewards/GetJarService$BillingRequest;->responseCodeReceived(Lcom/getjar/sdk/utilities/Constants$ResponseCode;)V

    .line 615
    :cond_0
    sget-object v1, Lcom/getjar/sdk/rewards/GetJarService;->mSentRequests:Ljava/util/HashMap;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 616
    return-void
.end method

.method private confirmNotifications(I[Ljava/lang/String;)Z
    .locals 1
    .param p1, "startId"    # I
    .param p2, "notifyIds"    # [Ljava/lang/String;

    .prologue
    .line 541
    new-instance v0, Lcom/getjar/sdk/rewards/GetJarService$ConfirmNotifications;

    invoke-direct {v0, p0, p1, p2}, Lcom/getjar/sdk/rewards/GetJarService$ConfirmNotifications;-><init>(Lcom/getjar/sdk/rewards/GetJarService;I[Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/getjar/sdk/rewards/GetJarService$ConfirmNotifications;->runRequest()Z

    move-result v0

    return v0
.end method

.method private getPurchaseInformation(I[Ljava/lang/String;)Z
    .locals 1
    .param p1, "startId"    # I
    .param p2, "notifyIds"    # [Ljava/lang/String;

    .prologue
    .line 558
    new-instance v0, Lcom/getjar/sdk/rewards/GetJarService$GetPurchaseInformation;

    invoke-direct {v0, p0, p1, p2}, Lcom/getjar/sdk/rewards/GetJarService$GetPurchaseInformation;-><init>(Lcom/getjar/sdk/rewards/GetJarService;I[Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/getjar/sdk/rewards/GetJarService$GetPurchaseInformation;->runRequest()Z

    move-result v0

    return v0
.end method

.method private initCompatibilityLayer()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 305
    :try_start_0
    invoke-virtual {p0}, Lcom/getjar/sdk/rewards/GetJarService;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v2, "startIntentSender"

    sget-object v3, Lcom/getjar/sdk/rewards/GetJarService;->START_INTENT_SENDER_SIG:[Ljava/lang/Class;

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    iput-object v1, p0, Lcom/getjar/sdk/rewards/GetJarService;->mStartIntentSender:Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_1

    .line 314
    :goto_0
    return-void

    .line 307
    :catch_0
    move-exception v0

    .line 308
    .local v0, "e":Ljava/lang/SecurityException;
    sget-object v1, Lcom/getjar/sdk/logging/Area;->BUY_GOLD:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "GooglePlayBillingService initCompatibilityLayer"

    invoke-static {v1, v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 309
    iput-object v5, p0, Lcom/getjar/sdk/rewards/GetJarService;->mStartIntentSender:Ljava/lang/reflect/Method;

    goto :goto_0

    .line 310
    .end local v0    # "e":Ljava/lang/SecurityException;
    :catch_1
    move-exception v0

    .line 311
    .local v0, "e":Ljava/lang/NoSuchMethodException;
    sget-object v1, Lcom/getjar/sdk/logging/Area;->BUY_GOLD:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "GooglePlayBillingService initCompatibilityLayer"

    invoke-static {v1, v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 312
    iput-object v5, p0, Lcom/getjar/sdk/rewards/GetJarService;->mStartIntentSender:Ljava/lang/reflect/Method;

    goto :goto_0
.end method

.method private purchaseStateChanged(ILjava/lang/String;Ljava/lang/String;)V
    .locals 10
    .param p1, "startId"    # I
    .param p2, "signedData"    # Ljava/lang/String;
    .param p3, "signature"    # Ljava/lang/String;

    .prologue
    .line 570
    sget-object v6, Lcom/getjar/sdk/logging/Area;->BUY_GOLD:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    sget-object v8, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v8}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v8

    or-long/2addr v6, v8

    const-string v8, "GooglePlayBillingService purchaseStateChanged started"

    invoke-static {v6, v7, v8}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 571
    invoke-virtual {p0}, Lcom/getjar/sdk/rewards/GetJarService;->getApplicationContext()Landroid/content/Context;

    move-result-object v6

    invoke-static {p2, p3, v6}, Lcom/getjar/sdk/utilities/Security;->getPurchaseDetails(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)Ljava/util/ArrayList;

    move-result-object v4

    .line 572
    .local v4, "purchases":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/getjar/sdk/data/GooglePurchaseResponse;>;"
    if-nez v4, :cond_1

    .line 573
    sget-object v6, Lcom/getjar/sdk/logging/Area;->BUY_GOLD:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    sget-object v8, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v8}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v8

    or-long/2addr v6, v8

    const-string v8, "GooglePlayBillingService purchases null"

    invoke-static {v6, v7, v8}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 596
    :cond_0
    :goto_0
    return-void

    .line 576
    :cond_1
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 577
    .local v2, "notifyList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_2
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/getjar/sdk/data/GooglePurchaseResponse;

    .line 578
    .local v3, "purchase":Lcom/getjar/sdk/data/GooglePurchaseResponse;
    invoke-virtual {v3}, Lcom/getjar/sdk/data/GooglePurchaseResponse;->getNotificationId()Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_3

    .line 579
    invoke-virtual {v3}, Lcom/getjar/sdk/data/GooglePurchaseResponse;->getNotificationId()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 582
    :cond_3
    invoke-virtual {v3}, Lcom/getjar/sdk/data/GooglePurchaseResponse;->getPurchaseState()S

    move-result v6

    sget-object v7, Lcom/getjar/sdk/utilities/Constants$PurchaseState;->PURCHASED:Lcom/getjar/sdk/utilities/Constants$PurchaseState;

    invoke-virtual {v7}, Lcom/getjar/sdk/utilities/Constants$PurchaseState;->ordinal()I

    move-result v7

    if-ne v6, v7, :cond_2

    .line 585
    invoke-virtual {p0}, Lcom/getjar/sdk/rewards/GetJarService;->getApplicationContext()Landroid/content/Context;

    move-result-object v6

    invoke-static {v6}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/rewards/InAppPurchaseManager;

    move-result-object v6

    invoke-virtual {v6, v3}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->storePurchaseResponse(Lcom/getjar/sdk/data/GooglePurchaseResponse;)V

    .line 587
    new-instance v5, Lcom/getjar/sdk/comm/TransactionManager;

    invoke-virtual {p0}, Lcom/getjar/sdk/rewards/GetJarService;->getApplicationContext()Landroid/content/Context;

    move-result-object v6

    invoke-direct {v5, v6}, Lcom/getjar/sdk/comm/TransactionManager;-><init>(Landroid/content/Context;)V

    .line 588
    .local v5, "transactionManager":Lcom/getjar/sdk/comm/TransactionManager;
    invoke-virtual {p0}, Lcom/getjar/sdk/rewards/GetJarService;->getApplicationContext()Landroid/content/Context;

    move-result-object v6

    invoke-static {v6}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/rewards/InAppPurchaseManager;

    move-result-object v6

    invoke-virtual {v6}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->getCommContext()Lcom/getjar/sdk/comm/CommContext;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/getjar/sdk/comm/TransactionManager;->buyCurrencyForGoogleTransactions(Lcom/getjar/sdk/comm/CommContext;)V

    goto :goto_1

    .line 592
    .end local v3    # "purchase":Lcom/getjar/sdk/data/GooglePurchaseResponse;
    .end local v5    # "transactionManager":Lcom/getjar/sdk/comm/TransactionManager;
    :cond_4
    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_0

    .line 593
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v6

    new-array v6, v6, [Ljava/lang/String;

    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/String;

    .line 594
    .local v1, "notifyIds":[Ljava/lang/String;
    invoke-direct {p0, p1, v1}, Lcom/getjar/sdk/rewards/GetJarService;->confirmNotifications(I[Ljava/lang/String;)Z

    goto :goto_0
.end method

.method private runPendingRequests()V
    .locals 6

    .prologue
    .line 624
    sget-object v2, Lcom/getjar/sdk/logging/Area;->BUY_GOLD:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "GooglePlayBillingService runPendingRequests mPendingRequests size "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-object v5, Lcom/getjar/sdk/rewards/GetJarService;->mPendingRequests:Ljava/util/LinkedList;

    invoke-virtual {v5}, Ljava/util/LinkedList;->size()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 625
    const/4 v0, -0x1

    .line 627
    .local v0, "maxStartId":I
    :cond_0
    :goto_0
    sget-object v2, Lcom/getjar/sdk/rewards/GetJarService;->mPendingRequests:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->peek()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/getjar/sdk/rewards/GetJarService$BillingRequest;

    .local v1, "request":Lcom/getjar/sdk/rewards/GetJarService$BillingRequest;
    if-eqz v1, :cond_3

    .line 628
    invoke-virtual {v1}, Lcom/getjar/sdk/rewards/GetJarService$BillingRequest;->runIfConnected()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 629
    sget-object v2, Lcom/getjar/sdk/logging/Area;->BUY_GOLD:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    const-string v4, "GooglePlayBillingService runPendingRequests runIfConnected"

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 631
    sget-object v2, Lcom/getjar/sdk/rewards/GetJarService;->mPendingRequests:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->remove()Ljava/lang/Object;

    .line 635
    invoke-virtual {v1}, Lcom/getjar/sdk/rewards/GetJarService$BillingRequest;->getStartId()I

    move-result v2

    if-ge v0, v2, :cond_0

    .line 636
    invoke-virtual {v1}, Lcom/getjar/sdk/rewards/GetJarService$BillingRequest;->getStartId()I

    move-result v0

    goto :goto_0

    .line 639
    :cond_1
    sget-object v2, Lcom/getjar/sdk/logging/Area;->BUY_GOLD:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    const-string v4, "GooglePlayBillingService runPendingRequests bind"

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 642
    invoke-direct {p0}, Lcom/getjar/sdk/rewards/GetJarService;->bindToMarketBillingService()Z

    .line 653
    :cond_2
    :goto_1
    return-void

    .line 650
    :cond_3
    if-ltz v0, :cond_2

    .line 651
    invoke-virtual {p0, v0}, Lcom/getjar/sdk/rewards/GetJarService;->stopSelf(I)V

    goto :goto_1
.end method

.method private setBillingSupported(Z)V
    .locals 5
    .param p1, "billingSupported"    # Z

    .prologue
    .line 228
    invoke-virtual {p0}, Lcom/getjar/sdk/rewards/GetJarService;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const-string v3, "GetJarClientPrefs"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 229
    .local v1, "prefs":Landroid/content/SharedPreferences;
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 230
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    const-string v2, "billing_supported"

    invoke-interface {v0, v2, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 231
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 232
    return-void
.end method


# virtual methods
.method public checkBillingSupported()Z
    .locals 1

    .prologue
    .line 513
    new-instance v0, Lcom/getjar/sdk/rewards/GetJarService$CheckBillingSupported;

    invoke-direct {v0, p0}, Lcom/getjar/sdk/rewards/GetJarService$CheckBillingSupported;-><init>(Lcom/getjar/sdk/rewards/GetJarService;)V

    invoke-virtual {v0}, Lcom/getjar/sdk/rewards/GetJarService$CheckBillingSupported;->runRequest()Z

    move-result v0

    return v0
.end method

.method public handleCommand(Landroid/content/Intent;I)V
    .locals 13
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "startId"    # I

    .prologue
    .line 460
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 462
    .local v0, "action":Ljava/lang/String;
    sget-object v9, Lcom/getjar/sdk/logging/Area;->BUY_GOLD:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v9}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v9

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "GooglePlayBillingService handleCommand - action "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v9, v10, v11}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 464
    const-string v9, "com.getjar.sdk.CONFIRM_NOTIFICATION"

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_1

    .line 465
    const-string v9, "notification_id"

    invoke-virtual {p1, v9}, Landroid/content/Intent;->getStringArrayExtra(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 466
    .local v2, "notifyIds":[Ljava/lang/String;
    invoke-direct {p0, p2, v2}, Lcom/getjar/sdk/rewards/GetJarService;->confirmNotifications(I[Ljava/lang/String;)Z

    .line 481
    .end local v2    # "notifyIds":[Ljava/lang/String;
    :cond_0
    :goto_0
    return-void

    .line 467
    :cond_1
    const-string v9, "com.getjar.sdk.GET_PURCHASE_INFORMATION"

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_2

    .line 468
    const-string v9, "notification_id"

    invoke-virtual {p1, v9}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 469
    .local v1, "notifyId":Ljava/lang/String;
    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/String;

    const/4 v10, 0x0

    aput-object v1, v9, v10

    invoke-direct {p0, p2, v9}, Lcom/getjar/sdk/rewards/GetJarService;->getPurchaseInformation(I[Ljava/lang/String;)Z

    goto :goto_0

    .line 470
    .end local v1    # "notifyId":Ljava/lang/String;
    :cond_2
    const-string v9, "com.android.vending.billing.PURCHASE_STATE_CHANGED"

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_3

    .line 471
    const-string v9, "inapp_signed_data"

    invoke-virtual {p1, v9}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 472
    .local v8, "signedData":Ljava/lang/String;
    const-string v9, "inapp_signature"

    invoke-virtual {p1, v9}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 473
    .local v7, "signature":Ljava/lang/String;
    invoke-direct {p0, p2, v8, v7}, Lcom/getjar/sdk/rewards/GetJarService;->purchaseStateChanged(ILjava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 474
    .end local v7    # "signature":Ljava/lang/String;
    .end local v8    # "signedData":Ljava/lang/String;
    :cond_3
    const-string v9, "com.android.vending.billing.RESPONSE_CODE"

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_0

    .line 475
    const-string v9, "request_id"

    const-wide/16 v10, -0x1

    invoke-virtual {p1, v9, v10, v11}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v3

    .line 476
    .local v3, "requestId":J
    const-string v9, "response_code"

    sget-object v10, Lcom/getjar/sdk/utilities/Constants$ResponseCode;->RESULT_ERROR:Lcom/getjar/sdk/utilities/Constants$ResponseCode;

    invoke-virtual {v10}, Lcom/getjar/sdk/utilities/Constants$ResponseCode;->ordinal()I

    move-result v10

    invoke-virtual {p1, v9, v10}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v6

    .line 478
    .local v6, "responseCodeIndex":I
    invoke-static {v6}, Lcom/getjar/sdk/utilities/Constants$ResponseCode;->valueOf(I)Lcom/getjar/sdk/utilities/Constants$ResponseCode;

    move-result-object v5

    .line 479
    .local v5, "responseCode":Lcom/getjar/sdk/utilities/Constants$ResponseCode;
    invoke-direct {p0, v3, v4, v5}, Lcom/getjar/sdk/rewards/GetJarService;->checkResponseCode(JLcom/getjar/sdk/utilities/Constants$ResponseCode;)V

    goto :goto_0
.end method

.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 1
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 420
    const/4 v0, 0x0

    return-object v0
.end method

.method public onCreate()V
    .locals 4

    .prologue
    .line 707
    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    .line 709
    :try_start_0
    new-instance v1, Ljava/lang/Thread;

    new-instance v2, Lcom/getjar/sdk/rewards/GetJarService$3;

    invoke-direct {v2, p0}, Lcom/getjar/sdk/rewards/GetJarService$3;-><init>(Lcom/getjar/sdk/rewards/GetJarService;)V

    invoke-direct {v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v1}, Ljava/lang/Thread;->start()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 733
    :goto_0
    return-void

    .line 729
    :catch_0
    move-exception v0

    .line 730
    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    const-string v3, "GetJarService onStart"

    invoke-static {v1, v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 5
    .param p1, "name"    # Landroid/content/ComponentName;
    .param p2, "service"    # Landroid/os/IBinder;

    .prologue
    .line 661
    sget-object v1, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->BUY_GOLD:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "GooglePlayBillingService onServiceConnected"

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 663
    :try_start_0
    invoke-static {p2}, Lcom/getjar/sdk/vending/billing/IMarketBillingService$Stub;->asInterface(Landroid/os/IBinder;)Lcom/getjar/sdk/vending/billing/IMarketBillingService;

    move-result-object v1

    sput-object v1, Lcom/getjar/sdk/rewards/GetJarService;->googlePlayBillingService:Lcom/getjar/sdk/vending/billing/IMarketBillingService;

    .line 664
    new-instance v1, Ljava/lang/Thread;

    new-instance v2, Lcom/getjar/sdk/rewards/GetJarService$2;

    invoke-direct {v2, p0}, Lcom/getjar/sdk/rewards/GetJarService$2;-><init>(Lcom/getjar/sdk/rewards/GetJarService;)V

    const-string v3, "GooglePlayRequestThread"

    invoke-direct {v1, v2, v3}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/Thread;->start()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 680
    :goto_0
    return-void

    .line 676
    :catch_0
    move-exception v0

    .line 677
    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Lcom/getjar/sdk/logging/Area;->BUY_GOLD:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    const-string v3, "GetJarService onServiceConnected"

    invoke-static {v1, v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 3
    .param p1, "name"    # Landroid/content/ComponentName;

    .prologue
    .line 687
    sget-object v0, Lcom/getjar/sdk/logging/Area;->BUY_GOLD:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    const-string v2, "GooglePlayBillingService onServiceDisconnected"

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;)V

    .line 688
    const/4 v0, 0x0

    sput-object v0, Lcom/getjar/sdk/rewards/GetJarService;->googlePlayBillingService:Lcom/getjar/sdk/vending/billing/IMarketBillingService;

    .line 689
    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 5
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "flags"    # I
    .param p3, "startId"    # I

    .prologue
    .line 426
    sget-object v1, Lcom/getjar/sdk/logging/Area;->BUY_GOLD:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "GetJarService onStartCommand"

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 428
    :try_start_0
    new-instance v1, Ljava/lang/Thread;

    new-instance v2, Lcom/getjar/sdk/rewards/GetJarService$1;

    invoke-direct {v2, p0, p1, p3}, Lcom/getjar/sdk/rewards/GetJarService$1;-><init>(Lcom/getjar/sdk/rewards/GetJarService;Landroid/content/Intent;I)V

    invoke-direct {v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v1}, Ljava/lang/Thread;->start()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 450
    :goto_0
    const/4 v1, 0x1

    return v1

    .line 445
    :catch_0
    move-exception v0

    .line 446
    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Lcom/getjar/sdk/logging/Area;->BUY_GOLD:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "GetJarService onStart"

    invoke-static {v1, v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public requestPurchase(Ljava/lang/String;)Z
    .locals 1
    .param p1, "productId"    # Ljava/lang/String;

    .prologue
    .line 526
    new-instance v0, Lcom/getjar/sdk/rewards/GetJarService$RequestPurchase;

    invoke-direct {v0, p0, p1}, Lcom/getjar/sdk/rewards/GetJarService$RequestPurchase;-><init>(Lcom/getjar/sdk/rewards/GetJarService;Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/getjar/sdk/rewards/GetJarService$RequestPurchase;->runRequest()Z

    move-result v0

    return v0
.end method

.method public setContext(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 412
    invoke-virtual {p0, p1}, Lcom/getjar/sdk/rewards/GetJarService;->attachBaseContext(Landroid/content/Context;)V

    .line 413
    return-void
.end method

.method startBuyPageActivity(Landroid/app/PendingIntent;Landroid/content/Intent;)V
    .locals 5
    .param p1, "pendingIntent"    # Landroid/app/PendingIntent;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 318
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarService;->mStartIntentSender:Ljava/lang/reflect/Method;

    if-eqz v1, :cond_0

    .line 325
    :try_start_0
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarService;->mStartIntentSenderArgs:[Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-virtual {p1}, Landroid/app/PendingIntent;->getIntentSender()Landroid/content/IntentSender;

    move-result-object v3

    aput-object v3, v1, v2

    .line 326
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarService;->mStartIntentSenderArgs:[Ljava/lang/Object;

    const/4 v2, 0x1

    aput-object p2, v1, v2

    .line 327
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarService;->mStartIntentSenderArgs:[Ljava/lang/Object;

    const/4 v2, 0x2

    const/4 v3, 0x0

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    .line 328
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarService;->mStartIntentSenderArgs:[Ljava/lang/Object;

    const/4 v2, 0x3

    const/4 v3, 0x0

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    .line 329
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarService;->mStartIntentSenderArgs:[Ljava/lang/Object;

    const/4 v2, 0x4

    const/4 v3, 0x0

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    .line 330
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarService;->mStartIntentSender:Ljava/lang/reflect/Method;

    invoke-virtual {p0}, Lcom/getjar/sdk/rewards/GetJarService;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lcom/getjar/sdk/rewards/GetJarService;->mStartIntentSenderArgs:[Ljava/lang/Object;

    invoke-virtual {v1, v2, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 344
    :goto_0
    return-void

    .line 331
    :catch_0
    move-exception v0

    .line 332
    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Lcom/getjar/sdk/logging/Area;->BUY_GOLD:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "error starting activity"

    invoke-static {v1, v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 339
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Lcom/getjar/sdk/rewards/GetJarService;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {p1, v1, v2, p2}, Landroid/app/PendingIntent;->send(Landroid/content/Context;ILandroid/content/Intent;)V
    :try_end_1
    .catch Landroid/app/PendingIntent$CanceledException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 340
    :catch_1
    move-exception v0

    .line 341
    .local v0, "e":Landroid/app/PendingIntent$CanceledException;
    sget-object v1, Lcom/getjar/sdk/logging/Area;->BUY_GOLD:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "error starting activity"

    invoke-static {v1, v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public unbind()V
    .locals 1

    .prologue
    .line 697
    :try_start_0
    invoke-virtual {p0, p0}, Lcom/getjar/sdk/rewards/GetJarService;->unbindService(Landroid/content/ServiceConnection;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 701
    :goto_0
    return-void

    .line 698
    :catch_0
    move-exception v0

    goto :goto_0
.end method
