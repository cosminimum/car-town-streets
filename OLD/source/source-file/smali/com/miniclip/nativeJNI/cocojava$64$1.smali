.class Lcom/miniclip/nativeJNI/cocojava$64$1;
.super Ljava/lang/Object;
.source "cocojava.java"

# interfaces
.implements Lcom/facebook/Request$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/cocojava$64;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miniclip/nativeJNI/cocojava$64;


# direct methods
.method constructor <init>(Lcom/miniclip/nativeJNI/cocojava$64;)V
    .locals 0

    .prologue
    .line 3675
    iput-object p1, p0, Lcom/miniclip/nativeJNI/cocojava$64$1;->this$0:Lcom/miniclip/nativeJNI/cocojava$64;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompleted(Lcom/facebook/Response;)V
    .locals 3
    .param p1, "response"    # Lcom/facebook/Response;

    .prologue
    .line 3679
    invoke-virtual {p1}, Lcom/facebook/Response;->getGraphObject()Lcom/facebook/model/GraphObject;

    move-result-object v1

    invoke-interface {v1}, Lcom/facebook/model/GraphObject;->getInnerJSONObject()Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    .line 3681
    .local v0, "data":Ljava/lang/String;
    const-string v1, "Facebook:"

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 3683
    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->mGLView:Lcom/miniclip/nativeJNI/ClearGLSurfaceView;

    new-instance v2, Lcom/miniclip/nativeJNI/cocojava$64$1$1;

    invoke-direct {v2, p0, v0}, Lcom/miniclip/nativeJNI/cocojava$64$1$1;-><init>(Lcom/miniclip/nativeJNI/cocojava$64$1;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Lcom/miniclip/nativeJNI/ClearGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    .line 3690
    return-void
.end method
