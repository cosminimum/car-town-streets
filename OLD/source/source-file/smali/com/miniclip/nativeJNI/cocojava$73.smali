.class final Lcom/miniclip/nativeJNI/cocojava$73;
.super Ljava/lang/Object;
.source "cocojava.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/cocojava;->NF_showBoard()I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 4256
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 4259
    invoke-static {}, Lcom/miniclip/nativeJNI/CocoJNI;->NFcallBoardWillAppear()V

    .line 4260
    invoke-static {}, Lcom/miniclip/nativeJNI/CocoJNI;->NFcallBoardDidAppear()V

    .line 4261
    const/4 v0, 0x1

    invoke-static {v0}, Lcom/miniclip/nativeJNI/CocoJNI;->MsetGamePause(I)V

    .line 4262
    return-void
.end method
