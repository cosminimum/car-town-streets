package com.getjar.sdk.utilities;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
/* loaded from: classes.dex */
public final class CryptoUtility {
    private CryptoUtility() {
    }

    public static String getSHA256(String input) throws NoSuchAlgorithmException, UnsupportedEncodingException {
        if (StringUtility.isNullOrEmpty(input)) {
            throw new IllegalArgumentException("'input' cannot be NULL or empty");
        }
        MessageDigest digest = MessageDigest.getInstance("SHA-256");
        digest.reset();
        byte[] byteData = digest.digest(input.getBytes("UTF-8"));
        return Base64.encodeBytes(byteData);
    }
}
