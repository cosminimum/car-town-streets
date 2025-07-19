package com.google.android.gms.drive.internal;

import com.google.android.gms.internal.C1438iw;
import com.google.android.gms.internal.C1439ix;
import com.google.android.gms.internal.C1441iy;
import com.google.android.gms.internal.C1442iz;
import com.google.android.gms.internal.C1445jb;
import java.io.IOException;

/* renamed from: com.google.android.gms.drive.internal.q */
public final class C0739q extends C1442iz {

    /* renamed from: rs */
    public static final C0739q[] f1553rs = new C0739q[0];

    /* renamed from: rt */
    public String f1554rt = "";

    /* renamed from: ru */
    public long f1555ru = -1;

    /* renamed from: rv */
    public long f1556rv = -1;

    /* renamed from: rw */
    private int f1557rw = -1;
    public int versionCode = 1;

    /* renamed from: e */
    public static C0739q m1571e(byte[] bArr) throws C1441iy {
        return (C0739q) C1442iz.m3983a(new C0739q(), bArr);
    }

    /* renamed from: a */
    public C0739q mo6242b(C1438iw iwVar) throws IOException {
        while (true) {
            int fU = iwVar.mo8778fU();
            switch (fU) {
                case 0:
                    break;
                case 8:
                    this.versionCode = iwVar.mo8780fW();
                    continue;
                case 18:
                    this.f1554rt = iwVar.readString();
                    continue;
                case MMError.DISPLAY_AD_NOT_PERMITTED /*24*/:
                    this.f1555ru = iwVar.mo8781fX();
                    continue;
                case 32:
                    this.f1556rv = iwVar.mo8781fX();
                    continue;
                default:
                    if (!C1445jb.m3998a(iwVar, fU)) {
                        break;
                    } else {
                        continue;
                    }
            }
        }
        return this;
    }

    /* renamed from: a */
    public void mo6241a(C1439ix ixVar) throws IOException {
        ixVar.mo8798d(1, this.versionCode);
        ixVar.mo8792b(2, this.f1554rt);
        ixVar.mo8796c(3, this.f1555ru);
        ixVar.mo8796c(4, this.f1556rv);
    }

    /* renamed from: cP */
    public int mo6243cP() {
        int e = 0 + C1439ix.m3954e(1, this.versionCode) + C1439ix.m3955e(2, this.f1554rt) + C1439ix.m3953d(3, this.f1555ru) + C1439ix.m3953d(4, this.f1556rv);
        this.f1557rw = e;
        return e;
    }
}
