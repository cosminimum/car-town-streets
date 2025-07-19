.class public Lcom/getjar/sdk/utilities/Security;
.super Ljava/lang/Object;
.source "Security.java"


# static fields
.field private static final KEY_FACTORY_ALGORITHM:Ljava/lang/String; = "RSA"

.field private static final RANDOM:Ljava/security/SecureRandom;

.field private static knownNonce:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 43
    new-instance v0, Ljava/security/SecureRandom;

    invoke-direct {v0}, Ljava/security/SecureRandom;-><init>()V

    sput-object v0, Lcom/getjar/sdk/utilities/Security;->RANDOM:Ljava/security/SecureRandom;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static generateNonce()J
    .locals 2

    .prologue
    .line 56
    sget-object v0, Lcom/getjar/sdk/utilities/Security;->RANDOM:Ljava/security/SecureRandom;

    invoke-virtual {v0}, Ljava/security/SecureRandom;->nextLong()J

    move-result-wide v0

    sput-wide v0, Lcom/getjar/sdk/utilities/Security;->knownNonce:J

    .line 57
    sget-wide v0, Lcom/getjar/sdk/utilities/Security;->knownNonce:J

    return-wide v0
.end method

.method public static generatePublicKey([B)Ljava/security/PublicKey;
    .locals 5
    .param p0, "decodedKey"    # [B

    .prologue
    .line 127
    :try_start_0
    const-string v2, "RSA"

    invoke-static {v2}, Ljava/security/KeyFactory;->getInstance(Ljava/lang/String;)Ljava/security/KeyFactory;

    move-result-object v1

    .line 128
    .local v1, "keyFactory":Ljava/security/KeyFactory;
    new-instance v2, Ljava/security/spec/X509EncodedKeySpec;

    invoke-direct {v2, p0}, Ljava/security/spec/X509EncodedKeySpec;-><init>([B)V

    invoke-virtual {v1, v2}, Ljava/security/KeyFactory;->generatePublic(Ljava/security/spec/KeySpec;)Ljava/security/PublicKey;
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/security/spec/InvalidKeySpecException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v2

    return-object v2

    .line 129
    .end local v1    # "keyFactory":Ljava/security/KeyFactory;
    :catch_0
    move-exception v0

    .line 130
    .local v0, "e":Ljava/security/NoSuchAlgorithmException;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 131
    .end local v0    # "e":Ljava/security/NoSuchAlgorithmException;
    :catch_1
    move-exception v0

    .line 132
    .local v0, "e":Ljava/security/spec/InvalidKeySpecException;
    sget-object v2, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    const-string v4, "Invalid key specification."

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;)V

    .line 133
    new-instance v2, Ljava/lang/IllegalArgumentException;

    invoke-direct {v2, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method public static generateSignature(Ljava/security/PublicKey;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "publicKey"    # Ljava/security/PublicKey;
    .param p1, "data"    # Ljava/lang/String;

    .prologue
    .line 145
    if-nez p0, :cond_0

    new-instance v0, Lcom/getjar/sdk/exceptions/SigningException;

    const-string v1, "publicKey cannot be null. Please provide a public key while creating the GetJarContext"

    invoke-direct {v0, v1}, Lcom/getjar/sdk/exceptions/SigningException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 146
    :cond_0
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "data cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 148
    :cond_1
    invoke-static {p0, p1}, Lcom/getjar/sdk/utilities/Security;->sign(Ljava/security/PublicKey;Ljava/lang/String;)[B

    move-result-object v0

    invoke-static {v0}, Lcom/getjar/sdk/utilities/Base64;->encodeBytes([B)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getPurchaseDetails(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)Ljava/util/ArrayList;
    .locals 23
    .param p0, "signedData"    # Ljava/lang/String;
    .param p1, "signature"    # Ljava/lang/String;
    .param p2, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/getjar/sdk/data/GooglePurchaseResponse;",
            ">;"
        }
    .end annotation

    .prologue
    .line 68
    if-nez p0, :cond_1

    .line 69
    sget-object v6, Lcom/getjar/sdk/logging/Area;->BUY_GOLD:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v8

    const-string v6, "data is null"

    invoke-static {v8, v9, v6}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;)V

    .line 70
    const/16 v17, 0x0

    .line 115
    :cond_0
    :goto_0
    return-object v17

    .line 72
    :cond_1
    if-nez p2, :cond_2

    new-instance v6, Ljava/lang/IllegalArgumentException;

    const-string v8, "context cannot be null"

    invoke-direct {v6, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 75
    :cond_2
    const/4 v14, 0x0

    .line 76
    .local v14, "jTransactionsArray":Lorg/json/JSONArray;
    const/4 v15, 0x0

    .line 78
    .local v15, "numTransactions":I
    :try_start_0
    new-instance v13, Lorg/json/JSONObject;

    move-object/from16 v0, p0

    invoke-direct {v13, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 79
    .local v13, "jObject":Lorg/json/JSONObject;
    sget-object v6, Lcom/getjar/sdk/logging/Area;->BUY_GOLD:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v8

    sget-object v6, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v19, "JSONData: %1$s"

    const/16 v20, 0x1

    move/from16 v0, v20

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    invoke-virtual {v13}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v22

    aput-object v22, v20, v21

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-static {v6, v0, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v8, v9, v6}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;)V

    .line 81
    const-string v6, "orders"

    invoke-virtual {v13, v6}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v14

    .line 82
    if-eqz v14, :cond_3

    .line 83
    invoke-virtual {v14}, Lorg/json/JSONArray;->length()I
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v15

    .line 89
    :cond_3
    new-instance v17, Ljava/util/ArrayList;

    invoke-direct/range {v17 .. v17}, Ljava/util/ArrayList;-><init>()V

    .line 91
    .local v17, "purchases":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/getjar/sdk/data/GooglePurchaseResponse;>;"
    const/4 v11, 0x0

    .local v11, "i":I
    :goto_1
    if-ge v11, v15, :cond_0

    .line 92
    :try_start_1
    invoke-virtual {v14, v11}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v12

    .line 93
    .local v12, "jElement":Lorg/json/JSONObject;
    const-string v6, "purchaseState"

    invoke-virtual {v12, v6}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v18

    .line 94
    .local v18, "response":I
    invoke-static/range {v18 .. v18}, Lcom/getjar/sdk/utilities/Constants$PurchaseState;->valueOf(I)Lcom/getjar/sdk/utilities/Constants$PurchaseState;

    move-result-object v16

    .line 95
    .local v16, "purchaseState":Lcom/getjar/sdk/utilities/Constants$PurchaseState;
    const-string v6, "productId"

    invoke-virtual {v12, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 96
    .local v5, "productId":Ljava/lang/String;
    const-string v6, "orderId"

    const-string v8, ""

    invoke-virtual {v12, v6, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 97
    .local v4, "orderId":Ljava/lang/String;
    const/4 v3, 0x0

    .line 98
    .local v3, "notifyId":Ljava/lang/String;
    const-string v6, "notificationId"

    invoke-virtual {v12, v6}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 99
    const-string v6, "notificationId"

    invoke-virtual {v12, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 101
    :cond_4
    const-string v6, "developerPayload"

    const/4 v8, 0x0

    invoke-virtual {v12, v6, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 105
    .local v7, "developerPayload":Ljava/lang/String;
    sget-object v6, Lcom/getjar/sdk/utilities/Constants$PurchaseState;->PURCHASED:Lcom/getjar/sdk/utilities/Constants$PurchaseState;

    move-object/from16 v0, v16

    if-eq v0, v6, :cond_5

    .line 91
    :goto_2
    add-int/lit8 v11, v11, 0x1

    goto :goto_1

    .line 85
    .end local v3    # "notifyId":Ljava/lang/String;
    .end local v4    # "orderId":Ljava/lang/String;
    .end local v5    # "productId":Ljava/lang/String;
    .end local v7    # "developerPayload":Ljava/lang/String;
    .end local v11    # "i":I
    .end local v12    # "jElement":Lorg/json/JSONObject;
    .end local v13    # "jObject":Lorg/json/JSONObject;
    .end local v16    # "purchaseState":Lcom/getjar/sdk/utilities/Constants$PurchaseState;
    .end local v17    # "purchases":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/getjar/sdk/data/GooglePurchaseResponse;>;"
    .end local v18    # "response":I
    :catch_0
    move-exception v10

    .line 86
    .local v10, "e":Lorg/json/JSONException;
    const/16 v17, 0x0

    goto/16 :goto_0

    .line 108
    .end local v10    # "e":Lorg/json/JSONException;
    .restart local v3    # "notifyId":Ljava/lang/String;
    .restart local v4    # "orderId":Ljava/lang/String;
    .restart local v5    # "productId":Ljava/lang/String;
    .restart local v7    # "developerPayload":Ljava/lang/String;
    .restart local v11    # "i":I
    .restart local v12    # "jElement":Lorg/json/JSONObject;
    .restart local v13    # "jObject":Lorg/json/JSONObject;
    .restart local v16    # "purchaseState":Lcom/getjar/sdk/utilities/Constants$PurchaseState;
    .restart local v17    # "purchases":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/getjar/sdk/data/GooglePurchaseResponse;>;"
    .restart local v18    # "response":I
    :cond_5
    new-instance v2, Lcom/getjar/sdk/data/GooglePurchaseResponse;

    invoke-virtual/range {v16 .. v16}, Lcom/getjar/sdk/utilities/Constants$PurchaseState;->ordinal()I

    move-result v6

    int-to-short v6, v6

    move-object/from16 v8, p0

    move-object/from16 v9, p1

    invoke-direct/range {v2 .. v9}, Lcom/getjar/sdk/data/GooglePurchaseResponse;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;SLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 109
    .local v2, "resp":Lcom/getjar/sdk/data/GooglePurchaseResponse;
    move-object/from16 v0, v17

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_2

    .line 111
    .end local v2    # "resp":Lcom/getjar/sdk/data/GooglePurchaseResponse;
    .end local v3    # "notifyId":Ljava/lang/String;
    .end local v4    # "orderId":Ljava/lang/String;
    .end local v5    # "productId":Ljava/lang/String;
    .end local v7    # "developerPayload":Ljava/lang/String;
    .end local v12    # "jElement":Lorg/json/JSONObject;
    .end local v16    # "purchaseState":Lcom/getjar/sdk/utilities/Constants$PurchaseState;
    .end local v18    # "response":I
    :catch_1
    move-exception v10

    .line 112
    .restart local v10    # "e":Lorg/json/JSONException;
    sget-object v6, Lcom/getjar/sdk/logging/Area;->BUY_GOLD:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v8

    const-string v6, "JSON exception: "

    invoke-static {v8, v9, v6, v10}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 113
    const/16 v17, 0x0

    goto/16 :goto_0
.end method

.method private static sign(Ljava/security/PublicKey;Ljava/lang/String;)[B
    .locals 8
    .param p0, "publicKey"    # Ljava/security/PublicKey;
    .param p1, "data"    # Ljava/lang/String;

    .prologue
    .line 160
    if-nez p0, :cond_0

    new-instance v6, Ljava/lang/IllegalArgumentException;

    const-string v7, "publicKey cannot be null"

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 161
    :cond_0
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1

    new-instance v6, Ljava/lang/IllegalArgumentException;

    const-string v7, "data cannot be null"

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 163
    :cond_1
    const/4 v4, 0x0

    .line 165
    .local v4, "result":[B
    if-eqz p1, :cond_2

    .line 169
    :try_start_0
    const-string v6, "SHA1"

    invoke-static {v6}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v5

    .line 170
    .local v5, "sha1":Ljava/security/MessageDigest;
    const-string v6, "UTF-8"

    invoke-virtual {p1, v6}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v1

    .line 171
    .local v1, "dataToSign":[B
    invoke-virtual {v5, v1}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v3

    .line 173
    .local v3, "hash":[B
    const-string v6, "RSA/ECB/PKCS1Padding"

    invoke-static {v6}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v0

    .line 174
    .local v0, "cipher":Ljavax/crypto/Cipher;
    const/4 v6, 0x1

    invoke-virtual {v0, v6, p0}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    .line 175
    invoke-virtual {v0, v3}, Ljavax/crypto/Cipher;->doFinal([B)[B
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljavax/crypto/NoSuchPaddingException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/security/InvalidKeyException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljavax/crypto/IllegalBlockSizeException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljavax/crypto/BadPaddingException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_5

    move-result-object v4

    .line 192
    .end local v0    # "cipher":Ljavax/crypto/Cipher;
    .end local v1    # "dataToSign":[B
    .end local v3    # "hash":[B
    .end local v4    # "result":[B
    .end local v5    # "sha1":Ljava/security/MessageDigest;
    :cond_2
    return-object v4

    .line 177
    .restart local v4    # "result":[B
    :catch_0
    move-exception v2

    .line 178
    .local v2, "e":Ljava/security/NoSuchAlgorithmException;
    new-instance v6, Lcom/getjar/sdk/exceptions/SigningException;

    const-string v7, "The RSA algorithm is unavailable, failed to do licensing"

    invoke-direct {v6, v7}, Lcom/getjar/sdk/exceptions/SigningException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 179
    .end local v2    # "e":Ljava/security/NoSuchAlgorithmException;
    :catch_1
    move-exception v2

    .line 180
    .local v2, "e":Ljavax/crypto/NoSuchPaddingException;
    new-instance v6, Lcom/getjar/sdk/exceptions/SigningException;

    const-string v7, "The RSA algorithm is unavailable, failed to do licensing."

    invoke-direct {v6, v7}, Lcom/getjar/sdk/exceptions/SigningException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 181
    .end local v2    # "e":Ljavax/crypto/NoSuchPaddingException;
    :catch_2
    move-exception v2

    .line 182
    .local v2, "e":Ljava/security/InvalidKeyException;
    new-instance v6, Lcom/getjar/sdk/exceptions/SigningException;

    const-string v7, "The private key was invalid, failed to do licensing."

    invoke-direct {v6, v7}, Lcom/getjar/sdk/exceptions/SigningException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 183
    .end local v2    # "e":Ljava/security/InvalidKeyException;
    :catch_3
    move-exception v2

    .line 184
    .local v2, "e":Ljavax/crypto/IllegalBlockSizeException;
    new-instance v6, Lcom/getjar/sdk/exceptions/SigningException;

    const-string v7, "Unable to create the signature, failed to do licensing."

    invoke-direct {v6, v7}, Lcom/getjar/sdk/exceptions/SigningException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 185
    .end local v2    # "e":Ljavax/crypto/IllegalBlockSizeException;
    :catch_4
    move-exception v2

    .line 186
    .local v2, "e":Ljavax/crypto/BadPaddingException;
    new-instance v6, Lcom/getjar/sdk/exceptions/SigningException;

    const-string v7, "Unable to create the signature, failed to do licensing."

    invoke-direct {v6, v7}, Lcom/getjar/sdk/exceptions/SigningException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 187
    .end local v2    # "e":Ljavax/crypto/BadPaddingException;
    :catch_5
    move-exception v2

    .line 188
    .local v2, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v6, Lcom/getjar/sdk/exceptions/SigningException;

    const-string v7, "Unable to create the signature, failed to do licensing."

    invoke-direct {v6, v7}, Lcom/getjar/sdk/exceptions/SigningException;-><init>(Ljava/lang/String;)V

    throw v6
.end method

.method public static verifySignature(Ljava/security/PublicKey;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 9
    .param p0, "publicKey"    # Ljava/security/PublicKey;
    .param p1, "signedData"    # Ljava/lang/String;
    .param p2, "signature"    # Ljava/lang/String;

    .prologue
    .line 205
    const/4 v5, 0x0

    .line 206
    .local v5, "result":Z
    if-nez p0, :cond_0

    new-instance v7, Ljava/lang/IllegalArgumentException;

    const-string v8, "publicKey cannot be null"

    invoke-direct {v7, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 207
    :cond_0
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1

    new-instance v7, Ljava/lang/IllegalArgumentException;

    const-string v8, "signedData cannot be null"

    invoke-direct {v7, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 208
    :cond_1
    invoke-static {p2}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_2

    new-instance v7, Ljava/lang/IllegalArgumentException;

    const-string v8, "signature cannot be null"

    invoke-direct {v7, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 215
    :cond_2
    :try_start_0
    const-string v7, "SHA1"

    invoke-static {v7}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v6

    .line 216
    .local v6, "sha1":Ljava/security/MessageDigest;
    const-string v7, "UTF-8"

    invoke-virtual {p1, v7}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v3

    .line 218
    .local v3, "hash":[B
    const-string v7, "RSA/ECB/PKCS1Padding"

    invoke-static {v7}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v0

    .line 219
    .local v0, "cipher":Ljavax/crypto/Cipher;
    const/4 v7, 0x2

    invoke-virtual {v0, v7, p0}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    .line 220
    invoke-static {p2}, Lcom/getjar/sdk/utilities/Base64;->decode(Ljava/lang/String;)[B

    move-result-object v7

    invoke-virtual {v0, v7}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object v1

    .line 221
    .local v1, "decryptedHash":[B
    if-nez v1, :cond_3

    .line 223
    new-instance v7, Lcom/getjar/sdk/exceptions/SigningException;

    const-string v8, "Unable to do Licensing. Signing failed"

    invoke-direct {v7, v8}, Lcom/getjar/sdk/exceptions/SigningException;-><init>(Ljava/lang/String;)V

    throw v7
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljavax/crypto/NoSuchPaddingException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/security/InvalidKeyException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljavax/crypto/IllegalBlockSizeException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljavax/crypto/BadPaddingException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_5
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_6

    .line 238
    .end local v0    # "cipher":Ljavax/crypto/Cipher;
    .end local v1    # "decryptedHash":[B
    .end local v3    # "hash":[B
    .end local v6    # "sha1":Ljava/security/MessageDigest;
    :catch_0
    move-exception v2

    .line 239
    .local v2, "e":Ljava/security/NoSuchAlgorithmException;
    new-instance v7, Lcom/getjar/sdk/exceptions/SigningException;

    const-string v8, "The RSA algorithm is unavailable, failed to do licensing"

    invoke-direct {v7, v8}, Lcom/getjar/sdk/exceptions/SigningException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 226
    .end local v2    # "e":Ljava/security/NoSuchAlgorithmException;
    .restart local v0    # "cipher":Ljavax/crypto/Cipher;
    .restart local v1    # "decryptedHash":[B
    .restart local v3    # "hash":[B
    .restart local v6    # "sha1":Ljava/security/MessageDigest;
    :cond_3
    :try_start_1
    array-length v7, v3

    array-length v8, v1

    if-ne v7, v8, :cond_4

    .line 227
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    array-length v7, v3

    if-ge v4, v7, :cond_4

    .line 228
    aget-byte v7, v3, v4

    aget-byte v8, v1, v4

    if-eq v7, v8, :cond_5

    .line 254
    .end local v4    # "i":I
    :cond_4
    return v5

    .line 231
    .restart local v4    # "i":I
    :cond_5
    array-length v7, v3
    :try_end_1
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljavax/crypto/NoSuchPaddingException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/security/InvalidKeyException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljavax/crypto/IllegalBlockSizeException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljavax/crypto/BadPaddingException; {:try_start_1 .. :try_end_1} :catch_4
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1} :catch_5
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_6

    add-int/lit8 v7, v7, -0x1

    if-ne v4, v7, :cond_6

    .line 234
    const/4 v5, 0x1

    .line 227
    :cond_6
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 240
    .end local v0    # "cipher":Ljavax/crypto/Cipher;
    .end local v1    # "decryptedHash":[B
    .end local v3    # "hash":[B
    .end local v4    # "i":I
    .end local v6    # "sha1":Ljava/security/MessageDigest;
    :catch_1
    move-exception v2

    .line 241
    .local v2, "e":Ljavax/crypto/NoSuchPaddingException;
    new-instance v7, Lcom/getjar/sdk/exceptions/SigningException;

    const-string v8, "The RSA algorithm is unavailable, failed to do licensing."

    invoke-direct {v7, v8}, Lcom/getjar/sdk/exceptions/SigningException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 242
    .end local v2    # "e":Ljavax/crypto/NoSuchPaddingException;
    :catch_2
    move-exception v2

    .line 243
    .local v2, "e":Ljava/security/InvalidKeyException;
    new-instance v7, Lcom/getjar/sdk/exceptions/SigningException;

    const-string v8, "The public key was invalid, failed to do licensing."

    invoke-direct {v7, v8}, Lcom/getjar/sdk/exceptions/SigningException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 244
    .end local v2    # "e":Ljava/security/InvalidKeyException;
    :catch_3
    move-exception v2

    .line 245
    .local v2, "e":Ljavax/crypto/IllegalBlockSizeException;
    new-instance v7, Lcom/getjar/sdk/exceptions/SigningException;

    const-string v8, "The public key was invalid, failed to do licensing."

    invoke-direct {v7, v8}, Lcom/getjar/sdk/exceptions/SigningException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 246
    .end local v2    # "e":Ljavax/crypto/IllegalBlockSizeException;
    :catch_4
    move-exception v2

    .line 247
    .local v2, "e":Ljavax/crypto/BadPaddingException;
    new-instance v7, Lcom/getjar/sdk/exceptions/SigningException;

    const-string v8, "The public key was invalid, failed to do licensing."

    invoke-direct {v7, v8}, Lcom/getjar/sdk/exceptions/SigningException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 248
    .end local v2    # "e":Ljavax/crypto/BadPaddingException;
    :catch_5
    move-exception v2

    .line 249
    .local v2, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v7, Lcom/getjar/sdk/exceptions/SigningException;

    const-string v8, "The UTF-8 encoding is unavailable, failed to do licensing."

    invoke-direct {v7, v8}, Lcom/getjar/sdk/exceptions/SigningException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 250
    .end local v2    # "e":Ljava/io/UnsupportedEncodingException;
    :catch_6
    move-exception v2

    .line 251
    .local v2, "e":Ljava/io/IOException;
    new-instance v7, Lcom/getjar/sdk/exceptions/SigningException;

    const-string v8, "Signing failed. Unable to do licensing"

    invoke-direct {v7, v8}, Lcom/getjar/sdk/exceptions/SigningException;-><init>(Ljava/lang/String;)V

    throw v7
.end method
