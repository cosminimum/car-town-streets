.class final Lcom/miniclip/nativeJNI/cocojava$67;
.super Ljava/lang/Object;
.source "cocojava.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/cocojava;->showHtmlDialog(Ljava/lang/String;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$_path:I

.field final synthetic val$htmlContent:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .prologue
    .line 4003
    iput-object p1, p0, Lcom/miniclip/nativeJNI/cocojava$67;->val$htmlContent:Ljava/lang/String;

    iput p2, p0, Lcom/miniclip/nativeJNI/cocojava$67;->val$_path:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 4006
    new-instance v0, Lcom/miniclip/nativeJNI/HtmlDialog;

    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/miniclip/nativeJNI/cocojava$67;->val$htmlContent:Ljava/lang/String;

    iget v3, p0, Lcom/miniclip/nativeJNI/cocojava$67;->val$_path:I

    new-instance v4, Lcom/miniclip/nativeJNI/cocojava$67$1;

    invoke-direct {v4, p0}, Lcom/miniclip/nativeJNI/cocojava$67$1;-><init>(Lcom/miniclip/nativeJNI/cocojava$67;)V

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/miniclip/nativeJNI/HtmlDialog;-><init>(Landroid/content/Context;Ljava/lang/String;ILcom/facebook/android/Facebook$DialogListener;)V

    .line 4024
    .local v0, "dialog":Lcom/miniclip/nativeJNI/HtmlDialog;
    invoke-virtual {v0}, Lcom/miniclip/nativeJNI/HtmlDialog;->show()V

    .line 4026
    return-void
.end method
