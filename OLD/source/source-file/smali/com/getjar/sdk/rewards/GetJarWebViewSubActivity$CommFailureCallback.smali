.class Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$CommFailureCallback;
.super Ljava/lang/Object;
.source "GetJarWebViewSubActivity.java"

# interfaces
.implements Lcom/getjar/sdk/comm/CommFailureCallbackInterface;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CommFailureCallback"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;


# direct methods
.method private constructor <init>(Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;)V
    .locals 0

    .prologue
    .line 1363
    iput-object p1, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$CommFailureCallback;->this$0:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;
    .param p2, "x1"    # Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$1;

    .prologue
    .line 1363
    invoke-direct {p0, p1}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$CommFailureCallback;-><init>(Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;)V

    return-void
.end method


# virtual methods
.method public authorizationFailure(Ljava/lang/String;)V
    .locals 2
    .param p1, "subcode"    # Ljava/lang/String;

    .prologue
    .line 1373
    iget-object v0, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$CommFailureCallback;->this$0:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-virtual {v0}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->waitDialogHide()V

    .line 1374
    sget-object v0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorType;->AUTH:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorType;

    invoke-static {}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->access$500()Landroid/webkit/WebView;

    move-result-object v1

    invoke-static {v0, p1, v1}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->loadErrorPage(Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorType;Ljava/lang/String;Landroid/webkit/WebView;)V

    .line 1375
    return-void
.end method

.method public networkFailure()V
    .locals 3

    .prologue
    .line 1367
    iget-object v0, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$CommFailureCallback;->this$0:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-virtual {v0}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->waitDialogHide()V

    .line 1368
    sget-object v0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorType;->NETWORK:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorType;

    const-string v1, ""

    invoke-static {}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->access$500()Landroid/webkit/WebView;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->loadErrorPage(Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorType;Ljava/lang/String;Landroid/webkit/WebView;)V

    .line 1369
    return-void
.end method

.method public serviceFailure(Lcom/getjar/sdk/comm/Result;)V
    .locals 3
    .param p1, "result"    # Lcom/getjar/sdk/comm/Result;

    .prologue
    .line 1379
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$CommFailureCallback;->this$0:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-virtual {v1}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->waitDialogHide()V

    .line 1380
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/Result;->getResponseCode()I

    move-result v1

    const/16 v2, 0x1f4

    if-lt v1, v2, :cond_1

    invoke-virtual {p1}, Lcom/getjar/sdk/comm/Result;->getResponseCode()I

    move-result v1

    const/16 v2, 0x258

    if-ge v1, v2, :cond_1

    .line 1381
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/Result;->getErrorResponseSubcode()Ljava/lang/String;

    move-result-object v0

    .line 1382
    .local v0, "subcode":Ljava/lang/String;
    invoke-static {v0}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1383
    const-string v0, ""

    .line 1385
    :cond_0
    sget-object v1, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorType;->SERVICE:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorType;

    invoke-static {}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->access$500()Landroid/webkit/WebView;

    move-result-object v2

    invoke-static {v1, v0, v2}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->loadErrorPage(Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorType;Ljava/lang/String;Landroid/webkit/WebView;)V

    .line 1388
    .end local v0    # "subcode":Ljava/lang/String;
    :cond_1
    return-void
.end method
