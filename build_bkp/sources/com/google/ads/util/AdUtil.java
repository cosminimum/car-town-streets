package com.google.ads.util;

import android.app.Activity;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.location.Location;
import android.media.AudioManager;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.net.Uri;
import android.os.Build;
import android.provider.Settings;
import android.util.DisplayMetrics;
import android.webkit.WebView;
import com.getjar.sdk.comm.ServiceProxyBase;
import com.getjar.sdk.utilities.Utility;
import com.google.ads.AdActivity;
import com.google.ads.AdRequest;
import com.millennialmedia.android.MMAdView;
import com.tapjoy.TapjoyConstants;
import java.io.IOException;
import java.math.BigInteger;
import java.net.HttpURLConnection;
import java.nio.CharBuffer;
import java.security.GeneralSecurityException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public final class AdUtil {

    /* renamed from: a */
    public static final int f1033a = m984a(Build.VERSION.SDK);

    /* renamed from: b */
    private static Boolean f1034b = null;

    /* renamed from: c */
    private static String f1035c = null;

    /* renamed from: d */
    private static String f1036d;

    /* renamed from: e */
    private static String f1037e = null;

    /* renamed from: f */
    private static AudioManager f1038f;

    /* renamed from: g */
    private static boolean f1039g = true;

    /* renamed from: h */
    private static boolean f1040h = false;

    /* renamed from: i */
    private static String f1041i = null;

    /* renamed from: com.google.ads.util.AdUtil$a */
    public enum C0505a {
        INVALID,
        SPEAKER,
        HEADPHONES,
        VIBRATE,
        EMULATOR,
        OTHER
    }

    /* renamed from: a */
    public static boolean m995a(Intent intent, Context context) {
        return context.getPackageManager().resolveActivity(intent, 65536) != null;
    }

    /* renamed from: a */
    public static String m988a(Readable readable) throws IOException {
        StringBuilder sb = new StringBuilder();
        CharBuffer allocate = CharBuffer.allocate(2048);
        while (true) {
            int read = readable.read(allocate);
            if (read == -1) {
                return sb.toString();
            }
            allocate.flip();
            sb.append(allocate, 0, read);
        }
    }

    /* renamed from: a */
    public static int m984a(String str) {
        try {
            return Integer.parseInt(str);
        } catch (NumberFormatException e) {
            C0508b.m1036e("The Android SDK version couldn't be parsed to an int: " + Build.VERSION.SDK);
            C0508b.m1036e("Defaulting to Android SDK version 3.");
            return 3;
        }
    }

    /* renamed from: a */
    public static String m986a(Context context) {
        String str;
        if (f1035c == null) {
            String string = Settings.Secure.getString(context.getContentResolver(), TapjoyConstants.TJC_ANDROID_ID);
            if (string == null || m1006c()) {
                str = m1001b("emulator");
            } else {
                str = m1001b(string);
            }
            if (str == null) {
                return null;
            }
            f1035c = str.toUpperCase(Locale.US);
        }
        return f1035c;
    }

    /* renamed from: a */
    public static int m982a() {
        if (f1033a >= 9) {
            return 6;
        }
        return 0;
    }

    /* renamed from: b */
    public static int m998b() {
        if (f1033a >= 9) {
            return 7;
        }
        return 1;
    }

    /* renamed from: a */
    public static int m983a(Context context, DisplayMetrics displayMetrics) {
        if (f1033a >= 4) {
            return C0516e.m1048a(context, displayMetrics);
        }
        return displayMetrics.heightPixels;
    }

    /* renamed from: b */
    public static int m999b(Context context, DisplayMetrics displayMetrics) {
        if (f1033a >= 4) {
            return C0516e.m1049b(context, displayMetrics);
        }
        return displayMetrics.widthPixels;
    }

    /* renamed from: b */
    public static boolean m1004b(Context context) {
        PackageManager packageManager = context.getPackageManager();
        String packageName = context.getPackageName();
        if (packageManager.checkPermission("android.permission.INTERNET", packageName) == -1) {
            C0508b.m1030b("INTERNET permissions must be enabled in AndroidManifest.xml.");
            return false;
        } else if (packageManager.checkPermission("android.permission.ACCESS_NETWORK_STATE", packageName) != -1) {
            return true;
        } else {
            C0508b.m1030b("ACCESS_NETWORK_STATE permissions must be enabled in AndroidManifest.xml.");
            return false;
        }
    }

    /* renamed from: a */
    public static boolean m994a(int i, int i2, String str) {
        if ((i & i2) != 0) {
            return true;
        }
        C0508b.m1030b("The android:configChanges value of the com.google.ads.AdActivity must include " + str + ".");
        return false;
    }

    /* renamed from: c */
    public static boolean m1007c(Context context) {
        if (f1034b != null) {
            return f1034b.booleanValue();
        }
        ResolveInfo resolveActivity = context.getPackageManager().resolveActivity(new Intent(context, AdActivity.class), 65536);
        f1034b = true;
        if (resolveActivity == null || resolveActivity.activityInfo == null) {
            C0508b.m1030b("Could not find com.google.ads.AdActivity, please make sure it is registered in AndroidManifest.xml.");
            f1034b = false;
        } else {
            if (!m994a(resolveActivity.activityInfo.configChanges, 16, "keyboard")) {
                f1034b = false;
            }
            if (!m994a(resolveActivity.activityInfo.configChanges, 32, "keyboardHidden")) {
                f1034b = false;
            }
            if (!m994a(resolveActivity.activityInfo.configChanges, 128, MMAdView.KEY_ORIENTATION)) {
                f1034b = false;
            }
            if (!m994a(resolveActivity.activityInfo.configChanges, 256, "screenLayout")) {
                f1034b = false;
            }
            if (!m994a(resolveActivity.activityInfo.configChanges, 512, "uiMode")) {
                f1034b = false;
            }
            if (!m994a(resolveActivity.activityInfo.configChanges, 1024, "screenSize")) {
                f1034b = false;
            }
            if (!m994a(resolveActivity.activityInfo.configChanges, 2048, "smallestScreenSize")) {
                f1034b = false;
            }
        }
        return f1034b.booleanValue();
    }

    /* renamed from: c */
    public static boolean m1006c() {
        return m997a((C0515d) null);
    }

    /* renamed from: a */
    static boolean m997a(C0515d dVar) {
        if (dVar == null) {
            dVar = C0515d.f1077d;
        }
        return dVar.equals(C0515d.f1078e);
    }

    /* renamed from: a */
    public static boolean m996a(Uri uri) {
        if (uri == null) {
            return false;
        }
        String scheme = uri.getScheme();
        if ("http".equalsIgnoreCase(scheme) || "https".equalsIgnoreCase(scheme)) {
            return true;
        }
        return false;
    }

    /* renamed from: b */
    public static String m1001b(String str) {
        if (str == null || str.length() <= 0) {
            return null;
        }
        try {
            MessageDigest instance = MessageDigest.getInstance("MD5");
            instance.update(str.getBytes(), 0, str.length());
            return String.format(Locale.US, "%032X", new Object[]{new BigInteger(1, instance.digest())});
        } catch (NoSuchAlgorithmException e) {
            return str.substring(0, 32);
        }
    }

    /* renamed from: d */
    public static String m1008d(Context context) {
        NetworkInfo activeNetworkInfo = ((ConnectivityManager) context.getSystemService("connectivity")).getActiveNetworkInfo();
        if (activeNetworkInfo == null) {
            return null;
        }
        switch (activeNetworkInfo.getType()) {
            case 0:
                return "ed";
            case 1:
                return "wi";
            default:
                return "unknown";
        }
    }

    /* renamed from: e */
    public static String m1010e(Context context) {
        if (f1036d == null) {
            StringBuilder sb = new StringBuilder();
            PackageManager packageManager = context.getPackageManager();
            List<ResolveInfo> queryIntentActivities = packageManager.queryIntentActivities(new Intent("android.intent.action.VIEW", Uri.parse("geo:0,0?q=donuts")), 65536);
            if (queryIntentActivities == null || queryIntentActivities.size() == 0) {
                sb.append(AdActivity.TYPE_PARAM);
            }
            List<ResolveInfo> queryIntentActivities2 = packageManager.queryIntentActivities(new Intent("android.intent.action.VIEW", Uri.parse("market://search?q=pname:com.google")), 65536);
            if (queryIntentActivities2 == null || queryIntentActivities2.size() == 0) {
                if (sb.length() > 0) {
                    sb.append(",");
                }
                sb.append("a");
            }
            List<ResolveInfo> queryIntentActivities3 = packageManager.queryIntentActivities(new Intent("android.intent.action.VIEW", Uri.parse("tel://6509313940")), 65536);
            if (queryIntentActivities3 == null || queryIntentActivities3.size() == 0) {
                if (sb.length() > 0) {
                    sb.append(",");
                }
                sb.append("t");
            }
            f1036d = sb.toString();
        }
        return f1036d;
    }

    /* renamed from: f */
    public static String m1011f(Context context) {
        ActivityInfo activityInfo;
        PackageInfo packageInfo;
        if (f1037e != null) {
            return f1037e;
        }
        try {
            PackageManager packageManager = context.getPackageManager();
            ResolveInfo resolveActivity = packageManager.resolveActivity(new Intent("android.intent.action.VIEW", Uri.parse("market://details?id=com.google.ads")), 65536);
            if (resolveActivity == null || (activityInfo = resolveActivity.activityInfo) == null || (packageInfo = packageManager.getPackageInfo(activityInfo.packageName, 0)) == null) {
                return null;
            }
            f1037e = packageInfo.versionCode + "." + activityInfo.packageName;
            return f1037e;
        } catch (PackageManager.NameNotFoundException e) {
            return null;
        }
    }

    /* renamed from: g */
    public static C0505a m1012g(Context context) {
        if (f1038f == null) {
            f1038f = (AudioManager) context.getSystemService("audio");
        }
        C0505a aVar = C0505a.OTHER;
        int mode = f1038f.getMode();
        if (m1006c()) {
            return C0505a.EMULATOR;
        }
        if (f1038f.isMusicActive() || f1038f.isSpeakerphoneOn() || mode == 2 || mode == 1) {
            return C0505a.VIBRATE;
        }
        int ringerMode = f1038f.getRingerMode();
        if (ringerMode == 0 || ringerMode == 1) {
            return C0505a.VIBRATE;
        }
        return C0505a.SPEAKER;
    }

    /* renamed from: a */
    public static DisplayMetrics m985a(Activity activity) {
        if (activity.getWindowManager() == null) {
            return null;
        }
        DisplayMetrics displayMetrics = new DisplayMetrics();
        activity.getWindowManager().getDefaultDisplay().getMetrics(displayMetrics);
        return displayMetrics;
    }

    /* renamed from: a */
    public static String m987a(Location location) {
        if (location == null) {
            return null;
        }
        return "e1+" + m1005c(m1000b(location));
    }

    /* renamed from: b */
    private static String m1000b(Location location) {
        return String.format(Locale.US, "role: 6 producer: 24 historical_role: 1 historical_producer: 12 timestamp: %d latlng < latitude_e7: %d longitude_e7: %d> radius: %d", new Object[]{Long.valueOf(location.getTime() * 1000), Long.valueOf((long) (location.getLatitude() * 1.0E7d)), Long.valueOf((long) (location.getLongitude() * 1.0E7d)), Long.valueOf((long) (location.getAccuracy() * 1000.0f))});
    }

    /* renamed from: c */
    private static String m1005c(String str) {
        try {
            Cipher instance = Cipher.getInstance("AES/CBC/PKCS5Padding");
            instance.init(1, new SecretKeySpec(new byte[]{10, 55, -112, -47, -6, 7, 11, 75, -7, -121, 121, 69, 80, -61, 15, 5}, "AES"));
            byte[] iv = instance.getIV();
            byte[] doFinal = instance.doFinal(str.getBytes());
            byte[] bArr = new byte[(iv.length + doFinal.length)];
            System.arraycopy(iv, 0, bArr, 0, iv.length);
            System.arraycopy(doFinal, 0, bArr, iv.length, doFinal.length);
            return C0511c.m1041b(bArr, 11);
        } catch (GeneralSecurityException e) {
            return null;
        }
    }

    /* renamed from: b */
    public static HashMap<String, String> m1002b(Uri uri) {
        if (uri == null) {
            return null;
        }
        HashMap<String, String> hashMap = new HashMap<>();
        String encodedQuery = uri.getEncodedQuery();
        if (encodedQuery != null) {
            for (String str : encodedQuery.split(Utility.QUERY_APPENDIX)) {
                int indexOf = str.indexOf("=");
                if (indexOf < 0) {
                    hashMap.put(Uri.decode(str), (Object) null);
                } else {
                    hashMap.put(Uri.decode(str.substring(0, indexOf)), Uri.decode(str.substring(indexOf + 1, str.length())));
                }
            }
        }
        return hashMap;
    }

    /* renamed from: d */
    public static boolean m1009d() {
        return f1039g;
    }

    /* renamed from: a */
    public static void m993a(boolean z) {
        f1039g = z;
    }

    /* renamed from: h */
    public static void m1013h(Context context) {
        if (!f1040h) {
            IntentFilter intentFilter = new IntentFilter();
            intentFilter.addAction("android.intent.action.USER_PRESENT");
            intentFilter.addAction("android.intent.action.SCREEN_OFF");
            context.registerReceiver(new UserActivityReceiver(), intentFilter);
            f1040h = true;
        }
    }

    public static class UserActivityReceiver extends BroadcastReceiver {
        public void onReceive(Context context, Intent intent) {
            if (intent.getAction().equals("android.intent.action.USER_PRESENT")) {
                AdUtil.m993a(true);
            } else if (intent.getAction().equals("android.intent.action.SCREEN_OFF")) {
                AdUtil.m993a(false);
            }
        }
    }

    /* renamed from: i */
    public static String m1014i(Context context) {
        if (f1041i == null) {
            String userAgentString = new WebView(context).getSettings().getUserAgentString();
            if (userAgentString == null || userAgentString.length() == 0 || userAgentString.equals("Java0")) {
                String property = System.getProperty("os.name", "Linux");
                String str = "Android " + Build.VERSION.RELEASE;
                Locale locale = Locale.getDefault();
                String lowerCase = locale.getLanguage().toLowerCase(Locale.US);
                if (lowerCase.length() == 0) {
                    lowerCase = "en";
                }
                String lowerCase2 = locale.getCountry().toLowerCase(Locale.US);
                if (lowerCase2.length() > 0) {
                    lowerCase = lowerCase + "-" + lowerCase2;
                }
                userAgentString = "Mozilla/5.0 (" + property + "; U; " + str + "; " + lowerCase + "; " + (Build.MODEL + " Build/" + Build.ID) + ") AppleWebKit/0.0 (KHTML, like " + "Gecko) Version/0.0 Mobile Safari/0.0";
            }
            f1041i = userAgentString + " (Mobile; " + "afma-sdk-a-v" + AdRequest.VERSION + ")";
        }
        return f1041i;
    }

    /* renamed from: a */
    public static void m991a(WebView webView) {
        webView.getSettings().setUserAgentString(m1014i(webView.getContext().getApplicationContext()));
    }

    /* renamed from: a */
    public static void m992a(HttpURLConnection httpURLConnection, Context context) {
        httpURLConnection.setRequestProperty(ServiceProxyBase.USER_AGENT_HEADER, m1014i(context));
    }

    /* renamed from: a */
    public static String m989a(Map<String, Object> map) {
        try {
            return m1003b(map).toString();
        } catch (JSONException e) {
            C0508b.m1035d("JsonException in serialization: ", e);
            return null;
        }
    }

    /* renamed from: b */
    public static JSONObject m1003b(Map<String, Object> map) throws JSONException {
        JSONObject jSONObject = new JSONObject();
        if (map == null || map.isEmpty()) {
            return jSONObject;
        }
        for (String next : map.keySet()) {
            Object obj = map.get(next);
            if ((obj instanceof String) || (obj instanceof Integer) || (obj instanceof Double) || (obj instanceof Long) || (obj instanceof Float)) {
                jSONObject.put(next, obj);
            } else if (obj instanceof Map) {
                try {
                    jSONObject.put(next, m1003b((Map<String, Object>) (Map) obj));
                } catch (ClassCastException e) {
                    C0508b.m1035d("Unknown map type in json serialization: ", e);
                }
            } else if (obj instanceof Set) {
                try {
                    jSONObject.put(next, m990a((Set<Object>) (Set) obj));
                } catch (ClassCastException e2) {
                    C0508b.m1035d("Unknown map type in json serialization: ", e2);
                }
            } else {
                C0508b.m1036e("Unknown value in json serialization: " + obj);
            }
        }
        return jSONObject;
    }

    /* renamed from: a */
    public static JSONArray m990a(Set<Object> set) throws JSONException {
        JSONArray jSONArray = new JSONArray();
        if (set == null || set.isEmpty()) {
            return jSONArray;
        }
        for (Object next : set) {
            if ((next instanceof String) || (next instanceof Integer) || (next instanceof Double) || (next instanceof Long) || (next instanceof Float)) {
                jSONArray.put(next);
            } else if (next instanceof Map) {
                try {
                    jSONArray.put(m1003b((Map<String, Object>) (Map) next));
                } catch (ClassCastException e) {
                    C0508b.m1035d("Unknown map type in json serialization: ", e);
                }
            } else if (next instanceof Set) {
                try {
                    jSONArray.put(m990a((Set<Object>) (Set) next));
                } catch (ClassCastException e2) {
                    C0508b.m1035d("Unknown map type in json serialization: ", e2);
                }
            } else {
                C0508b.m1036e("Unknown value in json serialization: " + next);
            }
        }
        return jSONArray;
    }
}
