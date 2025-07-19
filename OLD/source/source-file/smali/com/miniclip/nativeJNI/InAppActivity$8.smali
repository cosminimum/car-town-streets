.class Lcom/miniclip/nativeJNI/InAppActivity$8;
.super Ljava/lang/Object;
.source "InAppActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/InAppActivity;->setWaitScreen(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miniclip/nativeJNI/InAppActivity;

.field final synthetic val$set:Z


# direct methods
.method constructor <init>(Lcom/miniclip/nativeJNI/InAppActivity;Z)V
    .locals 0

    .prologue
    .line 271
    iput-object p1, p0, Lcom/miniclip/nativeJNI/InAppActivity$8;->this$0:Lcom/miniclip/nativeJNI/InAppActivity;

    iput-boolean p2, p0, Lcom/miniclip/nativeJNI/InAppActivity$8;->val$set:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 273
    iget-boolean v0, p0, Lcom/miniclip/nativeJNI/InAppActivity$8;->val$set:Z

    if-eqz v0, :cond_1

    .line 274
    iget-object v0, p0, Lcom/miniclip/nativeJNI/InAppActivity$8;->this$0:Lcom/miniclip/nativeJNI/InAppActivity;

    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    const-string v2, "Processing Transaction"

    const-string v3, "Please Wait"

    invoke-static {v1, v2, v3}, Landroid/app/ProgressDialog;->show(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/app/ProgressDialog;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miniclip/nativeJNI/InAppActivity;->access$302(Lcom/miniclip/nativeJNI/InAppActivity;Landroid/app/ProgressDialog;)Landroid/app/ProgressDialog;

    .line 277
    :cond_0
    :goto_0
    return-void

    .line 275
    :cond_1
    iget-object v0, p0, Lcom/miniclip/nativeJNI/InAppActivity$8;->this$0:Lcom/miniclip/nativeJNI/InAppActivity;

    invoke-static {v0}, Lcom/miniclip/nativeJNI/InAppActivity;->access$300(Lcom/miniclip/nativeJNI/InAppActivity;)Landroid/app/ProgressDialog;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 276
    iget-object v0, p0, Lcom/miniclip/nativeJNI/InAppActivity$8;->this$0:Lcom/miniclip/nativeJNI/InAppActivity;

    invoke-static {v0}, Lcom/miniclip/nativeJNI/InAppActivity;->access$300(Lcom/miniclip/nativeJNI/InAppActivity;)Landroid/app/ProgressDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    goto :goto_0
.end method
