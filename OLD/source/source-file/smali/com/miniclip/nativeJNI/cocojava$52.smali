.class final Lcom/miniclip/nativeJNI/cocojava$52;
.super Ljava/lang/Object;
.source "cocojava.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/cocojava;->showTJOfferDialog()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 3275
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 3277
    sget-object v2, Lcom/miniclip/nativeJNI/cocojava;->mGLView:Lcom/miniclip/nativeJNI/ClearGLSurfaceView;

    new-instance v3, Lcom/miniclip/nativeJNI/cocojava$52$1;

    invoke-direct {v3, p0}, Lcom/miniclip/nativeJNI/cocojava$52$1;-><init>(Lcom/miniclip/nativeJNI/cocojava$52;)V

    invoke-virtual {v2, v3}, Lcom/miniclip/nativeJNI/ClearGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    .line 3283
    new-instance v1, Landroid/app/AlertDialog$Builder;

    sget-object v2, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    invoke-direct {v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 3284
    .local v1, "builder":Landroid/app/AlertDialog$Builder;
    sget-object v2, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v2, Lcom/miniclip/nativeJNI/cocojava;

    sget-object v3, Lcom/miniclip/nativeJNI/cocojava;->mFeaturedApObject:Lcom/tapjoy/TapjoyFeaturedAppObject;

    invoke-virtual {v2, v3}, Lcom/miniclip/nativeJNI/cocojava;->getTapjoyOfferDialogTitle(Lcom/tapjoy/TapjoyFeaturedAppObject;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    sget-object v2, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v2, Lcom/miniclip/nativeJNI/cocojava;

    sget-object v4, Lcom/miniclip/nativeJNI/cocojava;->mFeaturedApObject:Lcom/tapjoy/TapjoyFeaturedAppObject;

    invoke-virtual {v2, v4}, Lcom/miniclip/nativeJNI/cocojava;->getTapjoyOfferDialogMessage(Lcom/tapjoy/TapjoyFeaturedAppObject;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const-string v3, "Later"

    new-instance v4, Lcom/miniclip/nativeJNI/cocojava$52$3;

    invoke-direct {v4, p0}, Lcom/miniclip/nativeJNI/cocojava$52$3;-><init>(Lcom/miniclip/nativeJNI/cocojava$52;)V

    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const-string v3, "Download now"

    new-instance v4, Lcom/miniclip/nativeJNI/cocojava$52$2;

    invoke-direct {v4, p0}, Lcom/miniclip/nativeJNI/cocojava$52$2;-><init>(Lcom/miniclip/nativeJNI/cocojava$52;)V

    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 3339
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 3340
    .local v0, "alert":Landroid/app/Dialog;
    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    .line 3341
    return-void
.end method
