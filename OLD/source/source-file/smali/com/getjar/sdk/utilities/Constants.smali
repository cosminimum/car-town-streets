.class public Lcom/getjar/sdk/utilities/Constants;
.super Ljava/lang/Object;
.source "Constants.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/getjar/sdk/utilities/Constants$1;,
        Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;,
        Lcom/getjar/sdk/utilities/Constants$RequestInstallState;,
        Lcom/getjar/sdk/utilities/Constants$RequestInstallType;,
        Lcom/getjar/sdk/utilities/Constants$AppState;,
        Lcom/getjar/sdk/utilities/Constants$PurchaseState;,
        Lcom/getjar/sdk/utilities/Constants$ResponseCode;
    }
.end annotation


# static fields
.field public static final ACTION_CONFIRM_NOTIFICATION:Ljava/lang/String; = "com.getjar.sdk.CONFIRM_NOTIFICATION"

.field public static final ACTION_GET_PURCHASE_INFORMATION:Ljava/lang/String; = "com.getjar.sdk.GET_PURCHASE_INFORMATION"

.field public static final ACTION_NOTIFY:Ljava/lang/String; = "com.android.vending.billing.IN_APP_NOTIFY"

.field public static final ACTION_NOTIFY_BUY_GOLD:Ljava/lang/String; = "com.getjar.sdk.NOTIFY_BUY_GOLD"

.field public static final ACTION_PURCHASE_STATE_CHANGED:Ljava/lang/String; = "com.android.vending.billing.PURCHASE_STATE_CHANGED"

.field public static final ACTION_RESPONSE_CODE:Ljava/lang/String; = "com.android.vending.billing.RESPONSE_CODE"

.field public static final ACTION_RESTORE_TRANSACTIONS:Ljava/lang/String; = "com.getjar.sdk.RESTORE_TRANSACTIONS"

.field public static final ALREADY_REDEEMED_FAILURE:Ljava/lang/String; = "ALREADY_REDEEMED_FAILURE"

.field public static final ALREADY_USED_FAILURE:Ljava/lang/String; = "ALREADY_USED_FAILURE"

.field public static final APP_COST:Ljava/lang/String; = "price"

.field public static final APP_ID:Ljava/lang/String; = "id"

.field public static final APP_NAME:Ljava/lang/String; = "name"

.field public static final AUTH_TOKEN_KEY:Ljava/lang/String; = "override.header.Authorization"

.field public static final AVAILABLE_RESOLUTION:Ljava/lang/String; = "available_resolution"

.field public static AllowedLocales:Ljava/util/List; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final BILLING_API3_SUPPORTED_PREFS:Ljava/lang/String; = "billing_api3_supported"

.field public static final BILLING_FAILURE_REASON:Ljava/lang/String; = "FAILURE_REASON"

.field public static final BILLING_PUBLIC_KEY:Ljava/lang/String; = "BILLING_PUBLIC_KEY"

.field public static final BILLING_REQUEST_API_VERSION:Ljava/lang/String; = "API_VERSION"

.field public static final BILLING_REQUEST_DEVELOPER_PAYLOAD:Ljava/lang/String; = "DEVELOPER_PAYLOAD"

.field public static final BILLING_REQUEST_ITEM_ID:Ljava/lang/String; = "ITEM_ID"

.field public static final BILLING_REQUEST_METHOD:Ljava/lang/String; = "BILLING_REQUEST"

.field public static final BILLING_REQUEST_NONCE:Ljava/lang/String; = "NONCE"

.field public static final BILLING_REQUEST_NOTIFY_IDS:Ljava/lang/String; = "NOTIFY_IDS"

.field public static final BILLING_REQUEST_PACKAGE_NAME:Ljava/lang/String; = "PACKAGE_NAME"

.field public static BILLING_RESPONSE_INVALID_REQUEST_ID:J = 0x0L

.field public static final BILLING_RESPONSE_PURCHASE_INTENT:Ljava/lang/String; = "PURCHASE_INTENT"

.field public static final BILLING_RESPONSE_REQUEST_ID:Ljava/lang/String; = "REQUEST_ID"

