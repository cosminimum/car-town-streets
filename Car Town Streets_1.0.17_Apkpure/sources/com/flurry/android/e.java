package com.flurry.android;

import java.io.DataInput;
/* loaded from: classes.dex */
final class e extends aj {
    String a;
    byte b;
    byte c;
    c d;

    e() {
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public e(DataInput dataInput) {
        this.a = dataInput.readUTF();
        this.b = dataInput.readByte();
        this.c = dataInput.readByte();
    }

    public final String toString() {
        return "{name: " + this.a + ", blockId: " + ((int) this.b) + ", themeId: " + ((int) this.c);
    }
}
