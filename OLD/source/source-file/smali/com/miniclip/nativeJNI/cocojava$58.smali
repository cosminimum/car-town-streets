.class Lcom/miniclip/nativeJNI/cocojava$58;
.super Ljava/lang/Object;
.source "cocojava.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/cocojava;->onInterstitialMopubViewExit()V
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
    .line 3470
    iput-object p1, p0, Lcom/miniclip/nativeJNI/cocojava$58;->this$0:Lcom/miniclip/nativeJNI/cocojava;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 3472
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->adLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {v0}, Landroid/widget/RelativeLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->adLayoutH:Landroid/widget/RelativeLayout;

    if-eq v0, v1, :cond_0

    .line 3473
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->adLayoutH:Landroid/widget/RelativeLayout;

    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->adLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 3475
    :cond_0
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mGLView:Lcom/miniclip/nativeJNI/ClearGLSurfaceView;

    new-instance v1, Lcom/miniclip/nativeJNI/cocojava$58$1;

    invoke-direct {v1, p0}, Lcom/miniclip/nativeJNI/cocojava$58$1;-><init>(Lcom/miniclip/nativeJNI/cocojava$58;)V

    invoke-virtual {v0, v1}, Lcom/miniclip/nativeJNI/ClearGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    .line 3481
    return-void
.end method
