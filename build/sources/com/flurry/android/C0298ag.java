package com.flurry.android;

import android.os.Handler;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* renamed from: com.flurry.android.ag */
final class C0298ag {

    /* renamed from: a */
    private List f504a = new ArrayList();

    /* renamed from: b */
    private Handler f505b;

    /* renamed from: c */
    private Handler f506c;

    /* renamed from: d */
    private int f507d;

    /* renamed from: e */
    private Runnable f508e;

    C0298ag(Handler handler, int i) {
        this.f505b = handler;
        this.f506c = new Handler();
        this.f507d = i;
        this.f508e = new C0313k(this);
        m530b();
    }

    /* access modifiers changed from: package-private */
    /* renamed from: a */
    public final synchronized void mo2395a(C0317o oVar) {
        oVar.mo2417a();
        this.f504a.add(new WeakReference(oVar));
    }

    /* access modifiers changed from: private */
    /* renamed from: a */
    public synchronized void m528a() {
        ArrayList arrayList = new ArrayList();
        for (WeakReference weakReference : this.f504a) {
            C0317o oVar = (C0317o) weakReference.get();
            if (oVar != null) {
                arrayList.add(oVar);
            }
        }
        this.f506c.post(new C0312j(arrayList));
        m530b();
    }

    /* renamed from: b */
    private synchronized void m530b() {
        Iterator it = this.f504a.iterator();
        while (it.hasNext()) {
            if (((WeakReference) it.next()).get() == null) {
                it.remove();
            }
        }
        this.f505b.removeCallbacks(this.f508e);
        this.f505b.postDelayed(this.f508e, (long) this.f507d);
    }
}
