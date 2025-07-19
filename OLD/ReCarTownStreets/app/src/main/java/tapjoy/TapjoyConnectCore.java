package tapjoy;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.net.ConnectivityManager;
import android.net.Uri;
import android.net.wifi.WifiInfo;
import android.net.wifi.WifiManager;
import android.os.Build;
import android.provider.Settings;
import android.telephony.TelephonyManager;
import android.util.Log;

import com.getjar.sdk.utilities.Utility;

import org.w3c.dom.Document;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Hashtable;
import java.util.Locale;
import java.util.Map;
import java.util.Timer;
import java.util.TimerTask;
import java.util.Vector;

public class TapjoyConnectCore {
    public static final String TAPJOY_CONNECT = "TapjoyConnect";
    private static String androidID = "";
    private static String appID = "";
    private static String appVersion = "";
    private static String carrierCountryCode = "";
    private static String carrierName = "";
    private static String clientPackage = "";
    private static Hashtable<String, String> connectFlags = null;
    private static String connectionType = "";
    /* access modifiers changed from: private */
    public static Context context = null;
    private static float currencyMultiplier = 1.0f;
    private static String deviceCountryCode = "";
    private static String deviceID = "";
    private static String deviceLanguage = "";
    private static String deviceManufacturer = "";
    private static String deviceModel = "";
    private static String deviceOSVersion = "";
    private static String deviceScreenDensity = "";
    private static String deviceScreenLayoutSize = "";
    private static String deviceType = "";
    private static String libraryVersion = "";
    private static String macAddress = "";
    /* access modifiers changed from: private */
    public static String matchingPackageNames = "";
    private static String mobileCountryCode = "";
    private static String mobileNetworkCode = "";
    /* access modifiers changed from: private */
    public static String paidAppActionID = null;
    private static String platformName = "";
    private static String plugin = TapjoyConstants.TJC_PLUGIN_NATIVE;
    /* access modifiers changed from: private */
    public static String referralURL = "";
    private static String sdkType = "";
    private static String secretKey = "";
    private static String serialID = "";
    private static String sha1MacAddress = "";
    private static String sha2DeviceID = "";
    private static String storeName = "";
    private static TapjoyConnectCore tapjoyConnectCore = null;
    /* access modifiers changed from: private */
    public static TapjoyURLConnection tapjoyURLConnection = null;
    private static String userID = "";
    private static boolean videoEnabled = false;
    private static String videoIDs = "";
    /* access modifiers changed from: private */
    public long elapsed_time = 0;
    private Timer timer = null;

    static /* synthetic */ long access$014(TapjoyConnectCore x0, long x1) {
        long j = x0.elapsed_time + x1;
        x0.elapsed_time = j;
        return j;
    }

    public static TapjoyConnectCore getInstance() {
        return tapjoyConnectCore;
    }

    public static void requestTapjoyConnect(Context applicationContext, String app_ID, String secret_Key) {
        requestTapjoyConnect(applicationContext, app_ID, secret_Key, (Hashtable<String, String>) null);
    }

    public static void requestTapjoyConnect(Context applicationContext, String app_ID, String secret_Key, Hashtable<String, String> flags) {
        appID = app_ID;
        secretKey = secret_Key;
        connectFlags = flags;
        tapjoyConnectCore = new TapjoyConnectCore(applicationContext);
    }

    public TapjoyConnectCore(Context applicationContext) {
        context = applicationContext;
        tapjoyURLConnection = new TapjoyURLConnection();
        init();
        TapjoyLog.i("TapjoyConnect", "URL parameters: " + getURLParams());
        new Thread(new ConnectThread()).start();
    }

    public void callConnect() {
        new Thread(new ConnectThread()).start();
    }

    public static String getURLParams() {
        String urlParams = getGenericURLParams() + Utility.QUERY_APPENDIX;
        long time = System.currentTimeMillis() / 1000;
        return (urlParams + "timestamp=" + time + Utility.QUERY_APPENDIX) + "verifier=" + getVerifier(time);
    }

