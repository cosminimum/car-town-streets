.class Lcom/miniclip/nativeJNI/cocojava$51;
.super Ljava/lang/Object;
.source "cocojava.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/cocojava;->showUpSellDialogInternal()V
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
    .line 3204
    iput-object p1, p0, Lcom/miniclip/nativeJNI/cocojava$51;->this$0:Lcom/miniclip/nativeJNI/cocojava;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 3206
    sget-object v2, Lcom/miniclip/nativeJNI/cocojava;->mGLView:Lcom/miniclip/nativeJNI/ClearGLSurfaceView;

    new-instance v3, Lcom/miniclip/nativeJNI/cocojava$51$1;

    invoke-direct {v3, p0}, Lcom/miniclip/nativeJNI/cocojava$51$1;-><init>(Lcom/miniclip/nativeJNI/cocojava$51;)V

    invoke-virtual {v2, v3}, Lcom/miniclip/nativeJNI/ClearGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    .line 3212
    new-instance v1, Landroid/app/AlertDialog$Builder;

    sget-object v2, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    invoke-direct {v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 3213
    .local v1, "builder":Landroid/app/AlertDialog$Builder;
    sget-object v2, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v2, Lcom/miniclip/nativeJNI/cocojava;

    invoke-virtual {v2}, Lcom/miniclip/nativeJNI/cocojava;->getUpSellDialogTitle()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    sget-object v2, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v2, Lcom/miniclip/nativeJNI/cocojava;

    invoke-virtual {v2}, Lcom/miniclip/nativeJNI/cocojava;->getUpSellDialogMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const-string v3, "Later"

    new-instance v4, Lcom/miniclip/nativeJNI/cocojava$51$3;

    invoke-direct {v4, p0}, Lcom/miniclip/nativeJNI/cocojava$51$3;-><init>(Lcom/miniclip/nativeJNI/cocojava$51;)V

    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const-string v3, "Get it now"

    new-instance v4, Lcom/miniclip/nativeJNI/cocojava$51$2;

    invoke-direct {v4, p0}, Lcom/miniclip/nativeJNI/cocojava$51$2;-><init>(Lcom/miniclip/nativeJNI/cocojava$51;)V

    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 3247
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 3248
    .local v0, "alert":Landroid/app/Dialog;
    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    .line 3249
    return-void
.end method