.field public static final BILLING_RESPONSE_RESPONSE_CODE:Ljava/lang/String; = "RESPONSE_CODE"

.field public static BILLING_RESPONSE_VALID_REQUEST_ID:J = 0x0L

.field public static final BILLING_SUPPORTED_PREFS:Ljava/lang/String; = "billing_supported"

.field public static final BUYING_GOLD_PAYLOAD_PREFIX:Ljava/lang/String; = "db8ecd00-3db5-11e2-a25f-0800200c9a66"

.field public static final BUY_CURRENCY_CURRENCY:Ljava/lang/String; = "order.currency"

.field public static final BUY_CURRENCY_GOLD_VALUE:Ljava/lang/String; = "order.gold_value"

.field public static final BUY_CURRENCY_MARKETPLACE_ITEM_ID:Ljava/lang/String; = "marketplace_item_id"

.field public static final BUY_CURRENCY_NOTIFICATION_ID:Ljava/lang/String; = "order.google_play.notification_id"

.field public static final BUY_CURRENCY_PRICE:Ljava/lang/String; = "order.price"

.field public static final BUY_CURRENCY_PURCHASE_STATE:Ljava/lang/String; = "order.google_play.purchase_state"

.field public static final CAP_REACHED_FAILURE:Ljava/lang/String; = "CAP_REACHED_FAILURE"

.field public static final CLOSE:I = 0x0

.field public static final DEFAULT_ERROR_PAGE:Ljava/lang/String; = "file:///android_asset/errorMessage.html"

.field public static final DEFAULT_LANGUAGE:Ljava/lang/String; = "en-us"

.field public static final DISMISS:I = 0x1

.field public static final EXTRA_AUTH_WITH_UI_ID:Ljava/lang/String; = "auth.with.ui.id"

.field public static final EXTRA_DEVELOPER_PAYLOAD:Ljava/lang/String; = "com.getjar.sdk.developer_payload"

.field public static final EXTRA_GETJAR_NOTIFICATION:Ljava/lang/String; = "GETJAR_NOTIFICATION"

.field public static final EXTRA_KEY_INDEX:Ljava/lang/String; = "com.getjar.sdk.key_index"

.field public static final EXTRA_TITLE:Ljava/lang/String; = "theTitle"

.field public static final EXTRA_USER_AUTH:Ljava/lang/String; = "com.getjar.sdk.rewards.GetJarUserAuthSubActivity"

.field public static final EXTRA_WEBVIEW:Ljava/lang/String; = "com.getjar.sdk.rewards.GetJarWebViewSubActivity"

.field public static final FAIL_NETWORK:I = 0x2

.field public static final FAIL_SERVICE:I = 0x3

.field public static final GETJAR_CONTEXT_ID_KEY:Ljava/lang/String; = "getjarContextId"

.field public static final GOOGLE_PLAY_SIGNATURE:Ljava/lang/String; = "order.google_play.signature"

.field public static final GOOGLE_PLAY_SIGNED_DATA:Ljava/lang/String; = "order.google_play.signed_data"

.field public static final GREENJAR_PACKAGE:Ljava/lang/String; = "com.getjar.rewards"

.field public static final HEIGHT:Ljava/lang/String; = "height"

.field public static final INAPP_LOCALIZED_PRICES:Ljava/lang/String; = "localized_prices"

.field public static final INAPP_REQUEST_ID:Ljava/lang/String; = "request_id"

.field public static final INAPP_RESPONSE_CODE:Ljava/lang/String; = "response_code"

.field public static final INAPP_SIGNATURE:Ljava/lang/String; = "inapp_signature"

.field public static final INAPP_SIGNED_DATA:Ljava/lang/String; = "inapp_signed_data"

.field public static final KEY_LANGUAGE:Ljava/lang/String; = "lang"

.field public static final LANDSCAPE:Ljava/lang/String; = "landscape"

.field public static final LICENSES_PER_RETRIEVE_REQUEST:I = 0x32

.field public static final LICENSE_FAIL_SAFE_TTL:J = 0x5265c00L

