.class public Lcom/getjar/sdk/rewards/GetJarActivity;
.super Landroid/app/Activity;
.source "GetJarActivity.java"


# instance fields
.field private _activityInstanceId:Ljava/lang/String;

.field private _getJarSubActivity:Lcom/getjar/sdk/rewards/GetJarSubActivity;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 22
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 24
    iput-object v0, p0, Lcom/getjar/sdk/rewards/GetJarActivity;->_getJarSubActivity:Lcom/getjar/sdk/rewards/GetJarSubActivity;

    .line 25
    iput-object v0, p0, Lcom/getjar/sdk/rewards/GetJarActivity;->_activityInstanceId:Ljava/lang/String;

    .line 22
    return-void
.end method


# virtual methods
.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 1
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 132
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onActivityResult(IILandroid/content/Intent;)V

    .line 133
    iget-object v0, p0, Lcom/getjar/sdk/rewards/GetJarActivity;->_getJarSubActivity:Lcom/getjar/sdk/rewards/GetJarSubActivity;

    invoke-interface {v0, p1, p2, p3}, Lcom/getjar/sdk/rewards/GetJarSubActivity;->onActivityResult(IILandroid/content/Intent;)V

    .line 134
    return-void
.end method

.method public onBackPressed()V
    .locals 4

    .prologue
    .line 124
    :try_start_0
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarActivity;->_getJarSubActivity:Lcom/getjar/sdk/rewards/GetJarSubActivity;

    invoke-interface {v1}, Lcom/getjar/sdk/rewards/GetJarSubActivity;->onBackPressed()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 128
    :goto_0
    return-void

    .line 125
    :catch_0
    move-exception v0

    .line 126
    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    const-string v3, "GetJarActivity: onBackPressed() failed"

    invoke-static {v1, v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 5
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 148
    invoke-super {p0, p1}, Landroid/app/Activity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 150
    :try_start_0
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarActivity;->_getJarSubActivity:Lcom/getjar/sdk/rewards/GetJarSubActivity;

    invoke-interface {v1, p1}, Lcom/getjar/sdk/rewards/GetJarSubActivity;->onConfigurationChanged(Landroid/content/res/Configuration;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 154
    :goto_0
    return-void

    .line 151
    :catch_0
    move-exception v0

    .line 152
    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "GetJarActivity: onConfigurationChanged() failed"

    invoke-static {v1, v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 8
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 30
    sget-object v3, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    const-string v5, "GetJarActivity: onCreate() START"

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    .line 31
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 32
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "onCreate"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 35
    .local v2, "logMessage":Ljava/lang/StringBuilder;
    :try_start_0
    invoke-static {}, Lcom/getjar/sdk/utilities/GlobalActivityRegistrar;->getInstance()Lcom/getjar/sdk/utilities/GlobalActivityRegistrar;

    move-result-object v3

    invoke-virtual {v3, p0}, Lcom/getjar/sdk/utilities/GlobalActivityRegistrar;->registerActivity(Landroid/app/Activity;)V

    .line 38
    const/4 v0, 0x0

    .line 39
    .local v0, "activityTypeCache":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    iget-object v3, p0, Lcom/getjar/sdk/rewards/GetJarActivity;->_getJarSubActivity:Lcom/getjar/sdk/rewards/GetJarSubActivity;

    if-eqz v3, :cond_0

    .line 40
    iget-object v3, p0, Lcom/getjar/sdk/rewards/GetJarActivity;->_getJarSubActivity:Lcom/getjar/sdk/rewards/GetJarSubActivity;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 44
    :cond_0
    iget-object v3, p0, Lcom/getjar/sdk/rewards/GetJarActivity;->_activityInstanceId:Ljava/lang/String;

    invoke-static {v3}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 45
    const-string v3, ".oldId."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    iget-object v3, p0, Lcom/getjar/sdk/rewards/GetJarActivity;->_activityInstanceId:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    :cond_1
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/getjar/sdk/rewards/GetJarActivity;->_activityInstanceId:Ljava/lang/String;

    .line 51
    invoke-virtual {p0}, Lcom/getjar/sdk/rewards/GetJarActivity;->getIntent()Landroid/content/Intent;

    move-result-object v3

    const-string v4, "com.getjar.sdk.rewards.GetJarWebViewSubActivity"

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 52
    new-instance v3, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-direct {v3, p0}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;-><init>(Lcom/getjar/sdk/rewards/GetJarActivity;)V

    iput-object v3, p0, Lcom/getjar/sdk/rewards/GetJarActivity;->_getJarSubActivity:Lcom/getjar/sdk/rewards/GetJarSubActivity;

    .line 53
    sget-object v3, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    const-string v5, "GetJarActivity: Using GetJarWebViewSubActivity"

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    .line 61
    :goto_0
    iget-object v3, p0, Lcom/getjar/sdk/rewards/GetJarActivity;->_getJarSubActivity:Lcom/getjar/sdk/rewards/GetJarSubActivity;

    invoke-interface {v3, p1}, Lcom/getjar/sdk/rewards/GetJarSubActivity;->onCreate(Landroid/os/Bundle;)V

    .line 64
    if-eqz v0, :cond_2

    .line 65
    const-string v3, ".oldType."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    :cond_2
    const-string v3, ".type."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    iget-object v3, p0, Lcom/getjar/sdk/rewards/GetJarActivity;->_getJarSubActivity:Lcom/getjar/sdk/rewards/GetJarSubActivity;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 75
    sget-object v3, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    const-string v5, "GetJarActivity: onCreate() DONE"

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    .line 77
    .end local v0    # "activityTypeCache":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_1
    return-void

    .line 54
    .restart local v0    # "activityTypeCache":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_3
    :try_start_1
    invoke-virtual {p0}, Lcom/getjar/sdk/rewards/GetJarActivity;->getIntent()Landroid/content/Intent;

    move-result-object v3

    const-string v4, "com.getjar.sdk.rewards.GetJarUserAuthSubActivity"

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 55
    new-instance v3, Lcom/getjar/sdk/rewards/GetJarUserAuthSubActivity;

    invoke-direct {v3, p0}, Lcom/getjar/sdk/rewards/GetJarUserAuthSubActivity;-><init>(Lcom/getjar/sdk/rewards/GetJarActivity;)V

    iput-object v3, p0, Lcom/getjar/sdk/rewards/GetJarActivity;->_getJarSubActivity:Lcom/getjar/sdk/rewards/GetJarSubActivity;

    .line 56
    sget-object v3, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    const-string v5, "GetJarActivity: Using GetJarUserAuthSubActivity"

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 71
    .end local v0    # "activityTypeCache":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :catch_0
    move-exception v1

    .line 72
    .local v1, "e":Ljava/lang/Exception;
    :try_start_2
    sget-object v3, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    const-string v5, "GetJarActivity: onCreate() failed"

    invoke-static {v3, v4, v5, v1}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 73
    invoke-virtual {p0}, Lcom/getjar/sdk/rewards/GetJarActivity;->finish()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 75
    sget-object v3, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    const-string v5, "GetJarActivity: onCreate() DONE"

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    goto :goto_1

    .line 58
    .end local v1    # "e":Ljava/lang/Exception;
    .restart local v0    # "activityTypeCache":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_4
    :try_start_3
    sget-object v3, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    const-string v5, "GetJarActivity: unknown UI requested"

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;)V

    .line 59
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v4, "GetJarActivity: unknown UI requested"

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 75
    .end local v0    # "activityTypeCache":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :catchall_0
    move-exception v3

    sget-object v4, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    sget-object v6, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    or-long/2addr v4, v6

    const-string v6, "GetJarActivity: onCreate() DONE"

    invoke-static {v4, v5, v6}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    throw v3
.end method

.method protected onDestroy()V
    .locals 5

    .prologue
    .line 113
    :try_start_0
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarActivity;->_getJarSubActivity:Lcom/getjar/sdk/rewards/GetJarSubActivity;

    invoke-interface {v1}, Lcom/getjar/sdk/rewards/GetJarSubActivity;->onDestroy()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 117
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 119
    :goto_0
    return-void

    .line 114
    :catch_0
    move-exception v0

    .line 115
    .local v0, "e":Ljava/lang/Exception;
    :try_start_1
    sget-object v1, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "GetJarActivity: onDestroy() failed"

    invoke-static {v1, v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 117
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    goto :goto_0

    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v1

    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    throw v1
.end method

.method protected onNewIntent(Landroid/content/Intent;)V
    .locals 5
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 81
    invoke-super {p0, p1}, Landroid/app/Activity;->onNewIntent(Landroid/content/Intent;)V

    .line 83
    :try_start_0
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarActivity;->_getJarSubActivity:Lcom/getjar/sdk/rewards/GetJarSubActivity;

    invoke-interface {v1, p1}, Lcom/getjar/sdk/rewards/GetJarSubActivity;->onNewIntent(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 87
    :goto_0
    return-void

    .line 84
    :catch_0
    move-exception v0

    .line 85
    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "GetJarActivity: onNewIntent() failed"

    invoke-static {v1, v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method protected onPause()V
    .locals 5

    .prologue
    .line 102
    :try_start_0
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarActivity;->_getJarSubActivity:Lcom/getjar/sdk/rewards/GetJarSubActivity;

    invoke-interface {v1}, Lcom/getjar/sdk/rewards/GetJarSubActivity;->onPause()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 106
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 108
    :goto_0
    return-void

    .line 103
    :catch_0
    move-exception v0

    .line 104
    .local v0, "e":Ljava/lang/Exception;
    :try_start_1
    sget-object v1, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "GetJarActivity: onPause() failed"

    invoke-static {v1, v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 106
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    goto :goto_0

    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v1

    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    throw v1
.end method

.method protected onResume()V
    .locals 5

    .prologue
    .line 91
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 93
    :try_start_0
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarActivity;->_getJarSubActivity:Lcom/getjar/sdk/rewards/GetJarSubActivity;

    invoke-interface {v1}, Lcom/getjar/sdk/rewards/GetJarSubActivity;->onResume()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 97
    :goto_0
    return-void

    .line 94
    :catch_0
    move-exception v0

    .line 95
    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "GetJarActivity: onResume() failed"

    invoke-static {v1, v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 5
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 138
    invoke-super {p0, p1}, Landroid/app/Activity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 140
    :try_start_0
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarActivity;->_getJarSubActivity:Lcom/getjar/sdk/rewards/GetJarSubActivity;

    invoke-interface {v1, p1}, Lcom/getjar/sdk/rewards/GetJarSubActivity;->onSaveInstanceState(Landroid/os/Bundle;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 144
    :goto_0
    return-void

    .line 141
    :catch_0
    move-exception v0

    .line 142
    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "GetJarActivity: onSaveInstanceState() failed"

    invoke-static {v1, v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
