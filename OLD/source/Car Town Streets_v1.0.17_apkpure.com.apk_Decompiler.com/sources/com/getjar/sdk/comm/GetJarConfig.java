package com.getjar.sdk.comm;

import android.content.Context;
import com.getjar.sdk.comm.auth.SettingsManager;
import com.getjar.sdk.exceptions.ConfigurationException;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import com.getjar.sdk.utilities.OverridesUtility;
import com.getjar.sdk.utilities.StringUtility;
import java.io.IOException;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import org.json.JSONException;
import org.json.JSONObject;

public class GetJarConfig {
    private static final String CONFIG_PREFS = "GetJarConfig";
    private static final String CONFIG_PREFS_KEY = "config";
    private static final String DEFAULT_CONFIG_FILE = "config.ini";
    private static final String DEFAULT_LOOKUP_KEY = "default";
    public static final String KEY_AUTH_SERVICE_ENDPOINT = "service.auth_service.endpoint";
    public static final String KEY_DEFAULT_WEBVIEW_URL = "webview.default_url";
    public static final String KEY_DOWNLOAD_MATCH_TTL = "download.match.ttl";
    public static final String KEY_EARN_ON_OPEN_MONITORING_INTERVAL = "earn.on.open.monitoring.interval";
    public static final String KEY_LICENSE_IGNORE_REQUEST_INTERVAL = "license.ignore.request.interval";
    public static final String KEY_LICENSE_REFRESH_INTERVAL = "license.refresh.interval";
    public static final String KEY_LICENSE_SERVICE_ENDPOINT = "service.license_service.endpoint";
    public static final String KEY_LOCALIZATION_SERVICE_ENDPOINT = "service.localization_service.endpoint";
    public static final String KEY_LOGGING_ENDPOINT = "service.logging.endpoint";
    public static final String KEY_LOGGING_LOGCAT_AREAS = "logging.logcat.areas";
    public static final String KEY_LOGGING_LOGCAT_ENABLED = "logging.logcat.enabled";
    public static final String KEY_LOGGING_LOGCAT_LEVEL = "logging.logcat.level";
    public static final String KEY_LOGGING_REMOTE_AREAS = "logging.remote.areas";
    public static final String KEY_LOGGING_REMOTE_ENABLED = "logging.remote.enabled";
    public static final String KEY_LOGGING_REMOTE_LEVEL = "logging.remote.level";
    public static final String KEY_LOGGING_REMOTE_MAX_BATCH_COUNT = "logging.remote.max_batch_count";
    public static final String KEY_LOGGING_REMOTE_MAX_WAIT_INTERVAL = "logging.remote.max_wait_interval";
    public static final String KEY_MANAGED_CHECKOUT_URL = "webview.managed_checkout_url";
    public static final String KEY_REPORT_USAGE_ENDPOINT = "service.report_usage.endpoint";
    public static final String KEY_SERVICE_REQUEST_COMPRESS = "service.request.compress";
    public static final String KEY_SERVICE_REQUEST_UNCOMPRESSED_LIMIT = "service.request.uncompressed_limit";
    public static final String KEY_TRANSACTION_FAIL_ABANDON_TIME = "transaction.fail.abandon.time";
    public static final String KEY_TRANSACTION_FAIL_RETRY_INTERVAL = "transaction.fail.retry.time";
    public static final String KEY_TRANSACTION_SERVICE_ENDPOINT = "service.transaction_service.endpoint";
    public static final String KEY_USAGE_BACKGROUND_SEND_BATCH_COUNT = "usage.background.send.batch_count";
    public static final String KEY_USAGE_BACKGROUND_SEND_ENABLED = "usage.background.send.enabled";
    public static final String KEY_USAGE_BACKGROUND_SEND_INTERVAL = "usage.background.send.interval";
    public static final String KEY_USAGE_BACKGROUND_TYPE_FILTER = "usage.background.type_filter";
    public static final String KEY_USAGE_MONITORING_ENABLED = "usage.monitoring.enabled";
    public static final String KEY_USAGE_MONITORING_INTERVAL = "usage.monitoring.interval";
    public static final String KEY_USAGE_MONITORING_TRACKING_INTERVAL = "usage.monitoring.tracking_interval";
    public static final String KEY_USAGE_PACKAGE_FILTER_REGEX = "usage.package_filter.regex";
    public static final String KEY_USAGE_PACKAGE_FILTER_SYSTEM = "usage.package_filter.system";
    public static final String KEY_USAGE_REQUEST_SEND_ENABLED = "usage.request.send.enabled";
    public static final String KEY_USAGE_REQUEST_SEND_MAX_COUNT = "usage.request.send.max_count";
    public static final String KEY_USAGE_REQUEST_SEND_SORT = "usage.request.send.sort";
    public static final String KEY_USAGE_REQUEST_TIME_WINDOW = "usage.request.time_window";
    public static final String KEY_USAGE_REQUEST_TIME_WINDOW_COUNT = "usage.request.time_window_count";
    public static final String KEY_VOUCHER_SERVICE_ENDPOINT = "service.voucher_service.endpoint";
    public static final String KEY_WALLET_URL = "webview.wallet_url";
    public static final String KEY_WEBVIEW_SAVED_URL_TTL = "webview.saved_url.ttl";
    public static final String KEY_WEBVIEW_SLEEP_RELOAD_INTERVAL = "webview.sleep_reload.interval";
    private static Map<String, GetJarConfig> sInstances = new HashMap();
    private static final String[] sRequiredKeys = {KEY_VOUCHER_SERVICE_ENDPOINT, KEY_TRANSACTION_SERVICE_ENDPOINT, KEY_AUTH_SERVICE_ENDPOINT, KEY_LICENSE_SERVICE_ENDPOINT, KEY_DEFAULT_WEBVIEW_URL, KEY_MANAGED_CHECKOUT_URL, KEY_WALLET_URL, KEY_TRANSACTION_FAIL_RETRY_INTERVAL, KEY_LICENSE_REFRESH_INTERVAL, KEY_LICENSE_IGNORE_REQUEST_INTERVAL, KEY_TRANSACTION_FAIL_ABANDON_TIME, KEY_USAGE_BACKGROUND_SEND_INTERVAL, KEY_WEBVIEW_SAVED_URL_TTL, KEY_DOWNLOAD_MATCH_TTL, KEY_EARN_ON_OPEN_MONITORING_INTERVAL, KEY_USAGE_MONITORING_INTERVAL, KEY_USAGE_MONITORING_TRACKING_INTERVAL, KEY_USAGE_MONITORING_ENABLED, KEY_SERVICE_REQUEST_COMPRESS, KEY_SERVICE_REQUEST_UNCOMPRESSED_LIMIT, KEY_LOGGING_ENDPOINT, KEY_USAGE_PACKAGE_FILTER_SYSTEM, KEY_USAGE_BACKGROUND_SEND_ENABLED, KEY_USAGE_BACKGROUND_SEND_BATCH_COUNT, KEY_USAGE_REQUEST_SEND_ENABLED, KEY_USAGE_REQUEST_SEND_MAX_COUNT, KEY_USAGE_REQUEST_SEND_SORT, KEY_USAGE_REQUEST_TIME_WINDOW, KEY_USAGE_REQUEST_TIME_WINDOW_COUNT, KEY_LOGGING_LOGCAT_ENABLED, KEY_LOGGING_LOGCAT_LEVEL, KEY_LOGGING_LOGCAT_AREAS, KEY_LOGGING_REMOTE_ENABLED, KEY_LOGGING_REMOTE_LEVEL, KEY_LOGGING_REMOTE_AREAS, KEY_LOGGING_REMOTE_MAX_BATCH_COUNT, KEY_LOGGING_REMOTE_MAX_WAIT_INTERVAL};
    private Context androidContext;
    private CommContext mCommContext;
    private JSONObject mDirectives;

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

