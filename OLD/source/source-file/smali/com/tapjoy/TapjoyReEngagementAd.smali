.class public Lcom/tapjoy/TapjoyReEngagementAd;
.super Ljava/lang/Object;
.source "TapjoyReEngagementAd.java"


# static fields
.field private static htmlData:Ljava/lang/String;

.field private static reEngagementAdNotifier:Lcom/tapjoy/TapjoyReEngagementAdNotifier;

.field public static reEngagementAdURLParams:Ljava/lang/String;

.field private static tapjoyURLConnection:Lcom/tapjoy/TapjoyURLConnection;


# instance fields
.field final TAPJOY_RE_ENGAGEMENT:Ljava/lang/String;

.field private context:Landroid/content/Context;

.field private currencyID:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 19
    const/4 v0, 0x0

    sput-object v0, Lcom/tapjoy/TapjoyReEngagementAd;->tapjoyURLConnection:Lcom/tapjoy/TapjoyURLConnection;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    const-string v0, "Re-engagement"

    iput-object v0, p0, Lcom/tapjoy/TapjoyReEngagementAd;->TAPJOY_RE_ENGAGEMENT:Ljava/lang/String;

    .line 34
    iput-object p1, p0, Lcom/tapjoy/TapjoyReEngagementAd;->context:Landroid/content/Context;

    .line 35
    new-instance v0, Lcom/tapjoy/TapjoyURLConnection;

    invoke-direct {v0}, Lcom/tapjoy/TapjoyURLConnection;-><init>()V

    sput-object v0, Lcom/tapjoy/TapjoyReEngagementAd;->tapjoyURLConnection:Lcom/tapjoy/TapjoyURLConnection;

    .line 36
    return-void
.end method

.method static synthetic access$000()Lcom/tapjoy/TapjoyURLConnection;
    .locals 1

    .prologue
    .line 16
    sget-object v0, Lcom/tapjoy/TapjoyReEngagementAd;->tapjoyURLConnection:Lcom/tapjoy/TapjoyURLConnection;

    return-object v0
.end method

.method static synthetic access$102(Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 16
    sput-object p0, Lcom/tapjoy/TapjoyReEngagementAd;->htmlData:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$200()Lcom/tapjoy/TapjoyReEngagementAdNotifier;
    .locals 1

    .prologue
    .line 16
    sget-object v0, Lcom/tapjoy/TapjoyReEngagementAd;->reEngagementAdNotifier:Lcom/tapjoy/TapjoyReEngagementAdNotifier;

    return-object v0
.end method


# virtual methods
.method public getReEngagementAd(Lcom/tapjoy/TapjoyReEngagementAdNotifier;)V
    .locals 2
    .param p1, "notifier"    # Lcom/tapjoy/TapjoyReEngagementAdNotifier;

    .prologue
    .line 45
    const-string v0, "Re-engagement"

    const-string v1, "Getting Re-engagement Ad"

    invoke-static {v0, v1}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Lcom/tapjoy/TapjoyReEngagementAd;->getReEngagementAdWithCurrencyID(Ljava/lang/String;Lcom/tapjoy/TapjoyReEngagementAdNotifier;)V

    .line 48
    return-void
.end method

.method public getReEngagementAdWithCurrencyID(Ljava/lang/String;Lcom/tapjoy/TapjoyReEngagementAdNotifier;)V
    .locals 3
    .param p1, "theCurrencyID"    # Ljava/lang/String;
    .param p2, "notifier"    # Lcom/tapjoy/TapjoyReEngagementAdNotifier;

    .prologue
    .line 59
    iput-object p1, p0, Lcom/tapjoy/TapjoyReEngagementAd;->currencyID:Ljava/lang/String;

    .line 61
    const-string v0, "Re-engagement"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Getting Re-engagement ad userID: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {}, Lcom/tapjoy/TapjoyConnectCore;->getUserID()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", currencyID: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/tapjoy/TapjoyReEngagementAd;->currencyID:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 63
    sput-object p2, Lcom/tapjoy/TapjoyReEngagementAd;->reEngagementAdNotifier:Lcom/tapjoy/TapjoyReEngagementAdNotifier;

    .line 66
    invoke-static {}, Lcom/tapjoy/TapjoyConnectCore;->getURLParams()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/tapjoy/TapjoyReEngagementAd;->reEngagementAdURLParams:Ljava/lang/String;

    .line 67
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/tapjoy/TapjoyReEngagementAd;->reEngagementAdURLParams:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "&publisher_user_id="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {}, Lcom/tapjoy/TapjoyConnectCore;->getUserID()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/tapjoy/TapjoyReEngagementAd;->reEngagementAdURLParams:Ljava/lang/String;

    .line 70
    iget-object v0, p0, Lcom/tapjoy/TapjoyReEngagementAd;->currencyID:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 71
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/tapjoy/TapjoyReEngagementAd;->reEngagementAdURLParams:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "&currency_id="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/tapjoy/TapjoyReEngagementAd;->currencyID:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/tapjoy/TapjoyReEngagementAd;->reEngagementAdURLParams:Ljava/lang/String;

    .line 73
    :cond_0
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/tapjoy/TapjoyReEngagementAd$1;

    invoke-direct {v1, p0}, Lcom/tapjoy/TapjoyReEngagementAd$1;-><init>(Lcom/tapjoy/TapjoyReEngagementAd;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 102
    return-void
.end method

.method public showReEngagementFullScreenAd()V
    .locals 3

    .prologue
    .line 111
    const-string v1, "Re-engagement"

    const-string v2, "Displaying Re-engagement ad..."

    invoke-static {v1, v2}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 113
    sget-object v1, Lcom/tapjoy/TapjoyReEngagementAd;->htmlData:Ljava/lang/String;

    if-eqz v1, :cond_0

    sget-object v1, Lcom/tapjoy/TapjoyReEngagementAd;->htmlData:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_0

    .line 115
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/tapjoy/TapjoyReEngagementAd;->context:Landroid/content/Context;

    const-class v2, Lcom/tapjoy/TapjoyReEngagementAdWebView;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 116
    .local v0, "intent":Landroid/content/Intent;
    const/high16 v1, 0x10000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 117
    const-string v1, "RE_ENGAGEMENT_HTML_DATA"

    sget-object v2, Lcom/tapjoy/TapjoyReEngagementAd;->htmlData:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 118
    iget-object v1, p0, Lcom/tapjoy/TapjoyReEngagementAd;->context:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 120
    .end local v0    # "intent":Landroid/content/Intent;
    :cond_0
    return-void
.end method
