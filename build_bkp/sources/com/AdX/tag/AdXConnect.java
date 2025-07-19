package com.AdX.tag;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.database.Cursor;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Build;
import android.provider.Settings;
import android.telephony.TelephonyManager;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.WindowManager;
import com.getjar.sdk.utilities.Utility;
import com.tapjoy.TapjoyConstants;
import java.io.ByteArrayInputStream;
import java.util.Locale;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public final class AdXConnect {
    public static final String ATTRIBUTION_ID_COLUMN_NAME = "aid";
    public static final Uri ATTRIBUTION_ID_CONTENT_URI = Uri.parse("content://com.facebook.katana.provider.AttributionIdProvider");
    private static AdXConnect AdXConnectEventInstance = null;
    private static AdXConnect AdXConnectInstance = null;
    private static AdXURLConnection AdXURLConnection = null;
    private static String AdX_PREFERENCE = "AdXPrefrences";
    private static String MODREFERRAL = "AdXReferral";
    private static String RECEIVER_DONE = "ReceiverDone";
    private static String REFERRAL_URL = TapjoyConstants.PREF_REFERRAL_URL;
    private static String UPDATE = "AdXUpdate";
    /* access modifiers changed from: private */
    public static String referralURL = "";
    private String AdXClickURL = "";
    private String SEND_TAG = "SendTag";
    private String androidID = "";
    private String appID = "";
    private String appVersion = "";
    /* access modifiers changed from: private */
    public String clientID = "";
    private ConnectEventTask connectEventTask = null;
    private ConnectTask connectTask = null;
    private Context context = null;
    private String deviceCountryCode = "";
    private String deviceID = "";
    private String deviceLanguage = "";
    private String deviceName = "";
    private String deviceOSVersion = "";
    private String deviceScreenDensity = "";
    private String deviceScreenLayoutSize = "";
    private String deviceType = "";
    private String fbattribution = "";
    private String libraryVersion = "";
    private String tagVersion = "2.3.8";
    /* access modifiers changed from: private */
    public String urlParams = "";

    public static AdXConnect getAdXConnectInstance(Context context2, boolean update) {
        SharedPreferences settings = context2.getSharedPreferences(AdX_PREFERENCE, 0);
        SharedPreferences.Editor editor = settings.edit();
        int updateValue = settings.getInt(UPDATE, -1);
        if (updateValue < 0) {
            if (update) {
                editor.putInt(UPDATE, 1);
                updateValue = 1;
            } else {
                editor.putInt(UPDATE, 0);
                updateValue = 0;
            }
            Log.i("AdXAppTracker", "Update flag set to " + updateValue);
        }
        String receiverDone = settings.getString(RECEIVER_DONE, (String) null);
        if (updateValue == 1 || (receiverDone != null && receiverDone.equals("done"))) {
            Log.i("AdXAppTracker", "Sending to AdX");
            if (AdXURLConnection == null) {
                AdXURLConnection = new AdXURLConnection();
            }
            if (AdXConnectInstance == null) {
                AdXConnectInstance = new AdXConnect(context2, updateValue);
            }
            return AdXConnectInstance;
        }
        Log.i("AdXAppTracker", "Re Referral yet - deferring..");
        editor.putString(RECEIVER_DONE, "done");
        editor.commit();
        return null;
    }

    public static void doBroadcastConnectInstance(Context context2) {
        if (AdXURLConnection == null) {
            AdXURLConnection = new AdXURLConnection();
        }
        if (AdXConnectInstance == null) {
            AdXConnectInstance = new AdXConnect(context2, 0);
        }
        Log.i("AdXAppTracker", "Broadcast Receiver - sending to AdX.");
        SharedPreferences.Editor editor = context2.getSharedPreferences(AdX_PREFERENCE, 0).edit();
        editor.putString(RECEIVER_DONE, "done");
        editor.commit();
    }

    public static AdXConnect getAdXConnectEventInstance(Context context2, String event, String data, String currency) {
        if (AdXURLConnection == null) {
            AdXURLConnection = new AdXURLConnection();
        }
        if (AdXConnectEventInstance != null) {
            AdXConnectEventInstance = null;
        }
        AdXConnectEventInstance = new AdXConnect(context2, event, data, currency);
        return AdXConnectEventInstance;
    }

    public static String getAdXReferral(Context context2, int timeout) {
        SharedPreferences settings = context2.getSharedPreferences(AdX_PREFERENCE, 0);
        String tempReferralURL = settings.getString(MODREFERRAL, (String) null);
        int count = 0;
        while (count < timeout && (tempReferralURL == null || tempReferralURL.equals(""))) {
            try {
                Thread.sleep(1000);
                count++;
                tempReferralURL = settings.getString(MODREFERRAL, (String) null);
                Log.i("AdXAppTracker", "Count " + count + " " + tempReferralURL);
            } catch (Exception e) {
            }
        }
        return tempReferralURL;
    }

    private AdXConnect(Context ctx, int update) {
        this.context = ctx;
        String sendTag = this.context.getSharedPreferences(AdX_PREFERENCE, 0).getString(this.SEND_TAG, (String) null);
        if (sendTag == null || !sendTag.equals("stop")) {
            getApplicationData();
            getFacebookAttributionId(this.context);
            this.urlParams = String.valueOf(this.urlParams) + "udid=" + this.deviceID + Utility.QUERY_APPENDIX;
            this.urlParams = String.valueOf(this.urlParams) + "androidID=" + this.androidID + Utility.QUERY_APPENDIX;
            this.urlParams = String.valueOf(this.urlParams) + "device_name=" + this.deviceName + Utility.QUERY_APPENDIX;
            this.urlParams = String.valueOf(this.urlParams) + "device_type=" + this.deviceType + Utility.QUERY_APPENDIX;
            this.urlParams = String.valueOf(this.urlParams) + "os_version=" + this.deviceOSVersion + Utility.QUERY_APPENDIX;
            this.urlParams = String.valueOf(this.urlParams) + "country_code=" + this.deviceCountryCode + Utility.QUERY_APPENDIX;
            this.urlParams = String.valueOf(this.urlParams) + "language=" + this.deviceLanguage + Utility.QUERY_APPENDIX;
            this.urlParams = String.valueOf(this.urlParams) + "app_id=" + this.appID + Utility.QUERY_APPENDIX;
            this.urlParams = String.valueOf(this.urlParams) + "clientid=" + this.clientID + Utility.QUERY_APPENDIX;
            this.urlParams = String.valueOf(this.urlParams) + "app_version=" + this.appVersion + Utility.QUERY_APPENDIX;
            this.urlParams = String.valueOf(this.urlParams) + "tag_version=" + this.tagVersion + Utility.QUERY_APPENDIX;
            this.urlParams = String.valueOf(this.urlParams) + "fbattribution=" + this.fbattribution + Utility.QUERY_APPENDIX;
            this.urlParams = String.valueOf(this.urlParams) + "update=" + update;
            if (this.deviceScreenDensity.length() > 0 && this.deviceScreenLayoutSize.length() > 0) {
                this.urlParams = String.valueOf(this.urlParams) + Utility.QUERY_APPENDIX;
                this.urlParams = String.valueOf(this.urlParams) + "screen_density=" + this.deviceScreenDensity + Utility.QUERY_APPENDIX;
                this.urlParams = String.valueOf(this.urlParams) + "screen_layout_size=" + this.deviceScreenLayoutSize;
            }
            this.connectTask = new ConnectTask(this, (ConnectTask) null);
            this.connectTask.execute(new Void[0]);
            return;
        }
        Log.i("AdXAppTracker", "SendTag is set to stop ");
    }

    private AdXConnect(Context ctx, String event, String data, String currency) {
        this.context = ctx;
        Log.i("AdXAppTracker", "In Constructor ");
        getApplicationData();
        Log.i("AdXAppTracker", "Got Application Data ");
        this.urlParams = String.valueOf(this.urlParams) + "udid=" + this.deviceID + Utility.QUERY_APPENDIX;
        this.urlParams = String.valueOf(this.urlParams) + "androidID=" + this.androidID + Utility.QUERY_APPENDIX;
        this.urlParams = String.valueOf(this.urlParams) + "device_name=" + this.deviceName + Utility.QUERY_APPENDIX;
        this.urlParams = String.valueOf(this.urlParams) + "device_type=" + this.deviceType + Utility.QUERY_APPENDIX;
        this.urlParams = String.valueOf(this.urlParams) + "os_version=" + this.deviceOSVersion + Utility.QUERY_APPENDIX;
        this.urlParams = String.valueOf(this.urlParams) + "country_code=" + this.deviceCountryCode + Utility.QUERY_APPENDIX;
        this.urlParams = String.valueOf(this.urlParams) + "language=" + this.deviceLanguage + Utility.QUERY_APPENDIX;
        this.urlParams = String.valueOf(this.urlParams) + "app_id=" + this.appID + Utility.QUERY_APPENDIX;
        this.urlParams = String.valueOf(this.urlParams) + "event=" + event + Utility.QUERY_APPENDIX;
        this.urlParams = String.valueOf(this.urlParams) + "data=" + data + Utility.QUERY_APPENDIX;
        this.urlParams = String.valueOf(this.urlParams) + "currency=" + currency;
        if (!this.AdXClickURL.equals("")) {
            this.urlParams = String.valueOf(this.urlParams) + "AdXClickURL=" + this.AdXClickURL;
        }
        this.connectEventTask = new ConnectEventTask(this, (ConnectEventTask) null);
        this.connectEventTask.execute(new Void[0]);
    }

    public static String getFacebookAttributionId(Context context2) {
        String[] projection = {"aid"};
        String attributionId = "";
        try {
            Cursor c = context2.getContentResolver().query(ATTRIBUTION_ID_CONTENT_URI, projection, (String) null, (String[]) null, (String) null);
            if (c == null || !c.moveToFirst()) {
                return null;
            }
            attributionId = c.getString(c.getColumnIndex("aid"));
            return attributionId;
        } catch (Exception e) {
            Log.i("AdXAppTracker", e.getMessage());
            Log.i("AdXAppTracker", "Retry");
            try {
                Cursor c2 = context2.getContentResolver().query(ATTRIBUTION_ID_CONTENT_URI, projection, (String) null, (String[]) null, (String) null);
                if (c2 == null || !c2.moveToFirst()) {
                    return null;
                }
                attributionId = c2.getString(c2.getColumnIndex("aid"));
            } catch (Exception e2) {
                Log.i("AdXAppTracker", e2.getMessage());
            }
        }
    }

    private void getApplicationData() {
        PackageManager manager = this.context.getPackageManager();
        try {
            this.androidID = Settings.Secure.getString(this.context.getContentResolver(), TapjoyConstants.TJC_ANDROID_ID);
            ApplicationInfo info = manager.getApplicationInfo(this.context.getPackageName(), 128);
            if (info == null || info.metaData == null) {
                Log.e("AdXAppTracker", "Add APP_ID to AndroidManifest.xml file. For more detail integration document.");
                return;
            }
            String metaDataValue = info.metaData.getString("APP_NAME");
            if (metaDataValue == null || metaDataValue.equals("")) {
                Log.e("AdXAppTracker", "APP_NAME can't be empty.");
                return;
            }
            this.appID = metaDataValue.trim();
            String metaDataValue2 = info.metaData.getString("ADX_CLIENT_ID");
            if (metaDataValue2 == null || metaDataValue2.equals("")) {
                Log.e("AdXAppTracker", "ADX_CLIENT_ID can't be empty.");
                return;
            }
            this.clientID = metaDataValue2.trim();
            this.appVersion = manager.getPackageInfo(this.context.getPackageName(), 0).versionName;
            this.deviceType = "android";
            this.deviceName = Build.MODEL;
            this.deviceOSVersion = Build.VERSION.RELEASE;
            this.deviceCountryCode = Locale.getDefault().getCountry();
            this.deviceLanguage = Locale.getDefault().getLanguage();
            this.libraryVersion = this.tagVersion;
            SharedPreferences settings = this.context.getSharedPreferences(AdX_PREFERENCE, 0);
            String metaDataValue3 = info.metaData.getString("DEVICE_ID");
            if (metaDataValue3 == null || metaDataValue3.equals("")) {
                try {
                    TelephonyManager telephonyManager = (TelephonyManager) this.context.getSystemService("phone");
                    if (telephonyManager != null) {
                        this.deviceID = telephonyManager.getDeviceId();
                    }
                    boolean invalidDeviceID = false;
                    if (this.deviceID == null) {
                        Log.e("AdXAppTracker", "Device id is null.");
                        invalidDeviceID = true;
                    } else if (this.deviceID.length() == 0 || this.deviceID.equals("000000000000000") || this.deviceID.equals("0")) {
                        Log.e("AdXAppTracker", "Device id is empty or an emulator.");
                        invalidDeviceID = true;
                    } else {
                        this.deviceID = this.deviceID.toLowerCase();
                    }
                    if (invalidDeviceID) {
                        StringBuffer buff = new StringBuffer();
                        buff.append("EMULATOR");
                        String deviceId = settings.getString(TapjoyConstants.PREF_EMULATOR_DEVICE_ID, (String) null);
                        if (deviceId == null || deviceId.equals("")) {
                            for (int i = 0; i < 32; i++) {
                                buff.append("1234567890abcdefghijklmnopqrstuvw".charAt(((int) (Math.random() * 100.0d)) % 30));
                            }
                            this.deviceID = buff.toString().toLowerCase();
                            SharedPreferences.Editor editor = settings.edit();
                            editor.putString(TapjoyConstants.PREF_EMULATOR_DEVICE_ID, this.deviceID);
                            editor.commit();
                        } else {
                            this.deviceID = deviceId;
                        }
                    }
                } catch (Exception e) {
                    Log.e("AdXAppTracker", "Error getting deviceID. e: " + e.toString());
                    this.deviceID = null;
                }
            } else {
                this.deviceID = metaDataValue3;
            }
            try {
                ((WindowManager) this.context.getSystemService("window")).getDefaultDisplay().getMetrics(new DisplayMetrics());
            } catch (Exception e2) {
                Log.e("AdXAppTracker", "Error getting screen density/dimensions/layout: " + e2.toString());
            }
            String tempReferralURL = settings.getString(REFERRAL_URL, (String) null);
            if (tempReferralURL != null && !tempReferralURL.equals("")) {
                referralURL = tempReferralURL;
            }
            Log.i("AdXAppTracker", "Metadata successfully loaded");
            Log.i("AdXAppTracker", "APP_ID = [" + this.appID + "]");
            Log.i("AdXAppTracker", "deviceName: [" + this.deviceName + "]");
            Log.i("AdXAppTracker", "deviceType: [" + this.deviceType + "]");
            Log.i("AdXAppTracker", "libraryVersion: [" + this.libraryVersion + "]");
            Log.i("AdXAppTracker", "deviceOSVersion: [" + this.deviceOSVersion + "]");
            Log.i("AdXAppTracker", "COUNTRY_CODE: [" + this.deviceCountryCode + "]");
            Log.i("AdXAppTracker", "LANGUAGE_CODE: [" + this.deviceLanguage + "]");
            Log.i("AdXAppTracker", "density: [" + this.deviceScreenDensity + "]");
            Log.i("AdXAppTracker", "screen_layout: [" + this.deviceScreenLayoutSize + "]");
            Log.i("AdXAppTracker", "referralURL: [" + referralURL + "]");
        } catch (PackageManager.NameNotFoundException e3) {
            Log.e("AdXAppTracker", "Add APP_ID to AndroidManifest.xml file. For more detail integration document.");
        }
    }

    private class ConnectTask extends AsyncTask<Void, Void, Boolean> {
        private ConnectTask() {
        }

        /* synthetic */ ConnectTask(AdXConnect adXConnect, ConnectTask connectTask) {
            this();
        }

        /* access modifiers changed from: protected */
        public Boolean doInBackground(Void... params) {
            boolean returnValue = false;
            String connectURLParams = AdXConnect.this.urlParams;
            if (!AdXConnect.referralURL.equals("")) {
                connectURLParams = String.valueOf(connectURLParams) + Utility.QUERY_APPENDIX + AdXConnect.referralURL;
            }
            String result = AdXURLConnection.connectToURL("http://ad-x.co.uk/atrk/andrdapp?", connectURLParams);
            if (result != null) {
                returnValue = AdXConnect.this.handleConnectResponse(result);
            }
            return Boolean.valueOf(returnValue);
        }
    }

    private class ConnectEventTask extends AsyncTask<Void, Void, Boolean> {
        private ConnectEventTask() {
        }

        /* synthetic */ ConnectEventTask(AdXConnect adXConnect, ConnectEventTask connectEventTask) {
            this();
        }

        /* access modifiers changed from: protected */
        public Boolean doInBackground(Void... params) {
            boolean returnValue = false;
            String result = AdXURLConnection.connectToURL("http://ad-x.co.uk/API/androidevent.php?oursecret=" + AdXConnect.this.clientID + Utility.QUERY_APPENDIX, AdXConnect.this.urlParams);
            if (result != null) {
                returnValue = AdXConnect.this.handleConnectResponse(result);
            }
            return Boolean.valueOf(returnValue);
        }
    }

    /* access modifiers changed from: private */
    public boolean handleConnectResponse(String response) {
        Document document = buildDocument(response);
        if (document != null) {
            String nodeValue1 = getNodeTrimValue(document.getElementsByTagName("Referral"));
            if (nodeValue1 != null) {
                Log.i("AdXAppTracker", "Successfully get returned referral " + nodeValue1);
                SharedPreferences.Editor editor = this.context.getSharedPreferences(AdX_PREFERENCE, 0).edit();
                editor.putString(MODREFERRAL, nodeValue1);
                editor.commit();
            }
            String nodeValue = getNodeTrimValue(document.getElementsByTagName("Success"));
            if (nodeValue != null && nodeValue.equals("true")) {
                Log.i("AdXAppTracker", "Successfully connected to AdX site.");
                return true;
            } else if (nodeValue == null || !nodeValue.equals("stop")) {
                Log.e("AdXAppTracker", "AdX Connect call failed.");
            } else {
                Log.i("AdXAppTracker", "Successfully connected to AdX site - stopping tags from now on.");
                SharedPreferences.Editor editor2 = this.context.getSharedPreferences(AdX_PREFERENCE, 0).edit();
                editor2.putString(this.SEND_TAG, "stop");
                editor2.commit();
                return true;
            }
        }
        return false;
    }

    private Document buildDocument(String xml) {
        try {
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            return factory.newDocumentBuilder().parse(new ByteArrayInputStream(xml.getBytes("UTF-8")));
        } catch (Exception e) {
            Log.e("AdXAppTracker", "buildDocument exception: " + e.toString());
            return null;
        }
    }

    private String getNodeTrimValue(NodeList nodeList) {
        Element element = (Element) nodeList.item(0);
        String nodeValue = "";
        if (element == null) {
            return null;
        }
        NodeList itemNodeList = element.getChildNodes();
        int length = itemNodeList.getLength();
        for (int i = 0; i < length; i++) {
            Node node = itemNodeList.item(i);
            if (node != null) {
                nodeValue = String.valueOf(nodeValue) + node.getNodeValue();
            }
        }
        if (nodeValue == null || nodeValue.equals("")) {
            return null;
        }
        return nodeValue.trim();
    }

    public void finalize() {
        AdXConnectInstance = null;
        AdXConnectEventInstance = null;
        Log.i("AdX App Tracker", "Cleaning resources.");
    }
}
