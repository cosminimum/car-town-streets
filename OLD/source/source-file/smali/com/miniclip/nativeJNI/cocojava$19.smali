.class final Lcom/miniclip/nativeJNI/cocojava$19;
.super Ljava/lang/Object;
.source "cocojava.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/cocojava;->showSimpleTapjoyFeatureAd()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 1542
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 1544
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mFeaturedApObject:Lcom/tapjoy/TapjoyFeaturedAppObject;

    if-eqz v0, :cond_0

    .line 1545
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->showTJOfferDialog()V

    .line 1559
    :goto_0
    return-void

    .line 1547
    :cond_0
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->showTapFeatureAd()V

    goto :goto_0
.end method
