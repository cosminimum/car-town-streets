package com.getjar.sdk.utilities;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;
/* loaded from: classes.dex */
public class Constants {
    public static final String ACTION_CONFIRM_NOTIFICATION = "com.getjar.sdk.CONFIRM_NOTIFICATION";
    public static final String ACTION_GET_PURCHASE_INFORMATION = "com.getjar.sdk.GET_PURCHASE_INFORMATION";
    public static final String ACTION_NOTIFY = "com.android.vending.billing.IN_APP_NOTIFY";
    public static final String ACTION_NOTIFY_BUY_GOLD = "com.getjar.sdk.NOTIFY_BUY_GOLD";
    public static final String ACTION_PURCHASE_STATE_CHANGED = "com.android.vending.billing.PURCHASE_STATE_CHANGED";
    public static final String ACTION_RESPONSE_CODE = "com.android.vending.billing.RESPONSE_CODE";
    public static final String ACTION_RESTORE_TRANSACTIONS = "com.getjar.sdk.RESTORE_TRANSACTIONS";
    public static final String ALREADY_REDEEMED_FAILURE = "ALREADY_REDEEMED_FAILURE";
    public static final String ALREADY_USED_FAILURE = "ALREADY_USED_FAILURE";
    public static final String APP_COST = "price";
    public static final String APP_ID = "id";
    public static final String APP_NAME = "name";
    public static final String AUTH_TOKEN_KEY = "override.header.Authorization";
    public static final String AVAILABLE_RESOLUTION = "available_resolution";
    public static final String BILLING_API3_SUPPORTED_PREFS = "billing_api3_supported";
    public static final String BILLING_FAILURE_REASON = "FAILURE_REASON";
    public static final String BILLING_PUBLIC_KEY = "BILLING_PUBLIC_KEY";
    public static final String BILLING_REQUEST_API_VERSION = "API_VERSION";
    public static final String BILLING_REQUEST_DEVELOPER_PAYLOAD = "DEVELOPER_PAYLOAD";
    public static final String BILLING_REQUEST_ITEM_ID = "ITEM_ID";
    public static final String BILLING_REQUEST_METHOD = "BILLING_REQUEST";
    public static final String BILLING_REQUEST_NONCE = "NONCE";
    public static final String BILLING_REQUEST_NOTIFY_IDS = "NOTIFY_IDS";
    public static final String BILLING_REQUEST_PACKAGE_NAME = "PACKAGE_NAME";
    public static final String BILLING_RESPONSE_PURCHASE_INTENT = "PURCHASE_INTENT";
    public static final String BILLING_RESPONSE_REQUEST_ID = "REQUEST_ID";
    public static final String BILLING_RESPONSE_RESPONSE_CODE = "RESPONSE_CODE";
    public static final String BILLING_SUPPORTED_PREFS = "billing_supported";
    public static final String BUYING_GOLD_PAYLOAD_PREFIX = "db8ecd00-3db5-11e2-a25f-0800200c9a66";
    public static final String BUY_CURRENCY_CURRENCY = "order.currency";
    public static final String BUY_CURRENCY_GOLD_VALUE = "order.gold_value";
    public static final String BUY_CURRENCY_MARKETPLACE_ITEM_ID = "marketplace_item_id";
    public static final String BUY_CURRENCY_NOTIFICATION_ID = "order.google_play.notification_id";
    public static final String BUY_CURRENCY_PRICE = "order.price";
    public static final String BUY_CURRENCY_PURCHASE_STATE = "order.google_play.purchase_state";
    public static final String CAP_REACHED_FAILURE = "CAP_REACHED_FAILURE";
    public static final int CLOSE = 0;
    public static final String DEFAULT_ERROR_PAGE = "file:///android_asset/errorMessage.html";
    public static final String DEFAULT_LANGUAGE = "en-us";
    public static final int DISMISS = 1;
    public static final String EXTRA_AUTH_WITH_UI_ID = "auth.with.ui.id";
    public static final String EXTRA_DEVELOPER_PAYLOAD = "com.getjar.sdk.developer_payload";
    public static final String EXTRA_GETJAR_NOTIFICATION = "GETJAR_NOTIFICATION";
    public static final String EXTRA_KEY_INDEX = "com.getjar.sdk.key_index";
    public static final String EXTRA_TITLE = "theTitle";
    public static final String EXTRA_USER_AUTH = "com.getjar.sdk.rewards.GetJarUserAuthSubActivity";
    public static final String EXTRA_WEBVIEW = "com.getjar.sdk.rewards.GetJarWebViewSubActivity";
    public static final int FAIL_NETWORK = 2;
    public static final int FAIL_SERVICE = 3;
    public static final String GETJAR_CONTEXT_ID_KEY = "getjarContextId";
    public static final String GOOGLE_PLAY_SIGNATURE = "order.google_play.signature";
    public static final String GOOGLE_PLAY_SIGNED_DATA = "order.google_play.signed_data";
    public static final String GREENJAR_PACKAGE = "com.getjar.rewards";
    public static final String HEIGHT = "height";
    public static final String INAPP_LOCALIZED_PRICES = "localized_prices";
    public static final String INAPP_REQUEST_ID = "request_id";
    public static final String INAPP_RESPONSE_CODE = "response_code";
    public static final String INAPP_SIGNATURE = "inapp_signature";
    public static final String INAPP_SIGNED_DATA = "inapp_signed_data";
    public static final String KEY_LANGUAGE = "lang";
    public static final String LANDSCAPE = "landscape";
    public static final int LICENSES_PER_RETRIEVE_REQUEST = 50;
    public static final long LICENSE_FAIL_SAFE_TTL = 86400000;
    public static final long LICENSE_IGNORE_REQUEST_INTERVAL = 300;
    public static final long LICENSE_REFRESH_INTERVAL = 86400;
    public static final String LICENSE_RESERVE_ID = "reserved_license_id";
    public static final long LOCALIZATION_FAIL_SAFE_TTL = 86400000;
    public static final String MARKETPLACE = "marketplace";
    public static final String MARKETPLACE_DISPLAY_AMOUNT = "display_amount";
    public static final String MARKETPLACE_PRODUCT_ID = "marketplace_product_id";
    public static final String MARKET_BILLING_SERVICE_ACTION = "com.android.vending.billing.MarketBillingService.BIND";
    public static final String META_APP_SESSION_ID = "business.event.app.session_id";
    public static final String META_CLIENT_APP_TOKEN = "client_app.token";
    public static final String META_DEVICE_PLATFORM = "device.platform";
    public static final String META_DEVICE_PLATFORM_ANDROID = "android";
    public static final String META_DEVICE_PLATFORM_VERSION = "device.platform_version";
    public static final String META_EVENT_REASON = "business.event.reason";
    public static final String META_EVENT_REASON_DETAILS = "business.event.reason_details";
    public static final String META_EVENT_TIMESTAMP = "business.event.timestamp";
    public static final String META_EVENT_TYPE = "business.event.type";
    public static final String META_ITEM_ID = "app.id";
    public static final String META_LEGACY_UA = "legacy.device.user_agent";
    public static final String META_PACKAGE_NAME = "android.package.name";
    public static final String META_PACKAGE_VERSION_CODE = "android.package.version_code";
    public static final String META_PACKAGE_VERSION_NAME = "android.package.version_name";
    public static final String META_PHONE_SESSION_ID = "business.event.phone.session_id";
    public static final String NOTIFICATION_BILLING_FAILED_SDK = "Gold purchase successful, your balance will be updated shortly. Thanks for your patience!";
    public static final String NOTIFICATION_BILLING_SUCCESS = "%s Gold added to your balance!";
    public static final String NOTIFICATION_BILLING_UNAUTHORIZED = "Your Google purchase could not be verified by Getjar.";
    public static final String NOTIFICATION_FAIL_CAP_REACHED = "Thank you for installing %1$s. You must spend gold before you can earn more.";
    public static final String NOTIFICATION_FAIL_REDEEMED = "Thank you for installing %1$s again. No gold was earned.";
    public static final String NOTIFICATION_FAIL_SUBMISSION = "Thank you for installing %1$s! No gold was earned.";
    public static final String NOTIFICATION_ID = "notification_id";
    public static final String NOTIFICATION_PASS = "You've earned %1$d Gold!";
    public static final String NOTIFICATION_PASS_POST_RETRY_ADDENDUM = "Thanks for your patience!";
    public static final String NOTIFICATION_PASS_WITH_APP_NAME = "%1$d Gold earned via %2$s!";
    protected static final String PICON_LOCATION = "/getjar/picons/";
    public static final String PLATFORM = "android";
    public static final String PORTRAIT = "portrait";
    public static final String PRODUCT_LIST = "productList";
    public static final int PURCHASE_FAIL = 6;
    public static final int PURCHASE_SUCCESS = 5;
    public static final String PreferencesFileName = "GetJarClientPrefs";
    public static final int RELOAD = 4;
    public static final String SCREEN_DPI = "screen_dpi";
    public static final String SCREEN_DPI_HEIGHT = "device.screen_dpi.height";
    public static final String SCREEN_DPI_WIDTH = "device.screen_dpi.width";
    public static final String SCREEN_RESOLUTION = "screen_resolution";
    public static final String SCREEN_RESOLUTION_HEIGHT = "device.screen_resolution.height";
    public static final String SCREEN_RESOLUTION_WIDTH = "device.screen_resolution.width";
    public static final String SCREEN_SIZE = "screen_size";
    public static final String SDK_URL = "sdkUrl";
    public static final boolean SERVICE_REQUEST_COMPRESS = false;
    public static final int SERVICE_REQUEST_UNCOMPRESSED_LIMIT = 256;
    public static final int SET_AUTH_TOKEN = 9;
    public static final String SIGNATURE_CIPHER = "RSA/ECB/PKCS1Padding";
    public static final String SIGNATURE_DIGEST = "SHA1";
    public static final int SIMPLE_RELOAD = 10;
    public static final String TIMESTAMP = "timestamp";
    public static final String TRACKING_USER_ACCESS_ID = "user.user_access_id";
    public static final String TRANSACTIONTIME = "transactiontimestamp";
    public static final String TRANSACTION_ID = "transactionId";
    public static final String USER_AGENT_APP = "GetJarSDK";
    public static final String USER_AGENT_UNKOWN_APP = "unknown/0000";
    public static final String WAIT_DIALOG_MSG = "Please wait...";
    public static final String WEB_LAST_KNOWN = "web.last.known";
    public static final String WEB_TIMESTAMP = "web.timestamp";
    public static final String WIDTH = "width";
    public static final String X = "x";
    public static final String Y = "y";
    public static List<String> AllowedLocales = Collections.unmodifiableList(Arrays.asList("en_us", "zh_cn", "zh_tw", "fr_fr", "it_it", "de_de", "id_id", "pt_br", "es_es", "es_us", "tr_tr", "vi_vn", "ru_ru", "lt_lt", "ko_kr", "ja_jp"));
    public static long BILLING_RESPONSE_INVALID_REQUEST_ID = -1;
    public static long BILLING_RESPONSE_VALID_REQUEST_ID = 1;

