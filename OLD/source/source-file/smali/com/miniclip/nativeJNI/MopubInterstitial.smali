.class public Lcom/miniclip/nativeJNI/MopubInterstitial;
.super Ljava/lang/Object;
.source "MopubInterstitial.java"

# interfaces
.implements Lcom/mopub/mobileads/MoPubInterstitial$MoPubInterstitialListener;
.implements Lcom/google/ads/AdListener;


# instance fields
.field private interstitialn:Lcom/google/ads/InterstitialAd;

.field private mContext:Landroid/content/Context;

.field private showOnLoad:Ljava/lang/Boolean;

.field private state:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v0, 0x0

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    iput v0, p0, Lcom/miniclip/nativeJNI/MopubInterstitial;->state:I

    .line 22
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/miniclip/nativeJNI/MopubInterstitial;->showOnLoad:Ljava/lang/Boolean;

    .line 26
    iput-object p1, p0, Lcom/miniclip/nativeJNI/MopubInterstitial;->mContext:Landroid/content/Context;

    .line 28
    return-void
.end method


# virtual methods
.method public OnInterstitialFailed()V
    .locals 2

    .prologue
    .line 78
    const/4 v0, -0x1

    iput v0, p0, Lcom/miniclip/nativeJNI/MopubInterstitial;->state:I

    .line 79
    const-string v0, "MopubInterstitial"

    const-string v1, "No interstitial ad available"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 80
    return-void
.end method

.method public OnInterstitialLoaded()V
    .locals 0

    .prologue
    .line 75
    return-void
.end method

.method public hasFinished()Ljava/lang/Boolean;
    .locals 2

    .prologue
    .line 68
    iget v0, p0, Lcom/miniclip/nativeJNI/MopubInterstitial;->state:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    .line 69
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    .line 71
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_0
.end method

.method public loadInterstitialAd()V
    .locals 4

    .prologue
    .line 32
    const/4 v1, 0x1

    iput v1, p0, Lcom/miniclip/nativeJNI/MopubInterstitial;->state:I

    .line 33
    new-instance v3, Lcom/google/ads/InterstitialAd;

    iget-object v1, p0, Lcom/miniclip/nativeJNI/MopubInterstitial;->mContext:Landroid/content/Context;

    check-cast v1, Landroid/app/Activity;

    iget-object v2, p0, Lcom/miniclip/nativeJNI/MopubInterstitial;->mContext:Landroid/content/Context;

    check-cast v2, Lcom/miniclip/nativeJNI/cocojava;

    invoke-virtual {v2}, Lcom/miniclip/nativeJNI/cocojava;->getMoPubFullScreenInterstitialId()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v3, v1, v2}, Lcom/google/ads/InterstitialAd;-><init>(Landroid/app/Activity;Ljava/lang/String;)V

    iput-object v3, p0, Lcom/miniclip/nativeJNI/MopubInterstitial;->interstitialn:Lcom/google/ads/InterstitialAd;

    .line 34
    new-instance v0, Lcom/google/ads/AdRequest;

    invoke-direct {v0}, Lcom/google/ads/AdRequest;-><init>()V

    .line 35
    .local v0, "adRequest":Lcom/google/ads/AdRequest;
    const-string v1, "D579FE21B1D06263659D782107D111D3"

    invoke-virtual {v0, v1}, Lcom/google/ads/AdRequest;->addTestDevice(Ljava/lang/String;)Lcom/google/ads/AdRequest;

    .line 36
    const-string v1, "EB6192601108B8711C1D22A99293DD07"

    invoke-virtual {v0, v1}, Lcom/google/ads/AdRequest;->addTestDevice(Ljava/lang/String;)Lcom/google/ads/AdRequest;

    .line 37
    const-string v1, "4EAB4B0CAE6A7C3F6D0AA4968C3F7B0D"

    invoke-virtual {v0, v1}, Lcom/google/ads/AdRequest;->addTestDevice(Ljava/lang/String;)Lcom/google/ads/AdRequest;

    .line 38
    iget-object v1, p0, Lcom/miniclip/nativeJNI/MopubInterstitial;->interstitialn:Lcom/google/ads/InterstitialAd;

    invoke-virtual {v1, p0}, Lcom/google/ads/InterstitialAd;->setAdListener(Lcom/google/ads/AdListener;)V

    .line 39
    iget-object v1, p0, Lcom/miniclip/nativeJNI/MopubInterstitial;->interstitialn:Lcom/google/ads/InterstitialAd;

    invoke-virtual {v1, v0}, Lcom/google/ads/InterstitialAd;->loadAd(Lcom/google/ads/AdRequest;)V

    .line 40
    return-void
