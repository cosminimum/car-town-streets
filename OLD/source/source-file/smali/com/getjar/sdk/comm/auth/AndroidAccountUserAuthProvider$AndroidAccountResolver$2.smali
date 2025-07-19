.class Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver$2;
.super Ljava/lang/Object;
.source "AndroidAccountUserAuthProvider.java"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


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
    .line 705
    iput-object p1, p0, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver$2;->this$1:Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;

    iput-object p2, p0, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver$2;->val$commContext:Lcom/getjar/sdk/comm/CommContext;

    iput-object p3, p0, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver$2;->val$uiParent:Lcom/getjar/sdk/comm/auth/AuthUIParentInterface;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 5
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 709
    :try_start_0
    iget-object v1, p0, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver$2;->this$1:Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;

    iget-object v2, p0, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver$2;->val$commContext:Lcom/getjar/sdk/comm/CommContext;

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;->access$800(Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;Lcom/getjar/sdk/comm/CommContext;Ljava/lang/CharSequence;)V

    .line 710
    iget-object v1, p0, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver$2;->val$uiParent:Lcom/getjar/sdk/comm/auth/AuthUIParentInterface;

    invoke-interface {v1}, Lcom/getjar/sdk/comm/auth/AuthUIParentInterface;->getParentActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->finish()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 712
    :goto_0
    return-void

    .line 711
    :catch_0
    move-exception v0

    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "AuthFlow: AndroidAccountResolver: AlertDialog onClick() failed"

    invoke-static {v1, v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