    public static String getGenericURLParams() {
        return ("" + "app_id=" + Uri.encode(appID) + Utility.QUERY_APPENDIX) + getParamsWithoutAppID();
    }

    private static String getParamsWithoutAppID() {
        String urlParams;
        String urlParams2 = "" + "android_id=" + androidID + Utility.QUERY_APPENDIX;
        if (getFlagValue(TapjoyConnectFlag.SHA_2_UDID) == null || !getFlagValue(TapjoyConnectFlag.SHA_2_UDID).equals("true")) {
            urlParams = urlParams2 + "udid=" + Uri.encode(deviceID) + Utility.QUERY_APPENDIX;
        } else {
            urlParams = urlParams2 + "sha2_udid=" + Uri.encode(sha2DeviceID) + Utility.QUERY_APPENDIX;
        }
        if (macAddress != null && macAddress.length() > 0) {
            urlParams = urlParams + "sha1_mac_address=" + Uri.encode(sha1MacAddress) + Utility.QUERY_APPENDIX;
        }
        if (serialID != null && serialID.length() > 0) {
            urlParams = urlParams + "serial_id=" + Uri.encode(serialID) + Utility.QUERY_APPENDIX;
        }
        String urlParams3 = (((((((((urlParams + "device_name=" + Uri.encode(deviceModel) + Utility.QUERY_APPENDIX) + "device_manufacturer=" + Uri.encode(deviceManufacturer) + Utility.QUERY_APPENDIX) + "device_type=" + Uri.encode(deviceType) + Utility.QUERY_APPENDIX) + "os_version=" + Uri.encode(deviceOSVersion) + Utility.QUERY_APPENDIX) + "country_code=" + Uri.encode(deviceCountryCode) + Utility.QUERY_APPENDIX) + "language_code=" + Uri.encode(deviceLanguage) + Utility.QUERY_APPENDIX) + "app_version=" + Uri.encode(appVersion) + Utility.QUERY_APPENDIX) + "library_version=" + Uri.encode(libraryVersion) + Utility.QUERY_APPENDIX) + "platform=" + Uri.encode(platformName) + Utility.QUERY_APPENDIX) + "display_multiplier=" + Uri.encode(Float.toString(currencyMultiplier));
        if (carrierName.length() > 0) {
            urlParams3 = (urlParams3 + Utility.QUERY_APPENDIX) + "carrier_name=" + Uri.encode(carrierName);
        }
        if (carrierCountryCode.length() > 0) {
            urlParams3 = (urlParams3 + Utility.QUERY_APPENDIX) + "carrier_country_code=" + Uri.encode(carrierCountryCode);
        }
        if (mobileCountryCode.length() > 0) {
            urlParams3 = (urlParams3 + Utility.QUERY_APPENDIX) + "mobile_country_code=" + Uri.encode(mobileCountryCode);
        }
        if (mobileNetworkCode.length() > 0) {
            urlParams3 = (urlParams3 + Utility.QUERY_APPENDIX) + "mobile_network_code=" + Uri.encode(mobileNetworkCode);
        }
        if (deviceScreenDensity.length() > 0 && deviceScreenLayoutSize.length() > 0) {
            urlParams3 = ((urlParams3 + Utility.QUERY_APPENDIX) + "screen_density=" + Uri.encode(deviceScreenDensity) + Utility.QUERY_APPENDIX) + "screen_layout_size=" + Uri.encode(deviceScreenLayoutSize);
        }
        connectionType = getConnectionType();
        if (connectionType.length() > 0) {
            urlParams3 = (urlParams3 + Utility.QUERY_APPENDIX) + "connection_type=" + Uri.encode(connectionType);
        }
        if (plugin.length() > 0) {
            urlParams3 = (urlParams3 + Utility.QUERY_APPENDIX) + "plugin=" + Uri.encode(plugin);
        }
        if (sdkType.length() > 0) {
            urlParams3 = (urlParams3 + Utility.QUERY_APPENDIX) + "sdk_type=" + Uri.encode(sdkType);
        }
        if (storeName.length() <= 0) {
            return urlParams3;
        }
        return (urlParams3 + Utility.QUERY_APPENDIX) + "store_name=" + Uri.encode(storeName);
    }

