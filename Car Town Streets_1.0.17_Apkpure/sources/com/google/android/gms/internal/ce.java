package com.google.android.gms.internal;

import android.content.Context;
import android.text.TextUtils;
import com.google.android.gms.internal.cd;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
/* loaded from: classes.dex */
public final class ce extends cd.a {
    private static final Object hC = new Object();
    private static ce hD;
    private final aq hE;
    private final Context mContext;

    private ce(Context context, aq aqVar) {
        this.mContext = context;
        this.hE = aqVar;
    }

    private static cb a(final Context context, aq aqVar, final bz bzVar) {
        String string;
        ct.r("Starting ad request from service.");
        aqVar.init();
        ci ciVar = new ci(context);
        if (ciVar.ik == -1) {
            ct.r("Device is offline.");
            return new cb(2);
        }
        final cg cgVar = new cg(bzVar.applicationInfo.packageName);
        if (bzVar.hr.extras != null && (string = bzVar.hr.extras.getString("_ad")) != null) {
            return cf.a(context, bzVar, string);
        }
        final String a = cf.a(bzVar, ciVar, aqVar.a(250L));
        if (a == null) {
            return new cb(0);
        }
        cs.iI.post(new Runnable() { // from class: com.google.android.gms.internal.ce.1
            @Override // java.lang.Runnable
            public void run() {
                cw a2 = cw.a(context, new x(), false, false, null, bzVar.ej);
                a2.setWillNotDraw(true);
                cgVar.b(a2);
                cx aC = a2.aC();
                aC.a("/invalidRequest", cgVar.hM);
                aC.a("/loadAdURL", cgVar.hN);
                aC.a("/log", am.fs);
                ct.r("Getting the ad request URL.");
                a2.loadDataWithBaseURL("http://googleads.g.doubleclick.net", "<!DOCTYPE html><html><head><script src=\"http://googleads.g.doubleclick.net/mads/static/sdk/native/sdk-core-v40.js\"></script><script>AFMA_buildAdURL(" + a + ");</script></head><body></body></html>", "text/html", "UTF-8", null);
            }
        });
        String ap = cgVar.ap();
        return TextUtils.isEmpty(ap) ? new cb(cgVar.getErrorCode()) : a(context, bzVar.ej.iJ, ap);
    }

