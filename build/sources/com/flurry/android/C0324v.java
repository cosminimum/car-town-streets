package com.flurry.android;

import java.io.DataInput;

/* renamed from: com.flurry.android.v */
final class C0324v extends C0301aj {

    /* renamed from: a */
    long f643a;

    /* renamed from: b */
    long f644b;

    /* renamed from: c */
    String f645c;

    /* renamed from: d */
    String f646d;

    /* renamed from: e */
    long f647e;

    /* renamed from: f */
    Long f648f;

    /* renamed from: g */
    byte[] f649g;

    /* renamed from: h */
    AdImage f650h;

    C0324v() {
    }

    C0324v(DataInput dataInput) {
        m610b(dataInput);
    }

    /* access modifiers changed from: package-private */
    /* renamed from: a */
    public final void mo2459a(DataInput dataInput) {
        m610b(dataInput);
    }

    /* renamed from: b */
    private void m610b(DataInput dataInput) {
        this.f643a = dataInput.readLong();
        this.f644b = dataInput.readLong();
        this.f646d = dataInput.readUTF();
        this.f645c = dataInput.readUTF();
        this.f647e = dataInput.readLong();
        this.f648f = Long.valueOf(dataInput.readLong());
        this.f649g = new byte[dataInput.readUnsignedByte()];
        dataInput.readFully(this.f649g);
    }

    public final String toString() {
        return "ad {id=" + this.f643a + ", name='" + this.f646d + "', cookie: '" + m609a(this.f649g) + "'}";
    }

    /* renamed from: a */
    private static String m609a(byte[] bArr) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < bArr.length; i++) {
            int i2 = (bArr[i] >> 4) & 15;
            if (i2 < 10) {
                sb.append((char) (i2 + 48));
            } else {
                sb.append((char) ((i2 + 65) - 10));
            }
            byte b = bArr[i] & 15;
            if (b < 10) {
                sb.append((char) (b + 48));
            } else {
                sb.append((char) ((b + 65) - 10));
            }
        }
        return sb.toString();
    }
}
