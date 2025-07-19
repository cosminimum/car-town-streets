.class public Lcom/mopub/mobileads/GoogleAdMobInterstitialAdapter;
.super Lcom/mopub/mobileads/BaseInterstitialAdapter;
.source "GoogleAdMobInterstitialAdapter.java"

# interfaces
.implements Lcom/google/ads/AdListener;


# instance fields
.field private mHasAlreadyRegisteredClick:Z

.field private mHasPrefetchedInterstitial:Z

.field private mInterstitialAd:Lcom/google/ads/InterstitialAd;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 48
    invoke-direct {p0}, Lcom/mopub/mobileads/BaseInterstitialAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public init(Lcom/mopub/mobileads/MoPubInterstitial;Ljava/lang/String;)V
    .locals 5
    .param p1, "interstitial"    # Lcom/mopub/mobileads/MoPubInterstitial;
    .param p2, "jsonParams"    # Ljava/lang/String;

    .prologue
    .line 57
    invoke-super {p0, p1, p2}, Lcom/mopub/mobileads/BaseInterstitialAdapter;->init(Lcom/mopub/mobileads/MoPubInterstitial;Ljava/lang/String;)V

    .line 63
    :try_start_0
    new-instance v3, Lorg/json/JSONTokener;

    iget-object v4, p0, Lcom/mopub/mobileads/GoogleAdMobInterstitialAdapter;->mJsonParams:Ljava/lang/String;

    invoke-direct {v3, v4}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Lorg/json/JSONTokener;->nextValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/json/JSONObject;

    .line 64
    .local v1, "object":Lorg/json/JSONObject;
    const-string v3, "adUnitID"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 70
    .local v2, "pubId":Ljava/lang/String;
    new-instance v3, Lcom/google/ads/InterstitialAd;

    iget-object v4, p0, Lcom/mopub/mobileads/GoogleAdMobInterstitialAdapter;->mInterstitial:Lcom/mopub/mobileads/MoPubInterstitial;

    invoke-virtual {v4}, Lcom/mopub/mobileads/MoPubInterstitial;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-direct {v3, v4, v2}, Lcom/google/ads/InterstitialAd;-><init>(Landroid/app/Activity;Ljava/lang/String;)V

    iput-object v3, p0, Lcom/mopub/mobileads/GoogleAdMobInterstitialAdapter;->mInterstitialAd:Lcom/google/ads/InterstitialAd;

    .line 71
    iget-object v3, p0, Lcom/mopub/mobileads/GoogleAdMobInterstitialAdapter;->mInterstitialAd:Lcom/google/ads/InterstitialAd;

    invoke-virtual {v3, p0}, Lcom/google/ads/InterstitialAd;->setAdListener(Lcom/google/ads/AdListener;)V

    .line 72
    .end local v1    # "object":Lorg/json/JSONObject;
    .end local v2    # "pubId":Ljava/lang/String;
    :cond_0
    :goto_0
    return-void

    .line 65
    :catch_0
    move-exception v0

    .line 66
    .local v0, "e":Lorg/json/JSONException;
    iget-object v3, p0, Lcom/mopub/mobileads/GoogleAdMobInterstitialAdapter;->mAdapterListener:Lcom/mopub/mobileads/BaseInterstitialAdapter$BaseInterstitialAdapterListener;

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/mopub/mobileads/GoogleAdMobInterstitialAdapter;->mAdapterListener:Lcom/mopub/mobileads/BaseInterstitialAdapter$BaseInterstitialAdapterListener;

    invoke-interface {v3, p0}, Lcom/mopub/mobileads/BaseInterstitialAdapter$BaseInterstitialAdapterListener;->onNativeInterstitialFailed(Lcom/mopub/mobileads/BaseInterstitialAdapter;)V

    goto :goto_0
.end method

.method public loadInterstitial()V
    .locals 3

    .prologue
    .line 76
    invoke-virtual {p0}, Lcom/mopub/mobileads/GoogleAdMobInterstitialAdapter;->isInvalidated()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 87
    :goto_0
    return-void

    .line 78
    :cond_0
    new-instance v0, Lcom/google/ads/AdRequest;

    invoke-direct {v0}, Lcom/google/ads/AdRequest;-><init>()V

    .line 82
    .local v0, "adRequest":Lcom/google/ads/AdRequest;
    iget-object v2, p0, Lcom/mopub/mobileads/GoogleAdMobInterstitialAdapter;->mInterstitial:Lcom/mopub/mobileads/MoPubInterstitial;

    invoke-virtual {v2}, Lcom/mopub/mobileads/MoPubInterstitial;->getLocation()Landroid/location/Location;

    move-result-object v1

    .line 83
    .local v1, "location":Landroid/location/Location;
    if-eqz v1, :cond_1

    invoke-virtual {v0, v1}, Lcom/google/ads/AdRequest;->setLocation(Landroid/location/Location;)Lcom/google/ads/AdRequest;

    .line 85
    :cond_1
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/mopub/mobileads/GoogleAdMobInterstitialAdapter;->mHasPrefetchedInterstitial:Z

    .line 86
    iget-object v2, p0, Lcom/mopub/mobileads/GoogleAdMobInterstitialAdapter;->mInterstitialAd:Lcom/google/ads/InterstitialAd;

    invoke-virtual {v2, v0}, Lcom/google/ads/InterstitialAd;->loadAd(Lcom/google/ads/AdRequest;)V

    goto :goto_0
.end method

