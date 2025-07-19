package com.google.android.gms.internal;

import android.content.Context;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.media.AudioManager;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.net.Uri;
import android.telephony.TelephonyManager;
import android.util.DisplayMetrics;
import java.util.Locale;

/* renamed from: com.google.android.gms.internal.ci */
public final class C0988ci {

    /* renamed from: hZ */
    public final int f2358hZ;

    /* renamed from: ia */
    public final boolean f2359ia;

    /* renamed from: ib */
    public final boolean f2360ib;

    /* renamed from: ic */
    public final String f2361ic;

    /* renamed from: id */
    public final String f2362id;

    /* renamed from: ie */
    public final boolean f2363ie;

    /* renamed from: if */
    public final boolean f2364if;

    /* renamed from: ig */
    public final boolean f2365ig;

    /* renamed from: ih */
    public final String f2366ih;

    /* renamed from: ii */
    public final String f2367ii;

    /* renamed from: ij */
    public final int f2368ij;

    /* renamed from: ik */
    public final int f2369ik;

    /* renamed from: il */
    public final int f2370il;

    /* renamed from: im */
    public final int f2371im;

    /* renamed from: in */
    public final int f2372in;

    /* renamed from: io */
    public final int f2373io;

    /* renamed from: ip */
    public final float f2374ip;

    /* renamed from: iq */
    public final int f2375iq;

    /* renamed from: ir */
    public final int f2376ir;

    public C0988ci(Context context) {
        boolean z = true;
        AudioManager audioManager = (AudioManager) context.getSystemService("audio");
        ConnectivityManager connectivityManager = (ConnectivityManager) context.getSystemService("connectivity");
        DisplayMetrics displayMetrics = context.getResources().getDisplayMetrics();
        Locale locale = Locale.getDefault();
        PackageManager packageManager = context.getPackageManager();
        TelephonyManager telephonyManager = (TelephonyManager) context.getSystemService("phone");
        this.f2358hZ = audioManager.getMode();
        this.f2359ia = m2160a(packageManager, "geo:0,0?q=donuts") != null;
        this.f2360ib = m2160a(packageManager, "http://www.google.com") == null ? false : z;
        this.f2361ic = telephonyManager.getNetworkOperator();
        this.f2362id = locale.getCountry();
        this.f2363ie = C1003cs.m2207ax();
        this.f2364if = audioManager.isMusicActive();
        this.f2365ig = audioManager.isSpeakerphoneOn();
        this.f2366ih = locale.getLanguage();
        this.f2367ii = m2161a(packageManager);
        this.f2368ij = audioManager.getStreamVolume(3);
        this.f2369ik = m2159a(context, connectivityManager, packageManager);
        this.f2370il = telephonyManager.getNetworkType();
        this.f2371im = telephonyManager.getPhoneType();
        this.f2372in = audioManager.getRingerMode();
        this.f2373io = audioManager.getStreamVolume(2);
        this.f2374ip = displayMetrics.density;
        this.f2375iq = displayMetrics.widthPixels;
        this.f2376ir = displayMetrics.heightPixels;
    }

    /* renamed from: a */
    private static int m2159a(Context context, ConnectivityManager connectivityManager, PackageManager packageManager) {
        if (!C0997co.m2178a(packageManager, context.getPackageName(), "android.permission.ACCESS_NETWORK_STATE")) {
            return -2;
        }
        NetworkInfo activeNetworkInfo = connectivityManager.getActiveNetworkInfo();
        if (activeNetworkInfo != null) {
            return activeNetworkInfo.getType();
        }
        return -1;
    }

    /* renamed from: a */
    private static ResolveInfo m2160a(PackageManager packageManager, String str) {
        return packageManager.resolveActivity(new Intent("android.intent.action.VIEW", Uri.parse(str)), 65536);
    }

    /* renamed from: a */
    private static String m2161a(PackageManager packageManager) {
        ActivityInfo activityInfo;
        ResolveInfo a = m2160a(packageManager, "market://details?id=com.google.android.gms.ads");
        if (a == null || (activityInfo = a.activityInfo) == null) {
            return null;
        }
        try {
            PackageInfo packageInfo = packageManager.getPackageInfo(activityInfo.packageName, 0);
            if (packageInfo != null) {
                return packageInfo.versionCode + "." + activityInfo.packageName;
            }
            return null;
        } catch (PackageManager.NameNotFoundException e) {
            return null;
        }
    }
}
