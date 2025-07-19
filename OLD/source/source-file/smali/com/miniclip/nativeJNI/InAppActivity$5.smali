.class Lcom/miniclip/nativeJNI/InAppActivity$5;
.super Ljava/lang/Object;
.source "InAppActivity.java"

# interfaces
.implements Lcom/miniclip/googlebilling/IabHelper$OnIabPurchaseFinishedListener;


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
    .line 187
    iput-object p1, p0, Lcom/miniclip/nativeJNI/InAppActivity$5;->this$0:Lcom/miniclip/nativeJNI/InAppActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onIabPurchaseFinished(Lcom/miniclip/googlebilling/IabResult;Lcom/miniclip/googlebilling/Purchase;)V
    .locals 2
    .param p1, "result"    # Lcom/miniclip/googlebilling/IabResult;
    .param p2, "purchase"    # Lcom/miniclip/googlebilling/Purchase;

    .prologue
    .line 189
    iget-object v0, p0, Lcom/miniclip/nativeJNI/InAppActivity$5;->this$0:Lcom/miniclip/nativeJNI/InAppActivity;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, p1, p2, v1}, Lcom/miniclip/nativeJNI/InAppActivity;->purchaseFinishedCallback(Lcom/miniclip/googlebilling/IabResult;Lcom/miniclip/googlebilling/Purchase;Ljava/lang/Boolean;)V

    .line 190
    return-void
.end method
