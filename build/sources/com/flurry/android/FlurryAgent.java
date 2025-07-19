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
import android.support.p000v4.view.MotionEventCompat;
import android.view.View;
import com.google.android.gms.maps.model.BitmapDescriptorFactory;
import com.tapjoy.TapjoyConstants;
import java.io.ByteArrayOutputStream;
import java.io.Closeable;
import java.io.DataInputStream;
import java.io.DataOutput;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.Thread;
import java.security.KeyStore;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
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

public final class FlurryAgent implements LocationListener {

    /* renamed from: a */
    static String f418a;

    /* renamed from: b */
    private static final String[] f419b = {"9774d56d682e549c", "dead00beef"};

    /* renamed from: c */
    private static volatile String f420c = null;

    /* renamed from: d */
    private static volatile String f421d = null;

    /* renamed from: e */
    private static volatile String f422e = "http://ad.flurry.com/getCanvas.do";

    /* renamed from: f */
    private static volatile String f423f = null;

    /* renamed from: g */
    private static volatile String f424g = "http://ad.flurry.com/getAndroidApp.do";
    /* access modifiers changed from: private */

    /* renamed from: h */
    public static final FlurryAgent f425h = new FlurryAgent();
    /* access modifiers changed from: private */

    /* renamed from: i */
    public static long f426i = 10000;

    /* renamed from: j */
    private static boolean f427j = true;

    /* renamed from: k */
    private static boolean f428k = false;
    private static volatile String kInsecureReportUrl = "http://data.flurry.com/aap.do";
    private static volatile String kSecureReportUrl = "https://data.flurry.com/aap.do";

    /* renamed from: l */
    private static boolean f429l = false;

    /* renamed from: m */
    private static boolean f430m = true;

    /* renamed from: n */
    private static Criteria f431n = null;
    /* access modifiers changed from: private */

    /* renamed from: o */
    public static boolean f432o = false;

    /* renamed from: p */
    private static AppCircle f433p = new AppCircle();

    /* renamed from: A */
    private boolean f434A = true;

    /* renamed from: B */
    private List f435B;

    /* renamed from: C */
    private LocationManager f436C;

    /* renamed from: D */
    private String f437D;

    /* renamed from: E */
    private boolean f438E;

    /* renamed from: F */
    private long f439F;

    /* renamed from: G */
    private List f440G = new ArrayList();

    /* renamed from: H */
    private long f441H;

    /* renamed from: I */
    private long f442I;

    /* renamed from: J */
    private long f443J;

    /* renamed from: K */
    private String f444K = "";

    /* renamed from: L */
    private String f445L = "";

    /* renamed from: M */
    private byte f446M = -1;

    /* renamed from: N */
    private String f447N = "";

    /* renamed from: O */
    private byte f448O = -1;

    /* renamed from: P */
    private Long f449P;

    /* renamed from: Q */
    private int f450Q;

    /* renamed from: R */
    private Location f451R;

    /* renamed from: S */
    private Map f452S = new HashMap();

    /* renamed from: T */
    private List f453T = new ArrayList();

    /* renamed from: U */
    private boolean f454U;

    /* renamed from: V */
    private int f455V;

    /* renamed from: W */
    private List f456W = new ArrayList();

    /* renamed from: X */
    private int f457X;
    /* access modifiers changed from: private */

    /* renamed from: Y */
    public C0323u f458Y = new C0323u();
    /* access modifiers changed from: private */

    /* renamed from: q */
    public final Handler f459q;

    /* renamed from: r */
    private File f460r;

    /* renamed from: s */
    private File f461s = null;

    /* renamed from: t */
    private volatile boolean f462t = false;
    /* access modifiers changed from: private */

    /* renamed from: u */
    public volatile boolean f463u = false;

    /* renamed from: v */
    private long f464v;

    /* renamed from: w */
    private Map f465w = new WeakHashMap();

    /* renamed from: x */
    private String f466x;

    /* renamed from: y */
    private String f467y;

    /* renamed from: z */
    private String f468z;

    /* renamed from: a */
    static /* synthetic */ void m476a(FlurryAgent flurryAgent, Context context, boolean z) {
        Location location = null;
        if (z) {
            try {
                location = flurryAgent.m502d(context);
            } catch (Throwable th) {
                C0299ah.m538b("FlurryAgent", "", th);
                return;
            }
        }
        synchronized (flurryAgent) {
            flurryAgent.f451R = location;
        }
        if (f432o) {
            flurryAgent.f458Y.mo2445c();
        }
        flurryAgent.m501c(true);
    }

    /* renamed from: b */
    static /* synthetic */ void m493b(FlurryAgent flurryAgent, Context context) {
        boolean z = false;
        try {
            synchronized (flurryAgent) {
                long elapsedRealtime = SystemClock.elapsedRealtime() - flurryAgent.f464v;
                if (!flurryAgent.f462t && elapsedRealtime > f426i && flurryAgent.f440G.size() > 0) {
                    z = true;
                }
            }
            if (z) {
                flurryAgent.m501c(false);
            }
        } catch (Throwable th) {
            C0299ah.m538b("FlurryAgent", "", th);
        }
    }

    public class FlurryDefaultExceptionHandler implements Thread.UncaughtExceptionHandler {

        /* renamed from: a */
        private Thread.UncaughtExceptionHandler f469a = Thread.getDefaultUncaughtExceptionHandler();

        FlurryDefaultExceptionHandler() {
        }

        public void uncaughtException(Thread thread, Throwable th) {
            try {
                FlurryAgent.f425h.mo2372a(th);
            } catch (Throwable th2) {
                C0299ah.m538b("FlurryAgent", "", th2);
            }
            if (this.f469a != null) {
                this.f469a.uncaughtException(thread, th);
            }
        }
    }

    /* access modifiers changed from: package-private */
    /* renamed from: a */
    public final void mo2372a(Throwable th) {
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
        this.f465w.clear();
        m473a((Context) null, true);
    }

    private FlurryAgent() {
        HandlerThread handlerThread = new HandlerThread("FlurryAgent");
        handlerThread.start();
        this.f459q = new Handler(handlerThread.getLooper());
    }

    public static void setCatalogIntentName(String str) {
        f418a = str;
    }

    public static AppCircle getAppCircle() {
        return f433p;
    }

    /* renamed from: a */
    static View m467a(Context context, String str, int i) {
        if (!f432o) {
            return null;
        }
        try {
            return f425h.f458Y.mo2426a(context, str, i);
        } catch (Throwable th) {
            C0299ah.m538b("FlurryAgent", "", th);
            return null;
        }
    }

    /* renamed from: a */
    static void m472a(Context context, String str) {
        if (f432o) {
            f425h.f458Y.mo2434a(context, str);
        }
    }

    /* renamed from: a */
    static Offer m468a(String str) {
        if (!f432o) {
            return null;
        }
        return f425h.f458Y.mo2441b(str);
    }

    /* renamed from: b */
    static List m490b(String str) {
        if (!f432o) {
            return null;
        }
        return f425h.f458Y.mo2444c(str);
    }

    /* renamed from: a */
    static void m471a(Context context, long j) {
        if (!f432o) {
            C0299ah.m542d("FlurryAgent", "Cannot accept Offer. AppCircle is not enabled");
        }
        f425h.f458Y.mo2431a(context, j);
    }

