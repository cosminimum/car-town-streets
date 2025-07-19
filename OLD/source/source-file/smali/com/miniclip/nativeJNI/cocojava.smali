.class public Lcom/miniclip/nativeJNI/cocojava;
.super Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;
.source "cocojava.java"

# interfaces
.implements Lcom/mopub/mobileads/MoPubInterstitial$MoPubInterstitialListener;
.implements Landroid/content/DialogInterface$OnClickListener;
.implements Landroid/view/View$OnClickListener;
.implements Lcom/mopub/mobileads/MoPubView$OnAdLoadedListener;
.implements Lcom/mopub/mobileads/MoPubView$OnAdFailedListener;
.implements Lcom/mopub/mobileads/MoPubView$OnAdClickedListener;


# static fields
.field static final synthetic $assertionsDisabled:Z

.field public static ALIGN_LEFT:I = 0x0

.field public static ALIGN_RIGHT:I = 0x0

.field public static FILENAME:Ljava/lang/String; = null

.field private static GAME_MENU_STATE:I = 0x0

.field private static final HANDLER_CLOSE_DIALOG:I = 0x3

.field private static final HANDLER_EXIT_APP:I = 0x5

.field private static final HANDLER_HIDE_DIALOG:I = 0x2

.field private static final HANDLER_OPEN_URL:I = 0x4

.field private static final HANDLER_SHOW_DIALOG:I = 0x1

.field protected static accelerometer:Lcom/miniclip/nativeJNI/cocoaccel;

.field private static accelerometerEnabled:Z

.field public static adLayout:Landroid/widget/RelativeLayout;

.field public static adLayoutH:Landroid/widget/RelativeLayout;

.field private static adViewGame:Lcom/mopub/mobileads/MoPubView;

.field private static adViewMenu:Lcom/mopub/mobileads/MoPubView;

.field private static backgroundMusicPlayer:Lcom/miniclip/nativeJNI/cocomusic;

.field private static bigAd:Lcom/mopub/mobileads/MoPubView;

.field private static inAppsRemoveAds:Z

.field private static interstitial:Lcom/mopub/mobileads/MoPubInterstitial;

.field public static layout:Landroid/widget/RelativeLayout;

.field protected static mADS_BLOCKED_NOW:Z

.field private static mAdDelayHandler:Landroid/os/Handler;

.field private static mBigAdView:Landroid/widget/RelativeLayout;

.field public static mBlockNewsButton:Z

.field private static mCenterdAd:Landroid/widget/RelativeLayout;

.field protected static mConstantAd:Z

.field protected static mContext:Landroid/content/Context;

.field protected static mCurrentNewsfeed:Lcom/miniclip/newsfeed/Newsfeed;

.field protected static mCurrentNewsfeedDialog:Lcom/miniclip/newsfeed/NewsfeedDialog;

.field protected static mCustomInApp:Z

.field protected static mCustomLeaderboard:Z

.field public static mDensity:F

.field public static mDeviceID:Ljava/lang/String;

.field protected static mENOUGH_MEMORY:Z

.field public static mEditText:Landroid/widget/EditText;

.field private static mFB_AuthenticationRequested:Z

.field public static mFB_Session:Lcom/facebook/Session;

.field public static mFacebookAPP_ID:Ljava/lang/String;

.field private static mFacebookHandler:Landroid/os/Handler;

.field protected static mFeaturedApObject:Lcom/tapjoy/TapjoyFeaturedAppObject;

.field protected static mFullscreenInterstitial:Lcom/miniclip/nativeJNI/interstitialMopubView;

.field public static mGLView:Lcom/miniclip/nativeJNI/ClearGLSurfaceView;

.field private static mGameState:I

.field protected static mHAS_RETINA:Z

.field private static mHandler:Landroid/os/Handler;

.field protected static mHasSecondIntro:Z

.field private static mHasWindowFocus:Z

.field public static mHeight:I

.field private static mHideAdsRun:Ljava/lang/Runnable;

.field private static mHorizontalBanner:Lcom/miniclip/nativeJNI/horizontalBanner;

.field public static mHorizontalBannerDisplayed:Z

.field protected static mINGAME_HEIGHT:F

.field public static mINGAME_LANDSCAPE:Z

.field protected static mINGAME_SCALE:Z

.field protected static mINGAME_WIDTH:F

.field public static mInAppCallback:I

.field public static mInAppManaged:Z

.field public static mInAppProductId:Ljava/lang/String;

.field public static mInAppResponce:I

.field public static mInAppSelf:I

.field public static mInAppTitle:Ljava/lang/String;

.field private static mInfoTransmitter:Lcom/miniclip/nativeJNI/infoTransmitter;

.field private static mInitView:Landroid/widget/RelativeLayout;

.field private static mInterstitialBanner:Lcom/miniclip/nativeJNI/interstitialBanner;

.field public static mKEYBOARD_CUSTOM_BACKGROUND:Z

.field public static mKEYBOARD_FULLSCREEN:Z

.field public static mKEYBOARD_INPUT_HIDE:Z

.field public static mKEYBOARD_INPUT_SINGLE_LINE:Z

.field public static mKEYBOARD_OVERRIDE_VISIBILITY:Z

.field private static mKeyboardHandler:Landroid/os/Handler;

.field protected static mLastBigAdType:I

.field protected static mMinimumResolutionSD:Z

.field private static mMopubInterstitial:Lcom/miniclip/nativeJNI/MopubInterstitial;

.field private static mMopubView:Lcom/miniclip/nativeJNI/MopubView;

.field private static mNtpHandler:Lcom/miniclip/NTP/NtpHandler;

.field protected static mNumCrashes:I

.field protected static mNumUpSellsThisSession:I

.field private static mPingHandler:Lcom/miniclip/Ping/PingHandler;

.field public static mPrefs:Landroid/content/SharedPreferences;

.field private static mRemove1:Landroid/widget/Button;

.field public static mRemoveAdsButton:Landroid/widget/ImageView;

.field public static mRemoveAdsButtonHidden:Z

.field public static mRemoveAdsButtonLayout:Landroid/widget/RelativeLayout;

.field public static mRenderer:Lcom/miniclip/nativeJNI/ClearRenderer;

.field private static mResumeOnFocus:Z

.field private static mRotatedBanner:Lcom/miniclip/nativeJNI/rotatedBannerImg;

.field public static mRotatedBannerDisplayed:I

.field public static mSHOW_KEYBOARD_INPUT:Z

.field public static mSPINNING_ANIMATION:Z

.field protected static mSTORE_PENDING_PURCHASES:Z

.field protected static mSTORE_PENDING_PURCHASES_SIGNATURE:Z

.field private static mSkip1:Landroid/widget/Button;

.field public static mTEST_INAPPS:Z

.field protected static mUSE_ADS:Z

.field protected static mUSE_ADS_BIG:Z

.field protected static mUSE_ADS_HORIZONTAL:Z

.field protected static mUSE_ADS_HORIZONTAL_BANNER_OFFSET:F

.field protected static mUSE_ADS_INTERSTITIAL_BANNER:Z

.field protected static mUSE_ADS_INTERSTITIAL_FULLSCREEN:Z

.field protected static mUSE_ADS_VERTICAL:Z

.field protected static mUSE_ADS_VERTICAL_BANNER_OFFSET:F

.field public static mUSE_C2DM:Z

.field protected static mUSE_DEVICEID:Z

.field public static mUSE_FACEBOOK:Z

.field protected static mUSE_NEWSFEED:Z

.field protected static mUSE_PRESERVE_CONTEXT:Z

.field public static mUSE_REMOVE_ADS:Z

.field public static mWidth:I

.field public static sideBar1:Landroid/widget/RelativeLayout;

.field public static sideBar2:Landroid/widget/RelativeLayout;

.field protected static soundPlayer:Lcom/miniclip/nativeJNI/cocosound;

.field private static texture:Lcom/miniclip/nativeJNI/cocotexture;


# instance fields
.field private isFirstRun:Z

.field private mDialogs:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Integer;",
            "Landroid/app/Dialog;",
            ">;"
        }
    .end annotation
.end field

.field private mScreenFixHandler:Landroid/os/Handler;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x0

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 161
    const-class v0, Lcom/miniclip/nativeJNI/cocojava;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    move v0, v1

    :goto_0
    sput-boolean v0, Lcom/miniclip/nativeJNI/cocojava;->$assertionsDisabled:Z

    .line 167
    sput v2, Lcom/miniclip/nativeJNI/cocojava;->GAME_MENU_STATE:I

    .line 175
    sput v2, Lcom/miniclip/nativeJNI/cocojava;->ALIGN_LEFT:I

    .line 176
    sput v1, Lcom/miniclip/nativeJNI/cocojava;->ALIGN_RIGHT:I

    .line 200
    sput-object v3, Lcom/miniclip/nativeJNI/cocojava;->mRenderer:Lcom/miniclip/nativeJNI/ClearRenderer;

    .line 201
    sput-boolean v1, Lcom/miniclip/nativeJNI/cocojava;->mUSE_PRESERVE_CONTEXT:Z

    .line 202
    sput-boolean v1, Lcom/miniclip/nativeJNI/cocojava;->mUSE_ADS:Z

    .line 203
    const/high16 v0, 0x43f00000    # 480.0f

    sput v0, Lcom/miniclip/nativeJNI/cocojava;->mINGAME_WIDTH:F

    .line 204
    const/high16 v0, 0x43a00000    # 320.0f

    sput v0, Lcom/miniclip/nativeJNI/cocojava;->mINGAME_HEIGHT:F

    .line 205
    sput-boolean v2, Lcom/miniclip/nativeJNI/cocojava;->mINGAME_SCALE:Z

    .line 206
    sput-boolean v2, Lcom/miniclip/nativeJNI/cocojava;->mMinimumResolutionSD:Z

    .line 207
    sput-boolean v1, Lcom/miniclip/nativeJNI/cocojava;->mINGAME_LANDSCAPE:Z

    .line 208
    sput-object v3, Lcom/miniclip/nativeJNI/cocojava;->mMopubInterstitial:Lcom/miniclip/nativeJNI/MopubInterstitial;

    .line 210
    sput-boolean v1, Lcom/miniclip/nativeJNI/cocojava;->mRemoveAdsButtonHidden:Z

    .line 212
    sput-boolean v2, Lcom/miniclip/nativeJNI/cocojava;->mUSE_REMOVE_ADS:Z

    .line 213
    sput-boolean v2, Lcom/miniclip/nativeJNI/cocojava;->mBlockNewsButton:Z

    .line 214
    sput-boolean v2, Lcom/miniclip/nativeJNI/cocojava;->mTEST_INAPPS:Z

    .line 215
    sput-boolean v2, Lcom/miniclip/nativeJNI/cocojava;->mSPINNING_ANIMATION:Z

    .line 218
    sput-boolean v2, Lcom/miniclip/nativeJNI/cocojava;->mSHOW_KEYBOARD_INPUT:Z

    .line 219
    sput-boolean v2, Lcom/miniclip/nativeJNI/cocojava;->mKEYBOARD_INPUT_SINGLE_LINE:Z

    .line 220
    sput-boolean v1, Lcom/miniclip/nativeJNI/cocojava;->mKEYBOARD_INPUT_HIDE:Z

    .line 221
    sput-boolean v2, Lcom/miniclip/nativeJNI/cocojava;->mKEYBOARD_OVERRIDE_VISIBILITY:Z

    .line 222
    sput-boolean v1, Lcom/miniclip/nativeJNI/cocojava;->mKEYBOARD_FULLSCREEN:Z

    .line 223
    sput-boolean v2, Lcom/miniclip/nativeJNI/cocojava;->mKEYBOARD_CUSTOM_BACKGROUND:Z

    .line 225
    sput-object v3, Lcom/miniclip/nativeJNI/cocojava;->mMopubView:Lcom/miniclip/nativeJNI/MopubView;

    .line 236
    sput-object v3, Lcom/miniclip/nativeJNI/cocojava;->mHandler:Landroid/os/Handler;

    .line 237
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    sput-object v0, Lcom/miniclip/nativeJNI/cocojava;->mAdDelayHandler:Landroid/os/Handler;

    .line 238
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    sput-object v0, Lcom/miniclip/nativeJNI/cocojava;->mKeyboardHandler:Landroid/os/Handler;

    .line 239
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    sput-object v0, Lcom/miniclip/nativeJNI/cocojava;->mFacebookHandler:Landroid/os/Handler;

    .line 242
    sput-boolean v2, Lcom/miniclip/nativeJNI/cocojava;->inAppsRemoveAds:Z

    .line 248
    sput v2, Lcom/miniclip/nativeJNI/cocojava;->mLastBigAdType:I

    .line 249
    sput-boolean v1, Lcom/miniclip/nativeJNI/cocojava;->mConstantAd:Z

    .line 258
    sput v2, Lcom/miniclip/nativeJNI/cocojava;->mRotatedBannerDisplayed:I

    .line 261
    sput v2, Lcom/miniclip/nativeJNI/cocojava;->mNumUpSellsThisSession:I

    .line 262
    const-string v0, ""

    sput-object v0, Lcom/miniclip/nativeJNI/cocojava;->mDeviceID:Ljava/lang/String;

    .line 264
    sput-boolean v1, Lcom/miniclip/nativeJNI/cocojava;->mUSE_ADS_BIG:Z

    .line 265
    sput-boolean v2, Lcom/miniclip/nativeJNI/cocojava;->mUSE_ADS_VERTICAL:Z

    .line 266
    sput-boolean v2, Lcom/miniclip/nativeJNI/cocojava;->mUSE_ADS_INTERSTITIAL_BANNER:Z

    .line 267
    sput-boolean v2, Lcom/miniclip/nativeJNI/cocojava;->mUSE_ADS_INTERSTITIAL_FULLSCREEN:Z

    .line 268
    sput-boolean v2, Lcom/miniclip/nativeJNI/cocojava;->mADS_BLOCKED_NOW:Z

    .line 271
    sput-object v3, Lcom/miniclip/nativeJNI/cocojava;->mFullscreenInterstitial:Lcom/miniclip/nativeJNI/interstitialMopubView;

    .line 273
    sput v4, Lcom/miniclip/nativeJNI/cocojava;->mUSE_ADS_VERTICAL_BANNER_OFFSET:F

    .line 275
    sput-boolean v2, Lcom/miniclip/nativeJNI/cocojava;->mUSE_ADS_HORIZONTAL:Z

    .line 276
    sput v4, Lcom/miniclip/nativeJNI/cocojava;->mUSE_ADS_HORIZONTAL_BANNER_OFFSET:F

    .line 277
    sput-object v3, Lcom/miniclip/nativeJNI/cocojava;->mHorizontalBanner:Lcom/miniclip/nativeJNI/horizontalBanner;

    .line 278
    sput-boolean v2, Lcom/miniclip/nativeJNI/cocojava;->mHorizontalBannerDisplayed:Z

    .line 280
    sput-object v3, Lcom/miniclip/nativeJNI/cocojava;->mEditText:Landroid/widget/EditText;

    .line 284
    const-string v0, "AndroidSSO_data"

    sput-object v0, Lcom/miniclip/nativeJNI/cocojava;->FILENAME:Ljava/lang/String;

    .line 289
    sput-boolean v2, Lcom/miniclip/nativeJNI/cocojava;->mFB_AuthenticationRequested:Z

    .line 292
    sput-boolean v2, Lcom/miniclip/nativeJNI/cocojava;->mResumeOnFocus:Z

    .line 293
    sput-boolean v2, Lcom/miniclip/nativeJNI/cocojava;->mHAS_RETINA:Z

    .line 294
    sput-boolean v2, Lcom/miniclip/nativeJNI/cocojava;->mCustomInApp:Z

    .line 295
    sput-boolean v1, Lcom/miniclip/nativeJNI/cocojava;->mUSE_NEWSFEED:Z

    .line 296
    sput-boolean v1, Lcom/miniclip/nativeJNI/cocojava;->mUSE_DEVICEID:Z

    .line 297
    sput-boolean v2, Lcom/miniclip/nativeJNI/cocojava;->mUSE_C2DM:Z

    .line 299
    sput-boolean v2, Lcom/miniclip/nativeJNI/cocojava;->mSTORE_PENDING_PURCHASES:Z

    .line 300
    sput-boolean v2, Lcom/miniclip/nativeJNI/cocojava;->mSTORE_PENDING_PURCHASES_SIGNATURE:Z

    .line 302
    sput-object v3, Lcom/miniclip/nativeJNI/cocojava;->mCurrentNewsfeedDialog:Lcom/miniclip/newsfeed/NewsfeedDialog;

    .line 303
    sput-object v3, Lcom/miniclip/nativeJNI/cocojava;->mCurrentNewsfeed:Lcom/miniclip/newsfeed/Newsfeed;

    .line 305
    sput-boolean v2, Lcom/miniclip/nativeJNI/cocojava;->mHasSecondIntro:Z

    .line 306
    sput-boolean v1, Lcom/miniclip/nativeJNI/cocojava;->mENOUGH_MEMORY:Z

    .line 312
    sput-boolean v2, Lcom/miniclip/nativeJNI/cocojava;->mCustomLeaderboard:Z

    .line 314
    sput v2, Lcom/miniclip/nativeJNI/cocojava;->mNumCrashes:I

    .line 316
    sput-boolean v2, Lcom/miniclip/nativeJNI/cocojava;->mUSE_FACEBOOK:Z

    .line 318
    new-instance v0, Lcom/miniclip/NTP/NtpHandler;

    invoke-direct {v0}, Lcom/miniclip/NTP/NtpHandler;-><init>()V

    sput-object v0, Lcom/miniclip/nativeJNI/cocojava;->mNtpHandler:Lcom/miniclip/NTP/NtpHandler;

    .line 320
    new-instance v0, Lcom/miniclip/Ping/PingHandler;

    invoke-direct {v0}, Lcom/miniclip/Ping/PingHandler;-><init>()V

    sput-object v0, Lcom/miniclip/nativeJNI/cocojava;->mPingHandler:Lcom/miniclip/Ping/PingHandler;

    .line 2033
    new-instance v0, Lcom/miniclip/nativeJNI/cocojava$29;

    invoke-direct {v0}, Lcom/miniclip/nativeJNI/cocojava$29;-><init>()V

    sput-object v0, Lcom/miniclip/nativeJNI/cocojava;->mHideAdsRun:Ljava/lang/Runnable;

    .line 2765
    sput-boolean v2, Lcom/miniclip/nativeJNI/cocojava;->accelerometerEnabled:Z

    return-void

    :cond_0
    move v0, v2

    .line 161
    goto/16 :goto_0
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 161
    invoke-direct {p0}, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;-><init>()V

    .line 241
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miniclip/nativeJNI/cocojava;->isFirstRun:Z

    .line 308
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/miniclip/nativeJNI/cocojava;->mScreenFixHandler:Landroid/os/Handler;

    return-void
.end method

.method public static DeviceSupportsMultitouch()I
    .locals 2

    .prologue
    .line 4048
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    const-string v1, "android.hardware.touchscreen.multitouch"

    invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static NF_dismissBoard()V
    .locals 2

    .prologue
    .line 4307
    sget-boolean v0, Lcom/miniclip/nativeJNI/cocojava;->mUSE_NEWSFEED:Z

    if-eqz v0, :cond_0

    .line 4308
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mCurrentNewsfeedDialog:Lcom/miniclip/newsfeed/NewsfeedDialog;

    if-eqz v0, :cond_0

    .line 4309
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/miniclip/nativeJNI/cocojava$76;

    invoke-direct {v1}, Lcom/miniclip/nativeJNI/cocojava$76;-><init>()V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 4317
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mGLView:Lcom/miniclip/nativeJNI/ClearGLSurfaceView;

    new-instance v1, Lcom/miniclip/nativeJNI/cocojava$77;

    invoke-direct {v1}, Lcom/miniclip/nativeJNI/cocojava$77;-><init>()V

    invoke-virtual {v0, v1}, Lcom/miniclip/nativeJNI/ClearGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    .line 4327
    :cond_0
    return-void
.end method

.method public static NF_setSandBox(I)V
    .locals 2
    .param p0, "sandBoxMode"    # I

    .prologue
    .line 4336
    sget-boolean v0, Lcom/miniclip/nativeJNI/cocojava;->mUSE_NEWSFEED:Z

    if-eqz v0, :cond_0

    .line 4337
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mCurrentNewsfeed:Lcom/miniclip/newsfeed/Newsfeed;

    if-eqz v0, :cond_0

    .line 4338
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/miniclip/nativeJNI/cocojava$78;

    invoke-direct {v1, p0}, Lcom/miniclip/nativeJNI/cocojava$78;-><init>(I)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 4346
    :cond_0
    return-void
.end method

.method public static NF_setShowBadge(I)V
    .locals 2
    .param p0, "showBadge"    # I

    .prologue
    .line 4349
    const-string v0, "cocojava"

    const-string v1, "NF_setShowBadge: deprecated method"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 4350
    return-void
.end method

.method public static NF_showBoard()I
    .locals 3

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 4240
    sget-boolean v2, Lcom/miniclip/nativeJNI/cocojava;->mUSE_NEWSFEED:Z

    if-eqz v2, :cond_0

    .line 4241
    sget-object v2, Lcom/miniclip/nativeJNI/cocojava;->mCurrentNewsfeed:Lcom/miniclip/newsfeed/Newsfeed;

    iget v2, v2, Lcom/miniclip/newsfeed/Newsfeed;->messagesNum:I

    if-ge v2, v1, :cond_1

    .line 4267
    :cond_0
    :goto_0
    return v0

    .line 4244
    :cond_1
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    new-instance v2, Lcom/miniclip/nativeJNI/cocojava$72;

    invoke-direct {v2}, Lcom/miniclip/nativeJNI/cocojava$72;-><init>()V

    invoke-virtual {v0, v2}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 4256
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mGLView:Lcom/miniclip/nativeJNI/ClearGLSurfaceView;

    new-instance v2, Lcom/miniclip/nativeJNI/cocojava$73;

    invoke-direct {v2}, Lcom/miniclip/nativeJNI/cocojava$73;-><init>()V

    invoke-virtual {v0, v2}, Lcom/miniclip/nativeJNI/ClearGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    move v0, v1

    .line 4265
    goto :goto_0
.end method

.method public static NF_showUrgentBoard()I
    .locals 3

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 4271
    sget-boolean v2, Lcom/miniclip/nativeJNI/cocojava;->mUSE_NEWSFEED:Z

    if-eqz v2, :cond_0

    .line 4272
    sget-object v2, Lcom/miniclip/nativeJNI/cocojava;->mCurrentNewsfeed:Lcom/miniclip/newsfeed/Newsfeed;

    iget v2, v2, Lcom/miniclip/newsfeed/Newsfeed;->messagesNumUrgent:I

    if-ge v2, v1, :cond_1

    .line 4303
    :cond_0
    :goto_0
    return v0

    .line 4275
    :cond_1
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    new-instance v2, Lcom/miniclip/nativeJNI/cocojava$74;

    invoke-direct {v2}, Lcom/miniclip/nativeJNI/cocojava$74;-><init>()V

    invoke-virtual {v0, v2}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 4291
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mGLView:Lcom/miniclip/nativeJNI/ClearGLSurfaceView;

    new-instance v2, Lcom/miniclip/nativeJNI/cocojava$75;

    invoke-direct {v2}, Lcom/miniclip/nativeJNI/cocojava$75;-><init>()V

    invoke-virtual {v0, v2}, Lcom/miniclip/nativeJNI/ClearGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    move v0, v1

    .line 4300
    goto :goto_0
.end method

.method public static NTP_JAVA_getOffsetFromServer(Ljava/lang/String;)D
    .locals 3
    .param p0, "serverName"    # Ljava/lang/String;

    .prologue
    .line 4224
    :try_start_0
    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->mNtpHandler:Lcom/miniclip/NTP/NtpHandler;

    invoke-virtual {v1, p0}, Lcom/miniclip/NTP/NtpHandler;->getOffsetFromServer(Ljava/lang/String;)D
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v1

    .line 4228
    :goto_0
    return-wide v1

    .line 4225
    :catch_0
    move-exception v0

    .line 4226
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 4228
    const-wide/16 v1, 0x0

    goto :goto_0
.end method

.method public static NTP_JAVA_getOffsetFromServerListAsync(Ljava/lang/String;II)V
    .locals 1
    .param p0, "serverNames"    # Ljava/lang/String;
    .param p1, "callback"    # I
    .param p2, "timeout"    # I

    .prologue
    .line 4232
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mNtpHandler:Lcom/miniclip/NTP/NtpHandler;

    invoke-virtual {v0, p0, p1, p2}, Lcom/miniclip/NTP/NtpHandler;->getOffsetFromServerListAsync(Ljava/lang/String;II)V

    .line 4233
    return-void
.end method

.method public static Newsfeed_getNumber()I
    .locals 1

    .prologue
    .line 4035
    const/4 v0, 0x0

    return v0
.end method

.method public static Newsfeed_showDialog()V
    .locals 0

    .prologue
    .line 4045
    return-void
.end method

.method public static PING_JAVA_simplePingAsync(Ljava/lang/String;II)V
    .locals 1
    .param p0, "serverName"    # Ljava/lang/String;
    .param p1, "callback"    # I
    .param p2, "timeout"    # I

    .prologue
    .line 4236
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mPingHandler:Lcom/miniclip/Ping/PingHandler;

    invoke-virtual {v0, p0, p1, p2}, Lcom/miniclip/Ping/PingHandler;->simplePingAsync(Ljava/lang/String;II)V

    .line 4237
    return-void
.end method

