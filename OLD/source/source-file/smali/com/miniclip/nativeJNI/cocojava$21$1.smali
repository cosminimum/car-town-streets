.class Lcom/miniclip/nativeJNI/cocojava$21$1;
.super Ljava/lang/Object;
.source "cocojava.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/cocojava$21;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miniclip/nativeJNI/cocojava$21;


# direct methods
.method constructor <init>(Lcom/miniclip/nativeJNI/cocojava$21;)V
    .locals 0

    .prologue
    .line 1688
    iput-object p1, p0, Lcom/miniclip/nativeJNI/cocojava$21$1;->this$0:Lcom/miniclip/nativeJNI/cocojava$21;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 1691
    const/4 v0, 0x1

    invoke-static {v0}, Lcom/miniclip/nativeJNI/CocoJNI;->MsetGamePause(I)V

    .line 1692
    return-void
.end method
