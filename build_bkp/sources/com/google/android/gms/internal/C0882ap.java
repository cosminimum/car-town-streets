package com.google.android.gms.internal;

import android.os.SystemClock;
import android.util.DisplayMetrics;
import android.view.MotionEvent;
import com.getjar.sdk.utilities.Constants;
import java.util.Map;

/* renamed from: com.google.android.gms.internal.ap */
public final class C0882ap implements C0880an {
    /* renamed from: a */
    private static int m1959a(DisplayMetrics displayMetrics, Map<String, String> map, String str, int i) {
        String str2 = map.get(str);
        if (str2 == null) {
            return i;
        }
        try {
            return C1003cs.m2203a(displayMetrics, Integer.parseInt(str2));
        } catch (NumberFormatException e) {
            C1004ct.m2218v("Could not parse " + str + " in a video GMSG: " + str2);
            return i;
        }
    }

    /* renamed from: a */
    public void mo7068a(C1007cw cwVar, Map<String, String> map) {
        String str = map.get("action");
        if (str == null) {
            C1004ct.m2218v("Action missing from video GMSG.");
            return;
        }
        C0939bk aB = cwVar.mo7239aB();
        if (aB == null) {
            C1004ct.m2218v("Could not get ad overlay for a video GMSG.");
            return;
        }
        boolean equalsIgnoreCase = "new".equalsIgnoreCase(str);
        boolean equalsIgnoreCase2 = "position".equalsIgnoreCase(str);
        if (equalsIgnoreCase || equalsIgnoreCase2) {
            DisplayMetrics displayMetrics = cwVar.getContext().getResources().getDisplayMetrics();
            int a = m1959a(displayMetrics, map, Constants.f677X, 0);
            int a2 = m1959a(displayMetrics, map, Constants.f678Y, 0);
            int a3 = m1959a(displayMetrics, map, "w", -1);
            int a4 = m1959a(displayMetrics, map, "h", -1);
            if (!equalsIgnoreCase || aB.mo7129W() != null) {
                aB.mo7133b(a, a2, a3, a4);
            } else {
                aB.mo7134c(a, a2, a3, a4);
            }
        } else {
            C0946bo W = aB.mo7129W();
            if (W == null) {
                C0946bo.m2061a(cwVar, "no_video_view", (String) null);
            } else if ("click".equalsIgnoreCase(str)) {
                DisplayMetrics displayMetrics2 = cwVar.getContext().getResources().getDisplayMetrics();
                int a5 = m1959a(displayMetrics2, map, Constants.f677X, 0);
                int a6 = m1959a(displayMetrics2, map, Constants.f678Y, 0);
                long uptimeMillis = SystemClock.uptimeMillis();
                MotionEvent obtain = MotionEvent.obtain(uptimeMillis, uptimeMillis, 0, (float) a5, (float) a6, 0);
                W.mo7163b(obtain);
                obtain.recycle();
            } else if ("controls".equalsIgnoreCase(str)) {
                String str2 = map.get("enabled");
                if (str2 == null) {
                    C1004ct.m2218v("Enabled parameter missing from controls video GMSG.");
                } else {
                    W.mo7165i(Boolean.parseBoolean(str2));
                }
            } else if ("currentTime".equalsIgnoreCase(str)) {
                String str3 = map.get("time");
                if (str3 == null) {
                    C1004ct.m2218v("Time parameter missing from currentTime video GMSG.");
                    return;
                }
                try {
                    W.seekTo((int) (Float.parseFloat(str3) * 1000.0f));
                } catch (NumberFormatException e) {
                    C1004ct.m2218v("Could not parse time parameter from currentTime video GMSG: " + str3);
                }
            } else if ("hide".equalsIgnoreCase(str)) {
                W.setVisibility(4);
            } else if ("load".equalsIgnoreCase(str)) {
                W.mo7161af();
            } else if ("pause".equalsIgnoreCase(str)) {
                W.pause();
            } else if ("play".equalsIgnoreCase(str)) {
                W.play();
            } else if ("show".equalsIgnoreCase(str)) {
                W.setVisibility(0);
            } else if ("src".equalsIgnoreCase(str)) {
                W.mo7166n(map.get("src"));
            } else {
                C1004ct.m2218v("Unknown video action: " + str);
            }
        }
    }
}
