.class Lcom/miniclip/nativeJNI/cocojava$67$1;
.super Ljava/lang/Object;
.source "cocojava.java"

# interfaces
.implements Lcom/facebook/android/Facebook$DialogListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/cocojava$67;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miniclip/nativeJNI/cocojava$67;


# direct methods
.method constructor <init>(Lcom/miniclip/nativeJNI/cocojava$67;)V
    .locals 0

    .prologue
    .line 4007
    iput-object p1, p0, Lcom/miniclip/nativeJNI/cocojava$67$1;->this$0:Lcom/miniclip/nativeJNI/cocojava$67;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel()V
    .locals 0

    .prologue
    .line 4022
    return-void
.end method

.method public onComplete(Landroid/os/Bundle;)V
    .locals 0
    .param p1, "values"    # Landroid/os/Bundle;

    .prologue
    .line 4010
    return-void
.end method

.method public onError(Lcom/facebook/android/DialogError;)V
    .locals 0
    .param p1, "e"    # Lcom/facebook/android/DialogError;

    .prologue
    .line 4018
    return-void
.end method

.method public onFacebookError(Lcom/facebook/android/FacebookError;)V
    .locals 0
    .param p1, "error"    # Lcom/facebook/android/FacebookError;

    .prologue
    .line 4014
    return-void
.end method
