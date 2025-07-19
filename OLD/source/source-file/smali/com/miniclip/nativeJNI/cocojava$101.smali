.class final Lcom/miniclip/nativeJNI/cocojava$101;
.super Ljava/lang/Object;
.source "cocojava.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/cocojava;->showDatePickerDialog_JNI(III)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$day:I

.field final synthetic val$month:I

.field final synthetic val$year:I


# direct methods
.method constructor <init>(III)V
    .locals 0

    .prologue
    .line 4803
    iput p1, p0, Lcom/miniclip/nativeJNI/cocojava$101;->val$year:I

    iput p2, p0, Lcom/miniclip/nativeJNI/cocojava$101;->val$month:I

    iput p3, p0, Lcom/miniclip/nativeJNI/cocojava$101;->val$day:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 4805
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v0, Lcom/miniclip/nativeJNI/cocojava;

    iget v1, p0, Lcom/miniclip/nativeJNI/cocojava$101;->val$year:I

    iget v2, p0, Lcom/miniclip/nativeJNI/cocojava$101;->val$month:I

    iget v3, p0, Lcom/miniclip/nativeJNI/cocojava$101;->val$day:I

    invoke-virtual {v0, v1, v2, v3}, Lcom/miniclip/nativeJNI/cocojava;->showDatePickerDialog(III)V

    .line 4806
    return-void
.end method
