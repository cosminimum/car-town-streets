.class Lcom/tapjoy/TapjoyDisplayAd$RefreshTimer;
.super Ljava/util/TimerTask;
.source "TapjoyDisplayAd.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tapjoy/TapjoyDisplayAd;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RefreshTimer"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tapjoy/TapjoyDisplayAd;


# direct methods
.method private constructor <init>(Lcom/tapjoy/TapjoyDisplayAd;)V
    .locals 0

    .prologue
    .line 267
    iput-object p1, p0, Lcom/tapjoy/TapjoyDisplayAd$RefreshTimer;->this$0:Lcom/tapjoy/TapjoyDisplayAd;

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/tapjoy/TapjoyDisplayAd;Lcom/tapjoy/TapjoyDisplayAd$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/tapjoy/TapjoyDisplayAd;
    .param p2, "x1"    # Lcom/tapjoy/TapjoyDisplayAd$1;

    .prologue
    .line 267
    invoke-direct {p0, p1}, Lcom/tapjoy/TapjoyDisplayAd$RefreshTimer;-><init>(Lcom/tapjoy/TapjoyDisplayAd;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 271
    const-string v0, "Banner Ad"

    const-string v1, "refreshing banner ad..."

    invoke-static {v0, v1}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 272
    iget-object v0, p0, Lcom/tapjoy/TapjoyDisplayAd$RefreshTimer;->this$0:Lcom/tapjoy/TapjoyDisplayAd;

    invoke-static {}, Lcom/tapjoy/TapjoyDisplayAd;->access$100()Lcom/tapjoy/TapjoyDisplayAdNotifier;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/tapjoy/TapjoyDisplayAd;->getDisplayAd(Lcom/tapjoy/TapjoyDisplayAdNotifier;)V

    .line 274
    iget-object v0, p0, Lcom/tapjoy/TapjoyDisplayAd$RefreshTimer;->this$0:Lcom/tapjoy/TapjoyDisplayAd;

    iget-object v0, v0, Lcom/tapjoy/TapjoyDisplayAd;->timer:Ljava/util/Timer;

    if-eqz v0, :cond_0

    .line 276
    iget-object v0, p0, Lcom/tapjoy/TapjoyDisplayAd$RefreshTimer;->this$0:Lcom/tapjoy/TapjoyDisplayAd;

    iget-object v0, v0, Lcom/tapjoy/TapjoyDisplayAd;->timer:Ljava/util/Timer;

    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    .line 277
    iget-object v0, p0, Lcom/tapjoy/TapjoyDisplayAd$RefreshTimer;->this$0:Lcom/tapjoy/TapjoyDisplayAd;

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/tapjoy/TapjoyDisplayAd;->timer:Ljava/util/Timer;

    .line 279
    :cond_0
    return-void
.end method
