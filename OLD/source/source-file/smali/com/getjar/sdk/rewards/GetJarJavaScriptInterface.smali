.class public Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;
.super Lcom/getjar/sdk/rewards/JavaScriptAPI;
.source "GetJarJavaScriptInterface.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$5;,
        Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$PurchaseCallback;,
        Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$ReauthThread;
    }
.end annotation


# instance fields
.field private _failBundle:Landroid/os/Bundle;

.field private _isExist:Z

.field private _lastReload:J

.field private final _messenger:Landroid/os/ResultReceiver;

.field private _productIdToProduct:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ProductWithClientTransactionID;",
            ">;"
        }
    .end annotation
.end field

.field private _purchaseResultHandler:Landroid/os/Handler;

.field private _successBundle:Landroid/os/Bundle;


# direct methods
.method public constructor <init>(Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;Landroid/os/ResultReceiver;Ljava/util/List;)V
    .locals 5
    .param p1, "gContext"    # Lcom/getjar/sdk/comm/CommContext;
    .param p2, "parentActivity"    # Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;
    .param p3, "receiver"    # Landroid/os/ResultReceiver;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/getjar/sdk/comm/CommContext;",
            "Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;",
            "Landroid/os/ResultReceiver;",
            "Ljava/util/List",
            "<",
            "Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ProductWithClientTransactionID;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p4, "theOffers":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ProductWithClientTransactionID;>;"
    const/4 v4, 0x0

    .line 87
    invoke-direct {p0, p1, p2}, Lcom/getjar/sdk/rewards/JavaScriptAPI;-><init>(Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;)V

    .line 79
    iput-boolean v4, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_isExist:Z

    .line 81
    const-wide/16 v2, 0x0

    iput-wide v2, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_lastReload:J

    .line 1097
    new-instance v2, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$4;

    invoke-direct {v2, p0}, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$4;-><init>(Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;)V

    iput-object v2, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_purchaseResultHandler:Landroid/os/Handler;

    .line 89
    if-nez p1, :cond_0

    .line 90
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Must have a valid context."

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 92
    :cond_0
    if-nez p2, :cond_1

    .line 93
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Must have a valid parent Activity."

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 95
    :cond_1
    if-eqz p4, :cond_2

    invoke-interface {p4}, Ljava/util/List;->size()I

    move-result v2

    if-gtz v2, :cond_3

    .line 96
    :cond_2
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Must provide a non-empty list of offers."

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 99
    :cond_3
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    iput-object v2, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_productIdToProduct:Ljava/util/Map;

    .line 100
    invoke-interface {p4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ProductWithClientTransactionID;

    .line 101
    .local v1, "offer":Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ProductWithClientTransactionID;
    iget-object v2, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_productIdToProduct:Ljava/util/Map;

    invoke-virtual {v1}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ProductWithClientTransactionID;->getProduct()Lcom/getjar/sdk/Product;

    move-result-object v3

    invoke-virtual {v3}, Lcom/getjar/sdk/Product;->getProductId()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 103
    .end local v1    # "offer":Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ProductWithClientTransactionID;
    :cond_4
    iput-boolean v4, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_isExist:Z

    .line 105
    iput-object p3, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_messenger:Landroid/os/ResultReceiver;

    .line 106
    return-void
.end method

.method private _requestInstall(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/getjar/sdk/utilities/Constants$RequestInstallType;)V
    .locals 16
    .param p1, "thePackageName"    # Ljava/lang/String;
    .param p2, "theFriendlyName"    # Ljava/lang/String;
    .param p3, "theDownloadUrl"    # Ljava/lang/String;
    .param p4, "theAppMetadata"    # Ljava/lang/String;
    .param p5, "theTrackingMetadata"    # Ljava/lang/String;
    .param p6, "theRequestType"    # Lcom/getjar/sdk/utilities/Constants$RequestInstallType;

    .prologue
    .line 977
    invoke-static/range {p1 .. p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_0

    new-instance v9, Ljava/lang/IllegalArgumentException;

    const-string v10, "\'thePackageName\' cannot be NULL or empty"

    invoke-direct {v9, v10}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 978
    :cond_0
    invoke-static/range {p2 .. p2}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_1

    new-instance v9, Ljava/lang/IllegalArgumentException;

    const-string v10, "\'theFriendlyName\' cannot be NULL or empty"

    invoke-direct {v9, v10}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 979
    :cond_1
    invoke-static/range {p3 .. p3}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_2

    new-instance v9, Ljava/lang/IllegalArgumentException;

    const-string v10, "\'theDownloadUrl\' cannot be NULL or empty"

    invoke-direct {v9, v10}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 980
    :cond_2
    invoke-static/range {p4 .. p4}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_3

    new-instance v9, Ljava/lang/IllegalArgumentException;

    const-string v10, "\'theAppMetadata\' cannot be NULL or empty"

    invoke-direct {v9, v10}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 981
    :cond_3
    invoke-static/range {p5 .. p5}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_4

    new-instance v9, Ljava/lang/IllegalArgumentException;

    const-string v10, "\'theTrackingMetadata\' cannot be NULL or empty"

    invoke-direct {v9, v10}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 982
    :cond_4
    if-nez p6, :cond_5

    new-instance v9, Ljava/lang/IllegalArgumentException;

    const-string v10, "\'theRequestType\' cannot be NULL"

    invoke-direct {v9, v10}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 987
    :cond_5
    :try_start_0
    sget-object v9, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v9}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v9

    sget-object v11, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v11}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v11

    or-long/2addr v9, v11

    sget-object v11, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v11}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v11

    or-long/2addr v9, v11

    sget-object v11, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v12, "JavaScriptAPI: _requestInstall(packageName:%1$s, friendlyName:%2$s, downloadUrl:%3$s, requestType:%4$s)"

    const/4 v13, 0x4

    new-array v13, v13, [Ljava/lang/Object;

    const/4 v14, 0x0

    aput-object p1, v13, v14

    const/4 v14, 0x1

    aput-object p2, v13, v14

    const/4 v14, 0x2

    aput-object p3, v13, v14

    const/4 v14, 0x3

    invoke-virtual/range {p6 .. p6}, Lcom/getjar/sdk/utilities/Constants$RequestInstallType;->name()Ljava/lang/String;

    move-result-object v15

    aput-object v15, v13, v14

    invoke-static {v11, v12, v13}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-static {v9, v10, v11}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 993
    sget-object v9, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v9}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v9

    sget-object v11, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v11}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v11

    or-long/2addr v9, v11

    sget-object v11, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v11}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v11

    or-long/2addr v9, v11

    sget-object v11, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v12, "JavaScriptAPI: _requestInstall() applicationMetadata: %1$s"

    const/4 v13, 0x1

    new-array v13, v13, [Ljava/lang/Object;

    const/4 v14, 0x0

    aput-object p4, v13, v14

    invoke-static {v11, v12, v13}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-static {v9, v10, v11}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 994
    sget-object v9, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v9}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v9

    sget-object v11, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v11}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v11

    or-long/2addr v9, v11

    sget-object v11, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v11}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v11

    or-long/2addr v9, v11

    sget-object v11, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v12, "JavaScriptAPI: _requestInstall() trackingMetadata: %1$s"

    const/4 v13, 0x1

    new-array v13, v13, [Ljava/lang/Object;

    const/4 v14, 0x0

    aput-object p5, v13, v14

    invoke-static {v11, v12, v13}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-static {v9, v10, v11}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 997
    invoke-static/range {p5 .. p5}, Lcom/getjar/sdk/utilities/Utility;->jsonArrayStringToMap(Ljava/lang/String;)Ljava/util/HashMap;

    move-result-object v8

    .line 998
    .local v8, "trackingMetaMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v8}, Ljava/util/Map;->size()I

    move-result v9

    if-lez v9, :cond_6

    .line 999
    const-string v9, "client_app.token"

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v10}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v10

    invoke-static {v10}, Lcom/getjar/sdk/comm/auth/ApplicationKeyDatabase;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/comm/auth/ApplicationKeyDatabase;

    move-result-object v10

    invoke-virtual {v10}, Lcom/getjar/sdk/comm/auth/ApplicationKeyDatabase;->getApplicationKey()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v8, v9, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1002
    const-string v9, "legacy.device.user_agent"

    invoke-static {}, Lcom/getjar/sdk/comm/UserAgentValuesManager;->getInstance()Lcom/getjar/sdk/comm/UserAgentValuesManager;

    move-result-object v10

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v11}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v11

    invoke-virtual {v10, v11}, Lcom/getjar/sdk/comm/UserAgentValuesManager;->getWebKitUserAgent(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v10

    invoke-interface {v8, v9, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1004
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4, v8}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    .line 1005
    .local v4, "appMetaJson":Lorg/json/JSONObject;
    invoke-virtual {v4}, Lorg/json/JSONObject;->length()I

    move-result v9

    if-lez v9, :cond_6

    .line 1007
    new-instance v5, Lorg/json/JSONArray;

    invoke-direct {v5}, Lorg/json/JSONArray;-><init>()V

    .line 1008
    .local v5, "arrayMeta":Lorg/json/JSONArray;
    invoke-virtual {v5, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 1009
    invoke-virtual {v5}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object p5

    .line 1014
    .end local v4    # "appMetaJson":Lorg/json/JSONObject;
    .end local v5    # "arrayMeta":Lorg/json/JSONArray;
    :cond_6
    sget-object v9, Lcom/getjar/sdk/utilities/Constants$RequestInstallType;->EARN:Lcom/getjar/sdk/utilities/Constants$RequestInstallType;

    move-object/from16 v0, p6

    invoke-virtual {v9, v0}, Lcom/getjar/sdk/utilities/Constants$RequestInstallType;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_7

    .line 1015
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v9}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v9

    invoke-static {v9}, Lcom/getjar/sdk/data/earning/EarnStateDatabase;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/earning/EarnStateDatabase;

    move-result-object v9

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    move-object/from16 v2, p4

    move-object/from16 v3, p5

    invoke-virtual {v9, v0, v1, v2, v3}, Lcom/getjar/sdk/data/earning/EarnStateDatabase;->addAppState(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1022
    sget-object v9, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v9}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v9

    sget-object v11, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v11}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v11

    or-long/2addr v9, v11

    sget-object v11, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v11}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v11

    or-long/2addr v9, v11

    sget-object v11, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v11}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v11

    or-long/2addr v9, v11

    const-string v11, "JavaScriptAPI: _requestInstall() starting usage monitoring thread"

    invoke-static {v9, v10, v11}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 1023
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v9}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v9

    invoke-static {v9}, Lcom/getjar/sdk/data/earning/EarningMonitor;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/earning/EarningMonitor;

    move-result-object v9

    invoke-virtual {v9}, Lcom/getjar/sdk/data/earning/EarningMonitor;->startMonitoring()V

    .line 1027
    :cond_7
    sget-object v9, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v9}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v9

    sget-object v11, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v11}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v11

    or-long/2addr v9, v11

    sget-object v11, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v11}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v11

    or-long/2addr v9, v11

    sget-object v11, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v12, "JavaScriptAPI: Pushing download URL to the Android OS [downloadURl: %1$s]"

    const/4 v13, 0x1

    new-array v13, v13, [Ljava/lang/Object;

    const/4 v14, 0x0

    aput-object p3, v13, v14

    invoke-static {v11, v12, v13}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-static {v9, v10, v11}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 1028
    new-instance v7, Landroid/content/Intent;

    const-string v9, "android.intent.action.VIEW"

    invoke-static/range {p3 .. p3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v10

    invoke-direct {v7, v9, v10}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 1029
    .local v7, "googPlayIntent":Landroid/content/Intent;
    const/high16 v9, 0x10000000

    invoke-virtual {v7, v9}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 1030
    const/high16 v9, 0x8000000

    invoke-virtual {v7, v9}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 1031
    const/high16 v9, 0x40000000    # 2.0f

    invoke-virtual {v7, v9}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 1032
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v9}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v9

    invoke-virtual {v9, v7}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1037
    .end local v7    # "googPlayIntent":Landroid/content/Intent;
    .end local v8    # "trackingMetaMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :goto_0
    return-void

    .line 1034
    :catch_0
    move-exception v6

    .line 1035
    .local v6, "e":Ljava/lang/Exception;
    sget-object v9, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v9}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v9

    sget-object v11, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v11}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v11

    or-long/2addr v9, v11

    sget-object v11, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v11}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v11

    or-long/2addr v9, v11

    const-string v11, "JavaScriptAPI: _requestInstall() failed"

    invoke-static {v9, v10, v11, v6}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method static synthetic access$000(Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;
    .param p1, "x1"    # Ljava/lang/Boolean;
    .param p2, "x2"    # Ljava/lang/Boolean;
    .param p3, "x3"    # Ljava/lang/String;

    .prologue
    .line 75
    invoke-direct {p0, p1, p2, p3}, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->configureWebViewOnUIThread(Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$200(Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;)Landroid/os/Bundle;
    .locals 1
    .param p0, "x0"    # Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;

    .prologue
    .line 75
    iget-object v0, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_successBundle:Landroid/os/Bundle;

    return-object v0
.end method

.method static synthetic access$202(Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;Landroid/os/Bundle;)Landroid/os/Bundle;
    .locals 0
    .param p0, "x0"    # Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;
    .param p1, "x1"    # Landroid/os/Bundle;

    .prologue
    .line 75
    iput-object p1, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_successBundle:Landroid/os/Bundle;

    return-object p1
.end method

.method static synthetic access$300(Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;Landroid/os/Bundle;)V
    .locals 0
    .param p0, "x0"    # Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;
    .param p1, "x1"    # Landroid/os/Bundle;

    .prologue
    .line 75
    invoke-direct {p0, p1}, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->purchaseSuccess(Landroid/os/Bundle;)V

    return-void
.end method

.method static synthetic access$400(Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;)Landroid/os/Bundle;
    .locals 1
    .param p0, "x0"    # Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;

    .prologue
    .line 75
    iget-object v0, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_failBundle:Landroid/os/Bundle;

    return-object v0
.end method

.method static synthetic access$402(Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;Landroid/os/Bundle;)Landroid/os/Bundle;
    .locals 0
    .param p0, "x0"    # Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;
    .param p1, "x1"    # Landroid/os/Bundle;

    .prologue
    .line 75
    iput-object p1, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_failBundle:Landroid/os/Bundle;

    return-object p1
.end method

.method static synthetic access$500(Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;Landroid/os/Bundle;)V
    .locals 0
    .param p0, "x0"    # Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;
    .param p1, "x1"    # Landroid/os/Bundle;

    .prologue
    .line 75
    invoke-direct {p0, p1}, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->purchaseFail(Landroid/os/Bundle;)V

    return-void
.end method

.method static synthetic access$600(Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;)Landroid/os/Handler;
    .locals 1
    .param p0, "x0"    # Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;

    .prologue
    .line 75
    iget-object v0, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_purchaseResultHandler:Landroid/os/Handler;

    return-object v0
.end method

.method private configureWebViewOnUIThread(Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/String;)V
    .locals 5
    .param p1, "builtInZoom"    # Ljava/lang/Boolean;
    .param p2, "supportZoom"    # Ljava/lang/Boolean;
    .param p3, "zoomDensity"    # Ljava/lang/String;

    .prologue
    .line 893
    invoke-static {}, Lcom/getjar/sdk/utilities/Utility;->isCurrentThreadTheUIThread()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 896
    iget-object v3, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_parentActivity:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-virtual {v3}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->getParentActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/view/ViewGroup;

    invoke-direct {p0, v3}, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->findWebViewInUILayout(Landroid/view/ViewGroup;)Landroid/webkit/WebView;

    move-result-object v1

    .line 897
    .local v1, "webView":Landroid/webkit/WebView;
    if-nez v1, :cond_0

    .line 898
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v4, "Unable to find the WebView in the UI layout!"

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 901
    :cond_0
    invoke-virtual {v1}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    .line 902
    .local v0, "webSettings":Landroid/webkit/WebSettings;
    if-eqz p3, :cond_1

    .line 903
    invoke-direct {p0, p3}, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->getZoomDensity(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    .line 904
    .local v2, "zoomDensityEnum":Ljava/lang/Object;
    invoke-static {v0, v2}, Lcom/getjar/sdk/rewards/WebSettingsEx;->setDefaultZoom(Landroid/webkit/WebSettings;Ljava/lang/Object;)V

    .line 906
    .end local v2    # "zoomDensityEnum":Ljava/lang/Object;
    :cond_1
    if-eqz p1, :cond_2

    .line 907
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    invoke-virtual {v0, v3}, Landroid/webkit/WebSettings;->setBuiltInZoomControls(Z)V

    .line 909
    :cond_2
    if-eqz p2, :cond_3

    .line 910
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    invoke-virtual {v0, v3}, Landroid/webkit/WebSettings;->setSupportZoom(Z)V

    .line 915
    :cond_3
    return-void

    .line 913
    .end local v0    # "webSettings":Landroid/webkit/WebSettings;
    .end local v1    # "webView":Landroid/webkit/WebView;
    :cond_4
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v4, "configureWebViewOnUIThread -- Not called from a UI thread."

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method private findWebViewInUILayout(Landroid/view/ViewGroup;)Landroid/webkit/WebView;
    .locals 5
    .param p1, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 919
    const/4 v2, 0x0

    .line 920
    .local v2, "webView":Landroid/webkit/WebView;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v3

    if-ge v1, v3, :cond_0

    .line 921
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 922
    .local v0, "child":Landroid/view/View;
    if-eqz v0, :cond_2

    .line 923
    const-class v3, Landroid/webkit/WebView;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v3

    if-eqz v3, :cond_1

    move-object v2, v0

    .line 924
    check-cast v2, Landroid/webkit/WebView;

    .line 934
    .end local v0    # "child":Landroid/view/View;
    :cond_0
    return-object v2

    .line 926
    .restart local v0    # "child":Landroid/view/View;
    :cond_1
    const-class v3, Landroid/view/ViewGroup;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 927
    check-cast v0, Landroid/view/ViewGroup;

    .end local v0    # "child":Landroid/view/View;
    invoke-direct {p0, v0}, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->findWebViewInUILayout(Landroid/view/ViewGroup;)Landroid/webkit/WebView;

    move-result-object v2

    .line 928
    if-nez v2, :cond_0

    .line 920
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method private getZoomDensity(Ljava/lang/String;)Ljava/lang/Object;
    .locals 2
    .param p1, "zoomDensityString"    # Ljava/lang/String;

    .prologue
    .line 939
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 940
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "zoomDensityString cannot be empty or null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 942
    :cond_0
    const-string v0, "FAR"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 943
    sget-object v0, Lcom/getjar/sdk/rewards/WebSettingsEx$ZoomDensity;->FAR:Ljava/lang/Object;

    .line 947
    :goto_0
    return-object v0

    .line 944
    :cond_1
    const-string v0, "MEDIUM"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 945
    sget-object v0, Lcom/getjar/sdk/rewards/WebSettingsEx$ZoomDensity;->MEDIUM:Ljava/lang/Object;

    goto :goto_0

    .line 946
    :cond_2
    const-string v0, "CLOSE"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 947
    sget-object v0, Lcom/getjar/sdk/rewards/WebSettingsEx$ZoomDensity;->CLOSE:Ljava/lang/Object;

    goto :goto_0

    .line 949
    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Invalid value for zoomDensity"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private purchaseFail(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "b"    # Landroid/os/Bundle;

    .prologue
    .line 957
    iget-object v0, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_messenger:Landroid/os/ResultReceiver;

    const/4 v1, 0x6

    invoke-virtual {v0, v1, p1}, Landroid/os/ResultReceiver;->send(ILandroid/os/Bundle;)V

    .line 958
    return-void
.end method

.method private purchaseSuccess(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "b"    # Landroid/os/Bundle;

    .prologue
    .line 953
    iget-object v0, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_messenger:Landroid/os/ResultReceiver;

    const/4 v1, 0x5

    invoke-virtual {v0, v1, p1}, Landroid/os/ResultReceiver;->send(ILandroid/os/Bundle;)V

    .line 954
    return-void
.end method

.method private reloadViewInternal(ZZ)V
    .locals 13
    .param p1, "reauth"    # Z
    .param p2, "doSafety"    # Z

    .prologue
    const/4 v12, 0x1

    const/4 v11, 0x0

    const/4 v10, 0x0

    .line 1055
    iget-object v3, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_parentActivity:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-virtual {v3}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->waitDialogShow()V

    .line 1056
    sget-object v3, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "JavaScriptAPI: reloadView called from thread.id:%1$d thread.name:%2$s"

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Object;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Thread;->getId()J

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    aput-object v8, v7, v11

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v7, v12

    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 1060
    iget-boolean v3, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_isExist:Z

    if-nez v3, :cond_0

    .line 1061
    sget-object v3, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    const-string v5, "JavaScriptAPI: reloadView past isExist"

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 1062
    if-eqz p1, :cond_2

    .line 1066
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    iget-wide v5, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_lastReload:J

    sub-long v1, v3, v5

    .line 1067
    .local v1, "lastAttemptDelta":J
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    iput-wide v3, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_lastReload:J

    .line 1068
    if-eqz p2, :cond_1

    const-wide/32 v3, 0xea60

    cmp-long v3, v1, v3

    if-gez v3, :cond_1

    .line 1069
    sget-object v3, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "JavaScriptAPI: A re-authorization/reload attempt was made %1$d milliseconds ago, skipping this attempt request"

    new-array v7, v12, [Ljava/lang/Object;

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    aput-object v8, v7, v11

    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;)V

    .line 1074
    iget-object v3, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_messenger:Landroid/os/ResultReceiver;

    const/4 v4, 0x3

    invoke-virtual {v3, v4, v10}, Landroid/os/ResultReceiver;->send(ILandroid/os/Bundle;)V

    .line 1092
    .end local v1    # "lastAttemptDelta":J
    :cond_0
    :goto_0
    return-void

    .line 1079
    .restart local v1    # "lastAttemptDelta":J
    :cond_1
    sget-object v3, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    const-string v5, "JavaScriptAPI: reloadView is re-authorizing"

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 1081
    :try_start_0
    new-instance v3, Ljava/lang/Thread;

    new-instance v4, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$ReauthThread;

    const/4 v5, 0x0

    invoke-direct {v4, p0, v5}, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$ReauthThread;-><init>(Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$1;)V

    invoke-direct {v3, v4}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v3}, Ljava/lang/Thread;->start()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1082
    :catch_0
    move-exception v0

    .line 1083
    .local v0, "e":Ljava/lang/Exception;
    sget-object v3, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    const-string v5, "JavaScriptAPI: reloadViewInternal() failed"

    invoke-static {v3, v4, v5, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 1088
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v1    # "lastAttemptDelta":J
    :cond_2
    iget-object v3, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_messenger:Landroid/os/ResultReceiver;

    const/16 v4, 0xa

    invoke-virtual {v3, v4, v10}, Landroid/os/ResultReceiver;->send(ILandroid/os/Bundle;)V

    goto :goto_0
.end method


# virtual methods
.method public buyGold(Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .param p1, "platformItemId"    # Ljava/lang/String;
    .param p2, "trackingMetadata"    # Ljava/lang/String;
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 480
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "\'platformItemId\' cannot be null or empty"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 484
    :cond_0
    :try_start_0
    invoke-static {p2}, Lcom/getjar/sdk/utilities/Utility;->jsonArrayStringToMap(Ljava/lang/String;)Ljava/util/HashMap;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 490
    .local v1, "trackingMetadataMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :goto_0
    iget-object v2, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v2}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/getjar/sdk/comm/auth/AuthManager;->initialize(Landroid/content/Context;)V

    .line 491
    const-string v2, "client_app.token"

    iget-object v3, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v3}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/getjar/sdk/comm/auth/ApplicationKeyDatabase;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/comm/auth/ApplicationKeyDatabase;

    move-result-object v3

    invoke-virtual {v3}, Lcom/getjar/sdk/comm/auth/ApplicationKeyDatabase;->getApplicationKey()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 494
    const-string v2, "user.user_access_id"

    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/getjar/sdk/comm/auth/AuthManager;->getUserAccessId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 495
    const-string v2, "legacy.device.user_agent"

    invoke-static {}, Lcom/getjar/sdk/comm/UserAgentValuesManager;->getInstance()Lcom/getjar/sdk/comm/UserAgentValuesManager;

    move-result-object v3

    iget-object v4, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v4}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/getjar/sdk/comm/UserAgentValuesManager;->getWebKitUserAgent(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 496
    iget-object v2, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v2}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/rewards/InAppPurchaseManager;

    move-result-object v2

    iget-object v3, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_parentActivity:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-virtual {v3}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->getParentActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-virtual {v2, p1, v1, v3}, Lcom/getjar/sdk/rewards/InAppPurchaseManager;->buyGoldOffer(Ljava/lang/String;Ljava/util/HashMap;Landroid/app/Activity;)V

    .line 498
    return-void

    .line 485
    .end local v1    # "trackingMetadataMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :catch_0
    move-exception v0

    .line 486
    .local v0, "e":Lorg/json/JSONException;
    sget-object v2, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    sget-object v4, Lcom/getjar/sdk/logging/Area;->BUY_GOLD:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    const-string v4, "JavaScriptAPI: ERROR: Invalid tracking data."

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;)V

    .line 487
    new-instance v1, Ljava/util/HashMap;

    const/4 v2, 0x3

    invoke-direct {v1, v2}, Ljava/util/HashMap;-><init>(I)V

    .restart local v1    # "trackingMetadataMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    goto :goto_0
.end method

.method public canBuy()Z
    .locals 5
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 844
    :try_start_0
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v1

    iget-object v2, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v2}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/getjar/sdk/comm/auth/AuthManager;->getClaimsManager(Landroid/content/Context;)Lcom/getjar/sdk/comm/auth/ClaimsManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/getjar/sdk/comm/auth/ClaimsManager;->canBuy()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 847
    :goto_0
    return v1

    .line 845
    :catch_0
    move-exception v0

    .line 846
    .local v0, "e":Ljava/lang/Exception;
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

    sget-object v3, Lcom/getjar/sdk/logging/Area;->BUY_GOLD:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "ClaimsManager.canBuy() failed"

    invoke-static {v1, v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 847
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public canEarn()Z
    .locals 5
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 856
    :try_start_0
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v1

    iget-object v2, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v2}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/getjar/sdk/comm/auth/AuthManager;->getClaimsManager(Landroid/content/Context;)Lcom/getjar/sdk/comm/auth/ClaimsManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/getjar/sdk/comm/auth/ClaimsManager;->canEarn()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 859
    :goto_0
    return v1

    .line 857
    :catch_0
    move-exception v0

    .line 858
    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    sget-object v3, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    sget-object v3, Lcom/getjar/sdk/logging/Area;->CONFIG:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "ClaimsManager.canEarn() failed"

    invoke-static {v1, v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 859
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public canPurchaseUnmanagedProducts()Z
    .locals 5
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 868
    :try_start_0
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v1

    iget-object v2, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v2}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/getjar/sdk/comm/auth/AuthManager;->getClaimsManager(Landroid/content/Context;)Lcom/getjar/sdk/comm/auth/ClaimsManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/getjar/sdk/comm/auth/ClaimsManager;->canPurchaseUnmanagedProducts()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 871
    :goto_0
    return v1

    .line 869
    :catch_0
    move-exception v0

    .line 870
    .local v0, "e":Ljava/lang/Exception;
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

    const-string v3, "ClaimsManager.canPurchaseUnmanagedProducts() failed"

    invoke-static {v1, v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 871
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public closeView()V
    .locals 4
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 263
    sget-object v0, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    const-string v2, "JavaScriptAPI: closeView is called"

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 264
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_isExist:Z

    .line 265
    iget-object v0, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_messenger:Landroid/os/ResultReceiver;

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/os/ResultReceiver;->send(ILandroid/os/Bundle;)V

    .line 266
    return-void
.end method

.method public configureWebView(Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/String;)V
    .locals 4
    .param p1, "builtInZoom"    # Ljava/lang/Boolean;
    .param p2, "supportZoom"    # Ljava/lang/Boolean;
    .param p3, "zoomDensity"    # Ljava/lang/String;
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 542
    iget-object v0, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_parentActivity:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    if-nez v0, :cond_0

    .line 543
    sget-object v0, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    const-string v2, "JavaScriptAPI: getDisplayMetrics() -- _parentActivity cannot be null."

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    .line 566
    :goto_0
    return-void

    .line 548
    :cond_0
    invoke-static {}, Lcom/getjar/sdk/utilities/Utility;->isCurrentThreadTheUIThread()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 549
    invoke-direct {p0, p1, p2, p3}, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->configureWebViewOnUIThread(Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/String;)V

    goto :goto_0

    .line 551
    :cond_1
    iget-object v0, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_parentActivity:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-virtual {v0}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->getParentActivity()Landroid/app/Activity;

    move-result-object v0

    new-instance v1, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$3;

    invoke-direct {v1, p0, p1, p2, p3}, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$3;-><init>(Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method public getAppState(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p1, "thePackageName"    # Ljava/lang/String;
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 335
    sget-object v0, Lcom/getjar/sdk/utilities/Constants$AppState;->UNINSTALLED:Lcom/getjar/sdk/utilities/Constants$AppState;

    .line 337
    .local v0, "appState":Lcom/getjar/sdk/utilities/Constants$AppState;
    :try_start_0
    iget-object v2, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v2}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, p1, v3}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    .line 338
    sget-object v0, Lcom/getjar/sdk/utilities/Constants$AppState;->INSTALLED:Lcom/getjar/sdk/utilities/Constants$AppState;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 344
    :goto_0
    sget-object v2, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$5;->$SwitchMap$com$getjar$sdk$utilities$Constants$AppState:[I

    invoke-virtual {v0}, Lcom/getjar/sdk/utilities/Constants$AppState;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_0

    .line 350
    const-string v1, "UNINSTALLED"

    .line 353
    .local v1, "appStateStr":Ljava/lang/String;
    :goto_1
    return-object v1

    .line 346
    .end local v1    # "appStateStr":Ljava/lang/String;
    :pswitch_0
    const-string v1, "INSTALLED"

    .line 347
    .restart local v1    # "appStateStr":Ljava/lang/String;
    goto :goto_1

    .line 339
    .end local v1    # "appStateStr":Ljava/lang/String;
    :catch_0
    move-exception v2

    goto :goto_0

    .line 344
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method public getAuthToken()Ljava/lang/String;
    .locals 8
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 615
    const-string v1, ""

    .line 617
    .local v1, "result":Ljava/lang/String;
    :try_start_0
    iget-object v2, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v2}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/getjar/sdk/comm/auth/AuthManager;->initialize(Landroid/content/Context;)V

    .line 618
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/getjar/sdk/comm/auth/AuthManager;->getAuthToken()Ljava/lang/String;

    move-result-object v1

    .line 619
    sget-object v2, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "JavaScriptAPI: getAuthToken() returning: \'%1$s\'"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object v1, v6, v7

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 623
    :goto_0
    return-object v1

    .line 620
    :catch_0
    move-exception v0

    .line 621
    .local v0, "e":Ljava/lang/Exception;
    sget-object v2, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    const-string v4, "JavaScriptAPI: getAuthToken() failed"

    invoke-static {v2, v3, v4, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public getCapabilities()Ljava/lang/String;
    .locals 9
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 593
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 595
    .local v0, "caps":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :try_start_0
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v5

    iget-object v6, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v6}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/getjar/sdk/comm/auth/AuthManager;->getClaimsManager(Landroid/content/Context;)Lcom/getjar/sdk/comm/auth/ClaimsManager;

    move-result-object v5

    invoke-virtual {v5}, Lcom/getjar/sdk/comm/auth/ClaimsManager;->getCapabilities()Ljava/util/Map;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v0

    .line 599
    :goto_0
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    .line 600
    .local v4, "output":Lorg/json/JSONObject;
    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 602
    .local v2, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :try_start_1
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 603
    :catch_0
    move-exception v1

    .line 604
    .local v1, "e":Lorg/json/JSONException;
    sget-object v5, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    sget-object v7, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    or-long/2addr v5, v7

    const-string v7, "JavaScriptAPI: getCapabilities() failed"

    invoke-static {v5, v6, v7, v1}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 596
    .end local v1    # "e":Lorg/json/JSONException;
    .end local v2    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v3    # "i$":Ljava/util/Iterator;
    .end local v4    # "output":Lorg/json/JSONObject;
    :catch_1
    move-exception v1

    .local v1, "e":Ljava/lang/Exception;
    sget-object v5, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    sget-object v7, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    or-long/2addr v5, v7

    const-string v7, "ClaimsManager.getCapabilities() failed"

    invoke-static {v5, v6, v7, v1}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 609
    .end local v1    # "e":Ljava/lang/Exception;
    .restart local v3    # "i$":Ljava/util/Iterator;
    .restart local v4    # "output":Lorg/json/JSONObject;
    :cond_0
    invoke-virtual {v4}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5
.end method

.method public getDeviceDetails()Ljava/lang/String;
    .locals 15
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 656
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 659
    .local v1, "deviceDetailsJson":Lorg/json/JSONObject;
    :try_start_0
    iget-object v8, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v8}, Lcom/getjar/sdk/comm/CommContext;->getWebKitUserAgent()Ljava/lang/String;

    move-result-object v2

    .line 660
    .local v2, "deviceFilterValue":Ljava/lang/String;
    iget-object v8, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v8}, Lcom/getjar/sdk/comm/CommContext;->getDeviceMetadata()Lcom/getjar/sdk/data/DeviceMetadata;

    move-result-object v8

    sget-object v9, Lcom/getjar/sdk/data/DeviceMetadata;->KEY_ANDROID_DEVICE_DEVICE_ID:Ljava/lang/String;

    invoke-virtual {v8, v9}, Lcom/getjar/sdk/data/DeviceMetadata;->getMetadataValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 661
    .local v3, "deviceId":Ljava/lang/String;
    iget-object v8, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v8}, Lcom/getjar/sdk/comm/CommContext;->getDeviceMetadata()Lcom/getjar/sdk/data/DeviceMetadata;

    move-result-object v8

    sget-object v9, Lcom/getjar/sdk/data/DeviceMetadata;->KEY_ANDROID_DEVICE_ANDROID_ID:Ljava/lang/String;

    invoke-virtual {v8, v9}, Lcom/getjar/sdk/data/DeviceMetadata;->getMetadataValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 662
    .local v0, "androidId":Ljava/lang/String;
    iget-object v8, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v8}, Lcom/getjar/sdk/comm/CommContext;->getDeviceMetadata()Lcom/getjar/sdk/data/DeviceMetadata;

    move-result-object v8

    sget-object v9, Lcom/getjar/sdk/data/DeviceMetadata;->KEY_ANDROID_DEVICE_SERIAL_NUMBER:Ljava/lang/String;

    invoke-virtual {v8, v9}, Lcom/getjar/sdk/data/DeviceMetadata;->getMetadataValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 664
    .local v7, "serialNumber":Ljava/lang/String;
    invoke-static {v2}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_0

    const-string v2, ""

    .line 665
    :cond_0
    invoke-static {v3}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_1

    const-string v3, ""

    .line 666
    :cond_1
    invoke-static {v0}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_2

    const-string v0, ""

    .line 667
    :cond_2
    invoke-static {v7}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_3

    const-string v7, ""

    .line 669
    :cond_3
    iget-object v8, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v8}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v8

    const-string v9, "android.permission.READ_PHONE_STATE"

    invoke-static {v8, v9}, Lcom/getjar/sdk/utilities/RewardUtility;->checkPermission(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v6

    .line 670
    .local v6, "hasReadPhoneStatePermission":Z
    iget-object v8, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v8}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v8

    const-string v9, "android.permission.ACCESS_WIFI_STATE"

    invoke-static {v8, v9}, Lcom/getjar/sdk/utilities/RewardUtility;->checkPermission(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v5

    .line 672
    .local v5, "hasAccessWifiStatePermission":Z
    const-string v8, "device_filter"

    invoke-virtual {v1, v8, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 673
    const-string v8, "android.device.device_id"

    invoke-virtual {v1, v8, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 674
    const-string v8, "android.device.serial_number"

    invoke-virtual {v1, v8, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 675
    const-string v8, "android.device.android_id"

    invoke-virtual {v1, v8, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 676
    const-string v8, "android.package.permission.read_phone_state"

    invoke-virtual {v1, v8, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 677
    const-string v8, "android.package.permission.access_wifi_state"

    invoke-virtual {v1, v8, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 679
    sget-object v8, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v8}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v8

    sget-object v10, Lcom/getjar/sdk/logging/Area;->CONFIG:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v10}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v10

    or-long/2addr v8, v10

    sget-object v10, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v11, "JavaScriptAPI: getDeviceDetails() returning:\r\n%1$s"

    const/4 v12, 0x1

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    const/4 v14, 0x4

    invoke-virtual {v1, v14}, Lorg/json/JSONObject;->toString(I)Ljava/lang/String;

    move-result-object v14

    aput-object v14, v12, v13

    invoke-static {v10, v11, v12}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v8, v9, v10}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 684
    .end local v0    # "androidId":Ljava/lang/String;
    .end local v2    # "deviceFilterValue":Ljava/lang/String;
    .end local v3    # "deviceId":Ljava/lang/String;
    .end local v5    # "hasAccessWifiStatePermission":Z
    .end local v6    # "hasReadPhoneStatePermission":Z
    .end local v7    # "serialNumber":Ljava/lang/String;
    :goto_0
    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v8

    return-object v8

    .line 681
    :catch_0
    move-exception v4

    .line 682
    .local v4, "e":Ljava/lang/Exception;
    sget-object v8, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v8}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v8

    sget-object v10, Lcom/getjar/sdk/logging/Area;->CONFIG:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v10}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v10

    or-long/2addr v8, v10

    const-string v10, "JavaScriptAPI: getDeviceDetails() failed"

    invoke-static {v8, v9, v10, v4}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public getDisplayLanguageTag()Ljava/lang/String;
    .locals 8
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 629
    const-string v1, "en-us"

    .line 631
    .local v1, "result":Ljava/lang/String;
    :try_start_0
    iget-object v2, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_parentActivity:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-virtual {v2}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->getDisplayLanguageTag()Ljava/lang/String;

    move-result-object v1

    .line 632
    sget-object v2, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    sget-object v4, Lcom/getjar/sdk/logging/Area;->LOCALIZATION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "JavaScriptAPI: getDisplayLanguageTag() returning: \'%1$s\'"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object v1, v6, v7

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 636
    :goto_0
    return-object v1

    .line 633
    :catch_0
    move-exception v0

    .line 634
    .local v0, "e":Ljava/lang/Exception;
    sget-object v2, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    sget-object v4, Lcom/getjar/sdk/logging/Area;->LOCALIZATION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    const-string v4, "JavaScriptAPI: getDisplayLanguageTag() failed"

    invoke-static {v2, v3, v4, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public getDisplayMetrics()Ljava/lang/String;
    .locals 4
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 530
    iget-object v0, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_parentActivity:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    if-nez v0, :cond_0

    .line 532
    sget-object v0, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    const-string v2, "JavaScriptAPI: getDisplayMetrics() -- _parentActivity cannot be null."

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    .line 533
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    .line 536
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_parentActivity:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-virtual {v0}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->getParentActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/getjar/sdk/utilities/ScreenUtility;->getDisplayMetrics(Landroid/content/Context;)Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public getLastReloadTime()J
    .locals 2
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 317
    iget-wide v0, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_lastReload:J

    return-wide v0
.end method

.method public getProductThumbnailString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 9
    .param p1, "productId"    # Ljava/lang/String;
    .param p2, "boundWidth"    # Ljava/lang/String;
    .param p3, "boundHeight"    # Ljava/lang/String;
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 399
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "productId cannot be null or empty"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 400
    :cond_0
    const/4 v1, 0x0

    .line 403
    .local v1, "image":Ljava/lang/String;
    :try_start_0
    sget-object v3, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Lcom/getjar/sdk/logging/Area;->PURCHASE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    const-string v5, "JavaScriptAPI: getProductThumbnailString() loading resource ID"

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 404
    iget-object v3, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_productIdToProduct:Ljava/util/Map;

    invoke-interface {v3, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ProductWithClientTransactionID;

    invoke-virtual {v3}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ProductWithClientTransactionID;->getProduct()Lcom/getjar/sdk/Product;

    move-result-object v3

    invoke-virtual {v3}, Lcom/getjar/sdk/Product;->getImageResourceId()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 405
    .local v2, "resourceId":Ljava/lang/Integer;
    if-eqz v2, :cond_1

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-lez v3, :cond_1

    .line 406
    sget-object v3, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Lcom/getjar/sdk/logging/Area;->PURCHASE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    const-string v5, "JavaScriptAPI: getProductThumbnailString() loading resource"

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 407
    iget-object v3, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_parentActivity:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-virtual {v3}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->getParentActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-static {p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    invoke-static {p3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    invoke-static {v3, v2, v4, v5}, Lcom/getjar/sdk/utilities/Utility;->getImageDataFromResource(Landroid/content/Context;Ljava/lang/Integer;II)Ljava/lang/String;

    move-result-object v1

    .line 408
    sget-object v3, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Lcom/getjar/sdk/logging/Area;->PURCHASE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    const-string v5, "JavaScriptAPI: getProductThumbnailString() resource found"

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 416
    .end local v2    # "resourceId":Ljava/lang/Integer;
    :goto_0
    return-object v1

    .line 410
    .restart local v2    # "resourceId":Ljava/lang/Integer;
    :cond_1
    sget-object v3, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Lcom/getjar/sdk/logging/Area;->PURCHASE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "JavaScriptAPI: getProductThumbnailString() no resource ID found for product \'%1$s\', returning null"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object p1, v7, v8

    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 413
    .end local v2    # "resourceId":Ljava/lang/Integer;
    :catch_0
    move-exception v0

    .line 414
    .local v0, "e":Ljava/lang/Exception;
    sget-object v3, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Lcom/getjar/sdk/logging/Area;->PURCHASE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    const-string v5, "JavaScriptAPI: getProductThumbnailString() failed to load resource, returning null"

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    goto :goto_0
.end method

.method public getRecentlyUsedApps()Ljava/lang/String;
    .locals 12
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 705
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 709
    .local v0, "appArray":Lorg/json/JSONArray;
    :try_start_0
    iget-object v5, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v5}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5}, Lcom/getjar/sdk/data/usage/UsageManager;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/usage/UsageManager;

    move-result-object v5

    invoke-virtual {v5}, Lcom/getjar/sdk/data/usage/UsageManager;->isRequestSendEnabled()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 711
    iget-object v5, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v5}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5}, Lcom/getjar/sdk/utilities/SystemUtility;->getRecentlyRunAppsFromOS(Landroid/content/Context;)Ljava/util/List;

    move-result-object v4

    .line 712
    .local v4, "recentPackageNames":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    sget-object v5, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    sget-object v7, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    or-long/2addr v5, v7

    sget-object v7, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v8, "JavaScriptAPI: getRecentlyUsedApps() %d recent apps"

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v11

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v9, v10

    invoke-static {v7, v8, v9}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v6, v7}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 715
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 716
    .local v3, "packageName":Ljava/lang/String;
    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 721
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v3    # "packageName":Ljava/lang/String;
    .end local v4    # "recentPackageNames":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :catch_0
    move-exception v1

    .line 722
    .local v1, "e":Ljava/lang/Exception;
    sget-object v5, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    sget-object v7, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    or-long/2addr v5, v7

    const-string v7, "JavaScriptAPI: getRecentlyUsedApps() failed"

    invoke-static {v5, v6, v7, v1}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 724
    .end local v1    # "e":Ljava/lang/Exception;
    :goto_1
    invoke-virtual {v0}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5

    .line 720
    :cond_0
    :try_start_1
    sget-object v5, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    sget-object v7, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    or-long/2addr v5, v7

    sget-object v7, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v8, "JavaScriptAPI: getRecentlyUsedApps() returning:\r\n%1$s"

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    const/4 v11, 0x4

    invoke-virtual {v0, v11}, Lorg/json/JSONArray;->toString(I)Ljava/lang/String;

    move-result-object v11

    aput-object v11, v9, v10

    invoke-static {v7, v8, v9}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v6, v7}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1
