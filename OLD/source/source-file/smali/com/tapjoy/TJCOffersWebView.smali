.class public Lcom/tapjoy/TJCOffersWebView;
.super Landroid/app/Activity;
.source "TJCOffersWebView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tapjoy/TJCOffersWebView$1;,
        Lcom/tapjoy/TJCOffersWebView$TapjoyWebViewClient;
    }
.end annotation


# instance fields
.field final TAPJOY_OFFERS:Ljava/lang/String;

.field private clientPackage:Ljava/lang/String;

.field private dialog:Landroid/app/Dialog;

.field private offersURL:Ljava/lang/String;

.field private progressBar:Landroid/widget/ProgressBar;

.field private resumeCalled:Z

.field private skipOfferWall:Z

.field private urlParams:Ljava/lang/String;

.field private userID:Ljava/lang/String;

.field private webView:Landroid/webkit/WebView;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 38
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 40
    iput-object v0, p0, Lcom/tapjoy/TJCOffersWebView;->webView:Landroid/webkit/WebView;

    .line 41
    iput-object v0, p0, Lcom/tapjoy/TJCOffersWebView;->offersURL:Ljava/lang/String;

    .line 44
    iput-object v0, p0, Lcom/tapjoy/TJCOffersWebView;->dialog:Landroid/app/Dialog;

    .line 46
    const-string v0, ""

    iput-object v0, p0, Lcom/tapjoy/TJCOffersWebView;->clientPackage:Ljava/lang/String;

    .line 47
    const-string v0, ""

    iput-object v0, p0, Lcom/tapjoy/TJCOffersWebView;->urlParams:Ljava/lang/String;

    .line 48
    const-string v0, ""

    iput-object v0, p0, Lcom/tapjoy/TJCOffersWebView;->userID:Ljava/lang/String;

    .line 50
    const-string v0, "Offers"

    iput-object v0, p0, Lcom/tapjoy/TJCOffersWebView;->TAPJOY_OFFERS:Ljava/lang/String;

    .line 52
    iput-boolean v1, p0, Lcom/tapjoy/TJCOffersWebView;->skipOfferWall:Z

    .line 53
    iput-boolean v1, p0, Lcom/tapjoy/TJCOffersWebView;->resumeCalled:Z

    .line 184
    return-void
.end method

.method static synthetic access$100(Lcom/tapjoy/TJCOffersWebView;)Landroid/widget/ProgressBar;
    .locals 1
    .param p0, "x0"    # Lcom/tapjoy/TJCOffersWebView;

    .prologue
    .line 38
    iget-object v0, p0, Lcom/tapjoy/TJCOffersWebView;->progressBar:Landroid/widget/ProgressBar;

    return-object v0
.end method

.method static synthetic access$200(Lcom/tapjoy/TJCOffersWebView;)Landroid/app/Dialog;
    .locals 1
    .param p0, "x0"    # Lcom/tapjoy/TJCOffersWebView;

    .prologue
    .line 38
    iget-object v0, p0, Lcom/tapjoy/TJCOffersWebView;->dialog:Landroid/app/Dialog;

    return-object v0
.end method

.method static synthetic access$202(Lcom/tapjoy/TJCOffersWebView;Landroid/app/Dialog;)Landroid/app/Dialog;
    .locals 0
    .param p0, "x0"    # Lcom/tapjoy/TJCOffersWebView;
    .param p1, "x1"    # Landroid/app/Dialog;

    .prologue
    .line 38
    iput-object p1, p0, Lcom/tapjoy/TJCOffersWebView;->dialog:Landroid/app/Dialog;

    return-object p1
.end method

