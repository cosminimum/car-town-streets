package com.google.android.gms.internal;

import android.content.Context;
import android.text.TextUtils;
import com.google.android.gms.internal.C0978cd;
import java.util.List;
import java.util.Map;

/* renamed from: com.google.android.gms.internal.ce */
public final class C0981ce extends C0978cd.C0979a {

    /* renamed from: hC */
    private static final Object f2331hC = new Object();

    /* renamed from: hD */
    private static C0981ce f2332hD;

    /* renamed from: hE */
    private final C0883aq f2333hE;
    private final Context mContext;

    private C0981ce(Context context, C0883aq aqVar) {
        this.mContext = context;
        this.f2333hE = aqVar;
    }

    /* renamed from: a */
    private static C0976cb m2125a(final Context context, C0883aq aqVar, final C0972bz bzVar) {
        String string;
        C1004ct.m2214r("Starting ad request from service.");
        aqVar.init();
        C0988ci ciVar = new C0988ci(context);
        if (ciVar.f2369ik == -1) {
            C1004ct.m2214r("Device is offline.");
            return new C0976cb(2);
        }
        final C0984cg cgVar = new C0984cg(bzVar.applicationInfo.packageName);
        if (bzVar.f2308hr.extras != null && (string = bzVar.f2308hr.extras.getString("_ad")) != null) {
            return C0983cf.m2130a(context, bzVar, string);
        }
        final String a = C0983cf.m2131a(bzVar, ciVar, aqVar.mo7070a(250));
        if (a == null) {
            return new C0976cb(0);
        }
        C1003cs.f2412iI.post(new Runnable() {
            public void run() {
                C1007cw a = C1007cw.m2222a(context, new C1466x(), false, false, (C1332h) null, bzVar.f2305ej);
                a.setWillNotDraw(true);
                cgVar.mo7216b(a);
                C1009cx aC = a.mo7240aC();
                aC.mo7257a("/invalidRequest", cgVar.f2343hM);
                aC.mo7257a("/loadAdURL", cgVar.f2344hN);
                aC.mo7257a("/log", C0872am.f1960fs);
                C1004ct.m2214r("Getting the ad request URL.");
                a.loadDataWithBaseURL("http://googleads.g.doubleclick.net", "<!DOCTYPE html><html><head><script src=\"http://googleads.g.doubleclick.net/mads/static/sdk/native/sdk-core-v40.js\"></script><script>AFMA_buildAdURL(" + a + ");</script></head><body></body></html>", "text/html", "UTF-8", (String) null);
            }
        });
        String ap = cgVar.mo7215ap();
        return TextUtils.isEmpty(ap) ? new C0976cb(cgVar.getErrorCode()) : m2126a(context, bzVar.f2305ej.f2413iJ, ap);
    }

