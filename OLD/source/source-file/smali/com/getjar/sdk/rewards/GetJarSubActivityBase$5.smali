.class Lcom/getjar/sdk/rewards/GetJarSubActivityBase$5;
.super Ljava/lang/Object;
.source "GetJarSubActivityBase.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->createPleaseWaitProgressDialog()V
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
    .line 406
    iput-object p1, p0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase$5;->this$0:Lcom/getjar/sdk/rewards/GetJarSubActivityBase;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .param p1, "arg0"    # Landroid/content/DialogInterface;
    .param p2, "arg1"    # I

    .prologue
    .line 410
    sget-object v0, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    const-string v2, "User clicked CANCEL"

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 411
    iget-object v0, p0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase$5;->this$0:Lcom/getjar/sdk/rewards/GetJarSubActivityBase;

    invoke-virtual {v0}, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->close()V

    .line 412
    return-void
.end method
