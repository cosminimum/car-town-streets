package com.google.android.gms.internal;

import android.content.Context;
import android.location.Location;
import com.google.android.gms.ads.mediation.NetworkExtras;
import com.google.android.gms.ads.search.SearchAdRequest;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

/* renamed from: com.google.android.gms.internal.af */
public final class C0864af {
    public static final String DEVICE_ID_EMULATOR = C1003cs.m2210q("emulator");

    /* renamed from: d */
    private final Date f1910d;

    /* renamed from: eL */
    private final int f1911eL;

    /* renamed from: eM */
    private final Location f1912eM;

    /* renamed from: eN */
    private final boolean f1913eN;

    /* renamed from: eO */
    private final Map<Class<? extends NetworkExtras>, NetworkExtras> f1914eO;

    /* renamed from: eP */
    private final String f1915eP;

    /* renamed from: eQ */
    private final SearchAdRequest f1916eQ;

    /* renamed from: eR */
    private final int f1917eR;

    /* renamed from: eS */
    private final Set<String> f1918eS;

    /* renamed from: f */
    private final Set<String> f1919f;

    /* renamed from: com.google.android.gms.internal.af$a */
    public static final class C0865a {
        /* access modifiers changed from: private */

        /* renamed from: d */
        public Date f1920d;
        /* access modifiers changed from: private */

        /* renamed from: eL */
        public int f1921eL = -1;
        /* access modifiers changed from: private */

        /* renamed from: eM */
        public Location f1922eM;
        /* access modifiers changed from: private */

        /* renamed from: eN */
        public boolean f1923eN = false;
        /* access modifiers changed from: private */

        /* renamed from: eP */
        public String f1924eP;
        /* access modifiers changed from: private */

        /* renamed from: eR */
        public int f1925eR = -1;
        /* access modifiers changed from: private */

        /* renamed from: eT */
        public final HashSet<String> f1926eT = new HashSet<>();
        /* access modifiers changed from: private */

        /* renamed from: eU */
        public final HashMap<Class<? extends NetworkExtras>, NetworkExtras> f1927eU = new HashMap<>();
        /* access modifiers changed from: private */

        /* renamed from: eV */
        public final HashSet<String> f1928eV = new HashSet<>();

        /* renamed from: a */
        public void mo7029a(Location location) {
            this.f1922eM = location;
        }

        /* renamed from: a */
        public void mo7030a(NetworkExtras networkExtras) {
            this.f1927eU.put(networkExtras.getClass(), networkExtras);
        }

        /* renamed from: a */
        public void mo7031a(Date date) {
            this.f1920d = date;
        }

        /* renamed from: d */
        public void mo7032d(int i) {
            this.f1921eL = i;
        }

        /* renamed from: d */
        public void mo7033d(boolean z) {
            this.f1923eN = z;
        }

        /* renamed from: e */
        public void mo7034e(boolean z) {
            this.f1925eR = z ? 1 : 0;
        }

        /* renamed from: g */
        public void mo7035g(String str) {
            this.f1926eT.add(str);
        }

        /* renamed from: h */
        public void mo7036h(String str) {
            this.f1928eV.add(str);
        }

        /* renamed from: i */
        public void mo7037i(String str) {
            this.f1924eP = str;
        }
    }

    public C0864af(C0865a aVar) {
        this(aVar, (SearchAdRequest) null);
    }

    public C0864af(C0865a aVar, SearchAdRequest searchAdRequest) {
        this.f1910d = aVar.f1920d;
        this.f1911eL = aVar.f1921eL;
        this.f1919f = Collections.unmodifiableSet(aVar.f1926eT);
        this.f1912eM = aVar.f1922eM;
        this.f1913eN = aVar.f1923eN;
        this.f1914eO = Collections.unmodifiableMap(aVar.f1927eU);
        this.f1915eP = aVar.f1924eP;
        this.f1916eQ = searchAdRequest;
        this.f1917eR = aVar.f1925eR;
        this.f1918eS = Collections.unmodifiableSet(aVar.f1928eV);
    }

    /* renamed from: Q */
    public SearchAdRequest mo7018Q() {
        return this.f1916eQ;
    }

    /* renamed from: R */
    public Map<Class<? extends NetworkExtras>, NetworkExtras> mo7019R() {
        return this.f1914eO;
    }

    /* renamed from: S */
    public int mo7020S() {
        return this.f1917eR;
    }

    public Date getBirthday() {
        return this.f1910d;
    }

    public int getGender() {
        return this.f1911eL;
    }

    public Set<String> getKeywords() {
        return this.f1919f;
    }

    public Location getLocation() {
        return this.f1912eM;
    }

    public boolean getManualImpressionsEnabled() {
        return this.f1913eN;
    }

    public <T extends NetworkExtras> T getNetworkExtras(Class<T> networkExtrasClass) {
        return (NetworkExtras) this.f1914eO.get(networkExtrasClass);
    }

    public String getPublisherProvidedId() {
        return this.f1915eP;
    }

    public boolean isTestDevice(Context context) {
        return this.f1918eS.contains(C1003cs.m2209l(context));
    }
}
