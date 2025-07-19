.class public Lcom/flurry/android/AppCircle;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public acceptOffer(Landroid/content/Context;J)V
    .locals 0

    .prologue
    .line 95
    invoke-static {p1, p2, p3}, Lcom/flurry/android/FlurryAgent;->a(Landroid/content/Context;J)V

    .line 96
    return-void
.end method

.method public addUserCookie(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 118
    invoke-static {p1, p2}, Lcom/flurry/android/FlurryAgent;->addUserCookie(Ljava/lang/String;Ljava/lang/String;)V

    .line 119
    return-void
.end method

.method public clearUserCookies()V
    .locals 0

    .prologue
    .line 123
    invoke-static {}, Lcom/flurry/android/FlurryAgent;->clearUserCookies()V

    .line 124
    return-void
.end method

.method public getAllOffers()Ljava/util/List;
    .locals 1

    .prologue
    .line 82
    const-string v0, ""

    invoke-static {v0}, Lcom/flurry/android/FlurryAgent;->b(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getAllOffers(Ljava/lang/String;)Ljava/util/List;
    .locals 1

    .prologue
    .line 90
    invoke-static {p1}, Lcom/flurry/android/FlurryAgent;->b(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getHook(Landroid/content/Context;Ljava/lang/String;I)Landroid/view/View;
    .locals 1

    .prologue
    .line 40
    invoke-static {p1, p2, p3}, Lcom/flurry/android/FlurryAgent;->a(Landroid/content/Context;Ljava/lang/String;I)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public getOffer()Lcom/flurry/android/Offer;
    .locals 1

    .prologue
    .line 66
    const-string v0, ""

    invoke-virtual {p0, v0}, Lcom/flurry/android/AppCircle;->getOffer(Ljava/lang/String;)Lcom/flurry/android/Offer;

    move-result-object v0

    return-object v0
.end method

.method public getOffer(Ljava/lang/String;)Lcom/flurry/android/Offer;
    .locals 1

    .prologue
    .line 74
    invoke-static {p1}, Lcom/flurry/android/FlurryAgent;->a(Ljava/lang/String;)Lcom/flurry/android/Offer;

    move-result-object v0

    return-object v0
.end method

.method public hasAds()Z
    .locals 1

    .prologue
    .line 58
    invoke-static {}, Lcom/flurry/android/FlurryAgent;->d()Z

    move-result v0

    return v0
.end method

.method public isLaunchCanvasOnBannerClicked()Z
    .locals 1

    .prologue
    .line 30
    invoke-static {}, Lcom/flurry/android/FlurryAgent;->a()Z

    move-result v0

    return v0
.end method

.method public isLaunchCatalogOnBannerClicked()Z
    .locals 1

    .prologue
    .line 35
    invoke-static {}, Lcom/flurry/android/FlurryAgent;->a()Z

    move-result v0

    return v0
.end method

.method public launchCanvasOnBannerClicked(Z)V
    .locals 0

    .prologue
    .line 16
    invoke-static {p1}, Lcom/flurry/android/FlurryAgent;->a(Z)V

    .line 17
    return-void
.end method

.method public launchCatalogOnBannerClicked(Z)V
    .locals 0

    .prologue
    .line 24
    invoke-static {p1}, Lcom/flurry/android/FlurryAgent;->a(Z)V

    .line 25
    return-void
.end method

.method public openCatalog(Landroid/content/Context;)V
    .locals 1

    .prologue
    .line 45
    const-string v0, ""

    invoke-virtual {p0, p1, v0}, Lcom/flurry/android/AppCircle;->openCatalog(Landroid/content/Context;Ljava/lang/String;)V

    .line 46
    return-void
.end method

.method public openCatalog(Landroid/content/Context;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 50
    invoke-static {p1, p2}, Lcom/flurry/android/FlurryAgent;->a(Landroid/content/Context;Ljava/lang/String;)V

    .line 51
    return-void
.end method

.method public removeOffers(Ljava/util/List;)V
    .locals 0

    .prologue
    .line 100
    invoke-static {p1}, Lcom/flurry/android/FlurryAgent;->a(Ljava/util/List;)V

    .line 101
    return-void
.end method

.method public setAppCircleCallback(Lcom/flurry/android/AppCircleCallback;)V
    .locals 0

    .prologue
    .line 110
    invoke-static {p1}, Lcom/flurry/android/FlurryAgent;->a(Lcom/flurry/android/AppCircleCallback;)V

    .line 111
    return-void
.end method

.method public setDefaultNoAdsMessage(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 105
    invoke-static {p1}, Lcom/flurry/android/FlurryAgent;->setDefaultNoAdsMessage(Ljava/lang/String;)V

    .line 106
    return-void
.end method