.method public onDismissScreen(Lcom/google/ads/Ad;)V
    .locals 0
    .param p1, "arg0"    # Lcom/google/ads/Ad;

    .prologue
    .line 98
    return-void
.end method

.method public onFailedToReceiveAd(Lcom/google/ads/Ad;Lcom/google/ads/AdRequest$ErrorCode;)V
    .locals 2
    .param p1, "arg0"    # Lcom/google/ads/Ad;
    .param p2, "arg1"    # Lcom/google/ads/AdRequest$ErrorCode;

    .prologue
    .line 102
    invoke-virtual {p0}, Lcom/mopub/mobileads/GoogleAdMobInterstitialAdapter;->isInvalidated()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 107
    :cond_0
    :goto_0
    return-void

    .line 104
    :cond_1
    const-string v0, "MoPub"

    const-string v1, "Google AdMob interstitial failed. Trying another"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 105
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mopub/mobileads/GoogleAdMobInterstitialAdapter;->mHasPrefetchedInterstitial:Z

    .line 106
    iget-object v0, p0, Lcom/mopub/mobileads/GoogleAdMobInterstitialAdapter;->mAdapterListener:Lcom/mopub/mobileads/BaseInterstitialAdapter$BaseInterstitialAdapterListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mopub/mobileads/GoogleAdMobInterstitialAdapter;->mAdapterListener:Lcom/mopub/mobileads/BaseInterstitialAdapter$BaseInterstitialAdapterListener;

    invoke-interface {v0, p0}, Lcom/mopub/mobileads/BaseInterstitialAdapter$BaseInterstitialAdapterListener;->onNativeInterstitialFailed(Lcom/mopub/mobileads/BaseInterstitialAdapter;)V

    goto :goto_0
.end method

.method public onLeaveApplication(Lcom/google/ads/Ad;)V
    .locals 2
    .param p1, "arg0"    # Lcom/google/ads/Ad;

    .prologue
    .line 111
    invoke-virtual {p0}, Lcom/mopub/mobileads/GoogleAdMobInterstitialAdapter;->isInvalidated()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 119
    :cond_0
    :goto_0
    return-void

    .line 114
    :cond_1
    const-string v0, "MoPub"

    const-string v1, "Google AdMob interstitial was clicked, leaving application"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 115
    iget-boolean v0, p0, Lcom/mopub/mobileads/GoogleAdMobInterstitialAdapter;->mHasAlreadyRegisteredClick:Z

    if-nez v0, :cond_0

    .line 116
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mopub/mobileads/GoogleAdMobInterstitialAdapter;->mHasAlreadyRegisteredClick:Z

    .line 117
    iget-object v0, p0, Lcom/mopub/mobileads/GoogleAdMobInterstitialAdapter;->mAdapterListener:Lcom/mopub/mobileads/BaseInterstitialAdapter$BaseInterstitialAdapterListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mopub/mobileads/GoogleAdMobInterstitialAdapter;->mAdapterListener:Lcom/mopub/mobileads/BaseInterstitialAdapter$BaseInterstitialAdapterListener;

    invoke-interface {v0, p0}, Lcom/mopub/mobileads/BaseInterstitialAdapter$BaseInterstitialAdapterListener;->onNativeInterstitialClicked(Lcom/mopub/mobileads/BaseInterstitialAdapter;)V

    goto :goto_0
.end method

.method public onPresentScreen(Lcom/google/ads/Ad;)V
    .locals 0
    .param p1, "arg0"    # Lcom/google/ads/Ad;

    .prologue
    .line 124
    return-void
.end method

.method public onReceiveAd(Lcom/google/ads/Ad;)V
    .locals 2
    .param p1, "arg0"    # Lcom/google/ads/Ad;

    .prologue
    .line 128
    invoke-virtual {p0}, Lcom/mopub/mobileads/GoogleAdMobInterstitialAdapter;->isInvalidated()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 133
    :cond_0
    :goto_0
    return-void

    .line 130
    :cond_1
    const-string v0, "MoPub"

    const-string v1, "Google AdMob interstitial received an ad successfully."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 131
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mopub/mobileads/GoogleAdMobInterstitialAdapter;->mHasPrefetchedInterstitial:Z

    .line 132
    iget-object v0, p0, Lcom/mopub/mobileads/GoogleAdMobInterstitialAdapter;->mAdapterListener:Lcom/mopub/mobileads/BaseInterstitialAdapter$BaseInterstitialAdapterListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mopub/mobileads/GoogleAdMobInterstitialAdapter;->mAdapterListener:Lcom/mopub/mobileads/BaseInterstitialAdapter$BaseInterstitialAdapterListener;

    invoke-interface {v0, p0}, Lcom/mopub/mobileads/BaseInterstitialAdapter$BaseInterstitialAdapterListener;->onNativeInterstitialLoaded(Lcom/mopub/mobileads/BaseInterstitialAdapter;)V

    goto :goto_0
.end method

.method public showInterstitial()V
    .locals 1

    .prologue
    .line 91
    invoke-virtual {p0}, Lcom/mopub/mobileads/GoogleAdMobInterstitialAdapter;->isInvalidated()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 93
    :cond_0
    :goto_0
    return-void

    .line 92
    :cond_1
    iget-boolean v0, p0, Lcom/mopub/mobileads/GoogleAdMobInterstitialAdapter;->mHasPrefetchedInterstitial:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mopub/mobileads/GoogleAdMobInterstitialAdapter;->mInterstitialAd:Lcom/google/ads/InterstitialAd;

    invoke-virtual {v0}, Lcom/google/ads/InterstitialAd;->show()V

    goto :goto_0
.end method
