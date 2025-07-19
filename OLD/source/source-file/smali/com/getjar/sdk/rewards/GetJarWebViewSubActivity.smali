.class public Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;
.super Lcom/getjar/sdk/rewards/GetJarSubActivityBase;
.source "GetJarWebViewSubActivity.java"

# interfaces
.implements Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$10;,
        Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ProductWithClientTransactionID;,
        Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ManagedPurchaseWithClientTransactionID;,
        Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ManagedPurchase;,
        Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$CommFailureCallback;,
        Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ScreenWakeupReceiver;,
        Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$InAppBillingNotifier;,
        Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$DialogType;,
        Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$waitForAuth;,
        Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$newPackageReceived;,
        Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorSource;,
        Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorType;
    }
.end annotation


# static fields
.field protected static final GOOGLE_PLAY_PURCHASE_REQUEST:I = 0x65

.field private static final GooglePlayResponseCallback:Ljava/lang/String; = "GooglePlayResponseCallback"

.field private static Language:Ljava/lang/String; = null

.field private static final TOUCH_DRAG_LENGTH:I = 0xc8

.field private static final _ExecutorServiceForGooglePlayResultWork:Ljava/util/concurrent/ExecutorService;

.field private static final _ExecutorServiceUIWork:Ljava/util/concurrent/ExecutorService;

.field private static volatile _ScreenWakeupReceiver:Landroid/content/BroadcastReceiver;

.field private static mWebView:Landroid/webkit/WebView;

.field public static sErrorSource:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorSource;

.field public static waitObject:Ljava/lang/Object;


# instance fields
.field private _commFailureCallback:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$CommFailureCallback;

.field private _currentPurchaseClientTransactionId:Ljava/lang/String;

.field private _dialogsToManage:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/app/Dialog;",
            ">;"
        }
    .end annotation
.end field

.field private _loadCheckoutPage:Z

.field private _loadWalletPage:Z

.field private _shouldShowLoadingUI:Z

.field private downX:I

.field private downY:I

.field private inAppBillingJSNotifier:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$InAppBillingNotifier;

.field private konamiCode:Ljava/lang/StringBuilder;

.field private mCatchByMonitor:Z

.field private mCommContext:Lcom/getjar/sdk/comm/CommContext;

.field mDismissReceiver:Landroid/os/ResultReceiver;

.field mHandler:Landroid/os/Handler;

.field mJavaScriptInterface:Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;

.field private mOffers:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ProductWithClientTransactionID;",
            ">;"
        }
    .end annotation
.end field

.field private mPackageReceiver:Landroid/content/BroadcastReceiver;

.field mReceiver:Landroid/os/ResultReceiver;

.field private mUrl:Ljava/lang/String;

.field private mUserAgent:Ljava/lang/String;

.field private subResult:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 82
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->waitObject:Ljava/lang/Object;

    .line 83
    sput-object v1, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->_ScreenWakeupReceiver:Landroid/content/BroadcastReceiver;

    .line 87
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->_ExecutorServiceForGooglePlayResultWork:Ljava/util/concurrent/ExecutorService;

    .line 88
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->_ExecutorServiceUIWork:Ljava/util/concurrent/ExecutorService;

    .line 89
    const-string v0, "en-us"

    sput-object v0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->Language:Ljava/lang/String;

    .line 91
    sput-object v1, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mWebView:Landroid/webkit/WebView;

    return-void
.end method

