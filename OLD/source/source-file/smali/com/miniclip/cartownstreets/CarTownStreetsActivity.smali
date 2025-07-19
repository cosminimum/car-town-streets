.class public Lcom/miniclip/cartownstreets/CarTownStreetsActivity;
.super Lcom/miniclip/nativeJNI/InAppActivity;
.source "CarTownStreetsActivity.java"

# interfaces
.implements Lcom/miniclip/GetJar/GetJar$GetJarListener;
.implements Lcom/miniclip/GooglePlayServices/GooglePlayServices$GooglePlayServicesListener;


# static fields
.field static final SCREEN_ORIENTATION_SENSOR_LANDSCAPE:I = 0x6

.field static final gameID:Ljava/lang/String; = ""

.field static final gameKey:Ljava/lang/String; = ""

.field static final gameName:Ljava/lang/String; = ""

.field static final gameSecret:Ljava/lang/String; = ""

.field private static final mPrices:[D


# instance fields
.field mWifiLock:Landroid/net/wifi/WifiManager$WifiLock;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 34
    const/16 v0, 0xf

    new-array v0, v0, [D

    fill-array-data v0, :array_0

    sput-object v0, Lcom/miniclip/cartownstreets/CarTownStreetsActivity;->mPrices:[D

    return-void

    :array_0
    .array-data 8
        0x3fffd70a3d70a3d7L    # 1.99
        0x4013f5c28f5c28f6L    # 4.99
        0x4023fae147ae147bL    # 9.99
        0x4038fd70a3d70a3dL    # 24.99
        0x4048feb851eb851fL    # 49.99
        0x4013f5c28f5c28f6L    # 4.99
        0x4023fae147ae147bL    # 9.99
        0x4038fd70a3d70a3dL    # 24.99
        0x4048feb851eb851fL    # 49.99
        0x4058ff5c28f5c28fL    # 99.99
        0x3fffd70a3d70a3d7L    # 1.99
        0x4013f5c28f5c28f6L    # 4.99
        0x4023fae147ae147bL    # 9.99
        0x4038fd70a3d70a3dL    # 24.99
        0x4048feb851eb851fL    # 49.99
    .end array-data
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 32
    invoke-direct {p0}, Lcom/miniclip/nativeJNI/InAppActivity;-><init>()V

    .line 42
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miniclip/cartownstreets/CarTownStreetsActivity;->mWifiLock:Landroid/net/wifi/WifiManager$WifiLock;

    return-void
.end method

.method static synthetic access$000()Landroid/content/Context;
    .locals 1

    .prologue
    .line 32
    sget-object v0, Lcom/miniclip/cartownstreets/CarTownStreetsActivity;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method public static sendAdxPurchase(Ljava/lang/String;I)V
    .locals 4
    .param p0, "productId"    # Ljava/lang/String;
    .param p1, "purchaseType"    # I

    .prologue
    .line 370
    const-string v0, "CarTownStreetsActivity"

    const-string v1, "sendAdxPurchase %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p0, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 371
    sget-object v0, Lcom/miniclip/cartownstreets/CarTownStreetsActivity;->mContext:Landroid/content/Context;

    check-cast v0, Lcom/miniclip/cartownstreets/CarTownStreetsActivity;

    new-instance v1, Lcom/miniclip/cartownstreets/CarTownStreetsActivity$2;

    invoke-direct {v1, p0, p1}, Lcom/miniclip/cartownstreets/CarTownStreetsActivity$2;-><init>(Ljava/lang/String;I)V

    invoke-virtual {v0, v1}, Lcom/miniclip/cartownstreets/CarTownStreetsActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 376
    return-void
.end method


# virtual methods
.method protected cancelCustomNotification(I)V
    .locals 0
    .param p1, "nid"    # I

    .prologue
    .line 133
    invoke-static {p0, p1}, Lcom/miniclip/cartownstreets/BootReceiver;->removeAlarm(Landroid/content/Context;I)V

    .line 134
    return-void
.end method

.method protected createCustomNotification(ILjava/lang/String;Ljava/lang/String;I)V
    .locals 2
    .param p1, "nid"    # I
    .param p2, "title"    # Ljava/lang/String;
    .param p3, "text"    # Ljava/lang/String;
    .param p4, "seconds"    # I

    .prologue
    .line 127
    const-string v0, "activity"

    const-string v1, "createNotification"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 128
    invoke-static {p0, p1, p2, p3, p4}, Lcom/miniclip/cartownstreets/BootReceiver;->setupAlarm(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;I)V

    .line 129
    return-void
.end method

.method protected getAppId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 79
    const-string v0, ""

    return-object v0
.end method

.method protected getFullAppURI()Ljava/lang/String;
    .locals 1

    .prologue
    .line 93
    const-string v0, "market://details?id=com.miniclip.cartownstreets"

    return-object v0
.end method

.method protected getFullVersionGameImageId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 97
    const-string v0, "buynow_v2"

    return-object v0
.end method

.method public getGooglePlayPublicKey()Ljava/lang/String;
    .locals 1

    .prologue
    .line 46
    const-string v0, "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAmOLtspNLA93iOvbgW0vUZM92hXUd+6zvzKLDTB20i0WQ8Gk/+uGBrec6ZtPOqR59gmRrfvQa0fjvCb559mc3TCAPwJaP9xOeYFGIKRsQkKn/oUPNggMhKlRbh8/wByhGvw53dc9xRU03+RuyfoStf6OIC2nqUhbTKvRDeDalKs3eSuoPd/rwvmRfQBLABEyywZ5pcBMISpFBlOF8cAMS1NcJY4kb+tfNbKfy9sarBmhT5teKRCdEJ7fiqY9PR35VOHYsiXnS0/vkB0kE1pdPiHqIaVsml6/9q+Oypp6Xo6i82fPWqGM0sauPQlzSDbLj3DnAht40MYZf7qeLmnpuyQIDAQAB"

    return-object v0
.end method

.method protected getInAppSkus()[Ljava/lang/String;
    .locals 3

    .prologue
    .line 51
    const/16 v0, 0xf

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "com.miniclip.coins15k"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "com.miniclip.coins40k"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "com.miniclip.coins90k"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "com.miniclip.coins225k"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "com.miniclip.coins500000"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "com.miniclip.cash130"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "com.miniclip.cash275"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "com.miniclip.cash700"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "com.miniclip.cash1500"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string v2, "com.miniclip.cash3750"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string v2, "com.miniclip.parts300"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-string v2, "com.miniclip.parts875"

    aput-object v2, v0, v1

    const/16 v1, 0xc

    const-string v2, "com.miniclip.parts1800"

    aput-object v2, v0, v1

    const/16 v1, 0xd

    const-string v2, "com.miniclip.parts4500"

    aput-object v2, v0, v1

    const/16 v1, 0xe

    const-string v2, "com.miniclip.parts10k"

    aput-object v2, v0, v1

    return-object v0
.end method

.method protected getMoPubBannerId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 68
    const-string v0, ""

    return-object v0
.end method

.method protected getMoPubGameplayBannerId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 58
    const-string v0, ""

    return-object v0
.end method

.method protected getMoPubInterstitialId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 73
    const-string v0, ""

    return-object v0
.end method

.method protected getMoPubMenuBannerId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 63
    const-string v0, ""

    return-object v0
.end method

.method protected getSecretKey()Ljava/lang/String;
    .locals 1

    .prologue
    .line 84
    const-string v0, ""

    return-object v0
.end method

.method protected getTapJoyHtmlOffer(Lcom/tapjoy/TapjoyFeaturedAppObject;)Ljava/lang/String;
    .locals 4
    .param p1, "featApObj"    # Lcom/tapjoy/TapjoyFeaturedAppObject;

    .prologue
    .line 101
    const-string v0, "<center><p style=\'font-family:Impact;color:white;font-size:20px;font-name:arial;font-weight:bold\'>Get %s free coins</p><img style=\'display: block;margin-left: auto;margin-right: auto;width:100px;height:100px;\' src=\'%s\' /><p style=\'font-family:Impact;color:white;font-size:20px;font-name:arial\'>%s %s</p></center>"

    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget v3, p1, Lcom/tapjoy/TapjoyFeaturedAppObject;->amount:I

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    iget-object v3, p1, Lcom/tapjoy/TapjoyFeaturedAppObject;->iconURL:Ljava/lang/String;

    aput-object v3, v1, v2

    const/4 v2, 0x2

    iget-object v3, p1, Lcom/tapjoy/TapjoyFeaturedAppObject;->description:Ljava/lang/String;

    aput-object v3, v1, v2

    const/4 v2, 0x3

    iget-object v3, p1, Lcom/tapjoy/TapjoyFeaturedAppObject;->cost:Ljava/lang/String;

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getTapjoyOfferDialogMessage(Lcom/tapjoy/TapjoyFeaturedAppObject;)Ljava/lang/String;
    .locals 4
    .param p1, "featuredAppObject"    # Lcom/tapjoy/TapjoyFeaturedAppObject;

    .prologue
    .line 120
    const-string v0, "Download and run this app for %d free coins:\n%s"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget v3, p1, Lcom/tapjoy/TapjoyFeaturedAppObject;->amount:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

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
    .line 114
    const-string v0, ""

    return-object v0
.end method

.method public logCustomEvent(Ljava/lang/String;Ljava/lang/String;)V
    .locals 9
    .param p1, "eventId"    # Ljava/lang/String;
    .param p2, "jsonString"    # Ljava/lang/String;

    .prologue
    .line 270
    const-string v5, "cocojava"

    const-string v6, "logCustomEvent %s %s"

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object p1, v7, v8

    const/4 v8, 0x1

    aput-object p2, v7, v8

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 272
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 273
    .local v1, "json":Lorg/json/JSONObject;
    invoke-static {p1, v1}, Lcom/apsalar/sdk/Apsalar;->eventJSON(Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 275
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 276
    .local v4, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-virtual {v1}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v3

    .line 277
    .local v3, "keys":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 278
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 279
    .local v2, "key":Ljava/lang/String;
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v2, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 286
    .end local v1    # "json":Lorg/json/JSONObject;
    .end local v2    # "key":Ljava/lang/String;
    .end local v3    # "keys":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    .end local v4    # "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :catch_0
    move-exception v0

    .line 287
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    .line 289
    .end local v0    # "e":Lorg/json/JSONException;
    :goto_1
    return-void

    .line 281
    .restart local v1    # "json":Lorg/json/JSONObject;
    .restart local v3    # "keys":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    .restart local v4    # "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_0
    :try_start_1
    invoke-static {p1, v4}, Lcom/flurry/android/FlurryAgent;->logEvent(Ljava/lang/String;Ljava/util/Map;)V

    .line 285
    const-string v5, "cocojava"

    const-string v6, "logCustomEvent Success"

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 3
    .param p1, "requestCode"    # I
    .param p2, "responseCode"    # I
    .param p3, "intent"    # Landroid/content/Intent;

    .prologue
    .line 400
    const-string v0, "activity"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onActivityResult.................., req "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " response "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 402
    invoke-super {p0, p1, p2, p3}, Lcom/miniclip/nativeJNI/InAppActivity;->onActivityResult(IILandroid/content/Intent;)V

    .line 404
    sget-object v0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->gPlay:Lcom/miniclip/GooglePlayServices/GooglePlayServices;

    invoke-virtual {v0, p1, p2, p3}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->onActivityResult(IILandroid/content/Intent;)V

    .line 407
    return-void
.end method

.method public onBackPressed()V
    .locals 1

    .prologue
    .line 337
    invoke-static {}, Lcom/miniclip/Chartboost/Chartboost;->onBackPressed()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 341
    :goto_0
    return-void

    .line 340
    :cond_0
    invoke-super {p0}, Lcom/miniclip/nativeJNI/InAppActivity;->onBackPressed()V

    goto :goto_0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 10
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v5, 0x0

    const/4 v6, 0x1

    .line 143
    sput-boolean v5, Lcom/miniclip/cartownstreets/CarTownStreetsActivity;->mUSE_TAPJOY:Z

    .line 144
    sput-boolean v6, Lcom/miniclip/cartownstreets/CarTownStreetsActivity;->mHAS_RETINA:Z

    .line 145
    sput-boolean v6, Lcom/miniclip/cartownstreets/CarTownStreetsActivity;->mUSE_C2DM:Z

    .line 146
    sput-boolean v6, Lcom/miniclip/cartownstreets/CarTownStreetsActivity;->mSPINNING_ANIMATION:Z

    .line 147
    sput-boolean v6, Lcom/miniclip/cartownstreets/CarTownStreetsActivity;->mUSE_FACEBOOK:Z

    .line 149
    invoke-static {p0}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->Setup(Landroid/app/Activity;)V

    .line 156
    invoke-super {p0, p1}, Lcom/miniclip/nativeJNI/InAppActivity;->onCreate(Landroid/os/Bundle;)V

    .line 158
    const-string v7, "RUN_BEFORE"

    invoke-static {v7}, Lcom/miniclip/cartownstreets/CarTownStreetsActivity;->SharedPreferences_getInt(Ljava/lang/String;)I

    move-result v4

    .line 159
    .local v4, "runBefore":I
    if-nez v4, :cond_2

    move v1, v5

    .line 162
    .local v1, "isupdate":Z
    :goto_0
    const-string v7, "RUN_BEFORE"

    invoke-static {v7, v6}, Lcom/miniclip/cartownstreets/CarTownStreetsActivity;->SharedPreferences_setInt(Ljava/lang/String;I)V

    .line 165
    const-string v7, "miniclip"

    const-string v8, "pvrJP5Py"

    invoke-static {p0, v7, v8}, Lcom/apsalar/sdk/Apsalar;->startSession(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 169
    const-string v7, "RSQ9MMVDS4KQKHW4RN2F"

    invoke-static {p0, v7}, Lcom/flurry/android/FlurryAgent;->onStartSession(Landroid/content/Context;Ljava/lang/String;)V

    .line 171
    sput-boolean v6, Lcom/miniclip/cartownstreets/CarTownStreetsActivity;->mINGAME_LANDSCAPE:Z

    .line 172
    sput-boolean v6, Lcom/miniclip/cartownstreets/CarTownStreetsActivity;->mSHOW_KEYBOARD_INPUT:Z

    .line 173
    sput-boolean v6, Lcom/miniclip/cartownstreets/CarTownStreetsActivity;->mKEYBOARD_INPUT_SINGLE_LINE:Z

    .line 174
    sput-boolean v5, Lcom/miniclip/cartownstreets/CarTownStreetsActivity;->mKEYBOARD_FULLSCREEN:Z

    .line 175
    sput-boolean v6, Lcom/miniclip/cartownstreets/CarTownStreetsActivity;->mSTORE_PENDING_PURCHASES_SIGNATURE:Z

    .line 177
    invoke-virtual {p0}, Lcom/miniclip/cartownstreets/CarTownStreetsActivity;->getWindow()Landroid/view/Window;

    move-result-object v7

    const/16 v8, 0x80

    invoke-virtual {v7, v8}, Landroid/view/Window;->addFlags(I)V

    .line 179
    invoke-virtual {p0}, Lcom/miniclip/cartownstreets/CarTownStreetsActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    invoke-virtual {v7}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v7

    iget v7, v7, Landroid/util/DisplayMetrics;->heightPixels:I

    const/16 v8, 0x1e0

    if-ge v7, v8, :cond_0

    .line 180
    sput-boolean v6, Lcom/miniclip/cartownstreets/CarTownStreetsActivity;->mMinimumResolutionSD:Z

    .line 182
    :cond_0
    sput-boolean v5, Lcom/miniclip/cartownstreets/CarTownStreetsActivity;->mUSE_ADS:Z

    .line 184
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v6, 0x9

    if-lt v5, v6, :cond_1

    .line 185
    const/4 v5, 0x6

    invoke-virtual {p0, v5}, Lcom/miniclip/cartownstreets/CarTownStreetsActivity;->setRequestedOrientation(I)V

    .line 213
    :cond_1
    const-string v5, "52308a3916ba479948000000"

    const-string v6, "9464551ce5ceebf76f181c0eb4f0905078e1cfbe"

    invoke-static {p0, v5, v6}, Lcom/miniclip/Chartboost/Chartboost;->onCreate(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    .line 215
    new-instance v3, Ljava/util/Hashtable;

    invoke-direct {v3}, Ljava/util/Hashtable;-><init>()V

    .line 217
    .local v3, "items":Ljava/util/Hashtable;, "Ljava/util/Hashtable<Ljava/lang/String;Ljava/lang/Integer;>;"
    invoke-virtual {p0}, Lcom/miniclip/cartownstreets/CarTownStreetsActivity;->getInAppSkus()[Ljava/lang/String;

    move-result-object v2

    .line 219
    .local v2, "itemIDs":[Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v5, v2

    if-ge v0, v5, :cond_3

    .line 220
    aget-object v5, v2, v0

    sget-object v6, Lcom/miniclip/cartownstreets/CarTownStreetsActivity;->mPrices:[D

    aget-wide v6, v6, v0

    const-wide v8, 0x4051800000000000L    # 70.0

    mul-double/2addr v6, v8

    double-to-int v6, v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v3, v5, v6}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 219
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .end local v0    # "i":I
    .end local v1    # "isupdate":Z
    .end local v2    # "itemIDs":[Ljava/lang/String;
    .end local v3    # "items":Ljava/util/Hashtable;, "Ljava/util/Hashtable<Ljava/lang/String;Ljava/lang/Integer;>;"
    :cond_2
    move v1, v6

    .line 159
    goto :goto_0

    .line 251
    .restart local v0    # "i":I
    .restart local v1    # "isupdate":Z
    .restart local v2    # "itemIDs":[Ljava/lang/String;
    .restart local v3    # "items":Ljava/util/Hashtable;, "Ljava/util/Hashtable<Ljava/lang/String;Ljava/lang/Integer;>;"
    :cond_3
    return-void
.end method

.method protected onDestroy()V
    .locals 0

    .prologue
    .line 326
    invoke-super {p0}, Lcom/miniclip/nativeJNI/InAppActivity;->onDestroy()V

    .line 328
    invoke-static {}, Lcom/miniclip/Chartboost/Chartboost;->onDestroy()V

    .line 331
    return-void
.end method

.method public onGetJarInAppPurchase(Ljava/lang/String;ILjava/lang/String;III)V
    .locals 3
    .param p1, "itemID"    # Ljava/lang/String;
    .param p2, "managed"    # I
    .param p3, "title"    # Ljava/lang/String;
    .param p4, "callback"    # I
    .param p5, "self"    # I
    .param p6, "showDialog"    # I

    .prologue
    const/4 v0, 0x1

    .line 349
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "onGetJarInAppPurchase"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 351
    sput p4, Lcom/miniclip/cartownstreets/CarTownStreetsActivity;->mInAppCallback:I

    .line 352
    sput p5, Lcom/miniclip/cartownstreets/CarTownStreetsActivity;->mInAppSelf:I

    .line 353
    sput-object p1, Lcom/miniclip/cartownstreets/CarTownStreetsActivity;->mInAppProductId:Ljava/lang/String;

    .line 354
    if-ne p2, v0, :cond_0

    :goto_0
    sput-boolean v0, Lcom/miniclip/cartownstreets/CarTownStreetsActivity;->mInAppManaged:Z

    .line 355
    sput-object p3, Lcom/miniclip/cartownstreets/CarTownStreetsActivity;->mInAppTitle:Ljava/lang/String;

    .line 356
    return-void

    .line 354
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onSignInFailed()V
    .locals 0

    .prologue
    .line 388
    return-void
.end method

.method public onSignInSucceeded()V
    .locals 0

    .prologue
    .line 394
    return-void
.end method

.method public onStart()V
    .locals 3

    .prologue
    .line 293
    invoke-super {p0}, Lcom/miniclip/nativeJNI/InAppActivity;->onStart()V

    .line 295
    invoke-static {}, Lcom/miniclip/Chartboost/Chartboost;->onStart()V

    .line 296
    sget-object v1, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->gPlay:Lcom/miniclip/GooglePlayServices/GooglePlayServices;

    invoke-virtual {v1}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->onStart()V

    .line 298
    const-string v1, "wifi"

    invoke-virtual {p0, v1}, Lcom/miniclip/cartownstreets/CarTownStreetsActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/wifi/WifiManager;

    .line 299
    .local v0, "wm":Landroid/net/wifi/WifiManager;
    const/4 v1, 0x1

    const-string v2, "EBPWifiLock"

    invoke-virtual {v0, v1, v2}, Landroid/net/wifi/WifiManager;->createWifiLock(ILjava/lang/String;)Landroid/net/wifi/WifiManager$WifiLock;

    move-result-object v1

    iput-object v1, p0, Lcom/miniclip/cartownstreets/CarTownStreetsActivity;->mWifiLock:Landroid/net/wifi/WifiManager$WifiLock;

    .line 300
    iget-object v1, p0, Lcom/miniclip/cartownstreets/CarTownStreetsActivity;->mWifiLock:Landroid/net/wifi/WifiManager$WifiLock;

    invoke-virtual {v1}, Landroid/net/wifi/WifiManager$WifiLock;->isHeld()Z

    move-result v1

    if-nez v1, :cond_0

    .line 301
    iget-object v1, p0, Lcom/miniclip/cartownstreets/CarTownStreetsActivity;->mWifiLock:Landroid/net/wifi/WifiManager$WifiLock;

    invoke-virtual {v1}, Landroid/net/wifi/WifiManager$WifiLock;->acquire()V

    .line 303
    :cond_0
    const-string v1, "CarTownStreetsActivity"

    const-string v2, "WifiLock acquired!"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 305
    invoke-static {p0}, Lcom/google/analytics/tracking/android/EasyTracker;->getInstance(Landroid/content/Context;)Lcom/google/analytics/tracking/android/EasyTracker;

    move-result-object v1

    invoke-virtual {v1, p0}, Lcom/google/analytics/tracking/android/EasyTracker;->activityStart(Landroid/app/Activity;)V

    .line 306
    return-void
.end method

.method public onStop()V
    .locals 2

    .prologue
    .line 310
    invoke-super {p0}, Lcom/miniclip/nativeJNI/InAppActivity;->onStop()V

    .line 311
    invoke-static {}, Lcom/miniclip/Chartboost/Chartboost;->onStop()V

    .line 312
    sget-object v0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->gPlay:Lcom/miniclip/GooglePlayServices/GooglePlayServices;

    invoke-virtual {v0}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->onStop()V

    .line 314
    invoke-static {p0}, Lcom/google/analytics/tracking/android/EasyTracker;->getInstance(Landroid/content/Context;)Lcom/google/analytics/tracking/android/EasyTracker;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/google/analytics/tracking/android/EasyTracker;->activityStop(Landroid/app/Activity;)V

    .line 316
    iget-object v0, p0, Lcom/miniclip/cartownstreets/CarTownStreetsActivity;->mWifiLock:Landroid/net/wifi/WifiManager$WifiLock;

    if-eqz v0, :cond_0

    .line 317
    iget-object v0, p0, Lcom/miniclip/cartownstreets/CarTownStreetsActivity;->mWifiLock:Landroid/net/wifi/WifiManager$WifiLock;

    invoke-virtual {v0}, Landroid/net/wifi/WifiManager$WifiLock;->isHeld()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 318
    iget-object v0, p0, Lcom/miniclip/cartownstreets/CarTownStreetsActivity;->mWifiLock:Landroid/net/wifi/WifiManager$WifiLock;

    invoke-virtual {v0}, Landroid/net/wifi/WifiManager$WifiLock;->release()V

    .line 319
    const-string v0, "CarTownStreetsActivity"

    const-string v1, "WiFi Lock released!"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 322
    :cond_0
    return-void
.end method

.method public sendAdXEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "event"    # Ljava/lang/String;
    .param p2, "price"    # Ljava/lang/String;
    .param p3, "currency"    # Ljava/lang/String;

    .prologue
    .line 382
    return-void
.end method

.method public sendAdxPurchaseImpl(Ljava/lang/String;I)V
    .locals 5
    .param p1, "productId"    # Ljava/lang/String;
    .param p2, "purchaseType"    # I

    .prologue
    .line 360
    invoke-virtual {p0}, Lcom/miniclip/cartownstreets/CarTownStreetsActivity;->getInAppSkus()[Ljava/lang/String;

    move-result-object v1

    .line 361
    .local v1, "itemIDs":[Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v2, v1

    if-ge v0, v2, :cond_0

    .line 362
    aget-object v2, v1, v0

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 363
    if-nez p2, :cond_1

    const-string v2, "SaleGetJar"

    :goto_1
    sget-object v3, Lcom/miniclip/cartownstreets/CarTownStreetsActivity;->mPrices:[D

    aget-wide v3, v3, v0

    invoke-static {v3, v4}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v3

    const-string v4, "USD"

    invoke-virtual {p0, v2, v3, v4}, Lcom/miniclip/cartownstreets/CarTownStreetsActivity;->sendAdXEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 367
    :cond_0
    return-void

    .line 363
    :cond_1
    const-string v2, "Sale"

    goto :goto_1

    .line 361
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method protected showMiniclipViewInternal()V
    .locals 1

    .prologue
    .line 255
    sget v0, Lcom/miniclip/cartownstreets/CarTownStreetsActivity;->mLastBigAdType:I

    if-eqz v0, :cond_0

    .line 256
    invoke-virtual {p0}, Lcom/miniclip/cartownstreets/CarTownStreetsActivity;->showUpSellDialogInternal()V

    .line 257
    :cond_0
    return-void
.end method

.method protected showUpSellDialogInternal()V
    .locals 2

    .prologue
    .line 261
    sget-object v0, Lcom/miniclip/cartownstreets/CarTownStreetsActivity;->mGLView:Lcom/miniclip/nativeJNI/ClearGLSurfaceView;

    new-instance v1, Lcom/miniclip/cartownstreets/CarTownStreetsActivity$1;

    invoke-direct {v1, p0}, Lcom/miniclip/cartownstreets/CarTownStreetsActivity$1;-><init>(Lcom/miniclip/cartownstreets/CarTownStreetsActivity;)V

    invoke-virtual {v0, v1}, Lcom/miniclip/nativeJNI/ClearGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    .line 267
    return-void
.end method
