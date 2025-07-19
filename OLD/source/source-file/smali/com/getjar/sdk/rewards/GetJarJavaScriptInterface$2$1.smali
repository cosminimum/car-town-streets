.class Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$2$1;
.super Ljava/lang/Object;
.source "GetJarJavaScriptInterface.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$2;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$2;

.field final synthetic val$offers:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$2;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 438
    iput-object p1, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$2$1;->this$1:Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$2;

    iput-object p2, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$2$1;->val$offers:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .prologue
    .line 443
    :try_start_0
    iget-object v3, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$2$1;->this$1:Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$2;

    iget-object v3, v3, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$2;->this$0:Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;

    iget-object v3, v3, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_parentActivity:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-virtual {v3}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->getParentActivity()Landroid/app/Activity;

    move-result-object v3

    const v4, 0x1020002

    invoke-virtual {v3, v4}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/FrameLayout;

    .line 444
    .local v1, "mFrame":Landroid/widget/FrameLayout;
    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/webkit/WebView;

    .line 445
    .local v2, "mWebView":Landroid/webkit/WebView;
    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "javascript:GJ.receivedGoldOffers(%s)"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    iget-object v7, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$2$1;->val$offers:Ljava/lang/String;

    aput-object v7, v5, v6

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 451
    .end local v1    # "mFrame":Landroid/widget/FrameLayout;
    .end local v2    # "mWebView":Landroid/webkit/WebView;
    :goto_0
    return-void

    .line 446
    :catch_0
    move-exception v0

    .line 449
    .local v0, "e":Ljava/lang/Exception;
    sget-object v3, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    sget-object v5, Lcom/getjar/sdk/logging/Area;->BUY_GOLD:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    const-string v5, "JavaScriptAPI: requestGoldOffers() failed"

    invoke-static {v3, v4, v5, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
