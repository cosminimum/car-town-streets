package com.google.android.gms.internal;

import android.content.Context;
import android.os.Bundle;
import android.os.Handler;
import android.os.IBinder;
import android.os.Looper;
import android.os.RemoteException;
import android.text.TextUtils;
import com.google.android.gms.cast.ApplicationMetadata;
import com.google.android.gms.cast.Cast;
import com.google.android.gms.cast.CastDevice;
import com.google.android.gms.common.GooglePlayServicesUtil;
import com.google.android.gms.common.api.C0655a;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.internal.C1047di;
import com.google.android.gms.internal.C1050dj;
import com.google.android.gms.internal.C1071dw;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.atomic.AtomicLong;

/* renamed from: com.google.android.gms.internal.dg */
public final class C1040dg extends C1071dw<C1047di> {
    /* access modifiers changed from: private */

    /* renamed from: lA */
    public static final C1052dk f2475lA = new C1052dk("CastClientImpl");
    /* access modifiers changed from: private */

    /* renamed from: lQ */
    public static final Object f2476lQ = new Object();
    /* access modifiers changed from: private */

    /* renamed from: lR */
    public static final Object f2477lR = new Object();
    /* access modifiers changed from: private */

    /* renamed from: kw */
    public final Cast.Listener f2478kw;
    /* access modifiers changed from: private */

    /* renamed from: lB */
    public ApplicationMetadata f2479lB = null;
    /* access modifiers changed from: private */

    /* renamed from: lC */
    public final CastDevice f2480lC;

    /* renamed from: lD */
    private final C1050dj f2481lD = new C1050dj.C1051a() {
        /* renamed from: b */
        private void m2357b(long j, int i) {
            C0655a.C0659c cVar;
            synchronized (C1040dg.this.f2491lN) {
                cVar = (C0655a.C0659c) C1040dg.this.f2491lN.remove(Long.valueOf(j));
            }
            if (cVar != null) {
                cVar.mo5612a(new Status(i));
            }
        }

        /* renamed from: x */
        private boolean m2358x(int i) {
            synchronized (C1040dg.f2477lR) {
                if (C1040dg.this.f2493lP == null) {
                    return false;
                }
                C1040dg.this.f2493lP.mo5612a(new Status(i));
                C0655a.C0659c unused = C1040dg.this.f2493lP = null;
                return true;
            }
        }

        /* renamed from: a */
        public void mo7349a(ApplicationMetadata applicationMetadata, String str, String str2, boolean z) {
            String unused = C1040dg.this.f2488lK = applicationMetadata.getApplicationId();
            String unused2 = C1040dg.this.f2489lL = str2;
            synchronized (C1040dg.f2476lQ) {
                if (C1040dg.this.f2492lO != null) {
                    C1040dg.this.f2492lO.mo5612a(new C1045a(new Status(0), applicationMetadata, str, str2, z));
                    C0655a.C0659c unused3 = C1040dg.this.f2492lO = null;
                }
            }
        }

        /* renamed from: a */
        public void mo7350a(String str, long j) {
            m2357b(j, 0);
        }

        /* renamed from: a */
        public void mo7351a(String str, long j, int i) {
            m2357b(j, i);
        }

        /* renamed from: a */
        public void mo7352a(final String str, final String str2) {
            C1040dg.f2475lA.mo7380b("Receive (type=text, ns=%s) %s", str, str2);
            C1040dg.this.mHandler.post(new Runnable() {
                public void run() {
                    Cast.MessageReceivedCallback messageReceivedCallback;
                    synchronized (C1040dg.this.f2482lE) {
                        messageReceivedCallback = (Cast.MessageReceivedCallback) C1040dg.this.f2482lE.get(str);
                    }
                    if (messageReceivedCallback != null) {
                        messageReceivedCallback.onMessageReceived(C1040dg.this.f2480lC, str, str2);
                        return;
                    }
                    C1040dg.f2475lA.mo7380b("Discarded message for unknown namespace '%s'", str);
                }
            });
        }

        /* renamed from: b */
        public void mo7353b(String str, double d, boolean z) {
            final String str2 = str;
            final double d2 = d;
            final boolean z2 = z;
            C1040dg.this.mHandler.post(new Runnable() {
                public void run() {
                    C1040dg.this.m2322a(str2, d2, z2);
                }
            });
        }

        /* renamed from: b */
        public void mo7354b(String str, byte[] bArr) {
            C1040dg.f2475lA.mo7380b("IGNORING: Receive (type=binary, ns=%s) <%d bytes>", str, Integer.valueOf(bArr.length));
        }

        public void onApplicationDisconnected(final int statusCode) {
            String unused = C1040dg.this.f2488lK = null;
            String unused2 = C1040dg.this.f2489lL = null;
            if (!m2358x(statusCode) && C1040dg.this.f2478kw != null) {
                C1040dg.this.mHandler.post(new Runnable() {
                    public void run() {
                        if (C1040dg.this.f2478kw != null) {
                            C1040dg.this.f2478kw.onApplicationDisconnected(statusCode);
                        }
                    }
                });
            }
        }

        /* renamed from: t */
        public void mo7356t(int i) {
            C1040dg.f2475lA.mo7380b("ICastDeviceControllerListener.onDisconnected", new Object[0]);
            boolean unused = C1040dg.this.f2486lI = false;
            ApplicationMetadata unused2 = C1040dg.this.f2479lB = null;
            if (i != 0) {
                C1040dg.this.mo7450I(2);
            }
        }

        /* renamed from: u */
        public void mo7357u(int i) {
            synchronized (C1040dg.f2476lQ) {
                if (C1040dg.this.f2492lO != null) {
                    C1040dg.this.f2492lO.mo5612a(new C1045a(new Status(i)));
                    C0655a.C0659c unused = C1040dg.this.f2492lO = null;
                }
            }
        }

        /* renamed from: v */
        public void mo7358v(int i) {
            m2358x(i);
        }

        /* renamed from: w */
        public void mo7359w(int i) {
            m2358x(i);
        }
    };
    /* access modifiers changed from: private */

