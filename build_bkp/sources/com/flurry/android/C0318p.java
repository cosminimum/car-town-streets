package com.flurry.android;

import java.io.DataOutput;
import java.util.ArrayList;
import java.util.List;

/* renamed from: com.flurry.android.p */
final class C0318p {

    /* renamed from: a */
    final String f609a;

    /* renamed from: b */
    C0324v f610b;

    /* renamed from: c */
    long f611c;

    /* renamed from: d */
    List f612d = new ArrayList();

    /* renamed from: e */
    private byte f613e;

    C0318p(String str, byte b, long j) {
        this.f609a = str;
        this.f613e = b;
        this.f612d.add(new C0308f((byte) 1, j));
    }

    /* access modifiers changed from: package-private */
    /* renamed from: a */
    public final void mo2419a(C0308f fVar) {
        this.f612d.add(fVar);
    }

    /* access modifiers changed from: package-private */
    /* renamed from: a */
    public final long mo2418a() {
        return ((C0308f) this.f612d.get(0)).f589b;
    }

    /* access modifiers changed from: package-private */
    /* renamed from: a */
    public final void mo2420a(DataOutput dataOutput) {
        dataOutput.writeUTF(this.f609a);
        dataOutput.writeByte(this.f613e);
        if (this.f610b == null) {
            dataOutput.writeLong(0);
            dataOutput.writeLong(0);
            dataOutput.writeByte(0);
        } else {
            dataOutput.writeLong(this.f610b.f643a);
            dataOutput.writeLong(this.f610b.f647e);
            byte[] bArr = this.f610b.f649g;
            dataOutput.writeByte(bArr.length);
            dataOutput.write(bArr);
        }
        dataOutput.writeShort(this.f612d.size());
        for (C0308f fVar : this.f612d) {
            dataOutput.writeByte(fVar.f588a);
            dataOutput.writeLong(fVar.f589b);
        }
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("{hook: " + this.f609a + ", ad: " + this.f610b.f646d + ", transitions: [");
        for (C0308f append : this.f612d) {
            sb.append(append);
            sb.append(",");
        }
        sb.append("]}");
        return sb.toString();
    }
}