    /* renamed from: a */
    static void m481a(List list) {
        if (f432o) {
            f425h.f458Y.mo2438a(list);
        }
    }

    /* renamed from: a */
    static void m482a(boolean z) {
        if (f432o) {
            f425h.f458Y.mo2440a(z);
        }
    }

    /* renamed from: a */
    static boolean m483a() {
        return f425h.f458Y.mo2451i();
    }

    public static void enableAppCircle() {
        f432o = true;
    }

    public static void setDefaultNoAdsMessage(String str) {
        if (f432o) {
            if (str == null) {
                str = "";
            }
            C0323u.f618b = str;
        }
    }

    /* renamed from: a */
    static void m474a(AppCircleCallback appCircleCallback) {
        f425h.f458Y.mo2435a(appCircleCallback);
    }

    public static void addUserCookie(String str, String str2) {
        if (f432o) {
            f425h.f458Y.mo2437a(str, str2);
        }
    }

    public static void clearUserCookies() {
        if (f432o) {
            f425h.f458Y.mo2454l();
        }
    }

    public static void setUseHttps(boolean z) {
        f428k = z;
    }

    public static void onStartSession(Context context, String str) {
        if (context == null) {
            throw new NullPointerException("Null context");
        } else if (str == null || str.length() == 0) {
            throw new IllegalArgumentException("Api key not specified");
        } else {
            try {
                f425h.m491b(context, str);
            } catch (Throwable th) {
                C0299ah.m538b("FlurryAgent", "", th);
            }
        }
    }

    public static void onEndSession(Context context) {
        if (context == null) {
            throw new NullPointerException("Null context");
        }
        try {
            f425h.m473a(context, false);
        } catch (Throwable th) {
            C0299ah.m538b("FlurryAgent", "", th);
        }
    }

    public static void onPageView() {
        try {
            f425h.m511j();
        } catch (Throwable th) {
            C0299ah.m538b("FlurryAgent", "", th);
        }
    }

    public static void logEvent(String str) {
        try {
            f425h.m480a(str, (Map) null, false);
        } catch (Throwable th) {
            C0299ah.m538b("FlurryAgent", "Failed to log event: " + str, th);
        }
    }

    public static void logEvent(String str, Map map) {
        try {
            f425h.m480a(str, map, false);
        } catch (Throwable th) {
            C0299ah.m538b("FlurryAgent", "Failed to log event: " + str, th);
        }
    }

    public static void logEvent(String str, boolean z) {
        try {
            f425h.m480a(str, (Map) null, z);
        } catch (Throwable th) {
            C0299ah.m538b("FlurryAgent", "Failed to log event: " + str, th);
        }
    }

    public static void logEvent(String str, Map map, boolean z) {
        try {
            f425h.m480a(str, map, z);
        } catch (Throwable th) {
            C0299ah.m538b("FlurryAgent", "Failed to log event: " + str, th);
        }
    }

    public static void endTimedEvent(String str) {
        try {
            f425h.m500c(str);
        } catch (Throwable th) {
            C0299ah.m538b("FlurryAgent", "Failed to signify the end of event: " + str, th);
        }
    }

    public static void onError(String str, String str2, String str3) {
        try {
            f425h.m479a(str, str2, str3);
        } catch (Throwable th) {
            C0299ah.m538b("FlurryAgent", "", th);
        }
    }

    public static void setReportUrl(String str) {
        f420c = str;
    }

    public static void setCanvasUrl(String str) {
        f421d = str;
    }

    public static void setGetAppUrl(String str) {
        f423f = str;
    }

    public static void setVersionName(String str) {
        synchronized (f425h) {
            f425h.f468z = str;
        }
    }

    public static void setReportLocation(boolean z) {
        synchronized (f425h) {
            f425h.f434A = z;
        }
    }

    public static void setLocationCriteria(Criteria criteria) {
        synchronized (f425h) {
            f431n = criteria;
        }
    }

    public static void setAge(int i) {
        if (i > 0 && i < 110) {
            Date date = new Date(new Date(System.currentTimeMillis() - (((long) i) * 31449600000L)).getYear(), 1, 1);
            f425h.f449P = Long.valueOf(date.getTime());
        }
    }

