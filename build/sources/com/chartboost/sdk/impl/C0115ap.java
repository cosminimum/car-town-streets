package com.chartboost.sdk.impl;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;

/* renamed from: com.chartboost.sdk.impl.ap */
public abstract class C0115ap extends OutputStream {
    /* renamed from: a */
    public abstract int mo1292a();

    /* renamed from: a */
    public abstract int mo1293a(OutputStream outputStream) throws IOException;

    /* renamed from: a */
    public abstract void mo1294a(int i);

    /* renamed from: b */
    public abstract int mo1295b();

    public abstract void write(int i);

    public abstract void write(byte[] bArr);

    /* renamed from: c */
    public byte[] mo1304c() {
        try {
            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream(mo1295b());
            mo1293a((OutputStream) byteArrayOutputStream);
            return byteArrayOutputStream.toByteArray();
        } catch (IOException e) {
            throw new RuntimeException("should be impossible", e);
        }
    }

    /* renamed from: c */
    public void mo1303c(int i) {
        write(i >> 0);
        write(i >> 8);
        write(i >> 16);
        write(i >> 24);
    }

    /* renamed from: d */
    public void mo1305d(int i) {
        write(i >> 24);
        write(i >> 16);
        write(i >> 8);
        write(i);
    }

    /* renamed from: a */
    public void mo1301a(int i, int i2) {
        int a = mo1292a();
        mo1294a(i);
        mo1303c(i2);
        mo1294a(a);
    }

    /* renamed from: a */
    public void mo1302a(long j) {
        write((int) (byte) ((int) ((j >> 0) & 255)));
        write((int) (byte) ((int) ((j >> 8) & 255)));
        write((int) (byte) ((int) ((j >> 16) & 255)));
        write((int) (byte) ((int) ((j >> 24) & 255)));
        write((int) (byte) ((int) ((j >> 32) & 255)));
        write((int) (byte) ((int) ((j >> 40) & 255)));
        write((int) (byte) ((int) ((j >> 48) & 255)));
        write((int) (byte) ((int) ((j >> 56) & 255)));
    }

    /* renamed from: a */
    public void mo1300a(double d) {
        mo1302a(Double.doubleToRawLongBits(d));
    }

    public String toString() {
        return getClass().getName() + " size: " + mo1295b() + " pos: " + mo1292a();
    }
}
