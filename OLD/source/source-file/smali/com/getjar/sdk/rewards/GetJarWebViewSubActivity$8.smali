.class Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$8;
.super Ljava/lang/Object;
.source "GetJarWebViewSubActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->showUserSwitchedUIAsNeeded()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

.field final synthetic val$builder:Landroid/app/AlertDialog$Builder;


# direct methods
.method constructor <init>(Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;Landroid/app/AlertDialog$Builder;)V
    .locals 0

    .prologue
    .line 862
    iput-object p1, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$8;->this$0:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    iput-object p2, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$8;->val$builder:Landroid/app/AlertDialog$Builder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 866
    :try_start_0
    iget-object v3, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$8;->val$builder:Landroid/app/AlertDialog$Builder;

    invoke-virtual {v3}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 867
    .local v0, "alertDialog":Landroid/app/AlertDialog;
    const-string v3, "Account Changed"

    invoke-virtual {v0, v3}, Landroid/app/AlertDialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 868
    const/4 v3, -0x1

    const-string v4, "OK"

    new-instance v5, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$8$1;

    invoke-direct {v5, p0}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$8$1;-><init>(Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$8;)V

    invoke-virtual {v0, v3, v4, v5}, Landroid/app/AlertDialog;->setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 889
    const v3, 0x1010355

    :try_start_1
    invoke-virtual {v0, v3}, Landroid/app/AlertDialog;->setIconAttribute(I)V
    :try_end_1
    .catch Ljava/lang/NoSuchMethodError; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 897
    :goto_0
    const/4 v3, 0x0

    :try_start_2
    invoke-virtual {v0, v3}, Landroid/app/AlertDialog;->setCancelable(Z)V

    .line 898
    const/4 v3, 0x0

    invoke-virtual {v0, v3}, Landroid/app/AlertDialog;->setCanceledOnTouchOutside(Z)V

    .line 899
    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 903
    .end local v0    # "alertDialog":Landroid/app/AlertDialog;
    :goto_1
    return-void

    .line 890
    .restart local v0    # "alertDialog":Landroid/app/AlertDialog;
    :catch_0
    move-exception v1

    .line 893
    .local v1, "e":Ljava/lang/NoSuchMethodError;
    iget-object v3, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$8;->this$0:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    iget-object v3, v3, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->getJarActivity:Lcom/getjar/sdk/rewards/GetJarActivity;

    invoke-virtual {v3}, Lcom/getjar/sdk/rewards/GetJarActivity;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v3

    const-string v4, "alertIcon.png"

    invoke-virtual {v3, v4}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v3

    const/4 v4, 0x0

    invoke-static {v3, v4}, Landroid/graphics/drawable/Drawable;->createFromStream(Ljava/io/InputStream;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    .line 894
    .local v2, "icon":Landroid/graphics/drawable/Drawable;
    invoke-virtual {v0, v2}, Landroid/app/AlertDialog;->setIcon(Landroid/graphics/drawable/Drawable;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    .line 900
    .end local v0    # "alertDialog":Landroid/app/AlertDialog;
    .end local v1    # "e":Ljava/lang/NoSuchMethodError;
    .end local v2    # "icon":Landroid/graphics/drawable/Drawable;
    :catch_1
    move-exception v1

    .line 901
    .local v1, "e":Ljava/lang/Exception;
    sget-object v3, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    const-string v5, "USER_SWITCHED_UI: Work for \'user switched\' UI failed"

    invoke-static {v3, v4, v5, v1}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1
.end method
