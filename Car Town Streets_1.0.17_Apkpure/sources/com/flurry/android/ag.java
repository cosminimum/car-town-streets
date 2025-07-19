package com.flurry.android;

import android.os.Handler;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
/* loaded from: classes.dex */
final class ag {
    private Handler b;
    private int d;
    private List a = new ArrayList();
    private Handler c = new Handler();
    private Runnable e = new k(this);

    /* JADX INFO: Access modifiers changed from: package-private */
    public ag(Handler handler, int i) {
        this.b = handler;
        this.d = i;
        b();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final synchronized void a(o oVar) {
        oVar.a();
        this.a.add(new WeakReference(oVar));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public synchronized void a() {
        ArrayList arrayList = new ArrayList();
        for (WeakReference weakReference : this.a) {
            o oVar = (o) weakReference.get();
            if (oVar != null) {
                arrayList.add(oVar);
            }
        }
        this.c.post(new j(arrayList));
        b();
    }

    private synchronized void b() {
        Iterator it = this.a.iterator();
        while (it.hasNext()) {
            if (((WeakReference) it.next()).get() == null) {
                it.remove();
            }
        }
        this.b.removeCallbacks(this.e);
        this.b.postDelayed(this.e, this.d);
    }
}
