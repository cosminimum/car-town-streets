.class Lcom/miniclip/nativeJNI/cocojava$6$1;
.super Ljava/lang/Object;
.source "cocojava.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/cocojava$6;->onTextChanged(Ljava/lang/CharSequence;III)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miniclip/nativeJNI/cocojava$6;


# direct methods
.method constructor <init>(Lcom/miniclip/nativeJNI/cocojava$6;)V
    .locals 0

    .prologue
    .line 1076
    iput-object p1, p0, Lcom/miniclip/nativeJNI/cocojava$6$1;->this$1:Lcom/miniclip/nativeJNI/cocojava$6;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 1079
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mEditText:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/miniclip/nativeJNI/CocoJNI;->MkeyboardInputResponse(Ljava/lang/String;)V

    .line 1081
    return-void
.end method
