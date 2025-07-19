package com.getjar.sdk.data;

import android.content.Context;
import android.os.Build;
import android.provider.Settings;
import android.telephony.TelephonyManager;
import com.getjar.sdk.comm.UserAgentValuesManager;
import com.getjar.sdk.data.MetadataValue;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import com.getjar.sdk.utilities.Constants;
import com.getjar.sdk.utilities.OverridesUtility;
import com.getjar.sdk.utilities.RewardUtility;
import com.getjar.sdk.utilities.StringUtility;
import com.getjar.sdk.utilities.Utility;
import com.tapjoy.TapjoyConstants;
import java.lang.reflect.InvocationTargetException;
import java.util.Collections;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import org.json.JSONException;

public class DeviceMetadata {
    public static String KEY_ANDROID_DEVICE_ANDROID_ID = "android.device.android_id";
    public static String KEY_ANDROID_DEVICE_BOARD = "android.device.board";
    public static String KEY_ANDROID_DEVICE_BRAND = "android.device.brand";
    public static String KEY_ANDROID_DEVICE_DEVICE_ID = "android.device.device_id";
    public static String KEY_ANDROID_DEVICE_HARDWARE = "android.device.hardware";
    public static String KEY_ANDROID_DEVICE_MANUFACTURER = "android.device.manufacturer";
    public static String KEY_ANDROID_DEVICE_MODEL = "android.device.model";
    public static String KEY_ANDROID_DEVICE_PRODUCT = "android.device.product";
    public static String KEY_ANDROID_DEVICE_SERIAL_NUMBER = "android.device.serial_number";
    public static String KEY_ANDROID_OS_INCREMENTAL = "android.os.incremental";
    public static String KEY_ANDROID_OS_RELEASE = "android.os.release";
    public static String KEY_ANDROID_OS_SDK_INT = "android.os.sdk_int";
    public static String KEY_DEVICE_PLATFORM = Constants.META_DEVICE_PLATFORM;
    public static String KEY_DEVICE_PLATFORM_VERSION = Constants.META_DEVICE_PLATFORM_VERSION;
    private final Context _context;
    private Map<String, String> _deviceMetadata = null;
    private Map<String, MetadataValue> _deviceMetadataWithReliability = null;

