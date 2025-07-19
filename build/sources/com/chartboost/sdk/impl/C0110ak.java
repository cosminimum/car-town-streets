package com.chartboost.sdk.impl;

/* renamed from: com.chartboost.sdk.impl.ak */
public class C0110ak implements C0107ah {

    /* renamed from: a */
    static final String[] f158a = new String[128];

    /* renamed from: b */
    private byte[] f159b = new byte[1024];

    /* renamed from: c */
    private byte[] f160c = new byte[1024];

    /* renamed from: d */
    private C0116aq f161d = new C0116aq();

    static {
        m181a((byte) 48, (byte) 57);
        m181a((byte) 97, (byte) 122);
        m181a((byte) 65, (byte) 90);
    }

    /* renamed from: a */
    static void m181a(byte b, byte b2) {
        while (b < b2) {
            f158a[b] = "" + ((char) b);
            b = (byte) (b + 1);
        }
    }
}