    public static synchronized GetJarConfig getInstance(Context androidContext2) {
        GetJarConfig getJarConfig;
        synchronized (GetJarConfig.class) {
            if (androidContext2 == null) {
                throw new IllegalArgumentException("'androidContext' cannot be null");
            }
            OverridesUtility.initialize(androidContext2);
            if (sInstances.containsKey(DEFAULT_LOOKUP_KEY)) {
                Logger.d(Area.CONFIG.value(), "GetJarConfig()::getInstance() -- re-using existing GetJarConfig instance");
                getJarConfig = sInstances.get(DEFAULT_LOOKUP_KEY);
            } else {
                Logger.d(Area.CONFIG.value(), "GetJarConfig()::getInstance() -- creating a new GetJarConfig instance");
                GetJarConfig config = new GetJarConfig(androidContext2);
                sInstances.put(DEFAULT_LOOKUP_KEY, config);
                getJarConfig = config;
            }
        }
        return getJarConfig;
    }

    private GetJarConfig(CommContext theCommContext, boolean connectToServer) {
        initialize(theCommContext, connectToServer);
    }

    private GetJarConfig(Context androidContext2) {
        if (androidContext2 == null) {
            throw new IllegalArgumentException("'androidContext' cannot be null");
        }
        initialize(androidContext2);
    }

