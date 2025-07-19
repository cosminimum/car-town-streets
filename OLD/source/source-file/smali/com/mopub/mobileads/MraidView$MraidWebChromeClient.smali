.class Lcom/mopub/mobileads/MraidView$MraidWebChromeClient;
.super Landroid/webkit/WebChromeClient;
.source "MraidView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mopub/mobileads/MraidView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MraidWebChromeClient"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mopub/mobileads/MraidView;


# direct methods
.method private constructor <init>(Lcom/mopub/mobileads/MraidView;)V
    .locals 0

    .prologue
    .line 378
    iput-object p1, p0, Lcom/mopub/mobileads/MraidView$MraidWebChromeClient;->this$0:Lcom/mopub/mobileads/MraidView;

    invoke-direct {p0}, Landroid/webkit/WebChromeClient;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/mopub/mobileads/MraidView;Lcom/mopub/mobileads/MraidView$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/mopub/mobileads/MraidView;
    .param p2, "x1"    # Lcom/mopub/mobileads/MraidView$1;

    .prologue
    .line 378
    invoke-direct {p0, p1}, Lcom/mopub/mobileads/MraidView$MraidWebChromeClient;-><init>(Lcom/mopub/mobileads/MraidView;)V

    return-void
.end method


# virtual methods
.method public onJsAlert(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsResult;)Z
    .locals 1
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;
    .param p3, "message"    # Ljava/lang/String;
    .param p4, "result"    # Landroid/webkit/JsResult;

    .prologue
    .line 381
    const-string v0, "MraidView"

    invoke-static {v0, p3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 382
    const/4 v0, 0x0

    return v0
.end method
