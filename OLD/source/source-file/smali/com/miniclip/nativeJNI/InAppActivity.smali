.class public Lcom/miniclip/nativeJNI/InAppActivity;
.super Lcom/miniclip/nativeJNI/cocojava;
.source "InAppActivity.java"


# static fields
.field static final TAG:Ljava/lang/String; = "InAppActivity"


# instance fields
.field private mBusy:Z

.field mConsumeFinishedListener:Lcom/miniclip/googlebilling/IabHelper$OnConsumeFinishedListener;

.field mGotInventoryListener:Lcom/miniclip/googlebilling/IabHelper$QueryInventoryFinishedListener;

.field private mHelper:Lcom/miniclip/googlebilling/IabHelper;

.field private mHelperReady:Z

.field private mProgressDialog:Landroid/app/ProgressDialog;

.field mPurchaseFinishedListener:Lcom/miniclip/googlebilling/IabHelper$OnIabPurchaseFinishedListener;

.field mPurchaseFinishedListenerManaged:Lcom/miniclip/googlebilling/IabHelper$OnIabPurchaseFinishedListener;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 26
    invoke-direct {p0}, Lcom/miniclip/nativeJNI/cocojava;-><init>()V

    .line 106
    new-instance v0, Lcom/miniclip/nativeJNI/InAppActivity$2;

    invoke-direct {v0, p0}, Lcom/miniclip/nativeJNI/InAppActivity$2;-><init>(Lcom/miniclip/nativeJNI/InAppActivity;)V

    iput-object v0, p0, Lcom/miniclip/nativeJNI/InAppActivity;->mGotInventoryListener:Lcom/miniclip/googlebilling/IabHelper$QueryInventoryFinishedListener;

    .line 187
    new-instance v0, Lcom/miniclip/nativeJNI/InAppActivity$5;

    invoke-direct {v0, p0}, Lcom/miniclip/nativeJNI/InAppActivity$5;-><init>(Lcom/miniclip/nativeJNI/InAppActivity;)V

    iput-object v0, p0, Lcom/miniclip/nativeJNI/InAppActivity;->mPurchaseFinishedListener:Lcom/miniclip/googlebilling/IabHelper$OnIabPurchaseFinishedListener;

    .line 194
    new-instance v0, Lcom/miniclip/nativeJNI/InAppActivity$6;

    invoke-direct {v0, p0}, Lcom/miniclip/nativeJNI/InAppActivity$6;-><init>(Lcom/miniclip/nativeJNI/InAppActivity;)V

    iput-object v0, p0, Lcom/miniclip/nativeJNI/InAppActivity;->mPurchaseFinishedListenerManaged:Lcom/miniclip/googlebilling/IabHelper$OnIabPurchaseFinishedListener;

    .line 201
    new-instance v0, Lcom/miniclip/nativeJNI/InAppActivity$7;

    invoke-direct {v0, p0}, Lcom/miniclip/nativeJNI/InAppActivity$7;-><init>(Lcom/miniclip/nativeJNI/InAppActivity;)V

    iput-object v0, p0, Lcom/miniclip/nativeJNI/InAppActivity;->mConsumeFinishedListener:Lcom/miniclip/googlebilling/IabHelper$OnConsumeFinishedListener;

    return-void
.end method

.method static synthetic access$000(Lcom/miniclip/nativeJNI/InAppActivity;)Lcom/miniclip/googlebilling/IabHelper;
    .locals 1
    .param p0, "x0"    # Lcom/miniclip/nativeJNI/InAppActivity;

    .prologue
    .line 26
    iget-object v0, p0, Lcom/miniclip/nativeJNI/InAppActivity;->mHelper:Lcom/miniclip/googlebilling/IabHelper;

    return-object v0
.end method