    private void init() {
        WifiInfo wifiInfo;
        String value;
        PackageManager manager = context.getPackageManager();
        try {
            if (connectFlags == null) {
                connectFlags = new Hashtable<>();
            }
            if (manager != null) {
                ApplicationInfo appInfo = manager.getApplicationInfo(context.getPackageName(), 128);
                if (appInfo == null || appInfo.metaData == null) {
                    TapjoyLog.i("TapjoyConnect", "No metadata present.");
                } else {
                    for (String key : TapjoyConnectFlag.FLAG_ARRAY) {
                        Object obj = appInfo.metaData.get("tapjoy." + key);
                        if (!(obj == null || (value = obj.toString()) == null)) {
                            TapjoyLog.i("TapjoyConnect", "Found manifest flag: " + key + ", " + value);
                            connectFlags.put(key, value);
                        }
                    }
                    TapjoyLog.i("TapjoyConnect", "Metadata successfully loaded");
                }
            }
        } catch (Exception e) {
            TapjoyLog.e("TapjoyConnect", "Error reading manifest meta-data: " + e.toString());
        }
        try {
            androidID = Settings.Secure.getString(context.getContentResolver(), TapjoyConstants.TJC_ANDROID_ID);
            appVersion = manager.getPackageInfo(context.getPackageName(), 0).versionName;
            deviceType = "android";
            platformName = "android";
            deviceModel = Build.MODEL;
            deviceManufacturer = Build.MANUFACTURER;
            deviceOSVersion = Build.VERSION.RELEASE;
            deviceCountryCode = Locale.getDefault().getCountry();
            deviceLanguage = Locale.getDefault().getLanguage();
            libraryVersion = TapjoyConstants.TJC_LIBRARY_VERSION_NUMBER;
            SharedPreferences settings = context.getSharedPreferences(TapjoyConstants.TJC_PREFERENCE, 0);
            try {
                TelephonyManager telephonyManager = (TelephonyManager) context.getSystemService("phone");
                if (telephonyManager != null) {
                    deviceID = telephonyManager.getDeviceId();
                    carrierName = telephonyManager.getNetworkOperatorName();
                    carrierCountryCode = telephonyManager.getNetworkCountryIso();
                    if (telephonyManager.getNetworkOperator() != null && (telephonyManager.getNetworkOperator().length() == 5 || telephonyManager.getNetworkOperator().length() == 6)) {
                        mobileCountryCode = telephonyManager.getNetworkOperator().substring(0, 3);
                        mobileNetworkCode = telephonyManager.getNetworkOperator().substring(3);
                    }
                }
                TapjoyLog.i("TapjoyConnect", "deviceID: " + deviceID);
                boolean invalidDeviceID = false;
                if (deviceID == null) {
                    TapjoyLog.e("TapjoyConnect", "Device id is null.");
                    invalidDeviceID = true;
                } else if (deviceID.length() == 0 || deviceID.equals("000000000000000") || deviceID.equals("0")) {
                    TapjoyLog.e("TapjoyConnect", "Device id is empty or an emulator.");
                    invalidDeviceID = true;
                } else {
                    deviceID = deviceID.toLowerCase();
                }
                TapjoyLog.i("TapjoyConnect", "ANDROID SDK VERSION: " + Build.VERSION.SDK);
                if (Integer.parseInt(Build.VERSION.SDK) >= 9) {
                    TapjoyLog.i("TapjoyConnect", "TRYING TO GET SERIAL OF 2.3+ DEVICE...");
                    serialID = new TapjoyHardwareUtil().getSerial();
                    if (invalidDeviceID) {
                        deviceID = serialID;
                    }
                    TapjoyLog.i("TapjoyConnect", "====================");
                    TapjoyLog.i("TapjoyConnect", "SERIAL: deviceID: [" + deviceID + "]");
                    TapjoyLog.i("TapjoyConnect", "====================");
                    if (deviceID == null) {
                        TapjoyLog.e("TapjoyConnect", "SERIAL: Device id is null.");
                        invalidDeviceID = true;
                    } else if (deviceID.length() == 0 || deviceID.equals("000000000000000") || deviceID.equals("0") || deviceID.equals("unknown")) {
                        TapjoyLog.e("TapjoyConnect", "SERIAL: Device id is empty or an emulator.");
                        invalidDeviceID = true;
                    } else {
                        deviceID = deviceID.toLowerCase();
                        invalidDeviceID = false;
                    }
                }
                if (invalidDeviceID) {
                    StringBuffer buff = new StringBuffer();
                    buff.append("EMULATOR");
                    String deviceId = settings.getString(TapjoyConstants.PREF_EMULATOR_DEVICE_ID, (String) null);
                    if (deviceId == null || deviceId.equals("")) {
                        for (int i = 0; i < 32; i++) {
                            buff.append("1234567890abcdefghijklmnopqrstuvw".charAt(((int) (Math.random() * 100.0d)) % 30));
                        }
                        deviceID = buff.toString().toLowerCase();
                        SharedPreferences.Editor editor = settings.edit();
                        editor.putString(TapjoyConstants.PREF_EMULATOR_DEVICE_ID, deviceID);
                        editor.commit();
                    } else {
                        deviceID = deviceId;
                    }
                }
            } catch (Exception e2) {
                TapjoyLog.e("TapjoyConnect", "Error getting deviceID. e: " + e2.toString());
                deviceID = null;
            }
            if (userID.length() == 0) {
                userID = deviceID;
            }
            sha2DeviceID = TapjoyUtil.SHA256(deviceID);
            try {
                if (Integer.parseInt(Build.VERSION.SDK) > 3) {
                    TapjoyDisplayMetricsUtil displayMetricsUtil = new TapjoyDisplayMetricsUtil(context);
                    deviceScreenDensity = "" + displayMetricsUtil.getScreenDensity();
                    deviceScreenLayoutSize = "" + displayMetricsUtil.getScreenLayoutSize();
                }
            } catch (Exception e3) {
                TapjoyLog.e("TapjoyConnect", "Error getting screen density/dimensions/layout: " + e3.toString());
            }
            try {
                WifiManager wifiManager = (WifiManager) context.getSystemService(TapjoyConstants.TJC_CONNECTION_TYPE_WIFI);
                if (!(wifiManager == null || (wifiInfo = wifiManager.getConnectionInfo()) == null)) {
                    macAddress = wifiInfo.getMacAddress();
                    if (macAddress != null && macAddress.length() > 0) {
                        macAddress = macAddress.toUpperCase();
                        sha1MacAddress = TapjoyUtil.SHA1(macAddress);
                    }
                }
            } catch (Exception e4) {
                TapjoyLog.e("TapjoyConnect", "Error getting device mac address: " + e4.toString());
            }
            if (getFlagValue("store_name") != null && getFlagValue("store_name").length() > 0) {
                storeName = getFlagValue("store_name");
                if (!new ArrayList(Arrays.asList(TapjoyConnectFlag.STORE_ARRAY)).contains(storeName)) {
                    Log.w("TapjoyConnect", "Warning -- undefined STORE_NAME: " + storeName);
                }
            }
            String tempReferralURL = settings.getString(TapjoyConstants.PREF_REFERRAL_URL, (String) null);
            if (tempReferralURL != null && !tempReferralURL.equals("")) {
                referralURL = tempReferralURL;
            }
            clientPackage = context.getPackageName();
            TapjoyLog.i("TapjoyConnect", "APP_ID = [" + appID + "]");
            TapjoyLog.i("TapjoyConnect", "ANDROID_ID: [" + androidID + "]");
            TapjoyLog.i("TapjoyConnect", "CLIENT_PACKAGE = [" + clientPackage + "]");
            TapjoyLog.i("TapjoyConnect", "deviceID: [" + deviceID + "]");
            TapjoyLog.i("TapjoyConnect", "sha2DeviceID: [" + sha2DeviceID + "]");
            TapjoyLog.i("TapjoyConnect", "serial_id: [" + serialID + "]");
            TapjoyLog.i("TapjoyConnect", "mac_address: [" + macAddress + "]");
            TapjoyLog.i("TapjoyConnect", "sha1_mac_address: [" + sha1MacAddress + "]");
            TapjoyLog.i("TapjoyConnect", "deviceName: [" + deviceModel + "]");
            TapjoyLog.i("TapjoyConnect", "deviceManufacturer: [" + deviceManufacturer + "]");
            TapjoyLog.i("TapjoyConnect", "deviceType: [" + deviceType + "]");
            TapjoyLog.i("TapjoyConnect", "libraryVersion: [" + libraryVersion + "]");
            TapjoyLog.i("TapjoyConnect", "deviceOSVersion: [" + deviceOSVersion + "]");
            TapjoyLog.i("TapjoyConnect", "COUNTRY_CODE: [" + deviceCountryCode + "]");
            TapjoyLog.i("TapjoyConnect", "LANGUAGE_CODE: [" + deviceLanguage + "]");
            TapjoyLog.i("TapjoyConnect", "density: [" + deviceScreenDensity + "]");
            TapjoyLog.i("TapjoyConnect", "screen_layout: [" + deviceScreenLayoutSize + "]");
            TapjoyLog.i("TapjoyConnect", "carrier_name: [" + carrierName + "]");
            TapjoyLog.i("TapjoyConnect", "carrier_country_code: [" + carrierCountryCode + "]");
            TapjoyLog.i("TapjoyConnect", "mobile_country_code: [" + mobileCountryCode + "]");
            TapjoyLog.i("TapjoyConnect", "mobile_network_code: [" + mobileNetworkCode + "]");
            TapjoyLog.i("TapjoyConnect", "store_name: [" + storeName + "]");
            TapjoyLog.i("TapjoyConnect", "referralURL: [" + referralURL + "]");
            if (connectFlags != null) {
                TapjoyLog.i("TapjoyConnect", "Connect Flags:");
                TapjoyLog.i("TapjoyConnect", "--------------------");
                for (Map.Entry<String, String> item : connectFlags.entrySet()) {
                    TapjoyLog.i("TapjoyConnect", "key: " + item.getKey() + ", value: " + Uri.encode(item.getValue()));
                    if (item.getKey().equals(TapjoyConnectFlag.SHA_2_UDID) && !sdkType.equals(TapjoyConstants.TJC_SDK_TYPE_CONNECT)) {
                        TapjoyLog.w("TapjoyConnect", "WARNING -- only the Connect/Advertiser SDK can support sha_2_udid");
                        connectFlags.remove(TapjoyConnectFlag.SHA_2_UDID);
                    }
                }
            }
        } catch (Exception e5) {
            TapjoyLog.e("TapjoyConnect", "Error initializing Tapjoy parameters.  e=" + e5.toString());
        }
    }

