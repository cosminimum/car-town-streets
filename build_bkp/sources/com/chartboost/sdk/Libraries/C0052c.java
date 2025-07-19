package com.chartboost.sdk.Libraries;

import android.net.wifi.WifiManager;
import android.provider.Settings;
import com.chartboost.sdk.C0038Chartboost;
import com.chartboost.sdk.impl.C0109aj;
import com.chartboost.sdk.impl.C0111al;
import com.chartboost.sdk.impl.C0112am;
import com.tapjoy.TapjoyConstants;

/* renamed from: com.chartboost.sdk.Libraries.c */
public class C0052c {
    /* renamed from: b */
    private static String m74b() {
        if (C0053d.m90c()) {
            return null;
        }
        return C0051b.m72b(C0051b.m71a(m77e()));
    }

    /* renamed from: a */
    public static String m73a() {
        return C0051b.m72b(m75c());
    }

    /* renamed from: c */
    private static byte[] m75c() {
        String d = m76d();
        String b = m74b();
        C0112am amVar = new C0112am();
        amVar.put("uuid", d);
        amVar.put("macid", b);
        return new C0111al().mo1281a((C0109aj) amVar);
    }

    /* renamed from: d */
    private static String m76d() {
        if (C0053d.m90c()) {
            return null;
        }
        return Settings.Secure.getString(C0038Chartboost.sharedChartboost().getContext().getContentResolver(), TapjoyConstants.TJC_ANDROID_ID);
    }

    /* renamed from: e */
    private static byte[] m77e() {
        try {
            String macAddress = ((WifiManager) C0038Chartboost.sharedChartboost().getContext().getSystemService(TapjoyConstants.TJC_CONNECTION_TYPE_WIFI)).getConnectionInfo().getMacAddress();
            if (macAddress == null || macAddress.equals("")) {
                return null;
            }
            String[] split = macAddress.split(":");
            byte[] bArr = new byte[6];
            for (int i = 0; i < split.length; i++) {
                bArr[i] = Integer.valueOf(Integer.parseInt(split[i], 16)).byteValue();
            }
            return bArr;
        } catch (Exception e) {
            return null;
        }
    }
}
