package com.google.android.gms.internal;

import java.io.IOException;

/* renamed from: com.google.android.gms.internal.iz */
public abstract class C1442iz {

    /* renamed from: rw */
    protected int f3436rw = -1;

    /* renamed from: a */
    public static final <T extends C1442iz> T m3983a(T t, byte[] bArr) throws C1441iy {
        return m3986b(t, bArr, 0, bArr.length);
    }

    /* renamed from: a */
    public static final void m3984a(C1442iz izVar, byte[] bArr, int i, int i2) {
        try {
            C1439ix b = C1439ix.m3949b(bArr, i, i2);
            izVar.mo6241a(b);
            b.mo8801gf();
        } catch (IOException e) {
            throw new RuntimeException("Serializing to a byte array threw an IOException (should never happen).", e);
        }
    }

    /* renamed from: a */
    public static final byte[] m3985a(C1442iz izVar) {
        byte[] bArr = new byte[izVar.mo6243cP()];
        m3984a(izVar, bArr, 0, bArr.length);
        return bArr;
    }

    /* renamed from: b */
    public static final <T extends C1442iz> T m3986b(T t, byte[] bArr, int i, int i2) throws C1441iy {
        try {
            C1438iw a = C1438iw.m3932a(bArr, i, i2);
            t.mo6242b(a);
            a.mo8774bI(0);
            return t;
        } catch (C1441iy e) {
            throw e;
        } catch (IOException e2) {
            throw new RuntimeException("Reading from a byte array threw an IOException (should never happen).");
        }
    }

    /* renamed from: a */
    public abstract void mo6241a(C1439ix ixVar) throws IOException;

    /* renamed from: b */
    public abstract C1442iz mo6242b(C1438iw iwVar) throws IOException;

    /* renamed from: cP */
    public int mo6243cP() {
        this.f3436rw = 0;
        return 0;
    }

    public String toString() {
        return C1444ja.m3997b(this);
    }
}