    private class PaidAppTimerTask extends TimerTask {
        private PaidAppTimerTask() {
        }

        public void run() {
            TapjoyConnectCore.access$014(TapjoyConnectCore.this, 10000);
            TapjoyLog.i("TapjoyConnect", "elapsed_time: " + TapjoyConnectCore.this.elapsed_time + " (" + ((TapjoyConnectCore.this.elapsed_time / 1000) / 60) + "m " + ((TapjoyConnectCore.this.elapsed_time / 1000) % 60) + "s)");
            SharedPreferences.Editor editor = TapjoyConnectCore.context.getSharedPreferences(TapjoyConstants.TJC_PREFERENCE, 0).edit();
            editor.putLong(TapjoyConstants.PREF_ELAPSED_TIME, TapjoyConnectCore.this.elapsed_time);
            editor.commit();
            if (TapjoyConnectCore.this.elapsed_time >= TapjoyConstants.PAID_APP_TIME) {
                TapjoyLog.i("TapjoyConnect", "timer done...");
                if (TapjoyConnectCore.paidAppActionID != null && TapjoyConnectCore.paidAppActionID.length() > 0) {
                    TapjoyLog.i("TapjoyConnect", "Calling PPA actionComplete...");
                    TapjoyConnectCore.this.actionComplete(TapjoyConnectCore.paidAppActionID);
                }
                cancel();
            }
        }
    }

