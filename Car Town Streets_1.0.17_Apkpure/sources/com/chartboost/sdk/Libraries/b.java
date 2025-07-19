package com.chartboost.sdk.Libraries;

import com.getjar.sdk.utilities.Constants;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Locale;
/* loaded from: classes.dex */
public class b {
    public static byte[] a(byte[] bArr) {
        if (bArr != null) {
            try {
                MessageDigest messageDigest = MessageDigest.getInstance("SHA-1");
                messageDigest.update(bArr);
                return messageDigest.digest();
            } catch (NoSuchAlgorithmException e) {
                return null;
            }
        }
        return null;
    }

    public static String b(byte[] bArr) {
        if (bArr == null) {
            return null;
        }
        return String.format(Locale.US, "%0" + (bArr.length << 1) + Constants.X, new BigInteger(1, bArr));
    }
}
