.class Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$waitForAuth;
.super Ljava/lang/Object;
.source "GetJarWebViewSubActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "waitForAuth"
.end annotation


# instance fields
.field mContext:Lcom/getjar/sdk/comm/CommContext;

.field mReceiver:Landroid/os/ResultReceiver;

.field final synthetic this$0:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;


# direct methods
.method public constructor <init>(Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;Lcom/getjar/sdk/comm/CommContext;Landroid/os/ResultReceiver;)V
    .locals 0
    .param p2, "c"    # Lcom/getjar/sdk/comm/CommContext;
    .param p3, "receiver"    # Landroid/os/ResultReceiver;

    .prologue
    .line 333
    iput-object p1, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$waitForAuth;->this$0:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 334
    iput-object p2, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$waitForAuth;->mContext:Lcom/getjar/sdk/comm/CommContext;

    .line 335
    iput-object p3, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$waitForAuth;->mReceiver:Landroid/os/ResultReceiver;

    .line 336
    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .prologue
    .line 341
    :try_start_0
    iget-object v5, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$waitForAuth;->mContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v5}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5}, Lcom/getjar/sdk/comm/auth/AuthManager;->initialize(Landroid/content/Context;)V

    .line 342
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v5

    invoke-virtual {v5}, Lcom/getjar/sdk/comm/auth/AuthManager;->waitOnAuth()V

    .line 343
    iget-object v5, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$waitForAuth;->mReceiver:Landroid/os/ResultReceiver;

    const/4 v6, 0x1

    const/4 v7, 0x0

    invoke-virtual {v5, v6, v7}, Landroid/os/ResultReceiver;->send(ILandroid/os/Bundle;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 353
    iget-object v5, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$waitForAuth;->this$0:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-static {v5}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->access$700(Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 354
    iget-object v5, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$waitForAuth;->this$0:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-virtual {v5}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->waitDialogHide()V

    .line 357
    :cond_0
    :goto_0
    return-void

    .line 344
    :catch_0
    move-exception v0

    .line 346
    .local v0, "e":Ljava/lang/Exception;
    :try_start_1
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 347
    iget-object v5, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$waitForAuth;->mContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v5}, Lcom/getjar/sdk/comm/CommContext;->getExceptions()Ljava/util/Map;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Throwable;

    .local v3, "exc":Ljava/lang/Throwable;
    invoke-virtual {v3}, Ljava/lang/Throwable;->printStackTrace()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 348
    .end local v3    # "exc":Ljava/lang/Throwable;
    .end local v4    # "i$":Ljava/util/Iterator;
    :catch_1
    move-exception v1

    .local v1, "e2":Ljava/lang/Exception;
    :try_start_2
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 350
    .end local v1    # "e2":Ljava/lang/Exception;
    :cond_1
    :try_start_3
    iget-object v5, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$waitForAuth;->mReceiver:Landroid/os/ResultReceiver;

    const/4 v6, 0x2

    const/4 v7, 0x0

    invoke-virtual {v5, v6, v7}, Landroid/os/ResultReceiver;->send(ILandroid/os/Bundle;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 353
    :goto_2
    iget-object v5, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$waitForAuth;->this$0:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-static {v5}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->access$700(Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 354
    iget-object v5, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$waitForAuth;->this$0:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-virtual {v5}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->waitDialogHide()V

    goto :goto_0

    .line 351
    :catch_2
    move-exception v2

    .local v2, "e3":Ljava/lang/Exception;
    :try_start_4
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_2

    .line 353
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v2    # "e3":Ljava/lang/Exception;
    :catchall_0
    move-exception v5

    iget-object v6, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$waitForAuth;->this$0:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-static {v6}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->access$700(Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 354
    iget-object v6, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$waitForAuth;->this$0:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-virtual {v6}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->waitDialogHide()V

    :cond_2
    throw v5
.end method
