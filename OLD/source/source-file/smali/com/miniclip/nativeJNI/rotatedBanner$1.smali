.class Lcom/miniclip/nativeJNI/rotatedBanner$1;
.super Ljava/lang/Object;
.source "rotatedBanner.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miniclip/nativeJNI/rotatedBanner;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miniclip/nativeJNI/rotatedBanner;


# direct methods
.method constructor <init>(Lcom/miniclip/nativeJNI/rotatedBanner;)V
    .locals 0

    .prologue
    .line 46
    iput-object p1, p0, Lcom/miniclip/nativeJNI/rotatedBanner$1;->this$0:Lcom/miniclip/nativeJNI/rotatedBanner;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 47
    const-string v0, "rotatedBanner"

    const-string v1, "loopAnimation"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 48
    iget-object v0, p0, Lcom/miniclip/nativeJNI/rotatedBanner$1;->this$0:Lcom/miniclip/nativeJNI/rotatedBanner;

    invoke-virtual {v0}, Lcom/miniclip/nativeJNI/rotatedBanner;->runAnimation()V

    .line 49
    return-void
.end method
