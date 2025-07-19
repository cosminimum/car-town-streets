package com.apsalar.sdk;

import android.content.Context;
import android.content.pm.PackageManager;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Build;
import android.provider.Settings;
import com.tapjoy.TapjoyConstants;
import org.json.JSONException;
import org.json.JSONObject;
/* JADX INFO: Access modifiers changed from: package-private */
/* compiled from: Apsalar.java */
/* loaded from: classes.dex */
public class ApsalarSessionInfo implements ApsalarJSON {
    protected String abi;
    protected String apiKey;
    protected String appName;
    protected String appVersion;
    protected String brand;
    protected String clsPackage;
    protected String connType;
    protected String device;
    protected String deviceId;
    protected JSONObject known_items;
    protected String manufacturer;
    protected String model;
    protected String osVersion;
    protected String platform;
    protected String product;
    protected String retType;
    protected String sdkVersion;
    protected String secret;
    protected String sessionId;
    protected long sessionStart;

    /* JADX INFO: Access modifiers changed from: protected */
    public ApsalarSessionInfo(JSONObject jSONObject, String str, String str2) {
        this.sessionStart = 0L;
        this.sdkVersion = "4.0.0";
        try {
            this.sessionStart = jSONObject.getLong("sessionStart");
            this.apiKey = str;
            this.secret = str2;
            this.abi = jSONObject.has("abi") ? jSONObject.getString("abi") : "unknown";
            this.platform = jSONObject.has(TapjoyConstants.TJC_PLATFORM) ? jSONObject.getString(TapjoyConstants.TJC_PLATFORM) : "Android";
            this.clsPackage = jSONObject.has("clsPackage") ? jSONObject.getString("clsPackage") : "unknown";
            this.appVersion = jSONObject.has("appVersion") ? jSONObject.getString("appVersion") : "unknown";
            this.deviceId = jSONObject.has("deviceId") ? jSONObject.getString("deviceId") : "unspecified";
            this.sessionId = jSONObject.has("sessionId") ? jSONObject.getString("sessionId") : "unspecified";
            this.retType = jSONObject.has("retType") ? jSONObject.getString("retType") : "json";
            this.connType = jSONObject.has("connType") ? jSONObject.getString("connType") : TapjoyConstants.TJC_CONNECTION_TYPE_WIFI;
            this.appName = jSONObject.has("appName") ? jSONObject.getString("appName") : "unknown";
            this.osVersion = jSONObject.has("osVersion") ? jSONObject.getString("osVersion") : "unknown";
            this.brand = jSONObject.has("brand") ? jSONObject.getString("brand") : "unknown";
            this.device = jSONObject.has("device") ? jSONObject.getString("device") : "unknown";
            this.manufacturer = jSONObject.has("manufacturer") ? jSONObject.getString("manufacturer") : "unknown";
            this.model = jSONObject.has("model") ? jSONObject.getString("model") : "unknown";
            this.product = jSONObject.has("product") ? jSONObject.getString("product") : "unknown";
            this.sdkVersion = jSONObject.has("sdkVersion") ? jSONObject.getString("sdkVersion") : "unspecified";
        } catch (JSONException e) {
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public ApsalarSessionInfo(Context context, String str, String str2) {
        this.sessionStart = 0L;
        this.sdkVersion = "4.0.0";
        this.apiKey = str;
        this.secret = str2;
        PackageManager packageManager = context.getPackageManager();
        this.platform = "Android";
        this.clsPackage = context.getPackageName();
        try {
            this.appVersion = packageManager.getPackageInfo(this.clsPackage, 0).versionName;
        } catch (PackageManager.NameNotFoundException e) {
            this.appVersion = "unknown";
        }
        this.deviceId = Settings.Secure.getString(context.getContentResolver(), TapjoyConstants.TJC_ANDROID_ID);
        if (this.deviceId == null) {
            this.deviceId = "unspecified";
        }
        this.sessionId = Apsalar.getNewSessionId();
        this.retType = "json";
        this.connType = TapjoyConstants.TJC_CONNECTION_TYPE_WIFI;
        NetworkInfo networkInfo = ((ConnectivityManager) context.getSystemService("connectivity")).getNetworkInfo(0);
        if (networkInfo != null && networkInfo.isConnected()) {
            this.connType = "wwan";
        }
        try {
            this.appName = packageManager.getApplicationLabel(packageManager.getApplicationInfo(this.clsPackage, 128)).toString();
        } catch (PackageManager.NameNotFoundException e2) {
            this.appName = "unknown";
        } catch (NullPointerException e3) {
            this.appName = "unknown";
        }
        this.osVersion = Build.VERSION.RELEASE;
        this.brand = Build.BRAND;
        this.device = Build.DEVICE;
        try {
            this.abi = (String) Build.class.getDeclaredField("CPU_ABI").get(Build.class);
        } catch (Throwable th) {
            this.abi = "unknown";
        }
        try {
            this.manufacturer = (String) Build.class.getDeclaredField("MANUFACTURER").get(Build.class);
        } catch (Throwable th2) {
            this.manufacturer = "unknown";
        }
        this.model = Build.MODEL;
        this.product = Build.PRODUCT;
        this.abi = this.abi != null ? this.abi : "unknown";
        this.platform = this.platform != null ? this.platform : "Android";
        this.clsPackage = this.clsPackage != null ? this.clsPackage : "unknown";
        this.appVersion = this.appVersion != null ? this.appVersion : "unknown";
        this.deviceId = this.deviceId != null ? this.deviceId : "unspecified";
        this.sessionId = this.sessionId != null ? this.sessionId : "unspecified";
        this.retType = this.retType != null ? this.retType : "json";
        this.connType = this.connType != null ? this.connType : TapjoyConstants.TJC_CONNECTION_TYPE_WIFI;
        this.appName = this.appName != null ? this.appName : "unknown";
        this.osVersion = this.osVersion != null ? this.osVersion : "unknown";
        this.brand = this.brand != null ? this.brand : "unknown";
        this.device = this.device != null ? this.device : "unknown";
        this.manufacturer = this.manufacturer != null ? this.manufacturer : "unknown";
        this.model = this.model != null ? this.model : "unknown";
        this.product = this.product != null ? this.product : "unknown";
        this.sdkVersion = this.sdkVersion != null ? this.sdkVersion : "unspecified";
    }

    @Override // com.apsalar.sdk.ApsalarJSON
    public JSONObject toJSON() {
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put("sessionStart", this.sessionStart);
            jSONObject.put("apiKey", this.apiKey);
            jSONObject.put("secret", this.secret);
            jSONObject.put("abi", this.abi);
            jSONObject.put(TapjoyConstants.TJC_PLATFORM, this.platform);
            jSONObject.put("clsPackage", this.clsPackage);
            jSONObject.put("appVersion", this.appVersion);
            jSONObject.put("deviceId", this.deviceId);
            jSONObject.put("sessionId", this.sessionId);
            jSONObject.put("retType", this.retType);
            jSONObject.put("connType", this.connType);
            jSONObject.put("appName", this.appName);
            jSONObject.put("osVersion", this.osVersion);
            jSONObject.put("brand", this.brand);
            jSONObject.put("device", this.device);
            jSONObject.put("manufacturer", this.manufacturer);
            jSONObject.put("model", this.model);
            jSONObject.put("product", this.product);
            jSONObject.put("sdkVersion", this.sdkVersion);
        } catch (JSONException e) {
        }
        return jSONObject;
    }
}
