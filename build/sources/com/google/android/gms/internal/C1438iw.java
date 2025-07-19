package com.google.android.gms.internal;

import com.flurry.android.Constants;
import java.io.IOException;

/* renamed from: com.google.android.gms.internal.iw */
public final class C1438iw {

    /* renamed from: Hp */
    private int f3428Hp;

    /* renamed from: Hq */
    private int f3429Hq;

    /* renamed from: Hr */
    private int f3430Hr;

    /* renamed from: Hs */
    private int f3431Hs;

    /* renamed from: Ht */
    private int f3432Ht = Integer.MAX_VALUE;

    /* renamed from: Hu */
    private int f3433Hu = 64;

    /* renamed from: Hv */
    private int f3434Hv = 67108864;
    private final byte[] buffer;

    private C1438iw(byte[] bArr, int i, int i2) {
        this.buffer = bArr;
        this.f3428Hp = i;
        this.f3429Hq = i + i2;
        this.f3430Hr = i;
    }

    /* renamed from: a */
    public static C1438iw m3932a(byte[] bArr, int i, int i2) {
        return new C1438iw(bArr, i, i2);
    }

    /* renamed from: n */
    public static long m3933n(long j) {
        return (j >>> 1) ^ (-(1 & j));
    }

    /* renamed from: bI */
    public void mo8774bI(int i) throws C1441iy {
        if (this.f3431Hs != i) {
            throw C1441iy.m3981gk();
        }
    }

    /* renamed from: bJ */
    public boolean mo8775bJ(int i) throws IOException {
        switch (C1445jb.m3999bS(i)) {
            case 0:
                mo8780fW();
                return true;
            case 1:
                mo8785gb();
                return true;
            case 2:
                mo8777bL(mo8782fY());
                return true;
            case 3:
                mo8779fV();
                mo8774bI(C1445jb.m4001g(C1445jb.m4000bT(i), 4));
                return true;
            case 4:
                return false;
            case 5:
                mo8784ga();
                return true;
            default:
                throw C1441iy.m3982gl();
        }
    }

    /* renamed from: bK */
    public byte[] mo8776bK(int i) throws IOException {
        if (i < 0) {
            throw C1441iy.m3978gh();
        } else if (this.f3430Hr + i > this.f3432Ht) {
            mo8777bL(this.f3432Ht - this.f3430Hr);
            throw C1441iy.m3977gg();
        } else if (i <= this.f3429Hq - this.f3430Hr) {
            byte[] bArr = new byte[i];
            System.arraycopy(this.buffer, this.f3430Hr, bArr, 0, i);
            this.f3430Hr += i;
            return bArr;
        } else {
            throw C1441iy.m3977gg();
        }
    }

    /* renamed from: bL */
    public void mo8777bL(int i) throws IOException {
        if (i < 0) {
            throw C1441iy.m3978gh();
        } else if (this.f3430Hr + i > this.f3432Ht) {
            mo8777bL(this.f3432Ht - this.f3430Hr);
            throw C1441iy.m3977gg();
        } else if (i <= this.f3429Hq - this.f3430Hr) {
            this.f3430Hr += i;
        } else {
            throw C1441iy.m3977gg();
        }
    }

    /* renamed from: fU */
    public int mo8778fU() throws IOException {
        if (mo8786gc()) {
            this.f3431Hs = 0;
            return 0;
        }
        this.f3431Hs = mo8782fY();
        if (this.f3431Hs != 0) {
            return this.f3431Hs;
        }
        throw C1441iy.m3980gj();
    }

