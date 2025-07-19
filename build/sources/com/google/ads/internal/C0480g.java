package com.google.ads.internal;

import android.os.SystemClock;
import com.google.ads.C0453g;
import com.google.ads.util.C0508b;
import java.util.Iterator;
import java.util.LinkedList;

/* renamed from: com.google.ads.internal.g */
public class C0480g {

    /* renamed from: f */
    private static long f929f = 0;

    /* renamed from: g */
    private static long f930g = 0;

    /* renamed from: h */
    private static long f931h = 0;

    /* renamed from: i */
    private static long f932i = 0;

    /* renamed from: j */
    private static long f933j = -1;

    /* renamed from: a */
    private final LinkedList<Long> f934a = new LinkedList<>();

    /* renamed from: b */
    private long f935b;

    /* renamed from: c */
    private long f936c;

    /* renamed from: d */
    private long f937d;

    /* renamed from: e */
    private final LinkedList<Long> f938e = new LinkedList<>();

    /* renamed from: k */
    private boolean f939k = false;

    /* renamed from: l */
    private boolean f940l = false;

    /* renamed from: m */
    private String f941m;

    /* renamed from: n */
    private long f942n;

    /* renamed from: o */
    private final LinkedList<Long> f943o = new LinkedList<>();

    /* renamed from: p */
    private final LinkedList<C0453g.C0454a> f944p = new LinkedList<>();

