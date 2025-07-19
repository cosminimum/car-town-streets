package com.chartboost.sdk.impl;

import android.support.v4.view.MotionEventCompat;
import java.io.IOException;
import java.io.OutputStream;
/* loaded from: classes.dex */
public class ao extends ap {
    private int a;
    private int b;
    private byte[] c = new byte[512];

    @Override // com.chartboost.sdk.impl.ap, java.io.OutputStream
    public void write(byte[] b) {
        write(b, 0, b.length);
    }

    @Override // java.io.OutputStream
    public void write(byte[] b, int off, int len) {
        b(len);
        System.arraycopy(b, off, this.c, this.a, len);
        this.a += len;
        this.b = Math.max(this.a, this.b);
    }

    @Override // com.chartboost.sdk.impl.ap, java.io.OutputStream
    public void write(int b) {
        b(1);
        byte[] bArr = this.c;
        int i = this.a;
        this.a = i + 1;
        bArr[i] = (byte) (b & MotionEventCompat.ACTION_MASK);
        this.b = Math.max(this.a, this.b);
    }

    @Override // com.chartboost.sdk.impl.ap
    public int a() {
        return this.a;
    }

    @Override // com.chartboost.sdk.impl.ap
    public void a(int i) {
        this.a = i;
    }

    @Override // com.chartboost.sdk.impl.ap
    public int b() {
        return this.b;
    }

    @Override // com.chartboost.sdk.impl.ap
    public int a(OutputStream outputStream) throws IOException {
        outputStream.write(this.c, 0, this.b);
        return this.b;
    }

    void b(int i) {
        int i2 = this.a + i;
        if (i2 >= this.c.length) {
            int length = this.c.length * 2;
            if (length <= i2) {
                length = i2 + 128;
            }
            byte[] bArr = new byte[length];
            System.arraycopy(this.c, 0, bArr, 0, this.b);
            this.c = bArr;
        }
    }
}
