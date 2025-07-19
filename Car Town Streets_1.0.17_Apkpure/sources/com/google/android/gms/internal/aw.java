package com.google.android.gms.internal;

import com.google.android.gms.internal.ay;
import com.google.android.gms.internal.bd;
/* loaded from: classes.dex */
public final class aw extends bd.a {
    private ay.a fP;
    private av fQ;
    private final Object fx = new Object();

    public void a(av avVar) {
        synchronized (this.fx) {
            this.fQ = avVar;
        }
    }

    public void a(ay.a aVar) {
        synchronized (this.fx) {
            this.fP = aVar;
        }
    }

    @Override // com.google.android.gms.internal.bd
    public void onAdClosed() {
        synchronized (this.fx) {
            if (this.fQ != null) {
                this.fQ.D();
            }
        }
    }

    @Override // com.google.android.gms.internal.bd
    public void onAdFailedToLoad(int error) {
        synchronized (this.fx) {
            if (this.fP != null) {
                this.fP.f(error == 3 ? 1 : 2);
                this.fP = null;
            }
        }
    }

    @Override // com.google.android.gms.internal.bd
    public void onAdLeftApplication() {
        synchronized (this.fx) {
            if (this.fQ != null) {
                this.fQ.E();
            }
        }
    }

    @Override // com.google.android.gms.internal.bd
    public void onAdLoaded() {
        synchronized (this.fx) {
            if (this.fP != null) {
                this.fP.f(0);
                this.fP = null;
                return;
            }
            if (this.fQ != null) {
                this.fQ.G();
            }
        }
    }

    @Override // com.google.android.gms.internal.bd
    public void onAdOpened() {
        synchronized (this.fx) {
            if (this.fQ != null) {
                this.fQ.F();
            }
        }
    }

    @Override // com.google.android.gms.internal.bd
    public void w() {
        synchronized (this.fx) {
            if (this.fQ != null) {
                this.fQ.C();
            }
        }
    }
}
