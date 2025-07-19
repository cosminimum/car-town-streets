package com.getjar.sdk.utilities;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public final class CryptoUtility {
    private CryptoUtility() {
    }

    public static String getSHA256(String input) throws NoSuchAlgorithmException, UnsupportedEncodingException {
        if (StringUtility.isNullOrEmpty(input)) {
            throw new IllegalArgumentException("'input' cannot be NULL or empty");
        }
        MessageDigest digest = MessageDigest.getInstance("SHA-256");
        digest.reset();
        return Base64.encodeBytes(digest.digest(input.getBytes("UTF-8")));
    }
}
