.class final Lcom/miniclip/nativeJNI/cocojava$61;
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
.field final synthetic val$permissionsArray:[Ljava/lang/String;

.field final synthetic val$runAfterLogin:Ljava/lang/Runnable;


# direct methods
.method constructor <init>(Ljava/lang/Runnable;[Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 3572
    iput-object p1, p0, Lcom/miniclip/nativeJNI/cocojava$61;->val$runAfterLogin:Ljava/lang/Runnable;

    iput-object p2, p0, Lcom/miniclip/nativeJNI/cocojava$61;->val$permissionsArray:[Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 3574
    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->mFB_Session:Lcom/facebook/Session;

    if-eqz v1, :cond_0

    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->mFB_Session:Lcom/facebook/Session;

    invoke-virtual {v1}, Lcom/facebook/Session;->isOpened()Z

    move-result v1

    if-nez v1, :cond_0

    .line 3575
    new-instance v2, Lcom/facebook/Session$OpenRequest;

    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v1, Landroid/app/Activity;

    invoke-direct {v2, v1}, Lcom/facebook/Session$OpenRequest;-><init>(Landroid/app/Activity;)V

    new-instance v1, Lcom/miniclip/nativeJNI/cocojava$61$1;

    invoke-direct {v1, p0}, Lcom/miniclip/nativeJNI/cocojava$61$1;-><init>(Lcom/miniclip/nativeJNI/cocojava$61;)V

    invoke-virtual {v2, v1}, Lcom/facebook/Session$OpenRequest;->setCallback(Lcom/facebook/Session$StatusCallback;)Lcom/facebook/Session$OpenRequest;

    move-result-object v0

    .line 3592
    .local v0, "openRequest":Lcom/facebook/Session$OpenRequest;
    if-eqz v0, :cond_0

    .line 3593
    sget-object v1, Lcom/facebook/SessionDefaultAudience;->FRIENDS:Lcom/facebook/SessionDefaultAudience;

    invoke-virtual {v0, v1}, Lcom/facebook/Session$OpenRequest;->setDefaultAudience(Lcom/facebook/SessionDefaultAudience;)Lcom/facebook/Session$OpenRequest;

    .line 3594
    iget-object v1, p0, Lcom/miniclip/nativeJNI/cocojava$61;->val$permissionsArray:[Ljava/lang/String;

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/facebook/Session$OpenRequest;->setPermissions(Ljava/util/List;)Lcom/facebook/Session$OpenRequest;

    .line 3595
    sget-object v1, Lcom/facebook/SessionLoginBehavior;->SSO_WITH_FALLBACK:Lcom/facebook/SessionLoginBehavior;

    invoke-virtual {v0, v1}, Lcom/facebook/Session$OpenRequest;->setLoginBehavior(Lcom/facebook/SessionLoginBehavior;)Lcom/facebook/Session$OpenRequest;

    .line 3596
    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->mFB_Session:Lcom/facebook/Session;

    invoke-virtual {v1, v0}, Lcom/facebook/Session;->openForRead(Lcom/facebook/Session$OpenRequest;)V

    .line 3597
    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->mFB_Session:Lcom/facebook/Session;

    invoke-static {v1}, Lcom/facebook/Session;->setActiveSession(Lcom/facebook/Session;)V

    .line 3601
    .end local v0    # "openRequest":Lcom/facebook/Session$OpenRequest;
    :cond_0
    return-void
.end method
