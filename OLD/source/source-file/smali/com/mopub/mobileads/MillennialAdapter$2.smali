.class Lcom/mopub/mobileads/MillennialAdapter$2;
.super Ljava/lang/Object;
.source "MillennialAdapter.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mopub/mobileads/MillennialAdapter;->MMAdReturned(Lcom/millennialmedia/android/MMAdView;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mopub/mobileads/MillennialAdapter;


# direct methods
.method constructor <init>(Lcom/mopub/mobileads/MillennialAdapter;)V
    .locals 0

    .prologue
    .line 155
    iput-object p1, p0, Lcom/mopub/mobileads/MillennialAdapter$2;->this$0:Lcom/mopub/mobileads/MillennialAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    const/4 v3, -0x1

    const/4 v2, 0x0

    .line 157
    iget-object v1, p0, Lcom/mopub/mobileads/MillennialAdapter$2;->this$0:Lcom/mopub/mobileads/MillennialAdapter;

    invoke-virtual {v1}, Lcom/mopub/mobileads/MillennialAdapter;->isInvalidated()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 174
    :cond_0
    :goto_0
    return-void

    .line 159
    :cond_1
    iget-object v1, p0, Lcom/mopub/mobileads/MillennialAdapter$2;->this$0:Lcom/mopub/mobileads/MillennialAdapter;

    iget-object v1, v1, Lcom/mopub/mobileads/MillennialAdapter;->mMoPubView:Lcom/mopub/mobileads/MoPubView;

    invoke-virtual {v1}, Lcom/mopub/mobileads/MoPubView;->removeAllViews()V

    .line 160
    iget-object v1, p0, Lcom/mopub/mobileads/MillennialAdapter$2;->this$0:Lcom/mopub/mobileads/MillennialAdapter;

    invoke-static {v1}, Lcom/mopub/mobileads/MillennialAdapter;->access$000(Lcom/mopub/mobileads/MillennialAdapter;)Lcom/millennialmedia/android/MMAdView;

    move-result-object v1

    invoke-virtual {v1, v2}, Lcom/millennialmedia/android/MMAdView;->setVisibility(I)V

    .line 161
    iget-object v1, p0, Lcom/mopub/mobileads/MillennialAdapter$2;->this$0:Lcom/mopub/mobileads/MillennialAdapter;

    invoke-static {v1}, Lcom/mopub/mobileads/MillennialAdapter;->access$000(Lcom/mopub/mobileads/MillennialAdapter;)Lcom/millennialmedia/android/MMAdView;

    move-result-object v1

    invoke-virtual {v1, v2}, Lcom/millennialmedia/android/MMAdView;->setHorizontalScrollBarEnabled(Z)V

    .line 162
    iget-object v1, p0, Lcom/mopub/mobileads/MillennialAdapter$2;->this$0:Lcom/mopub/mobileads/MillennialAdapter;

    invoke-static {v1}, Lcom/mopub/mobileads/MillennialAdapter;->access$000(Lcom/mopub/mobileads/MillennialAdapter;)Lcom/millennialmedia/android/MMAdView;

    move-result-object v1

    invoke-virtual {v1, v2}, Lcom/millennialmedia/android/MMAdView;->setVerticalScrollBarEnabled(Z)V

    .line 163
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v0, v3, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 166
    .local v0, "layoutParams":Landroid/widget/FrameLayout$LayoutParams;
    const/16 v1, 0x11

    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 167
    iget-object v1, p0, Lcom/mopub/mobileads/MillennialAdapter$2;->this$0:Lcom/mopub/mobileads/MillennialAdapter;

    iget-object v1, v1, Lcom/mopub/mobileads/MillennialAdapter;->mMoPubView:Lcom/mopub/mobileads/MoPubView;

    iget-object v2, p0, Lcom/mopub/mobileads/MillennialAdapter$2;->this$0:Lcom/mopub/mobileads/MillennialAdapter;

    invoke-static {v2}, Lcom/mopub/mobileads/MillennialAdapter;->access$000(Lcom/mopub/mobileads/MillennialAdapter;)Lcom/millennialmedia/android/MMAdView;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Lcom/mopub/mobileads/MoPubView;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 169
    iget-object v1, p0, Lcom/mopub/mobileads/MillennialAdapter$2;->this$0:Lcom/mopub/mobileads/MillennialAdapter;

    invoke-static {v1}, Lcom/mopub/mobileads/MillennialAdapter;->access$100(Lcom/mopub/mobileads/MillennialAdapter;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 170
    iget-object v1, p0, Lcom/mopub/mobileads/MillennialAdapter$2;->this$0:Lcom/mopub/mobileads/MillennialAdapter;

    const/4 v2, 0x1

    invoke-static {v1, v2}, Lcom/mopub/mobileads/MillennialAdapter;->access$102(Lcom/mopub/mobileads/MillennialAdapter;Z)Z

    .line 171
    iget-object v1, p0, Lcom/mopub/mobileads/MillennialAdapter$2;->this$0:Lcom/mopub/mobileads/MillennialAdapter;

    iget-object v1, v1, Lcom/mopub/mobileads/MillennialAdapter;->mMoPubView:Lcom/mopub/mobileads/MoPubView;

    invoke-virtual {v1}, Lcom/mopub/mobileads/MoPubView;->nativeAdLoaded()V

    .line 172
    iget-object v1, p0, Lcom/mopub/mobileads/MillennialAdapter$2;->this$0:Lcom/mopub/mobileads/MillennialAdapter;

    iget-object v1, v1, Lcom/mopub/mobileads/MillennialAdapter;->mMoPubView:Lcom/mopub/mobileads/MoPubView;

    invoke-virtual {v1}, Lcom/mopub/mobileads/MoPubView;->trackNativeImpression()V

    goto :goto_0
.end method
