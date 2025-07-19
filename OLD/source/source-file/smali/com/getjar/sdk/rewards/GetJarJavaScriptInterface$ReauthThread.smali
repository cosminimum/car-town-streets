.class Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$ReauthThread;
.super Ljava/lang/Object;
.source "GetJarJavaScriptInterface.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ReauthThread"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;


# direct methods
.method private constructor <init>(Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;)V
    .locals 0

    .prologue
    .line 1039
    iput-object p1, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$ReauthThread;->this$0:Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;
    .param p2, "x1"    # Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$1;

    .prologue
    .line 1039
    invoke-direct {p0, p1}, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$ReauthThread;-><init>(Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 1043
    :try_start_0
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$ReauthThread;->this$0:Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;

    iget-object v1, v1, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v1}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/getjar/sdk/comm/auth/AuthManager;->initialize(Landroid/content/Context;)V

    .line 1044
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v1

    iget-object v2, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$ReauthThread;->this$0:Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;

    iget-object v2, v2, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_parentActivity:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-virtual {v1, v2}, Lcom/getjar/sdk/comm/auth/AuthManager;->reAuthWithUI(Lcom/getjar/sdk/comm/auth/AuthUIParentInterface;)V

    .line 1045
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$ReauthThread;->this$0:Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;

    iget-object v1, v1, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_parentActivity:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-virtual {v1}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->waitForAuthorization()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1049
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$ReauthThread;->this$0:Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;

    iget-object v1, v1, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_parentActivity:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-virtual {v1}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->waitDialogHide()V

    .line 1051
    :goto_0
    return-void

    .line 1046
    :catch_0
    move-exception v0

    .line 1047
    .local v0, "e":Ljava/lang/Exception;
    :try_start_1
    sget-object v1, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "JavaScriptAPI: ReauthThread.run() failed"

    invoke-static {v1, v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1049
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$ReauthThread;->this$0:Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;

    iget-object v1, v1, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_parentActivity:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-virtual {v1}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->waitDialogHide()V

    goto :goto_0

    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v1

    iget-object v2, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$ReauthThread;->this$0:Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;

    iget-object v2, v2, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_parentActivity:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-virtual {v2}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->waitDialogHide()V

    throw v1
.end method
