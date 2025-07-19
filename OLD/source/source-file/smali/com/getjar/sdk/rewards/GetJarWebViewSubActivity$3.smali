.class Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$3;
.super Landroid/os/Handler;
.source "GetJarWebViewSubActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;


# direct methods
.method constructor <init>(Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;)V
    .locals 0

    .prologue
    .line 176
    iput-object p1, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$3;->this$0:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 3
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 178
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 186
    :goto_0
    return-void

    .line 180
    :pswitch_0
    iget-object v0, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$3;->this$0:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-virtual {v0}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->loadPostAuthUI()V

    goto :goto_0

    .line 183
    :pswitch_1
    sget-object v0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorType;->NETWORK:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorType;

    const-string v1, ""

    invoke-static {}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->access$500()Landroid/webkit/WebView;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->loadErrorPage(Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorType;Ljava/lang/String;Landroid/webkit/WebView;)V

    goto :goto_0

    .line 178
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
