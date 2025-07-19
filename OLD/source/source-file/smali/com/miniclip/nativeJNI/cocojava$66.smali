.class final Lcom/miniclip/nativeJNI/cocojava$66;
.super Ljava/lang/Object;
.source "cocojava.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/cocojava;->faceBook_dialog(Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$action:Ljava/lang/String;

.field final synthetic val$parBundle:Landroid/os/Bundle;


# direct methods
.method constructor <init>(Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 0

    .prologue
    .line 3740
    iput-object p1, p0, Lcom/miniclip/nativeJNI/cocojava$66;->val$action:Ljava/lang/String;

    iput-object p2, p0, Lcom/miniclip/nativeJNI/cocojava$66;->val$parBundle:Landroid/os/Bundle;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 3743
    new-instance v2, Lcom/facebook/widget/WebDialog$Builder;

    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v1, Landroid/app/Activity;

    sget-object v3, Lcom/miniclip/nativeJNI/cocojava;->mFB_Session:Lcom/facebook/Session;

    iget-object v4, p0, Lcom/miniclip/nativeJNI/cocojava$66;->val$action:Ljava/lang/String;

    iget-object v5, p0, Lcom/miniclip/nativeJNI/cocojava$66;->val$parBundle:Landroid/os/Bundle;

    invoke-direct {v2, v1, v3, v4, v5}, Lcom/facebook/widget/WebDialog$Builder;-><init>(Landroid/content/Context;Lcom/facebook/Session;Ljava/lang/String;Landroid/os/Bundle;)V

    new-instance v1, Lcom/miniclip/nativeJNI/cocojava$66$1;

    invoke-direct {v1, p0}, Lcom/miniclip/nativeJNI/cocojava$66$1;-><init>(Lcom/miniclip/nativeJNI/cocojava$66;)V

    invoke-virtual {v2, v1}, Lcom/facebook/widget/WebDialog$Builder;->setOnCompleteListener(Lcom/facebook/widget/WebDialog$OnCompleteListener;)Lcom/facebook/widget/WebDialog$BuilderBase;

    move-result-object v1

    check-cast v1, Lcom/facebook/widget/WebDialog$Builder;

    invoke-virtual {v1}, Lcom/facebook/widget/WebDialog$Builder;->build()Lcom/facebook/widget/WebDialog;

    move-result-object v0

    .line 3796
    .local v0, "dialog":Lcom/facebook/widget/WebDialog;
    invoke-virtual {v0}, Lcom/facebook/widget/WebDialog;->show()V

    .line 3798
    return-void
.end method
