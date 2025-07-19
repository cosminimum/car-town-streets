.class Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$1;
.super Ljava/lang/Object;
.source "GetJarJavaScriptInterface.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->purchaseUnmanagedOffer(Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;

.field final synthetic val$callback:Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$PurchaseCallback;

.field final synthetic val$reserveFuture:Ljava/util/concurrent/Future;


# direct methods
.method constructor <init>(Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;Ljava/util/concurrent/Future;Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$PurchaseCallback;)V
    .locals 0

    .prologue
    .line 162
    iput-object p1, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$1;->this$0:Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;

    iput-object p2, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$1;->val$reserveFuture:Ljava/util/concurrent/Future;

    iput-object p3, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$1;->val$callback:Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$PurchaseCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .prologue
    const/4 v7, 0x0

    .line 165
    const/4 v0, 0x0

    .line 169
    .local v0, "callbackMade":Z
    :try_start_0
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

    const-string v4, "JavaScriptAPI: Waiting on purchase reserve future"

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 170
    iget-object v2, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$1;->val$reserveFuture:Ljava/util/concurrent/Future;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$1;->val$reserveFuture:Ljava/util/concurrent/Future;

    invoke-interface {v2}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 171
    iget-object v2, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$1;->val$reserveFuture:Ljava/util/concurrent/Future;

    invoke-interface {v2}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/getjar/sdk/comm/Operation;

    iget-object v3, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$1;->val$callback:Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$PurchaseCallback;

    invoke-virtual {v2, v3}, Lcom/getjar/sdk/comm/Operation;->mapResultToCallbacks(Lcom/getjar/sdk/comm/CallbackInterface;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 172
    const/4 v0, 0x1

    .line 180
    :cond_0
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

    const-string v4, "JavaScriptAPI: Done waiting on purchase reserve future"

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 181
    iget-object v2, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$1;->this$0:Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;

    iget-object v2, v2, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_parentActivity:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-virtual {v2}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->waitDialogHide()V

    .line 182
    if-nez v0, :cond_1

    .line 183
    iget-object v2, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$1;->val$callback:Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$PurchaseCallback;

    const-string v3, "unknown"

    iget-object v4, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$1;->this$0:Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;

    iget-object v4, v4, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v2, v7, v7, v3, v4}, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$PurchaseCallback;->serviceRequestFailed(Lcom/getjar/sdk/comm/Result;Ljava/lang/Exception;Ljava/lang/String;Lcom/getjar/sdk/comm/CommContext;)V

    .line 186
    :cond_1
    :goto_0
    return-void

    .line 175
    :catch_0
    move-exception v1

    .line 176
    .local v1, "e":Ljava/lang/Exception;
    :try_start_1
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

    const-string v4, "JavaScriptAPI: Purchase call-back thread failed"

    invoke-static {v2, v3, v4, v1}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 180
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

    const-string v4, "JavaScriptAPI: Done waiting on purchase reserve future"

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 181
    iget-object v2, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$1;->this$0:Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;

    iget-object v2, v2, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_parentActivity:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-virtual {v2}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->waitDialogHide()V

    .line 182
    if-nez v0, :cond_1

    .line 183
    iget-object v2, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$1;->val$callback:Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$PurchaseCallback;

    const-string v3, "unknown"

    iget-object v4, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$1;->this$0:Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;

    iget-object v4, v4, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v2, v7, v7, v3, v4}, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$PurchaseCallback;->serviceRequestFailed(Lcom/getjar/sdk/comm/Result;Ljava/lang/Exception;Ljava/lang/String;Lcom/getjar/sdk/comm/CommContext;)V

    goto :goto_0

    .line 180
    .end local v1    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v2

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

    const-string v5, "JavaScriptAPI: Done waiting on purchase reserve future"

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 181
    iget-object v3, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$1;->this$0:Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;

    iget-object v3, v3, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_parentActivity:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-virtual {v3}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->waitDialogHide()V

    .line 182
    if-nez v0, :cond_2

    .line 183
    iget-object v3, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$1;->val$callback:Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$PurchaseCallback;

    const-string v4, "unknown"

    iget-object v5, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$1;->this$0:Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;

    iget-object v5, v5, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v3, v7, v7, v4, v5}, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$PurchaseCallback;->serviceRequestFailed(Lcom/getjar/sdk/comm/Result;Ljava/lang/Exception;Ljava/lang/String;Lcom/getjar/sdk/comm/CommContext;)V

    :cond_2
    throw v2
.end method
