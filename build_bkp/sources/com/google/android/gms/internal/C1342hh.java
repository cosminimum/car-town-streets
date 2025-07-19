package com.google.android.gms.internal;

import com.google.android.gms.internal.C1336hd;
import java.util.concurrent.BlockingQueue;

/* renamed from: com.google.android.gms.internal.hh */
public class C1342hh {

    /* renamed from: Bj */
    private static int f3180Bj = 10000;

    /* renamed from: Bk */
    private static int f3181Bk = 1000;

    /* renamed from: Be */
    private final int f3182Be;

    /* renamed from: Bl */
    private final String f3183Bl;

    /* renamed from: Bm */
    private final BlockingQueue<C1336hd.C1337a> f3184Bm;

    /* renamed from: a */
    public void mo8223a(C1336hd.C1337a.C1338a aVar) {
        aVar.mo8207as(this.f3183Bl);
        aVar.mo8208bd(this.f3182Be);
        this.f3184Bm.offer(aVar.mo8209ek());
    }
}
