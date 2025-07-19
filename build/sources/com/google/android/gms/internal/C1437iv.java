package com.google.android.gms.internal;

import android.support.p000v4.view.MotionEventCompat;
import com.flurry.android.Constants;

/* renamed from: com.google.android.gms.internal.iv */
public class C1437iv {

    /* renamed from: Hm */
    private final byte[] f3425Hm = new byte[256];

    /* renamed from: Hn */
    private int f3426Hn;

    /* renamed from: Ho */
    private int f3427Ho;

    public C1437iv(byte[] bArr) {
        for (int i = 0; i < 256; i++) {
            this.f3425Hm[i] = (byte) i;
        }
        byte b = 0;
        for (int i2 = 0; i2 < 256; i2++) {
            b = (b + this.f3425Hm[i2] + bArr[i2 % bArr.length]) & Constants.UNKNOWN;
            byte b2 = this.f3425Hm[i2];
            this.f3425Hm[i2] = this.f3425Hm[b];
            this.f3425Hm[b] = b2;
        }
        this.f3426Hn = 0;
        this.f3427Ho = 0;
    }

    /* renamed from: h */
    public void mo8773h(byte[] bArr) {
        int i = this.f3426Hn;
        int i2 = this.f3427Ho;
        for (int i3 = 0; i3 < bArr.length; i3++) {
            i = (i + 1) & MotionEventCompat.ACTION_MASK;
            i2 = (i2 + this.f3425Hm[i]) & MotionEventCompat.ACTION_MASK;
            byte b = this.f3425Hm[i];
            this.f3425Hm[i] = this.f3425Hm[i2];
            this.f3425Hm[i2] = b;
            bArr[i3] = (byte) (bArr[i3] ^ this.f3425Hm[(this.f3425Hm[i] + this.f3425Hm[i2]) & MotionEventCompat.ACTION_MASK]);
        }
        this.f3426Hn = i;
        this.f3427Ho = i2;
    }
}
