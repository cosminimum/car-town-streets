package com.google.android.gms.internal;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.UUID;

/* renamed from: com.google.android.gms.internal.ck */
public final class C0990ck {

    /* renamed from: hC */
    private static final Object f2393hC = new Object();

    /* renamed from: iu */
    public static final String f2394iu;

    /* renamed from: iv */
    private static BigInteger f2395iv = BigInteger.ONE;

    static {
        UUID randomUUID = UUID.randomUUID();
        byte[] byteArray = BigInteger.valueOf(randomUUID.getLeastSignificantBits()).toByteArray();
        byte[] byteArray2 = BigInteger.valueOf(randomUUID.getMostSignificantBits()).toByteArray();
        String bigInteger = new BigInteger(1, byteArray).toString();
        for (int i = 0; i < 2; i++) {
            try {
                MessageDigest instance = MessageDigest.getInstance("MD5");
                instance.update(byteArray);
                instance.update(byteArray2);
                byte[] bArr = new byte[8];
                System.arraycopy(instance.digest(), 0, bArr, 0, 8);
                bigInteger = new BigInteger(1, bArr).toString();
            } catch (NoSuchAlgorithmException e) {
            }
        }
        f2394iu = bigInteger;
    }

    /* renamed from: ar */
    public static String m2162ar() {
        String bigInteger;
        synchronized (f2393hC) {
            bigInteger = f2395iv.toString();
            f2395iv.add(BigInteger.ONE);
        }
        return bigInteger;
    }
}
