.class Lcom/miniclip/nativeJNI/cocojava$2;
.super Ljava/lang/Object;
.source "cocojava.java"

# interfaces
.implements Landroid/view/View$OnSystemUiVisibilityChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/cocojava;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miniclip/nativeJNI/cocojava;


# direct methods
.method constructor <init>(Lcom/miniclip/nativeJNI/cocojava;)V
    .locals 0

    .prologue
    .line 417
    iput-object p1, p0, Lcom/miniclip/nativeJNI/cocojava$2;->this$0:Lcom/miniclip/nativeJNI/cocojava;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onSystemUiVisibilityChange(I)V
    .locals 1
    .param p1, "visibility"    # I

    .prologue
    .line 421
    iget-object v0, p0, Lcom/miniclip/nativeJNI/cocojava$2;->this$0:Lcom/miniclip/nativeJNI/cocojava;

    invoke-static {v0}, Lcom/miniclip/nativeJNI/cocojava;->access$000(Lcom/miniclip/nativeJNI/cocojava;)V

    .line 422
    return-void
.end method
