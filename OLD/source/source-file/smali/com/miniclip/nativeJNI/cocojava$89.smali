.class final Lcom/miniclip/nativeJNI/cocojava$89;
.super Ljava/lang/Object;
.source "cocojava.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/cocojava;->setKeyboardInputSingleLine(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$singleLine:I


# direct methods
.method constructor <init>(I)V
    .locals 0

    .prologue
    .line 4580
    iput p1, p0, Lcom/miniclip/nativeJNI/cocojava$89;->val$singleLine:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    const/4 v0, 0x1

    .line 4584
    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->mEditText:Landroid/widget/EditText;

    iget v2, p0, Lcom/miniclip/nativeJNI/cocojava$89;->val$singleLine:I

    if-ne v2, v0, :cond_0

    :goto_0
    invoke-virtual {v1, v0}, Landroid/widget/EditText;->setMaxLines(I)V

    .line 4585
    return-void

    .line 4584
    :cond_0
    const/16 v0, 0x64

    goto :goto_0
.end method
