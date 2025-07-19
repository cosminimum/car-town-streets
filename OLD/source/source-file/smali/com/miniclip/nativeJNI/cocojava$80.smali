.class final Lcom/miniclip/nativeJNI/cocojava$80;
.super Ljava/lang/Object;
.source "cocojava.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/cocojava;->setCaretPosition(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$position:I


# direct methods
.method constructor <init>(I)V
    .locals 0

    .prologue
    .line 4371
    iput p1, p0, Lcom/miniclip/nativeJNI/cocojava$80;->val$position:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 4373
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mEditText:Landroid/widget/EditText;

    iget v1, p0, Lcom/miniclip/nativeJNI/cocojava$80;->val$position:I

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setSelection(I)V

    .line 4374
    const-string v0, "KeyboardInput"

    const-string v1, "setCaretPosition position: %d"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget v4, p0, Lcom/miniclip/nativeJNI/cocojava$80;->val$position:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 4375
    return-void
.end method
