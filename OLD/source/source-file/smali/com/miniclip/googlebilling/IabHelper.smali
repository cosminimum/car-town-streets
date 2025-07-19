.class public Lcom/miniclip/googlebilling/IabHelper;
.super Ljava/lang/Object;
.source "IabHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miniclip/googlebilling/IabHelper$OnConsumeMultiFinishedListener;,
        Lcom/miniclip/googlebilling/IabHelper$OnConsumeFinishedListener;,
        Lcom/miniclip/googlebilling/IabHelper$QueryInventoryFinishedListener;,
        Lcom/miniclip/googlebilling/IabHelper$OnIabPurchaseFinishedListener;,
        Lcom/miniclip/googlebilling/IabHelper$OnIabSetupFinishedListener;
    }
.end annotation


# static fields
.field public static final BILLING_RESPONSE_RESULT_BILLING_UNAVAILABLE:I = 0x3

.field public static final BILLING_RESPONSE_RESULT_DEVELOPER_ERROR:I = 0x5

.field public static final BILLING_RESPONSE_RESULT_ERROR:I = 0x6

.field public static final BILLING_RESPONSE_RESULT_ITEM_ALREADY_OWNED:I = 0x7

.field public static final BILLING_RESPONSE_RESULT_ITEM_NOT_OWNED:I = 0x8

.field public static final BILLING_RESPONSE_RESULT_ITEM_UNAVAILABLE:I = 0x4

.field public static final BILLING_RESPONSE_RESULT_OK:I = 0x0

.field public static final BILLING_RESPONSE_RESULT_USER_CANCELED:I = 0x1

.field public static final GET_SKU_DETAILS_ITEM_LIST:Ljava/lang/String; = "ITEM_ID_LIST"

.field public static final GET_SKU_DETAILS_ITEM_TYPE_LIST:Ljava/lang/String; = "ITEM_TYPE_LIST"

.field public static final IABHELPER_BAD_RESPONSE:I = -0x3ea

.field public static final IABHELPER_ERROR_BASE:I = -0x3e8

.field public static final IABHELPER_MISSING_TOKEN:I = -0x3ef

.field public static final IABHELPER_REMOTE_EXCEPTION:I = -0x3e9

.field public static final IABHELPER_SEND_INTENT_FAILED:I = -0x3ec

.field public static final IABHELPER_UNKNOWN_ERROR:I = -0x3f0

.field public static final IABHELPER_UNKNOWN_PURCHASE_RESPONSE:I = -0x3ee

.field public static final IABHELPER_USER_CANCELLED:I = -0x3ed

.field public static final IABHELPER_VERIFICATION_FAILED:I = -0x3eb

.field public static final INAPP_CONTINUATION_TOKEN:Ljava/lang/String; = "INAPP_CONTINUATION_TOKEN"

.field public static final ITEM_TYPE_INAPP:Ljava/lang/String; = "inapp"

.field public static final RESPONSE_BUY_INTENT:Ljava/lang/String; = "BUY_INTENT"

.field public static final RESPONSE_CODE:Ljava/lang/String; = "RESPONSE_CODE"

.field public static final RESPONSE_GET_SKU_DETAILS_LIST:Ljava/lang/String; = "DETAILS_LIST"

.field public static final RESPONSE_INAPP_ITEM_LIST:Ljava/lang/String; = "INAPP_PURCHASE_ITEM_LIST"

.field public static final RESPONSE_INAPP_PURCHASE_DATA:Ljava/lang/String; = "INAPP_PURCHASE_DATA"

.field public static final RESPONSE_INAPP_PURCHASE_DATA_LIST:Ljava/lang/String; = "INAPP_PURCHASE_DATA_LIST"

.field public static final RESPONSE_INAPP_SIGNATURE:Ljava/lang/String; = "INAPP_DATA_SIGNATURE"

.field public static final RESPONSE_INAPP_SIGNATURE_LIST:Ljava/lang/String; = "INAPP_DATA_SIGNATURE_LIST"


# instance fields
.field mAsyncInProgress:Z

.field mAsyncOperation:Ljava/lang/String;

.field mContext:Landroid/content/Context;

.field mDebugLog:Z

.field mDebugTag:Ljava/lang/String;

.field mPurchaseListener:Lcom/miniclip/googlebilling/IabHelper$OnIabPurchaseFinishedListener;

.field mRequestCode:I

.field mService:Lcom/android/vending/billing/IInAppBillingService;

.field mServiceConn:Landroid/content/ServiceConnection;

.field mSetupDone:Z

.field mSignatureBase64:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "base64PublicKey"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 166
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 89
    iput-boolean v1, p0, Lcom/miniclip/googlebilling/IabHelper;->mDebugLog:Z

    .line 90
    const-string v0, "IabHelper"

    iput-object v0, p0, Lcom/miniclip/googlebilling/IabHelper;->mDebugTag:Ljava/lang/String;

    .line 93
    iput-boolean v1, p0, Lcom/miniclip/googlebilling/IabHelper;->mSetupDone:Z

    .line 97
    iput-boolean v1, p0, Lcom/miniclip/googlebilling/IabHelper;->mAsyncInProgress:Z

    .line 101
    const-string v0, ""

    iput-object v0, p0, Lcom/miniclip/googlebilling/IabHelper;->mAsyncOperation:Ljava/lang/String;

    .line 114
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miniclip/googlebilling/IabHelper;->mSignatureBase64:Ljava/lang/String;

    .line 167
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/miniclip/googlebilling/IabHelper;->mContext:Landroid/content/Context;

    .line 168
    iput-object p2, p0, Lcom/miniclip/googlebilling/IabHelper;->mSignatureBase64:Ljava/lang/String;

    .line 169
    const-string v0, "IAB helper created."

    invoke-virtual {p0, v0}, Lcom/miniclip/googlebilling/IabHelper;->logDebug(Ljava/lang/String;)V

    .line 170
    return-void
.end method