    /* JADX WARNING: Removed duplicated region for block: B:27:0x007e A[SYNTHETIC, Splitter:B:27:0x007e] */
    /* JADX WARNING: Removed duplicated region for block: B:34:0x00b6  */
    /* JADX WARNING: Removed duplicated region for block: B:42:0x00ef A[Catch:{ JSONException -> 0x00c7 }] */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private synchronized void initialize(com.getjar.sdk.comm.CommContext r12, boolean r13) {
        /*
            r11 = this;
            monitor-enter(r11)
            r7 = 0
            r11.mDirectives = r7     // Catch:{ all -> 0x0014 }
            r11.mCommContext = r12     // Catch:{ all -> 0x0014 }
            r5 = 0
            r0 = 0
            com.getjar.sdk.comm.CommContext r7 = r11.mCommContext     // Catch:{ all -> 0x0014 }
            if (r7 != 0) goto L_0x0017
            java.lang.IllegalArgumentException r7 = new java.lang.IllegalArgumentException     // Catch:{ all -> 0x0014 }
            java.lang.String r8 = "'theCommContext' can not be NULL"
            r7.<init>(r8)     // Catch:{ all -> 0x0014 }
            throw r7     // Catch:{ all -> 0x0014 }
        L_0x0014:
            r7 = move-exception
            monitor-exit(r11)
            throw r7
        L_0x0017:
            com.getjar.sdk.comm.CommContext r7 = r11.mCommContext     // Catch:{ all -> 0x0014 }
            android.content.Context r7 = r7.getApplicationContext()     // Catch:{ all -> 0x0014 }
            if (r7 != 0) goto L_0x0027
            java.lang.IllegalArgumentException r7 = new java.lang.IllegalArgumentException     // Catch:{ all -> 0x0014 }
            java.lang.String r8 = "'theCommContext.getApplicationContext()' can not be NULL"
            r7.<init>(r8)     // Catch:{ all -> 0x0014 }
            throw r7     // Catch:{ all -> 0x0014 }
        L_0x0027:
            android.content.Context r7 = r12.getApplicationContext()     // Catch:{ all -> 0x0014 }
            r11.androidContext = r7     // Catch:{ all -> 0x0014 }
            if (r5 != 0) goto L_0x007c
            com.getjar.sdk.logging.Area r7 = com.getjar.sdk.logging.Area.CONFIG     // Catch:{ all -> 0x0014 }
            long r7 = r7.value()     // Catch:{ all -> 0x0014 }
            com.getjar.sdk.logging.Area r9 = com.getjar.sdk.logging.Area.STORAGE     // Catch:{ all -> 0x0014 }
            long r9 = r9.value()     // Catch:{ all -> 0x0014 }
            long r7 = r7 | r9
            java.lang.String r9 = "#2: _initialize() -- unable to fetch server config, trying to read from SharedPrefs file.."
            com.getjar.sdk.logging.Logger.d(r7, r9)     // Catch:{ all -> 0x0014 }
            com.getjar.sdk.comm.CommContext r7 = r11.mCommContext     // Catch:{ all -> 0x0014 }
            android.content.Context r7 = r7.getApplicationContext()     // Catch:{ all -> 0x0014 }
            java.lang.String r8 = "GetJarConfig"
            r9 = 0
            android.content.SharedPreferences r6 = r7.getSharedPreferences(r8, r9)     // Catch:{ all -> 0x0014 }
            java.lang.String r7 = "config"
            r8 = 0
            java.lang.String r2 = r6.getString(r7, r8)     // Catch:{ all -> 0x0014 }
            boolean r7 = com.getjar.sdk.utilities.StringUtility.isNullOrEmpty(r2)     // Catch:{ all -> 0x0014 }
            if (r7 != 0) goto L_0x007c
            org.json.JSONObject r1 = new org.json.JSONObject     // Catch:{ JSONException -> 0x00c7 }
            r1.<init>(r2)     // Catch:{ JSONException -> 0x00c7 }
            boolean r7 = r11._validateJsonDirectives(r1)     // Catch:{ JSONException -> 0x0136 }
            if (r7 == 0) goto L_0x007b
            r11.mDirectives = r1     // Catch:{ JSONException -> 0x0136 }
            r5 = 1
            com.getjar.sdk.logging.Area r7 = com.getjar.sdk.logging.Area.CONFIG     // Catch:{ JSONException -> 0x0136 }
            long r7 = r7.value()     // Catch:{ JSONException -> 0x0136 }
            com.getjar.sdk.logging.Area r9 = com.getjar.sdk.logging.Area.STORAGE     // Catch:{ JSONException -> 0x0136 }
            long r9 = r9.value()     // Catch:{ JSONException -> 0x0136 }
            long r7 = r7 | r9
            java.lang.String r9 = "_initialize() -- OK: config is ready (from SharedPrefs).."
            com.getjar.sdk.logging.Logger.d(r7, r9)     // Catch:{ JSONException -> 0x0136 }
        L_0x007b:
            r0 = r1
        L_0x007c:
            if (r5 != 0) goto L_0x00b4
            com.getjar.sdk.logging.Area r7 = com.getjar.sdk.logging.Area.CONFIG     // Catch:{ all -> 0x0014 }
            long r7 = r7.value()     // Catch:{ all -> 0x0014 }
            com.getjar.sdk.logging.Area r9 = com.getjar.sdk.logging.Area.STORAGE     // Catch:{ all -> 0x0014 }
            long r9 = r9.value()     // Catch:{ all -> 0x0014 }
            long r7 = r7 | r9
            java.lang.String r9 = "#3: _initialize() -- unable to read form SharedPrefs file, using DEFAULTS.."
            com.getjar.sdk.logging.Logger.d(r7, r9)     // Catch:{ all -> 0x0014 }
            org.json.JSONObject r0 = r11._getDefaultDirectives()     // Catch:{ IOException -> 0x00db }
            boolean r7 = r11._validateJsonDirectives(r0)     // Catch:{ IOException -> 0x00db }
            if (r7 == 0) goto L_0x00b4
            r11.mDirectives = r0     // Catch:{ IOException -> 0x00db }
            org.json.JSONObject r7 = r11.mDirectives     // Catch:{ IOException -> 0x00db }
            r11._persistIntoSharedPrefs(r7)     // Catch:{ IOException -> 0x00db }
            r5 = 1
            com.getjar.sdk.logging.Area r7 = com.getjar.sdk.logging.Area.CONFIG     // Catch:{ IOException -> 0x00db }
            long r7 = r7.value()     // Catch:{ IOException -> 0x00db }
            com.getjar.sdk.logging.Area r9 = com.getjar.sdk.logging.Area.STORAGE     // Catch:{ IOException -> 0x00db }
            long r9 = r9.value()     // Catch:{ IOException -> 0x00db }
            long r7 = r7 | r9
            java.lang.String r9 = "_initialize() -- OK: config is ready (using DEFAULTS).."
            com.getjar.sdk.logging.Logger.d(r7, r9)     // Catch:{ IOException -> 0x00db }
        L_0x00b4:
            if (r5 != 0) goto L_0x00ef
            java.lang.String r4 = "** FATAL ERROR: invalid configuration, unable to proceed.."
            com.getjar.sdk.logging.Area r7 = com.getjar.sdk.logging.Area.CONFIG     // Catch:{ all -> 0x0014 }
            long r7 = r7.value()     // Catch:{ all -> 0x0014 }
            com.getjar.sdk.logging.Logger.e(r7, r4)     // Catch:{ all -> 0x0014 }
            com.getjar.sdk.exceptions.ConfigurationException r7 = new com.getjar.sdk.exceptions.ConfigurationException     // Catch:{ all -> 0x0014 }
            r7.<init>((java.lang.String) r4)     // Catch:{ all -> 0x0014 }
            throw r7     // Catch:{ all -> 0x0014 }
        L_0x00c7:
            r3 = move-exception
        L_0x00c8:
            com.getjar.sdk.logging.Area r7 = com.getjar.sdk.logging.Area.CONFIG     // Catch:{ all -> 0x0014 }
            long r7 = r7.value()     // Catch:{ all -> 0x0014 }
            com.getjar.sdk.logging.Area r9 = com.getjar.sdk.logging.Area.STORAGE     // Catch:{ all -> 0x0014 }
            long r9 = r9.value()     // Catch:{ all -> 0x0014 }
            long r7 = r7 | r9
            java.lang.String r9 = "_initialize() failed"
            com.getjar.sdk.logging.Logger.e(r7, r9, r3)     // Catch:{ all -> 0x0014 }
            goto L_0x007c
        L_0x00db:
            r3 = move-exception
            com.getjar.sdk.logging.Area r7 = com.getjar.sdk.logging.Area.CONFIG     // Catch:{ all -> 0x0014 }
            long r7 = r7.value()     // Catch:{ all -> 0x0014 }
            com.getjar.sdk.logging.Area r9 = com.getjar.sdk.logging.Area.STORAGE     // Catch:{ all -> 0x0014 }
            long r9 = r9.value()     // Catch:{ all -> 0x0014 }
            long r7 = r7 | r9
            java.lang.String r9 = "_initialize() failed"
            com.getjar.sdk.logging.Logger.e(r7, r9, r3)     // Catch:{ all -> 0x0014 }
            goto L_0x00b4
        L_0x00ef:
            com.getjar.sdk.logging.Area r7 = com.getjar.sdk.logging.Area.CONFIG     // Catch:{ all -> 0x0014 }
            long r7 = r7.value()     // Catch:{ all -> 0x0014 }
            java.lang.String r9 = "_initialize() -- OK: config directives READY"
            com.getjar.sdk.logging.Logger.d(r7, r9)     // Catch:{ all -> 0x0014 }
            com.getjar.sdk.comm.CommContext r7 = r11.mCommContext     // Catch:{ all -> 0x0014 }
            android.content.Context r7 = r7.getApplicationContext()     // Catch:{ all -> 0x0014 }
            com.getjar.sdk.data.usage.UsageManager r7 = com.getjar.sdk.data.usage.UsageManager.getInstance(r7)     // Catch:{ all -> 0x0014 }
            boolean r7 = r7.isBackgroundSendEnabled()     // Catch:{ all -> 0x0014 }
            if (r7 == 0) goto L_0x0123
            com.getjar.sdk.logging.Area r7 = com.getjar.sdk.logging.Area.CONFIG     // Catch:{ all -> 0x0014 }
            long r7 = r7.value()     // Catch:{ all -> 0x0014 }
            com.getjar.sdk.logging.Area r9 = com.getjar.sdk.logging.Area.USAGE     // Catch:{ all -> 0x0014 }
            long r9 = r9.value()     // Catch:{ all -> 0x0014 }
            long r7 = r7 | r9
            java.lang.String r9 = "Alarms: startBackgroundReporting()"
            com.getjar.sdk.logging.Logger.d(r7, r9)     // Catch:{ all -> 0x0014 }
            com.getjar.sdk.comm.CommContext r7 = r11.mCommContext     // Catch:{ all -> 0x0014 }
            com.getjar.sdk.utilities.AlarmsUtility.startBackgroundReporting(r7, r11)     // Catch:{ all -> 0x0014 }
        L_0x0121:
            monitor-exit(r11)
            return
        L_0x0123:
            com.getjar.sdk.logging.Area r7 = com.getjar.sdk.logging.Area.CONFIG     // Catch:{ all -> 0x0014 }
            long r7 = r7.value()     // Catch:{ all -> 0x0014 }
            com.getjar.sdk.logging.Area r9 = com.getjar.sdk.logging.Area.USAGE     // Catch:{ all -> 0x0014 }
            long r9 = r9.value()     // Catch:{ all -> 0x0014 }
            long r7 = r7 | r9
            java.lang.String r9 = "Alarms: Background reporting is disabled, skipping alarm scheduling"
            com.getjar.sdk.logging.Logger.d(r7, r9)     // Catch:{ all -> 0x0014 }
            goto L_0x0121
        L_0x0136:
            r3 = move-exception
            r0 = r1
            goto L_0x00c8
        */
        throw new UnsupportedOperationException("Method not decompiled: com.getjar.sdk.comm.GetJarConfig.initialize(com.getjar.sdk.comm.CommContext, boolean):void");
    }

