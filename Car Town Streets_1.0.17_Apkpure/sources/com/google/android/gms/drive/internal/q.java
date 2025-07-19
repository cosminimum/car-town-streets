package com.google.android.gms.drive.internal;

import com.google.android.gms.internal.iw;
import com.google.android.gms.internal.ix;
import com.google.android.gms.internal.iy;
import com.google.android.gms.internal.iz;
import com.google.android.gms.internal.jb;
import com.millennialmedia.android.MMError;
import java.io.IOException;
/* loaded from: classes.dex */
public final class q extends iz {
    public static final q[] rs = new q[0];
    public int versionCode = 1;
    public String rt = "";
    public long ru = -1;
    public long rv = -1;
    private int rw = -1;

    public static q e(byte[] bArr) throws iy {
        return (q) iz.a(new q(), bArr);
    }

    @Override // com.google.android.gms.internal.iz
    /* renamed from: a */
    public q b(iw iwVar) throws IOException {
        while (true) {
            int fU = iwVar.fU();
            switch (fU) {
                case 0:
                    break;
                case 8:
                    this.versionCode = iwVar.fW();
                    break;
                case 18:
                    this.rt = iwVar.readString();
                    break;
                case MMError.DISPLAY_AD_NOT_PERMITTED /* 24 */:
                    this.ru = iwVar.fX();
                    break;
                case 32:
                    this.rv = iwVar.fX();
                    break;
                default:
                    if (jb.a(iwVar, fU)) {
                        break;
                    } else {
                        break;
                    }
            }
        }
        return this;
    }

    @Override // com.google.android.gms.internal.iz
    public void a(ix ixVar) throws IOException {
        ixVar.d(1, this.versionCode);
        ixVar.b(2, this.rt);
        ixVar.c(3, this.ru);
        ixVar.c(4, this.rv);
    }

    @Override // com.google.android.gms.internal.iz
    public int cP() {
        int e = 0 + ix.e(1, this.versionCode) + ix.e(2, this.rt) + ix.d(3, this.ru) + ix.d(4, this.rv);
        this.rw = e;
        return e;
    }
}
