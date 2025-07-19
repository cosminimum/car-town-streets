.class public Lcom/getjar/sdk/rewards/GetJarUserAuthSubActivity;
.super Lcom/getjar/sdk/rewards/GetJarSubActivityBase;
.source "GetJarUserAuthSubActivity.java"


# instance fields
.field private commContext:Lcom/getjar/sdk/comm/CommContext;


# direct methods
.method public constructor <init>(Lcom/getjar/sdk/rewards/GetJarActivity;)V
    .locals 0
    .param p1, "getJarActivity"    # Lcom/getjar/sdk/rewards/GetJarActivity;

    .prologue
    .line 29
    invoke-direct {p0, p1}, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;-><init>(Lcom/getjar/sdk/rewards/GetJarActivity;)V

    .line 30
    return-void
.end method

.method static synthetic access$000(Lcom/getjar/sdk/rewards/GetJarUserAuthSubActivity;)Lcom/getjar/sdk/comm/CommContext;
    .locals 1
    .param p0, "x0"    # Lcom/getjar/sdk/rewards/GetJarUserAuthSubActivity;

    .prologue
    .line 20
    iget-object v0, p0, Lcom/getjar/sdk/rewards/GetJarUserAuthSubActivity;->commContext:Lcom/getjar/sdk/comm/CommContext;

    return-object v0
.end method

