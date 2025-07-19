package com.chartboost.sdk.impl;

import com.flurry.android.Constants;
import java.io.Serializable;
import java.lang.management.ManagementFactory;
import java.net.NetworkInterface;
import java.nio.ByteBuffer;
import java.util.Enumeration;
import java.util.Random;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.logging.Level;
import java.util.logging.Logger;

/* renamed from: com.chartboost.sdk.impl.ay */
public class C0126ay implements Serializable, Comparable<C0126ay> {

    /* renamed from: a */
    static final Logger f183a = Logger.getLogger("org.bson.ObjectId");

    /* renamed from: f */
    private static AtomicInteger f184f = new AtomicInteger(new Random().nextInt());

    /* renamed from: g */
    private static final int f185g;

    /* renamed from: b */
    final int f186b;

    /* renamed from: c */
    final int f187c;

    /* renamed from: d */
    final int f188d;

    /* renamed from: e */
    boolean f189e;

    static {
        int i;
        int i2;
        int i3;
        try {
            StringBuilder sb = new StringBuilder();
            Enumeration<NetworkInterface> networkInterfaces = NetworkInterface.getNetworkInterfaces();
            while (networkInterfaces.hasMoreElements()) {
                sb.append(networkInterfaces.nextElement().toString());
            }
            i = sb.toString().hashCode() << 16;
        } catch (Throwable th) {
            try {
                f183a.log(Level.WARNING, th.getMessage(), th);
                i = new Random().nextInt() << 16;
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }
        f183a.fine("machine piece post: " + Integer.toHexString(i));
        int nextInt = new Random().nextInt();
        try {
            i3 = ManagementFactory.getRuntimeMXBean().getName().hashCode();
        } catch (Throwable th2) {
            i3 = i2;
        }
        ClassLoader classLoader = C0126ay.class.getClassLoader();
        int identityHashCode = classLoader != null ? System.identityHashCode(classLoader) : 0;
        int hashCode = (Integer.toHexString(i3) + Integer.toHexString(identityHashCode)).hashCode() & 65535;
        f183a.fine(new StringBuilder().append("process piece: ").append(Integer.toHexString(hashCode)).toString());
        f185g = hashCode | i;
        f183a.fine(new StringBuilder().append("machine : ").append(Integer.toHexString(f185g)).toString());
    }

    /* renamed from: a */
    public static boolean m260a(String str) {
        int length;
        if (str == null || (length = str.length()) != 24) {
            return false;
        }
        for (int i = 0; i < length; i++) {
            char charAt = str.charAt(i);
            if ((charAt < '0' || charAt > '9') && ((charAt < 'a' || charAt > 'f') && (charAt < 'A' || charAt > 'F'))) {
                return false;
            }
        }
        return true;
    }

    /* renamed from: a */
    public static C0126ay m258a(Object obj) {
        if (obj == null) {
            return null;
        }
        if (obj instanceof C0126ay) {
            return (C0126ay) obj;
        }
        if (obj instanceof String) {
            String obj2 = obj.toString();
            if (m260a(obj2)) {
                return new C0126ay(obj2);
            }
        }
        return null;
    }

    public C0126ay(String str) {
        this(str, false);
    }

    public C0126ay(String str, boolean z) {
        if (!m260a(str)) {
            throw new IllegalArgumentException("invalid ObjectId [" + str + "]");
        }
        str = z ? m261b(str) : str;
        byte[] bArr = new byte[12];
        for (int i = 0; i < bArr.length; i++) {
            bArr[i] = (byte) Integer.parseInt(str.substring(i * 2, (i * 2) + 2), 16);
        }
        ByteBuffer wrap = ByteBuffer.wrap(bArr);
        this.f186b = wrap.getInt();
        this.f187c = wrap.getInt();
        this.f188d = wrap.getInt();
        this.f189e = false;
    }

    public C0126ay(int i, int i2, int i3) {
        this.f186b = i;
        this.f187c = i2;
        this.f188d = i3;
        this.f189e = false;
    }

    public C0126ay() {
        this.f186b = (int) (System.currentTimeMillis() / 1000);
        this.f187c = f185g;
        this.f188d = f184f.getAndIncrement();
        this.f189e = true;
    }

    public int hashCode() {
        return this.f186b + (this.f187c * 111) + (this.f188d * 17);
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        C0126ay a = m258a(o);
        if (a == null) {
            return false;
        }
        if (this.f186b == a.f186b && this.f187c == a.f187c && this.f188d == a.f188d) {
            return true;
        }
        return false;
    }

    /* renamed from: a */
    public String mo1345a() {
        byte[] b = mo1346b();
        StringBuilder sb = new StringBuilder(24);
        for (byte b2 : b) {
            String hexString = Integer.toHexString(b2 & Constants.UNKNOWN);
            if (hexString.length() == 1) {
                sb.append("0");
            }
            sb.append(hexString);
        }
        return sb.toString();
    }

    /* renamed from: b */
    public byte[] mo1346b() {
        byte[] bArr = new byte[12];
        ByteBuffer wrap = ByteBuffer.wrap(bArr);
        wrap.putInt(this.f186b);
        wrap.putInt(this.f187c);
        wrap.putInt(this.f188d);
        return bArr;
    }

    /* renamed from: a */
    static String m259a(String str, int i) {
        return str.substring(i * 2, (i * 2) + 2);
    }

    /* renamed from: b */
    public static String m261b(String str) {
        if (!m260a(str)) {
            throw new IllegalArgumentException("invalid object id: " + str);
        }
        StringBuilder sb = new StringBuilder(24);
        for (int i = 7; i >= 0; i--) {
            sb.append(m259a(str, i));
        }
        for (int i2 = 11; i2 >= 8; i2--) {
            sb.append(m259a(str, i2));
        }
        return sb.toString();
    }

    public String toString() {
        return mo1345a();
    }

    /* access modifiers changed from: package-private */
    /* renamed from: a */
    public int mo1343a(int i, int i2) {
        long j = (((long) i) & 4294967295L) - (((long) i2) & 4294967295L);
        if (j < -2147483648L) {
            return Integer.MIN_VALUE;
        }
        if (j > 2147483647L) {
            return Integer.MAX_VALUE;
        }
        return (int) j;
    }

    /* renamed from: a */
    public int compareTo(C0126ay ayVar) {
        if (ayVar == null) {
            return -1;
        }
        int a = mo1343a(this.f186b, ayVar.f186b);
        if (a != 0) {
            return a;
        }
        int a2 = mo1343a(this.f187c, ayVar.f187c);
        return a2 == 0 ? mo1343a(this.f188d, ayVar.f188d) : a2;
    }

    /* renamed from: c */
    public int mo1347c() {
        return this.f186b;
    }

    /* renamed from: d */
    public int mo1349d() {
        return this.f187c;
    }

    /* renamed from: e */
    public int mo1350e() {
        return this.f188d;
    }
}