    /* access modifiers changed from: private */
    public static boolean handleConnectResponse(String response) {
        Document document = TapjoyUtil.buildDocument(response);
        if (document != null) {
            String nodeValue = TapjoyUtil.getNodeTrimValue(document.getElementsByTagName("PackageNames"));
            if (nodeValue != null && nodeValue.length() > 0) {
                String data = nodeValue;
                Vector<String> allPackageNames = new Vector<>();
                int current = 0;
                while (true) {
                    int index = data.indexOf(44, current);
                    if (index == -1) {
                        break;
                    }
                    TapjoyLog.i("TapjoyConnect", "parse: " + data.substring(current, index).trim());
                    allPackageNames.add(data.substring(current, index).trim());
                    current = index + 1;
                }
                TapjoyLog.i("TapjoyConnect", "parse: " + data.substring(current).trim());
                allPackageNames.add(data.substring(current).trim());
                matchingPackageNames = "";
                for (ApplicationInfo appInfo : context.getPackageManager().getInstalledApplications(0)) {
                    if ((appInfo.flags & 1) != 1 && allPackageNames.contains(appInfo.packageName)) {
                        TapjoyLog.i("TapjoyConnect", "MATCH: installed packageName: " + appInfo.packageName);
                        if (matchingPackageNames.length() > 0) {
                            matchingPackageNames += ",";
                        }
                        matchingPackageNames += appInfo.packageName;
                    }
                }
            }
            String nodeValue2 = TapjoyUtil.getNodeTrimValue(document.getElementsByTagName("Success"));
            if (nodeValue2 == null || nodeValue2.equals("true")) {
            }
        }
        return true;
    }

