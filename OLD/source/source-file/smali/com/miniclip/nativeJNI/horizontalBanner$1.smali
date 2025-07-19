.class Lcom/miniclip/nativeJNI/horizontalBanner$1;
.super Ljava/lang/Object;
.source "horizontalBanner.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miniclip/nativeJNI/horizontalBanner;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miniclip/nativeJNI/horizontalBanner;


# direct methods
.method constructor <init>(Lcom/miniclip/nativeJNI/horizontalBanner;)V
    .locals 0

    .prologue
    .line 27
    iput-object p1, p0, Lcom/miniclip/nativeJNI/horizontalBanner$1;->this$0:Lcom/miniclip/nativeJNI/horizontalBanner;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 29
    const-string v0, "horizontalBanner"

    const-string v1, "loopAnimation"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 31
    return-void
.end method
