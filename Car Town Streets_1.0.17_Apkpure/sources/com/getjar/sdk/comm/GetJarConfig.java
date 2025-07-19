package com.getjar.sdk.comm;

import android.content.Context;
import android.content.SharedPreferences;
import com.getjar.sdk.comm.auth.SettingsManager;
import com.getjar.sdk.exceptions.ConfigurationException;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import com.getjar.sdk.utilities.OverridesUtility;
import com.getjar.sdk.utilities.StringUtility;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes.dex */
public class GetJarConfig {
    private static final String CONFIG_PREFS = "GetJarConfig";
    private static final String CONFIG_PREFS_KEY = "config";
    private static final String DEFAULT_CONFIG_FILE = "config.ini";
    private static final String DEFAULT_LOOKUP_KEY = "default";
    public static final String KEY_LOCALIZATION_SERVICE_ENDPOINT = "service.localization_service.endpoint";
    public static final String KEY_REPORT_USAGE_ENDPOINT = "service.report_usage.endpoint";
    public static final String KEY_USAGE_BACKGROUND_TYPE_FILTER = "usage.background.type_filter";
    public static final String KEY_USAGE_PACKAGE_FILTER_REGEX = "usage.package_filter.regex";
    public static final String KEY_WEBVIEW_SLEEP_RELOAD_INTERVAL = "webview.sleep_reload.interval";
    private Context androidContext;
    private CommContext mCommContext;
    private JSONObject mDirectives;
    private static Map<String, GetJarConfig> sInstances = new HashMap();
    public static final String KEY_VOUCHER_SERVICE_ENDPOINT = "service.voucher_service.endpoint";
    public static final String KEY_TRANSACTION_SERVICE_ENDPOINT = "service.transaction_service.endpoint";
    public static final String KEY_AUTH_SERVICE_ENDPOINT = "service.auth_service.endpoint";
    public static final String KEY_LICENSE_SERVICE_ENDPOINT = "service.license_service.endpoint";
    public static final String KEY_DEFAULT_WEBVIEW_URL = "webview.default_url";
    public static final String KEY_MANAGED_CHECKOUT_URL = "webview.managed_checkout_url";
    public static final String KEY_WALLET_URL = "webview.wallet_url";
    public static final String KEY_TRANSACTION_FAIL_RETRY_INTERVAL = "transaction.fail.retry.time";
    public static final String KEY_LICENSE_REFRESH_INTERVAL = "license.refresh.interval";
    public static final String KEY_LICENSE_IGNORE_REQUEST_INTERVAL = "license.ignore.request.interval";
    public static final String KEY_TRANSACTION_FAIL_ABANDON_TIME = "transaction.fail.abandon.time";
    public static final String KEY_USAGE_BACKGROUND_SEND_INTERVAL = "usage.background.send.interval";
    public static final String KEY_WEBVIEW_SAVED_URL_TTL = "webview.saved_url.ttl";
    public static final String KEY_DOWNLOAD_MATCH_TTL = "download.match.ttl";
    public static final String KEY_EARN_ON_OPEN_MONITORING_INTERVAL = "earn.on.open.monitoring.interval";
    public static final String KEY_USAGE_MONITORING_INTERVAL = "usage.monitoring.interval";
    public static final String KEY_USAGE_MONITORING_TRACKING_INTERVAL = "usage.monitoring.tracking_interval";
    public static final String KEY_USAGE_MONITORING_ENABLED = "usage.monitoring.enabled";
    public static final String KEY_SERVICE_REQUEST_COMPRESS = "service.request.compress";
    public static final String KEY_SERVICE_REQUEST_UNCOMPRESSED_LIMIT = "service.request.uncompressed_limit";
    public static final String KEY_LOGGING_ENDPOINT = "service.logging.endpoint";
    public static final String KEY_USAGE_PACKAGE_FILTER_SYSTEM = "usage.package_filter.system";
    public static final String KEY_USAGE_BACKGROUND_SEND_ENABLED = "usage.background.send.enabled";
    public static final String KEY_USAGE_BACKGROUND_SEND_BATCH_COUNT = "usage.background.send.batch_count";
    public static final String KEY_USAGE_REQUEST_SEND_ENABLED = "usage.request.send.enabled";
    public static final String KEY_USAGE_REQUEST_SEND_MAX_COUNT = "usage.request.send.max_count";
    public static final String KEY_USAGE_REQUEST_SEND_SORT = "usage.request.send.sort";
    public static final String KEY_USAGE_REQUEST_TIME_WINDOW = "usage.request.time_window";
    public static final String KEY_USAGE_REQUEST_TIME_WINDOW_COUNT = "usage.request.time_window_count";
    public static final String KEY_LOGGING_LOGCAT_ENABLED = "logging.logcat.enabled";
    public static final String KEY_LOGGING_LOGCAT_LEVEL = "logging.logcat.level";
    public static final String KEY_LOGGING_LOGCAT_AREAS = "logging.logcat.areas";
    public static final String KEY_LOGGING_REMOTE_ENABLED = "logging.remote.enabled";
    public static final String KEY_LOGGING_REMOTE_LEVEL = "logging.remote.level";
    public static final String KEY_LOGGING_REMOTE_AREAS = "logging.remote.areas";
    public static final String KEY_LOGGING_REMOTE_MAX_BATCH_COUNT = "logging.remote.max_batch_count";
    public static final String KEY_LOGGING_REMOTE_MAX_WAIT_INTERVAL = "logging.remote.max_wait_interval";
    private static final String[] sRequiredKeys = {KEY_VOUCHER_SERVICE_ENDPOINT, KEY_TRANSACTION_SERVICE_ENDPOINT, KEY_AUTH_SERVICE_ENDPOINT, KEY_LICENSE_SERVICE_ENDPOINT, KEY_DEFAULT_WEBVIEW_URL, KEY_MANAGED_CHECKOUT_URL, KEY_WALLET_URL, KEY_TRANSACTION_FAIL_RETRY_INTERVAL, KEY_LICENSE_REFRESH_INTERVAL, KEY_LICENSE_IGNORE_REQUEST_INTERVAL, KEY_TRANSACTION_FAIL_ABANDON_TIME, KEY_USAGE_BACKGROUND_SEND_INTERVAL, KEY_WEBVIEW_SAVED_URL_TTL, KEY_DOWNLOAD_MATCH_TTL, KEY_EARN_ON_OPEN_MONITORING_INTERVAL, KEY_USAGE_MONITORING_INTERVAL, KEY_USAGE_MONITORING_TRACKING_INTERVAL, KEY_USAGE_MONITORING_ENABLED, KEY_SERVICE_REQUEST_COMPRESS, KEY_SERVICE_REQUEST_UNCOMPRESSED_LIMIT, KEY_LOGGING_ENDPOINT, KEY_USAGE_PACKAGE_FILTER_SYSTEM, KEY_USAGE_BACKGROUND_SEND_ENABLED, KEY_USAGE_BACKGROUND_SEND_BATCH_COUNT, KEY_USAGE_REQUEST_SEND_ENABLED, KEY_USAGE_REQUEST_SEND_MAX_COUNT, KEY_USAGE_REQUEST_SEND_SORT, KEY_USAGE_REQUEST_TIME_WINDOW, KEY_USAGE_REQUEST_TIME_WINDOW_COUNT, KEY_LOGGING_LOGCAT_ENABLED, KEY_LOGGING_LOGCAT_LEVEL, KEY_LOGGING_LOGCAT_AREAS, KEY_LOGGING_REMOTE_ENABLED, KEY_LOGGING_REMOTE_LEVEL, KEY_LOGGING_REMOTE_AREAS, KEY_LOGGING_REMOTE_MAX_BATCH_COUNT, KEY_LOGGING_REMOTE_MAX_WAIT_INTERVAL};

