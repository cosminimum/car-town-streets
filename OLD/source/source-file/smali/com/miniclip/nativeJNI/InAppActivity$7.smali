.class Lcom/miniclip/nativeJNI/InAppActivity$7;
.super Ljava/lang/Object;
.source "InAppActivity.java"

# interfaces
.implements Lcom/miniclip/googlebilling/IabHelper$OnConsumeFinishedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miniclip/nativeJNI/InAppActivity;
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
    .line 201
    iput-object p1, p0, Lcom/miniclip/nativeJNI/InAppActivity$7;->this$0:Lcom/miniclip/nativeJNI/InAppActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onConsumeFinished(Lcom/miniclip/googlebilling/Purchase;Lcom/miniclip/googlebilling/IabResult;)V
    .locals 6
    .param p1, "purchase"    # Lcom/miniclip/googlebilling/Purchase;
    .param p2, "result"    # Lcom/miniclip/googlebilling/IabResult;

    .prologue
    const/4 v5, 0x0

    .line 203
    const-string v2, "InAppActivity"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Consumption finished. Purchase: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", result: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 208
    invoke-virtual {p2}, Lcom/miniclip/googlebilling/IabResult;->isSuccess()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 211
    const-string v2, "InAppActivity"

    const-string v3, "Consumption successful. Provisioning."

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 213
    sget-object v2, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    const-string v3, "INAPP_PURCHASED_OWNEDv3"

    invoke-virtual {v2, v3, v5}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 214
    .local v1, "settings":Landroid/content/SharedPreferences;
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 215
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    invoke-virtual {p1}, Lcom/miniclip/googlebilling/Purchase;->getSku()Ljava/lang/String;

    move-result-object v2

    const/4 v3, -0x4

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 216
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 221
    .end local v0    # "editor":Landroid/content/SharedPreferences$Editor;
    .end local v1    # "settings":Landroid/content/SharedPreferences;
    :goto_0
    iget-object v2, p0, Lcom/miniclip/nativeJNI/InAppActivity$7;->this$0:Lcom/miniclip/nativeJNI/InAppActivity;

    invoke-static {v2, v5}, Lcom/miniclip/nativeJNI/InAppActivity;->access$202(Lcom/miniclip/nativeJNI/InAppActivity;Z)Z

    .line 222
    iget-object v2, p0, Lcom/miniclip/nativeJNI/InAppActivity$7;->this$0:Lcom/miniclip/nativeJNI/InAppActivity;

    invoke-virtual {v2, v5}, Lcom/miniclip/nativeJNI/InAppActivity;->setWaitScreen(Z)V

    .line 223
    const-string v2, "InAppActivity"

    const-string v3, "End consumption flow."

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 224
    return-void

    .line 219
    :cond_0
    iget-object v2, p0, Lcom/miniclip/nativeJNI/InAppActivity$7;->this$0:Lcom/miniclip/nativeJNI/InAppActivity;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Error while consuming: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/miniclip/nativeJNI/InAppActivity;->complain(Ljava/lang/String;)V

    goto :goto_0
.end method
