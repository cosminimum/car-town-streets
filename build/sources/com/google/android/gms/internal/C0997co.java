package com.google.android.gms.internal;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.webkit.WebSettings;
import android.webkit.WebView;
import com.getjar.sdk.comm.ServiceProxyBase;
import com.google.android.gms.ads.AdActivity;
import com.millennialmedia.android.MMAdView;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.nio.CharBuffer;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* renamed from: com.google.android.gms.internal.co */
public final class C0997co {
    /* access modifiers changed from: private */

    /* renamed from: hC */
    public static final Object f2405hC = new Object();
    /* access modifiers changed from: private */

    /* renamed from: iD */
    public static boolean f2406iD = true;
    /* access modifiers changed from: private */

    /* renamed from: iE */
    public static String f2407iE;

    /* renamed from: iF */
    private static boolean f2408iF = false;

    /* renamed from: com.google.android.gms.internal.co$a */
    private static final class C0999a extends BroadcastReceiver {
        private C0999a() {
        }

        public void onReceive(Context context, Intent intent) {
            if ("android.intent.action.USER_PRESENT".equals(intent.getAction())) {
                boolean unused = C0997co.f2406iD = true;
            } else if ("android.intent.action.SCREEN_OFF".equals(intent.getAction())) {
                boolean unused2 = C0997co.f2406iD = false;
            }
        }
    }

