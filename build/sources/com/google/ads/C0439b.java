package com.google.ads;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.UUID;

/* renamed from: com.google.ads.b */
public class C0439b {

    /* renamed from: c */
    private static C0439b f750c = null;

    /* renamed from: a */
    private final BigInteger f751a = m702d();

    /* renamed from: b */
    private BigInteger f752b = BigInteger.ONE;

    /* renamed from: a */
    public static synchronized C0439b m700a() {
        C0439b bVar;
        synchronized (C0439b.class) {
            if (f750c == null) {
                f750c = new C0439b();
            }
            bVar = f750c;
        }
        return bVar;
    }

    /* renamed from: b */
    public synchronized BigInteger mo3545b() {
        return this.f751a;
    }

    /* renamed from: c */
    public synchronized BigInteger mo3546c() {
        BigInteger bigInteger;
        bigInteger = this.f752b;
        this.f752b = this.f752b.add(BigInteger.ONE);
        return bigInteger;
    }

    private C0439b() {
    }

    /* renamed from: d */
    private static BigInteger m702d() {
        try {
            MessageDigest instance = MessageDigest.getInstance("MD5");
            UUID randomUUID = UUID.randomUUID();
            instance.update(m701a(randomUUID.getLeastSignificantBits()));
            instance.update(m701a(randomUUID.getMostSignificantBits()));
            byte[] bArr = new byte[9];
            bArr[0] = 0;
            System.arraycopy(instance.digest(), 0, bArr, 1, 8);
            return new BigInteger(bArr);
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("Cannot find MD5 message digest algorithm.");
        }
    }

    /* renamed from: a */
    private static byte[] m701a(long j) {
        return BigInteger.valueOf(j).toByteArray();
    }
}