.end method

.method public onDismissScreen(Lcom/google/ads/Ad;)V
    .locals 0
    .param p1, "arg0"    # Lcom/google/ads/Ad;

    .prologue
    .line 86
    return-void
.end method

.method public onFailedToReceiveAd(Lcom/google/ads/Ad;Lcom/google/ads/AdRequest$ErrorCode;)V
    .locals 2
    .param p1, "arg0"    # Lcom/google/ads/Ad;
    .param p2, "arg1"    # Lcom/google/ads/AdRequest$ErrorCode;

    .prologue
    .line 90
    const/4 v0, -0x1

    iput v0, p0, Lcom/miniclip/nativeJNI/MopubInterstitial;->state:I

    .line 91
    const-string v0, "MopubInterstitial"

    const-string v1, "No interstitial ad available"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 92
    return-void
.end method

.method public onLeaveApplication(Lcom/google/ads/Ad;)V
    .locals 0
    .param p1, "arg0"    # Lcom/google/ads/Ad;

    .prologue
    .line 96
    return-void
.end method

.method public onPresentScreen(Lcom/google/ads/Ad;)V
    .locals 0
    .param p1, "arg0"    # Lcom/google/ads/Ad;

    .prologue
    .line 100
    return-void
.end method

.method public onReceiveAd(Lcom/google/ads/Ad;)V
    .locals 1
    .param p1, "arg0"    # Lcom/google/ads/Ad;

    .prologue
    .line 104
    const/4 v0, 0x2

    iput v0, p0, Lcom/miniclip/nativeJNI/MopubInterstitial;->state:I

    .line 105
    iget-object v0, p0, Lcom/miniclip/nativeJNI/MopubInterstitial;->showOnLoad:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 107
    iget-object v0, p0, Lcom/miniclip/nativeJNI/MopubInterstitial;->interstitialn:Lcom/google/ads/InterstitialAd;

    invoke-virtual {v0}, Lcom/google/ads/InterstitialAd;->show()V

    .line 108
    const/4 v0, 0x3

    iput v0, p0, Lcom/miniclip/nativeJNI/MopubInterstitial;->state:I

    .line 110
    :cond_0
    return-void
.end method

.method public showInterstitialAd()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 44
    iget v0, p0, Lcom/miniclip/nativeJNI/MopubInterstitial;->state:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_1

    .line 45
    const-string v0, "MopubInterstitial"

    const-string v1, "no ad available"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 64
    :cond_0
    :goto_0
    return-void

    .line 46
    :cond_1
    iget v0, p0, Lcom/miniclip/nativeJNI/MopubInterstitial;->state:I

    if-nez v0, :cond_2

    .line 48
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/miniclip/nativeJNI/MopubInterstitial;->showOnLoad:Ljava/lang/Boolean;

    .line 49
    invoke-virtual {p0}, Lcom/miniclip/nativeJNI/MopubInterstitial;->loadInterstitialAd()V

    .line 50
    const-string v0, "MopubInterstitial"

    const-string v1, "start loading then will show ad"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 52
    :cond_2
    iget v0, p0, Lcom/miniclip/nativeJNI/MopubInterstitial;->state:I

    if-ne v0, v2, :cond_3

    .line 54
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/miniclip/nativeJNI/MopubInterstitial;->showOnLoad:Ljava/lang/Boolean;

    .line 55
    const-string v0, "MopubInterstitial"

    const-string v1, "ad still loading will show on load"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 57
    :cond_3
    iget v0, p0, Lcom/miniclip/nativeJNI/MopubInterstitial;->state:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    .line 59
    iget-object v0, p0, Lcom/miniclip/nativeJNI/MopubInterstitial;->interstitialn:Lcom/google/ads/InterstitialAd;

    invoke-virtual {v0}, Lcom/google/ads/InterstitialAd;->show()V

    .line 60
    const/4 v0, 0x3

    iput v0, p0, Lcom/miniclip/nativeJNI/MopubInterstitial;->state:I

    goto :goto_0
.end method
