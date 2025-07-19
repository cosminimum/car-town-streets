package com.google.ads;

import android.os.SystemClock;
import java.util.concurrent.TimeUnit;

/* renamed from: com.google.ads.d */
public class C0442d {

    /* renamed from: a */
    private C0440c f762a = null;

    /* renamed from: b */
    private long f763b = -1;

    /* renamed from: a */
    public boolean mo3558a() {
        return this.f762a != null && SystemClock.elapsedRealtime() < this.f763b;
    }

    /* renamed from: a */
    public void mo3557a(C0440c cVar, int i) {
        this.f762a = cVar;
        this.f763b = TimeUnit.MILLISECONDS.convert((long) i, TimeUnit.SECONDS) + SystemClock.elapsedRealtime();
    }

    /* renamed from: b */
    public C0440c mo3559b() {
        return this.f762a;
    }
}
