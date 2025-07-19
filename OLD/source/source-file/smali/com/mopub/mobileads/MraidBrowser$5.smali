.class Lcom/mopub/mobileads/MraidBrowser$5;
.super Ljava/lang/Object;
.source "MraidBrowser.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mopub/mobileads/MraidBrowser;->initializeButtons(Landroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mopub/mobileads/MraidBrowser;


# direct methods
.method constructor <init>(Lcom/mopub/mobileads/MraidBrowser;)V
    .locals 0

    .prologue
    .line 120
    iput-object p1, p0, Lcom/mopub/mobileads/MraidBrowser$5;->this$0:Lcom/mopub/mobileads/MraidBrowser;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 122
    iget-object v1, p0, Lcom/mopub/mobileads/MraidBrowser$5;->this$0:Lcom/mopub/mobileads/MraidBrowser;

    sget v2, Lcom/mopub/mobileads/R$id;->webView:I

    invoke-virtual {v1, v2}, Lcom/mopub/mobileads/MraidBrowser;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/webkit/WebView;

    .line 123
    .local v0, "webView":Landroid/webkit/WebView;
    invoke-virtual {v0}, Landroid/webkit/WebView;->reload()V

    .line 124
    return-void
.end method
