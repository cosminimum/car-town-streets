.class Lcom/miniclip/nativeJNI/InAppActivity$4$1;
.super Ljava/lang/Object;
.source "InAppActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/InAppActivity$4;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miniclip/nativeJNI/InAppActivity$4;


# direct methods
.method constructor <init>(Lcom/miniclip/nativeJNI/InAppActivity$4;)V
    .locals 0

    .prologue
    .line 177
    iput-object p1, p0, Lcom/miniclip/nativeJNI/InAppActivity$4$1;->this$1:Lcom/miniclip/nativeJNI/InAppActivity$4;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 179
    iget-object v0, p0, Lcom/miniclip/nativeJNI/InAppActivity$4$1;->this$1:Lcom/miniclip/nativeJNI/InAppActivity$4;

    iget-object v0, v0, Lcom/miniclip/nativeJNI/InAppActivity$4;->this$0:Lcom/miniclip/nativeJNI/InAppActivity;

    invoke-static {v0}, Lcom/miniclip/nativeJNI/InAppActivity;->access$000(Lcom/miniclip/nativeJNI/InAppActivity;)Lcom/miniclip/googlebilling/IabHelper;

    move-result-object v0

    iget-object v1, p0, Lcom/miniclip/nativeJNI/InAppActivity$4$1;->this$1:Lcom/miniclip/nativeJNI/InAppActivity$4;

    iget-object v1, v1, Lcom/miniclip/nativeJNI/InAppActivity$4;->val$purchase:Lcom/miniclip/googlebilling/Purchase;

    iget-object v2, p0, Lcom/miniclip/nativeJNI/InAppActivity$4$1;->this$1:Lcom/miniclip/nativeJNI/InAppActivity$4;

    iget-object v2, v2, Lcom/miniclip/nativeJNI/InAppActivity$4;->this$0:Lcom/miniclip/nativeJNI/InAppActivity;

    iget-object v2, v2, Lcom/miniclip/nativeJNI/InAppActivity;->mConsumeFinishedListener:Lcom/miniclip/googlebilling/IabHelper$OnConsumeFinishedListener;

    invoke-virtual {v0, v1, v2}, Lcom/miniclip/googlebilling/IabHelper;->consumeAsync(Lcom/miniclip/googlebilling/Purchase;Lcom/miniclip/googlebilling/IabHelper$OnConsumeFinishedListener;)V

    .line 180
    return-void
.end method
