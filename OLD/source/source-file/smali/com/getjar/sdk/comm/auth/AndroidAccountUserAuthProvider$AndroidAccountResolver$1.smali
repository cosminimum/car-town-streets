.class Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver$1;
.super Ljava/lang/Object;
.source "AndroidAccountUserAuthProvider.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;->getAndroidAccountNameViaUI(Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/comm/auth/AuthUIParentInterface;)Ljava/lang/String;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;

.field final synthetic val$dialog:Landroid/app/AlertDialog;


# direct methods
.method constructor <init>(Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;Landroid/app/AlertDialog;)V
    .locals 0

    .prologue
    .line 653
    iput-object p1, p0, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver$1;->this$1:Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;

    iput-object p2, p0, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver$1;->val$dialog:Landroid/app/AlertDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 656
    :try_start_0
    sget-object v1, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "AuthFlow: AndroidAccountResolver: getAndroidAccountNameViaUI() Showing dialog"

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 657
    iget-object v1, p0, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver$1;->val$dialog:Landroid/app/AlertDialog;

    invoke-virtual {v1}, Landroid/app/AlertDialog;->show()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 662
    sget-object v1, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "AuthFlow: AndroidAccountResolver: getAndroidAccountNameViaUI() Done showing dialog"

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 664
    :goto_0
    return-void

    .line 658
    :catch_0
    move-exception v0

    .line 659
    .local v0, "e":Ljava/lang/Exception;
    :try_start_1
    sget-object v1, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "AuthFlow: AndroidAccountResolver: getAndroidAccountNameViaUI() dialog.show() failed"

    invoke-static {v1, v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 660
    iget-object v1, p0, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver$1;->this$1:Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;

    invoke-static {v1}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;->access$700(Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 662
    sget-object v1, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "AuthFlow: AndroidAccountResolver: getAndroidAccountNameViaUI() Done showing dialog"

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    goto :goto_0

    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v1

    sget-object v2, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    const-string v4, "AuthFlow: AndroidAccountResolver: getAndroidAccountNameViaUI() Done showing dialog"

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    throw v1
.end method