    public DeviceMetadata(Context context) {
        this._context = context;
        OverridesUtility.initialize(context);
        int sdkInt = findSdkInt(context);
        String hardware = findHardware(context);
        String manufacturer = findManufacturer(context);
        String serialNumber = findSerialNo(context, sdkInt);
        if (StringUtility.isNullOrEmpty(serialNumber)) {
            Logger.w(Area.AUTH.value(), "Failed to get a serial number");
        }
        String androidId = findAndroidId(context);
        if (StringUtility.isNullOrEmpty(androidId)) {
            Logger.w(Area.AUTH.value(), "Failed to get the Android ID");
        }
        String deviceId = findDeviceId(context);
        if (StringUtility.isNullOrEmpty(androidId)) {
            Logger.w(Area.AUTH.value(), "Failed to get the device ID [TelephonyManager.getDeviceId()]");
        }
        this._deviceMetadata = new HashMap(14);
        this._deviceMetadata.put(KEY_DEVICE_PLATFORM, "android");
        this._deviceMetadata.put(KEY_DEVICE_PLATFORM_VERSION, Build.VERSION.RELEASE);
        this._deviceMetadata.put(KEY_ANDROID_DEVICE_ANDROID_ID, androidId);
        this._deviceMetadata.put(KEY_ANDROID_DEVICE_BOARD, Build.BOARD);
        this._deviceMetadata.put(KEY_ANDROID_DEVICE_BRAND, Build.BRAND);
        this._deviceMetadata.put(KEY_ANDROID_DEVICE_DEVICE_ID, deviceId);
        this._deviceMetadata.put(KEY_ANDROID_DEVICE_HARDWARE, hardware);
        this._deviceMetadata.put(KEY_ANDROID_DEVICE_MANUFACTURER, manufacturer);
        this._deviceMetadata.put(KEY_ANDROID_DEVICE_MODEL, Build.MODEL);
        this._deviceMetadata.put(KEY_ANDROID_DEVICE_PRODUCT, Build.PRODUCT);
        this._deviceMetadata.put(KEY_ANDROID_DEVICE_SERIAL_NUMBER, serialNumber);
        this._deviceMetadata.put(KEY_ANDROID_OS_INCREMENTAL, Build.VERSION.INCREMENTAL);
        this._deviceMetadata.put(KEY_ANDROID_OS_RELEASE, Build.VERSION.RELEASE);
        this._deviceMetadata.put(KEY_ANDROID_OS_SDK_INT, Integer.toString(sdkInt));
        this._deviceMetadata.put(Constants.META_LEGACY_UA, UserAgentValuesManager.getInstance().getWebKitUserAgent(context));
        this._deviceMetadataWithReliability = new HashMap(14);
        this._deviceMetadataWithReliability.put(KEY_DEVICE_PLATFORM, getMetadataValueInstance("android"));
        this._deviceMetadataWithReliability.put(KEY_DEVICE_PLATFORM_VERSION, getMetadataValueInstance(Build.VERSION.RELEASE));
        this._deviceMetadataWithReliability.put(KEY_ANDROID_DEVICE_ANDROID_ID, getMetadataValueInstance(androidId));
        this._deviceMetadataWithReliability.put(KEY_ANDROID_DEVICE_BOARD, getMetadataValueInstance(Build.BOARD));
        this._deviceMetadataWithReliability.put(KEY_ANDROID_DEVICE_BRAND, getMetadataValueInstance(Build.BRAND));
        this._deviceMetadataWithReliability.put(KEY_ANDROID_DEVICE_DEVICE_ID, getMetadataValueInstance(deviceId));
        this._deviceMetadataWithReliability.put(KEY_ANDROID_DEVICE_HARDWARE, getMetadataValueInstance(hardware));
        this._deviceMetadataWithReliability.put(KEY_ANDROID_DEVICE_MANUFACTURER, getMetadataValueInstance(manufacturer));
        this._deviceMetadataWithReliability.put(KEY_ANDROID_DEVICE_MODEL, getMetadataValueInstance(Build.MODEL));
        this._deviceMetadataWithReliability.put(KEY_ANDROID_DEVICE_PRODUCT, getMetadataValueInstance(Build.PRODUCT));
        this._deviceMetadataWithReliability.put(KEY_ANDROID_DEVICE_SERIAL_NUMBER, getMetadataValueInstance(serialNumber));
        this._deviceMetadataWithReliability.put(KEY_ANDROID_OS_INCREMENTAL, getMetadataValueInstance(Build.VERSION.INCREMENTAL));
        this._deviceMetadataWithReliability.put(KEY_ANDROID_OS_RELEASE, getMetadataValueInstance(Build.VERSION.RELEASE));
        this._deviceMetadataWithReliability.put(KEY_ANDROID_OS_SDK_INT, getMetadataValueInstance(Integer.toString(sdkInt)));
        this._deviceMetadataWithReliability.put(Constants.META_LEGACY_UA, getMetadataValueInstance(UserAgentValuesManager.getInstance().getWebKitUserAgent(context)));
    }

    private MetadataValue getMetadataValueInstance(String value) {
        return new MetadataValue(value, StringUtility.isNullOrEmpty(value) ? MetadataValue.MetadataReliability.NOT_AVAILABLE : MetadataValue.MetadataReliability.AVAILABLE);
    }

    public Map<String, String> getMetadata() {
        if (StringUtility.isNullOrEmpty(this._deviceMetadata.get(Constants.META_LEGACY_UA))) {
            this._deviceMetadata.put(Constants.META_LEGACY_UA, UserAgentValuesManager.getInstance().getWebKitUserAgent(this._context));
        }
        return Collections.unmodifiableMap(this._deviceMetadata);
    }

