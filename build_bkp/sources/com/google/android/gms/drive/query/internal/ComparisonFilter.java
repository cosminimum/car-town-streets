package com.google.android.gms.drive.query.internal;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.drive.metadata.MetadataField;
import com.google.android.gms.drive.metadata.internal.MetadataBundle;
import com.google.android.gms.drive.query.Filter;

public class ComparisonFilter<T> implements SafeParcelable, Filter {
    public static final C0756a CREATOR = new C0756a();

    /* renamed from: kg */
    final int f1570kg;

    /* renamed from: rR */
    final Operator f1571rR;

    /* renamed from: rS */
    final MetadataBundle f1572rS;

    /* renamed from: rT */
    final MetadataField<T> f1573rT;

    ComparisonFilter(int versionCode, Operator operator, MetadataBundle value) {
        this.f1570kg = versionCode;
        this.f1571rR = operator;
        this.f1572rS = value;
        this.f1573rT = C0759d.m1665b(value);
    }

    public ComparisonFilter(Operator operator, MetadataField<T> field, T value) {
        this(1, operator, MetadataBundle.m1617a(field, value));
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel out, int flags) {
        C0756a.m1656a(this, out, flags);
    }
}
