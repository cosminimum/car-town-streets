.class public Lcom/getjar/sdk/rewards/JavaScriptAPI;
.super Ljava/lang/Object;
.source "JavaScriptAPI.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/getjar/sdk/rewards/JavaScriptAPI$AccountStatus;,
        Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptRedeemIntentResult;,
        Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;
    }
.end annotation


# static fields
.field public static final EXTRA_MANAGED_CHECKOUT_DATA:Ljava/lang/String; = "EXTRA_MANAGED_CHECKOUT_DATA"

.field private static final INSTALL_GETJAR_REWARDS:Ljava/lang/String; = "Install Getjar Rewards to buy these app deals and earn free rewards"

.field private static final _ExecutorService:Ljava/util/concurrent/ExecutorService;

.field public static _callbackToStartTimeMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field protected final _commContext:Lcom/getjar/sdk/comm/CommContext;

.field private _currentManagedOfferDetails:Ljava/lang/String;

.field private final _googlePlayLaunchCache:Lcom/getjar/sdk/rewards/GooglePlayLaunchCachingManager;

.field protected final _parentActivity:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 75
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/getjar/sdk/rewards/JavaScriptAPI;->_callbackToStartTimeMap:Ljava/util/HashMap;

    .line 76
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lcom/getjar/sdk/rewards/JavaScriptAPI;->_ExecutorService:Ljava/util/concurrent/ExecutorService;

    return-void
.end method

.method public constructor <init>(Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;)V
    .locals 2
    .param p1, "commContext"    # Lcom/getjar/sdk/comm/CommContext;
    .param p2, "parentActivity"    # Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    .prologue
    .line 79
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 74
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/getjar/sdk/rewards/JavaScriptAPI;->_currentManagedOfferDetails:Ljava/lang/String;

    .line 81
    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'commContext\' cannot be NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 82
    :cond_0
    if-nez p2, :cond_1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'parentActivity\' cannot be NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 84
    :cond_1
    iput-object p1, p0, Lcom/getjar/sdk/rewards/JavaScriptAPI;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    .line 85
    iput-object p2, p0, Lcom/getjar/sdk/rewards/JavaScriptAPI;->_parentActivity:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    .line 86
    new-instance v0, Lcom/getjar/sdk/rewards/GooglePlayLaunchCachingManager;

    invoke-virtual {p1}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/getjar/sdk/rewards/GooglePlayLaunchCachingManager;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/getjar/sdk/rewards/JavaScriptAPI;->_googlePlayLaunchCache:Lcom/getjar/sdk/rewards/GooglePlayLaunchCachingManager;

    .line 87
    return-void
.end method

