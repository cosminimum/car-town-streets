.class Lcom/miniclip/nativeJNI/cocojava$66$1$2;
.super Ljava/lang/Object;
.source "cocojava.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/cocojava$66$1;->onComplete(Landroid/os/Bundle;Lcom/facebook/FacebookException;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miniclip/nativeJNI/cocojava$66$1;


# direct methods
.method constructor <init>(Lcom/miniclip/nativeJNI/cocojava$66$1;)V
    .locals 0

    .prologue
    .line 3785
    iput-object p1, p0, Lcom/miniclip/nativeJNI/cocojava$66$1$2;->this$1:Lcom/miniclip/nativeJNI/cocojava$66$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 0

    .prologue
    .line 3788
    invoke-static {}, Lcom/miniclip/nativeJNI/CocoJNI;->MfacebookShareCanceled()V

    .line 3789
    return-void
.end method
