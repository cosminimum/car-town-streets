package com.chartboost.sdk.impl;

import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import com.chartboost.sdk.C0038Chartboost;

/* renamed from: com.chartboost.sdk.impl.l */
public class C0188l {
    /* renamed from: a */
    public static boolean m405a() {
        NetworkInfo activeNetworkInfo;
        try {
            ConnectivityManager connectivityManager = (ConnectivityManager) C0038Chartboost.sharedChartboost().getContext().getSystemService("connectivity");
            if (connectivityManager == null || (activeNetworkInfo = connectivityManager.getActiveNetworkInfo()) == null || !activeNetworkInfo.isConnectedOrConnecting()) {
                return false;
            }
            return true;
        } catch (Exception e) {
            return true;
        }
    }
}
