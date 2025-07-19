.class final Lcom/miniclip/nativeJNI/cocojava$31;
.super Ljava/lang/Object;
.source "cocojava.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/cocojava;->createNotification(ILjava/lang/String;Ljava/lang/String;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$nid:I

.field final synthetic val$text:Ljava/lang/String;

.field final synthetic val$title:Ljava/lang/String;

.field final synthetic val$when:I


# direct methods
.method constructor <init>(ILjava/lang/String;Ljava/lang/String;I)V
    .locals 0

    .prologue
    .line 2080
    iput p1, p0, Lcom/miniclip/nativeJNI/cocojava$31;->val$nid:I

    iput-object p2, p0, Lcom/miniclip/nativeJNI/cocojava$31;->val$title:Ljava/lang/String;

    iput-object p3, p0, Lcom/miniclip/nativeJNI/cocojava$31;->val$text:Ljava/lang/String;

    iput p4, p0, Lcom/miniclip/nativeJNI/cocojava$31;->val$when:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 2082
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v0, Lcom/miniclip/nativeJNI/cocojava;

    iget v1, p0, Lcom/miniclip/nativeJNI/cocojava$31;->val$nid:I

    iget-object v2, p0, Lcom/miniclip/nativeJNI/cocojava$31;->val$title:Ljava/lang/String;

    iget-object v3, p0, Lcom/miniclip/nativeJNI/cocojava$31;->val$text:Ljava/lang/String;

    iget v4, p0, Lcom/miniclip/nativeJNI/cocojava$31;->val$when:I

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/miniclip/nativeJNI/cocojava;->createCustomNotification(ILjava/lang/String;Ljava/lang/String;I)V

    .line 2083
    return-void
.end method