    /* JADX WARN: Code restructure failed: missing block: B:36:0x008b, code lost:
        com.google.android.gms.internal.ct.v("Received error HTTP response code: " + r4);
        r1 = new com.google.android.gms.internal.cb(0);
     */
    /* JADX WARN: Code restructure failed: missing block: B:37:0x00a7, code lost:
        r0.disconnect();
     */
    /* JADX WARN: Code restructure failed: missing block: B:39:?, code lost:
        return r1;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static com.google.android.gms.internal.cb a(android.content.Context r8, java.lang.String r9, java.lang.String r10) {
        /*
            r7 = 300(0x12c, float:4.2E-43)
            r0 = 0
            com.google.android.gms.internal.ch r3 = new com.google.android.gms.internal.ch     // Catch: java.io.IOException -> Lb4
            r3.<init>()     // Catch: java.io.IOException -> Lb4
            java.net.URL r1 = new java.net.URL     // Catch: java.io.IOException -> Lb4
            r1.<init>(r10)     // Catch: java.io.IOException -> Lb4
            r2 = r1
            r1 = r0
        Lf:
            java.net.URLConnection r0 = r2.openConnection()     // Catch: java.io.IOException -> Lb4
            java.net.HttpURLConnection r0 = (java.net.HttpURLConnection) r0     // Catch: java.io.IOException -> Lb4
            r4 = 0
            com.google.android.gms.internal.co.a(r8, r9, r4, r0)     // Catch: java.lang.Throwable -> Ld7
            int r4 = r0.getResponseCode()     // Catch: java.lang.Throwable -> Ld7
            java.util.Map r5 = r0.getHeaderFields()     // Catch: java.lang.Throwable -> Ld7
            r6 = 200(0xc8, float:2.8E-43)
            if (r4 < r6) goto L47
            if (r4 >= r7) goto L47
            java.lang.String r1 = r2.toString()     // Catch: java.lang.Throwable -> Ld7
            java.io.InputStreamReader r2 = new java.io.InputStreamReader     // Catch: java.lang.Throwable -> Ld7
            java.io.InputStream r6 = r0.getInputStream()     // Catch: java.lang.Throwable -> Ld7
            r2.<init>(r6)     // Catch: java.lang.Throwable -> Ld7
            java.lang.String r2 = com.google.android.gms.internal.co.a(r2)     // Catch: java.lang.Throwable -> Ld7
            a(r1, r5, r2, r4)     // Catch: java.lang.Throwable -> Ld7
            r3.a(r1, r5, r2)     // Catch: java.lang.Throwable -> Ld7
            com.google.android.gms.internal.cb r1 = r3.aq()     // Catch: java.lang.Throwable -> Ld7
            r0.disconnect()     // Catch: java.io.IOException -> Lb4
            r0 = r1
        L46:
            return r0
        L47:
            java.lang.String r2 = r2.toString()     // Catch: java.lang.Throwable -> Ld7
            r6 = 0
            a(r2, r5, r6, r4)     // Catch: java.lang.Throwable -> Ld7
            if (r4 < r7) goto L8b
            r2 = 400(0x190, float:5.6E-43)
            if (r4 >= r2) goto L8b
            java.lang.String r2 = "Location"
            java.lang.String r4 = r0.getHeaderField(r2)     // Catch: java.lang.Throwable -> Ld7
            boolean r2 = android.text.TextUtils.isEmpty(r4)     // Catch: java.lang.Throwable -> Ld7
            if (r2 == 0) goto L71
            java.lang.String r1 = "No location header to follow redirect."
            com.google.android.gms.internal.ct.v(r1)     // Catch: java.lang.Throwable -> Ld7
            com.google.android.gms.internal.cb r1 = new com.google.android.gms.internal.cb     // Catch: java.lang.Throwable -> Ld7
            r2 = 0
            r1.<init>(r2)     // Catch: java.lang.Throwable -> Ld7
            r0.disconnect()     // Catch: java.io.IOException -> Lb4
            r0 = r1
            goto L46
        L71:
            java.net.URL r2 = new java.net.URL     // Catch: java.lang.Throwable -> Ld7
            r2.<init>(r4)     // Catch: java.lang.Throwable -> Ld7
            int r1 = r1 + 1
            r4 = 5
            if (r1 <= r4) goto Lac
            java.lang.String r1 = "Too many redirects."
            com.google.android.gms.internal.ct.v(r1)     // Catch: java.lang.Throwable -> Ld7
            com.google.android.gms.internal.cb r1 = new com.google.android.gms.internal.cb     // Catch: java.lang.Throwable -> Ld7
            r2 = 0
            r1.<init>(r2)     // Catch: java.lang.Throwable -> Ld7
            r0.disconnect()     // Catch: java.io.IOException -> Lb4
            r0 = r1
            goto L46
        L8b:
            java.lang.StringBuilder r1 = new java.lang.StringBuilder     // Catch: java.lang.Throwable -> Ld7
            r1.<init>()     // Catch: java.lang.Throwable -> Ld7
            java.lang.String r2 = "Received error HTTP response code: "
            java.lang.StringBuilder r1 = r1.append(r2)     // Catch: java.lang.Throwable -> Ld7
            java.lang.StringBuilder r1 = r1.append(r4)     // Catch: java.lang.Throwable -> Ld7
            java.lang.String r1 = r1.toString()     // Catch: java.lang.Throwable -> Ld7
            com.google.android.gms.internal.ct.v(r1)     // Catch: java.lang.Throwable -> Ld7
            com.google.android.gms.internal.cb r1 = new com.google.android.gms.internal.cb     // Catch: java.lang.Throwable -> Ld7
            r2 = 0
            r1.<init>(r2)     // Catch: java.lang.Throwable -> Ld7
            r0.disconnect()     // Catch: java.io.IOException -> Lb4
            r0 = r1
            goto L46
        Lac:
            r3.d(r5)     // Catch: java.lang.Throwable -> Ld7
            r0.disconnect()     // Catch: java.io.IOException -> Lb4
            goto Lf
        Lb4:
            r0 = move-exception
            java.lang.StringBuilder r1 = new java.lang.StringBuilder
            r1.<init>()
            java.lang.String r2 = "Error while connecting to ad server: "
            java.lang.StringBuilder r1 = r1.append(r2)
            java.lang.String r0 = r0.getMessage()
            java.lang.StringBuilder r0 = r1.append(r0)
            java.lang.String r0 = r0.toString()
            com.google.android.gms.internal.ct.v(r0)
            com.google.android.gms.internal.cb r0 = new com.google.android.gms.internal.cb
            r1 = 2
            r0.<init>(r1)
            goto L46
        Ld7:
            r1 = move-exception
            r0.disconnect()     // Catch: java.io.IOException -> Lb4
            throw r1     // Catch: java.io.IOException -> Lb4
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.internal.ce.a(android.content.Context, java.lang.String, java.lang.String):com.google.android.gms.internal.cb");
    }

    public static ce a(Context context, aq aqVar) {
        ce ceVar;
        synchronized (hC) {
            if (hD == null) {
                hD = new ce(context.getApplicationContext(), aqVar);
            }
            ceVar = hD;
        }
        return ceVar;
    }

    private static void a(String str, Map<String, List<String>> map, String str2, int i) {
        if (ct.n(2)) {
            ct.u("Http Response: {\n  URL:\n    " + str + "\n  Headers:");
            if (map != null) {
                for (String str3 : map.keySet()) {
                    ct.u("    " + str3 + ":");
                    Iterator<String> it = map.get(str3).iterator();
                    while (it.hasNext()) {
                        ct.u("      " + it.next());
                    }
                }
            }
            ct.u("  Body:");
            if (str2 != null) {
                for (int i2 = 0; i2 < Math.min(str2.length(), 100000); i2 += 1000) {
                    ct.u(str2.substring(i2, Math.min(str2.length(), i2 + 1000)));
                }
            } else {
                ct.u("    null");
            }
            ct.u("  Response Code:\n    " + i + "\n}");
        }
    }

    @Override // com.google.android.gms.internal.cd
    public cb b(bz bzVar) {
        return a(this.mContext, this.hE, bzVar);
    }
}