.method static synthetic access$100(Lcom/getjar/sdk/rewards/GetJarUserAuthSubActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/getjar/sdk/rewards/GetJarUserAuthSubActivity;

    .prologue
    .line 20
    invoke-direct {p0}, Lcom/getjar/sdk/rewards/GetJarUserAuthSubActivity;->exitActivity()V

    return-void
.end method

.method private exitActivity()V
    .locals 5

    .prologue
    .line 135
    :try_start_0
    invoke-virtual {p0}, Lcom/getjar/sdk/rewards/GetJarUserAuthSubActivity;->waitDialogHide()V

    .line 136
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarUserAuthSubActivity;->commContext:Lcom/getjar/sdk/comm/CommContext;

    new-instance v2, Lcom/getjar/sdk/response/CloseResponse;

    invoke-direct {v2}, Lcom/getjar/sdk/response/CloseResponse;-><init>()V

    invoke-virtual {v1, v2}, Lcom/getjar/sdk/comm/CommContext;->postResponse(Lcom/getjar/sdk/response/Response;)V

    .line 137
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarUserAuthSubActivity;->getJarActivity:Lcom/getjar/sdk/rewards/GetJarActivity;

    invoke-virtual {v1}, Lcom/getjar/sdk/rewards/GetJarActivity;->finish()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 141
    :goto_0
    return-void

    .line 138
    :catch_0
    move-exception v0

    .line 139
    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    sget-object v3, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "GetJarUserAuthSubActivity: exitActivity() failed"

    invoke-static {v1, v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 34
    invoke-super {p0, p1}, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->onCreate(Landroid/os/Bundle;)V

    .line 35
    invoke-static {}, Lcom/getjar/sdk/utilities/GlobalActivityRegistrar;->getInstance()Lcom/getjar/sdk/utilities/GlobalActivityRegistrar;

    move-result-object v0

    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarUserAuthSubActivity;->getJarActivity:Lcom/getjar/sdk/rewards/GetJarActivity;

    invoke-virtual {v0, v1}, Lcom/getjar/sdk/utilities/GlobalActivityRegistrar;->registerActivity(Landroid/app/Activity;)V

    .line 36
    return-void
.end method

.method public onDestroy()V
    .locals 0

    .prologue
    .line 129
    invoke-virtual {p0}, Lcom/getjar/sdk/rewards/GetJarUserAuthSubActivity;->waitDialogHide()V

    .line 130
    invoke-super {p0}, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->onDestroy()V

    .line 131
    return-void
.end method

.method public onResume()V
    .locals 10

    .prologue
    .line 40
    const/4 v0, 0x0

    .line 43
    .local v0, "authWithUiId":Ljava/lang/String;
    :try_start_0
    sget-object v3, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    sget-object v5, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    const-string v5, "GetJarUserAuthSubActivity: onResume() START"

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 45
    iget-object v3, p0, Lcom/getjar/sdk/rewards/GetJarUserAuthSubActivity;->getJarActivity:Lcom/getjar/sdk/rewards/GetJarActivity;

    invoke-virtual {v3}, Lcom/getjar/sdk/rewards/GetJarActivity;->getIntent()Landroid/content/Intent;

    move-result-object v3

    const-string v4, "auth.with.ui.id"

    invoke-virtual {v3, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 46
    invoke-static {v0}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 47
    sget-object v3, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    sget-object v5, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "GetJarUserAuthSubActivity: onResume() authWithUiId: \'%1$s\'"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object v0, v7, v8

    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    .line 50
    :cond_0
    iget-object v3, p0, Lcom/getjar/sdk/rewards/GetJarUserAuthSubActivity;->getJarActivity:Lcom/getjar/sdk/rewards/GetJarActivity;

    invoke-static {v3}, Lcom/getjar/sdk/comm/CommManager;->initialize(Landroid/content/Context;)V

    .line 53
    iget-object v3, p0, Lcom/getjar/sdk/rewards/GetJarUserAuthSubActivity;->getJarActivity:Lcom/getjar/sdk/rewards/GetJarActivity;

    invoke-virtual {v3}, Lcom/getjar/sdk/rewards/GetJarActivity;->getIntent()Landroid/content/Intent;

    move-result-object v3

    const-string v4, "getjarContextId"

    invoke-virtual {v3, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 54
    .local v1, "commContextId":Ljava/lang/String;
    invoke-static {v1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 55
    sget-object v3, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    sget-object v5, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "The Intent used to start the GetJarActivity must contain a value for \'%1$s\' in its Extras"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    const-string v9, "getjarContextId"

    aput-object v9, v7, v8

    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;)V

    .line 60
    iget-object v3, p0, Lcom/getjar/sdk/rewards/GetJarUserAuthSubActivity;->getJarActivity:Lcom/getjar/sdk/rewards/GetJarActivity;

    invoke-virtual {v3}, Lcom/getjar/sdk/rewards/GetJarActivity;->finish()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 92
    :try_start_1
    invoke-static {v0}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 93
    iget-object v3, p0, Lcom/getjar/sdk/rewards/GetJarUserAuthSubActivity;->commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v3}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/getjar/sdk/comm/auth/AuthManager;->initialize(Landroid/content/Context;)V

    .line 94
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v3

    invoke-virtual {v3, v0}, Lcom/getjar/sdk/comm/auth/AuthManager;->observeAuthWithUiId(Ljava/lang/String;)V

    .line 97
    :cond_1
    new-instance v3, Ljava/lang/Thread;

    new-instance v4, Lcom/getjar/sdk/rewards/GetJarUserAuthSubActivity$1;

    invoke-direct {v4, p0}, Lcom/getjar/sdk/rewards/GetJarUserAuthSubActivity$1;-><init>(Lcom/getjar/sdk/rewards/GetJarUserAuthSubActivity;)V

    const-string v5, "GetJarUserAuthSubActivity Auth Wait Thread"

    invoke-direct {v3, v4, v5}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/lang/Thread;->start()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 122
    :goto_0
    sget-object v3, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    sget-object v5, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    const-string v5, "GetJarUserAuthSubActivity: onResume() DONE"

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 124
    .end local v1    # "commContextId":Ljava/lang/String;
    :goto_1
    return-void

    .line 117
    .restart local v1    # "commContextId":Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 118
    .local v2, "e":Ljava/lang/Exception;
    sget-object v3, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    sget-object v5, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    const-string v5, "GetJarUserAuthSubActivity: onResume() failed to start user auth wait thread"

    invoke-static {v3, v4, v5, v2}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 119
    invoke-direct {p0}, Lcom/getjar/sdk/rewards/GetJarUserAuthSubActivity;->exitActivity()V

    goto :goto_0

    .line 67
    .end local v2    # "e":Ljava/lang/Exception;
    :cond_2
    :try_start_2
    invoke-static {v1}, Lcom/getjar/sdk/comm/CommManager;->retrieveContext(Ljava/lang/String;)Lcom/getjar/sdk/comm/CommContext;

    move-result-object v3

    iput-object v3, p0, Lcom/getjar/sdk/rewards/GetJarUserAuthSubActivity;->commContext:Lcom/getjar/sdk/comm/CommContext;

    .line 68
    iget-object v3, p0, Lcom/getjar/sdk/rewards/GetJarUserAuthSubActivity;->commContext:Lcom/getjar/sdk/comm/CommContext;

    if-nez v3, :cond_4

    .line 69
    sget-object v3, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    sget-object v5, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "No CommContext instance found for the ID \'%1$s\'"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object v1, v7, v8

    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;)V

    .line 74
    iget-object v3, p0, Lcom/getjar/sdk/rewards/GetJarUserAuthSubActivity;->getJarActivity:Lcom/getjar/sdk/rewards/GetJarActivity;

    invoke-virtual {v3}, Lcom/getjar/sdk/rewards/GetJarActivity;->finish()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_3
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 92
    :try_start_3
    invoke-static {v0}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_3

    .line 93
    iget-object v3, p0, Lcom/getjar/sdk/rewards/GetJarUserAuthSubActivity;->commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v3}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/getjar/sdk/comm/auth/AuthManager;->initialize(Landroid/content/Context;)V

    .line 94
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v3

    invoke-virtual {v3, v0}, Lcom/getjar/sdk/comm/auth/AuthManager;->observeAuthWithUiId(Ljava/lang/String;)V

    .line 97
    :cond_3
    new-instance v3, Ljava/lang/Thread;

    new-instance v4, Lcom/getjar/sdk/rewards/GetJarUserAuthSubActivity$1;

    invoke-direct {v4, p0}, Lcom/getjar/sdk/rewards/GetJarUserAuthSubActivity$1;-><init>(Lcom/getjar/sdk/rewards/GetJarUserAuthSubActivity;)V

    const-string v5, "GetJarUserAuthSubActivity Auth Wait Thread"

    invoke-direct {v3, v4, v5}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/lang/Thread;->start()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    .line 122
    :goto_2
    sget-object v3, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    sget-object v5, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    const-string v5, "GetJarUserAuthSubActivity: onResume() DONE"

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    goto/16 :goto_1

    .line 117
    :catch_1
    move-exception v2

    .line 118
    .restart local v2    # "e":Ljava/lang/Exception;
    sget-object v3, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    sget-object v5, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    const-string v5, "GetJarUserAuthSubActivity: onResume() failed to start user auth wait thread"

    invoke-static {v3, v4, v5, v2}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 119
    invoke-direct {p0}, Lcom/getjar/sdk/rewards/GetJarUserAuthSubActivity;->exitActivity()V

    goto :goto_2

    .line 80
    .end local v2    # "e":Ljava/lang/Exception;
    :cond_4
    :try_start_4
    sget-object v3, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    sget-object v5, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "GetJarUserAuthSubActivity: onResume() Using CommContext.ID: %1$s"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    iget-object v9, p0, Lcom/getjar/sdk/rewards/GetJarUserAuthSubActivity;->commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v9}, Lcom/getjar/sdk/comm/CommContext;->getCommContextId()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 83
    invoke-virtual {p0}, Lcom/getjar/sdk/rewards/GetJarUserAuthSubActivity;->waitDialogShow()V

    .line 84
    const/4 v3, 0x1

    iput-boolean v3, p0, Lcom/getjar/sdk/rewards/GetJarUserAuthSubActivity;->_waitDialogWasShowing:Z

    .line 85
    iget-object v3, p0, Lcom/getjar/sdk/rewards/GetJarUserAuthSubActivity;->commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v3}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/getjar/sdk/comm/auth/AuthManager;->initialize(Landroid/content/Context;)V

    .line 86
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v3

    invoke-virtual {v3, p0}, Lcom/getjar/sdk/comm/auth/AuthManager;->ensureAuthWithUI(Lcom/getjar/sdk/comm/auth/AuthUIParentInterface;)Z
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 92
    :try_start_5
    invoke-static {v0}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_5

    .line 93
    iget-object v3, p0, Lcom/getjar/sdk/rewards/GetJarUserAuthSubActivity;->commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v3}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/getjar/sdk/comm/auth/AuthManager;->initialize(Landroid/content/Context;)V

    .line 94
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v3

    invoke-virtual {v3, v0}, Lcom/getjar/sdk/comm/auth/AuthManager;->observeAuthWithUiId(Ljava/lang/String;)V

    .line 97
    :cond_5
    new-instance v3, Ljava/lang/Thread;

    new-instance v4, Lcom/getjar/sdk/rewards/GetJarUserAuthSubActivity$1;

    invoke-direct {v4, p0}, Lcom/getjar/sdk/rewards/GetJarUserAuthSubActivity$1;-><init>(Lcom/getjar/sdk/rewards/GetJarUserAuthSubActivity;)V

    const-string v5, "GetJarUserAuthSubActivity Auth Wait Thread"

    invoke-direct {v3, v4, v5}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/lang/Thread;->start()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2

    .line 122
    :goto_3
    sget-object v3, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    sget-object v5, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    const-string v5, "GetJarUserAuthSubActivity: onResume() DONE"

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    goto/16 :goto_1

    .line 117
    :catch_2
    move-exception v2

    .line 118
    .restart local v2    # "e":Ljava/lang/Exception;
    sget-object v3, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    sget-object v5, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    const-string v5, "GetJarUserAuthSubActivity: onResume() failed to start user auth wait thread"

    invoke-static {v3, v4, v5, v2}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 119
    invoke-direct {p0}, Lcom/getjar/sdk/rewards/GetJarUserAuthSubActivity;->exitActivity()V

    goto :goto_3

    .line 88
    .end local v1    # "commContextId":Ljava/lang/String;
    .end local v2    # "e":Ljava/lang/Exception;
    :catch_3
    move-exception v2

    .line 89
    .restart local v2    # "e":Ljava/lang/Exception;
    :try_start_6
    sget-object v3, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    sget-object v5, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    const-string v5, "GetJarUserAuthSubActivity: onResume() failed"

    invoke-static {v3, v4, v5, v2}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 92
    :try_start_7
    invoke-static {v0}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_6

    .line 93
    iget-object v3, p0, Lcom/getjar/sdk/rewards/GetJarUserAuthSubActivity;->commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v3}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/getjar/sdk/comm/auth/AuthManager;->initialize(Landroid/content/Context;)V

    .line 94
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v3

    invoke-virtual {v3, v0}, Lcom/getjar/sdk/comm/auth/AuthManager;->observeAuthWithUiId(Ljava/lang/String;)V

    .line 97
    :cond_6
    new-instance v3, Ljava/lang/Thread;

    new-instance v4, Lcom/getjar/sdk/rewards/GetJarUserAuthSubActivity$1;

    invoke-direct {v4, p0}, Lcom/getjar/sdk/rewards/GetJarUserAuthSubActivity$1;-><init>(Lcom/getjar/sdk/rewards/GetJarUserAuthSubActivity;)V

    const-string v5, "GetJarUserAuthSubActivity Auth Wait Thread"

    invoke-direct {v3, v4, v5}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/lang/Thread;->start()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_4

    .line 122
    :goto_4
    sget-object v3, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    sget-object v5, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    const-string v5, "GetJarUserAuthSubActivity: onResume() DONE"

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    goto/16 :goto_1

    .line 117
    :catch_4
    move-exception v2

    .line 118
    sget-object v3, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    sget-object v5, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    const-string v5, "GetJarUserAuthSubActivity: onResume() failed to start user auth wait thread"

    invoke-static {v3, v4, v5, v2}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 119
    invoke-direct {p0}, Lcom/getjar/sdk/rewards/GetJarUserAuthSubActivity;->exitActivity()V

    goto :goto_4

    .line 91
    .end local v2    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v3

    .line 92
    :try_start_8
    invoke-static {v0}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_7

    .line 93
    iget-object v4, p0, Lcom/getjar/sdk/rewards/GetJarUserAuthSubActivity;->commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v4}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Lcom/getjar/sdk/comm/auth/AuthManager;->initialize(Landroid/content/Context;)V

    .line 94
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v4

    invoke-virtual {v4, v0}, Lcom/getjar/sdk/comm/auth/AuthManager;->observeAuthWithUiId(Ljava/lang/String;)V

    .line 97
    :cond_7
    new-instance v4, Ljava/lang/Thread;

    new-instance v5, Lcom/getjar/sdk/rewards/GetJarUserAuthSubActivity$1;

    invoke-direct {v5, p0}, Lcom/getjar/sdk/rewards/GetJarUserAuthSubActivity$1;-><init>(Lcom/getjar/sdk/rewards/GetJarUserAuthSubActivity;)V

    const-string v6, "GetJarUserAuthSubActivity Auth Wait Thread"

    invoke-direct {v4, v5, v6}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/lang/Thread;->start()V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_5

    .line 122
    :goto_5
    sget-object v4, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    sget-object v6, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    or-long/2addr v4, v6

    sget-object v6, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    or-long/2addr v4, v6

    const-string v6, "GetJarUserAuthSubActivity: onResume() DONE"

    invoke-static {v4, v5, v6}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    throw v3

    .line 117
    :catch_5
    move-exception v2

    .line 118
    .restart local v2    # "e":Ljava/lang/Exception;
    sget-object v4, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    sget-object v6, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    or-long/2addr v4, v6

    sget-object v6, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    or-long/2addr v4, v6

    const-string v6, "GetJarUserAuthSubActivity: onResume() failed to start user auth wait thread"

    invoke-static {v4, v5, v6, v2}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 119
    invoke-direct {p0}, Lcom/getjar/sdk/rewards/GetJarUserAuthSubActivity;->exitActivity()V

    goto :goto_5
.end method
