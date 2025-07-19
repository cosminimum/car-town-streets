.class Lcom/getjar/sdk/rewards/GetJarSubActivityBase$6;
.super Ljava/lang/Object;
.source "GetJarSubActivityBase.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->createUnableToDownloadDialog()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/getjar/sdk/rewards/GetJarSubActivityBase;


# direct methods
.method constructor <init>(Lcom/getjar/sdk/rewards/GetJarSubActivityBase;)V
    .locals 0

    .prologue
    .line 424
    iput-object p1, p0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase$6;->this$0:Lcom/getjar/sdk/rewards/GetJarSubActivityBase;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "id"    # I

    .prologue
    .line 426
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    return-void
.end method