    public C0480g() {
        mo3739a();
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public synchronized void mo3739a() {
        this.f934a.clear();
        this.f935b = 0;
        this.f936c = 0;
        this.f937d = 0;
        this.f938e.clear();
        this.f942n = -1;
        this.f943o.clear();
        this.f944p.clear();
        this.f939k = false;
        this.f940l = false;
    }

    /* renamed from: b */
    public synchronized void mo3742b() {
        this.f943o.clear();
        this.f944p.clear();
    }

    /* renamed from: c */
    public synchronized void mo3743c() {
        this.f942n = SystemClock.elapsedRealtime();
    }

    /* renamed from: a */
    public synchronized void mo3740a(C0453g.C0454a aVar) {
        this.f943o.add(Long.valueOf(SystemClock.elapsedRealtime() - this.f942n));
        this.f944p.add(aVar);
    }

    /* renamed from: d */
    public synchronized String mo3744d() {
        StringBuilder sb;
        sb = new StringBuilder();
        Iterator it = this.f943o.iterator();
        while (it.hasNext()) {
            long longValue = ((Long) it.next()).longValue();
            if (sb.length() > 0) {
                sb.append(",");
            }
            sb.append(longValue);
        }
        return sb.toString();
    }

    /* renamed from: e */
    public synchronized String mo3745e() {
        StringBuilder sb;
        sb = new StringBuilder();
        Iterator it = this.f944p.iterator();
        while (it.hasNext()) {
            C0453g.C0454a aVar = (C0453g.C0454a) it.next();
            if (sb.length() > 0) {
                sb.append(",");
            }
            sb.append(aVar.ordinal());
        }
        return sb.toString();
    }

    /* access modifiers changed from: protected */
    /* renamed from: f */
    public void mo3746f() {
        C0508b.m1034d("Ad clicked.");
        this.f934a.add(Long.valueOf(SystemClock.elapsedRealtime()));
    }

    /* access modifiers changed from: protected */
    /* renamed from: g */
    public void mo3747g() {
        C0508b.m1034d("Ad request loaded.");
        this.f935b = SystemClock.elapsedRealtime();
    }

    /* access modifiers changed from: protected */
    /* renamed from: h */
    public synchronized void mo3748h() {
        C0508b.m1034d("Ad request before rendering.");
        this.f936c = SystemClock.elapsedRealtime();
    }

    /* access modifiers changed from: protected */
    /* renamed from: i */
    public void mo3749i() {
        C0508b.m1034d("Ad request started.");
        this.f937d = SystemClock.elapsedRealtime();
        f929f++;
    }

    /* access modifiers changed from: protected */
    /* renamed from: j */
    public long mo3750j() {
        if (this.f934a.size() != this.f938e.size()) {
            return -1;
        }
        return (long) this.f934a.size();
    }

    /* access modifiers changed from: protected */
    /* renamed from: k */
    public String mo3751k() {
        if (this.f934a.isEmpty() || this.f934a.size() != this.f938e.size()) {
            return null;
        }
        StringBuilder sb = new StringBuilder();
        int i = 0;
        while (true) {
            int i2 = i;
            if (i2 >= this.f934a.size()) {
                return sb.toString();
            }
            if (i2 != 0) {
                sb.append(",");
            }
            sb.append(Long.toString(this.f938e.get(i2).longValue() - this.f934a.get(i2).longValue()));
            i = i2 + 1;
        }
    }

    /* access modifiers changed from: protected */
    /* renamed from: l */
    public String mo3752l() {
        if (this.f934a.isEmpty()) {
            return null;
        }
        StringBuilder sb = new StringBuilder();
        int i = 0;
        while (true) {
            int i2 = i;
            if (i2 >= this.f934a.size()) {
                return sb.toString();
            }
            if (i2 != 0) {
                sb.append(",");
            }
            sb.append(Long.toString(this.f934a.get(i2).longValue() - this.f935b));
            i = i2 + 1;
        }
    }

    /* access modifiers changed from: protected */
    /* renamed from: m */
    public long mo3753m() {
        return this.f935b - this.f937d;
    }

    /* access modifiers changed from: protected */
    /* renamed from: n */
    public synchronized long mo3754n() {
        return this.f936c - this.f937d;
    }

    /* access modifiers changed from: protected */
    /* renamed from: o */
    public long mo3755o() {
        return f929f;
    }

    /* access modifiers changed from: protected */
    /* renamed from: p */
    public synchronized long mo3756p() {
        return f930g;
    }

    /* access modifiers changed from: protected */
    /* renamed from: q */
    public synchronized void mo3757q() {
        C0508b.m1034d("Ad request network error");
        f930g++;
    }

    /* access modifiers changed from: protected */
    /* renamed from: r */
    public synchronized void mo3758r() {
        f930g = 0;
    }

    /* access modifiers changed from: protected */
    /* renamed from: s */
    public synchronized long mo3759s() {
        return f931h;
    }

    /* access modifiers changed from: protected */
    /* renamed from: t */
    public synchronized void mo3760t() {
        f931h++;
    }

    /* access modifiers changed from: protected */
    /* renamed from: u */
    public synchronized void mo3761u() {
        f931h = 0;
    }

    /* access modifiers changed from: protected */
    /* renamed from: v */
    public synchronized long mo3762v() {
        return f932i;
    }

    /* access modifiers changed from: protected */
    /* renamed from: w */
    public synchronized void mo3763w() {
        f932i++;
    }

    /* access modifiers changed from: protected */
    /* renamed from: x */
    public synchronized void mo3764x() {
        f932i = 0;
    }

    /* access modifiers changed from: protected */
    /* renamed from: y */
    public boolean mo3765y() {
        return this.f939k;
    }

    /* access modifiers changed from: protected */
    /* renamed from: z */
    public void mo3766z() {
        C0508b.m1034d("Interstitial network error.");
        this.f939k = true;
    }

    /* access modifiers changed from: protected */
    /* renamed from: A */
    public boolean mo3735A() {
        return this.f940l;
    }

    /* access modifiers changed from: protected */
    /* renamed from: B */
    public void mo3736B() {
        C0508b.m1034d("Interstitial no fill.");
        this.f940l = true;
    }

    /* renamed from: C */
    public void mo3737C() {
        C0508b.m1034d("Landing page dismissed.");
        this.f938e.add(Long.valueOf(SystemClock.elapsedRealtime()));
    }

    /* access modifiers changed from: protected */
    /* renamed from: D */
    public String mo3738D() {
        return this.f941m;
    }

    /* renamed from: a */
    public void mo3741a(String str) {
        C0508b.m1034d("Prior impression ticket = " + str);
        this.f941m = str;
    }

    /* renamed from: E */
    public static long m910E() {
        if (f933j != -1) {
            return SystemClock.elapsedRealtime() - f933j;
        }
        f933j = SystemClock.elapsedRealtime();
        return 0;
    }
}
