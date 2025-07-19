.class Lcom/miniclip/nativeJNI/cocojava$11;
.super Ljava/lang/Object;
.source "cocojava.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/cocojava;->onKeyDown(ILandroid/view/KeyEvent;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miniclip/nativeJNI/cocojava;

.field final synthetic val$id:I


# direct methods
.method constructor <init>(Lcom/miniclip/nativeJNI/cocojava;I)V
    .locals 0

    .prologue
    .line 1275
    iput-object p1, p0, Lcom/miniclip/nativeJNI/cocojava$11;->this$0:Lcom/miniclip/nativeJNI/cocojava;

    iput p2, p0, Lcom/miniclip/nativeJNI/cocojava$11;->val$id:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 1278
    iget v0, p0, Lcom/miniclip/nativeJNI/cocojava$11;->val$id:I

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/miniclip/nativeJNI/CocoJNI;->MpressedKey(II)V

    .line 1279
    return-void
.end method