.method public static getResponseDesc(I)Ljava/lang/String;
    .locals 5
    .param p0, "code"    # I

    .prologue
    .line 645
    const-string v3, "0:OK/1:User Canceled/2:Unknown/3:Billing Unavailable/4:Item unavailable/5:Developer Error/6:Error/7:Item Already Owned/8:Item not owned"

    const-string v4, "/"

    invoke-virtual {v3, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 649
    .local v0, "iab_msgs":[Ljava/lang/String;
    const-string v3, "0:OK/-1001:Remote exception during initialization/-1002:Bad response received/-1003:Purchase signature verification failed/-1004:Send intent failed/-1005:User cancelled/-1006:Unknown purchase response/-1007:Missing token/-1008:Unknown error"

    const-string v4, "/"

    invoke-virtual {v3, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 658
    .local v1, "iabhelper_msgs":[Ljava/lang/String;
    const/16 v3, -0x3e8

    if-gt p0, v3, :cond_1

    .line 659
    rsub-int v2, p0, -0x3e8

    .line 660
    .local v2, "index":I
    if-ltz v2, :cond_0

    array-length v3, v1

    if-ge v2, v3, :cond_0

    aget-object v3, v1, v2

    .line 666
    .end local v2    # "index":I
    :goto_0
    return-object v3

    .line 661
    .restart local v2    # "index":I
    :cond_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ":Unknown IAB Helper Error"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    .line 663
    .end local v2    # "index":I
    :cond_1
    if-ltz p0, :cond_2

    array-length v3, v0

    if-lt p0, v3, :cond_3

    .line 664
    :cond_2
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ":Unknown"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    .line 666
    :cond_3
    aget-object v3, v0, p0

    goto :goto_0
.end method


# virtual methods
.method checkSetupDone(Ljava/lang/String;)V
    .locals 3
    .param p1, "operation"    # Ljava/lang/String;

    .prologue
    .line 672
    iget-boolean v0, p0, Lcom/miniclip/googlebilling/IabHelper;->mSetupDone:Z

    if-nez v0, :cond_0

    .line 673
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Illegal state for operation ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "): IAB helper is not set up."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/miniclip/googlebilling/IabHelper;->logError(Ljava/lang/String;)V

    .line 674
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "IAB helper is not set up. Can\'t perform operation: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 676
    :cond_0
    return-void
.end method

.method consume(Lcom/miniclip/googlebilling/Purchase;)V
    .locals 8
    .param p1, "itemInfo"    # Lcom/miniclip/googlebilling/Purchase;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/miniclip/googlebilling/IabException;
        }
    .end annotation

    .prologue
    .line 560
    const-string v4, "consume"

    invoke-virtual {p0, v4}, Lcom/miniclip/googlebilling/IabHelper;->checkSetupDone(Ljava/lang/String;)V

    .line 562
    :try_start_0
    invoke-virtual {p1}, Lcom/miniclip/googlebilling/Purchase;->getToken()Ljava/lang/String;

    move-result-object v3

    .line 563
    .local v3, "token":Ljava/lang/String;
    invoke-virtual {p1}, Lcom/miniclip/googlebilling/Purchase;->getSku()Ljava/lang/String;

    move-result-object v2

    .line 564
    .local v2, "sku":Ljava/lang/String;
    if-eqz v3, :cond_0

    const-string v4, ""

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 565
    :cond_0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Can\'t consume "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ". No token."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/miniclip/googlebilling/IabHelper;->logError(Ljava/lang/String;)V

    .line 566
    new-instance v4, Lcom/miniclip/googlebilling/IabException;

    const/16 v5, -0x3ef

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "PurchaseInfo is missing token for sku: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Lcom/miniclip/googlebilling/IabException;-><init>(ILjava/lang/String;)V

    throw v4
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 580
    .end local v2    # "sku":Ljava/lang/String;
    .end local v3    # "token":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 581
    .local v0, "e":Landroid/os/RemoteException;
    new-instance v4, Lcom/miniclip/googlebilling/IabException;

    const/16 v5, -0x3e9

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Remote exception while consuming. PurchaseInfo: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v5, v6, v0}, Lcom/miniclip/googlebilling/IabException;-><init>(ILjava/lang/String;Ljava/lang/Exception;)V

    throw v4

    .line 570
    .end local v0    # "e":Landroid/os/RemoteException;
    .restart local v2    # "sku":Ljava/lang/String;
    .restart local v3    # "token":Ljava/lang/String;
    :cond_1
    :try_start_1
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Consuming sku: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", token: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/miniclip/googlebilling/IabHelper;->logDebug(Ljava/lang/String;)V

    .line 571
    iget-object v4, p0, Lcom/miniclip/googlebilling/IabHelper;->mService:Lcom/android/vending/billing/IInAppBillingService;

    const/4 v5, 0x3

    iget-object v6, p0, Lcom/miniclip/googlebilling/IabHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v4, v5, v6, v3}, Lcom/android/vending/billing/IInAppBillingService;->consumePurchase(ILjava/lang/String;Ljava/lang/String;)I

    move-result v1

    .line 572
    .local v1, "response":I
    if-nez v1, :cond_2

    .line 573
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Successfully consumed sku: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/miniclip/googlebilling/IabHelper;->logDebug(Ljava/lang/String;)V

    .line 583
    return-void

    .line 576
    :cond_2
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Error consuming consuming sku "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ". "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {v1}, Lcom/miniclip/googlebilling/IabHelper;->getResponseDesc(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/miniclip/googlebilling/IabHelper;->logDebug(Ljava/lang/String;)V

    .line 577
    new-instance v4, Lcom/miniclip/googlebilling/IabException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Error consuming sku "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v1, v5}, Lcom/miniclip/googlebilling/IabException;-><init>(ILjava/lang/String;)V

    throw v4
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0
.end method

.method public consumeAsync(Lcom/miniclip/googlebilling/Purchase;Lcom/miniclip/googlebilling/IabHelper$OnConsumeFinishedListener;)V
    .locals 2
    .param p1, "purchase"    # Lcom/miniclip/googlebilling/Purchase;
    .param p2, "listener"    # Lcom/miniclip/googlebilling/IabHelper$OnConsumeFinishedListener;

    .prologue
    .line 621
    const-string v1, "consume"

    invoke-virtual {p0, v1}, Lcom/miniclip/googlebilling/IabHelper;->checkSetupDone(Ljava/lang/String;)V

    .line 622
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 623
    .local v0, "purchases":Ljava/util/List;, "Ljava/util/List<Lcom/miniclip/googlebilling/Purchase;>;"
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 624
    const/4 v1, 0x0

    invoke-virtual {p0, v0, p2, v1}, Lcom/miniclip/googlebilling/IabHelper;->consumeAsyncInternal(Ljava/util/List;Lcom/miniclip/googlebilling/IabHelper$OnConsumeFinishedListener;Lcom/miniclip/googlebilling/IabHelper$OnConsumeMultiFinishedListener;)V

    .line 625
    return-void
.end method

.method public consumeAsync(Ljava/util/List;Lcom/miniclip/googlebilling/IabHelper$OnConsumeMultiFinishedListener;)V
    .locals 1
    .param p2, "listener"    # Lcom/miniclip/googlebilling/IabHelper$OnConsumeMultiFinishedListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/miniclip/googlebilling/Purchase;",
            ">;",
            "Lcom/miniclip/googlebilling/IabHelper$OnConsumeMultiFinishedListener;",
            ")V"
        }
    .end annotation

    .prologue
    .line 633
    .local p1, "purchases":Ljava/util/List;, "Ljava/util/List<Lcom/miniclip/googlebilling/Purchase;>;"
    const-string v0, "consume"

    invoke-virtual {p0, v0}, Lcom/miniclip/googlebilling/IabHelper;->checkSetupDone(Ljava/lang/String;)V

    .line 634
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, p2}, Lcom/miniclip/googlebilling/IabHelper;->consumeAsyncInternal(Ljava/util/List;Lcom/miniclip/googlebilling/IabHelper$OnConsumeFinishedListener;Lcom/miniclip/googlebilling/IabHelper$OnConsumeMultiFinishedListener;)V

    .line 635
    return-void
.end method

.method consumeAsyncInternal(Ljava/util/List;Lcom/miniclip/googlebilling/IabHelper$OnConsumeFinishedListener;Lcom/miniclip/googlebilling/IabHelper$OnConsumeMultiFinishedListener;)V
    .locals 7
    .param p2, "singleListener"    # Lcom/miniclip/googlebilling/IabHelper$OnConsumeFinishedListener;
    .param p3, "multiListener"    # Lcom/miniclip/googlebilling/IabHelper$OnConsumeMultiFinishedListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/miniclip/googlebilling/Purchase;",
            ">;",
            "Lcom/miniclip/googlebilling/IabHelper$OnConsumeFinishedListener;",
            "Lcom/miniclip/googlebilling/IabHelper$OnConsumeMultiFinishedListener;",
            ")V"
        }
    .end annotation

    .prologue
    .line 855
    .local p1, "purchases":Ljava/util/List;, "Ljava/util/List<Lcom/miniclip/googlebilling/Purchase;>;"
    new-instance v4, Landroid/os/Handler;

    invoke-direct {v4}, Landroid/os/Handler;-><init>()V

    .line 856
    .local v4, "handler":Landroid/os/Handler;
    const-string v0, "consume"

    invoke-virtual {p0, v0}, Lcom/miniclip/googlebilling/IabHelper;->flagStartAsync(Ljava/lang/String;)V

    .line 857
    new-instance v6, Ljava/lang/Thread;

    new-instance v0, Lcom/miniclip/googlebilling/IabHelper$3;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/miniclip/googlebilling/IabHelper$3;-><init>(Lcom/miniclip/googlebilling/IabHelper;Ljava/util/List;Lcom/miniclip/googlebilling/IabHelper$OnConsumeFinishedListener;Landroid/os/Handler;Lcom/miniclip/googlebilling/IabHelper$OnConsumeMultiFinishedListener;)V

    invoke-direct {v6, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v6}, Ljava/lang/Thread;->start()V

    .line 887
    return-void
.end method

.method public dispose()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 257
    const-string v0, "Disposing."

    invoke-virtual {p0, v0}, Lcom/miniclip/googlebilling/IabHelper;->logDebug(Ljava/lang/String;)V

    .line 258
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miniclip/googlebilling/IabHelper;->mSetupDone:Z

    .line 259
    iget-object v0, p0, Lcom/miniclip/googlebilling/IabHelper;->mServiceConn:Landroid/content/ServiceConnection;

    if-eqz v0, :cond_1

    .line 260
    const-string v0, "Unbinding from service."

    invoke-virtual {p0, v0}, Lcom/miniclip/googlebilling/IabHelper;->logDebug(Ljava/lang/String;)V

    .line 261
    iget-object v0, p0, Lcom/miniclip/googlebilling/IabHelper;->mContext:Landroid/content/Context;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miniclip/googlebilling/IabHelper;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/miniclip/googlebilling/IabHelper;->mServiceConn:Landroid/content/ServiceConnection;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V

    .line 262
    :cond_0
    iput-object v2, p0, Lcom/miniclip/googlebilling/IabHelper;->mServiceConn:Landroid/content/ServiceConnection;

    .line 263
    iput-object v2, p0, Lcom/miniclip/googlebilling/IabHelper;->mService:Lcom/android/vending/billing/IInAppBillingService;

    .line 264
    iput-object v2, p0, Lcom/miniclip/googlebilling/IabHelper;->mPurchaseListener:Lcom/miniclip/googlebilling/IabHelper$OnIabPurchaseFinishedListener;

    .line 266
    :cond_1
    return-void
.end method

.method public enableDebugLogging(Z)V
    .locals 0
    .param p1, "enable"    # Z

    .prologue
    .line 181
    iput-boolean p1, p0, Lcom/miniclip/googlebilling/IabHelper;->mDebugLog:Z

    .line 182
    return-void
