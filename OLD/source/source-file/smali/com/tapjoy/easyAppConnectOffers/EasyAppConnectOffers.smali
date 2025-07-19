.class public Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;
.super Landroid/app/Activity;
.source "EasyAppConnectOffers.java"

# interfaces
.implements Lcom/tapjoy/TapjoyNotifier;
.implements Lcom/tapjoy/TapjoyFeaturedAppNotifier;
.implements Lcom/tapjoy/TapjoySpendPointsNotifier;
.implements Lcom/tapjoy/TapjoyDisplayAdNotifier;
.implements Lcom/tapjoy/TapjoyAwardPointsNotifier;
.implements Lcom/tapjoy/TapjoyEarnedPointsNotifier;


# static fields
.field public static final TAPJOY_INFO:Ljava/lang/String; = "TapJoyInfo"

.field public static final TAPJOY_INFO_CURRENCY_NAME:Ljava/lang/String; = "currency_name"

.field public static final TAPJOY_INFO_TOTAL_POINTS:Ljava/lang/String; = "point_total"

.field protected static mUSE_TAPJOY:Z


# instance fields
.field adLinearLayout:Landroid/widget/LinearLayout;

.field adView:Landroid/view/View;

.field currency_name:Ljava/lang/String;

.field displayText:Ljava/lang/String;

.field earnedPoints:Z

.field final mHandler:Landroid/os/Handler;

.field final mUpdateResults:Ljava/lang/Runnable;

.field protected point_total:I

.field pointsTextView:Landroid/widget/TextView;

.field relativeLayout:Landroid/widget/RelativeLayout;

.field tapjoySDKVersionView:Landroid/widget/TextView;

.field update_display_ad:Z

.field update_text:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 32
    const/4 v0, 0x1

    sput-boolean v0, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->mUSE_TAPJOY:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 25
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 40
    const-string v0, ""

    iput-object v0, p0, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->displayText:Ljava/lang/String;

    .line 41
    iput-boolean v1, p0, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->update_text:Z

    .line 42
    iput-boolean v1, p0, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->earnedPoints:Z

    .line 45
    iput-boolean v1, p0, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->update_display_ad:Z

    .line 52
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->mHandler:Landroid/os/Handler;

    .line 101
    new-instance v0, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers$1;

    invoke-direct {v0, p0}, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers$1;-><init>(Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;)V

    iput-object v0, p0, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->mUpdateResults:Ljava/lang/Runnable;

    return-void
.end method

.method static synthetic access$000(Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;)V
    .locals 0
    .param p0, "x0"    # Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;

    .prologue
    .line 25
    invoke-direct {p0}, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->updateResultsInUi()V

    return-void
.end method

.method private updateResultsInUi()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 112
    iget-boolean v0, p0, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->update_display_ad:Z

    if-eqz v0, :cond_0

    .line 115
    iget-object v0, p0, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->adLinearLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 118
    iget-object v0, p0, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->adLinearLayout:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->adView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 120
    iput-boolean v2, p0, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->update_display_ad:Z

    .line 124
    :cond_0
    iget-object v0, p0, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->pointsTextView:Landroid/widget/TextView;

    if-eqz v0, :cond_1

    .line 127
    iget-boolean v0, p0, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->update_text:Z

    if-eqz v0, :cond_1

    .line 129
    iget-object v0, p0, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->pointsTextView:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->displayText:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 130
    iput-boolean v2, p0, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->update_text:Z

    .line 133
    :cond_1
    return-void
.end method


# virtual methods
.method public earnedTapPoints(I)V
    .locals 2
    .param p1, "amount"    # I

    .prologue
    const/4 v0, 0x1

    .line 302
    iput-boolean v0, p0, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->earnedPoints:Z

    .line 303
    iput-boolean v0, p0, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->update_text:Z

    .line 304
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "You\'ve just earned "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " Tap Points!"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->displayText:Ljava/lang/String;

    .line 307
    iget-object v0, p0, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->mUpdateResults:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 308
    return-void
.end method

.method protected getAppId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 56
    const-string v0, "Error! OVERRIDE ME!"

    return-object v0
.end method