.method public static SharedPreferences_getInt(Ljava/lang/String;)I
    .locals 4
    .param p0, "key"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 2602
    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v1, Landroid/app/Activity;

    const-string v2, "GAME_INFO"

    invoke-virtual {v1, v2, v3}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 2604
    .local v0, "prefs":Landroid/content/SharedPreferences;
    invoke-interface {v0, p0, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    return v1
.end method

.method public static SharedPreferences_getString(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "key"    # Ljava/lang/String;

    .prologue
    .line 2616
    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v1, Landroid/app/Activity;

    const-string v2, "GAME_INFO"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 2618
    .local v0, "prefs":Landroid/content/SharedPreferences;
    const-string v1, ""

    invoke-interface {v0, p0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static SharedPreferences_setInt(Ljava/lang/String;I)V
    .locals 5
    .param p0, "key"    # Ljava/lang/String;
    .param p1, "value"    # I

    .prologue
    .line 2594
    sget-object v2, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v2, Landroid/app/Activity;

    const-string v3, "GAME_INFO"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 2596
    .local v1, "settings":Landroid/content/SharedPreferences;
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 2597
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    invoke-interface {v0, p0, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 2598
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 2599
    return-void
.end method

.method public static SharedPreferences_setString(Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .param p0, "key"    # Ljava/lang/String;
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 2608
    sget-object v2, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v2, Landroid/app/Activity;

    const-string v3, "GAME_INFO"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 2610
    .local v1, "settings":Landroid/content/SharedPreferences;
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 2611
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    invoke-interface {v0, p0, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 2612
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 2613
    return-void
.end method

.method static synthetic access$000(Lcom/miniclip/nativeJNI/cocojava;)V
    .locals 0
    .param p0, "x0"    # Lcom/miniclip/nativeJNI/cocojava;

    .prologue
    .line 161
    invoke-direct {p0}, Lcom/miniclip/nativeJNI/cocojava;->setSystemUiVisibility()V

    return-void
.end method

.method static synthetic access$100(Lcom/miniclip/nativeJNI/cocojava;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/miniclip/nativeJNI/cocojava;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 161
    invoke-direct {p0, p1}, Lcom/miniclip/nativeJNI/cocojava;->openURL(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1000()Landroid/widget/RelativeLayout;
    .locals 1

    .prologue
    .line 161
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mInitView:Landroid/widget/RelativeLayout;

    return-object v0
.end method

.method static synthetic access$1100()Lcom/miniclip/nativeJNI/rotatedBannerImg;
    .locals 1

    .prologue
    .line 161
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mRotatedBanner:Lcom/miniclip/nativeJNI/rotatedBannerImg;

    return-object v0
.end method

.method static synthetic access$1102(Lcom/miniclip/nativeJNI/rotatedBannerImg;)Lcom/miniclip/nativeJNI/rotatedBannerImg;
    .locals 0
    .param p0, "x0"    # Lcom/miniclip/nativeJNI/rotatedBannerImg;

    .prologue
    .line 161
    sput-object p0, Lcom/miniclip/nativeJNI/cocojava;->mRotatedBanner:Lcom/miniclip/nativeJNI/rotatedBannerImg;

    return-object p0
.end method

.method static synthetic access$1200()Lcom/miniclip/nativeJNI/horizontalBanner;
    .locals 1

    .prologue
    .line 161
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mHorizontalBanner:Lcom/miniclip/nativeJNI/horizontalBanner;

    return-object v0
.end method

.method static synthetic access$1202(Lcom/miniclip/nativeJNI/horizontalBanner;)Lcom/miniclip/nativeJNI/horizontalBanner;
    .locals 0
    .param p0, "x0"    # Lcom/miniclip/nativeJNI/horizontalBanner;

    .prologue
    .line 161
    sput-object p0, Lcom/miniclip/nativeJNI/cocojava;->mHorizontalBanner:Lcom/miniclip/nativeJNI/horizontalBanner;

    return-object p0
.end method

.method static synthetic access$1300()Lcom/miniclip/nativeJNI/interstitialBanner;
    .locals 1

    .prologue
    .line 161
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mInterstitialBanner:Lcom/miniclip/nativeJNI/interstitialBanner;

    return-object v0
.end method

.method static synthetic access$1400()Z
    .locals 1

    .prologue
    .line 161
    sget-boolean v0, Lcom/miniclip/nativeJNI/cocojava;->mFB_AuthenticationRequested:Z

    return v0
.end method

.method static synthetic access$1402(Z)Z
    .locals 0
    .param p0, "x0"    # Z

    .prologue
    .line 161
    sput-boolean p0, Lcom/miniclip/nativeJNI/cocojava;->mFB_AuthenticationRequested:Z

    return p0
.end method

.method static synthetic access$1500()Landroid/os/Handler;
    .locals 1

    .prologue
    .line 161
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mFacebookHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$200()Landroid/widget/RelativeLayout;
    .locals 1

    .prologue
    .line 161
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mBigAdView:Landroid/widget/RelativeLayout;

    return-object v0
.end method

.method static synthetic access$202(Landroid/widget/RelativeLayout;)Landroid/widget/RelativeLayout;
    .locals 0
    .param p0, "x0"    # Landroid/widget/RelativeLayout;

    .prologue
    .line 161
    sput-object p0, Lcom/miniclip/nativeJNI/cocojava;->mBigAdView:Landroid/widget/RelativeLayout;

    return-object p0
.end method

.method static synthetic access$300()Landroid/widget/RelativeLayout;
    .locals 1

    .prologue
    .line 161
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mCenterdAd:Landroid/widget/RelativeLayout;

    return-object v0
.end method

.method static synthetic access$302(Landroid/widget/RelativeLayout;)Landroid/widget/RelativeLayout;
    .locals 0
    .param p0, "x0"    # Landroid/widget/RelativeLayout;

    .prologue
    .line 161
    sput-object p0, Lcom/miniclip/nativeJNI/cocojava;->mCenterdAd:Landroid/widget/RelativeLayout;

    return-object p0
.end method

.method static synthetic access$400()Landroid/widget/Button;
    .locals 1

    .prologue
    .line 161
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mSkip1:Landroid/widget/Button;

    return-object v0
.end method

.method static synthetic access$402(Landroid/widget/Button;)Landroid/widget/Button;
    .locals 0
    .param p0, "x0"    # Landroid/widget/Button;

    .prologue
    .line 161
    sput-object p0, Lcom/miniclip/nativeJNI/cocojava;->mSkip1:Landroid/widget/Button;

    return-object p0
.end method

.method static synthetic access$500()Landroid/widget/Button;
    .locals 1

    .prologue
    .line 161
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mRemove1:Landroid/widget/Button;

    return-object v0
.end method

.method static synthetic access$502(Landroid/widget/Button;)Landroid/widget/Button;
    .locals 0
    .param p0, "x0"    # Landroid/widget/Button;

    .prologue
    .line 161
    sput-object p0, Lcom/miniclip/nativeJNI/cocojava;->mRemove1:Landroid/widget/Button;

    return-object p0
.end method

.method static synthetic access$600()Lcom/miniclip/nativeJNI/MopubView;
    .locals 1

    .prologue
    .line 161
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mMopubView:Lcom/miniclip/nativeJNI/MopubView;

    return-object v0
.end method

.method static synthetic access$602(Lcom/miniclip/nativeJNI/MopubView;)Lcom/miniclip/nativeJNI/MopubView;
    .locals 0
    .param p0, "x0"    # Lcom/miniclip/nativeJNI/MopubView;

    .prologue
    .line 161
    sput-object p0, Lcom/miniclip/nativeJNI/cocojava;->mMopubView:Lcom/miniclip/nativeJNI/MopubView;

    return-object p0
.end method

.method static synthetic access$700()Lcom/miniclip/nativeJNI/MopubInterstitial;
    .locals 1

    .prologue
    .line 161
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mMopubInterstitial:Lcom/miniclip/nativeJNI/MopubInterstitial;

    return-object v0
.end method

.method static synthetic access$702(Lcom/miniclip/nativeJNI/MopubInterstitial;)Lcom/miniclip/nativeJNI/MopubInterstitial;
    .locals 0
    .param p0, "x0"    # Lcom/miniclip/nativeJNI/MopubInterstitial;

    .prologue
    .line 161
    sput-object p0, Lcom/miniclip/nativeJNI/cocojava;->mMopubInterstitial:Lcom/miniclip/nativeJNI/MopubInterstitial;

    return-object p0
.end method

.method static synthetic access$800()Lcom/mopub/mobileads/MoPubView;
    .locals 1

    .prologue
    .line 161
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->adViewGame:Lcom/mopub/mobileads/MoPubView;

    return-object v0
.end method

.method static synthetic access$802(Lcom/mopub/mobileads/MoPubView;)Lcom/mopub/mobileads/MoPubView;
    .locals 0
    .param p0, "x0"    # Lcom/mopub/mobileads/MoPubView;

    .prologue
    .line 161
    sput-object p0, Lcom/miniclip/nativeJNI/cocojava;->adViewGame:Lcom/mopub/mobileads/MoPubView;

    return-object p0
.end method

.method static synthetic access$900()Lcom/mopub/mobileads/MoPubView;
    .locals 1

    .prologue
    .line 161
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->adViewMenu:Lcom/mopub/mobileads/MoPubView;

    return-object v0
.end method

.method static synthetic access$902(Lcom/mopub/mobileads/MoPubView;)Lcom/mopub/mobileads/MoPubView;
    .locals 0
    .param p0, "x0"    # Lcom/mopub/mobileads/MoPubView;

    .prologue
    .line 161
    sput-object p0, Lcom/miniclip/nativeJNI/cocojava;->adViewMenu:Lcom/mopub/mobileads/MoPubView;

    return-object p0
.end method

.method public static availableMemoryOnDevice()F
    .locals 11

    .prologue
    .line 2859
    new-instance v6, Landroid/os/StatFs;

    sget-object v9, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    invoke-virtual {v9}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v9

    invoke-virtual {v9}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v6, v9}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    .line 2860
    .local v6, "statFs":Landroid/os/StatFs;
    invoke-virtual {v6}, Landroid/os/StatFs;->getBlockSize()I

    move-result v9

    int-to-long v2, v9

    .line 2861
    .local v2, "blockSize":J
    invoke-virtual {v6}, Landroid/os/StatFs;->getBlockCount()I

    move-result v9

    int-to-long v9, v9

    mul-long v7, v9, v2

    .line 2862
    .local v7, "totalSize":J
    invoke-virtual {v6}, Landroid/os/StatFs;->getAvailableBlocks()I

    move-result v9

    int-to-long v9, v9

    mul-long v0, v9, v2

    .line 2863
    .local v0, "availableSize":J
    invoke-virtual {v6}, Landroid/os/StatFs;->getFreeBlocks()I

    move-result v9

    int-to-long v9, v9

    mul-long v4, v9, v2

    .line 2865
    .local v4, "freeSize":J
    const-wide/32 v9, 0x100000

    div-long v9, v4, v9

    long-to-float v9, v9

    return v9
.end method

.method public static availableMemoryOnSDcard()F
    .locals 11

    .prologue
    .line 2869
    new-instance v6, Landroid/os/StatFs;

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v9

    invoke-virtual {v9}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v6, v9}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    .line 2871
    .local v6, "statFs":Landroid/os/StatFs;
    invoke-virtual {v6}, Landroid/os/StatFs;->getBlockSize()I

    move-result v9

    int-to-long v2, v9

    .line 2872
    .local v2, "blockSize":J
    invoke-virtual {v6}, Landroid/os/StatFs;->getBlockCount()I

    move-result v9

    int-to-long v9, v9

    mul-long v7, v9, v2

    .line 2873
    .local v7, "totalSize":J
    invoke-virtual {v6}, Landroid/os/StatFs;->getAvailableBlocks()I

    move-result v9

    int-to-long v9, v9

    mul-long v0, v9, v2

    .line 2874
    .local v0, "availableSize":J
    invoke-virtual {v6}, Landroid/os/StatFs;->getFreeBlocks()I

    move-result v9

    int-to-long v9, v9

    mul-long v4, v9, v2

    .line 2876
    .local v4, "freeSize":J
    const-wide/32 v9, 0x100000

    div-long v9, v4, v9

    long-to-float v9, v9

    return v9
.end method

.method public static callInAppGetJar(Ljava/lang/String;ILjava/lang/String;III)V
    .locals 8
    .param p0, "itemID"    # Ljava/lang/String;
    .param p1, "price"    # I
    .param p2, "title"    # Ljava/lang/String;
    .param p3, "callback"    # I
    .param p4, "self"    # I
    .param p5, "showDialog"    # I

    .prologue
    .line 2107
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    move-object v7, v0

    check-cast v7, Landroid/app/Activity;

    new-instance v0, Lcom/miniclip/nativeJNI/cocojava$33;

    move-object v1, p0

    move v2, p1

    move-object v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    invoke-direct/range {v0 .. v6}, Lcom/miniclip/nativeJNI/cocojava$33;-><init>(Ljava/lang/String;ILjava/lang/String;III)V

    invoke-virtual {v7, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 2113
    return-void
.end method

.method public static callInAppPurchase(Ljava/lang/String;II)I
    .locals 1
    .param p0, "itemID"    # Ljava/lang/String;
    .param p1, "callback"    # I
    .param p2, "self"    # I

    .prologue
    .line 2193
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Lcom/miniclip/nativeJNI/cocojava;->callInAppPurchase(Ljava/lang/String;IIZ)I

    move-result v0

    return v0
.end method

.method public static callInAppPurchase(Ljava/lang/String;IIZ)I
    .locals 2
    .param p0, "itemID"    # Ljava/lang/String;
    .param p1, "callback"    # I
    .param p2, "self"    # I
    .param p3, "removeAds"    # Z

    .prologue
    .line 2163
    const-string v0, "callInAppPurchase"

    invoke-static {v0, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2165
    sput-boolean p3, Lcom/miniclip/nativeJNI/cocojava;->inAppsRemoveAds:Z

    .line 2167
    sput p1, Lcom/miniclip/nativeJNI/cocojava;->mInAppCallback:I

    .line 2168
    const/4 v0, -0x1

    sput v0, Lcom/miniclip/nativeJNI/cocojava;->mInAppResponce:I

    .line 2169
    sput p2, Lcom/miniclip/nativeJNI/cocojava;->mInAppSelf:I

    .line 2170
    sput-object p0, Lcom/miniclip/nativeJNI/cocojava;->mInAppProductId:Ljava/lang/String;

    .line 2171
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/miniclip/nativeJNI/cocojava$35;

    invoke-direct {v1, p0}, Lcom/miniclip/nativeJNI/cocojava$35;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 2183
    const/4 v0, 0x0

    return v0
.end method

.method public static callInAppPurchaseManaged(Ljava/lang/String;II)I
    .locals 1
    .param p0, "itemID"    # Ljava/lang/String;
    .param p1, "callback"    # I
    .param p2, "self"    # I

    .prologue
    .line 2132
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Lcom/miniclip/nativeJNI/cocojava;->callInAppPurchaseManaged(Ljava/lang/String;IIZ)I

    move-result v0

    return v0
.end method

.method public static callInAppPurchaseManaged(Ljava/lang/String;IIZ)I
    .locals 2
    .param p0, "itemID"    # Ljava/lang/String;
    .param p1, "callback"    # I
    .param p2, "self"    # I
    .param p3, "removeAds"    # Z

    .prologue
    .line 2137
    const-string v0, "callInAppPurchaseManaged"

    invoke-static {v0, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2139
    sput-boolean p3, Lcom/miniclip/nativeJNI/cocojava;->inAppsRemoveAds:Z

    .line 2141
    sput p1, Lcom/miniclip/nativeJNI/cocojava;->mInAppCallback:I

    .line 2142
    const/4 v0, -0x1

    sput v0, Lcom/miniclip/nativeJNI/cocojava;->mInAppResponce:I

    .line 2143
    sput p2, Lcom/miniclip/nativeJNI/cocojava;->mInAppSelf:I

    .line 2144
    sput-object p0, Lcom/miniclip/nativeJNI/cocojava;->mInAppProductId:Ljava/lang/String;

    .line 2145
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/miniclip/nativeJNI/cocojava$34;

    invoke-direct {v1, p0}, Lcom/miniclip/nativeJNI/cocojava$34;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 2158
    const/4 v0, 0x0

    return v0
.end method

.method public static callInAppPurchaseRemoveAds(Ljava/lang/String;II)I
    .locals 1
    .param p0, "itemID"    # Ljava/lang/String;
    .param p1, "callback"    # I
    .param p2, "self"    # I

    .prologue
    .line 2188
    const/4 v0, 0x1

    invoke-static {p0, p1, p2, v0}, Lcom/miniclip/nativeJNI/cocojava;->callInAppPurchase(Ljava/lang/String;IIZ)I

    move-result v0

    return v0
.end method

.method public static callInAppPurchaseRemoveAdsManaged(Ljava/lang/String;II)I
    .locals 1
    .param p0, "itemID"    # Ljava/lang/String;
    .param p1, "callback"    # I
    .param p2, "self"    # I

    .prologue
    .line 2127
    const/4 v0, 0x1

    invoke-static {p0, p1, p2, v0}, Lcom/miniclip/nativeJNI/cocojava;->callInAppPurchaseManaged(Ljava/lang/String;IIZ)I

    move-result v0

    return v0
.end method

.method public static callLastPendingPurchaseSignature(I)I
    .locals 10
    .param p0, "function"    # I

    .prologue
    const/4 v5, 0x0

    .line 4098
    sget-object v6, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    const-string v7, "INAPP_PURCHASED_TEMP_SIGNATURE"

    invoke-virtual {v6, v7, v5}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v3

    .line 4099
    .local v3, "settingsT":Landroid/content/SharedPreferences;
    const-string v6, "amount"

    invoke-interface {v3, v6, v5}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v6

    add-int/lit8 v0, v6, -0x1

    .line 4100
    .local v0, "amountT":I
    if-gez v0, :cond_0

    move v0, v5

    .line 4116
    .end local v0    # "amountT":I
    :goto_0
    return v0

    .line 4102
    .restart local v0    # "amountT":I
    :cond_0
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "pid"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v3, v6}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_1

    move v0, v5

    .line 4103
    goto :goto_0

    .line 4104
    :cond_1
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "pid"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    const-string v7, ""

    invoke-interface {v3, v6, v7}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 4105
    .local v2, "pid":Ljava/lang/String;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "data"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    const-string v7, ""

    invoke-interface {v3, v6, v7}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 4106
    .local v1, "data":Ljava/lang/String;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "sig"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    const-string v7, ""

    invoke-interface {v3, v6, v7}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 4108
    .local v4, "sig":Ljava/lang/String;
    sget-object v6, Lcom/miniclip/nativeJNI/cocojava;->mGLView:Lcom/miniclip/nativeJNI/ClearGLSurfaceView;

    new-instance v7, Lcom/miniclip/nativeJNI/cocojava$68;

    invoke-direct {v7, p0, v2, v1, v4}, Lcom/miniclip/nativeJNI/cocojava$68;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v6, v7}, Lcom/miniclip/nativeJNI/ClearGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    .line 4114
    const-string v6, "cocojava"

    const-string v7, "callLastPendingPurchaseSignature: %d pid: %s data: %s sig: %s"

    const/4 v8, 0x4

    new-array v8, v8, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v8, v5

    const/4 v5, 0x1

    aput-object v2, v8, v5

    const/4 v5, 0x2

    aput-object v1, v8, v5

    const/4 v5, 0x3

    aput-object v4, v8, v5

    invoke-static {v7, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v6, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0
.end method

.method public static cancelNotification(I)V
    .locals 2
    .param p0, "nid"    # I

    .prologue
    .line 2088
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/miniclip/nativeJNI/cocojava$32;

    invoke-direct {v1, p0}, Lcom/miniclip/nativeJNI/cocojava$32;-><init>(I)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 2093
    return-void
.end method

.method public static closeMessageBox(I)V
    .locals 2
    .param p0, "msgId"    # I

    .prologue
    .line 1446
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 1447
    .local v0, "msg":Landroid/os/Message;
    const/4 v1, 0x3

    iput v1, v0, Landroid/os/Message;->what:I

    .line 1448
    new-instance v1, Lcom/miniclip/nativeJNI/DialogMessage;

    invoke-direct {v1, p0}, Lcom/miniclip/nativeJNI/DialogMessage;-><init>(I)V

    iput-object v1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 1450
    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 1451
    return-void
.end method

.method private static convertToMap([Ljava/lang/String;[Ljava/lang/String;)Ljava/util/Map;
    .locals 5
    .param p0, "keys"    # [Ljava/lang/String;
    .param p1, "values"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 2640
    if-eqz p0, :cond_0

    if-nez p1, :cond_1

    .line 2655
    :cond_0
    return-object v2

    .line 2643
    :cond_1
    array-length v1, p0

    .line 2644
    .local v1, "len":I
    array-length v3, p1

    if-ne v1, v3, :cond_0

    .line 2647
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 2648
    .local v2, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v1, :cond_0

    .line 2649
    aget-object v3, p0, v0

    aget-object v4, p1, v0

    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2648
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public static copyAsset(Ljava/lang/String;)V
    .locals 7
    .param p0, "filename"    # Ljava/lang/String;

    .prologue
    .line 4747
    sget-object v5, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v5, Landroid/app/Activity;

    invoke-virtual {v5}, Landroid/app/Activity;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    .line 4748
    .local v0, "assetManager":Landroid/content/res/AssetManager;
    const/4 v2, 0x0

    .line 4749
    .local v2, "in":Ljava/io/InputStream;
    const/4 v3, 0x0

    .line 4751
    .local v3, "out":Ljava/io/OutputStream;
    :try_start_0
    invoke-virtual {v0, p0}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v2

    .line 4752
    new-instance v4, Ljava/io/FileOutputStream;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "/sdcard/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 4753
    .end local v3    # "out":Ljava/io/OutputStream;
    .local v4, "out":Ljava/io/OutputStream;
    :try_start_1
    invoke-static {v2, v4}, Lcom/miniclip/nativeJNI/cocojava;->copyFile(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    .line 4754
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    .line 4755
    const/4 v2, 0x0

    .line 4756
    invoke-virtual {v4}, Ljava/io/OutputStream;->flush()V

    .line 4757
    invoke-virtual {v4}, Ljava/io/OutputStream;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 4758
    const/4 v3, 0x0

    .line 4762
    .end local v4    # "out":Ljava/io/OutputStream;
    .restart local v3    # "out":Ljava/io/OutputStream;
    :goto_0
    return-void

    .line 4759
    :catch_0
    move-exception v1

    .line 4760
    .local v1, "e":Ljava/lang/Exception;
    :goto_1
    const-string v5, "tag"

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 4759
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v3    # "out":Ljava/io/OutputStream;
    .restart local v4    # "out":Ljava/io/OutputStream;
    :catch_1
    move-exception v1

    move-object v3, v4

    .end local v4    # "out":Ljava/io/OutputStream;
    .restart local v3    # "out":Ljava/io/OutputStream;
    goto :goto_1
.end method

.method public static copyFile(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    .locals 3
    .param p0, "in"    # Ljava/io/InputStream;
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 4766
    const/16 v2, 0x400

    new-array v0, v2, [B

    .line 4768
    .local v0, "buffer":[B
    :goto_0
    invoke-virtual {p0, v0}, Ljava/io/InputStream;->read([B)I

    move-result v1

    .local v1, "read":I
    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    .line 4769
    const/4 v2, 0x0

    invoke-virtual {p1, v0, v2, v1}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_0

    .line 4771
    :cond_0
    return-void
.end method

.method public static createNotification(ILjava/lang/String;Ljava/lang/String;I)V
    .locals 2
    .param p0, "nid"    # I
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "text"    # Ljava/lang/String;
    .param p3, "when"    # I

    .prologue
    .line 2080
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/miniclip/nativeJNI/cocojava$31;

    invoke-direct {v1, p0, p1, p2, p3}, Lcom/miniclip/nativeJNI/cocojava$31;-><init>(ILjava/lang/String;Ljava/lang/String;I)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 2085
    return-void
.end method

.method public static custom_logEvent(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p0, "eventId"    # Ljava/lang/String;
    .param p1, "jsonString"    # Ljava/lang/String;

    .prologue
    .line 2692
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/miniclip/nativeJNI/cocojava$36;

    invoke-direct {v1, p0, p1}, Lcom/miniclip/nativeJNI/cocojava$36;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 2697
    return-void
.end method

.method public static custom_showAchievements()V
    .locals 2

    .prologue
    .line 4670
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/miniclip/nativeJNI/cocojava$96;

    invoke-direct {v1}, Lcom/miniclip/nativeJNI/cocojava$96;-><init>()V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 4677
    return-void
.end method

.method public static custom_showLeaderboard(Ljava/lang/String;)V
    .locals 2
    .param p0, "leaderboardId"    # Ljava/lang/String;

    .prologue
    .line 4632
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/miniclip/nativeJNI/cocojava$93;

    invoke-direct {v1, p0}, Lcom/miniclip/nativeJNI/cocojava$93;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 4639
    return-void
.end method

.method public static custom_showLeaderboards()V
    .locals 2

    .prologue
    .line 4643
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/miniclip/nativeJNI/cocojava$94;

    invoke-direct {v1}, Lcom/miniclip/nativeJNI/cocojava$94;-><init>()V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 4650
    return-void
.end method

.method public static custom_updateAchievement(Ljava/lang/String;F)V
    .locals 1
    .param p0, "achievementId"    # Ljava/lang/String;
    .param p1, "progressValue"    # F

    .prologue
    .line 4665
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/miniclip/nativeJNI/cocojava;->custom_updateAchievement(Ljava/lang/String;FLjava/lang/Object;)V

    .line 4666
    return-void
.end method

.method public static custom_updateAchievement(Ljava/lang/String;FLjava/lang/Object;)V
    .locals 2
    .param p0, "achievementId"    # Ljava/lang/String;
    .param p1, "progressValue"    # F
    .param p2, "userData"    # Ljava/lang/Object;

    .prologue
    .line 4654
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/miniclip/nativeJNI/cocojava$95;

    invoke-direct {v1, p0, p1, p2}, Lcom/miniclip/nativeJNI/cocojava$95;-><init>(Ljava/lang/String;FLjava/lang/Object;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 4661
    return-void
.end method

.method public static custom_updateScore(Ljava/lang/String;I)V
    .locals 1
    .param p0, "leaderboardId"    # Ljava/lang/String;
    .param p1, "scoreValue"    # I

    .prologue
    .line 4627
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/miniclip/nativeJNI/cocojava;->custom_updateScore(Ljava/lang/String;ILjava/lang/Object;)V

    .line 4628
    return-void
.end method

.method public static custom_updateScore(Ljava/lang/String;ILjava/lang/Object;)V
    .locals 2
    .param p0, "leaderboardId"    # Ljava/lang/String;
    .param p1, "scoreValue"    # I
    .param p2, "userData"    # Ljava/lang/Object;

    .prologue
    .line 4616
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/miniclip/nativeJNI/cocojava$92;

    invoke-direct {v1, p0, p1, p2}, Lcom/miniclip/nativeJNI/cocojava$92;-><init>(Ljava/lang/String;ILjava/lang/Object;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 4623
    return-void
.end method

.method public static disableAccelerometer()V
    .locals 1

    .prologue
    .line 2464
    const/4 v0, 0x0

    sput-boolean v0, Lcom/miniclip/nativeJNI/cocojava;->accelerometerEnabled:Z

    .line 2465
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->accelerometer:Lcom/miniclip/nativeJNI/cocoaccel;

    invoke-virtual {v0}, Lcom/miniclip/nativeJNI/cocoaccel;->disable()V

    .line 2466
    return-void
.end method

.method public static disableAds()V
    .locals 0

    .prologue
    .line 1978
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->hideAds()V

    .line 1984
    return-void
.end method

.method public static disableNewsfeed()V
    .locals 0

    .prologue
    .line 2077
    return-void
.end method

.method public static displayFreeSpaceWarning(Ljava/lang/String;)V
    .locals 4
    .param p0, "message"    # Ljava/lang/String;

    .prologue
    .line 606
    new-instance v1, Landroid/app/AlertDialog$Builder;

    sget-object v2, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    invoke-direct {v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 607
    .local v0, "dialog":Landroid/app/AlertDialog;
    const-string v1, "Not enough memory"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 608
    invoke-virtual {v0, p0}, Landroid/app/AlertDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 609
    const/4 v1, -0x1

    const-string v2, "Ok"

    new-instance v3, Lcom/miniclip/nativeJNI/cocojava$3;

    invoke-direct {v3}, Lcom/miniclip/nativeJNI/cocojava$3;-><init>()V

    invoke-virtual {v0, v1, v2, v3}, Landroid/app/AlertDialog;->setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 615
    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 616
    return-void
.end method

.method public static displayIntro(Ljava/lang/String;)V
    .locals 6
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    const/4 v5, -0x1

    .line 619
    sget-object v2, Lcom/miniclip/nativeJNI/cocojava;->mInitView:Landroid/widget/RelativeLayout;

    invoke-virtual {v2}, Landroid/widget/RelativeLayout;->removeAllViews()V

    .line 620
    new-instance v0, Landroid/widget/ImageView;

    sget-object v2, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    invoke-direct {v0, v2}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 621
    .local v0, "bg1":Landroid/widget/ImageView;
    sget-object v2, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const-string v3, "drawable"

    sget-object v4, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, p0, v3, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    .line 623
    .local v1, "resourceId":I
    sget-object v2, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 624
    new-instance v2, Landroid/widget/Gallery$LayoutParams;

    invoke-direct {v2, v5, v5}, Landroid/widget/Gallery$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 626
    sget-object v2, Landroid/widget/ImageView$ScaleType;->FIT_XY:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 627
    sget-object v2, Lcom/miniclip/nativeJNI/cocojava;->mInitView:Landroid/widget/RelativeLayout;

    invoke-virtual {v2, v0}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 628
    return-void
.end method

.method public static enableAccelerometer()V
    .locals 1

    .prologue
    .line 2459
    const/4 v0, 0x1

    sput-boolean v0, Lcom/miniclip/nativeJNI/cocojava;->accelerometerEnabled:Z

    .line 2460
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->accelerometer:Lcom/miniclip/nativeJNI/cocoaccel;

    invoke-virtual {v0}, Lcom/miniclip/nativeJNI/cocoaccel;->enable()V

    .line 2461
    return-void
.end method

.method public static enableAds()V
    .locals 0

    .prologue
    .line 1774
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->showAds()V

    .line 1782
    return-void
.end method

.method public static enableAdsWithPosition(FFFFFLjava/lang/String;)V
    .locals 8
    .param p0, "x"    # F
    .param p1, "y"    # F
    .param p2, "anchorX"    # F
    .param p3, "anchorY"    # F
    .param p4, "currentWidth"    # F
    .param p5, "adId"    # Ljava/lang/String;

    .prologue
    .line 1803
    sget-boolean v0, Lcom/miniclip/nativeJNI/cocojava;->mUSE_ADS:Z

    if-nez v0, :cond_0

    .line 1949
    :goto_0
    return-void

    .line 1806
    :cond_0
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    move-object v7, v0

    check-cast v7, Landroid/app/Activity;

    new-instance v0, Lcom/miniclip/nativeJNI/cocojava$26;

    move v1, p4

    move v2, p0

    move v3, p2

    move v4, p1

    move v5, p3

    move-object v6, p5

    invoke-direct/range {v0 .. v6}, Lcom/miniclip/nativeJNI/cocojava$26;-><init>(FFFFFLjava/lang/String;)V

    invoke-virtual {v7, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method public static enableAdsWithPositionForGameplay(FFFF)V
    .locals 6
    .param p0, "x"    # F
    .param p1, "y"    # F
    .param p2, "anchorX"    # F
    .param p3, "anchorY"    # F

    .prologue
    .line 1953
    const/4 v4, 0x0

    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v0, Lcom/miniclip/nativeJNI/cocojava;

    invoke-virtual {v0}, Lcom/miniclip/nativeJNI/cocojava;->getMoPubGameplayBannerId()Ljava/lang/String;

    move-result-object v5

    move v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    invoke-static/range {v0 .. v5}, Lcom/miniclip/nativeJNI/cocojava;->enableAdsWithPosition(FFFFFLjava/lang/String;)V

    .line 1955
    return-void
.end method

.method public static enableAdsWithPositionForGameplayGivenWidth(FFFFF)V
    .locals 6
    .param p0, "x"    # F
    .param p1, "y"    # F
    .param p2, "anchorX"    # F
    .param p3, "anchorY"    # F
    .param p4, "currentWidth"    # F

    .prologue
    .line 1960
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v0, Lcom/miniclip/nativeJNI/cocojava;

    invoke-virtual {v0}, Lcom/miniclip/nativeJNI/cocojava;->getMoPubGameplayBannerId()Ljava/lang/String;

    move-result-object v5

    move v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    invoke-static/range {v0 .. v5}, Lcom/miniclip/nativeJNI/cocojava;->enableAdsWithPosition(FFFFFLjava/lang/String;)V

    .line 1962
    return-void
.end method

.method public static enableAdsWithPositionForMenu(FFFF)V
    .locals 6
    .param p0, "x"    # F
    .param p1, "y"    # F
    .param p2, "anchorX"    # F
    .param p3, "anchorY"    # F

    .prologue
    .line 1966
    const/4 v4, 0x0

    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v0, Lcom/miniclip/nativeJNI/cocojava;

    invoke-virtual {v0}, Lcom/miniclip/nativeJNI/cocojava;->getMoPubMenuBannerId()Ljava/lang/String;

    move-result-object v5

    move v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    invoke-static/range {v0 .. v5}, Lcom/miniclip/nativeJNI/cocojava;->enableAdsWithPosition(FFFFFLjava/lang/String;)V

    .line 1968
    return-void
.end method

.method public static enableAdsWithPositionForMenuGivenWidth(FFFFF)V
    .locals 6
    .param p0, "x"    # F
    .param p1, "y"    # F
    .param p2, "anchorX"    # F
    .param p3, "anchorY"    # F
    .param p4, "currentWidth"    # F

    .prologue
    .line 1973
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v0, Lcom/miniclip/nativeJNI/cocojava;

    invoke-virtual {v0}, Lcom/miniclip/nativeJNI/cocojava;->getMoPubMenuBannerId()Ljava/lang/String;

    move-result-object v5

    move v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    invoke-static/range {v0 .. v5}, Lcom/miniclip/nativeJNI/cocojava;->enableAdsWithPosition(FFFFFLjava/lang/String;)V

    .line 1975
    return-void
.end method

.method public static enableNewsfeed()V
    .locals 0

    .prologue
    .line 2069
    return-void
.end method

.method public static end()V
    .locals 1

    .prologue
    .line 2577
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->backgroundMusicPlayer:Lcom/miniclip/nativeJNI/cocomusic;

    invoke-virtual {v0}, Lcom/miniclip/nativeJNI/cocomusic;->end()V

    .line 2578
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->soundPlayer:Lcom/miniclip/nativeJNI/cocosound;

    invoke-virtual {v0}, Lcom/miniclip/nativeJNI/cocosound;->end()V

    .line 2579
    return-void
.end method

.method public static endFlurryTimedEvent(Ljava/lang/String;)V
    .locals 0
    .param p0, "eventId"    # Ljava/lang/String;

    .prologue
    .line 2684
    invoke-static {p0}, Lcom/flurry/android/FlurryAgent;->endTimedEvent(Ljava/lang/String;)V

    .line 2685
    return-void
.end method

.method public static exitApplication()V
    .locals 2

    .prologue
    .line 2757
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 2758
    .local v0, "msg":Landroid/os/Message;
    const/4 v1, 0x5

    iput v1, v0, Landroid/os/Message;->what:I

    .line 2760
    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 2761
    return-void
.end method

.method public static faceBook_authorize(Ljava/lang/String;)V
    .locals 1
    .param p0, "permissions"    # Ljava/lang/String;

    .prologue
    .line 3543
    new-instance v0, Lcom/miniclip/nativeJNI/cocojava$60;

    invoke-direct {v0}, Lcom/miniclip/nativeJNI/cocojava$60;-><init>()V

    invoke-static {p0, v0}, Lcom/miniclip/nativeJNI/cocojava;->faceBook_authorizeAndRun(Ljava/lang/String;Ljava/lang/Runnable;)V

    .line 3548
    return-void
.end method

.method public static faceBook_authorizeAndRun(Ljava/lang/String;Ljava/lang/Runnable;)V
    .locals 7
    .param p0, "permissions"    # Ljava/lang/String;
    .param p1, "runAfterLogin"    # Ljava/lang/Runnable;

    .prologue
    const/4 v6, 0x0

    .line 3553
    sget-boolean v4, Lcom/miniclip/nativeJNI/cocojava;->mUSE_FACEBOOK:Z

    if-nez v4, :cond_0

    .line 3629
    :goto_0
    return-void

    .line 3558
    :cond_0
    const/4 v4, 0x1

    sput-boolean v4, Lcom/miniclip/nativeJNI/cocojava;->mFB_AuthenticationRequested:Z

    .line 3560
    new-instance v4, Lcom/facebook/Session;

    sget-object v5, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    invoke-direct {v4, v5}, Lcom/facebook/Session;-><init>(Landroid/content/Context;)V

    sput-object v4, Lcom/miniclip/nativeJNI/cocojava;->mFB_Session:Lcom/facebook/Session;

    .line 3563
    sget-object v4, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v4, Landroid/app/Activity;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Landroid/app/Activity;->getPreferences(I)Landroid/content/SharedPreferences;

    move-result-object v4

    sput-object v4, Lcom/miniclip/nativeJNI/cocojava;->mPrefs:Landroid/content/SharedPreferences;

    .line 3564
    sget-object v4, Lcom/miniclip/nativeJNI/cocojava;->mPrefs:Landroid/content/SharedPreferences;

    const-string v5, "access_token"

    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 3566
    .local v1, "access_token":Ljava/lang/String;
    if-nez v1, :cond_1

    .line 3569
    const-string v4, ","

    invoke-virtual {p0, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .line 3572
    .local v3, "permissionsArray":[Ljava/lang/String;
    sget-object v4, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v4, Landroid/app/Activity;

    new-instance v5, Lcom/miniclip/nativeJNI/cocojava$61;

    invoke-direct {v5, p1, v3}, Lcom/miniclip/nativeJNI/cocojava$61;-><init>(Ljava/lang/Runnable;[Ljava/lang/String;)V

    invoke-virtual {v4, v5}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0

    .line 3607
    .end local v3    # "permissionsArray":[Ljava/lang/String;
    :cond_1
    sget-object v4, Lcom/miniclip/nativeJNI/cocojava;->mPrefs:Landroid/content/SharedPreferences;

    invoke-interface {v4}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    .line 3608
    .local v2, "editor":Landroid/content/SharedPreferences$Editor;
    const-string v4, "access_token"

    invoke-interface {v2, v4, v6}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 3609
    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 3613
    invoke-static {v1, v6, v6, v6, v6}, Lcom/facebook/AccessToken;->createFromExistingAccessToken(Ljava/lang/String;Ljava/util/Date;Ljava/util/Date;Lcom/facebook/AccessTokenSource;Ljava/util/List;)Lcom/facebook/AccessToken;

    move-result-object v0

    .line 3616
    .local v0, "accessToken":Lcom/facebook/AccessToken;
    sget-object v4, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v4, Landroid/app/Activity;

    new-instance v5, Lcom/miniclip/nativeJNI/cocojava$62;

    invoke-direct {v5, v0, p1}, Lcom/miniclip/nativeJNI/cocojava$62;-><init>(Lcom/facebook/AccessToken;Ljava/lang/Runnable;)V

    invoke-virtual {v4, v5}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method public static faceBook_dialog(Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .param p0, "action"    # Ljava/lang/String;
    .param p1, "params"    # Ljava/lang/String;

    .prologue
    .line 3726
    sget-boolean v3, Lcom/miniclip/nativeJNI/cocojava;->mUSE_FACEBOOK:Z

    if-nez v3, :cond_0

    .line 3801
    :goto_0
    return-void

    .line 3729
    :cond_0
    const-string v3, "FACEBOOK"

    const-string v4, "faceBook_dialog"

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 3731
    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    .line 3733
    .local v2, "parBundle":Landroid/os/Bundle;
    const-string v3, "#"

    invoke-virtual {p1, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 3735
    .local v1, "individualItems":[Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v3, v1

    div-int/lit8 v3, v3, 0x2

    if-ge v0, v3, :cond_1

    .line 3736
    mul-int/lit8 v3, v0, 0x2

    aget-object v3, v1, v3

    mul-int/lit8 v4, v0, 0x2

    add-int/lit8 v4, v4, 0x1

    aget-object v4, v1, v4

    invoke-virtual {v2, v3, v4}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 3735
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 3740
    :cond_1
    sget-object v3, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v3, Landroid/app/Activity;

    new-instance v4, Lcom/miniclip/nativeJNI/cocojava$66;

    invoke-direct {v4, p0, v2}, Lcom/miniclip/nativeJNI/cocojava$66;-><init>(Ljava/lang/String;Landroid/os/Bundle;)V

    invoke-virtual {v3, v4}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method public static faceBook_dialogWithLogin(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p0, "action"    # Ljava/lang/String;
    .param p1, "params"    # Ljava/lang/String;

    .prologue
    .line 3716
    const-string v0, "email,user_birthday"

    new-instance v1, Lcom/miniclip/nativeJNI/cocojava$65;

    invoke-direct {v1, p0, p1}, Lcom/miniclip/nativeJNI/cocojava$65;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v0, v1}, Lcom/miniclip/nativeJNI/cocojava;->faceBook_authorizeAndRun(Ljava/lang/String;Ljava/lang/Runnable;)V

    .line 3722
    return-void
.end method

.method public static faceBook_getAccessToken()Ljava/lang/String;
    .locals 1

    .prologue
    .line 3525
    sget-boolean v0, Lcom/miniclip/nativeJNI/cocojava;->mUSE_FACEBOOK:Z

    if-nez v0, :cond_0

    .line 3526
    const-string v0, ""

    .line 3528
    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mFB_Session:Lcom/facebook/Session;

    invoke-virtual {v0}, Lcom/facebook/Session;->getAccessToken()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static faceBook_hasPermission(Ljava/lang/String;)I
    .locals 4
    .param p0, "permission"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 3705
    sget-boolean v3, Lcom/miniclip/nativeJNI/cocojava;->mUSE_FACEBOOK:Z

    if-nez v3, :cond_1

    .line 3711
    :cond_0
    :goto_0
    return v2

    .line 3707
    :cond_1
    sget-object v3, Lcom/miniclip/nativeJNI/cocojava;->mFB_Session:Lcom/facebook/Session;

    invoke-virtual {v3}, Lcom/facebook/Session;->getPermissions()Ljava/util/List;

    move-result-object v1

    .line 3709
    .local v1, "permissions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v1, p0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    .line 3711
    .local v0, "contains":Z
    if-eqz v0, :cond_0

    const/4 v2, 0x1

    goto :goto_0
.end method

.method public static faceBook_isSessionValid()I
    .locals 2

    .prologue
    const/4 v0, 0x0

    .line 3517
    sget-boolean v1, Lcom/miniclip/nativeJNI/cocojava;->mUSE_FACEBOOK:Z

    if-nez v1, :cond_1

    .line 3520
    :cond_0
    :goto_0
    return v0

    :cond_1
    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->mFB_Session:Lcom/facebook/Session;

    invoke-virtual {v1}, Lcom/facebook/Session;->isOpened()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0
.end method

.method public static faceBook_logout()V
    .locals 1

    .prologue
    .line 3533
    sget-boolean v0, Lcom/miniclip/nativeJNI/cocojava;->mUSE_FACEBOOK:Z

    if-nez v0, :cond_0

    .line 3538
    :goto_0
    return-void

    .line 3536
    :cond_0
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mFB_Session:Lcom/facebook/Session;

    invoke-virtual {v0}, Lcom/facebook/Session;->closeAndClearTokenInformation()V

    .line 3537
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/facebook/Session;->setActiveSession(Lcom/facebook/Session;)V

    goto :goto_0
.end method

.method public static faceBook_reauthorizeWithPublishPermissions(Ljava/lang/String;)V
    .locals 3
    .param p0, "permissions"    # Ljava/lang/String;

    .prologue
    .line 3634
    sget-boolean v1, Lcom/miniclip/nativeJNI/cocojava;->mUSE_FACEBOOK:Z

    if-nez v1, :cond_0

    .line 3648
    :goto_0
    return-void

    .line 3636
    :cond_0
    const-string v1, ","

    invoke-virtual {p0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 3638
    .local v0, "permissionsArray":[Ljava/lang/String;
    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v1, Landroid/app/Activity;

    new-instance v2, Lcom/miniclip/nativeJNI/cocojava$63;

    invoke-direct {v2, v0}, Lcom/miniclip/nativeJNI/cocojava$63;-><init>([Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method public static faceBook_request(Ljava/lang/String;I)V
    .locals 1
    .param p0, "graphPath"    # Ljava/lang/String;
    .param p1, "object"    # I

    .prologue
    .line 3655
    const-string v0, ""

    invoke-static {p0, v0, p1}, Lcom/miniclip/nativeJNI/cocojava;->faceBook_request(Ljava/lang/String;Ljava/lang/String;I)V

    .line 3656
    return-void
.end method

.method public static faceBook_request(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 2
    .param p0, "graphPath"    # Ljava/lang/String;
    .param p1, "paramsStr"    # Ljava/lang/String;
    .param p2, "object"    # I

    .prologue
    .line 3660
    sget-boolean v0, Lcom/miniclip/nativeJNI/cocojava;->mUSE_FACEBOOK:Z

    if-nez v0, :cond_0

    .line 3700
    :goto_0
    return-void

    .line 3664
    :cond_0
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/miniclip/nativeJNI/cocojava$64;

    invoke-direct {v1, p1, p0, p2}, Lcom/miniclip/nativeJNI/cocojava$64;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method public static flashScreen(I)V
    .locals 0
    .param p0, "color"    # I

    .prologue
    .line 2818
    return-void
.end method

.method protected static getAdsDisabled()I
    .locals 1

    .prologue
    .line 2918
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/miniclip/nativeJNI/cocojava;->getAdsDisabled(Landroid/content/Context;)I

    move-result v0

    return v0
.end method

.method protected static getAdsDisabled(Landroid/content/Context;)I
    .locals 5
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v2, 0x0

    .line 2909
    const-string v3, "ADS_DISABLED"

    invoke-virtual {p0, v3, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 2911
    .local v1, "settings":Landroid/content/SharedPreferences;
    const-string v3, "disabled"

    const-string v4, "false"

    invoke-interface {v1, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 2912
    .local v0, "adsDisabled":Ljava/lang/String;
    const-string v3, "true"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 2913
    const/4 v2, 0x1

    .line 2914
    :cond_0
    return v2
.end method

.method public static getAndroidVersion()I
    .locals 1

    .prologue
    .line 2505
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    return v0
.end method

.method public static getAppVersionCode()I
    .locals 5

    .prologue
    .line 4070
    const/4 v1, 0x0

    .line 4071
    .local v1, "pi":Landroid/content/pm/PackageInfo;
    const/4 v0, 0x0

    .line 4073
    .local v0, "app_version_code":I
    :try_start_0
    sget-object v2, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    sget-object v3, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v1

    .line 4075
    if-eqz v1, :cond_0

    .line 4076
    iget v0, v1, Landroid/content/pm/PackageInfo;->versionCode:I
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 4081
    :cond_0
    :goto_0
    return v0

    .line 4078
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method public static getAppVersionNumber()Ljava/lang/String;
    .locals 6

    .prologue
    .line 4053
    const/4 v2, 0x0

    .line 4054
    .local v2, "pi":Landroid/content/pm/PackageInfo;
    const-string v1, ""

    .line 4055
    .local v1, "app_version_name":Ljava/lang/String;
    const-string v0, ""

    .line 4057
    .local v0, "app_version_code":Ljava/lang/String;
    :try_start_0
    sget-object v3, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    sget-object v4, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v2

    .line 4059
    if-eqz v2, :cond_0

    .line 4060
    iget-object v1, v2, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    .line 4061
    iget v3, v2, Landroid/content/pm/PackageInfo;->versionCode:I

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 4066
    :cond_0
    :goto_0
    return-object v1

    .line 4063
    :catch_0
    move-exception v3

    goto :goto_0
.end method

.method public static getAvailableMemory(Z)J
    .locals 14
    .param p0, "onSDcard"    # Z

    .prologue
    const-wide/32 v12, 0x100000

    .line 588
    const-wide/16 v0, 0x400

    .line 589
    .local v0, "SIZE_KB":J
    const-wide/32 v2, 0x100000

    .line 590
    .local v2, "SIZE_MB":J
    const-wide/16 v4, -0x1

    .line 593
    .local v4, "availableSpace":J
    if-eqz p0, :cond_0

    .line 594
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v6

    .line 599
    .local v6, "path":Ljava/io/File;
    :goto_0
    new-instance v7, Landroid/os/StatFs;

    invoke-virtual {v6}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    .line 600
    .local v7, "stat":Landroid/os/StatFs;
    invoke-virtual {v7}, Landroid/os/StatFs;->getAvailableBlocks()I

    move-result v8

    int-to-long v8, v8

    invoke-virtual {v7}, Landroid/os/StatFs;->getBlockSize()I

    move-result v10

    int-to-long v10, v10

    mul-long v4, v8, v10

    .line 601
    const-string v9, "cocojava"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Available "

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    if-eqz p0, :cond_1

    const-string v8, "sdcard"

    :goto_1
    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v10, " memory: "

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    div-long v10, v4, v12

    invoke-virtual {v8, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v9, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 602
    div-long v8, v4, v12

    return-wide v8

    .line 596
    .end local v6    # "path":Ljava/io/File;
    .end local v7    # "stat":Landroid/os/StatFs;
    :cond_0
    invoke-static {}, Landroid/os/Environment;->getDataDirectory()Ljava/io/File;

    move-result-object v6

    .restart local v6    # "path":Ljava/io/File;
    goto :goto_0

    .line 601
    .restart local v7    # "stat":Landroid/os/StatFs;
    :cond_1
    const-string v8, "internal"

    goto :goto_1
.end method

.method public static getBackgroundMusicVolume()F
    .locals 1

    .prologue
    .line 2497
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->backgroundMusicPlayer:Lcom/miniclip/nativeJNI/cocomusic;

    invoke-virtual {v0}, Lcom/miniclip/nativeJNI/cocomusic;->getBackgroundVolume()F

    move-result v0

    return v0
.end method

.method public static getCaretPosition()I
    .locals 6

    .prologue
    .line 4381
    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->mEditText:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getSelectionStart()I

    move-result v0

    .line 4382
    .local v0, "position":I
    const-string v1, "KeyboardInput"

    const-string v2, "getCaretPosition position: %d"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 4383
    return v0
.end method

.method public static getDeviceId()Ljava/lang/String;
    .locals 19

    .prologue
    .line 4410
    const-string v16, "Device Id"

    invoke-static/range {v16 .. v16}, Lcom/miniclip/nativeJNI/cocojava;->SharedPreferences_getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 4413
    .local v3, "deviceId":Ljava/lang/String;
    const-string v16, ""

    move-object/from16 v0, v16

    if-ne v3, v0, :cond_1

    .line 4414
    const-string v16, "JAVAINFO"

    const-string v17, "Trying to get miniclipId from sdcard"

    invoke-static/range {v16 .. v17}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 4415
    const-string v1, ""

    .line 4417
    .local v1, "aBuffer":Ljava/lang/String;
    :try_start_0
    new-instance v9, Ljava/io/File;

    const-string v16, "/sdcard/miniclipId.txt"

    move-object/from16 v0, v16

    invoke-direct {v9, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 4419
    .local v9, "myFile":Ljava/io/File;
    new-instance v5, Ljava/io/FileInputStream;

    invoke-direct {v5, v9}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 4420
    .local v5, "fIn":Ljava/io/FileInputStream;
    new-instance v11, Ljava/io/BufferedReader;

    new-instance v16, Ljava/io/InputStreamReader;

    move-object/from16 v0, v16

    invoke-direct {v0, v5}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    move-object/from16 v0, v16

    invoke-direct {v11, v0}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 4422
    .local v11, "myReader":Ljava/io/BufferedReader;
    const-string v2, ""

    .line 4424
    .local v2, "aDataRow":Ljava/lang/String;
    :goto_0
    invoke-virtual {v11}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 4425
    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 4427
    :cond_0
    invoke-virtual {v11}, Ljava/io/BufferedReader;->close()V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 4436
    .end local v2    # "aDataRow":Ljava/lang/String;
    .end local v5    # "fIn":Ljava/io/FileInputStream;
    .end local v9    # "myFile":Ljava/io/File;
    .end local v11    # "myReader":Ljava/io/BufferedReader;
    :goto_1
    const-string v16, ""

    move-object/from16 v0, v16

    if-eq v1, v0, :cond_1

    .line 4437
    move-object v3, v1

    .line 4440
    const-string v16, "Device Id"

    move-object/from16 v0, v16

    invoke-static {v0, v3}, Lcom/miniclip/nativeJNI/cocojava;->SharedPreferences_setString(Ljava/lang/String;Ljava/lang/String;)V

    .line 4442
    const-string v16, "JAVAINFO"

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "DeviceID from SD Card = "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v16 .. v17}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 4448
    .end local v1    # "aBuffer":Ljava/lang/String;
    :cond_1
    const-string v16, ""

    move-object/from16 v0, v16

    if-ne v3, v0, :cond_3

    .line 4449
    const-string v16, "JAVAINFO"

    const-string v17, "Generating miniclipId"

    invoke-static/range {v16 .. v17}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 4451
    new-instance v12, Ljava/util/Date;

    invoke-direct {v12}, Ljava/util/Date;-><init>()V

    .line 4452
    .local v12, "newDate":Ljava/util/Date;
    invoke-virtual {v12}, Ljava/util/Date;->getTime()J

    move-result-wide v16

    invoke-static/range {v16 .. v17}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v3

    .line 4455
    const-string v13, "abcdefghijmnopqrstuvxz0123456789"

    .line 4456
    .local v13, "randomStr":Ljava/lang/String;
    new-instance v14, Ljava/util/Random;

    invoke-direct {v14}, Ljava/util/Random;-><init>()V

    .line 4457
    .local v14, "rn":Ljava/util/Random;
    const/16 v8, 0xa

    .line 4458
    .local v8, "length":I
    new-array v15, v8, [C

    .line 4459
    .local v15, "text":[C
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_2
    if-ge v7, v8, :cond_2

    .line 4460
    invoke-virtual {v13}, Ljava/lang/String;->length()I

    move-result v16

    move/from16 v0, v16

    invoke-virtual {v14, v0}, Ljava/util/Random;->nextInt(I)I

    move-result v16

    move/from16 v0, v16

    invoke-virtual {v13, v0}, Ljava/lang/String;->charAt(I)C

    move-result v16

    aput-char v16, v15, v7

    .line 4459
    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    .line 4428
    .end local v7    # "i":I
    .end local v8    # "length":I
    .end local v12    # "newDate":Ljava/util/Date;
    .end local v13    # "randomStr":Ljava/lang/String;
    .end local v14    # "rn":Ljava/util/Random;
    .end local v15    # "text":[C
    .restart local v1    # "aBuffer":Ljava/lang/String;
    :catch_0
    move-exception v4

    .line 4430
    .local v4, "e":Ljava/io/FileNotFoundException;
    invoke-virtual {v4}, Ljava/io/FileNotFoundException;->printStackTrace()V

    goto :goto_1

    .line 4431
    .end local v4    # "e":Ljava/io/FileNotFoundException;
    :catch_1
    move-exception v4

    .line 4433
    .local v4, "e":Ljava/io/IOException;
    invoke-virtual {v4}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1

    .line 4464
    .end local v1    # "aBuffer":Ljava/lang/String;
    .end local v4    # "e":Ljava/io/IOException;
    .restart local v7    # "i":I
    .restart local v8    # "length":I
    .restart local v12    # "newDate":Ljava/util/Date;
    .restart local v13    # "randomStr":Ljava/lang/String;
    .restart local v14    # "rn":Ljava/util/Random;
    .restart local v15    # "text":[C
    :cond_2
    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v16

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, "-"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    new-instance v17, Ljava/lang/String;

    move-object/from16 v0, v17

    invoke-direct {v0, v15}, Ljava/lang/String;-><init>([C)V

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 4467
    const-string v16, "Device Id"

    move-object/from16 v0, v16

    invoke-static {v0, v3}, Lcom/miniclip/nativeJNI/cocojava;->SharedPreferences_setString(Ljava/lang/String;Ljava/lang/String;)V

    .line 4470
    .end local v7    # "i":I
    .end local v8    # "length":I
    .end local v12    # "newDate":Ljava/util/Date;
    .end local v13    # "randomStr":Ljava/lang/String;
    .end local v14    # "rn":Ljava/util/Random;
    .end local v15    # "text":[C
    :cond_3
    new-instance v9, Ljava/io/File;

    const-string v16, "/sdcard/miniclipId.txt"

    move-object/from16 v0, v16

    invoke-direct {v9, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 4471
    .restart local v9    # "myFile":Ljava/io/File;
    const-string v16, ""

    move-object/from16 v0, v16

    if-eq v3, v0, :cond_4

    invoke-virtual {v9}, Ljava/io/File;->exists()Z

    move-result v16

    if-nez v16, :cond_4

    .line 4473
    const-string v16, "JAVAINFO"

    const-string v17, "Saving miniclipId to sdcard"

    invoke-static/range {v16 .. v17}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 4475
    :try_start_1
    invoke-virtual {v9}, Ljava/io/File;->createNewFile()Z

    .line 4476
    new-instance v6, Ljava/io/FileOutputStream;

    invoke-direct {v6, v9}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 4477
    .local v6, "fOut":Ljava/io/FileOutputStream;
    new-instance v10, Ljava/io/OutputStreamWriter;

    invoke-direct {v10, v6}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;)V

    .line 4478
    .local v10, "myOutWriter":Ljava/io/OutputStreamWriter;
    invoke-virtual {v10, v3}, Ljava/io/OutputStreamWriter;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    .line 4479
    invoke-virtual {v10}, Ljava/io/OutputStreamWriter;->close()V

    .line 4480
    invoke-virtual {v6}, Ljava/io/FileOutputStream;->close()V

    .line 4481
    const-string v16, "JAVAINFO"

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "DeviceID stored to sdcard = "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v16 .. v17}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2

    .line 4489
    .end local v6    # "fOut":Ljava/io/FileOutputStream;
    .end local v10    # "myOutWriter":Ljava/io/OutputStreamWriter;
    :cond_4
    :goto_3
    const-string v16, "JAVAINFO"

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "DeviceID = "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v16 .. v17}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 4491
    return-object v3

    .line 4482
    :catch_2
    move-exception v4

    .line 4484
    .restart local v4    # "e":Ljava/io/IOException;
    invoke-virtual {v4}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_3
.end method

.method public static getDeviceInfo(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "type"    # Ljava/lang/String;

    .prologue
    .line 4850
    const-string v0, "device"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 4851
    sget-object v0, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    .line 4856
    :goto_0
    return-object v0

    .line 4852
    :cond_0
    const-string v0, "version"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 4853
    sget-object v0, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    goto :goto_0

    .line 4854
    :cond_1
    const-string v0, "brand"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 4855
    sget-object v0, Landroid/os/Build;->BRAND:Ljava/lang/String;

    goto :goto_0

    .line 4856
    :cond_2
    const-string v0, ""

    goto :goto_0
.end method

.method public static getDurationForSound(Ljava/lang/String;)I
    .locals 1
    .param p0, "path"    # Ljava/lang/String;

    .prologue
    .line 2469
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->backgroundMusicPlayer:Lcom/miniclip/nativeJNI/cocomusic;

    invoke-virtual {v0, p0}, Lcom/miniclip/nativeJNI/cocomusic;->getDurationForSound(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public static getEffectsVolume()F
    .locals 1

    .prologue
    .line 2561
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->soundPlayer:Lcom/miniclip/nativeJNI/cocosound;

    invoke-virtual {v0}, Lcom/miniclip/nativeJNI/cocosound;->getEffectsVolume()F

    move-result v0

    return v0
.end method

.method public static getExternalStorageDirectory()Ljava/lang/String;
    .locals 7

    .prologue
    .line 2884
    sget-object v5, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    .line 2885
    .local v2, "packageName":Ljava/lang/String;
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v5

    invoke-virtual {v5}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    .line 2887
    .local v0, "externalRoot":Ljava/lang/String;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "/Android/data/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 2889
    .local v3, "path":Ljava/lang/String;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "/Contents/Resources"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 2890
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 2891
    .local v1, "folder":Ljava/io/File;
    const/4 v4, 0x0

    .line 2892
    .local v4, "success":Z
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v5

    if-nez v5, :cond_0

    .line 2893
    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    move-result v4

    .line 2896
    :cond_0
    if-nez v4, :cond_1

    .line 2905
    :cond_1
    return-object v3
.end method

.method public static getFreeRAM()J
    .locals 6

    .prologue
    .line 4865
    sget-object v2, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v2, Landroid/app/Activity;

    const-string v3, "activity"

    invoke-virtual {v2, v3}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/ActivityManager;

    .line 4866
    .local v0, "activityManager":Landroid/app/ActivityManager;
    new-instance v1, Landroid/app/ActivityManager$MemoryInfo;

    invoke-direct {v1}, Landroid/app/ActivityManager$MemoryInfo;-><init>()V

    .line 4867
    .local v1, "mi":Landroid/app/ActivityManager$MemoryInfo;
    invoke-virtual {v0, v1}, Landroid/app/ActivityManager;->getMemoryInfo(Landroid/app/ActivityManager$MemoryInfo;)V

    .line 4868
    const-string v2, "memory free"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, ""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-wide v4, v1, Landroid/app/ActivityManager$MemoryInfo;->availMem:J

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 4870
    iget-wide v2, v1, Landroid/app/ActivityManager$MemoryInfo;->availMem:J

    return-wide v2
.end method

.method static getNotificationStatus()I
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 2833
    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    const-string v2, "NewsfeedPrefsC2DM"

    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 2835
    .local v0, "settings":Landroid/content/SharedPreferences;
    const-string v1, "C2DM_ENABLE"

    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    return v1
.end method

.method public static getNumCores()I
    .locals 4

    .prologue
    .line 4828
    const/4 v0, 0x1

    .line 4833
    .local v0, "cores":I
    :try_start_0
    new-instance v1, Ljava/io/File;

    const-string v3, "/sys/devices/system/cpu/"

    invoke-direct {v1, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 4835
    .local v1, "dir":Ljava/io/File;
    new-instance v3, Lcom/miniclip/nativeJNI/cocojava$1CpuFilter;

    invoke-direct {v3}, Lcom/miniclip/nativeJNI/cocojava$1CpuFilter;-><init>()V

    invoke-virtual {v1, v3}, Ljava/io/File;->listFiles(Ljava/io/FileFilter;)[Ljava/io/File;

    move-result-object v2

    .line 4837
    .local v2, "files":[Ljava/io/File;
    array-length v0, v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 4841
    .end local v1    # "dir":Ljava/io/File;
    .end local v2    # "files":[Ljava/io/File;
    :goto_0
    return v0

    .line 4839
    :catch_0
    move-exception v3

    goto :goto_0
.end method

.method public static getPendingPurchaseAmount(Ljava/lang/String;)I
    .locals 7
    .param p0, "key"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    .line 4138
    sget-object v2, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    const-string v3, "INAPP_PURCHASED_TEMP"

    invoke-virtual {v2, v3, v5}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 4140
    .local v1, "settings":Landroid/content/SharedPreferences;
    invoke-interface {v1, p0, v5}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 4141
    .local v0, "amount":I
    const-string v2, "cocojava"

    const-string v3, "getPendingPurchaseAmount: %s, %d"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    aput-object p0, v4, v5

    const/4 v5, 0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 4143
    return v0
.end method

.method public static getPendingPurchaseSignatureAmount()I
    .locals 7

    .prologue
    const/4 v2, 0x0

    .line 4086
    sget-object v3, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    const-string v4, "INAPP_PURCHASED_TEMP_SIGNATURE"

    invoke-virtual {v3, v4, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 4087
    .local v1, "settingsT":Landroid/content/SharedPreferences;
    const-string v3, "amount"

    invoke-interface {v1, v3, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 4088
    .local v0, "amountT":I
    const-string v3, "cocojava"

    const-string v4, "getPendingPurchaseSignatureAmount: %d"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v2

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 4089
    if-gez v0, :cond_1

    move v0, v2

    .line 4093
    .end local v0    # "amountT":I
    :cond_0
    :goto_0
    return v0

    .line 4091
    .restart local v0    # "amountT":I
    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "pid"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    add-int/lit8 v4, v0, -0x1

    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    move v0, v2

    .line 4092
    goto :goto_0
.end method

.method public static getProductPrice(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "productId"    # Ljava/lang/String;

    .prologue
    .line 3026
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v0, Lcom/miniclip/nativeJNI/InAppActivity;

    invoke-virtual {v0, p0}, Lcom/miniclip/nativeJNI/InAppActivity;->getPurchasePrice(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getPurchasedOwnedItems()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 3022
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v0, Lcom/miniclip/nativeJNI/InAppActivity;

    invoke-virtual {v0}, Lcom/miniclip/nativeJNI/InAppActivity;->getOwnedItems()[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getRecommendedPriceGetJar(I)I
    .locals 1
    .param p0, "price"    # I

    .prologue
    .line 2098
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v0, Lcom/miniclip/nativeJNI/cocojava;

    invoke-virtual {v0, p0}, Lcom/miniclip/nativeJNI/cocojava;->getJarRecommendedPrice(I)I

    move-result v0

    return v0
.end method

.method public static getTotalRAM()I
    .locals 11

    .prologue
    .line 4878
    const-string v6, "/proc/meminfo"

    .line 4881
    .local v6, "str1":Ljava/lang/String;
    const-wide/16 v2, 0x0

    .line 4884
    .local v2, "initial_memory":J
    :try_start_0
    new-instance v5, Ljava/io/FileReader;

    invoke-direct {v5, v6}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    .line 4885
    .local v5, "localFileReader":Ljava/io/FileReader;
    new-instance v4, Ljava/io/BufferedReader;

    const/16 v8, 0x2000

    invoke-direct {v4, v5, v8}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;I)V

    .line 4886
    .local v4, "localBufferedReader":Ljava/io/BufferedReader;
    invoke-virtual {v4}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v7

    .line 4887
    .local v7, "str2":Ljava/lang/String;
    const-string v8, "\\s+"

    invoke-virtual {v7, v8}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 4889
    .local v0, "arrayOfString":[Ljava/lang/String;
    const/4 v8, 0x1

    aget-object v8, v0, v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v8

    mul-int/lit16 v8, v8, 0x400

    int-to-long v2, v8

    .line 4890
    invoke-virtual {v4}, Ljava/io/BufferedReader;->close()V

    .line 4892
    const-string v8, "cocojava - RAM"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, ""

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 4894
    long-to-int v8, v2

    .line 4898
    .end local v0    # "arrayOfString":[Ljava/lang/String;
    .end local v4    # "localBufferedReader":Ljava/io/BufferedReader;
    .end local v5    # "localFileReader":Ljava/io/FileReader;
    .end local v7    # "str2":Ljava/lang/String;
    :goto_0
    return v8

    .line 4896
    :catch_0
    move-exception v1

    .line 4898
    .local v1, "e":Ljava/io/IOException;
    const/4 v8, -0x1

    goto :goto_0
.end method

.method public static hideAd(Lcom/mopub/mobileads/MoPubView;)V
    .locals 3
    .param p0, "adView"    # Lcom/mopub/mobileads/MoPubView;

    .prologue
    .line 2001
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Lcom/mopub/mobileads/MoPubView;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    sget-object v2, Lcom/miniclip/nativeJNI/cocojava;->adLayout:Landroid/widget/RelativeLayout;

    if-eq v1, v2, :cond_1

    .line 2031
    :cond_0
    :goto_0
    return-void

    .line 2003
    :cond_1
    invoke-virtual {p0}, Lcom/mopub/mobileads/MoPubView;->getAnimation()Landroid/view/animation/Animation;

    move-result-object v1

    if-nez v1, :cond_0

    .line 2005
    move-object v0, p0

    .line 2006
    .local v0, "adViewFinal":Lcom/mopub/mobileads/MoPubView;
    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v1, Landroid/app/Activity;

    new-instance v2, Lcom/miniclip/nativeJNI/cocojava$28;

    invoke-direct {v2, v0}, Lcom/miniclip/nativeJNI/cocojava$28;-><init>(Lcom/mopub/mobileads/MoPubView;)V

    invoke-virtual {v1, v2}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method public static hideAds()V
    .locals 2

    .prologue
    .line 1987
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/miniclip/nativeJNI/cocojava$27;

    invoke-direct {v1}, Lcom/miniclip/nativeJNI/cocojava$27;-><init>()V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 1996
    return-void
.end method

.method public static hideAdsInSeconds(I)V
    .locals 4
    .param p0, "seconds"    # I

    .prologue
    .line 2040
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mAdDelayHandler:Landroid/os/Handler;

    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->mHideAdsRun:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 2041
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mAdDelayHandler:Landroid/os/Handler;

    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->mHideAdsRun:Ljava/lang/Runnable;

    mul-int/lit16 v2, p0, 0x3e8

    int-to-long v2, v2

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 2042
    return-void
.end method

.method public static hideHorizontalBanner()V
    .locals 2

    .prologue
    .line 3171
    sget-boolean v0, Lcom/miniclip/nativeJNI/cocojava;->mHorizontalBannerDisplayed:Z

    if-nez v0, :cond_0

    .line 3189
    :goto_0
    return-void

    .line 3174
    :cond_0
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/miniclip/nativeJNI/cocojava$50;

    invoke-direct {v1}, Lcom/miniclip/nativeJNI/cocojava$50;-><init>()V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method public static hideMessageBox(I)V
    .locals 2
    .param p0, "msgId"    # I

    .prologue
    .line 1438
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 1439
    .local v0, "msg":Landroid/os/Message;
    const/4 v1, 0x2

    iput v1, v0, Landroid/os/Message;->what:I

    .line 1440
    new-instance v1, Lcom/miniclip/nativeJNI/DialogMessage;

    invoke-direct {v1, p0}, Lcom/miniclip/nativeJNI/DialogMessage;-><init>(I)V

    iput-object v1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 1442
    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 1443
    return-void
.end method

.method public static hideRemoveAds()V
    .locals 2

    .prologue
    .line 2947
    sget-boolean v0, Lcom/miniclip/nativeJNI/cocojava;->mRemoveAdsButtonHidden:Z

    if-eqz v0, :cond_1

    .line 2957
    :cond_0
    :goto_0
    return-void

    .line 2949
    :cond_1
    const/4 v0, 0x1

    sput-boolean v0, Lcom/miniclip/nativeJNI/cocojava;->mRemoveAdsButtonHidden:Z

    .line 2950
    sget-boolean v0, Lcom/miniclip/nativeJNI/cocojava;->mUSE_ADS:Z

    if-eqz v0, :cond_0

    .line 2952
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/miniclip/nativeJNI/cocojava$42;

    invoke-direct {v1}, Lcom/miniclip/nativeJNI/cocojava$42;-><init>()V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method public static hideRotatedBanner()V
    .locals 2

    .prologue
    .line 3121
    sget v0, Lcom/miniclip/nativeJNI/cocojava;->mRotatedBannerDisplayed:I

    if-nez v0, :cond_0

    .line 3141
    :goto_0
    return-void

    .line 3123
    :cond_0
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/miniclip/nativeJNI/cocojava$48;

    invoke-direct {v1}, Lcom/miniclip/nativeJNI/cocojava$48;-><init>()V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method public static isAppInstalled(Ljava/lang/String;)I
    .locals 5
    .param p0, "appId"    # Ljava/lang/String;

    .prologue
    .line 3044
    sget-object v3, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    const/16 v4, 0x2000

    invoke-virtual {v3, v4}, Landroid/content/pm/PackageManager;->getInstalledApplications(I)Ljava/util/List;

    move-result-object v1

    .line 3048
    .local v1, "apps":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/ApplicationInfo;>;"
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/pm/ApplicationInfo;

    .line 3049
    .local v0, "app":Landroid/content/pm/ApplicationInfo;
    iget-object v3, v0, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v3, p0}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v3

    if-nez v3, :cond_0

    .line 3050
    const/4 v3, 0x1

    .line 3052
    .end local v0    # "app":Landroid/content/pm/ApplicationInfo;
    :goto_0
    return v3

    :cond_1
    const/4 v3, 0x0

    goto :goto_0
.end method

.method public static isBackgroundMusicPlaying()Z
    .locals 1

    .prologue
    .line 2493
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->backgroundMusicPlayer:Lcom/miniclip/nativeJNI/cocomusic;

    invoke-virtual {v0}, Lcom/miniclip/nativeJNI/cocomusic;->isBackgroundMusicPlaying()Z

    move-result v0

    return v0
.end method

.method public static isFullVersion()I
    .locals 2

    .prologue
    .line 4200
    const-string v1, "FULL_VERSION"

    invoke-static {v1}, Lcom/miniclip/nativeJNI/cocojava;->SharedPreferences_getInt(Ljava/lang/String;)I

    move-result v0

    .line 4201
    .local v0, "i":I
    return v0
.end method

.method public static isInstalledOnSdCard()Z
    .locals 3

    .prologue
    const/4 v1, 0x0

    .line 574
    :try_start_0
    sget-object v2, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    .line 575
    .local v0, "filesDir":Ljava/lang/String;
    const-string v2, "/data/"

    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 584
    :cond_0
    :goto_0
    return v1

    .line 577
    :cond_1
    const-string v2, "/mnt/"

    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_2

    const-string v2, "/sdcard/"

    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    if-eqz v2, :cond_0

    .line 578
    :cond_2
    const/4 v1, 0x1

    goto :goto_0

    .line 580
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method public static isPurchaseOwned(Ljava/lang/String;)I
    .locals 1
    .param p0, "purchaseId"    # Ljava/lang/String;

    .prologue
    .line 3018
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v0, Lcom/miniclip/nativeJNI/InAppActivity;

    invoke-virtual {v0, p0}, Lcom/miniclip/nativeJNI/InAppActivity;->isPurchaseReallyOwned(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public static isSDcardPresent()Z
    .locals 2

    .prologue
    .line 2853
    const-string v0, "mounted"

    const-string v1, "mounted"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static isSignedIn_GooglePlayServices()I
    .locals 1

    .prologue
    .line 4726
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v0, Lcom/miniclip/nativeJNI/cocojava;

    invoke-virtual {v0}, Lcom/miniclip/nativeJNI/cocojava;->googlePlayServicesIsSignedInCustom()I

    move-result v0

    return v0
.end method

.method public static keyboardInput_Hide()V
    .locals 2

    .prologue
    .line 4568
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/miniclip/nativeJNI/cocojava$88;

    invoke-direct {v1}, Lcom/miniclip/nativeJNI/cocojava$88;-><init>()V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 4576
    return-void
.end method

.method public static keyboardInput_Show(Ljava/lang/String;)V
    .locals 2
    .param p0, "text"    # Ljava/lang/String;

    .prologue
    .line 4353
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/miniclip/nativeJNI/cocojava$79;

    invoke-direct {v1, p0}, Lcom/miniclip/nativeJNI/cocojava$79;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 4367
    return-void
.end method

.method public static keyboardInput_Show_withMaxLengthLocked(Ljava/lang/String;I)V
    .locals 2
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "maxLength"    # I

    .prologue
    .line 4388
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/miniclip/nativeJNI/cocojava$81;

    invoke-direct {v1, p0, p1}, Lcom/miniclip/nativeJNI/cocojava$81;-><init>(Ljava/lang/String;I)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 4406
    return-void
.end method

.method public static loadFullScreenAd()V
    .locals 2

    .prologue
    .line 1743
    sget-boolean v0, Lcom/miniclip/nativeJNI/cocojava;->mUSE_ADS:Z

    if-nez v0, :cond_0

    .line 1754
    :goto_0
    return-void

    .line 1746
    :cond_0
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/miniclip/nativeJNI/cocojava$24;

    invoke-direct {v1}, Lcom/miniclip/nativeJNI/cocojava$24;-><init>()V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method public static loadTexture(Ljava/lang/String;)V
    .locals 1
    .param p0, "path"    # Ljava/lang/String;

    .prologue
    .line 2590
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->texture:Lcom/miniclip/nativeJNI/cocotexture;

    invoke-virtual {v0, p0}, Lcom/miniclip/nativeJNI/cocotexture;->readBitmap(Ljava/lang/String;)V

    .line 2591
    return-void
.end method

.method public static logFlurryEvent(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;Z)V
    .locals 7
    .param p0, "eventId"    # Ljava/lang/String;
    .param p1, "keys"    # [Ljava/lang/String;
    .param p2, "values"    # [Ljava/lang/String;
    .param p3, "timed"    # Z

    .prologue
    .line 2660
    const-string v4, "flurry"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "logFlurryEvent: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " timed: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2662
    invoke-static {p1, p2}, Lcom/miniclip/nativeJNI/cocojava;->convertToMap([Ljava/lang/String;[Ljava/lang/String;)Ljava/util/Map;

    move-result-object v2

    .line 2663
    .local v2, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-static {p0, v2, p3}, Lcom/flurry/android/FlurryAgent;->logEvent(Ljava/lang/String;Ljava/util/Map;Z)V

    .line 2665
    if-nez p3, :cond_0

    if-eqz v2, :cond_0

    .line 2666
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Flurry/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 2668
    .local v3, "s":Ljava/lang/String;
    if-nez v2, :cond_1

    .line 2680
    .end local v3    # "s":Ljava/lang/String;
    :cond_0
    return-void

    .line 2671
    .restart local v3    # "s":Ljava/lang/String;
    :cond_1
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-interface {v2}, Ljava/util/Map;->size()I

    move-result v4

    if-ge v1, v4, :cond_0

    .line 2672
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    aget-object v5, p1, v1

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "->"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    aget-object v5, p2, v1

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 2674
    .local v0, "eventStr":Ljava/lang/String;
    const-string v4, "sendGoogleEvent"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "logGoogleEventFromFlurry: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2676
    const/4 v4, 0x1

    invoke-static {v0, v4}, Lcom/miniclip/nativeJNI/cocojava;->sendGoogleEvent(Ljava/lang/String;I)V

    .line 2671
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public static login_GooglePlayServices()V
    .locals 2

    .prologue
    .line 4704
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/miniclip/nativeJNI/cocojava$97;

    invoke-direct {v1}, Lcom/miniclip/nativeJNI/cocojava$97;-><init>()V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 4711
    return-void
.end method

.method public static logout_GooglePlayServices()V
    .locals 2

    .prologue
    .line 4715
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/miniclip/nativeJNI/cocojava$98;

    invoke-direct {v1}, Lcom/miniclip/nativeJNI/cocojava$98;-><init>()V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 4722
    return-void
.end method

.method private md5(Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 3372
    :try_start_0
    const-string v5, "MD5"

    invoke-static {v5}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    .line 3374
    .local v0, "digest":Ljava/security/MessageDigest;
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/security/MessageDigest;->update([B)V

    .line 3375
    invoke-virtual {v0}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v4

    .line 3378
    .local v4, "messageDigest":[B
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    .line 3379
    .local v2, "hexString":Ljava/lang/StringBuffer;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    array-length v5, v4

    if-ge v3, v5, :cond_0

    .line 3380
    aget-byte v5, v4, v3

    and-int/lit16 v5, v5, 0xff

    invoke-static {v5}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 3379
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 3381
    :cond_0
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v5

    .line 3386
    .end local v0    # "digest":Ljava/security/MessageDigest;
    .end local v2    # "hexString":Ljava/lang/StringBuffer;
    .end local v3    # "i":I
    .end local v4    # "messageDigest":[B
    :goto_1
    return-object v5

    .line 3383
    :catch_0
    move-exception v1

    .line 3384
    .local v1, "e":Ljava/security/NoSuchAlgorithmException;
    invoke-virtual {v1}, Ljava/security/NoSuchAlgorithmException;->printStackTrace()V

    .line 3386
    const/4 v5, 0x0

    goto :goto_1
.end method

.method public static mopub_showAdFailed()V
    .locals 2

    .prologue
    .line 1575
    const-string v0, "mopub"

    const-string v1, "showAdFailed"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1576
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->showMiniclipView()V

    .line 1577
    return-void
.end method

.method public static openLink(Ljava/lang/String;)V
    .locals 2
    .param p0, "url"    # Ljava/lang/String;

    .prologue
    .line 2700
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 2701
    .local v0, "msg":Landroid/os/Message;
    const/4 v1, 0x4

    iput v1, v0, Landroid/os/Message;->what:I

    .line 2702
    iput-object p0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 2704
    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 2705
    return-void
.end method

.method private openURL(Ljava/lang/String;)V
    .locals 3
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 2728
    invoke-virtual {p0}, Lcom/miniclip/nativeJNI/cocojava;->isOnline()Z

    move-result v2

    if-nez v2, :cond_0

    .line 2729
    invoke-direct {p0}, Lcom/miniclip/nativeJNI/cocojava;->showNoInternetDialog()V

    .line 2742
    :goto_0
    return-void

    .line 2736
    :cond_0
    :try_start_0
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.VIEW"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 2737
    .local v1, "intent":Landroid/content/Intent;
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 2738
    invoke-virtual {p0, v1}, Lcom/miniclip/nativeJNI/cocojava;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 2739
    .end local v1    # "intent":Landroid/content/Intent;
    :catch_0
    move-exception v0

    .line 2740
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public static pauseAllSounds()V
    .locals 1

    .prologue
    .line 2582
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->soundPlayer:Lcom/miniclip/nativeJNI/cocosound;

    invoke-virtual {v0}, Lcom/miniclip/nativeJNI/cocosound;->pauseAllSounds()V

    .line 2583
    return-void
.end method

.method public static pauseBackgroundMusic()V
    .locals 1

    .prologue
    .line 2481
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->backgroundMusicPlayer:Lcom/miniclip/nativeJNI/cocomusic;

    invoke-virtual {v0}, Lcom/miniclip/nativeJNI/cocomusic;->pauseBackgroundMusic()V

    .line 2482
    return-void
.end method

.method public static pauseEffect(I)V
    .locals 1
    .param p0, "soundId"    # I

    .prologue
    .line 2541
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->soundPlayer:Lcom/miniclip/nativeJNI/cocosound;

    invoke-virtual {v0, p0}, Lcom/miniclip/nativeJNI/cocosound;->pauseEffect(I)V

    .line 2542
    return-void
.end method

.method public static permanentlyRemoveAds()V
    .locals 2

    .prologue
    .line 3003
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/miniclip/nativeJNI/cocojava$45;

    invoke-direct {v1}, Lcom/miniclip/nativeJNI/cocojava$45;-><init>()V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 3015
    return-void
.end method

.method public static playBackgroundMusic(Ljava/lang/String;Z)V
    .locals 1
    .param p0, "path"    # Ljava/lang/String;
    .param p1, "isLoop"    # Z

    .prologue
    .line 2473
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->backgroundMusicPlayer:Lcom/miniclip/nativeJNI/cocomusic;

    invoke-virtual {v0, p0, p1}, Lcom/miniclip/nativeJNI/cocomusic;->playBackgroundMusic(Ljava/lang/String;Z)V

    .line 2474
    return-void
.end method

.method public static playEffect(I)V
    .locals 1
    .param p0, "soundId"    # I

    .prologue
    .line 2513
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->soundPlayer:Lcom/miniclip/nativeJNI/cocosound;

    invoke-virtual {v0, p0}, Lcom/miniclip/nativeJNI/cocosound;->playEffect(I)V

    .line 2514
    return-void
.end method

.method public static playEffect(IFFIF)V
    .locals 7
    .param p0, "soundId"    # I
    .param p1, "leftGain"    # F
    .param p2, "rightGain"    # F
    .param p3, "loopTime"    # I
    .param p4, "pitch"    # F

    .prologue
    .line 2530
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->soundPlayer:Lcom/miniclip/nativeJNI/cocosound;

    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->soundPlayer:Lcom/miniclip/nativeJNI/cocosound;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v4, 0x1

    move v1, p0

    move v2, p1

    move v3, p2

    move v5, p3

    move v6, p4

    invoke-virtual/range {v0 .. v6}, Lcom/miniclip/nativeJNI/cocosound;->playEffect(IFFIIF)V

    .line 2532
    return-void
.end method

.method public static playEffect(IFFIIF)V
    .locals 7
    .param p0, "soundId"    # I
    .param p1, "leftGain"    # F
    .param p2, "rightGain"    # F
    .param p3, "priority"    # I
    .param p4, "loopTime"    # I
    .param p5, "pitch"    # F

    .prologue
    .line 2536
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->soundPlayer:Lcom/miniclip/nativeJNI/cocosound;

    move v1, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    invoke-virtual/range {v0 .. v6}, Lcom/miniclip/nativeJNI/cocosound;->playEffect(IFFIIF)V

    .line 2538
    return-void
.end method

.method public static playEffect(IIF)V
    .locals 7
    .param p0, "soundId"    # I
    .param p1, "loopTime"    # I
    .param p2, "pitch"    # F

    .prologue
    .line 2517
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->soundPlayer:Lcom/miniclip/nativeJNI/cocosound;

    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->soundPlayer:Lcom/miniclip/nativeJNI/cocosound;

    iget v2, v1, Lcom/miniclip/nativeJNI/cocosound;->mLeftVolume:F

    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->soundPlayer:Lcom/miniclip/nativeJNI/cocosound;

    iget v3, v1, Lcom/miniclip/nativeJNI/cocosound;->mRightVolume:F

    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->soundPlayer:Lcom/miniclip/nativeJNI/cocosound;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v4, 0x1

    move v1, p0

    move v5, p1

    move v6, p2

    invoke-virtual/range {v0 .. v6}, Lcom/miniclip/nativeJNI/cocosound;->playEffect(IFFIIF)V

    .line 2520
    return-void
.end method

.method public static playEffect(IIIF)V
    .locals 7
    .param p0, "soundId"    # I
    .param p1, "priority"    # I
    .param p2, "loopTime"    # I
    .param p3, "pitch"    # F

    .prologue
    .line 2524
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->soundPlayer:Lcom/miniclip/nativeJNI/cocosound;

    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->soundPlayer:Lcom/miniclip/nativeJNI/cocosound;

    iget v2, v1, Lcom/miniclip/nativeJNI/cocosound;->mLeftVolume:F

    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->soundPlayer:Lcom/miniclip/nativeJNI/cocosound;

    iget v3, v1, Lcom/miniclip/nativeJNI/cocosound;->mRightVolume:F

    move v1, p0

    move v4, p1

    move v5, p2

    move v6, p3

    invoke-virtual/range {v0 .. v6}, Lcom/miniclip/nativeJNI/cocosound;->playEffect(IFFIIF)V

    .line 2526
    return-void
.end method

.method public static preloadEffect(Ljava/lang/String;)I
    .locals 1
    .param p0, "path"    # Ljava/lang/String;

    .prologue
    .line 2569
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->soundPlayer:Lcom/miniclip/nativeJNI/cocosound;

    invoke-virtual {v0, p0}, Lcom/miniclip/nativeJNI/cocosound;->preloadEffect(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public static pushInterstitial()V
    .locals 2

    .prologue
    .line 1703
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/miniclip/nativeJNI/cocojava$22;

    invoke-direct {v1}, Lcom/miniclip/nativeJNI/cocojava$22;-><init>()V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 1720
    return-void
.end method

.method public static removeLastPendingPurchaseSignature()I
    .locals 9

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 4121
    sget-object v5, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    const-string v6, "INAPP_PURCHASED_TEMP_SIGNATURE"

    invoke-virtual {v5, v6, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 4122
    .local v2, "settingsT":Landroid/content/SharedPreferences;
    const-string v5, "amount"

    invoke-interface {v2, v5, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v5

    add-int/lit8 v0, v5, -0x1

    .line 4123
    .local v0, "amountT":I
    if-gez v0, :cond_1

    .line 4134
    :cond_0
    :goto_0
    return v3

    .line 4125
    :cond_1
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "pid"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v2, v5}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 4127
    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 4128
    .local v1, "editorT":Landroid/content/SharedPreferences$Editor;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "pid"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v1, v5}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 4129
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "data"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v1, v5}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 4130
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "sig"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v1, v5}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 4131
    const-string v5, "amount"

    invoke-interface {v1, v5, v0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 4132
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 4133
    const-string v5, "cocojava"

    const-string v6, "removePendingPurchaseSignature: %d"

    new-array v7, v4, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v3

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v5, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    move v3, v4

    .line 4134
    goto/16 :goto_0
.end method

.method public static resumeAllSounds()V
    .locals 1

    .prologue
    .line 2586
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->soundPlayer:Lcom/miniclip/nativeJNI/cocosound;

    invoke-virtual {v0}, Lcom/miniclip/nativeJNI/cocosound;->resumeAllSounds()V

    .line 2587
    return-void
.end method

.method public static resumeBackgroundMusic()V
    .locals 1

    .prologue
    .line 2485
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->backgroundMusicPlayer:Lcom/miniclip/nativeJNI/cocomusic;

    invoke-virtual {v0}, Lcom/miniclip/nativeJNI/cocomusic;->resumeBackgroundMusic()V

    .line 2486
    return-void
.end method

.method public static rewindBackgroundMusic()V
    .locals 1

    .prologue
    .line 2489
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->backgroundMusicPlayer:Lcom/miniclip/nativeJNI/cocomusic;

    invoke-virtual {v0}, Lcom/miniclip/nativeJNI/cocomusic;->rewindBackgroundMusic()V

    .line 2490
    return-void
.end method

.method public static sendEmail(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .param p0, "destination"    # Ljava/lang/String;
    .param p1, "subject"    # Ljava/lang/String;
    .param p2, "text"    # Ljava/lang/String;

    .prologue
    .line 4155
    move-object v0, p0

    .line 4156
    .local v0, "dest":Ljava/lang/String;
    move-object v1, p1

    .line 4157
    .local v1, "subj":Ljava/lang/String;
    move-object v2, p2

    .line 4159
    .local v2, "txt":Ljava/lang/String;
    sget-object v3, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v3, Landroid/app/Activity;

    new-instance v4, Lcom/miniclip/nativeJNI/cocojava$69;

    invoke-direct {v4, v0, v1, v2}, Lcom/miniclip/nativeJNI/cocojava$69;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 4177
    return-void
.end method

.method public static sendGoogleEvent(Ljava/lang/String;I)V
    .locals 3
    .param p0, "string"    # Ljava/lang/String;
    .param p1, "value"    # I

    .prologue
    .line 4207
    const-string v1, "/"

    invoke-virtual {p0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 4208
    .local v0, "event":[Ljava/lang/String;
    array-length v1, v0

    const/4 v2, 0x3

    if-ge v1, v2, :cond_0

    .line 4220
    :goto_0
    return-void

    .line 4210
    :cond_0
    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v1, Landroid/app/Activity;

    new-instance v2, Lcom/miniclip/nativeJNI/cocojava$71;

    invoke-direct {v2}, Lcom/miniclip/nativeJNI/cocojava$71;-><init>()V

    invoke-virtual {v1, v2}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method public static sendSMS(Ljava/lang/String;)V
    .locals 3
    .param p0, "text"    # Ljava/lang/String;

    .prologue
    .line 4180
    move-object v0, p0

    .line 4182
    .local v0, "txt":Ljava/lang/String;
    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v1, Landroid/app/Activity;

    new-instance v2, Lcom/miniclip/nativeJNI/cocojava$70;

    invoke-direct {v2, v0}, Lcom/miniclip/nativeJNI/cocojava$70;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 4193
    return-void
.end method

.method protected static setAdsDisabled(I)V
    .locals 5
    .param p0, "disabled"    # I

    .prologue
    .line 2922
    sget-object v2, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    const-string v3, "ADS_DISABLED"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 2924
    .local v1, "settings":Landroid/content/SharedPreferences;
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 2925
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    const/4 v2, 0x1

    if-ne p0, v2, :cond_0

    .line 2926
    const-string v2, "disabled"

    const-string v3, "true"

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 2929
    :goto_0
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 2930
    return-void

    .line 2928
    :cond_0
    const-string v2, "disabled"

    const-string v3, "false"

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    goto :goto_0
.end method

.method public static setBackgroundMusicVolume(F)V
    .locals 1
    .param p0, "volume"    # F

    .prologue
    .line 2501
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->backgroundMusicPlayer:Lcom/miniclip/nativeJNI/cocomusic;

    invoke-virtual {v0, p0}, Lcom/miniclip/nativeJNI/cocomusic;->setBackgroundVolume(F)V

    .line 2502
    return-void
.end method

.method public static setCaretPosition(I)V
    .locals 2
    .param p0, "position"    # I

    .prologue
    .line 4371
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/miniclip/nativeJNI/cocojava$80;

    invoke-direct {v1, p0}, Lcom/miniclip/nativeJNI/cocojava$80;-><init>(I)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 4377
    return-void
.end method

.method public static setClipboardText(Ljava/lang/String;)V
    .locals 2
    .param p0, "text"    # Ljava/lang/String;

    .prologue
    .line 4495
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/miniclip/nativeJNI/cocojava$82;

    invoke-direct {v1, p0}, Lcom/miniclip/nativeJNI/cocojava$82;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 4504
    return-void
.end method

.method public static setContentToGl()V
    .locals 2

    .prologue
    .line 3030
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/miniclip/nativeJNI/cocojava$46;

    invoke-direct {v1}, Lcom/miniclip/nativeJNI/cocojava$46;-><init>()V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 3035
    return-void
.end method

.method public static setEffectGain(IF)V
    .locals 1
    .param p0, "soundId"    # I
    .param p1, "gain"    # F

    .prologue
    .line 2553
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->soundPlayer:Lcom/miniclip/nativeJNI/cocosound;

    invoke-virtual {v0, p0, p1}, Lcom/miniclip/nativeJNI/cocosound;->setEffectGain(IF)V

    .line 2554
    return-void
.end method

.method public static setEffectLooping(IZ)V
    .locals 1
    .param p0, "soundId"    # I
    .param p1, "loop"    # Z

    .prologue
    .line 2549
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->soundPlayer:Lcom/miniclip/nativeJNI/cocosound;

    invoke-virtual {v0, p0, p1}, Lcom/miniclip/nativeJNI/cocosound;->setEffectLooping(IZ)V

    .line 2550
    return-void
.end method

.method public static setEffectPitch(IF)V
    .locals 1
    .param p0, "soundId"    # I
    .param p1, "pitch"    # F

    .prologue
    .line 2557
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->soundPlayer:Lcom/miniclip/nativeJNI/cocosound;

    invoke-virtual {v0, p0, p1}, Lcom/miniclip/nativeJNI/cocosound;->setEffectPitch(IF)V

    .line 2558
    return-void
.end method

.method public static setEffectsVolume(F)V
    .locals 1
    .param p0, "volume"    # F

    .prologue
    .line 2565
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->soundPlayer:Lcom/miniclip/nativeJNI/cocosound;

    invoke-virtual {v0, p0}, Lcom/miniclip/nativeJNI/cocosound;->setEffectsVolume(F)V

    .line 2566
    return-void
.end method

.method public static setFPS(F)V
    .locals 8
    .param p0, "fps"    # F

    .prologue
    .line 3038
    const-wide/32 v0, 0x3b9aca00

    .line 3039
    .local v0, "NANOSECONDSPERSECOND":J
    const-wide/high16 v4, 0x3ff0000000000000L    # 1.0

    float-to-double v6, p0

    div-double/2addr v4, v6

    long-to-double v6, v0

    mul-double/2addr v4, v6

    double-to-long v2, v4

    .line 3040
    .local v2, "animationInterval":J
    sput-wide v2, Lcom/miniclip/nativeJNI/ClearRenderer;->animationInterval:J

    .line 3041
    return-void
.end method

.method public static setFullVersion()V
    .locals 2

    .prologue
    .line 4196
    const-string v0, "FULL_VERSION"

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/miniclip/nativeJNI/cocojava;->SharedPreferences_setInt(Ljava/lang/String;I)V

    .line 4197
    return-void
.end method

.method public static setKeyboardInputMaxLength(I)V
    .locals 5
    .param p0, "maxLength"    # I

    .prologue
    .line 4604
    const-string v0, "cocojava"

    const-string v1, "setKeyboardInputMaxLength: %d"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 4605
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/miniclip/nativeJNI/cocojava$91;

    invoke-direct {v1, p0}, Lcom/miniclip/nativeJNI/cocojava$91;-><init>(I)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 4612
    return-void
.end method

.method public static setKeyboardInputPosition(FFFFFF)V
    .locals 8
    .param p0, "x"    # F
    .param p1, "y"    # F
    .param p2, "width"    # F
    .param p3, "height"    # F
    .param p4, "anchorX"    # F
    .param p5, "anchorY"    # F

    .prologue
    .line 4509
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    move-object v7, v0

    check-cast v7, Landroid/app/Activity;

    new-instance v0, Lcom/miniclip/nativeJNI/cocojava$83;

    move v1, p3

    move v2, p2

    move v3, p0

    move v4, p4

    move v5, p1

    move v6, p5

    invoke-direct/range {v0 .. v6}, Lcom/miniclip/nativeJNI/cocojava$83;-><init>(FFFFFF)V

    invoke-virtual {v7, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 4521
    return-void
.end method

.method public static setKeyboardInputSingleLine(I)V
    .locals 2
    .param p0, "singleLine"    # I

    .prologue
    .line 4580
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/miniclip/nativeJNI/cocojava$89;

    invoke-direct {v1, p0}, Lcom/miniclip/nativeJNI/cocojava$89;-><init>(I)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 4587
    return-void
.end method

.method public static setKeyboardInputStyle(IIF)V
    .locals 2
    .param p0, "background"    # I
    .param p1, "text"    # I
    .param p2, "size"    # F

    .prologue
    .line 4525
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/miniclip/nativeJNI/cocojava$84;

    invoke-direct {v1, p0, p1, p2}, Lcom/miniclip/nativeJNI/cocojava$84;-><init>(IIF)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 4532
    return-void
.end method

.method public static setKeyboardInputText(Ljava/lang/String;)V
    .locals 2
    .param p0, "text"    # Ljava/lang/String;

    .prologue
    .line 4559
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/miniclip/nativeJNI/cocojava$87;

    invoke-direct {v1, p0}, Lcom/miniclip/nativeJNI/cocojava$87;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 4564
    return-void
.end method

.method public static setKeyboardInputTypePassword(I)V
    .locals 5
    .param p0, "password"    # I

    .prologue
    .line 4591
    const-string v0, "cocojava"

    const-string v1, "setKeyboardInputTypePassword: %d"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 4592
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/miniclip/nativeJNI/cocojava$90;

    invoke-direct {v1, p0}, Lcom/miniclip/nativeJNI/cocojava$90;-><init>(I)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 4600
    return-void
.end method

.method public static setKeyboardInputVisible(I)V
    .locals 5
    .param p0, "visible"    # I

    .prologue
    .line 4536
    const-string v0, "setKeyboardInputVisible"

    const-string v1, "visible: %d"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 4537
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/miniclip/nativeJNI/cocojava$85;

    invoke-direct {v1, p0}, Lcom/miniclip/nativeJNI/cocojava$85;-><init>(I)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 4545
    return-void
.end method

.method public static setKeyboardInputVisibleDelayed(II)V
    .locals 4
    .param p0, "visible"    # I
    .param p1, "millisecs"    # I

    .prologue
    .line 4549
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mKeyboardHandler:Landroid/os/Handler;

    new-instance v1, Lcom/miniclip/nativeJNI/cocojava$86;

    invoke-direct {v1, p0}, Lcom/miniclip/nativeJNI/cocojava$86;-><init>(I)V

    int-to-long v2, p1

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 4555
    return-void
.end method

.method public static setPendingPurchaseAmount(Ljava/lang/String;I)V
    .locals 5
    .param p0, "key"    # Ljava/lang/String;
    .param p1, "amount"    # I

    .prologue
    .line 4147
    sget-object v2, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    const-string v3, "INAPP_PURCHASED_TEMP"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 4149
    .local v1, "settings":Landroid/content/SharedPreferences;
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 4150
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    invoke-interface {v0, p0, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 4151
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 4152
    return-void
.end method

.method private setSystemUiVisibility()V
    .locals 2

    .prologue
    .line 561
    invoke-virtual {p0}, Lcom/miniclip/nativeJNI/cocojava;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    const/16 v1, 0x1706

    invoke-virtual {v0, v1}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 570
    return-void
.end method

.method public static showAd(Lcom/mopub/mobileads/MoPubView;)V
    .locals 2
    .param p0, "adView"    # Lcom/mopub/mobileads/MoPubView;

    .prologue
    .line 2049
    sget-boolean v0, Lcom/miniclip/nativeJNI/cocojava;->mUSE_ADS:Z

    if-eqz v0, :cond_0

    if-nez p0, :cond_1

    .line 2061
    :cond_0
    :goto_0
    return-void

    .line 2052
    :cond_1
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/miniclip/nativeJNI/cocojava$30;

    invoke-direct {v1, p0}, Lcom/miniclip/nativeJNI/cocojava$30;-><init>(Lcom/mopub/mobileads/MoPubView;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method public static showAds()V
    .locals 2

    .prologue
    .line 2045
    const-string v0, "showAds"

    const-string v1, "deprecated use enableAdsWithPosition"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2046
    return-void
.end method

.method public static showBigAd()V
    .locals 2

    .prologue
    .line 1723
    sget-boolean v0, Lcom/miniclip/nativeJNI/cocojava;->mUSE_ADS_BIG:Z

    if-nez v0, :cond_1

    .line 1740
    :cond_0
    :goto_0
    return-void

    .line 1725
    :cond_1
    sget-boolean v0, Lcom/miniclip/nativeJNI/cocojava;->mUSE_ADS:Z

    if-eqz v0, :cond_0

    .line 1727
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/miniclip/nativeJNI/cocojava$23;

    invoke-direct {v1}, Lcom/miniclip/nativeJNI/cocojava$23;-><init>()V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method public static showDatePickerDialog_JNI(III)V
    .locals 2
    .param p0, "year"    # I
    .param p1, "month"    # I
    .param p2, "day"    # I

    .prologue
    .line 4803
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/miniclip/nativeJNI/cocojava$101;

    invoke-direct {v1, p0, p1, p2}, Lcom/miniclip/nativeJNI/cocojava$101;-><init>(III)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 4808
    return-void
.end method

.method public static showFullScreenAd()V
    .locals 2

    .prologue
    .line 1757
    const-string v0, "MopubFULLSCREEN"

    const-string v1, "showfullscreenAd"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1758
    sget-boolean v0, Lcom/miniclip/nativeJNI/cocojava;->mUSE_ADS:Z

    if-nez v0, :cond_0

    .line 1771
    :goto_0
    return-void

    .line 1761
    :cond_0
    const-string v0, "MopubFULLSCREEN"

    const-string v1, "Going to show ad!"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1763
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/miniclip/nativeJNI/cocojava$25;

    invoke-direct {v1}, Lcom/miniclip/nativeJNI/cocojava$25;-><init>()V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method public static showHorizontalBanner()V
    .locals 2

    .prologue
    .line 3144
    sget-boolean v0, Lcom/miniclip/nativeJNI/cocojava;->mHorizontalBannerDisplayed:Z

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/miniclip/nativeJNI/cocojava;->mUSE_ADS_HORIZONTAL:Z

    if-nez v0, :cond_1

    .line 3168
    :cond_0
    :goto_0
    return-void

    .line 3147
    :cond_1
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/miniclip/nativeJNI/cocojava$49;

    invoke-direct {v1}, Lcom/miniclip/nativeJNI/cocojava$49;-><init>()V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method public static showHtmlDialog(Ljava/lang/String;I)V
    .locals 2
    .param p0, "htmlContent"    # Ljava/lang/String;
    .param p1, "_path"    # I

    .prologue
    .line 4003
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/miniclip/nativeJNI/cocojava$67;

    invoke-direct {v1, p0, p1}, Lcom/miniclip/nativeJNI/cocojava$67;-><init>(Ljava/lang/String;I)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 4029
    return-void
.end method

.method public static showInterstitialBanner()V
    .locals 2

    .prologue
    .line 3457
    sget-boolean v0, Lcom/miniclip/nativeJNI/cocojava;->mUSE_ADS_INTERSTITIAL_BANNER:Z

    if-nez v0, :cond_0

    .line 3467
    :goto_0
    return-void

    .line 3459
    :cond_0
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/miniclip/nativeJNI/cocojava$57;

    invoke-direct {v1}, Lcom/miniclip/nativeJNI/cocojava$57;-><init>()V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method public static showInterstitialMopubView()V
    .locals 2

    .prologue
    .line 1580
    sget-boolean v0, Lcom/miniclip/nativeJNI/cocojava;->mUSE_ADS_INTERSTITIAL_FULLSCREEN:Z

    if-nez v0, :cond_1

    .line 1599
    :cond_0
    :goto_0
    return-void

    .line 1582
    :cond_1
    sget-boolean v0, Lcom/miniclip/nativeJNI/cocojava;->mUSE_ADS:Z

    if-eqz v0, :cond_0

    .line 1584
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/miniclip/nativeJNI/cocojava$20;

    invoke-direct {v1}, Lcom/miniclip/nativeJNI/cocojava$20;-><init>()V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method public static showMessageBox(ILjava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V
    .locals 3
    .param p0, "msgId"    # I
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "buttonTitles"    # [Ljava/lang/String;

    .prologue
    .line 1425
    new-instance v0, Lcom/miniclip/nativeJNI/DialogMessage;

    invoke-direct {v0, p0}, Lcom/miniclip/nativeJNI/DialogMessage;-><init>(I)V

    .line 1426
    .local v0, "dm":Lcom/miniclip/nativeJNI/DialogMessage;
    iput-object p1, v0, Lcom/miniclip/nativeJNI/DialogMessage;->title:Ljava/lang/String;

    .line 1427
    iput-object p2, v0, Lcom/miniclip/nativeJNI/DialogMessage;->message:Ljava/lang/String;

    .line 1428
    iput-object p3, v0, Lcom/miniclip/nativeJNI/DialogMessage;->buttonTitles:[Ljava/lang/String;

    .line 1430
    new-instance v1, Landroid/os/Message;

    invoke-direct {v1}, Landroid/os/Message;-><init>()V

    .line 1431
    .local v1, "msg":Landroid/os/Message;
    const/4 v2, 0x1

    iput v2, v1, Landroid/os/Message;->what:I

    .line 1432
    iput-object v0, v1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 1434
    sget-object v2, Lcom/miniclip/nativeJNI/cocojava;->mHandler:Landroid/os/Handler;

    invoke-virtual {v2, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 1435
    return-void
.end method

.method public static showMiniclipView()V
    .locals 2

    .prologue
    .line 1518
    sget-boolean v0, Lcom/miniclip/nativeJNI/cocojava;->mUSE_ADS:Z

    if-nez v0, :cond_0

    .line 1525
    :goto_0
    return-void

    .line 1520
    :cond_0
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/miniclip/nativeJNI/cocojava$17;

    invoke-direct {v1}, Lcom/miniclip/nativeJNI/cocojava$17;-><init>()V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method public static showMopubView()V
    .locals 2

    .prologue
    .line 1602
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/miniclip/nativeJNI/cocojava$21;

    invoke-direct {v1}, Lcom/miniclip/nativeJNI/cocojava$21;-><init>()V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 1696
    return-void
.end method

.method private showNoInternetDialog()V
    .locals 5

    .prologue
    .line 2708
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 2709
    .local v1, "builder":Landroid/app/AlertDialog$Builder;
    const-string v2, "Please enable internet"

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const-string v3, "Back"

    new-instance v4, Lcom/miniclip/nativeJNI/cocojava$37;

    invoke-direct {v4, p0}, Lcom/miniclip/nativeJNI/cocojava$37;-><init>(Lcom/miniclip/nativeJNI/cocojava;)V

    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 2723
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 2724
    .local v0, "alert":Landroid/app/Dialog;
    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    .line 2725
    return-void
.end method

.method public static showRemoveAds()V
    .locals 2

    .prologue
    .line 2933
    sget-boolean v0, Lcom/miniclip/nativeJNI/cocojava;->mRemoveAdsButtonHidden:Z

    if-nez v0, :cond_1

    .line 2944
    :cond_0
    :goto_0
    return-void

    .line 2935
    :cond_1
    const/4 v0, 0x0

    sput-boolean v0, Lcom/miniclip/nativeJNI/cocojava;->mRemoveAdsButtonHidden:Z

    .line 2936
    sget-boolean v0, Lcom/miniclip/nativeJNI/cocojava;->mUSE_ADS:Z

    if-eqz v0, :cond_0

    .line 2938
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/miniclip/nativeJNI/cocojava$41;

    invoke-direct {v1}, Lcom/miniclip/nativeJNI/cocojava$41;-><init>()V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method public static showRotatedBanner()V
    .locals 1

    .prologue
    .line 3056
    sget v0, Lcom/miniclip/nativeJNI/cocojava;->ALIGN_LEFT:I

    invoke-static {v0}, Lcom/miniclip/nativeJNI/cocojava;->showRotatedBanner(I)V

    .line 3057
    return-void
.end method

.method public static showRotatedBanner(I)V
    .locals 2
    .param p0, "alignment"    # I

    .prologue
    .line 3062
    sget v0, Lcom/miniclip/nativeJNI/cocojava;->mRotatedBannerDisplayed:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    .line 3118
    :cond_0
    :goto_0
    return-void

    .line 3064
    :cond_1
    sget-boolean v0, Lcom/miniclip/nativeJNI/cocojava;->mUSE_ADS_VERTICAL:Z

    if-eqz v0, :cond_0

    .line 3066
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/miniclip/nativeJNI/cocojava$47;

    invoke-direct {v1, p0}, Lcom/miniclip/nativeJNI/cocojava$47;-><init>(I)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method public static showSimpleTapjoyFeatureAd()V
    .locals 2

    .prologue
    .line 1541
    sget-boolean v0, Lcom/miniclip/nativeJNI/cocojava;->mUSE_TAPJOY:Z

    if-eqz v0, :cond_0

    .line 1542
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/miniclip/nativeJNI/cocojava$19;

    invoke-direct {v1}, Lcom/miniclip/nativeJNI/cocojava$19;-><init>()V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 1564
    :cond_0
    return-void
.end method

.method public static showTJOfferDialog()V
    .locals 2

    .prologue
    .line 3269
    sget-boolean v0, Lcom/miniclip/nativeJNI/cocojava;->mUSE_ADS:Z

    if-nez v0, :cond_1

    .line 3343
    :cond_0
    :goto_0
    return-void

    .line 3271
    :cond_1
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mFeaturedApObject:Lcom/tapjoy/TapjoyFeaturedAppObject;

    if-eqz v0, :cond_0

    .line 3273
    sget-boolean v0, Lcom/miniclip/nativeJNI/cocojava;->mUSE_TAPJOY:Z

    if-eqz v0, :cond_0

    .line 3275
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/miniclip/nativeJNI/cocojava$52;

    invoke-direct {v1}, Lcom/miniclip/nativeJNI/cocojava$52;-><init>()V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method public static showTapFeatureAd()V
    .locals 2

    .prologue
    .line 1528
    sget-boolean v0, Lcom/miniclip/nativeJNI/cocojava;->mUSE_TAPJOY:Z

    if-eqz v0, :cond_0

    .line 1529
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/miniclip/nativeJNI/cocojava$18;

    invoke-direct {v1}, Lcom/miniclip/nativeJNI/cocojava$18;-><init>()V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 1538
    :cond_0
    return-void
.end method

.method public static showTapJoyOffers()V
    .locals 2

    .prologue
    .line 1474
    sget-boolean v0, Lcom/miniclip/nativeJNI/cocojava;->mUSE_TAPJOY:Z

    if-eqz v0, :cond_0

    .line 1475
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/miniclip/nativeJNI/cocojava$15;

    invoke-direct {v1}, Lcom/miniclip/nativeJNI/cocojava$15;-><init>()V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 1483
    :cond_0
    return-void
.end method

.method public static showTapJoyView(Lcom/tapjoy/TapjoyFeaturedAppObject;)V
    .locals 0
    .param p0, "featuredApObject"    # Lcom/tapjoy/TapjoyFeaturedAppObject;

    .prologue
    .line 1508
    sput-object p0, Lcom/miniclip/nativeJNI/cocojava;->mFeaturedApObject:Lcom/tapjoy/TapjoyFeaturedAppObject;

    .line 1509
    return-void
.end method

.method protected static showUpSellDialog()V
    .locals 1

    .prologue
    .line 3254
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v0, Lcom/miniclip/nativeJNI/cocojava;

    invoke-virtual {v0}, Lcom/miniclip/nativeJNI/cocojava;->showUpSellDialogInternal()V

    .line 3255
    return-void
.end method

.method public static spendTapPoints(I)V
    .locals 2
    .param p0, "points"    # I

    .prologue
    .line 1486
    sget-boolean v0, Lcom/miniclip/nativeJNI/cocojava;->mUSE_TAPJOY:Z

    if-eqz v0, :cond_0

    .line 1487
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/miniclip/nativeJNI/cocojava$16;

    invoke-direct {v1, p0}, Lcom/miniclip/nativeJNI/cocojava$16;-><init>(I)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 1496
    :cond_0
    return-void
.end method

.method public static startFlurrySession(Ljava/lang/String;)V
    .locals 4
    .param p0, "productId"    # Ljava/lang/String;

    .prologue
    .line 2634
    const-string v0, "flurry"

    const-string v1, "startFlurrySession %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p0, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2635
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    invoke-static {v0, p0}, Lcom/flurry/android/FlurryAgent;->onStartSession(Landroid/content/Context;Ljava/lang/String;)V

    .line 2636
    return-void
.end method

.method public static stopBackgroundMusic()V
    .locals 1

    .prologue
    .line 2477
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->backgroundMusicPlayer:Lcom/miniclip/nativeJNI/cocomusic;

    invoke-virtual {v0}, Lcom/miniclip/nativeJNI/cocomusic;->stopBackgroundMusic()V

    .line 2478
    return-void
.end method

.method public static stopEffect(I)V
    .locals 1
    .param p0, "soundId"    # I

    .prologue
    .line 2545
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->soundPlayer:Lcom/miniclip/nativeJNI/cocosound;

    invoke-virtual {v0, p0}, Lcom/miniclip/nativeJNI/cocosound;->stopEffect(I)V

    .line 2546
    return-void
.end method

.method protected static stringToJSON(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 3
    .param p0, "jsonString"    # Ljava/lang/String;

    .prologue
    .line 2746
    const/4 v1, 0x0

    .line 2749
    .local v1, "jsn":Lorg/json/JSONObject;
    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .end local v1    # "jsn":Lorg/json/JSONObject;
    .local v2, "jsn":Lorg/json/JSONObject;
    move-object v1, v2

    .line 2753
    .end local v2    # "jsn":Lorg/json/JSONObject;
    .restart local v1    # "jsn":Lorg/json/JSONObject;
    :goto_0
    return-object v1

    .line 2750
    :catch_0
    move-exception v0

    .line 2751
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0
.end method

.method public static tapjoy_showTapFeatureAdFailed()V
    .locals 1

    .prologue
    .line 1571
    const/4 v0, 0x0

    sput-object v0, Lcom/miniclip/nativeJNI/cocojava;->mFeaturedApObject:Lcom/tapjoy/TapjoyFeaturedAppObject;

    .line 1572
    return-void
.end method

.method public static unloadEffect(Ljava/lang/String;)V
    .locals 1
    .param p0, "path"    # Ljava/lang/String;

    .prologue
    .line 2573
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->soundPlayer:Lcom/miniclip/nativeJNI/cocosound;

    invoke-virtual {v0, p0}, Lcom/miniclip/nativeJNI/cocosound;->unloadEffect(Ljava/lang/String;)V

    .line 2574
    return-void
.end method

.method static updateNotificationStatus(I)V
    .locals 2
    .param p0, "enabled"    # I

    .prologue
    .line 2821
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/miniclip/nativeJNI/cocojava$40;

    invoke-direct {v1, p0}, Lcom/miniclip/nativeJNI/cocojava$40;-><init>(I)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 2830
    return-void
.end method

.method public static vibrateForMS(I)V
    .locals 3
    .param p0, "time"    # I

    .prologue
    .line 2847
    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    const-string v2, "vibrator"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Vibrator;

    .line 2849
    .local v0, "v":Landroid/os/Vibrator;
    int-to-long v1, p0

    invoke-virtual {v0, v1, v2}, Landroid/os/Vibrator;->vibrate(J)V

    .line 2850
    return-void
.end method


# virtual methods
.method public OnAdClicked(Lcom/mopub/mobileads/MoPubView;)V
    .locals 2
    .param p1, "m"    # Lcom/mopub/mobileads/MoPubView;

    .prologue
    .line 3442
    sget-boolean v0, Lcom/miniclip/nativeJNI/cocojava;->mUSE_ADS:Z

    if-nez v0, :cond_0

    .line 3454
    :goto_0
    return-void

    .line 3445
    :cond_0
    const-string v0, "OnAdClicked"

    const-string v1, "Ad Clicked"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 3447
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mGLView:Lcom/miniclip/nativeJNI/ClearGLSurfaceView;

    new-instance v1, Lcom/miniclip/nativeJNI/cocojava$56;

    invoke-direct {v1, p0}, Lcom/miniclip/nativeJNI/cocojava$56;-><init>(Lcom/miniclip/nativeJNI/cocojava;)V

    invoke-virtual {v0, v1}, Lcom/miniclip/nativeJNI/ClearGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method public OnAdFailed(Lcom/mopub/mobileads/MoPubView;)V
    .locals 2
    .param p1, "m"    # Lcom/mopub/mobileads/MoPubView;

    .prologue
    .line 3426
    sget-boolean v0, Lcom/miniclip/nativeJNI/cocojava;->mUSE_ADS:Z

    if-nez v0, :cond_0

    .line 3437
    :goto_0
    return-void

    .line 3429
    :cond_0
    const-string v0, "OnAdFailed"

    const-string v1, "Failed to load the ad"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 3431
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mGLView:Lcom/miniclip/nativeJNI/ClearGLSurfaceView;

    new-instance v1, Lcom/miniclip/nativeJNI/cocojava$55;

    invoke-direct {v1, p0}, Lcom/miniclip/nativeJNI/cocojava$55;-><init>(Lcom/miniclip/nativeJNI/cocojava;)V

    invoke-virtual {v0, v1}, Lcom/miniclip/nativeJNI/ClearGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method public OnAdLoaded(Lcom/mopub/mobileads/MoPubView;)V
    .locals 2
    .param p1, "m"    # Lcom/mopub/mobileads/MoPubView;

    .prologue
    .line 3391
    sget-boolean v0, Lcom/miniclip/nativeJNI/cocojava;->mUSE_ADS:Z

    if-nez v0, :cond_0

    .line 3421
    :goto_0
    return-void

    .line 3394
    :cond_0
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/miniclip/nativeJNI/cocojava$53;

    invoke-direct {v1, p0, p1}, Lcom/miniclip/nativeJNI/cocojava$53;-><init>(Lcom/miniclip/nativeJNI/cocojava;Lcom/mopub/mobileads/MoPubView;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 3414
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mGLView:Lcom/miniclip/nativeJNI/ClearGLSurfaceView;

    new-instance v1, Lcom/miniclip/nativeJNI/cocojava$54;

    invoke-direct {v1, p0}, Lcom/miniclip/nativeJNI/cocojava$54;-><init>(Lcom/miniclip/nativeJNI/cocojava;)V

    invoke-virtual {v0, v1}, Lcom/miniclip/nativeJNI/ClearGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method public OnInterstitialFailed()V
    .locals 2

    .prologue
    .line 2630
    const-string v0, "No ad available"

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 2631
    return-void
.end method

.method public OnInterstitialLoaded()V
    .locals 0

    .prologue
    .line 2627
    return-void
.end method

.method buttonValue2Int(I)I
    .locals 2
    .param p1, "value"    # I

    .prologue
    const/4 v0, 0x0

    .line 1342
    packed-switch p1, :pswitch_data_0

    .line 1353
    sget-boolean v1, Lcom/miniclip/nativeJNI/cocojava;->$assertionsDisabled:Z

    if-nez v1, :cond_0

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 1347
    :pswitch_0
    const/4 v0, 0x1

    .line 1354
    :cond_0
    :goto_0
    :pswitch_1
    return v0

    .line 1350
    :pswitch_2
    const/4 v0, 0x2

    goto :goto_0

    .line 1342
    :pswitch_data_0
    .packed-switch -0x3
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method protected callGetJar(Ljava/lang/String;ILjava/lang/String;III)V
    .locals 2
    .param p1, "itemID"    # Ljava/lang/String;
    .param p2, "price"    # I
    .param p3, "title"    # Ljava/lang/String;
    .param p4, "callback"    # I
    .param p5, "self"    # I
    .param p6, "showDialog"    # I

    .prologue
    .line 363
    const-string v0, "cocojava"

    const-string v1, "ERROR! OVERRIDE ME!"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 364
    return-void
.end method

.method public callInAppPurchaseCustom(Ljava/lang/String;)I
    .locals 2
    .param p1, "itemID"    # Ljava/lang/String;

    .prologue
    .line 2121
    const-string v0, "callInAppPurchaseCustom"

    const-string v1, "ERROR! OVERRIDE ME!"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2122
    const/4 v0, 0x0

    return v0
.end method

.method public callInAppPurchaseManagedCustom(Ljava/lang/String;)I
    .locals 2
    .param p1, "itemID"    # Ljava/lang/String;

    .prologue
    .line 2116
    const-string v0, "callInAppPurchaseManagedCustom"

    const-string v1, "ERROR! OVERRIDE ME!"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2117
    const/4 v0, 0x0

    return v0
.end method

.method protected callRemoveAds()V
    .locals 0

    .prologue
    .line 3487
    return-void
.end method

.method protected cancelCustomNotification(I)V
    .locals 2
    .param p1, "nid"    # I

    .prologue
    .line 375
    const-string v0, "cocojava"

    const-string v1, "ERROR! OVERRIDE ME!"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 376
    return-void
.end method

.method closeDialog(I)V
    .locals 3
    .param p1, "msgId"    # I

    .prologue
    .line 1414
    iget-object v1, p0, Lcom/miniclip/nativeJNI/cocojava;->mDialogs:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1415
    iget-object v1, p0, Lcom/miniclip/nativeJNI/cocojava;->mDialogs:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Dialog;

    .line 1416
    .local v0, "dialog":Landroid/app/Dialog;
    if-eqz v0, :cond_0

    .line 1417
    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    .line 1419
    :cond_0
    iget-object v1, p0, Lcom/miniclip/nativeJNI/cocojava;->mDialogs:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1421
    .end local v0    # "dialog":Landroid/app/Dialog;
    :cond_1
    return-void
.end method

.method protected createCustomNotification(ILjava/lang/String;Ljava/lang/String;I)V
    .locals 2
    .param p1, "nid"    # I
    .param p2, "title"    # Ljava/lang/String;
    .param p3, "text"    # Ljava/lang/String;
    .param p4, "seconds"    # I

    .prologue
    .line 372
    const-string v0, "cocojava"

    const-string v1, "ERROR! OVERRIDE ME!"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 373
    return-void
.end method

.method createResources()V
    .locals 18

    .prologue
    .line 2359
    const-string v14, "JAVAINFO"

    invoke-virtual/range {p0 .. p0}, Lcom/miniclip/nativeJNI/cocojava;->getFilesDir()Ljava/io/File;

    move-result-object v15

    invoke-virtual {v15}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2360
    new-instance v2, Ljava/io/File;

    invoke-virtual/range {p0 .. p0}, Lcom/miniclip/nativeJNI/cocojava;->getFilesDir()Ljava/io/File;

    move-result-object v14

    const-string v15, "Contents/Resources"

    invoke-direct {v2, v14, v15}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 2361
    .local v2, "contRes":Ljava/io/File;
    const-string v14, "JAVAINFO"

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2362
    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    .line 2388
    :try_start_0
    invoke-virtual/range {p0 .. p0}, Lcom/miniclip/nativeJNI/cocojava;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v14

    invoke-virtual/range {p0 .. p0}, Lcom/miniclip/nativeJNI/cocojava;->getPackageName()Ljava/lang/String;

    move-result-object v15

    const/16 v16, 0x0

    invoke-virtual/range {v14 .. v16}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    .line 2390
    .local v0, "ai":Landroid/content/pm/ApplicationInfo;
    iget-object v14, v0, Landroid/content/pm/ApplicationInfo;->sourceDir:Ljava/lang/String;

    invoke-static {v14}, Lcom/miniclip/nativeJNI/CocoJNI;->MsetAPKPath(Ljava/lang/String;)V

    .line 2391
    const-string v14, "JAVAINFO"

    iget-object v15, v0, Landroid/content/pm/ApplicationInfo;->sourceDir:Ljava/lang/String;

    invoke-static {v14, v15}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2392
    const-string v14, "JAVAINFO"

    iget-object v15, v0, Landroid/content/pm/ApplicationInfo;->dataDir:Ljava/lang/String;

    invoke-static {v14, v15}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2393
    new-instance v13, Ljava/util/zip/ZipFile;

    iget-object v14, v0, Landroid/content/pm/ApplicationInfo;->sourceDir:Ljava/lang/String;

    invoke-direct {v13, v14}, Ljava/util/zip/ZipFile;-><init>(Ljava/lang/String;)V

    .line 2395
    .local v13, "zf":Ljava/util/zip/ZipFile;
    invoke-virtual {v13}, Ljava/util/zip/ZipFile;->entries()Ljava/util/Enumeration;

    move-result-object v5

    .line 2397
    .local v5, "entries":Ljava/util/Enumeration;, "Ljava/util/Enumeration<+Ljava/util/zip/ZipEntry;>;"
    :cond_0
    :goto_0
    invoke-interface {v5}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v14

    if-eqz v14, :cond_2

    .line 2398
    invoke-interface {v5}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/zip/ZipEntry;

    .line 2399
    .local v6, "entry":Ljava/util/zip/ZipEntry;
    invoke-virtual {v6}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/String;->length()I

    move-result v14

    const/16 v15, 0xf

    if-lt v14, v15, :cond_0

    .line 2403
    const-string v14, "assets/unpack/"

    invoke-virtual {v6}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v15

    const/16 v16, 0x0

    const/16 v17, 0xe

    invoke-virtual/range {v15 .. v17}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_0

    .line 2411
    new-instance v8, Ljava/io/File;

    invoke-virtual {v6}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v14

    const/16 v15, 0xe

    invoke-virtual {v14, v15}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v14

    invoke-direct {v8, v2, v14}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 2413
    .local v8, "newPath":Ljava/io/File;
    invoke-virtual {v8}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v11

    .line 2415
    .local v11, "parentPath":Ljava/io/File;
    if-eqz v11, :cond_1

    .line 2416
    invoke-virtual {v11}, Ljava/io/File;->mkdirs()Z

    .line 2417
    :cond_1
    invoke-virtual {v8}, Ljava/io/File;->exists()Z

    move-result v14

    if-nez v14, :cond_0

    .line 2421
    invoke-virtual {v13, v6}, Ljava/util/zip/ZipFile;->getInputStream(Ljava/util/zip/ZipEntry;)Ljava/io/InputStream;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_3

    move-result-object v12

    .line 2428
    .local v12, "ris":Ljava/io/InputStream;
    :try_start_1
    new-instance v9, Ljava/io/File;

    invoke-virtual {v6}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v14

    const/16 v15, 0xe

    invoke-virtual {v14, v15}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v14

    invoke-direct {v9, v2, v14}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 2430
    .local v9, "newRes":Ljava/io/File;
    invoke-virtual {v9}, Ljava/io/File;->delete()Z

    .line 2431
    new-instance v7, Ljava/io/FileOutputStream;

    invoke-direct {v7, v9}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 2433
    .local v7, "fos":Ljava/io/FileOutputStream;
    const/16 v14, 0x1000

    new-array v1, v14, [B

    .line 2434
    .local v1, "buf":[B
    :goto_1
    invoke-virtual {v12, v1}, Ljava/io/InputStream;->read([B)I

    move-result v10

    .local v10, "numRead":I
    if-ltz v10, :cond_3

    .line 2435
    const/4 v14, 0x0

    invoke-virtual {v7, v1, v14, v10}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    .line 2438
    .end local v1    # "buf":[B
    .end local v7    # "fos":Ljava/io/FileOutputStream;
    .end local v9    # "newRes":Ljava/io/File;
    .end local v10    # "numRead":I
    :catch_0
    move-exception v3

    .line 2440
    .local v3, "e":Ljava/io/FileNotFoundException;
    :try_start_2
    invoke-virtual {v3}, Ljava/io/FileNotFoundException;->printStackTrace()V
    :try_end_2
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_3

    goto :goto_0

    .line 2449
    .end local v0    # "ai":Landroid/content/pm/ApplicationInfo;
    .end local v3    # "e":Ljava/io/FileNotFoundException;
    .end local v5    # "entries":Ljava/util/Enumeration;, "Ljava/util/Enumeration<+Ljava/util/zip/ZipEntry;>;"
    .end local v6    # "entry":Ljava/util/zip/ZipEntry;
    .end local v8    # "newPath":Ljava/io/File;
    .end local v11    # "parentPath":Ljava/io/File;
    .end local v12    # "ris":Ljava/io/InputStream;
    .end local v13    # "zf":Ljava/util/zip/ZipFile;
    :catch_1
    move-exception v4

    .line 2451
    .local v4, "e1":Landroid/content/pm/PackageManager$NameNotFoundException;
    invoke-virtual {v4}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    .line 2456
    .end local v4    # "e1":Landroid/content/pm/PackageManager$NameNotFoundException;
    :cond_2
    :goto_2
    return-void

    .line 2437
    .restart local v0    # "ai":Landroid/content/pm/ApplicationInfo;
    .restart local v1    # "buf":[B
    .restart local v5    # "entries":Ljava/util/Enumeration;, "Ljava/util/Enumeration<+Ljava/util/zip/ZipEntry;>;"
    .restart local v6    # "entry":Ljava/util/zip/ZipEntry;
    .restart local v7    # "fos":Ljava/io/FileOutputStream;
    .restart local v8    # "newPath":Ljava/io/File;
    .restart local v9    # "newRes":Ljava/io/File;
    .restart local v10    # "numRead":I
    .restart local v11    # "parentPath":Ljava/io/File;
    .restart local v12    # "ris":Ljava/io/InputStream;
    .restart local v13    # "zf":Ljava/util/zip/ZipFile;
    :cond_3
    :try_start_3
    invoke-virtual {v7}, Ljava/io/FileOutputStream;->close()V
    :try_end_3
    .catch Ljava/io/FileNotFoundException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_3 .. :try_end_3} :catch_1

    goto/16 :goto_0

    .line 2442
    .end local v1    # "buf":[B
    .end local v7    # "fos":Ljava/io/FileOutputStream;
    .end local v9    # "newRes":Ljava/io/File;
    .end local v10    # "numRead":I
    :catch_2
    move-exception v3

    .line 2444
    .local v3, "e":Ljava/io/IOException;
    :try_start_4
    invoke-virtual {v3}, Ljava/io/IOException;->printStackTrace()V
    :try_end_4
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3

    goto/16 :goto_0

    .line 2452
    .end local v0    # "ai":Landroid/content/pm/ApplicationInfo;
    .end local v3    # "e":Ljava/io/IOException;
    .end local v5    # "entries":Ljava/util/Enumeration;, "Ljava/util/Enumeration<+Ljava/util/zip/ZipEntry;>;"
    .end local v6    # "entry":Ljava/util/zip/ZipEntry;
    .end local v8    # "newPath":Ljava/io/File;
    .end local v11    # "parentPath":Ljava/io/File;
    .end local v12    # "ris":Ljava/io/InputStream;
    .end local v13    # "zf":Ljava/util/zip/ZipFile;
    :catch_3
    move-exception v3

    .line 2454
    .restart local v3    # "e":Ljava/io/IOException;
    invoke-virtual {v3}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_2
.end method

.method public firstRun()V
    .locals 40

    .prologue
    .line 649
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/miniclip/nativeJNI/cocojava;->isFirstRun:Z

    move/from16 v35, v0

    if-nez v35, :cond_1

    .line 1247
    :cond_0
    :goto_0
    return-void

    .line 651
    :cond_1
    const/16 v35, 0x0

    move/from16 v0, v35

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/miniclip/nativeJNI/cocojava;->isFirstRun:Z

    .line 653
    const-string v35, "JAVAINFO"

    const-string v36, "firstRun"

    invoke-static/range {v35 .. v36}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 655
    sget-boolean v35, Lcom/miniclip/nativeJNI/cocojava;->mUSE_DEVICEID:Z

    if-eqz v35, :cond_2

    .line 656
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->getDeviceId()Ljava/lang/String;

    move-result-object v35

    sput-object v35, Lcom/miniclip/nativeJNI/cocojava;->mDeviceID:Ljava/lang/String;

    .line 660
    :cond_2
    sget-object v35, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    invoke-static/range {v35 .. v35}, Lcom/miniclip/nativeJNI/CocoJNI;->MsetMainActivity(Ljava/lang/Object;)V

    .line 661
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v35

    invoke-virtual/range {v35 .. v35}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v35

    invoke-static/range {v35 .. v35}, Lcom/miniclip/nativeJNI/CocoJNI;->MsetCountryCode(Ljava/lang/String;)V

    .line 663
    const/16 v35, 0x0

    sput-object v35, Lcom/miniclip/nativeJNI/cocojava;->mFeaturedApObject:Lcom/tapjoy/TapjoyFeaturedAppObject;

    .line 665
    sget-boolean v35, Lcom/miniclip/nativeJNI/cocojava;->mUSE_ADS:Z

    if-eqz v35, :cond_3

    .line 667
    new-instance v35, Lcom/mopub/mobileads/MoPubConversionTracker;

    invoke-direct/range {v35 .. v35}, Lcom/mopub/mobileads/MoPubConversionTracker;-><init>()V

    move-object/from16 v0, v35

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lcom/mopub/mobileads/MoPubConversionTracker;->reportAppOpen(Landroid/content/Context;)V

    .line 669
    const/16 v35, 0x0

    sput-object v35, Lcom/miniclip/nativeJNI/cocojava;->adViewGame:Lcom/mopub/mobileads/MoPubView;

    .line 670
    const/16 v35, 0x0

    sput-object v35, Lcom/miniclip/nativeJNI/cocojava;->adViewMenu:Lcom/mopub/mobileads/MoPubView;

    .line 671
    const/16 v35, 0x0

    sput-object v35, Lcom/miniclip/nativeJNI/cocojava;->mBigAdView:Landroid/widget/RelativeLayout;

    .line 672
    const/16 v35, 0x0

    sput-object v35, Lcom/miniclip/nativeJNI/cocojava;->mInterstitialBanner:Lcom/miniclip/nativeJNI/interstitialBanner;

    .line 673
    const/16 v35, 0x0

    sput-object v35, Lcom/miniclip/nativeJNI/cocojava;->mFullscreenInterstitial:Lcom/miniclip/nativeJNI/interstitialMopubView;

    .line 674
    const/16 v35, 0x0

    sput-object v35, Lcom/miniclip/nativeJNI/cocojava;->mRotatedBanner:Lcom/miniclip/nativeJNI/rotatedBannerImg;

    .line 675
    const/16 v35, 0x0

    sput-object v35, Lcom/miniclip/nativeJNI/cocojava;->mHorizontalBanner:Lcom/miniclip/nativeJNI/horizontalBanner;

    .line 679
    :cond_3
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->getAppVersionNumber()Ljava/lang/String;

    move-result-object v35

    invoke-static/range {v35 .. v35}, Lcom/miniclip/nativeJNI/CocoJNI;->MsetAppVersionNumber(Ljava/lang/String;)V

    .line 681
    invoke-virtual/range {p0 .. p0}, Lcom/miniclip/nativeJNI/cocojava;->getFilesDir()Ljava/io/File;

    move-result-object v35

    if-nez v35, :cond_4

    .line 682
    new-instance v35, Ljava/io/File;

    new-instance v36, Ljava/lang/StringBuilder;

    invoke-direct/range {v36 .. v36}, Ljava/lang/StringBuilder;-><init>()V

    const-string v37, "/data/data/"

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    invoke-virtual/range {p0 .. p0}, Lcom/miniclip/nativeJNI/cocojava;->getPackageName()Ljava/lang/String;

    move-result-object v37

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    const-string v37, "/files/"

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v36

    invoke-direct/range {v35 .. v36}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {v35 .. v35}, Ljava/io/File;->mkdirs()Z

    .line 685
    :cond_4
    invoke-virtual/range {p0 .. p0}, Lcom/miniclip/nativeJNI/cocojava;->getFilesDir()Ljava/io/File;

    move-result-object v35

    invoke-virtual/range {v35 .. v35}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v35

    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->getExternalStorageDirectory()Ljava/lang/String;

    move-result-object v36

    invoke-static/range {v35 .. v36}, Lcom/miniclip/nativeJNI/CocoJNI;->MsetFilesPath(Ljava/lang/String;Ljava/lang/String;)V

    .line 687
    const-string v35, "Files Path"

    invoke-virtual/range {p0 .. p0}, Lcom/miniclip/nativeJNI/cocojava;->getFilesDir()Ljava/io/File;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v36

    invoke-static/range {v35 .. v36}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 689
    invoke-virtual/range {p0 .. p0}, Lcom/miniclip/nativeJNI/cocojava;->getResources()Landroid/content/res/Resources;

    move-result-object v35

    invoke-virtual/range {v35 .. v35}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v35

    move-object/from16 v0, v35

    iget v0, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    move/from16 v35, v0

    sput v35, Lcom/miniclip/nativeJNI/cocojava;->mWidth:I

    .line 690
    invoke-virtual/range {p0 .. p0}, Lcom/miniclip/nativeJNI/cocojava;->getResources()Landroid/content/res/Resources;

    move-result-object v35

    invoke-virtual/range {v35 .. v35}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v35

    move-object/from16 v0, v35

    iget v0, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    move/from16 v35, v0

    sput v35, Lcom/miniclip/nativeJNI/cocojava;->mHeight:I

    .line 693
    sget-boolean v35, Lcom/miniclip/nativeJNI/cocojava;->mMinimumResolutionSD:Z

    if-eqz v35, :cond_5

    .line 694
    sget-boolean v35, Lcom/miniclip/nativeJNI/cocojava;->mINGAME_LANDSCAPE:Z

    if-nez v35, :cond_10

    .line 695
    const/16 v35, 0x140

    sput v35, Lcom/miniclip/nativeJNI/cocojava;->mWidth:I

    .line 696
    const/16 v35, 0x1e0

    sput v35, Lcom/miniclip/nativeJNI/cocojava;->mHeight:I

    .line 703
    :cond_5
    :goto_1
    invoke-virtual/range {p0 .. p0}, Lcom/miniclip/nativeJNI/cocojava;->getResources()Landroid/content/res/Resources;

    move-result-object v35

    invoke-virtual/range {v35 .. v35}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v35

    move-object/from16 v0, v35

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    move/from16 v35, v0

    sput v35, Lcom/miniclip/nativeJNI/cocojava;->mDensity:F

    .line 704
    const-string v35, "Dim"

    const-string v36, "width: %d, height: %d, density: %f"

    const/16 v37, 0x3

    move/from16 v0, v37

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v37, v0

    const/16 v38, 0x0

    sget v39, Lcom/miniclip/nativeJNI/cocojava;->mWidth:I

    invoke-static/range {v39 .. v39}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v39

    aput-object v39, v37, v38

    const/16 v38, 0x1

    sget v39, Lcom/miniclip/nativeJNI/cocojava;->mHeight:I

    invoke-static/range {v39 .. v39}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v39

    aput-object v39, v37, v38

    const/16 v38, 0x2

    sget v39, Lcom/miniclip/nativeJNI/cocojava;->mDensity:F

    invoke-static/range {v39 .. v39}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v39

    aput-object v39, v37, v38

    invoke-static/range {v36 .. v37}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v36

    invoke-static/range {v35 .. v36}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 706
    sget v35, Lcom/miniclip/nativeJNI/cocojava;->mDensity:F

    invoke-static/range {v35 .. v35}, Lcom/miniclip/nativeJNI/CocoJNI;->MsetDensity(F)V

    .line 707
    sget v35, Lcom/miniclip/nativeJNI/cocojava;->mWidth:I

    sget v36, Lcom/miniclip/nativeJNI/cocojava;->mHeight:I

    invoke-static/range {v35 .. v36}, Lcom/miniclip/nativeJNI/CocoJNI;->MdisplayInfo(II)V

    .line 709
    new-instance v35, Lcom/miniclip/nativeJNI/cocomusic;

    move-object/from16 v0, v35

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/miniclip/nativeJNI/cocomusic;-><init>(Landroid/content/Context;)V

    sput-object v35, Lcom/miniclip/nativeJNI/cocojava;->backgroundMusicPlayer:Lcom/miniclip/nativeJNI/cocomusic;

    .line 710
    new-instance v35, Lcom/miniclip/nativeJNI/cocosound;

    move-object/from16 v0, v35

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/miniclip/nativeJNI/cocosound;-><init>(Landroid/content/Context;)V

    sput-object v35, Lcom/miniclip/nativeJNI/cocojava;->soundPlayer:Lcom/miniclip/nativeJNI/cocosound;

    .line 712
    new-instance v35, Lcom/miniclip/nativeJNI/cocoaccel;

    move-object/from16 v0, v35

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/miniclip/nativeJNI/cocoaccel;-><init>(Landroid/content/Context;)V

    sput-object v35, Lcom/miniclip/nativeJNI/cocojava;->accelerometer:Lcom/miniclip/nativeJNI/cocoaccel;

    .line 713
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->enableAccelerometer()V

    .line 715
    new-instance v35, Lcom/miniclip/nativeJNI/cocotexture;

    move-object/from16 v0, v35

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/miniclip/nativeJNI/cocotexture;-><init>(Landroid/content/Context;)V

    sput-object v35, Lcom/miniclip/nativeJNI/cocojava;->texture:Lcom/miniclip/nativeJNI/cocotexture;

    .line 717
    new-instance v35, Lcom/miniclip/nativeJNI/ClearGLSurfaceView;

    move-object/from16 v0, v35

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/miniclip/nativeJNI/ClearGLSurfaceView;-><init>(Landroid/content/Context;)V

    sput-object v35, Lcom/miniclip/nativeJNI/cocojava;->mGLView:Lcom/miniclip/nativeJNI/ClearGLSurfaceView;

    .line 726
    new-instance v35, Lcom/miniclip/nativeJNI/ClearRenderer;

    invoke-direct/range {v35 .. v35}, Lcom/miniclip/nativeJNI/ClearRenderer;-><init>()V

    sput-object v35, Lcom/miniclip/nativeJNI/cocojava;->mRenderer:Lcom/miniclip/nativeJNI/ClearRenderer;

    .line 727
    sget-object v35, Lcom/miniclip/nativeJNI/cocojava;->mRenderer:Lcom/miniclip/nativeJNI/ClearRenderer;

    sget-object v36, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    invoke-virtual/range {v35 .. v36}, Lcom/miniclip/nativeJNI/ClearRenderer;->setContext(Landroid/content/Context;)V

    .line 730
    sget-object v35, Lcom/miniclip/nativeJNI/cocojava;->mGLView:Lcom/miniclip/nativeJNI/ClearGLSurfaceView;

    sget-object v36, Lcom/miniclip/nativeJNI/cocojava;->mRenderer:Lcom/miniclip/nativeJNI/ClearRenderer;

    invoke-virtual/range {v35 .. v36}, Lcom/miniclip/nativeJNI/ClearGLSurfaceView;->setRenderer(Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$Renderer;)V

    .line 743
    new-instance v35, Landroid/widget/RelativeLayout;

    move-object/from16 v0, v35

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    sput-object v35, Lcom/miniclip/nativeJNI/cocojava;->adLayout:Landroid/widget/RelativeLayout;

    .line 744
    sget-object v35, Lcom/miniclip/nativeJNI/cocojava;->adLayout:Landroid/widget/RelativeLayout;

    sget v36, Lcom/miniclip/nativeJNI/cocojava;->mWidth:I

    invoke-virtual/range {v35 .. v36}, Landroid/widget/RelativeLayout;->setMinimumWidth(I)V

    .line 745
    sget-object v35, Lcom/miniclip/nativeJNI/cocojava;->adLayout:Landroid/widget/RelativeLayout;

    sget v36, Lcom/miniclip/nativeJNI/cocojava;->mHeight:I

    invoke-virtual/range {v35 .. v36}, Landroid/widget/RelativeLayout;->setMinimumHeight(I)V

    .line 747
    new-instance v35, Landroid/widget/RelativeLayout;

    move-object/from16 v0, v35

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    sput-object v35, Lcom/miniclip/nativeJNI/cocojava;->adLayoutH:Landroid/widget/RelativeLayout;

    .line 748
    new-instance v10, Landroid/widget/RelativeLayout$LayoutParams;

    const/16 v35, -0x1

    const/16 v36, -0x1

    move/from16 v0, v35

    move/from16 v1, v36

    invoke-direct {v10, v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 751
    .local v10, "paramsH":Landroid/widget/RelativeLayout$LayoutParams;
    sget-object v35, Lcom/miniclip/nativeJNI/cocojava;->adLayoutH:Landroid/widget/RelativeLayout;

    move-object/from16 v0, v35

    invoke-virtual {v0, v10}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 752
    sget-object v35, Lcom/miniclip/nativeJNI/cocojava;->adLayoutH:Landroid/widget/RelativeLayout;

    sget-object v36, Lcom/miniclip/nativeJNI/cocojava;->adLayout:Landroid/widget/RelativeLayout;

    invoke-virtual/range {v35 .. v36}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 770
    new-instance v35, Landroid/widget/RelativeLayout;

    move-object/from16 v0, v35

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    sput-object v35, Lcom/miniclip/nativeJNI/cocojava;->layout:Landroid/widget/RelativeLayout;

    .line 771
    sget-object v35, Lcom/miniclip/nativeJNI/cocojava;->layout:Landroid/widget/RelativeLayout;

    sget v36, Lcom/miniclip/nativeJNI/cocojava;->mWidth:I

    invoke-virtual/range {v35 .. v36}, Landroid/widget/RelativeLayout;->setMinimumWidth(I)V

    .line 772
    sget-object v35, Lcom/miniclip/nativeJNI/cocojava;->layout:Landroid/widget/RelativeLayout;

    sget v36, Lcom/miniclip/nativeJNI/cocojava;->mHeight:I

    invoke-virtual/range {v35 .. v36}, Landroid/widget/RelativeLayout;->setMinimumHeight(I)V

    .line 774
    sget-boolean v35, Lcom/miniclip/nativeJNI/cocojava;->mUSE_ADS_VERTICAL:Z

    if-eqz v35, :cond_11

    .line 775
    sget-object v35, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    invoke-virtual/range {v35 .. v35}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v35

    const-string v36, "side1"

    const-string v37, "drawable"

    sget-object v38, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    invoke-virtual/range {v38 .. v38}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v38

    invoke-virtual/range {v35 .. v38}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v13

    .line 777
    .local v13, "resourceIdSide1":I
    sget-object v35, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    invoke-virtual/range {v35 .. v35}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v35

    const-string v36, "side2"

    const-string v37, "drawable"

    sget-object v38, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    invoke-virtual/range {v38 .. v38}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v38

    invoke-virtual/range {v35 .. v38}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v14

    .line 779
    .local v14, "resourceIdSide2":I
    sget-object v35, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    invoke-virtual/range {v35 .. v35}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v35

    const-string v36, "side3"

    const-string v37, "drawable"

    sget-object v38, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    invoke-virtual/range {v38 .. v38}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v38

    invoke-virtual/range {v35 .. v38}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v15

    .line 781
    .local v15, "resourceIdSide3":I
    sget-object v35, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    invoke-virtual/range {v35 .. v35}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v35

    const-string v36, "a100x640"

    const-string v37, "drawable"

    sget-object v38, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    invoke-virtual/range {v38 .. v38}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v38

    invoke-virtual/range {v35 .. v38}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v16

    .line 785
    .local v16, "resourceIdSide4":I
    new-instance v35, Landroid/widget/RelativeLayout;

    move-object/from16 v0, v35

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    sput-object v35, Lcom/miniclip/nativeJNI/cocojava;->sideBar1:Landroid/widget/RelativeLayout;

    .line 786
    new-instance v27, Landroid/widget/RelativeLayout$LayoutParams;

    const/high16 v35, 0x42480000    # 50.0f

    sget v36, Lcom/miniclip/nativeJNI/cocojava;->mDensity:F

    mul-float v35, v35, v36

    move/from16 v0, v35

    float-to-int v0, v0

    move/from16 v35, v0

    sget v36, Lcom/miniclip/nativeJNI/cocojava;->mHeight:I

    move/from16 v0, v36

    int-to-float v0, v0

    move/from16 v36, v0

    const/high16 v37, 0x43a00000    # 320.0f

    sget v38, Lcom/miniclip/nativeJNI/cocojava;->mDensity:F

    mul-float v37, v37, v38

    sub-float v36, v36, v37

    const/high16 v37, 0x3f000000    # 0.5f

    mul-float v36, v36, v37

    move/from16 v0, v36

    float-to-int v0, v0

    move/from16 v36, v0

    move-object/from16 v0, v27

    move/from16 v1, v35

    move/from16 v2, v36

    invoke-direct {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 789
    .local v27, "sideBar1Params":Landroid/widget/RelativeLayout$LayoutParams;
    sget-object v35, Lcom/miniclip/nativeJNI/cocojava;->sideBar1:Landroid/widget/RelativeLayout;

    move-object/from16 v0, v35

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 790
    new-instance v22, Landroid/widget/ImageView;

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 791
    .local v22, "sideBar1Image1":Landroid/widget/ImageView;
    invoke-virtual/range {p0 .. p0}, Lcom/miniclip/nativeJNI/cocojava;->getResources()Landroid/content/res/Resources;

    move-result-object v35

    move-object/from16 v0, v35

    invoke-virtual {v0, v14}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v35

    move-object/from16 v0, v22

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 793
    new-instance v35, Landroid/widget/Gallery$LayoutParams;

    const/16 v36, -0x1

    const/16 v37, -0x1

    invoke-direct/range {v35 .. v37}, Landroid/widget/Gallery$LayoutParams;-><init>(II)V

    move-object/from16 v0, v22

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 795
    sget-object v35, Landroid/widget/ImageView$ScaleType;->FIT_XY:Landroid/widget/ImageView$ScaleType;

    move-object/from16 v0, v22

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 796
    sget-object v35, Lcom/miniclip/nativeJNI/cocojava;->sideBar1:Landroid/widget/RelativeLayout;

    move-object/from16 v0, v35

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 797
    new-instance v23, Landroid/widget/ImageView;

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 798
    .local v23, "sideBar1Image2":Landroid/widget/ImageView;
    invoke-virtual/range {p0 .. p0}, Lcom/miniclip/nativeJNI/cocojava;->getResources()Landroid/content/res/Resources;

    move-result-object v35

    move-object/from16 v0, v35

    invoke-virtual {v0, v13}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v35

    move-object/from16 v0, v23

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 800
    new-instance v35, Landroid/widget/Gallery$LayoutParams;

    const/16 v36, -0x1

    const/high16 v37, 0x41a00000    # 20.0f

    sget v38, Lcom/miniclip/nativeJNI/cocojava;->mDensity:F

    mul-float v37, v37, v38

    move/from16 v0, v37

    float-to-int v0, v0

    move/from16 v37, v0

    invoke-direct/range {v35 .. v37}, Landroid/widget/Gallery$LayoutParams;-><init>(II)V

    move-object/from16 v0, v23

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 802
    sget-object v35, Landroid/widget/ImageView$ScaleType;->FIT_XY:Landroid/widget/ImageView$ScaleType;

    move-object/from16 v0, v23

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 803
    sget-object v35, Lcom/miniclip/nativeJNI/cocojava;->sideBar1:Landroid/widget/RelativeLayout;

    move-object/from16 v0, v35

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 804
    new-instance v25, Landroid/widget/RelativeLayout;

    move-object/from16 v0, v25

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 805
    .local v25, "sideBar1Layout1":Landroid/widget/RelativeLayout;
    new-instance v26, Landroid/widget/RelativeLayout$LayoutParams;

    const/16 v35, -0x1

    const/high16 v36, 0x41a00000    # 20.0f

    sget v37, Lcom/miniclip/nativeJNI/cocojava;->mDensity:F

    mul-float v36, v36, v37

    move/from16 v0, v36

    float-to-int v0, v0

    move/from16 v36, v0

    move-object/from16 v0, v26

    move/from16 v1, v35

    move/from16 v2, v36

    invoke-direct {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 807
    .local v26, "sideBar1Layout1Params":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v35, 0xc

    move-object/from16 v0, v26

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 808
    invoke-virtual/range {v25 .. v26}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 809
    new-instance v24, Landroid/widget/ImageView;

    move-object/from16 v0, v24

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 810
    .local v24, "sideBar1Image3":Landroid/widget/ImageView;
    invoke-virtual/range {p0 .. p0}, Lcom/miniclip/nativeJNI/cocojava;->getResources()Landroid/content/res/Resources;

    move-result-object v35

    move-object/from16 v0, v35

    invoke-virtual {v0, v15}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v35

    move-object/from16 v0, v24

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 812
    new-instance v35, Landroid/widget/Gallery$LayoutParams;

    const/16 v36, -0x1

    const/high16 v37, 0x41a00000    # 20.0f

    sget v38, Lcom/miniclip/nativeJNI/cocojava;->mDensity:F

    mul-float v37, v37, v38

    move/from16 v0, v37

    float-to-int v0, v0

    move/from16 v37, v0

    invoke-direct/range {v35 .. v37}, Landroid/widget/Gallery$LayoutParams;-><init>(II)V

    move-object/from16 v0, v24

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 814
    sget-object v35, Landroid/widget/ImageView$ScaleType;->FIT_XY:Landroid/widget/ImageView$ScaleType;

    move-object/from16 v0, v24

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 815
    move-object/from16 v0, v25

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 816
    sget-object v35, Lcom/miniclip/nativeJNI/cocojava;->sideBar1:Landroid/widget/RelativeLayout;

    move-object/from16 v0, v35

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 819
    new-instance v35, Landroid/widget/RelativeLayout;

    move-object/from16 v0, v35

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    sput-object v35, Lcom/miniclip/nativeJNI/cocojava;->sideBar2:Landroid/widget/RelativeLayout;

    .line 820
    new-instance v34, Landroid/widget/RelativeLayout$LayoutParams;

    const-wide/high16 v35, 0x4049000000000000L    # 50.0

    sget v37, Lcom/miniclip/nativeJNI/cocojava;->mDensity:F

    move/from16 v0, v37

    float-to-double v0, v0

    move-wide/from16 v37, v0

    mul-double v35, v35, v37

    move-wide/from16 v0, v35

    double-to-int v0, v0

    move/from16 v35, v0

    sget v36, Lcom/miniclip/nativeJNI/cocojava;->mHeight:I

    move/from16 v0, v36

    int-to-float v0, v0

    move/from16 v36, v0

    const/high16 v37, 0x43a00000    # 320.0f

    sget v38, Lcom/miniclip/nativeJNI/cocojava;->mDensity:F

    mul-float v37, v37, v38

    sub-float v36, v36, v37

    const/high16 v37, 0x3f000000    # 0.5f

    mul-float v36, v36, v37

    move/from16 v0, v36

    float-to-int v0, v0

    move/from16 v36, v0

    invoke-direct/range {v34 .. v36}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 823
    .local v34, "sideBar2Params":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v35, 0xc

    invoke-virtual/range {v34 .. v35}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 824
    sget-object v35, Lcom/miniclip/nativeJNI/cocojava;->sideBar2:Landroid/widget/RelativeLayout;

    move-object/from16 v0, v35

    move-object/from16 v1, v34

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 825
    new-instance v29, Landroid/widget/ImageView;

    move-object/from16 v0, v29

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 826
    .local v29, "sideBar2Image1":Landroid/widget/ImageView;
    invoke-virtual/range {p0 .. p0}, Lcom/miniclip/nativeJNI/cocojava;->getResources()Landroid/content/res/Resources;

    move-result-object v35

    move-object/from16 v0, v35

    invoke-virtual {v0, v14}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v35

    move-object/from16 v0, v29

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 828
    new-instance v35, Landroid/widget/Gallery$LayoutParams;

    const/16 v36, -0x1

    const/16 v37, -0x1

    invoke-direct/range {v35 .. v37}, Landroid/widget/Gallery$LayoutParams;-><init>(II)V

    move-object/from16 v0, v29

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 830
    sget-object v35, Landroid/widget/ImageView$ScaleType;->FIT_XY:Landroid/widget/ImageView$ScaleType;

    move-object/from16 v0, v29

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 831
    sget-object v35, Lcom/miniclip/nativeJNI/cocojava;->sideBar2:Landroid/widget/RelativeLayout;

    move-object/from16 v0, v35

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 832
    new-instance v32, Landroid/widget/RelativeLayout;

    move-object/from16 v0, v32

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 833
    .local v32, "sideBar2Layout1":Landroid/widget/RelativeLayout;
    new-instance v33, Landroid/widget/RelativeLayout$LayoutParams;

    const/16 v35, -0x1

    const/high16 v36, 0x41a00000    # 20.0f

    sget v37, Lcom/miniclip/nativeJNI/cocojava;->mDensity:F

    mul-float v36, v36, v37

    move/from16 v0, v36

    float-to-int v0, v0

    move/from16 v36, v0

    move-object/from16 v0, v33

    move/from16 v1, v35

    move/from16 v2, v36

    invoke-direct {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 835
    .local v33, "sideBar2Layout1Params":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v35, 0xc

    move-object/from16 v0, v33

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 836
    invoke-virtual/range {v32 .. v33}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 837
    new-instance v31, Landroid/widget/ImageView;

    move-object/from16 v0, v31

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 838
    .local v31, "sideBar2Image3":Landroid/widget/ImageView;
    invoke-virtual/range {p0 .. p0}, Lcom/miniclip/nativeJNI/cocojava;->getResources()Landroid/content/res/Resources;

    move-result-object v35

    move-object/from16 v0, v35

    invoke-virtual {v0, v15}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v35

    move-object/from16 v0, v31

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 840
    new-instance v35, Landroid/widget/Gallery$LayoutParams;

    const/16 v36, -0x1

    const/high16 v37, 0x41a00000    # 20.0f

    sget v38, Lcom/miniclip/nativeJNI/cocojava;->mDensity:F

    mul-float v37, v37, v38

    move/from16 v0, v37

    float-to-int v0, v0

    move/from16 v37, v0

    invoke-direct/range {v35 .. v37}, Landroid/widget/Gallery$LayoutParams;-><init>(II)V

    move-object/from16 v0, v31

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 842
    sget-object v35, Landroid/widget/ImageView$ScaleType;->FIT_XY:Landroid/widget/ImageView$ScaleType;

    move-object/from16 v0, v31

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 843
    move-object/from16 v0, v32

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 844
    sget-object v35, Lcom/miniclip/nativeJNI/cocojava;->sideBar2:Landroid/widget/RelativeLayout;

    move-object/from16 v0, v35

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 845
    new-instance v30, Landroid/widget/ImageView;

    move-object/from16 v0, v30

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 846
    .local v30, "sideBar2Image2":Landroid/widget/ImageView;
    invoke-virtual/range {p0 .. p0}, Lcom/miniclip/nativeJNI/cocojava;->getResources()Landroid/content/res/Resources;

    move-result-object v35

    move-object/from16 v0, v35

    invoke-virtual {v0, v13}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v35

    move-object/from16 v0, v30

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 848
    new-instance v35, Landroid/widget/Gallery$LayoutParams;

    const/16 v36, -0x1

    const/high16 v37, 0x41a00000    # 20.0f

    sget v38, Lcom/miniclip/nativeJNI/cocojava;->mDensity:F

    mul-float v37, v37, v38

    move/from16 v0, v37

    float-to-int v0, v0

    move/from16 v37, v0

    invoke-direct/range {v35 .. v37}, Landroid/widget/Gallery$LayoutParams;-><init>(II)V

    move-object/from16 v0, v30

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 850
    sget-object v35, Landroid/widget/ImageView$ScaleType;->FIT_XY:Landroid/widget/ImageView$ScaleType;

    move-object/from16 v0, v30

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 851
    sget-object v35, Lcom/miniclip/nativeJNI/cocojava;->sideBar2:Landroid/widget/RelativeLayout;

    move-object/from16 v0, v35

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 876
    new-instance v35, Lcom/miniclip/nativeJNI/rotatedBannerImg;

    sget v36, Lcom/miniclip/nativeJNI/cocojava;->ALIGN_LEFT:I

    move-object/from16 v0, v35

    move-object/from16 v1, p0

    move/from16 v2, v36

    invoke-direct {v0, v1, v2}, Lcom/miniclip/nativeJNI/rotatedBannerImg;-><init>(Landroid/content/Context;I)V

    sput-object v35, Lcom/miniclip/nativeJNI/cocojava;->mRotatedBanner:Lcom/miniclip/nativeJNI/rotatedBannerImg;

    .line 879
    sget-object v35, Lcom/miniclip/nativeJNI/cocojava;->layout:Landroid/widget/RelativeLayout;

    sget-object v36, Lcom/miniclip/nativeJNI/cocojava;->mRotatedBanner:Lcom/miniclip/nativeJNI/rotatedBannerImg;

    invoke-virtual/range {v35 .. v36}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 881
    sget-object v35, Lcom/miniclip/nativeJNI/cocojava;->layout:Landroid/widget/RelativeLayout;

    sget-object v36, Lcom/miniclip/nativeJNI/cocojava;->sideBar1:Landroid/widget/RelativeLayout;

    invoke-virtual/range {v35 .. v36}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 882
    sget-object v35, Lcom/miniclip/nativeJNI/cocojava;->layout:Landroid/widget/RelativeLayout;

    sget-object v36, Lcom/miniclip/nativeJNI/cocojava;->sideBar2:Landroid/widget/RelativeLayout;

    invoke-virtual/range {v35 .. v36}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 883
    sget-object v35, Lcom/miniclip/nativeJNI/cocojava;->mRotatedBanner:Lcom/miniclip/nativeJNI/rotatedBannerImg;

    const/16 v36, 0x0

    invoke-virtual/range {v35 .. v36}, Lcom/miniclip/nativeJNI/rotatedBannerImg;->setBlockAutoRefresh(Z)V

    .line 884
    sget-object v35, Lcom/miniclip/nativeJNI/cocojava;->mRotatedBanner:Lcom/miniclip/nativeJNI/rotatedBannerImg;

    const/16 v36, 0x0

    invoke-virtual/range {v35 .. v36}, Lcom/miniclip/nativeJNI/rotatedBannerImg;->setAutorefreshEnabled(Z)V

    .line 885
    sget-object v35, Lcom/miniclip/nativeJNI/cocojava;->mRotatedBanner:Lcom/miniclip/nativeJNI/rotatedBannerImg;

    const/16 v36, 0x1

    invoke-virtual/range {v35 .. v36}, Lcom/miniclip/nativeJNI/rotatedBannerImg;->setBlockAutoRefresh(Z)V

    .line 973
    .end local v13    # "resourceIdSide1":I
    .end local v14    # "resourceIdSide2":I
    .end local v15    # "resourceIdSide3":I
    .end local v16    # "resourceIdSide4":I
    .end local v22    # "sideBar1Image1":Landroid/widget/ImageView;
    .end local v23    # "sideBar1Image2":Landroid/widget/ImageView;
    .end local v24    # "sideBar1Image3":Landroid/widget/ImageView;
    .end local v25    # "sideBar1Layout1":Landroid/widget/RelativeLayout;
    .end local v26    # "sideBar1Layout1Params":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v27    # "sideBar1Params":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v29    # "sideBar2Image1":Landroid/widget/ImageView;
    .end local v30    # "sideBar2Image2":Landroid/widget/ImageView;
    .end local v31    # "sideBar2Image3":Landroid/widget/ImageView;
    .end local v32    # "sideBar2Layout1":Landroid/widget/RelativeLayout;
    .end local v33    # "sideBar2Layout1Params":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v34    # "sideBar2Params":Landroid/widget/RelativeLayout$LayoutParams;
    :cond_6
    :goto_2
    sget-object v35, Lcom/miniclip/nativeJNI/cocojava;->layout:Landroid/widget/RelativeLayout;

    sget-object v36, Lcom/miniclip/nativeJNI/cocojava;->mGLView:Lcom/miniclip/nativeJNI/ClearGLSurfaceView;

    invoke-virtual/range {v35 .. v36}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 974
    sget-object v35, Lcom/miniclip/nativeJNI/cocojava;->layout:Landroid/widget/RelativeLayout;

    sget-object v36, Lcom/miniclip/nativeJNI/cocojava;->adLayoutH:Landroid/widget/RelativeLayout;

    invoke-virtual/range {v35 .. v36}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 975
    sget-object v35, Lcom/miniclip/nativeJNI/cocojava;->layout:Landroid/widget/RelativeLayout;

    sget-object v36, Lcom/miniclip/nativeJNI/cocojava;->mInitView:Landroid/widget/RelativeLayout;

    invoke-virtual/range {v35 .. v36}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 976
    sget-object v35, Lcom/miniclip/nativeJNI/cocojava;->layout:Landroid/widget/RelativeLayout;

    move-object/from16 v0, p0

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Lcom/miniclip/nativeJNI/cocojava;->setContentView(Landroid/view/View;)V

    .line 978
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->showTapFeatureAd()V

    .line 980
    sget-boolean v35, Lcom/miniclip/nativeJNI/cocojava;->mUSE_ADS_BIG:Z

    if-eqz v35, :cond_7

    .line 987
    :cond_7
    sget-boolean v35, Lcom/miniclip/nativeJNI/cocojava;->mUSE_ADS:Z

    if-eqz v35, :cond_8

    .line 992
    :cond_8
    sget-boolean v35, Lcom/miniclip/nativeJNI/cocojava;->mUSE_ADS_INTERSTITIAL_FULLSCREEN:Z

    if-eqz v35, :cond_9

    .line 993
    new-instance v35, Lcom/miniclip/nativeJNI/interstitialMopubView;

    sget-object v36, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    invoke-direct/range {v35 .. v36}, Lcom/miniclip/nativeJNI/interstitialMopubView;-><init>(Landroid/content/Context;)V

    sput-object v35, Lcom/miniclip/nativeJNI/cocojava;->mFullscreenInterstitial:Lcom/miniclip/nativeJNI/interstitialMopubView;

    .line 994
    sget-object v35, Lcom/miniclip/nativeJNI/cocojava;->mFullscreenInterstitial:Lcom/miniclip/nativeJNI/interstitialMopubView;

    invoke-virtual/range {v35 .. v35}, Lcom/miniclip/nativeJNI/interstitialMopubView;->loadAd()V

    .line 995
    sget-object v35, Lcom/miniclip/nativeJNI/cocojava;->layout:Landroid/widget/RelativeLayout;

    sget-object v36, Lcom/miniclip/nativeJNI/cocojava;->mFullscreenInterstitial:Lcom/miniclip/nativeJNI/interstitialMopubView;

    invoke-virtual/range {v35 .. v36}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 997
    :cond_9
    sget-boolean v35, Lcom/miniclip/nativeJNI/cocojava;->mUSE_ADS_INTERSTITIAL_BANNER:Z

    if-eqz v35, :cond_a

    .line 998
    new-instance v35, Lcom/miniclip/nativeJNI/interstitialBanner;

    move-object/from16 v0, v35

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/miniclip/nativeJNI/interstitialBanner;-><init>(Landroid/content/Context;)V

    sput-object v35, Lcom/miniclip/nativeJNI/cocojava;->mInterstitialBanner:Lcom/miniclip/nativeJNI/interstitialBanner;

    .line 999
    sget-object v35, Lcom/miniclip/nativeJNI/cocojava;->mInterstitialBanner:Lcom/miniclip/nativeJNI/interstitialBanner;

    invoke-virtual/range {v35 .. v35}, Lcom/miniclip/nativeJNI/interstitialBanner;->loadAd()V

    .line 1000
    sget-object v35, Lcom/miniclip/nativeJNI/cocojava;->layout:Landroid/widget/RelativeLayout;

    sget-object v36, Lcom/miniclip/nativeJNI/cocojava;->mInterstitialBanner:Lcom/miniclip/nativeJNI/interstitialBanner;

    invoke-virtual/range {v35 .. v36}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 1003
    :cond_a
    new-instance v35, Lcom/miniclip/nativeJNI/cocojava$4;

    move-object/from16 v0, v35

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/miniclip/nativeJNI/cocojava$4;-><init>(Lcom/miniclip/nativeJNI/cocojava;)V

    sput-object v35, Lcom/miniclip/nativeJNI/cocojava;->mHandler:Landroid/os/Handler;

    .line 1037
    sget-object v35, Lcom/miniclip/nativeJNI/cocojava;->mEditText:Landroid/widget/EditText;

    if-nez v35, :cond_e

    .line 1039
    new-instance v35, Lcom/miniclip/nativeJNI/cocojava$5;

    sget-object v36, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    move-object/from16 v0, v35

    move-object/from16 v1, p0

    move-object/from16 v2, v36

    invoke-direct {v0, v1, v2}, Lcom/miniclip/nativeJNI/cocojava$5;-><init>(Lcom/miniclip/nativeJNI/cocojava;Landroid/content/Context;)V

    sput-object v35, Lcom/miniclip/nativeJNI/cocojava;->mEditText:Landroid/widget/EditText;

    .line 1058
    sget-boolean v35, Lcom/miniclip/nativeJNI/cocojava;->mKEYBOARD_INPUT_HIDE:Z

    if-eqz v35, :cond_b

    .line 1060
    new-instance v9, Landroid/widget/RelativeLayout$LayoutParams;

    const/16 v35, 0x1

    const/16 v36, 0x1

    move/from16 v0, v35

    move/from16 v1, v36

    invoke-direct {v9, v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 1061
    .local v9, "params":Landroid/widget/RelativeLayout$LayoutParams;
    sget-object v35, Lcom/miniclip/nativeJNI/cocojava;->mEditText:Landroid/widget/EditText;

    move-object/from16 v0, v35

    invoke-virtual {v0, v9}, Landroid/widget/EditText;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1065
    .end local v9    # "params":Landroid/widget/RelativeLayout$LayoutParams;
    :cond_b
    sget-object v35, Lcom/miniclip/nativeJNI/cocojava;->mEditText:Landroid/widget/EditText;

    const/16 v36, 0x6

    invoke-virtual/range {v35 .. v36}, Landroid/widget/EditText;->setImeOptions(I)V

    .line 1067
    sget-object v35, Lcom/miniclip/nativeJNI/cocojava;->mEditText:Landroid/widget/EditText;

    new-instance v36, Lcom/miniclip/nativeJNI/cocojava$6;

    move-object/from16 v0, v36

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/miniclip/nativeJNI/cocojava$6;-><init>(Lcom/miniclip/nativeJNI/cocojava;)V

    invoke-virtual/range {v35 .. v36}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 1091
    sget-object v35, Lcom/miniclip/nativeJNI/cocojava;->mEditText:Landroid/widget/EditText;

    new-instance v36, Lcom/miniclip/nativeJNI/cocojava$7;

    move-object/from16 v0, v36

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/miniclip/nativeJNI/cocojava$7;-><init>(Lcom/miniclip/nativeJNI/cocojava;)V

    invoke-virtual/range {v35 .. v36}, Landroid/widget/EditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 1134
    sget-object v35, Lcom/miniclip/nativeJNI/cocojava;->mEditText:Landroid/widget/EditText;

    const/16 v36, 0x7d0

    invoke-virtual/range {v35 .. v36}, Landroid/widget/EditText;->setWidth(I)V

    .line 1135
    sget-boolean v35, Lcom/miniclip/nativeJNI/cocojava;->mKEYBOARD_OVERRIDE_VISIBILITY:Z

    if-nez v35, :cond_c

    .line 1136
    sget-object v35, Lcom/miniclip/nativeJNI/cocojava;->mEditText:Landroid/widget/EditText;

    const/16 v36, 0x4

    invoke-virtual/range {v35 .. v36}, Landroid/widget/EditText;->setVisibility(I)V

    .line 1137
    :cond_c
    sget-boolean v35, Lcom/miniclip/nativeJNI/cocojava;->mSHOW_KEYBOARD_INPUT:Z

    if-eqz v35, :cond_12

    .line 1138
    sget-object v35, Lcom/miniclip/nativeJNI/cocojava;->layout:Landroid/widget/RelativeLayout;

    sget-object v36, Lcom/miniclip/nativeJNI/cocojava;->mEditText:Landroid/widget/EditText;

    invoke-virtual/range {v35 .. v36}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 1160
    :goto_3
    sget-boolean v35, Lcom/miniclip/nativeJNI/cocojava;->mKEYBOARD_FULLSCREEN:Z

    if-nez v35, :cond_d

    .line 1161
    sget-object v35, Lcom/miniclip/nativeJNI/cocojava;->mEditText:Landroid/widget/EditText;

    const v36, 0x10000006

    invoke-virtual/range {v35 .. v36}, Landroid/widget/EditText;->setImeOptions(I)V

    .line 1162
    :cond_d
    sget-object v35, Lcom/miniclip/nativeJNI/cocojava;->mEditText:Landroid/widget/EditText;

    new-instance v36, Lcom/miniclip/nativeJNI/cocojava$8;

    move-object/from16 v0, v36

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/miniclip/nativeJNI/cocojava$8;-><init>(Lcom/miniclip/nativeJNI/cocojava;)V

    invoke-virtual/range {v35 .. v36}, Landroid/widget/EditText;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1170
    sget-boolean v35, Lcom/miniclip/nativeJNI/cocojava;->mKEYBOARD_CUSTOM_BACKGROUND:Z

    if-eqz v35, :cond_e

    .line 1172
    sget-object v35, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    invoke-virtual/range {v35 .. v35}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v35

    const-string v36, "roundsquare"

    const-string v37, "drawable"

    sget-object v38, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    invoke-virtual/range {v38 .. v38}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v38

    invoke-virtual/range {v35 .. v38}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v12

    .line 1173
    .local v12, "resourceIdInputBackground":I
    sget-object v35, Lcom/miniclip/nativeJNI/cocojava;->mEditText:Landroid/widget/EditText;

    invoke-virtual/range {p0 .. p0}, Lcom/miniclip/nativeJNI/cocojava;->getResources()Landroid/content/res/Resources;

    move-result-object v36

    move-object/from16 v0, v36

    invoke-virtual {v0, v12}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v36

    invoke-virtual/range {v35 .. v36}, Landroid/widget/EditText;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 1181
    .end local v12    # "resourceIdInputBackground":I
    :cond_e
    new-instance v35, Ljava/util/HashMap;

    invoke-direct/range {v35 .. v35}, Ljava/util/HashMap;-><init>()V

    move-object/from16 v0, v35

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/miniclip/nativeJNI/cocojava;->mDialogs:Ljava/util/HashMap;

    .line 1183
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->isSDcardPresent()Z

    move-result v20

    .line 1184
    .local v20, "sdPresent":Z
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->availableMemoryOnDevice()F

    move-result v8

    .line 1185
    .local v8, "mainMemory":F
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->availableMemoryOnSDcard()F

    move-result v19

    .line 1207
    .local v19, "sd":F
    sget-boolean v35, Lcom/miniclip/nativeJNI/cocojava;->mUSE_REMOVE_ADS:Z

    if-eqz v35, :cond_f

    .line 1208
    invoke-virtual/range {p0 .. p0}, Lcom/miniclip/nativeJNI/cocojava;->getResources()Landroid/content/res/Resources;

    move-result-object v35

    invoke-virtual/range {v35 .. v35}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v35

    move-object/from16 v0, v35

    iget v5, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 1209
    .local v5, "height":I
    int-to-float v0, v5

    move/from16 v35, v0

    const/high16 v36, 0x43f00000    # 480.0f

    div-float v18, v35, v36

    .line 1211
    .local v18, "scaleF":F
    new-instance v11, Landroid/widget/RelativeLayout$LayoutParams;

    const/high16 v35, 0x42c80000    # 100.0f

    mul-float v35, v35, v18

    move/from16 v0, v35

    float-to-int v0, v0

    move/from16 v35, v0

    const/high16 v36, 0x426c0000    # 59.0f

    mul-float v36, v36, v18

    move/from16 v0, v36

    float-to-int v0, v0

    move/from16 v36, v0

    move/from16 v0, v35

    move/from16 v1, v36

    invoke-direct {v11, v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 1213
    .local v11, "paramsnb":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v35, 0xc

    move/from16 v0, v35

    invoke-virtual {v11, v0}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 1214
    const/high16 v35, 0x40a00000    # 5.0f

    mul-float v35, v35, v18

    move/from16 v0, v35

    float-to-int v0, v0

    move/from16 v35, v0

    move/from16 v0, v35

    iput v0, v11, Landroid/widget/RelativeLayout$LayoutParams;->leftMargin:I

    .line 1215
    const/high16 v35, 0x43480000    # 200.0f

    mul-float v35, v35, v18

    move/from16 v0, v35

    float-to-int v0, v0

    move/from16 v35, v0

    move/from16 v0, v35

    iput v0, v11, Landroid/widget/RelativeLayout$LayoutParams;->bottomMargin:I

    .line 1216
    new-instance v35, Landroid/widget/ImageView;

    move-object/from16 v0, v35

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    sput-object v35, Lcom/miniclip/nativeJNI/cocojava;->mRemoveAdsButton:Landroid/widget/ImageView;

    .line 1218
    invoke-virtual/range {p0 .. p0}, Lcom/miniclip/nativeJNI/cocojava;->getResources()Landroid/content/res/Resources;

    move-result-object v35

    const-string v36, "remove_ads"

    const-string v37, "drawable"

    invoke-virtual/range {p0 .. p0}, Lcom/miniclip/nativeJNI/cocojava;->getPackageName()Ljava/lang/String;

    move-result-object v38

    invoke-virtual/range {v35 .. v38}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v17

    .line 1220
    .local v17, "resourceIda":I
    sget-object v35, Lcom/miniclip/nativeJNI/cocojava;->mRemoveAdsButton:Landroid/widget/ImageView;

    invoke-virtual/range {p0 .. p0}, Lcom/miniclip/nativeJNI/cocojava;->getResources()Landroid/content/res/Resources;

    move-result-object v36

    move-object/from16 v0, v36

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v36

    invoke-virtual/range {v35 .. v36}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 1224
    sget-object v35, Lcom/miniclip/nativeJNI/cocojava;->mRemoveAdsButton:Landroid/widget/ImageView;

    move-object/from16 v0, v35

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1225
    sget-object v35, Lcom/miniclip/nativeJNI/cocojava;->mRemoveAdsButton:Landroid/widget/ImageView;

    move-object/from16 v0, v35

    invoke-virtual {v0, v11}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1226
    new-instance v35, Landroid/widget/RelativeLayout;

    move-object/from16 v0, v35

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    sput-object v35, Lcom/miniclip/nativeJNI/cocojava;->mRemoveAdsButtonLayout:Landroid/widget/RelativeLayout;

    .line 1227
    sget-object v35, Lcom/miniclip/nativeJNI/cocojava;->layout:Landroid/widget/RelativeLayout;

    sget-object v36, Lcom/miniclip/nativeJNI/cocojava;->mRemoveAdsButtonLayout:Landroid/widget/RelativeLayout;

    invoke-virtual/range {v35 .. v36}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 1233
    .end local v5    # "height":I
    .end local v11    # "paramsnb":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v17    # "resourceIda":I
    .end local v18    # "scaleF":F
    :cond_f
    sget-boolean v35, Lcom/miniclip/nativeJNI/cocojava;->mUSE_NEWSFEED:Z

    if-eqz v35, :cond_0

    .line 1234
    new-instance v35, Lcom/miniclip/newsfeed/Newsfeed;

    sget-object v36, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    sget-object v37, Lcom/miniclip/nativeJNI/cocojava;->mDeviceID:Ljava/lang/String;

    invoke-direct/range {v35 .. v37}, Lcom/miniclip/newsfeed/Newsfeed;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    sput-object v35, Lcom/miniclip/nativeJNI/cocojava;->mCurrentNewsfeed:Lcom/miniclip/newsfeed/Newsfeed;

    .line 1236
    new-instance v4, Landroid/os/Handler;

    invoke-direct {v4}, Landroid/os/Handler;-><init>()V

    .line 1237
    .local v4, "handler":Landroid/os/Handler;
    new-instance v35, Lcom/miniclip/nativeJNI/cocojava$9;

    move-object/from16 v0, v35

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/miniclip/nativeJNI/cocojava$9;-><init>(Lcom/miniclip/nativeJNI/cocojava;)V

    const-wide/16 v36, 0x7d0

    move-object/from16 v0, v35

    move-wide/from16 v1, v36

    invoke-virtual {v4, v0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto/16 :goto_0

    .line 698
    .end local v4    # "handler":Landroid/os/Handler;
    .end local v8    # "mainMemory":F
    .end local v10    # "paramsH":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v19    # "sd":F
    .end local v20    # "sdPresent":Z
    :cond_10
    const/16 v35, 0x1e0

    sput v35, Lcom/miniclip/nativeJNI/cocojava;->mWidth:I

    .line 699
    const/16 v35, 0x140

    sput v35, Lcom/miniclip/nativeJNI/cocojava;->mHeight:I

    goto/16 :goto_1

    .line 888
    .restart local v10    # "paramsH":Landroid/widget/RelativeLayout$LayoutParams;
    :cond_11
    sget-boolean v35, Lcom/miniclip/nativeJNI/cocojava;->mUSE_ADS_HORIZONTAL:Z

    if-eqz v35, :cond_6

    .line 889
    sget-object v35, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    invoke-virtual/range {v35 .. v35}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v35

    const-string v36, "side1"

    const-string v37, "drawable"

    sget-object v38, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    invoke-virtual/range {v38 .. v38}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v38

    invoke-virtual/range {v35 .. v38}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v13

    .line 891
    .restart local v13    # "resourceIdSide1":I
    sget-object v35, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    invoke-virtual/range {v35 .. v35}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v35

    const-string v36, "side2"

    const-string v37, "drawable"

    sget-object v38, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    invoke-virtual/range {v38 .. v38}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v38

    invoke-virtual/range {v35 .. v38}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v14

    .line 893
    .restart local v14    # "resourceIdSide2":I
    sget-object v35, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    invoke-virtual/range {v35 .. v35}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v35

    const-string v36, "side3"

    const-string v37, "drawable"

    sget-object v38, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    invoke-virtual/range {v38 .. v38}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v38

    invoke-virtual/range {v35 .. v38}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v15

    .line 896
    .restart local v15    # "resourceIdSide3":I
    new-instance v21, Landroid/widget/RelativeLayout;

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 897
    .local v21, "sideBar1":Landroid/widget/RelativeLayout;
    new-instance v27, Landroid/widget/RelativeLayout$LayoutParams;

    sget v35, Lcom/miniclip/nativeJNI/cocojava;->mWidth:I

    move/from16 v0, v35

    int-to-float v0, v0

    move/from16 v35, v0

    const/high16 v36, 0x43a00000    # 320.0f

    sget v37, Lcom/miniclip/nativeJNI/cocojava;->mDensity:F

    mul-float v36, v36, v37

    sub-float v35, v35, v36

    const/high16 v36, 0x3f000000    # 0.5f

    mul-float v35, v35, v36

    move/from16 v0, v35

    float-to-int v0, v0

    move/from16 v35, v0

    const-wide/high16 v36, 0x4049000000000000L    # 50.0

    sget v38, Lcom/miniclip/nativeJNI/cocojava;->mDensity:F

    move/from16 v0, v38

    float-to-double v0, v0

    move-wide/from16 v38, v0

    mul-double v36, v36, v38

    move-wide/from16 v0, v36

    double-to-int v0, v0

    move/from16 v36, v0

    move-object/from16 v0, v27

    move/from16 v1, v35

    move/from16 v2, v36

    invoke-direct {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 900
    .restart local v27    # "sideBar1Params":Landroid/widget/RelativeLayout$LayoutParams;
    move-object/from16 v0, v21

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 901
    new-instance v22, Landroid/widget/ImageView;

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 902
    .restart local v22    # "sideBar1Image1":Landroid/widget/ImageView;
    invoke-virtual/range {p0 .. p0}, Lcom/miniclip/nativeJNI/cocojava;->getResources()Landroid/content/res/Resources;

    move-result-object v35

    move-object/from16 v0, v35

    invoke-virtual {v0, v14}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v35

    move-object/from16 v0, v22

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 904
    new-instance v35, Landroid/widget/Gallery$LayoutParams;

    const/16 v36, -0x1

    const/16 v37, -0x1

    invoke-direct/range {v35 .. v37}, Landroid/widget/Gallery$LayoutParams;-><init>(II)V

    move-object/from16 v0, v22

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 906
    sget-object v35, Landroid/widget/ImageView$ScaleType;->FIT_XY:Landroid/widget/ImageView$ScaleType;

    move-object/from16 v0, v22

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 907
    invoke-virtual/range {v21 .. v22}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 908
    new-instance v23, Landroid/widget/ImageView;

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 909
    .restart local v23    # "sideBar1Image2":Landroid/widget/ImageView;
    invoke-virtual/range {p0 .. p0}, Lcom/miniclip/nativeJNI/cocojava;->getResources()Landroid/content/res/Resources;

    move-result-object v35

    move-object/from16 v0, v35

    invoke-virtual {v0, v13}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v35

    move-object/from16 v0, v23

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 911
    new-instance v35, Landroid/widget/Gallery$LayoutParams;

    const/high16 v36, 0x41a00000    # 20.0f

    sget v37, Lcom/miniclip/nativeJNI/cocojava;->mDensity:F

    mul-float v36, v36, v37

    move/from16 v0, v36

    float-to-int v0, v0

    move/from16 v36, v0

    const/16 v37, -0x1

    invoke-direct/range {v35 .. v37}, Landroid/widget/Gallery$LayoutParams;-><init>(II)V

    move-object/from16 v0, v23

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 913
    sget-object v35, Landroid/widget/ImageView$ScaleType;->FIT_XY:Landroid/widget/ImageView$ScaleType;

    move-object/from16 v0, v23

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 914
    move-object/from16 v0, v21

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 915
    new-instance v25, Landroid/widget/RelativeLayout;

    move-object/from16 v0, v25

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 916
    .restart local v25    # "sideBar1Layout1":Landroid/widget/RelativeLayout;
    new-instance v26, Landroid/widget/RelativeLayout$LayoutParams;

    const/high16 v35, 0x41a00000    # 20.0f

    sget v36, Lcom/miniclip/nativeJNI/cocojava;->mDensity:F

    mul-float v35, v35, v36

    move/from16 v0, v35

    float-to-int v0, v0

    move/from16 v35, v0

    const/16 v36, -0x1

    move-object/from16 v0, v26

    move/from16 v1, v35

    move/from16 v2, v36

    invoke-direct {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 918
    .restart local v26    # "sideBar1Layout1Params":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v35, 0xb

    move-object/from16 v0, v26

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 919
    invoke-virtual/range {v25 .. v26}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 920
    new-instance v24, Landroid/widget/ImageView;

    move-object/from16 v0, v24

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 921
    .restart local v24    # "sideBar1Image3":Landroid/widget/ImageView;
    invoke-virtual/range {p0 .. p0}, Lcom/miniclip/nativeJNI/cocojava;->getResources()Landroid/content/res/Resources;

    move-result-object v35

    move-object/from16 v0, v35

    invoke-virtual {v0, v15}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v35

    move-object/from16 v0, v24

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 923
    new-instance v35, Landroid/widget/Gallery$LayoutParams;

    const/high16 v36, 0x41a00000    # 20.0f

    sget v37, Lcom/miniclip/nativeJNI/cocojava;->mDensity:F

    mul-float v36, v36, v37

    move/from16 v0, v36

    float-to-int v0, v0

    move/from16 v36, v0

    const/16 v37, -0x1

    invoke-direct/range {v35 .. v37}, Landroid/widget/Gallery$LayoutParams;-><init>(II)V

    move-object/from16 v0, v24

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 925
    sget-object v35, Landroid/widget/ImageView$ScaleType;->FIT_XY:Landroid/widget/ImageView$ScaleType;

    move-object/from16 v0, v24

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 926
    move-object/from16 v0, v25

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 927
    move-object/from16 v0, v21

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 929
    new-instance v28, Landroid/widget/RelativeLayout;

    move-object/from16 v0, v28

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 930
    .local v28, "sideBar2":Landroid/widget/RelativeLayout;
    new-instance v34, Landroid/widget/RelativeLayout$LayoutParams;

    sget v35, Lcom/miniclip/nativeJNI/cocojava;->mWidth:I

    move/from16 v0, v35

    int-to-float v0, v0

    move/from16 v35, v0

    const/high16 v36, 0x43a00000    # 320.0f

    sget v37, Lcom/miniclip/nativeJNI/cocojava;->mDensity:F

    mul-float v36, v36, v37

    sub-float v35, v35, v36

    const/high16 v36, 0x3f000000    # 0.5f

    mul-float v35, v35, v36

    move/from16 v0, v35

    float-to-int v0, v0

    move/from16 v35, v0

    const-wide/high16 v36, 0x4049000000000000L    # 50.0

    sget v38, Lcom/miniclip/nativeJNI/cocojava;->mDensity:F

    move/from16 v0, v38

    float-to-double v0, v0

    move-wide/from16 v38, v0

    mul-double v36, v36, v38

    move-wide/from16 v0, v36

    double-to-int v0, v0

    move/from16 v36, v0

    invoke-direct/range {v34 .. v36}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 933
    .restart local v34    # "sideBar2Params":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v35, 0xb

    invoke-virtual/range {v34 .. v35}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 934
    move-object/from16 v0, v28

    move-object/from16 v1, v34

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 935
    new-instance v29, Landroid/widget/ImageView;

    move-object/from16 v0, v29

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 936
    .restart local v29    # "sideBar2Image1":Landroid/widget/ImageView;
    invoke-virtual/range {p0 .. p0}, Lcom/miniclip/nativeJNI/cocojava;->getResources()Landroid/content/res/Resources;

    move-result-object v35

    move-object/from16 v0, v35

    invoke-virtual {v0, v14}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v35

    move-object/from16 v0, v29

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 938
    new-instance v35, Landroid/widget/Gallery$LayoutParams;

    const/16 v36, -0x1

    const/16 v37, -0x1

    invoke-direct/range {v35 .. v37}, Landroid/widget/Gallery$LayoutParams;-><init>(II)V

    move-object/from16 v0, v29

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 940
    sget-object v35, Landroid/widget/ImageView$ScaleType;->FIT_XY:Landroid/widget/ImageView$ScaleType;

    move-object/from16 v0, v29

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 941
    invoke-virtual/range {v28 .. v29}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 942
    new-instance v32, Landroid/widget/RelativeLayout;

    move-object/from16 v0, v32

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 943
    .restart local v32    # "sideBar2Layout1":Landroid/widget/RelativeLayout;
    new-instance v33, Landroid/widget/RelativeLayout$LayoutParams;

    const/high16 v35, 0x41a00000    # 20.0f

    sget v36, Lcom/miniclip/nativeJNI/cocojava;->mDensity:F

    mul-float v35, v35, v36

    move/from16 v0, v35

    float-to-int v0, v0

    move/from16 v35, v0

    const/16 v36, -0x1

    move-object/from16 v0, v33

    move/from16 v1, v35

    move/from16 v2, v36

    invoke-direct {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 945
    .restart local v33    # "sideBar2Layout1Params":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v35, 0xb

    move-object/from16 v0, v33

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 946
    invoke-virtual/range {v32 .. v33}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 947
    new-instance v31, Landroid/widget/ImageView;

    move-object/from16 v0, v31

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 948
    .restart local v31    # "sideBar2Image3":Landroid/widget/ImageView;
    invoke-virtual/range {p0 .. p0}, Lcom/miniclip/nativeJNI/cocojava;->getResources()Landroid/content/res/Resources;

    move-result-object v35

    move-object/from16 v0, v35

    invoke-virtual {v0, v15}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v35

    move-object/from16 v0, v31

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 950
    new-instance v35, Landroid/widget/Gallery$LayoutParams;

    const/high16 v36, 0x41a00000    # 20.0f

    sget v37, Lcom/miniclip/nativeJNI/cocojava;->mDensity:F

    mul-float v36, v36, v37

    move/from16 v0, v36

    float-to-int v0, v0

    move/from16 v36, v0

    const/16 v37, -0x1

    invoke-direct/range {v35 .. v37}, Landroid/widget/Gallery$LayoutParams;-><init>(II)V

    move-object/from16 v0, v31

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 952
    sget-object v35, Landroid/widget/ImageView$ScaleType;->FIT_XY:Landroid/widget/ImageView$ScaleType;

    move-object/from16 v0, v31

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 953
    move-object/from16 v0, v32

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 954
    move-object/from16 v0, v28

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 955
    new-instance v30, Landroid/widget/ImageView;

    move-object/from16 v0, v30

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 956
    .restart local v30    # "sideBar2Image2":Landroid/widget/ImageView;
    invoke-virtual/range {p0 .. p0}, Lcom/miniclip/nativeJNI/cocojava;->getResources()Landroid/content/res/Resources;

    move-result-object v35

    move-object/from16 v0, v35

    invoke-virtual {v0, v13}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v35

    move-object/from16 v0, v30

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 958
    new-instance v35, Landroid/widget/Gallery$LayoutParams;

    const/high16 v36, 0x41a00000    # 20.0f

    sget v37, Lcom/miniclip/nativeJNI/cocojava;->mDensity:F

    mul-float v36, v36, v37

    move/from16 v0, v36

    float-to-int v0, v0

    move/from16 v36, v0

    const/16 v37, -0x1

    invoke-direct/range {v35 .. v37}, Landroid/widget/Gallery$LayoutParams;-><init>(II)V

    move-object/from16 v0, v30

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 960
    sget-object v35, Landroid/widget/ImageView$ScaleType;->FIT_XY:Landroid/widget/ImageView$ScaleType;

    move-object/from16 v0, v30

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 961
    move-object/from16 v0, v28

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 963
    new-instance v35, Lcom/miniclip/nativeJNI/horizontalBanner;

    move-object/from16 v0, v35

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/miniclip/nativeJNI/horizontalBanner;-><init>(Landroid/content/Context;)V

    sput-object v35, Lcom/miniclip/nativeJNI/cocojava;->mHorizontalBanner:Lcom/miniclip/nativeJNI/horizontalBanner;

    .line 965
    sget-object v35, Lcom/miniclip/nativeJNI/cocojava;->layout:Landroid/widget/RelativeLayout;

    move-object/from16 v0, v35

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 966
    sget-object v35, Lcom/miniclip/nativeJNI/cocojava;->layout:Landroid/widget/RelativeLayout;

    move-object/from16 v0, v35

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 967
    sget-object v35, Lcom/miniclip/nativeJNI/cocojava;->layout:Landroid/widget/RelativeLayout;

    sget-object v36, Lcom/miniclip/nativeJNI/cocojava;->mHorizontalBanner:Lcom/miniclip/nativeJNI/horizontalBanner;

    invoke-virtual/range {v35 .. v36}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 968
    sget-object v35, Lcom/miniclip/nativeJNI/cocojava;->mHorizontalBanner:Lcom/miniclip/nativeJNI/horizontalBanner;

    const/16 v36, 0x0

    invoke-virtual/range {v35 .. v36}, Lcom/miniclip/nativeJNI/horizontalBanner;->setBlockAutoRefresh(Z)V

    .line 969
    sget-object v35, Lcom/miniclip/nativeJNI/cocojava;->mHorizontalBanner:Lcom/miniclip/nativeJNI/horizontalBanner;

    const/16 v36, 0x0

    invoke-virtual/range {v35 .. v36}, Lcom/miniclip/nativeJNI/horizontalBanner;->setAutorefreshEnabled(Z)V

    .line 970
    sget-object v35, Lcom/miniclip/nativeJNI/cocojava;->mHorizontalBanner:Lcom/miniclip/nativeJNI/horizontalBanner;

    const/16 v36, 0x1

    invoke-virtual/range {v35 .. v36}, Lcom/miniclip/nativeJNI/horizontalBanner;->setBlockAutoRefresh(Z)V

    goto/16 :goto_2

    .line 1142
    .end local v13    # "resourceIdSide1":I
    .end local v14    # "resourceIdSide2":I
    .end local v15    # "resourceIdSide3":I
    .end local v21    # "sideBar1":Landroid/widget/RelativeLayout;
    .end local v22    # "sideBar1Image1":Landroid/widget/ImageView;
    .end local v23    # "sideBar1Image2":Landroid/widget/ImageView;
    .end local v24    # "sideBar1Image3":Landroid/widget/ImageView;
    .end local v25    # "sideBar1Layout1":Landroid/widget/RelativeLayout;
    .end local v26    # "sideBar1Layout1Params":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v27    # "sideBar1Params":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v28    # "sideBar2":Landroid/widget/RelativeLayout;
    .end local v29    # "sideBar2Image1":Landroid/widget/ImageView;
    .end local v30    # "sideBar2Image2":Landroid/widget/ImageView;
    .end local v31    # "sideBar2Image3":Landroid/widget/ImageView;
    .end local v32    # "sideBar2Layout1":Landroid/widget/RelativeLayout;
    .end local v33    # "sideBar2Layout1Params":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v34    # "sideBar2Params":Landroid/widget/RelativeLayout$LayoutParams;
    :cond_12
    sget-boolean v35, Lcom/miniclip/nativeJNI/cocojava;->mKEYBOARD_INPUT_SINGLE_LINE:Z

    if-eqz v35, :cond_13

    .line 1145
    sget-object v35, Lcom/miniclip/nativeJNI/cocojava;->mEditText:Landroid/widget/EditText;

    const/16 v36, 0x1

    invoke-virtual/range {v35 .. v36}, Landroid/widget/EditText;->setMaxLines(I)V

    .line 1148
    :cond_13
    new-instance v7, Landroid/widget/RelativeLayout;

    sget-object v35, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    move-object/from16 v0, v35

    invoke-direct {v7, v0}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 1149
    .local v7, "hideEditText":Landroid/widget/RelativeLayout;
    new-instance v6, Landroid/widget/RelativeLayout$LayoutParams;

    const/16 v35, -0x2

    const/16 v36, -0x2

    move/from16 v0, v35

    move/from16 v1, v36

    invoke-direct {v6, v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 1153
    .local v6, "hideEditTestParams":Landroid/widget/RelativeLayout$LayoutParams;
    invoke-virtual {v7, v6}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1154
    sget-object v35, Lcom/miniclip/nativeJNI/cocojava;->mEditText:Landroid/widget/EditText;

    move-object/from16 v0, v35

    invoke-virtual {v7, v0}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 1155
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 1157
    .local v3, "SDK_INT":I
    sget-object v35, Lcom/miniclip/nativeJNI/cocojava;->layout:Landroid/widget/RelativeLayout;

    move-object/from16 v0, v35

    invoke-virtual {v0, v7}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    goto/16 :goto_3
.end method

.method public fixScreen()V
    .locals 4

    .prologue
    .line 3490
    new-instance v0, Lcom/miniclip/nativeJNI/cocojava$59;

    invoke-direct {v0, p0}, Lcom/miniclip/nativeJNI/cocojava$59;-><init>(Lcom/miniclip/nativeJNI/cocojava;)V

    .line 3497
    .local v0, "fixScreenRunnable":Ljava/lang/Runnable;
    iget-object v1, p0, Lcom/miniclip/nativeJNI/cocojava;->mScreenFixHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 3498
    iget-object v1, p0, Lcom/miniclip/nativeJNI/cocojava;->mScreenFixHandler:Landroid/os/Handler;

    const-wide/16 v2, 0x3e8

    invoke-virtual {v1, v0, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 3499
    return-void
.end method

.method protected getFullAppURI()Ljava/lang/String;
    .locals 1

    .prologue
    .line 347
    const-string v0, "ERROR! OVERRIDE ME!"

    return-object v0
.end method

.method protected getFullVersionGameImageId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 351
    const-string v0, "ERROR! OVERRIDE ME!"

    return-object v0
.end method

.method protected getInAppSkus()[Ljava/lang/String;
    .locals 2

    .prologue
    .line 4845
    const-string v0, "cocojava"

    const-string v1, "getInAppSkus: Override to get price info."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 4846
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/String;

    return-object v0
.end method

.method protected getJarRecommendedPrice(I)I
    .locals 2
    .param p1, "price"    # I

    .prologue
    .line 367
    const-string v0, "cocojava"

    const-string v1, "ERROR! OVERRIDE ME!"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 368
    const/4 v0, 0x0

    return v0
.end method

.method protected getMoPubBannerId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 323
    const-string v0, "ERROR! OVERRIDE ME!"

    return-object v0
.end method

.method protected getMoPubFullScreenInterstitialId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 339
    const-string v0, "ERROR! OVERRIDE ME!"

    return-object v0
.end method

.method protected getMoPubGameplayBannerId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 327
    const-string v0, "ERROR! OVERRIDE ME!"

    return-object v0
.end method

.method protected getMoPubInterstitialBannerId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 343
    const-string v0, "ERROR! OVERRIDE ME!"

    return-object v0
.end method

.method protected getMoPubInterstitialId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 335
    const-string v0, "ERROR! OVERRIDE ME!"

    return-object v0
.end method

.method protected getMoPubMenuBannerId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 331
    const-string v0, "ERROR! OVERRIDE ME!"

    return-object v0
.end method

.method protected getTapJoyHtmlOffer(Lcom/tapjoy/TapjoyFeaturedAppObject;)Ljava/lang/String;
    .locals 1
    .param p1, "featApObj"    # Lcom/tapjoy/TapjoyFeaturedAppObject;

    .prologue
    .line 355
    const-string v0, "ERROR! OVERRIDE ME!"

    return-object v0
.end method

.method protected getTapjoyOfferDialogMessage(Lcom/tapjoy/TapjoyFeaturedAppObject;)Ljava/lang/String;
    .locals 4
    .param p1, "featuredAppObject"    # Lcom/tapjoy/TapjoyFeaturedAppObject;

    .prologue
    .line 3264
    const-string v0, "Download and run this app for free stuff:\n%s"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-object v3, p1, Lcom/tapjoy/TapjoyFeaturedAppObject;->name:Ljava/lang/String;

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getTapjoyOfferDialogTitle(Lcom/tapjoy/TapjoyFeaturedAppObject;)Ljava/lang/String;
    .locals 1
    .param p1, "featuredAppObject"    # Lcom/tapjoy/TapjoyFeaturedAppObject;

    .prologue
    .line 3259
    const-string v0, "Do you want to get free stuff?"

    return-object v0
.end method

.method protected getUpSellDialogAction()V
    .locals 1

    .prologue
    .line 3200
    const-string v0, "https://market.android.com/developer?pub=Miniclip.com"

    invoke-static {v0}, Lcom/miniclip/nativeJNI/cocojava;->openLink(Ljava/lang/String;)V

    .line 3201
    return-void
.end method

.method protected getUpSellDialogMessage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 3196
    const-string v0, "Do you want to get the premium version?"

    return-object v0
.end method

.method protected getUpSellDialogTitle()Ljava/lang/String;
    .locals 1

    .prologue
    .line 3192
    const-string v0, "Upgrade to premium?"

    return-object v0
.end method

.method public googlePlayServicesIsSignedInCustom()I
    .locals 2

    .prologue
    .line 4730
    const-string v0, "cocojava"

    const-string v1, "OVERRIDE googlePlayServicesIsSignedInCustom"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 4731
    const/4 v0, 0x0

    return v0
.end method

.method public googlePlayServicesLoginCustom()V
    .locals 2

    .prologue
    .line 4735
    const-string v0, "cocojava"

    const-string v1, "OVERRIDE googlePlayServicesLoginCustom"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 4736
    return-void
.end method

.method public googlePlayServicesLogoutCustom()V
    .locals 2

    .prologue
    .line 4739
    const-string v0, "cocojava"

    const-string v1, "OVERRIDE googlePlayServicesLoginCustom"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 4740
    return-void
.end method

.method hideDialog(I)V
    .locals 3
    .param p1, "msgId"    # I

    .prologue
    .line 1406
    iget-object v1, p0, Lcom/miniclip/nativeJNI/cocojava;->mDialogs:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1407
    iget-object v1, p0, Lcom/miniclip/nativeJNI/cocojava;->mDialogs:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Dialog;

    .line 1408
    .local v0, "dialog":Landroid/app/Dialog;
    if-eqz v0, :cond_0

    .line 1409
    invoke-virtual {v0}, Landroid/app/Dialog;->hide()V

    .line 1411
    .end local v0    # "dialog":Landroid/app/Dialog;
    :cond_0
    return-void
.end method

.method public inAppResponce(ILjava/lang/String;)V
    .locals 7
    .param p1, "responce"    # I
    .param p2, "productId"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 2987
    move v0, p1

    .line 2988
    .local v0, "responceFinal":I
    const-string v1, "inAppResponce"

    const-string v2, "id: %s responce: %d"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    aput-object p2, v3, v6

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2990
    if-ne v0, v5, :cond_1

    .line 2991
    const-string v1, "InAppSuccess: %s"

    new-array v2, v5, [Ljava/lang/Object;

    aput-object p2, v2, v6

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/flurry/android/FlurryAgent;->logEvent(Ljava/lang/String;)V

    .line 2992
    sget-boolean v1, Lcom/miniclip/nativeJNI/cocojava;->inAppsRemoveAds:Z

    if-eqz v1, :cond_0

    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->getAdsDisabled()I

    move-result v1

    if-nez v1, :cond_0

    .line 2993
    const-string v1, "callInAppPurchase"

    const-string v2, "Removing ads due to IAP!"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2994
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->permanentlyRemoveAds()V

    .line 2996
    invoke-virtual {p0}, Lcom/miniclip/nativeJNI/cocojava;->restoreOriginalAspectRatio()V

    .line 3000
    :cond_0
    :goto_0
    return-void

    .line 2999
    :cond_1
    const-string v1, "InAppFailed: %s"

    new-array v2, v5, [Ljava/lang/Object;

    aput-object p2, v2, v6

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/flurry/android/FlurryAgent;->logEvent(Ljava/lang/String;)V

    goto :goto_0
.end method

.method int2ButtonValue(I)I
    .locals 2
    .param p1, "value"    # I

    .prologue
    const/4 v0, -0x2

    .line 1358
    packed-switch p1, :pswitch_data_0

    .line 1369
    sget-boolean v1, Lcom/miniclip/nativeJNI/cocojava;->$assertionsDisabled:Z

    if-nez v1, :cond_0

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 1360
    :pswitch_0
    const/4 v0, -0x1

    .line 1370
    :cond_0
    :goto_0
    :pswitch_1
    return v0

    .line 1366
    :pswitch_2
    const/4 v0, -0x3

    goto :goto_0

    .line 1358
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public isOnline()Z
    .locals 3

    .prologue
    .line 2839
    const-string v2, "connectivity"

    invoke-virtual {p0, v2}, Lcom/miniclip/nativeJNI/cocojava;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 2840
    .local v0, "cm":Landroid/net/ConnectivityManager;
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v1

    .line 2841
    .local v1, "ni":Landroid/net/NetworkInfo;
    if-nez v1, :cond_0

    .line 2842
    const/4 v2, 0x0

    .line 2843
    :goto_0
    return v2

    :cond_0
    invoke-virtual {v1}, Landroid/net/NetworkInfo;->isConnectedOrConnecting()Z

    move-result v2

    goto :goto_0
.end method

.method public logCustomEvent(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "eventId"    # Ljava/lang/String;
    .param p2, "jsonString"    # Ljava/lang/String;

    .prologue
    .line 2688
    const-string v0, "cocojava"

    const-string v1, "OVERRIDE logCustomEvent"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2689
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 2
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 638
    invoke-super {p0, p1, p2, p3}, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->onActivityResult(IILandroid/content/Intent;)V

    .line 640
    const-string v0, "cocojava"

    const-string v1, "onActivityResult"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 643
    sget-boolean v0, Lcom/miniclip/nativeJNI/cocojava;->mUSE_FACEBOOK:Z

    if-eqz v0, :cond_0

    .line 644
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mFB_Session:Lcom/facebook/Session;

    invoke-virtual {v0, p0, p1, p2, p3}, Lcom/facebook/Session;->onActivityResult(Landroid/app/Activity;IILandroid/content/Intent;)Z

    .line 645
    :cond_0
    return-void
.end method

.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 4
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "buttonIndex"    # I

    .prologue
    .line 1455
    iget-object v2, p0, Lcom/miniclip/nativeJNI/cocojava;->mDialogs:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 1456
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Landroid/app/Dialog;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    if-ne v2, p1, :cond_0

    .line 1457
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual {p0, p2}, Lcom/miniclip/nativeJNI/cocojava;->buttonValue2Int(I)I

    move-result v3

    invoke-static {v2, v3}, Lcom/miniclip/nativeJNI/CocoJNI;->MonMessageBoxButtonPressed(II)V

    .line 1461
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Landroid/app/Dialog;>;"
    :cond_1
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "view"    # Landroid/view/View;

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 2772
    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->mRemoveAdsButton:Landroid/widget/ImageView;

    if-ne p1, v1, :cond_0

    .line 2774
    const-string v1, "remove_ads"

    invoke-static {v1, v2, v2}, Lcom/miniclip/nativeJNI/cocojava;->callInAppPurchaseManaged(Ljava/lang/String;II)I

    .line 2776
    :cond_0
    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->mSkip1:Landroid/widget/Button;

    if-ne p1, v1, :cond_2

    .line 2778
    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->mBigAdView:Landroid/widget/RelativeLayout;

    invoke-virtual {v1}, Landroid/widget/RelativeLayout;->removeAllViews()V

    .line 2779
    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->mBigAdView:Landroid/widget/RelativeLayout;

    invoke-virtual {v1, v3}, Landroid/widget/RelativeLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 2780
    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->mBigAdView:Landroid/widget/RelativeLayout;

    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout;->setClickable(Z)V

    .line 2783
    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->mGLView:Lcom/miniclip/nativeJNI/ClearGLSurfaceView;

    new-instance v2, Lcom/miniclip/nativeJNI/cocojava$38;

    invoke-direct {v2, p0}, Lcom/miniclip/nativeJNI/cocojava$38;-><init>(Lcom/miniclip/nativeJNI/cocojava;)V

    invoke-virtual {v1, v2}, Lcom/miniclip/nativeJNI/ClearGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    .line 2814
    :cond_1
    :goto_0
    return-void

    .line 2789
    :cond_2
    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->mRemove1:Landroid/widget/Button;

    if-ne p1, v1, :cond_3

    .line 2791
    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->mBigAdView:Landroid/widget/RelativeLayout;

    invoke-virtual {v1}, Landroid/widget/RelativeLayout;->removeAllViews()V

    .line 2792
    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->mBigAdView:Landroid/widget/RelativeLayout;

    invoke-virtual {v1, v3}, Landroid/widget/RelativeLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 2793
    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->mBigAdView:Landroid/widget/RelativeLayout;

    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout;->setClickable(Z)V

    .line 2797
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 2798
    .local v0, "intent":Landroid/content/Intent;
    invoke-virtual {p0}, Lcom/miniclip/nativeJNI/cocojava;->getFullAppURI()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 2799
    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 2800
    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->mGLView:Lcom/miniclip/nativeJNI/ClearGLSurfaceView;

    new-instance v2, Lcom/miniclip/nativeJNI/cocojava$39;

    invoke-direct {v2, p0}, Lcom/miniclip/nativeJNI/cocojava$39;-><init>(Lcom/miniclip/nativeJNI/cocojava;)V

    invoke-virtual {v1, v2}, Lcom/miniclip/nativeJNI/ClearGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    goto :goto_0

    .line 2806
    .end local v0    # "intent":Landroid/content/Intent;
    :cond_3
    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->mCenterdAd:Landroid/widget/RelativeLayout;

    if-ne p1, v1, :cond_1

    .line 2808
    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->mBigAdView:Landroid/widget/RelativeLayout;

    invoke-virtual {v1}, Landroid/widget/RelativeLayout;->removeAllViews()V

    .line 2809
    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->mBigAdView:Landroid/widget/RelativeLayout;

    invoke-virtual {v1, v3}, Landroid/widget/RelativeLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 2810
    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->mBigAdView:Landroid/widget/RelativeLayout;

    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout;->setClickable(Z)V

    goto :goto_0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 25
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 381
    invoke-super/range {p0 .. p1}, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->onCreate(Landroid/os/Bundle;)V

    .line 383
    sput-object p0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    .line 386
    sget-boolean v20, Lcom/miniclip/nativeJNI/cocojava;->mUSE_FACEBOOK:Z

    if-eqz v20, :cond_0

    .line 387
    sget-object v20, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    invoke-static/range {v20 .. v20}, Lcom/facebook/Session;->openActiveSessionFromCache(Landroid/content/Context;)Lcom/facebook/Session;

    move-result-object v20

    sput-object v20, Lcom/miniclip/nativeJNI/cocojava;->mFB_Session:Lcom/facebook/Session;

    .line 389
    sget-object v20, Lcom/miniclip/nativeJNI/cocojava;->mFB_Session:Lcom/facebook/Session;

    if-nez v20, :cond_0

    .line 390
    const-string v20, "cocojava"

    const-string v21, "FB: Cannot open session from cache"

    invoke-static/range {v20 .. v21}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 391
    new-instance v20, Lcom/facebook/Session;

    sget-object v21, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    invoke-direct/range {v20 .. v21}, Lcom/facebook/Session;-><init>(Landroid/content/Context;)V

    sput-object v20, Lcom/miniclip/nativeJNI/cocojava;->mFB_Session:Lcom/facebook/Session;

    .line 396
    :cond_0
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->getTotalRAM()I

    move-result v20

    const v21, 0x1e848000

    move/from16 v0, v20

    move/from16 v1, v21

    if-ge v0, v1, :cond_1

    .line 398
    sget-object v20, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v20, Landroid/app/Activity;

    new-instance v21, Lcom/miniclip/nativeJNI/cocojava$1;

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/miniclip/nativeJNI/cocojava$1;-><init>(Lcom/miniclip/nativeJNI/cocojava;)V

    invoke-virtual/range {v20 .. v21}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 415
    :cond_1
    sget v20, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v21, 0x13

    move/from16 v0, v20

    move/from16 v1, v21

    if-lt v0, v1, :cond_2

    .line 417
    invoke-virtual/range {p0 .. p0}, Lcom/miniclip/nativeJNI/cocojava;->getWindow()Landroid/view/Window;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v20

    new-instance v21, Lcom/miniclip/nativeJNI/cocojava$2;

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/miniclip/nativeJNI/cocojava$2;-><init>(Lcom/miniclip/nativeJNI/cocojava;)V

    invoke-virtual/range {v20 .. v21}, Landroid/view/View;->setOnSystemUiVisibilityChangeListener(Landroid/view/View$OnSystemUiVisibilityChangeListener;)V

    .line 426
    invoke-direct/range {p0 .. p0}, Lcom/miniclip/nativeJNI/cocojava;->setSystemUiVisibility()V

    .line 438
    :cond_2
    const/16 v20, 0x3

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/miniclip/nativeJNI/cocojava;->setVolumeControlStream(I)V

    .line 440
    new-instance v20, Landroid/widget/RelativeLayout;

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    sput-object v20, Lcom/miniclip/nativeJNI/cocojava;->mInitView:Landroid/widget/RelativeLayout;

    .line 441
    new-instance v16, Landroid/widget/RelativeLayout$LayoutParams;

    const/16 v20, -0x1

    const/16 v21, -0x1

    move-object/from16 v0, v16

    move/from16 v1, v20

    move/from16 v2, v21

    invoke-direct {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 444
    .local v16, "params":Landroid/widget/RelativeLayout$LayoutParams;
    sget-object v20, Lcom/miniclip/nativeJNI/cocojava;->mInitView:Landroid/widget/RelativeLayout;

    move-object/from16 v0, v20

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 445
    sget-object v20, Lcom/miniclip/nativeJNI/cocojava;->mInitView:Landroid/widget/RelativeLayout;

    const/16 v21, 0x0

    const/16 v22, 0x0

    const/16 v23, 0x0

    const/16 v24, 0x0

    invoke-virtual/range {v20 .. v24}, Landroid/widget/RelativeLayout;->setPadding(IIII)V

    .line 447
    sget-object v20, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    invoke-virtual/range {v20 .. v20}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v20

    const-string v21, "default2"

    const-string v22, "drawable"

    sget-object v23, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    invoke-virtual/range {v23 .. v23}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v20 .. v23}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v18

    .line 449
    .local v18, "resourceId2":I
    if-eqz v18, :cond_3

    .line 450
    const/16 v20, 0x1

    sput-boolean v20, Lcom/miniclip/nativeJNI/cocojava;->mHasSecondIntro:Z

    .line 452
    :cond_3
    new-instance v11, Landroid/widget/ImageView;

    move-object/from16 v0, p0

    invoke-direct {v11, v0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 453
    .local v11, "bg1":Landroid/widget/ImageView;
    sget-object v20, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    invoke-virtual/range {v20 .. v20}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v20

    const-string v21, "default1"

    const-string v22, "drawable"

    sget-object v23, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    invoke-virtual/range {v23 .. v23}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v20 .. v23}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v17

    .line 455
    .local v17, "resourceId":I
    invoke-virtual/range {p0 .. p0}, Lcom/miniclip/nativeJNI/cocojava;->getResources()Landroid/content/res/Resources;

    move-result-object v20

    move-object/from16 v0, v20

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v11, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 456
    new-instance v20, Landroid/widget/Gallery$LayoutParams;

    const/16 v21, -0x1

    const/16 v22, -0x1

    invoke-direct/range {v20 .. v22}, Landroid/widget/Gallery$LayoutParams;-><init>(II)V

    move-object/from16 v0, v20

    invoke-virtual {v11, v0}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 458
    sget-object v20, Landroid/widget/ImageView$ScaleType;->FIT_XY:Landroid/widget/ImageView$ScaleType;

    move-object/from16 v0, v20

    invoke-virtual {v11, v0}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 459
    sget-object v20, Lcom/miniclip/nativeJNI/cocojava;->mInitView:Landroid/widget/RelativeLayout;

    move-object/from16 v0, v20

    invoke-virtual {v0, v11}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 462
    invoke-virtual/range {p0 .. p0}, Lcom/miniclip/nativeJNI/cocojava;->getResources()Landroid/content/res/Resources;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v20

    move-object/from16 v0, v20

    iget v12, v0, Landroid/util/DisplayMetrics;->density:F

    .line 463
    .local v12, "density":F
    invoke-virtual/range {p0 .. p0}, Lcom/miniclip/nativeJNI/cocojava;->getResources()Landroid/content/res/Resources;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v20

    move-object/from16 v0, v20

    iget v0, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    move/from16 v20, v0

    move/from16 v0, v20

    int-to-float v0, v0

    move/from16 v19, v0

    .line 464
    .local v19, "width":F
    invoke-virtual/range {p0 .. p0}, Lcom/miniclip/nativeJNI/cocojava;->getResources()Landroid/content/res/Resources;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v20

    move-object/from16 v0, v20

    iget v0, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    move/from16 v20, v0

    move/from16 v0, v20

    int-to-float v13, v0

    .line 466
    .local v13, "height":F
    new-instance v14, Landroid/widget/RelativeLayout;

    move-object/from16 v0, p0

    invoke-direct {v14, v0}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 470
    .local v14, "mainContainer":Landroid/widget/RelativeLayout;
    new-instance v15, Landroid/widget/RelativeLayout$LayoutParams;

    const/high16 v20, 0x40000000    # 2.0f

    div-float v20, v13, v20

    move/from16 v0, v20

    float-to-int v0, v0

    move/from16 v20, v0

    const/high16 v21, 0x40000000    # 2.0f

    div-float v21, v13, v21

    move/from16 v0, v21

    float-to-int v0, v0

    move/from16 v21, v0

    move/from16 v0, v20

    move/from16 v1, v21

    invoke-direct {v15, v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 472
    .local v15, "mainContainerParams":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v20, 0xe

    move/from16 v0, v20

    invoke-virtual {v15, v0}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 473
    const/16 v20, 0xc

    move/from16 v0, v20

    invoke-virtual {v15, v0}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 474
    invoke-virtual {v14, v15}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 476
    sget-object v20, Lcom/miniclip/nativeJNI/cocojava;->mInitView:Landroid/widget/RelativeLayout;

    move-object/from16 v0, v20

    invoke-virtual {v0, v14}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 478
    sget-boolean v20, Lcom/miniclip/nativeJNI/cocojava;->mSPINNING_ANIMATION:Z

    if-eqz v20, :cond_4

    .line 481
    new-instance v5, Landroid/widget/ImageView;

    move-object/from16 v0, p0

    invoke-direct {v5, v0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 482
    .local v5, "ball":Landroid/widget/ImageView;
    sget-object v20, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    invoke-virtual/range {v20 .. v20}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v20

    const-string v21, "spinning_ball"

    const-string v22, "drawable"

    sget-object v23, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    invoke-virtual/range {v23 .. v23}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v20 .. v23}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v7

    .line 484
    .local v7, "ballResourceId":I
    invoke-virtual/range {p0 .. p0}, Lcom/miniclip/nativeJNI/cocojava;->getResources()Landroid/content/res/Resources;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v7}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v5, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 485
    new-instance v6, Landroid/widget/RelativeLayout$LayoutParams;

    const/high16 v20, 0x41200000    # 10.0f

    div-float v20, v13, v20

    move/from16 v0, v20

    float-to-int v0, v0

    move/from16 v20, v0

    const/high16 v21, 0x41200000    # 10.0f

    div-float v21, v13, v21

    move/from16 v0, v21

    float-to-int v0, v0

    move/from16 v21, v0

    move/from16 v0, v20

    move/from16 v1, v21

    invoke-direct {v6, v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 486
    .local v6, "ballParams":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v20, 0xd

    move/from16 v0, v20

    invoke-virtual {v6, v0}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 487
    invoke-virtual {v5, v6}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 488
    sget-object v20, Landroid/widget/ImageView$ScaleType;->CENTER_INSIDE:Landroid/widget/ImageView$ScaleType;

    move-object/from16 v0, v20

    invoke-virtual {v5, v0}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 489
    invoke-virtual {v14, v5}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 492
    new-instance v8, Landroid/widget/ImageView;

    move-object/from16 v0, p0

    invoke-direct {v8, v0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 493
    .local v8, "ballSpin":Landroid/widget/ImageView;
    sget-object v20, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    invoke-virtual/range {v20 .. v20}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v20

    const-string v21, "spinning_ball_effect"

    const-string v22, "drawable"

    sget-object v23, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    invoke-virtual/range {v23 .. v23}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v20 .. v23}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v10

    .line 495
    .local v10, "ballSpinResourceId":I
    invoke-virtual/range {p0 .. p0}, Lcom/miniclip/nativeJNI/cocojava;->getResources()Landroid/content/res/Resources;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v10}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v8, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 496
    new-instance v9, Landroid/widget/RelativeLayout$LayoutParams;

    const/high16 v20, 0x41000000    # 8.0f

    div-float v20, v13, v20

    move/from16 v0, v20

    float-to-int v0, v0

    move/from16 v20, v0

    const/high16 v21, 0x41000000    # 8.0f

    div-float v21, v13, v21

    move/from16 v0, v21

    float-to-int v0, v0

    move/from16 v21, v0

    move/from16 v0, v20

    move/from16 v1, v21

    invoke-direct {v9, v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 497
    .local v9, "ballSpinParams":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v20, 0xd

    move/from16 v0, v20

    invoke-virtual {v9, v0}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 498
    invoke-virtual {v8, v9}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 499
    sget-object v20, Landroid/widget/ImageView$ScaleType;->CENTER_INSIDE:Landroid/widget/ImageView$ScaleType;

    move-object/from16 v0, v20

    invoke-virtual {v8, v0}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 500
    invoke-virtual {v14, v8}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 503
    const/4 v4, 0x0

    .line 504
    .local v4, "anim":Landroid/view/animation/Animation;
    new-instance v4, Landroid/view/animation/RotateAnimation;

    .end local v4    # "anim":Landroid/view/animation/Animation;
    const/16 v20, 0x0

    const/high16 v21, 0x43b40000    # 360.0f

    const/high16 v22, 0x41000000    # 8.0f

    div-float v22, v13, v22

    move/from16 v0, v22

    float-to-int v0, v0

    move/from16 v22, v0

    div-int/lit8 v22, v22, 0x2

    move/from16 v0, v22

    int-to-float v0, v0

    move/from16 v22, v0

    const/high16 v23, 0x41000000    # 8.0f

    div-float v23, v13, v23

    move/from16 v0, v23

    float-to-int v0, v0

    move/from16 v23, v0

    div-int/lit8 v23, v23, 0x2

    move/from16 v0, v23

    int-to-float v0, v0

    move/from16 v23, v0

    move/from16 v0, v20

    move/from16 v1, v21

    move/from16 v2, v22

    move/from16 v3, v23

    invoke-direct {v4, v0, v1, v2, v3}, Landroid/view/animation/RotateAnimation;-><init>(FFFF)V

    .line 505
    .restart local v4    # "anim":Landroid/view/animation/Animation;
    const-wide/16 v20, 0x3e8

    move-wide/from16 v0, v20

    invoke-virtual {v4, v0, v1}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 506
    const/16 v20, -0x1

    move/from16 v0, v20

    invoke-virtual {v4, v0}, Landroid/view/animation/Animation;->setRepeatCount(I)V

    .line 507
    new-instance v20, Landroid/view/animation/LinearInterpolator;

    invoke-direct/range {v20 .. v20}, Landroid/view/animation/LinearInterpolator;-><init>()V

    move-object/from16 v0, v20

    invoke-virtual {v4, v0}, Landroid/view/animation/Animation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 508
    const/16 v20, 0x1

    move/from16 v0, v20

    invoke-virtual {v4, v0}, Landroid/view/animation/Animation;->setFillAfter(Z)V

    .line 509
    invoke-virtual {v8, v4}, Landroid/widget/ImageView;->startAnimation(Landroid/view/animation/Animation;)V

    .line 557
    .end local v4    # "anim":Landroid/view/animation/Animation;
    .end local v5    # "ball":Landroid/widget/ImageView;
    .end local v6    # "ballParams":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v7    # "ballResourceId":I
    .end local v8    # "ballSpin":Landroid/widget/ImageView;
    .end local v9    # "ballSpinParams":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v10    # "ballSpinResourceId":I
    :cond_4
    return-void
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 2345
    invoke-super {p0}, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->onDestroy()V

    .line 2351
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/System;->runFinalizersOnExit(Z)V

    .line 2352
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/System;->exit(I)V

    .line 2353
    return-void
.end method

.method public onInterstitialMopubViewExit()V
    .locals 2

    .prologue
    .line 3470
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/miniclip/nativeJNI/cocojava$58;

    invoke-direct {v1, p0}, Lcom/miniclip/nativeJNI/cocojava$58;-><init>(Lcom/miniclip/nativeJNI/cocojava;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 3483
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 4
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    const/4 v1, 0x1

    .line 1270
    move v0, p1

    .line 1271
    .local v0, "id":I
    sparse-switch p1, :sswitch_data_0

    .line 1309
    invoke-super {p0, p1, p2}, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v1

    :goto_0
    return v1

    .line 1274
    :sswitch_0
    invoke-virtual {p2}, Landroid/view/KeyEvent;->isAltPressed()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1275
    sget-object v2, Lcom/miniclip/nativeJNI/cocojava;->mGLView:Lcom/miniclip/nativeJNI/ClearGLSurfaceView;

    new-instance v3, Lcom/miniclip/nativeJNI/cocojava$11;

    invoke-direct {v3, p0, v0}, Lcom/miniclip/nativeJNI/cocojava$11;-><init>(Lcom/miniclip/nativeJNI/cocojava;I)V

    invoke-virtual {v2, v3}, Lcom/miniclip/nativeJNI/ClearGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    goto :goto_0

    .line 1282
    :cond_0
    sget-object v2, Lcom/miniclip/nativeJNI/cocojava;->mGLView:Lcom/miniclip/nativeJNI/ClearGLSurfaceView;

    new-instance v3, Lcom/miniclip/nativeJNI/cocojava$12;

    invoke-direct {v3, p0}, Lcom/miniclip/nativeJNI/cocojava$12;-><init>(Lcom/miniclip/nativeJNI/cocojava;)V

    invoke-virtual {v2, v3}, Lcom/miniclip/nativeJNI/ClearGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    goto :goto_0

    .line 1300
    :sswitch_1
    sget-object v2, Lcom/miniclip/nativeJNI/cocojava;->mGLView:Lcom/miniclip/nativeJNI/ClearGLSurfaceView;

    new-instance v3, Lcom/miniclip/nativeJNI/cocojava$13;

    invoke-direct {v3, p0, v0}, Lcom/miniclip/nativeJNI/cocojava$13;-><init>(Lcom/miniclip/nativeJNI/cocojava;I)V

    invoke-virtual {v2, v3}, Lcom/miniclip/nativeJNI/ClearGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    goto :goto_0

    .line 1271
    nop

    :sswitch_data_0
    .sparse-switch
        0x4 -> :sswitch_0
        0x13 -> :sswitch_1
        0x14 -> :sswitch_1
        0x15 -> :sswitch_1
        0x16 -> :sswitch_1
        0x17 -> :sswitch_1
        0x52 -> :sswitch_1
        0x63 -> :sswitch_1
        0x64 -> :sswitch_1
        0x6c -> :sswitch_1
        0x6d -> :sswitch_1
    .end sparse-switch
.end method

.method public onKeyUp(ILandroid/view/KeyEvent;)Z
    .locals 3
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 1316
    move v0, p1

    .line 1317
    .local v0, "id":I
    sparse-switch p1, :sswitch_data_0

    .line 1338
    invoke-super {p0, p1, p2}, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result v1

    :goto_0
    return v1

    .line 1329
    :sswitch_0
    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->mGLView:Lcom/miniclip/nativeJNI/ClearGLSurfaceView;

    new-instance v2, Lcom/miniclip/nativeJNI/cocojava$14;

    invoke-direct {v2, p0, v0}, Lcom/miniclip/nativeJNI/cocojava$14;-><init>(Lcom/miniclip/nativeJNI/cocojava;I)V

    invoke-virtual {v1, v2}, Lcom/miniclip/nativeJNI/ClearGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    .line 1335
    const/4 v1, 0x1

    goto :goto_0

    .line 1317
    nop

    :sswitch_data_0
    .sparse-switch
        0x13 -> :sswitch_0
        0x14 -> :sswitch_0
        0x15 -> :sswitch_0
        0x16 -> :sswitch_0
        0x17 -> :sswitch_0
        0x52 -> :sswitch_0
        0x63 -> :sswitch_0
        0x64 -> :sswitch_0
        0x6c -> :sswitch_0
        0x6d -> :sswitch_0
    .end sparse-switch
.end method

.method public onLowMemory()V
    .locals 2

    .prologue
    .line 1252
    const-string v0, "MEMORY WARNING"

    const-string v1, "LOW MEMORY"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1253
    sget v0, Lcom/miniclip/nativeJNI/cocojava;->mNumCrashes:I

    add-int/lit8 v0, v0, 0x1

    sput v0, Lcom/miniclip/nativeJNI/cocojava;->mNumCrashes:I

    .line 1255
    sget v0, Lcom/miniclip/nativeJNI/cocojava;->mNumCrashes:I

    const/4 v1, 0x3

    if-lt v0, v1, :cond_0

    .line 1256
    const/4 v0, 0x0

    sput v0, Lcom/miniclip/nativeJNI/cocojava;->mNumCrashes:I

    .line 1257
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mGLView:Lcom/miniclip/nativeJNI/ClearGLSurfaceView;

    new-instance v1, Lcom/miniclip/nativeJNI/cocojava$10;

    invoke-direct {v1, p0}, Lcom/miniclip/nativeJNI/cocojava$10;-><init>(Lcom/miniclip/nativeJNI/cocojava;)V

    invoke-virtual {v0, v1}, Lcom/miniclip/nativeJNI/ClearGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    .line 1264
    :cond_0
    return-void
.end method

.method protected onPause()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 2223
    invoke-super {p0}, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->onPause()V

    .line 2238
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->accelerometer:Lcom/miniclip/nativeJNI/cocoaccel;

    invoke-virtual {v0}, Lcom/miniclip/nativeJNI/cocoaccel;->disable()V

    .line 2239
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->pauseBackgroundMusic()V

    .line 2240
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->soundPlayer:Lcom/miniclip/nativeJNI/cocosound;

    invoke-virtual {v0}, Lcom/miniclip/nativeJNI/cocosound;->pauseAllSounds()V

    .line 2241
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mGLView:Lcom/miniclip/nativeJNI/ClearGLSurfaceView;

    invoke-virtual {v0}, Lcom/miniclip/nativeJNI/ClearGLSurfaceView;->onPause()V

    .line 2243
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mRotatedBanner:Lcom/miniclip/nativeJNI/rotatedBannerImg;

    if-eqz v0, :cond_0

    sget-boolean v0, Lcom/miniclip/nativeJNI/cocojava;->mUSE_ADS_VERTICAL:Z

    if-eqz v0, :cond_0

    sget v0, Lcom/miniclip/nativeJNI/cocojava;->mRotatedBannerDisplayed:I

    if-ne v0, v2, :cond_0

    .line 2245
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mRotatedBanner:Lcom/miniclip/nativeJNI/rotatedBannerImg;

    invoke-virtual {v0, v1}, Lcom/miniclip/nativeJNI/rotatedBannerImg;->setBlockAutoRefresh(Z)V

    .line 2246
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mRotatedBanner:Lcom/miniclip/nativeJNI/rotatedBannerImg;

    invoke-virtual {v0, v1}, Lcom/miniclip/nativeJNI/rotatedBannerImg;->setAutorefreshEnabled(Z)V

    .line 2247
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mRotatedBanner:Lcom/miniclip/nativeJNI/rotatedBannerImg;

    invoke-virtual {v0, v2}, Lcom/miniclip/nativeJNI/rotatedBannerImg;->setBlockAutoRefresh(Z)V

    .line 2250
    :cond_0
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mHorizontalBanner:Lcom/miniclip/nativeJNI/horizontalBanner;

    if-eqz v0, :cond_1

    sget-boolean v0, Lcom/miniclip/nativeJNI/cocojava;->mUSE_ADS_HORIZONTAL:Z

    if-eqz v0, :cond_1

    sget-boolean v0, Lcom/miniclip/nativeJNI/cocojava;->mHorizontalBannerDisplayed:Z

    if-eqz v0, :cond_1

    .line 2252
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mHorizontalBanner:Lcom/miniclip/nativeJNI/horizontalBanner;

    invoke-virtual {v0, v1}, Lcom/miniclip/nativeJNI/horizontalBanner;->setBlockAutoRefresh(Z)V

    .line 2253
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mHorizontalBanner:Lcom/miniclip/nativeJNI/horizontalBanner;

    invoke-virtual {v0, v1}, Lcom/miniclip/nativeJNI/horizontalBanner;->setAutorefreshEnabled(Z)V

    .line 2254
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mHorizontalBanner:Lcom/miniclip/nativeJNI/horizontalBanner;

    invoke-virtual {v0, v2}, Lcom/miniclip/nativeJNI/horizontalBanner;->setBlockAutoRefresh(Z)V

    .line 2256
    :cond_1
    return-void
.end method

.method protected onRealResume()V
    .locals 1

    .prologue
    .line 2339
    sget-boolean v0, Lcom/miniclip/nativeJNI/cocojava;->mUSE_TAPJOY:Z

    if-eqz v0, :cond_0

    .line 2340
    invoke-static {}, Lcom/tapjoy/TapjoyConnect;->getTapjoyConnectInstance()Lcom/tapjoy/TapjoyConnect;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/tapjoy/TapjoyConnect;->getTapPoints(Lcom/tapjoy/TapjoyNotifier;)V

    .line 2341
    :cond_0
    return-void
.end method

.method protected onResume()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 2292
    invoke-super {p0}, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->onResume()V

    .line 2308
    sget-boolean v0, Lcom/miniclip/nativeJNI/cocojava;->mHasWindowFocus:Z

    if-eqz v0, :cond_3

    .line 2309
    sput-boolean v1, Lcom/miniclip/nativeJNI/cocojava;->mResumeOnFocus:Z

    .line 2310
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->accelerometer:Lcom/miniclip/nativeJNI/cocoaccel;

    invoke-virtual {v0}, Lcom/miniclip/nativeJNI/cocoaccel;->enable()V

    .line 2311
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->resumeBackgroundMusic()V

    .line 2312
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->soundPlayer:Lcom/miniclip/nativeJNI/cocosound;

    invoke-virtual {v0}, Lcom/miniclip/nativeJNI/cocosound;->resumeAllSounds()V

    .line 2313
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mGLView:Lcom/miniclip/nativeJNI/ClearGLSurfaceView;

    invoke-virtual {v0}, Lcom/miniclip/nativeJNI/ClearGLSurfaceView;->onResume()V

    .line 2317
    :goto_0
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mRenderer:Lcom/miniclip/nativeJNI/ClearRenderer;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mRenderer:Lcom/miniclip/nativeJNI/ClearRenderer;

    iget-boolean v0, v0, Lcom/miniclip/nativeJNI/ClearRenderer;->hasStarted:Z

    if-eqz v0, :cond_0

    .line 2318
    invoke-virtual {p0}, Lcom/miniclip/nativeJNI/cocojava;->onRealResume()V

    .line 2319
    :cond_0
    sput v1, Lcom/miniclip/nativeJNI/cocojava;->mNumUpSellsThisSession:I

    .line 2321
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mRotatedBanner:Lcom/miniclip/nativeJNI/rotatedBannerImg;

    if-eqz v0, :cond_1

    sget-boolean v0, Lcom/miniclip/nativeJNI/cocojava;->mUSE_ADS_VERTICAL:Z

    if-eqz v0, :cond_1

    sget v0, Lcom/miniclip/nativeJNI/cocojava;->mRotatedBannerDisplayed:I

    if-ne v0, v2, :cond_1

    .line 2323
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mRotatedBanner:Lcom/miniclip/nativeJNI/rotatedBannerImg;

    invoke-virtual {v0, v1}, Lcom/miniclip/nativeJNI/rotatedBannerImg;->setBlockAutoRefresh(Z)V

    .line 2324
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mRotatedBanner:Lcom/miniclip/nativeJNI/rotatedBannerImg;

    invoke-virtual {v0}, Lcom/miniclip/nativeJNI/rotatedBannerImg;->resetRefreshTime()V

    .line 2325
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mRotatedBanner:Lcom/miniclip/nativeJNI/rotatedBannerImg;

    invoke-virtual {v0, v2}, Lcom/miniclip/nativeJNI/rotatedBannerImg;->setAutorefreshEnabled(Z)V

    .line 2326
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mRotatedBanner:Lcom/miniclip/nativeJNI/rotatedBannerImg;

    invoke-virtual {v0, v2}, Lcom/miniclip/nativeJNI/rotatedBannerImg;->setBlockAutoRefresh(Z)V

    .line 2329
    :cond_1
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mHorizontalBanner:Lcom/miniclip/nativeJNI/horizontalBanner;

    if-eqz v0, :cond_2

    sget-boolean v0, Lcom/miniclip/nativeJNI/cocojava;->mUSE_ADS_HORIZONTAL:Z

    if-eqz v0, :cond_2

    sget-boolean v0, Lcom/miniclip/nativeJNI/cocojava;->mHorizontalBannerDisplayed:Z

    if-eqz v0, :cond_2

    .line 2331
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mHorizontalBanner:Lcom/miniclip/nativeJNI/horizontalBanner;

    invoke-virtual {v0, v1}, Lcom/miniclip/nativeJNI/horizontalBanner;->setBlockAutoRefresh(Z)V

    .line 2332
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mHorizontalBanner:Lcom/miniclip/nativeJNI/horizontalBanner;

    invoke-virtual {v0, v1}, Lcom/miniclip/nativeJNI/horizontalBanner;->setAutorefreshEnabled(Z)V

    .line 2333
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mHorizontalBanner:Lcom/miniclip/nativeJNI/horizontalBanner;

    invoke-virtual {v0, v2}, Lcom/miniclip/nativeJNI/horizontalBanner;->setBlockAutoRefresh(Z)V

    .line 2335
    :cond_2
    return-void

    .line 2315
    :cond_3
    sput-boolean v2, Lcom/miniclip/nativeJNI/cocojava;->mResumeOnFocus:Z

    goto :goto_0
.end method

.method protected onStart()V
    .locals 0

    .prologue
    .line 632
    invoke-super {p0}, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->onStart()V

    .line 633
    invoke-virtual {p0}, Lcom/miniclip/nativeJNI/cocojava;->firstRun()V

    .line 634
    return-void
.end method

.method protected onStop()V
    .locals 0

    .prologue
    .line 1465
    invoke-super {p0}, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->onStop()V

    .line 1466
    invoke-static {p0}, Lcom/flurry/android/FlurryAgent;->onEndSession(Landroid/content/Context;)V

    .line 1467
    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 2
    .param p1, "hasWindowFocus"    # Z

    .prologue
    .line 2260
    sput-boolean p1, Lcom/miniclip/nativeJNI/cocojava;->mHasWindowFocus:Z

    .line 2261
    sget-boolean v0, Lcom/miniclip/nativeJNI/cocojava;->mHasWindowFocus:Z

    if-eqz v0, :cond_0

    sget-boolean v0, Lcom/miniclip/nativeJNI/cocojava;->mResumeOnFocus:Z

    if-eqz v0, :cond_0

    .line 2262
    const/4 v0, 0x0

    sput-boolean v0, Lcom/miniclip/nativeJNI/cocojava;->mResumeOnFocus:Z

    .line 2263
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->accelerometer:Lcom/miniclip/nativeJNI/cocoaccel;

    invoke-virtual {v0}, Lcom/miniclip/nativeJNI/cocoaccel;->enable()V

    .line 2264
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->resumeBackgroundMusic()V

    .line 2265
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->soundPlayer:Lcom/miniclip/nativeJNI/cocosound;

    invoke-virtual {v0}, Lcom/miniclip/nativeJNI/cocosound;->resumeAllSounds()V

    .line 2266
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mGLView:Lcom/miniclip/nativeJNI/ClearGLSurfaceView;

    invoke-virtual {v0}, Lcom/miniclip/nativeJNI/ClearGLSurfaceView;->onResume()V

    .line 2268
    :cond_0
    sget-boolean v0, Lcom/miniclip/nativeJNI/cocojava;->mHasWindowFocus:Z

    if-eqz v0, :cond_1

    .line 2269
    invoke-virtual {p0}, Lcom/miniclip/nativeJNI/cocojava;->fixScreen()V

    .line 2278
    :cond_1
    sget-boolean v0, Lcom/miniclip/nativeJNI/cocojava;->mHasWindowFocus:Z

    if-eqz v0, :cond_2

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_2

    .line 2280
    invoke-direct {p0}, Lcom/miniclip/nativeJNI/cocojava;->setSystemUiVisibility()V

    .line 2286
    :cond_2
    return-void
.end method

.method public restoreOriginalAspectRatio()V
    .locals 2

    .prologue
    .line 2960
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/miniclip/nativeJNI/cocojava$43;

    invoke-direct {v1, p0}, Lcom/miniclip/nativeJNI/cocojava$43;-><init>(Lcom/miniclip/nativeJNI/cocojava;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 2971
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mGLView:Lcom/miniclip/nativeJNI/ClearGLSurfaceView;

    new-instance v1, Lcom/miniclip/nativeJNI/cocojava$44;

    invoke-direct {v1, p0}, Lcom/miniclip/nativeJNI/cocojava$44;-><init>(Lcom/miniclip/nativeJNI/cocojava;)V

    invoke-virtual {v0, v1}, Lcom/miniclip/nativeJNI/ClearGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    .line 2984
    return-void
.end method

.method public showAchievementsCustom()V
    .locals 2

    .prologue
    .line 4696
    const-string v0, "cocojava"

    const-string v1, "OVERRIDE showAchievementsCustom"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 4697
    return-void
.end method

.method public showDatePickerDialog(III)V
    .locals 6
    .param p1, "year"    # I
    .param p2, "month"    # I
    .param p3, "day"    # I

    .prologue
    .line 4775
    add-int/lit8 p2, p2, -0x1

    .line 4776
    new-instance v0, Landroid/app/DatePickerDialog;

    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    new-instance v2, Lcom/miniclip/nativeJNI/cocojava$99;

    invoke-direct {v2, p0}, Lcom/miniclip/nativeJNI/cocojava$99;-><init>(Lcom/miniclip/nativeJNI/cocojava;)V

    move v3, p1

    move v4, p2

    move v5, p3

    invoke-direct/range {v0 .. v5}, Landroid/app/DatePickerDialog;-><init>(Landroid/content/Context;Landroid/app/DatePickerDialog$OnDateSetListener;III)V

    .line 4788
    .local v0, "dialog":Landroid/app/DatePickerDialog;
    new-instance v1, Lcom/miniclip/nativeJNI/cocojava$100;

    invoke-direct {v1, p0}, Lcom/miniclip/nativeJNI/cocojava$100;-><init>(Lcom/miniclip/nativeJNI/cocojava;)V

    invoke-virtual {v0, v1}, Landroid/app/DatePickerDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 4799
    invoke-virtual {v0}, Landroid/app/DatePickerDialog;->show()V

    .line 4800
    return-void
.end method

.method showDialog(ILjava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V
    .locals 6
    .param p1, "msgId"    # I
    .param p2, "title"    # Ljava/lang/String;
    .param p3, "message"    # Ljava/lang/String;
    .param p4, "buttonTitles"    # [Ljava/lang/String;

    .prologue
    .line 1375
    const/4 v1, 0x0

    .line 1377
    .local v1, "dialog":Landroid/app/Dialog;
    iget-object v3, p0, Lcom/miniclip/nativeJNI/cocojava;->mDialogs:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_6

    .line 1378
    array-length v3, p4

    const/4 v4, 0x4

    if-ge v3, v4, :cond_5

    .line 1379
    new-instance v3, Landroid/app/AlertDialog$Builder;

    invoke-direct {v3, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v3, p2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    invoke-virtual {v3, p3}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 1381
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v3, p4

    if-ge v2, v3, :cond_3

    .line 1382
    invoke-virtual {p0, v2}, Lcom/miniclip/nativeJNI/cocojava;->int2ButtonValue(I)I

    move-result v3

    const/4 v4, -0x1

    if-ne v3, v4, :cond_1

    .line 1383
    aget-object v3, p4, v2

    invoke-virtual {v0, v3, p0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 1381
    :cond_0
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1384
    :cond_1
    invoke-virtual {p0, v2}, Lcom/miniclip/nativeJNI/cocojava;->int2ButtonValue(I)I

    move-result v3

    const/4 v4, -0x2

    if-ne v3, v4, :cond_2

    .line 1385
    aget-object v3, p4, v2

    invoke-virtual {v0, v3, p0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    goto :goto_1

    .line 1386
    :cond_2
    invoke-virtual {p0, v2}, Lcom/miniclip/nativeJNI/cocojava;->int2ButtonValue(I)I

    move-result v3

    const/4 v4, -0x3

    if-ne v3, v4, :cond_0

    .line 1387
    aget-object v3, p4, v2

    invoke-virtual {v0, v3, p0}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    goto :goto_1

    .line 1389
    :cond_3
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    .line 1398
    .end local v0    # "builder":Landroid/app/AlertDialog$Builder;
    :cond_4
    iget-object v3, p0, Lcom/miniclip/nativeJNI/cocojava;->mDialogs:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v4, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1402
    .end local v2    # "i":I
    :goto_2
    invoke-virtual {v1}, Landroid/app/Dialog;->show()V

    .line 1403
    return-void

    .line 1391
    :cond_5
    new-instance v3, Landroid/app/AlertDialog$Builder;

    invoke-direct {v3, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v3}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    .line 1392
    invoke-virtual {v1, p2}, Landroid/app/Dialog;->setTitle(Ljava/lang/CharSequence;)V

    move-object v3, v1

    .line 1393
    check-cast v3, Landroid/app/AlertDialog;

    invoke-virtual {v3, p3}, Landroid/app/AlertDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 1394
    const/4 v2, 0x0

    .restart local v2    # "i":I
    :goto_3
    array-length v3, p4

    if-ge v2, v3, :cond_4

    move-object v3, v1

    .line 1395
    check-cast v3, Landroid/app/AlertDialog;

    invoke-virtual {p0, v2}, Lcom/miniclip/nativeJNI/cocojava;->int2ButtonValue(I)I

    move-result v4

    aget-object v5, p4, v2

    invoke-virtual {v3, v4, v5, p0}, Landroid/app/AlertDialog;->setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 1394
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 1400
    .end local v2    # "i":I
    :cond_6
    iget-object v3, p0, Lcom/miniclip/nativeJNI/cocojava;->mDialogs:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "dialog":Landroid/app/Dialog;
    check-cast v1, Landroid/app/Dialog;

    .restart local v1    # "dialog":Landroid/app/Dialog;
    goto :goto_2
.end method

.method protected showInterstitial()V
    .locals 0

    .prologue
    .line 1700
    return-void
.end method

.method public showInterstitialAd()V
    .locals 1

    .prologue
    .line 2622
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->interstitial:Lcom/mopub/mobileads/MoPubInterstitial;

    invoke-virtual {v0, p0}, Lcom/mopub/mobileads/MoPubInterstitial;->setListener(Lcom/mopub/mobileads/MoPubInterstitial$MoPubInterstitialListener;)V

    .line 2623
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->interstitial:Lcom/mopub/mobileads/MoPubInterstitial;

    invoke-virtual {v0}, Lcom/mopub/mobileads/MoPubInterstitial;->showAd()V

    .line 2624
    return-void
.end method

.method public showLeaderboardCustom(Ljava/lang/String;)V
    .locals 2
    .param p1, "leaderboardId"    # Ljava/lang/String;

    .prologue
    .line 4684
    const-string v0, "cocojava"

    const-string v1, "OVERRIDE showLeaderboardCustom"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 4685
    return-void
.end method

.method public showLeaderboardsCustom()V
    .locals 2

    .prologue
    .line 4688
    const-string v0, "cocojava"

    const-string v1, "OVERRIDE showLeaderboardsCustom"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 4689
    return-void
.end method

.method protected showMiniclipViewInternal()V
    .locals 2

    .prologue
    .line 1512
    new-instance v0, Lcom/miniclip/nativeJNI/MiniclipUpsellView;

    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/miniclip/nativeJNI/MiniclipUpsellView;-><init>(Landroid/content/Context;)V

    .line 1513
    .local v0, "upView":Lcom/miniclip/nativeJNI/MiniclipUpsellView;
    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->layout:Landroid/widget/RelativeLayout;

    invoke-virtual {v1, v0}, Landroid/widget/RelativeLayout;->removeView(Landroid/view/View;)V

    .line 1514
    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->layout:Landroid/widget/RelativeLayout;

    invoke-virtual {v1, v0}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 1515
    return-void
.end method

.method protected showUpSellDialogInternal()V
    .locals 2

    .prologue
    .line 3204
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/miniclip/nativeJNI/cocojava$51;

    invoke-direct {v1, p0}, Lcom/miniclip/nativeJNI/cocojava$51;-><init>(Lcom/miniclip/nativeJNI/cocojava;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 3251
    return-void
.end method

.method public updateAchievementCustom(Ljava/lang/String;FLjava/lang/Object;)V
    .locals 2
    .param p1, "achievementId"    # Ljava/lang/String;
    .param p2, "progressValue"    # F
    .param p3, "userData"    # Ljava/lang/Object;

    .prologue
    .line 4692
    const-string v0, "cocojava"

    const-string v1, "OVERRIDE updateAchievementCustom"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 4693
    return-void
.end method

.method public updateScoreCustom(Ljava/lang/String;JLjava/lang/Object;)V
    .locals 2
    .param p1, "leaderboardId"    # Ljava/lang/String;
    .param p2, "scoreValue"    # J
    .param p4, "userData"    # Ljava/lang/Object;

    .prologue
    .line 4680
    const-string v0, "cocojava"

    const-string v1, "OVERRIDE updateScoreCustom"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 4681
    return-void
.end method
