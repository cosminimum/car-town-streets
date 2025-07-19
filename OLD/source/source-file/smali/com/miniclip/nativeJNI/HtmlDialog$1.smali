.class Lcom/miniclip/nativeJNI/HtmlDialog$1;
.super Ljava/lang/Object;
.source "HtmlDialog.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/HtmlDialog;->createCrossImage()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miniclip/nativeJNI/HtmlDialog;


# direct methods
.method constructor <init>(Lcom/miniclip/nativeJNI/HtmlDialog;)V
    .locals 0

    .prologue
    .line 99
    iput-object p1, p0, Lcom/miniclip/nativeJNI/HtmlDialog$1;->this$0:Lcom/miniclip/nativeJNI/HtmlDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 102
    iget-object v0, p0, Lcom/miniclip/nativeJNI/HtmlDialog$1;->this$0:Lcom/miniclip/nativeJNI/HtmlDialog;

    invoke-static {v0}, Lcom/miniclip/nativeJNI/HtmlDialog;->access$000(Lcom/miniclip/nativeJNI/HtmlDialog;)Lcom/facebook/android/Facebook$DialogListener;

    move-result-object v0

    invoke-interface {v0}, Lcom/facebook/android/Facebook$DialogListener;->onCancel()V

    .line 103
    iget-object v0, p0, Lcom/miniclip/nativeJNI/HtmlDialog$1;->this$0:Lcom/miniclip/nativeJNI/HtmlDialog;

    invoke-virtual {v0}, Lcom/miniclip/nativeJNI/HtmlDialog;->dismiss()V

    .line 104
    return-void
.end method
