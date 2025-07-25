.class public Lcom/tapjoy/TapjoyFeaturedAppWebView;
.super Landroid/app/Activity;
.source "TapjoyFeaturedAppWebView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tapjoy/TapjoyFeaturedAppWebView$1;,
        Lcom/tapjoy/TapjoyFeaturedAppWebView$TapjoyWebViewClient;,
        Lcom/tapjoy/TapjoyFeaturedAppWebView$RefreshTask;
    }
.end annotation


# instance fields
.field final TAPJOY_FEATURED_APP:Ljava/lang/String;

.field private fullScreenAdURL:Ljava/lang/String;

.field private progressBar:Landroid/widget/ProgressBar;

.field private resumeCalled:Z

.field private urlParams:Ljava/lang/String;

.field private userID:Ljava/lang/String;

.field private webView:Landroid/webkit/WebView;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 32
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 34
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/tapjoy/TapjoyFeaturedAppWebView;->webView:Landroid/webkit/WebView;

    .line 38
    const-string v0, ""

    iput-object v0, p0, Lcom/tapjoy/TapjoyFeaturedAppWebView;->fullScreenAdURL:Ljava/lang/String;

    .line 39
    const-string v0, ""

    iput-object v0, p0, Lcom/tapjoy/TapjoyFeaturedAppWebView;->userID:Ljava/lang/String;

    .line 40
    const-string v0, ""

    iput-object v0, p0, Lcom/tapjoy/TapjoyFeaturedAppWebView;->urlParams:Ljava/lang/String;

    .line 42
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/tapjoy/TapjoyFeaturedAppWebView;->resumeCalled:Z

    .line 44
    const-string v0, "Full Screen Ad"

    iput-object v0, p0, Lcom/tapjoy/TapjoyFeaturedAppWebView;->TAPJOY_FEATURED_APP:Ljava/lang/String;

    .line 169
    return-void
.end method

.method static synthetic access$200(Lcom/tapjoy/TapjoyFeaturedAppWebView;)Landroid/webkit/WebView;
    .locals 1
    .param p0, "x0"    # Lcom/tapjoy/TapjoyFeaturedAppWebView;

    .prologue
    .line 32
    iget-object v0, p0, Lcom/tapjoy/TapjoyFeaturedAppWebView;->webView:Landroid/webkit/WebView;

    return-object v0
.end method

.method static synthetic access$300(Lcom/tapjoy/TapjoyFeaturedAppWebView;)Landroid/widget/ProgressBar;
    .locals 1
    .param p0, "x0"    # Lcom/tapjoy/TapjoyFeaturedAppWebView;

    .prologue
    .line 32
    iget-object v0, p0, Lcom/tapjoy/TapjoyFeaturedAppWebView;->progressBar:Landroid/widget/ProgressBar;

    return-object v0
.end method

.method static synthetic access$400(Lcom/tapjoy/TapjoyFeaturedAppWebView;)V
    .locals 0
    .param p0, "x0"    # Lcom/tapjoy/TapjoyFeaturedAppWebView;

    .prologue
    .line 32
    invoke-direct {p0}, Lcom/tapjoy/TapjoyFeaturedAppWebView;->showOffers()V

    return-void
.end method

.method static synthetic access$500(Lcom/tapjoy/TapjoyFeaturedAppWebView;)V
    .locals 0
    .param p0, "x0"    # Lcom/tapjoy/TapjoyFeaturedAppWebView;

    .prologue
    .line 32
    invoke-direct {p0}, Lcom/tapjoy/TapjoyFeaturedAppWebView;->finishActivity()V

    return-void
.end method

.method private finishActivity()V
    .locals 0

    .prologue
    .line 243
    invoke-virtual {p0}, Lcom/tapjoy/TapjoyFeaturedAppWebView;->finish()V

    .line 244
    return-void
.end method

.method private showOffers()V
    .locals 4

    .prologue
    .line 228
    const-string v1, "Full Screen Ad"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Showing offers, userID: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/tapjoy/TapjoyFeaturedAppWebView;->userID:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 229
    const-string v1, "Full Screen Ad"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Showing offers, URL PARAMS: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/tapjoy/TapjoyFeaturedAppWebView;->urlParams:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 231
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/tapjoy/TJCOffersWebView;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 232
    .local v0, "offersIntent":Landroid/content/Intent;
    const-string v1, "USER_ID"

    iget-object v2, p0, Lcom/tapjoy/TapjoyFeaturedAppWebView;->userID:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 233
    const-string v1, "URL_PARAMS"

    iget-object v2, p0, Lcom/tapjoy/TapjoyFeaturedAppWebView;->urlParams:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 234
    invoke-virtual {p0, v0}, Lcom/tapjoy/TapjoyFeaturedAppWebView;->startActivity(Landroid/content/Intent;)V

    .line 235
    return-void
.end method


