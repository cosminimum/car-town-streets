.class final Lcom/miniclip/nativeJNI/cocojava$25;
.super Ljava/lang/Object;
.source "cocojava.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/cocojava;->showFullScreenAd()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 1763
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 1765
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->access$700()Lcom/miniclip/nativeJNI/MopubInterstitial;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->access$700()Lcom/miniclip/nativeJNI/MopubInterstitial;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miniclip/nativeJNI/MopubInterstitial;->hasFinished()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1767
    :cond_0
    new-instance v0, Lcom/miniclip/nativeJNI/MopubInterstitial;

    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/miniclip/nativeJNI/MopubInterstitial;-><init>(Landroid/content/Context;)V

    invoke-static {v0}, Lcom/miniclip/nativeJNI/cocojava;->access$702(Lcom/miniclip/nativeJNI/MopubInterstitial;)Lcom/miniclip/nativeJNI/MopubInterstitial;

    .line 1768
    :cond_1
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->access$700()Lcom/miniclip/nativeJNI/MopubInterstitial;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miniclip/nativeJNI/MopubInterstitial;->showInterstitialAd()V

    .line 1769
    return-void
.end method