.method public getAwardPointsResponse(Ljava/lang/String;I)V
    .locals 2
    .param p1, "currencyName"    # Ljava/lang/String;
    .param p2, "pointTotal"    # I

    .prologue
    .line 282
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->update_text:Z

    .line 283
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ": "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->displayText:Ljava/lang/String;

    .line 286
    iget-object v0, p0, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->mUpdateResults:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 287
    return-void
.end method

.method public getAwardPointsResponseFailed(Ljava/lang/String;)V
    .locals 2
    .param p1, "error"    # Ljava/lang/String;

    .prologue
    .line 292
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->update_text:Z

    .line 293
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Award Points: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->displayText:Ljava/lang/String;

    .line 296
    iget-object v0, p0, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->mUpdateResults:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 297
    return-void
.end method

.method public getDisplayAdResponse(Landroid/view/View;)V
    .locals 4
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 245
    iput-object p1, p0, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->adView:Landroid/view/View;

    .line 249
    const-string v1, "EASY_APP"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "adView dimensions: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->adView:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    iget v3, v3, Landroid/view/ViewGroup$LayoutParams;->width:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "x"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->adView:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    iget v3, v3, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 252
    iget-object v1, p0, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->adView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    iget v1, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    iget-object v2, p0, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->adLinearLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v2}, Landroid/widget/LinearLayout;->getMeasuredWidth()I

    move-result v2

    if-le v1, v2, :cond_0

    .line 255
    new-instance v0, Landroid/view/ViewGroup$LayoutParams;

    iget-object v1, p0, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->adLinearLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getMeasuredWidth()I

    move-result v1

    iget-object v2, p0, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->adLinearLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v2}, Landroid/widget/LinearLayout;->getMeasuredWidth()I

    move-result v2

    mul-int/lit8 v2, v2, 0xa

    div-int/lit8 v2, v2, 0x40

    invoke-direct {v0, v1, v2}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 256
    .local v0, "layout":Landroid/view/ViewGroup$LayoutParams;
    iget-object v1, p0, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->adView:Landroid/view/View;

    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 259
    .end local v0    # "layout":Landroid/view/ViewGroup$LayoutParams;
    :cond_0
    const-string v1, "EASY_APP"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "adLinearLayout dimensions: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->adLinearLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v3}, Landroid/widget/LinearLayout;->getMeasuredWidth()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "x"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->adLinearLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v3}, Landroid/widget/LinearLayout;->getMeasuredHeight()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 261
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->update_display_ad:Z

    .line 264
    iget-object v1, p0, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->mHandler:Landroid/os/Handler;

    iget-object v2, p0, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->mUpdateResults:Ljava/lang/Runnable;

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 265
    return-void
.end method

.method public getDisplayAdResponseFailed(Ljava/lang/String;)V
    .locals 3
    .param p1, "error"    # Ljava/lang/String;

    .prologue
    .line 270
    const-string v0, "EASY_APP"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getDisplayAd error: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 272
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->update_text:Z

    .line 273
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Display Ads: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->displayText:Ljava/lang/String;

    .line 276
    iget-object v0, p0, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->mUpdateResults:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 277
    return-void
.end method

.method public getFeaturedAppResponse(Lcom/tapjoy/TapjoyFeaturedAppObject;)V
    .locals 2
    .param p1, "featuredApObject"    # Lcom/tapjoy/TapjoyFeaturedAppObject;

    .prologue
    .line 193
    const-string v0, "EASY_APP"

    const-string v1, "Displaying Featured App.."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 194
    check-cast p0, Lcom/miniclip/nativeJNI/cocojava;

    .end local p0    # "this":Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;
    invoke-static {p1}, Lcom/miniclip/nativeJNI/cocojava;->showTapJoyView(Lcom/tapjoy/TapjoyFeaturedAppObject;)V

    .line 197
    return-void
.end method

.method public getFeaturedAppResponseFailed(Ljava/lang/String;)V
    .locals 3
    .param p1, "error"    # Ljava/lang/String;

    .prologue
    .line 203
    const-string v0, "EASY_APP"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "No Featured App to display: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 205
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->update_text:Z

    .line 206
    const-string v0, "No Featured App to display."

    iput-object v0, p0, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->displayText:Ljava/lang/String;

    move-object v0, p0

    .line 209
    check-cast v0, Lcom/miniclip/nativeJNI/cocojava;

    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->tapjoy_showTapFeatureAdFailed()V

    .line 212
    iget-object v0, p0, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->mUpdateResults:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 213
    return-void
