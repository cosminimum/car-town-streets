package com.chartboost.sdk.impl;

import android.content.Context;
import android.os.Build;
import android.util.Log;
import com.chartboost.sdk.C0038Chartboost;
import com.chartboost.sdk.Libraries.C0051b;
import com.chartboost.sdk.Libraries.C0053d;
import com.google.android.gcm.GCMConstants;
import com.tapjoy.TapjoyConstants;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import org.json.JSONException;
import org.json.JSONObject;

/* renamed from: com.chartboost.sdk.impl.k */
public class C0186k {

    /* renamed from: a */
    public String f304a;

    /* renamed from: b */
    public String f305b;

    /* renamed from: c */
    public String f306c;

    /* renamed from: d */
    public Map<String, String> f307d;

    /* renamed from: e */
    public JSONObject f308e;

    /* renamed from: f */
    public Map<String, String> f309f;

    /* renamed from: g */
    public List<String> f310g;

    /* renamed from: h */
    public C0187a f311h;

    /* renamed from: i */
    public boolean f312i;

    /* renamed from: j */
    public JSONObject f313j = null;

    /* renamed from: com.chartboost.sdk.impl.k$a */
    public interface C0187a {
        /* renamed from: a */
        void mo1165a(JSONObject jSONObject);
    }

    public C0186k(String str, String str2) {
        this.f304a = str;
        this.f305b = str2;
        this.f306c = "GET";
    }

    /* renamed from: a */
    public void mo1467a(String str, String str2) {
        if (this.f308e == null) {
            this.f308e = new JSONObject();
            this.f306c = "POST";
        }
        try {
            this.f308e.put(str, str2);
        } catch (JSONException e) {
            e.printStackTrace();
        }
    }

    /* renamed from: b */
    public void mo1469b(String str, String str2) {
        if (this.f307d == null) {
            this.f307d = new HashMap();
        }
        this.f307d.put(str, str2);
    }

    /* JADX WARNING: Removed duplicated region for block: B:19:0x0064  */
    /* JADX WARNING: Removed duplicated region for block: B:20:0x0069  */
    /* renamed from: b */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private void m395b(android.content.Context r6) {
        /*
            r5 = this;
            r2 = 0
            boolean r1 = r6 instanceof android.app.Activity     // Catch:{ Exception -> 0x0060 }
            if (r1 == 0) goto L_0x0071
            r0 = r6
            android.app.Activity r0 = (android.app.Activity) r0     // Catch:{ Exception -> 0x0060 }
            r1 = r0
            android.graphics.Rect r4 = new android.graphics.Rect     // Catch:{ Exception -> 0x0060 }
            r4.<init>()     // Catch:{ Exception -> 0x0060 }
            android.view.Window r1 = r1.getWindow()     // Catch:{ Exception -> 0x0060 }
            android.view.View r1 = r1.getDecorView()     // Catch:{ Exception -> 0x0060 }
            r1.getWindowVisibleDisplayFrame(r4)     // Catch:{ Exception -> 0x0060 }
            int r1 = android.os.Build.VERSION.SDK_INT     // Catch:{ Exception -> 0x0060 }
            r3 = 9
            if (r1 >= r3) goto L_0x0022
            r1 = 0
            r4.top = r1     // Catch:{ Exception -> 0x0060 }
        L_0x0022:
            int r3 = r4.width()     // Catch:{ Exception -> 0x0060 }
            int r1 = r4.height()     // Catch:{ Exception -> 0x006e }
            r2 = r1
        L_0x002b:
            java.lang.String r1 = "window"
            java.lang.Object r1 = r6.getSystemService(r1)
            android.view.WindowManager r1 = (android.view.WindowManager) r1
            android.view.Display r1 = r1.getDefaultDisplay()
            if (r3 <= 0) goto L_0x0064
        L_0x0039:
            if (r2 <= 0) goto L_0x0069
        L_0x003b:
            java.lang.String r1 = "w"
            java.lang.StringBuilder r4 = new java.lang.StringBuilder
            r4.<init>()
            java.lang.StringBuilder r3 = r4.append(r3)
            java.lang.String r3 = r3.toString()
            r5.mo1467a(r1, r3)
            java.lang.String r1 = "h"
            java.lang.StringBuilder r3 = new java.lang.StringBuilder
            r3.<init>()
            java.lang.StringBuilder r2 = r3.append(r2)
            java.lang.String r2 = r2.toString()
            r5.mo1467a(r1, r2)
            return
        L_0x0060:
            r1 = move-exception
            r1 = r2
        L_0x0062:
            r3 = r1
            goto L_0x002b
        L_0x0064:
            int r3 = r1.getWidth()
            goto L_0x0039
        L_0x0069:
            int r2 = r1.getHeight()
            goto L_0x003b
        L_0x006e:
            r1 = move-exception
            r1 = r3
            goto L_0x0062
        L_0x0071:
            r3 = r2
            goto L_0x002b
        */
        throw new UnsupportedOperationException("Method not decompiled: com.chartboost.sdk.impl.C0186k.m395b(android.content.Context):void");
    }