.method public static addDataAndMakeJSCallback(Ljava/lang/String;Lorg/json/JSONObject;ZZZLcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;Ljava/lang/Throwable;)V
    .locals 11
    .param p0, "callback"    # Ljava/lang/String;
    .param p1, "resultJson"    # Lorg/json/JSONObject;
    .param p2, "success"    # Z
    .param p3, "moneyTaken"    # Z
    .param p4, "recoverable"    # Z
    .param p5, "reason"    # Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;
    .param p6, "throwable"    # Ljava/lang/Throwable;

    .prologue
    .line 839
    invoke-static {p0}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_0

    sget-object v6, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    const-string v8, "\'callback\' is null. Unable to make callback"

    invoke-static {v6, v7, v8}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;)V

    .line 878
    :goto_0
    return-void

    .line 840
    :cond_0
    if-nez p5, :cond_1

    sget-object v6, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    const-string v8, "\'reason\' is null. Unable to make callback"

    invoke-static {v6, v7, v8}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;)V

    goto :goto_0

    .line 842
    :cond_1
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 845
    .local v3, "returnObj":Lorg/json/JSONObject;
    :try_start_0
    const-string v6, "return"

    invoke-virtual {v3, v6, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 847
    sget-object v6, Lcom/getjar/sdk/rewards/JavaScriptAPI;->_callbackToStartTimeMap:Ljava/util/HashMap;

    invoke-virtual {v6, p0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Long;

    .line 848
    .local v5, "time":Ljava/lang/Long;
    if-nez v5, :cond_3

    .line 849
    const-wide/16 v6, 0x0

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    .line 854
    :goto_1
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 855
    .local v2, "operationObj":Lorg/json/JSONObject;
    const-string v6, "elapsed_time"

    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v7

    long-to-double v7, v7

    const-wide v9, 0x412e848000000000L    # 1000000.0

    div-double/2addr v7, v9

    invoke-virtual {v2, v6, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 857
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    .line 858
    .local v4, "statusObj":Lorg/json/JSONObject;
    const-string v6, "succeeded"

    invoke-virtual {v4, v6, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 859
    const-string v6, "moneyTaken"

    invoke-virtual {v4, v6, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 860
    const-string v6, "recoverable"

    invoke-virtual {v4, v6, p4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 861
    const-string v6, "reason"

    invoke-virtual/range {p5 .. p5}, Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;->name()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 863
    if-eqz p6, :cond_2

    .line 864
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 865
    .local v1, "exceptionObj":Lorg/json/JSONObject;
    const-string v6, "type"

    invoke-virtual/range {p6 .. p6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 866
    const-string v6, "message"

    invoke-virtual/range {p6 .. p6}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 867
    const-string v6, "stack_trace"

    invoke-virtual/range {p6 .. p6}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v7

    invoke-static {v7}, Lcom/getjar/sdk/logging/Logger;->getStackTrace([Ljava/lang/StackTraceElement;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 868
    const-string v6, "exception"

    invoke-virtual {v4, v6, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 870
    .end local v1    # "exceptionObj":Lorg/json/JSONObject;
    :cond_2
    const-string v6, "status"

    invoke-virtual {v2, v6, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 871
    const-string v6, "operation"

    invoke-virtual {v3, v6, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 877
    .end local v2    # "operationObj":Lorg/json/JSONObject;
    .end local v4    # "statusObj":Lorg/json/JSONObject;
    .end local v5    # "time":Ljava/lang/Long;
    :goto_2
    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {p0, v6}, Lcom/getjar/sdk/rewards/JavaScriptAPI;->makeJavaScriptCallback(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 851
    .restart local v5    # "time":Ljava/lang/Long;
    :cond_3
    :try_start_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v8

    sub-long/2addr v6, v8

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v5

    goto/16 :goto_1

    .line 873
    .end local v5    # "time":Ljava/lang/Long;
    :catch_0
    move-exception v0

    .line 874
    .local v0, "e":Lorg/json/JSONException;
    sget-object v6, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    const-string v8, "JSON error"

    invoke-static {v6, v7, v8, v0}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_2
.end method

.method protected static makeJavaScriptCallback(Ljava/lang/String;Ljava/lang/String;)V
    .locals 8
    .param p0, "callbackTarget"    # Ljava/lang/String;
    .param p1, "resultJson"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 97
    sget-object v2, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "Attempting to callback: %1$s"

    new-array v6, v6, [Ljava/lang/Object;

    aput-object p1, v6, v7

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 100
    const/4 v2, 0x1

    :try_start_0
    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    const-string v4, "UTF-8"

    invoke-static {p1, v4}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {p0, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 104
    .local v1, "url":Ljava/lang/String;
    invoke-static {v1}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->loadUrl(Ljava/lang/String;)V

    .line 105
    return-void

    .line 101
    .end local v1    # "url":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 102
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method private showMessageDialog(Ljava/lang/String;Z)V
    .locals 3
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "showInstallButton"    # Z

    .prologue
    const/4 v2, 0x0

    .line 618
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/getjar/sdk/rewards/JavaScriptAPI;->_parentActivity:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-virtual {v1}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->getParentActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 619
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    const-string v1, "Requires Getjar"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 620
    invoke-virtual {v0, p1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 621
    if-eqz p2, :cond_0

    .line 622
    const-string v1, "Cancel"

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 623
    const-string v1, "Install Getjar"

    new-instance v2, Lcom/getjar/sdk/rewards/JavaScriptAPI$3;

    invoke-direct {v2, p0}, Lcom/getjar/sdk/rewards/JavaScriptAPI$3;-><init>(Lcom/getjar/sdk/rewards/JavaScriptAPI;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 633
    :goto_0
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 634
    return-void

    .line 631
    :cond_0
    const-string v1, "OK"

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    goto :goto_0
.end method


# virtual methods
.method public canPurchaseManagedProducts()Z
    .locals 5
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 774
    sget-object v1, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    const-string v3, "JavaScriptAPI: canPurchaseManagedProducts() START"

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 776
    :try_start_0
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v1

    iget-object v2, p0, Lcom/getjar/sdk/rewards/JavaScriptAPI;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v2}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/getjar/sdk/comm/auth/AuthManager;->getClaimsManager(Landroid/content/Context;)Lcom/getjar/sdk/comm/auth/ClaimsManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/getjar/sdk/comm/auth/ClaimsManager;->canPurchaseManagedProducts()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    .line 781
    sget-object v2, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    const-string v4, "JavaScriptAPI: canPurchaseManagedProducts() FINISH"

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    :goto_0
    return v1

    .line 777
    :catch_0
    move-exception v0

    .line 778
    .local v0, "e":Ljava/lang/Exception;
    :try_start_1
    sget-object v1, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    sget-object v3, Lcom/getjar/sdk/logging/Area;->CONFIG:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    sget-object v3, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "ClaimsManager.canBuy() failed"

    invoke-static {v1, v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 779
    const/4 v1, 0x0

    .line 781
    sget-object v2, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    const-string v4, "JavaScriptAPI: canPurchaseManagedProducts() FINISH"

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    goto :goto_0

    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v1

    sget-object v2, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    const-string v4, "JavaScriptAPI: canPurchaseManagedProducts() FINISH"

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    throw v1
.end method

.method public canViewManagedProducts()Z
    .locals 5
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 759
    sget-object v1, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    const-string v3, "JavaScriptAPI: canViewManagedProducts() START"

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 761
    :try_start_0
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v1

    iget-object v2, p0, Lcom/getjar/sdk/rewards/JavaScriptAPI;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v2}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/getjar/sdk/comm/auth/AuthManager;->getClaimsManager(Landroid/content/Context;)Lcom/getjar/sdk/comm/auth/ClaimsManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/getjar/sdk/comm/auth/ClaimsManager;->canViewManagedProducts()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    .line 765
    sget-object v2, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    const-string v4, "JavaScriptAPI: canViewManagedProducts() FINISH"

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 767
    :goto_0
    return v1

    .line 762
    :catch_0
    move-exception v0

    .line 763
    .local v0, "e":Ljava/lang/Exception;
    :try_start_1
    sget-object v1, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->PURCHASE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    sget-object v3, Lcom/getjar/sdk/logging/Area;->CONFIG:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    sget-object v3, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "canViewManagedProducts() failed"

    invoke-static {v1, v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 765
    sget-object v1, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    const-string v3, "JavaScriptAPI: canViewManagedProducts() FINISH"

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 767
    const/4 v1, 0x0

    goto :goto_0

    .line 765
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v1

    sget-object v2, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    const-string v4, "JavaScriptAPI: canViewManagedProducts() FINISH"

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    throw v1
.end method

.method public getAccounts()Ljava/lang/String;
    .locals 17
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 142
    sget-object v13, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v13}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v13

    const-string v15, "JavaScriptAPI: getAccounts() START"

    invoke-static {v13, v14, v15}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 143
    new-instance v6, Lorg/json/JSONArray;

    invoke-direct {v6}, Lorg/json/JSONArray;-><init>()V

    .line 147
    .local v6, "accountsJson":Lorg/json/JSONArray;
    :try_start_0
    new-instance v13, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;

    invoke-direct {v13}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;-><init>()V

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/getjar/sdk/rewards/JavaScriptAPI;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v14}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v14

    invoke-virtual {v13, v14}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;->getCachedAccountName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v8

    .line 148
    .local v8, "currentAccount":Ljava/lang/String;
    invoke-static {v8}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_0

    .line 149
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AccountHistoryManager;->getInstance()Lcom/getjar/sdk/comm/auth/AccountHistoryManager;

    move-result-object v13

    invoke-virtual {v13}, Lcom/getjar/sdk/comm/auth/AccountHistoryManager;->getCurrentAccountName()Ljava/lang/String;

    move-result-object v8

    .line 153
    :cond_0
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 154
    .local v5, "accountNamesFound":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/getjar/sdk/rewards/JavaScriptAPI;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v13}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v13

    invoke-static {v13}, Lcom/getjar/sdk/comm/auth/AccountHistoryManager;->initialize(Landroid/content/Context;)V

    .line 155
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AccountHistoryManager;->getInstance()Lcom/getjar/sdk/comm/auth/AccountHistoryManager;

    move-result-object v13

    invoke-virtual {v13}, Lcom/getjar/sdk/comm/auth/AccountHistoryManager;->getAccounts()Ljava/util/List;

    move-result-object v13

    invoke-interface {v13}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    .local v10, "i$":Ljava/util/Iterator;
    :cond_1
    :goto_0
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_3

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/getjar/sdk/comm/auth/AccountHistoryInfo;

    .line 156
    .local v1, "account":Lcom/getjar/sdk/comm/auth/AccountHistoryInfo;
    invoke-virtual {v1}, Lcom/getjar/sdk/comm/auth/AccountHistoryInfo;->getAccountName()Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v13

    if-nez v13, :cond_1

    .line 157
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 158
    .local v2, "accountJson":Lorg/json/JSONObject;
    invoke-virtual {v1}, Lcom/getjar/sdk/comm/auth/AccountHistoryInfo;->getAccountName()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v13

    invoke-interface {v5, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 159
    const-string v13, "account_name"

    invoke-virtual {v1}, Lcom/getjar/sdk/comm/auth/AccountHistoryInfo;->getAccountName()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v2, v13, v14}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 160
    const-string v13, "provider_filter"

    invoke-virtual {v1}, Lcom/getjar/sdk/comm/auth/AccountHistoryInfo;->getProviderFilter()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v2, v13, v14}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 161
    const-string v13, "timestamp_created"

    invoke-virtual {v1}, Lcom/getjar/sdk/comm/auth/AccountHistoryInfo;->getTimestampCreated()I

    move-result v14

    invoke-virtual {v2, v13, v14}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 162
    const-string v13, "timestamp_last_auth"

    invoke-virtual {v1}, Lcom/getjar/sdk/comm/auth/AccountHistoryInfo;->getTimestampLastAuth()I

    move-result v14

    invoke-virtual {v2, v13, v14}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 163
    invoke-virtual {v1}, Lcom/getjar/sdk/comm/auth/AccountHistoryInfo;->getAccountName()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v13, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_2

    .line 164
    const-string v13, "status"

    sget-object v14, Lcom/getjar/sdk/rewards/JavaScriptAPI$AccountStatus;->CURRENT:Lcom/getjar/sdk/rewards/JavaScriptAPI$AccountStatus;

    invoke-virtual {v14}, Lcom/getjar/sdk/rewards/JavaScriptAPI$AccountStatus;->name()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v2, v13, v14}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 168
    :goto_1
    invoke-virtual {v6, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 191
    .end local v1    # "account":Lcom/getjar/sdk/comm/auth/AccountHistoryInfo;
    .end local v2    # "accountJson":Lorg/json/JSONObject;
    .end local v5    # "accountNamesFound":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v8    # "currentAccount":Ljava/lang/String;
    .end local v10    # "i$":Ljava/util/Iterator;
    :catch_0
    move-exception v9

    .line 194
    .local v9, "e":Ljava/lang/Exception;
    :try_start_1
    sget-object v13, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v13}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v13

    const-string v15, "getAccounts() failed"

    invoke-static {v13, v14, v15, v9}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 196
    sget-object v13, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v13}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v13

    const-string v15, "JavaScriptAPI: getAccounts() FINISH"

    invoke-static {v13, v14, v15}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 198
    .end local v9    # "e":Ljava/lang/Exception;
    :goto_2
    invoke-virtual {v6}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v13

    return-object v13

    .line 166
    .restart local v1    # "account":Lcom/getjar/sdk/comm/auth/AccountHistoryInfo;
    .restart local v2    # "accountJson":Lorg/json/JSONObject;
    .restart local v5    # "accountNamesFound":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v8    # "currentAccount":Ljava/lang/String;
    .restart local v10    # "i$":Ljava/util/Iterator;
    :cond_2
    :try_start_2
    const-string v13, "status"

    sget-object v14, Lcom/getjar/sdk/rewards/JavaScriptAPI$AccountStatus;->PREVIOUS:Lcom/getjar/sdk/rewards/JavaScriptAPI$AccountStatus;

    invoke-virtual {v14}, Lcom/getjar/sdk/rewards/JavaScriptAPI$AccountStatus;->name()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v2, v13, v14}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    .line 196
    .end local v1    # "account":Lcom/getjar/sdk/comm/auth/AccountHistoryInfo;
    .end local v2    # "accountJson":Lorg/json/JSONObject;
    .end local v5    # "accountNamesFound":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v8    # "currentAccount":Ljava/lang/String;
    .end local v10    # "i$":Ljava/util/Iterator;
    :catchall_0
    move-exception v13

    sget-object v14, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v14}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v14

    const-string v16, "JavaScriptAPI: getAccounts() FINISH"

    invoke-static/range {v14 .. v16}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    throw v13

    .line 172
    .restart local v5    # "accountNamesFound":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v8    # "currentAccount":Ljava/lang/String;
    .restart local v10    # "i$":Ljava/util/Iterator;
    :cond_3
    :try_start_3
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/getjar/sdk/rewards/JavaScriptAPI;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v13}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v13

    invoke-static {v13}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;->getAndroidAccountNames(Landroid/content/Context;)[Ljava/lang/CharSequence;

    move-result-object v4

    .line 173
    .local v4, "accountNames":[Ljava/lang/CharSequence;
    if-eqz v4, :cond_7

    .line 174
    new-instance v13, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;

    invoke-direct {v13}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;-><init>()V

    invoke-virtual {v13}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;->getProviderFilter()Ljava/lang/String;

    move-result-object v12

    .line 175
    .local v12, "providerFilter":Ljava/lang/String;
    move-object v7, v4

    .local v7, "arr$":[Ljava/lang/CharSequence;
    array-length v11, v7

    .local v11, "len$":I
    const/4 v10, 0x0

    .local v10, "i$":I
    :goto_3
    if-ge v10, v11, :cond_7

    aget-object v3, v7, v10

    .line 176
    .local v3, "accountName":Ljava/lang/CharSequence;
    if-nez v3, :cond_5

    .line 175
    :cond_4
    :goto_4
    add-int/lit8 v10, v10, 0x1

    goto :goto_3

    .line 177
    :cond_5
    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v13

    invoke-interface {v5, v13}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_4

    .line 178
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 179
    .restart local v2    # "accountJson":Lorg/json/JSONObject;
    const-string v13, "account_name"

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v2, v13, v14}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 180
    const-string v13, "provider_filter"

    invoke-virtual {v2, v13, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 181
    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v13, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_6

    .line 182
    const-string v13, "status"

    sget-object v14, Lcom/getjar/sdk/rewards/JavaScriptAPI$AccountStatus;->CURRENT:Lcom/getjar/sdk/rewards/JavaScriptAPI$AccountStatus;

    invoke-virtual {v14}, Lcom/getjar/sdk/rewards/JavaScriptAPI$AccountStatus;->name()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v2, v13, v14}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 186
    :goto_5
    invoke-virtual {v6, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_4

    .line 184
    :cond_6
    const-string v13, "status"

    sget-object v14, Lcom/getjar/sdk/rewards/JavaScriptAPI$AccountStatus;->UNKNOWN:Lcom/getjar/sdk/rewards/JavaScriptAPI$AccountStatus;

    invoke-virtual {v14}, Lcom/getjar/sdk/rewards/JavaScriptAPI$AccountStatus;->name()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v2, v13, v14}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_5

    .line 196
    .end local v2    # "accountJson":Lorg/json/JSONObject;
    .end local v3    # "accountName":Ljava/lang/CharSequence;
    .end local v7    # "arr$":[Ljava/lang/CharSequence;
    .end local v10    # "i$":I
    .end local v11    # "len$":I
    .end local v12    # "providerFilter":Ljava/lang/String;
    :cond_7
    sget-object v13, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v13}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v13

    const-string v15, "JavaScriptAPI: getAccounts() FINISH"

    invoke-static {v13, v14, v15}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    goto/16 :goto_2
.end method

.method public getAppDetails(Ljava/lang/String;)Ljava/lang/String;
    .locals 14
    .param p1, "thePackageName"    # Ljava/lang/String;
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 284
    sget-object v7, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    const-string v9, "JavaScriptAPI: getAppDetails() START"

    invoke-static {v7, v8, v9}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 285
    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    .line 289
    .local v6, "resultJson":Lorg/json/JSONObject;
    const/4 v5, 0x0

    .line 291
    .local v5, "packageInfo":Landroid/content/pm/PackageInfo;
    :try_start_0
    iget-object v7, p0, Lcom/getjar/sdk/rewards/JavaScriptAPI;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v7}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v7

    invoke-virtual {v7}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v7

    const/4 v8, 0x0

    invoke-virtual {v7, p1, v8}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v5

    .line 295
    :goto_0
    if-nez v5, :cond_1

    .line 296
    :try_start_1
    const-string v7, "install_state"

    const-string v8, "UNINSTALLED"

    invoke-virtual {v6, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 330
    :cond_0
    :goto_1
    sget-object v7, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    const-string v9, "JavaScriptAPI: getAppDetails() FINISH"

    invoke-static {v7, v8, v9}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 333
    :goto_2
    invoke-virtual {v6}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v7

    return-object v7

    .line 298
    :cond_1
    :try_start_2
    const-string v7, "install_state"

    const-string v8, "INSTALLED"

    invoke-virtual {v6, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 301
    const/4 v4, 0x0

    .line 303
    .local v4, "installTime":Ljava/lang/Long;
    :try_start_3
    const-class v7, Landroid/content/pm/PackageInfo;

    const-string v8, "firstInstallTime"

    invoke-virtual {v7, v8}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    .line 304
    .local v2, "field":Ljava/lang/reflect/Field;
    invoke-virtual {v2, v5}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    move-object v0, v7

    check-cast v0, Ljava/lang/Long;

    move-object v4, v0
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 310
    .end local v2    # "field":Ljava/lang/reflect/Field;
    :goto_3
    if-nez v4, :cond_2

    .line 312
    :try_start_4
    new-instance v3, Ljava/io/File;

    iget-object v7, v5, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget-object v7, v7, Landroid/content/pm/ApplicationInfo;->sourceDir:Ljava/lang/String;

    invoke-direct {v3, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 313
    .local v3, "file":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->lastModified()J

    move-result-wide v7

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    move-result-object v4

    .line 320
    .end local v3    # "file":Ljava/io/File;
    :cond_2
    :goto_4
    if-eqz v4, :cond_0

    .line 321
    :try_start_5
    const-string v7, "install_timestamp"

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v8

    invoke-virtual {v6, v7, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_1

    .line 325
    .end local v4    # "installTime":Ljava/lang/Long;
    :catch_0
    move-exception v1

    .line 328
    .local v1, "e":Ljava/lang/Exception;
    :try_start_6
    sget-object v7, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    const-string v9, "getAppDetails() failed"

    invoke-static {v7, v8, v9, v1}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 330
    sget-object v7, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    const-string v9, "JavaScriptAPI: getAppDetails() FINISH"

    invoke-static {v7, v8, v9}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    goto :goto_2

    .line 305
    .end local v1    # "e":Ljava/lang/Exception;
    .restart local v4    # "installTime":Ljava/lang/Long;
    :catch_1
    move-exception v1

    .line 306
    .restart local v1    # "e":Ljava/lang/Exception;
    :try_start_7
    sget-object v7, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    sget-object v9, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v10, "getAppDetails() unable to use PackageInfo.firstInstallTime [%1$s]"

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v13

    aput-object v13, v11, v12

    invoke-static {v9, v10, v11}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v7, v8, v9}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;)V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_0
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    goto :goto_3

    .line 330
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v4    # "installTime":Ljava/lang/Long;
    :catchall_0
    move-exception v7

    sget-object v8, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v8}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v8

    const-string v10, "JavaScriptAPI: getAppDetails() FINISH"

    invoke-static {v8, v9, v10}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    throw v7

    .line 314
    .restart local v4    # "installTime":Ljava/lang/Long;
    :catch_2
    move-exception v1

    .line 315
    .restart local v1    # "e":Ljava/lang/Exception;
    :try_start_8
    sget-object v7, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    sget-object v9, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v10, "getAppDetails() unable to use File.lastModified [%1$s]"

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v13

    aput-object v13, v11, v12

    invoke-static {v9, v10, v11}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v7, v8, v9}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;)V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_0
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    goto :goto_4

    .line 292
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v4    # "installTime":Ljava/lang/Long;
    :catch_3
    move-exception v7

    goto/16 :goto_0
.end method

.method public getLocalizedPriceBuckets(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1, "priceBuckets"    # Ljava/lang/String;
    .param p2, "callback"    # Ljava/lang/String;
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 701
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 702
    sget-object v0, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->LOCALIZATION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    const-string v2, "JavaScriptAPI: getLocalizedPriceBuckets() received null or empty \'priceBuckets\'"

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;)V

    .line 705
    :cond_0
    invoke-static {p2}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 706
    sget-object v0, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->LOCALIZATION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    const-string v2, "JavaScriptAPI: getLocalizedPriceBuckets() received null or empty \'callback\'"

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;)V

    .line 709
    :cond_1
    sget-object v0, Lcom/getjar/sdk/rewards/JavaScriptAPI;->_callbackToStartTimeMap:Ljava/util/HashMap;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, p2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 710
    sget-object v0, Lcom/getjar/sdk/rewards/JavaScriptAPI;->_ExecutorService:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lcom/getjar/sdk/rewards/JavaScriptAPI$4;

    invoke-direct {v1, p0, p1, p2}, Lcom/getjar/sdk/rewards/JavaScriptAPI$4;-><init>(Lcom/getjar/sdk/rewards/JavaScriptAPI;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 753
    return-void
.end method

.method public getManagedOffer()Ljava/lang/String;
    .locals 4
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 563
    sget-object v0, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    const-string v2, "JavaScriptAPI: getManagedOffer() START"

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 565
    :try_start_0
    iget-object v0, p0, Lcom/getjar/sdk/rewards/JavaScriptAPI;->_currentManagedOfferDetails:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 567
    sget-object v1, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    const-string v3, "JavaScriptAPI: getManagedOffer() FINISH"

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    return-object v0

    :catchall_0
    move-exception v0

    sget-object v1, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    const-string v3, "JavaScriptAPI: getManagedOffer() FINISH"

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    throw v0
.end method

.method protected launch(Ljava/lang/String;Ljava/lang/String;)V
    .locals 10
    .param p1, "thePackageName"    # Ljava/lang/String;
    .param p2, "additionalData"    # Ljava/lang/String;

    .prologue
    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 886
    :try_start_0
    sget-object v2, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "JavaScriptAPI: package name:\'%1$s\' additiona data:\'%2$s\'"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object p1, v6, v7

    const/4 v7, 0x1

    aput-object p2, v6, v7

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 887
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.MAIN"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 888
    .local v1, "i":Landroid/content/Intent;
    iget-object v2, p0, Lcom/getjar/sdk/rewards/JavaScriptAPI;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v2}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    invoke-virtual {v2, p1}, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v1

    .line 889
    if-eqz v1, :cond_1

    .line 890
    const-string v2, "android.intent.category.LAUNCHER"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 891
    const/high16 v2, 0x10200000

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 892
    invoke-static {p2}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string v2, "com.getjar.rewards"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 893
    const-string v2, "EXTRA_MANAGED_CHECKOUT_DATA"

    invoke-virtual {v1, v2, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 894
    const-string v2, "getjar"

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 895
    const-string v2, "android.intent.category.LAUNCHER"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 896
    const-string v2, "auth.provider_filter.data"

    iget-object v3, p0, Lcom/getjar/sdk/rewards/JavaScriptAPI;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v3}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/getjar/sdk/data/RedemptionEngine;->getProviderFilterJson(Landroid/content/Context;)Lorg/json/JSONArray;

    move-result-object v3

    invoke-virtual {v3}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 897
    const-string v2, "getjarIntentType"

    const-string v3, "showCheckout"

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 898
    const/high16 v2, 0x34a00000

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 900
    :cond_0
    iget-object v2, p0, Lcom/getjar/sdk/rewards/JavaScriptAPI;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v2}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 907
    .end local v1    # "i":Landroid/content/Intent;
    :goto_0
    return-void

    .line 902
    .restart local v1    # "i":Landroid/content/Intent;
    :cond_1
    const-string v2, "App not found"

    const/4 v3, 0x0

    invoke-direct {p0, v2, v3}, Lcom/getjar/sdk/rewards/JavaScriptAPI;->showMessageDialog(Ljava/lang/String;Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 904
    .end local v1    # "i":Landroid/content/Intent;
    :catch_0
    move-exception v0

    .line 905
    .local v0, "e":Ljava/lang/Exception;
    sget-object v2, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "JavaScriptAPI: launch(%1$s) failed"

    new-array v6, v9, [Ljava/lang/Object;

    aput-object p1, v6, v8

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public launchGooglePlay(Ljava/lang/String;Ljava/lang/String;)V
    .locals 10
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "reason"    # Ljava/lang/String;
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 793
    sget-object v3, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    const-string v5, "JavaScriptAPI: launchGooglePlay() START"

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 797
    :try_start_0
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 798
    sget-object v3, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    const-string v5, "launchGooglePlay(): Null or empty packageName provided by javascript"

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 825
    sget-object v3, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    const-string v5, "JavaScriptAPI: launchGooglePlay() FINISH"

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 827
    :goto_0
    return-void

    .line 803
    :cond_0
    const/4 v2, 0x0

    .line 805
    .local v2, "reasonObj":Lcom/getjar/sdk/rewards/GooglePlayLaunchReason;
    :try_start_1
    invoke-static {p2}, Lcom/getjar/sdk/rewards/GooglePlayLaunchReason;->valueOf(Ljava/lang/String;)Lcom/getjar/sdk/rewards/GooglePlayLaunchReason;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v2

    .line 815
    :try_start_2
    iget-object v3, p0, Lcom/getjar/sdk/rewards/JavaScriptAPI;->_googlePlayLaunchCache:Lcom/getjar/sdk/rewards/GooglePlayLaunchCachingManager;

    invoke-virtual {v3, p1, v2}, Lcom/getjar/sdk/rewards/GooglePlayLaunchCachingManager;->update(Ljava/lang/String;Lcom/getjar/sdk/rewards/GooglePlayLaunchReason;)V

    .line 818
    new-instance v1, Landroid/content/Intent;

    const-string v3, "android.intent.action.VIEW"

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "market://details?id=%1$s"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object p1, v6, v7

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    invoke-direct {v1, v3, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 819
    .local v1, "intent":Landroid/content/Intent;
    const/high16 v3, 0x10000000

    invoke-virtual {v1, v3}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 820
    const/high16 v3, 0x8000000

    invoke-virtual {v1, v3}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 821
    const/high16 v3, 0x40000000    # 2.0f

    invoke-virtual {v1, v3}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 822
    iget-object v3, p0, Lcom/getjar/sdk/rewards/JavaScriptAPI;->_parentActivity:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-virtual {v3}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->getParentActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-virtual {v3, v1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 825
    sget-object v3, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    const-string v5, "JavaScriptAPI: launchGooglePlay() FINISH"

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    goto :goto_0

    .line 806
    .end local v1    # "intent":Landroid/content/Intent;
    :catch_0
    move-exception v0

    .line 807
    .local v0, "e":Ljava/lang/Exception;
    :try_start_3
    sget-object v3, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "launchGooglePlay(): Unsupported reason value \'%1$s\', must be one of: %2$s"

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object p2, v7, v8

    const/4 v8, 0x1

    invoke-static {}, Lcom/getjar/sdk/rewards/GooglePlayLaunchReason;->getSupportedReasons()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 825
    sget-object v3, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    const-string v5, "JavaScriptAPI: launchGooglePlay() FINISH"

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    goto :goto_0

    .end local v0    # "e":Ljava/lang/Exception;
    .end local v2    # "reasonObj":Lcom/getjar/sdk/rewards/GooglePlayLaunchReason;
    :catchall_0
    move-exception v3

    sget-object v4, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    const-string v6, "JavaScriptAPI: launchGooglePlay() FINISH"

    invoke-static {v4, v5, v6}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    throw v3
.end method

.method public performManagedCheckout(Ljava/lang/String;)V
    .locals 5
    .param p1, "managedOfferDetails"    # Ljava/lang/String;
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 578
    sget-object v1, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    const-string v3, "JavaScriptAPI: performManagedCheckout() START"

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 581
    :try_start_0
    iput-object p1, p0, Lcom/getjar/sdk/rewards/JavaScriptAPI;->_currentManagedOfferDetails:Ljava/lang/String;

    .line 586
    iget-object v1, p0, Lcom/getjar/sdk/rewards/JavaScriptAPI;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v1}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/getjar/sdk/comm/auth/AuthManager;->initialize(Landroid/content/Context;)V

    .line 587
    iget-object v1, p0, Lcom/getjar/sdk/rewards/JavaScriptAPI;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v1}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "com.getjar.rewards"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 588
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v1

    iget-object v2, p0, Lcom/getjar/sdk/rewards/JavaScriptAPI;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v2}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/getjar/sdk/comm/auth/AuthManager;->getClaimsManager(Landroid/content/Context;)Lcom/getjar/sdk/comm/auth/ClaimsManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/getjar/sdk/comm/auth/ClaimsManager;->canPurchaseManagedProducts()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 589
    iget-object v1, p0, Lcom/getjar/sdk/rewards/JavaScriptAPI;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    const/4 v2, 0x1

    invoke-static {v1, v2}, Lcom/getjar/sdk/comm/GetJarConfig;->getInstance(Lcom/getjar/sdk/comm/CommContext;Z)Lcom/getjar/sdk/comm/GetJarConfig;

    move-result-object v1

    const-string v2, "webview.managed_checkout_url"

    invoke-virtual {v1, v2}, Lcom/getjar/sdk/comm/GetJarConfig;->getDirectiveValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 590
    .local v0, "url":Ljava/lang/String;
    invoke-static {v0}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->loadUrl(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 607
    .end local v0    # "url":Ljava/lang/String;
    :goto_0
    sget-object v1, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    const-string v3, "JavaScriptAPI: performManagedCheckout() FINISH"

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 609
    return-void

    .line 592
    :cond_0
    :try_start_1
    const-string v1, "Could not perform checkout."

    const/4 v2, 0x0

    invoke-direct {p0, v1, v2}, Lcom/getjar/sdk/rewards/JavaScriptAPI;->showMessageDialog(Ljava/lang/String;Z)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 607
    :catchall_0
    move-exception v1

    sget-object v2, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    const-string v4, "JavaScriptAPI: performManagedCheckout() FINISH"

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    throw v1

    .line 595
    :cond_1
    :try_start_2
    iget-object v1, p0, Lcom/getjar/sdk/rewards/JavaScriptAPI;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v1}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "com.getjar.rewards"

    invoke-static {v1, v2}, Lcom/getjar/sdk/utilities/Utility;->isExistApp(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 599
    const-string v1, "com.getjar.rewards"

    invoke-virtual {p0, v1, p1}, Lcom/getjar/sdk/rewards/JavaScriptAPI;->launch(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 602
    :cond_2
    const-string v1, "Install Getjar Rewards to buy these app deals and earn free rewards"

    const/4 v2, 0x1

    invoke-direct {p0, v1, v2}, Lcom/getjar/sdk/rewards/JavaScriptAPI;->showMessageDialog(Ljava/lang/String;Z)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0
.end method

.method public purchaseManagedOffer(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 7
    .param p1, "offerId"    # Ljava/lang/String;
    .param p2, "purchaseMetadata"    # Ljava/lang/String;
    .param p3, "trackingMetadata"    # Ljava/lang/String;
    .param p4, "callback"    # Ljava/lang/String;
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 444
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    sget-object v2, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    const-string v2, "\'offerId\' cannot be null or empty"

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;)V

    .line 555
    :goto_0
    return-void

    .line 445
    :cond_0
    invoke-static {p2}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    sget-object v0, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    sget-object v2, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    const-string v2, "\'purchaseMetadata\' cannot be null or empty"

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;)V

    goto :goto_0

    .line 446
    :cond_1
    invoke-static {p3}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    sget-object v0, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    sget-object v2, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    const-string v2, "\'trackingMetadata\' cannot be null or empty"

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;)V

    goto :goto_0

    .line 447
    :cond_2
    invoke-static {p4}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    sget-object v0, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    sget-object v2, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    const-string v2, "\'callback\' cannot be null or empty"

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;)V

    goto :goto_0

    .line 449
    :cond_3
    sget-object v0, Lcom/getjar/sdk/rewards/JavaScriptAPI;->_callbackToStartTimeMap:Ljava/util/HashMap;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, p4, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 450
    sget-object v6, Lcom/getjar/sdk/rewards/JavaScriptAPI;->_ExecutorService:Ljava/util/concurrent/ExecutorService;

    new-instance v0, Lcom/getjar/sdk/rewards/JavaScriptAPI$2;

    move-object v1, p0

    move-object v2, p2

    move-object v3, p3

    move-object v4, p1

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/getjar/sdk/rewards/JavaScriptAPI$2;-><init>(Lcom/getjar/sdk/rewards/JavaScriptAPI;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v6, v0}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method public redeemVoucher(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 9
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "voucherToken"    # Ljava/lang/String;
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 350
    sget-object v4, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    const-string v6, "JavaScriptAPI: redeemVoucher() START"

    invoke-static {v4, v5, v6}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 353
    :try_start_0
    sget-object v3, Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptRedeemIntentResult;->UNKNOWN_FAILURE:Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptRedeemIntentResult;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 357
    .local v3, "result":Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptRedeemIntentResult;
    :try_start_1
    iget-object v4, p0, Lcom/getjar/sdk/rewards/JavaScriptAPI;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v4}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {p1, p2, v4}, Lcom/getjar/sdk/data/RedemptionEngine;->buildRedeemVoucherIntent(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v2

    .line 358
    .local v2, "redeemIntent":Landroid/content/Intent;
    iget-object v4, p0, Lcom/getjar/sdk/rewards/JavaScriptAPI;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v4}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4, v2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 360
    sget-object v3, Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptRedeemIntentResult;->SUCCESS:Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptRedeemIntentResult;

    .line 363
    iget-object v4, p0, Lcom/getjar/sdk/rewards/JavaScriptAPI;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v4}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4, p2}, Lcom/getjar/sdk/utilities/AlarmsUtility;->scheduleVoucherRedemptionCheck(Landroid/content/Context;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 382
    .end local v2    # "redeemIntent":Landroid/content/Intent;
    :goto_0
    :try_start_2
    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "\"%1$s\""

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-virtual {v3}, Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptRedeemIntentResult;->name()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v4

    .line 385
    sget-object v5, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    const-string v7, "JavaScriptAPI: redeemVoucher() FINISH"

    invoke-static {v5, v6, v7}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    return-object v4

    .line 365
    :catch_0
    move-exception v0

    .line 368
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    .line 370
    .local v1, "packageInfo":Landroid/content/pm/PackageInfo;
    :try_start_3
    iget-object v4, p0, Lcom/getjar/sdk/rewards/JavaScriptAPI;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v4}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v4, p1, v5}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    :try_end_3
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-result-object v1

    .line 373
    :goto_1
    if-nez v1, :cond_0

    .line 374
    :try_start_4
    sget-object v3, Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptRedeemIntentResult;->TARGET_NOT_INSTALLED:Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptRedeemIntentResult;

    .line 380
    :goto_2
    sget-object v4, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    sget-object v6, Lcom/getjar/sdk/logging/Area;->REDEEM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    or-long/2addr v4, v6

    sget-object v6, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    or-long/2addr v4, v6

    const-string v6, "redeemVoucher() failed"

    invoke-static {v4, v5, v6, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_0

    .line 385
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v1    # "packageInfo":Landroid/content/pm/PackageInfo;
    .end local v3    # "result":Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptRedeemIntentResult;
    :catchall_0
    move-exception v4

    sget-object v5, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    const-string v7, "JavaScriptAPI: redeemVoucher() FINISH"

    invoke-static {v5, v6, v7}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    throw v4

    .line 376
    .restart local v0    # "e":Ljava/lang/Exception;
    .restart local v1    # "packageInfo":Landroid/content/pm/PackageInfo;
    .restart local v3    # "result":Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptRedeemIntentResult;
    :cond_0
    :try_start_5
    sget-object v3, Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptRedeemIntentResult;->TARGET_DISABLED:Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptRedeemIntentResult;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_2

    .line 371
    :catch_1
    move-exception v4

    goto :goto_1
.end method

.method public setAccount(Ljava/lang/String;Ljava/lang/String;)V
    .locals 7
    .param p1, "accountName"    # Ljava/lang/String;
    .param p2, "providerFilter"    # Ljava/lang/String;
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 210
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 211
    sget-object v1, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    const-string v3, "\'accountName\' cannot be null or empty"

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;)V

    .line 267
    :goto_0
    return-void

    .line 214
    :cond_0
    invoke-static {p2}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 215
    sget-object v1, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    const-string v3, "\'providerFilter\' cannot be null or empty"

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;)V

    goto :goto_0

    .line 218
    :cond_1
    new-instance v1, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;

    invoke-direct {v1}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;-><init>()V

    invoke-virtual {v1}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;->getProviderFilter()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 220
    sget-object v1, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "Unsupported \'providerFilter\' value [%1$s]"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p2, v5, v6

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;)V

    goto :goto_0

    .line 224
    :cond_2
    sget-object v1, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    const-string v3, "JavaScriptAPI: setAccount() START"

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 225
    iget-object v1, p0, Lcom/getjar/sdk/rewards/JavaScriptAPI;->_parentActivity:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-virtual {v1}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->waitDialogShow()V

    .line 228
    :try_start_0
    sget-object v1, Lcom/getjar/sdk/rewards/JavaScriptAPI;->_ExecutorService:Ljava/util/concurrent/ExecutorService;

    new-instance v2, Lcom/getjar/sdk/rewards/JavaScriptAPI$1;

    invoke-direct {v2, p0, p1, p2}, Lcom/getjar/sdk/rewards/JavaScriptAPI$1;-><init>(Lcom/getjar/sdk/rewards/JavaScriptAPI;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 261
    :catch_0
    move-exception v0

    .line 264
    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    const-string v3, "JavaScriptAPI: setAccount() failed"

    invoke-static {v1, v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 265
    iget-object v1, p0, Lcom/getjar/sdk/rewards/JavaScriptAPI;->_parentActivity:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-virtual {v1}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->waitDialogHide()V

    goto :goto_0
.end method

.method public setCurrentManagedOfferDetails(Ljava/lang/String;)V
    .locals 6
    .param p1, "managedOfferDetails"    # Ljava/lang/String;

    .prologue
    .line 394
    sget-object v0, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "JavaScriptAPI setCurrentManagedOfferDetails [%1$s]"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object p1, v4, v5

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 395
    iput-object p1, p0, Lcom/getjar/sdk/rewards/JavaScriptAPI;->_currentManagedOfferDetails:Ljava/lang/String;

    .line 396
    return-void
.end method