.end method

.method public enableDebugLogging(ZLjava/lang/String;)V
    .locals 0
    .param p1, "enable"    # Z
    .param p2, "tag"    # Ljava/lang/String;

    .prologue
    .line 176
    iput-boolean p1, p0, Lcom/miniclip/googlebilling/IabHelper;->mDebugLog:Z

    .line 177
    iput-object p2, p0, Lcom/miniclip/googlebilling/IabHelper;->mDebugTag:Ljava/lang/String;

    .line 178
    return-void
.end method

.method flagEndAsync()V
    .locals 2

    .prologue
    .line 719
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Ending async operation: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/miniclip/googlebilling/IabHelper;->mAsyncOperation:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/miniclip/googlebilling/IabHelper;->logDebug(Ljava/lang/String;)V

    .line 720
    const-string v0, ""

    iput-object v0, p0, Lcom/miniclip/googlebilling/IabHelper;->mAsyncOperation:Ljava/lang/String;

    .line 721
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miniclip/googlebilling/IabHelper;->mAsyncInProgress:Z

    .line 722
    return-void
.end method

.method flagStartAsync(Ljava/lang/String;)V
    .locals 3
    .param p1, "operation"    # Ljava/lang/String;

    .prologue
    .line 711
    iget-boolean v0, p0, Lcom/miniclip/googlebilling/IabHelper;->mAsyncInProgress:Z

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Can\'t start async operation ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ") because another async operation("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/miniclip/googlebilling/IabHelper;->mAsyncOperation:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ") is in progress."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 713
    :cond_0
    iput-object p1, p0, Lcom/miniclip/googlebilling/IabHelper;->mAsyncOperation:Ljava/lang/String;

    .line 714
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miniclip/googlebilling/IabHelper;->mAsyncInProgress:Z

    .line 715
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Starting async operation: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/miniclip/googlebilling/IabHelper;->logDebug(Ljava/lang/String;)V

    .line 716
    return-void
.end method

