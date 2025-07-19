package com.google.android.gms.internal;

import java.io.IOException;

/* renamed from: com.google.android.gms.internal.df */
public abstract class C1039df {

    /* renamed from: lx */
    protected final C1052dk f2472lx;

    /* renamed from: ly */
    private final String f2473ly;

    /* renamed from: lz */
    private C1056dm f2474lz;

    protected C1039df(String str, String str2) {
        this.f2473ly = str;
        this.f2472lx = new C1052dk(str2);
    }

    /* renamed from: B */
    public void mo7327B(String str) {
    }

    /* renamed from: a */
    public void mo7328a(long j, int i) {
    }

    /* renamed from: a */
    public final void mo7329a(C1056dm dmVar) {
        this.f2474lz = dmVar;
        if (this.f2474lz == null) {
            mo7332aT();
        }
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public final void mo7330a(String str, long j, String str2) throws IOException {
        this.f2472lx.mo7379a("Sending text message: %s to: %s", str, str2);
        this.f2474lz.mo5825a(this.f2473ly, str, j, str2);
    }

    /* access modifiers changed from: protected */
    /* renamed from: aS */
    public final long mo7331aS() {
        return this.f2474lz.mo5826aR();
    }

    /* renamed from: aT */
    public void mo7332aT() {
    }

    public final String getNamespace() {
        return this.f2473ly;
    }
}
