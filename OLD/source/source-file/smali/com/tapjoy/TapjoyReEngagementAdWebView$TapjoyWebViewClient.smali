.class Lcom/tapjoy/TapjoyReEngagementAdWebView$TapjoyWebViewClient;
.super Landroid/webkit/WebViewClient;
.source "TapjoyReEngagementAdWebView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tapjoy/TapjoyReEngagementAdWebView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "TapjoyWebViewClient"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tapjoy/TapjoyReEngagementAdWebView;


# direct methods
.method private constructor <init>(Lcom/tapjoy/TapjoyReEngagementAdWebView;)V
    .locals 0

    .prologue
    .line 134
    iput-object p1, p0, Lcom/tapjoy/TapjoyReEngagementAdWebView$TapjoyWebViewClient;->this$0:Lcom/tapjoy/TapjoyReEngagementAdWebView;

    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/tapjoy/TapjoyReEngagementAdWebView;Lcom/tapjoy/TapjoyReEngagementAdWebView$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/tapjoy/TapjoyReEngagementAdWebView;
    .param p2, "x1"    # Lcom/tapjoy/TapjoyReEngagementAdWebView$1;

    .prologue
    .line 134
    invoke-direct {p0, p1}, Lcom/tapjoy/TapjoyReEngagementAdWebView$TapjoyWebViewClient;-><init>(Lcom/tapjoy/TapjoyReEngagementAdWebView;)V

    return-void
.end method


# virtual methods
.method public onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 2
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 145
    iget-object v0, p0, Lcom/tapjoy/TapjoyReEngagementAdWebView$TapjoyWebViewClient;->this$0:Lcom/tapjoy/TapjoyReEngagementAdWebView;

    invoke-static {v0}, Lcom/tapjoy/TapjoyReEngagementAdWebView;->access$300(Lcom/tapjoy/TapjoyReEngagementAdWebView;)Landroid/widget/ProgressBar;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 146
    return-void
.end method

.method public onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 2
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;
    .param p3, "favicon"    # Landroid/graphics/Bitmap;

    .prologue
    .line 138
    iget-object v0, p0, Lcom/tapjoy/TapjoyReEngagementAdWebView$TapjoyWebViewClient;->this$0:Lcom/tapjoy/TapjoyReEngagementAdWebView;

    invoke-static {v0}, Lcom/tapjoy/TapjoyReEngagementAdWebView;->access$300(Lcom/tapjoy/TapjoyReEngagementAdWebView;)Landroid/widget/ProgressBar;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 139
    iget-object v0, p0, Lcom/tapjoy/TapjoyReEngagementAdWebView$TapjoyWebViewClient;->this$0:Lcom/tapjoy/TapjoyReEngagementAdWebView;

    invoke-static {v0}, Lcom/tapjoy/TapjoyReEngagementAdWebView;->access$300(Lcom/tapjoy/TapjoyReEngagementAdWebView;)Landroid/widget/ProgressBar;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/ProgressBar;->bringToFront()V

    .line 140
    return-void
.end method

.method public shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 3
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 153
    const-string v0, "Re-engagement Ad"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "URL = ["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 156
    const-string v0, "http://ok"

    invoke-virtual {p2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 158
    const-string v0, "Re-engagement Ad"

    const-string v1, "dismiss"

    invoke-static {v0, v1}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 159
    iget-object v0, p0, Lcom/tapjoy/TapjoyReEngagementAdWebView$TapjoyWebViewClient;->this$0:Lcom/tapjoy/TapjoyReEngagementAdWebView;

    invoke-static {v0}, Lcom/tapjoy/TapjoyReEngagementAdWebView;->access$400(Lcom/tapjoy/TapjoyReEngagementAdWebView;)V

    .line 162
    :cond_0
    const/4 v0, 0x1

    return v0
.end method
