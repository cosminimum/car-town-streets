.class Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver$3;
.super Ljava/lang/Object;
.source "AndroidAccountUserAuthProvider.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;->getAndroidAccountUI(Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/comm/auth/AuthUIParentInterface;)Landroid/app/AlertDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;

.field final synthetic val$commContext:Lcom/getjar/sdk/comm/CommContext;

.field final synthetic val$uiParent:Lcom/getjar/sdk/comm/auth/AuthUIParentInterface;


# direct methods
.method constructor <init>(Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/comm/auth/AuthUIParentInterface;)V
    .locals 0

    .prologue
    .line 714
    iput-object p1, p0, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver$3;->this$1:Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;

    iput-object p2, p0, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver$3;->val$commContext:Lcom/getjar/sdk/comm/CommContext;

    iput-object p3, p0, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver$3;->val$uiParent:Lcom/getjar/sdk/comm/auth/AuthUIParentInterface;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 6
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "id"    # I

    .prologue
    .line 718
    :try_start_0
    iget-object v2, p0, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver$3;->this$1:Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;

    iget-object v3, p0, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver$3;->val$commContext:Lcom/getjar/sdk/comm/CommContext;

    const/4 v4, 0x0

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;->access$800(Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;Lcom/getjar/sdk/comm/CommContext;Ljava/lang/CharSequence;)V

    .line 719
    iget-object v2, p0, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver$3;->val$uiParent:Lcom/getjar/sdk/comm/auth/AuthUIParentInterface;

    invoke-interface {v2}, Lcom/getjar/sdk/comm/auth/AuthUIParentInterface;->getParentActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->finish()V

    .line 722
    new-instance v0, Landroid/content/Intent;

    const-string v2, "android.settings.ADD_ACCOUNT_SETTINGS"

    invoke-direct {v0, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 723
    .local v0, "accountCreationIntent":Landroid/content/Intent;
    iget-object v2, p0, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver$3;->val$commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v2}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 726
    .end local v0    # "accountCreationIntent":Landroid/content/Intent;
    :goto_0
    return-void

    .line 725
    :catch_0
    move-exception v1

    .local v1, "e":Ljava/lang/Exception;
    sget-object v2, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    const-string v4, "AuthFlow: AndroidAccountResolver: AlertDialog onClick() failed"

    invoke-static {v2, v3, v4, v1}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