    /* JADX WARNING: Code restructure failed: missing block: B:32:?, code lost:
        com.google.android.gms.internal.C1004ct.m2218v("Received error HTTP response code: " + r4);
        r1 = new com.google.android.gms.internal.C0976cb(0);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:34:?, code lost:
        r0.disconnect();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:52:?, code lost:
        return r1;
     */
    /* renamed from: a */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static com.google.android.gms.internal.C0976cb m2126a(android.content.Context r8, java.lang.String r9, java.lang.String r10) {
        /*
            r7 = 300(0x12c, float:4.2E-43)
            r0 = 0
            com.google.android.gms.internal.ch r3 = new com.google.android.gms.internal.ch     // Catch:{ IOException -> 0x00b4 }
            r3.<init>()     // Catch:{ IOException -> 0x00b4 }
            java.net.URL r1 = new java.net.URL     // Catch:{ IOException -> 0x00b4 }
            r1.<init>(r10)     // Catch:{ IOException -> 0x00b4 }
            r2 = r1
            r1 = r0
        L_0x000f:
            java.net.URLConnection r0 = r2.openConnection()     // Catch:{ IOException -> 0x00b4 }
            java.net.HttpURLConnection r0 = (java.net.HttpURLConnection) r0     // Catch:{ IOException -> 0x00b4 }
            r4 = 0
            com.google.android.gms.internal.C0997co.m2174a(r8, r9, r4, r0)     // Catch:{ all -> 0x00d7 }
            int r4 = r0.getResponseCode()     // Catch:{ all -> 0x00d7 }
            java.util.Map r5 = r0.getHeaderFields()     // Catch:{ all -> 0x00d7 }
            r6 = 200(0xc8, float:2.8E-43)
            if (r4 < r6) goto L_0x0047
            if (r4 >= r7) goto L_0x0047
            java.lang.String r1 = r2.toString()     // Catch:{ all -> 0x00d7 }
            java.io.InputStreamReader r2 = new java.io.InputStreamReader     // Catch:{ all -> 0x00d7 }
            java.io.InputStream r6 = r0.getInputStream()     // Catch:{ all -> 0x00d7 }
            r2.<init>(r6)     // Catch:{ all -> 0x00d7 }
            java.lang.String r2 = com.google.android.gms.internal.C0997co.m2168a((java.lang.Readable) r2)     // Catch:{ all -> 0x00d7 }
            m2128a(r1, r5, r2, r4)     // Catch:{ all -> 0x00d7 }
            r3.mo7218a(r1, r5, r2)     // Catch:{ all -> 0x00d7 }
            com.google.android.gms.internal.cb r1 = r3.mo7219aq()     // Catch:{ all -> 0x00d7 }
            r0.disconnect()     // Catch:{ IOException -> 0x00b4 }
            r0 = r1
        L_0x0046:
            return r0
        L_0x0047:
            java.lang.String r2 = r2.toString()     // Catch:{ all -> 0x00d7 }
            r6 = 0
            m2128a(r2, r5, r6, r4)     // Catch:{ all -> 0x00d7 }
            if (r4 < r7) goto L_0x008b
            r2 = 400(0x190, float:5.6E-43)
            if (r4 >= r2) goto L_0x008b
            java.lang.String r2 = "Location"
            java.lang.String r4 = r0.getHeaderField(r2)     // Catch:{ all -> 0x00d7 }
            boolean r2 = android.text.TextUtils.isEmpty(r4)     // Catch:{ all -> 0x00d7 }
            if (r2 == 0) goto L_0x0071
            java.lang.String r1 = "No location header to follow redirect."
            com.google.android.gms.internal.C1004ct.m2218v(r1)     // Catch:{ all -> 0x00d7 }
            com.google.android.gms.internal.cb r1 = new com.google.android.gms.internal.cb     // Catch:{ all -> 0x00d7 }
            r2 = 0
            r1.<init>(r2)     // Catch:{ all -> 0x00d7 }
            r0.disconnect()     // Catch:{ IOException -> 0x00b4 }
            r0 = r1
            goto L_0x0046
        L_0x0071:
            java.net.URL r2 = new java.net.URL     // Catch:{ all -> 0x00d7 }
            r2.<init>(r4)     // Catch:{ all -> 0x00d7 }
            int r1 = r1 + 1
            r4 = 5
            if (r1 <= r4) goto L_0x00ac
            java.lang.String r1 = "Too many redirects."
            com.google.android.gms.internal.C1004ct.m2218v(r1)     // Catch:{ all -> 0x00d7 }
            com.google.android.gms.internal.cb r1 = new com.google.android.gms.internal.cb     // Catch:{ all -> 0x00d7 }
            r2 = 0
            r1.<init>(r2)     // Catch:{ all -> 0x00d7 }
            r0.disconnect()     // Catch:{ IOException -> 0x00b4 }
            r0 = r1
            goto L_0x0046
        L_0x008b:
            java.lang.StringBuilder r1 = new java.lang.StringBuilder     // Catch:{ all -> 0x00d7 }
            r1.<init>()     // Catch:{ all -> 0x00d7 }
            java.lang.String r2 = "Received error HTTP response code: "
            java.lang.StringBuilder r1 = r1.append(r2)     // Catch:{ all -> 0x00d7 }
            java.lang.StringBuilder r1 = r1.append(r4)     // Catch:{ all -> 0x00d7 }
            java.lang.String r1 = r1.toString()     // Catch:{ all -> 0x00d7 }
            com.google.android.gms.internal.C1004ct.m2218v(r1)     // Catch:{ all -> 0x00d7 }
            com.google.android.gms.internal.cb r1 = new com.google.android.gms.internal.cb     // Catch:{ all -> 0x00d7 }
            r2 = 0
            r1.<init>(r2)     // Catch:{ all -> 0x00d7 }
            r0.disconnect()     // Catch:{ IOException -> 0x00b4 }
            r0 = r1
            goto L_0x0046
        L_0x00ac:
            r3.mo7220d(r5)     // Catch:{ all -> 0x00d7 }
            r0.disconnect()     // Catch:{ IOException -> 0x00b4 }
            goto L_0x000f
        L_0x00b4:
            r0 = move-exception
            java.lang.StringBuilder r1 = new java.lang.StringBuilder
            r1.<init>()
            java.lang.String r2 = "Error while connecting to ad server: "
            java.lang.StringBuilder r1 = r1.append(r2)
            java.lang.String r0 = r0.getMessage()
            java.lang.StringBuilder r0 = r1.append(r0)
            java.lang.String r0 = r0.toString()
            com.google.android.gms.internal.C1004ct.m2218v(r0)
            com.google.android.gms.internal.cb r0 = new com.google.android.gms.internal.cb
            r1 = 2
            r0.<init>(r1)
            goto L_0x0046
        L_0x00d7:
            r1 = move-exception
            r0.disconnect()     // Catch:{ IOException -> 0x00b4 }
            throw r1     // Catch:{ IOException -> 0x00b4 }
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.internal.C0981ce.m2126a(android.content.Context, java.lang.String, java.lang.String):com.google.android.gms.internal.cb");
    }

    /* renamed from: a */
    public static C0981ce m2127a(Context context, C0883aq aqVar) {
        C0981ce ceVar;
        synchronized (f2331hC) {
            if (f2332hD == null) {
                f2332hD = new C0981ce(context.getApplicationContext(), aqVar);
            }
            ceVar = f2332hD;
        }
        return ceVar;
    }

    /* renamed from: a */
    private static void m2128a(String str, Map<String, List<String>> map, String str2, int i) {
        if (C1004ct.m2213n(2)) {
            C1004ct.m2217u("Http Response: {\n  URL:\n    " + str + "\n  Headers:");
            if (map != null) {
                for (String next : map.keySet()) {
                    C1004ct.m2217u("    " + next + ":");
                    for (String str3 : map.get(next)) {
                        C1004ct.m2217u("      " + str3);
                    }
                }
            }
            C1004ct.m2217u("  Body:");
            if (str2 != null) {
                for (int i2 = 0; i2 < Math.min(str2.length(), 100000); i2 += 1000) {
                    C1004ct.m2217u(str2.substring(i2, Math.min(str2.length(), i2 + 1000)));
                }
            } else {
                C1004ct.m2217u("    null");
            }
            C1004ct.m2217u("  Response Code:\n    " + i + "\n}");
        }
    }

    /* renamed from: b */
    public C0976cb mo7210b(C0972bz bzVar) {
        return m2125a(this.mContext, this.f2333hE, bzVar);
    }
}
