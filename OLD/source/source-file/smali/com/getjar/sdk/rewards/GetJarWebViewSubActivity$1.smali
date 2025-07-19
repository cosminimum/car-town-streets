.class Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$1;
.super Landroid/os/ResultReceiver;
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
.method constructor <init>(Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;Landroid/os/Handler;)V
    .locals 0
    .param p2, "x0"    # Landroid/os/Handler;

    .prologue
    .line 124
    iput-object p1, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$1;->this$0:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-direct {p0, p2}, Landroid/os/ResultReceiver;-><init>(Landroid/os/Handler;)V

    return-void
.end method


# virtual methods
.method protected onReceiveResult(ILandroid/os/Bundle;)V
    .locals 4
    .param p1, "resultCode"    # I
    .param p2, "resultData"    # Landroid/os/Bundle;

    .prologue
    .line 127
    sget-object v0, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onReceiveResult:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 128
    invoke-super {p0, p1, p2}, Landroid/os/ResultReceiver;->onReceiveResult(ILandroid/os/Bundle;)V

    .line 129
    packed-switch p1, :pswitch_data_0

    .line 155
    :goto_0
    :pswitch_0
    return-void

    .line 131
    :pswitch_1
    iget-object v0, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$1;->this$0:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-virtual {v0}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->close()V

    goto :goto_0

    .line 134
    :pswitch_2
    iget-object v0, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$1;->this$0:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->access$102(Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;Z)Z

    .line 135
    iget-object v0, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$1;->this$0:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-virtual {v0}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->reload()V

    goto :goto_0

    .line 138
    :pswitch_3
    iget-object v0, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$1;->this$0:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-virtual {v0}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->simpleReload()V

    goto :goto_0

    .line 141
    :pswitch_4
    iget-object v0, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$1;->this$0:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-static {v0, p2}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->access$200(Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;Landroid/os/Bundle;)V

    goto :goto_0

    .line 144
    :pswitch_5
    iget-object v0, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$1;->this$0:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-static {v0, p2}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->access$300(Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;Landroid/os/Bundle;)V

    goto :goto_0

    .line 147
    :pswitch_6
    iget-object v0, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$1;->this$0:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-virtual {v0, p2}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->setAuthToken(Landroid/os/Bundle;)V

    goto :goto_0

    .line 150
    :pswitch_7
    iget-object v0, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$1;->this$0:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-static {v0, p2}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->access$400(Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;Landroid/os/Bundle;)V

    goto :goto_0

    .line 129
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_7
        :pswitch_2
        :pswitch_4
        :pswitch_5
        :pswitch_0
        :pswitch_0
        :pswitch_6
        :pswitch_3
    .end packed-switch
.end method