    /* renamed from: a */
    public static String m2168a(Readable readable) throws IOException {
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
    private static JSONArray m2169a(Collection<?> collection) throws JSONException {
        JSONArray jSONArray = new JSONArray();
        for (Object a : collection) {
            m2176a(jSONArray, a);
        }
        return jSONArray;
    }

    /* renamed from: a */
    private static JSONArray m2170a(Object[] objArr) throws JSONException {
        JSONArray jSONArray = new JSONArray();
        for (Object a : objArr) {
            m2176a(jSONArray, a);
        }
        return jSONArray;
    }

    /* renamed from: a */
    private static JSONObject m2171a(Bundle bundle) throws JSONException {
        JSONObject jSONObject = new JSONObject();
        for (String str : bundle.keySet()) {
            m2177a(jSONObject, str, bundle.get(str));
        }
        return jSONObject;
    }

    /* renamed from: a */
    public static void m2172a(Context context, String str, WebSettings webSettings) {
        webSettings.setUserAgentString(m2184b(context, str));
    }

    /* renamed from: a */
    public static void m2173a(Context context, String str, List<String> list) {
        for (String crVar : list) {
            new C1002cr(context, str, crVar).start();
        }
    }

    /* renamed from: a */
    public static void m2174a(Context context, String str, boolean z, HttpURLConnection httpURLConnection) {
        httpURLConnection.setConnectTimeout(60000);
        httpURLConnection.setInstanceFollowRedirects(z);
        httpURLConnection.setReadTimeout(60000);
        httpURLConnection.setRequestProperty(ServiceProxyBase.USER_AGENT_HEADER, m2184b(context, str));
        httpURLConnection.setUseCaches(false);
    }

    /* renamed from: a */
    public static void m2175a(WebView webView) {
        if (Build.VERSION.SDK_INT >= 11) {
            C1000cp.m2196a(webView);
        }
    }

    /* renamed from: a */
    private static void m2176a(JSONArray jSONArray, Object obj) throws JSONException {
        if (obj instanceof Bundle) {
            jSONArray.put(m2171a((Bundle) obj));
        } else if (obj instanceof Map) {
            jSONArray.put(m2191m((Map) obj));
        } else if (obj instanceof Collection) {
            jSONArray.put(m2169a((Collection<?>) (Collection) obj));
        } else if (obj instanceof Object[]) {
            jSONArray.put(m2170a((Object[]) obj));
        } else {
            jSONArray.put(obj);
        }
    }

    /* renamed from: a */
    private static void m2177a(JSONObject jSONObject, String str, Object obj) throws JSONException {
        if (obj instanceof Bundle) {
            jSONObject.put(str, m2171a((Bundle) obj));
        } else if (obj instanceof Map) {
            jSONObject.put(str, m2191m((Map) obj));
        } else if (obj instanceof Collection) {
            if (str == null) {
                str = "null";
            }
            jSONObject.put(str, m2169a((Collection<?>) (Collection) obj));
        } else if (obj instanceof Object[]) {
            jSONObject.put(str, m2169a((Collection<?>) Arrays.asList((Object[]) obj)));
        } else {
            jSONObject.put(str, obj);
        }
    }

    /* renamed from: a */
    public static boolean m2178a(PackageManager packageManager, String str, String str2) {
        return packageManager.checkPermission(str2, str) == 0;
    }

    /* renamed from: a */
    public static boolean m2179a(ClassLoader classLoader, Class<?> cls, String str) {
        try {
            return cls.isAssignableFrom(Class.forName(str, false, classLoader));
        } catch (Throwable th) {
            return false;
        }
    }

    /* renamed from: at */
    public static boolean m2180at() {
        return f2406iD;
    }

    /* renamed from: au */
    public static int m2181au() {
        return Build.VERSION.SDK_INT >= 9 ? 6 : 0;
    }

    /* renamed from: av */
    public static int m2182av() {
        return Build.VERSION.SDK_INT >= 9 ? 7 : 1;
    }

    /* renamed from: b */
    private static String m2184b(final Context context, String str) {
        String str2;
        synchronized (f2405hC) {
            if (f2407iE != null) {
                str2 = f2407iE;
            } else {
                if (Build.VERSION.SDK_INT >= 17) {
                    f2407iE = C1001cq.getDefaultUserAgent(context);
                } else if (!C1003cs.m2208ay()) {
                    C1003cs.f2412iI.post(new Runnable() {
                        public void run() {
                            synchronized (C0997co.f2405hC) {
                                String unused = C0997co.f2407iE = C0997co.m2188j(context);
                                C0997co.f2405hC.notifyAll();
                            }
                        }
                    });
                    while (f2407iE == null) {
                        try {
                            f2405hC.wait();
                        } catch (InterruptedException e) {
                            str2 = f2407iE;
                        }
                    }
                } else {
                    f2407iE = m2188j(context);
                }
                f2407iE += " (Mobile; " + str + ")";
                str2 = f2407iE;
            }
        }
        return str2;
    }

    /* renamed from: b */
    public static void m2185b(WebView webView) {
        if (Build.VERSION.SDK_INT >= 11) {
            C1000cp.m2197b(webView);
        }
    }

    /* renamed from: h */
    public static boolean m2186h(Context context) {
        boolean z;
        Intent intent = new Intent();
        intent.setClassName(context, AdActivity.CLASS_NAME);
        ResolveInfo resolveActivity = context.getPackageManager().resolveActivity(intent, 65536);
        if (resolveActivity == null || resolveActivity.activityInfo == null) {
            C1004ct.m2218v("Could not find com.google.android.gms.ads.AdActivity, please make sure it is declared in AndroidManifest.xml.");
            return false;
        }
        if ((resolveActivity.activityInfo.configChanges & 16) == 0) {
            C1004ct.m2218v(String.format("com.google.android.gms.ads.AdActivity requires the android:configChanges value to contain \"%s\".", new Object[]{"keyboard"}));
            z = false;
        } else {
            z = true;
        }
        if ((resolveActivity.activityInfo.configChanges & 32) == 0) {
            C1004ct.m2218v(String.format("com.google.android.gms.ads.AdActivity requires the android:configChanges value to contain \"%s\".", new Object[]{"keyboardHidden"}));
            z = false;
        }
        if ((resolveActivity.activityInfo.configChanges & 128) == 0) {
            C1004ct.m2218v(String.format("com.google.android.gms.ads.AdActivity requires the android:configChanges value to contain \"%s\".", new Object[]{MMAdView.KEY_ORIENTATION}));
            z = false;
        }
        if ((resolveActivity.activityInfo.configChanges & 256) == 0) {
            C1004ct.m2218v(String.format("com.google.android.gms.ads.AdActivity requires the android:configChanges value to contain \"%s\".", new Object[]{"screenLayout"}));
            z = false;
        }
        if ((resolveActivity.activityInfo.configChanges & 512) == 0) {
            C1004ct.m2218v(String.format("com.google.android.gms.ads.AdActivity requires the android:configChanges value to contain \"%s\".", new Object[]{"uiMode"}));
            z = false;
        }
        if ((resolveActivity.activityInfo.configChanges & 1024) == 0) {
            C1004ct.m2218v(String.format("com.google.android.gms.ads.AdActivity requires the android:configChanges value to contain \"%s\".", new Object[]{"screenSize"}));
            z = false;
        }
        if ((resolveActivity.activityInfo.configChanges & 2048) != 0) {
            return z;
        }
        C1004ct.m2218v(String.format("com.google.android.gms.ads.AdActivity requires the android:configChanges value to contain \"%s\".", new Object[]{"smallestScreenSize"}));
        return false;
    }

    /* renamed from: i */
    public static void m2187i(Context context) {
        if (!f2408iF) {
            IntentFilter intentFilter = new IntentFilter();
            intentFilter.addAction("android.intent.action.USER_PRESENT");
            intentFilter.addAction("android.intent.action.SCREEN_OFF");
            context.getApplicationContext().registerReceiver(new C0999a(), intentFilter);
            f2408iF = true;
        }
    }

    /* access modifiers changed from: private */
    /* renamed from: j */
    public static String m2188j(Context context) {
        return new WebView(context).getSettings().getUserAgentString();
    }

    /* renamed from: m */
    public static JSONObject m2191m(Map<String, ?> map) throws JSONException {
        try {
            JSONObject jSONObject = new JSONObject();
            for (String next : map.keySet()) {
                m2177a(jSONObject, next, (Object) map.get(next));
            }
            return jSONObject;
        } catch (ClassCastException e) {
            throw new JSONException("Could not convert map to JSON: " + e.getMessage());
        }
    }

    /* renamed from: o */
    public static String m2192o(String str) {
        return Uri.parse(str).buildUpon().query((String) null).build().toString();
    }
}
