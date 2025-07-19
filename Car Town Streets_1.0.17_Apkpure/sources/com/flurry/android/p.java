package com.flurry.android;

import java.io.DataOutput;
import java.util.ArrayList;
import java.util.List;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final class p {
    final String a;
    v b;
    long c;
    List d = new ArrayList();
    private byte e;

    /* JADX INFO: Access modifiers changed from: package-private */
    public p(String str, byte b, long j) {
        this.a = str;
        this.e = b;
        this.d.add(new f((byte) 1, j));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final void a(f fVar) {
        this.d.add(fVar);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final long a() {
        return ((f) this.d.get(0)).b;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final void a(DataOutput dataOutput) {
        dataOutput.writeUTF(this.a);
        dataOutput.writeByte(this.e);
        if (this.b == null) {
            dataOutput.writeLong(0L);
            dataOutput.writeLong(0L);
            dataOutput.writeByte(0);
        } else {
            dataOutput.writeLong(this.b.a);
            dataOutput.writeLong(this.b.e);
            byte[] bArr = this.b.g;
            dataOutput.writeByte(bArr.length);
            dataOutput.write(bArr);
        }
        dataOutput.writeShort(this.d.size());
        for (f fVar : this.d) {
            dataOutput.writeByte(fVar.a);
            dataOutput.writeLong(fVar.b);
        }
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("{hook: " + this.a + ", ad: " + this.b.d + ", transitions: [");
        for (f fVar : this.d) {
            sb.append(fVar);
            sb.append(",");
        }
        sb.append("]}");
        return sb.toString();
    }
}