    public static void setGender(byte b) {
        switch (b) {
            case 0:
            case 1:
                f425h.f448O = b;
                return;
            default:
                f425h.f448O = -1;
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
        synchronized (f425h) {
            if (z) {
                C0299ah.m539b();
            } else {
                C0299ah.m534a();
            }
        }
    }

    public static void setLogLevel(int i) {
        synchronized (f425h) {
            C0299ah.m535a(i);
        }
    }

    public static void setContinueSessionMillis(long j) {
        if (j < 5000) {
            C0299ah.m537b("FlurryAgent", "Invalid time set for session resumption: " + j);
            return;
        }
        synchronized (f425h) {
            f426i = j;
        }
    }

    public static void setLogEvents(boolean z) {
        synchronized (f425h) {
            f427j = z;
        }
    }

    public static void setUserId(String str) {
        synchronized (f425h) {
            f425h.f447N = C0320r.m559a(str, (int) MotionEventCompat.ACTION_MASK);
        }
    }

    public static void setCaptureUncaughtExceptions(boolean z) {
        synchronized (f425h) {
            if (f425h.f462t) {
                C0299ah.m537b("FlurryAgent", "Cannot setCaptureUncaughtExceptions after onSessionStart");
            } else {
                f430m = z;
            }
        }
    }

    protected static boolean isCaptureUncaughtExceptions() {
        return f430m;
    }

    public static void onEvent(String str) {
        try {
            f425h.m480a(str, (Map) null, false);
        } catch (Throwable th) {
            C0299ah.m538b("FlurryAgent", "", th);
        }
    }

    public static void onEvent(String str, Map map) {
        try {
            f425h.m480a(str, map, false);
        } catch (Throwable th) {
            C0299ah.m538b("FlurryAgent", "", th);
        }
    }

    /* renamed from: b */
    static C0323u m488b() {
        return f425h.f458Y;
    }

    /* renamed from: b */
    private synchronized void m491b(Context context, String str) {
        if (this.f466x != null && !this.f466x.equals(str)) {
            C0299ah.m537b("FlurryAgent", "onStartSession called with different api keys: " + this.f466x + " and " + str);
        }
        if (((Context) this.f465w.put(context, context)) != null) {
            C0299ah.m542d("FlurryAgent", "onStartSession called with duplicate context, use a specific Activity or Service as context instead of using a global context");
        }
        if (!this.f462t) {
            C0299ah.m532a("FlurryAgent", "Initializing Flurry session");
            this.f466x = str;
            this.f461s = context.getFileStreamPath(".flurryagent." + Integer.toString(this.f466x.hashCode(), 16));
            this.f460r = context.getFileStreamPath(".flurryb.");
            if (f430m) {
                Thread.setDefaultUncaughtExceptionHandler(new FlurryDefaultExceptionHandler());
            }
            Context applicationContext = context.getApplicationContext();
            if (this.f468z == null) {
                this.f468z = m497c(applicationContext);
            }
            String packageName = applicationContext.getPackageName();
            if (this.f467y != null && !this.f467y.equals(packageName)) {
                C0299ah.m537b("FlurryAgent", "onStartSession called from different application packages: " + this.f467y + " and " + packageName);
            }
            this.f467y = packageName;
            long elapsedRealtime = SystemClock.elapsedRealtime();
            if (elapsedRealtime - this.f464v > f426i) {
                C0299ah.m532a("FlurryAgent", "New session");
                this.f441H = System.currentTimeMillis();
                this.f442I = elapsedRealtime;
                this.f443J = -1;
                this.f447N = "";
                this.f450Q = 0;
                this.f451R = null;
                this.f445L = TimeZone.getDefault().getID();
                this.f444K = Locale.getDefault().getLanguage() + "_" + Locale.getDefault().getCountry();
                this.f452S = new HashMap();
                this.f453T = new ArrayList();
                this.f454U = true;
                this.f456W = new ArrayList();
                this.f455V = 0;
                this.f457X = 0;
                if (f432o) {
                    if (!this.f458Y.mo2443b()) {
                        C0299ah.m532a("FlurryAgent", "Initializing AppCircle");
                        C0291a aVar = new C0291a();
                        aVar.f483a = this.f466x;
                        aVar.f484b = this.f439F;
                        aVar.f485c = this.f441H;
                        aVar.f486d = this.f442I;
                        aVar.f487e = f421d != null ? f421d : f422e;
                        aVar.f488f = m496c();
                        aVar.f489g = this.f459q;
                        this.f458Y.mo2432a(context, aVar);
                        C0299ah.m532a("FlurryAgent", "AppCircle initialized");
                    }
                    this.f458Y.mo2429a();
                }
                m478a((Runnable) new C0306d(this, applicationContext, this.f434A));
            } else {
                C0299ah.m532a("FlurryAgent", "Continuing previous session");
                if (!this.f440G.isEmpty()) {
                    this.f440G.remove(this.f440G.size() - 1);
                }
            }
            this.f462t = true;
        }
    }

    /* renamed from: a */
    private synchronized void m473a(Context context, boolean z) {
        if (context != null) {
            if (((Context) this.f465w.remove(context)) == null) {
                C0299ah.m542d("FlurryAgent", "onEndSession called without context from corresponding onStartSession");
            }
        }
        if (this.f462t && this.f465w.isEmpty()) {
            C0299ah.m532a("FlurryAgent", "Ending session");
            m514m();
            Context applicationContext = context == null ? null : context.getApplicationContext();
            if (context != null) {
                String packageName = applicationContext.getPackageName();
                if (!this.f467y.equals(packageName)) {
                    C0299ah.m537b("FlurryAgent", "onEndSession called from different application package, expected: " + this.f467y + " actual: " + packageName);
                }
            }
            long elapsedRealtime = SystemClock.elapsedRealtime();
            this.f464v = elapsedRealtime;
            this.f443J = elapsedRealtime - this.f442I;
            if (this.f437D == null) {
                C0299ah.m537b("FlurryAgent", "Not creating report because of bad Android ID or generated ID is null");
            }
            m478a((Runnable) new C0304b(this, z, applicationContext));
            this.f462t = false;
        }
    }

    /* access modifiers changed from: private */
    /* renamed from: i */
    public synchronized void m510i() {
        DataOutputStream dataOutputStream;
        DataOutputStream dataOutputStream2 = null;
        try {
            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
            dataOutputStream = new DataOutputStream(byteArrayOutputStream);
            try {
                dataOutputStream.writeShort(1);
                dataOutputStream.writeUTF(this.f468z);
                dataOutputStream.writeLong(this.f441H);
                dataOutputStream.writeLong(this.f443J);
                dataOutputStream.writeLong(0);
                dataOutputStream.writeUTF(this.f444K);
                dataOutputStream.writeUTF(this.f445L);
                dataOutputStream.writeByte(this.f446M);
                dataOutputStream.writeUTF(this.f447N == null ? "" : this.f447N);
                if (this.f451R == null) {
                    dataOutputStream.writeBoolean(false);
                } else {
                    dataOutputStream.writeBoolean(true);
                    dataOutputStream.writeDouble(m466a(this.f451R.getLatitude()));
                    dataOutputStream.writeDouble(m466a(this.f451R.getLongitude()));
                    dataOutputStream.writeFloat(this.f451R.getAccuracy());
                }
                dataOutputStream.writeInt(this.f457X);
                dataOutputStream.writeByte(-1);
                dataOutputStream.writeByte(-1);
                dataOutputStream.writeByte(this.f448O);
                if (this.f449P == null) {
                    dataOutputStream.writeBoolean(false);
                } else {
                    dataOutputStream.writeBoolean(true);
                    dataOutputStream.writeLong(this.f449P.longValue());
                }
                dataOutputStream.writeShort(this.f452S.size());
                for (Map.Entry entry : this.f452S.entrySet()) {
                    dataOutputStream.writeUTF((String) entry.getKey());
                    dataOutputStream.writeInt(((C0309g) entry.getValue()).f590a);
                }
                dataOutputStream.writeShort(this.f453T.size());
                for (C0311i b : this.f453T) {
                    dataOutputStream.write(b.mo2409b());
                }
                dataOutputStream.writeBoolean(this.f454U);
                dataOutputStream.writeInt(this.f450Q);
                dataOutputStream.writeShort(this.f456W.size());
                for (C0292aa aaVar : this.f456W) {
                    dataOutputStream.writeLong(aaVar.f490a);
                    dataOutputStream.writeUTF(aaVar.f491b);
                    dataOutputStream.writeUTF(aaVar.f492c);
                    dataOutputStream.writeUTF(aaVar.f493d);
                }
                if (f432o) {
                    List<C0318p> g = this.f458Y.mo2449g();
                    dataOutputStream.writeShort(g.size());
                    for (C0318p a : g) {
                        a.mo2420a((DataOutput) dataOutputStream);
                    }
                } else {
                    dataOutputStream.writeShort(0);
                }
                this.f440G.add(byteArrayOutputStream.toByteArray());
                C0320r.m561a((Closeable) dataOutputStream);
            } catch (IOException e) {
                e = e;
                dataOutputStream2 = dataOutputStream;
                try {
                    C0299ah.m538b("FlurryAgent", "", e);
                    C0320r.m561a((Closeable) dataOutputStream2);
                } catch (Throwable th) {
                    th = th;
                    dataOutputStream = dataOutputStream2;
                    C0320r.m561a((Closeable) dataOutputStream);
                    throw th;
                }
            } catch (Throwable th2) {
                th = th2;
                C0320r.m561a((Closeable) dataOutputStream);
                throw th;
            }
        } catch (IOException e2) {
            e = e2;
            C0299ah.m538b("FlurryAgent", "", e);
            C0320r.m561a((Closeable) dataOutputStream2);
        } catch (Throwable th3) {
            th = th3;
            dataOutputStream = null;
            C0320r.m561a((Closeable) dataOutputStream);
            throw th;
        }
    }

    /* renamed from: a */
    private static double m466a(double d) {
        return ((double) Math.round(d * 1000.0d)) / 1000.0d;
    }

    /* renamed from: a */
    private void m478a(Runnable runnable) {
        this.f459q.post(runnable);
    }

    /* renamed from: j */
    private synchronized void m511j() {
        this.f457X++;
    }

    /* renamed from: a */
    private synchronized void m480a(String str, Map map, boolean z) {
        Map map2;
        if (this.f453T == null) {
            C0299ah.m537b("FlurryAgent", "onEvent called before onStartSession.  Event: " + str);
        } else {
            long elapsedRealtime = SystemClock.elapsedRealtime() - this.f442I;
            String a = C0320r.m559a(str, (int) MotionEventCompat.ACTION_MASK);
            if (a.length() != 0) {
                C0309g gVar = (C0309g) this.f452S.get(a);
                if (gVar != null) {
                    gVar.f590a++;
                } else if (this.f452S.size() < 100) {
                    C0309g gVar2 = new C0309g();
                    gVar2.f590a = 1;
                    this.f452S.put(a, gVar2);
                } else if (C0299ah.m536a("FlurryAgent")) {
                    C0299ah.m532a("FlurryAgent", "MaxEventIds exceeded: " + a);
                }
                if (!f427j || this.f453T.size() >= 200 || this.f455V >= 16000) {
                    this.f454U = false;
                } else {
                    if (map == null) {
                        map2 = Collections.emptyMap();
                    } else {
                        map2 = map;
                    }
                    if (map2.size() <= 10) {
                        C0311i iVar = new C0311i(a, map2, elapsedRealtime, z);
                        if (iVar.mo2409b().length + this.f455V <= 16000) {
                            this.f453T.add(iVar);
                            this.f455V = iVar.mo2409b().length + this.f455V;
                        } else {
                            this.f455V = 16000;
                            this.f454U = false;
                        }
                    } else if (C0299ah.m536a("FlurryAgent")) {
                        C0299ah.m532a("FlurryAgent", "MaxEventParams exceeded: " + map2.size());
                    }
                }
            }
        }
    }

    /* renamed from: c */
    private synchronized void m500c(String str) {
        Iterator it = this.f453T.iterator();
        while (true) {
            if (!it.hasNext()) {
                break;
            }
            C0311i iVar = (C0311i) it.next();
            if (iVar.mo2408a(str)) {
                iVar.mo2407a();
                break;
            }
        }
    }

    /* renamed from: a */
    private synchronized void m479a(String str, String str2, String str3) {
        if (this.f456W == null) {
            C0299ah.m537b("FlurryAgent", "onError called before onStartSession.  Error: " + str);
        } else {
            this.f450Q++;
            if (this.f456W.size() < 10) {
                C0292aa aaVar = new C0292aa();
                aaVar.f490a = System.currentTimeMillis();
                aaVar.f491b = C0320r.m559a(str, (int) MotionEventCompat.ACTION_MASK);
                aaVar.f492c = C0320r.m559a(str2, 512);
                aaVar.f493d = C0320r.m559a(str3, (int) MotionEventCompat.ACTION_MASK);
                this.f456W.add(aaVar);
            }
        }
    }

    /* renamed from: b */
    private synchronized byte[] m495b(boolean z) {
        DataOutputStream dataOutputStream;
        byte[] bArr;
        synchronized (this) {
            try {
                ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
                dataOutputStream = new DataOutputStream(byteArrayOutputStream);
                try {
                    dataOutputStream.writeShort(15);
                    if (!f432o || !z) {
                        dataOutputStream.writeShort(0);
                    } else {
                        dataOutputStream.writeShort(1);
                    }
                    if (f432o) {
                        dataOutputStream.writeLong(this.f458Y.mo2447e());
                        Set<Long> f = this.f458Y.mo2448f();
                        dataOutputStream.writeShort(f.size());
                        for (Long longValue : f) {
                            long longValue2 = longValue.longValue();
                            dataOutputStream.writeByte(1);
                            dataOutputStream.writeLong(longValue2);
                        }
                    } else {
                        dataOutputStream.writeLong(0);
                        dataOutputStream.writeShort(0);
                    }
                    dataOutputStream.writeShort(3);
                    dataOutputStream.writeShort(117);
                    dataOutputStream.writeLong(System.currentTimeMillis());
                    dataOutputStream.writeUTF(this.f466x);
                    dataOutputStream.writeUTF(this.f468z);
                    dataOutputStream.writeShort(0);
                    dataOutputStream.writeUTF(this.f437D);
                    dataOutputStream.writeLong(this.f439F);
                    dataOutputStream.writeLong(this.f441H);
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
                    int size = this.f440G.size();
                    dataOutputStream.writeShort(size);
                    for (int i = 0; i < size; i++) {
                        dataOutputStream.write((byte[]) this.f440G.get(i));
                    }
                    this.f435B = new ArrayList(this.f440G);
                    dataOutputStream.close();
                    bArr = byteArrayOutputStream.toByteArray();
                    C0320r.m561a((Closeable) dataOutputStream);
                } catch (Throwable th) {
                    th = th;
                }
            } catch (Throwable th2) {
                th = th2;
                dataOutputStream = null;
                C0320r.m561a((Closeable) dataOutputStream);
                throw th;
            }
        }
        return bArr;
    }

    /* renamed from: k */
    private static String m512k() {
        if (f420c != null) {
            return f420c;
        }
        if (f429l) {
            return kInsecureReportUrl;
        }
        if (f428k) {
            return kSecureReportUrl;
        }
        return kInsecureReportUrl;
    }

    /* renamed from: c */
    static String m496c() {
        return f423f != null ? f423f : f424g;
    }

    /* renamed from: d */
    static boolean m504d() {
        if (!f432o) {
            return false;
        }
        return f425h.f458Y.mo2456n();
    }

    /* renamed from: a */
    private boolean m486a(byte[] bArr) {
        boolean z;
        String k = m512k();
        if (k == null) {
            return false;
        }
        try {
            z = m487a(bArr, k);
        } catch (Exception e) {
            C0299ah.m532a("FlurryAgent", "Sending report exception: " + e.getMessage());
            z = false;
        }
        if (z || f420c != null || !f428k || f429l) {
            return z;
        }
        synchronized (f425h) {
            f429l = true;
            String k2 = m512k();
            if (k2 == null) {
                return false;
            }
            try {
                return m487a(bArr, k2);
            } catch (Exception e2) {
                return z;
            }
        }
    }

    /* renamed from: a */
    private boolean m487a(byte[] bArr, String str) {
        boolean z = true;
        if (!"local".equals(str)) {
            C0299ah.m532a("FlurryAgent", "Sending report to: " + str);
            ByteArrayEntity byteArrayEntity = new ByteArrayEntity(bArr);
            byteArrayEntity.setContentType("application/octet-stream");
            HttpPost httpPost = new HttpPost(str);
            httpPost.setEntity(byteArrayEntity);
            BasicHttpParams basicHttpParams = new BasicHttpParams();
            HttpConnectionParams.setConnectionTimeout(basicHttpParams, 10000);
            HttpConnectionParams.setSoTimeout(basicHttpParams, 15000);
            httpPost.getParams().setBooleanParameter("http.protocol.expect-continue", false);
            HttpResponse execute = m469a((HttpParams) basicHttpParams).execute(httpPost);
            int statusCode = execute.getStatusLine().getStatusCode();
            synchronized (this) {
                if (statusCode == 200) {
                    C0299ah.m532a("FlurryAgent", "Report successful");
                    this.f438E = true;
                    this.f440G.removeAll(this.f435B);
                    HttpEntity entity = execute.getEntity();
                    C0299ah.m532a("FlurryAgent", "Processing report response");
                    if (!(entity == null || entity.getContentLength() == 0)) {
                        try {
                            m477a(new DataInputStream(entity.getContent()));
                        } finally {
                            entity.consumeContent();
                        }
                    }
                } else {
                    C0299ah.m532a("FlurryAgent", "Report failed. HTTP response: " + statusCode);
                    z = false;
                }
                this.f435B = null;
            }
        }
        return z;
    }

    /* JADX WARNING: type inference failed for: r0v14, types: [int] */
    /* JADX WARNING: Multi-variable type inference failed */
    /* renamed from: a */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private void m477a(java.io.DataInputStream r15) {
        /*
            r14 = this;
            java.util.HashMap r1 = new java.util.HashMap
            r1.<init>()
            java.util.HashMap r4 = new java.util.HashMap
            r4.<init>()
            java.util.HashMap r5 = new java.util.HashMap
            r5.<init>()
            java.util.HashMap r2 = new java.util.HashMap
            r2.<init>()
            java.util.HashMap r3 = new java.util.HashMap
            r3.<init>()
            java.util.HashMap r6 = new java.util.HashMap
            r6.<init>()
        L_0x001e:
            int r8 = r15.readUnsignedShort()
            int r0 = r15.readInt()
            switch(r8) {
                case 258: goto L_0x005f;
                case 259: goto L_0x0063;
                case 260: goto L_0x0029;
                case 261: goto L_0x0029;
                case 262: goto L_0x0082;
                case 263: goto L_0x00b4;
                case 264: goto L_0x0044;
                case 265: goto L_0x0029;
                case 266: goto L_0x00cd;
                case 267: goto L_0x0029;
                case 268: goto L_0x0104;
                case 269: goto L_0x014b;
                case 270: goto L_0x00c8;
                case 271: goto L_0x00e5;
                case 272: goto L_0x0121;
                case 273: goto L_0x0150;
                default: goto L_0x0029;
            }
        L_0x0029:
            java.lang.String r7 = "FlurryAgent"
            java.lang.StringBuilder r9 = new java.lang.StringBuilder
            r9.<init>()
            java.lang.String r10 = "Unknown chunkType: "
            java.lang.StringBuilder r9 = r9.append(r10)
            java.lang.StringBuilder r9 = r9.append(r8)
            java.lang.String r9 = r9.toString()
            com.flurry.android.C0299ah.m532a(r7, r9)
            r15.skipBytes(r0)
        L_0x0044:
            r0 = 264(0x108, float:3.7E-43)
            if (r8 != r0) goto L_0x001e
            boolean r0 = f432o
            if (r0 == 0) goto L_0x005e
            boolean r0 = r1.isEmpty()
            if (r0 == 0) goto L_0x0059
            java.lang.String r0 = "FlurryAgent"
            java.lang.String r7 = "No ads from server"
            com.flurry.android.C0299ah.m532a(r0, r7)
        L_0x0059:
            com.flurry.android.u r0 = r14.f458Y
            r0.mo2439a(r1, r2, r3, r4, r5, r6)
        L_0x005e:
            return
        L_0x005f:
            r15.readInt()
            goto L_0x0044
        L_0x0063:
            byte r7 = r15.readByte()
            int r9 = r15.readUnsignedShort()
            com.flurry.android.v[] r10 = new com.flurry.android.C0324v[r9]
            r0 = 0
        L_0x006e:
            if (r0 >= r9) goto L_0x007a
            com.flurry.android.v r11 = new com.flurry.android.v
            r11.<init>(r15)
            r10[r0] = r11
            int r0 = r0 + 1
            goto L_0x006e
        L_0x007a:
            java.lang.Byte r0 = java.lang.Byte.valueOf(r7)
            r1.put(r0, r10)
            goto L_0x0044
        L_0x0082:
            int r7 = r15.readUnsignedShort()
            r0 = 0
        L_0x0087:
            if (r0 >= r7) goto L_0x0044
            com.flurry.android.AdImage r9 = new com.flurry.android.AdImage
            r9.<init>(r15)
            long r10 = r9.f404a
            java.lang.Long r10 = java.lang.Long.valueOf(r10)
            r4.put(r10, r9)
            java.lang.String r10 = "FlurryAgent"
            java.lang.StringBuilder r11 = new java.lang.StringBuilder
            r11.<init>()
            java.lang.String r12 = "Parsed image: "
            java.lang.StringBuilder r11 = r11.append(r12)
            long r12 = r9.f404a
            java.lang.StringBuilder r9 = r11.append(r12)
            java.lang.String r9 = r9.toString()
            com.flurry.android.C0299ah.m532a(r10, r9)
            int r0 = r0 + 1
            goto L_0x0087
        L_0x00b4:
            int r7 = r15.readInt()
            r0 = 0
        L_0x00b9:
            if (r0 >= r7) goto L_0x0044
            com.flurry.android.e r9 = new com.flurry.android.e
            r9.<init>(r15)
            java.lang.String r10 = r9.f584a
            r2.put(r10, r9)
            int r0 = r0 + 1
            goto L_0x00b9
        L_0x00c8:
            r15.skipBytes(r0)
            goto L_0x0044
        L_0x00cd:
            byte r7 = r15.readByte()
            r0 = 0
        L_0x00d2:
            if (r0 >= r7) goto L_0x0044
            com.flurry.android.c r9 = new com.flurry.android.c
            r9.<init>(r15)
            byte r10 = r9.f548a
            java.lang.Byte r10 = java.lang.Byte.valueOf(r10)
            r3.put(r10, r9)
            int r0 = r0 + 1
            goto L_0x00d2
        L_0x00e5:
            byte r9 = r15.readByte()
            r0 = 0
            r7 = r0
        L_0x00eb:
            if (r7 >= r9) goto L_0x0044
            byte r0 = r15.readByte()
            java.lang.Byte r0 = java.lang.Byte.valueOf(r0)
            java.lang.Object r0 = r3.get(r0)
            com.flurry.android.c r0 = (com.flurry.android.C0305c) r0
            if (r0 == 0) goto L_0x0100
            r0.mo2400a((java.io.DataInput) r15)
        L_0x0100:
            int r0 = r7 + 1
            r7 = r0
            goto L_0x00eb
        L_0x0104:
            int r7 = r15.readInt()
            r0 = 0
        L_0x0109:
            if (r0 >= r7) goto L_0x0044
            long r9 = r15.readLong()
            short r11 = r15.readShort()
            java.lang.Short r11 = java.lang.Short.valueOf(r11)
            java.lang.Long r9 = java.lang.Long.valueOf(r9)
            r6.put(r11, r9)
            int r0 = r0 + 1
            goto L_0x0109
        L_0x0121:
            long r9 = r15.readLong()
            java.lang.Long r0 = java.lang.Long.valueOf(r9)
            java.lang.Object r0 = r5.get(r0)
            com.flurry.android.al r0 = (com.flurry.android.C0303al) r0
            if (r0 != 0) goto L_0x0136
            com.flurry.android.al r0 = new com.flurry.android.al
            r0.<init>()
        L_0x0136:
            java.lang.String r7 = r15.readUTF()
            r0.f516a = r7
            int r7 = r15.readInt()
            r0.f518c = r7
            java.lang.Long r7 = java.lang.Long.valueOf(r9)
            r5.put(r7, r0)
            goto L_0x0044
        L_0x014b:
            r15.skipBytes(r0)
            goto L_0x0044
        L_0x0150:
            r15.skipBytes(r0)
            goto L_0x0044
        */
        throw new UnsupportedOperationException("Method not decompiled: com.flurry.android.FlurryAgent.m477a(java.io.DataInputStream):void");
    }

    /* renamed from: c */
    private void m501c(boolean z) {
        try {
            C0299ah.m532a("FlurryAgent", "generating report");
            byte[] b = m495b(z);
            if (b == null) {
                C0299ah.m532a("FlurryAgent", "Error generating report");
            } else if (m486a(b)) {
                C0299ah.m532a("FlurryAgent", "Done sending " + (this.f462t ? "initial " : "") + "agent report");
                m513l();
            }
        } catch (IOException e) {
            C0299ah.m533a("FlurryAgent", "", e);
        } catch (Throwable th) {
            C0299ah.m538b("FlurryAgent", "", th);
        }
    }

    /* access modifiers changed from: private */
    /* JADX WARNING: Removed duplicated region for block: B:17:0x0065 A[Catch:{ Throwable -> 0x011d }] */
    /* JADX WARNING: Removed duplicated region for block: B:23:0x0078 A[Catch:{ Throwable -> 0x011d }] */
    /* JADX WARNING: Removed duplicated region for block: B:26:0x0086 A[Catch:{ Throwable -> 0x011d }] */
    /* JADX WARNING: Unknown top exception splitter block from list: {B:48:0x0110=Splitter:B:48:0x0110, B:20:0x0074=Splitter:B:20:0x0074, B:12:0x005e=Splitter:B:12:0x005e} */
    /* renamed from: a */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public synchronized void m470a(android.content.Context r9) {
        /*
            r8 = this;
            monitor-enter(r8)
            java.lang.String r0 = r8.m489b((android.content.Context) r9)     // Catch:{ all -> 0x010b }
            r8.f437D = r0     // Catch:{ all -> 0x010b }
            java.io.File r0 = r8.f461s     // Catch:{ all -> 0x010b }
            boolean r0 = r0.exists()     // Catch:{ all -> 0x010b }
            if (r0 == 0) goto L_0x0127
            java.lang.String r0 = "FlurryAgent"
            java.lang.StringBuilder r1 = new java.lang.StringBuilder     // Catch:{ all -> 0x010b }
            r1.<init>()     // Catch:{ all -> 0x010b }
            java.lang.String r2 = "loading persistent data: "
            java.lang.StringBuilder r1 = r1.append(r2)     // Catch:{ all -> 0x010b }
            java.io.File r2 = r8.f461s     // Catch:{ all -> 0x010b }
            java.lang.String r2 = r2.getAbsolutePath()     // Catch:{ all -> 0x010b }
            java.lang.StringBuilder r1 = r1.append(r2)     // Catch:{ all -> 0x010b }
            java.lang.String r1 = r1.toString()     // Catch:{ all -> 0x010b }
            com.flurry.android.C0299ah.m540c(r0, r1)     // Catch:{ all -> 0x010b }
            r2 = 0
            java.io.FileInputStream r0 = new java.io.FileInputStream     // Catch:{ Throwable -> 0x0132, all -> 0x010e }
            java.io.File r1 = r8.f461s     // Catch:{ Throwable -> 0x0132, all -> 0x010e }
            r0.<init>(r1)     // Catch:{ Throwable -> 0x0132, all -> 0x010e }
            java.io.DataInputStream r1 = new java.io.DataInputStream     // Catch:{ Throwable -> 0x0132, all -> 0x010e }
            r1.<init>(r0)     // Catch:{ Throwable -> 0x0132, all -> 0x010e }
            int r0 = r1.readUnsignedShort()     // Catch:{ Throwable -> 0x00fe }
            java.lang.String r2 = "FlurryAgent"
            java.lang.StringBuilder r3 = new java.lang.StringBuilder     // Catch:{ Throwable -> 0x00fe }
            r3.<init>()     // Catch:{ Throwable -> 0x00fe }
            java.lang.String r4 = "Magic: "
            java.lang.StringBuilder r3 = r3.append(r4)     // Catch:{ Throwable -> 0x00fe }
            java.lang.StringBuilder r3 = r3.append(r0)     // Catch:{ Throwable -> 0x00fe }
            java.lang.String r3 = r3.toString()     // Catch:{ Throwable -> 0x00fe }
            com.flurry.android.C0299ah.m540c(r2, r3)     // Catch:{ Throwable -> 0x00fe }
            r2 = 46586(0xb5fa, float:6.5281E-41)
            if (r0 != r2) goto L_0x00f5
            r8.m494b((java.io.DataInputStream) r1)     // Catch:{ Throwable -> 0x00fe }
        L_0x005e:
            com.flurry.android.C0320r.m561a((java.io.Closeable) r1)     // Catch:{ all -> 0x010b }
        L_0x0061:
            boolean r0 = r8.f463u     // Catch:{ Throwable -> 0x011d }
            if (r0 != 0) goto L_0x0074
            java.io.File r0 = r8.f461s     // Catch:{ Throwable -> 0x011d }
            boolean r0 = r0.delete()     // Catch:{ Throwable -> 0x011d }
            if (r0 == 0) goto L_0x0114
            java.lang.String r0 = "FlurryAgent"
            java.lang.String r1 = "Deleted persistence file"
            com.flurry.android.C0299ah.m532a(r0, r1)     // Catch:{ Throwable -> 0x011d }
        L_0x0074:
            boolean r0 = r8.f463u     // Catch:{ all -> 0x010b }
            if (r0 != 0) goto L_0x0082
            r0 = 0
            r8.f438E = r0     // Catch:{ all -> 0x010b }
            long r0 = r8.f441H     // Catch:{ all -> 0x010b }
            r8.f439F = r0     // Catch:{ all -> 0x010b }
            r0 = 1
            r8.f463u = r0     // Catch:{ all -> 0x010b }
        L_0x0082:
            java.lang.String r0 = r8.f437D     // Catch:{ all -> 0x010b }
            if (r0 != 0) goto L_0x00d5
            double r0 = java.lang.Math.random()     // Catch:{ all -> 0x010b }
            long r0 = java.lang.Double.doubleToLongBits(r0)     // Catch:{ all -> 0x010b }
            r2 = 37
            long r4 = java.lang.System.nanoTime()     // Catch:{ all -> 0x010b }
            java.lang.String r6 = r8.f466x     // Catch:{ all -> 0x010b }
            int r6 = r6.hashCode()     // Catch:{ all -> 0x010b }
            int r6 = r6 * 37
            long r6 = (long) r6     // Catch:{ all -> 0x010b }
            long r4 = r4 + r6
            long r2 = r2 * r4
            long r0 = r0 + r2
            java.lang.StringBuilder r2 = new java.lang.StringBuilder     // Catch:{ all -> 0x010b }
            r2.<init>()     // Catch:{ all -> 0x010b }
            java.lang.String r3 = "ID"
            java.lang.StringBuilder r2 = r2.append(r3)     // Catch:{ all -> 0x010b }
            r3 = 16
            java.lang.String r0 = java.lang.Long.toString(r0, r3)     // Catch:{ all -> 0x010b }
            java.lang.StringBuilder r0 = r2.append(r0)     // Catch:{ all -> 0x010b }
            java.lang.String r0 = r0.toString()     // Catch:{ all -> 0x010b }
            r8.f437D = r0     // Catch:{ all -> 0x010b }
            java.lang.String r0 = "FlurryAgent"
            java.lang.StringBuilder r1 = new java.lang.StringBuilder     // Catch:{ all -> 0x010b }
            r1.<init>()     // Catch:{ all -> 0x010b }
            java.lang.String r2 = "Generated phoneId: "
            java.lang.StringBuilder r1 = r1.append(r2)     // Catch:{ all -> 0x010b }
            java.lang.String r2 = r8.f437D     // Catch:{ all -> 0x010b }
            java.lang.StringBuilder r1 = r1.append(r2)     // Catch:{ all -> 0x010b }
            java.lang.String r1 = r1.toString()     // Catch:{ all -> 0x010b }
            com.flurry.android.C0299ah.m540c(r0, r1)     // Catch:{ all -> 0x010b }
        L_0x00d5:
            com.flurry.android.u r0 = r8.f458Y     // Catch:{ all -> 0x010b }
            java.lang.String r1 = r8.f437D     // Catch:{ all -> 0x010b }
            r0.mo2436a((java.lang.String) r1)     // Catch:{ all -> 0x010b }
            java.lang.String r0 = r8.f437D     // Catch:{ all -> 0x010b }
            java.lang.String r1 = "AND"
            boolean r0 = r0.startsWith(r1)     // Catch:{ all -> 0x010b }
            if (r0 != 0) goto L_0x00f3
            java.io.File r0 = r8.f460r     // Catch:{ all -> 0x010b }
            boolean r0 = r0.exists()     // Catch:{ all -> 0x010b }
            if (r0 != 0) goto L_0x00f3
            java.lang.String r0 = r8.f437D     // Catch:{ all -> 0x010b }
            r8.m498c(r9, r0)     // Catch:{ all -> 0x010b }
        L_0x00f3:
            monitor-exit(r8)
            return
        L_0x00f5:
            java.lang.String r0 = "FlurryAgent"
            java.lang.String r2 = "Unexpected file type"
            com.flurry.android.C0299ah.m532a(r0, r2)     // Catch:{ Throwable -> 0x00fe }
            goto L_0x005e
        L_0x00fe:
            r0 = move-exception
        L_0x00ff:
            java.lang.String r2 = "FlurryAgent"
            java.lang.String r3 = "Error when loading persistent file"
            com.flurry.android.C0299ah.m538b(r2, r3, r0)     // Catch:{ all -> 0x0130 }
            com.flurry.android.C0320r.m561a((java.io.Closeable) r1)     // Catch:{ all -> 0x010b }
            goto L_0x0061
        L_0x010b:
            r0 = move-exception
            monitor-exit(r8)
            throw r0
        L_0x010e:
            r0 = move-exception
            r1 = r2
        L_0x0110:
            com.flurry.android.C0320r.m561a((java.io.Closeable) r1)     // Catch:{ all -> 0x010b }
            throw r0     // Catch:{ all -> 0x010b }
        L_0x0114:
            java.lang.String r0 = "FlurryAgent"
            java.lang.String r1 = "Cannot delete persistence file"
            com.flurry.android.C0299ah.m537b(r0, r1)     // Catch:{ Throwable -> 0x011d }
            goto L_0x0074
        L_0x011d:
            r0 = move-exception
            java.lang.String r1 = "FlurryAgent"
            java.lang.String r2 = ""
            com.flurry.android.C0299ah.m538b(r1, r2, r0)     // Catch:{ all -> 0x010b }
            goto L_0x0074
        L_0x0127:
            java.lang.String r0 = "FlurryAgent"
            java.lang.String r1 = "Agent cache file doesn't exist."
            com.flurry.android.C0299ah.m540c(r0, r1)     // Catch:{ all -> 0x010b }
            goto L_0x0074
        L_0x0130:
            r0 = move-exception
            goto L_0x0110
        L_0x0132:
            r0 = move-exception
            r1 = r2
            goto L_0x00ff
        */
        throw new UnsupportedOperationException("Method not decompiled: com.flurry.android.FlurryAgent.m470a(android.content.Context):void");
    }

    /* renamed from: b */
    private synchronized void m494b(DataInputStream dataInputStream) {
        int i = 0;
        synchronized (this) {
            int readUnsignedShort = dataInputStream.readUnsignedShort();
            C0299ah.m532a("FlurryAgent", "File version: " + readUnsignedShort);
            if (readUnsignedShort > 2) {
                C0299ah.m537b("FlurryAgent", "Unknown agent file version: " + readUnsignedShort);
                throw new IOException("Unknown agent file version: " + readUnsignedShort);
            } else if (readUnsignedShort >= 2) {
                String readUTF = dataInputStream.readUTF();
                C0299ah.m532a("FlurryAgent", "Loading API key: " + this.f466x);
                if (readUTF.equals(this.f466x)) {
                    String readUTF2 = dataInputStream.readUTF();
                    if (this.f437D == null) {
                        C0299ah.m532a("FlurryAgent", "Loading phoneId: " + readUTF2);
                    }
                    this.f437D = readUTF2;
                    this.f438E = dataInputStream.readBoolean();
                    this.f439F = dataInputStream.readLong();
                    C0299ah.m532a("FlurryAgent", "Loading session reports");
                    while (true) {
                        int readUnsignedShort2 = dataInputStream.readUnsignedShort();
                        if (readUnsignedShort2 == 0) {
                            break;
                        }
                        byte[] bArr = new byte[readUnsignedShort2];
                        dataInputStream.readFully(bArr);
                        this.f440G.add(0, bArr);
                        i++;
                        C0299ah.m532a("FlurryAgent", "Session report added: " + i);
                    }
                    C0299ah.m532a("FlurryAgent", "Persistent file loaded");
                    this.f463u = true;
                } else {
                    C0299ah.m532a("FlurryAgent", "Api keys do not match, old: " + readUTF + ", new: " + this.f466x);
                }
            } else {
                C0299ah.m542d("FlurryAgent", "Deleting old file version: " + readUnsignedShort);
            }
        }
    }

    /* access modifiers changed from: private */
    /* renamed from: l */
    public synchronized void m513l() {
        DataOutputStream dataOutputStream;
        try {
            if (!m485a(this.f461s)) {
                C0320r.m561a((Closeable) null);
            } else {
                dataOutputStream = new DataOutputStream(new FileOutputStream(this.f461s));
                try {
                    dataOutputStream.writeShort(46586);
                    dataOutputStream.writeShort(2);
                    dataOutputStream.writeUTF(this.f466x);
                    dataOutputStream.writeUTF(this.f437D);
                    dataOutputStream.writeBoolean(this.f438E);
                    dataOutputStream.writeLong(this.f439F);
                    int size = this.f440G.size() - 1;
                    while (true) {
                        if (size < 0) {
                            break;
                        }
                        byte[] bArr = (byte[]) this.f440G.get(size);
                        int length = bArr.length;
                        if (length + 2 + dataOutputStream.size() > 50000) {
                            C0299ah.m532a("FlurryAgent", "discarded sessions: " + size);
                            break;
                        }
                        dataOutputStream.writeShort(length);
                        dataOutputStream.write(bArr);
                        size--;
                    }
                    dataOutputStream.writeShort(0);
                    C0320r.m561a((Closeable) dataOutputStream);
                } catch (Throwable th) {
                    th = th;
                    try {
                        C0299ah.m538b("FlurryAgent", "", th);
                        C0320r.m561a((Closeable) dataOutputStream);
                    } catch (Throwable th2) {
                        th = th2;
                        C0320r.m561a((Closeable) dataOutputStream);
                        throw th;
                    }
                }
            }
        } catch (Throwable th3) {
            th = th3;
            dataOutputStream = null;
            C0320r.m561a((Closeable) dataOutputStream);
            throw th;
        }
    }

    /* renamed from: a */
    private static boolean m485a(File file) {
        File parentFile = file.getParentFile();
        if (parentFile.mkdirs() || parentFile.exists()) {
            return true;
        }
        C0299ah.m537b("FlurryAgent", "Unable to create persistent dir: " + parentFile);
        return false;
    }

    /* renamed from: c */
    private synchronized void m498c(Context context, String str) {
        DataOutputStream dataOutputStream;
        this.f460r = context.getFileStreamPath(".flurryb.");
        if (m485a(this.f460r)) {
            try {
                dataOutputStream = new DataOutputStream(new FileOutputStream(this.f460r));
                try {
                    dataOutputStream.writeInt(1);
                    dataOutputStream.writeUTF(str);
                    C0320r.m561a((Closeable) dataOutputStream);
                } catch (Throwable th) {
                    th = th;
                    try {
                        C0299ah.m538b("FlurryAgent", "Error when saving b file", th);
                        C0320r.m561a((Closeable) dataOutputStream);
                    } catch (Throwable th2) {
                        th = th2;
                        C0320r.m561a((Closeable) dataOutputStream);
                        throw th;
                    }
                }
            } catch (Throwable th3) {
                th = th3;
                dataOutputStream = null;
                C0320r.m561a((Closeable) dataOutputStream);
                throw th;
            }
        }
    }

    /* renamed from: b */
    private String m489b(Context context) {
        DataInputStream dataInputStream;
        Throwable th;
        boolean z = false;
        if (this.f437D != null) {
            return this.f437D;
        }
        String string = Settings.System.getString(context.getContentResolver(), TapjoyConstants.TJC_ANDROID_ID);
        if (string != null && string.length() > 0 && !string.equals("null")) {
            String[] strArr = f419b;
            int length = strArr.length;
            int i = 0;
            while (true) {
                if (i < length) {
                    if (string.equals(strArr[i])) {
                        break;
                    }
                    i++;
                } else {
                    z = true;
                    break;
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
            try {
                dataInputStream.readInt();
                String readUTF = dataInputStream.readUTF();
                C0320r.m561a((Closeable) dataInputStream);
                return readUTF;
            } catch (Throwable th2) {
                th = th2;
                try {
                    C0299ah.m538b("FlurryAgent", "Error when loading b file", th);
                    C0320r.m561a((Closeable) dataInputStream);
                    return null;
                } catch (Throwable th3) {
                    th = th3;
                    C0320r.m561a((Closeable) dataInputStream);
                    throw th;
                }
            }
        } catch (Throwable th4) {
            dataInputStream = null;
            th = th4;
            C0320r.m561a((Closeable) dataInputStream);
            throw th;
        }
    }

    /* renamed from: c */
    private static String m497c(Context context) {
        try {
            PackageInfo packageInfo = context.getPackageManager().getPackageInfo(context.getPackageName(), 0);
            if (packageInfo.versionName != null) {
                return packageInfo.versionName;
            }
            if (packageInfo.versionCode != 0) {
                return Integer.toString(packageInfo.versionCode);
            }
            return "Unknown";
        } catch (Throwable th) {
            C0299ah.m538b("FlurryAgent", "", th);
        }
    }

    /* renamed from: d */
    private Location m502d(Context context) {
        if (context.checkCallingOrSelfPermission("android.permission.ACCESS_FINE_LOCATION") == 0 || context.checkCallingOrSelfPermission("android.permission.ACCESS_COARSE_LOCATION") == 0) {
            LocationManager locationManager = (LocationManager) context.getSystemService("location");
            synchronized (this) {
                if (this.f436C == null) {
                    this.f436C = locationManager;
                } else {
                    locationManager = this.f436C;
                }
            }
            Criteria criteria = f431n;
            if (criteria == null) {
                criteria = new Criteria();
            }
            String bestProvider = locationManager.getBestProvider(criteria, true);
            if (bestProvider != null) {
                locationManager.requestLocationUpdates(bestProvider, 0, BitmapDescriptorFactory.HUE_RED, this, Looper.getMainLooper());
                return locationManager.getLastKnownLocation(bestProvider);
            }
        }
        return null;
    }

    /* renamed from: m */
    private synchronized void m514m() {
        if (this.f436C != null) {
            this.f436C.removeUpdates(this);
        }
    }

    /* renamed from: e */
    static String m506e() {
        return f425h.f466x;
    }

    /* renamed from: n */
    private synchronized String m515n() {
        return this.f437D;
    }

    public static String getPhoneId() {
        return f425h.m515n();
    }

    public final synchronized void onLocationChanged(Location location) {
        try {
            this.f451R = location;
            m514m();
        } catch (Throwable th) {
            C0299ah.m538b("FlurryAgent", "", th);
        }
        return;
    }

    public final void onProviderDisabled(String str) {
    }

    public final void onProviderEnabled(String str) {
    }

    public final void onStatusChanged(String str, int i, Bundle bundle) {
    }

    /* renamed from: a */
    private HttpClient m469a(HttpParams httpParams) {
        try {
            KeyStore instance = KeyStore.getInstance(KeyStore.getDefaultType());
            instance.load((InputStream) null, (char[]) null);
            C0300ai aiVar = new C0300ai(this, instance);
            SchemeRegistry schemeRegistry = new SchemeRegistry();
            schemeRegistry.register(new Scheme("http", PlainSocketFactory.getSocketFactory(), 80));
            schemeRegistry.register(new Scheme("https", aiVar, 443));
            return new DefaultHttpClient(new ThreadSafeClientConnManager(httpParams, schemeRegistry), httpParams);
        } catch (Exception e) {
            return new DefaultHttpClient(httpParams);
        }
    }
}
