package com.google.android.gms.internal;

import com.google.android.gms.internal.C0893ay;
import com.google.android.gms.internal.C0918bd;

/* renamed from: com.google.android.gms.internal.aw */
public final class C0890aw extends C0918bd.C0919a {

    /* renamed from: fP */
    private C0893ay.C0894a f1984fP;

    /* renamed from: fQ */
    private C0889av f1985fQ;

    /* renamed from: fx */
    private final Object f1986fx = new Object();

    /* renamed from: a */
    public void mo7080a(C0889av avVar) {
        synchronized (this.f1986fx) {
            this.f1985fQ = avVar;
        }
    }

    /* renamed from: a */
    public void mo7081a(C0893ay.C0894a aVar) {
        synchronized (this.f1986fx) {
            this.f1984fP = aVar;
        }
    }

    public void onAdClosed() {
        synchronized (this.f1986fx) {
            if (this.f1985fQ != null) {
                this.f1985fQ.mo7076D();
            }
        }
    }

    public void onAdFailedToLoad(int error) {
        synchronized (this.f1986fx) {
            if (this.f1984fP != null) {
                this.f1984fP.mo7090f(error == 3 ? 1 : 2);
                this.f1984fP = null;
            }
        }
    }

    public void onAdLeftApplication() {
        synchronized (this.f1986fx) {
            if (this.f1985fQ != null) {
                this.f1985fQ.mo7077E();
            }
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:16:?, code lost:
        return;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void onAdLoaded() {
        /*
            r3 = this;
            java.lang.Object r1 = r3.f1986fx
            monitor-enter(r1)
            com.google.android.gms.internal.ay$a r0 = r3.f1984fP     // Catch:{ all -> 0x001d }
            if (r0 == 0) goto L_0x0012
            com.google.android.gms.internal.ay$a r0 = r3.f1984fP     // Catch:{ all -> 0x001d }
            r2 = 0
            r0.mo7090f(r2)     // Catch:{ all -> 0x001d }
            r0 = 0
            r3.f1984fP = r0     // Catch:{ all -> 0x001d }
            monitor-exit(r1)     // Catch:{ all -> 0x001d }
        L_0x0011:
            return
        L_0x0012:
            com.google.android.gms.internal.av r0 = r3.f1985fQ     // Catch:{ all -> 0x001d }
            if (r0 == 0) goto L_0x001b
            com.google.android.gms.internal.av r0 = r3.f1985fQ     // Catch:{ all -> 0x001d }
            r0.mo7079G()     // Catch:{ all -> 0x001d }
        L_0x001b:
            monitor-exit(r1)     // Catch:{ all -> 0x001d }
            goto L_0x0011
        L_0x001d:
            r0 = move-exception
            monitor-exit(r1)     // Catch:{ all -> 0x001d }
            throw r0
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.internal.C0890aw.onAdLoaded():void");
    }

    public void onAdOpened() {
        synchronized (this.f1986fx) {
            if (this.f1985fQ != null) {
                this.f1985fQ.mo7078F();
            }
        }
    }

    /* renamed from: w */
    public void mo7087w() {
        synchronized (this.f1986fx) {
            if (this.f1985fQ != null) {
                this.f1985fQ.mo7075C();
            }
        }
    }
}
