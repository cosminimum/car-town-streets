.class Lcom/getjar/sdk/rewards/GetJarSubActivityBase$2;
.super Ljava/lang/Object;
.source "GetJarSubActivityBase.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->relinquishUI()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/getjar/sdk/rewards/GetJarSubActivityBase;


# direct methods
.method constructor <init>(Lcom/getjar/sdk/rewards/GetJarSubActivityBase;)V
    .locals 0

    .prologue
    .line 156
    iput-object p1, p0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase$2;->this$0:Lcom/getjar/sdk/rewards/GetJarSubActivityBase;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .prologue
    .line 160
    :try_start_0
    sget-object v1, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "AuthFlow: relinquishUI() BEFORE waitDialogWasShowing:%1$s, unableToDownloadDialogWasShowing:%2$s"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    iget-object v7, p0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase$2;->this$0:Lcom/getjar/sdk/rewards/GetJarSubActivityBase;

    iget-boolean v7, v7, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->_waitDialogWasShowing:Z

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x1

    iget-object v7, p0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase$2;->this$0:Lcom/getjar/sdk/rewards/GetJarSubActivityBase;

    invoke-static {v7}, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->access$100(Lcom/getjar/sdk/rewards/GetJarSubActivityBase;)Z

    move-result v7

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 165
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase$2;->this$0:Lcom/getjar/sdk/rewards/GetJarSubActivityBase;

    iget-boolean v1, v1, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->_waitDialogWasShowing:Z

    if-eqz v1, :cond_1

    .line 166
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase$2;->this$0:Lcom/getjar/sdk/rewards/GetJarSubActivityBase;

    invoke-virtual {v1}, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->waitDialogShow()V

    .line 173
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase$2;->this$0:Lcom/getjar/sdk/rewards/GetJarSubActivityBase;

    const/4 v2, 0x0

    iput-boolean v2, v1, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->_waitDialogWasShowing:Z

    .line 174
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase$2;->this$0:Lcom/getjar/sdk/rewards/GetJarSubActivityBase;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->access$102(Lcom/getjar/sdk/rewards/GetJarSubActivityBase;Z)Z

    .line 176
    sget-object v1, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "AuthFlow: relinquishUI() AFTER waitDialogWasShowing:%1$s, unableToDownloadDialogWasShowing:%2$s"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    iget-object v7, p0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase$2;->this$0:Lcom/getjar/sdk/rewards/GetJarSubActivityBase;

    iget-boolean v7, v7, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->_waitDialogWasShowing:Z

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x1

    iget-object v7, p0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase$2;->this$0:Lcom/getjar/sdk/rewards/GetJarSubActivityBase;

    invoke-static {v7}, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->access$100(Lcom/getjar/sdk/rewards/GetJarSubActivityBase;)Z

    move-result v7

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 182
    :goto_1
    return-void

    .line 167
    :cond_1
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase$2;->this$0:Lcom/getjar/sdk/rewards/GetJarSubActivityBase;

    invoke-static {v1}, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->access$100(Lcom/getjar/sdk/rewards/GetJarSubActivityBase;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 168
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase$2;->this$0:Lcom/getjar/sdk/rewards/GetJarSubActivityBase;

    invoke-virtual {v1}, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->unableToDownloadDialogShow()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 181
    :catch_0
    move-exception v0

    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    const-string v3, "AuthFlow: relinquishUI() failed"

    invoke-static {v1, v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1
.end method