.end method

.method protected getSecretKey()Ljava/lang/String;
    .locals 1

    .prologue
    .line 61
    const-string v0, "Error! OVERRIDE ME!"

    return-object v0
.end method

.method public getSpendPointsResponse(Ljava/lang/String;I)V
    .locals 3
    .param p1, "currencyName"    # Ljava/lang/String;
    .param p2, "pointTotal"    # I

    .prologue
    .line 219
    const-string v0, "EASY_APP"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "currencyName: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 220
    const-string v0, "EASY_APP"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "pointTotal: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 222
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->update_text:Z

    .line 223
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ": "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->displayText:Ljava/lang/String;

    .line 226
    iget-object v0, p0, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->mUpdateResults:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 227
    return-void
.end method

.method public getSpendPointsResponseFailed(Ljava/lang/String;)V
    .locals 3
    .param p1, "error"    # Ljava/lang/String;

    .prologue
    .line 233
    const-string v0, "EASY_APP"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "spendTapPoints error: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 235
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->update_text:Z

    .line 236
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Spend Tap Points: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->displayText:Ljava/lang/String;

    .line 239
    iget-object v0, p0, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->mUpdateResults:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 240
    return-void
.end method

.method public getUpdatePoints(Ljava/lang/String;I)V
    .locals 4
    .param p1, "currencyName"    # Ljava/lang/String;
    .param p2, "pointTotal"    # I

    .prologue
    .line 145
    const-string v1, "EASY_APP"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "currencyName: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 146
    const-string v1, "EASY_APP"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "pointTotal: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 148
    iput-object p1, p0, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->currency_name:Ljava/lang/String;

    .line 149
    iput p2, p0, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->point_total:I

    .line 151
    move v0, p2

    .line 152
    .local v0, "pointTotalFinal":I
    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->mGLView:Lcom/miniclip/nativeJNI/ClearGLSurfaceView;

    new-instance v2, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers$2;

    invoke-direct {v2, p0, v0}, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers$2;-><init>(Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;I)V

    invoke-virtual {v1, v2}, Lcom/miniclip/nativeJNI/ClearGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    .line 159
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->update_text:Z

    .line 161
    iget-boolean v1, p0, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->earnedPoints:Z

    if-eqz v1, :cond_0

    .line 163
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->displayText:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ": "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->displayText:Ljava/lang/String;

    .line 164
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->earnedPoints:Z

    .line 172
    :goto_0
    iget-object v1, p0, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->mHandler:Landroid/os/Handler;

    iget-object v2, p0, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->mUpdateResults:Ljava/lang/Runnable;

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 173
    return-void

    .line 168
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ": "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->displayText:Ljava/lang/String;

    goto :goto_0
.end method

.method public getUpdatePointsFailed(Ljava/lang/String;)V
    .locals 3
    .param p1, "error"    # Ljava/lang/String;

    .prologue
    .line 180
    const-string v0, "EASY_APP"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getTapPoints error: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 182
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->update_text:Z

    .line 183
    const-string v0, "Unable to retrieve tap points from server."

    iput-object v0, p0, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->displayText:Ljava/lang/String;

    .line 186
    iget-object v0, p0, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->mUpdateResults:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 187
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 67
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 71
    const/4 v0, 0x1

    invoke-static {v0}, Lcom/tapjoy/TapjoyLog;->enableLogging(Z)V

    .line 76
    sget-boolean v0, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->mUSE_TAPJOY:Z

    if-eqz v0, :cond_0

    .line 77
    invoke-virtual {p0}, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0}, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->getAppId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->getSecretKey()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/tapjoy/TapjoyConnect;->requestTapjoyConnect(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 83
    invoke-static {}, Lcom/tapjoy/TapjoyConnect;->getTapjoyConnectInstance()Lcom/tapjoy/TapjoyConnect;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/tapjoy/TapjoyConnect;->setEarnedPointsNotifier(Lcom/tapjoy/TapjoyEarnedPointsNotifier;)V

    .line 85
    :cond_0
    return-void
.end method

.method protected onDestroy()V
    .locals 0

    .prologue
    .line 90
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 91
    return-void
.end method

.method protected onResume()V
    .locals 0

    .prologue
    .line 96
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 97
    return-void
.end method
