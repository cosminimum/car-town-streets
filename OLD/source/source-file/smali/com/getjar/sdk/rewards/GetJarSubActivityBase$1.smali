.class Lcom/getjar/sdk/rewards/GetJarSubActivityBase$1;
.super Ljava/lang/Object;
.source "GetJarSubActivityBase.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->takeoverUI(Ljava/util/List;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/getjar/sdk/rewards/GetJarSubActivityBase;

.field final synthetic val$dialogsToManage:Ljava/util/List;


# direct methods
.method constructor <init>(Lcom/getjar/sdk/rewards/GetJarSubActivityBase;Ljava/util/List;)V
    .locals 0

    .prologue
    .line 117
    iput-object p1, p0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase$1;->this$0:Lcom/getjar/sdk/rewards/GetJarSubActivityBase;

    iput-object p2, p0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase$1;->val$dialogsToManage:Ljava/util/List;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .prologue
    .line 121
    :try_start_0
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase$1;->val$dialogsToManage:Ljava/util/List;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase$1;->val$dialogsToManage:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    .line 122
    iget-object v2, p0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase$1;->this$0:Lcom/getjar/sdk/rewards/GetJarSubActivityBase;

    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase$1;->val$dialogsToManage:Ljava/util/List;

    const/4 v3, 0x0

    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/Dialog;

    invoke-static {v2, v1}, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->access$002(Lcom/getjar/sdk/rewards/GetJarSubActivityBase;Landroid/app/Dialog;)Landroid/app/Dialog;

    .line 126
    :goto_0
    sget-object v1, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "AuthFlow: takeoverUI() BEFORE waitDialogWasShowing:%1$s, unableToDownloadDialogWasShowing:%2$s"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    iget-object v7, p0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase$1;->this$0:Lcom/getjar/sdk/rewards/GetJarSubActivityBase;

    iget-boolean v7, v7, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->_waitDialogWasShowing:Z

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x1

    iget-object v7, p0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase$1;->this$0:Lcom/getjar/sdk/rewards/GetJarSubActivityBase;

    invoke-static {v7}, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->access$100(Lcom/getjar/sdk/rewards/GetJarSubActivityBase;)Z

    move-result v7

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 134
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase$1;->this$0:Lcom/getjar/sdk/rewards/GetJarSubActivityBase;

    invoke-static {v1}, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->access$200(Lcom/getjar/sdk/rewards/GetJarSubActivityBase;)Landroid/app/ProgressDialog;

    move-result-object v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase$1;->this$0:Lcom/getjar/sdk/rewards/GetJarSubActivityBase;

    invoke-static {v1}, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->access$200(Lcom/getjar/sdk/rewards/GetJarSubActivityBase;)Landroid/app/ProgressDialog;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/ProgressDialog;->isShowing()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 135
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase$1;->this$0:Lcom/getjar/sdk/rewards/GetJarSubActivityBase;

    invoke-virtual {v1}, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->waitDialogHide()V

    .line 136
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase$1;->this$0:Lcom/getjar/sdk/rewards/GetJarSubActivityBase;

    const/4 v2, 0x1

    iput-boolean v2, v1, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->_waitDialogWasShowing:Z

    .line 142
    :cond_0
    :goto_1
    sget-object v1, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "AuthFlow: takeoverUI() AFTER waitDialogWasShowing:%1$s, unableToDownloadDialogWasShowing:%2$s"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    iget-object v7, p0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase$1;->this$0:Lcom/getjar/sdk/rewards/GetJarSubActivityBase;

    iget-boolean v7, v7, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->_waitDialogWasShowing:Z

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x1

    iget-object v7, p0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase$1;->this$0:Lcom/getjar/sdk/rewards/GetJarSubActivityBase;

    invoke-static {v7}, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->access$100(Lcom/getjar/sdk/rewards/GetJarSubActivityBase;)Z

    move-result v7

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 148
    :goto_2
    return-void

    .line 124
    :cond_1
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase$1;->this$0:Lcom/getjar/sdk/rewards/GetJarSubActivityBase;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->access$002(Lcom/getjar/sdk/rewards/GetJarSubActivityBase;Landroid/app/Dialog;)Landroid/app/Dialog;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 147
    :catch_0
    move-exception v0

    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    const-string v3, "AuthFlow: takeoverUI() failed"

    invoke-static {v1, v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_2

    .line 137
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_2
    :try_start_1
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase$1;->this$0:Lcom/getjar/sdk/rewards/GetJarSubActivityBase;

    invoke-static {v1}, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->access$300(Lcom/getjar/sdk/rewards/GetJarSubActivityBase;)Landroid/app/AlertDialog;

    move-result-object v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase$1;->this$0:Lcom/getjar/sdk/rewards/GetJarSubActivityBase;

    invoke-static {v1}, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->access$300(Lcom/getjar/sdk/rewards/GetJarSubActivityBase;)Landroid/app/AlertDialog;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/AlertDialog;->isShowing()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 138
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase$1;->this$0:Lcom/getjar/sdk/rewards/GetJarSubActivityBase;

    invoke-virtual {v1}, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->unableToDownloadDialogHide()V

    .line 139
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase$1;->this$0:Lcom/getjar/sdk/rewards/GetJarSubActivityBase;

    const/4 v2, 0x1

    invoke-static {v1, v2}, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->access$102(Lcom/getjar/sdk/rewards/GetJarSubActivityBase;Z)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1
.end method