.method static synthetic access$300(Lcom/tapjoy/TJCOffersWebView;)Z
    .locals 1
    .param p0, "x0"    # Lcom/tapjoy/TJCOffersWebView;

    .prologue
    .line 38
    iget-boolean v0, p0, Lcom/tapjoy/TJCOffersWebView;->skipOfferWall:Z

    return v0
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 12
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v11, 0x0

    const/4 v10, 0x0

    const/4 v9, -0x1

    const/4 v8, -0x2

    const/4 v7, 0x1

    .line 59
    invoke-virtual {p0}, Lcom/tapjoy/TJCOffersWebView;->getIntent()Landroid/content/Intent;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    .line 62
    .local v0, "extras":Landroid/os/Bundle;
    if-eqz v0, :cond_2

    .line 65
    const-string v4, "DISPLAY_AD_URL"

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_0

    .line 67
    iput-boolean v7, p0, Lcom/tapjoy/TJCOffersWebView;->skipOfferWall:Z

    .line 68
    const-string v4, "DISPLAY_AD_URL"

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/tapjoy/TJCOffersWebView;->offersURL:Ljava/lang/String;

    .line 98
    :goto_0
    iget-object v4, p0, Lcom/tapjoy/TJCOffersWebView;->offersURL:Ljava/lang/String;

    const-string v5, " "

    const-string v6, "%20"

    invoke-virtual {v4, v5, v6}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/tapjoy/TJCOffersWebView;->offersURL:Ljava/lang/String;

    .line 101
    invoke-static {}, Lcom/tapjoy/TapjoyConnectCore;->getClientPackage()Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/tapjoy/TJCOffersWebView;->clientPackage:Ljava/lang/String;

    .line 103
    const-string v4, "Offers"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "clientPackage: ["

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/tapjoy/TJCOffersWebView;->clientPackage:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "]"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 105
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 106
    invoke-virtual {p0, v7}, Lcom/tapjoy/TJCOffersWebView;->requestWindowFeature(I)Z

    .line 110
    new-instance v1, Landroid/widget/RelativeLayout;

    invoke-direct {v1, p0}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 114
    .local v1, "layout":Landroid/widget/RelativeLayout;
    new-instance v4, Landroid/webkit/WebView;

    invoke-direct {v4, p0}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    iput-object v4, p0, Lcom/tapjoy/TJCOffersWebView;->webView:Landroid/webkit/WebView;

    .line 115
    iget-object v4, p0, Lcom/tapjoy/TJCOffersWebView;->webView:Landroid/webkit/WebView;

    new-instance v5, Lcom/tapjoy/TJCOffersWebView$TapjoyWebViewClient;

    invoke-direct {v5, p0, v11}, Lcom/tapjoy/TJCOffersWebView$TapjoyWebViewClient;-><init>(Lcom/tapjoy/TJCOffersWebView;Lcom/tapjoy/TJCOffersWebView$1;)V

    invoke-virtual {v4, v5}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 117
    iget-object v4, p0, Lcom/tapjoy/TJCOffersWebView;->webView:Landroid/webkit/WebView;

    invoke-virtual {v4}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v3

    .line 118
    .local v3, "webSettings":Landroid/webkit/WebSettings;
    invoke-virtual {v3, v7}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 122
    new-instance v4, Landroid/widget/ProgressBar;

    const v5, 0x101007a

    invoke-direct {v4, p0, v11, v5}, Landroid/widget/ProgressBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    iput-object v4, p0, Lcom/tapjoy/TJCOffersWebView;->progressBar:Landroid/widget/ProgressBar;

    .line 123
    iget-object v4, p0, Lcom/tapjoy/TJCOffersWebView;->progressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v4, v10}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 126
    new-instance v2, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v2, v8, v8}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 127
    .local v2, "layoutParams":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v4, 0xd

    invoke-virtual {v2, v4}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 128
    iget-object v4, p0, Lcom/tapjoy/TJCOffersWebView;->progressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v4, v2}, Landroid/widget/ProgressBar;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 131
    iget-object v4, p0, Lcom/tapjoy/TJCOffersWebView;->webView:Landroid/webkit/WebView;

    invoke-virtual {v1, v4, v9, v9}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;II)V

    .line 132
    iget-object v4, p0, Lcom/tapjoy/TJCOffersWebView;->progressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v1, v4}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 133
    invoke-virtual {p0, v1}, Lcom/tapjoy/TJCOffersWebView;->setContentView(Landroid/view/View;)V

    .line 137
    iget-object v4, p0, Lcom/tapjoy/TJCOffersWebView;->webView:Landroid/webkit/WebView;

    iget-object v5, p0, Lcom/tapjoy/TJCOffersWebView;->offersURL:Ljava/lang/String;

    invoke-virtual {v4, v5}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 139
    const-string v4, "Offers"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Opening URL = ["

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/tapjoy/TJCOffersWebView;->offersURL:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "]"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 140
    return-void

    .line 73
    .end local v1    # "layout":Landroid/widget/RelativeLayout;
    .end local v2    # "layoutParams":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v3    # "webSettings":Landroid/webkit/WebSettings;
    :cond_0
    iput-boolean v10, p0, Lcom/tapjoy/TJCOffersWebView;->skipOfferWall:Z

    .line 75
    const-string v4, "URL_PARAMS"

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/tapjoy/TJCOffersWebView;->urlParams:Ljava/lang/String;

    .line 76
    const-string v4, "USER_ID"

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/tapjoy/TJCOffersWebView;->userID:Ljava/lang/String;

    .line 79
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/tapjoy/TJCOffersWebView;->urlParams:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "&publisher_user_id="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/tapjoy/TJCOffersWebView;->userID:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/tapjoy/TJCOffersWebView;->urlParams:Ljava/lang/String;

    .line 82
    invoke-static {}, Lcom/tapjoy/TapjoyConnectCore;->getVideoParams()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_1

    .line 84
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/tapjoy/TJCOffersWebView;->urlParams:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "&"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {}, Lcom/tapjoy/TapjoyConnectCore;->getVideoParams()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/tapjoy/TJCOffersWebView;->urlParams:Ljava/lang/String;

    .line 87
    :cond_1
    const-string v4, "Offers"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "urlParams: ["

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/tapjoy/TJCOffersWebView;->urlParams:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "]"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 90
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "https://ws.tapjoyads.com/get_offers/webpage?"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/tapjoy/TJCOffersWebView;->urlParams:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/tapjoy/TJCOffersWebView;->offersURL:Ljava/lang/String;

    goto/16 :goto_0

    .line 95
    :cond_2
    const-string v4, "Offers"

    const-string v5, "Tapjoy offers meta data initialization fail."

    invoke-static {v4, v5}, Lcom/tapjoy/TapjoyLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0
.end method

.method protected onDestroy()V
    .locals 2

    .prologue
    .line 168
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 170
    iget-object v0, p0, Lcom/tapjoy/TJCOffersWebView;->webView:Landroid/webkit/WebView;

    if-eqz v0, :cond_0

    .line 174
    iget-object v0, p0, Lcom/tapjoy/TJCOffersWebView;->webView:Landroid/webkit/WebView;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->clearCache(Z)V

    .line 175
    iget-object v0, p0, Lcom/tapjoy/TJCOffersWebView;->webView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->destroyDrawingCache()V

    .line 176
    iget-object v0, p0, Lcom/tapjoy/TJCOffersWebView;->webView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->destroy()V

    .line 178
    :cond_0
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 1
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 349
    const/4 v0, 0x4

    if-ne p1, v0, :cond_0

    iget-object v0, p0, Lcom/tapjoy/TJCOffersWebView;->webView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->canGoBack()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 351
    iget-object v0, p0, Lcom/tapjoy/TJCOffersWebView;->webView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->goBack()V

    .line 352
    const/4 v0, 0x1

    .line 354
    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_0
.end method

.method protected onResume()V
    .locals 2

    .prologue
    .line 148
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 151
    iget-object v0, p0, Lcom/tapjoy/TJCOffersWebView;->offersURL:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/tapjoy/TJCOffersWebView;->webView:Landroid/webkit/WebView;

    if-eqz v0, :cond_0

    .line 152
    iget-object v0, p0, Lcom/tapjoy/TJCOffersWebView;->webView:Landroid/webkit/WebView;

    iget-object v1, p0, Lcom/tapjoy/TJCOffersWebView;->offersURL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 155
    :cond_0
    iget-boolean v0, p0, Lcom/tapjoy/TJCOffersWebView;->resumeCalled:Z

    if-eqz v0, :cond_1

    invoke-static {}, Lcom/tapjoy/TapjoyConnectCore;->getInstance()Lcom/tapjoy/TapjoyConnectCore;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 157
    const-string v0, "Offers"

    const-string v1, "call connect"

    invoke-static {v0, v1}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 158
    invoke-static {}, Lcom/tapjoy/TapjoyConnectCore;->getInstance()Lcom/tapjoy/TapjoyConnectCore;

    move-result-object v0

    invoke-virtual {v0}, Lcom/tapjoy/TapjoyConnectCore;->callConnect()V

    .line 161
    :cond_1
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/tapjoy/TJCOffersWebView;->resumeCalled:Z

    .line 162
    return-void
.end method
