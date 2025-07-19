.class Lcom/miniclip/nativeJNI/newDialog$Builder$2;
.super Ljava/lang/Object;
.source "newDialog.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/newDialog$Builder;->create()Lcom/miniclip/nativeJNI/newDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miniclip/nativeJNI/newDialog$Builder;

.field final synthetic val$dialog:Lcom/miniclip/nativeJNI/newDialog;


# direct methods
.method constructor <init>(Lcom/miniclip/nativeJNI/newDialog$Builder;Lcom/miniclip/nativeJNI/newDialog;)V
    .locals 0

    .prologue
    .line 231
    iput-object p1, p0, Lcom/miniclip/nativeJNI/newDialog$Builder$2;->this$0:Lcom/miniclip/nativeJNI/newDialog$Builder;

    iput-object p2, p0, Lcom/miniclip/nativeJNI/newDialog$Builder$2;->val$dialog:Lcom/miniclip/nativeJNI/newDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 233
    iget-object v0, p0, Lcom/miniclip/nativeJNI/newDialog$Builder$2;->this$0:Lcom/miniclip/nativeJNI/newDialog$Builder;

    invoke-static {v0}, Lcom/miniclip/nativeJNI/newDialog$Builder;->access$100(Lcom/miniclip/nativeJNI/newDialog$Builder;)Landroid/content/DialogInterface$OnClickListener;

    move-result-object v0

    iget-object v1, p0, Lcom/miniclip/nativeJNI/newDialog$Builder$2;->val$dialog:Lcom/miniclip/nativeJNI/newDialog;

    const/4 v2, -0x2

    invoke-interface {v0, v1, v2}, Landroid/content/DialogInterface$OnClickListener;->onClick(Landroid/content/DialogInterface;I)V

    .line 236
    iget-object v0, p0, Lcom/miniclip/nativeJNI/newDialog$Builder$2;->val$dialog:Lcom/miniclip/nativeJNI/newDialog;

    invoke-virtual {v0}, Lcom/miniclip/nativeJNI/newDialog;->dismiss()V

    .line 237
    return-void
.end method
