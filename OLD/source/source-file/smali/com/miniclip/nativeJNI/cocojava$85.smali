.class final Lcom/miniclip/nativeJNI/cocojava$85;
.super Ljava/lang/Object;
.source "cocojava.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/cocojava;->setKeyboardInputVisible(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$visible:I


# direct methods
.method constructor <init>(I)V
    .locals 0

    .prologue
    .line 4537
    iput p1, p0, Lcom/miniclip/nativeJNI/cocojava$85;->val$visible:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 4539
    iget v0, p0, Lcom/miniclip/nativeJNI/cocojava$85;->val$visible:I

    if-nez v0, :cond_0

    .line 4540
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mEditText:Landroid/widget/EditText;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setVisibility(I)V

    .line 4543
    :goto_0
    return-void

    .line 4542
    :cond_0
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mEditText:Landroid/widget/EditText;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setVisibility(I)V

    goto :goto_0
.end method