    /* renamed from: a */
    public void mo1466a(Context context) {
        mo1467a(GCMConstants.EXTRA_APPLICATION_PENDING_INTENT, C0038Chartboost.sharedChartboost().getAppID());
        if (Build.PRODUCT.equals("sdk")) {
            mo1467a("model", "Android Simulator");
            mo1467a("identity", C0053d.m87b());
        } else {
            mo1467a("model", Build.MODEL);
            mo1467a("identity", C0053d.m87b());
        }
        mo1467a(TapjoyConstants.TJC_DEVICE_TYPE_NAME, String.valueOf(Build.MANUFACTURER) + " " + Build.MODEL);
        mo1467a("os", "Android " + Build.VERSION.RELEASE);
        mo1467a("country", Locale.getDefault().getCountry());
        mo1467a("language", Locale.getDefault().getLanguage());
        mo1467a("sdk", "3.1.5");
        mo1467a("timestamp", new StringBuilder(String.valueOf(new Date().getTime())).toString());
        m395b(context);
        mo1467a("scale", new StringBuilder().append(context.getResources().getDisplayMetrics().density).toString());
        try {
            mo1467a("bundle", context.getPackageManager().getPackageInfo(context.getPackageName(), 128).versionName);
        } catch (Exception e) {
        }
    }

    /* renamed from: c */
    public void mo1471c(String str, String str2) {
        String b = C0051b.m72b(C0051b.m71a((String.valueOf(this.f306c) + " " + mo1465a() + "\n" + str2 + "\n" + mo1468b()).getBytes()));
        mo1469b("X-Chartboost-App", str);
        mo1469b("X-Chartboost-Signature", b);
    }

    /* renamed from: a */
    public String mo1465a() {
        return "/" + this.f304a + "/" + this.f305b + C0053d.m80a(this.f309f);
    }

    /* renamed from: b */
    public String mo1468b() {
        return this.f308e.toString();
    }

    /* renamed from: c */
    public Map<String, String> mo1470c() {
        return this.f307d;
    }

    /* renamed from: a */
    public static C0186k m394a(JSONObject jSONObject) {
        try {
            C0186k kVar = new C0186k(jSONObject.getString("controller"), jSONObject.getString("action"));
            kVar.f310g = C0053d.m81a(jSONObject.optJSONArray("params"));
            kVar.f309f = C0053d.m82a(jSONObject.optJSONObject("query"));
            kVar.f308e = jSONObject.optJSONObject("body");
            kVar.f312i = jSONObject.getBoolean("ensureDelivery");
            kVar.f307d = C0053d.m82a(jSONObject.optJSONObject("headers"));
            return kVar;
        } catch (Exception e) {
            Log.w("Chartboost", "Unable to deserialize failed request");
            return null;
        }
    }

    /* renamed from: d */
    public JSONObject mo1472d() {
        try {
            JSONObject jSONObject = new JSONObject();
            jSONObject.put("controller", this.f304a);
            jSONObject.put("action", this.f305b);
            jSONObject.put("params", C0053d.m83a(this.f310g));
            jSONObject.put("query", C0053d.m88b(this.f309f));
            jSONObject.put("body", this.f308e);
            jSONObject.put("ensureDelivery", this.f312i);
            jSONObject.put("headers", C0053d.m88b(this.f307d));
            return jSONObject;
        } catch (Exception e) {
            Log.w("Chartboost", "Unable to serialize failed request");
            return null;
        }
    }
}
