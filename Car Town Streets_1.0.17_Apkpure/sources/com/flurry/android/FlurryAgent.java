package com.flurry.android;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.location.Criteria;
import android.location.Location;
import android.location.LocationListener;
import android.location.LocationManager;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.SystemClock;
import android.provider.Settings;
import android.support.v4.view.MotionEventCompat;
import android.view.View;
import com.google.android.gms.maps.model.BitmapDescriptorFactory;
import com.tapjoy.TapjoyConstants;
import java.io.ByteArrayOutputStream;
import java.io.Closeable;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.lang.Thread;
import java.security.KeyStore;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.TimeZone;
import java.util.WeakHashMap;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.conn.scheme.PlainSocketFactory;
import org.apache.http.conn.scheme.Scheme;
import org.apache.http.conn.scheme.SchemeRegistry;
import org.apache.http.entity.ByteArrayEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.impl.conn.tsccm.ThreadSafeClientConnManager;
import org.apache.http.params.BasicHttpParams;
import org.apache.http.params.HttpConnectionParams;
import org.apache.http.params.HttpParams;
/* loaded from: classes.dex */
public final class FlurryAgent implements LocationListener {
    static String a;
    private List B;
    private LocationManager C;
    private String D;
    private boolean E;
    private long F;
    private long H;
    private long I;
    private long J;
    private Long P;
    private int Q;
    private Location R;
    private boolean U;
    private int V;
    private int X;
    private final Handler q;
    private File r;
    private long v;
    private String x;
    private String y;
    private String z;
    private static final String[] b = {"9774d56d682e549c", "dead00beef"};
    private static volatile String c = null;
    private static volatile String kInsecureReportUrl = "http://data.flurry.com/aap.do";
    private static volatile String kSecureReportUrl = "https://data.flurry.com/aap.do";
    private static volatile String d = null;
    private static volatile String e = "http://ad.flurry.com/getCanvas.do";
    private static volatile String f = null;
    private static volatile String g = "http://ad.flurry.com/getAndroidApp.do";
    private static final FlurryAgent h = new FlurryAgent();
    private static long i = 10000;
    private static boolean j = true;
    private static boolean k = false;
    private static boolean l = false;
    private static boolean m = true;
    private static Criteria n = null;
    private static boolean o = false;
    private static AppCircle p = new AppCircle();
    private File s = null;
    private volatile boolean t = false;
    private volatile boolean u = false;
    private Map w = new WeakHashMap();
    private boolean A = true;
    private List G = new ArrayList();
    private String K = "";
    private String L = "";
    private byte M = -1;
    private String N = "";
    private byte O = -1;
    private Map S = new HashMap();
    private List T = new ArrayList();
    private List W = new ArrayList();
    private u Y = new u();

