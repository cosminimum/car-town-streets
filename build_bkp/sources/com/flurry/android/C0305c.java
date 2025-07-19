package com.flurry.android;

import java.io.DataInput;
import java.io.DataOutput;

/* renamed from: com.flurry.android.c */
final class C0305c extends C0301aj {

    /* renamed from: A */
    private int f522A;

    /* renamed from: B */
    private int f523B;

    /* renamed from: C */
    private int f524C;

    /* renamed from: D */
    private int f525D;

    /* renamed from: E */
    private int f526E;

    /* renamed from: F */
    private int f527F;

    /* renamed from: G */
    private int f528G;

    /* renamed from: H */
    private int f529H;

    /* renamed from: I */
    private int f530I;

    /* renamed from: J */
    private int f531J;

    /* renamed from: K */
    private int f532K;

    /* renamed from: L */
    private int f533L;

    /* renamed from: M */
    private int f534M;

    /* renamed from: N */
    private int f535N;

    /* renamed from: O */
    private int f536O;

    /* renamed from: P */
    private int f537P;

    /* renamed from: Q */
    private int f538Q;

    /* renamed from: R */
    private int f539R;

    /* renamed from: S */
    private int f540S;

    /* renamed from: T */
    private int f541T;

    /* renamed from: U */
    private int f542U;

    /* renamed from: V */
    private int f543V;

    /* renamed from: W */
    private int f544W;

    /* renamed from: X */
    private int f545X;

    /* renamed from: Y */
    private int f546Y;

    /* renamed from: Z */
    private int f547Z;

    /* renamed from: a */
    byte f548a;

    /* renamed from: aa */
    private int f549aa;

    /* renamed from: ab */
    private int f550ab;

    /* renamed from: ac */
    private int f551ac;

    /* renamed from: ad */
    private int f552ad;

    /* renamed from: ae */
    private int f553ae;

    /* renamed from: af */
    private int f554af;

    /* renamed from: ag */
    private boolean f555ag;

    /* renamed from: b */
    String f556b;

    /* renamed from: c */
    long f557c;

    /* renamed from: d */
    String f558d;

    /* renamed from: e */
    int f559e;

    /* renamed from: f */
    int f560f;

    /* renamed from: g */
    String f561g;

    /* renamed from: h */
    int f562h;

    /* renamed from: i */
    int f563i;

    /* renamed from: j */
    String f564j;

    /* renamed from: k */
    int f565k;

    /* renamed from: l */
    int f566l;

    /* renamed from: m */
    int f567m;

    /* renamed from: n */
    int f568n;

    /* renamed from: o */
    int f569o;

    /* renamed from: p */
    int f570p;

    /* renamed from: q */
    int f571q;

    /* renamed from: r */
    private long f572r;

    /* renamed from: s */
    private String f573s;

    /* renamed from: t */
    private int f574t;

    /* renamed from: u */
    private int f575u;

    /* renamed from: v */
    private String f576v;

    /* renamed from: w */
    private int f577w;

    /* renamed from: x */
    private int f578x;

    /* renamed from: y */
    private String f579y;

    /* renamed from: z */
    private int f580z;

    C0305c() {
    }

    C0305c(DataInput dataInput) {
        m544c(dataInput);
    }

    /* renamed from: c */
    private void m544c(DataInput dataInput) {
        this.f548a = dataInput.readByte();
        this.f556b = dataInput.readUTF();
        this.f557c = dataInput.readLong();
        this.f572r = dataInput.readLong();
        this.f558d = dataInput.readUTF();
        this.f559e = dataInput.readUnsignedShort();
        this.f560f = dataInput.readInt();
        this.f561g = dataInput.readUTF();
        this.f562h = dataInput.readUnsignedShort();
        this.f563i = dataInput.readInt();
        this.f564j = dataInput.readUTF();
        this.f565k = dataInput.readUnsignedShort();
        this.f566l = dataInput.readInt();
    }

