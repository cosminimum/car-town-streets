.class final Lcom/miniclip/nativeJNI/cocojava$81;
.super Ljava/lang/Object;
.source "cocojava.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/cocojava;->keyboardInput_Show_withMaxLengthLocked(Ljava/lang/String;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$maxLength:I

.field final synthetic val$text:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .prologue
    .line 4388
    iput-object p1, p0, Lcom/miniclip/nativeJNI/cocojava$81;->val$text:Ljava/lang/String;

    iput p2, p0, Lcom/miniclip/nativeJNI/cocojava$81;->val$maxLength:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    const/4 v5, 0x2

    const/4 v4, 0x0

    .line 4391
    sget-object v2, Lcom/miniclip/nativeJNI/cocojava;->mEditText:Landroid/widget/EditText;

    iget-object v3, p0, Lcom/miniclip/nativeJNI/cocojava$81;->val$text:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 4392
    sget-object v2, Lcom/miniclip/nativeJNI/cocojava;->mEditText:Landroid/widget/EditText;

    invoke-virtual {v2, v4}, Landroid/widget/EditText;->setVisibility(I)V

    .line 4394
    const/4 v2, 0x1

    new-array v0, v2, [Landroid/text/InputFilter;

    .line 4395
    .local v0, "FilterArray":[Landroid/text/InputFilter;
    new-instance v2, Landroid/text/InputFilter$LengthFilter;

    iget v3, p0, Lcom/miniclip/nativeJNI/cocojava$81;->val$maxLength:I

    invoke-direct {v2, v3}, Landroid/text/InputFilter$LengthFilter;-><init>(I)V

    aput-object v2, v0, v4

    .line 4396
    sget-object v2, Lcom/miniclip/nativeJNI/cocojava;->mEditText:Landroid/widget/EditText;

    invoke-virtual {v2, v0}, Landroid/widget/EditText;->setFilters([Landroid/text/InputFilter;)V

    .line 4398
    sget-object v2, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    const-string v3, "input_method"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/inputmethod/InputMethodManager;

    .line 4400
    .local v1, "imm":Landroid/view/inputmethod/InputMethodManager;
    invoke-virtual {v1, v5, v5}, Landroid/view/inputmethod/InputMethodManager;->toggleSoftInput(II)V

    .line 4403
    sget-object v2, Lcom/miniclip/nativeJNI/cocojava;->mEditText:Landroid/widget/EditText;

    sget-object v3, Lcom/miniclip/nativeJNI/cocojava;->mEditText:Landroid/widget/EditText;

    invoke-virtual {v3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-interface {v3}, Landroid/text/Editable;->length()I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/EditText;->setSelection(I)V

    .line 4404
    return-void
.end method