.method getResponseCodeFromBundle(Landroid/os/Bundle;)I
    .locals 4
    .param p1, "b"    # Landroid/os/Bundle;

    .prologue
    .line 680
    const-string v1, "RESPONSE_CODE"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 681
    .local v0, "o":Ljava/lang/Object;
    if-nez v0, :cond_0

    .line 682
    const-string v1, "Bundle with null response code, assuming OK (known issue)"

    invoke-virtual {p0, v1}, Lcom/miniclip/googlebilling/IabHelper;->logDebug(Ljava/lang/String;)V

    .line 683
    const/4 v1, 0x0

    .line 686
    .end local v0    # "o":Ljava/lang/Object;
    :goto_0
    return v1

    .line 685
    .restart local v0    # "o":Ljava/lang/Object;
    :cond_0
    instance-of v1, v0, Ljava/lang/Integer;

    if-eqz v1, :cond_1

    check-cast v0, Ljava/lang/Integer;

    .end local v0    # "o":Ljava/lang/Object;
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    goto :goto_0

    .line 686
    .restart local v0    # "o":Ljava/lang/Object;
    :cond_1
    instance-of v1, v0, Ljava/lang/Long;

    if-eqz v1, :cond_2

    check-cast v0, Ljava/lang/Long;

    .end local v0    # "o":Ljava/lang/Object;
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    long-to-int v1, v1

    goto :goto_0

    .line 688
    .restart local v0    # "o":Ljava/lang/Object;
    :cond_2
    const-string v1, "Unexpected type for bundle response code."

    invoke-virtual {p0, v1}, Lcom/miniclip/googlebilling/IabHelper;->logError(Ljava/lang/String;)V

    .line 689
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/miniclip/googlebilling/IabHelper;->logError(Ljava/lang/String;)V

    .line 690
    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unexpected type for bundle response code: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method getResponseCodeFromIntent(Landroid/content/Intent;)I
    .locals 4
    .param p1, "i"    # Landroid/content/Intent;

    .prologue
    .line 696
    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v1

    const-string v2, "RESPONSE_CODE"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 697
    .local v0, "o":Ljava/lang/Object;
    if-nez v0, :cond_0

    .line 698
    const-string v1, "Intent with no response code, assuming OK (known issue)"

    invoke-virtual {p0, v1}, Lcom/miniclip/googlebilling/IabHelper;->logError(Ljava/lang/String;)V

    .line 699
    const/4 v1, 0x0

    .line 702
    .end local v0    # "o":Ljava/lang/Object;
    :goto_0
    return v1

    .line 701
    .restart local v0    # "o":Ljava/lang/Object;
    :cond_0
    instance-of v1, v0, Ljava/lang/Integer;

    if-eqz v1, :cond_1

    check-cast v0, Ljava/lang/Integer;

    .end local v0    # "o":Ljava/lang/Object;
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    goto :goto_0

    .line 702
    .restart local v0    # "o":Ljava/lang/Object;
    :cond_1
    instance-of v1, v0, Ljava/lang/Long;

    if-eqz v1, :cond_2

    check-cast v0, Ljava/lang/Long;

    .end local v0    # "o":Ljava/lang/Object;
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    long-to-int v1, v1

    goto :goto_0

    .line 704
    .restart local v0    # "o":Ljava/lang/Object;
    :cond_2
    const-string v1, "Unexpected type for intent response code."

    invoke-virtual {p0, v1}, Lcom/miniclip/googlebilling/IabHelper;->logError(Ljava/lang/String;)V

    .line 705
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/miniclip/googlebilling/IabHelper;->logError(Ljava/lang/String;)V

    .line 706
    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unexpected type for intent response code: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public handleActivityResult(IILandroid/content/Intent;)Z
    .locals 12
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 371
    iget v8, p0, Lcom/miniclip/googlebilling/IabHelper;->mRequestCode:I

    if-eq p1, v8, :cond_0

    const/4 v8, 0x0

    .line 448
    :goto_0
    return v8

    .line 373
    :cond_0
    const-string v8, "handleActivityResult"

    invoke-virtual {p0, v8}, Lcom/miniclip/googlebilling/IabHelper;->checkSetupDone(Ljava/lang/String;)V

    .line 376
    invoke-virtual {p0}, Lcom/miniclip/googlebilling/IabHelper;->flagEndAsync()V

    .line 378
    if-nez p3, :cond_2

    .line 379
    const-string v8, "Null data in IAB activity result."

    invoke-virtual {p0, v8}, Lcom/miniclip/googlebilling/IabHelper;->logError(Ljava/lang/String;)V

    .line 380
    new-instance v6, Lcom/miniclip/googlebilling/IabResult;

    const/16 v8, -0x3ea

    const-string v9, "Null data in IAB result"

    invoke-direct {v6, v8, v9}, Lcom/miniclip/googlebilling/IabResult;-><init>(ILjava/lang/String;)V

    .line 381
    .local v6, "result":Lcom/miniclip/googlebilling/IabResult;
    iget-object v8, p0, Lcom/miniclip/googlebilling/IabHelper;->mPurchaseListener:Lcom/miniclip/googlebilling/IabHelper$OnIabPurchaseFinishedListener;

    if-eqz v8, :cond_1

    iget-object v8, p0, Lcom/miniclip/googlebilling/IabHelper;->mPurchaseListener:Lcom/miniclip/googlebilling/IabHelper$OnIabPurchaseFinishedListener;

    const/4 v9, 0x0

    invoke-interface {v8, v6, v9}, Lcom/miniclip/googlebilling/IabHelper$OnIabPurchaseFinishedListener;->onIabPurchaseFinished(Lcom/miniclip/googlebilling/IabResult;Lcom/miniclip/googlebilling/Purchase;)V

    .line 382
    :cond_1
    const/4 v8, 0x1

    goto :goto_0

    .line 385
    .end local v6    # "result":Lcom/miniclip/googlebilling/IabResult;
    :cond_2
    invoke-virtual {p0, p3}, Lcom/miniclip/googlebilling/IabHelper;->getResponseCodeFromIntent(Landroid/content/Intent;)I

    move-result v5

    .line 386
    .local v5, "responseCode":I
    const-string v8, "INAPP_PURCHASE_DATA"

    invoke-virtual {p3, v8}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 387
    .local v4, "purchaseData":Ljava/lang/String;
    const-string v8, "INAPP_DATA_SIGNATURE"

    invoke-virtual {p3, v8}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 389
    .local v0, "dataSignature":Ljava/lang/String;
    const/4 v8, -0x1

    if-ne p2, v8, :cond_a

    if-nez v5, :cond_a

    .line 390
    const-string v8, "Successful resultcode from purchase activity."

    invoke-virtual {p0, v8}, Lcom/miniclip/googlebilling/IabHelper;->logDebug(Ljava/lang/String;)V

    .line 391
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Purchase data: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v8}, Lcom/miniclip/googlebilling/IabHelper;->logDebug(Ljava/lang/String;)V

    .line 392
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Data signature: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v8}, Lcom/miniclip/googlebilling/IabHelper;->logDebug(Ljava/lang/String;)V

    .line 393
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Extras: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {p3}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v8}, Lcom/miniclip/googlebilling/IabHelper;->logDebug(Ljava/lang/String;)V

    .line 395
    if-eqz v4, :cond_3

    if-nez v0, :cond_5

    .line 396
    :cond_3
    const-string v8, "BUG: either purchaseData or dataSignature is null."

    invoke-virtual {p0, v8}, Lcom/miniclip/googlebilling/IabHelper;->logError(Ljava/lang/String;)V

    .line 397
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Extras: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {p3}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v9

    invoke-virtual {v9}, Landroid/os/Bundle;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v8}, Lcom/miniclip/googlebilling/IabHelper;->logDebug(Ljava/lang/String;)V

    .line 398
    new-instance v6, Lcom/miniclip/googlebilling/IabResult;

    const/16 v8, -0x3f0

    const-string v9, "IAB returned null purchaseData or dataSignature"

    invoke-direct {v6, v8, v9}, Lcom/miniclip/googlebilling/IabResult;-><init>(ILjava/lang/String;)V

    .line 399
    .restart local v6    # "result":Lcom/miniclip/googlebilling/IabResult;
    iget-object v8, p0, Lcom/miniclip/googlebilling/IabHelper;->mPurchaseListener:Lcom/miniclip/googlebilling/IabHelper$OnIabPurchaseFinishedListener;

    if-eqz v8, :cond_4

    iget-object v8, p0, Lcom/miniclip/googlebilling/IabHelper;->mPurchaseListener:Lcom/miniclip/googlebilling/IabHelper$OnIabPurchaseFinishedListener;

    const/4 v9, 0x0

    invoke-interface {v8, v6, v9}, Lcom/miniclip/googlebilling/IabHelper$OnIabPurchaseFinishedListener;->onIabPurchaseFinished(Lcom/miniclip/googlebilling/IabResult;Lcom/miniclip/googlebilling/Purchase;)V

    .line 400
    :cond_4
    const/4 v8, 0x1

    goto/16 :goto_0

    .line 403
    .end local v6    # "result":Lcom/miniclip/googlebilling/IabResult;
    :cond_5
    const/4 v2, 0x0

    .line 405
    .local v2, "purchase":Lcom/miniclip/googlebilling/Purchase;
    :try_start_0
    new-instance v3, Lcom/miniclip/googlebilling/Purchase;

    invoke-direct {v3, v4, v0}, Lcom/miniclip/googlebilling/Purchase;-><init>(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 406
    .end local v2    # "purchase":Lcom/miniclip/googlebilling/Purchase;
    .local v3, "purchase":Lcom/miniclip/googlebilling/Purchase;
    :try_start_1
    invoke-virtual {v3}, Lcom/miniclip/googlebilling/Purchase;->getSku()Ljava/lang/String;

    move-result-object v7

    .line 409
    .local v7, "sku":Ljava/lang/String;
    iget-object v8, p0, Lcom/miniclip/googlebilling/IabHelper;->mSignatureBase64:Ljava/lang/String;

    invoke-static {v8, v4, v0}, Lcom/miniclip/googlebilling/Security;->verifyPurchase(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_7

    .line 410
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Purchase signature verification FAILED for sku "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v8}, Lcom/miniclip/googlebilling/IabHelper;->logError(Ljava/lang/String;)V

    .line 411
    new-instance v6, Lcom/miniclip/googlebilling/IabResult;

    const/16 v8, -0x3eb

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Signature verification failed for sku "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v6, v8, v9}, Lcom/miniclip/googlebilling/IabResult;-><init>(ILjava/lang/String;)V

    .line 412
    .restart local v6    # "result":Lcom/miniclip/googlebilling/IabResult;
    iget-object v8, p0, Lcom/miniclip/googlebilling/IabHelper;->mPurchaseListener:Lcom/miniclip/googlebilling/IabHelper$OnIabPurchaseFinishedListener;

    if-eqz v8, :cond_6

    iget-object v8, p0, Lcom/miniclip/googlebilling/IabHelper;->mPurchaseListener:Lcom/miniclip/googlebilling/IabHelper$OnIabPurchaseFinishedListener;

    invoke-interface {v8, v6, v3}, Lcom/miniclip/googlebilling/IabHelper$OnIabPurchaseFinishedListener;->onIabPurchaseFinished(Lcom/miniclip/googlebilling/IabResult;Lcom/miniclip/googlebilling/Purchase;)V

    .line 413
    :cond_6
    const/4 v8, 0x1

    goto/16 :goto_0

    .line 415
    .end local v6    # "result":Lcom/miniclip/googlebilling/IabResult;
    :cond_7
    const-string v8, "Purchase signature successfully verified."

    invoke-virtual {p0, v8}, Lcom/miniclip/googlebilling/IabHelper;->logDebug(Ljava/lang/String;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    .line 425
    iget-object v8, p0, Lcom/miniclip/googlebilling/IabHelper;->mPurchaseListener:Lcom/miniclip/googlebilling/IabHelper$OnIabPurchaseFinishedListener;

    if-eqz v8, :cond_8

    .line 426
    iget-object v8, p0, Lcom/miniclip/googlebilling/IabHelper;->mPurchaseListener:Lcom/miniclip/googlebilling/IabHelper$OnIabPurchaseFinishedListener;

    new-instance v9, Lcom/miniclip/googlebilling/IabResult;

    const/4 v10, 0x0

    const-string v11, "Success"

    invoke-direct {v9, v10, v11}, Lcom/miniclip/googlebilling/IabResult;-><init>(ILjava/lang/String;)V

    invoke-interface {v8, v9, v3}, Lcom/miniclip/googlebilling/IabHelper$OnIabPurchaseFinishedListener;->onIabPurchaseFinished(Lcom/miniclip/googlebilling/IabResult;Lcom/miniclip/googlebilling/Purchase;)V

    .line 448
    .end local v3    # "purchase":Lcom/miniclip/googlebilling/Purchase;
    .end local v7    # "sku":Ljava/lang/String;
    :cond_8
    :goto_1
    const/4 v8, 0x1

    goto/16 :goto_0

    .line 417
    .restart local v2    # "purchase":Lcom/miniclip/googlebilling/Purchase;
    :catch_0
    move-exception v1

    .line 418
    .local v1, "e":Lorg/json/JSONException;
    :goto_2
    const-string v8, "Failed to parse purchase data."

    invoke-virtual {p0, v8}, Lcom/miniclip/googlebilling/IabHelper;->logError(Ljava/lang/String;)V

    .line 419
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    .line 420
    new-instance v6, Lcom/miniclip/googlebilling/IabResult;

    const/16 v8, -0x3ea

    const-string v9, "Failed to parse purchase data."

    invoke-direct {v6, v8, v9}, Lcom/miniclip/googlebilling/IabResult;-><init>(ILjava/lang/String;)V

    .line 421
    .restart local v6    # "result":Lcom/miniclip/googlebilling/IabResult;
    iget-object v8, p0, Lcom/miniclip/googlebilling/IabHelper;->mPurchaseListener:Lcom/miniclip/googlebilling/IabHelper$OnIabPurchaseFinishedListener;

    if-eqz v8, :cond_9

    iget-object v8, p0, Lcom/miniclip/googlebilling/IabHelper;->mPurchaseListener:Lcom/miniclip/googlebilling/IabHelper$OnIabPurchaseFinishedListener;

    const/4 v9, 0x0

    invoke-interface {v8, v6, v9}, Lcom/miniclip/googlebilling/IabHelper$OnIabPurchaseFinishedListener;->onIabPurchaseFinished(Lcom/miniclip/googlebilling/IabResult;Lcom/miniclip/googlebilling/Purchase;)V

    .line 422
    :cond_9
    const/4 v8, 0x1

    goto/16 :goto_0

    .line 429
    .end local v1    # "e":Lorg/json/JSONException;
    .end local v2    # "purchase":Lcom/miniclip/googlebilling/Purchase;
    .end local v6    # "result":Lcom/miniclip/googlebilling/IabResult;
    :cond_a
    const/4 v8, -0x1

    if-ne p2, v8, :cond_b

    .line 431
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Result code was OK but in-app billing response was not OK: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-static {v5}, Lcom/miniclip/googlebilling/IabHelper;->getResponseDesc(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v8}, Lcom/miniclip/googlebilling/IabHelper;->logDebug(Ljava/lang/String;)V

    .line 432
    iget-object v8, p0, Lcom/miniclip/googlebilling/IabHelper;->mPurchaseListener:Lcom/miniclip/googlebilling/IabHelper$OnIabPurchaseFinishedListener;

    if-eqz v8, :cond_8

    .line 433
    new-instance v6, Lcom/miniclip/googlebilling/IabResult;

    const-string v8, "Problem purchashing item."

    invoke-direct {v6, v5, v8}, Lcom/miniclip/googlebilling/IabResult;-><init>(ILjava/lang/String;)V

    .line 434
    .restart local v6    # "result":Lcom/miniclip/googlebilling/IabResult;
    iget-object v8, p0, Lcom/miniclip/googlebilling/IabHelper;->mPurchaseListener:Lcom/miniclip/googlebilling/IabHelper$OnIabPurchaseFinishedListener;

    const/4 v9, 0x0

    invoke-interface {v8, v6, v9}, Lcom/miniclip/googlebilling/IabHelper$OnIabPurchaseFinishedListener;->onIabPurchaseFinished(Lcom/miniclip/googlebilling/IabResult;Lcom/miniclip/googlebilling/Purchase;)V

    goto :goto_1

    .line 437
    .end local v6    # "result":Lcom/miniclip/googlebilling/IabResult;
    :cond_b
    if-nez p2, :cond_c

    .line 438
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Purchase canceled - Response: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-static {v5}, Lcom/miniclip/googlebilling/IabHelper;->getResponseDesc(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v8}, Lcom/miniclip/googlebilling/IabHelper;->logDebug(Ljava/lang/String;)V

    .line 439
    new-instance v6, Lcom/miniclip/googlebilling/IabResult;

    const/16 v8, -0x3ed

    const-string v9, "User canceled."

    invoke-direct {v6, v8, v9}, Lcom/miniclip/googlebilling/IabResult;-><init>(ILjava/lang/String;)V

    .line 440
    .restart local v6    # "result":Lcom/miniclip/googlebilling/IabResult;
    iget-object v8, p0, Lcom/miniclip/googlebilling/IabHelper;->mPurchaseListener:Lcom/miniclip/googlebilling/IabHelper$OnIabPurchaseFinishedListener;

    if-eqz v8, :cond_8

    iget-object v8, p0, Lcom/miniclip/googlebilling/IabHelper;->mPurchaseListener:Lcom/miniclip/googlebilling/IabHelper$OnIabPurchaseFinishedListener;

    const/4 v9, 0x0

    invoke-interface {v8, v6, v9}, Lcom/miniclip/googlebilling/IabHelper$OnIabPurchaseFinishedListener;->onIabPurchaseFinished(Lcom/miniclip/googlebilling/IabResult;Lcom/miniclip/googlebilling/Purchase;)V

    goto :goto_1

    .line 443
    .end local v6    # "result":Lcom/miniclip/googlebilling/IabResult;
    :cond_c
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Purchase failed. Result code: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-static {p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ". Response: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-static {v5}, Lcom/miniclip/googlebilling/IabHelper;->getResponseDesc(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v8}, Lcom/miniclip/googlebilling/IabHelper;->logError(Ljava/lang/String;)V

    .line 445
    new-instance v6, Lcom/miniclip/googlebilling/IabResult;

    const/16 v8, -0x3ee

    const-string v9, "Unknown purchase response."

    invoke-direct {v6, v8, v9}, Lcom/miniclip/googlebilling/IabResult;-><init>(ILjava/lang/String;)V

    .line 446
    .restart local v6    # "result":Lcom/miniclip/googlebilling/IabResult;
    iget-object v8, p0, Lcom/miniclip/googlebilling/IabHelper;->mPurchaseListener:Lcom/miniclip/googlebilling/IabHelper$OnIabPurchaseFinishedListener;

    if-eqz v8, :cond_8

    iget-object v8, p0, Lcom/miniclip/googlebilling/IabHelper;->mPurchaseListener:Lcom/miniclip/googlebilling/IabHelper$OnIabPurchaseFinishedListener;

    const/4 v9, 0x0

    invoke-interface {v8, v6, v9}, Lcom/miniclip/googlebilling/IabHelper$OnIabPurchaseFinishedListener;->onIabPurchaseFinished(Lcom/miniclip/googlebilling/IabResult;Lcom/miniclip/googlebilling/Purchase;)V

    goto/16 :goto_1

    .line 417
    .end local v6    # "result":Lcom/miniclip/googlebilling/IabResult;
    .restart local v3    # "purchase":Lcom/miniclip/googlebilling/Purchase;
    :catch_1
    move-exception v1

    move-object v2, v3

    .end local v3    # "purchase":Lcom/miniclip/googlebilling/Purchase;
    .restart local v2    # "purchase":Lcom/miniclip/googlebilling/Purchase;
    goto/16 :goto_2
.end method

.method public launchPurchaseFlow(Landroid/app/Activity;Ljava/lang/String;ILcom/miniclip/googlebilling/IabHelper$OnIabPurchaseFinishedListener;)V
    .locals 6
    .param p1, "act"    # Landroid/app/Activity;
    .param p2, "sku"    # Ljava/lang/String;
    .param p3, "requestCode"    # I
    .param p4, "listener"    # Lcom/miniclip/googlebilling/IabHelper$OnIabPurchaseFinishedListener;

    .prologue
    .line 294
    const-string v5, ""

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move-object v4, p4

    invoke-virtual/range {v0 .. v5}, Lcom/miniclip/googlebilling/IabHelper;->launchPurchaseFlow(Landroid/app/Activity;Ljava/lang/String;ILcom/miniclip/googlebilling/IabHelper$OnIabPurchaseFinishedListener;Ljava/lang/String;)V

    .line 295
    return-void
.end method

.method public launchPurchaseFlow(Landroid/app/Activity;Ljava/lang/String;ILcom/miniclip/googlebilling/IabHelper$OnIabPurchaseFinishedListener;Ljava/lang/String;)V
    .locals 13
    .param p1, "act"    # Landroid/app/Activity;
    .param p2, "sku"    # Ljava/lang/String;
    .param p3, "requestCode"    # I
    .param p4, "listener"    # Lcom/miniclip/googlebilling/IabHelper$OnIabPurchaseFinishedListener;
    .param p5, "extraData"    # Ljava/lang/String;

    .prologue
    .line 315
    const-string v1, "launchPurchaseFlow"

    invoke-virtual {p0, v1}, Lcom/miniclip/googlebilling/IabHelper;->checkSetupDone(Ljava/lang/String;)V

    .line 316
    const-string v1, "launchPurchaseFlow"

    invoke-virtual {p0, v1}, Lcom/miniclip/googlebilling/IabHelper;->flagStartAsync(Ljava/lang/String;)V

    .line 320
    :try_start_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Constructing buy intent for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/miniclip/googlebilling/IabHelper;->logDebug(Ljava/lang/String;)V

    .line 321
    iget-object v1, p0, Lcom/miniclip/googlebilling/IabHelper;->mService:Lcom/android/vending/billing/IInAppBillingService;

    const/4 v2, 0x3

    iget-object v3, p0, Lcom/miniclip/googlebilling/IabHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    const-string v5, "inapp"

    move-object v4, p2

    move-object/from16 v6, p5

    invoke-interface/range {v1 .. v6}, Lcom/android/vending/billing/IInAppBillingService;->getBuyIntent(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v8

    .line 322
    .local v8, "buyIntentBundle":Landroid/os/Bundle;
    invoke-virtual {p0, v8}, Lcom/miniclip/googlebilling/IabHelper;->getResponseCodeFromBundle(Landroid/os/Bundle;)I

    move-result v11

    .line 323
    .local v11, "response":I
    if-eqz v11, :cond_1

    .line 324
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unable to buy item, Error response: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {v11}, Lcom/miniclip/googlebilling/IabHelper;->getResponseDesc(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/miniclip/googlebilling/IabHelper;->logError(Ljava/lang/String;)V

    .line 326
    new-instance v12, Lcom/miniclip/googlebilling/IabResult;

    const-string v1, "Unable to buy item"

    invoke-direct {v12, v11, v1}, Lcom/miniclip/googlebilling/IabResult;-><init>(ILjava/lang/String;)V

    .line 327
    .local v12, "result":Lcom/miniclip/googlebilling/IabResult;
    if-eqz p4, :cond_0

    const/4 v1, 0x0

    move-object/from16 v0, p4

    invoke-interface {v0, v12, v1}, Lcom/miniclip/googlebilling/IabHelper$OnIabPurchaseFinishedListener;->onIabPurchaseFinished(Lcom/miniclip/googlebilling/IabResult;Lcom/miniclip/googlebilling/Purchase;)V

    .line 354
    .end local v8    # "buyIntentBundle":Landroid/os/Bundle;
    .end local v11    # "response":I
    .end local v12    # "result":Lcom/miniclip/googlebilling/IabResult;
    :cond_0
    :goto_0
    return-void

    .line 331
    .restart local v8    # "buyIntentBundle":Landroid/os/Bundle;
    .restart local v11    # "response":I
    :cond_1
    const-string v1, "BUY_INTENT"

    invoke-virtual {v8, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v10

    check-cast v10, Landroid/app/PendingIntent;

    .line 332
    .local v10, "pendingIntent":Landroid/app/PendingIntent;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Launching buy intent for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ". Request code: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    move/from16 v0, p3

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/miniclip/googlebilling/IabHelper;->logDebug(Ljava/lang/String;)V

    .line 333
    move/from16 v0, p3

    iput v0, p0, Lcom/miniclip/googlebilling/IabHelper;->mRequestCode:I

    .line 334
    move-object/from16 v0, p4

    iput-object v0, p0, Lcom/miniclip/googlebilling/IabHelper;->mPurchaseListener:Lcom/miniclip/googlebilling/IabHelper$OnIabPurchaseFinishedListener;

    .line 335
    invoke-virtual {v10}, Landroid/app/PendingIntent;->getIntentSender()Landroid/content/IntentSender;

    move-result-object v2

    new-instance v4, Landroid/content/Intent;

    invoke-direct {v4}, Landroid/content/Intent;-><init>()V

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v5

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v6

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v7

    move-object v1, p1

    move/from16 v3, p3

    invoke-virtual/range {v1 .. v7}, Landroid/app/Activity;->startIntentSenderForResult(Landroid/content/IntentSender;ILandroid/content/Intent;III)V
    :try_end_0
    .catch Landroid/content/IntentSender$SendIntentException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 340
    .end local v8    # "buyIntentBundle":Landroid/os/Bundle;
    .end local v10    # "pendingIntent":Landroid/app/PendingIntent;
    .end local v11    # "response":I
    :catch_0
    move-exception v9

    .line 341
    .local v9, "e":Landroid/content/IntentSender$SendIntentException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "SendIntentException while launching purchase flow for sku "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/miniclip/googlebilling/IabHelper;->logError(Ljava/lang/String;)V

    .line 342
    invoke-virtual {v9}, Landroid/content/IntentSender$SendIntentException;->printStackTrace()V

    .line 344
    new-instance v12, Lcom/miniclip/googlebilling/IabResult;

    const/16 v1, -0x3ec

    const-string v2, "Failed to send intent."

    invoke-direct {v12, v1, v2}, Lcom/miniclip/googlebilling/IabResult;-><init>(ILjava/lang/String;)V

    .line 345
    .restart local v12    # "result":Lcom/miniclip/googlebilling/IabResult;
    if-eqz p4, :cond_0

    const/4 v1, 0x0

    move-object/from16 v0, p4

    invoke-interface {v0, v12, v1}, Lcom/miniclip/googlebilling/IabHelper$OnIabPurchaseFinishedListener;->onIabPurchaseFinished(Lcom/miniclip/googlebilling/IabResult;Lcom/miniclip/googlebilling/Purchase;)V

    goto/16 :goto_0

    .line 347
    .end local v9    # "e":Landroid/content/IntentSender$SendIntentException;
    .end local v12    # "result":Lcom/miniclip/googlebilling/IabResult;
    :catch_1
    move-exception v9

    .line 348
    .local v9, "e":Landroid/os/RemoteException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "RemoteException while launching purchase flow for sku "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/miniclip/googlebilling/IabHelper;->logError(Ljava/lang/String;)V

    .line 349
    invoke-virtual {v9}, Landroid/os/RemoteException;->printStackTrace()V

    .line 351
    new-instance v12, Lcom/miniclip/googlebilling/IabResult;

    const/16 v1, -0x3e9

    const-string v2, "Remote exception while starting purchase flow"

    invoke-direct {v12, v1, v2}, Lcom/miniclip/googlebilling/IabResult;-><init>(ILjava/lang/String;)V

    .line 352
    .restart local v12    # "result":Lcom/miniclip/googlebilling/IabResult;
    if-eqz p4, :cond_0

    const/4 v1, 0x0

    move-object/from16 v0, p4

    invoke-interface {v0, v12, v1}, Lcom/miniclip/googlebilling/IabHelper$OnIabPurchaseFinishedListener;->onIabPurchaseFinished(Lcom/miniclip/googlebilling/IabResult;Lcom/miniclip/googlebilling/Purchase;)V

    goto/16 :goto_0
.end method

.method logDebug(Ljava/lang/String;)V
    .locals 1
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 890
    iget-boolean v0, p0, Lcom/miniclip/googlebilling/IabHelper;->mDebugLog:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miniclip/googlebilling/IabHelper;->mDebugTag:Ljava/lang/String;

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 891
    :cond_0
    return-void
.end method

.method logError(Ljava/lang/String;)V
    .locals 3
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 894
    iget-object v0, p0, Lcom/miniclip/googlebilling/IabHelper;->mDebugTag:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "In-app billing error: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 895
    return-void
.end method

.method logWarn(Ljava/lang/String;)V
    .locals 3
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 898
    iget-object v0, p0, Lcom/miniclip/googlebilling/IabHelper;->mDebugTag:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "In-app billing warning: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 899
    return-void
.end method

.method public queryInventory(ZLjava/util/List;)Lcom/miniclip/googlebilling/Inventory;
    .locals 6
    .param p1, "querySkuDetails"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/miniclip/googlebilling/Inventory;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/miniclip/googlebilling/IabException;
        }
    .end annotation

    .prologue
    .line 463
    .local p2, "moreSkus":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const-string v3, "queryInventory"

    invoke-virtual {p0, v3}, Lcom/miniclip/googlebilling/IabHelper;->checkSetupDone(Ljava/lang/String;)V

    .line 465
    :try_start_0
    new-instance v1, Lcom/miniclip/googlebilling/Inventory;

    invoke-direct {v1}, Lcom/miniclip/googlebilling/Inventory;-><init>()V

    .line 466
    .local v1, "inv":Lcom/miniclip/googlebilling/Inventory;
    invoke-virtual {p0, v1}, Lcom/miniclip/googlebilling/IabHelper;->queryPurchases(Lcom/miniclip/googlebilling/Inventory;)I

    move-result v2

    .line 467
    .local v2, "r":I
    if-eqz v2, :cond_0

    .line 468
    new-instance v3, Lcom/miniclip/googlebilling/IabException;

    const-string v4, "Error refreshing inventory (querying owned items)."

    invoke-direct {v3, v2, v4}, Lcom/miniclip/googlebilling/IabException;-><init>(ILjava/lang/String;)V

    throw v3
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1

    .line 479
    .end local v1    # "inv":Lcom/miniclip/googlebilling/Inventory;
    .end local v2    # "r":I
    :catch_0
    move-exception v0

    .line 480
    .local v0, "e":Landroid/os/RemoteException;
    new-instance v3, Lcom/miniclip/googlebilling/IabException;

    const/16 v4, -0x3e9

    const-string v5, "Remote exception while refreshing inventory."

    invoke-direct {v3, v4, v5, v0}, Lcom/miniclip/googlebilling/IabException;-><init>(ILjava/lang/String;Ljava/lang/Exception;)V

    throw v3

    .line 471
    .end local v0    # "e":Landroid/os/RemoteException;
    .restart local v1    # "inv":Lcom/miniclip/googlebilling/Inventory;
    .restart local v2    # "r":I
    :cond_0
    if-eqz p1, :cond_1

    .line 472
    :try_start_1
    invoke-virtual {p0, v1, p2}, Lcom/miniclip/googlebilling/IabHelper;->querySkuDetails(Lcom/miniclip/googlebilling/Inventory;Ljava/util/List;)I

    move-result v2

    .line 473
    if-eqz v2, :cond_1

    .line 474
    new-instance v3, Lcom/miniclip/googlebilling/IabException;

    const-string v4, "Error refreshing inventory (querying prices of items)."

    invoke-direct {v3, v2, v4}, Lcom/miniclip/googlebilling/IabException;-><init>(ILjava/lang/String;)V

    throw v3
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    .line 482
    .end local v1    # "inv":Lcom/miniclip/googlebilling/Inventory;
    .end local v2    # "r":I
    :catch_1
    move-exception v0

    .line 483
    .local v0, "e":Lorg/json/JSONException;
    new-instance v3, Lcom/miniclip/googlebilling/IabException;

    const/16 v4, -0x3ea

    const-string v5, "Error parsing JSON response while refreshing inventory."

    invoke-direct {v3, v4, v5, v0}, Lcom/miniclip/googlebilling/IabException;-><init>(ILjava/lang/String;Ljava/lang/Exception;)V

    throw v3

    .line 477
    .end local v0    # "e":Lorg/json/JSONException;
    .restart local v1    # "inv":Lcom/miniclip/googlebilling/Inventory;
    .restart local v2    # "r":I
    :cond_1
    return-object v1
.end method

.method public queryInventoryAsync(Lcom/miniclip/googlebilling/IabHelper$QueryInventoryFinishedListener;)V
    .locals 2
    .param p1, "listener"    # Lcom/miniclip/googlebilling/IabHelper$QueryInventoryFinishedListener;

    .prologue
    .line 542
    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1, p1}, Lcom/miniclip/googlebilling/IabHelper;->queryInventoryAsync(ZLjava/util/List;Lcom/miniclip/googlebilling/IabHelper$QueryInventoryFinishedListener;)V

    .line 543
    return-void
.end method

.method public queryInventoryAsync(ZLcom/miniclip/googlebilling/IabHelper$QueryInventoryFinishedListener;)V
    .locals 1
    .param p1, "querySkuDetails"    # Z
    .param p2, "listener"    # Lcom/miniclip/googlebilling/IabHelper$QueryInventoryFinishedListener;

    .prologue
    .line 546
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, p2}, Lcom/miniclip/googlebilling/IabHelper;->queryInventoryAsync(ZLjava/util/List;Lcom/miniclip/googlebilling/IabHelper$QueryInventoryFinishedListener;)V

    .line 547
    return-void
.end method

.method public queryInventoryAsync(ZLjava/util/List;Lcom/miniclip/googlebilling/IabHelper$QueryInventoryFinishedListener;)V
    .locals 7
    .param p1, "querySkuDetails"    # Z
    .param p3, "listener"    # Lcom/miniclip/googlebilling/IabHelper$QueryInventoryFinishedListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/miniclip/googlebilling/IabHelper$QueryInventoryFinishedListener;",
            ")V"
        }
    .end annotation

    .prologue
    .line 514
    .local p2, "moreSkus":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v4, Landroid/os/Handler;

    invoke-direct {v4}, Landroid/os/Handler;-><init>()V

    .line 515
    .local v4, "handler":Landroid/os/Handler;
    const-string v0, "queryInventory"

    invoke-virtual {p0, v0}, Lcom/miniclip/googlebilling/IabHelper;->checkSetupDone(Ljava/lang/String;)V

    .line 516
    const-string v0, "refresh inventory"

    invoke-virtual {p0, v0}, Lcom/miniclip/googlebilling/IabHelper;->flagStartAsync(Ljava/lang/String;)V

    .line 517
    new-instance v6, Ljava/lang/Thread;

    new-instance v0, Lcom/miniclip/googlebilling/IabHelper$2;

    move-object v1, p0

    move v2, p1

    move-object v3, p2

    move-object v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/miniclip/googlebilling/IabHelper$2;-><init>(Lcom/miniclip/googlebilling/IabHelper;ZLjava/util/List;Landroid/os/Handler;Lcom/miniclip/googlebilling/IabHelper$QueryInventoryFinishedListener;)V

    invoke-direct {v6, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v6}, Ljava/lang/Thread;->start()V

    .line 539
    return-void
.end method

.method queryPurchases(Lcom/miniclip/googlebilling/Inventory;)I
    .locals 21
    .param p1, "inv"    # Lcom/miniclip/googlebilling/Inventory;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;,
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 727
    const-string v17, "Querying owned items..."

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/miniclip/googlebilling/IabHelper;->logDebug(Ljava/lang/String;)V

    .line 728
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "Package name: "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/googlebilling/IabHelper;->mContext:Landroid/content/Context;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/miniclip/googlebilling/IabHelper;->logDebug(Ljava/lang/String;)V

    .line 729
    const/4 v5, 0x1

    .line 730
    .local v5, "hasMore":Z
    const/16 v16, 0x0

    .line 731
    .local v16, "verificationFailed":Z
    const/4 v4, 0x0

    .line 734
    .local v4, "continueToken":Ljava/lang/String;
    :cond_0
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "Calling getPurchases with continuation token: "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/miniclip/googlebilling/IabHelper;->logDebug(Ljava/lang/String;)V

    .line 735
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/googlebilling/IabHelper;->mService:Lcom/android/vending/billing/IInAppBillingService;

    move-object/from16 v17, v0

    const/16 v18, 0x3

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/googlebilling/IabHelper;->mContext:Landroid/content/Context;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v19

    const-string v20, "inapp"

    move-object/from16 v0, v17

    move/from16 v1, v18

    move-object/from16 v2, v19

    move-object/from16 v3, v20

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/android/vending/billing/IInAppBillingService;->getPurchases(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v7

    .line 738
    .local v7, "ownedItems":Landroid/os/Bundle;
    move-object/from16 v0, p0

    invoke-virtual {v0, v7}, Lcom/miniclip/googlebilling/IabHelper;->getResponseCodeFromBundle(Landroid/os/Bundle;)I

    move-result v12

    .line 739
    .local v12, "response":I
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "Owned items response: "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-static {v12}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/miniclip/googlebilling/IabHelper;->logDebug(Ljava/lang/String;)V

    .line 740
    if-eqz v12, :cond_1

    .line 741
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "getPurchases() failed: "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-static {v12}, Lcom/miniclip/googlebilling/IabHelper;->getResponseDesc(I)Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/miniclip/googlebilling/IabHelper;->logDebug(Ljava/lang/String;)V

    .line 786
    .end local v12    # "response":I
    :goto_0
    return v12

    .line 744
    .restart local v12    # "response":I
    :cond_1
    const-string v17, "INAPP_PURCHASE_ITEM_LIST"

    move-object/from16 v0, v17

    invoke-virtual {v7, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v17

    if-eqz v17, :cond_2

    const-string v17, "INAPP_PURCHASE_DATA_LIST"

    move-object/from16 v0, v17

    invoke-virtual {v7, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v17

    if-eqz v17, :cond_2

    const-string v17, "INAPP_DATA_SIGNATURE_LIST"

    move-object/from16 v0, v17

    invoke-virtual {v7, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v17

    if-nez v17, :cond_3

    .line 747
    :cond_2
    const-string v17, "Bundle returned from getPurchases() doesn\'t contain required fields."

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/miniclip/googlebilling/IabHelper;->logError(Ljava/lang/String;)V

    .line 748
    const/16 v12, -0x3ea

    goto :goto_0

    .line 751
    :cond_3
    const-string v17, "INAPP_PURCHASE_ITEM_LIST"

    move-object/from16 v0, v17

    invoke-virtual {v7, v0}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v8

    .line 753
    .local v8, "ownedSkus":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const-string v17, "INAPP_PURCHASE_DATA_LIST"

    move-object/from16 v0, v17

    invoke-virtual {v7, v0}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v11

    .line 755
    .local v11, "purchaseDataList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const-string v17, "INAPP_DATA_SIGNATURE_LIST"

    move-object/from16 v0, v17

    invoke-virtual {v7, v0}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v14

    .line 758
    .local v14, "signatureList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_1
    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v17

    move/from16 v0, v17

    if-ge v6, v0, :cond_6

    .line 759
    invoke-virtual {v11, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    .line 760
    .local v10, "purchaseData":Ljava/lang/String;
    invoke-virtual {v14, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/String;

    .line 761
    .local v13, "signature":Ljava/lang/String;
    invoke-virtual {v8, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/lang/String;

    .line 762
    .local v15, "sku":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/googlebilling/IabHelper;->mSignatureBase64:Ljava/lang/String;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-static {v0, v10, v13}, Lcom/miniclip/googlebilling/Security;->verifyPurchase(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v17

    if-eqz v17, :cond_5

    .line 763
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "Sku is owned: "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/miniclip/googlebilling/IabHelper;->logDebug(Ljava/lang/String;)V

    .line 764
    new-instance v9, Lcom/miniclip/googlebilling/Purchase;

    invoke-direct {v9, v10, v13}, Lcom/miniclip/googlebilling/Purchase;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 766
    .local v9, "purchase":Lcom/miniclip/googlebilling/Purchase;
    invoke-virtual {v9}, Lcom/miniclip/googlebilling/Purchase;->getToken()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v17 .. v17}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v17

    if-eqz v17, :cond_4

    .line 767
    const-string v17, "BUG: empty/null token!"

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/miniclip/googlebilling/IabHelper;->logWarn(Ljava/lang/String;)V

    .line 768
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "Purchase data: "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/miniclip/googlebilling/IabHelper;->logDebug(Ljava/lang/String;)V

    .line 772
    :cond_4
    move-object/from16 v0, p1

    invoke-virtual {v0, v9}, Lcom/miniclip/googlebilling/Inventory;->addPurchase(Lcom/miniclip/googlebilling/Purchase;)V

    .line 758
    .end local v9    # "purchase":Lcom/miniclip/googlebilling/Purchase;
    :goto_2
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 775
    :cond_5
    const-string v17, "Purchase signature verification **FAILED**. Not adding item."

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/miniclip/googlebilling/IabHelper;->logWarn(Ljava/lang/String;)V

    .line 776
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "   Purchase data: "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/miniclip/googlebilling/IabHelper;->logDebug(Ljava/lang/String;)V

    .line 777
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "   Signature: "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/miniclip/googlebilling/IabHelper;->logDebug(Ljava/lang/String;)V

    .line 778
    const/16 v16, 0x1

    goto :goto_2

    .line 782
    .end local v10    # "purchaseData":Ljava/lang/String;
    .end local v13    # "signature":Ljava/lang/String;
    .end local v15    # "sku":Ljava/lang/String;
    :cond_6
    const-string v17, "INAPP_CONTINUATION_TOKEN"

    move-object/from16 v0, v17

    invoke-virtual {v7, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 783
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "Continuation token: "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/miniclip/googlebilling/IabHelper;->logDebug(Ljava/lang/String;)V

    .line 784
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v17

    if-eqz v17, :cond_0

    .line 786
    if-eqz v16, :cond_7

    const/16 v17, -0x3eb

    :goto_3
    move/from16 v12, v17

    goto/16 :goto_0

    :cond_7
    const/16 v17, 0x0

    goto :goto_3
.end method

.method querySkuDetails(Lcom/miniclip/googlebilling/Inventory;Ljava/util/List;)I
    .locals 17
    .param p1, "inv"    # Lcom/miniclip/googlebilling/Inventory;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miniclip/googlebilling/Inventory;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)I"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;,
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 790
    .local p2, "moreSkus":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const-string v13, "Querying SKU details."

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/miniclip/googlebilling/IabHelper;->logDebug(Ljava/lang/String;)V

    .line 791
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 792
    .local v9, "skuList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual/range {p1 .. p1}, Lcom/miniclip/googlebilling/Inventory;->getAllOwnedSkus()Ljava/util/List;

    move-result-object v13

    invoke-virtual {v9, v13}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 793
    if-eqz p2, :cond_1

    .line 794
    invoke-interface/range {p2 .. p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 795
    .local v7, "sku":Ljava/lang/String;
    invoke-virtual {v9, v7}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_0

    .line 796
    invoke-virtual {v9, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 799
    .end local v3    # "i$":Ljava/util/Iterator;
    .end local v7    # "sku":Ljava/lang/String;
    :cond_1
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v13

    if-nez v13, :cond_2

    .line 800
    const-string v13, "queryPrices: nothing to do because there are no SKUs."

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/miniclip/googlebilling/IabHelper;->logDebug(Ljava/lang/String;)V

    .line 801
    const/4 v5, 0x0

    .line 848
    :goto_1
    return v5

    .line 805
    :cond_2
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v13

    if-lez v13, :cond_9

    .line 807
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v13

    const/16 v14, 0x14

    if-le v13, v14, :cond_3

    const/16 v11, 0x14

    .line 808
    .local v11, "skuList20Size":I
    :goto_2
    new-instance v10, Ljava/util/ArrayList;

    const/4 v13, 0x0

    invoke-virtual {v9, v13, v11}, Ljava/util/ArrayList;->subList(II)Ljava/util/List;

    move-result-object v13

    invoke-direct {v10, v13}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 809
    .local v10, "skuList20":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_3
    if-ge v2, v11, :cond_4

    .line 810
    const/4 v13, 0x0

    invoke-virtual {v9, v13}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 809
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 807
    .end local v2    # "i":I
    .end local v10    # "skuList20":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v11    # "skuList20Size":I
    :cond_3
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v11

    goto :goto_2

    .line 812
    .restart local v2    # "i":I
    .restart local v10    # "skuList20":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .restart local v11    # "skuList20Size":I
    :cond_4
    invoke-virtual {v10}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .restart local v3    # "i$":Ljava/util/Iterator;
    :goto_4
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_5

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 813
    .restart local v7    # "sku":Ljava/lang/String;
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "querySkuDetails sku: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/miniclip/googlebilling/IabHelper;->logDebug(Ljava/lang/String;)V

    goto :goto_4

    .line 815
    .end local v7    # "sku":Ljava/lang/String;
    :cond_5
    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v13

    const/16 v14, 0x14

    if-le v13, v14, :cond_6

    .line 816
    const-string v13, "querySkuDetails: too many skus, maximum is 20."

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/miniclip/googlebilling/IabHelper;->logDebug(Ljava/lang/String;)V

    .line 817
    const/4 v5, 0x5

    goto :goto_1

    .line 820
    :cond_6
    new-instance v4, Landroid/os/Bundle;

    invoke-direct {v4}, Landroid/os/Bundle;-><init>()V

    .line 821
    .local v4, "querySkus":Landroid/os/Bundle;
    const-string v13, "ITEM_ID_LIST"

    invoke-virtual {v4, v13, v10}, Landroid/os/Bundle;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 822
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/miniclip/googlebilling/IabHelper;->mService:Lcom/android/vending/billing/IInAppBillingService;

    const/4 v14, 0x3

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/miniclip/googlebilling/IabHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v15}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v15

    const-string v16, "inapp"

    move-object/from16 v0, v16

    invoke-interface {v13, v14, v15, v0, v4}, Lcom/android/vending/billing/IInAppBillingService;->getSkuDetails(ILjava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/os/Bundle;

    move-result-object v8

    .line 825
    .local v8, "skuDetails":Landroid/os/Bundle;
    const-string v13, "DETAILS_LIST"

    invoke-virtual {v8, v13}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v13

    if-nez v13, :cond_8

    .line 826
    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lcom/miniclip/googlebilling/IabHelper;->getResponseCodeFromBundle(Landroid/os/Bundle;)I

    move-result v5

    .line 827
    .local v5, "response":I
    if-eqz v5, :cond_7

    .line 828
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "getSkuDetails() failed: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-static {v5}, Lcom/miniclip/googlebilling/IabHelper;->getResponseDesc(I)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/miniclip/googlebilling/IabHelper;->logDebug(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 832
    :cond_7
    const-string v13, "getSkuDetails() returned a bundle with neither an error nor a detail list."

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/miniclip/googlebilling/IabHelper;->logError(Ljava/lang/String;)V

    .line 833
    const/16 v5, -0x3ea

    goto/16 :goto_1

    .line 837
    .end local v5    # "response":I
    :cond_8
    const-string v13, "DETAILS_LIST"

    invoke-virtual {v8, v13}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v6

    .line 840
    .local v6, "responseList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {v6}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_5
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    .line 841
    .local v12, "thisResponse":Ljava/lang/String;
    new-instance v1, Lcom/miniclip/googlebilling/SkuDetails;

    invoke-direct {v1, v12}, Lcom/miniclip/googlebilling/SkuDetails;-><init>(Ljava/lang/String;)V

    .line 842
    .local v1, "d":Lcom/miniclip/googlebilling/SkuDetails;
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Got sku details: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/miniclip/googlebilling/IabHelper;->logDebug(Ljava/lang/String;)V

    .line 843
    move-object/from16 v0, p1

    invoke-virtual {v0, v1}, Lcom/miniclip/googlebilling/Inventory;->addSkuDetails(Lcom/miniclip/googlebilling/SkuDetails;)V

    goto :goto_5

    .line 848
    .end local v1    # "d":Lcom/miniclip/googlebilling/SkuDetails;
    .end local v2    # "i":I
    .end local v3    # "i$":Ljava/util/Iterator;
    .end local v4    # "querySkus":Landroid/os/Bundle;
    .end local v6    # "responseList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v8    # "skuDetails":Landroid/os/Bundle;
    .end local v10    # "skuList20":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v11    # "skuList20Size":I
    .end local v12    # "thisResponse":Ljava/lang/String;
    :cond_9
    const/4 v5, 0x0

    goto/16 :goto_1
.end method

.method public startSetup(Lcom/miniclip/googlebilling/IabHelper$OnIabSetupFinishedListener;)V
    .locals 4
    .param p1, "listener"    # Lcom/miniclip/googlebilling/IabHelper$OnIabSetupFinishedListener;

    .prologue
    .line 206
    iget-boolean v0, p0, Lcom/miniclip/googlebilling/IabHelper;->mSetupDone:Z

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "IAB helper is already set up."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 209
    :cond_0
    const-string v0, "Starting in-app billing setup."

    invoke-virtual {p0, v0}, Lcom/miniclip/googlebilling/IabHelper;->logDebug(Ljava/lang/String;)V

    .line 210
    new-instance v0, Lcom/miniclip/googlebilling/IabHelper$1;

    invoke-direct {v0, p0, p1}, Lcom/miniclip/googlebilling/IabHelper$1;-><init>(Lcom/miniclip/googlebilling/IabHelper;Lcom/miniclip/googlebilling/IabHelper$OnIabSetupFinishedListener;)V

    iput-object v0, p0, Lcom/miniclip/googlebilling/IabHelper;->mServiceConn:Landroid/content/ServiceConnection;

    .line 246
    iget-object v0, p0, Lcom/miniclip/googlebilling/IabHelper;->mContext:Landroid/content/Context;

    new-instance v1, Landroid/content/Intent;

    const-string v2, "com.android.vending.billing.InAppBillingService.BIND"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/miniclip/googlebilling/IabHelper;->mServiceConn:Landroid/content/ServiceConnection;

    const/4 v3, 0x1

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    .line 248
    return-void
.end method
