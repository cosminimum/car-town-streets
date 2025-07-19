.class Lcom/miniclip/nativeJNI/cocojava$51$2;
.super Ljava/lang/Object;
.source "cocojava.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/cocojava$51;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miniclip/nativeJNI/cocojava$51;


# direct methods
.method constructor <init>(Lcom/miniclip/nativeJNI/cocojava$51;)V
    .locals 0

    .prologue
    .line 3232
    iput-object p1, p0, Lcom/miniclip/nativeJNI/cocojava$51$2;->this$1:Lcom/miniclip/nativeJNI/cocojava$51;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "id"    # I

    .prologue
    .line 3235
    invoke-interface {p1}, Landroid/content/DialogInterface;->cancel()V

    .line 3236
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v0, Lcom/miniclip/nativeJNI/cocojava;

    invoke-virtual {v0}, Lcom/miniclip/nativeJNI/cocojava;->getUpSellDialogAction()V

    .line 3238
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mGLView:Lcom/miniclip/nativeJNI/ClearGLSurfaceView;

    new-instance v1, Lcom/miniclip/nativeJNI/cocojava$51$2$1;

    invoke-direct {v1, p0}, Lcom/miniclip/nativeJNI/cocojava$51$2$1;-><init>(Lcom/miniclip/nativeJNI/cocojava$51$2;)V

    invoke-virtual {v0, v1}, Lcom/miniclip/nativeJNI/ClearGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    .line 3245
    return-void
.end method
