.class Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$8$1;
.super Ljava/lang/Object;
.source "GetJarWebViewSubActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$8;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$8;


# direct methods
.method constructor <init>(Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$8;)V
    .locals 0

    .prologue
    .line 869
    iput-object p1, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$8$1;->this$1:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$8;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 5
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 873
    :try_start_0
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AccountHistoryManager;->getInstance()Lcom/getjar/sdk/comm/auth/AccountHistoryManager;

    move-result-object v1

    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/getjar/sdk/comm/auth/AuthManager;->getUserAccessId()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Lcom/getjar/sdk/comm/auth/AccountEventType;->USER_SWITCHED_UI_COMPLETED:Lcom/getjar/sdk/comm/auth/AccountEventType;

    invoke-virtual {v1, v2, v3}, Lcom/getjar/sdk/comm/auth/AccountHistoryManager;->addEvent(Ljava/lang/String;Lcom/getjar/sdk/comm/auth/AccountEventType;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 878
    :try_start_1
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 883
    :goto_0
    return-void

    .line 879
    :catch_0
    move-exception v0

    .line 880
    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    const-string v3, "USER_SWITCHED_UI: dialog.dismiss() failed"

    invoke-static {v1, v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 874
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v0

    .line 875
    .restart local v0    # "e":Ljava/lang/Exception;
    :try_start_2
    sget-object v1, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    const-string v3, "USER_SWITCHED_UI: Work for \'user switched\' UI failed"

    invoke-static {v1, v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 878
    :try_start_3
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    goto :goto_0

    .line 879
    :catch_2
    move-exception v0

    .line 880
    sget-object v1, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    const-string v3, "USER_SWITCHED_UI: dialog.dismiss() failed"

    invoke-static {v1, v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 877
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v1

    .line 878
    :try_start_4
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3

    .line 881
    :goto_1
    throw v1

    .line 879
    :catch_3
    move-exception v0

    .line 880
    .restart local v0    # "e":Ljava/lang/Exception;
    sget-object v2, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    const-string v4, "USER_SWITCHED_UI: dialog.dismiss() failed"

    invoke-static {v2, v3, v4, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1
.end method