.method static synthetic access$102(Lcom/miniclip/nativeJNI/InAppActivity;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/miniclip/nativeJNI/InAppActivity;
    .param p1, "x1"    # Z

    .prologue
    .line 26
    iput-boolean p1, p0, Lcom/miniclip/nativeJNI/InAppActivity;->mHelperReady:Z

    return p1
.end method

.method static synthetic access$202(Lcom/miniclip/nativeJNI/InAppActivity;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/miniclip/nativeJNI/InAppActivity;
    .param p1, "x1"    # Z

    .prologue
    .line 26
    iput-boolean p1, p0, Lcom/miniclip/nativeJNI/InAppActivity;->mBusy:Z

    return p1
.end method

.method static synthetic access$300(Lcom/miniclip/nativeJNI/InAppActivity;)Landroid/app/ProgressDialog;
    .locals 1
    .param p0, "x0"    # Lcom/miniclip/nativeJNI/InAppActivity;

    .prologue
    .line 26
    iget-object v0, p0, Lcom/miniclip/nativeJNI/InAppActivity;->mProgressDialog:Landroid/app/ProgressDialog;

    return-object v0
.end method

.method static synthetic access$302(Lcom/miniclip/nativeJNI/InAppActivity;Landroid/app/ProgressDialog;)Landroid/app/ProgressDialog;
    .locals 0
    .param p0, "x0"    # Lcom/miniclip/nativeJNI/InAppActivity;
    .param p1, "x1"    # Landroid/app/ProgressDialog;

    .prologue
    .line 26
    iput-object p1, p0, Lcom/miniclip/nativeJNI/InAppActivity;->mProgressDialog:Landroid/app/ProgressDialog;

    return-object p1
.end method


# virtual methods
.method alert(Ljava/lang/String;)V
    .locals 0
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 292
    return-void
.end method

.method complain(Ljava/lang/String;)V
    .locals 3
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 281
    const-string v0, "InAppActivity"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "**** InAppActivity Error: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 282
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Error: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/miniclip/nativeJNI/InAppActivity;->alert(Ljava/lang/String;)V

    .line 283
    return-void
.end method

.method public getGooglePlayPublicKey()Ljava/lang/String;
    .locals 1

    .prologue
    .line 37
    const-string v0, "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAh+r1FDthSVi+/DCPsBZmqIGT1fcnheonJaS8Q77nPkSRjJOAtor2cVM6PApBmi2Z0vrPwAakT/iqaiJ1E2WiJ6DrgAjt3IjL1D3jn7g8+fdaZZlH2mAFywCzrxFPiwtfo8sqHvLgYkQHl2fyPV24IP9z26LVwuQwdHJoL9Bo00YHEStPSBBVtqCnhw9Z+ytU8kfSmB7TyjegvP3/jKKXCBimUcaIhAI2HraSvVNhRkEp8uxnwp93GfYLvftygqpg/ma8rZzkJVdg3x2mUiClcv8spbjEAwBYC6dIcd+oSCkKIvDQJ8uS3X7QFv1CxCRGuSZ0VeSWTAyvACv0etQUIQIDAQAB"

    return-object v0
.end method

.method public getOwnedItems()[Ljava/lang/String;
    .locals 10

    .prologue
    .line 350
    sget-object v7, Lcom/miniclip/nativeJNI/InAppActivity;->mContext:Landroid/content/Context;

    const-string v8, "INAPP_PURCHASED_OWNEDv3"

    const/4 v9, 0x0

    invoke-virtual {v7, v8, v9}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v6

    .line 351
    .local v6, "settings":Landroid/content/SharedPreferences;
    invoke-interface {v6}, Landroid/content/SharedPreferences;->getAll()Ljava/util/Map;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v5

    .line 352
    .local v5, "products":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {v5}, Ljava/util/Set;->size()I

    move-result v7

    new-array v4, v7, [Ljava/lang/String;

    .line 353
    .local v4, "productStrings":[Ljava/lang/String;
    const/4 v0, 0x0

    .line 354
    .local v0, "i":I
    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 355
    .local v3, "key":Ljava/lang/String;
    invoke-virtual {p0, v3}, Lcom/miniclip/nativeJNI/InAppActivity;->isPurchaseReallyOwned(Ljava/lang/String;)I

    move-result v7

    const/4 v8, 0x1

    if-ne v7, v8, :cond_0

    .line 356
    add-int/lit8 v1, v0, 0x1

    .end local v0    # "i":I
    .local v1, "i":I
    aput-object v3, v4, v0

    move v0, v1

    .end local v1    # "i":I
    .restart local v0    # "i":I
    goto :goto_0

    .line 358
    .end local v3    # "key":Ljava/lang/String;
    :cond_1
    return-object v4
.end method

.method public getPurchasePrice(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p1, "productId"    # Ljava/lang/String;

    .prologue
    .line 367
    sget-object v1, Lcom/miniclip/nativeJNI/InAppActivity;->mContext:Landroid/content/Context;

    const-string v2, "INAPP_SKU_INFOv3"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 369
    .local v0, "settingsSku":Landroid/content/SharedPreferences;
    const-string v1, "InAppActivity"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getPurchasePrice"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "_PRICE_UNIQUE"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, ""

    invoke-interface {v0, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 370
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "_PRICE_UNIQUE"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public isPurchaseReallyOwned(Ljava/lang/String;)I
    .locals 4
    .param p1, "productId"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 362
    sget-object v2, Lcom/miniclip/nativeJNI/InAppActivity;->mContext:Landroid/content/Context;

    const-string v3, "INAPP_PURCHASED_OWNEDv3"

    invoke-virtual {v2, v3, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 363
    .local v0, "settings":Landroid/content/SharedPreferences;
    invoke-interface {v0, p1, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    if-lez v2, :cond_0

    const/4 v1, 0x1

    :cond_0
    return v1
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 3
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 91
    const-string v0, "InAppActivity"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onActivityResult("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 94
    iget-object v0, p0, Lcom/miniclip/nativeJNI/InAppActivity;->mHelper:Lcom/miniclip/googlebilling/IabHelper;

    invoke-virtual {v0, p1, p2, p3}, Lcom/miniclip/googlebilling/IabHelper;->handleActivityResult(IILandroid/content/Intent;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 98
    invoke-super {p0, p1, p2, p3}, Lcom/miniclip/nativeJNI/cocojava;->onActivityResult(IILandroid/content/Intent;)V

    .line 103
    :goto_0
    return-void

    .line 101
    :cond_0
    const-string v0, "InAppActivity"

    const-string v1, "onActivityResult handled by IABUtil."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v0, 0x0

    .line 43
    invoke-super {p0, p1}, Lcom/miniclip/nativeJNI/cocojava;->onCreate(Landroid/os/Bundle;)V

    .line 45
    iput-boolean v0, p0, Lcom/miniclip/nativeJNI/InAppActivity;->mHelperReady:Z

    .line 46
    iput-boolean v0, p0, Lcom/miniclip/nativeJNI/InAppActivity;->mBusy:Z

    .line 61
    const-string v0, "InAppActivity"

    const-string v1, "Creating IAB helper."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 62
    new-instance v0, Lcom/miniclip/googlebilling/IabHelper;

    invoke-virtual {p0}, Lcom/miniclip/nativeJNI/InAppActivity;->getGooglePlayPublicKey()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/miniclip/googlebilling/IabHelper;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/miniclip/nativeJNI/InAppActivity;->mHelper:Lcom/miniclip/googlebilling/IabHelper;

    .line 65
    iget-object v0, p0, Lcom/miniclip/nativeJNI/InAppActivity;->mHelper:Lcom/miniclip/googlebilling/IabHelper;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/miniclip/googlebilling/IabHelper;->enableDebugLogging(Z)V

    .line 69
    const-string v0, "InAppActivity"

    const-string v1, "Starting setup."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 70
    iget-object v0, p0, Lcom/miniclip/nativeJNI/InAppActivity;->mHelper:Lcom/miniclip/googlebilling/IabHelper;

    new-instance v1, Lcom/miniclip/nativeJNI/InAppActivity$1;

    invoke-direct {v1, p0}, Lcom/miniclip/nativeJNI/InAppActivity$1;-><init>(Lcom/miniclip/nativeJNI/InAppActivity;)V

    invoke-virtual {v0, v1}, Lcom/miniclip/googlebilling/IabHelper;->startSetup(Lcom/miniclip/googlebilling/IabHelper$OnIabSetupFinishedListener;)V

    .line 87
    return-void
.end method

.method public purchaseFinishedCallback(Lcom/miniclip/googlebilling/IabResult;Lcom/miniclip/googlebilling/Purchase;Ljava/lang/Boolean;)V
    .locals 4
    .param p1, "result"    # Lcom/miniclip/googlebilling/IabResult;
    .param p2, "purchase"    # Lcom/miniclip/googlebilling/Purchase;
    .param p3, "managed"    # Ljava/lang/Boolean;

    .prologue
    const/4 v3, 0x0

    .line 144
    if-nez p2, :cond_0

    .line 145
    const-string v0, "InAppActivity"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Purchase finished: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 148
    :goto_0
    invoke-virtual {p1}, Lcom/miniclip/googlebilling/IabResult;->isFailure()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 150
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Error purchasing: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/miniclip/nativeJNI/InAppActivity;->complain(Ljava/lang/String;)V

    .line 151
    iput-boolean v3, p0, Lcom/miniclip/nativeJNI/InAppActivity;->mBusy:Z

    .line 152
    invoke-virtual {p0, v3}, Lcom/miniclip/nativeJNI/InAppActivity;->setWaitScreen(Z)V

    .line 153
    const/4 v0, -0x1

    sget-object v1, Lcom/miniclip/nativeJNI/InAppActivity;->mInAppProductId:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Lcom/miniclip/nativeJNI/InAppActivity;->inAppResponce(ILjava/lang/String;)V

    .line 154
    const-string v0, "InAppActivity"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "purchaseFinishedCallback failed: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lcom/miniclip/nativeJNI/InAppActivity;->mInAppProductId:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 155
    sget-object v0, Lcom/miniclip/nativeJNI/InAppActivity;->mGLView:Lcom/miniclip/nativeJNI/ClearGLSurfaceView;

    new-instance v1, Lcom/miniclip/nativeJNI/InAppActivity$3;

    invoke-direct {v1, p0}, Lcom/miniclip/nativeJNI/InAppActivity$3;-><init>(Lcom/miniclip/nativeJNI/InAppActivity;)V

    invoke-virtual {v0, v1}, Lcom/miniclip/nativeJNI/ClearGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    .line 184
    :goto_1
    return-void

    .line 147
    :cond_0
    const-string v0, "InAppActivity"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Purchase finished: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", purchase: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 163
    :cond_1
    const-string v0, "InAppActivity"

    const-string v1, "Purchase successful."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 165
    invoke-virtual {p0, p2}, Lcom/miniclip/nativeJNI/InAppActivity;->syncPurchase(Lcom/miniclip/googlebilling/Purchase;)V

    .line 166
    const/4 v0, 0x1

    sget-object v1, Lcom/miniclip/nativeJNI/InAppActivity;->mInAppProductId:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Lcom/miniclip/nativeJNI/InAppActivity;->inAppResponce(ILjava/lang/String;)V

    .line 168
    const-string v0, "InAppActivity"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "purchaseFinishedCallback success: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lcom/miniclip/nativeJNI/InAppActivity;->mInAppProductId:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 169
    sget-object v0, Lcom/miniclip/nativeJNI/InAppActivity;->mGLView:Lcom/miniclip/nativeJNI/ClearGLSurfaceView;

    new-instance v1, Lcom/miniclip/nativeJNI/InAppActivity$4;

    invoke-direct {v1, p0, p2, p3}, Lcom/miniclip/nativeJNI/InAppActivity$4;-><init>(Lcom/miniclip/nativeJNI/InAppActivity;Lcom/miniclip/googlebilling/Purchase;Ljava/lang/Boolean;)V

    invoke-virtual {v0, v1}, Lcom/miniclip/nativeJNI/ClearGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    goto :goto_1
.end method

.method public requestPurchaseAct(Ljava/lang/String;)V
    .locals 7
    .param p1, "productId"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x1

    .line 317
    iget-boolean v3, p0, Lcom/miniclip/nativeJNI/InAppActivity;->mHelperReady:Z

    if-eqz v3, :cond_0

    iget-boolean v3, p0, Lcom/miniclip/nativeJNI/InAppActivity;->mBusy:Z

    if-eqz v3, :cond_1

    .line 347
    :cond_0
    :goto_0
    return-void

    .line 319
    :cond_1
    invoke-virtual {p0, p1}, Lcom/miniclip/nativeJNI/InAppActivity;->isPurchaseReallyOwned(Ljava/lang/String;)I

    move-result v3

    if-ne v3, v6, :cond_2

    .line 320
    const-string v3, "InAppActivity"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "requestPurchaseAct restore: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-object v5, Lcom/miniclip/nativeJNI/InAppActivity;->mInAppProductId:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 321
    sget-object v3, Lcom/miniclip/nativeJNI/InAppActivity;->mContext:Landroid/content/Context;

    const-string v4, "INAPP_PURCHASED_OWNED_EXTRAv3"

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 322
    .local v1, "settingsExtra":Landroid/content/SharedPreferences;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "_DATA_UNIQUE"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, ""

    invoke-interface {v1, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 323
    .local v0, "data":Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "_SIGNATURE_UNIQUE"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, ""

    invoke-interface {v1, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 324
    .local v2, "signature":Ljava/lang/String;
    sget-object v3, Lcom/miniclip/nativeJNI/InAppActivity;->mInAppProductId:Ljava/lang/String;

    invoke-virtual {p0, v6, v3}, Lcom/miniclip/nativeJNI/InAppActivity;->inAppResponce(ILjava/lang/String;)V

    .line 325
    sget-object v3, Lcom/miniclip/nativeJNI/InAppActivity;->mGLView:Lcom/miniclip/nativeJNI/ClearGLSurfaceView;

    new-instance v4, Lcom/miniclip/nativeJNI/InAppActivity$10;

    invoke-direct {v4, p0, v0, v2}, Lcom/miniclip/nativeJNI/InAppActivity$10;-><init>(Lcom/miniclip/nativeJNI/InAppActivity;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Lcom/miniclip/nativeJNI/ClearGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    goto :goto_0

    .line 343
    .end local v0    # "data":Ljava/lang/String;
    .end local v1    # "settingsExtra":Landroid/content/SharedPreferences;
    .end local v2    # "signature":Ljava/lang/String;
    :cond_2
    iput-boolean v6, p0, Lcom/miniclip/nativeJNI/InAppActivity;->mBusy:Z

    .line 344
    invoke-virtual {p0, v6}, Lcom/miniclip/nativeJNI/InAppActivity;->setWaitScreen(Z)V

    .line 345
    iget-object v3, p0, Lcom/miniclip/nativeJNI/InAppActivity;->mHelper:Lcom/miniclip/googlebilling/IabHelper;

    const/16 v4, 0x2711

    iget-object v5, p0, Lcom/miniclip/nativeJNI/InAppActivity;->mPurchaseFinishedListener:Lcom/miniclip/googlebilling/IabHelper$OnIabPurchaseFinishedListener;

    invoke-virtual {v3, p0, p1, v4, v5}, Lcom/miniclip/googlebilling/IabHelper;->launchPurchaseFlow(Landroid/app/Activity;Ljava/lang/String;ILcom/miniclip/googlebilling/IabHelper$OnIabPurchaseFinishedListener;)V

    goto :goto_0
.end method

.method public requestPurchaseActManaged(Ljava/lang/String;)V
    .locals 7
    .param p1, "productId"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x1

    .line 295
    iget-boolean v3, p0, Lcom/miniclip/nativeJNI/InAppActivity;->mHelperReady:Z

    if-eqz v3, :cond_0

    iget-boolean v3, p0, Lcom/miniclip/nativeJNI/InAppActivity;->mBusy:Z

    if-eqz v3, :cond_1

    .line 314
    :cond_0
    :goto_0
    return-void

    .line 297
    :cond_1
    invoke-virtual {p0, p1}, Lcom/miniclip/nativeJNI/InAppActivity;->isPurchaseReallyOwned(Ljava/lang/String;)I

    move-result v3

    if-ne v3, v6, :cond_2

    .line 298
    const-string v3, "InAppActivity"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "requestPurchaseActManaged restore: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-object v5, Lcom/miniclip/nativeJNI/InAppActivity;->mInAppProductId:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 299
    sget-object v3, Lcom/miniclip/nativeJNI/InAppActivity;->mContext:Landroid/content/Context;

    const-string v4, "INAPP_PURCHASED_OWNED_EXTRAv3"

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 300
    .local v1, "settingsExtra":Landroid/content/SharedPreferences;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "_DATA_UNIQUE"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, ""

    invoke-interface {v1, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 301
    .local v0, "data":Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "_SIGNATURE_UNIQUE"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, ""

    invoke-interface {v1, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 302
    .local v2, "signature":Ljava/lang/String;
    sget-object v3, Lcom/miniclip/nativeJNI/InAppActivity;->mInAppProductId:Ljava/lang/String;

    invoke-virtual {p0, v6, v3}, Lcom/miniclip/nativeJNI/InAppActivity;->inAppResponce(ILjava/lang/String;)V

    .line 303
    sget-object v3, Lcom/miniclip/nativeJNI/InAppActivity;->mGLView:Lcom/miniclip/nativeJNI/ClearGLSurfaceView;

    new-instance v4, Lcom/miniclip/nativeJNI/InAppActivity$9;

    invoke-direct {v4, p0, v0, v2}, Lcom/miniclip/nativeJNI/InAppActivity$9;-><init>(Lcom/miniclip/nativeJNI/InAppActivity;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Lcom/miniclip/nativeJNI/ClearGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    goto :goto_0

    .line 310
    .end local v0    # "data":Ljava/lang/String;
    .end local v1    # "settingsExtra":Landroid/content/SharedPreferences;
    .end local v2    # "signature":Ljava/lang/String;
    :cond_2
    iput-boolean v6, p0, Lcom/miniclip/nativeJNI/InAppActivity;->mBusy:Z

    .line 311
    invoke-virtual {p0, v6}, Lcom/miniclip/nativeJNI/InAppActivity;->setWaitScreen(Z)V

    .line 312
    iget-object v3, p0, Lcom/miniclip/nativeJNI/InAppActivity;->mHelper:Lcom/miniclip/googlebilling/IabHelper;

    const/16 v4, 0x2711

    iget-object v5, p0, Lcom/miniclip/nativeJNI/InAppActivity;->mPurchaseFinishedListenerManaged:Lcom/miniclip/googlebilling/IabHelper$OnIabPurchaseFinishedListener;

    invoke-virtual {v3, p0, p1, v4, v5}, Lcom/miniclip/googlebilling/IabHelper;->launchPurchaseFlow(Landroid/app/Activity;Ljava/lang/String;ILcom/miniclip/googlebilling/IabHelper$OnIabPurchaseFinishedListener;)V

    goto :goto_0
.end method

.method setWaitScreen(Z)V
    .locals 2
    .param p1, "set"    # Z

    .prologue
    .line 271
    sget-object v0, Lcom/miniclip/nativeJNI/InAppActivity;->mContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/miniclip/nativeJNI/InAppActivity$8;

    invoke-direct {v1, p0, p1}, Lcom/miniclip/nativeJNI/InAppActivity$8;-><init>(Lcom/miniclip/nativeJNI/InAppActivity;Z)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 278
    return-void
.end method

.method syncInventory(Lcom/miniclip/googlebilling/Inventory;)V
    .locals 14
    .param p1, "inventory"    # Lcom/miniclip/googlebilling/Inventory;

    .prologue
    const/4 v13, 0x0

    .line 243
    sget-object v11, Lcom/miniclip/nativeJNI/InAppActivity;->mContext:Landroid/content/Context;

    const-string v12, "INAPP_PURCHASED_OWNED_EXTRAv3"

    invoke-virtual {v11, v12, v13}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v7

    .line 244
    .local v7, "settingsExtra":Landroid/content/SharedPreferences;
    invoke-interface {v7}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 245
    .local v1, "editorExtra":Landroid/content/SharedPreferences$Editor;
    sget-object v11, Lcom/miniclip/nativeJNI/InAppActivity;->mContext:Landroid/content/Context;

    const-string v12, "INAPP_PURCHASED_OWNEDv3"

    invoke-virtual {v11, v12, v13}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v6

    .line 246
    .local v6, "settings":Landroid/content/SharedPreferences;
    invoke-interface {v6}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 247
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    invoke-virtual {p1}, Lcom/miniclip/googlebilling/Inventory;->getAllPurchases()Ljava/util/List;

    move-result-object v5

    .line 248
    .local v5, "products":Ljava/util/List;, "Ljava/util/List<Lcom/miniclip/googlebilling/Purchase;>;"
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v11

    if-ge v3, v11, :cond_1

    .line 249
    invoke-interface {v5, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/miniclip/googlebilling/Purchase;

    invoke-virtual {v11}, Lcom/miniclip/googlebilling/Purchase;->getPurchaseState()I

    move-result v11

    if-eqz v11, :cond_0

    .line 248
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 251
    :cond_0
    invoke-interface {v5, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/miniclip/googlebilling/Purchase;

    invoke-virtual {v11}, Lcom/miniclip/googlebilling/Purchase;->getSku()Ljava/lang/String;

    move-result-object v9

    .line 252
    .local v9, "sku":Ljava/lang/String;
    const/4 v11, 0x1

    invoke-interface {v0, v9, v11}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 253
    invoke-virtual {p1, v9}, Lcom/miniclip/googlebilling/Inventory;->getPurchase(Ljava/lang/String;)Lcom/miniclip/googlebilling/Purchase;

    move-result-object v4

    .line 254
    .local v4, "p":Lcom/miniclip/googlebilling/Purchase;
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "_DATA_UNIQUE"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v4}, Lcom/miniclip/googlebilling/Purchase;->getOriginalJson()Ljava/lang/String;

    move-result-object v12

    invoke-interface {v1, v11, v12}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 255
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "_SIGNATURE_UNIQUE"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v4}, Lcom/miniclip/googlebilling/Purchase;->getSignature()Ljava/lang/String;

    move-result-object v12

    invoke-interface {v1, v11, v12}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    goto :goto_1

    .line 257
    .end local v4    # "p":Lcom/miniclip/googlebilling/Purchase;
    .end local v9    # "sku":Ljava/lang/String;
    :cond_1
    sget-object v11, Lcom/miniclip/nativeJNI/InAppActivity;->mContext:Landroid/content/Context;

    const-string v12, "INAPP_SKU_INFOv3"

    invoke-virtual {v11, v12, v13}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v8

    .line 258
    .local v8, "settingsSku":Landroid/content/SharedPreferences;
    invoke-interface {v8}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    .line 259
    .local v2, "editorSku":Landroid/content/SharedPreferences$Editor;
    invoke-virtual {p1}, Lcom/miniclip/googlebilling/Inventory;->getAllSkuDetails()Ljava/util/List;

    move-result-object v10

    .line 260
    .local v10, "skuDetails":Ljava/util/List;, "Ljava/util/List<Lcom/miniclip/googlebilling/SkuDetails;>;"
    const/4 v3, 0x0

    :goto_2
    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v11

    if-ge v3, v11, :cond_2

    .line 261
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {v10, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/miniclip/googlebilling/SkuDetails;

    invoke-virtual {v11}, Lcom/miniclip/googlebilling/SkuDetails;->getSku()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v12, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "_PRICE_UNIQUE"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-interface {v10, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/miniclip/googlebilling/SkuDetails;

    invoke-virtual {v11}, Lcom/miniclip/googlebilling/SkuDetails;->getPrice()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v2, v12, v11}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 262
    const-string v12, "InAppActivity"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Inventory price stored: "

    invoke-virtual {v11, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-interface {v10, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/miniclip/googlebilling/SkuDetails;

    invoke-virtual {v11}, Lcom/miniclip/googlebilling/SkuDetails;->getSku()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v13, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v13, " "

    invoke-virtual {v11, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-interface {v10, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/miniclip/googlebilling/SkuDetails;

    invoke-virtual {v11}, Lcom/miniclip/googlebilling/SkuDetails;->getPrice()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v13, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v12, v11}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 260
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 264
    :cond_2
    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 265
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 266
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 267
    return-void
.end method

.method syncPurchase(Lcom/miniclip/googlebilling/Purchase;)V
    .locals 8
    .param p1, "purchase"    # Lcom/miniclip/googlebilling/Purchase;

    .prologue
    const/4 v7, 0x0

    .line 228
    invoke-virtual {p1}, Lcom/miniclip/googlebilling/Purchase;->getPurchaseState()I

    move-result v5

    if-eqz v5, :cond_0

    .line 240
    :goto_0
    return-void

    .line 230
    :cond_0
    sget-object v5, Lcom/miniclip/nativeJNI/InAppActivity;->mContext:Landroid/content/Context;

    const-string v6, "INAPP_PURCHASED_OWNED_EXTRAv3"

    invoke-virtual {v5, v6, v7}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v3

    .line 231
    .local v3, "settingsExtra":Landroid/content/SharedPreferences;
    invoke-interface {v3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 232
    .local v1, "editorExtra":Landroid/content/SharedPreferences$Editor;
    sget-object v5, Lcom/miniclip/nativeJNI/InAppActivity;->mContext:Landroid/content/Context;

    const-string v6, "INAPP_PURCHASED_OWNEDv3"

    invoke-virtual {v5, v6, v7}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 233
    .local v2, "settings":Landroid/content/SharedPreferences;
    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 234
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    invoke-virtual {p1}, Lcom/miniclip/googlebilling/Purchase;->getSku()Ljava/lang/String;

    move-result-object v4

    .line 235
    .local v4, "sku":Ljava/lang/String;
    const/4 v5, 0x1

    invoke-interface {v0, v4, v5}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 236
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "_DATA_UNIQUE"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1}, Lcom/miniclip/googlebilling/Purchase;->getOriginalJson()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v1, v5, v6}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 237
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "_SIGNATURE_UNIQUE"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1}, Lcom/miniclip/googlebilling/Purchase;->getSignature()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v1, v5, v6}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 238
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 239
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto :goto_0
.end method
