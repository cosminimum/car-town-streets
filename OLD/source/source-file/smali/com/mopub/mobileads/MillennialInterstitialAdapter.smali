.class public Lcom/mopub/mobileads/MillennialInterstitialAdapter;
.super Lcom/mopub/mobileads/BaseInterstitialAdapter;
.source "MillennialInterstitialAdapter.java"

# interfaces
.implements Lcom/millennialmedia/android/MMAdView$MMAdListener;


# instance fields
.field private mActivityReference:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field

.field private final mHandler:Landroid/os/Handler;

.field private mHasAlreadyRegisteredClick:Z

.field private mMillennialAdView:Lcom/millennialmedia/android/MMAdView;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 51
    invoke-direct {p0}, Lcom/mopub/mobileads/BaseInterstitialAdapter;-><init>()V

    .line 63
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/mopub/mobileads/MillennialInterstitialAdapter;->mHandler:Landroid/os/Handler;

    return-void
.end method

.method static synthetic access$000(Lcom/mopub/mobileads/MillennialInterstitialAdapter;)V
    .locals 0
    .param p0, "x0"    # Lcom/mopub/mobileads/MillennialInterstitialAdapter;

    .prologue
    .line 51
    invoke-direct {p0}, Lcom/mopub/mobileads/MillennialInterstitialAdapter;->recordClickIfNecessary()V

    return-void
.end method

.method static synthetic access$100(Lcom/mopub/mobileads/MillennialInterstitialAdapter;)Lcom/millennialmedia/android/MMAdView;
    .locals 1
    .param p0, "x0"    # Lcom/mopub/mobileads/MillennialInterstitialAdapter;

    .prologue
    .line 51
    iget-object v0, p0, Lcom/mopub/mobileads/MillennialInterstitialAdapter;->mMillennialAdView:Lcom/millennialmedia/android/MMAdView;

    return-object v0
.end method

.method private recordClickIfNecessary()V
    .locals 1

    .prologue
    .line 125
    iget-boolean v0, p0, Lcom/mopub/mobileads/MillennialInterstitialAdapter;->mHasAlreadyRegisteredClick:Z

    if-nez v0, :cond_0

    .line 126
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mopub/mobileads/MillennialInterstitialAdapter;->mHasAlreadyRegisteredClick:Z

    .line 127
    iget-object v0, p0, Lcom/mopub/mobileads/MillennialInterstitialAdapter;->mAdapterListener:Lcom/mopub/mobileads/BaseInterstitialAdapter$BaseInterstitialAdapterListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mopub/mobileads/MillennialInterstitialAdapter;->mAdapterListener:Lcom/mopub/mobileads/BaseInterstitialAdapter$BaseInterstitialAdapterListener;

    invoke-interface {v0, p0}, Lcom/mopub/mobileads/BaseInterstitialAdapter$BaseInterstitialAdapterListener;->onNativeInterstitialClicked(Lcom/mopub/mobileads/BaseInterstitialAdapter;)V

    .line 129
    :cond_0
    return-void
.end method