    public static synchronized GetJarConfig getInstance(CommContext theCommContext, boolean connectToServer) {
        GetJarConfig getJarConfig;
        synchronized (GetJarConfig.class) {
            if (theCommContext == null) {
                throw new IllegalArgumentException("Must supply a valid GetJarContext.");
            }
            OverridesUtility.initialize(theCommContext.getApplicationContext());
            if (sInstances.containsKey(DEFAULT_LOOKUP_KEY)) {
                Logger.d(Area.CONFIG.value(), "GetJarConfig()::getInstance() -- re-using existing GetJarConfig instance");
                getJarConfig = sInstances.get(DEFAULT_LOOKUP_KEY);
            } else {
                Logger.d(Area.CONFIG.value(), "GetJarConfig()::getInstance() -- creating a new GetJarConfig instance");
                GetJarConfig config = new GetJarConfig(theCommContext, connectToServer);
                sInstances.put(DEFAULT_LOOKUP_KEY, config);
                getJarConfig = config;
            }
        }
        return getJarConfig;
    }

    public static synchronized GetJarConfig getInstance(Context androidContext) {
        GetJarConfig getJarConfig;
        synchronized (GetJarConfig.class) {
            if (androidContext == null) {
                throw new IllegalArgumentException("'androidContext' cannot be null");
            }
            OverridesUtility.initialize(androidContext);
            if (sInstances.containsKey(DEFAULT_LOOKUP_KEY)) {
                Logger.d(Area.CONFIG.value(), "GetJarConfig()::getInstance() -- re-using existing GetJarConfig instance");
                getJarConfig = sInstances.get(DEFAULT_LOOKUP_KEY);
            } else {
                Logger.d(Area.CONFIG.value(), "GetJarConfig()::getInstance() -- creating a new GetJarConfig instance");
                GetJarConfig config = new GetJarConfig(androidContext);
                sInstances.put(DEFAULT_LOOKUP_KEY, config);
                getJarConfig = config;
            }
        }
        return getJarConfig;
    }

