.class Lcom/getjar/sdk/rewards/JavaScriptAPI$3;
.super Ljava/lang/Object;
.source "JavaScriptAPI.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/getjar/sdk/rewards/JavaScriptAPI;->showMessageDialog(Ljava/lang/String;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/getjar/sdk/rewards/JavaScriptAPI;


# direct methods
.method constructor <init>(Lcom/getjar/sdk/rewards/JavaScriptAPI;)V
    .locals 0

    .prologue
    .line 623
    iput-object p1, p0, Lcom/getjar/sdk/rewards/JavaScriptAPI$3;->this$0:Lcom/getjar/sdk/rewards/JavaScriptAPI;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 627
    iget-object v0, p0, Lcom/getjar/sdk/rewards/JavaScriptAPI$3;->this$0:Lcom/getjar/sdk/rewards/JavaScriptAPI;

    const-string v1, "com.getjar.rewards"

    sget-object v2, Lcom/getjar/sdk/rewards/GooglePlayLaunchReason;->CHECKOUT:Lcom/getjar/sdk/rewards/GooglePlayLaunchReason;

    invoke-virtual {v2}, Lcom/getjar/sdk/rewards/GooglePlayLaunchReason;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/getjar/sdk/rewards/JavaScriptAPI;->launchGooglePlay(Ljava/lang/String;Ljava/lang/String;)V

    .line 628
    return-void
.end method
