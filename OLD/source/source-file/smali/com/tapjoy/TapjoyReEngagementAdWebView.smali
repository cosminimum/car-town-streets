.class public Lcom/tapjoy/TapjoyReEngagementAdWebView;
.super Landroid/app/Activity;
.source "TapjoyReEngagementAdWebView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tapjoy/TapjoyReEngagementAdWebView$1;,
        Lcom/tapjoy/TapjoyReEngagementAdWebView$TapjoyWebViewClient;,
        Lcom/tapjoy/TapjoyReEngagementAdWebView$RefreshTask;
    }
.end annotation


# instance fields
.field final TAPJOY_RE_ENGAGEMENT_AD:Ljava/lang/String;

.field private htmlRawData:Ljava/lang/String;

.field private progressBar:Landroid/widget/ProgressBar;

.field private webView:Landroid/webkit/WebView;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 27
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 29
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/tapjoy/TapjoyReEngagementAdWebView;->webView:Landroid/webkit/WebView;

    .line 32
    const-string v0, ""

    iput-object v0, p0, Lcom/tapjoy/TapjoyReEngagementAdWebView;->htmlRawData:Ljava/lang/String;

    .line 34
    const-string v0, "Re-engagement Ad"

    iput-object v0, p0, Lcom/tapjoy/TapjoyReEngagementAdWebView;->TAPJOY_RE_ENGAGEMENT_AD:Ljava/lang/String;

    .line 134
    return-void
.end method

.method static synthetic access$200(Lcom/tapjoy/TapjoyReEngagementAdWebView;)Landroid/webkit/WebView;
    .locals 1
    .param p0, "x0"    # Lcom/tapjoy/TapjoyReEngagementAdWebView;

    .prologue
    .line 27
    iget-object v0, p0, Lcom/tapjoy/TapjoyReEngagementAdWebView;->webView:Landroid/webkit/WebView;

    return-object v0
.end method

.method static synthetic access$300(Lcom/tapjoy/TapjoyReEngagementAdWebView;)Landroid/widget/ProgressBar;
    .locals 1
    .param p0, "x0"    # Lcom/tapjoy/TapjoyReEngagementAdWebView;

    .prologue
    .line 27
    iget-object v0, p0, Lcom/tapjoy/TapjoyReEngagementAdWebView;->progressBar:Landroid/widget/ProgressBar;

    return-object v0
.end method

.method static synthetic access$400(Lcom/tapjoy/TapjoyReEngagementAdWebView;)V
    .locals 0
    .param p0, "x0"    # Lcom/tapjoy/TapjoyReEngagementAdWebView;

    .prologue
    .line 27
    invoke-direct {p0}, Lcom/tapjoy/TapjoyReEngagementAdWebView;->finishActivity()V

    return-void
.end method

.method private finishActivity()V
    .locals 0

    .prologue
    .line 172
    invoke-virtual {p0}, Lcom/tapjoy/TapjoyReEngagementAdWebView;->finish()V

    .line 173
    return-void
.end method