# virtual methods
.method public MMAdCachingCompleted(Lcom/millennialmedia/android/MMAdView;Z)V
    .locals 2
    .param p1, "adview"    # Lcom/millennialmedia/android/MMAdView;
    .param p2, "success"    # Z

    .prologue
    .line 200
    iget-object v0, p0, Lcom/mopub/mobileads/MillennialInterstitialAdapter;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/mopub/mobileads/MillennialInterstitialAdapter$5;

    invoke-direct {v1, p0}, Lcom/mopub/mobileads/MillennialInterstitialAdapter$5;-><init>(Lcom/mopub/mobileads/MillennialInterstitialAdapter;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 216
    return-void
.end method

.method public MMAdClickedToOverlay(Lcom/millennialmedia/android/MMAdView;)V
    .locals 2
    .param p1, "adview"    # Lcom/millennialmedia/android/MMAdView;

    .prologue
    .line 174
    iget-object v0, p0, Lcom/mopub/mobileads/MillennialInterstitialAdapter;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/mopub/mobileads/MillennialInterstitialAdapter$3;

    invoke-direct {v1, p0}, Lcom/mopub/mobileads/MillennialInterstitialAdapter$3;-><init>(Lcom/mopub/mobileads/MillennialInterstitialAdapter;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 182
    return-void
.end method

.method public MMAdFailed(Lcom/millennialmedia/android/MMAdView;)V
    .locals 2
    .param p1, "adview"    # Lcom/millennialmedia/android/MMAdView;

    .prologue
    .line 133
    iget-object v0, p0, Lcom/mopub/mobileads/MillennialInterstitialAdapter;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/mopub/mobileads/MillennialInterstitialAdapter$1;

    invoke-direct {v1, p0}, Lcom/mopub/mobileads/MillennialInterstitialAdapter$1;-><init>(Lcom/mopub/mobileads/MillennialInterstitialAdapter;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 143
    return-void
.end method

.method public MMAdOverlayLaunched(Lcom/millennialmedia/android/MMAdView;)V
    .locals 2
    .param p1, "adview"    # Lcom/millennialmedia/android/MMAdView;

    .prologue
    .line 186
    iget-object v0, p0, Lcom/mopub/mobileads/MillennialInterstitialAdapter;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/mopub/mobileads/MillennialInterstitialAdapter$4;

    invoke-direct {v1, p0}, Lcom/mopub/mobileads/MillennialInterstitialAdapter$4;-><init>(Lcom/mopub/mobileads/MillennialInterstitialAdapter;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 196
    return-void
.end method

.method public MMAdRequestIsCaching(Lcom/millennialmedia/android/MMAdView;)V
    .locals 2
    .param p1, "adview"    # Lcom/millennialmedia/android/MMAdView;

    .prologue
    .line 221
    const-string v0, "MoPub"

    const-string v1, "Millennial interstitial is caching."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 222
    return-void
.end method

.method public MMAdReturned(Lcom/millennialmedia/android/MMAdView;)V
    .locals 2
    .param p1, "adview"    # Lcom/millennialmedia/android/MMAdView;

    .prologue
    .line 147
    iget-object v0, p0, Lcom/mopub/mobileads/MillennialInterstitialAdapter;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/mopub/mobileads/MillennialInterstitialAdapter$2;

    invoke-direct {v1, p0}, Lcom/mopub/mobileads/MillennialInterstitialAdapter$2;-><init>(Lcom/mopub/mobileads/MillennialInterstitialAdapter;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 157
    return-void
.end method

.method public init(Lcom/mopub/mobileads/MoPubInterstitial;Ljava/lang/String;)V
    .locals 7
    .param p1, "interstitial"    # Lcom/mopub/mobileads/MoPubInterstitial;
    .param p2, "jsonParams"    # Ljava/lang/String;

    .prologue
    .line 67
    invoke-super {p0, p1, p2}, Lcom/mopub/mobileads/BaseInterstitialAdapter;->init(Lcom/mopub/mobileads/MoPubInterstitial;Ljava/lang/String;)V

    .line 68
    new-instance v3, Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Lcom/mopub/mobileads/MoPubInterstitial;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v3, p0, Lcom/mopub/mobileads/MillennialInterstitialAdapter;->mActivityReference:Ljava/lang/ref/WeakReference;

    .line 74
    :try_start_0
    new-instance v3, Lorg/json/JSONTokener;

    iget-object v4, p0, Lcom/mopub/mobileads/MillennialInterstitialAdapter;->mJsonParams:Ljava/lang/String;

    invoke-direct {v3, v4}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Lorg/json/JSONTokener;->nextValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/json/JSONObject;

    .line 75
    .local v1, "object":Lorg/json/JSONObject;
    const-string v3, "adUnitID"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 81
    .local v2, "pubId":Ljava/lang/String;
    new-instance v4, Lcom/millennialmedia/android/MMAdView;

    iget-object v3, p0, Lcom/mopub/mobileads/MillennialInterstitialAdapter;->mActivityReference:Ljava/lang/ref/WeakReference;

    invoke-virtual {v3}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/content/Context;

    const-string v5, "MMFullScreenAdTransition"

    const/4 v6, -0x1

    invoke-direct {v4, v3, v2, v5, v6}, Lcom/millennialmedia/android/MMAdView;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;I)V

    iput-object v4, p0, Lcom/mopub/mobileads/MillennialInterstitialAdapter;->mMillennialAdView:Lcom/millennialmedia/android/MMAdView;

    .line 83
    iget-object v3, p0, Lcom/mopub/mobileads/MillennialInterstitialAdapter;->mMillennialAdView:Lcom/millennialmedia/android/MMAdView;

    const v4, 0x711e41a1

    invoke-virtual {v3, v4}, Lcom/millennialmedia/android/MMAdView;->setId(I)V

    .line 84
    iget-object v3, p0, Lcom/mopub/mobileads/MillennialInterstitialAdapter;->mMillennialAdView:Lcom/millennialmedia/android/MMAdView;

    invoke-virtual {v3, p0}, Lcom/millennialmedia/android/MMAdView;->setListener(Lcom/millennialmedia/android/MMAdView$MMAdListener;)V

    .line 85
    .end local v1    # "object":Lorg/json/JSONObject;
    .end local v2    # "pubId":Ljava/lang/String;
    :cond_0
    :goto_0
    return-void

    .line 76
    :catch_0
    move-exception v0

    .line 77
    .local v0, "e":Lorg/json/JSONException;
    iget-object v3, p0, Lcom/mopub/mobileads/MillennialInterstitialAdapter;->mAdapterListener:Lcom/mopub/mobileads/BaseInterstitialAdapter$BaseInterstitialAdapterListener;

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/mopub/mobileads/MillennialInterstitialAdapter;->mAdapterListener:Lcom/mopub/mobileads/BaseInterstitialAdapter$BaseInterstitialAdapterListener;

    invoke-interface {v3, p0}, Lcom/mopub/mobileads/BaseInterstitialAdapter$BaseInterstitialAdapterListener;->onNativeInterstitialFailed(Lcom/mopub/mobileads/BaseInterstitialAdapter;)V

    goto :goto_0
.end method

.method public invalidate()V
    .locals 1

    .prologue
    .line 89
    iget-object v0, p0, Lcom/mopub/mobileads/MillennialInterstitialAdapter;->mMillennialAdView:Lcom/millennialmedia/android/MMAdView;

    invoke-virtual {v0}, Lcom/millennialmedia/android/MMAdView;->removeAllViews()V

    .line 90
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mopub/mobileads/MillennialInterstitialAdapter;->mActivityReference:Ljava/lang/ref/WeakReference;

    .line 91
    invoke-super {p0}, Lcom/mopub/mobileads/BaseInterstitialAdapter;->invalidate()V

    .line 92
    return-void
.end method

.method public isInvalidated()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 96
    iget-object v1, p0, Lcom/mopub/mobileads/MillennialInterstitialAdapter;->mActivityReference:Ljava/lang/ref/WeakReference;

    if-nez v1, :cond_1

    .line 98
    :cond_0
    :goto_0
    return v0

    .line 97
    :cond_1
    iget-object v1, p0, Lcom/mopub/mobileads/MillennialInterstitialAdapter;->mActivityReference:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 98
    invoke-super {p0}, Lcom/mopub/mobileads/BaseInterstitialAdapter;->isInvalidated()Z

    move-result v0

    goto :goto_0
.end method

.method public loadInterstitial()V
    .locals 3

    .prologue
    .line 103
    invoke-virtual {p0}, Lcom/mopub/mobileads/MillennialInterstitialAdapter;->isInvalidated()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 113
    :goto_0
    return-void

    .line 105
    :cond_0
    const-string v1, "MoPub"

    const-string v2, "Fetching Millennial ad..."

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 107
    iget-object v1, p0, Lcom/mopub/mobileads/MillennialInterstitialAdapter;->mInterstitial:Lcom/mopub/mobileads/MoPubInterstitial;

    invoke-virtual {v1}, Lcom/mopub/mobileads/MoPubInterstitial;->getLocation()Landroid/location/Location;

    move-result-object v0

    .line 108
    .local v0, "location":Landroid/location/Location;
    if-eqz v0, :cond_1

    iget-object v1, p0, Lcom/mopub/mobileads/MillennialInterstitialAdapter;->mMillennialAdView:Lcom/millennialmedia/android/MMAdView;

    invoke-virtual {v1, v0}, Lcom/millennialmedia/android/MMAdView;->updateUserLocation(Landroid/location/Location;)V

    .line 110
    :cond_1
    iget-object v1, p0, Lcom/mopub/mobileads/MillennialInterstitialAdapter;->mMillennialAdView:Lcom/millennialmedia/android/MMAdView;

    const/4 v2, 0x4

    invoke-virtual {v1, v2}, Lcom/millennialmedia/android/MMAdView;->setVisibility(I)V

    .line 111
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/mopub/mobileads/MillennialInterstitialAdapter;->mHasAlreadyRegisteredClick:Z

    .line 112
    iget-object v1, p0, Lcom/mopub/mobileads/MillennialInterstitialAdapter;->mMillennialAdView:Lcom/millennialmedia/android/MMAdView;

    invoke-virtual {v1}, Lcom/millennialmedia/android/MMAdView;->fetch()V

    goto :goto_0
.end method

.method public showInterstitial()V
    .locals 2

    .prologue
    .line 117
    invoke-virtual {p0}, Lcom/mopub/mobileads/MillennialInterstitialAdapter;->isInvalidated()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 122
    :goto_0
    return-void

    .line 119
    :cond_0
    iget-object v0, p0, Lcom/mopub/mobileads/MillennialInterstitialAdapter;->mMillennialAdView:Lcom/millennialmedia/android/MMAdView;

    invoke-virtual {v0}, Lcom/millennialmedia/android/MMAdView;->check()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/mopub/mobileads/MillennialInterstitialAdapter;->mMillennialAdView:Lcom/millennialmedia/android/MMAdView;

    invoke-virtual {v0}, Lcom/millennialmedia/android/MMAdView;->display()Z

    goto :goto_0

    .line 120
    :cond_1
    const-string v0, "MoPub"

    const-string v1, "Tried to show a Millennial interstitial before it finished caching. Please try again."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method
