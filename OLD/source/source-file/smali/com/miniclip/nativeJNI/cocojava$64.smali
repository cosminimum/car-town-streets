.class final Lcom/miniclip/nativeJNI/cocojava$64;
.super Ljava/lang/Object;
.source "cocojava.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/cocojava;->faceBook_request(Ljava/lang/String;Ljava/lang/String;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$graphPath:Ljava/lang/String;

.field final synthetic val$object:I

.field final synthetic val$paramsStr:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 0

    .prologue
    .line 3664
    iput-object p1, p0, Lcom/miniclip/nativeJNI/cocojava$64;->val$paramsStr:Ljava/lang/String;

    iput-object p2, p0, Lcom/miniclip/nativeJNI/cocojava$64;->val$graphPath:Ljava/lang/String;

    iput p3, p0, Lcom/miniclip/nativeJNI/cocojava$64;->val$object:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 10

    .prologue
    const/4 v9, 0x0

    .line 3668
    new-instance v3, Landroid/os/Bundle;

    invoke-direct {v3}, Landroid/os/Bundle;-><init>()V

    .line 3669
    .local v3, "params":Landroid/os/Bundle;
    iget-object v1, p0, Lcom/miniclip/nativeJNI/cocojava$64;->val$paramsStr:Ljava/lang/String;

    const-string v2, "#"

    invoke-virtual {v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v7

    .line 3670
    .local v7, "paramsArray":[Ljava/lang/String;
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_0
    array-length v1, v7

    add-int/lit8 v1, v1, -0x1

    if-ge v6, v1, :cond_0

    .line 3672
    aget-object v1, v7, v6

    add-int/lit8 v2, v6, 0x1

    aget-object v2, v7, v2

    invoke-virtual {v3, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 3670
    add-int/lit8 v6, v6, 0x2

    goto :goto_0

    .line 3675
    :cond_0
    new-instance v0, Lcom/facebook/Request;

    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->mFB_Session:Lcom/facebook/Session;

    iget-object v2, p0, Lcom/miniclip/nativeJNI/cocojava$64;->val$graphPath:Ljava/lang/String;

    sget-object v4, Lcom/facebook/HttpMethod;->GET:Lcom/facebook/HttpMethod;

    new-instance v5, Lcom/miniclip/nativeJNI/cocojava$64$1;

    invoke-direct {v5, p0}, Lcom/miniclip/nativeJNI/cocojava$64$1;-><init>(Lcom/miniclip/nativeJNI/cocojava$64;)V

    invoke-direct/range {v0 .. v5}, Lcom/facebook/Request;-><init>(Lcom/facebook/Session;Ljava/lang/String;Landroid/os/Bundle;Lcom/facebook/HttpMethod;Lcom/facebook/Request$Callback;)V

    .line 3692
    .local v0, "request":Lcom/facebook/Request;
    new-instance v8, Lcom/facebook/RequestAsyncTask;

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/facebook/Request;

    aput-object v0, v1, v9

    invoke-direct {v8, v1}, Lcom/facebook/RequestAsyncTask;-><init>([Lcom/facebook/Request;)V

    .line 3693
    .local v8, "task":Lcom/facebook/RequestAsyncTask;
    new-array v1, v9, [Ljava/lang/Void;

    invoke-virtual {v8, v1}, Lcom/facebook/RequestAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 3697
    return-void
.end method