    /* renamed from: lE */
    public final Map<String, Cast.MessageReceivedCallback> f2482lE = new HashMap();

    /* renamed from: lF */
    private final long f2483lF;

    /* renamed from: lG */
    private String f2484lG = null;

    /* renamed from: lH */
    private boolean f2485lH;
    /* access modifiers changed from: private */

    /* renamed from: lI */
    public boolean f2486lI = false;

    /* renamed from: lJ */
    private final AtomicLong f2487lJ = new AtomicLong(0);
    /* access modifiers changed from: private */

    /* renamed from: lK */
    public String f2488lK;
    /* access modifiers changed from: private */

    /* renamed from: lL */
    public String f2489lL;

    /* renamed from: lM */
    private Bundle f2490lM;
    /* access modifiers changed from: private */

    /* renamed from: lN */
    public Map<Long, C0655a.C0659c<Status>> f2491lN = new HashMap();
    /* access modifiers changed from: private */

    /* renamed from: lO */
    public C0655a.C0659c<Cast.ApplicationConnectionResult> f2492lO;
    /* access modifiers changed from: private */

    /* renamed from: lP */
    public C0655a.C0659c<Status> f2493lP;

    /* renamed from: lb */
    private double f2494lb = 0.0d;

    /* renamed from: lc */
    private boolean f2495lc = false;
    /* access modifiers changed from: private */
    public final Handler mHandler = new Handler(Looper.getMainLooper());

    /* renamed from: com.google.android.gms.internal.dg$a */
    private static final class C1045a implements Cast.ApplicationConnectionResult {

        /* renamed from: jY */
        private final Status f2506jY;

        /* renamed from: lX */
        private final ApplicationMetadata f2507lX;

        /* renamed from: lY */
        private final String f2508lY;

        /* renamed from: lZ */
        private final String f2509lZ;

        /* renamed from: ma */
        private final boolean f2510ma;

        public C1045a(Status status) {
            this(status, (ApplicationMetadata) null, (String) null, (String) null, false);
        }

        public C1045a(Status status, ApplicationMetadata applicationMetadata, String str, String str2, boolean z) {
            this.f2506jY = status;
            this.f2507lX = applicationMetadata;
            this.f2508lY = str;
            this.f2509lZ = str2;
            this.f2510ma = z;
        }

        public ApplicationMetadata getApplicationMetadata() {
            return this.f2507lX;
        }

        public String getApplicationStatus() {
            return this.f2508lY;
        }

        public String getSessionId() {
            return this.f2509lZ;
        }

        public Status getStatus() {
            return this.f2506jY;
        }

        public boolean getWasLaunched() {
            return this.f2510ma;
        }
    }