    /* access modifiers changed from: private */
    public boolean handlePayPerActionResponse(String response) {
        Document document = TapjoyUtil.buildDocument(response);
        if (document != null) {
            String nodeValue = TapjoyUtil.getNodeTrimValue(document.getElementsByTagName("Success"));
            if (nodeValue == null || !nodeValue.equals("true")) {
                TapjoyLog.e("TapjoyConnect", "Completed Pay-Per-Action call failed.");
            } else {
                TapjoyLog.i("TapjoyConnect", "Successfully sent completed Pay-Per-Action to Tapjoy server.");
                return true;
            }
        }
        return false;
    }

    public void release() {
        tapjoyConnectCore = null;
        tapjoyURLConnection = null;
        TapjoyLog.i("TapjoyConnect", "Releasing core static instance.");
    }

    public static String getAppID() {
        return appID;
    }

    public static String getDeviceID() {
        return deviceID;
    }

    public static String getUserID() {
        return userID;
    }

    public static String getVideoParams() {
        String params = "";
        if (!videoEnabled) {
            params = "hide_videos=true";
        } else if (videoIDs.length() > 0) {
            params = "video_offer_ids=" + videoIDs;
        }
        TapjoyLog.i("TapjoyConnect", "video parameters: " + params);
        return params;
    }

    public static String getCarrierName() {
        return carrierName;
    }

    public static String getConnectionType() {
        String type = "";
        try {
            ConnectivityManager connectivityManager = (ConnectivityManager) context.getSystemService("connectivity");
            if (!(connectivityManager == null || connectivityManager.getActiveNetworkInfo() == null)) {
                switch (connectivityManager.getActiveNetworkInfo().getType()) {
                    case 1:
                    case 6:
                        type = TapjoyConstants.TJC_CONNECTION_TYPE_WIFI;
                        break;
                    default:
                        type = TapjoyConstants.TJC_CONNECTION_TYPE_MOBILE;
                        break;
                }
                TapjoyLog.i("TapjoyConnect", "connectivity: " + connectivityManager.getActiveNetworkInfo().getType());
                TapjoyLog.i("TapjoyConnect", "connection_type: " + type);
            }
        } catch (Exception e) {
            TapjoyLog.e("TapjoyConnect", "getConnectionType error: " + e.toString());
        }
        return type;
    }

    public static String getClientPackage() {
        return clientPackage;
    }

