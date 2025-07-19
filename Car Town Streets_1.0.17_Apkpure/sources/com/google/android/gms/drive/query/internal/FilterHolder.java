package com.google.android.gms.drive.query.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.drive.query.Filter;
/* loaded from: classes.dex */
public class FilterHolder implements SafeParcelable {
    public static final Parcelable.Creator<FilterHolder> CREATOR = new c();
    final int kg;
    final ComparisonFilter<?> rU;
    final FieldOnlyFilter rV;
    final LogicalFilter rW;
    final NotFilter rX;
    final InFilter<?> rY;
    private final Filter rZ;

    /* JADX INFO: Access modifiers changed from: package-private */
    public FilterHolder(int versionCode, ComparisonFilter<?> comparisonField, FieldOnlyFilter fieldOnlyFilter, LogicalFilter logicalFilter, NotFilter notFilter, InFilter<?> containsFilter) {
        this.kg = versionCode;
        this.rU = comparisonField;
        this.rV = fieldOnlyFilter;
        this.rW = logicalFilter;
        this.rX = notFilter;
        this.rY = containsFilter;
        if (this.rU != null) {
            this.rZ = this.rU;
        } else if (this.rV != null) {
            this.rZ = this.rV;
        } else if (this.rW != null) {
            this.rZ = this.rW;
        } else if (this.rX != null) {
            this.rZ = this.rX;
        } else if (this.rY == null) {
            throw new IllegalArgumentException("At least one filter must be set.");
        } else {
            this.rZ = this.rY;
        }
    }

    public FilterHolder(Filter filter) {
        this.kg = 1;
        this.rU = filter instanceof ComparisonFilter ? (ComparisonFilter) filter : null;
        this.rV = filter instanceof FieldOnlyFilter ? (FieldOnlyFilter) filter : null;
        this.rW = filter instanceof LogicalFilter ? (LogicalFilter) filter : null;
        this.rX = filter instanceof NotFilter ? (NotFilter) filter : null;
        this.rY = filter instanceof InFilter ? (InFilter) filter : null;
        if (this.rU == null && this.rV == null && this.rW == null && this.rX == null && this.rY == null) {
            throw new IllegalArgumentException("Invalid filter type or null filter.");
        }
        this.rZ = filter;
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel out, int flags) {
        c.a(this, out, flags);
    }
}
