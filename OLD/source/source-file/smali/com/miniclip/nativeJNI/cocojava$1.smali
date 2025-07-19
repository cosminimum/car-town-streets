.class Lcom/miniclip/nativeJNI/cocojava$1;
.super Ljava/lang/Object;
.source "cocojava.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/cocojava;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miniclip/nativeJNI/cocojava;


# direct methods
.method constructor <init>(Lcom/miniclip/nativeJNI/cocojava;)V
    .locals 0

    .prologue
    .line 398
    iput-object p1, p0, Lcom/miniclip/nativeJNI/cocojava$1;->this$0:Lcom/miniclip/nativeJNI/cocojava;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 401
    new-instance v1, Landroid/app/AlertDialog$Builder;

    sget-object v2, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    invoke-direct {v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 402
    .local v0, "dialog":Landroid/app/AlertDialog;
    const-string v1, "Memory warning"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 403
    const-string v1, "Car Town Streets needs more than 512MB of RAM for an optimal gameplay experience. You might experience some problems."

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 404
    const/4 v1, -0x1

    const-string v2, "Ok"

    new-instance v3, Lcom/miniclip/nativeJNI/cocojava$1$1;

    invoke-direct {v3, p0}, Lcom/miniclip/nativeJNI/cocojava$1$1;-><init>(Lcom/miniclip/nativeJNI/cocojava$1;)V

    invoke-virtual {v0, v1, v2, v3}, Landroid/app/AlertDialog;->setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 408
    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 409
    return-void
.end method
