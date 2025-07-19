.class Lcom/miniclip/nativeJNI/InAppActivity$4;
.super Ljava/lang/Object;
.source "InAppActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/InAppActivity;->purchaseFinishedCallback(Lcom/miniclip/googlebilling/IabResult;Lcom/miniclip/googlebilling/Purchase;Ljava/lang/Boolean;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miniclip/nativeJNI/InAppActivity;

.field final synthetic val$managed:Ljava/lang/Boolean;

.field final synthetic val$purchase:Lcom/miniclip/googlebilling/Purchase;


# direct methods
.method constructor <init>(Lcom/miniclip/nativeJNI/InAppActivity;Lcom/miniclip/googlebilling/Purchase;Ljava/lang/Boolean;)V
    .locals 0

    .prologue
    .line 169
    iput-object p1, p0, Lcom/miniclip/nativeJNI/InAppActivity$4;->this$0:Lcom/miniclip/nativeJNI/InAppActivity;

    iput-object p2, p0, Lcom/miniclip/nativeJNI/InAppActivity$4;->val$purchase:Lcom/miniclip/googlebilling/Purchase;

    iput-object p3, p0, Lcom/miniclip/nativeJNI/InAppActivity$4;->val$managed:Ljava/lang/Boolean;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .prologue
    const/4 v6, 0x0

    .line 171
    const/4 v0, 0x1

    sput v0, Lcom/miniclip/nativeJNI/cocojava;->mInAppResponce:I

    .line 172
    sget v0, Lcom/miniclip/nativeJNI/cocojava;->mInAppResponce:I

    sget v1, Lcom/miniclip/nativeJNI/cocojava;->mInAppCallback:I

    sget v2, Lcom/miniclip/nativeJNI/cocojava;->mInAppSelf:I

    sget-object v3, Lcom/miniclip/nativeJNI/cocojava;->mInAppProductId:Ljava/lang/String;

    iget-object v4, p0, Lcom/miniclip/nativeJNI/InAppActivity$4;->val$purchase:Lcom/miniclip/googlebilling/Purchase;

    invoke-virtual {v4}, Lcom/miniclip/googlebilling/Purchase;->getOriginalJson()Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lcom/miniclip/nativeJNI/InAppActivity$4;->val$purchase:Lcom/miniclip/googlebilling/Purchase;

    invoke-virtual {v5}, Lcom/miniclip/googlebilling/Purchase;->getSignature()Ljava/lang/String;

    move-result-object v5

    invoke-static/range {v0 .. v5}, Lcom/miniclip/nativeJNI/CocoJNI;->MsetInAppResponce(IIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 173
    iget-object v0, p0, Lcom/miniclip/nativeJNI/InAppActivity$4;->val$managed:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 174
    iget-object v0, p0, Lcom/miniclip/nativeJNI/InAppActivity$4;->this$0:Lcom/miniclip/nativeJNI/InAppActivity;

    invoke-static {v0, v6}, Lcom/miniclip/nativeJNI/InAppActivity;->access$202(Lcom/miniclip/nativeJNI/InAppActivity;Z)Z

    .line 175
    iget-object v0, p0, Lcom/miniclip/nativeJNI/InAppActivity$4;->this$0:Lcom/miniclip/nativeJNI/InAppActivity;

    invoke-virtual {v0, v6}, Lcom/miniclip/nativeJNI/InAppActivity;->setWaitScreen(Z)V

    .line 183
    :goto_0
    return-void

    .line 177
    :cond_0
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/miniclip/nativeJNI/InAppActivity$4$1;

    invoke-direct {v1, p0}, Lcom/miniclip/nativeJNI/InAppActivity$4$1;-><init>(Lcom/miniclip/nativeJNI/InAppActivity$4;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method