.method constructor <init>(Lcom/getjar/sdk/rewards/GetJarActivity;)V
    .locals 3
    .param p1, "getJarActivity"    # Lcom/getjar/sdk/rewards/GetJarActivity;

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 112
    invoke-direct {p0, p1}, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;-><init>(Lcom/getjar/sdk/rewards/GetJarActivity;)V

    .line 92
    iput-object v1, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mJavaScriptInterface:Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;

    .line 94
    iput-object v1, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mUrl:Ljava/lang/String;

    .line 95
    const-string v0, ""

    iput-object v0, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mUserAgent:Ljava/lang/String;

    .line 96
    iput-boolean v2, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mCatchByMonitor:Z

    .line 97
    new-instance v0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$CommFailureCallback;

    invoke-direct {v0, p0, v1}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$CommFailureCallback;-><init>(Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$1;)V

    iput-object v0, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->_commFailureCallback:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$CommFailureCallback;

    .line 98
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mOffers:Ljava/util/ArrayList;

    .line 99
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->_shouldShowLoadingUI:Z

    .line 100
    iput-object v1, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->_currentPurchaseClientTransactionId:Ljava/lang/String;

    .line 101
    iput-boolean v2, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->_loadWalletPage:Z

    .line 102
    iput-boolean v2, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->_loadCheckoutPage:Z

    .line 124
    new-instance v0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$1;

    invoke-direct {v0, p0, v1}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$1;-><init>(Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mReceiver:Landroid/os/ResultReceiver;

    .line 158
    new-instance v0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$2;

    invoke-direct {v0, p0, v1}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$2;-><init>(Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mDismissReceiver:Landroid/os/ResultReceiver;

    .line 176
    new-instance v0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$3;

    invoke-direct {v0, p0}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$3;-><init>(Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;)V

    iput-object v0, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mHandler:Landroid/os/Handler;

    .line 229
    new-instance v0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$4;

    invoke-direct {v0, p0}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$4;-><init>(Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;)V

    iput-object v0, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mPackageReceiver:Landroid/content/BroadcastReceiver;

    .line 987
    iput-object v1, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->_dialogsToManage:Ljava/util/List;

    .line 113
    return-void
.end method

.method private RegisterPackageReceiver()V
    .locals 4

    .prologue
    .line 243
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 244
    .local v0, "actions":Landroid/content/IntentFilter;
    const-string v1, "android.intent.action.PACKAGE_ADDED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 245
    const-string v1, "package"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addDataScheme(Ljava/lang/String;)V

    .line 246
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->getJarActivity:Lcom/getjar/sdk/rewards/GetJarActivity;

    iget-object v2, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mPackageReceiver:Landroid/content/BroadcastReceiver;

    new-instance v3, Landroid/content/IntentFilter;

    invoke-direct {v3, v0}, Landroid/content/IntentFilter;-><init>(Landroid/content/IntentFilter;)V

    invoke-virtual {v1, v2, v3}, Lcom/getjar/sdk/rewards/GetJarActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 247
    return-void
.end method

.method private UnRegisterPackageReceiver()V
    .locals 2

    .prologue
    .line 250
    iget-object v0, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->getJarActivity:Lcom/getjar/sdk/rewards/GetJarActivity;

    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mPackageReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Lcom/getjar/sdk/rewards/GetJarActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 251
    return-void
.end method

.method static synthetic access$102(Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;
    .param p1, "x1"    # Z

    .prologue
    .line 80
    iput-boolean p1, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mCatchByMonitor:Z

    return p1
.end method

.method static synthetic access$200(Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;Landroid/os/Bundle;)V
    .locals 0
    .param p0, "x0"    # Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;
    .param p1, "x1"    # Landroid/os/Bundle;

    .prologue
    .line 80
    invoke-direct {p0, p1}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->purchaseSuccess(Landroid/os/Bundle;)V

    return-void
.end method

.method static synthetic access$300(Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;Landroid/os/Bundle;)V
    .locals 0
    .param p0, "x0"    # Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;
    .param p1, "x1"    # Landroid/os/Bundle;

    .prologue
    .line 80
    invoke-direct {p0, p1}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->purchaseFail(Landroid/os/Bundle;)V

    return-void
.end method

.method static synthetic access$400(Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;Landroid/os/Bundle;)V
    .locals 0
    .param p0, "x0"    # Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;
    .param p1, "x1"    # Landroid/os/Bundle;

    .prologue
    .line 80
    invoke-direct {p0, p1}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->serviceFail(Landroid/os/Bundle;)V

    return-void
.end method

.method static synthetic access$500()Landroid/webkit/WebView;
    .locals 1

    .prologue
    .line 80
    sget-object v0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mWebView:Landroid/webkit/WebView;

    return-object v0
.end method

.method static synthetic access$700(Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;)Z
    .locals 1
    .param p0, "x0"    # Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    .prologue
    .line 80
    iget-boolean v0, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->_shouldShowLoadingUI:Z

    return v0
.end method

.method static synthetic access$800(Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    .prologue
    .line 80
    invoke-direct {p0}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->showUserSwitchedUIAsNeeded()V

    return-void
.end method

.method static synthetic access$900(Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;)Lcom/getjar/sdk/comm/CommContext;
    .locals 1
    .param p0, "x0"    # Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    .prologue
    .line 80
    iget-object v0, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mCommContext:Lcom/getjar/sdk/comm/CommContext;

    return-object v0
.end method

.method private checkIfAlreadyShowingError()Z
    .locals 2

    .prologue
    .line 453
    sget-object v0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mWebView:Landroid/webkit/WebView;

    if-eqz v0, :cond_0

    const-string v0, "file:///android_asset/errorMessage.html"

    sget-object v1, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v1}, Landroid/webkit/WebView;->getUrl()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 454
    const/4 v0, 0x1

    .line 456
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private executeKonami(Ljava/lang/String;)Z
    .locals 3
    .param p1, "code"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 1511
    const-string v1, "2314314231"

    invoke-virtual {p1, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1512
    new-instance v1, Lcom/getjar/sdk/comm/TransactionManager;

    iget-object v2, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->getJarActivity:Lcom/getjar/sdk/rewards/GetJarActivity;

    invoke-direct {v1, v2}, Lcom/getjar/sdk/comm/TransactionManager;-><init>(Landroid/content/Context;)V

    iget-object v2, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mCommContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v1, v2}, Lcom/getjar/sdk/comm/TransactionManager;->recoverOrphanedTransactions(Lcom/getjar/sdk/comm/CommContext;)V

    .line 1513
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->getJarActivity:Lcom/getjar/sdk/rewards/GetJarActivity;

    const-string v2, "Processing Orphaned Transactions!"

    invoke-static {v1, v2, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 1514
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->konamiCode:Ljava/lang/StringBuilder;

    .line 1515
    const/4 v0, 0x1

    .line 1517
    :cond_0
    return v0
.end method

.method protected static getCallbackString(Landroid/content/Context;)Ljava/lang/String;
    .locals 6
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v5, 0x0

    .line 644
    if-nez p0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'context\' cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 646
    :cond_0
    const-string v0, "GetJarClientPrefs"

    invoke-virtual {p0, v0, v5}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v2, "%1$d.%2$s"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/16 v4, 0x65

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v5

    const/4 v4, 0x1

    const-string v5, "GooglePlayResponseCallback"

    aput-object v5, v3, v4

    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getHomeUrl()Ljava/lang/String;
    .locals 11

    .prologue
    const/4 v10, 0x0

    const/4 v9, 0x1

    .line 398
    sget-object v3, Lcom/getjar/sdk/logging/Area;->CONFIG:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "getHomeUrl(): current \'%1$s\'"

    new-array v7, v9, [Ljava/lang/Object;

    iget-object v8, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mUrl:Ljava/lang/String;

    aput-object v8, v7, v10

    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 399
    iget-object v3, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->getJarActivity:Lcom/getjar/sdk/rewards/GetJarActivity;

    invoke-virtual {v3}, Lcom/getjar/sdk/rewards/GetJarActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/getjar/sdk/utilities/RewardUtility;->getWebSharedPrefsMap(Landroid/content/Context;)Ljava/util/Map;

    move-result-object v2

    .line 400
    .local v2, "rewardsPrefsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;*>;"
    const-string v3, "web.last.known"

    invoke-interface {v2, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 403
    const-string v3, "web.last.known"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 404
    .local v1, "historyUrl":Ljava/lang/String;
    invoke-static {v1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 405
    sget-object v3, Lcom/getjar/sdk/logging/Area;->CONFIG:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "getHomeUrl(): Last known url: %1$s"

    new-array v7, v9, [Ljava/lang/Object;

    aput-object v1, v7, v10

    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 406
    invoke-direct {p0}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->isUrlExpired()Z

    move-result v3

    if-nez v3, :cond_0

    .line 415
    :try_start_0
    new-instance v3, Ljava/net/URI;

    invoke-direct {v3, v1}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    .line 418
    sget-object v3, Lcom/getjar/sdk/logging/Area;->CONFIG:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "getHomeUrl(): Selecting unexpired URL from cache: \'%1$s\'"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object v1, v7, v8

    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 419
    iput-object v1, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mUrl:Ljava/lang/String;
    :try_end_0
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_0

    .line 434
    .end local v1    # "historyUrl":Ljava/lang/String;
    :cond_0
    :goto_0
    iget-object v3, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mUrl:Ljava/lang/String;

    invoke-static {v3}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 435
    invoke-direct {p0}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->checkIfAlreadyShowingError()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 438
    const/4 v3, 0x0

    .line 449
    :goto_1
    return-object v3

    .line 421
    .restart local v1    # "historyUrl":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 424
    .local v0, "e":Ljava/net/URISyntaxException;
    sget-object v3, Lcom/getjar/sdk/logging/Area;->CONFIG:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "getHomeUrl(): Bad URL value found in cache: \'%1$s\'"

    new-array v7, v9, [Ljava/lang/Object;

    aput-object v1, v7, v10

    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;)V

    .line 427
    iget-object v3, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mCommContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-static {v3, v9}, Lcom/getjar/sdk/comm/GetJarConfig;->getInstance(Lcom/getjar/sdk/comm/CommContext;Z)Lcom/getjar/sdk/comm/GetJarConfig;

    move-result-object v3

    const-string v4, "webview.default_url"

    invoke-virtual {v3, v4}, Lcom/getjar/sdk/comm/GetJarConfig;->getDirectiveValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mUrl:Ljava/lang/String;

    goto :goto_0

    .line 442
    .end local v0    # "e":Ljava/net/URISyntaxException;
    .end local v1    # "historyUrl":Ljava/lang/String;
    :cond_1
    const-string v3, "file:///android_asset/errorMessage.html"

    iput-object v3, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mUrl:Ljava/lang/String;

    .line 443
    sget-object v3, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->sErrorSource:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorSource;

    sget-object v4, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorType;->NETWORK:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorType;

    iput-object v4, v3, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorSource;->mErrorType:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorType;

    .line 448
    :cond_2
    sget-object v3, Lcom/getjar/sdk/logging/Area;->CONFIG:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "getHomeUrl(): returning \'%1$s\'"

    new-array v7, v9, [Ljava/lang/Object;

    iget-object v8, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mUrl:Ljava/lang/String;

    aput-object v8, v7, v10

    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 449
    iget-object v3, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mUrl:Ljava/lang/String;

    goto :goto_1
.end method

.method private getScreenWakeupReceiver()Landroid/content/BroadcastReceiver;
    .locals 2

    .prologue
    .line 190
    sget-object v0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->_ScreenWakeupReceiver:Landroid/content/BroadcastReceiver;

    if-nez v0, :cond_0

    .line 191
    new-instance v0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ScreenWakeupReceiver;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ScreenWakeupReceiver;-><init>(Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$1;)V

    sput-object v0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->_ScreenWakeupReceiver:Landroid/content/BroadcastReceiver;

    .line 193
    :cond_0
    sget-object v0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->_ScreenWakeupReceiver:Landroid/content/BroadcastReceiver;

    return-object v0
.end method

.method private getUserSwitchedTextElement(Ljava/lang/String;Landroid/widget/LinearLayout$LayoutParams;Z)Landroid/widget/TextView;
    .locals 5
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "textViewParams"    # Landroid/widget/LinearLayout$LayoutParams;
    .param p3, "isAccountName"    # Z

    .prologue
    const/16 v4, 0xa

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 917
    new-instance v0, Landroid/widget/TextView;

    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->getJarActivity:Lcom/getjar/sdk/rewards/GetJarActivity;

    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 918
    .local v0, "message":Landroid/widget/TextView;
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 919
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 920
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setGravity(I)V

    .line 921
    if-eqz p3, :cond_0

    .line 922
    const/4 v1, 0x0

    invoke-virtual {v0, v1, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 923
    invoke-virtual {v0, v2, v4, v2, v4}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 925
    :cond_0
    return-object v0
.end method

.method private initWebView()V
    .locals 5

    .prologue
    .line 464
    sget-object v1, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    const-string v3, "initWebView()"

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;)V

    .line 466
    new-instance v1, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;

    iget-object v2, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mCommContext:Lcom/getjar/sdk/comm/CommContext;

    iget-object v3, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mReceiver:Landroid/os/ResultReceiver;

    iget-object v4, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mOffers:Ljava/util/ArrayList;

    invoke-direct {v1, v2, p0, v3, v4}, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;-><init>(Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;Landroid/os/ResultReceiver;Ljava/util/List;)V

    iput-object v1, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mJavaScriptInterface:Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;

    .line 467
    sget-object v1, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mWebView:Landroid/webkit/WebView;

    iget-object v2, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mJavaScriptInterface:Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;

    const-string v3, "GetJarSDK"

    invoke-virtual {v1, v2, v3}, Landroid/webkit/WebView;->addJavascriptInterface(Ljava/lang/Object;Ljava/lang/String;)V

    .line 468
    sget-object v1, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mWebView:Landroid/webkit/WebView;

    const/high16 v2, 0x2000000

    invoke-virtual {v1, v2}, Landroid/webkit/WebView;->setScrollBarStyle(I)V

    .line 471
    sget-object v1, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v1}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    .line 472
    .local v0, "webSettings":Landroid/webkit/WebSettings;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 473
    sget-object v1, Landroid/webkit/WebSettings$RenderPriority;->HIGH:Landroid/webkit/WebSettings$RenderPriority;

    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setRenderPriority(Landroid/webkit/WebSettings$RenderPriority;)V

    .line 474
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mUserAgent:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setUserAgentString(Ljava/lang/String;)V

    .line 475
    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setCacheMode(I)V

    .line 476
    sget-object v1, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v1, p0}, Landroid/webkit/WebView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 478
    sget-object v1, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mWebView:Landroid/webkit/WebView;

    new-instance v2, Lcom/getjar/sdk/rewards/GetJarWebViewClient;

    iget-object v3, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mCommContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-direct {v2, p0, v3}, Lcom/getjar/sdk/rewards/GetJarWebViewClient;-><init>(Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;Lcom/getjar/sdk/comm/CommContext;)V

    invoke-virtual {v1, v2}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 479
    sget-object v1, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mWebView:Landroid/webkit/WebView;

    new-instance v2, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$5;

    invoke-direct {v2, p0}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$5;-><init>(Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;)V

    invoke-virtual {v1, v2}, Landroid/webkit/WebView;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V

    .line 486
    return-void
.end method

.method private isUrlExpired()Z
    .locals 13

    .prologue
    const/4 v12, 0x2

    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 364
    iget-object v5, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->getJarActivity:Lcom/getjar/sdk/rewards/GetJarActivity;

    invoke-virtual {v5}, Lcom/getjar/sdk/rewards/GetJarActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5}, Lcom/getjar/sdk/utilities/RewardUtility;->getWebSharedPrefsMap(Landroid/content/Context;)Ljava/util/Map;

    move-result-object v4

    .line 365
    .local v4, "rewardsPrefsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;*>;"
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    const-string v5, "web.timestamp"

    invoke-interface {v4, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Long;

    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v10

    sub-long/2addr v8, v10

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    .line 366
    .local v0, "age":Ljava/lang/Long;
    sget-object v5, Lcom/getjar/sdk/logging/Area;->CONFIG:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v8

    sget-object v5, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v10

    or-long/2addr v8, v10

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v10, "isUrlExpired(): URL cache age: %1$d"

    new-array v11, v6, [Ljava/lang/Object;

    aput-object v0, v11, v7

    invoke-static {v5, v10, v11}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v8, v9, v5}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 368
    const-wide/16 v1, 0xa

    .line 370
    .local v1, "cachedUrlTtl":J
    :try_start_0
    iget-object v5, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mCommContext:Lcom/getjar/sdk/comm/CommContext;

    const/4 v8, 0x1

    invoke-static {v5, v8}, Lcom/getjar/sdk/comm/GetJarConfig;->getInstance(Lcom/getjar/sdk/comm/CommContext;Z)Lcom/getjar/sdk/comm/GetJarConfig;

    move-result-object v5

    const-string v8, "webview.saved_url.ttl"

    invoke-virtual {v5, v8}, Lcom/getjar/sdk/comm/GetJarConfig;->getDirectiveValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v8

    invoke-static {v8, v9}, Lcom/getjar/sdk/utilities/Utility;->convertMillSec(J)J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v1

    .line 376
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v8

    cmp-long v5, v8, v1

    if-ltz v5, :cond_0

    .line 377
    sget-object v5, Lcom/getjar/sdk/logging/Area;->CONFIG:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v8

    sget-object v5, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v10

    or-long/2addr v8, v10

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v10, "isUrlExpired(): AGE:%1$d >= TTL:%2$d  [Returning:TRUE]"

    new-array v11, v12, [Ljava/lang/Object;

    aput-object v0, v11, v7

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    aput-object v7, v11, v6

    invoke-static {v5, v10, v11}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v8, v9, v5}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    move v5, v6

    .line 381
    :goto_0
    return v5

    .line 371
    :catch_0
    move-exception v3

    .line 372
    .local v3, "e":Ljava/lang/Exception;
    sget-object v5, Lcom/getjar/sdk/logging/Area;->CONFIG:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    sget-object v8, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v8}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v8

    or-long/2addr v5, v8

    const-string v8, "isUrlExpired(): failed"

    invoke-static {v5, v6, v8, v3}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    move v5, v7

    .line 373
    goto :goto_0

    .line 380
    .end local v3    # "e":Ljava/lang/Exception;
    :cond_0
    sget-object v5, Lcom/getjar/sdk/logging/Area;->CONFIG:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v8

    sget-object v5, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v10

    or-long/2addr v8, v10

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v10, "isUrlExpired(): AGE:%1$d < TTL:%2$d  [Returning:FALSE]"

    new-array v11, v12, [Ljava/lang/Object;

    aput-object v0, v11, v7

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v12

    aput-object v12, v11, v6

    invoke-static {v5, v10, v11}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v8, v9, v5}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    move v5, v7

    .line 381
    goto :goto_0
.end method

.method public static loadErrorPage(Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorType;Ljava/lang/String;Landroid/webkit/WebView;)V
    .locals 4
    .param p0, "type"    # Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorType;
    .param p1, "subCode"    # Ljava/lang/String;
    .param p2, "view"    # Landroid/webkit/WebView;

    .prologue
    .line 386
    sget-object v0, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "loadErrorPage: ErrorType:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorType;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 387
    sget-object v0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->sErrorSource:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorSource;

    iput-object p0, v0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorSource;->mErrorType:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorType;

    .line 388
    sget-object v0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->sErrorSource:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorSource;

    iput-object p1, v0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorSource;->mSubCode:Ljava/lang/String;

    .line 389
    const-string v0, "file:///android_asset/errorMessage.html"

    invoke-static {p2, v0}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->loadUrlInWebView(Landroid/webkit/WebView;Ljava/lang/String;)V

    .line 390
    return-void
.end method

.method public static loadUrl(Ljava/lang/String;)V
    .locals 6
    .param p0, "url"    # Ljava/lang/String;

    .prologue
    .line 721
    sget-object v1, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mWebView:Landroid/webkit/WebView;

    if-eqz v1, :cond_0

    .line 725
    :try_start_0
    new-instance v1, Ljava/net/URI;

    invoke-direct {v1, p0}, Ljava/net/URI;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_0

    .line 732
    sget-object v1, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mWebView:Landroid/webkit/WebView;

    invoke-static {v1, p0}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->loadUrlInWebView(Landroid/webkit/WebView;Ljava/lang/String;)V

    .line 734
    :cond_0
    :goto_0
    return-void

    .line 726
    :catch_0
    move-exception v0

    .line 727
    .local v0, "e":Ljava/net/URISyntaxException;
    sget-object v1, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    const-string v3, "loadUrl() failed [url:%1$s]"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object p0, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method protected static loadUrlInWebView(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 1
    .param p0, "webView"    # Landroid/webkit/WebView;
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 737
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->loadUrlInWebView(Landroid/webkit/WebView;Ljava/lang/String;Z)V

    .line 738
    return-void
.end method

.method protected static loadUrlInWebView(Landroid/webkit/WebView;Ljava/lang/String;Z)V
    .locals 10
    .param p0, "webView"    # Landroid/webkit/WebView;
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "clearHistory"    # Z

    .prologue
    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 743
    sget-object v1, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "Loading URL \'%1$s\' from \'%2$s\'"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    aput-object p1, v5, v8

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v6

    const/4 v7, 0x3

    aget-object v6, v6, v7

    invoke-virtual {v6}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v9

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 744
    if-nez p0, :cond_1

    .line 745
    sget-object v1, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    const-string v3, "loadUrlInWebView() called with NULL WebView"

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;)V

    .line 787
    :cond_0
    :goto_0
    return-void

    .line 748
    :cond_1
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 749
    sget-object v1, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    const-string v3, "loadUrlInWebView() called with NULL or empty url"

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;)V

    goto :goto_0

    .line 754
    :cond_2
    invoke-static {}, Lcom/getjar/sdk/utilities/Utility;->isCurrentThreadTheUIThread()Z

    move-result v1

    if-nez v1, :cond_3

    .line 757
    sget-object v1, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "Loading URL \'%1$s\' from non-UI thread! Posting back to UI thread."

    new-array v5, v9, [Ljava/lang/Object;

    aput-object p1, v5, v8

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;)V

    .line 758
    new-instance v1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v2, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$6;

    invoke-direct {v2, p0, p1, p2}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$6;-><init>(Landroid/webkit/WebView;Ljava/lang/String;Z)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    .line 780
    :cond_3
    invoke-virtual {p0, p1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 783
    if-eqz p2, :cond_0

    .line 784
    :try_start_0
    invoke-virtual {p0}, Landroid/webkit/WebView;->clearHistory()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    const-string v3, "WebView.clearHistory() failed"

    invoke-static {v1, v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method private purchaseFail(Landroid/os/Bundle;)V
    .locals 8
    .param p1, "bundle"    # Landroid/os/Bundle;

    .prologue
    .line 960
    invoke-virtual {p0}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->waitDialogHide()V

    .line 961
    const-string v5, "id"

    invoke-virtual {p1, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 962
    .local v2, "productId":Ljava/lang/String;
    const-string v5, "name"

    invoke-virtual {p1, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 963
    .local v3, "productName":Ljava/lang/String;
    const-string v5, "price"

    invoke-virtual {p1, v5}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    .line 964
    .local v1, "productCost":Ljava/lang/Long;
    invoke-static {}, Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;->KEY()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 965
    .local v4, "substate":Ljava/lang/String;
    sget-object v5, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mWebView:Landroid/webkit/WebView;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "javascript:GJ.failedPurchaseUnmanagedOffer(\""

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "\",\""

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "\",\""

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "\","

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ")"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->loadUrlInWebView(Landroid/webkit/WebView;Ljava/lang/String;)V

    .line 967
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 968
    .local v0, "intent":Landroid/content/Intent;
    invoke-virtual {v0, p1}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    .line 969
    iget-object v5, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->getJarActivity:Lcom/getjar/sdk/rewards/GetJarActivity;

    const/4 v6, 0x0

    invoke-virtual {v5, v6, v0}, Lcom/getjar/sdk/rewards/GetJarActivity;->setResult(ILandroid/content/Intent;)V

    .line 970
    iget-object v5, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->getJarActivity:Lcom/getjar/sdk/rewards/GetJarActivity;

    invoke-virtual {v5}, Lcom/getjar/sdk/rewards/GetJarActivity;->finish()V

    .line 971
    return-void
.end method

.method private purchaseSuccess(Landroid/os/Bundle;)V
    .locals 8
    .param p1, "bundle"    # Landroid/os/Bundle;

    .prologue
    .line 935
    invoke-virtual {p0}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->waitDialogHide()V

    .line 936
    const-string v5, "id"

    invoke-virtual {p1, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 937
    .local v2, "productId":Ljava/lang/String;
    const-string v5, "name"

    invoke-virtual {p1, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 938
    .local v3, "productName":Ljava/lang/String;
    const-string v5, "price"

    invoke-virtual {p1, v5}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    .line 939
    .local v1, "productCost":Ljava/lang/Long;
    if-nez v1, :cond_0

    .line 941
    new-instance v5, Ljava/lang/IllegalStateException;

    const-string v6, "Product cost cannot be null"

    invoke-direct {v5, v6}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 944
    :cond_0
    invoke-static {}, Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;->KEY()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 945
    .local v4, "substate":Ljava/lang/String;
    sget-object v5, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mWebView:Landroid/webkit/WebView;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "javascript:GJ.successfulPurchaseUnmanagedOffer(\""

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "\",\""

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "\",\""

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "\","

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ")"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->loadUrlInWebView(Landroid/webkit/WebView;Ljava/lang/String;)V

    .line 947
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 948
    .local v0, "intent":Landroid/content/Intent;
    invoke-virtual {v0, p1}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    .line 949
    iget-object v5, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->getJarActivity:Lcom/getjar/sdk/rewards/GetJarActivity;

    const/4 v6, -0x1

    invoke-virtual {v5, v6, v0}, Lcom/getjar/sdk/rewards/GetJarActivity;->setResult(ILandroid/content/Intent;)V

    .line 950
    iget-object v5, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->getJarActivity:Lcom/getjar/sdk/rewards/GetJarActivity;

    invoke-virtual {v5}, Lcom/getjar/sdk/rewards/GetJarActivity;->finish()V

    .line 951
    return-void
.end method

.method protected static saveCallback(Ljava/lang/String;Landroid/content/Context;)V
    .locals 7
    .param p0, "callback"    # Ljava/lang/String;
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v6, 0x0

    .line 629
    invoke-static {p0}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "\'callback\' cannot be null or empty"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 631
    :cond_0
    const-string v2, "GetJarClientPrefs"

    invoke-virtual {p1, v2, v6}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 632
    .local v1, "prefs":Landroid/content/SharedPreferences;
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 633
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "%1$d.%2$s"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/16 v5, 0x65

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v6

    const/4 v5, 0x1

    const-string v6, "GooglePlayResponseCallback"

    aput-object v6, v4, v5

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2, p0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 634
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 635
    return-void
.end method

.method private serviceFail(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "bundle"    # Landroid/os/Bundle;

    .prologue
    .line 980
    invoke-virtual {p0}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->waitDialogHide()V

    .line 981
    sget-object v0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorType;->SERVICE:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorType;

    const-string v1, ""

    sget-object v2, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mWebView:Landroid/webkit/WebView;

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->loadErrorPage(Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorType;Ljava/lang/String;Landroid/webkit/WebView;)V

    .line 982
    return-void
.end method

.method private showUserSwitchedUIAsNeeded()V
    .locals 12
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "InlinedApi"
        }
    .end annotation

    .prologue
    .line 825
    :try_start_0
    iget-object v6, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->getJarActivity:Lcom/getjar/sdk/rewards/GetJarActivity;

    invoke-virtual {v6}, Lcom/getjar/sdk/rewards/GetJarActivity;->getPackageName()Ljava/lang/String;

    move-result-object v6

    const-string v7, "com.getjar.rewards"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 829
    sget-object v6, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    const-string v8, "USER_SWITCHED_UI: We are Rewards"

    invoke-static {v6, v7, v8}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 830
    iget-object v6, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->getJarActivity:Lcom/getjar/sdk/rewards/GetJarActivity;

    invoke-static {v6}, Lcom/getjar/sdk/comm/auth/AuthManager;->initialize(Landroid/content/Context;)V

    .line 831
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v6

    invoke-virtual {v6}, Lcom/getjar/sdk/comm/auth/AuthManager;->waitOnAuth()V

    .line 832
    iget-object v6, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->getJarActivity:Lcom/getjar/sdk/rewards/GetJarActivity;

    invoke-static {v6}, Lcom/getjar/sdk/comm/auth/AccountHistoryManager;->initialize(Landroid/content/Context;)V

    .line 833
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AccountHistoryManager;->getInstance()Lcom/getjar/sdk/comm/auth/AccountHistoryManager;

    move-result-object v6

    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v7

    invoke-virtual {v7}, Lcom/getjar/sdk/comm/auth/AuthManager;->getUserAccessId()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/getjar/sdk/comm/auth/AccountHistoryManager;->isUserSwitchedUINeeded(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 835
    sget-object v6, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    const-string v8, "USER_SWITCHED_UI: isUserSwitchedUINeeded() == true"

    invoke-static {v6, v7, v8}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 836
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AccountHistoryManager;->getInstance()Lcom/getjar/sdk/comm/auth/AccountHistoryManager;

    move-result-object v6

    invoke-virtual {v6}, Lcom/getjar/sdk/comm/auth/AccountHistoryManager;->getCurrentAccountName()Ljava/lang/String;

    move-result-object v1

    .line 837
    .local v1, "currentAccountName":Ljava/lang/String;
    invoke-static {v1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 838
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AccountHistoryManager;->getInstance()Lcom/getjar/sdk/comm/auth/AccountHistoryManager;

    move-result-object v6

    invoke-virtual {v6}, Lcom/getjar/sdk/comm/auth/AccountHistoryManager;->getPreviousAccountName()Ljava/lang/String;

    move-result-object v4

    .line 839
    .local v4, "previousAccountName":Ljava/lang/String;
    invoke-static {v4}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 841
    sget-object v6, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    sget-object v8, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v9, "USER_SWITCHED_UI: currentAccountName:%1$s previousAccountName:%2$s"

    const/4 v10, 0x2

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    aput-object v1, v10, v11

    const/4 v11, 0x1

    aput-object v4, v10, v11

    invoke-static {v8, v9, v10}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v6, v7, v8}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 842
    invoke-virtual {v1, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 844
    sget-object v6, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    const-string v8, "USER_SWITCHED_UI: Showing UI..."

    invoke-static {v6, v7, v8}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 845
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v6, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->getJarActivity:Lcom/getjar/sdk/rewards/GetJarActivity;

    invoke-direct {v0, v6}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 848
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    new-instance v3, Landroid/widget/LinearLayout;

    iget-object v6, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->getJarActivity:Lcom/getjar/sdk/rewards/GetJarActivity;

    invoke-direct {v3, v6}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 850
    .local v3, "main":Landroid/widget/LinearLayout;
    const/4 v6, 0x1

    invoke-virtual {v3, v6}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 851
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v6, -0x1

    const/4 v7, -0x2

    invoke-direct {v5, v6, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 852
    .local v5, "textViewParams":Landroid/widget/LinearLayout$LayoutParams;
    const/4 v6, 0x6

    const/4 v7, 0x6

    const/4 v8, 0x6

    const/4 v9, 0x6

    invoke-virtual {v5, v6, v7, v8, v9}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 854
    const-string v6, "You have multiple accounts with Getjar. You are now logged in as:"

    const/4 v7, 0x0

    invoke-direct {p0, v6, v5, v7}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->getUserSwitchedTextElement(Ljava/lang/String;Landroid/widget/LinearLayout$LayoutParams;Z)Landroid/widget/TextView;

    move-result-object v6

    invoke-virtual {v3, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 855
    const/4 v6, 0x1

    invoke-direct {p0, v1, v5, v6}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->getUserSwitchedTextElement(Ljava/lang/String;Landroid/widget/LinearLayout$LayoutParams;Z)Landroid/widget/TextView;

    move-result-object v6

    invoke-virtual {v3, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 856
    const-string v6, "You were previously logged in as:"

    const/4 v7, 0x0

    invoke-direct {p0, v6, v5, v7}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->getUserSwitchedTextElement(Ljava/lang/String;Landroid/widget/LinearLayout$LayoutParams;Z)Landroid/widget/TextView;

    move-result-object v6

    invoke-virtual {v3, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 857
    const/4 v6, 0x1

    invoke-direct {p0, v4, v5, v6}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->getUserSwitchedTextElement(Ljava/lang/String;Landroid/widget/LinearLayout$LayoutParams;Z)Landroid/widget/TextView;

    move-result-object v6

    invoke-virtual {v3, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 859
    invoke-virtual {v0, v3}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    .line 861
    invoke-virtual {p0}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->getParentActivity()Landroid/app/Activity;

    move-result-object v6

    new-instance v7, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$8;

    invoke-direct {v7, p0, v0}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$8;-><init>(Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;Landroid/app/AlertDialog$Builder;)V

    invoke-virtual {v6, v7}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 914
    .end local v0    # "builder":Landroid/app/AlertDialog$Builder;
    .end local v1    # "currentAccountName":Ljava/lang/String;
    .end local v3    # "main":Landroid/widget/LinearLayout;
    .end local v4    # "previousAccountName":Ljava/lang/String;
    .end local v5    # "textViewParams":Landroid/widget/LinearLayout$LayoutParams;
    :cond_0
    :goto_0
    return-void

    .line 911
    :catch_0
    move-exception v2

    .line 912
    .local v2, "e":Ljava/lang/Exception;
    sget-object v6, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    const-string v8, "USER_SWITCHED_UI: Work for \'user switched\' UI failed"

    invoke-static {v6, v7, v8, v2}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public static updateUIWithEarnResults(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;)V
    .locals 9
    .param p0, "earnState"    # Ljava/lang/String;
    .param p1, "earnSubstate"    # Ljava/lang/String;
    .param p2, "friendlyName"    # Ljava/lang/String;
    .param p3, "amount"    # J
    .param p5, "packageName"    # Ljava/lang/String;
    .param p6, "legacyItemId"    # Ljava/lang/String;

    .prologue
    .line 516
    invoke-static {p5}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "\'packageName\' cannot be NULL or empty"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 518
    :cond_0
    sget-object v2, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    sget-object v4, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "GetJarActivity: updateUIWithEarnResults() started [earnState:%1$s earnSubstate:%2$s friendlyName:%3$s amount:%4$d packageName:%5$s legacyItemId:%6$s]"

    const/4 v6, 0x6

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object p0, v6, v7

    const/4 v7, 0x1

    aput-object p1, v6, v7

    const/4 v7, 0x2

    aput-object p2, v6, v7

    const/4 v7, 0x3

    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x4

    aput-object p5, v6, v7

    const/4 v7, 0x5

    aput-object p6, v6, v7

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    .line 529
    :try_start_0
    sget-object v2, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mWebView:Landroid/webkit/WebView;

    if-nez v2, :cond_1

    .line 530
    sget-object v2, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    sget-object v4, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "GetJarActivity: updateUIWithEarnResults() not refreshing, WebView is NULL"

    const/4 v6, 0x0

    new-array v6, v6, [Ljava/lang/Object;

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 559
    sget-object v2, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    sget-object v4, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    const-string v4, "GetJarActivity: updateUIWithEarnResults() finished"

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    .line 561
    :goto_0
    return-void

    .line 535
    :cond_1
    const/4 v1, 0x0

    .line 536
    .local v1, "urlFormat":Ljava/lang/String;
    :try_start_1
    const-string v2, "SUCCESS"

    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 539
    sget-object v2, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    sget-object v4, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    const-string v4, "GetJarActivity: updateUIWithEarnResults() calling javascript:GJ.successfulEarnInstall()"

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    .line 540
    const-string v1, "javascript:GJ.successfulEarnInstall(\"%1$s\",\"%2$s\",\"%3$s\",\"%4$s\",%5$d)"

    .line 549
    :goto_1
    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const/4 v3, 0x5

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p6, v3, v4

    const/4 v4, 0x1

    aput-object p5, v3, v4

    const/4 v4, 0x2

    aput-object p2, v3, v4

    const/4 v4, 0x3

    aput-object p1, v3, v4

    const/4 v4, 0x4

    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v2, v1, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 556
    .local v0, "url":Ljava/lang/String;
    sget-object v2, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mWebView:Landroid/webkit/WebView;

    invoke-static {v2, v0}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->loadUrlInWebView(Landroid/webkit/WebView;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 559
    sget-object v2, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    sget-object v4, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    const-string v4, "GetJarActivity: updateUIWithEarnResults() finished"

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    goto :goto_0

    .line 544
    .end local v0    # "url":Ljava/lang/String;
    :cond_2
    :try_start_2
    sget-object v2, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    sget-object v4, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    const-string v4, "GetJarActivity: updateUIWithEarnResults() calling javascript:GJ.failedEarnInstall()"

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    .line 545
    const-string v1, "javascript:GJ.failedEarnInstall(\"%1$s\",\"%2$s\",\"%3$s\",\"%4$s\",%5$d)"
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    .line 559
    .end local v1    # "urlFormat":Ljava/lang/String;
    :catchall_0
    move-exception v2

    sget-object v3, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    sget-object v5, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    const-string v5, "GetJarActivity: updateUIWithEarnResults() finished"

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    throw v2
.end method

.method public static updateUIwithOfferResults(Landroid/content/Context;Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;Lorg/json/JSONObject;)V
    .locals 7
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "managedOfferStatus"    # Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;
    .param p2, "resultJson"    # Lorg/json/JSONObject;

    .prologue
    .line 571
    if-nez p0, :cond_0

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v6, "\'context\' cannot be null"

    invoke-direct {v1, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 572
    :cond_0
    if-nez p1, :cond_1

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v6, "\'managedOfferStatus\' cannot be null"

    invoke-direct {v1, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 574
    :cond_1
    invoke-static {p0}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->getCallbackString(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 576
    .local v0, "callbackString":Ljava/lang/String;
    const/4 v2, 0x0

    .line 577
    .local v2, "success":Z
    const/4 v3, 0x0

    .line 578
    .local v3, "moneyTaken":Z
    const/4 v4, 0x0

    .line 579
    .local v4, "recoverable":Z
    sget-object v5, Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;->NONE:Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;

    .line 581
    .local v5, "reason":Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;
    sget-object v1, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$10;->$SwitchMap$com$getjar$sdk$rewards$InAppPurchaseManager$ManagedOfferStatus:[I

    invoke-virtual {p1}, Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;->ordinal()I

    move-result v6

    aget v1, v1, v6

    packed-switch v1, :pswitch_data_0

    .line 612
    const/4 v2, 0x0

    .line 613
    const/4 v3, 0x0

    .line 614
    const/4 v4, 0x0

    .line 615
    sget-object v5, Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;->UNKNOWN:Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;

    .line 619
    :goto_0
    const/4 v6, 0x0

    move-object v1, p2

    invoke-static/range {v0 .. v6}, Lcom/getjar/sdk/rewards/JavaScriptAPI;->addDataAndMakeJSCallback(Ljava/lang/String;Lorg/json/JSONObject;ZZZLcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;Ljava/lang/Throwable;)V

    .line 620
    return-void

    .line 583
    :pswitch_0
    const/4 v2, 0x1

    .line 584
    const/4 v3, 0x1

    .line 585
    const/4 v4, 0x1

    .line 586
    goto :goto_0

    .line 588
    :pswitch_1
    const/4 v2, 0x0

    .line 589
    const/4 v3, 0x1

    .line 590
    const/4 v4, 0x1

    .line 591
    sget-object v5, Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;->NETWORK:Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;

    .line 592
    goto :goto_0

    .line 594
    :pswitch_2
    const/4 v2, 0x0

    .line 595
    const/4 v3, 0x1

    .line 596
    const/4 v4, 0x0

    .line 597
    sget-object v5, Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;->UNKNOWN:Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;

    .line 598
    goto :goto_0

    .line 600
    :pswitch_3
    const/4 v2, 0x0

    .line 601
    const/4 v3, 0x0

    .line 602
    const/4 v4, 0x0

    .line 603
    sget-object v5, Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;->MARKETPLACE:Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;

    .line 604
    goto :goto_0

    .line 606
    :pswitch_4
    const/4 v2, 0x0

    .line 607
    const/4 v3, 0x1

    .line 608
    const/4 v4, 0x0

    .line 609
    sget-object v5, Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;->MARKETPLACE:Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;

    .line 610
    goto :goto_0

    .line 581
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method


# virtual methods
.method public close()V
    .locals 8

    .prologue
    .line 699
    :try_start_0
    invoke-virtual {p0}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->hideManagedDialogs()V

    .line 700
    invoke-virtual {p0}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->waitDialogHide()V

    .line 701
    iget-object v2, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mCommContext:Lcom/getjar/sdk/comm/CommContext;

    new-instance v3, Lcom/getjar/sdk/response/CloseResponse;

    invoke-direct {v3}, Lcom/getjar/sdk/response/CloseResponse;-><init>()V

    invoke-virtual {v2, v3}, Lcom/getjar/sdk/comm/CommContext;->postResponse(Lcom/getjar/sdk/response/Response;)V

    .line 704
    invoke-virtual {p0}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->getCurrentPurchaseClientTransactionId()Ljava/lang/String;

    move-result-object v0

    .line 705
    .local v0, "clientTransactionId":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 706
    sget-object v2, Lcom/getjar/sdk/logging/Area;->PURCHASE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "Cancelling clientTransactionId %1$s"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object v0, v6, v7

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 707
    new-instance v1, Lcom/getjar/sdk/comm/TransactionManager;

    iget-object v2, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->getJarActivity:Lcom/getjar/sdk/rewards/GetJarActivity;

    invoke-virtual {v2}, Lcom/getjar/sdk/rewards/GetJarActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/getjar/sdk/comm/TransactionManager;-><init>(Landroid/content/Context;)V

    .line 708
    .local v1, "transactionManager":Lcom/getjar/sdk/comm/TransactionManager;
    iget-object v2, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mCommContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v1, v0, v2}, Lcom/getjar/sdk/comm/TransactionManager;->cancelPurchaseTransaction(Ljava/lang/String;Lcom/getjar/sdk/comm/CommContext;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 716
    .end local v1    # "transactionManager":Lcom/getjar/sdk/comm/TransactionManager;
    :cond_0
    iget-object v2, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->getJarActivity:Lcom/getjar/sdk/rewards/GetJarActivity;

    invoke-virtual {v2}, Lcom/getjar/sdk/rewards/GetJarActivity;->finish()V

    .line 718
    return-void

    .line 716
    .end local v0    # "clientTransactionId":Ljava/lang/String;
    :catchall_0
    move-exception v2

    iget-object v3, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->getJarActivity:Lcom/getjar/sdk/rewards/GetJarActivity;

    invoke-virtual {v3}, Lcom/getjar/sdk/rewards/GetJarActivity;->finish()V

    throw v2
.end method

.method public getCurrentPurchaseClientTransactionId()Ljava/lang/String;
    .locals 8

    .prologue
    .line 217
    sget-object v0, Lcom/getjar/sdk/logging/Area;->PURCHASE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "getCurrentPurchaseClientTransactionId() called from \'%1$s\' returning \'%2$s\'"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v6

    const/4 v7, 0x3

    aget-object v6, v6, v7

    invoke-virtual {v6}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x1

    iget-object v6, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->_currentPurchaseClientTransactionId:Ljava/lang/String;

    aput-object v6, v4, v5

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 221
    iget-object v0, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->_currentPurchaseClientTransactionId:Ljava/lang/String;

    return-object v0
.end method

.method protected getDisplayLanguageTag()Ljava/lang/String;
    .locals 1

    .prologue
    .line 201
    sget-object v0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->Language:Ljava/lang/String;

    return-object v0
.end method

.method protected getShouldShowLoadingUI()Z
    .locals 1

    .prologue
    .line 197
    iget-boolean v0, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->_shouldShowLoadingUI:Z

    return v0
.end method

.method protected hideManagedDialogs()V
    .locals 5

    .prologue
    .line 991
    sget-object v2, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    const-string v4, "AuthFlow: hideManagedDialogs() START"

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 992
    iget-object v3, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->_dialogsToManageLock:Ljava/lang/Object;

    monitor-enter v3

    .line 993
    :try_start_0
    iget-object v2, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->_dialogsToManage:Ljava/util/List;

    if-eqz v2, :cond_0

    .line 994
    iget-object v2, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->_dialogsToManage:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Dialog;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 995
    .local v0, "dlg":Landroid/app/Dialog;
    :try_start_1
    invoke-virtual {v0}, Landroid/app/Dialog;->cancel()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    move-exception v2

    goto :goto_0

    .line 998
    .end local v0    # "dlg":Landroid/app/Dialog;
    .end local v1    # "i$":Ljava/util/Iterator;
    :cond_0
    :try_start_2
    monitor-exit v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 999
    sget-object v2, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    const-string v4, "AuthFlow: hideManagedDialogs() FINISH"

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 1000
    return-void

    .line 998
    :catchall_0
    move-exception v2

    :try_start_3
    monitor-exit v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v2
.end method

.method public loadPostAuthUI()V
    .locals 10

    .prologue
    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 794
    sget-object v2, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    const-string v4, "Waiting for UserAuth is dismissed"

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 795
    iget-boolean v2, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->_shouldShowLoadingUI:Z

    if-nez v2, :cond_0

    .line 796
    invoke-virtual {p0}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->waitDialogHide()V

    .line 798
    :cond_0
    const/4 v0, 0x0

    .line 799
    .local v0, "clearHistory":Z
    const/4 v1, 0x0

    .line 800
    .local v1, "url":Ljava/lang/String;
    sget-object v2, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "GetJarWebViewSubActivity: dismiss() loadWalletPage=%1$s"

    new-array v6, v9, [Ljava/lang/Object;

    iget-boolean v7, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->_loadWalletPage:Z

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    aput-object v7, v6, v8

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 801
    sget-object v2, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "GetJarWebViewSubActivity: dismiss() loadManagedCheckoutPage=%1$s"

    new-array v6, v9, [Ljava/lang/Object;

    iget-boolean v7, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->_loadCheckoutPage:Z

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    aput-object v7, v6, v8

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 802
    iget-boolean v2, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->_loadWalletPage:Z

    if-eqz v2, :cond_2

    .line 803
    iput-boolean v8, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->_loadWalletPage:Z

    .line 804
    iget-object v2, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mCommContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-static {v2, v9}, Lcom/getjar/sdk/comm/GetJarConfig;->getInstance(Lcom/getjar/sdk/comm/CommContext;Z)Lcom/getjar/sdk/comm/GetJarConfig;

    move-result-object v2

    const-string v3, "webview.wallet_url"

    invoke-virtual {v2, v3}, Lcom/getjar/sdk/comm/GetJarConfig;->getDirectiveValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 812
    :goto_0
    invoke-static {v1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 813
    sget-object v2, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "dismiss() Loading \'%1$s\'"

    new-array v6, v9, [Ljava/lang/Object;

    aput-object v1, v6, v8

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 814
    sget-object v2, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mWebView:Landroid/webkit/WebView;

    invoke-static {v2, v1, v0}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->loadUrlInWebView(Landroid/webkit/WebView;Ljava/lang/String;Z)V

    .line 818
    :cond_1
    sget-object v2, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->_ExecutorServiceUIWork:Ljava/util/concurrent/ExecutorService;

    new-instance v3, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$7;

    invoke-direct {v3, p0}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$7;-><init>(Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;)V

    invoke-interface {v2, v3}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 819
    return-void

    .line 805
    :cond_2
    iget-boolean v2, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->_loadCheckoutPage:Z

    if-eqz v2, :cond_3

    .line 806
    iput-boolean v8, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->_loadCheckoutPage:Z

    .line 807
    iget-object v2, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mCommContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-static {v2, v9}, Lcom/getjar/sdk/comm/GetJarConfig;->getInstance(Lcom/getjar/sdk/comm/CommContext;Z)Lcom/getjar/sdk/comm/GetJarConfig;

    move-result-object v2

    const-string v3, "webview.managed_checkout_url"

    invoke-virtual {v2, v3}, Lcom/getjar/sdk/comm/GetJarConfig;->getDirectiveValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 808
    const/4 v0, 0x1

    goto :goto_0

    .line 810
    :cond_3
    invoke-direct {p0}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->getHomeUrl()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 5
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 1523
    const/16 v3, 0x65

    if-ne p1, v3, :cond_0

    .line 1525
    move v1, p1

    .line 1526
    .local v1, "requestCodeFinal":I
    move v2, p2

    .line 1527
    .local v2, "resultCodeFinal":I
    move-object v0, p3

    .line 1530
    .local v0, "dataFinal":Landroid/content/Intent;
    sget-object v3, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->_ExecutorServiceForGooglePlayResultWork:Ljava/util/concurrent/ExecutorService;

    new-instance v4, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$9;

    invoke-direct {v4, p0, v1, v2, v0}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$9;-><init>(Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;IILandroid/content/Intent;)V

    invoke-interface {v3, v4}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 1544
    .end local v0    # "dataFinal":Landroid/content/Intent;
    .end local v1    # "requestCodeFinal":I
    .end local v2    # "resultCodeFinal":I
    :cond_0
    return-void
.end method

.method public onBackPressed()V
    .locals 4

    .prologue
    .line 1294
    :try_start_0
    sget-object v1, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v1}, Landroid/webkit/WebView;->canGoBack()Z

    move-result v1

    if-nez v1, :cond_0

    .line 1295
    sget-object v1, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    const-string v3, "onBackPressed() -- on last page, exiting.."

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 1296
    invoke-static {}, Lcom/getjar/sdk/utilities/GlobalActivityRegistrar;->getInstance()Lcom/getjar/sdk/utilities/GlobalActivityRegistrar;

    move-result-object v1

    invoke-virtual {v1}, Lcom/getjar/sdk/utilities/GlobalActivityRegistrar;->finishAllActivities()V

    .line 1297
    invoke-virtual {p0}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->close()V

    .line 1307
    :goto_0
    return-void

    .line 1300
    :cond_0
    sget-object v1, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v1}, Landroid/webkit/WebView;->goBack()V

    .line 1301
    sget-object v1, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    const-string v3, "onBackPressed() -- going back.."

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1304
    :catch_0
    move-exception v0

    .line 1305
    .local v0, "t":Ljava/lang/Throwable;
    sget-object v1, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    const-string v3, "GetJarActivity.onBackPressed() failed"

    invoke-static {v1, v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 6
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    const/4 v5, 0x1

    .line 1170
    const-string v0, "portrait"

    .line 1171
    .local v0, "orientation":Ljava/lang/String;
    iget v1, p1, Landroid/content/res/Configuration;->orientation:I

    const/4 v2, 0x2

    if-ne v1, v2, :cond_1

    .line 1173
    const-string v0, "landscape"

    .line 1179
    :cond_0
    :goto_0
    sget-object v1, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    sget-object v3, Lcom/getjar/sdk/logging/Area;->CONFIG:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "GetJarActivity -- onConfigurationChanged new orientation ="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 1180
    sget-object v1, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mWebView:Landroid/webkit/WebView;

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "javascript:GJ.orientationChangeHandler(\"%s\")"

    new-array v4, v5, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v0, v4, v5

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 1181
    invoke-super {p0, p1}, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 1182
    return-void

    .line 1175
    :cond_1
    iget v1, p1, Landroid/content/res/Configuration;->orientation:I

    if-ne v1, v5, :cond_0

    .line 1177
    const-string v0, "portrait"

    goto :goto_0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 14
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v13, 0x0

    const/4 v11, 0x1

    .line 1023
    sget-object v7, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    const-string v9, "GetJarActivity.onCreate()"

    invoke-static {v7, v8, v9}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 1024
    invoke-super {p0, p1}, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->onCreate(Landroid/os/Bundle;)V

    .line 1026
    invoke-static {}, Lcom/getjar/sdk/utilities/GlobalActivityRegistrar;->getInstance()Lcom/getjar/sdk/utilities/GlobalActivityRegistrar;

    move-result-object v7

    iget-object v8, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->getJarActivity:Lcom/getjar/sdk/rewards/GetJarActivity;

    invoke-virtual {v7, v8}, Lcom/getjar/sdk/utilities/GlobalActivityRegistrar;->registerActivity(Landroid/app/Activity;)V

    .line 1029
    const/4 v0, 0x0

    .line 1030
    .local v0, "commContextId":Ljava/lang/String;
    const/4 v6, 0x0

    .line 1032
    .local v6, "products":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/getjar/sdk/Product;>;"
    iget-object v7, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->getJarActivity:Lcom/getjar/sdk/rewards/GetJarActivity;

    invoke-virtual {v7}, Lcom/getjar/sdk/rewards/GetJarActivity;->getIntent()Landroid/content/Intent;

    move-result-object v7

    invoke-virtual {v7}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v2

    .line 1033
    .local v2, "extras":Landroid/os/Bundle;
    if-eqz v2, :cond_0

    .line 1034
    const-string v7, "productList"

    invoke-virtual {v2, v7}, Landroid/os/Bundle;->getParcelableArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v6

    .line 1036
    const-string v7, "getjarContextId"

    invoke-virtual {v2, v7}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1038
    const-string v7, "lang"

    invoke-virtual {v2, v7}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 1039
    .local v4, "language":Ljava/lang/String;
    invoke-static {v4}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_0

    .line 1043
    sput-object v4, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->Language:Ljava/lang/String;

    .line 1044
    sget-object v7, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    sget-object v9, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v9}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v9

    or-long/2addr v7, v9

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "GetJarActivity.onCreate() -- setting language to "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v7, v8, v9}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 1049
    .end local v4    # "language":Ljava/lang/String;
    :cond_0
    if-eqz v6, :cond_1

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-lez v7, :cond_1

    .line 1050
    iget-object v7, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mOffers:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->clear()V

    .line 1051
    invoke-virtual {v6}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/getjar/sdk/Product;

    .line 1052
    .local v5, "product":Lcom/getjar/sdk/Product;
    iget-object v7, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mOffers:Ljava/util/ArrayList;

    new-instance v8, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ProductWithClientTransactionID;

    invoke-direct {v8, p0, v5}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ProductWithClientTransactionID;-><init>(Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;Lcom/getjar/sdk/Product;)V

    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 1055
    .end local v3    # "i$":Ljava/util/Iterator;
    .end local v5    # "product":Lcom/getjar/sdk/Product;
    :cond_1
    sget-object v7, Lcom/getjar/sdk/logging/Area;->PURCHASE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    sget-object v9, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v9}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v9

    or-long/2addr v7, v9

    sget-object v9, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v9}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v9

    or-long/2addr v7, v9

    sget-object v9, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v10, "The Intent used to start the GetJarWebViewSubActivity must contain a Product list value for \'%1$s\' in its Extras"

    new-array v11, v11, [Ljava/lang/Object;

    const-string v12, "productList"

    aput-object v12, v11, v13

    invoke-static {v9, v10, v11}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v7, v8, v9}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;)V

    .line 1058
    iget-object v7, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->getJarActivity:Lcom/getjar/sdk/rewards/GetJarActivity;

    invoke-virtual {v7}, Lcom/getjar/sdk/rewards/GetJarActivity;->finish()V

    .line 1151
    :goto_1
    return-void

    .line 1063
    .restart local v3    # "i$":Ljava/util/Iterator;
    :cond_2
    invoke-static {v0}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 1064
    sget-object v7, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    sget-object v9, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v9}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v9

    or-long/2addr v7, v9

    sget-object v9, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v10, "The Intent used to start the GetJarActivity must contain a value for \'%1$s\' in its Extras"

    new-array v11, v11, [Ljava/lang/Object;

    const-string v12, "getjarContextId"

    aput-object v12, v11, v13

    invoke-static {v9, v10, v11}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v7, v8, v9}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;)V

    .line 1069
    iget-object v7, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->getJarActivity:Lcom/getjar/sdk/rewards/GetJarActivity;

    invoke-virtual {v7}, Lcom/getjar/sdk/rewards/GetJarActivity;->finish()V

    goto :goto_1

    .line 1074
    :cond_3
    iget-object v7, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->getJarActivity:Lcom/getjar/sdk/rewards/GetJarActivity;

    invoke-static {v7}, Lcom/getjar/sdk/comm/CommManager;->initialize(Landroid/content/Context;)V

    .line 1075
    invoke-static {v0}, Lcom/getjar/sdk/comm/CommManager;->retrieveContext(Ljava/lang/String;)Lcom/getjar/sdk/comm/CommContext;

    move-result-object v7

    iput-object v7, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mCommContext:Lcom/getjar/sdk/comm/CommContext;

    .line 1076
    iget-object v7, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mCommContext:Lcom/getjar/sdk/comm/CommContext;

    if-nez v7, :cond_4

    .line 1077
    sget-object v7, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    sget-object v9, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v9}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v9

    or-long/2addr v7, v9

    sget-object v9, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v10, "No CommContext instance found for the ID \'%1$s\'"

    new-array v11, v11, [Ljava/lang/Object;

    aput-object v0, v11, v13

    invoke-static {v9, v10, v11}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v7, v8, v9}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;)V

    .line 1082
    iget-object v7, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->getJarActivity:Lcom/getjar/sdk/rewards/GetJarActivity;

    invoke-virtual {v7}, Lcom/getjar/sdk/rewards/GetJarActivity;->finish()V

    goto :goto_1

    .line 1089
    :cond_4
    iput-boolean v11, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->_waitDialogWasShowing:Z

    .line 1090
    iget-object v7, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mCommContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v7}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v7

    invoke-static {v7}, Lcom/getjar/sdk/comm/auth/AuthManager;->initialize(Landroid/content/Context;)V

    .line 1091
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v7

    invoke-virtual {v7, p0}, Lcom/getjar/sdk/comm/auth/AuthManager;->ensureAuthWithUI(Lcom/getjar/sdk/comm/auth/AuthUIParentInterface;)Z

    .line 1093
    iget-object v7, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->getJarActivity:Lcom/getjar/sdk/rewards/GetJarActivity;

    invoke-virtual {v7}, Lcom/getjar/sdk/rewards/GetJarActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v7

    invoke-static {v7}, Lcom/getjar/sdk/utilities/Utility;->previousVersionCleanUp(Landroid/content/Context;)V

    .line 1094
    new-instance v7, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorSource;

    sget-object v8, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorType;->NETWORK:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorType;

    const-string v9, ""

    invoke-direct {v7, p0, v8, v9}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorSource;-><init>(Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorType;Ljava/lang/String;)V

    sput-object v7, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->sErrorSource:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorSource;

    .line 1097
    iget-object v7, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mCommContext:Lcom/getjar/sdk/comm/CommContext;

    iget-object v8, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->_commFailureCallback:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$CommFailureCallback;

    invoke-virtual {v7, v8}, Lcom/getjar/sdk/comm/CommContext;->registerFailureCallback(Lcom/getjar/sdk/comm/CommFailureCallbackInterface;)V

    .line 1101
    :try_start_0
    iget-object v7, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mCommContext:Lcom/getjar/sdk/comm/CommContext;

    const/4 v8, 0x1

    invoke-static {v7, v8}, Lcom/getjar/sdk/comm/GetJarConfig;->getInstance(Lcom/getjar/sdk/comm/CommContext;Z)Lcom/getjar/sdk/comm/GetJarConfig;

    move-result-object v7

    const-string v8, "webview.default_url"

    invoke-virtual {v7, v8}, Lcom/getjar/sdk/comm/GetJarConfig;->getDirectiveValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mUrl:Ljava/lang/String;

    .line 1102
    sget-object v7, Lcom/getjar/sdk/logging/Area;->CONFIG:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    sget-object v9, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v9}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v9

    or-long/2addr v7, v9

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "onCreate() -- using mUrl="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mUrl:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v7, v8, v9}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1109
    iget-object v7, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mCommContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v7}, Lcom/getjar/sdk/comm/CommContext;->getSdkUserAgent()Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mUserAgent:Ljava/lang/String;

    .line 1110
    iget-object v7, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->getJarActivity:Lcom/getjar/sdk/rewards/GetJarActivity;

    invoke-virtual {v7}, Lcom/getjar/sdk/rewards/GetJarActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v7

    invoke-static {v7}, Landroid/webkit/CookieSyncManager;->createInstance(Landroid/content/Context;)Landroid/webkit/CookieSyncManager;

    .line 1111
    new-instance v7, Landroid/webkit/WebView;

    iget-object v8, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->getJarActivity:Lcom/getjar/sdk/rewards/GetJarActivity;

    invoke-direct {v7, v8}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    sput-object v7, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mWebView:Landroid/webkit/WebView;

    .line 1112
    if-eqz p1, :cond_5

    .line 1113
    sget-object v7, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v7, p1}, Landroid/webkit/WebView;->restoreState(Landroid/os/Bundle;)Landroid/webkit/WebBackForwardList;

    .line 1121
    :cond_5
    iget-object v7, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->getJarActivity:Lcom/getjar/sdk/rewards/GetJarActivity;

    invoke-virtual {v7}, Lcom/getjar/sdk/rewards/GetJarActivity;->getPackageName()Ljava/lang/String;

    move-result-object v7

    const-string v8, "com.getjar.rewards"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_7

    .line 1122
    iget-object v7, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->getJarActivity:Lcom/getjar/sdk/rewards/GetJarActivity;

    const/4 v8, 0x7

    invoke-virtual {v7, v8}, Lcom/getjar/sdk/rewards/GetJarActivity;->requestWindowFeature(I)Z

    .line 1127
    :goto_2
    iget-object v7, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->getJarActivity:Lcom/getjar/sdk/rewards/GetJarActivity;

    sget-object v8, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v7, v8}, Lcom/getjar/sdk/rewards/GetJarActivity;->setContentView(Landroid/view/View;)V

    .line 1129
    invoke-direct {p0}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->initWebView()V

    .line 1132
    const-string v7, "showWallet"

    iget-object v8, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->getJarActivity:Lcom/getjar/sdk/rewards/GetJarActivity;

    invoke-virtual {v8}, Lcom/getjar/sdk/rewards/GetJarActivity;->getIntent()Landroid/content/Intent;

    move-result-object v8

    const-string v9, "getjarIntentType"

    invoke-virtual {v8, v9}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_8

    .line 1133
    sget-object v7, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    sget-object v9, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v9}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v9

    or-long/2addr v7, v9

    sget-object v9, Lcom/getjar/sdk/logging/Area;->REDEEM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v9}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v9

    or-long/2addr v7, v9

    const-string v9, "GetJarWebViewSubActivity: onCreate() setting loadWalletPage flag"

    invoke-static {v7, v8, v9}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 1134
    iput-boolean v11, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->_loadWalletPage:Z

    .line 1141
    :cond_6
    :goto_3
    invoke-virtual {p0}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->waitForAuthorization()V

    .line 1143
    new-instance v7, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$InAppBillingNotifier;

    invoke-direct {v7, p0}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$InAppBillingNotifier;-><init>(Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;)V

    iput-object v7, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->inAppBillingJSNotifier:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$InAppBillingNotifier;

    .line 1146
    iget-object v7, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->getJarActivity:Lcom/getjar/sdk/rewards/GetJarActivity;

    invoke-direct {p0}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->getScreenWakeupReceiver()Landroid/content/BroadcastReceiver;

    move-result-object v8

    new-instance v9, Landroid/content/IntentFilter;

    const-string v10, "android.intent.action.SCREEN_ON"

    invoke-direct {v9, v10}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v8, v9}, Lcom/getjar/sdk/rewards/GetJarActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 1150
    iput-boolean v11, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->_shouldShowLoadingUI:Z

    goto/16 :goto_1

    .line 1103
    :catch_0
    move-exception v1

    .line 1104
    .local v1, "e":Ljava/lang/Exception;
    sget-object v7, Lcom/getjar/sdk/logging/Area;->CONFIG:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    sget-object v9, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v9}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v9

    or-long/2addr v7, v9

    const-string v9, "GetJarActivity.onCreate() failed"

    invoke-static {v7, v8, v9, v1}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 1105
    new-instance v7, Ljava/lang/IllegalStateException;

    const-string v8, "Failed to determine default webview url, unable to create webview"

    invoke-direct {v7, v8}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 1124
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_7
    iget-object v7, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->getJarActivity:Lcom/getjar/sdk/rewards/GetJarActivity;

    invoke-virtual {v7, v11}, Lcom/getjar/sdk/rewards/GetJarActivity;->requestWindowFeature(I)Z

    goto :goto_2

    .line 1135
    :cond_8
    const-string v7, "showCheckout"

    iget-object v8, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->getJarActivity:Lcom/getjar/sdk/rewards/GetJarActivity;

    invoke-virtual {v8}, Lcom/getjar/sdk/rewards/GetJarActivity;->getIntent()Landroid/content/Intent;

    move-result-object v8

    const-string v9, "getjarIntentType"

    invoke-virtual {v8, v9}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_6

    .line 1136
    sget-object v7, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    sget-object v9, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v9}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v9

    or-long/2addr v7, v9

    sget-object v9, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v9}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v9

    or-long/2addr v7, v9

    const-string v9, "GetJarWebViewSubActivity: onCreate() setting loadCheckoutPage flag"

    invoke-static {v7, v8, v9}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 1137
    iput-boolean v11, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->_loadCheckoutPage:Z

    .line 1138
    iget-object v7, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mJavaScriptInterface:Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;

    iget-object v8, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->getJarActivity:Lcom/getjar/sdk/rewards/GetJarActivity;

    invoke-virtual {v8}, Lcom/getjar/sdk/rewards/GetJarActivity;->getIntent()Landroid/content/Intent;

    move-result-object v8

    const-string v9, "EXTRA_MANAGED_CHECKOUT_DATA"

    invoke-virtual {v8, v9}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->setCurrentManagedOfferDetails(Ljava/lang/String;)V

    goto :goto_3
.end method

.method public onDestroy()V
    .locals 5

    .prologue
    .line 1269
    :try_start_0
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mCommContext:Lcom/getjar/sdk/comm/CommContext;

    if-eqz v1, :cond_0

    .line 1270
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mCommContext:Lcom/getjar/sdk/comm/CommContext;

    new-instance v2, Lcom/getjar/sdk/response/CloseResponse;

    invoke-direct {v2}, Lcom/getjar/sdk/response/CloseResponse;-><init>()V

    invoke-virtual {v1, v2}, Lcom/getjar/sdk/comm/CommContext;->postResponse(Lcom/getjar/sdk/response/Response;)V

    .line 1272
    :cond_0
    invoke-virtual {p0}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->getParentActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->getBasicInstance(Landroid/content/Context;)Lcom/getjar/sdk/rewards/InAppPurchaseManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->unBindFromGooglePlaySvc()V

    .line 1273
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->getJarActivity:Lcom/getjar/sdk/rewards/GetJarActivity;

    invoke-direct {p0}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->getScreenWakeupReceiver()Landroid/content/BroadcastReceiver;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/getjar/sdk/rewards/GetJarActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 1274
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->getJarActivity:Lcom/getjar/sdk/rewards/GetJarActivity;

    invoke-static {v1}, Lcom/getjar/sdk/comm/StatisticsTracker;->dumpAllStatsToLogCat(Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1280
    invoke-virtual {p0}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->hideManagedDialogs()V

    .line 1281
    invoke-virtual {p0}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->waitDialogHide()V

    .line 1282
    invoke-super {p0}, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->onDestroy()V

    .line 1284
    :goto_0
    return-void

    .line 1275
    :catch_0
    move-exception v0

    .line 1278
    .local v0, "t":Ljava/lang/Throwable;
    :try_start_1
    sget-object v1, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    sget-object v3, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1280
    invoke-virtual {p0}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->hideManagedDialogs()V

    .line 1281
    invoke-virtual {p0}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->waitDialogHide()V

    .line 1282
    invoke-super {p0}, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->onDestroy()V

    goto :goto_0

    .line 1280
    .end local v0    # "t":Ljava/lang/Throwable;
    :catchall_0
    move-exception v1

    invoke-virtual {p0}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->hideManagedDialogs()V

    .line 1281
    invoke-virtual {p0}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->waitDialogHide()V

    .line 1282
    invoke-super {p0}, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->onDestroy()V

    throw v1
.end method

.method public onNewIntent(Landroid/content/Intent;)V
    .locals 5
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v4, 0x1

    .line 1155
    invoke-super {p0, p1}, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->onNewIntent(Landroid/content/Intent;)V

    .line 1156
    sget-object v0, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    const-string v2, "GetJarWebViewSubActivity: onNewIntent()"

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 1157
    const-string v0, "showWallet"

    const-string v1, "getjarIntentType"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1158
    iput-boolean v4, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->_loadWalletPage:Z

    .line 1164
    :cond_0
    :goto_0
    invoke-virtual {p0}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->loadPostAuthUI()V

    .line 1165
    return-void

    .line 1159
    :cond_1
    const-string v0, "showCheckout"

    const-string v1, "getjarIntentType"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1160
    iput-boolean v4, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->_loadCheckoutPage:Z

    .line 1161
    iget-object v0, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mJavaScriptInterface:Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;

    const-string v1, "EXTRA_MANAGED_CHECKOUT_DATA"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->setCurrentManagedOfferDetails(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public onPause()V
    .locals 4

    .prologue
    .line 1186
    sget-object v0, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    const-string v2, "GetJarActivity: onPause() START"

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 1187
    invoke-super {p0}, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->onPause()V

    .line 1188
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->_isForeground:Z

    .line 1189
    invoke-virtual {p0}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->hideManagedDialogs()V

    .line 1190
    invoke-virtual {p0}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->waitDialogHide()V

    .line 1191
    invoke-static {}, Landroid/webkit/CookieSyncManager;->getInstance()Landroid/webkit/CookieSyncManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/webkit/CookieSyncManager;->stopSync()V

    .line 1192
    invoke-direct {p0}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->UnRegisterPackageReceiver()V

    .line 1193
    iget-object v0, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->getJarActivity:Lcom/getjar/sdk/rewards/GetJarActivity;

    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->inAppBillingJSNotifier:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$InAppBillingNotifier;

    invoke-virtual {v0, v1}, Lcom/getjar/sdk/rewards/GetJarActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 1194
    return-void
.end method

.method public onResume()V
    .locals 6

    .prologue
    .line 1198
    sget-object v1, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "GetJarActivity: onResume() START"

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 1201
    :try_start_0
    invoke-super {p0}, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->onResume()V

    .line 1203
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->_isForeground:Z

    .line 1204
    invoke-virtual {p0}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->waitDialogHide()V

    .line 1205
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->getJarActivity:Lcom/getjar/sdk/rewards/GetJarActivity;

    invoke-virtual {v1}, Lcom/getjar/sdk/rewards/GetJarActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/getjar/sdk/utilities/RewardUtility;->saveGetJarTimestamp(Landroid/content/Context;)V

    .line 1206
    invoke-static {}, Landroid/webkit/CookieSyncManager;->getInstance()Landroid/webkit/CookieSyncManager;

    move-result-object v1

    invoke-virtual {v1}, Landroid/webkit/CookieSyncManager;->startSync()V

    .line 1207
    invoke-direct {p0}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->RegisterPackageReceiver()V

    .line 1208
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 1209
    .local v0, "filter":Landroid/content/IntentFilter;
    const-string v1, "com.getjar.sdk.NOTIFY_BUY_GOLD"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 1210
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->getJarActivity:Lcom/getjar/sdk/rewards/GetJarActivity;

    iget-object v2, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->inAppBillingJSNotifier:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$InAppBillingNotifier;

    invoke-virtual {v1, v2, v0}, Lcom/getjar/sdk/rewards/GetJarActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 1213
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->_waitDialogWasShowing:Z

    .line 1214
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mCommContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v1}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/getjar/sdk/comm/auth/AuthManager;->initialize(Landroid/content/Context;)V

    .line 1215
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v1

    invoke-virtual {v1, p0}, Lcom/getjar/sdk/comm/auth/AuthManager;->ensureAuthWithUI(Lcom/getjar/sdk/comm/auth/AuthUIParentInterface;)Z

    .line 1217
    invoke-virtual {p0}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->reload()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1221
    sget-object v1, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "GetJarActivity: onResume() starting earning monitoring thread"

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 1222
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mCommContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v1}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/getjar/sdk/data/earning/EarningMonitor;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/earning/EarningMonitor;

    move-result-object v1

    invoke-virtual {v1}, Lcom/getjar/sdk/data/earning/EarningMonitor;->startMonitoring()V

    .line 1224
    sget-object v1, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "GetJarActivity: onResume() starting usage monitoring thread"

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 1225
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mCommContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v1}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/getjar/sdk/data/usage/UsageMonitor;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/usage/UsageMonitor;

    move-result-object v1

    invoke-virtual {v1}, Lcom/getjar/sdk/data/usage/UsageMonitor;->startMonitoring()V

    .line 1227
    return-void

    .line 1221
    .end local v0    # "filter":Landroid/content/IntentFilter;
    :catchall_0
    move-exception v1

    sget-object v2, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    const-string v4, "GetJarActivity: onResume() starting earning monitoring thread"

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 1222
    iget-object v2, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mCommContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v2}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/getjar/sdk/data/earning/EarningMonitor;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/earning/EarningMonitor;

    move-result-object v2

    invoke-virtual {v2}, Lcom/getjar/sdk/data/earning/EarningMonitor;->startMonitoring()V

    .line 1224
    sget-object v2, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    const-string v4, "GetJarActivity: onResume() starting usage monitoring thread"

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 1225
    iget-object v2, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mCommContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v2}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/getjar/sdk/data/usage/UsageMonitor;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/usage/UsageMonitor;

    move-result-object v2

    invoke-virtual {v2}, Lcom/getjar/sdk/data/usage/UsageMonitor;->startMonitoring()V

    throw v1
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 1013
    sget-object v0, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    const-string v2, "onSaveInstanceState()"

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 1014
    invoke-super {p0, p1}, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 1015
    sget-object v0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v0, p1}, Landroid/webkit/WebView;->saveState(Landroid/os/Bundle;)Landroid/webkit/WebBackForwardList;

    .line 1016
    const-string v0, "sdkUrl"

    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mUrl:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1017
    const-string v0, "getjarContextId"

    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mCommContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v1}, Lcom/getjar/sdk/comm/CommContext;->getCommContextId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1018
    return-void
.end method

.method public onSharedPreferenceChanged(Landroid/content/SharedPreferences;Ljava/lang/String;)V
    .locals 2
    .param p1, "sharedPreferences"    # Landroid/content/SharedPreferences;
    .param p2, "key"    # Ljava/lang/String;

    .prologue
    .line 1312
    :try_start_0
    const-string v1, "null"

    invoke-interface {p1, p2, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1313
    .local v0, "state":Ljava/lang/String;
    iget-boolean v1, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mCatchByMonitor:Z

    if-nez v1, :cond_0

    const-string v1, "SUCCESS"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    :cond_0
    const-string v1, "FAIL"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 1314
    :cond_1
    invoke-virtual {p0}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->reload()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1319
    .end local v0    # "state":Ljava/lang/String;
    :cond_2
    :goto_0
    return-void

    .line 1316
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 5
    .param p1, "v"    # Landroid/view/View;
    .param p2, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/16 v4, 0xc8

    const/16 v2, 0x1e

    const/16 v3, -0xc8

    const/4 v0, 0x0

    .line 1457
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 1494
    :cond_0
    :goto_0
    return v0

    .line 1459
    :pswitch_0
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    float-to-int v1, v1

    iput v1, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->downX:I

    .line 1460
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    float-to-int v1, v1

    iput v1, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->downY:I

    .line 1462
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->konamiCode:Ljava/lang/StringBuilder;

    if-nez v1, :cond_1

    .line 1463
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    iput-object v1, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->konamiCode:Ljava/lang/StringBuilder;

    .line 1465
    :cond_1
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->konamiCode:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    if-le v1, v2, :cond_0

    .line 1466
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->konamiCode:Ljava/lang/StringBuilder;

    const/16 v2, 0xa

    invoke-virtual {v1, v0, v2}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 1471
    :pswitch_1
    iget v1, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->downX:I

    if-eqz v1, :cond_3

    .line 1472
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    iget v2, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->downY:I

    int-to-float v2, v2

    sub-float/2addr v1, v2

    float-to-int v1, v1

    iput v1, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->subResult:I

    .line 1473
    iget v1, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->subResult:I

    if-le v1, v4, :cond_4

    .line 1475
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->konamiCode:Ljava/lang/StringBuilder;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 1481
    :cond_2
    :goto_1
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    iget v2, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->downX:I

    int-to-float v2, v2

    sub-float/2addr v1, v2

    float-to-int v1, v1

    iput v1, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->subResult:I

    .line 1482
    iget v1, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->subResult:I

    if-le v1, v4, :cond_5

    .line 1484
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->konamiCode:Ljava/lang/StringBuilder;

    const/4 v2, 0x3

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 1490
    :cond_3
    :goto_2
    iput v0, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->downX:I

    .line 1491
    iput v0, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->downY:I

    .line 1492
    iget-object v0, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->konamiCode:Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->executeKonami(Ljava/lang/String;)Z

    move-result v0

    goto :goto_0

    .line 1476
    :cond_4
    iget v1, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->subResult:I

    if-ge v1, v3, :cond_2

    .line 1478
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->konamiCode:Ljava/lang/StringBuilder;

    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 1485
    :cond_5
    iget v1, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->subResult:I

    if-ge v1, v3, :cond_3

    .line 1487
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->konamiCode:Ljava/lang/StringBuilder;

    const/4 v2, 0x4

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 1457
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public reload()V
    .locals 3

    .prologue
    .line 661
    :try_start_0
    sget-object v0, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    const-string v2, "GetJarActivity: reload()"

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 662
    sget-object v0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mWebView:Landroid/webkit/WebView;

    if-eqz v0, :cond_0

    .line 665
    sget-object v0, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    const-string v2, "GetJarActivity: reload() calling javascript:GJ.onFocus()"

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 666
    sget-object v0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mWebView:Landroid/webkit/WebView;

    const-string v1, "javascript:GJ.onFocus()"

    invoke-static {v0, v1}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->loadUrlInWebView(Landroid/webkit/WebView;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 678
    :goto_0
    iget-boolean v0, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->_shouldShowLoadingUI:Z

    if-eqz v0, :cond_1

    .line 679
    invoke-virtual {p0}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->waitDialogShow()V

    .line 684
    :goto_1
    return-void

    .line 673
    :cond_0
    :try_start_1
    sget-object v0, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    const-string v2, "GetJarActivity: reload() WebView is null"

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 678
    :catchall_0
    move-exception v0

    iget-boolean v1, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->_shouldShowLoadingUI:Z

    if-eqz v1, :cond_2

    .line 679
    invoke-virtual {p0}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->waitDialogShow()V

    .line 681
    :goto_2
    throw v0

    :cond_1
    invoke-virtual {p0}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->waitDialogHide()V

    goto :goto_1

    :cond_2
    invoke-virtual {p0}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->waitDialogHide()V

    goto :goto_2
.end method

.method public setAuthToken(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "theBundle"    # Landroid/os/Bundle;

    .prologue
    .line 225
    const-string v1, "override.header.Authorization"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 226
    .local v0, "authToken":Ljava/lang/String;
    sget-object v1, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mWebView:Landroid/webkit/WebView;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "javascript:GJ.setAuthToken("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->loadUrlInWebView(Landroid/webkit/WebView;Ljava/lang/String;)V

    .line 227
    return-void
.end method

.method public setCurrentPurchaseClientTransactionId(Ljava/lang/String;)V
    .locals 8
    .param p1, "currentPurchaseClientTransactionId"    # Ljava/lang/String;

    .prologue
    .line 209
    sget-object v0, Lcom/getjar/sdk/logging/Area;->PURCHASE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "setCurrentPurchaseClientTransactionId(%1$s) called from \'%2$s\'"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object p1, v4, v5

    const/4 v5, 0x1

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v6

    const/4 v7, 0x3

    aget-object v6, v6, v7

    invoke-virtual {v6}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 213
    iput-object p1, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->_currentPurchaseClientTransactionId:Ljava/lang/String;

    .line 214
    return-void
.end method

.method protected setShouldShowLoadingUI(Z)V
    .locals 0
    .param p1, "shouldShowLoadingUI"    # Z

    .prologue
    .line 205
    iput-boolean p1, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->_shouldShowLoadingUI:Z

    .line 206
    return-void
.end method

.method protected simpleReload()V
    .locals 4

    .prologue
    .line 490
    sget-object v1, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    const-string v3, "Telling the WebView to reload the current URL"

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 491
    invoke-direct {p0}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->getHomeUrl()Ljava/lang/String;

    move-result-object v0

    .line 492
    .local v0, "url":Ljava/lang/String;
    invoke-static {v0}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 493
    sget-object v1, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mWebView:Landroid/webkit/WebView;

    invoke-static {v1, v0}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->loadUrlInWebView(Landroid/webkit/WebView;Ljava/lang/String;)V

    .line 495
    :cond_0
    return-void
.end method

.method protected startGooglePlayForPurchase(Landroid/app/PendingIntent;Ljava/lang/String;Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;)V
    .locals 9
    .param p1, "pendingIntent"    # Landroid/app/PendingIntent;
    .param p2, "callback"    # Ljava/lang/String;
    .param p3, "commContext"    # Lcom/getjar/sdk/comm/CommContext;
    .param p4, "clientTransactionId"    # Ljava/lang/String;

    .prologue
    const/4 v8, 0x0

    .line 299
    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'pendingIntent\' cannot be NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 300
    :cond_0
    invoke-static {p2}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'callback\' cannot be NULL or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 301
    :cond_1
    if-nez p3, :cond_2

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'commContext\' cannot be NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 302
    :cond_2
    invoke-static {p4}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'clientTransactionId\' cannot be NULL or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 306
    :cond_3
    :try_start_0
    invoke-virtual {p0}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->getParentActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {p2, v0}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->saveCallback(Ljava/lang/String;Landroid/content/Context;)V

    .line 307
    invoke-virtual {p0}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->getParentActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {p1}, Landroid/app/PendingIntent;->getIntentSender()Landroid/content/IntentSender;

    move-result-object v1

    const/16 v2, 0x65

    new-instance v3, Landroid/content/Intent;

    invoke-direct {v3}, Landroid/content/Intent;-><init>()V

    const/4 v4, 0x0

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    const/4 v5, 0x0

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    const/4 v7, 0x0

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v6

    invoke-virtual/range {v0 .. v6}, Landroid/app/Activity;->startIntentSenderForResult(Landroid/content/IntentSender;ILandroid/content/Intent;III)V
    :try_end_0
    .catch Landroid/content/IntentSender$SendIntentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 322
    :goto_0
    return-void

    .line 315
    :catch_0
    move-exception v6

    .line 318
    .local v6, "e":Landroid/content/IntentSender$SendIntentException;
    sget-object v0, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    const-string v2, "Purchase failed"

    invoke-static {v0, v1, v2, v6}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 319
    new-instance v0, Lcom/getjar/sdk/comm/TransactionManager;

    invoke-virtual {p3}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/getjar/sdk/comm/TransactionManager;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p4, p3}, Lcom/getjar/sdk/comm/TransactionManager;->cancelManagedOfferTransaction(Ljava/lang/String;Lcom/getjar/sdk/comm/CommContext;)V

    .line 320
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    sget-object v5, Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;->MARKETPLACE:Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;

    move-object v0, p2

    move v2, v8

    move v3, v8

    move v4, v8

    invoke-static/range {v0 .. v6}, Lcom/getjar/sdk/rewards/JavaScriptAPI;->addDataAndMakeJSCallback(Ljava/lang/String;Lorg/json/JSONObject;ZZZLcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method protected waitForAuthorization()V
    .locals 5

    .prologue
    .line 278
    sget-object v1, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "Waiting for UserAuth is called"

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 279
    invoke-virtual {p0}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->waitDialogShow()V

    .line 281
    :try_start_0
    new-instance v1, Ljava/lang/Thread;

    new-instance v2, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$waitForAuth;

    iget-object v3, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mCommContext:Lcom/getjar/sdk/comm/CommContext;

    iget-object v4, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mDismissReceiver:Landroid/os/ResultReceiver;

    invoke-direct {v2, p0, v3, v4}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$waitForAuth;-><init>(Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;Lcom/getjar/sdk/comm/CommContext;Landroid/os/ResultReceiver;)V

    invoke-direct {v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v1}, Ljava/lang/Thread;->start()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 288
    :goto_0
    return-void

    .line 282
    :catch_0
    move-exception v0

    .line 285
    .local v0, "t":Ljava/lang/Throwable;
    invoke-virtual {p0}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->waitDialogHide()V

    .line 286
    sget-object v1, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "newPackageReceived() failed"

    invoke-static {v1, v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
