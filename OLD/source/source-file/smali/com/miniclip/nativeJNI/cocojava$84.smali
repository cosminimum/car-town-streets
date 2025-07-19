.class final Lcom/miniclip/nativeJNI/cocojava$84;
.super Ljava/lang/Object;
.source "cocojava.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/cocojava;->setKeyboardInputStyle(IIF)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$background:I

.field final synthetic val$size:F

.field final synthetic val$text:I


# direct methods
.method constructor <init>(IIF)V
    .locals 0

    .prologue
    .line 4525
    iput p1, p0, Lcom/miniclip/nativeJNI/cocojava$84;->val$background:I

    iput p2, p0, Lcom/miniclip/nativeJNI/cocojava$84;->val$text:I

    iput p3, p0, Lcom/miniclip/nativeJNI/cocojava$84;->val$size:F

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 4527
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mEditText:Landroid/widget/EditText;

    iget v1, p0, Lcom/miniclip/nativeJNI/cocojava$84;->val$background:I

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setBackgroundColor(I)V

    .line 4528
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mEditText:Landroid/widget/EditText;

    iget v1, p0, Lcom/miniclip/nativeJNI/cocojava$84;->val$text:I

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setTextColor(I)V

    .line 4529
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mEditText:Landroid/widget/EditText;

    iget v1, p0, Lcom/miniclip/nativeJNI/cocojava$84;->val$size:F

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setTextSize(F)V

    .line 4530
    return-void
.end method
