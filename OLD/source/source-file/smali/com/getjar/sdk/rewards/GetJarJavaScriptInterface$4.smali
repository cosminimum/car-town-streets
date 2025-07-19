.class Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$4;
.super Landroid/os/Handler;
.source "GetJarJavaScriptInterface.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;


# direct methods
.method constructor <init>(Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;)V
    .locals 0

    .prologue
    .line 1098
    iput-object p1, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$4;->this$0:Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 1100
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 1111
    :goto_0
    return-void

    .line 1102
    :pswitch_0
    iget-object v0, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$4;->this$0:Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;

    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$4;->this$0:Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;

    invoke-static {v1}, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->access$200(Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;)Landroid/os/Bundle;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->access$300(Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;Landroid/os/Bundle;)V

    goto :goto_0

    .line 1106
    :pswitch_1
    iget-object v0, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$4;->this$0:Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;

    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$4;->this$0:Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;

    invoke-static {v1}, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->access$400(Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;)Landroid/os/Bundle;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->access$500(Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;Landroid/os/Bundle;)V

    goto :goto_0

    .line 1100
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
