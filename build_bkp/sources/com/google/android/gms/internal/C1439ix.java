package com.google.android.gms.internal;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

/* renamed from: com.google.android.gms.internal.ix */
public final class C1439ix {

    /* renamed from: Hw */
    private final int f3435Hw;
    private final byte[] buffer;
    private int position;

    /* renamed from: com.google.android.gms.internal.ix$a */
    public static class C1440a extends IOException {
        C1440a(int i, int i2) {
            super("CodedOutputStream was writing to a flat byte array and ran out of space (pos " + i + " limit " + i2 + ").");
        }
    }

    private C1439ix(byte[] bArr, int i, int i2) {
        this.buffer = bArr;
        this.position = i;
        this.f3435Hw = i + i2;
    }

    /* renamed from: aD */
    public static int m3948aD(String str) {
        try {
            byte[] bytes = str.getBytes("UTF-8");
            return bytes.length + m3952bR(bytes.length);
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("UTF-8 not supported.");
        }
    }

    /* renamed from: b */
    public static C1439ix m3949b(byte[] bArr, int i, int i2) {
        return new C1439ix(bArr, i, i2);
    }

    /* renamed from: bN */
    public static int m3950bN(int i) {
        if (i >= 0) {
            return m3952bR(i);
        }
        return 10;
    }

    /* renamed from: bP */
    public static int m3951bP(int i) {
        return m3952bR(C1445jb.m4001g(i, 0));
    }

    /* renamed from: bR */
    public static int m3952bR(int i) {
        if ((i & -128) == 0) {
            return 1;
        }
        if ((i & -16384) == 0) {
            return 2;
        }
        if ((-2097152 & i) == 0) {
            return 3;
        }
        return (-268435456 & i) == 0 ? 4 : 5;
    }

    /* renamed from: d */
    public static int m3953d(int i, long j) {
        return m3951bP(i) + m3957q(j);
    }

    /* renamed from: e */
    public static int m3954e(int i, int i2) {
        return m3951bP(i) + m3950bN(i2);
    }

    /* renamed from: e */
    public static int m3955e(int i, String str) {
        return m3951bP(i) + m3948aD(str);
    }

    /* renamed from: i */
    public static C1439ix m3956i(byte[] bArr) {
        return m3949b(bArr, 0, bArr.length);
    }

    /* renamed from: q */
    public static int m3957q(long j) {
        return m3958s(m3959t(j));
    }

    /* renamed from: s */
    public static int m3958s(long j) {
        if ((-128 & j) == 0) {
            return 1;
        }
        if ((-16384 & j) == 0) {
            return 2;
        }
        if ((-2097152 & j) == 0) {
            return 3;
        }
        if ((-268435456 & j) == 0) {
            return 4;
        }
        if ((-34359738368L & j) == 0) {
            return 5;
        }
        if ((-4398046511104L & j) == 0) {
            return 6;
        }
        if ((-562949953421312L & j) == 0) {
            return 7;
        }
        if ((-72057594037927936L & j) == 0) {
            return 8;
        }
        return (Long.MIN_VALUE & j) == 0 ? 9 : 10;
    }

    /* renamed from: t */
    public static long m3959t(long j) {
        return (j << 1) ^ (j >> 63);
    }

    /* renamed from: aC */
    public void mo8789aC(String str) throws IOException {
        byte[] bytes = str.getBytes("UTF-8");
        mo8795bQ(bytes.length);
        mo8802j(bytes);
    }

    /* renamed from: b */
    public void mo8790b(byte b) throws IOException {
        if (this.position == this.f3435Hw) {
            throw new C1440a(this.position, this.f3435Hw);
        }
        byte[] bArr = this.buffer;
        int i = this.position;
        this.position = i + 1;
        bArr[i] = b;
    }

    /* renamed from: b */
    public void mo8791b(int i, long j) throws IOException {
        mo8799f(i, 0);
        mo8803o(j);
    }

    /* renamed from: b */
    public void mo8792b(int i, String str) throws IOException {
        mo8799f(i, 2);
        mo8789aC(str);
    }

    /* renamed from: bM */
    public void mo8793bM(int i) throws IOException {
        if (i >= 0) {
            mo8795bQ(i);
        } else {
            mo8805r((long) i);
        }
    }

    /* renamed from: bO */
    public void mo8794bO(int i) throws IOException {
        mo8790b((byte) i);
    }

    /* renamed from: bQ */
    public void mo8795bQ(int i) throws IOException {
        while ((i & -128) != 0) {
            mo8794bO((i & 127) | 128);
            i >>>= 7;
        }
        mo8794bO(i);
    }

    /* renamed from: c */
    public void mo8796c(int i, long j) throws IOException {
        mo8799f(i, 0);
        mo8804p(j);
    }

    /* renamed from: c */
    public void mo8797c(byte[] bArr, int i, int i2) throws IOException {
        if (this.f3435Hw - this.position >= i2) {
            System.arraycopy(bArr, i, this.buffer, this.position, i2);
            this.position += i2;
            return;
        }
        throw new C1440a(this.position, this.f3435Hw);
    }

    /* renamed from: d */
    public void mo8798d(int i, int i2) throws IOException {
        mo8799f(i, 0);
        mo8793bM(i2);
    }

    /* renamed from: f */
    public void mo8799f(int i, int i2) throws IOException {
        mo8795bQ(C1445jb.m4001g(i, i2));
    }

    /* renamed from: ge */
    public int mo8800ge() {
        return this.f3435Hw - this.position;
    }

    /* renamed from: gf */
    public void mo8801gf() {
        if (mo8800ge() != 0) {
            throw new IllegalStateException("Did not write as much data as expected.");
        }
    }

    /* renamed from: j */
    public void mo8802j(byte[] bArr) throws IOException {
        mo8797c(bArr, 0, bArr.length);
    }

    /* renamed from: o */
    public void mo8803o(long j) throws IOException {
        mo8805r(j);
    }

    /* renamed from: p */
    public void mo8804p(long j) throws IOException {
        mo8805r(m3959t(j));
    }

    /* renamed from: r */
    public void mo8805r(long j) throws IOException {
        while ((-128 & j) != 0) {
            mo8794bO((((int) j) & 127) | 128);
            j >>>= 7;
        }
        mo8794bO((int) j);
    }
}