    /* loaded from: classes.dex */
    public enum AppState {
        UNINSTALLED,
        INSTALLED,
        RUNNING
    }

    /* loaded from: classes.dex */
    public enum ResponseCode {
        RESULT_OK,
        RESULT_USER_CANCELED,
        RESULT_SERVICE_UNAVAILABLE,
        RESULT_BILLING_UNAVAILABLE,
        RESULT_ITEM_UNAVAILABLE,
        RESULT_DEVELOPER_ERROR,
        RESULT_ERROR,
        RESULT_ITEM_ALREADY_OWNED,
        RESULT_ITEM_NOT_OWNED;

        public static ResponseCode valueOf(int index) {
            ResponseCode[] values = values();
            return (index < 0 || index >= values.length) ? RESULT_ERROR : values[index];
        }
    }

    /* loaded from: classes.dex */
    public enum PurchaseState {
        PURCHASED,
        CANCELED,
        REFUNDED;

        public static PurchaseState valueOf(int index) {
            PurchaseState[] values = values();
            return (index < 0 || index >= values.length) ? CANCELED : values[index];
        }
    }

    /* loaded from: classes.dex */
    public enum RequestInstallType {
        UNDEFINED,
        EARN,
        PURCHASE;
        
        public static final String SUFFIX_AMOUNT = "_amount";
        public static final String SUFFIX_APP_ID = "_app_id";
        public static final String SUFFIX_DEFAULT = "_install_type";
        public static final String SUFFIX_NOTIFICATION = "_install_notification";
        public static final String SUFFIX_NOTIFICATION_OPEN = "_install_notification_open";
        public static final String SUFFIX_STATE = "_install_state";
        public static final String SUFFIX_SUBSTATE = "_install_substate";

