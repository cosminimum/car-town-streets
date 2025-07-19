.class Lcom/tapjoy/TapjoyDisplayAd$2;
.super Ljava/lang/Object;
.source "TapjoyDisplayAd.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tapjoy/TapjoyDisplayAd;->buildResponse(Ljava/lang/String;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tapjoy/TapjoyDisplayAd;


# direct methods
.method constructor <init>(Lcom/tapjoy/TapjoyDisplayAd;)V
    .locals 0

    .prologue
    .line 212
    iput-object p1, p0, Lcom/tapjoy/TapjoyDisplayAd$2;->this$0:Lcom/tapjoy/TapjoyDisplayAd;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 7
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const-wide/16 v2, 0x2710

    .line 215
    const-string v0, "Banner Ad"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Opening URL in new browser = ["

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {}, Lcom/tapjoy/TapjoyDisplayAd;->access$300()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, "]"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 217
    new-instance v6, Landroid/content/Intent;

    iget-object v0, p0, Lcom/tapjoy/TapjoyDisplayAd$2;->this$0:Lcom/tapjoy/TapjoyDisplayAd;

    invoke-static {v0}, Lcom/tapjoy/TapjoyDisplayAd;->access$400(Lcom/tapjoy/TapjoyDisplayAd;)Landroid/content/Context;

    move-result-object v0

    const-class v1, Lcom/tapjoy/TJCOffersWebView;

    invoke-direct {v6, v0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 218
    .local v6, "intent":Landroid/content/Intent;
    const-string v0, "DISPLAY_AD_URL"

    invoke-static {}, Lcom/tapjoy/TapjoyDisplayAd;->access$300()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v6, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 219
    const/high16 v0, 0x10000000

    invoke-virtual {v6, v0}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 220
    iget-object v0, p0, Lcom/tapjoy/TapjoyDisplayAd$2;->this$0:Lcom/tapjoy/TapjoyDisplayAd;

    invoke-static {v0}, Lcom/tapjoy/TapjoyDisplayAd;->access$400(Lcom/tapjoy/TapjoyDisplayAd;)Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, v6}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 225
    iget-object v0, p0, Lcom/tapjoy/TapjoyDisplayAd$2;->this$0:Lcom/tapjoy/TapjoyDisplayAd;

    iget-object v0, v0, Lcom/tapjoy/TapjoyDisplayAd;->resumeTimer:Ljava/util/Timer;

    if-eqz v0, :cond_0

    .line 227
    iget-object v0, p0, Lcom/tapjoy/TapjoyDisplayAd$2;->this$0:Lcom/tapjoy/TapjoyDisplayAd;

    iget-object v0, v0, Lcom/tapjoy/TapjoyDisplayAd;->resumeTimer:Ljava/util/Timer;

    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    .line 230
    :cond_0
    iget-object v0, p0, Lcom/tapjoy/TapjoyDisplayAd$2;->this$0:Lcom/tapjoy/TapjoyDisplayAd;

    const-wide/16 v4, 0x0

    iput-wide v4, v0, Lcom/tapjoy/TapjoyDisplayAd;->elapsed_time:J

    .line 231
    iget-object v0, p0, Lcom/tapjoy/TapjoyDisplayAd$2;->this$0:Lcom/tapjoy/TapjoyDisplayAd;

    new-instance v1, Ljava/util/Timer;

    invoke-direct {v1}, Ljava/util/Timer;-><init>()V

    iput-object v1, v0, Lcom/tapjoy/TapjoyDisplayAd;->resumeTimer:Ljava/util/Timer;

    .line 232
    iget-object v0, p0, Lcom/tapjoy/TapjoyDisplayAd$2;->this$0:Lcom/tapjoy/TapjoyDisplayAd;

    iget-object v0, v0, Lcom/tapjoy/TapjoyDisplayAd;->resumeTimer:Ljava/util/Timer;

    new-instance v1, Lcom/tapjoy/TapjoyDisplayAd$CheckForResumeTimer;

    iget-object v4, p0, Lcom/tapjoy/TapjoyDisplayAd$2;->this$0:Lcom/tapjoy/TapjoyDisplayAd;

    const/4 v5, 0x0

    invoke-direct {v1, v4, v5}, Lcom/tapjoy/TapjoyDisplayAd$CheckForResumeTimer;-><init>(Lcom/tapjoy/TapjoyDisplayAd;Lcom/tapjoy/TapjoyDisplayAd$1;)V

    move-wide v4, v2

    invoke-virtual/range {v0 .. v5}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;JJ)V

    .line 233
    return-void
.end method
