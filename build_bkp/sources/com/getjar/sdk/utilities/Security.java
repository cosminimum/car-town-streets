package com.getjar.sdk.utilities;

import android.content.Context;
import com.getjar.sdk.data.GooglePurchaseResponse;
import com.getjar.sdk.exceptions.SigningException;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import com.getjar.sdk.utilities.Constants;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.InvalidKeyException;
import java.security.KeyFactory;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.PublicKey;
import java.security.SecureRandom;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.X509EncodedKeySpec;
import java.util.ArrayList;
import java.util.Locale;
import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class Security {
    private static final String KEY_FACTORY_ALGORITHM = "RSA";
    private static final SecureRandom RANDOM = new SecureRandom();
    private static long knownNonce;

    public static long generateNonce() {
        knownNonce = RANDOM.nextLong();
        return knownNonce;
    }

    public static ArrayList<GooglePurchaseResponse> getPurchaseDetails(String signedData, String signature, Context context) {
        if (signedData == null) {
            Logger.m642e(Area.BUY_GOLD.value(), "data is null");
            return null;
        } else if (context == null) {
            throw new IllegalArgumentException("context cannot be null");
        } else {
            int numTransactions = 0;
            try {
                JSONObject jObject = new JSONObject(signedData);
                Logger.m648w(Area.BUY_GOLD.value(), String.format(Locale.US, "JSONData: %1$s", new Object[]{jObject.toString()}));
                JSONArray jTransactionsArray = jObject.optJSONArray("orders");
                if (jTransactionsArray != null) {
                    numTransactions = jTransactionsArray.length();
                }
                ArrayList<GooglePurchaseResponse> purchases = new ArrayList<>();
                int i = 0;
                while (i < numTransactions) {
                    try {
                        JSONObject jElement = jTransactionsArray.getJSONObject(i);
                        Constants.PurchaseState purchaseState = Constants.PurchaseState.valueOf(jElement.getInt("purchaseState"));
                        String productId = jElement.getString("productId");
                        String orderId = jElement.optString("orderId", "");
                        String notifyId = null;
                        if (jElement.has("notificationId")) {
                            notifyId = jElement.getString("notificationId");
                        }
                        String developerPayload = jElement.optString("developerPayload", (String) null);
                        if (purchaseState == Constants.PurchaseState.PURCHASED) {
                            purchases.add(new GooglePurchaseResponse(notifyId, orderId, productId, (short) purchaseState.ordinal(), developerPayload, signedData, signature));
                        }
                        i++;
                    } catch (JSONException e) {
                        Logger.m643e(Area.BUY_GOLD.value(), "JSON exception: ", e);
                        return null;
                    }
                }
                return purchases;
            } catch (JSONException e2) {
                return null;
            }
        }
    }

    public static PublicKey generatePublicKey(byte[] decodedKey) {
        try {
            return KeyFactory.getInstance(KEY_FACTORY_ALGORITHM).generatePublic(new X509EncodedKeySpec(decodedKey));
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        } catch (InvalidKeySpecException e2) {
            Logger.m642e(Area.AUTH.value(), "Invalid key specification.");
            throw new IllegalArgumentException(e2);
        }
    }

    public static String generateSignature(PublicKey publicKey, String data) {
        if (publicKey == null) {
            throw new SigningException("publicKey cannot be null. Please provide a public key while creating the GetJarContext");
        } else if (!StringUtility.isNullOrEmpty(data)) {
            return Base64.encodeBytes(sign(publicKey, data));
        } else {
            throw new IllegalArgumentException("data cannot be null");
        }
    }

    private static byte[] sign(PublicKey publicKey, String data) {
        if (publicKey == null) {
            throw new IllegalArgumentException("publicKey cannot be null");
        } else if (StringUtility.isNullOrEmpty(data)) {
            throw new IllegalArgumentException("data cannot be null");
        } else if (data == null) {
            return null;
        } else {
            try {
                byte[] hash = MessageDigest.getInstance(Constants.SIGNATURE_DIGEST).digest(data.getBytes("UTF-8"));
                Cipher cipher = Cipher.getInstance(Constants.SIGNATURE_CIPHER);
                cipher.init(1, publicKey);
                return cipher.doFinal(hash);
            } catch (NoSuchAlgorithmException e) {
                throw new SigningException("The RSA algorithm is unavailable, failed to do licensing");
            } catch (NoSuchPaddingException e2) {
                throw new SigningException("The RSA algorithm is unavailable, failed to do licensing.");
            } catch (InvalidKeyException e3) {
                throw new SigningException("The private key was invalid, failed to do licensing.");
            } catch (IllegalBlockSizeException e4) {
                throw new SigningException("Unable to create the signature, failed to do licensing.");
            } catch (BadPaddingException e5) {
                throw new SigningException("Unable to create the signature, failed to do licensing.");
            } catch (UnsupportedEncodingException e6) {
                throw new SigningException("Unable to create the signature, failed to do licensing.");
            }
        }
    }

    public static boolean verifySignature(PublicKey publicKey, String signedData, String signature) {
        boolean result = false;
        if (publicKey == null) {
            throw new IllegalArgumentException("publicKey cannot be null");
        } else if (StringUtility.isNullOrEmpty(signedData)) {
            throw new IllegalArgumentException("signedData cannot be null");
        } else if (StringUtility.isNullOrEmpty(signature)) {
            throw new IllegalArgumentException("signature cannot be null");
        } else {
            try {
                byte[] hash = MessageDigest.getInstance(Constants.SIGNATURE_DIGEST).digest(signedData.getBytes("UTF-8"));
                Cipher cipher = Cipher.getInstance(Constants.SIGNATURE_CIPHER);
                cipher.init(2, publicKey);
                byte[] decryptedHash = cipher.doFinal(Base64.decode(signature));
                if (decryptedHash == null) {
                    throw new SigningException("Unable to do Licensing. Signing failed");
                }
                if (hash.length == decryptedHash.length) {
                    int i = 0;
                    while (i < hash.length && hash[i] == decryptedHash[i]) {
                        if (i == hash.length - 1) {
                            result = true;
                        }
                        i++;
                    }
                }
                return result;
            } catch (NoSuchAlgorithmException e) {
                throw new SigningException("The RSA algorithm is unavailable, failed to do licensing");
            } catch (NoSuchPaddingException e2) {
                throw new SigningException("The RSA algorithm is unavailable, failed to do licensing.");
            } catch (InvalidKeyException e3) {
                throw new SigningException("The public key was invalid, failed to do licensing.");
            } catch (IllegalBlockSizeException e4) {
                throw new SigningException("The public key was invalid, failed to do licensing.");
            } catch (BadPaddingException e5) {
                throw new SigningException("The public key was invalid, failed to do licensing.");
            } catch (UnsupportedEncodingException e6) {
                throw new SigningException("The UTF-8 encoding is unavailable, failed to do licensing.");
            } catch (IOException e7) {
                throw new SigningException("Signing failed. Unable to do licensing");
            }
        }
    }
}
