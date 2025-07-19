package com.flurry.android;

import java.io.DataInput;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final class v extends aj {
    long a;
    long b;
    String c;
    String d;
    long e;
    Long f;
    byte[] g;
    AdImage h;

    /* JADX INFO: Access modifiers changed from: package-private */
    public v() {
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public v(DataInput dataInput) {
        b(dataInput);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final void a(DataInput dataInput) {
        b(dataInput);
    }

    private void b(DataInput dataInput) {
        this.a = dataInput.readLong();
        this.b = dataInput.readLong();
        this.d = dataInput.readUTF();
        this.c = dataInput.readUTF();
        this.e = dataInput.readLong();
        this.f = Long.valueOf(dataInput.readLong());
        this.g = new byte[dataInput.readUnsignedByte()];
        dataInput.readFully(this.g);
    }

    public final String toString() {
        return "ad {id=" + this.a + ", name='" + this.d + "', cookie: '" + a(this.g) + "'}";
    }

    private static String a(byte[] bArr) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < bArr.length; i++) {
            int i2 = (bArr[i] >> 4) & 15;
            if (i2 < 10) {
                sb.append((char) (i2 + 48));
            } else {
                sb.append((char) ((i2 + 65) - 10));
            }
            int i3 = bArr[i] & 15;
            if (i3 < 10) {
                sb.append((char) (i3 + 48));
            } else {
                sb.append((char) ((i3 + 65) - 10));
            }
        }
        return sb.toString();
    }
}
