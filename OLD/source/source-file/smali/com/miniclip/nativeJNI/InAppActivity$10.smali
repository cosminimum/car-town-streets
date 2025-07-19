.class Lcom/miniclip/nativeJNI/InAppActivity$10;
.super Ljava/lang/Object;
.source "InAppActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/InAppActivity;->requestPurchaseAct(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miniclip/nativeJNI/InAppActivity;

.field final synthetic val$data:Ljava/lang/String;

.field final synthetic val$signature:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/miniclip/nativeJNI/InAppActivity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 325
    iput-object p1, p0, Lcom/miniclip/nativeJNI/InAppActivity$10;->this$0:Lcom/miniclip/nativeJNI/InAppActivity;

    iput-object p2, p0, Lcom/miniclip/nativeJNI/InAppActivity$10;->val$data:Ljava/lang/String;

    iput-object p3, p0, Lcom/miniclip/nativeJNI/InAppActivity$10;->val$signature:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 327
    const/4 v0, 0x1

    sput v0, Lcom/miniclip/nativeJNI/cocojava;->mInAppResponce:I

    .line 328
    sget v0, Lcom/miniclip/nativeJNI/cocojava;->mInAppResponce:I

    sget v1, Lcom/miniclip/nativeJNI/cocojava;->mInAppCallback:I

    sget v2, Lcom/miniclip/nativeJNI/cocojava;->mInAppSelf:I

    sget-object v3, Lcom/miniclip/nativeJNI/cocojava;->mInAppProductId:Ljava/lang/String;

    iget-object v4, p0, Lcom/miniclip/nativeJNI/InAppActivity$10;->val$data:Ljava/lang/String;

    iget-object v5, p0, Lcom/miniclip/nativeJNI/InAppActivity$10;->val$signature:Ljava/lang/String;

    invoke-static/range {v0 .. v5}, Lcom/miniclip/nativeJNI/CocoJNI;->MsetInAppResponce(IIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 329
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/miniclip/nativeJNI/InAppActivity$10$1;

    invoke-direct {v1, p0}, Lcom/miniclip/nativeJNI/InAppActivity$10$1;-><init>(Lcom/miniclip/nativeJNI/InAppActivity$10;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 340
    return-void
.end method
