.class final Lcom/miniclip/nativeJNI/cocojava$62;
.super Ljava/lang/Object;
.source "cocojava.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/cocojava;->faceBook_authorizeAndRun(Ljava/lang/String;Ljava/lang/Runnable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$accessToken:Lcom/facebook/AccessToken;

.field final synthetic val$runAfterLogin:Ljava/lang/Runnable;


# direct methods
.method constructor <init>(Lcom/facebook/AccessToken;Ljava/lang/Runnable;)V
    .locals 0

    .prologue
    .line 3616
    iput-object p1, p0, Lcom/miniclip/nativeJNI/cocojava$62;->val$accessToken:Lcom/facebook/AccessToken;

    iput-object p2, p0, Lcom/miniclip/nativeJNI/cocojava$62;->val$runAfterLogin:Ljava/lang/Runnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 3618
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mFB_Session:Lcom/facebook/Session;

    iget-object v1, p0, Lcom/miniclip/nativeJNI/cocojava$62;->val$accessToken:Lcom/facebook/AccessToken;

    new-instance v2, Lcom/miniclip/nativeJNI/cocojava$62$1;

    invoke-direct {v2, p0}, Lcom/miniclip/nativeJNI/cocojava$62$1;-><init>(Lcom/miniclip/nativeJNI/cocojava$62;)V

    invoke-virtual {v0, v1, v2}, Lcom/facebook/Session;->open(Lcom/facebook/AccessToken;Lcom/facebook/Session$StatusCallback;)V

    .line 3624
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mFB_Session:Lcom/facebook/Session;

    invoke-static {v0}, Lcom/facebook/Session;->setActiveSession(Lcom/facebook/Session;)V

    .line 3625
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->access$1500()Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/miniclip/nativeJNI/cocojava$62;->val$runAfterLogin:Ljava/lang/Runnable;

    const-wide/16 v2, 0x1f4

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 3626
    return-void
.end method