        @Override // java.lang.Enum
        public String toString() {
            switch (this) {
                case EARN:
                    return "EARN";
                case PURCHASE:
                    return "PURCHASE";
                default:
                    return "UNKNOWN";
            }
        }
    }

    /* loaded from: classes.dex */
    public enum RequestInstallState {
        UNKNOWN,
        INSTALL,
        SUCCESS,
        FAIL;

        @Override // java.lang.Enum
        public String toString() {
            switch (this) {
                case INSTALL:
                    return "INSTALL";
                case SUCCESS:
                    return "SUCCESS";
                case FAIL:
                    return "FAIL";
                default:
                    return "UNKNOWN";
            }
        }
    }

    /* loaded from: classes.dex */
    public enum RequestInstallSubState {
        NONE,
        ALREADY_REDEEMED_FAILURE,
        INCOMPLETE_RECONCILE_FAILURE,
        RECONCILE_DATA_FAILURE,
        UNKNOWN_FAILURE,
        FUNDS_INSUFFICIENT_FAILURE,
        FUNDS_OVERDRAWN_WARNING,
        CAP_REACHED_FAILURE,
        CAP_EXCEEDED_WARNING,
        DEPENDENT_SERVICE_FAILURE;

        @Override // java.lang.Enum
        public String toString() {
            switch (this) {
                case NONE:
                    return "NONE";
                case ALREADY_REDEEMED_FAILURE:
                    return Constants.ALREADY_REDEEMED_FAILURE;
                case INCOMPLETE_RECONCILE_FAILURE:
                    return "INCOMPLETE_RECONCILE_FAILURE";
                case RECONCILE_DATA_FAILURE:
                    return "RECONCILE_DATA_FAILURE";
                case UNKNOWN_FAILURE:
                    return "UNKNOWN_FAILURE";
                case FUNDS_INSUFFICIENT_FAILURE:
                    return "FUNDS_INSUFFICIENT_FAILURE";
                case FUNDS_OVERDRAWN_WARNING:
                    return "FUNDS_OVERDRAWN_WARNING";
                case CAP_REACHED_FAILURE:
                    return Constants.CAP_REACHED_FAILURE;
                case CAP_EXCEEDED_WARNING:
                    return "CAP_EXCEEDED_WARNING";
                case DEPENDENT_SERVICE_FAILURE:
                    return "DEPENDENT_SERVICE_FAILURE";
                default:
                    return "NONE";
            }
        }

        public static String KEY() {
            return "request_install_substate";
        }
    }
}
