.class final Lcom/miniclip/nativeJNI/cocojava$77;
.super Ljava/lang/Object;
.source "cocojava.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/cocojava;->NF_dismissBoard()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 4317
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 4320
    invoke-static {}, Lcom/miniclip/nativeJNI/CocoJNI;->NFcallBoardWillDisappear()V

    .line 4321
    invoke-static {}, Lcom/miniclip/nativeJNI/CocoJNI;->NFcallBoardDidDisappear()V

    .line 4322
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/miniclip/nativeJNI/CocoJNI;->MsetGamePause(I)V

    .line 4323
    return-void
.end method
