.class Lcom/mopub/mobileads/MraidView$MraidWebViewClient;
.super Landroid/webkit/WebViewClient;
.source "MraidView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mopub/mobileads/MraidView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MraidWebViewClient"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mopub/mobileads/MraidView;


# direct methods
.method private constructor <init>(Lcom/mopub/mobileads/MraidView;)V
    .locals 0

    .prologue
    .line 328
    iput-object p1, p0, Lcom/mopub/mobileads/MraidView$MraidWebViewClient;->this$0:Lcom/mopub/mobileads/MraidView;

    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/mopub/mobileads/MraidView;Lcom/mopub/mobileads/MraidView$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/mopub/mobileads/MraidView;
    .param p2, "x1"    # Lcom/mopub/mobileads/MraidView$1;

    .prologue
    .line 328
    invoke-direct {p0, p1}, Lcom/mopub/mobileads/MraidView$MraidWebViewClient;-><init>(Lcom/mopub/mobileads/MraidView;)V

    return-void
.end method


# virtual methods
.method public onLoadResource(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 3
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 374
    const-string v0, "MraidView"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Loaded resource: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 375
    return-void
.end method

.method public onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 2
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 362
    iget-object v0, p0, Lcom/mopub/mobileads/MraidView$MraidWebViewClient;->this$0:Lcom/mopub/mobileads/MraidView;

    invoke-static {v0}, Lcom/mopub/mobileads/MraidView;->access$900(Lcom/mopub/mobileads/MraidView;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 363
    iget-object v0, p0, Lcom/mopub/mobileads/MraidView$MraidWebViewClient;->this$0:Lcom/mopub/mobileads/MraidView;

    invoke-static {v0}, Lcom/mopub/mobileads/MraidView;->access$1000(Lcom/mopub/mobileads/MraidView;)Lcom/mopub/mobileads/MraidDisplayController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mopub/mobileads/MraidDisplayController;->initializeJavaScriptState()V

    .line 364
    iget-object v0, p0, Lcom/mopub/mobileads/MraidView$MraidWebViewClient;->this$0:Lcom/mopub/mobileads/MraidView;

    iget-object v1, p0, Lcom/mopub/mobileads/MraidView$MraidWebViewClient;->this$0:Lcom/mopub/mobileads/MraidView;

    invoke-static {v1}, Lcom/mopub/mobileads/MraidView;->access$1100(Lcom/mopub/mobileads/MraidView;)Lcom/mopub/mobileads/MraidView$PlacementType;

    move-result-object v1

    invoke-static {v1}, Lcom/mopub/mobileads/MraidPlacementTypeProperty;->createWithType(Lcom/mopub/mobileads/MraidView$PlacementType;)Lcom/mopub/mobileads/MraidPlacementTypeProperty;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/mopub/mobileads/MraidView;->fireChangeEventForProperty(Lcom/mopub/mobileads/MraidProperty;)V

    .line 366
    iget-object v0, p0, Lcom/mopub/mobileads/MraidView$MraidWebViewClient;->this$0:Lcom/mopub/mobileads/MraidView;

    invoke-virtual {v0}, Lcom/mopub/mobileads/MraidView;->fireReadyEvent()V

    .line 367
    iget-object v0, p0, Lcom/mopub/mobileads/MraidView$MraidWebViewClient;->this$0:Lcom/mopub/mobileads/MraidView;

    invoke-virtual {v0}, Lcom/mopub/mobileads/MraidView;->getOnReadyListener()Lcom/mopub/mobileads/MraidView$OnReadyListener;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mopub/mobileads/MraidView$MraidWebViewClient;->this$0:Lcom/mopub/mobileads/MraidView;

    invoke-virtual {v0}, Lcom/mopub/mobileads/MraidView;->getOnReadyListener()Lcom/mopub/mobileads/MraidView$OnReadyListener;

    move-result-object v0

    iget-object v1, p0, Lcom/mopub/mobileads/MraidView$MraidWebViewClient;->this$0:Lcom/mopub/mobileads/MraidView;

    invoke-interface {v0, v1}, Lcom/mopub/mobileads/MraidView$OnReadyListener;->onReady(Lcom/mopub/mobileads/MraidView;)V

    .line 368
    :cond_0
    iget-object v0, p0, Lcom/mopub/mobileads/MraidView$MraidWebViewClient;->this$0:Lcom/mopub/mobileads/MraidView;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/mopub/mobileads/MraidView;->access$902(Lcom/mopub/mobileads/MraidView;Z)Z

    .line 370
    :cond_1
    return-void
.end method

.method public onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "errorCode"    # I
    .param p3, "description"    # Ljava/lang/String;
    .param p4, "failingUrl"    # Ljava/lang/String;

    .prologue
    .line 332
    const-string v0, "MraidView"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Error: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 333
    invoke-super {p0, p1, p2, p3, p4}, Landroid/webkit/WebViewClient;->onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V

    .line 334
    return-void
.end method

.method public shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 7
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x1

    .line 338
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    .line 339
    .local v3, "uri":Landroid/net/Uri;
    invoke-virtual {v3}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v2

    .line 341
    .local v2, "scheme":Ljava/lang/String;
    const-string v5, "mopub"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 356
    :goto_0
    return v4

    .line 342
    :cond_0
    const-string v5, "mraid"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 343
    iget-object v5, p0, Lcom/mopub/mobileads/MraidView$MraidWebViewClient;->this$0:Lcom/mopub/mobileads/MraidView;

    invoke-static {p2}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/mopub/mobileads/MraidView;->access$800(Lcom/mopub/mobileads/MraidView;Ljava/net/URI;)Z

    goto :goto_0

    .line 347
    :cond_1
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 348
    .local v1, "i":Landroid/content/Intent;
    const-string v5, "android.intent.action.VIEW"

    invoke-virtual {v1, v5}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 349
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    invoke-virtual {v1, v5}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 350
    const/high16 v5, 0x10000000

    invoke-virtual {v1, v5}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 353
    :try_start_0
    iget-object v5, p0, Lcom/mopub/mobileads/MraidView$MraidWebViewClient;->this$0:Lcom/mopub/mobileads/MraidView;

    invoke-virtual {v5}, Lcom/mopub/mobileads/MraidView;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 355
    :catch_0
    move-exception v0

    .line 356
    .local v0, "e":Landroid/content/ActivityNotFoundException;
    const/4 v4, 0x0

    goto :goto_0
.end method
