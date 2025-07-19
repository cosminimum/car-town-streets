.class public Lcom/AdX/tag/AdXAppTracker;
.super Landroid/content/BroadcastReceiver;
.source "AdXAppTracker.java"


# instance fields
.field final AdX_PREFERENCE:Ljava/lang/String;

.field final REFERRAL_URL:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 14
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 16
    const-string v0, "AdXPrefrences"

    iput-object v0, p0, Lcom/AdX/tag/AdXAppTracker;->AdX_PREFERENCE:Ljava/lang/String;

    .line 17
    const-string v0, "InstallReferral"

    iput-object v0, p0, Lcom/AdX/tag/AdXAppTracker;->REFERRAL_URL:Ljava/lang/String;

    .line 14
    return-void
.end method

.method private pass_on_broadcast(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 11
    .param p1, "paramContext"    # Landroid/content/Context;
    .param p2, "paramIntent"    # Landroid/content/Intent;

    .prologue
    .line 50
    const-string v6, ""

    .line 54
    .local v6, "str1":Ljava/lang/String;
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v5

    .line 55
    .local v5, "localObject":Landroid/content/pm/PackageManager;
    if-eqz v5, :cond_0

    .line 57
    new-instance v1, Landroid/content/ComponentName;

    const-class v9, Lcom/AdX/tag/AdXAppTracker;

    invoke-direct {v1, p1, v9}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 58
    .local v1, "localComponentName":Landroid/content/ComponentName;
    check-cast v5, Landroid/content/pm/PackageManager;

    .end local v5    # "localObject":Landroid/content/pm/PackageManager;
    const/16 v9, 0x80

    invoke-virtual {v5, v1, v9}, Landroid/content/pm/PackageManager;->getReceiverInfo(Landroid/content/ComponentName;I)Landroid/content/pm/ActivityInfo;

    move-result-object v0

    .line 59
    .local v0, "localActivityInfo":Landroid/content/pm/ActivityInfo;
    if-eqz v0, :cond_0

    iget-object v9, v0, Landroid/content/pm/ActivityInfo;->metaData:Landroid/os/Bundle;

    if-eqz v9, :cond_0

    .line 61
    iget-object v9, v0, Landroid/content/pm/ActivityInfo;->metaData:Landroid/os/Bundle;

    invoke-virtual {v9}, Landroid/os/Bundle;->keySet()Ljava/util/Set;

    move-result-object v5

    .line 62
    .local v5, "localObject":Ljava/util/Set;
    if-eqz v5, :cond_0

    .line 64
    check-cast v5, Ljava/util/Set;

    .end local v5    # "localObject":Ljava/util/Set;
    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .line 65
    .local v4, "localIterator":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-nez v9, :cond_1

    .line 95
    .end local v0    # "localActivityInfo":Landroid/content/pm/ActivityInfo;
    .end local v1    # "localComponentName":Landroid/content/ComponentName;
    .end local v4    # "localIterator":Ljava/util/Iterator;
    :cond_0
    :goto_1
    return-void

    .line 67
    .restart local v0    # "localActivityInfo":Landroid/content/pm/ActivityInfo;
    .restart local v1    # "localComponentName":Landroid/content/ComponentName;
    .restart local v4    # "localIterator":Ljava/util/Iterator;
    :cond_1
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 70
    .local v5, "localObject":Ljava/lang/String;
    :try_start_1
    iget-object v9, v0, Landroid/content/pm/ActivityInfo;->metaData:Landroid/os/Bundle;

    check-cast v5, Ljava/lang/String;

    .end local v5    # "localObject":Ljava/lang/String;
    invoke-virtual {v9, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 72
    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/content/BroadcastReceiver;

    invoke-virtual {v9, p1, p2}, Landroid/content/BroadcastReceiver;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V

    .line 74
    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "Successfully forwarded install notification to "

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 75
    .local v7, "str2":Ljava/lang/String;
    const-string v9, "AdXAppTracker"

    invoke-static {v9, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 77
    .end local v7    # "str2":Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 80
    .local v2, "localException1":Ljava/lang/Exception;
    :try_start_2
    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "Could not forward Market\'s INSTALL_REFERRER intent to "

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 81
    .local v8, "str3":Ljava/lang/String;
    const-string v9, "AdXAppTracker"

    invoke-static {v9, v8, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    .line 88
    .end local v0    # "localActivityInfo":Landroid/content/pm/ActivityInfo;
    .end local v1    # "localComponentName":Landroid/content/ComponentName;
    .end local v2    # "localException1":Ljava/lang/Exception;
    .end local v4    # "localIterator":Ljava/util/Iterator;
    .end local v8    # "str3":Ljava/lang/String;
    :catch_1
    move-exception v3

    .line 91
    .local v3, "localException2":Ljava/lang/Exception;
    const-string v9, "AdXAppTracker"

    const-string v10, "Unhandled exception while forwarding install intents.  Possibly lost some install information."

    invoke-static {v9, v10, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 22
    const-string v4, "AdXAppTracker"

    const-string v5, "Received Referrral Intent"

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 24
    invoke-virtual {p2}, Landroid/content/Intent;->toURI()Ljava/lang/String;

    move-result-object v3

    .line 25
    .local v3, "uri":Ljava/lang/String;
    if-eqz v3, :cond_0

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_0

    .line 27
    const-string v4, "referrer="

    invoke-virtual {v3, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    .line 28
    .local v1, "index":I
    const/4 v4, -0x1

    if-le v1, v4, :cond_1

    .line 30
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, -0x4

    invoke-virtual {v3, v1, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 31
    const-string v4, "AdXAppTracker"

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "Referral URI: "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 33
    const-string v4, "AdXPrefrences"

    const/4 v5, 0x0

    invoke-virtual {p1, v4, v5}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 34
    .local v2, "settings":Landroid/content/SharedPreferences;
    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 35
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    const-string v4, "InstallReferral"

    invoke-interface {v0, v4, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 36
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 37
    const-string v4, "AdXAppTracker"

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "Cached Referral URI: "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 42
    .end local v0    # "editor":Landroid/content/SharedPreferences$Editor;
    .end local v1    # "index":I
    .end local v2    # "settings":Landroid/content/SharedPreferences;
    :cond_0
    :goto_0
    invoke-static {p1}, Lcom/AdX/tag/AdXConnect;->doBroadcastConnectInstance(Landroid/content/Context;)V

    .line 43
    invoke-direct {p0, p1, p2}, Lcom/AdX/tag/AdXAppTracker;->pass_on_broadcast(Landroid/content/Context;Landroid/content/Intent;)V

    .line 44
    const-string v4, "AdXAppTracker"

    const-string v5, "End"

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 45
    return-void

    .line 40
    .restart local v1    # "index":I
    :cond_1
    const-string v4, "AdXAppTracker"

    const-string v5, "No Referral URL."

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method
