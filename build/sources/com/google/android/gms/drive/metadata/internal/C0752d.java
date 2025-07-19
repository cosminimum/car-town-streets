package com.google.android.gms.drive.metadata.internal;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;

/* renamed from: com.google.android.gms.drive.metadata.internal.d */
public class C0752d implements Parcelable.Creator<MetadataBundle> {
    /* renamed from: a */
    static void m1638a(MetadataBundle metadataBundle, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1412c(parcel, 1, metadataBundle.f1561kg);
        C0677b.m1396a(parcel, 2, metadataBundle.f1562rF, false);
        C0677b.m1391D(parcel, o);
    }

    /* renamed from: P */
    public MetadataBundle createFromParcel(Parcel parcel) {
        int n = C0675a.m1375n(parcel);
        int i = 0;
        Bundle bundle = null;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    i = C0675a.m1367g(parcel, m);
                    break;
                case 2:
                    bundle = C0675a.m1377o(parcel, m);
                    break;
                default:
                    C0675a.m1360b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() == n) {
            return new MetadataBundle(i, bundle);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }

    /* renamed from: ap */
    public MetadataBundle[] newArray(int i) {
        return new MetadataBundle[i];
    }
}