    public C1040dg(Context context, CastDevice castDevice, long j, Cast.Listener listener, GoogleApiClient.ConnectionCallbacks connectionCallbacks, GoogleApiClient.OnConnectionFailedListener onConnectionFailedListener) {
        super(context, connectionCallbacks, onConnectionFailedListener, (String[]) null);
        this.f2480lC = castDevice;
        this.f2478kw = listener;
        this.f2483lF = j;
    }

    /* access modifiers changed from: private */
    /* renamed from: a */
    public void m2322a(String str, double d, boolean z) {
        boolean z2;
        boolean z3;
        if (!C1046dh.m2369a(str, this.f2484lG)) {
            this.f2484lG = str;
            z2 = true;
        } else {
            z2 = false;
        }
        if (this.f2478kw != null && (z2 || this.f2485lH)) {
            this.f2478kw.onApplicationStatusChanged();
        }
        if (d != this.f2494lb) {
            this.f2494lb = d;
            z3 = true;
        } else {
            z3 = false;
        }
        if (z != this.f2495lc) {
            this.f2495lc = z;
            z3 = true;
        }
        f2475lA.mo7380b("hasChange=%b, mFirstStatusUpdate=%b", Boolean.valueOf(z3), Boolean.valueOf(this.f2485lH));
        if (this.f2478kw != null && (z3 || this.f2485lH)) {
            this.f2478kw.onVolumeChanged();
        }
        this.f2485lH = false;
    }

    /* renamed from: aX */
    private void m2324aX() throws IllegalStateException {
        if (!this.f2486lI) {
            throw new IllegalStateException("not connected to a device");
        }
    }

    /* renamed from: d */
    private void m2333d(C0655a.C0659c<Cast.ApplicationConnectionResult> cVar) {
        synchronized (f2476lQ) {
            if (this.f2492lO != null) {
                this.f2492lO.mo5612a(new C1045a(new Status(2002)));
            }
            this.f2492lO = cVar;
        }
    }

    /* renamed from: f */
    private void m2336f(C0655a.C0659c<Status> cVar) {
        synchronized (f2477lR) {
            if (this.f2493lP != null) {
                cVar.mo5612a(new Status(2001));
            } else {
                this.f2493lP = cVar;
            }
        }
    }

    /* renamed from: C */
    public void mo7334C(String str) throws IllegalArgumentException, IllegalStateException, RemoteException {
        Cast.MessageReceivedCallback remove;
        if (TextUtils.isEmpty(str)) {
            throw new IllegalArgumentException("Channel namespace cannot be null or empty");
        }
        synchronized (this.f2482lE) {
            remove = this.f2482lE.remove(str);
        }
        if (remove != null) {
            ((C1047di) mo7454bQ()).mo7365F(str);
        }
    }

