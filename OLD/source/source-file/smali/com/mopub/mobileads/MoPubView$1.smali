.class Lcom/mopub/mobileads/MoPubView$1;
.super Landroid/content/BroadcastReceiver;
.source "MoPubView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mopub/mobileads/MoPubView;->registerScreenStateBroadcastReceiver()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mopub/mobileads/MoPubView;


# direct methods
.method constructor <init>(Lcom/mopub/mobileads/MoPubView;)V
    .locals 0

    .prologue
    .line 187
    iput-object p1, p0, Lcom/mopub/mobileads/MoPubView$1;->this$0:Lcom/mopub/mobileads/MoPubView;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 189
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "android.intent.action.SCREEN_OFF"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 190
    iget-object v0, p0, Lcom/mopub/mobileads/MoPubView$1;->this$0:Lcom/mopub/mobileads/MoPubView;

    invoke-static {v0}, Lcom/mopub/mobileads/MoPubView;->access$000(Lcom/mopub/mobileads/MoPubView;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 191
    const-string v0, "MoPub"

    const-string v1, "Screen sleep with ad in foreground, disable refresh"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 192
    iget-object v0, p0, Lcom/mopub/mobileads/MoPubView$1;->this$0:Lcom/mopub/mobileads/MoPubView;

    iget-object v0, v0, Lcom/mopub/mobileads/MoPubView;->mAdView:Lcom/mopub/mobileads/AdView;

    if-eqz v0, :cond_0

    .line 193
    iget-object v0, p0, Lcom/mopub/mobileads/MoPubView$1;->this$0:Lcom/mopub/mobileads/MoPubView;

    iget-object v1, p0, Lcom/mopub/mobileads/MoPubView$1;->this$0:Lcom/mopub/mobileads/MoPubView;

    iget-object v1, v1, Lcom/mopub/mobileads/MoPubView;->mAdView:Lcom/mopub/mobileads/AdView;

    invoke-virtual {v1}, Lcom/mopub/mobileads/AdView;->getAutorefreshEnabled()Z

    move-result v1

    invoke-static {v0, v1}, Lcom/mopub/mobileads/MoPubView;->access$102(Lcom/mopub/mobileads/MoPubView;Z)Z

    .line 194
    iget-object v0, p0, Lcom/mopub/mobileads/MoPubView$1;->this$0:Lcom/mopub/mobileads/MoPubView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/mopub/mobileads/MoPubView;->setAutorefreshEnabled(Z)V

    .line 210
    :cond_0
    :goto_0
    return-void

    .line 197
    :cond_1
    const-string v0, "MoPub"

    const-string v1, "Screen sleep but ad in background; refresh should already be disabled"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 200
    :cond_2
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "android.intent.action.USER_PRESENT"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 201
    iget-object v0, p0, Lcom/mopub/mobileads/MoPubView$1;->this$0:Lcom/mopub/mobileads/MoPubView;

    invoke-static {v0}, Lcom/mopub/mobileads/MoPubView;->access$000(Lcom/mopub/mobileads/MoPubView;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 202
    const-string v0, "MoPub"

    const-string v1, "Screen wake / ad in foreground, reset refresh"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 203
    iget-object v0, p0, Lcom/mopub/mobileads/MoPubView$1;->this$0:Lcom/mopub/mobileads/MoPubView;

    iget-object v0, v0, Lcom/mopub/mobileads/MoPubView;->mAdView:Lcom/mopub/mobileads/AdView;

    if-eqz v0, :cond_0

    .line 204
    iget-object v0, p0, Lcom/mopub/mobileads/MoPubView$1;->this$0:Lcom/mopub/mobileads/MoPubView;

    iget-object v1, p0, Lcom/mopub/mobileads/MoPubView$1;->this$0:Lcom/mopub/mobileads/MoPubView;

    invoke-static {v1}, Lcom/mopub/mobileads/MoPubView;->access$100(Lcom/mopub/mobileads/MoPubView;)Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/mopub/mobileads/MoPubView;->setAutorefreshEnabled(Z)V

    goto :goto_0

    .line 207
    :cond_3
    const-string v0, "MoPub"

    const-string v1, "Screen wake but ad in background; don\'t enable refresh"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method
