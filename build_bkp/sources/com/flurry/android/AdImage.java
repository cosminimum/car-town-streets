package com.flurry.android;

import java.io.DataInput;

public final class AdImage extends C0301aj {

    /* renamed from: a */
    long f404a;

    /* renamed from: b */
    int f405b;

    /* renamed from: c */
    int f406c;

    /* renamed from: d */
    String f407d;

    /* renamed from: e */
    byte[] f408e;

    AdImage() {
    }

    AdImage(DataInput dataInput) {
        mo2337a(dataInput);
    }

    public final long getId() {
        return this.f404a;
    }

    public final int getWidth() {
        return this.f405b;
    }

    public final int getHeight() {
        return this.f406c;
    }

    public final String getMimeType() {
        return this.f407d;
    }

    public final byte[] getImageData() {
        return this.f408e;
    }

    /* access modifiers changed from: package-private */
    /* renamed from: a */
    public final void mo2337a(DataInput dataInput) {
        this.f404a = dataInput.readLong();
        this.f405b = dataInput.readInt();
        this.f406c = dataInput.readInt();
        this.f407d = dataInput.readUTF();
        this.f408e = new byte[dataInput.readInt()];
        dataInput.readFully(this.f408e);
    }
}
