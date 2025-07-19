package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;

/* renamed from: com.google.android.gms.internal.hc */
public class C1335hc implements Parcelable.Creator<C1334hb> {
    /* renamed from: a */
    static void m3556a(C1334hb hbVar, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1407a(parcel, 1, (T[]) hbVar.mo8168dU(), i, false);
        C0677b.m1412c(parcel, 1000, hbVar.f3149kg);
        C0677b.m1406a(parcel, 2, hbVar.mo8169dV(), false);
        C0677b.m1395a(parcel, 3, hbVar.getTimestampMillis());
        C0677b.m1391D(parcel, o);
    }

    /* renamed from: an */
    public C1334hb createFromParcel(Parcel parcel) {
        float[] fArr = null;
        int n = C0675a.m1375n(parcel);
        int i = 0;
        long j = 0;
        C1336hd[] hdVarArr = null;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    hdVarArr = (C1336hd[]) C0675a.m1361b(parcel, m, C1336hd.CREATOR);
                    break;
                case 2:
                    fArr = C0675a.m1383u(parcel, m);
                    break;
                case 3:
                    j = C0675a.m1368h(parcel, m);
                    break;
                case 1000:
                    i = C0675a.m1367g(parcel, m);
                    break;
                default:
                    C0675a.m1360b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() == n) {
            return new C1334hb(i, hdVarArr, fArr, j);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }

    /* renamed from: bc */
    public C1334hb[] newArray(int i) {
        return new C1334hb[i];
    }
}
