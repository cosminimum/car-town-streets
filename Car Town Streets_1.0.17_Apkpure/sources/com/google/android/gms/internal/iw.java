package com.google.android.gms.internal;

import com.flurry.android.Constants;
import java.io.IOException;
/* loaded from: classes.dex */
public final class iw {
    private int Hp;
    private int Hq;
    private int Hr;
    private int Hs;
    private int Ht = Integer.MAX_VALUE;
    private int Hu = 64;
    private int Hv = 67108864;
    private final byte[] buffer;

    private iw(byte[] bArr, int i, int i2) {
        this.buffer = bArr;
        this.Hp = i;
        this.Hq = i + i2;
        this.Hr = i;
    }

    public static iw a(byte[] bArr, int i, int i2) {
        return new iw(bArr, i, i2);
    }

    public static long n(long j) {
        return (j >>> 1) ^ (-(1 & j));
    }

    public void bI(int i) throws iy {
        if (this.Hs != i) {
            throw iy.gk();
        }
    }

    public boolean bJ(int i) throws IOException {
        switch (jb.bS(i)) {
            case 0:
                fW();
                return true;
            case 1:
                gb();
                return true;
            case 2:
                bL(fY());
                return true;
            case 3:
                fV();
                bI(jb.g(jb.bT(i), 4));
                return true;
            case 4:
                return false;
            case 5:
                ga();
                return true;
            default:
                throw iy.gl();
        }
    }

    public byte[] bK(int i) throws IOException {
        if (i < 0) {
            throw iy.gh();
        }
        if (this.Hr + i > this.Ht) {
            bL(this.Ht - this.Hr);
            throw iy.gg();
        } else if (i > this.Hq - this.Hr) {
            throw iy.gg();
        } else {
            byte[] bArr = new byte[i];
            System.arraycopy(this.buffer, this.Hr, bArr, 0, i);
            this.Hr += i;
            return bArr;
        }
    }

    public void bL(int i) throws IOException {
        if (i < 0) {
            throw iy.gh();
        }
        if (this.Hr + i > this.Ht) {
            bL(this.Ht - this.Hr);
            throw iy.gg();
        } else if (i > this.Hq - this.Hr) {
            throw iy.gg();
        } else {
            this.Hr += i;
        }
    }

    public int fU() throws IOException {
        if (gc()) {
            this.Hs = 0;
            return 0;
        }
        this.Hs = fY();
        if (this.Hs != 0) {
            return this.Hs;
        }
        throw iy.gj();
    }

    public void fV() throws IOException {
        int fU;
        do {
            fU = fU();
            if (fU == 0) {
                return;
            }
        } while (bJ(fU));
    }

    public int fW() throws IOException {
        return fY();
    }

    public long fX() throws IOException {
        return n(fZ());
    }

    public int fY() throws IOException {
        byte gd = gd();
        if (gd >= 0) {
            return gd;
        }
        int i = gd & Byte.MAX_VALUE;
        byte gd2 = gd();
        if (gd2 >= 0) {
            return i | (gd2 << 7);
        }
        int i2 = i | ((gd2 & Byte.MAX_VALUE) << 7);
        byte gd3 = gd();
        if (gd3 >= 0) {
            return i2 | (gd3 << 14);
        }
        int i3 = i2 | ((gd3 & Byte.MAX_VALUE) << 14);
        byte gd4 = gd();
        if (gd4 >= 0) {
            return i3 | (gd4 << 21);
        }
        int i4 = i3 | ((gd4 & Byte.MAX_VALUE) << 21);
        byte gd5 = gd();
        int i5 = i4 | (gd5 << 28);
        if (gd5 >= 0) {
            return i5;
        }
        for (int i6 = 0; i6 < 5; i6++) {
            if (gd() >= 0) {
                return i5;
            }
        }
        throw iy.gi();
    }

    public long fZ() throws IOException {
        long j = 0;
        for (int i = 0; i < 64; i += 7) {
            byte gd = gd();
            j |= (gd & Byte.MAX_VALUE) << i;
            if ((gd & 128) == 0) {
                return j;
            }
        }
        throw iy.gi();
    }

    public int ga() throws IOException {
        return (gd() & Constants.UNKNOWN) | ((gd() & Constants.UNKNOWN) << 8) | ((gd() & Constants.UNKNOWN) << 16) | ((gd() & Constants.UNKNOWN) << 24);
    }

    public long gb() throws IOException {
        byte gd = gd();
        byte gd2 = gd();
        return ((gd2 & 255) << 8) | (gd & 255) | ((gd() & 255) << 16) | ((gd() & 255) << 24) | ((gd() & 255) << 32) | ((gd() & 255) << 40) | ((gd() & 255) << 48) | ((gd() & 255) << 56);
    }

    public boolean gc() {
        return this.Hr == this.Hq;
    }

    public byte gd() throws IOException {
        if (this.Hr == this.Hq) {
            throw iy.gg();
        }
        byte[] bArr = this.buffer;
        int i = this.Hr;
        this.Hr = i + 1;
        return bArr[i];
    }

    public String readString() throws IOException {
        int fY = fY();
        if (fY > this.Hq - this.Hr || fY <= 0) {
            return new String(bK(fY), "UTF-8");
        }
        String str = new String(this.buffer, this.Hr, fY, "UTF-8");
        this.Hr = fY + this.Hr;
        return str;
    }
}