# virtual methods
.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 2
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 83
    invoke-super {p0, p1}, Landroid/app/Activity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 85
    iget-object v1, p0, Lcom/tapjoy/TapjoyReEngagementAdWebView;->webView:Landroid/webkit/WebView;

    if-eqz v1, :cond_0

    .line 89
    new-instance v0, Lcom/tapjoy/TapjoyReEngagementAdWebView$RefreshTask;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/tapjoy/TapjoyReEngagementAdWebView$RefreshTask;-><init>(Lcom/tapjoy/TapjoyReEngagementAdWebView;Lcom/tapjoy/TapjoyReEngagementAdWebView$1;)V

    .line 90
    .local v0, "refreshTask":Lcom/tapjoy/TapjoyReEngagementAdWebView$RefreshTask;
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/tapjoy/TapjoyReEngagementAdWebView$RefreshTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 92
    .end local v0    # "refreshTask":Lcom/tapjoy/TapjoyReEngagementAdWebView$RefreshTask;
    :cond_0
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 10
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v4, 0x1

    const/4 v3, -0x1

    const/4 v2, -0x2

    const/4 v5, 0x0

    .line 41
    invoke-virtual {p0}, Lcom/tapjoy/TapjoyReEngagementAdWebView;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v6

    .line 43
    .local v6, "extras":Landroid/os/Bundle;
    const-string v0, "RE_ENGAGEMENT_HTML_DATA"

    invoke-virtual {v6, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/tapjoy/TapjoyReEngagementAdWebView;->htmlRawData:Ljava/lang/String;

    .line 45
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 46
    invoke-virtual {p0, v4}, Lcom/tapjoy/TapjoyReEngagementAdWebView;->requestWindowFeature(I)Z

    .line 48
    new-instance v7, Landroid/widget/RelativeLayout;

    invoke-direct {v7, p0}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 51
    .local v7, "layout":Landroid/widget/RelativeLayout;
    new-instance v0, Landroid/webkit/WebView;

    invoke-direct {v0, p0}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/tapjoy/TapjoyReEngagementAdWebView;->webView:Landroid/webkit/WebView;

    .line 52
    iget-object v0, p0, Lcom/tapjoy/TapjoyReEngagementAdWebView;->webView:Landroid/webkit/WebView;

    new-instance v1, Lcom/tapjoy/TapjoyReEngagementAdWebView$TapjoyWebViewClient;

    invoke-direct {v1, p0, v5}, Lcom/tapjoy/TapjoyReEngagementAdWebView$TapjoyWebViewClient;-><init>(Lcom/tapjoy/TapjoyReEngagementAdWebView;Lcom/tapjoy/TapjoyReEngagementAdWebView$1;)V

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 54
    iget-object v0, p0, Lcom/tapjoy/TapjoyReEngagementAdWebView;->webView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v9

    .line 55
    .local v9, "webSettings":Landroid/webkit/WebSettings;
    invoke-virtual {v9, v4}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 58
    new-instance v0, Landroid/widget/ProgressBar;

    const v1, 0x101007a

    invoke-direct {v0, p0, v5, v1}, Landroid/widget/ProgressBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    iput-object v0, p0, Lcom/tapjoy/TapjoyReEngagementAdWebView;->progressBar:Landroid/widget/ProgressBar;

    .line 59
    iget-object v0, p0, Lcom/tapjoy/TapjoyReEngagementAdWebView;->progressBar:Landroid/widget/ProgressBar;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 62
    new-instance v8, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v8, v2, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 63
    .local v8, "layoutParams":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v0, 0xd

    invoke-virtual {v8, v0}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 64
    iget-object v0, p0, Lcom/tapjoy/TapjoyReEngagementAdWebView;->progressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v0, v8}, Landroid/widget/ProgressBar;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 67
    iget-object v0, p0, Lcom/tapjoy/TapjoyReEngagementAdWebView;->webView:Landroid/webkit/WebView;

    invoke-virtual {v7, v0, v3, v3}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;II)V

    .line 68
    iget-object v0, p0, Lcom/tapjoy/TapjoyReEngagementAdWebView;->progressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v7, v0}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 69
    invoke-virtual {p0, v7}, Lcom/tapjoy/TapjoyReEngagementAdWebView;->setContentView(Landroid/view/View;)V

    .line 72
    iget-object v0, p0, Lcom/tapjoy/TapjoyReEngagementAdWebView;->webView:Landroid/webkit/WebView;

    const-string v1, "https://ws.tapjoyads.com/"

    iget-object v2, p0, Lcom/tapjoy/TapjoyReEngagementAdWebView;->htmlRawData:Ljava/lang/String;

    const-string v3, "text/html"

    const-string v4, "utf-8"

    invoke-virtual/range {v0 .. v5}, Landroid/webkit/WebView;->loadDataWithBaseURL(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    const-string v0, "Re-engagement Ad"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Opening Re-engagement ad = ["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/tapjoy/TapjoyReEngagementAdWebView;->htmlRawData:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 75
    return-void
.end method
