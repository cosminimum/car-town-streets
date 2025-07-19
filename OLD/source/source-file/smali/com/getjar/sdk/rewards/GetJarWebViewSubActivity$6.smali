.class final Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$6;
.super Ljava/lang/Object;
.source "GetJarWebViewSubActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->loadUrlInWebView(Landroid/webkit/WebView;Ljava/lang/String;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$clearHistory:Z

.field final synthetic val$url:Ljava/lang/String;

.field final synthetic val$webView:Landroid/webkit/WebView;


# direct methods
.method constructor <init>(Landroid/webkit/WebView;Ljava/lang/String;Z)V
    .locals 0

    .prologue
    .line 759
    iput-object p1, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$6;->val$webView:Landroid/webkit/WebView;

    iput-object p2, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$6;->val$url:Ljava/lang/String;

    iput-boolean p3, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$6;->val$clearHistory:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 764
    :try_start_0
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$6;->val$webView:Landroid/webkit/WebView;

    iget-object v2, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$6;->val$url:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 767
    iget-boolean v1, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$6;->val$clearHistory:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    if-eqz v1, :cond_0

    .line 768
    :try_start_1
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$6;->val$webView:Landroid/webkit/WebView;

    invoke-virtual {v1}, Landroid/webkit/WebView;->clearHistory()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 774
    :cond_0
    :goto_0
    return-void

    .line 768
    :catch_0
    move-exception v0

    .local v0, "e":Ljava/lang/Exception;
    :try_start_2
    sget-object v1, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    const-string v3, "WebView.clearHistory() failed"

    invoke-static {v1, v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    .line 771
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v0

    .line 772
    .restart local v0    # "e":Ljava/lang/Exception;
    sget-object v1, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    const-string v3, "loadUrlInWebView() failed"

    invoke-static {v1, v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
