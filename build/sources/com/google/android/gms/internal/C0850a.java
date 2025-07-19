package com.google.android.gms.internal;

import android.util.Base64;

/* renamed from: com.google.android.gms.internal.a */
class C0850a implements C1443j {
    C0850a() {
    }

    /* renamed from: a */
    public String mo6983a(byte[] bArr, boolean z) {
        return Base64.encodeToString(bArr, z ? 11 : 2);
    }

    /* renamed from: a */
    public byte[] mo6984a(String str, boolean z) throws IllegalArgumentException {
        return Base64.decode(str, z ? 11 : 2);
    }
}