    public static Context getContext() {
        return context;
    }

    public static String getVerifier(long time) {
        try {
            return TapjoyUtil.SHA256(appID + ":" + deviceID + ":" + time + ":" + secretKey);
        } catch (Exception e) {
            TapjoyLog.e("TapjoyConnect", "getVerifier ERROR: " + e.toString());
            return "";
        }
    }

    public static String getAwardPointsVerifier(long time, int amount, String guid) {
        try {
            return TapjoyUtil.SHA256(appID + ":" + deviceID + ":" + time + ":" + secretKey + ":" + amount + ":" + guid);
        } catch (Exception e) {
            TapjoyLog.e("TapjoyConnect", "getAwardPointsVerifier ERROR: " + e.toString());
            return "";
        }
    }

    public static String getEventVerifier(String eventData) {
        try {
            return TapjoyUtil.SHA256(appID + ":" + deviceID + ":" + secretKey + ":" + eventData);
        } catch (Exception e) {
            TapjoyLog.e("TapjoyConnect", "getEventVerifier ERROR: " + e.toString());
            return "";
        }
    }

    public static String getPackageNamesVerifier(long time, String packageNames) {
        try {
            return TapjoyUtil.SHA256(appID + ":" + deviceID + ":" + time + ":" + secretKey + ":" + packageNames);
        } catch (Exception e) {
            TapjoyLog.e("TapjoyConnect", "getVerifier ERROR: " + e.toString());
            return "";
        }
    }

    public static void setPlugin(String name) {
        plugin = name;
    }

    public static void setSDKType(String name) {
        sdkType = name;
    }

    public static void setUserID(String id) {
        userID = id;
        TapjoyLog.i("TapjoyConnect", "URL parameters: " + getURLParams());
        new Thread(new Runnable() {
            public void run() {
                TapjoyLog.i("TapjoyConnect", "setUserID...");
                String connectURLParams = TapjoyConnectCore.getURLParams() + "&publisher_user_id=" + TapjoyConnectCore.getUserID();
                if (!TapjoyConnectCore.referralURL.equals("")) {
                    connectURLParams = connectURLParams + Utility.QUERY_APPENDIX + TapjoyConnectCore.referralURL;
                }
                String result = TapjoyConnectCore.tapjoyURLConnection.connectToURL("https://ws.tapjoyads.com/set_publisher_user_id?", connectURLParams);
                if (result != null) {
                    if (TapjoyConnectCore.handleConnectResponse(result)) {
                    }
                    TapjoyLog.i("TapjoyConnect", "setUserID successful...");
                }
            }
        }).start();
    }

    public static void setVideoIDs(String ids) {
        videoIDs = ids;
    }

    public static void setVideoEnabled(boolean enabled) {
        videoEnabled = enabled;
    }

    public static void setDebugDeviceID(String id) {
        deviceID = id;
        SharedPreferences.Editor editor = context.getSharedPreferences(TapjoyConstants.TJC_PREFERENCE, 0).edit();
        editor.putString(TapjoyConstants.PREF_EMULATOR_DEVICE_ID, deviceID);
        editor.commit();
    }

    public static void saveTapPointsTotal(int total) {
        SharedPreferences.Editor editor = context.getSharedPreferences(TapjoyConstants.TJC_PREFERENCE, 0).edit();
        editor.putInt(TapjoyConstants.PREF_LAST_TAP_POINTS, total);
        editor.commit();
    }

    public static int getLocalTapPointsTotal() {
        return context.getSharedPreferences(TapjoyConstants.TJC_PREFERENCE, 0).getInt(TapjoyConstants.PREF_LAST_TAP_POINTS, -9999);
    }