.end method

.method public getUnmanagedOffer(Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p1, "theProductId"    # Ljava/lang/String;
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 510
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 511
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "Must provide a non-null, non-empty product ID."

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 514
    :cond_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 515
    .local v1, "jo":Lorg/json/JSONObject;
    iget-object v3, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_productIdToProduct:Ljava/util/Map;

    invoke-interface {v3, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ProductWithClientTransactionID;

    invoke-virtual {v3}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ProductWithClientTransactionID;->getProduct()Lcom/getjar/sdk/Product;

    move-result-object v2

    .line 516
    .local v2, "offer":Lcom/getjar/sdk/Product;
    if-eqz v2, :cond_1

    .line 518
    :try_start_0
    invoke-virtual {v2}, Lcom/getjar/sdk/Product;->toJSONObject()Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 523
    :cond_1
    :goto_0
    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 519
    :catch_0
    move-exception v0

    .line 520
    .local v0, "je":Lorg/json/JSONException;
    sget-object v3, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Lcom/getjar/sdk/logging/Area;->PURCHASE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    sget-object v5, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "JavaScriptAPI: productId="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public getUnmanagedOffers()Ljava/lang/String;
    .locals 8
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 375
    new-instance v2, Lorg/json/JSONArray;

    invoke-direct {v2}, Lorg/json/JSONArray;-><init>()V

    .line 376
    .local v2, "jsonOffers":Lorg/json/JSONArray;
    iget-object v4, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_productIdToProduct:Ljava/util/Map;

    invoke-interface {v4}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 378
    .local v3, "offerRecord":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ProductWithClientTransactionID;>;"
    :try_start_0
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ProductWithClientTransactionID;

    invoke-virtual {v4}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ProductWithClientTransactionID;->getProduct()Lcom/getjar/sdk/Product;

    move-result-object v4

    invoke-virtual {v4}, Lcom/getjar/sdk/Product;->toJSONObject()Lorg/json/JSONObject;

    move-result-object v4

    invoke-virtual {v2, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 379
    :catch_0
    move-exception v1

    .line 380
    .local v1, "je":Lorg/json/JSONException;
    sget-object v4, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    sget-object v6, Lcom/getjar/sdk/logging/Area;->PURCHASE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    or-long/2addr v4, v6

    sget-object v6, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    or-long v5, v4, v6

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "JavaScriptAPI: productId="

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ProductWithClientTransactionID;

    invoke-virtual {v4}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ProductWithClientTransactionID;->getProduct()Lcom/getjar/sdk/Product;

    move-result-object v4

    invoke-virtual {v4}, Lcom/getjar/sdk/Product;->getProductId()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v5, v6, v4, v1}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 383
    .end local v1    # "je":Lorg/json/JSONException;
    .end local v3    # "offerRecord":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ProductWithClientTransactionID;>;"
    :cond_0
    invoke-virtual {v2}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method

.method public getUsageSessionRecords()Ljava/lang/String;
    .locals 14
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 760
    sget-object v7, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    sget-object v9, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v9}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v9

    or-long/2addr v7, v9

    const-string v9, "JavaScriptAPI: getUsageSessionRecords() START"

    invoke-static {v7, v8, v9}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 761
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    .line 765
    .local v4, "jsonRoot":Lorg/json/JSONObject;
    :try_start_0
    iget-object v7, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v7}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v7

    invoke-static {v7}, Lcom/getjar/sdk/data/usage/UsageManager;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/usage/UsageManager;

    move-result-object v7

    invoke-virtual {v7}, Lcom/getjar/sdk/data/usage/UsageManager;->getAggregateSessionsForReporting()Lcom/getjar/sdk/data/usage/AggregateUsageReport;

    move-result-object v6

    .line 766
    .local v6, "report":Lcom/getjar/sdk/data/usage/AggregateUsageReport;
    if-eqz v6, :cond_1

    .line 768
    const-string v7, "start_timestamp"

    invoke-virtual {v6}, Lcom/getjar/sdk/data/usage/AggregateUsageReport;->getTimestampStart()J

    move-result-wide v8

    invoke-virtual {v4, v7, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 769
    const-string v7, "stop_timestamp"

    invoke-virtual {v6}, Lcom/getjar/sdk/data/usage/AggregateUsageReport;->getTimestampStop()J

    move-result-wide v8

    invoke-virtual {v4, v7, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 770
    const-string v7, "marketplace"

    const-string v8, "marketplace.google_play"

    invoke-virtual {v4, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 771
    new-instance v3, Lorg/json/JSONArray;

    invoke-direct {v3}, Lorg/json/JSONArray;-><init>()V

    .line 773
    .local v3, "jsonRecords":Lorg/json/JSONArray;
    invoke-virtual {v6}, Lcom/getjar/sdk/data/usage/AggregateUsageReport;->getRecords()Ljava/util/List;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v7

    if-lez v7, :cond_0

    .line 775
    sget-object v7, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    sget-object v9, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v9}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v9

    or-long/2addr v7, v9

    sget-object v9, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v10, "JavaScriptAPI: getUsageSessionRecords() reporting on %1$d aggregated usage session records"

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    invoke-virtual {v6}, Lcom/getjar/sdk/data/usage/AggregateUsageReport;->getRecords()Ljava/util/List;

    move-result-object v13

    invoke-interface {v13}, Ljava/util/List;->size()I

    move-result v13

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    aput-object v13, v11, v12

    invoke-static {v9, v10, v11}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v7, v8, v9}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 779
    invoke-virtual {v6}, Lcom/getjar/sdk/data/usage/AggregateUsageReport;->getRecords()Ljava/util/List;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/getjar/sdk/data/usage/AggregateUsageRecord;

    .line 780
    .local v5, "record":Lcom/getjar/sdk/data/usage/AggregateUsageRecord;
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 781
    .local v2, "jsonRecord":Lorg/json/JSONObject;
    const-string v7, "marketplace_item_id"

    invoke-virtual {v5}, Lcom/getjar/sdk/data/usage/AggregateUsageRecord;->getPackageName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v2, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 782
    const-string v7, "start_timestamp"

    invoke-virtual {v5}, Lcom/getjar/sdk/data/usage/AggregateUsageRecord;->getTimestampStart()J

    move-result-wide v8

    invoke-virtual {v2, v7, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 783
    const-string v7, "stop_timestamp"

    invoke-virtual {v5}, Lcom/getjar/sdk/data/usage/AggregateUsageRecord;->getTimestampStop()J

    move-result-wide v8

    invoke-virtual {v2, v7, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 784
    const-string v7, "duration"

    invoke-virtual {v5}, Lcom/getjar/sdk/data/usage/AggregateUsageRecord;->getTotalUseDuration()I

    move-result v8

    invoke-virtual {v2, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 785
    const-string v7, "sessions"

    invoke-virtual {v5}, Lcom/getjar/sdk/data/usage/AggregateUsageRecord;->getTotalSessionsCount()I

    move-result v8

    invoke-virtual {v2, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 786
    invoke-virtual {v3, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 793
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "jsonRecord":Lorg/json/JSONObject;
    .end local v3    # "jsonRecords":Lorg/json/JSONArray;
    .end local v5    # "record":Lcom/getjar/sdk/data/usage/AggregateUsageRecord;
    .end local v6    # "report":Lcom/getjar/sdk/data/usage/AggregateUsageReport;
    :catch_0
    move-exception v0

    .line 794
    .local v0, "e":Ljava/lang/Exception;
    :try_start_1
    sget-object v7, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    sget-object v9, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v9}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v9

    or-long/2addr v7, v9

    const-string v9, "JavaScriptAPI: getUsageSessionRecords() failed"

    invoke-static {v7, v8, v9, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 796
    sget-object v7, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    sget-object v9, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v9}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v9

    or-long/2addr v7, v9

    const-string v9, "JavaScriptAPI: getUsageSessionRecords() FINISH"

    invoke-static {v7, v8, v9}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 798
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_1
    invoke-virtual {v4}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v7

    return-object v7

    .line 790
    .restart local v3    # "jsonRecords":Lorg/json/JSONArray;
    .restart local v6    # "report":Lcom/getjar/sdk/data/usage/AggregateUsageReport;
    :cond_0
    :try_start_2
    const-string v7, "records"

    invoke-virtual {v4, v7, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 796
    .end local v3    # "jsonRecords":Lorg/json/JSONArray;
    :cond_1
    sget-object v7, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    sget-object v9, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v9}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v9

    or-long/2addr v7, v9

    const-string v9, "JavaScriptAPI: getUsageSessionRecords() FINISH"

    invoke-static {v7, v8, v9}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    goto :goto_1

    .end local v6    # "report":Lcom/getjar/sdk/data/usage/AggregateUsageReport;
    :catchall_0
    move-exception v7

    sget-object v8, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v8}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v8

    sget-object v10, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v10}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v10

    or-long/2addr v8, v10

    const-string v10, "JavaScriptAPI: getUsageSessionRecords() FINISH"

    invoke-static {v8, v9, v10}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    throw v7
.end method

.method public getUserAccessId()Ljava/lang/String;
    .locals 1
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 274
    iget-object v0, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v0}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/getjar/sdk/comm/auth/AuthManager;->initialize(Landroid/content/Context;)V

    .line 275
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/getjar/sdk/comm/auth/AuthManager;->waitOnAuth()V

    .line 276
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/getjar/sdk/comm/auth/AuthManager;->getUserAccessId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getUserDeviceId()Ljava/lang/String;
    .locals 1
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 285
    iget-object v0, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v0}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/getjar/sdk/comm/auth/AuthManager;->initialize(Landroid/content/Context;)V

    .line 286
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/getjar/sdk/comm/auth/AuthManager;->waitOnAuth()V

    .line 287
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/getjar/sdk/comm/auth/AuthManager;->getUserDeviceId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public launchGetJarRewardsApp()V
    .locals 2
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 363
    iget-boolean v0, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_isExist:Z

    if-nez v0, :cond_0

    .line 364
    const-string v0, "com.getjar.rewards"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->launch(Ljava/lang/String;Ljava/lang/String;)V

    .line 366
    :cond_0
    return-void
.end method

.method public log(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "level"    # Ljava/lang/String;
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 810
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 811
    sget-object v0, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    const-string v2, "No message provided to log by javascript"

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 834
    :goto_0
    return-void

    .line 815
    :cond_0
    const-string v0, "JavaScript: %s"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 817
    invoke-static {p2}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 818
    const-string p2, "DEBUG"

    .line 821
    :cond_1
    const-string v0, "VERBOSE"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 822
    sget-object v0, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    invoke-static {v0, v1, p1}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    goto :goto_0

    .line 823
    :cond_2
    const-string v0, "DEBUG"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 824
    sget-object v0, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    invoke-static {v0, v1, p1}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    goto :goto_0

    .line 825
    :cond_3
    const-string v0, "INFO"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 826
    sget-object v0, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    invoke-static {v0, v1, p1}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    goto :goto_0

    .line 827
    :cond_4
    const-string v0, "WARN"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 828
    sget-object v0, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    invoke-static {v0, v1, p1}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;)V

    goto :goto_0

    .line 829
    :cond_5
    const-string v0, "ERROR"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 830
    sget-object v0, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    invoke-static {v0, v1, p1}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;)V

    goto/16 :goto_0

    .line 832
    :cond_6
    sget-object v0, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    invoke-static {v0, v1, p1}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    goto/16 :goto_0
