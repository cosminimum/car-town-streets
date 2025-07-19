package com.flurry.android;

import java.io.DataInput;

/* renamed from: com.flurry.android.e */
final class C0307e extends C0301aj {

    /* renamed from: a */
    String f584a;

    /* renamed from: b */
    byte f585b;

    /* renamed from: c */
    byte f586c;

    /* renamed from: d */
    C0305c f587d;

    C0307e() {
    }

    C0307e(DataInput dataInput) {
        this.f584a = dataInput.readUTF();
        this.f585b = dataInput.readByte();
        this.f586c = dataInput.readByte();
    }

    public final String toString() {
        return "{name: " + this.f584a + ", blockId: " + this.f585b + ", themeId: " + this.f586c;
    }
}
