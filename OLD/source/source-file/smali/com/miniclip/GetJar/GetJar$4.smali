.class final Lcom/miniclip/GetJar/GetJar$4;
.super Ljava/lang/Object;
.source "GetJar.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/GetJar/GetJar;->createPickDialog(Ljava/lang/String;ILjava/lang/String;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$adapter:Lcom/miniclip/GetJar/PurchaseMethodAdapter;

.field final synthetic val$title:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Lcom/miniclip/GetJar/PurchaseMethodAdapter;)V
    .locals 0

    .prologue
    .line 221
    iput-object p1, p0, Lcom/miniclip/GetJar/GetJar$4;->val$title:Ljava/lang/String;

    iput-object p2, p0, Lcom/miniclip/GetJar/GetJar$4;->val$adapter:Lcom/miniclip/GetJar/PurchaseMethodAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 225
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-static {}, Lcom/miniclip/GetJar/GetJar;->access$100()Lcom/miniclip/nativeJNI/InAppActivity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 227
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    invoke-virtual {v0, v5}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    .line 228
    const-string v1, "Cancel"

    invoke-virtual {v0, v1, v6}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 229
    const-string v1, "Buy %s?"

    new-array v2, v5, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/miniclip/GetJar/GetJar$4;->val$title:Ljava/lang/String;

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 230
    invoke-virtual {v0, v5}, Landroid/app/AlertDialog$Builder;->setInverseBackgroundForced(Z)Landroid/app/AlertDialog$Builder;

    .line 232
    iget-object v1, p0, Lcom/miniclip/GetJar/GetJar$4;->val$adapter:Lcom/miniclip/GetJar/PurchaseMethodAdapter;

    invoke-virtual {v0, v1, v6}, Landroid/app/AlertDialog$Builder;->setAdapter(Landroid/widget/ListAdapter;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 233
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    invoke-static {v1}, Lcom/miniclip/GetJar/GetJar;->access$202(Landroid/app/AlertDialog;)Landroid/app/AlertDialog;

    .line 234
    invoke-static {}, Lcom/miniclip/GetJar/GetJar;->access$200()Landroid/app/AlertDialog;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/AlertDialog;->show()V

    .line 235
    return-void
.end method