.end method

.method public purchaseUnmanagedOffer(Ljava/lang/String;Ljava/lang/String;)V
    .locals 17
    .param p1, "theProductId"    # Ljava/lang/String;
    .param p2, "theTrackingMetadata"    # Ljava/lang/String;
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 117
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_isExist:Z

    if-nez v2, :cond_0

    .line 118
    sget-object v2, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Lcom/getjar/sdk/logging/Area;->PURCHASE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    sget-object v4, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    sget-object v4, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "JavaScriptAPI: purchaseUnmanagedOffer() -- theProductId="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 120
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_productIdToProduct:Ljava/util/Map;

    move-object/from16 v0, p1

    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ProductWithClientTransactionID;

    .line 121
    .local v13, "offer":Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ProductWithClientTransactionID;
    if-eqz v13, :cond_3

    .line 123
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_parentActivity:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-virtual {v2}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->waitDialogShow()V

    .line 128
    :try_start_0
    new-instance v11, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$PurchaseCallback;

    move-object/from16 v0, p0

    invoke-direct {v11, v0, v13}, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$PurchaseCallback;-><init>(Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ProductWithClientTransactionID;)V

    .line 130
    .local v11, "callback":Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$PurchaseCallback;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v2}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/getjar/sdk/comm/auth/AuthManager;->initialize(Landroid/content/Context;)V

    .line 131
    invoke-static/range {p2 .. p2}, Lcom/getjar/sdk/utilities/Utility;->jsonArrayStringToMap(Ljava/lang/String;)Ljava/util/HashMap;

    move-result-object v10

    .line 132
    .local v10, "trackingMetadataMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v2, "client_app.token"

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v3}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/getjar/sdk/comm/auth/ApplicationKeyDatabase;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/comm/auth/ApplicationKeyDatabase;

    move-result-object v3

    invoke-virtual {v3}, Lcom/getjar/sdk/comm/auth/ApplicationKeyDatabase;->getApplicationKey()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v10, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 135
    const-string v2, "user.user_access_id"

    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/getjar/sdk/comm/auth/AuthManager;->getUserAccessId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v10, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 136
    const-string v2, "legacy.device.user_agent"

    invoke-static {}, Lcom/getjar/sdk/comm/UserAgentValuesManager;->getInstance()Lcom/getjar/sdk/comm/UserAgentValuesManager;

    move-result-object v3

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v4}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/getjar/sdk/comm/UserAgentValuesManager;->getWebKitUserAgent(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v10, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 138
    invoke-virtual {v10}, Ljava/util/HashMap;->size()I

    move-result v2

    if-lez v2, :cond_2

    .line 139
    sget-object v2, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Lcom/getjar/sdk/logging/Area;->PURCHASE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    sget-object v4, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    sget-object v4, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "JavaScriptAPI: Making a purchase with client transaction ID: \'%1$s\' [thread:%2$d]"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-virtual {v13}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ProductWithClientTransactionID;->getClientTransactionId()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x1

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Thread;->getId()J

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 143
    new-instance v1, Lcom/getjar/sdk/comm/TransactionManager;

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v2}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/getjar/sdk/comm/TransactionManager;-><init>(Landroid/content/Context;)V

    .line 144
    .local v1, "transactionManager":Lcom/getjar/sdk/comm/TransactionManager;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_parentActivity:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-virtual {v13}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ProductWithClientTransactionID;->getClientTransactionId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->setCurrentPurchaseClientTransactionId(Ljava/lang/String;)V

    .line 146
    invoke-virtual {v13}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ProductWithClientTransactionID;->getProduct()Lcom/getjar/sdk/Product;

    move-result-object v14

    .line 149
    .local v14, "product":Lcom/getjar/sdk/Product;
    invoke-virtual {v13}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ProductWithClientTransactionID;->getClientTransactionId()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v14}, Lcom/getjar/sdk/Product;->getProductId()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v14}, Lcom/getjar/sdk/Product;->getProductName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v14}, Lcom/getjar/sdk/Product;->getProductDescription()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v14}, Lcom/getjar/sdk/Product;->getAmount()J

    move-result-wide v7

    long-to-int v7, v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v14}, Lcom/getjar/sdk/Product;->getDeveloperPayload()Ljava/lang/String;

    move-result-object v8

    const-class v9, Lcom/getjar/sdk/LicensableProduct;

    invoke-virtual {v14}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v9, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v9

    if-eqz v9, :cond_1

    check-cast v14, Lcom/getjar/sdk/LicensableProduct;

    .end local v14    # "product":Lcom/getjar/sdk/Product;
    invoke-virtual {v14}, Lcom/getjar/sdk/LicensableProduct;->getLicenseScope()Lcom/getjar/sdk/License$LicenseScope;

    move-result-object v9

    :goto_0
    invoke-virtual/range {v1 .. v10}, Lcom/getjar/sdk/comm/TransactionManager;->startPurchaseTransaction(Ljava/lang/String;Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;Lcom/getjar/sdk/License$LicenseScope;Ljava/util/HashMap;)Ljava/util/concurrent/Future;

    move-result-object v15

    .line 161
    .local v15, "reserveFuture":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<Lcom/getjar/sdk/comm/Operation;>;"
    new-instance v2, Ljava/lang/Thread;

    new-instance v3, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$1;

    move-object/from16 v0, p0

    invoke-direct {v3, v0, v15, v11}, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$1;-><init>(Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;Ljava/util/concurrent/Future;Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$PurchaseCallback;)V

    const-string v4, "Purchase call-back thread"

    invoke-direct {v2, v3, v4}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    .line 205
    .end local v1    # "transactionManager":Lcom/getjar/sdk/comm/TransactionManager;
    .end local v10    # "trackingMetadataMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v11    # "callback":Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$PurchaseCallback;
    .end local v13    # "offer":Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ProductWithClientTransactionID;
    .end local v15    # "reserveFuture":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<Lcom/getjar/sdk/comm/Operation;>;"
    :cond_0
    :goto_1
    return-void

    .line 149
    .restart local v1    # "transactionManager":Lcom/getjar/sdk/comm/TransactionManager;
    .restart local v10    # "trackingMetadataMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v11    # "callback":Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$PurchaseCallback;
    .restart local v13    # "offer":Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ProductWithClientTransactionID;
    .restart local v14    # "product":Lcom/getjar/sdk/Product;
    :cond_1
    const/4 v9, 0x0

    goto :goto_0

    .line 192
    .end local v1    # "transactionManager":Lcom/getjar/sdk/comm/TransactionManager;
    .end local v14    # "product":Lcom/getjar/sdk/Product;
    :cond_2
    sget-object v2, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Lcom/getjar/sdk/logging/Area;->PURCHASE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    sget-object v4, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    const-string v4, "JavaScriptAPI: ERROR: unable to send purchaseOffer transaction, empty tracking data."

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;)V

    .line 193
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_parentActivity:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-virtual {v2}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->waitDialogHide()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 196
    .end local v10    # "trackingMetadataMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v11    # "callback":Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$PurchaseCallback;
    :catch_0
    move-exception v12

    .line 197
    .local v12, "exc":Ljava/lang/Exception;
    sget-object v2, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Lcom/getjar/sdk/logging/Area;->PURCHASE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    sget-object v4, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    const-string v4, "JavaScriptAPI: purchaseUnmanagedOffer() failed"

    invoke-static {v2, v3, v4, v12}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 198
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_parentActivity:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-virtual {v2}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->waitDialogHide()V

    goto :goto_1

    .line 202
    .end local v12    # "exc":Ljava/lang/Exception;
    :cond_3
    sget-object v2, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Lcom/getjar/sdk/logging/Area;->PURCHASE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    sget-object v4, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "JavaScriptAPI: purchaseUnmanagedOffer() -- offer with theProductId="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " was not found.."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    goto :goto_1