    /*  JADX ERROR: StackOverflow in pass: RegionMakerVisitor
        jadx.core.utils.exceptions.JadxOverflowException: 
        	at jadx.core.utils.ErrorsCounter.addError(ErrorsCounter.java:47)
        	at jadx.core.utils.ErrorsCounter.methodError(ErrorsCounter.java:81)
        */
    /* renamed from: fV */
    public void mo8779fV() throws java.io.IOException {
        /*
            r1 = this;
        L_0x0000:
            int r0 = r1.mo8778fU()
            if (r0 == 0) goto L_0x000c
            boolean r0 = r1.mo8775bJ(r0)
            if (r0 != 0) goto L_0x0000
        L_0x000c:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.internal.C1438iw.mo8779fV():void");
    }

    /* renamed from: fW */
    public int mo8780fW() throws IOException {
        return mo8782fY();
    }

    /* renamed from: fX */
    public long mo8781fX() throws IOException {
        return m3933n(mo8783fZ());
    }

    /* renamed from: fY */
    public int mo8782fY() throws IOException {
        byte gd = mo8787gd();
        if (gd >= 0) {
            return gd;
        }
        byte b = gd & Byte.MAX_VALUE;
        byte gd2 = mo8787gd();
        if (gd2 >= 0) {
            return b | (gd2 << 7);
        }
        byte b2 = b | ((gd2 & Byte.MAX_VALUE) << 7);
        byte gd3 = mo8787gd();
        if (gd3 >= 0) {
            return b2 | (gd3 << 14);
        }
        byte b3 = b2 | ((gd3 & Byte.MAX_VALUE) << 14);
        byte gd4 = mo8787gd();
        if (gd4 >= 0) {
            return b3 | (gd4 << 21);
        }
        byte b4 = b3 | ((gd4 & Byte.MAX_VALUE) << 21);
        byte gd5 = mo8787gd();
        byte b5 = b4 | (gd5 << 28);
        if (gd5 >= 0) {
            return b5;
        }
        for (int i = 0; i < 5; i++) {
            if (mo8787gd() >= 0) {
                return b5;
            }
        }
        throw C1441iy.m3979gi();
    }

    /* renamed from: fZ */
    public long mo8783fZ() throws IOException {
        long j = 0;
        for (int i = 0; i < 64; i += 7) {
            byte gd = mo8787gd();
            j |= ((long) (gd & Byte.MAX_VALUE)) << i;
            if ((gd & 128) == 0) {
                return j;
            }
        }
        throw C1441iy.m3979gi();
    }

    /* renamed from: ga */
    public int mo8784ga() throws IOException {
        return (mo8787gd() & Constants.UNKNOWN) | ((mo8787gd() & Constants.UNKNOWN) << 8) | ((mo8787gd() & Constants.UNKNOWN) << 16) | ((mo8787gd() & Constants.UNKNOWN) << 24);
    }

    /* renamed from: gb */
    public long mo8785gb() throws IOException {
        byte gd = mo8787gd();
        byte gd2 = mo8787gd();
        return ((((long) gd2) & 255) << 8) | (((long) gd) & 255) | ((((long) mo8787gd()) & 255) << 16) | ((((long) mo8787gd()) & 255) << 24) | ((((long) mo8787gd()) & 255) << 32) | ((((long) mo8787gd()) & 255) << 40) | ((((long) mo8787gd()) & 255) << 48) | ((((long) mo8787gd()) & 255) << 56);
    }

    /* renamed from: gc */
    public boolean mo8786gc() {
        return this.f3430Hr == this.f3429Hq;
    }

    /* renamed from: gd */
    public byte mo8787gd() throws IOException {
        if (this.f3430Hr == this.f3429Hq) {
            throw C1441iy.m3977gg();
        }
        byte[] bArr = this.buffer;
        int i = this.f3430Hr;
        this.f3430Hr = i + 1;
        return bArr[i];
    }

    public String readString() throws IOException {
        int fY = mo8782fY();
        if (fY > this.f3429Hq - this.f3430Hr || fY <= 0) {
            return new String(mo8776bK(fY), "UTF-8");
        }
        String str = new String(this.buffer, this.f3430Hr, fY, "UTF-8");
        this.f3430Hr = fY + this.f3430Hr;
        return str;
    }
}