    /* access modifiers changed from: package-private */
    /* renamed from: a */
    public final void mo2400a(DataInput dataInput) {
        this.f573s = dataInput.readUTF();
        this.f574t = dataInput.readUnsignedShort();
        this.f575u = dataInput.readInt();
        this.f576v = dataInput.readUTF();
        this.f577w = dataInput.readUnsignedShort();
        this.f578x = dataInput.readInt();
        this.f579y = dataInput.readUTF();
        this.f580z = dataInput.readUnsignedShort();
        this.f522A = dataInput.readInt();
        this.f523B = dataInput.readInt();
        this.f524C = dataInput.readInt();
        this.f567m = dataInput.readInt();
        this.f568n = dataInput.readInt();
        this.f569o = dataInput.readInt();
        this.f570p = dataInput.readInt();
        this.f525D = dataInput.readInt();
        this.f526E = dataInput.readInt();
        this.f527F = dataInput.readInt();
        this.f528G = dataInput.readInt();
        this.f529H = dataInput.readInt();
        this.f530I = dataInput.readInt();
        this.f531J = dataInput.readInt();
        this.f532K = dataInput.readInt();
        this.f571q = dataInput.readInt();
        this.f533L = dataInput.readInt();
        this.f534M = dataInput.readInt();
        this.f535N = dataInput.readInt();
        this.f536O = dataInput.readInt();
        this.f537P = dataInput.readInt();
        this.f538Q = dataInput.readInt();
        this.f539R = dataInput.readInt();
        this.f540S = dataInput.readInt();
        this.f541T = dataInput.readInt();
        this.f542U = dataInput.readInt();
        this.f543V = dataInput.readInt();
        this.f544W = dataInput.readInt();
        this.f545X = dataInput.readInt();
        this.f546Y = dataInput.readInt();
        this.f547Z = dataInput.readInt();
        this.f549aa = dataInput.readInt();
        this.f550ab = dataInput.readInt();
        this.f551ac = dataInput.readInt();
        this.f552ad = dataInput.readInt();
        this.f553ae = dataInput.readInt();
        this.f554af = dataInput.readInt();
        this.f555ag = true;
    }

    /* access modifiers changed from: package-private */
    /* renamed from: b */
    public final void mo2402b(DataInput dataInput) {
        m544c(dataInput);
        this.f555ag = dataInput.readBoolean();
        if (this.f555ag) {
            mo2400a(dataInput);
        }
    }

    /* access modifiers changed from: package-private */
    /* renamed from: a */
    public final void mo2401a(DataOutput dataOutput) {
        dataOutput.writeByte(this.f548a);
        dataOutput.writeUTF(this.f556b);
        dataOutput.writeLong(this.f557c);
        dataOutput.writeLong(this.f572r);
        dataOutput.writeUTF(this.f558d);
        dataOutput.writeShort(this.f559e);
        dataOutput.writeInt(this.f560f);
        dataOutput.writeUTF(this.f561g);
        dataOutput.writeShort(this.f562h);
        dataOutput.writeInt(this.f563i);
        dataOutput.writeUTF(this.f564j);
        dataOutput.writeShort(this.f565k);
        dataOutput.writeInt(this.f566l);
        dataOutput.writeBoolean(this.f555ag);
        if (this.f555ag) {
            dataOutput.writeUTF(this.f573s);
            dataOutput.writeShort(this.f574t);
            dataOutput.writeInt(this.f575u);
            dataOutput.writeUTF(this.f576v);
            dataOutput.writeShort(this.f577w);
            dataOutput.writeInt(this.f578x);
            dataOutput.writeUTF(this.f579y);
            dataOutput.writeShort(this.f580z);
            dataOutput.writeInt(this.f522A);
            dataOutput.writeInt(this.f523B);
            dataOutput.writeInt(this.f524C);
            dataOutput.writeInt(this.f567m);
            dataOutput.writeInt(this.f568n);
            dataOutput.writeInt(this.f569o);
            dataOutput.writeInt(this.f570p);
            dataOutput.writeInt(this.f525D);
            dataOutput.writeInt(this.f526E);
            dataOutput.writeInt(this.f527F);
            dataOutput.writeInt(this.f528G);
            dataOutput.writeInt(this.f529H);
            dataOutput.writeInt(this.f530I);
            dataOutput.writeInt(this.f531J);
            dataOutput.writeInt(this.f532K);
            dataOutput.writeInt(this.f571q);
            dataOutput.writeInt(this.f533L);
            dataOutput.writeInt(this.f534M);
            dataOutput.writeInt(this.f535N);
            dataOutput.writeInt(this.f536O);
            dataOutput.writeInt(this.f537P);
            dataOutput.writeInt(this.f538Q);
            dataOutput.writeInt(this.f539R);
            dataOutput.writeInt(this.f540S);
            dataOutput.writeInt(this.f541T);
            dataOutput.writeInt(this.f542U);
            dataOutput.writeInt(this.f543V);
            dataOutput.writeInt(this.f544W);
            dataOutput.writeInt(this.f545X);
            dataOutput.writeInt(this.f546Y);
            dataOutput.writeInt(this.f547Z);
            dataOutput.writeInt(this.f549aa);
            dataOutput.writeInt(this.f550ab);
            dataOutput.writeInt(this.f551ac);
            dataOutput.writeInt(this.f552ad);
            dataOutput.writeInt(this.f553ae);
            dataOutput.writeInt(this.f554af);
        }
    }
}