    public Map<String, MetadataValue> getMetadataWithReliability() {
        MetadataValue value = this._deviceMetadataWithReliability.get(Constants.META_LEGACY_UA);
        if (value == null || StringUtility.isNullOrEmpty(value.getValue())) {
            this._deviceMetadataWithReliability.put(Constants.META_LEGACY_UA, getMetadataValueInstance(UserAgentValuesManager.getInstance().getWebKitUserAgent(this._context)));
        }
        return Collections.unmodifiableMap(this._deviceMetadataWithReliability);
    }

    public String getMetadataValue(String name) {
        return getMetadata().get(name);
    }

    private String findDeviceId(Context context) {
        String overrideDeviceID = OverridesUtility.getValueFakeID("identity.device.id");
        if (!StringUtility.isNullOrEmpty(overrideDeviceID)) {
            Logger.v(Area.AUTH.value(), String.format(Locale.US, "[*** OVERRIDE ***] Override value being used: 'identity.device.id' = '%1$s'", new Object[]{overrideDeviceID}));
            return overrideDeviceID;
        } else if (RewardUtility.checkPermission(context, Utility.READ_PHONE_STATE_PERMISSION)) {
            return ((TelephonyManager) context.getSystemService("phone")).getDeviceId();
        } else {
            return "";
        }
    }

    private String findAndroidId(Context context) {
        String overrideAndroidID = OverridesUtility.getValueFakeID("identity.android.id");
        if (!StringUtility.isNullOrEmpty(overrideAndroidID)) {
            Logger.v(Area.AUTH.value(), String.format(Locale.US, "[*** OVERRIDE ***] Override value being used: 'identity.android.id' = '%1$s'", new Object[]{overrideAndroidID}));
            return overrideAndroidID;
        }
        String androidID = Settings.Secure.getString(context.getContentResolver(), TapjoyConstants.TJC_ANDROID_ID);
        return (androidID == null || androidID.length() <= 1) ? "" : androidID;
    }

    private String findSerialNo(Context context, int sdkLevel) {
        String overrideSerialNumber = OverridesUtility.getValueFakeID("identity.serial.number");
        if (!StringUtility.isNullOrEmpty(overrideSerialNumber)) {
            Logger.v(Area.AUTH.value(), String.format(Locale.US, "[*** OVERRIDE ***] Override value being used: 'identity.serial.number' = '%1$s'", new Object[]{overrideSerialNumber}));
            return overrideSerialNumber;
        } else if (sdkLevel >= 9) {
            try {
                return (String) Build.class.getDeclaredField("SERIAL").get((Object) null);
            } catch (ClassNotFoundException | IllegalAccessException | NoSuchFieldException | NoSuchMethodException | InvocationTargetException e) {
                return "";
            }
        } else {
            Class<?> c = Class.forName("android.os.SystemProperties");
            return (String) c.getMethod("get", new Class[]{String.class, String.class}).invoke(c, new Object[]{"ro.serialno", null});
        }
    }

    private int findSdkInt(Context context) {
        try {
            return Build.VERSION.class.getDeclaredField("SDK_INT").getInt((Object) null);
        } catch (Exception e) {
            try {
                return Integer.parseInt(Build.VERSION.SDK);
            } catch (Exception e2) {
                return 3;
            }
        }
    }

    private String findHardware(Context context) {
        try {
            return (String) Build.class.getDeclaredField("HARDWARE").get((Object) null);
        } catch (Exception e) {
            return "";
        }
    }

    private String findManufacturer(Context context) {
        try {
            return (String) Build.class.getDeclaredField("MANUFACTURER").get((Object) null);
        } catch (Exception e) {
            return "";
        }
    }

    public String toJsonString() throws JSONException {
        return Utility.mapToJsonString(getMetadata());
    }

    public String toJsonStringWithReliabilities() throws JSONException {
        return Utility.metadataMapToJsonString(getMetadataWithReliability());
    }
}