.field public static final LICENSE_IGNORE_REQUEST_INTERVAL:J = 0x12cL

.field public static final LICENSE_REFRESH_INTERVAL:J = 0x15180L

.field public static final LICENSE_RESERVE_ID:Ljava/lang/String; = "reserved_license_id"

.field public static final LOCALIZATION_FAIL_SAFE_TTL:J = 0x5265c00L

.field public static final MARKETPLACE:Ljava/lang/String; = "marketplace"

.field public static final MARKETPLACE_DISPLAY_AMOUNT:Ljava/lang/String; = "display_amount"

.field public static final MARKETPLACE_PRODUCT_ID:Ljava/lang/String; = "marketplace_product_id"

.field public static final MARKET_BILLING_SERVICE_ACTION:Ljava/lang/String; = "com.android.vending.billing.MarketBillingService.BIND"

.field public static final META_APP_SESSION_ID:Ljava/lang/String; = "business.event.app.session_id"

.field public static final META_CLIENT_APP_TOKEN:Ljava/lang/String; = "client_app.token"

.field public static final META_DEVICE_PLATFORM:Ljava/lang/String; = "device.platform"

.field public static final META_DEVICE_PLATFORM_ANDROID:Ljava/lang/String; = "android"

.field public static final META_DEVICE_PLATFORM_VERSION:Ljava/lang/String; = "device.platform_version"

.field public static final META_EVENT_REASON:Ljava/lang/String; = "business.event.reason"

.field public static final META_EVENT_REASON_DETAILS:Ljava/lang/String; = "business.event.reason_details"

.field public static final META_EVENT_TIMESTAMP:Ljava/lang/String; = "business.event.timestamp"

.field public static final META_EVENT_TYPE:Ljava/lang/String; = "business.event.type"

.field public static final META_ITEM_ID:Ljava/lang/String; = "app.id"

.field public static final META_LEGACY_UA:Ljava/lang/String; = "legacy.device.user_agent"

.field public static final META_PACKAGE_NAME:Ljava/lang/String; = "android.package.name"

.field public static final META_PACKAGE_VERSION_CODE:Ljava/lang/String; = "android.package.version_code"

.field public static final META_PACKAGE_VERSION_NAME:Ljava/lang/String; = "android.package.version_name"

.field public static final META_PHONE_SESSION_ID:Ljava/lang/String; = "business.event.phone.session_id"

.field public static final NOTIFICATION_BILLING_FAILED_SDK:Ljava/lang/String; = "Gold purchase successful, your balance will be updated shortly. Thanks for your patience!"

.field public static final NOTIFICATION_BILLING_SUCCESS:Ljava/lang/String; = "%s Gold added to your balance!"

.field public static final NOTIFICATION_BILLING_UNAUTHORIZED:Ljava/lang/String; = "Your Google purchase could not be verified by Getjar."

.field public static final NOTIFICATION_FAIL_CAP_REACHED:Ljava/lang/String; = "Thank you for installing %1$s. You must spend gold before you can earn more."

.field public static final NOTIFICATION_FAIL_REDEEMED:Ljava/lang/String; = "Thank you for installing %1$s again. No gold was earned."

.field public static final NOTIFICATION_FAIL_SUBMISSION:Ljava/lang/String; = "Thank you for installing %1$s! No gold was earned."

.field public static final NOTIFICATION_ID:Ljava/lang/String; = "notification_id"

.field public static final NOTIFICATION_PASS:Ljava/lang/String; = "You\'ve earned %1$d Gold!"

.field public static final NOTIFICATION_PASS_POST_RETRY_ADDENDUM:Ljava/lang/String; = "Thanks for your patience!"

.field public static final NOTIFICATION_PASS_WITH_APP_NAME:Ljava/lang/String; = "%1$d Gold earned via %2$s!"

.field protected static final PICON_LOCATION:Ljava/lang/String; = "/getjar/picons/"

.field public static final PLATFORM:Ljava/lang/String; = "android"

.field public static final PORTRAIT:Ljava/lang/String; = "portrait"

