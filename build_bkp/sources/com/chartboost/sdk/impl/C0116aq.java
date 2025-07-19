package com.chartboost.sdk.impl;

import android.support.p000v4.view.MotionEventCompat;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

/* renamed from: com.chartboost.sdk.impl.aq */
public class C0116aq extends C0115ap {

    /* renamed from: g */
    private static C0161bh<byte[]> f166g = new C0161bh<byte[]>(640) {
        /* access modifiers changed from: protected */
        /* renamed from: a */
        public byte[] mo1313b() {
            return new byte[16384];
        }
    };

    /* renamed from: a */
    final byte[] f167a = new byte[16384];

    /* renamed from: b */
    final char[] f168b = new char[16384];

    /* renamed from: c */
    final List<byte[]> f169c = new ArrayList();

    /* renamed from: d */
    final C0119ar f170d = new C0119ar();

    /* renamed from: e */
    private final C0118a f171e = new C0118a();

    /* renamed from: f */
    private final C0118a f172f = new C0118a();

    public C0116aq() {
        mo1308d();
    }

    /* renamed from: d */
    public void mo1308d() {
        this.f171e.mo1314a();
        this.f172f.mo1314a();
        for (int i = 0; i < this.f169c.size(); i++) {
            f166g.mo1435b(this.f169c.get(i));
        }
        this.f169c.clear();
    }

    /* renamed from: a */
    public int mo1292a() {
        return this.f171e.mo1317b();
    }

    /* renamed from: a */
    public void mo1294a(int i) {
        this.f171e.mo1315a(i);
    }

    /* renamed from: b */
    public int mo1295b() {
        return this.f172f.mo1317b();
    }

    public void write(byte[] b) {
        write(b, 0, b.length);
    }

    public void write(byte[] b, int off, int len) {
        while (len > 0) {
            byte[] f = mo1310f();
            int min = Math.min(f.length - this.f171e.f174b, len);
            System.arraycopy(b, off, f, this.f171e.f174b, min);
            this.f171e.mo1318b(min);
            len -= min;
            off += min;
            mo1309e();
        }
    }

    public void write(int b) {
        mo1310f()[this.f171e.mo1319c()] = (byte) (b & MotionEventCompat.ACTION_MASK);
        mo1309e();
    }

    /* access modifiers changed from: package-private */
    /* renamed from: e */
    public void mo1309e() {
        if (this.f171e.mo1317b() >= this.f172f.mo1317b()) {
            this.f172f.mo1316a(this.f171e);
            if (this.f172f.f174b >= 16384) {
                this.f169c.add(f166g.mo1436c());
                this.f172f.mo1321d();
                this.f171e.mo1316a(this.f172f);
            }
        } else if (this.f171e.f174b == 16384) {
            this.f171e.mo1321d();
        }
    }

    /* access modifiers changed from: package-private */
    /* renamed from: f */
    public byte[] mo1310f() {
        return mo1307b(this.f171e.f173a);
    }

    /* access modifiers changed from: package-private */
    /* renamed from: b */
    public byte[] mo1307b(int i) {
        if (i < 0) {
            return this.f167a;
        }
        return this.f169c.get(i);
    }

    /* renamed from: a */
    public int mo1293a(OutputStream outputStream) throws IOException {
        if (outputStream == null) {
            throw new NullPointerException("out is null");
        }
        int i = 0;
        for (int i2 = -1; i2 < this.f169c.size(); i2++) {
            byte[] b = mo1307b(i2);
            int c = this.f172f.mo1320c(i2);
            outputStream.write(b, 0, c);
            i += c;
        }
        return i;
    }

    /* renamed from: com.chartboost.sdk.impl.aq$a */
    static class C0118a {

        /* renamed from: a */
        int f173a;

        /* renamed from: b */
        int f174b;

        C0118a() {
            mo1314a();
        }

        /* access modifiers changed from: package-private */
        /* renamed from: a */
        public void mo1314a() {
            this.f173a = -1;
            this.f174b = 0;
        }

        /* access modifiers changed from: package-private */
        /* renamed from: a */
        public void mo1316a(C0118a aVar) {
            this.f173a = aVar.f173a;
            this.f174b = aVar.f174b;
        }

        /* access modifiers changed from: package-private */
        /* renamed from: a */
        public void mo1315a(int i) {
            this.f173a = (i / 16384) - 1;
            this.f174b = i % 16384;
        }

        /* access modifiers changed from: package-private */
        /* renamed from: b */
        public int mo1317b() {
            return ((this.f173a + 1) * 16384) + this.f174b;
        }

        /* access modifiers changed from: package-private */
        /* renamed from: c */
        public int mo1319c() {
            int i = this.f174b;
            this.f174b = i + 1;
            return i;
        }

        /* access modifiers changed from: package-private */
        /* renamed from: b */
        public void mo1318b(int i) {
            this.f174b += i;
            if (this.f174b > 16384) {
                throw new IllegalArgumentException("something is wrong");
            }
        }

        /* access modifiers changed from: package-private */
        /* renamed from: d */
        public void mo1321d() {
            if (this.f174b != 16384) {
                throw new IllegalArgumentException("broken");
            }
            this.f173a++;
            this.f174b = 0;
        }

        /* access modifiers changed from: package-private */
        /* renamed from: c */
        public int mo1320c(int i) {
            if (i < this.f173a) {
                return 16384;
            }
            return this.f174b;
        }

        public String toString() {
            return this.f173a + "," + this.f174b;
        }
    }
}
