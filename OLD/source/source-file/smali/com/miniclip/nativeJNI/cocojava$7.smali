.class Lcom/miniclip/nativeJNI/cocojava$7;
.super Ljava/lang/Object;
.source "cocojava.java"

# interfaces
.implements Landroid/widget/TextView$OnEditorActionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/cocojava;->firstRun()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miniclip/nativeJNI/cocojava;


# direct methods
.method constructor <init>(Lcom/miniclip/nativeJNI/cocojava;)V
    .locals 0

    .prologue
    .line 1091
    iput-object p1, p0, Lcom/miniclip/nativeJNI/cocojava$7;->this$0:Lcom/miniclip/nativeJNI/cocojava;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onEditorAction(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 3
    .param p1, "v"    # Landroid/widget/TextView;
    .param p2, "actionId"    # I
    .param p3, "event"    # Landroid/view/KeyEvent;

    .prologue
    const/4 v2, 0x0

    .line 1098
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mEditText:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getVisibility()I

    move-result v0

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    .line 1128
    :goto_0
    return v2

    .line 1101
    :cond_0
    const/4 v0, 0x6

    if-eq p2, v0, :cond_1

    invoke-virtual {p3}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v0

    const/16 v1, 0x42

    if-eq v0, v1, :cond_1

    const/4 v0, 0x5

    if-ne p2, v0, :cond_2

    .line 1105
    :cond_1
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/miniclip/nativeJNI/cocojava$7$1;

    invoke-direct {v1, p0}, Lcom/miniclip/nativeJNI/cocojava$7$1;-><init>(Lcom/miniclip/nativeJNI/cocojava$7;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 1121
    :cond_2
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mGLView:Lcom/miniclip/nativeJNI/ClearGLSurfaceView;

    new-instance v1, Lcom/miniclip/nativeJNI/cocojava$7$2;

    invoke-direct {v1, p0}, Lcom/miniclip/nativeJNI/cocojava$7$2;-><init>(Lcom/miniclip/nativeJNI/cocojava$7;)V

    invoke-virtual {v0, v1}, Lcom/miniclip/nativeJNI/ClearGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    goto :goto_0
.end method
