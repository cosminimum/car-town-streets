.class Lcom/tapjoy/TJCOffers$1;
.super Ljava/lang/Object;
.source "TJCOffers.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tapjoy/TJCOffers;->getTapPoints(Lcom/tapjoy/TapjoyNotifier;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tapjoy/TJCOffers;


# direct methods
.method constructor <init>(Lcom/tapjoy/TJCOffers;)V
    .locals 0

    .prologue
    .line 109
    iput-object p1, p0, Lcom/tapjoy/TJCOffers$1;->this$0:Lcom/tapjoy/TJCOffers;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 112
    const/4 v1, 0x0

    .line 114
    .local v1, "returnValue":Z
    invoke-static {}, Lcom/tapjoy/TapjoyConnectCore;->getURLParams()Ljava/lang/String;

    move-result-object v2

    .line 115
    .local v2, "url_params":Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "&publisher_user_id="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {}, Lcom/tapjoy/TapjoyConnectCore;->getUserID()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 118
    new-instance v3, Lcom/tapjoy/TapjoyURLConnection;

    invoke-direct {v3}, Lcom/tapjoy/TapjoyURLConnection;-><init>()V

    const-string v4, "https://ws.tapjoyads.com/get_vg_store_items/user_account?"

    invoke-virtual {v3, v4, v2}, Lcom/tapjoy/TapjoyURLConnection;->connectToURL(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 121
    .local v0, "result":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 123
    iget-object v3, p0, Lcom/tapjoy/TJCOffers$1;->this$0:Lcom/tapjoy/TJCOffers;

    invoke-static {v3, v0}, Lcom/tapjoy/TJCOffers;->access$000(Lcom/tapjoy/TJCOffers;Ljava/lang/String;)Z

    move-result v1

    .line 127
    :cond_0
    if-nez v1, :cond_1

    .line 128
    invoke-static {}, Lcom/tapjoy/TJCOffers;->access$100()Lcom/tapjoy/TapjoyNotifier;

    move-result-object v3

    const-string v4, "Failed to retrieve points from server"

    invoke-interface {v3, v4}, Lcom/tapjoy/TapjoyNotifier;->getUpdatePointsFailed(Ljava/lang/String;)V

    .line 129
    :cond_1
    return-void
.end method
