.class Lcom/miniclip/nativeJNI/cocojava$61$1$1;
.super Ljava/lang/Object;
.source "cocojava.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/cocojava$61$1;->call(Lcom/facebook/Session;Lcom/facebook/SessionState;Ljava/lang/Exception;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miniclip/nativeJNI/cocojava$61$1;


# direct methods
.method constructor <init>(Lcom/miniclip/nativeJNI/cocojava$61$1;)V
    .locals 0

    .prologue
    .line 3580
    iput-object p1, p0, Lcom/miniclip/nativeJNI/cocojava$61$1$1;->this$1:Lcom/miniclip/nativeJNI/cocojava$61$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 3583
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/miniclip/nativeJNI/cocojava;->access$1402(Z)Z

    .line 3584
    invoke-static {}, Lcom/miniclip/nativeJNI/CocoJNI;->MfacebookLoginComplete()V

    .line 3585
    return-void
.end method