.field public static final PRODUCT_LIST:Ljava/lang/String; = "productList"

.field public static final PURCHASE_FAIL:I = 0x6

.field public static final PURCHASE_SUCCESS:I = 0x5

.field public static final PreferencesFileName:Ljava/lang/String; = "GetJarClientPrefs"

.field public static final RELOAD:I = 0x4

.field public static final SCREEN_DPI:Ljava/lang/String; = "screen_dpi"

.field public static final SCREEN_DPI_HEIGHT:Ljava/lang/String; = "device.screen_dpi.height"

.field public static final SCREEN_DPI_WIDTH:Ljava/lang/String; = "device.screen_dpi.width"

.field public static final SCREEN_RESOLUTION:Ljava/lang/String; = "screen_resolution"

.field public static final SCREEN_RESOLUTION_HEIGHT:Ljava/lang/String; = "device.screen_resolution.height"

.field public static final SCREEN_RESOLUTION_WIDTH:Ljava/lang/String; = "device.screen_resolution.width"

.field public static final SCREEN_SIZE:Ljava/lang/String; = "screen_size"

.field public static final SDK_URL:Ljava/lang/String; = "sdkUrl"

.field public static final SERVICE_REQUEST_COMPRESS:Z = false

.field public static final SERVICE_REQUEST_UNCOMPRESSED_LIMIT:I = 0x100

.field public static final SET_AUTH_TOKEN:I = 0x9

.field public static final SIGNATURE_CIPHER:Ljava/lang/String; = "RSA/ECB/PKCS1Padding"

.field public static final SIGNATURE_DIGEST:Ljava/lang/String; = "SHA1"

.field public static final SIMPLE_RELOAD:I = 0xa

.field public static final TIMESTAMP:Ljava/lang/String; = "timestamp"

.field public static final TRACKING_USER_ACCESS_ID:Ljava/lang/String; = "user.user_access_id"

.field public static final TRANSACTIONTIME:Ljava/lang/String; = "transactiontimestamp"

.field public static final TRANSACTION_ID:Ljava/lang/String; = "transactionId"

.field public static final USER_AGENT_APP:Ljava/lang/String; = "GetJarSDK"

.field public static final USER_AGENT_UNKOWN_APP:Ljava/lang/String; = "unknown/0000"

.field public static final WAIT_DIALOG_MSG:Ljava/lang/String; = "Please wait..."

.field public static final WEB_LAST_KNOWN:Ljava/lang/String; = "web.last.known"

.field public static final WEB_TIMESTAMP:Ljava/lang/String; = "web.timestamp"

.field public static final WIDTH:Ljava/lang/String; = "width"

.field public static final X:Ljava/lang/String; = "x"

.field public static final Y:Ljava/lang/String; = "y"


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 69
    const/16 v0, 0x10

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "en_us"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "zh_cn"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "zh_tw"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "fr_fr"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "it_it"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "de_de"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "id_id"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "pt_br"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "es_es"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string v2, "es_us"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string v2, "tr_tr"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-string v2, "vi_vn"

    aput-object v2, v0, v1

    const/16 v1, 0xc

    const-string v2, "ru_ru"

    aput-object v2, v0, v1

    const/16 v1, 0xd

    const-string v2, "lt_lt"

    aput-object v2, v0, v1

    const/16 v1, 0xe

    const-string v2, "ko_kr"

    aput-object v2, v0, v1

    const/16 v1, 0xf

    const-string v2, "ja_jp"

    aput-object v2, v0, v1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lcom/getjar/sdk/utilities/Constants;->AllowedLocales:Ljava/util/List;

    .line 191
    const-wide/16 v0, -0x1

    sput-wide v0, Lcom/getjar/sdk/utilities/Constants;->BILLING_RESPONSE_INVALID_REQUEST_ID:J

    .line 192
    const-wide/16 v0, 0x1

    sput-wide v0, Lcom/getjar/sdk/utilities/Constants;->BILLING_RESPONSE_VALID_REQUEST_ID:J

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 315
    return-void
.end method
