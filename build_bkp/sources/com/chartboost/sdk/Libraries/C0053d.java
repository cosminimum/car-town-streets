package com.chartboost.sdk.Libraries;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.pm.Signature;
import android.os.Looper;
import android.view.Display;
import android.view.WindowManager;
import com.chartboost.sdk.C0038Chartboost;
import com.getjar.sdk.utilities.Utility;
import java.io.ByteArrayInputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.security.cert.CertificateFactory;
import java.security.cert.X509Certificate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import javax.security.auth.x500.X500Principal;
import org.json.JSONArray;
import org.json.JSONObject;

/* renamed from: com.chartboost.sdk.Libraries.d */
public class C0053d {

    /* renamed from: a */
    private static String f61a = null;

    /* renamed from: b */
    private static final X500Principal f62b = new X500Principal("CN=Android Debug,O=Android,C=US");

    /* renamed from: a */
    public static SharedPreferences m79a() {
        return C0038Chartboost.sharedChartboost().getContext().getSharedPreferences("cbPrefs", 0);
    }

    /* renamed from: b */
    public static String m87b() {
        if (m90c()) {
            return null;
        }
        if (f61a != null) {
            return f61a;
        }
        f61a = C0052c.m73a();
        return f61a;
    }

    /* renamed from: c */
    public static boolean m90c() {
        return m79a().getBoolean("cbIdentityTrackingDisabled", false);
    }

    /* renamed from: d */
    public static boolean m91d() {
        return Looper.myLooper() == Looper.getMainLooper();
    }

    /* renamed from: a */
    public static boolean m84a(Context context) {
        boolean z;
        try {
            Signature[] signatureArr = context.getPackageManager().getPackageInfo(context.getPackageName(), 64).signatures;
            int i = 0;
            boolean z2 = false;
            while (true) {
                try {
                    if (i < signatureArr.length) {
                        z = ((X509Certificate) CertificateFactory.getInstance("X.509").generateCertificate(new ByteArrayInputStream(signatureArr[i].toByteArray()))).getSubjectX500Principal().equals(f62b);
                        if (z) {
                            break;
                        }
                        i++;
                        z2 = z;
                    } else {
                        z = z2;
                        break;
                    }
                } catch (Exception e) {
                    z = z2;
                }
            }
        } catch (Exception e2) {
            z = false;
        }
        return z | ((context.getApplicationInfo().flags & 2) != 0);
    }

    /* renamed from: a */
    public static String m80a(Map<String, String> map) {
        String str;
        if (map == null) {
            return "";
        }
        StringBuilder sb = new StringBuilder();
        if (!map.keySet().isEmpty()) {
            sb.append(Utility.QUERY_START);
        }
        for (String next : map.keySet()) {
            if (sb.length() > 0) {
                sb.append(Utility.QUERY_APPENDIX);
            }
            String str2 = map.get(next);
            if (next != null) {
                try {
                    str = URLEncoder.encode(next, "UTF-8");
                } catch (UnsupportedEncodingException e) {
                    throw new RuntimeException("This method requires UTF-8 encoding support", e);
                }
            } else {
                str = "";
            }
            sb.append(str);
            sb.append("=");
            sb.append(str2 != null ? URLEncoder.encode(str2, "UTF-8") : "");
        }
        return sb.toString();
    }

    /* renamed from: a */
    public static List<String> m81a(JSONArray jSONArray) {
        if (jSONArray == null) {
            return null;
        }
        ArrayList arrayList = new ArrayList();
        for (int i = 0; i < jSONArray.length(); i++) {
            try {
                arrayList.add(jSONArray.getString(i));
            } catch (Exception e) {
            }
        }
        return arrayList;
    }

    /* renamed from: a */
    public static Map<String, String> m82a(JSONObject jSONObject) {
        if (jSONObject == null) {
            return null;
        }
        HashMap hashMap = new HashMap();
        Iterator<String> keys = jSONObject.keys();
        while (keys.hasNext()) {
            try {
                String next = keys.next();
                hashMap.put(next, jSONObject.getString(next));
            } catch (Exception e) {
            }
        }
        return hashMap;
    }

    /* renamed from: a */
    public static JSONArray m83a(List<String> list) {
        if (list == null) {
            return null;
        }
        JSONArray jSONArray = new JSONArray();
        for (int i = 0; i < list.size(); i++) {
            try {
                jSONArray.put(list.get(i));
            } catch (Exception e) {
            }
        }
        return jSONArray;
    }

    /* renamed from: b */
    public static JSONObject m88b(Map<String, String> map) {
        if (map == null) {
            return null;
        }
        JSONObject jSONObject = new JSONObject();
        for (Map.Entry next : map.entrySet()) {
            try {
                jSONObject.put((String) next.getKey(), next.getValue());
            } catch (Exception e) {
            }
        }
        return jSONObject;
    }

    /* renamed from: b */
    public static float m86b(Context context) {
        return context.getResources().getDisplayMetrics().density;
    }

    /* renamed from: a */
    public static int m78a(int i, Context context) {
        return Math.round(((float) i) * m86b(context));
    }

    /* renamed from: b */
    public static float m85b(int i, Context context) {
        return ((float) i) * m86b(context);
    }

    /* renamed from: c */
    public static CBOrientation m89c(Context context) {
        boolean z;
        boolean z2;
        Display defaultDisplay = ((WindowManager) context.getSystemService("window")).getDefaultDisplay();
        int i = context.getResources().getConfiguration().orientation;
        int rotation = defaultDisplay.getRotation();
        if (defaultDisplay.getWidth() == defaultDisplay.getHeight()) {
            z = true;
        } else if (defaultDisplay.getWidth() < defaultDisplay.getHeight()) {
            z = true;
        } else {
            z = true;
        }
        if (z) {
            z2 = true;
        } else if (z) {
            z2 = false;
        } else {
            if (z) {
                if (i == 1) {
                    z2 = true;
                } else if (i == 2) {
                    z2 = false;
                }
            }
            z2 = true;
        }
        if (!(rotation == 0 || rotation == 2)) {
            z2 = !z2;
        }
        if (z2) {
            switch (rotation) {
                case 1:
                    return CBOrientation.LANDSCAPE_LEFT;
                case 2:
                    return CBOrientation.PORTRAIT_REVERSE;
                case 3:
                    return CBOrientation.LANDSCAPE_RIGHT;
                default:
                    return CBOrientation.PORTRAIT;
            }
        } else {
            switch (rotation) {
                case 1:
                    return CBOrientation.PORTRAIT_LEFT;
                case 2:
                    return CBOrientation.LANDSCAPE_REVERSE;
                case 3:
                    return CBOrientation.PORTRAIT_RIGHT;
                default:
                    return CBOrientation.LANDSCAPE;
            }
        }
    }
}