.end method

.method public reloadView(Z)V
    .locals 8
    .param p1, "reauth"    # Z
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    const/4 v7, 0x1

    .line 310
    sget-object v0, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "JavaScriptAPI: reloadView(%1$s)"

    new-array v4, v7, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-static {p1}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 311
    invoke-direct {p0, p1, v7}, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->reloadViewInternal(ZZ)V

    .line 312
    return-void
.end method

.method public reloadViewNoSafety(Z)V
    .locals 7
    .param p1, "reauth"    # Z
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 298
    sget-object v0, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "JavaScriptAPI: reloadViewNoSafety(%1$s)"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 299
    invoke-direct {p0, p1, v6}, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->reloadViewInternal(ZZ)V

    .line 300
    return-void
.end method

.method public requestEarnInstall(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 11
    .param p1, "thePackageName"    # Ljava/lang/String;
    .param p2, "theFriendlyName"    # Ljava/lang/String;
    .param p3, "theDownloadUrl"    # Ljava/lang/String;
    .param p4, "theAppMetadata"    # Ljava/lang/String;
    .param p5, "theTrackingMetadata"    # Ljava/lang/String;
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 217
    iget-boolean v0, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_isExist:Z

    if-nez v0, :cond_0

    .line 219
    :try_start_0
    sget-object v6, Lcom/getjar/sdk/utilities/Constants$RequestInstallType;->EARN:Lcom/getjar/sdk/utilities/Constants$RequestInstallType;

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object/from16 v5, p5

    invoke-direct/range {v0 .. v6}, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_requestInstall(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/getjar/sdk/utilities/Constants$RequestInstallType;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 230
    :cond_0
    :goto_0
    return-void

    .line 220
    :catch_0
    move-exception v7

    .line 223
    .local v7, "e":Ljava/lang/Exception;
    :try_start_1
    sget-object v0, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    sget-object v2, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "JavaScriptAPI: requestEarnInstall() failed [thread:%1$d]"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Thread;->getId()J

    move-result-wide v9

    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2, v7}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 224
    iget-object v0, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_parentActivity:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-virtual {v0}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->unableToDownloadDialogShow()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 225
    :catch_1
    move-exception v8

    .line 226
    .local v8, "exc":Ljava/lang/Exception;
    sget-object v0, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    sget-object v2, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    const-string v2, "JavaScriptAPI: failure"

    invoke-static {v0, v1, v2, v8}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public requestGoldOffers()V
    .locals 2
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 431
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$2;

    invoke-direct {v1, p0}, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$2;-><init>(Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 461
    return-void
.end method

.method public requestPurchaseInstall(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 11
    .param p1, "thePackageName"    # Ljava/lang/String;
    .param p2, "theFriendlyName"    # Ljava/lang/String;
    .param p3, "theDownloadUrl"    # Ljava/lang/String;
    .param p4, "theAppMetadata"    # Ljava/lang/String;
    .param p5, "theTrackingMetadata"    # Ljava/lang/String;
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 241
    iget-boolean v0, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_isExist:Z

    if-nez v0, :cond_0

    .line 243
    :try_start_0
    sget-object v6, Lcom/getjar/sdk/utilities/Constants$RequestInstallType;->PURCHASE:Lcom/getjar/sdk/utilities/Constants$RequestInstallType;

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object/from16 v5, p5

    invoke-direct/range {v0 .. v6}, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_requestInstall(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/getjar/sdk/utilities/Constants$RequestInstallType;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 254
    :cond_0
    :goto_0
    return-void

    .line 244
    :catch_0
    move-exception v7

    .line 247
    .local v7, "e":Ljava/lang/Exception;
    :try_start_1
    sget-object v0, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->PURCHASE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    sget-object v2, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "JavaScriptAPI: requestPurchaseInstall() failed [thread:%1$d]"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Thread;->getId()J

    move-result-wide v9

    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2, v7}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 248
    iget-object v0, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_parentActivity:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-virtual {v0}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->unableToDownloadDialogShow()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 249
    :catch_1
    move-exception v8

    .line 250
    .local v8, "exc":Ljava/lang/Exception;
    sget-object v0, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->PURCHASE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    sget-object v2, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    const-string v2, "JavaScriptAPI: failure"

    invoke-static {v0, v1, v2, v8}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public setLastReloadTime()V
    .locals 4
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 323
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    const-wide/16 v2, 0x3e8

    div-long/2addr v0, v2

    iput-wide v0, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_lastReload:J

    .line 324
    return-void
.end method
