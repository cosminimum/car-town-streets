.class final Lcom/miniclip/nativeJNI/cocojava$32;
.super Ljava/lang/Object;
.source "cocojava.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/cocojava;->cancelNotification(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$nid:I


# direct methods
.method constructor <init>(I)V
    .locals 0

    .prologue
    .line 2088
    iput p1, p0, Lcom/miniclip/nativeJNI/cocojava$32;->val$nid:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 2090
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v0, Lcom/miniclip/nativeJNI/cocojava;

    iget v1, p0, Lcom/miniclip/nativeJNI/cocojava$32;->val$nid:I

    invoke-virtual {v0, v1}, Lcom/miniclip/nativeJNI/cocojava;->cancelCustomNotification(I)V

    .line 2091
    return-void
.end method