    /* renamed from: a */
    public void mo7335a(double d) throws IllegalArgumentException, IllegalStateException, RemoteException {
        if (Double.isInfinite(d) || Double.isNaN(d)) {
            throw new IllegalArgumentException("Volume cannot be " + d);
        }
        ((C1047di) mo7454bQ()).mo7366a(d, this.f2494lb, this.f2495lc);
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public void mo6201a(int i, IBinder iBinder, Bundle bundle) {
        if (i == 0 || i == 1001) {
            this.f2486lI = true;
            this.f2485lH = true;
        } else {
            this.f2486lI = false;
        }
        if (i == 1001) {
            this.f2490lM = new Bundle();
            this.f2490lM.putBoolean(Cast.EXTRA_APP_NO_LONGER_RUNNING, true);
            i = 0;
        }
        super.mo6201a(i, iBinder, bundle);
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public void mo6202a(C1092ec ecVar, C1071dw.C1076e eVar) throws RemoteException {
        Bundle bundle = new Bundle();
        f2475lA.mo7380b("getServiceFromBroker(): mLastApplicationId=%s, mLastSessionId=%s", this.f2488lK, this.f2489lL);
        this.f2480lC.putInBundle(bundle);
        bundle.putLong("com.google.android.gms.cast.EXTRA_CAST_FLAGS", this.f2483lF);
        if (this.f2488lK != null) {
            bundle.putString("last_application_id", this.f2488lK);
            if (this.f2489lL != null) {
                bundle.putString("last_session_id", this.f2489lL);
            }
        }
        ecVar.mo7512a((C1089eb) eVar, (int) GooglePlayServicesUtil.GOOGLE_PLAY_SERVICES_VERSION_CODE, getContext().getPackageName(), this.f2481lD.asBinder(), bundle);
    }

    /* renamed from: a */
    public void mo7336a(String str, Cast.MessageReceivedCallback messageReceivedCallback) throws IllegalArgumentException, IllegalStateException, RemoteException {
        if (TextUtils.isEmpty(str)) {
            throw new IllegalArgumentException("Channel namespace cannot be null or empty");
        }
        mo7334C(str);
        if (messageReceivedCallback != null) {
            synchronized (this.f2482lE) {
                this.f2482lE.put(str, messageReceivedCallback);
            }
            ((C1047di) mo7454bQ()).mo7364E(str);
        }
    }

    /* renamed from: a */
    public void mo7337a(String str, C0655a.C0659c<Status> cVar) throws IllegalStateException, RemoteException {
        m2336f(cVar);
        ((C1047di) mo7454bQ()).mo7363D(str);
    }

    /* renamed from: a */
    public void mo7338a(String str, String str2, C0655a.C0659c<Status> cVar) throws IllegalArgumentException, IllegalStateException, RemoteException {
        if (TextUtils.isEmpty(str2)) {
            throw new IllegalArgumentException("The message payload cannot be null or empty");
        } else if (str == null || str.length() > 128) {
            throw new IllegalArgumentException("Invalid namespace length");
        } else if (str2.length() > 65536) {
            throw new IllegalArgumentException("Message exceeds maximum size");
        } else {
            m2324aX();
            long incrementAndGet = this.f2487lJ.incrementAndGet();
            ((C1047di) mo7454bQ()).mo7367a(str, str2, incrementAndGet);
            this.f2491lN.put(Long.valueOf(incrementAndGet), cVar);
        }
    }

    /* renamed from: a */
    public void mo7339a(String str, boolean z, C0655a.C0659c<Cast.ApplicationConnectionResult> cVar) throws IllegalStateException, RemoteException {
        m2333d(cVar);
        ((C1047di) mo7454bQ()).mo7373c(str, z);
    }

    /* renamed from: aU */
    public Bundle mo5883aU() {
        if (this.f2490lM == null) {
            return super.mo5883aU();
        }
        Bundle bundle = this.f2490lM;
        this.f2490lM = null;
        return bundle;
    }

    /* renamed from: aV */
    public void mo7340aV() throws IllegalStateException, RemoteException {
        ((C1047di) mo7454bQ()).mo7370aV();
    }

    /* renamed from: aW */
    public double mo7341aW() throws IllegalStateException {
        m2324aX();
        return this.f2494lb;
    }

    /* access modifiers changed from: protected */
    /* renamed from: am */
    public String mo6203am() {
        return "com.google.android.gms.cast.service.BIND_CAST_DEVICE_CONTROLLER_SERVICE";
    }

    /* access modifiers changed from: protected */
    /* renamed from: an */
    public String mo6204an() {
        return "com.google.android.gms.cast.internal.ICastDeviceController";
    }

    /* renamed from: b */
    public void mo7342b(String str, String str2, C0655a.C0659c<Cast.ApplicationConnectionResult> cVar) throws IllegalStateException, RemoteException {
        m2333d(cVar);
        ((C1047di) mo7454bQ()).mo7371b(str, str2);
    }

    public void disconnect() {
        try {
            if (isConnected()) {
                synchronized (this.f2482lE) {
                    this.f2482lE.clear();
                }
                ((C1047di) mo7454bQ()).disconnect();
            }
        } catch (RemoteException e) {
            try {
                f2475lA.mo7380b("Error while disconnecting the controller interface: %s", e.getMessage());
            } catch (Throwable th) {
                super.disconnect();
                throw th;
            }
        }
        super.disconnect();
    }

    /* renamed from: e */
    public void mo7343e(C0655a.C0659c<Status> cVar) throws IllegalStateException, RemoteException {
        m2336f(cVar);
        ((C1047di) mo7454bQ()).mo7372bb();
    }

    public ApplicationMetadata getApplicationMetadata() throws IllegalStateException {
        m2324aX();
        return this.f2479lB;
    }

    public String getApplicationStatus() throws IllegalStateException {
        m2324aX();
        return this.f2484lG;
    }

    public boolean isMute() throws IllegalStateException {
        m2324aX();
        return this.f2495lc;
    }

    /* renamed from: n */
    public void mo7347n(boolean z) throws IllegalStateException, RemoteException {
        ((C1047di) mo7454bQ()).mo7369a(z, this.f2494lb, this.f2495lc);
    }

    /* access modifiers changed from: protected */
    /* renamed from: u */
    public C1047di mo6207p(IBinder iBinder) {
        return C1047di.C1048a.m2383v(iBinder);
    }
}
