.class Lcom/tapjoy/TapjoyReEngagementAd$1;
.super Ljava/lang/Object;
.source "TapjoyReEngagementAd.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tapjoy/TapjoyReEngagementAd;->getReEngagementAdWithCurrencyID(Ljava/lang/String;Lcom/tapjoy/TapjoyReEngagementAdNotifier;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tapjoy/TapjoyReEngagementAd;


# direct methods
.method constructor <init>(Lcom/tapjoy/TapjoyReEngagementAd;)V
    .locals 0

    .prologue
    .line 74
    iput-object p1, p0, Lcom/tapjoy/TapjoyReEngagementAd$1;->this$0:Lcom/tapjoy/TapjoyReEngagementAd;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 77
    invoke-static {}, Lcom/tapjoy/TapjoyReEngagementAd;->access$000()Lcom/tapjoy/TapjoyURLConnection;

    move-result-object v1

    const-string v2, "https://ws.tapjoyads.com/reengagement_rewards?"

    sget-object v3, Lcom/tapjoy/TapjoyReEngagementAd;->reEngagementAdURLParams:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Lcom/tapjoy/TapjoyURLConnection;->getResponseFromURL(Ljava/lang/String;Ljava/lang/String;)Lcom/tapjoy/TapjoyHttpURLResponse;

    move-result-object v0

    .line 79
    .local v0, "httpResponse":Lcom/tapjoy/TapjoyHttpURLResponse;
    if-eqz v0, :cond_0

    .line 81
    iget v1, v0, Lcom/tapjoy/TapjoyHttpURLResponse;->statusCode:I

    sparse-switch v1, :sswitch_data_0

    .line 100
    :goto_0
    return-void

    .line 86
    :sswitch_0
    iget-object v1, v0, Lcom/tapjoy/TapjoyHttpURLResponse;->response:Ljava/lang/String;

    invoke-static {v1}, Lcom/tapjoy/TapjoyReEngagementAd;->access$102(Ljava/lang/String;)Ljava/lang/String;

    .line 87
    invoke-static {}, Lcom/tapjoy/TapjoyReEngagementAd;->access$200()Lcom/tapjoy/TapjoyReEngagementAdNotifier;

    move-result-object v1

    invoke-interface {v1}, Lcom/tapjoy/TapjoyReEngagementAdNotifier;->getReEngagementAdResponse()V

    goto :goto_0

    .line 92
    :sswitch_1
    invoke-static {}, Lcom/tapjoy/TapjoyReEngagementAd;->access$200()Lcom/tapjoy/TapjoyReEngagementAdNotifier;

    move-result-object v1

    const/4 v2, 0x1

    invoke-interface {v1, v2}, Lcom/tapjoy/TapjoyReEngagementAdNotifier;->getReEngagementAdResponseFailed(I)V

    goto :goto_0

    .line 98
    :cond_0
    invoke-static {}, Lcom/tapjoy/TapjoyReEngagementAd;->access$200()Lcom/tapjoy/TapjoyReEngagementAdNotifier;

    move-result-object v1

    const/4 v2, 0x2

    invoke-interface {v1, v2}, Lcom/tapjoy/TapjoyReEngagementAdNotifier;->getReEngagementAdResponseFailed(I)V

    goto :goto_0

    .line 81
    nop

    :sswitch_data_0
    .sparse-switch
        0xc8 -> :sswitch_0
        0xcc -> :sswitch_1
    .end sparse-switch
.end method
