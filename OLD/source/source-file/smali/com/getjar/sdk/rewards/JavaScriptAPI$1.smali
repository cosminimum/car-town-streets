.class Lcom/getjar/sdk/rewards/JavaScriptAPI$1;
.super Ljava/lang/Object;
.source "JavaScriptAPI.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/getjar/sdk/rewards/JavaScriptAPI;->setAccount(Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/getjar/sdk/rewards/JavaScriptAPI;

.field final synthetic val$accountName:Ljava/lang/String;

.field final synthetic val$providerFilter:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/getjar/sdk/rewards/JavaScriptAPI;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 229
    iput-object p1, p0, Lcom/getjar/sdk/rewards/JavaScriptAPI$1;->this$0:Lcom/getjar/sdk/rewards/JavaScriptAPI;

    iput-object p2, p0, Lcom/getjar/sdk/rewards/JavaScriptAPI$1;->val$accountName:Ljava/lang/String;

    iput-object p3, p0, Lcom/getjar/sdk/rewards/JavaScriptAPI$1;->val$providerFilter:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .prologue
    .line 235
    :try_start_0
    new-instance v1, Ljava/util/HashMap;

    const/4 v4, 0x1

    invoke-direct {v1, v4}, Ljava/util/HashMap;-><init>(I)V

    .line 236
    .local v1, "providerData":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v4, "provider.skip_cache"

    const-string v5, "true"

    invoke-virtual {v1, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 237
    const-string v4, "android_account.username_data_hash"

    iget-object v5, p0, Lcom/getjar/sdk/rewards/JavaScriptAPI$1;->val$accountName:Ljava/lang/String;

    invoke-static {v5}, Lcom/getjar/sdk/utilities/CryptoUtility;->getSHA256(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 238
    new-instance v2, Lcom/getjar/sdk/comm/auth/ProviderHint;

    iget-object v4, p0, Lcom/getjar/sdk/rewards/JavaScriptAPI$1;->val$providerFilter:Ljava/lang/String;

    invoke-direct {v2, v4, v1}, Lcom/getjar/sdk/comm/auth/ProviderHint;-><init>(Ljava/lang/String;Ljava/util/HashMap;)V

    .line 241
    .local v2, "providerHint":Lcom/getjar/sdk/comm/auth/ProviderHint;
    iget-object v4, p0, Lcom/getjar/sdk/rewards/JavaScriptAPI$1;->this$0:Lcom/getjar/sdk/rewards/JavaScriptAPI;

    iget-object v4, v4, Lcom/getjar/sdk/rewards/JavaScriptAPI;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v4}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Lcom/getjar/sdk/comm/auth/AuthManager;->initialize(Landroid/content/Context;)V

    .line 242
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v4

    const/4 v5, 0x1

    invoke-virtual {v4, v2, v5}, Lcom/getjar/sdk/comm/auth/AuthManager;->ensureAuthResetCurrent(Lcom/getjar/sdk/comm/auth/ProviderHint;Z)Z

    .line 243
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v4

    invoke-virtual {v4}, Lcom/getjar/sdk/comm/auth/AuthManager;->waitOnAuth()V

    .line 246
    iget-object v4, p0, Lcom/getjar/sdk/rewards/JavaScriptAPI$1;->this$0:Lcom/getjar/sdk/rewards/JavaScriptAPI;

    iget-object v4, v4, Lcom/getjar/sdk/rewards/JavaScriptAPI;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    const/4 v5, 0x1

    invoke-static {v4, v5}, Lcom/getjar/sdk/comm/GetJarConfig;->getInstance(Lcom/getjar/sdk/comm/CommContext;Z)Lcom/getjar/sdk/comm/GetJarConfig;

    move-result-object v4

    const-string v5, "webview.default_url"

    invoke-virtual {v4, v5}, Lcom/getjar/sdk/comm/GetJarConfig;->getDirectiveValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 247
    .local v3, "url":Ljava/lang/String;
    invoke-static {v3}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->loadUrl(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 254
    sget-object v4, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    const-string v6, "JavaScriptAPI: setAccount() FINISH"

    invoke-static {v4, v5, v6}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 255
    iget-object v4, p0, Lcom/getjar/sdk/rewards/JavaScriptAPI$1;->this$0:Lcom/getjar/sdk/rewards/JavaScriptAPI;

    iget-object v4, v4, Lcom/getjar/sdk/rewards/JavaScriptAPI;->_parentActivity:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-virtual {v4}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->waitDialogHide()V

    .line 257
    .end local v1    # "providerData":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v2    # "providerHint":Lcom/getjar/sdk/comm/auth/ProviderHint;
    .end local v3    # "url":Ljava/lang/String;
    :goto_0
    return-void

    .line 249
    :catch_0
    move-exception v0

    .line 252
    .local v0, "e":Ljava/lang/Exception;
    :try_start_1
    sget-object v4, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    const-string v6, "JavaScriptAPI: setAccount() failed"

    invoke-static {v4, v5, v6, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 254
    sget-object v4, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    const-string v6, "JavaScriptAPI: setAccount() FINISH"

    invoke-static {v4, v5, v6}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 255
    iget-object v4, p0, Lcom/getjar/sdk/rewards/JavaScriptAPI$1;->this$0:Lcom/getjar/sdk/rewards/JavaScriptAPI;

    iget-object v4, v4, Lcom/getjar/sdk/rewards/JavaScriptAPI;->_parentActivity:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-virtual {v4}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->waitDialogHide()V

    goto :goto_0

    .line 254
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v4

    sget-object v5, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    const-string v7, "JavaScriptAPI: setAccount() FINISH"

    invoke-static {v5, v6, v7}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 255
    iget-object v5, p0, Lcom/getjar/sdk/rewards/JavaScriptAPI$1;->this$0:Lcom/getjar/sdk/rewards/JavaScriptAPI;

    iget-object v5, v5, Lcom/getjar/sdk/rewards/JavaScriptAPI;->_parentActivity:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-virtual {v5}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->waitDialogHide()V

    throw v4
.end method
