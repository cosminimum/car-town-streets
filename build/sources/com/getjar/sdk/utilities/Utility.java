package com.getjar.sdk.utilities;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.content.res.Configuration;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.os.Environment;
import android.os.Looper;
import android.provider.Settings;
import android.telephony.TelephonyManager;
import com.getjar.sdk.GetJarManager;
import com.getjar.sdk.comm.Result;
import com.getjar.sdk.data.MetadataValue;
import com.getjar.sdk.exceptions.ServiceException;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import com.tapjoy.TapjoyConstants;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.nio.channels.FileChannel;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Enumeration;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Random;
import java.util.TimeZone;
import java.util.UUID;
import java.util.zip.GZIPInputStream;
import java.util.zip.GZIPOutputStream;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class Utility {
    public static final String ACCESS_WIFI_STATE_PERMISSION = "android.permission.ACCESS_WIFI_STATE";
    public static final String GETJAR_CLIENT_PARAM = "gjclnt=1";
    private static final String GETJAR_V1_DB = "GetJarRewardsDB";
    public static final String PREFERENCES_FILE_NAME = "GetJarClientPrefs";
    public static final String PREFERENCES_KEY_DEVICEOBJECTID = "DeviceObjectID";
    public static final String PREFERENCES_KEY_FIRST_RUN_FLAG = "FirstRunFlag";
    public static final String PREFERENCES_KEY_FIRST_UX_RUN_FLAG = "FirstUXRun";
    public static final String PREFERENCES_KEY_INSTALLATIONID = "InstallationID";
    public static final String PREFERENCES_KEY_INSTALL_TIME = "InstallTime";
    public static final String PREFERENCES_KEY_LAUNCH_COUNT = "LaunchCount";
    public static final String PREFERENCES_KEY_LOCALE = "Locale";
    public static final String PREFERENCES_KEY_SANDBOX = "SandBox";
    public static final String PREFERENCES_KEY_USER_ACCESS_ID = "UserAccessID";
    public static final String PREFERENCES_KEY_USER_ID = "UserID";
    public static final String QUERY_APPENDIX = "&";
    public static final String QUERY_START = "?";
    public static final String READ_PHONE_STATE_PERMISSION = "android.permission.READ_PHONE_STATE";
    private static Random sRnd = new Random();

    private Utility() {
    }

    public static String gzipDecompress(byte[] compressed) throws IOException {
        ByteArrayInputStream is = new ByteArrayInputStream(compressed);
        GZIPInputStream gis = new GZIPInputStream(is, 32);
        StringBuilder string = new StringBuilder();
        byte[] data = new byte[32];
        while (true) {
            int bytesRead = gis.read(data);
            if (bytesRead != -1) {
                string.append(new String(data, 0, bytesRead));
            } else {
                gis.close();
                is.close();
                return string.toString();
            }
        }
    }

    public static byte[] gzipCompress(String string) throws IOException {
        ByteArrayOutputStream os = new ByteArrayOutputStream(string.length());
        GZIPOutputStream gos = new GZIPOutputStream(os);
        gos.write(string.getBytes());
        gos.close();
        byte[] compressed = os.toByteArray();
        os.close();
        return compressed;
    }

    public static String getCurrentLocale(Context context) {
        return context.getResources().getConfiguration().locale.getDisplayName();
    }

    public static String getDefaultLocale() {
        return Locale.getDefault().getDisplayName();
    }

    public static void setLocale(Context context, String newlocale) {
        Locale locale = new Locale(newlocale);
        Locale.setDefault(locale);
        Configuration config = new Configuration();
        config.locale = locale;
        context.getResources().updateConfiguration(config, context.getResources().getDisplayMetrics());
    }

    public static String epochToISO8601(long epoch) {
        GregorianCalendar calendar = new GregorianCalendar(TimeZone.getTimeZone("GMT"));
        calendar.setTimeInMillis(epoch);
        return String.format(Locale.US, "%1$04d-%2$02d-%3$02dT%4$02d:%5$02d:%6$02dZ", new Object[]{Integer.valueOf(calendar.get(1)), Integer.valueOf(calendar.get(2) + 1), Integer.valueOf(calendar.get(5)), Integer.valueOf(calendar.get(11)), Integer.valueOf(calendar.get(12)), Integer.valueOf(calendar.get(13))});
    }

    public static Date adjustUTCDate(Date date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        return new Date(calendar.getTimeInMillis() + ((long) calendar.get(15)) + ((long) calendar.get(16)));
    }

    public static void saveLocale(Context context, String newlocale) {
        context.getSharedPreferences("GetJarClientPrefs", 0).edit().putString(PREFERENCES_KEY_LOCALE, newlocale).commit();
    }

    public static String getLocale(Context context) {
        return context.getSharedPreferences("GetJarClientPrefs", 0).getString(PREFERENCES_KEY_LOCALE, (String) null);
    }

    public static String getImageDataFromResource(Context context, Integer resourceId, int boundWidth, int boundHeight) {
        if (context == null) {
            throw new IllegalArgumentException("context cannot be null");
        } else if (resourceId == null) {
            throw new IllegalArgumentException("resourceId cannot be null");
        } else {
            if (boundWidth <= 0 || boundWidth > 512) {
                boundWidth = 512;
            }
            if (boundHeight <= 0 || boundHeight > 512) {
                boundHeight = 512;
            }
            BitmapFactory.Options options = new BitmapFactory.Options();
            options.inJustDecodeBounds = true;
            BitmapFactory.decodeResource(context.getResources(), resourceId.intValue(), options);
            options.inSampleSize = calculateInSampleSize(options, boundWidth, boundHeight);
            options.inJustDecodeBounds = false;
            Bitmap bmp = BitmapFactory.decodeResource(context.getResources(), resourceId.intValue(), options);
            if (bmp == null) {
                return null;
            }
            ByteArrayOutputStream bos = new ByteArrayOutputStream();
            bmp.compress(Bitmap.CompressFormat.JPEG, 90, bos);
            String format = String.format(Locale.US, "data:image/jpeg;base64,%s", new Object[]{Base64.encodeBytes(bos.toByteArray())});
            bmp.recycle();
            return format;
        }
    }

    private static int calculateInSampleSize(BitmapFactory.Options options, int reqWidth, int reqHeight) {
        int height = options.outHeight;
        int width = options.outWidth;
        if (height <= reqHeight && width <= reqWidth) {
            return 1;
        }
        if (width > height) {
            return Math.round(((float) height) / ((float) reqHeight));
        }
        return Math.round(((float) width) / ((float) reqWidth));
    }

    public static void previousVersionCleanUp(Context context) {
        boolean isCleanUp = true;
        String[] arr$ = context.databaseList();
        int len$ = arr$.length;
        int i$ = 0;
        while (true) {
            if (i$ >= len$) {
                break;
            }
            String db = arr$[i$];
            Logger.m640d(Area.STORAGE.value(), "database:" + db);
            if (db.equalsIgnoreCase(GETJAR_V1_DB)) {
                isCleanUp = false;
                break;
            }
            i$++;
        }
        if (!isCleanUp) {
            context.deleteDatabase(GETJAR_V1_DB);
            SharedPreferences.Editor editor = context.getSharedPreferences("GetJarClientPrefs", 0).edit();
            editor.clear();
            editor.clear();
            editor.commit();
        }
    }

    public static void setUserAccessId(Context context, String userAccessId) {
        context.getSharedPreferences("GetJarClientPrefs", 0).edit().putString(PREFERENCES_KEY_USER_ACCESS_ID, userAccessId).commit();
    }

    public static String getUserAccessId(Context context) {
        return context.getSharedPreferences("GetJarClientPrefs", 0).getString(PREFERENCES_KEY_USER_ACCESS_ID, (String) null);
    }

    public static void saveSandboxMode(Context context, boolean sandboxMode) {
        context.getSharedPreferences("GetJarClientPrefs", 0).edit().putBoolean(PREFERENCES_KEY_SANDBOX, sandboxMode).commit();
    }

    public static boolean getSandboxMode(Context context) {
        return context.getSharedPreferences("GetJarClientPrefs", 0).getBoolean(PREFERENCES_KEY_SANDBOX, false);
    }

    public static String getPackageNameFromBroadcastIntent(Intent intent) {
        if (intent == null) {
            throw new IllegalArgumentException("Must have a valid intent.");
        }
        Uri uri = intent.getData();
        if (uri != null) {
            return uri.getSchemeSpecificPart();
        }
        return null;
    }

    public static Integer getStaticIntegerField(Class<?> sourceType, String fieldName) throws IllegalArgumentException, IllegalAccessException {
        if (sourceType == null) {
            throw new IllegalArgumentException("Must have a valid source type.");
        } else if (StringUtility.isNullOrEmpty(fieldName)) {
            throw new IllegalArgumentException("Must have a valid field name.");
        } else {
            try {
                return Integer.valueOf(sourceType.getDeclaredField(fieldName).getInt((Object) null));
            } catch (NoSuchFieldException e) {
                return null;
            }
        }
    }

    public static void copyFile(File in, File out) throws IOException {
        if (in == null) {
            throw new IllegalArgumentException("Input File have a valid context.");
        } else if (out == null) {
            throw new IllegalArgumentException("Output File have a valid context.");
        } else {
            FileChannel inChannel = new FileInputStream(in).getChannel();
            FileChannel outChannel = new FileOutputStream(out).getChannel();
            try {
                inChannel.transferTo(0, inChannel.size(), outChannel);
            } finally {
                if (inChannel != null) {
                    inChannel.close();
                }
                if (outChannel != null) {
                    outChannel.close();
                }
            }
        }
    }

    public static String getInstallationID(Context context) {
        if (context == null) {
            throw new IllegalArgumentException("Must have a valid context.");
        }
        OverridesUtility.initialize(context);
        String overrideDeviceID = OverridesUtility.getValueFakeID("identity.device.id");
        if (!StringUtility.isNullOrEmpty(overrideDeviceID)) {
            Logger.m646v(Area.AUTH.value() | Area.STORAGE.value(), String.format(Locale.US, "[*** OVERRIDE ***] Override value being used: 'identity.device.id' = '%1$s'", new Object[]{overrideDeviceID}));
            return overrideDeviceID;
        }
        SharedPreferences prefs = context.getSharedPreferences("GetJarClientPrefs", 0);
        if (prefs.contains(PREFERENCES_KEY_INSTALLATIONID)) {
            return prefs.getString(PREFERENCES_KEY_INSTALLATIONID, (String) null);
        }
        String installationID = Settings.Secure.getString(context.getContentResolver(), TapjoyConstants.TJC_ANDROID_ID);
        if (installationID == null) {
            installationID = Long.toString(System.currentTimeMillis(), 36) + Integer.toString(sRnd.nextInt(Integer.MAX_VALUE), 36);
        }
        prefs.edit().putString(PREFERENCES_KEY_INSTALLATIONID, installationID).commit();
        return installationID;
    }

    public static String getDeviceObjectId(Context context) {
        if (context == null) {
            throw new IllegalArgumentException("Must have a valid context.");
        }
        OverridesUtility.initialize(context);
        String overrideDeviceID = OverridesUtility.getValueFakeID("identity.device.id");
        if (!StringUtility.isNullOrEmpty(overrideDeviceID)) {
            Logger.m646v(Area.AUTH.value() | Area.STORAGE.value(), String.format(Locale.US, "[*** OVERRIDE ***] Override value being used: 'identity.device.id' = '%1$s'", new Object[]{overrideDeviceID}));
            return overrideDeviceID;
        }
        SharedPreferences prefs = context.getSharedPreferences("GetJarClientPrefs", 0);
        if (prefs.contains(PREFERENCES_KEY_DEVICEOBJECTID)) {
            return prefs.getString(PREFERENCES_KEY_DEVICEOBJECTID, (String) null);
        }
        String id = null;
        if (RewardUtility.checkPermission(context, READ_PHONE_STATE_PERMISSION)) {
            id = ((TelephonyManager) context.getSystemService("phone")).getDeviceId();
        }
        if (id == null || id.length() <= 0) {
            try {
                Class<?> c = Class.forName("android.os.SystemProperties");
                id = (String) c.getMethod("get", new Class[]{String.class, String.class}).invoke(c, new Object[]{"ro.serialno", null});
            } catch (ClassNotFoundException | IllegalAccessException | NoSuchMethodException | InvocationTargetException e) {
            }
        }
        if (id == null || id.length() <= 0) {
            id = Settings.Secure.getString(context.getContentResolver(), TapjoyConstants.TJC_ANDROID_ID);
        }
        if (id == null || id.length() <= 0) {
            id = UUID.randomUUID().toString();
        }
        prefs.edit().putString(PREFERENCES_KEY_DEVICEOBJECTID, id).commit();
        return id;
    }

    public static String getAndroidID(Context context) {
        if (context == null) {
            throw new IllegalArgumentException("Must have a valid context.");
        }
        OverridesUtility.initialize(context);
        String overrideAndroidID = OverridesUtility.getValueFakeID("identity.android.id");
        if (!StringUtility.isNullOrEmpty(overrideAndroidID)) {
            Logger.m646v(Area.AUTH.value(), String.format(Locale.US, "[*** OVERRIDE ***] Override value being used: 'identity.android.id' = '%1$s'", new Object[]{overrideAndroidID}));
            return overrideAndroidID;
        }
        String androidID = Settings.Secure.getString(context.getContentResolver(), TapjoyConstants.TJC_ANDROID_ID);
        if (androidID == null || androidID.length() <= 1) {
            return null;
        }
        return androidID;
    }

    public static File getExternalCacheLocation() {
        File file = new File(Environment.getExternalStorageDirectory(), GetJarManager.GetjarIntentKey + File.separator + "cache");
        file.mkdirs();
        return file;
    }

    public static File[] getCacheLocations(Context context) {
        if (context == null) {
            throw new IllegalArgumentException("Must have a valid context.");
        }
        return new File[]{getExternalCacheLocation(), context.getFilesDir(), context.getCacheDir()};
    }

    public static long getResponseAmount(Result reqResult, long defaultValue) {
        long amount = defaultValue;
        JSONObject responseJson = reqResult.getResponseJson();
        if (responseJson == null || responseJson.length() <= 0) {
            return amount;
        }
        try {
            return (long) responseJson.getJSONObject("return").getInt("amount");
        } catch (JSONException e) {
            Logger.m643e(Area.EARN.value() | Area.TRANSACTION.value(), "getResponseAmount() failed", e);
            return amount;
        }
    }

    public static String getResponseSubstate(Exception cause, String defaultValue) {
        Logger.m640d(Area.COMM.value(), "getResponseSubstate() -- START: defaultValue=" + defaultValue);
        String substate = defaultValue;
        if (cause != null && cause.getClass().isInstance(ServiceException.class)) {
            try {
                Result reqResult = ((ServiceException) cause).getRequestResult();
                Logger.m640d(Area.COMM.value(), "getResponseSubstate() -- RequestResult=" + reqResult.toString());
                substate = reqResult.getErrorResponseSubcode();
                if (StringUtility.isNullOrEmpty(substate)) {
                    substate = defaultValue;
                }
            } catch (ClassCastException e) {
                Logger.m643e(Area.COMM.value(), "getResponseSubstate() failed", e);
            }
        }
        Logger.m640d(Area.COMM.value(), "getResponseSubstate() -- DONE: substate=" + substate);
        return substate;
    }

    public static long getResponseAmount(Exception cause, long defaultValue) {
        JSONObject responseJson;
        long amount = defaultValue;
        if (!cause.getClass().isInstance(ServiceException.class) || (responseJson = ((ServiceException) cause).getRequestResult().getResponseJson()) == null || responseJson.length() <= 0) {
            return amount;
        }
        try {
            return (long) responseJson.getJSONObject("return").getInt("amount");
        } catch (JSONException e) {
            Logger.m643e(Area.EARN.value(), "getResponseAmount() failed", e);
            return amount;
        }
    }

    public static boolean isCurrentThreadTheUIThread() {
        return Looper.getMainLooper() == Looper.myLooper();
    }

    public static HashMap<String, String> jsonArrayStringToMapUnchange(String jsonStr) throws JSONException {
        HashMap<String, String> resultMap = new HashMap<>();
        Logger.m640d(Area.COMM.value(), "Outside Unchange:" + jsonStr);
        if (!StringUtility.isNullOrEmpty(jsonStr)) {
            Logger.m640d(Area.COMM.value(), "Inside");
            JSONArray jarray = new JSONArray(jsonStr);
            Logger.m640d(Area.COMM.value(), "JSONARRAY size:" + jarray.length());
            for (int i = 0; i < jarray.length(); i++) {
                JSONObject jo = jarray.getJSONObject(i);
                Iterator<String> nameItr = jo.keys();
                while (nameItr.hasNext()) {
                    String key = nameItr.next();
                    resultMap.put(key, jo.getString(key));
                }
            }
        }
        for (Map.Entry<String, String> entry : resultMap.entrySet()) {
            Logger.m640d(Area.COMM.value(), entry.getKey() + ", " + entry.getValue());
        }
        return resultMap;
    }

    public static HashMap<String, String> jsonArrayStringToMap(String jsonStr) throws JSONException {
        HashMap<String, String> resultMap = new HashMap<>();
        if (!StringUtility.isNullOrEmpty(jsonStr)) {
            JSONArray jarray = new JSONArray(jsonStr);
            for (int i = 0; i < jarray.length(); i++) {
                JSONObject jo = jarray.getJSONObject(i);
                if (jo.isNull("value")) {
                    resultMap.put(jo.getString("key"), (Object) null);
                } else {
                    resultMap.put(jo.getString("key"), jo.getString("value"));
                }
            }
        }
        return resultMap;
    }

    public static String mapToJsonString(Map<String, String> map) throws JSONException {
        JSONArray jasonArray = new JSONArray();
        for (Map.Entry next : map.entrySet()) {
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("key", next.getKey());
            jsonObject.put("value", next.getValue());
            jsonObject.put("value", next.getValue() == null ? JSONObject.NULL : next.getValue());
            jasonArray.put(jsonObject);
        }
        return jasonArray.toString();
    }

    public static String metadataMapToJsonString(Map<String, MetadataValue> map) throws JSONException {
        if (map == null) {
            throw new IllegalArgumentException("'map' can not be NULL");
        }
        JSONArray jasonArray = new JSONArray();
        for (Map.Entry<String, MetadataValue> entry : map.entrySet()) {
            Object value = entry.getValue().getValue();
            JSONObject jsonValueObject = new JSONObject();
            if (value == null) {
                value = JSONObject.NULL;
            }
            jsonValueObject.put("value", value);
            jsonValueObject.put("reliability", entry.getValue().getReliability().name());
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("key", entry.getKey());
            jsonObject.put("value", jsonValueObject);
            jasonArray.put(jsonObject);
        }
        return jasonArray.toString();
    }

    public static String jsonObjectMapToJsonString(Map<String, JSONObject> map) throws JSONException {
        if (map == null) {
            throw new IllegalArgumentException("'map' can not be NULL");
        }
        JSONArray jsonArray = new JSONArray();
        for (Map.Entry<String, JSONObject> entry : map.entrySet()) {
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("key", entry.getKey());
            jsonObject.put("value", entry.getValue());
            jsonArray.put(jsonObject);
        }
        return jsonArray.toString();
    }

    public static long convertMillSec(long seconds) {
        return 1000 * seconds;
    }

    public static boolean isExistApp(Context context, String packageName) {
        try {
            if (context.getPackageManager().getApplicationInfo(packageName, 0) != null) {
                Logger.m640d(Area.EARN.value(), "ReportUsage: isExistApp() -- TRUE..");
                return true;
            }
            Logger.m640d(Area.EARN.value(), "ReportUsage: isExistApp() -- (appInfo NULL) FALSE..");
            return false;
        } catch (PackageManager.NameNotFoundException e) {
            Logger.m640d(Area.EARN.value(), "ReportUsage: isExistApp() -- (NameNotFoundException) FALSE..");
            return false;
        }
    }

    public static List<String> getLocalIpAddresses() {
        List<String> ipAddressList = new ArrayList<>();
        try {
            Enumeration<NetworkInterface> networkInterfaces = NetworkInterface.getNetworkInterfaces();
            while (networkInterfaces.hasMoreElements()) {
                Enumeration<InetAddress> ipAddresses = networkInterfaces.nextElement().getInetAddresses();
                while (ipAddresses.hasMoreElements()) {
                    InetAddress ipAddress = ipAddresses.nextElement();
                    if (!ipAddress.isLoopbackAddress()) {
                        ipAddressList.add(ipAddress.getHostAddress());
                    }
                }
            }
        } catch (Exception e) {
            Logger.m643e(Area.COMM.value(), "getLocalIpAddresses() failed", e);
        }
        return ipAddressList;
    }
}