    /* JADX INFO: Access modifiers changed from: package-private */
    public static /* synthetic */ void a(FlurryAgent flurryAgent, Context context, boolean z) {
        Location location = null;
        if (z) {
            try {
                location = flurryAgent.d(context);
            } catch (Throwable th) {
                ah.b("FlurryAgent", "", th);
                return;
            }
        }
        synchronized (flurryAgent) {
            flurryAgent.R = location;
        }
        if (o) {
            flurryAgent.Y.c();
        }
        flurryAgent.c(true);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static /* synthetic */ void b(FlurryAgent flurryAgent, Context context) {
        boolean z = false;
        try {
            synchronized (flurryAgent) {
                long elapsedRealtime = SystemClock.elapsedRealtime() - flurryAgent.v;
                if (!flurryAgent.t && elapsedRealtime > i && flurryAgent.G.size() > 0) {
                    z = true;
                }
            }
            if (!z) {
                return;
            }
            flurryAgent.c(false);
        } catch (Throwable th) {
            ah.b("FlurryAgent", "", th);
        }
    }

    /* loaded from: classes.dex */
    public class FlurryDefaultExceptionHandler implements Thread.UncaughtExceptionHandler {
        private Thread.UncaughtExceptionHandler a = Thread.getDefaultUncaughtExceptionHandler();

        @Override // java.lang.Thread.UncaughtExceptionHandler
        public void uncaughtException(Thread thread, Throwable th) {
            try {
                FlurryAgent.h.a(th);
            } catch (Throwable th2) {
                ah.b("FlurryAgent", "", th2);
            }
            if (this.a != null) {
                this.a.uncaughtException(thread, th);
            }
        }
    }

    final void a(Throwable th) {
        th.printStackTrace();
        String str = "";
        StackTraceElement[] stackTrace = th.getStackTrace();
        if (stackTrace != null && stackTrace.length > 0) {
            StackTraceElement stackTraceElement = stackTrace[0];
            StringBuilder sb = new StringBuilder();
            sb.append(stackTraceElement.getClassName()).append(".").append(stackTraceElement.getMethodName()).append(":").append(stackTraceElement.getLineNumber());
            if (th.getMessage() != null) {
                sb.append(" (" + th.getMessage() + ")");
            }
            str = sb.toString();
        } else if (th.getMessage() != null) {
            str = th.getMessage();
        }
        onError("uncaught", str, th.getClass().toString());
        this.w.clear();
        a((Context) null, true);
    }

    private FlurryAgent() {
        HandlerThread handlerThread = new HandlerThread("FlurryAgent");
        handlerThread.start();
        this.q = new Handler(handlerThread.getLooper());
    }

    public static void setCatalogIntentName(String str) {
        a = str;
    }

    public static AppCircle getAppCircle() {
        return p;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static View a(Context context, String str, int i2) {
        if (!o) {
            return null;
        }
        try {
            return h.Y.a(context, str, i2);
        } catch (Throwable th) {
            ah.b("FlurryAgent", "", th);
            return null;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void a(Context context, String str) {
        if (o) {
            h.Y.a(context, str);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static Offer a(String str) {
        if (!o) {
            return null;
        }
        return h.Y.b(str);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static List b(String str) {
        if (!o) {
            return null;
        }
        return h.Y.c(str);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void a(Context context, long j2) {
        if (!o) {
            ah.d("FlurryAgent", "Cannot accept Offer. AppCircle is not enabled");
        }
        h.Y.a(context, j2);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void a(List list) {
        if (o) {
            h.Y.a(list);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void a(boolean z) {
        if (o) {
            h.Y.a(z);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static boolean a() {
        return h.Y.i();
    }

    public static void enableAppCircle() {
        o = true;
    }

    public static void setDefaultNoAdsMessage(String str) {
        if (o) {
            if (str == null) {
                str = "";
            }
            u.b = str;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void a(AppCircleCallback appCircleCallback) {
        h.Y.a(appCircleCallback);
    }

    public static void addUserCookie(String str, String str2) {
        if (o) {
            h.Y.a(str, str2);
        }
    }

    public static void clearUserCookies() {
        if (o) {
            h.Y.l();
        }
    }

    public static void setUseHttps(boolean z) {
        k = z;
    }

    public static void onStartSession(Context context, String str) {
        if (context == null) {
            throw new NullPointerException("Null context");
        }
        if (str == null || str.length() == 0) {
            throw new IllegalArgumentException("Api key not specified");
        }
        try {
            h.b(context, str);
        } catch (Throwable th) {
            ah.b("FlurryAgent", "", th);
        }
    }

    public static void onEndSession(Context context) {
        if (context == null) {
            throw new NullPointerException("Null context");
        }
        try {
            h.a(context, false);
        } catch (Throwable th) {
            ah.b("FlurryAgent", "", th);
        }
    }

    public static void onPageView() {
        try {
            h.j();
        } catch (Throwable th) {
            ah.b("FlurryAgent", "", th);
        }
    }

    public static void logEvent(String str) {
        try {
            h.a(str, (Map) null, false);
        } catch (Throwable th) {
            ah.b("FlurryAgent", "Failed to log event: " + str, th);
        }
    }

    public static void logEvent(String str, Map map) {
        try {
            h.a(str, map, false);
        } catch (Throwable th) {
            ah.b("FlurryAgent", "Failed to log event: " + str, th);
        }
    }

    public static void logEvent(String str, boolean z) {
        try {
            h.a(str, (Map) null, z);
        } catch (Throwable th) {
            ah.b("FlurryAgent", "Failed to log event: " + str, th);
        }
    }

    public static void logEvent(String str, Map map, boolean z) {
        try {
            h.a(str, map, z);
        } catch (Throwable th) {
            ah.b("FlurryAgent", "Failed to log event: " + str, th);
        }
    }

    public static void endTimedEvent(String str) {
        try {
            h.c(str);
        } catch (Throwable th) {
            ah.b("FlurryAgent", "Failed to signify the end of event: " + str, th);
        }
    }

    public static void onError(String str, String str2, String str3) {
        try {
            h.a(str, str2, str3);
        } catch (Throwable th) {
            ah.b("FlurryAgent", "", th);
        }
    }

    public static void setReportUrl(String str) {
        c = str;
    }

    public static void setCanvasUrl(String str) {
        d = str;
    }

    public static void setGetAppUrl(String str) {
        f = str;
    }

    public static void setVersionName(String str) {
        synchronized (h) {
            h.z = str;
        }
    }

    public static void setReportLocation(boolean z) {
        synchronized (h) {
            h.A = z;
        }
    }

    public static void setLocationCriteria(Criteria criteria) {
        synchronized (h) {
            n = criteria;
        }
    }

    public static void setAge(int i2) {
        if (i2 > 0 && i2 < 110) {
            Date date = new Date(new Date(System.currentTimeMillis() - (i2 * 31449600000L)).getYear(), 1, 1);
            h.P = Long.valueOf(date.getTime());
        }
    }

    public static void setGender(byte b2) {
        switch (b2) {
            case 0:
            case 1:
                h.O = b2;
                return;
            default:
                h.O = (byte) -1;
                return;
        }
    }

    public static int getAgentVersion() {
        return 117;
    }

    public static boolean getForbidPlaintextFallback() {
        return false;
    }

    public static void setLogEnabled(boolean z) {
        synchronized (h) {
            if (z) {
                ah.b();
            } else {
                ah.a();
            }
        }
    }

    public static void setLogLevel(int i2) {
        synchronized (h) {
            ah.a(i2);
        }
    }

    public static void setContinueSessionMillis(long j2) {
        if (j2 < 5000) {
            ah.b("FlurryAgent", "Invalid time set for session resumption: " + j2);
            return;
        }
        synchronized (h) {
            i = j2;
        }
    }

    public static void setLogEvents(boolean z) {
        synchronized (h) {
            j = z;
        }
    }

    public static void setUserId(String str) {
        synchronized (h) {
            h.N = r.a(str, (int) MotionEventCompat.ACTION_MASK);
        }
    }

    public static void setCaptureUncaughtExceptions(boolean z) {
        synchronized (h) {
            if (h.t) {
                ah.b("FlurryAgent", "Cannot setCaptureUncaughtExceptions after onSessionStart");
            } else {
                m = z;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public static boolean isCaptureUncaughtExceptions() {
        return m;
    }

    public static void onEvent(String str) {
        try {
            h.a(str, (Map) null, false);
        } catch (Throwable th) {
            ah.b("FlurryAgent", "", th);
        }
    }

    public static void onEvent(String str, Map map) {
        try {
            h.a(str, map, false);
        } catch (Throwable th) {
            ah.b("FlurryAgent", "", th);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static u b() {
        return h.Y;
    }

    private synchronized void b(Context context, String str) {
        if (this.x != null && !this.x.equals(str)) {
            ah.b("FlurryAgent", "onStartSession called with different api keys: " + this.x + " and " + str);
        }
        if (((Context) this.w.put(context, context)) != null) {
            ah.d("FlurryAgent", "onStartSession called with duplicate context, use a specific Activity or Service as context instead of using a global context");
        }
        if (!this.t) {
            ah.a("FlurryAgent", "Initializing Flurry session");
            this.x = str;
            this.s = context.getFileStreamPath(".flurryagent." + Integer.toString(this.x.hashCode(), 16));
            this.r = context.getFileStreamPath(".flurryb.");
            if (m) {
                Thread.setDefaultUncaughtExceptionHandler(new FlurryDefaultExceptionHandler());
            }
            Context applicationContext = context.getApplicationContext();
            if (this.z == null) {
                this.z = c(applicationContext);
            }
            String packageName = applicationContext.getPackageName();
            if (this.y != null && !this.y.equals(packageName)) {
                ah.b("FlurryAgent", "onStartSession called from different application packages: " + this.y + " and " + packageName);
            }
            this.y = packageName;
            long elapsedRealtime = SystemClock.elapsedRealtime();
            if (elapsedRealtime - this.v > i) {
                ah.a("FlurryAgent", "New session");
                this.H = System.currentTimeMillis();
                this.I = elapsedRealtime;
                this.J = -1L;
                this.N = "";
                this.Q = 0;
                this.R = null;
                this.L = TimeZone.getDefault().getID();
                this.K = Locale.getDefault().getLanguage() + "_" + Locale.getDefault().getCountry();
                this.S = new HashMap();
                this.T = new ArrayList();
                this.U = true;
                this.W = new ArrayList();
                this.V = 0;
                this.X = 0;
                if (o) {
                    if (!this.Y.b()) {
                        ah.a("FlurryAgent", "Initializing AppCircle");
                        a aVar = new a();
                        aVar.a = this.x;
                        aVar.b = this.F;
                        aVar.c = this.H;
                        aVar.d = this.I;
                        aVar.e = d != null ? d : e;
                        aVar.f = c();
                        aVar.g = this.q;
                        this.Y.a(context, aVar);
                        ah.a("FlurryAgent", "AppCircle initialized");
                    }
                    this.Y.a();
                }
                a(new d(this, applicationContext, this.A));
            } else {
                ah.a("FlurryAgent", "Continuing previous session");
                if (!this.G.isEmpty()) {
                    this.G.remove(this.G.size() - 1);
                }
            }
            this.t = true;
        }
    }

    private synchronized void a(Context context, boolean z) {
        if (context != null) {
            if (((Context) this.w.remove(context)) == null) {
                ah.d("FlurryAgent", "onEndSession called without context from corresponding onStartSession");
            }
        }
        if (this.t && this.w.isEmpty()) {
            ah.a("FlurryAgent", "Ending session");
            m();
            Context applicationContext = context == null ? null : context.getApplicationContext();
            if (context != null) {
                String packageName = applicationContext.getPackageName();
                if (!this.y.equals(packageName)) {
                    ah.b("FlurryAgent", "onEndSession called from different application package, expected: " + this.y + " actual: " + packageName);
                }
            }
            long elapsedRealtime = SystemClock.elapsedRealtime();
            this.v = elapsedRealtime;
            this.J = elapsedRealtime - this.I;
            if (this.D == null) {
                ah.b("FlurryAgent", "Not creating report because of bad Android ID or generated ID is null");
            }
            a(new b(this, z, applicationContext));
            this.t = false;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public synchronized void i() {
        DataOutputStream dataOutputStream;
        ByteArrayOutputStream byteArrayOutputStream;
        DataOutputStream dataOutputStream2 = null;
        try {
            byteArrayOutputStream = new ByteArrayOutputStream();
            dataOutputStream = new DataOutputStream(byteArrayOutputStream);
        } catch (IOException e2) {
            e = e2;
        } catch (Throwable th) {
            th = th;
            dataOutputStream = null;
        }
        try {
            dataOutputStream.writeShort(1);
            dataOutputStream.writeUTF(this.z);
            dataOutputStream.writeLong(this.H);
            dataOutputStream.writeLong(this.J);
            dataOutputStream.writeLong(0L);
            dataOutputStream.writeUTF(this.K);
            dataOutputStream.writeUTF(this.L);
            dataOutputStream.writeByte(this.M);
            dataOutputStream.writeUTF(this.N == null ? "" : this.N);
            if (this.R == null) {
                dataOutputStream.writeBoolean(false);
            } else {
                dataOutputStream.writeBoolean(true);
                dataOutputStream.writeDouble(a(this.R.getLatitude()));
                dataOutputStream.writeDouble(a(this.R.getLongitude()));
                dataOutputStream.writeFloat(this.R.getAccuracy());
            }
            dataOutputStream.writeInt(this.X);
            dataOutputStream.writeByte(-1);
            dataOutputStream.writeByte(-1);
            dataOutputStream.writeByte(this.O);
            if (this.P == null) {
                dataOutputStream.writeBoolean(false);
            } else {
                dataOutputStream.writeBoolean(true);
                dataOutputStream.writeLong(this.P.longValue());
            }
            dataOutputStream.writeShort(this.S.size());
            for (Map.Entry entry : this.S.entrySet()) {
                dataOutputStream.writeUTF((String) entry.getKey());
                dataOutputStream.writeInt(((g) entry.getValue()).a);
            }
            dataOutputStream.writeShort(this.T.size());
            for (i iVar : this.T) {
                dataOutputStream.write(iVar.b());
            }
            dataOutputStream.writeBoolean(this.U);
            dataOutputStream.writeInt(this.Q);
            dataOutputStream.writeShort(this.W.size());
            for (aa aaVar : this.W) {
                dataOutputStream.writeLong(aaVar.a);
                dataOutputStream.writeUTF(aaVar.b);
                dataOutputStream.writeUTF(aaVar.c);
                dataOutputStream.writeUTF(aaVar.d);
            }
            if (o) {
                List<p> g2 = this.Y.g();
                dataOutputStream.writeShort(g2.size());
                for (p pVar : g2) {
                    pVar.a(dataOutputStream);
                }
            } else {
                dataOutputStream.writeShort(0);
            }
            this.G.add(byteArrayOutputStream.toByteArray());
            r.a(dataOutputStream);
        } catch (IOException e3) {
            e = e3;
            dataOutputStream2 = dataOutputStream;
            try {
                ah.b("FlurryAgent", "", e);
                r.a(dataOutputStream2);
            } catch (Throwable th2) {
                th = th2;
                dataOutputStream = dataOutputStream2;
                r.a(dataOutputStream);
                throw th;
            }
        } catch (Throwable th3) {
            th = th3;
            r.a(dataOutputStream);
            throw th;
        }
    }

    private static double a(double d2) {
        return Math.round(d2 * 1000.0d) / 1000.0d;
    }

    private void a(Runnable runnable) {
        this.q.post(runnable);
    }

    private synchronized void j() {
        this.X++;
    }

    private synchronized void a(String str, Map map, boolean z) {
        if (this.T == null) {
            ah.b("FlurryAgent", "onEvent called before onStartSession.  Event: " + str);
        } else {
            long elapsedRealtime = SystemClock.elapsedRealtime() - this.I;
            String a2 = r.a(str, (int) MotionEventCompat.ACTION_MASK);
            if (a2.length() != 0) {
                g gVar = (g) this.S.get(a2);
                if (gVar == null) {
                    if (this.S.size() < 100) {
                        g gVar2 = new g();
                        gVar2.a = 1;
                        this.S.put(a2, gVar2);
                    } else if (ah.a("FlurryAgent")) {
                        ah.a("FlurryAgent", "MaxEventIds exceeded: " + a2);
                    }
                } else {
                    gVar.a++;
                }
                if (j && this.T.size() < 200 && this.V < 16000) {
                    Map emptyMap = map == null ? Collections.emptyMap() : map;
                    if (emptyMap.size() > 10) {
                        if (ah.a("FlurryAgent")) {
                            ah.a("FlurryAgent", "MaxEventParams exceeded: " + emptyMap.size());
                        }
                    } else {
                        i iVar = new i(a2, emptyMap, elapsedRealtime, z);
                        if (iVar.b().length + this.V <= 16000) {
                            this.T.add(iVar);
                            this.V = iVar.b().length + this.V;
                        } else {
                            this.V = 16000;
                            this.U = false;
                        }
                    }
                } else {
                    this.U = false;
                }
            }
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:9:0x0019, code lost:
        r0.a();
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private synchronized void c(java.lang.String r4) {
        /*
            r3 = this;
            monitor-enter(r3)
            java.util.List r0 = r3.T     // Catch: java.lang.Throwable -> L1e
            java.util.Iterator r1 = r0.iterator()     // Catch: java.lang.Throwable -> L1e
        L7:
            boolean r0 = r1.hasNext()     // Catch: java.lang.Throwable -> L1e
            if (r0 == 0) goto L1c
            java.lang.Object r0 = r1.next()     // Catch: java.lang.Throwable -> L1e
            com.flurry.android.i r0 = (com.flurry.android.i) r0     // Catch: java.lang.Throwable -> L1e
            boolean r2 = r0.a(r4)     // Catch: java.lang.Throwable -> L1e
            if (r2 == 0) goto L7
            r0.a()     // Catch: java.lang.Throwable -> L1e
        L1c:
            monitor-exit(r3)
            return
        L1e:
            r0 = move-exception
            monitor-exit(r3)
            throw r0
        */
        throw new UnsupportedOperationException("Method not decompiled: com.flurry.android.FlurryAgent.c(java.lang.String):void");
    }

    private synchronized void a(String str, String str2, String str3) {
        if (this.W == null) {
            ah.b("FlurryAgent", "onError called before onStartSession.  Error: " + str);
        } else {
            this.Q++;
            if (this.W.size() < 10) {
                aa aaVar = new aa();
                aaVar.a = System.currentTimeMillis();
                aaVar.b = r.a(str, (int) MotionEventCompat.ACTION_MASK);
                aaVar.c = r.a(str2, 512);
                aaVar.d = r.a(str3, (int) MotionEventCompat.ACTION_MASK);
                this.W.add(aaVar);
            }
        }
    }

    private synchronized byte[] b(boolean z) {
        DataOutputStream dataOutputStream;
        byte[] bArr;
        synchronized (this) {
            try {
                ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
                dataOutputStream = new DataOutputStream(byteArrayOutputStream);
                try {
                    dataOutputStream.writeShort(15);
                    if (o && z) {
                        dataOutputStream.writeShort(1);
                    } else {
                        dataOutputStream.writeShort(0);
                    }
                    if (o) {
                        dataOutputStream.writeLong(this.Y.e());
                        Set<Long> f2 = this.Y.f();
                        dataOutputStream.writeShort(f2.size());
                        for (Long l2 : f2) {
                            long longValue = l2.longValue();
                            dataOutputStream.writeByte(1);
                            dataOutputStream.writeLong(longValue);
                        }
                    } else {
                        dataOutputStream.writeLong(0L);
                        dataOutputStream.writeShort(0);
                    }
                    dataOutputStream.writeShort(3);
                    dataOutputStream.writeShort(117);
                    dataOutputStream.writeLong(System.currentTimeMillis());
                    dataOutputStream.writeUTF(this.x);
                    dataOutputStream.writeUTF(this.z);
                    dataOutputStream.writeShort(0);
                    dataOutputStream.writeUTF(this.D);
                    dataOutputStream.writeLong(this.F);
                    dataOutputStream.writeLong(this.H);
                    dataOutputStream.writeShort(6);
                    dataOutputStream.writeUTF("device.model");
                    dataOutputStream.writeUTF(Build.MODEL);
                    dataOutputStream.writeUTF("build.brand");
                    dataOutputStream.writeUTF(Build.BRAND);
                    dataOutputStream.writeUTF("build.id");
                    dataOutputStream.writeUTF(Build.ID);
                    dataOutputStream.writeUTF("version.release");
                    dataOutputStream.writeUTF(Build.VERSION.RELEASE);
                    dataOutputStream.writeUTF("build.device");
                    dataOutputStream.writeUTF(Build.DEVICE);
                    dataOutputStream.writeUTF("build.product");
                    dataOutputStream.writeUTF(Build.PRODUCT);
                    int size = this.G.size();
                    dataOutputStream.writeShort(size);
                    for (int i2 = 0; i2 < size; i2++) {
                        dataOutputStream.write((byte[]) this.G.get(i2));
                    }
                    this.B = new ArrayList(this.G);
                    dataOutputStream.close();
                    bArr = byteArrayOutputStream.toByteArray();
                    r.a(dataOutputStream);
                } catch (Throwable th) {
                    th = th;
                    ah.b("FlurryAgent", "Error when generating report", th);
                    r.a(dataOutputStream);
                    bArr = null;
                    return bArr;
                }
            } catch (Throwable th2) {
                th = th2;
                dataOutputStream = null;
            }
        }
        return bArr;
    }

    private static String k() {
        if (c != null) {
            return c;
        }
        if (l) {
            return kInsecureReportUrl;
        }
        if (k) {
            return kSecureReportUrl;
        }
        return kInsecureReportUrl;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static String c() {
        return f != null ? f : g;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static boolean d() {
        if (!o) {
            return false;
        }
        return h.Y.n();
    }

    private boolean a(byte[] bArr) {
        boolean z;
        String k2 = k();
        if (k2 == null) {
            return false;
        }
        try {
            z = a(bArr, k2);
        } catch (Exception e2) {
            ah.a("FlurryAgent", "Sending report exception: " + e2.getMessage());
            z = false;
        }
        if (!z && c == null && k && !l) {
            synchronized (h) {
                l = true;
                String k3 = k();
                if (k3 == null) {
                    z = false;
                } else {
                    try {
                        z = a(bArr, k3);
                    } catch (Exception e3) {
                    }
                }
            }
            return z;
        }
        return z;
    }

    private boolean a(byte[] bArr, String str) {
        boolean z = true;
        if (!"local".equals(str)) {
            ah.a("FlurryAgent", "Sending report to: " + str);
            ByteArrayEntity byteArrayEntity = new ByteArrayEntity(bArr);
            byteArrayEntity.setContentType("application/octet-stream");
            HttpPost httpPost = new HttpPost(str);
            httpPost.setEntity(byteArrayEntity);
            BasicHttpParams basicHttpParams = new BasicHttpParams();
            HttpConnectionParams.setConnectionTimeout(basicHttpParams, 10000);
            HttpConnectionParams.setSoTimeout(basicHttpParams, 15000);
            httpPost.getParams().setBooleanParameter("http.protocol.expect-continue", false);
            HttpResponse execute = a((HttpParams) basicHttpParams).execute(httpPost);
            int statusCode = execute.getStatusLine().getStatusCode();
            synchronized (this) {
                if (statusCode == 200) {
                    ah.a("FlurryAgent", "Report successful");
                    this.E = true;
                    this.G.removeAll(this.B);
                    HttpEntity entity = execute.getEntity();
                    ah.a("FlurryAgent", "Processing report response");
                    if (entity != null && entity.getContentLength() != 0) {
                        a(new DataInputStream(entity.getContent()));
                        entity.consumeContent();
                    }
                } else {
                    ah.a("FlurryAgent", "Report failed. HTTP response: " + statusCode);
                    z = false;
                }
                this.B = null;
            }
        }
        return z;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v14, types: [int] */
    private void a(DataInputStream dataInputStream) {
        int readUnsignedShort;
        HashMap hashMap = new HashMap();
        HashMap hashMap2 = new HashMap();
        HashMap hashMap3 = new HashMap();
        HashMap hashMap4 = new HashMap();
        HashMap hashMap5 = new HashMap();
        HashMap hashMap6 = new HashMap();
        do {
            readUnsignedShort = dataInputStream.readUnsignedShort();
            int readInt = dataInputStream.readInt();
            switch (readUnsignedShort) {
                case 258:
                    dataInputStream.readInt();
                    break;
                case 259:
                    byte readByte = dataInputStream.readByte();
                    int readUnsignedShort2 = dataInputStream.readUnsignedShort();
                    v[] vVarArr = new v[readUnsignedShort2];
                    for (int i2 = 0; i2 < readUnsignedShort2; i2++) {
                        vVarArr[i2] = new v(dataInputStream);
                    }
                    hashMap.put(Byte.valueOf(readByte), vVarArr);
                    break;
                case 260:
                case 261:
                case 265:
                case 267:
                default:
                    ah.a("FlurryAgent", "Unknown chunkType: " + readUnsignedShort);
                    dataInputStream.skipBytes(readInt);
                    break;
                case 262:
                    int readUnsignedShort3 = dataInputStream.readUnsignedShort();
                    for (int i3 = 0; i3 < readUnsignedShort3; i3++) {
                        AdImage adImage = new AdImage(dataInputStream);
                        hashMap2.put(Long.valueOf(adImage.a), adImage);
                        ah.a("FlurryAgent", "Parsed image: " + adImage.a);
                    }
                    break;
                case 263:
                    int readInt2 = dataInputStream.readInt();
                    for (int i4 = 0; i4 < readInt2; i4++) {
                        e eVar = new e(dataInputStream);
                        hashMap4.put(eVar.a, eVar);
                    }
                    break;
                case 264:
                    break;
                case 266:
                    byte readByte2 = dataInputStream.readByte();
                    for (int i5 = 0; i5 < readByte2; i5++) {
                        c cVar = new c(dataInputStream);
                        hashMap5.put(Byte.valueOf(cVar.a), cVar);
                    }
                    break;
                case 268:
                    int readInt3 = dataInputStream.readInt();
                    for (int i6 = 0; i6 < readInt3; i6++) {
                        hashMap6.put(Short.valueOf(dataInputStream.readShort()), Long.valueOf(dataInputStream.readLong()));
                    }
                    break;
                case 269:
                    dataInputStream.skipBytes(readInt);
                    break;
                case 270:
                    dataInputStream.skipBytes(readInt);
                    break;
                case 271:
                    byte readByte3 = dataInputStream.readByte();
                    for (byte b2 = 0; b2 < readByte3; b2++) {
                        c cVar2 = (c) hashMap5.get(Byte.valueOf(dataInputStream.readByte()));
                        if (cVar2 != null) {
                            cVar2.a(dataInputStream);
                        }
                    }
                    break;
                case 272:
                    long readLong = dataInputStream.readLong();
                    al alVar = (al) hashMap3.get(Long.valueOf(readLong));
                    if (alVar == null) {
                        alVar = new al();
                    }
                    alVar.a = dataInputStream.readUTF();
                    alVar.c = dataInputStream.readInt();
                    hashMap3.put(Long.valueOf(readLong), alVar);
                    break;
                case 273:
                    dataInputStream.skipBytes(readInt);
                    break;
            }
        } while (readUnsignedShort != 264);
        if (o) {
            if (hashMap.isEmpty()) {
                ah.a("FlurryAgent", "No ads from server");
            }
            this.Y.a(hashMap, hashMap4, hashMap5, hashMap2, hashMap3, hashMap6);
        }
    }

    private void c(boolean z) {
        try {
            ah.a("FlurryAgent", "generating report");
            byte[] b2 = b(z);
            if (b2 != null) {
                if (a(b2)) {
                    ah.a("FlurryAgent", "Done sending " + (this.t ? "initial " : "") + "agent report");
                    l();
                }
            } else {
                ah.a("FlurryAgent", "Error generating report");
            }
        } catch (IOException e2) {
            ah.a("FlurryAgent", "", e2);
        } catch (Throwable th) {
            ah.b("FlurryAgent", "", th);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Removed duplicated region for block: B:16:0x0065 A[Catch: Throwable -> 0x011d, TryCatch #4 {, blocks: (B:3:0x0001, B:5:0x000f, B:13:0x005e, B:20:0x0074, B:22:0x0078, B:23:0x0082, B:25:0x0086, B:26:0x00d5, B:28:0x00e6, B:30:0x00ee, B:38:0x0106, B:42:0x0127, B:37:0x00ff, B:14:0x0061, B:16:0x0065, B:18:0x006d, B:19:0x0114), top: B:2:0x0001 }] */
    /* JADX WARN: Removed duplicated region for block: B:22:0x0078 A[Catch: all -> 0x010b, TryCatch #4 {, blocks: (B:3:0x0001, B:5:0x000f, B:13:0x005e, B:20:0x0074, B:22:0x0078, B:23:0x0082, B:25:0x0086, B:26:0x00d5, B:28:0x00e6, B:30:0x00ee, B:38:0x0106, B:42:0x0127, B:37:0x00ff, B:14:0x0061, B:16:0x0065, B:18:0x006d, B:19:0x0114), top: B:2:0x0001 }] */
    /* JADX WARN: Removed duplicated region for block: B:25:0x0086 A[Catch: all -> 0x010b, TryCatch #4 {, blocks: (B:3:0x0001, B:5:0x000f, B:13:0x005e, B:20:0x0074, B:22:0x0078, B:23:0x0082, B:25:0x0086, B:26:0x00d5, B:28:0x00e6, B:30:0x00ee, B:38:0x0106, B:42:0x0127, B:37:0x00ff, B:14:0x0061, B:16:0x0065, B:18:0x006d, B:19:0x0114), top: B:2:0x0001 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public synchronized void a(android.content.Context r9) {
        /*
            Method dump skipped, instructions count: 309
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.flurry.android.FlurryAgent.a(android.content.Context):void");
    }

    private synchronized void b(DataInputStream dataInputStream) {
        int i2 = 0;
        synchronized (this) {
            int readUnsignedShort = dataInputStream.readUnsignedShort();
            ah.a("FlurryAgent", "File version: " + readUnsignedShort);
            if (readUnsignedShort > 2) {
                ah.b("FlurryAgent", "Unknown agent file version: " + readUnsignedShort);
                throw new IOException("Unknown agent file version: " + readUnsignedShort);
            } else if (readUnsignedShort >= 2) {
                String readUTF = dataInputStream.readUTF();
                ah.a("FlurryAgent", "Loading API key: " + this.x);
                if (readUTF.equals(this.x)) {
                    String readUTF2 = dataInputStream.readUTF();
                    if (this.D == null) {
                        ah.a("FlurryAgent", "Loading phoneId: " + readUTF2);
                    }
                    this.D = readUTF2;
                    this.E = dataInputStream.readBoolean();
                    this.F = dataInputStream.readLong();
                    ah.a("FlurryAgent", "Loading session reports");
                    while (true) {
                        int readUnsignedShort2 = dataInputStream.readUnsignedShort();
                        if (readUnsignedShort2 == 0) {
                            break;
                        }
                        byte[] bArr = new byte[readUnsignedShort2];
                        dataInputStream.readFully(bArr);
                        this.G.add(0, bArr);
                        i2++;
                        ah.a("FlurryAgent", "Session report added: " + i2);
                    }
                    ah.a("FlurryAgent", "Persistent file loaded");
                    this.u = true;
                } else {
                    ah.a("FlurryAgent", "Api keys do not match, old: " + readUTF + ", new: " + this.x);
                }
            } else {
                ah.d("FlurryAgent", "Deleting old file version: " + readUnsignedShort);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public synchronized void l() {
        DataOutputStream dataOutputStream;
        try {
            if (a(this.s)) {
                dataOutputStream = new DataOutputStream(new FileOutputStream(this.s));
                try {
                    dataOutputStream.writeShort(46586);
                    dataOutputStream.writeShort(2);
                    dataOutputStream.writeUTF(this.x);
                    dataOutputStream.writeUTF(this.D);
                    dataOutputStream.writeBoolean(this.E);
                    dataOutputStream.writeLong(this.F);
                    int size = this.G.size() - 1;
                    while (true) {
                        if (size < 0) {
                            break;
                        }
                        byte[] bArr = (byte[]) this.G.get(size);
                        int length = bArr.length;
                        if (length + 2 + dataOutputStream.size() > 50000) {
                            ah.a("FlurryAgent", "discarded sessions: " + size);
                            break;
                        }
                        dataOutputStream.writeShort(length);
                        dataOutputStream.write(bArr);
                        size--;
                    }
                    dataOutputStream.writeShort(0);
                    r.a(dataOutputStream);
                } catch (Throwable th) {
                    th = th;
                    ah.b("FlurryAgent", "", th);
                    r.a(dataOutputStream);
                }
            } else {
                r.a((Closeable) null);
            }
        } catch (Throwable th2) {
            th = th2;
            dataOutputStream = null;
        }
    }

    private static boolean a(File file) {
        File parentFile = file.getParentFile();
        if (parentFile.mkdirs() || parentFile.exists()) {
            return true;
        }
        ah.b("FlurryAgent", "Unable to create persistent dir: " + parentFile);
        return false;
    }

    private synchronized void c(Context context, String str) {
        DataOutputStream dataOutputStream;
        this.r = context.getFileStreamPath(".flurryb.");
        if (a(this.r)) {
            try {
                dataOutputStream = new DataOutputStream(new FileOutputStream(this.r));
            } catch (Throwable th) {
                th = th;
                dataOutputStream = null;
            }
            try {
                dataOutputStream.writeInt(1);
                dataOutputStream.writeUTF(str);
                r.a(dataOutputStream);
            } catch (Throwable th2) {
                th = th2;
                ah.b("FlurryAgent", "Error when saving b file", th);
                r.a(dataOutputStream);
            }
        }
    }

    private String b(Context context) {
        DataInputStream dataInputStream;
        boolean z = false;
        if (this.D != null) {
            return this.D;
        }
        String string = Settings.System.getString(context.getContentResolver(), TapjoyConstants.TJC_ANDROID_ID);
        if (string != null && string.length() > 0 && !string.equals("null")) {
            String[] strArr = b;
            int length = strArr.length;
            int i2 = 0;
            while (true) {
                if (i2 >= length) {
                    z = true;
                    break;
                } else if (string.equals(strArr[i2])) {
                    break;
                } else {
                    i2++;
                }
            }
        }
        if (z) {
            return "AND" + string;
        }
        File fileStreamPath = context.getFileStreamPath(".flurryb.");
        if (!fileStreamPath.exists()) {
            return null;
        }
        try {
            dataInputStream = new DataInputStream(new FileInputStream(fileStreamPath));
        } catch (Throwable th) {
            th = th;
            dataInputStream = null;
        }
        try {
            dataInputStream.readInt();
            return dataInputStream.readUTF();
        } catch (Throwable th2) {
            th = th2;
            try {
                ah.b("FlurryAgent", "Error when loading b file", th);
                return null;
            } finally {
                r.a(dataInputStream);
            }
        }
    }

    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:11:0x0027 -> B:5:0x0013). Please submit an issue!!! */
    private static String c(Context context) {
        PackageInfo packageInfo;
        try {
            packageInfo = context.getPackageManager().getPackageInfo(context.getPackageName(), 0);
        } catch (Throwable th) {
            ah.b("FlurryAgent", "", th);
        }
        if (packageInfo.versionName != null) {
            return packageInfo.versionName;
        }
        if (packageInfo.versionCode != 0) {
            return Integer.toString(packageInfo.versionCode);
        }
        return "Unknown";
    }

    private Location d(Context context) {
        if (context.checkCallingOrSelfPermission("android.permission.ACCESS_FINE_LOCATION") == 0 || context.checkCallingOrSelfPermission("android.permission.ACCESS_COARSE_LOCATION") == 0) {
            LocationManager locationManager = (LocationManager) context.getSystemService("location");
            synchronized (this) {
                if (this.C == null) {
                    this.C = locationManager;
                } else {
                    locationManager = this.C;
                }
            }
            Criteria criteria = n;
            if (criteria == null) {
                criteria = new Criteria();
            }
            String bestProvider = locationManager.getBestProvider(criteria, true);
            if (bestProvider != null) {
                locationManager.requestLocationUpdates(bestProvider, 0L, BitmapDescriptorFactory.HUE_RED, this, Looper.getMainLooper());
                return locationManager.getLastKnownLocation(bestProvider);
            }
        }
        return null;
    }

    private synchronized void m() {
        if (this.C != null) {
            this.C.removeUpdates(this);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static String e() {
        return h.x;
    }

    private synchronized String n() {
        return this.D;
    }

    public static String getPhoneId() {
        return h.n();
    }

    @Override // android.location.LocationListener
    public final synchronized void onLocationChanged(Location location) {
        try {
            this.R = location;
            m();
        } catch (Throwable th) {
            ah.b("FlurryAgent", "", th);
        }
    }

    @Override // android.location.LocationListener
    public final void onProviderDisabled(String str) {
    }

    @Override // android.location.LocationListener
    public final void onProviderEnabled(String str) {
    }

    @Override // android.location.LocationListener
    public final void onStatusChanged(String str, int i2, Bundle bundle) {
    }

    private HttpClient a(HttpParams httpParams) {
        try {
            KeyStore keyStore = KeyStore.getInstance(KeyStore.getDefaultType());
            keyStore.load(null, null);
            ai aiVar = new ai(this, keyStore);
            SchemeRegistry schemeRegistry = new SchemeRegistry();
            schemeRegistry.register(new Scheme("http", PlainSocketFactory.getSocketFactory(), 80));
            schemeRegistry.register(new Scheme("https", aiVar, 443));
            return new DefaultHttpClient(new ThreadSafeClientConnManager(httpParams, schemeRegistry), httpParams);
        } catch (Exception e2) {
            return new DefaultHttpClient(httpParams);
        }
    }
}
