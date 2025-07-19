package com.google.android.gms.drive.query.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.a;
import java.util.ArrayList;
/* loaded from: classes.dex */
public class f implements Parcelable.Creator<LogicalFilter> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void a(LogicalFilter logicalFilter, Parcel parcel, int i) {
        int o = com.google.android.gms.common.internal.safeparcel.b.o(parcel);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 1000, logicalFilter.kg);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 1, (Parcelable) logicalFilter.rR, i, false);
        com.google.android.gms.common.internal.safeparcel.b.b(parcel, 2, logicalFilter.sb, false);
        com.google.android.gms.common.internal.safeparcel.b.D(parcel, o);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: V */
    public LogicalFilter createFromParcel(Parcel parcel) {
        ArrayList c;
        Operator operator;
        int i;
        ArrayList arrayList = null;
        int n = com.google.android.gms.common.internal.safeparcel.a.n(parcel);
        int i2 = 0;
        Operator operator2 = null;
        while (parcel.dataPosition() < n) {
            int m = com.google.android.gms.common.internal.safeparcel.a.m(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.a.M(m)) {
                case 1:
                    Operator operator3 = (Operator) com.google.android.gms.common.internal.safeparcel.a.a(parcel, m, Operator.CREATOR);
                    i = i2;
                    c = arrayList;
                    operator = operator3;
                    break;
                case 2:
                    c = com.google.android.gms.common.internal.safeparcel.a.c(parcel, m, FilterHolder.CREATOR);
                    operator = operator2;
                    i = i2;
                    break;
                case 1000:
                    ArrayList arrayList2 = arrayList;
                    operator = operator2;
                    i = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    c = arrayList2;
                    break;
                default:
                    com.google.android.gms.common.internal.safeparcel.a.b(parcel, m);
                    c = arrayList;
                    operator = operator2;
                    i = i2;
                    break;
            }
            i2 = i;
            operator2 = operator;
            arrayList = c;
        }
        if (parcel.dataPosition() != n) {
            throw new a.C0013a("Overread allowed size end=" + n, parcel);
        }
        return new LogicalFilter(i2, operator2, arrayList);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: av */
    public LogicalFilter[] newArray(int i) {
        return new LogicalFilter[i];
    }
}
