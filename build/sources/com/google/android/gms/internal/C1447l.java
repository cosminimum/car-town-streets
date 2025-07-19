package com.google.android.gms.internal;

import java.nio.ByteBuffer;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

/* renamed from: com.google.android.gms.internal.l */
public class C1447l {

    /* renamed from: dP */
    private final SecureRandom f3449dP;

    /* renamed from: dw */
    private final C1443j f3450dw;

    /* renamed from: com.google.android.gms.internal.l$a */
    public class C1448a extends Exception {
        public C1448a() {
        }

        public C1448a(Throwable th) {
            super(th);
        }
    }

    public C1447l(C1443j jVar, SecureRandom secureRandom) {
        this.f3450dw = jVar;
        this.f3449dP = secureRandom;
    }

    /* renamed from: a */
    static void m4005a(byte[] bArr) {
        for (int i = 0; i < bArr.length; i++) {
            bArr[i] = (byte) (bArr[i] ^ 68);
        }
    }

    /* renamed from: c */
    public byte[] mo8811c(byte[] bArr, String str) throws C1448a {
        if (bArr.length != 16) {
            throw new C1448a();
        }
        try {
            byte[] a = this.f3450dw.mo6984a(str, false);
            if (a.length <= 16) {
                throw new C1448a();
            }
            ByteBuffer allocate = ByteBuffer.allocate(a.length);
            allocate.put(a);
            allocate.flip();
            byte[] bArr2 = new byte[16];
            byte[] bArr3 = new byte[(a.length - 16)];
            allocate.get(bArr2);
            allocate.get(bArr3);
            SecretKeySpec secretKeySpec = new SecretKeySpec(bArr, "AES");
            Cipher instance = Cipher.getInstance("AES/CBC/PKCS5Padding");
            instance.init(2, secretKeySpec, new IvParameterSpec(bArr2));
            return instance.doFinal(bArr3);
        } catch (NoSuchAlgorithmException e) {
            throw new C1448a(e);
        } catch (InvalidKeyException e2) {
            throw new C1448a(e2);
        } catch (IllegalBlockSizeException e3) {
            throw new C1448a(e3);
        } catch (NoSuchPaddingException e4) {
            throw new C1448a(e4);
        } catch (BadPaddingException e5) {
            throw new C1448a(e5);
        } catch (InvalidAlgorithmParameterException e6) {
            throw new C1448a(e6);
        } catch (IllegalArgumentException e7) {
            throw new C1448a(e7);
        }
    }

    /* renamed from: d */
    public byte[] mo8812d(String str) throws C1448a {
        try {
            byte[] a = this.f3450dw.mo6984a(str, false);
            if (a.length != 32) {
                throw new C1448a();
            }
            byte[] bArr = new byte[16];
            ByteBuffer.wrap(a, 4, 16).get(bArr);
            m4005a(bArr);
            return bArr;
        } catch (IllegalArgumentException e) {
            throw new C1448a(e);
        }
    }
}
