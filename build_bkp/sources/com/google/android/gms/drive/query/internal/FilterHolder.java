package com.google.android.gms.drive.query.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.drive.query.Filter;

public class FilterHolder implements SafeParcelable {
    public static final Parcelable.Creator<FilterHolder> CREATOR = new C0758c();

    /* renamed from: kg */
    final int f1577kg;

    /* renamed from: rU */
    final ComparisonFilter<?> f1578rU;

    /* renamed from: rV */
    final FieldOnlyFilter f1579rV;

    /* renamed from: rW */
    final LogicalFilter f1580rW;

    /* renamed from: rX */
    final NotFilter f1581rX;

    /* renamed from: rY */
    final InFilter<?> f1582rY;

    /* renamed from: rZ */
    private final Filter f1583rZ;

    FilterHolder(int versionCode, ComparisonFilter<?> comparisonField, FieldOnlyFilter fieldOnlyFilter, LogicalFilter logicalFilter, NotFilter notFilter, InFilter<?> containsFilter) {
        this.f1577kg = versionCode;
        this.f1578rU = comparisonField;
        this.f1579rV = fieldOnlyFilter;
        this.f1580rW = logicalFilter;
        this.f1581rX = notFilter;
        this.f1582rY = containsFilter;
        if (this.f1578rU != null) {
            this.f1583rZ = this.f1578rU;
        } else if (this.f1579rV != null) {
            this.f1583rZ = this.f1579rV;
        } else if (this.f1580rW != null) {
            this.f1583rZ = this.f1580rW;
        } else if (this.f1581rX != null) {
            this.f1583rZ = this.f1581rX;
        } else if (this.f1582rY != null) {
            this.f1583rZ = this.f1582rY;
        } else {
            throw new IllegalArgumentException("At least one filter must be set.");
        }
    }

    public FilterHolder(Filter filter) {
        this.f1577kg = 1;
        this.f1578rU = filter instanceof ComparisonFilter ? (ComparisonFilter) filter : null;
        this.f1579rV = filter instanceof FieldOnlyFilter ? (FieldOnlyFilter) filter : null;
        this.f1580rW = filter instanceof LogicalFilter ? (LogicalFilter) filter : null;
        this.f1581rX = filter instanceof NotFilter ? (NotFilter) filter : null;
        this.f1582rY = filter instanceof InFilter ? (InFilter) filter : null;
        if (this.f1578rU == null && this.f1579rV == null && this.f1580rW == null && this.f1581rX == null && this.f1582rY == null) {
            throw new IllegalArgumentException("Invalid filter type or null filter.");
        }
        this.f1583rZ = filter;
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel out, int flags) {
        C0758c.m1662a(this, out, flags);
    }
}
