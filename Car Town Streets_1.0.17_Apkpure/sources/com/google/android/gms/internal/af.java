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
/* loaded from: classes.dex */
public final class af {
    public static final String DEVICE_ID_EMULATOR = cs.q("emulator");
    private final Date d;
    private final int eL;
    private final Location eM;
    private final boolean eN;
    private final Map<Class<? extends NetworkExtras>, NetworkExtras> eO;
    private final String eP;
    private final SearchAdRequest eQ;
    private final int eR;
    private final Set<String> eS;
    private final Set<String> f;

    /* loaded from: classes.dex */
    public static final class a {
        private Date d;
        private Location eM;
        private String eP;
        private final HashSet<String> eT = new HashSet<>();
        private final HashMap<Class<? extends NetworkExtras>, NetworkExtras> eU = new HashMap<>();
        private final HashSet<String> eV = new HashSet<>();
        private int eL = -1;
        private boolean eN = false;
        private int eR = -1;

        public void a(Location location) {
            this.eM = location;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public void a(NetworkExtras networkExtras) {
            this.eU.put(networkExtras.getClass(), networkExtras);
        }

        public void a(Date date) {
            this.d = date;
        }

        public void d(int i) {
            this.eL = i;
        }

        public void d(boolean z) {
            this.eN = z;
        }

        public void e(boolean z) {
            this.eR = z ? 1 : 0;
        }

        public void g(String str) {
            this.eT.add(str);
        }

        public void h(String str) {
            this.eV.add(str);
        }

        public void i(String str) {
            this.eP = str;
        }
    }

    public af(a aVar) {
        this(aVar, null);
    }

    public af(a aVar, SearchAdRequest searchAdRequest) {
        this.d = aVar.d;
        this.eL = aVar.eL;
        this.f = Collections.unmodifiableSet(aVar.eT);
        this.eM = aVar.eM;
        this.eN = aVar.eN;
        this.eO = Collections.unmodifiableMap(aVar.eU);
        this.eP = aVar.eP;
        this.eQ = searchAdRequest;
        this.eR = aVar.eR;
        this.eS = Collections.unmodifiableSet(aVar.eV);
    }

    public SearchAdRequest Q() {
        return this.eQ;
    }

    public Map<Class<? extends NetworkExtras>, NetworkExtras> R() {
        return this.eO;
    }

    public int S() {
        return this.eR;
    }

    public Date getBirthday() {
        return this.d;
    }

    public int getGender() {
        return this.eL;
    }

    public Set<String> getKeywords() {
        return this.f;
    }

    public Location getLocation() {
        return this.eM;
    }

    public boolean getManualImpressionsEnabled() {
        return this.eN;
    }

    public <T extends NetworkExtras> T getNetworkExtras(Class<T> networkExtrasClass) {
        return (T) this.eO.get(networkExtrasClass);
    }

    public String getPublisherProvidedId() {
        return this.eP;
    }

    public boolean isTestDevice(Context context) {
        return this.eS.contains(cs.l(context));
    }
}