    private synchronized void initialize(Context androidContext2) {
        if (androidContext2 == null) {
            throw new IllegalArgumentException("'androidContext' cannot be null");
        }
        this.androidContext = androidContext2;
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

    /* JADX WARNING: Removed duplicated region for block: B:12:0x006e  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private org.json.JSONObject _getDefaultDirectives() throws java.io.IOException {
        /*
            r10 = this;
            r9 = 2
            java.util.HashMap r2 = new java.util.HashMap
            r2.<init>()
            r0 = 0
            java.io.BufferedReader r1 = new java.io.BufferedReader     // Catch:{ all -> 0x007d }
            java.io.InputStreamReader r5 = new java.io.InputStreamReader     // Catch:{ all -> 0x007d }
            android.content.Context r6 = r10.androidContext     // Catch:{ all -> 0x007d }
            android.content.res.AssetManager r6 = r6.getAssets()     // Catch:{ all -> 0x007d }
            java.lang.String r7 = "config.ini"
            java.io.InputStream r6 = r6.open(r7)     // Catch:{ all -> 0x007d }
            r5.<init>(r6)     // Catch:{ all -> 0x007d }
            r1.<init>(r5)     // Catch:{ all -> 0x007d }
        L_0x001d:
            java.lang.String r4 = r1.readLine()     // Catch:{ all -> 0x006a }
            if (r4 == 0) goto L_0x0072
            java.lang.String r5 = "="
            r6 = 2
            java.lang.String[] r3 = r4.split(r5, r6)     // Catch:{ all -> 0x006a }
            int r5 = r3.length     // Catch:{ all -> 0x006a }
            if (r5 != r9) goto L_0x001d
            com.getjar.sdk.logging.Area r5 = com.getjar.sdk.logging.Area.CONFIG     // Catch:{ all -> 0x006a }
            long r5 = r5.value()     // Catch:{ all -> 0x006a }
            com.getjar.sdk.logging.Area r7 = com.getjar.sdk.logging.Area.STORAGE     // Catch:{ all -> 0x006a }
            long r7 = r7.value()     // Catch:{ all -> 0x006a }
            long r5 = r5 | r7
            java.lang.StringBuilder r7 = new java.lang.StringBuilder     // Catch:{ all -> 0x006a }
            r7.<init>()     // Catch:{ all -> 0x006a }
            java.lang.String r8 = "_getDefaultDirectives() -- detected "
            java.lang.StringBuilder r7 = r7.append(r8)     // Catch:{ all -> 0x006a }
            r8 = 0
            r8 = r3[r8]     // Catch:{ all -> 0x006a }
            java.lang.StringBuilder r7 = r7.append(r8)     // Catch:{ all -> 0x006a }
            java.lang.String r8 = "="
            java.lang.StringBuilder r7 = r7.append(r8)     // Catch:{ all -> 0x006a }
            r8 = 1
            r8 = r3[r8]     // Catch:{ all -> 0x006a }
            java.lang.StringBuilder r7 = r7.append(r8)     // Catch:{ all -> 0x006a }
            java.lang.String r7 = r7.toString()     // Catch:{ all -> 0x006a }
            com.getjar.sdk.logging.Logger.d(r5, r7)     // Catch:{ all -> 0x006a }
            r5 = 0
            r5 = r3[r5]     // Catch:{ all -> 0x006a }
            r6 = 1
            r6 = r3[r6]     // Catch:{ all -> 0x006a }
            r2.put(r5, r6)     // Catch:{ all -> 0x006a }
            goto L_0x001d
        L_0x006a:
            r5 = move-exception
            r0 = r1
        L_0x006c:
            if (r0 == 0) goto L_0x0071
            r0.close()
        L_0x0071:
            throw r5
        L_0x0072:
            if (r1 == 0) goto L_0x0077
            r1.close()
        L_0x0077:
            org.json.JSONObject r5 = new org.json.JSONObject
            r5.<init>(r2)
            return r5
        L_0x007d:
            r5 = move-exception
            goto L_0x006c
        */
        throw new UnsupportedOperationException("Method not decompiled: com.getjar.sdk.comm.GetJarConfig._getDefaultDirectives():org.json.JSONObject");
    }

