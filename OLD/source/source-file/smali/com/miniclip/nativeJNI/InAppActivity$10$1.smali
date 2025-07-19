.class Lcom/miniclip/nativeJNI/InAppActivity$10$1;
.super Ljava/lang/Object;
.source "InAppActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/InAppActivity$10;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miniclip/nativeJNI/InAppActivity$10;


# direct methods
.method constructor <init>(Lcom/miniclip/nativeJNI/InAppActivity$10;)V
    .locals 0

    .prologue
    .line 329
    iput-object p1, p0, Lcom/miniclip/nativeJNI/InAppActivity$10$1;->this$1:Lcom/miniclip/nativeJNI/InAppActivity$10;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 332
    :try_start_0
    new-instance v1, Lcom/miniclip/googlebilling/Purchase;

    iget-object v2, p0, Lcom/miniclip/nativeJNI/InAppActivity$10$1;->this$1:Lcom/miniclip/nativeJNI/InAppActivity$10;

    iget-object v2, v2, Lcom/miniclip/nativeJNI/InAppActivity$10;->val$data:Ljava/lang/String;

    iget-object v3, p0, Lcom/miniclip/nativeJNI/InAppActivity$10$1;->this$1:Lcom/miniclip/nativeJNI/InAppActivity$10;

    iget-object v3, v3, Lcom/miniclip/nativeJNI/InAppActivity$10;->val$signature:Ljava/lang/String;

    invoke-direct {v1, v2, v3}, Lcom/miniclip/googlebilling/Purchase;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 333
    .local v1, "purchase":Lcom/miniclip/googlebilling/Purchase;
    iget-object v2, p0, Lcom/miniclip/nativeJNI/InAppActivity$10$1;->this$1:Lcom/miniclip/nativeJNI/InAppActivity$10;

    iget-object v2, v2, Lcom/miniclip/nativeJNI/InAppActivity$10;->this$0:Lcom/miniclip/nativeJNI/InAppActivity;

    const/4 v3, 0x1

    invoke-static {v2, v3}, Lcom/miniclip/nativeJNI/InAppActivity;->access$202(Lcom/miniclip/nativeJNI/InAppActivity;Z)Z

    .line 334
    iget-object v2, p0, Lcom/miniclip/nativeJNI/InAppActivity$10$1;->this$1:Lcom/miniclip/nativeJNI/InAppActivity$10;

    iget-object v2, v2, Lcom/miniclip/nativeJNI/InAppActivity$10;->this$0:Lcom/miniclip/nativeJNI/InAppActivity;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Lcom/miniclip/nativeJNI/InAppActivity;->setWaitScreen(Z)V

    .line 335
    iget-object v2, p0, Lcom/miniclip/nativeJNI/InAppActivity$10$1;->this$1:Lcom/miniclip/nativeJNI/InAppActivity$10;

    iget-object v2, v2, Lcom/miniclip/nativeJNI/InAppActivity$10;->this$0:Lcom/miniclip/nativeJNI/InAppActivity;

    invoke-static {v2}, Lcom/miniclip/nativeJNI/InAppActivity;->access$000(Lcom/miniclip/nativeJNI/InAppActivity;)Lcom/miniclip/googlebilling/IabHelper;

    move-result-object v2

    iget-object v3, p0, Lcom/miniclip/nativeJNI/InAppActivity$10$1;->this$1:Lcom/miniclip/nativeJNI/InAppActivity$10;

    iget-object v3, v3, Lcom/miniclip/nativeJNI/InAppActivity$10;->this$0:Lcom/miniclip/nativeJNI/InAppActivity;

    iget-object v3, v3, Lcom/miniclip/nativeJNI/InAppActivity;->mConsumeFinishedListener:Lcom/miniclip/googlebilling/IabHelper$OnConsumeFinishedListener;

    invoke-virtual {v2, v1, v3}, Lcom/miniclip/googlebilling/IabHelper;->consumeAsync(Lcom/miniclip/googlebilling/Purchase;Lcom/miniclip/googlebilling/IabHelper$OnConsumeFinishedListener;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 339
    .end local v1    # "purchase":Lcom/miniclip/googlebilling/Purchase;
    :goto_0
    return-void

    .line 336
    :catch_0
    move-exception v0

    .line 337
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0
.end method
