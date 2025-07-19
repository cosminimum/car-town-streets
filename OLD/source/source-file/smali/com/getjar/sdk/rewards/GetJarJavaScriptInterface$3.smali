.class Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$3;
.super Ljava/lang/Object;
.source "GetJarJavaScriptInterface.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->configureWebView(Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;

.field final synthetic val$builtInZoom:Ljava/lang/Boolean;

.field final synthetic val$supportZoom:Ljava/lang/Boolean;

.field final synthetic val$zoomDensity:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 552
    iput-object p1, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$3;->this$0:Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;

    iput-object p2, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$3;->val$builtInZoom:Ljava/lang/Boolean;

    iput-object p3, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$3;->val$supportZoom:Ljava/lang/Boolean;

    iput-object p4, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$3;->val$zoomDensity:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 556
    :try_start_0
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$3;->this$0:Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;

    iget-object v2, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$3;->val$builtInZoom:Ljava/lang/Boolean;

    iget-object v3, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$3;->val$supportZoom:Ljava/lang/Boolean;

    iget-object v4, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$3;->val$zoomDensity:Ljava/lang/String;

    invoke-static {v1, v2, v3, v4}, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->access$000(Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 562
    :goto_0
    return-void

    .line 557
    :catch_0
    move-exception v0

    .line 560
    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "JavaScriptAPI: configureWebView() failed"

    invoke-static {v1, v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