    public void actionComplete(String actionID) {
        TapjoyLog.i("TapjoyConnect", "actionComplete: " + actionID);
        String actionURLParams = ("app_id=" + actionID + Utility.QUERY_APPENDIX) + getParamsWithoutAppID();
        if (getFlagValue(TapjoyConnectFlag.SHA_2_UDID) == null || !getFlagValue(TapjoyConnectFlag.SHA_2_UDID).equals("true")) {
            actionURLParams = actionURLParams + "&publisher_user_id=" + getUserID();
        }
        String actionURLParams2 = actionURLParams + Utility.QUERY_APPENDIX;
        long time = System.currentTimeMillis() / 1000;
        String actionURLParams3 = (actionURLParams2 + "timestamp=" + time + Utility.QUERY_APPENDIX) + "verifier=" + getVerifier(time);
        TapjoyLog.i("TapjoyConnect", "PPA URL parameters: " + actionURLParams3);
        new Thread(new PPAThread(actionURLParams3)).start();
    }

    public void enablePaidAppWithActionID(String paidAppPayPerActionID) {
        TapjoyLog.i("TapjoyConnect", "enablePaidAppWithActionID: " + paidAppPayPerActionID);
        paidAppActionID = paidAppPayPerActionID;
        this.elapsed_time = context.getSharedPreferences(TapjoyConstants.TJC_PREFERENCE, 0).getLong(TapjoyConstants.PREF_ELAPSED_TIME, 0);
        TapjoyLog.i("TapjoyConnect", "paidApp elapsed: " + this.elapsed_time);
        if (this.elapsed_time >= TapjoyConstants.PAID_APP_TIME) {
            if (paidAppActionID != null && paidAppActionID.length() > 0) {
                TapjoyLog.i("TapjoyConnect", "Calling PPA actionComplete...");
                actionComplete(paidAppActionID);
            }
        } else if (this.timer == null) {
            this.timer = new Timer();
            this.timer.schedule(new PaidAppTimerTask(), 10000, 10000);
        }
    }

    public class ConnectThread implements Runnable {
        public ConnectThread() {
        }

        public void run() {
            TapjoyLog.i("TapjoyConnect", "starting connect call...");
            TapjoyHttpURLResponse httpResponse = TapjoyConnectCore.tapjoyURLConnection.getResponseFromURL("https://ws.tapjoyads.com/connect?", TapjoyConnectCore.getURLParams());
            if (httpResponse != null && httpResponse.statusCode == 200) {
                if (TapjoyConnectCore.handleConnectResponse(httpResponse.response)) {
                    TapjoyLog.i("TapjoyConnect", "Successfully connected to tapjoy site.");
                }
                if (TapjoyConnectCore.matchingPackageNames.length() > 0) {
                    String params = TapjoyConnectCore.getGenericURLParams() + Utility.QUERY_APPENDIX + TapjoyConstants.TJC_PACKAGE_NAMES + "=" + TapjoyConnectCore.matchingPackageNames + Utility.QUERY_APPENDIX;
                    long time = System.currentTimeMillis() / 1000;
                    TapjoyHttpURLResponse httpResponse2 = TapjoyConnectCore.tapjoyURLConnection.getResponseFromURL("https://ws.tapjoyads.com/apps_installed?", (params + "timestamp=" + time + Utility.QUERY_APPENDIX) + "verifier=" + TapjoyConnectCore.getPackageNamesVerifier(time, TapjoyConnectCore.matchingPackageNames));
                    if (httpResponse2 != null && httpResponse2.statusCode == 200) {
                        TapjoyLog.i("TapjoyConnect", "Successfully pinged sdkless api.");
                    }
                }
            }
        }
    }

    public class PPAThread implements Runnable {
        private String params;

        public PPAThread(String urlParams) {
            this.params = urlParams;
        }

        public void run() {
            String result = TapjoyConnectCore.tapjoyURLConnection.connectToURL("https://ws.tapjoyads.com/connect?", this.params);
            if (result != null) {
                boolean unused = TapjoyConnectCore.this.handlePayPerActionResponse(result);
            }
        }
    }

    public void setCurrencyMultiplier(float multiplier) {
        TapjoyLog.i("TapjoyConnect", "setVirtualCurrencyMultiplier: " + multiplier);
        currencyMultiplier = multiplier;
    }

    public float getCurrencyMultiplier() {
        return currencyMultiplier;
    }

    public static String getFlagValue(String key) {
        if (connectFlags != null) {
            return connectFlags.get(key);
        }
        return "";
    }
}
