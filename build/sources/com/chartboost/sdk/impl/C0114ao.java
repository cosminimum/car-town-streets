package com.chartboost.sdk.impl;

import android.support.p000v4.view.MotionEventCompat;
import java.io.IOException;
import java.io.OutputStream;

/* renamed from: com.chartboost.sdk.impl.ao */
public class C0114ao extends C0115ap {

    /* renamed from: a */
    private int f163a;

    /* renamed from: b */
    private int f164b;

    /* renamed from: c */
    private byte[] f165c = new byte[512];

    public void write(byte[] b) {
        write(b, 0, b.length);
    }

    public void write(byte[] b, int off, int len) {
        mo1296b(len);
        System.arraycopy(b, off, this.f165c, this.f163a, len);
        this.f163a += len;
        this.f164b = Math.max(this.f163a, this.f164b);
    }

    public void write(int b) {
        mo1296b(1);
        byte[] bArr = this.f165c;
        int i = this.f163a;
        this.f163a = i + 1;
        bArr[i] = (byte) (b & MotionEventCompat.ACTION_MASK);
        this.f164b = Math.max(this.f163a, this.f164b);
    }

    /* renamed from: a */
    public int mo1292a() {
        return this.f163a;
    }

    /* renamed from: a */
    public void mo1294a(int i) {
        this.f163a = i;
    }

    /* renamed from: b */
    public int mo1295b() {
        return this.f164b;
    }

    /* renamed from: a */
    public int mo1293a(OutputStream outputStream) throws IOException {
        outputStream.write(this.f165c, 0, this.f164b);
        return this.f164b;
    }

    /* access modifiers changed from: package-private */
    /* renamed from: b */
    public void mo1296b(int i) {
        int i2 = this.f163a + i;
        if (i2 >= this.f165c.length) {
            int length = this.f165c.length * 2;
            if (length <= i2) {
                length = i2 + 128;
            }
            byte[] bArr = new byte[length];
            System.arraycopy(this.f165c, 0, bArr, 0, this.f164b);
            this.f165c = bArr;
        }
    }
}
