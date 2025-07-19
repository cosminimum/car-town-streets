.class Lcom/miniclip/nativeJNI/cocojava$7$1;
.super Ljava/lang/Object;
.source "cocojava.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/cocojava$7;->onEditorAction(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miniclip/nativeJNI/cocojava$7;


# direct methods
.method constructor <init>(Lcom/miniclip/nativeJNI/cocojava$7;)V
    .locals 0

    .prologue
    .line 1105
    iput-object p1, p0, Lcom/miniclip/nativeJNI/cocojava$7$1;->this$1:Lcom/miniclip/nativeJNI/cocojava$7;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 1109
    sget-boolean v1, Lcom/miniclip/nativeJNI/cocojava;->mKEYBOARD_OVERRIDE_VISIBILITY:Z

    if-nez v1, :cond_0

    .line 1110
    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->mEditText:Landroid/widget/EditText;

    const/4 v2, 0x4

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setVisibility(I)V

    .line 1113
    :cond_0
    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    const-string v2, "input_method"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 1115
    .local v0, "imm":Landroid/view/inputmethod/InputMethodManager;
    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->mEditText:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getWindowToken()Landroid/os/IBinder;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 1117
    return-void
.end method
