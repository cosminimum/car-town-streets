.class Lcom/miniclip/nativeJNI/InAppActivity$1;
.super Ljava/lang/Object;
.source "InAppActivity.java"

# interfaces
.implements Lcom/miniclip/googlebilling/IabHelper$OnIabSetupFinishedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/InAppActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miniclip/nativeJNI/InAppActivity;


# direct methods
.method constructor <init>(Lcom/miniclip/nativeJNI/InAppActivity;)V
    .locals 0

    .prologue
    .line 70
    iput-object p1, p0, Lcom/miniclip/nativeJNI/InAppActivity$1;->this$0:Lcom/miniclip/nativeJNI/InAppActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onIabSetupFinished(Lcom/miniclip/googlebilling/IabResult;)V
    .locals 4
    .param p1, "result"    # Lcom/miniclip/googlebilling/IabResult;

    .prologue
    const/4 v3, 0x1

    .line 72
    const-string v0, "InAppActivity"

    const-string v1, "Setup finished."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 74
    invoke-virtual {p1}, Lcom/miniclip/googlebilling/IabResult;->isSuccess()Z

    move-result v0

    if-nez v0, :cond_0

    .line 76
    iget-object v0, p0, Lcom/miniclip/nativeJNI/InAppActivity$1;->this$0:Lcom/miniclip/nativeJNI/InAppActivity;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Problem setting up in-app billing: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miniclip/nativeJNI/InAppActivity;->complain(Ljava/lang/String;)V

    .line 85
    :goto_0
    return-void

    .line 81
    :cond_0
    const-string v0, "InAppActivity"

    const-string v1, "Setup successful. Querying inventory."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 82
    iget-object v0, p0, Lcom/miniclip/nativeJNI/InAppActivity$1;->this$0:Lcom/miniclip/nativeJNI/InAppActivity;

    invoke-static {v0}, Lcom/miniclip/nativeJNI/InAppActivity;->access$000(Lcom/miniclip/nativeJNI/InAppActivity;)Lcom/miniclip/googlebilling/IabHelper;

    move-result-object v0

    iget-object v1, p0, Lcom/miniclip/nativeJNI/InAppActivity$1;->this$0:Lcom/miniclip/nativeJNI/InAppActivity;

    invoke-virtual {v1}, Lcom/miniclip/nativeJNI/InAppActivity;->getInAppSkus()[Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    iget-object v2, p0, Lcom/miniclip/nativeJNI/InAppActivity$1;->this$0:Lcom/miniclip/nativeJNI/InAppActivity;

    iget-object v2, v2, Lcom/miniclip/nativeJNI/InAppActivity;->mGotInventoryListener:Lcom/miniclip/googlebilling/IabHelper$QueryInventoryFinishedListener;

    invoke-virtual {v0, v3, v1, v2}, Lcom/miniclip/googlebilling/IabHelper;->queryInventoryAsync(ZLjava/util/List;Lcom/miniclip/googlebilling/IabHelper$QueryInventoryFinishedListener;)V

    .line 84
    iget-object v0, p0, Lcom/miniclip/nativeJNI/InAppActivity$1;->this$0:Lcom/miniclip/nativeJNI/InAppActivity;

    invoke-static {v0, v3}, Lcom/miniclip/nativeJNI/InAppActivity;->access$102(Lcom/miniclip/nativeJNI/InAppActivity;Z)Z

    goto :goto_0
.end method