# virtual methods
.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 2
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 102
    invoke-super {p0, p1}, Landroid/app/Activity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 104
    iget-object v1, p0, Lcom/tapjoy/TapjoyFeaturedAppWebView;->webView:Landroid/webkit/WebView;

    if-eqz v1, :cond_0

    .line 108
    new-instance v0, Lcom/tapjoy/TapjoyFeaturedAppWebView$RefreshTask;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/tapjoy/TapjoyFeaturedAppWebView$RefreshTask;-><init>(Lcom/tapjoy/TapjoyFeaturedAppWebView;Lcom/tapjoy/TapjoyFeaturedAppWebView$1;)V

    .line 109
    .local v0, "refreshTask":Lcom/tapjoy/TapjoyFeaturedAppWebView$RefreshTask;
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/tapjoy/TapjoyFeaturedAppWebView$RefreshTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 111
    .end local v0    # "refreshTask":Lcom/tapjoy/TapjoyFeaturedAppWebView$RefreshTask;
    :cond_0
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 11
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v10, 0x0

    const/4 v9, 0x1

    const/4 v8, -0x1

    const/4 v7, -0x2

    .line 51
    invoke-virtual {p0}, Lcom/tapjoy/TapjoyFeaturedAppWebView;->getIntent()Landroid/content/Intent;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    .line 53
    .local v0, "extras":Landroid/os/Bundle;
    const-string v4, "USER_ID"

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/tapjoy/TapjoyFeaturedAppWebView;->userID:Ljava/lang/String;

    .line 55
    const-string v4, "URL_PARAMS"

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/tapjoy/TapjoyFeaturedAppWebView;->urlParams:Ljava/lang/String;

    .line 56
    const-string v4, "FULLSCREEN_AD_URL"

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/tapjoy/TapjoyFeaturedAppWebView;->fullScreenAdURL:Ljava/lang/String;

    .line 57
    iget-object v4, p0, Lcom/tapjoy/TapjoyFeaturedAppWebView;->fullScreenAdURL:Ljava/lang/String;

    const-string v5, " "

    const-string v6, "%20"

    invoke-virtual {v4, v5, v6}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/tapjoy/TapjoyFeaturedAppWebView;->fullScreenAdURL:Ljava/lang/String;

    .line 59
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 60
    invoke-virtual {p0, v9}, Lcom/tapjoy/TapjoyFeaturedAppWebView;->requestWindowFeature(I)Z

    .line 64
    new-instance v1, Landroid/widget/RelativeLayout;

    invoke-direct {v1, p0}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 68
    .local v1, "layout":Landroid/widget/RelativeLayout;
    new-instance v4, Landroid/webkit/WebView;

    invoke-direct {v4, p0}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    iput-object v4, p0, Lcom/tapjoy/TapjoyFeaturedAppWebView;->webView:Landroid/webkit/WebView;

    .line 69
    iget-object v4, p0, Lcom/tapjoy/TapjoyFeaturedAppWebView;->webView:Landroid/webkit/WebView;

    new-instance v5, Lcom/tapjoy/TapjoyFeaturedAppWebView$TapjoyWebViewClient;

    invoke-direct {v5, p0, v10}, Lcom/tapjoy/TapjoyFeaturedAppWebView$TapjoyWebViewClient;-><init>(Lcom/tapjoy/TapjoyFeaturedAppWebView;Lcom/tapjoy/TapjoyFeaturedAppWebView$1;)V

    invoke-virtual {v4, v5}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 71
    iget-object v4, p0, Lcom/tapjoy/TapjoyFeaturedAppWebView;->webView:Landroid/webkit/WebView;

    invoke-virtual {v4}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v3

    .line 72
    .local v3, "webSettings":Landroid/webkit/WebSettings;
    invoke-virtual {v3, v9}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 76
    new-instance v4, Landroid/widget/ProgressBar;

    const v5, 0x101007a

    invoke-direct {v4, p0, v10, v5}, Landroid/widget/ProgressBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    iput-object v4, p0, Lcom/tapjoy/TapjoyFeaturedAppWebView;->progressBar:Landroid/widget/ProgressBar;

    .line 77
    iget-object v4, p0, Lcom/tapjoy/TapjoyFeaturedAppWebView;->progressBar:Landroid/widget/ProgressBar;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 80
    new-instance v2, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v2, v7, v7}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 81
    .local v2, "layoutParams":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v4, 0xd

    invoke-virtual {v2, v4}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 82
    iget-object v4, p0, Lcom/tapjoy/TapjoyFeaturedAppWebView;->progressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v4, v2}, Landroid/widget/ProgressBar;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 85
    iget-object v4, p0, Lcom/tapjoy/TapjoyFeaturedAppWebView;->webView:Landroid/webkit/WebView;

    invoke-virtual {v1, v4, v8, v8}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;II)V

    .line 86
    iget-object v4, p0, Lcom/tapjoy/TapjoyFeaturedAppWebView;->progressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v1, v4}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 87
    invoke-virtual {p0, v1}, Lcom/tapjoy/TapjoyFeaturedAppWebView;->setContentView(Landroid/view/View;)V

    .line 91
    iget-object v4, p0, Lcom/tapjoy/TapjoyFeaturedAppWebView;->webView:Landroid/webkit/WebView;

    iget-object v5, p0, Lcom/tapjoy/TapjoyFeaturedAppWebView;->fullScreenAdURL:Ljava/lang/String;

    invoke-virtual {v4, v5}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 93
    const-string v4, "Full Screen Ad"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Opening Full Screen AD URL = ["

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/tapjoy/TapjoyFeaturedAppWebView;->fullScreenAdURL:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "]"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 94
    return-void
.end method

.method protected onResume()V
    .locals 2

    .prologue
    .line 117
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 120
    iget-boolean v0, p0, Lcom/tapjoy/TapjoyFeaturedAppWebView;->resumeCalled:Z

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/tapjoy/TapjoyConnectCore;->getInstance()Lcom/tapjoy/TapjoyConnectCore;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 122
    const-string v0, "Full Screen Ad"

    const-string v1, "call connect"

    invoke-static {v0, v1}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 123
    invoke-static {}, Lcom/tapjoy/TapjoyConnectCore;->getInstance()Lcom/tapjoy/TapjoyConnectCore;

    move-result-object v0

    invoke-virtual {v0}, Lcom/tapjoy/TapjoyConnectCore;->callConnect()V

    .line 126
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/tapjoy/TapjoyFeaturedAppWebView;->resumeCalled:Z

    .line 127
    return-void
.end method
