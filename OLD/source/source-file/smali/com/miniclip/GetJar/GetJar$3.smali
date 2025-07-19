.class final Lcom/miniclip/GetJar/GetJar$3;
.super Ljava/lang/Object;
.source "GetJar.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/GetJar/GetJar;->getJarResponce(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$value:I


# direct methods
.method constructor <init>(I)V
    .locals 0

    .prologue
    .line 157
    iput p1, p0, Lcom/miniclip/GetJar/GetJar$3;->val$value:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    const/4 v0, 0x1

    .line 160
    iget v1, p0, Lcom/miniclip/GetJar/GetJar$3;->val$value:I

    if-ne v1, v0, :cond_0

    .line 161
    sget v1, Lcom/miniclip/nativeJNI/cocojava;->mInAppCallback:I

    sget v2, Lcom/miniclip/nativeJNI/cocojava;->mInAppSelf:I

    sget-object v3, Lcom/miniclip/nativeJNI/cocojava;->mInAppProductId:Ljava/lang/String;

    const-string v4, ""

    const-string v5, ""

    invoke-static/range {v0 .. v5}, Lcom/miniclip/nativeJNI/CocoJNI;->MsetInAppResponce(IIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 163
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->permanentlyRemoveAds()V

    .line 174
    :goto_0
    return-void

    .line 165
    :cond_0
    sget-boolean v0, Lcom/miniclip/nativeJNI/cocojava;->mInAppManaged:Z

    if-eqz v0, :cond_1

    .line 166
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mInAppProductId:Ljava/lang/String;

    sget v1, Lcom/miniclip/nativeJNI/cocojava;->mInAppCallback:I

    sget v2, Lcom/miniclip/nativeJNI/cocojava;->mInAppSelf:I

    invoke-static {v0, v1, v2}, Lcom/miniclip/nativeJNI/cocojava;->callInAppPurchaseRemoveAdsManaged(Ljava/lang/String;II)I

    goto :goto_0

    .line 170
    :cond_1
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mInAppProductId:Ljava/lang/String;

    sget v1, Lcom/miniclip/nativeJNI/cocojava;->mInAppCallback:I

    sget v2, Lcom/miniclip/nativeJNI/cocojava;->mInAppSelf:I

    invoke-static {v0, v1, v2}, Lcom/miniclip/nativeJNI/cocojava;->callInAppPurchaseRemoveAds(Ljava/lang/String;II)I

    goto :goto_0
.end method
