.class public Lcom/miniclip/nativeJNI/MopubView;
.super Lcom/miniclip/newsfeed/MCDialog;
.source "MopubView.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private mAdView:Lcom/mopub/mobileads/MoPubView;

.field private mHandler:Landroid/os/Handler;

.field private mRemoveAdsButton:Landroid/widget/ImageView;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/mopub/mobileads/MoPubView;)V
    .locals 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "adView"    # Lcom/mopub/mobileads/MoPubView;

    .prologue
    const/4 v7, 0x0

    const/4 v6, -0x2

    .line 28
    invoke-direct {p0, p1}, Lcom/miniclip/newsfeed/MCDialog;-><init>(Landroid/content/Context;)V

    .line 24
    new-instance v3, Landroid/os/Handler;

    invoke-direct {v3}, Landroid/os/Handler;-><init>()V

    iput-object v3, p0, Lcom/miniclip/nativeJNI/MopubView;->mHandler:Landroid/os/Handler;

    .line 29
    iput-object p2, p0, Lcom/miniclip/nativeJNI/MopubView;->mAdView:Lcom/mopub/mobileads/MoPubView;

    .line 31
    iget-object v3, p0, Lcom/miniclip/nativeJNI/MopubView;->mWindowView:Landroid/widget/RelativeLayout;

    const/16 v4, 0x19

    const/16 v5, 0xa

    invoke-virtual {v3, v7, v4, v7, v5}, Landroid/widget/RelativeLayout;->setPadding(IIII)V

    .line 33
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v0, v6, v6}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 34
    .local v0, "paramsWeb1":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v3, 0xd

    invoke-virtual {v0, v3}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 35
    new-instance v2, Landroid/widget/RelativeLayout;

    iget-object v3, p0, Lcom/miniclip/nativeJNI/MopubView;->mContext:Landroid/content/Context;

    invoke-direct {v2, v3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 36
    .local v2, "webLayout1":Landroid/widget/RelativeLayout;
    invoke-virtual {v2, v0}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 37
    iget-object v3, p0, Lcom/miniclip/nativeJNI/MopubView;->mAdView:Lcom/mopub/mobileads/MoPubView;

    invoke-virtual {v3}, Lcom/mopub/mobileads/MoPubView;->AdLoaded()Z

    move-result v3

    if-nez v3, :cond_0

    .line 39
    new-instance v3, Landroid/widget/ImageView;

    iget-object v4, p0, Lcom/miniclip/nativeJNI/MopubView;->mContext:Landroid/content/Context;

    invoke-direct {v3, v4}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object v3, p0, Lcom/miniclip/nativeJNI/MopubView;->mRemoveAdsButton:Landroid/widget/ImageView;

    .line 40
    invoke-virtual {p0}, Lcom/miniclip/nativeJNI/MopubView;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const-string v4, "remove_ads"

    const-string v5, "drawable"

    iget-object v6, p0, Lcom/miniclip/nativeJNI/MopubView;->mContext:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v4, v5, v6}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    .line 41
    .local v1, "resourceId":I
    iget-object v3, p0, Lcom/miniclip/nativeJNI/MopubView;->mRemoveAdsButton:Landroid/widget/ImageView;

    invoke-virtual {p0}, Lcom/miniclip/nativeJNI/MopubView;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 42
    iget-object v3, p0, Lcom/miniclip/nativeJNI/MopubView;->mRemoveAdsButton:Landroid/widget/ImageView;

    invoke-virtual {v3, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 43
    iget-object v3, p0, Lcom/miniclip/nativeJNI/MopubView;->mRemoveAdsButton:Landroid/widget/ImageView;

    invoke-virtual {v2, v3}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 49
    .end local v1    # "resourceId":I
    :goto_0
    iget-object v3, p0, Lcom/miniclip/nativeJNI/MopubView;->mFullView:Landroid/widget/RelativeLayout;

    invoke-virtual {v3, v2}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 50
    return-void

    .line 47
    :cond_0
    iget-object v3, p0, Lcom/miniclip/nativeJNI/MopubView;->mAdView:Lcom/mopub/mobileads/MoPubView;

    invoke-virtual {v2, v3}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    goto :goto_0
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;

    .prologue
    const/4 v1, 0x0

    .line 55
    invoke-super {p0, p1}, Lcom/miniclip/newsfeed/MCDialog;->onClick(Landroid/view/View;)V

    .line 56
    iget-object v0, p0, Lcom/miniclip/nativeJNI/MopubView;->mRemoveAdsButton:Landroid/widget/ImageView;

    if-ne p1, v0, :cond_0

    .line 58
    const-string v0, "remove_ads"

    invoke-static {v0, v1, v1}, Lcom/miniclip/nativeJNI/cocojava;->callInAppPurchaseManaged(Ljava/lang/String;II)I

    .line 60
    :cond_0
    return-void
.end method