    private boolean _validateJsonDirectives(JSONObject theJson) {
        if (theJson == null) {
            throw new IllegalArgumentException("Must have a valid json object.");
        }
        try {
            for (String key : sRequiredKeys) {
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
        this.mCommContext.getApplicationContext().getSharedPreferences(CONFIG_PREFS, 0).edit().putString(CONFIG_PREFS_KEY, theJson.toString());
        Logger.d(Area.CONFIG.value() | Area.STORAGE.value(), "_persistIntoSharedPrefs() -- OK: stored key=config, val=" + theJson.toString());
    }

    public String getDirectiveValue(String theDirectiveKey) {
        String directiveVal;
        Logger.v(Area.CONFIG.value(), String.format(Locale.US, "GetJarConfig getDirectiveValue() START [key='%1$s']", new Object[]{theDirectiveKey}));
        try {
            if (StringUtility.isNullOrEmpty(theDirectiveKey)) {
                throw new IllegalArgumentException("Must have a valid key.");
            }
            String overrideValue = OverridesUtility.getValue(theDirectiveKey, (String) null);
            if (!StringUtility.isNullOrEmpty(overrideValue)) {
                Logger.v(Area.CONFIG.value(), String.format(Locale.US, "GetJarConfig getDirectiveValue() Using OVERRIDE defined value: '%1$s' = '%2$s'", new Object[]{theDirectiveKey, overrideValue}));
                directiveVal = overrideValue.trim();
                Logger.v(Area.CONFIG.value(), String.format(Locale.US, "GetJarConfig getDirectiveValue() FINISHED [key='%1$s']", new Object[]{theDirectiveKey}));
            } else {
                directiveVal = SettingsManager.getInstance(this.androidContext).getValue(theDirectiveKey);
                if (!StringUtility.isNullOrEmpty(directiveVal)) {
                    Logger.v(Area.CONFIG.value(), String.format(Locale.US, "GetJarConfig getDirectiveValue() Using SERVER defined value: '%1$s' = '%2$s'", new Object[]{theDirectiveKey, directiveVal}));
                    directiveVal = directiveVal.trim();
                    Logger.v(Area.CONFIG.value(), String.format(Locale.US, "GetJarConfig getDirectiveValue() FINISHED [key='%1$s']", new Object[]{theDirectiveKey}));
                } else {
                    directiveVal = this.mDirectives.getString(theDirectiveKey);
                    if (!StringUtility.isNullOrEmpty(directiveVal)) {
                        Logger.v(Area.CONFIG.value(), String.format(Locale.US, "GetJarConfig getDirectiveValue() Using CONFIG value: '%1$s' = '%2$s'", new Object[]{theDirectiveKey, directiveVal}));
                        directiveVal = directiveVal.trim();
                        Logger.v(Area.CONFIG.value(), String.format(Locale.US, "GetJarConfig getDirectiveValue() FINISHED [key='%1$s']", new Object[]{theDirectiveKey}));
                    }
                    if (StringUtility.isNullOrEmpty(directiveVal)) {
                        throw new ConfigurationException("ERROR: no value found for config directive=" + theDirectiveKey);
                    }
                    Logger.v(Area.CONFIG.value(), String.format(Locale.US, "GetJarConfig getDirectiveValue() FINISHED [key='%1$s']", new Object[]{theDirectiveKey}));
                }
            }
            return directiveVal;
        } catch (JSONException e) {
            Logger.e(Area.CONFIG.value(), "getDirectiveValue failed", e);
        } catch (Throwable th) {
            Logger.v(Area.CONFIG.value(), String.format(Locale.US, "GetJarConfig getDirectiveValue() FINISHED [key='%1$s']", new Object[]{theDirectiveKey}));
            throw th;
        }
    }

    public String getDirectiveValue(String theDirectiveKey, String defaultValue) {
        if (StringUtility.isNullOrEmpty(theDirectiveKey)) {
            throw new IllegalArgumentException("Must have a valid key.");
        }
        String value = defaultValue;
        try {
            return getDirectiveValue(theDirectiveKey);
        } catch (ConfigurationException e) {
            Logger.v(Area.CONFIG.value(), String.format(Locale.US, "GetJarConfig getDirectiveValue() Using DEFAULT value: '%1$s' = '%2$s'", new Object[]{theDirectiveKey, defaultValue}));
            return value;
        }
    }

    public Boolean getBooleanValue(String key, Boolean defaultValue) {
        if (StringUtility.isNullOrEmpty(key)) {
            throw new IllegalArgumentException("'key' cannot be null or empty");
        }
        String value = getDirectiveValue(key, defaultValue == null ? null : String.valueOf(defaultValue));
        if (!StringUtility.isNullOrEmpty(value) || defaultValue != null) {
            return Boolean.valueOf(Boolean.parseBoolean(value));
        }
        return null;
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
            throw new ConfigurationException((Throwable) e);
        }
    }
}
