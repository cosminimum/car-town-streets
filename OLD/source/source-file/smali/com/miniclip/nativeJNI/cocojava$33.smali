.class final Lcom/miniclip/nativeJNI/cocojava$33;
.super Ljava/lang/Object;
.source "cocojava.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/cocojava;->callInAppGetJar(Ljava/lang/String;ILjava/lang/String;III)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$callback:I

.field final synthetic val$itemID:Ljava/lang/String;

.field final synthetic val$price:I

.field final synthetic val$self:I

.field final synthetic val$showDialog:I

.field final synthetic val$title:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;ILjava/lang/String;III)V
    .locals 0

    .prologue
    .line 2107
    iput-object p1, p0, Lcom/miniclip/nativeJNI/cocojava$33;->val$itemID:Ljava/lang/String;

    iput p2, p0, Lcom/miniclip/nativeJNI/cocojava$33;->val$price:I

    iput-object p3, p0, Lcom/miniclip/nativeJNI/cocojava$33;->val$title:Ljava/lang/String;

    iput p4, p0, Lcom/miniclip/nativeJNI/cocojava$33;->val$callback:I

    iput p5, p0, Lcom/miniclip/nativeJNI/cocojava$33;->val$self:I

    iput p6, p0, Lcom/miniclip/nativeJNI/cocojava$33;->val$showDialog:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .prologue
    .line 2109
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v0, Lcom/miniclip/nativeJNI/cocojava;

    iget-object v1, p0, Lcom/miniclip/nativeJNI/cocojava$33;->val$itemID:Ljava/lang/String;

    iget v2, p0, Lcom/miniclip/nativeJNI/cocojava$33;->val$price:I

    iget-object v3, p0, Lcom/miniclip/nativeJNI/cocojava$33;->val$title:Ljava/lang/String;

    iget v4, p0, Lcom/miniclip/nativeJNI/cocojava$33;->val$callback:I

    iget v5, p0, Lcom/miniclip/nativeJNI/cocojava$33;->val$self:I

    iget v6, p0, Lcom/miniclip/nativeJNI/cocojava$33;->val$showDialog:I

    invoke-virtual/range {v0 .. v6}, Lcom/miniclip/nativeJNI/cocojava;->callGetJar(Ljava/lang/String;ILjava/lang/String;III)V

    .line 2110
    return-void
.end method
