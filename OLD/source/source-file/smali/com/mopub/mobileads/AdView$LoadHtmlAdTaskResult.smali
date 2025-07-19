.class Lcom/mopub/mobileads/AdView$LoadHtmlAdTaskResult;
.super Lcom/mopub/mobileads/AdView$LoadUrlTaskResult;
.source "AdView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mopub/mobileads/AdView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "LoadHtmlAdTaskResult"
.end annotation


# instance fields
.field protected mData:Ljava/lang/String;


# direct methods
.method private constructor <init>(Lcom/mopub/mobileads/AdView;Ljava/lang/String;)V
    .locals 0
    .param p1, "adView"    # Lcom/mopub/mobileads/AdView;
    .param p2, "data"    # Ljava/lang/String;

    .prologue
    .line 808
    invoke-direct {p0, p1}, Lcom/mopub/mobileads/AdView$LoadUrlTaskResult;-><init>(Lcom/mopub/mobileads/AdView;)V

    .line 809
    iput-object p2, p0, Lcom/mopub/mobileads/AdView$LoadHtmlAdTaskResult;->mData:Ljava/lang/String;

    .line 810
    return-void
.end method

.method synthetic constructor <init>(Lcom/mopub/mobileads/AdView;Ljava/lang/String;Lcom/mopub/mobileads/AdView$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/mopub/mobileads/AdView;
    .param p2, "x1"    # Ljava/lang/String;
    .param p3, "x2"    # Lcom/mopub/mobileads/AdView$1;

    .prologue
    .line 804
    invoke-direct {p0, p1, p2}, Lcom/mopub/mobileads/AdView$LoadHtmlAdTaskResult;-><init>(Lcom/mopub/mobileads/AdView;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public cleanup()V
    .locals 1

    .prologue
    .line 824
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mopub/mobileads/AdView$LoadHtmlAdTaskResult;->mData:Ljava/lang/String;

    .line 825
    return-void
.end method

.method public execute()V
    .locals 6

    .prologue
    .line 813
    iget-object v1, p0, Lcom/mopub/mobileads/AdView$LoadHtmlAdTaskResult;->mData:Ljava/lang/String;

    if-nez v1, :cond_1

    .line 821
    :cond_0
    :goto_0
    return-void

    .line 815
    :cond_1
    iget-object v1, p0, Lcom/mopub/mobileads/AdView$LoadHtmlAdTaskResult;->mWeakAdView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mopub/mobileads/AdView;

    .line 816
    .local v0, "adView":Lcom/mopub/mobileads/AdView;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/mopub/mobileads/AdView;->isDestroyed()Z

    move-result v1

    if-nez v1, :cond_0

    .line 818
    iget-object v1, p0, Lcom/mopub/mobileads/AdView$LoadHtmlAdTaskResult;->mData:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/mopub/mobileads/AdView;->access$1402(Lcom/mopub/mobileads/AdView;Ljava/lang/String;)Ljava/lang/String;

    .line 819
    const-string v1, "http://ads.mopub.com/"

    iget-object v2, p0, Lcom/mopub/mobileads/AdView$LoadHtmlAdTaskResult;->mData:Ljava/lang/String;

    const-string v3, "text/html"

    const-string v4, "utf-8"

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Lcom/mopub/mobileads/AdView;->loadDataWithBaseURL(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method