    private GetJarConfig(CommContext theCommContext, boolean connectToServer) {
        initialize(theCommContext, connectToServer);
    }

    private GetJarConfig(Context androidContext) {
        if (androidContext == null) {
            throw new IllegalArgumentException("'androidContext' cannot be null");
        }
        initialize(androidContext);
    }

    /* JADX WARN: Removed duplicated region for block: B:31:0x007e A[Catch: all -> 0x0014, TRY_ENTER, TRY_LEAVE, TryCatch #0 {, blocks: (B:4:0x0002, B:6:0x000c, B:7:0x0013, B:9:0x0017, B:11:0x001f, B:12:0x0026, B:13:0x0027, B:15:0x002f, B:18:0x005b, B:20:0x0060, B:22:0x0066, B:27:0x00c8, B:31:0x007e, B:33:0x0090, B:35:0x009a, B:38:0x00dc, B:40:0x00b6, B:41:0x00c6, B:42:0x00ef, B:44:0x010a, B:47:0x0123), top: B:3:0x0002, inners: #3 }] */
    /* JADX WARN: Removed duplicated region for block: B:40:0x00b6 A[Catch: all -> 0x0014, TRY_ENTER, TryCatch #0 {, blocks: (B:4:0x0002, B:6:0x000c, B:7:0x0013, B:9:0x0017, B:11:0x001f, B:12:0x0026, B:13:0x0027, B:15:0x002f, B:18:0x005b, B:20:0x0060, B:22:0x0066, B:27:0x00c8, B:31:0x007e, B:33:0x0090, B:35:0x009a, B:38:0x00dc, B:40:0x00b6, B:41:0x00c6, B:42:0x00ef, B:44:0x010a, B:47:0x0123), top: B:3:0x0002, inners: #3 }] */
    /* JADX WARN: Removed duplicated region for block: B:42:0x00ef A[Catch: all -> 0x0014, TryCatch #0 {, blocks: (B:4:0x0002, B:6:0x000c, B:7:0x0013, B:9:0x0017, B:11:0x001f, B:12:0x0026, B:13:0x0027, B:15:0x002f, B:18:0x005b, B:20:0x0060, B:22:0x0066, B:27:0x00c8, B:31:0x007e, B:33:0x0090, B:35:0x009a, B:38:0x00dc, B:40:0x00b6, B:41:0x00c6, B:42:0x00ef, B:44:0x010a, B:47:0x0123), top: B:3:0x0002, inners: #3 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private synchronized void initialize(com.getjar.sdk.comm.CommContext r12, boolean r13) {
        /*
            Method dump skipped, instructions count: 313
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.getjar.sdk.comm.GetJarConfig.initialize(com.getjar.sdk.comm.CommContext, boolean):void");
    }

    private synchronized void initialize(Context androidContext) {
        if (androidContext == null) {
            throw new IllegalArgumentException("'androidContext' cannot be null");
        }
        this.androidContext = androidContext;
        boolean isConfigReady = false;
        try {
            JSONObject configJson = _getDefaultDirectives();
            if (_validateJsonDirectives(configJson)) {
                this.mDirectives = configJson;
                isConfigReady = true;
                Logger.d(Area.CONFIG.value(), "_initialize() -- OK: config is ready (using DEFAULTS)..");
            }
        } catch (IOException e) {
            Logger.e(Area.CONFIG.value(), "_initialize() failed", e);
        }
        if (!isConfigReady) {
            Logger.e(Area.CONFIG.value(), "** FATAL ERROR: invalid configuration, unable to proceed..");
            throw new ConfigurationException("** FATAL ERROR: invalid configuration, unable to proceed..");
        }
    }

    private JSONObject _getDefaultDirectives() throws IOException {
        Map<String, String> keyvals = new HashMap<>();
        BufferedReader br = null;
        try {
            BufferedReader br2 = new BufferedReader(new InputStreamReader(this.androidContext.getAssets().open(DEFAULT_CONFIG_FILE)));
            while (true) {
                try {
                    String line = br2.readLine();
                    if (line == null) {
                        break;
                    }
                    String[] kv = line.split("=", 2);
                    if (kv.length == 2) {
                        Logger.d(Area.CONFIG.value() | Area.STORAGE.value(), "_getDefaultDirectives() -- detected " + kv[0] + "=" + kv[1]);
                        keyvals.put(kv[0], kv[1]);
                    }
                } catch (Throwable th) {
                    th = th;
                    br = br2;
                    if (br != null) {
                        br.close();
                    }
                    throw th;
                }
            }
            if (br2 != null) {
                br2.close();
            }
            return new JSONObject(keyvals);
        } catch (Throwable th2) {
            th = th2;
        }
    }

    private boolean _validateJsonDirectives(JSONObject theJson) {
        if (theJson == null) {
            throw new IllegalArgumentException("Must have a valid json object.");
        }
        try {
            String[] arr$ = sRequiredKeys;
            for (String key : arr$) {
                if (!theJson.has(key) || StringUtility.isNullOrEmpty(theJson.getString(key))) {
                    return false;
                }
            }
            return true;
        } catch (JSONException e) {
            Logger.e(Area.CONFIG.value(), "_validateJsonDirectives failed", e);
            return false;
        }
    }

    private synchronized void _persistIntoSharedPrefs(JSONObject theJson) {
        if (theJson == null) {
            throw new IllegalArgumentException("Must have a valid json object.");
        }
        SharedPreferences prefs = this.mCommContext.getApplicationContext().getSharedPreferences(CONFIG_PREFS, 0);
        prefs.edit().putString(CONFIG_PREFS_KEY, theJson.toString());
        Logger.d(Area.CONFIG.value() | Area.STORAGE.value(), "_persistIntoSharedPrefs() -- OK: stored key=config, val=" + theJson.toString());
    }

    public String getDirectiveValue(String theDirectiveKey) {
        String directiveVal;
        Logger.v(Area.CONFIG.value(), String.format(Locale.US, "GetJarConfig getDirectiveValue() START [key='%1$s']", theDirectiveKey));
        try {
            if (StringUtility.isNullOrEmpty(theDirectiveKey)) {
                throw new IllegalArgumentException("Must have a valid key.");
            }
            String overrideValue = OverridesUtility.getValue(theDirectiveKey, null);
            if (!StringUtility.isNullOrEmpty(overrideValue)) {
                Logger.v(Area.CONFIG.value(), String.format(Locale.US, "GetJarConfig getDirectiveValue() Using OVERRIDE defined value: '%1$s' = '%2$s'", theDirectiveKey, overrideValue));
                directiveVal = overrideValue.trim();
                Logger.v(Area.CONFIG.value(), String.format(Locale.US, "GetJarConfig getDirectiveValue() FINISHED [key='%1$s']", theDirectiveKey));
            } else {
                directiveVal = SettingsManager.getInstance(this.androidContext).getValue(theDirectiveKey);
                if (!StringUtility.isNullOrEmpty(directiveVal)) {
                    Logger.v(Area.CONFIG.value(), String.format(Locale.US, "GetJarConfig getDirectiveValue() Using SERVER defined value: '%1$s' = '%2$s'", theDirectiveKey, directiveVal));
                    directiveVal = directiveVal.trim();
                    Logger.v(Area.CONFIG.value(), String.format(Locale.US, "GetJarConfig getDirectiveValue() FINISHED [key='%1$s']", theDirectiveKey));
                } else {
                    try {
                        directiveVal = this.mDirectives.getString(theDirectiveKey);
                        if (!StringUtility.isNullOrEmpty(directiveVal)) {
                            Logger.v(Area.CONFIG.value(), String.format(Locale.US, "GetJarConfig getDirectiveValue() Using CONFIG value: '%1$s' = '%2$s'", theDirectiveKey, directiveVal));
                            directiveVal = directiveVal.trim();
                            Logger.v(Area.CONFIG.value(), String.format(Locale.US, "GetJarConfig getDirectiveValue() FINISHED [key='%1$s']", theDirectiveKey));
                        }
                    } catch (JSONException e) {
                        Logger.e(Area.CONFIG.value(), "getDirectiveValue failed", e);
                    }
                    if (StringUtility.isNullOrEmpty(directiveVal)) {
                        throw new ConfigurationException("ERROR: no value found for config directive=" + theDirectiveKey);
                    }
                    Logger.v(Area.CONFIG.value(), String.format(Locale.US, "GetJarConfig getDirectiveValue() FINISHED [key='%1$s']", theDirectiveKey));
                }
            }
            return directiveVal;
        } catch (Throwable th) {
            Logger.v(Area.CONFIG.value(), String.format(Locale.US, "GetJarConfig getDirectiveValue() FINISHED [key='%1$s']", theDirectiveKey));
            throw th;
        }
    }

    public String getDirectiveValue(String theDirectiveKey, String defaultValue) {
        if (StringUtility.isNullOrEmpty(theDirectiveKey)) {
            throw new IllegalArgumentException("Must have a valid key.");
        }
        try {
            String value = getDirectiveValue(theDirectiveKey);
            return value;
        } catch (ConfigurationException e) {
            Logger.v(Area.CONFIG.value(), String.format(Locale.US, "GetJarConfig getDirectiveValue() Using DEFAULT value: '%1$s' = '%2$s'", theDirectiveKey, defaultValue));
            return defaultValue;
        }
    }

    public Boolean getBooleanValue(String key, Boolean defaultValue) {
        if (StringUtility.isNullOrEmpty(key)) {
            throw new IllegalArgumentException("'key' cannot be null or empty");
        }
        String value = getDirectiveValue(key, defaultValue == null ? null : String.valueOf(defaultValue));
        if (StringUtility.isNullOrEmpty(value) && defaultValue == null) {
            return null;
        }
        return Boolean.valueOf(Boolean.parseBoolean(value));
    }

    public Integer getIntegerValue(String key, Integer defaultValue) {
        if (StringUtility.isNullOrEmpty(key)) {
            throw new IllegalArgumentException("'key' cannot be null or empty");
        }
        String value = getDirectiveValue(key, defaultValue == null ? null : String.valueOf(defaultValue));
        if (StringUtility.isNullOrEmpty(value) && defaultValue == null) {
            return null;
        }
        try {
            return Integer.valueOf(Integer.parseInt(value));
        } catch (NumberFormatException e) {
            throw new ConfigurationException(e);
        }
    }
}
