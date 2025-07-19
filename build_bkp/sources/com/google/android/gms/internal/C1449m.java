package com.google.android.gms.internal;

import java.io.IOException;

/* renamed from: com.google.android.gms.internal.m */
class C1449m implements C1446k {

    /* renamed from: dR */
    private C1439ix f3452dR;

    /* renamed from: dS */
    private byte[] f3453dS;

    /* renamed from: dT */
    private final int f3454dT;

    public C1449m(int i) {
        this.f3454dT = i;
        reset();
    }

    /* renamed from: b */
    public void mo8807b(int i, long j) throws IOException {
        this.f3452dR.mo8791b(i, j);
    }

    /* renamed from: b */
    public void mo8808b(int i, String str) throws IOException {
        this.f3452dR.mo8792b(i, str);
    }

    /* renamed from: h */
    public byte[] mo8809h() throws IOException {
        int ge = this.f3452dR.mo8800ge();
        if (ge < 0) {
            throw new IOException();
        } else if (ge == 0) {
            return this.f3453dS;
        } else {
            byte[] bArr = new byte[(this.f3453dS.length - ge)];
            System.arraycopy(this.f3453dS, 0, bArr, 0, bArr.length);
            return bArr;
        }
    }

    public void reset() {
        this.f3453dS = new byte[this.f3454dT];
        this.f3452dR = C1439ix.m3956i(this.f3453dS);
    }
}
