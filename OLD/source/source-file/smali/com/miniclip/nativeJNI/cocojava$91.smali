.class final Lcom/miniclip/nativeJNI/cocojava$91;
.super Ljava/lang/Object;
.source "cocojava.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/cocojava;->setKeyboardInputMaxLength(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$maxLength:I


# direct methods
.method constructor <init>(I)V
    .locals 0

    .prologue
    .line 4605
    iput p1, p0, Lcom/miniclip/nativeJNI/cocojava$91;->val$maxLength:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 4607
    const/4 v1, 0x1

    new-array v0, v1, [Landroid/text/InputFilter;

    .line 4608
    .local v0, "FilterArray":[Landroid/text/InputFilter;
    const/4 v1, 0x0

    new-instance v2, Landroid/text/InputFilter$LengthFilter;

    iget v3, p0, Lcom/miniclip/nativeJNI/cocojava$91;->val$maxLength:I

    invoke-direct {v2, v3}, Landroid/text/InputFilter$LengthFilter;-><init>(I)V

    aput-object v2, v0, v1

    .line 4609
    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->mEditText:Landroid/widget/EditText;

    invoke-virtual {v1, v0}, Landroid/widget/EditText;->setFilters([Landroid/text/InputFilter;)V

    .line 4610
    return-void
.end method
