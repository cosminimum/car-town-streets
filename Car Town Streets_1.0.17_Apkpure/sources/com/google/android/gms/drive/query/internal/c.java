package com.google.android.gms.drive.query.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.a;
/* loaded from: classes.dex */
public class c implements Parcelable.Creator<FilterHolder> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void a(FilterHolder filterHolder, Parcel parcel, int i) {
        int o = com.google.android.gms.common.internal.safeparcel.b.o(parcel);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 1, (Parcelable) filterHolder.rU, i, false);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 1000, filterHolder.kg);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 2, (Parcelable) filterHolder.rV, i, false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 3, (Parcelable) filterHolder.rW, i, false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 4, (Parcelable) filterHolder.rX, i, false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 5, (Parcelable) filterHolder.rY, i, false);
        com.google.android.gms.common.internal.safeparcel.b.D(parcel, o);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: T */
    public FilterHolder createFromParcel(Parcel parcel) {
        InFilter inFilter = null;
        int n = com.google.android.gms.common.internal.safeparcel.a.n(parcel);
        int i = 0;
        NotFilter notFilter = null;
        LogicalFilter logicalFilter = null;
        FieldOnlyFilter fieldOnlyFilter = null;
        ComparisonFilter comparisonFilter = null;
        while (parcel.dataPosition() < n) {
            int m = com.google.android.gms.common.internal.safeparcel.a.m(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.a.M(m)) {
                case 1:
                    comparisonFilter = (ComparisonFilter) com.google.android.gms.common.internal.safeparcel.a.a(parcel, m, ComparisonFilter.CREATOR);
                    break;
                case 2:
                    fieldOnlyFilter = (FieldOnlyFilter) com.google.android.gms.common.internal.safeparcel.a.a(parcel, m, FieldOnlyFilter.CREATOR);
                    break;
                case 3:
                    logicalFilter = (LogicalFilter) com.google.android.gms.common.internal.safeparcel.a.a(parcel, m, LogicalFilter.CREATOR);
                    break;
                case 4:
                    notFilter = (NotFilter) com.google.android.gms.common.internal.safeparcel.a.a(parcel, m, NotFilter.CREATOR);
                    break;
                case 5:
                    inFilter = (InFilter) com.google.android.gms.common.internal.safeparcel.a.a(parcel, m, InFilter.CREATOR);
                    break;
                case 1000:
                    i = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    break;
                default:
                    com.google.android.gms.common.internal.safeparcel.a.b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() != n) {
            throw new a.C0013a("Overread allowed size end=" + n, parcel);
        }
        return new FilterHolder(i, comparisonFilter, fieldOnlyFilter, logicalFilter, notFilter, inFilter);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: at */
    public FilterHolder[] newArray(int i) {
        return new FilterHolder[i];
    }
}
