.class Lcom/miniclip/nativeJNI/cocojava$52$2;
.super Ljava/lang/Object;
.source "cocojava.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/cocojava$52;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miniclip/nativeJNI/cocojava$52;


# direct methods
.method constructor <init>(Lcom/miniclip/nativeJNI/cocojava$52;)V
    .locals 0

    .prologue
    .line 3313
    iput-object p1, p0, Lcom/miniclip/nativeJNI/cocojava$52$2;->this$0:Lcom/miniclip/nativeJNI/cocojava$52;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "id"    # I

    .prologue
    .line 3316
    invoke-interface {p1}, Landroid/content/DialogInterface;->cancel()V

    .line 3317
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->showTapFeatureAd()V

    .line 3318
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mFeaturedApObject:Lcom/tapjoy/TapjoyFeaturedAppObject;

    iget-object v0, v0, Lcom/tapjoy/TapjoyFeaturedAppObject;->redirectURL:Ljava/lang/String;

    invoke-static {v0}, Lcom/miniclip/nativeJNI/cocojava;->openLink(Ljava/lang/String;)V

    .line 3324
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mGLView:Lcom/miniclip/nativeJNI/ClearGLSurfaceView;

    new-instance v1, Lcom/miniclip/nativeJNI/cocojava$52$2$1;

    invoke-direct {v1, p0}, Lcom/miniclip/nativeJNI/cocojava$52$2$1;-><init>(Lcom/miniclip/nativeJNI/cocojava$52$2;)V

    invoke-virtual {v0, v1}, Lcom/miniclip/nativeJNI/ClearGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    .line 3337
    return-void
.end method
