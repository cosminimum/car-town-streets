package com.google.android.gms.drive.query.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;
import com.google.android.gms.drive.metadata.internal.MetadataBundle;

/* renamed from: com.google.android.gms.drive.query.internal.e */
public class C0760e implements Parcelable.Creator<InFilter> {
    /* renamed from: a */
    static void m1666a(InFilter inFilter, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1412c(parcel, 1000, inFilter.f1584kg);
        C0677b.m1399a(parcel, 1, (Parcelable) inFilter.f1585rS, i, false);
        C0677b.m1391D(parcel, o);
    }

    /* renamed from: U */
    public InFilter createFromParcel(Parcel parcel) {
        int n = C0675a.m1375n(parcel);
        int i = 0;
        MetadataBundle metadataBundle = null;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    metadataBundle = (MetadataBundle) C0675a.m1356a(parcel, m, MetadataBundle.CREATOR);
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
            return new InFilter(i, metadataBundle);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }

    /* renamed from: au */
    public InFilter[] newArray(int i) {
        return new InFilter[i];
    }
}
